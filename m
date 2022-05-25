Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9953407C
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 17:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37D110E184;
	Wed, 25 May 2022 15:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9702E10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:39:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so3570061wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VXAEmKc7pmbCtXrrRn9qkBnDMor/6y0MKZnQAmCilmU=;
 b=WY7AhqKk9zq4UwgDyNWT84seQxuWDiEFoJhi3S8Py5nXgA1kvsQTPLHesGTx46RjR5
 Iqs0ATf993QDNZgI2b/ctV/HzV00kG9atUOrh+qp7V+1FuwZ68q3Hrp+fZ5ukISbop8h
 HqMN34xIXAqT8t91xOvWgFF4vshs/igpkzjEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VXAEmKc7pmbCtXrrRn9qkBnDMor/6y0MKZnQAmCilmU=;
 b=WpBE64KGeBidM3XPzCduPoijkrRf07GX0vAYN3fu0ZaLK3SRoTsk+rXel42Y2JRkND
 Mbxn4OVkG8e1OdoI33huOk7qgdHqe1uVnrdtRjA7yiT9LWrnEq2CS5lCZxlR/r6DEOGu
 IrQav9whfQ1yF+ixdR7+zFrN7vWSO4ROmFQOSaWkhdPn23MTl0xt/K3ATQcK1O1Ex1wd
 BreZoyfdeDjOlCNU2PKwXZKG/MIKwTXoioRz7xEUctnRYNepkAQccR/0h4jwmK7c2HBr
 DlTinWKEt7IdqgviMlQDx3b+bx9Alazo8dN4eqc342m6TgOSq5uPLXFNrZmWfMPkha8k
 TO3A==
X-Gm-Message-State: AOAM530kv59wZ5Jnis6FQCG/9hzEMCtWkSXE2HDijHjZA/hpydKhRHGG
 CzZPQwOkcE9NYcyS96Iy0xiC6L4uN2g5Zg==
X-Google-Smtp-Source: ABdhPJwYPw5Gx5y2i+wsA7w4Osgm4nRBUKJFdc+1tBwOhslXSazczezYd5De8QOCg1GbBzyREmY/9g==
X-Received: by 2002:a05:600c:2316:b0:397:3c98:260b with SMTP id
 22-20020a05600c231600b003973c98260bmr8815337wmo.172.1653493183039; 
 Wed, 25 May 2022 08:39:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d6c64000000b0020e60baffd1sm2499073wrz.52.2022.05.25.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:39:42 -0700 (PDT)
Date: Wed, 25 May 2022 17:39:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Niels Dossche <dossche.niels@gmail.com>
Subject: Re: [PATCH] drm: use ENOMEM for drmm_kzalloc allocation failures
Message-ID: <Yo5NvNZoKl8CcTWI@phenom.ffwll.local>
References: <20220521234104.88410-1-dossche.niels@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521234104.88410-1-dossche.niels@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 22, 2022 at 01:41:04AM +0200, Niels Dossche wrote:
> Other callers of drmm_kzalloc already return -ENOMEM on allocation
> failure. Change EINVAL to ENOMEM for consistency.
> 
> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>

Thanks, applied to drm-misc-next.
-Daniel

> ---
> 
> Note:
> I found this issue using my experimental static analyser on Linux
> 5.17.9. I compile tested the patch on x86_64.
> 
>  drivers/gpu/drm/drm_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 72e982323a5e..a940024c8087 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -226,7 +226,7 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
>  
>  	container = drmm_kzalloc(dev, size, GFP_KERNEL);
>  	if (!container)
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-ENOMEM);
>  
>  	encoder = container + offset;
>  
> -- 
> 2.36.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
