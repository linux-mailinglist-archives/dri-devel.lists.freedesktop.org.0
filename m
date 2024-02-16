Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A285851E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9FB10E0DC;
	Fri, 16 Feb 2024 18:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JwhJwy5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DC310E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708108086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
 b=JwhJwy5qe+xVS8UwmsC5swxdPPnMfzjYbXz7tcoP0AaOYmujgufdlQP0Q3ngauVP6qrofx
 g7S7xBz18BrsdM0yHDB8Fsyg+1qtJouRbJtIWergcXwAxeR34IfUw4bovO75KJBCCl+iAv
 9Gj/Zva6gycutX72Mf9A8QhAzXPSiD8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-UyP2NP43MWCZlkAXiToHAw-1; Fri, 16 Feb 2024 13:28:04 -0500
X-MC-Unique: UyP2NP43MWCZlkAXiToHAw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5115b1e3facso2462990e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108082; x=1708712882;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
 b=urPLF4AzOSJ4B/TNXmauUOLvK+88EqrrLA3n5vsFpQwe4VDj6nhbPPRKIqLXebh6IG
 RT5MjLRBudTPfBCUQQVqmtdUz71BpQlJB9XUXafeZpEQw8elvcEIJgh8+Fy7gbvReq6A
 aPn0Ls3T+rFRc3NWtSyMi86iQ8bdzwo9FwWTWswUnXVM3ubzOQSFJ117O25zGhW6Xj3O
 /9CwgNcOnupOXkWXK0t9WBkpbMz1qOSKOm+8YEBgmkcoo2dPetug90i7qrPC8zHJw/RE
 vYhLqAC9VgD0GnMl49D9as8rQzQmaFys5ENWUE3dYAiJGWTTIuoVg3qOmC/NGgsv3WEj
 elkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbyrbh0GJd2POTIAoFnf5drwbop6P4+4z2Z0z5JAzDBA+FMjxAedlvVaiJwBE7kBGznOnYmHBIAFH31iD1ZiN8OGUg8Gx01bLkgxOov6xk
X-Gm-Message-State: AOJu0YzzxLunCWwUD2DFr9cjE0IpU2E38oEv0cp7c7U2ZbUd+bUGhO8J
 ErZsiMal5h/PrLwXaeoHmW7X09CkpLWczMwLr1xCtggvjdrkxmiC6d9Rec7xcGHKoGOP/MK0Bik
 Sm4Zb2C18A65xJbal9L1mVDyNGLv1VG1Wwv2aq5y5/xasMlhL/PTg5TvR5XXnR6nF8A==
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id
 u21-20020a05651206d500b0051286faa781mr5126927lff.62.1708108082053; 
 Fri, 16 Feb 2024 10:28:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlTdqcYB6gYrq3Gc55U5e1iav+rzbv+UkBZ9iNFp6WAozBF1MgQrgrIw9sAy+0/Uzd7DC4mA==
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id
 u21-20020a05651206d500b0051286faa781mr5126912lff.62.1708108081675; 
 Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Message-ID: <6536ebe0-4577-41dd-b3f1-1525b9fe30b7@redhat.com>
Date: Fri, 16 Feb 2024 19:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/mmu/r535: uninitialized variable in
 r535_bar_new_()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/13/24 19:09, Dan Carpenter wrote:
> If gf100_bar_new_() fails then "bar" is not initialized.
> 
> Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to drm-misc-fixes, thanks!

> ---
> It looks like this was intended to handle a failure from the "rm" func
> but "rm" can't actually fail so it's easier to write the error handling
> for the code as-is.
> 
>   drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> index 4135690326f4..3a30bea30e36 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> @@ -168,12 +168,11 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
>   	rm->flush = r535_bar_flush;
>   
>   	ret = gf100_bar_new_(rm, device, type, inst, &bar);
> -	*pbar = bar;
>   	if (ret) {
> -		if (!bar)
> -			kfree(rm);
> +		kfree(rm);
>   		return ret;
>   	}
> +	*pbar = bar;
>   
>   	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
>   	if (!bar->flushBAR2PhysMode)

