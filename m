Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D6F895FDC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F42112140;
	Tue,  2 Apr 2024 22:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RSJe0E+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0361310F5B8;
 Tue,  2 Apr 2024 22:57:31 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a4e79d7d21dso127233066b.1; 
 Tue, 02 Apr 2024 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712098650; x=1712703450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEJpRDcbgGxCKBYYYVq8f8EDdRqjSm8WksL8ghlqPtY=;
 b=RSJe0E+znaeTm+RaUVgW9YJaddsyfbJk9e3O3AMT+pxLXZ/QTR5tGtb1YgNtJDOs0b
 RFSSDCYsigvrprPr1WKo69qUdCQiPdirNpIFbXWO8FAhgzwHdh/VdbBGb/rBXDNzMuO2
 BDh//hsk169y2VORPd9NDiI/EQy2qhBBaKTBe2rNT9IhbYYDMB4S0eUsEr+hI46iv7uQ
 K/20MtTrBDuDWak1vVtjmJQveiwv/y0k9n6xlVJX5Mc2NK8mx0Aw2RGOs+gtM//btI0S
 Wc6t3oT0oor2yVFSsB/vUMSZRhMW60JvshUURDhBGLEVoO/hj9waw6YH005xnscqISe1
 xKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712098650; x=1712703450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEJpRDcbgGxCKBYYYVq8f8EDdRqjSm8WksL8ghlqPtY=;
 b=eCJn6wACKWDZkYC0tsJJDO74NuqWg0Sw8/dJy8unzAsk/8QW8CVGIJ2UwkVNH6aW49
 xOh71aPVgbFFfkCKFbGvCj1qGFT755wF82aZGQsphP22En6BJowD7o9kIcMUYPu9J58y
 t5UeETHNsrW63IALw9TMZlnWHpJArll5na9o3GIFqez/o1fIFcPAcvxEI9Hcfq0Pge8d
 lDkPGOfNHHa/P9AoaGrVcIoTMJDAWOzlFdBjeNlDMUVAx/Ge4Le5ZBLw5TJJxIU45xR6
 oep7Fk0nqdWQQRTCeIQ/tiWyUNI1rQb4ahSO+fFcd2KH4cRId7LvZ2Q/TW7vHamJd3cO
 6oNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHU2YxvVVmHW5vetnw6+pIznygE4PSJELeWV3aGCzQo0ikMolZYhnlHjg1Aj4/5AI54AjiPMr6XGC6dKU59q6EDhfYF2KvU0Ta9RfnzT8=
X-Gm-Message-State: AOJu0Ywe6BQRjMm6gtVoXMNGoOS6RuORga3ynZ0Y5pBbYqy6JAcg8B3s
 PyCEohtpGzCxA3pUwU9M8xX73zpNWAtboWzXDGhaVts/MrW14AuSpHn00YFSAdbSxUs6r4IgYIF
 yWx4Li68gUy8aEfpvEOVP1NlIVV4=
X-Google-Smtp-Source: AGHT+IGT4Lgxl4gxvcWfg0u8acNHIiq4lTW+DI1I12n5hEmabUn0rAax/JRefrqGjRh3weiVc1xFHkOg4yxpj1E1hZE=
X-Received: by 2002:a50:9f44:0:b0:568:a792:276 with SMTP id
 b62-20020a509f44000000b00568a7920276mr2651576edf.7.1712098649716; Tue, 02 Apr
 2024 15:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
In-Reply-To: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Apr 2024 08:57:17 +1000
Message-ID: <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
Subject: Re: Cross-device and cross-driver HMM support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 27 Mar 2024 at 19:52, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi!
>
> With our SVM mirror work we'll soon start looking at HMM cross-device
> support. The identified needs are
>
> 1) Instead of migrating foreign device memory to system when the
> current device is faulting, leave it in place...
> 1a) for access using internal interconnect,
> 1b) for access using PCIE p2p (probably mostly as a reference)
>
> 2) Request a foreign device to migrate memory range a..b of a CPU
> mm_struct to local shareable device memory on that foreign device.
>
> and we plan to add an infrastructure for this. Probably this can be
> done initially without too much (or any) changes to the hmm code
> itself.
>
> So the question is basically whether anybody is interested in a
> drm-wide solution for this and in that case also whether anybody sees
> the need for cross-driver support?
>
> Otherwise any objections against us starting out with an xe driver
> helper implementation that could be lifted to drm-level when needed?

I think you'd probably have a better chance of getting others to help
review it, if we started out outside the driver as much as possible.

I don't think gpuvm would have worked out as well if we'd just kept it
inside nouveau from the start, it at least forces you to think about
what should be driver specific here.

> Finally any suggestions or pointers to existing solutions for this?

I think nvidia's uvm might have some of this type of code, but no idea
how you'd even consider starting to use it as a reference,

Dave.
