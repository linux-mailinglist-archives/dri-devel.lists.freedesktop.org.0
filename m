Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB1BC4532
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE85910E7BC;
	Wed,  8 Oct 2025 10:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UQclxZnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988910E7C5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 10:31:57 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-32ed19ce5a3so6882578a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759919517; x=1760524317; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f6LZkodDEq1HIxCXkobbf13l6U/GJUVBzoud6sJa3VY=;
 b=UQclxZndgONbsS4hhke3sosOw5t154y5KwFi9/gGB93AMISrWwNITrSVAzBcqWXXiK
 VtDg1p7JFrpBD7g9RkhCtkLTJcz/l1qK1s5NmiiVfG1YSutGSbcOkEB/QHZvFBAEyoUV
 gMkuYXfN+b6ZVVZ65tXViGynmARQiC8LeKI6lx/98x0xcUuuYy+Rm7KBDYkieW8/cH6h
 4/7sPeU+THr6MGDhlgPvks8ogSC/A5HFPyGO39d1N3HInSOzD4DLn3oG0b71DStfWpl6
 EbgSzjc5+04k4YmjT3QP5HwJBxyYfdMTuR6yRIh8x8isWqX5iqTbaMuyawL1Mya5UMLg
 YJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759919517; x=1760524317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6LZkodDEq1HIxCXkobbf13l6U/GJUVBzoud6sJa3VY=;
 b=Yc1Ht6xSvvSjGBeIWyvHrI+JP0ykRavu4NTTldhJlOcCFepWZol36sIx3fbSTpLTge
 aZCAqGjIPgFZAJAeEdguDrpb0RxCJJ6UtUWq9FmDDCu58wizml2u0zNYyGNKfaKXcuPI
 aSLH5DtwtS+opaPHLWo1i89s466/lPbtsNqSGLuaJBdVETL2k0h5DLmFsgfNOtC3Fnqx
 t3u5fX0Ms+1qlPx0SEhFtQRLMpkJ+ivcR1TK2/TS6LJKv52MMdKfVreCjgEQUszlvJdA
 lbcXMRoKeqF7TYJzYk/uCj2VC67O6I2uXmPrw5g46nicdi+d4qtz87vHwfggo+uAqzt6
 aOTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJX7r3s3XIvpNM56basyFq+Io3hoiRHfci1hbeG5qwmjO5gjw5dDp+W49tBOJbDI3ZXoQeLvSDw68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtiYv4U/ieInzOgNYl/YUakkBd0WYHm+36Y/T3nalGPAnz5x2q
 CL9l/AVfNfshW1OzZLJDPKj/E+8SGPDjaXHHA8maarCJLqKn5VuH/8i7+EzQMrMz8G0z6Zm0wtA
 mP8RsGG8oDB93nbAAUwwNga3o1xUBKec=
X-Gm-Gg: ASbGnctZFCVhDL5yqZNM4kVCaNtOVNTUcxgPSiJN0izBKiCR1DKeR1843IUgln0Jzsv
 mADoKfnn/DJhSFD/hBT2mUKHvzYRz1coSy/v4rXdwg11FfZEjt19IGcLqKyuMj53mb3su2QgQ9N
 7YOiGwMNwMamDkJYb1kmOozwqIKmKEQTmZnbtAj1iHNHJNSCwUwClblQVXL56cfNGE1fjVTKl0h
 KOlHIESrNdtOVuYX7fxrZ8kt7S9+g==
X-Google-Smtp-Source: AGHT+IF14AhZT9buSbXWxBQj5IqiSkq7Ctbzzynaj0/ilXj75RIGaxagvOzHwMf1yydBcpOxbxFs4BVRVEGf1xQ5Pq0=
X-Received: by 2002:a17:90b:4b8c:b0:32b:6cf2:a2cf with SMTP id
 98e67ed59e1d1-33b5111895amr3871446a91.14.1759919517166; Wed, 08 Oct 2025
 03:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-19-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251008085359.52404-19-tvrtko.ursulin@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 8 Oct 2025 12:31:45 +0200
X-Gm-Features: AS18NWA5_CTsZJVKKZZArYCDqLMe_ZXWxpoEel2YI71aNaG-kPc51XfoHb4pNy0
Message-ID: <CAH9NwWdStMzwzhhpbJrsX42_gffD4hFkyy7QErJvPOCtZSRf=g@mail.gmail.com>
Subject: Re: [PATCH 18/28] drm/etnaviv: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
