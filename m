Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A29C6FA78
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 16:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8F910E660;
	Wed, 19 Nov 2025 15:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRw+jbVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0889CF6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 15:30:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2953ad5517dso76431045ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763566226; x=1764171026; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VwsNl47ILOU+OZH830fwN0lvlzy/et7h1LLra9Ac0sU=;
 b=VRw+jbVHaIqzHhUVuhJZhrCAj08NIm/y5QIM1KQhlCRuTULlzxNNhhLsKfw+we/AU0
 xLhzoqN0JvJ12USV1YXaY+m7ijb1PnFEaDPZB0iS8xaAbjIfuxGG+GXkML8z0Z67+DRK
 6CPJQGeojKEIJBc1V4eZXWxPrJKTbquXSpQgf6buYT8MtfZt1OC8Mum5XzBGPRVSDZ+P
 aznG43x39sglZdXf/0p9lbz3lbKBpz1XjQeNbwenawtZVdBBIaSZMNqDHUMguRGw2zma
 r1EtMaq3z3MYrRbd8yY0OkuJ1ysizABE8iN1qfhNnEtgv7jcJRDbN6DnDXMWPiq9odhE
 RewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763566226; x=1764171026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwsNl47ILOU+OZH830fwN0lvlzy/et7h1LLra9Ac0sU=;
 b=ba55EkFvc0TrtW83dr85d5hZJo1uw0NaAopOuTP+kT0mYGTKnpE/s/+0jgv8qXYKoa
 JyBDgQa6iOOJdAVvWNeX+da9RcPJbEAwYP17SR1NzRjcNg5ZkWG1cJ/36G4yLSKO8nPs
 1JAF+bdRxJa2Y3y9abFuQ8SXLr5Zp3xfz4NMsLBHXMHX9dIlHcY2JBbg7qKjijazMFId
 e6zOSE6seMCSebvP93rbN8NgpaO+KieN9INzIsx02AVMffuyFzNe9UeeROIXyAT83mst
 YrmjA/2MYmqkVimDWg9Z0UZ8ozNqnyACh8MrS3SECZ/fw+kqqsvfw1YIN1lW0W86yK6s
 yu9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8/WdKLik7BKB3WFB54euwy9H2b+nH0bxkW1qNFthX9xdzOBGaaXlvwVsAA76OaAQvhZ2R8JCZOi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAZ1jvl8/BEtrzRlPcNzElPJxrH0eVWf277eWgDzk60aMRSSqq
 MLLrcMKzS4FbMIf1OUFABn2bTwvEz191SBwqTDjJ+m3O+d1wAv/E0FJYm/zsg1dLNbteGxdqY7l
 kVC4RpCMsRUMlr8IS+2tkm1PtXRGUewI=
X-Gm-Gg: ASbGncuHMBPEh0WAFg2O8juFEuz2hbqtS4dOicSge5u3B8Z0VwEM+qwPtTtOsenStGI
 ErPeq7LSlk/29soHXJjDuIkwdZvMwiT4JJXGb94LOv1dDzM1p/gctUI+omK8fhz4/ZGRdbJ+BR9
 k0N6Ytb1l5DsTGldiZmvi8a3geQkYaYSyOutJip8iCgTMnVJfAVrdtcyMoU2OL/oE/w6aHytqVx
 1sOva9n86fIBtI8Zy4JmkVqZMeZpfiNoyaUyievpoy0M70tMcnXkht/cK+ctD6ivDng1ZxQ6MV8
 elbH
X-Google-Smtp-Source: AGHT+IEGBRhchbqAvdLDH3ne/Qo3A0DHrByjI/4zA4eCeE2JIWTr0xJV37Lg9jXOo1wRFmEingCybgduVaW9fPJhicQ=
X-Received: by 2002:a17:903:19cf:b0:295:24d7:3792 with SMTP id
 d9443c01a7336-2986a6b81aamr252672075ad.1.1763566225731; Wed, 19 Nov 2025
 07:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-6-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-6-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 19 Nov 2025 16:30:14 +0100
X-Gm-Features: AWmQ_bk6AeMO6mucUUgE8K4I2a7IvBY4rZdGIxr2UKlngvQcKpypjE7fTv8xOtk
Message-ID: <CAH9NwWeyBvHPOBkdgxmOx+w0amhC3XU+0cgZB6BnqfE8pYZ4Vw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/etnaviv: Add module parameter to force PPU
 flop reset
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: Check for feature PIPE_3D when forcing PPU flop reset (Lucas)
>
> v3: - drop use of ppu_flop_reset enum (Christian Gmeiner)
>     - don't initialize module parameter to zero (checkpatch)
>     - avoid multi-line string in warning message (checkpatch)
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
