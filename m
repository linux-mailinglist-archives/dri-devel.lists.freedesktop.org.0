Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6B8B50EC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 08:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB4A10FD60;
	Mon, 29 Apr 2024 06:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EMpDjwdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2917C10EB50;
 Mon, 29 Apr 2024 06:03:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57288691c07so216163a12.3; 
 Sun, 28 Apr 2024 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714370596; x=1714975396; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kiriSi9cv3OVBgriCchZMDK+rQMOClWkLptGCJ8G+44=;
 b=EMpDjwdvtEAVDBk0dx+4A3iHRLQQAwW4hdcjHo2F4Zz+qB+xUwujD04w8oOZhgiuWg
 +9qwpkdxUoUIUNn3x43tpQTRm8ke6lcshHd6nxkcI1am0fBrBEVrwzAivvFmsUNzJ1Xf
 Xx3Gatbr2gG46iq52wbsYmHGheAaZOG2eWuvLI5lZcXT6laiS5CW/UkMqWDnygpUw/Sk
 NLMZPQyCRodZMJj9FepP0ERaKJu+Y97uzeksheuq+EX8V3FASWS0ue10GQ5XSpBh7dTN
 1Yu1oY/Nd4o5aQ7MdKRIOq7Lx/l/fn5XILh71can8Poa/XH47revNk0OnZnoF6nad32/
 ah2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714370596; x=1714975396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kiriSi9cv3OVBgriCchZMDK+rQMOClWkLptGCJ8G+44=;
 b=Xz7hM2dW+xT0z3VIH7NnhnlVzkuCajGQAzcFEkEoCO8L0cmCbECiD7ra5LcOdqluc6
 zLlpRikdqfd1O8+s8qYJ9TqZpakmQDMnXH3MGFJsgVYzSc6BDEQcxLH1GJlwSHLiu6UY
 3l9/5u+0U/WXEXCGVQuBEhGtn77vOm9NEhHnr2UlWJZsl6ovbmisW/BjJCiYxyYVxRb/
 AkCHxSGU9KYd5X+9jKW9ASQ5H/DrCUUDNQtMTWeW6ERRevJdtgfnDfu91Wgx2rqUB+rT
 leQujqSfbT1sPbrviZ97+Slq7GRc53itkennEjrm3Efw0GJlTQ47lvSZj78LlKn5GWIE
 rDQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEw1/YPGwQ//R8uwRqQLrp/G22YmjKJbPgBwgmjopTD6niHffLdWYXcHJDx5fnhwMXJuhCcI+oeh9/mWo+o555OsTwX0dk2mvDVlBG9o1x
X-Gm-Message-State: AOJu0YyKuVkBlZBEbwdIm2BWOYJ8+mL9QC/oTiHGhInh6IW6EJb5iued
 9qLAPAwTR/2BbUMxQYWDcDFd3OSjwdPUOY5zmM7RS3yN2/OtzkWMfMLUjKFpJx3iAI23iNgwMG+
 nPFxxJZWx/7jrBBhzli1jvvNU8aU=
X-Google-Smtp-Source: AGHT+IF5ZT95wWDComVZ1Qrqxn3CS/rpjIH6NhBdB56AlgxGt/68AL5QxewLdun3eiPHTFdoHIoHc/QpG92qCDyeVWQ=
X-Received: by 2002:a17:906:a8b:b0:a58:ff45:415f with SMTP id
 y11-20020a1709060a8b00b00a58ff45415fmr1464926ejf.44.1714370596063; Sun, 28
 Apr 2024 23:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240426154138.64643-1-lyude@redhat.com>
 <20240426154138.64643-2-lyude@redhat.com>
In-Reply-To: <20240426154138.64643-2-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 29 Apr 2024 16:03:03 +1000
Message-ID: <CAPM=9txB5Zhyyno-GLD_JShV-GZd8hgYVh=Ok=Skmzs=eTi64A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau/gsp: Use the sg allocator for level 2 of
 radix3
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
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

> Currently, this can result in runtime PM issues on systems where memory
> Luckily, we don't actually need to allocate coherent memory for the page
> table thanks to being able to pass the GPU a radix3 page table for
> suspend/resume data. So, let's rewrite nvkm_gsp_radix3_sg() to use the sg
> allocator for level 2. We continue using coherent allocations for lvl0 and
> 1, since they only take a single page.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 71 ++++++++++++-------
>  2 files changed, 47 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 6f5d376d8fcc1..a11d16a16c3b2 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -15,7 +15,9 @@ struct nvkm_gsp_mem {
>  };
>
>  struct nvkm_gsp_radix3 {
> -       struct nvkm_gsp_mem mem[3];
> +       struct nvkm_gsp_mem lvl0;
> +       struct nvkm_gsp_mem lvl1;
> +       struct sg_table lvl2;

This looks great, could we go a step further and combine lvl0 and lvl1
into a 2 page allocation, I thought we could combine lvl0/lvl1 into a
2 page alloc, but that actually might be a bad idea under memory
pressure.

Dave.
