Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4F89CB49
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DB11127CF;
	Mon,  8 Apr 2024 17:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M3CfnXS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823E81127C9;
 Mon,  8 Apr 2024 17:56:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4169d7943bcso742375e9.0; 
 Mon, 08 Apr 2024 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712598972; x=1713203772; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PVqd5K0SRGaVpj/BbPQME6uHdpenAhrgdHionnlOxzU=;
 b=M3CfnXS1nLiEZAlDjVwhLsKElPxBgEI0443lIM3w6wMkvP7mABmvXnZVM6PyjFvtY6
 DeJPxFbYoUTjCIR1GmkE0PIrsYl1m1MqmvDBt2OvBY11JpOhhzxTkz5SzM0VEULAjh2j
 FqfeW+kfchWxb0cfTa5n/6xR0moW6YDl87hL/NQHp0zmHi0RItNmRk1+g2/QpKseIt4L
 GX3IqIhGALs+tbxdzT1FBQ30JXHXm0KsGYyCI14HDU1+zt19TX9Lwmvbw9xXiizDs003
 9EFFvhCy+P9uIJtGMoPi1sSP5TRegU+3pJmMBRLbE1YxnudPKmBtfc9bB4oOKMS7Ikq8
 cLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712598972; x=1713203772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PVqd5K0SRGaVpj/BbPQME6uHdpenAhrgdHionnlOxzU=;
 b=gOKQ/n14etaqYGv/gyUR6S9qujW+vowGgVAhuE7jFsxb/vc8IOzPeqgopwjQm8A/IV
 umgB+cfXCMBfds2VJ80SV7iYgq4RZinM0lw54USBr/GhDJYKghESEe6O4qrBH8y70IUn
 UbkU+HJAbwRD9ZRDcjDOjLJG2HE3Buk0zDfdGs1cLaJuTsxnXCJ6ps/JgGh+PCcUf7LL
 8fYDisNnY0F8qMy1jtqcdoaTEO5KSbbQZMQqM4QcNcCXmuDtTZri+sTgMkOHpv1hFdr+
 yJnm19rQnJ/v9mBN9VAosR32wE5R+6k9XIQvh3Zl7fx591gFJKdsJelv4+z112EnhQJG
 8b1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvd2aL/5M8RDSvcTcUstSWFjoi/z0wsvV3YvgTV2uCt9a8QIHAVAVGJZqvym+Dy5+rgVVcoFaMzQMwQB5E/cv2J+kDP05TWvHYGDJCxZXiYsm0W2gSgB61fzuCLOWE6Ehlct9FM9OtM/IENn43mw==
X-Gm-Message-State: AOJu0Yw0sJjq86Dh49IGqZnP7IDfpNWKYKW1W1vu6ZHFHLd+yaxSgoqc
 NjYRfEXAdMZyoH6rI4rGxDRC+A/E66/2lpUfVf7UuX0916uIibcRzJ14yYCi0e+/eTTUrITlUmy
 XKROrLxJjxpO0MiBtSqqmXCWjcJ4=
X-Google-Smtp-Source: AGHT+IEBfcTwKbjIXNSE9gdl9yU2JjwleWoBgOieN5OFGOgrCuTtSC7v5ZDWG17SMfnwAHM10PxwQ6il59ulsNFxQls=
X-Received: by 2002:adf:a112:0:b0:346:1463:2986 with SMTP id
 o18-20020adfa112000000b0034614632986mr57905wro.57.1712598971194; Mon, 08 Apr
 2024 10:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAODyvywHfmeFJP_obZB=dWcaibH_1RRGX=+CSVwcdfjSLMbJ4A@mail.gmail.com>
In-Reply-To: <CAODyvywHfmeFJP_obZB=dWcaibH_1RRGX=+CSVwcdfjSLMbJ4A@mail.gmail.com>
From: broler Liew <brolerliew@gmail.com>
Date: Tue, 9 Apr 2024 01:56:00 +0800
Message-ID: <CAODyvywzsX3j55_pa1OWU_AFrVty4+HbtvTH4gLeLjj7mDuZAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove "num_pages" local variable in
 amdgpu_gtt_mgr_new
To: alexander.deucher@amd.com
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>
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

sorry, this patch has format problem. abandon. I send another email
use qq mail instead.

>
> amdgpu_gtt_mgr_new and ttm_range_man_alloc share similar logic, but
> "num_pages" in amdgpu_gtt_mgr_new is defined as local variable which
> is calculate directly in ttm_range_man_alloc.
>
> Signed-off-by: brolerliew <brolerliew@gmail.com>
> ---
> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 44367f03316f..0c56e4057d85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct
> ttm_resource_manager *man,
>                              struct ttm_resource **res)
> {
>        struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -       uint32_t num_pages = PFN_UP(tbo->base.size);
>        struct ttm_range_mgr_node *node;
>        int r;
>
> @@ -134,7 +133,7 @@ static int amdgpu_gtt_mgr_new(struct
> ttm_resource_manager *man,
>        if (place->lpfn) {
>                spin_lock(&mgr->lock);
>                r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
> -                                               num_pages, tbo->page_alignment,
> +
> PFN_UP(node->base.size), tbo->page_alignment,
>                                                0, place->fpfn, place->lpfn,
>                                                DRM_MM_INSERT_BEST);
>                spin_unlock(&mgr->lock);
> --
> 2.40.1
