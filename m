Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630126DF2DF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1669810E772;
	Wed, 12 Apr 2023 11:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BB410E772
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:15:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso12672666wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681298140; x=1683890140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KPng0uX84C5bAhSzcWmSxhhcnDr0cY7vCS4LxH5PTLI=;
 b=XMKWPnTXpH9z4caj9fCy5PB0e1zEhMyySW6oD0xZZetZbZnufST4PS5xRV2jfQqUSg
 p3yd0lIwS1EfGyta0ASTxPiy4tU4+WFux713j02I4h2hOrysY+HhyHBzOIwr6bI8fO1z
 69Yc88c/Q27Jw+E5429lWcfLo/G51E7s3XvV6EwyWJwk11NUPxc2u9Nh9uCzswbmcwNy
 Zqu+D5SG01MDbSKNCLapa0tp2VE1x5aLJGoUWzKBoO0F6LUUZXyVfb/fDwVlAGbk0VYP
 6Gn4w0xlNyyYXMVH9UbSFns4TSPlDS25AoA6aVkahjCtf35r07PmWj5UGWXHtFOI9UdY
 FX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298140; x=1683890140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KPng0uX84C5bAhSzcWmSxhhcnDr0cY7vCS4LxH5PTLI=;
 b=14LJxonXhEW44aNuCpWBU9s39/R5UHqyCZ8SdAhpTjgrzri20slOh7i6Li1mI8symb
 LO7xvPSPhucLqws8jXYuNiOm18QVKkjqnQVyIiRwFpTQD2Lbq2VTMfZ4yUlYMBsbdbky
 zyjs2Z2COHd9q9+GYt6y5JKaDfThTA32NwdZLn9auynzOwACuBlh0cxjj0qXYO6bS+cn
 ASN2J8P+hFGvgOAlnoK+IMW2v1oe31PLVM4uq6LzRXMRMvdfSHZh92OtQ9tZ78+R3DXI
 zy9HIWIrU8nVD8a2QjmCjTUsdDh2zfxN19v1kXD5lhoYNYwrBkrHPQM+GnO0T+tXcW2p
 9xpQ==
X-Gm-Message-State: AAQBX9fEzJusuSqUW0P/by69EIJ7fW+dohCCD03TWl9NiAGeB40UJyNb
 Jy8YRdSOltQqX8dLSF3+loQ=
X-Google-Smtp-Source: AKy350ZjmuWZhJ+YDUrMDgqUmQgVF1CFmTs2u1hfTFBUXLq1SFrDwQBWBq4Fho3ErVSJ7XpQ1mNbpw==
X-Received: by 2002:a05:600c:3791:b0:3f0:7f07:e617 with SMTP id
 o17-20020a05600c379100b003f07f07e617mr1727822wmr.8.1681298139560; 
 Wed, 12 Apr 2023 04:15:39 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b002c71b4d476asm16866714wrt.106.2023.04.12.04.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:15:38 -0700 (PDT)
Message-ID: <f3080105-bb30-3d59-c337-3a4afc6f3518@gmail.com>
Date: Wed, 12 Apr 2023 13:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 1/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index b640bc0559e7..03aae9f95606 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -185,7 +185,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_cec *cec;
> -	struct resource *res;
>   	int ret;
>   
>   	cec = devm_kzalloc(dev, sizeof(*cec), GFP_KERNEL);
> @@ -195,8 +194,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, cec);
>   	spin_lock_init(&cec->lock);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	cec->regs = devm_ioremap_resource(dev, res);
> +	cec->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(cec->regs)) {
>   		ret = PTR_ERR(cec->regs);
>   		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
