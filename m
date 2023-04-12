Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532BE6DF2E6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FE910E76C;
	Wed, 12 Apr 2023 11:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180C410E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:16:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso11011045wmr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681298169; x=1683890169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3oYUJMojD0ryoRHItO91lvPbTnTt0bQOfwf2G2otABA=;
 b=UnMwH+JjCQ8EQWQ9vLoNqgyX+7QvrHcuazJ4jFKYqPcDCdxeNDp+x9SPiRVbE70Vre
 9gx+uV/w0WEcVmrtFYxLaxPFlM3lIO7OzjXijSkfmmgoS00nWPPXm7tsNxSzfpnTt8e8
 xfixhDnKWplpU11hkit9j/B5cKVDVE0MIkifuytYOy3jtopZkV6qK3KzEwRn3Mo0qsB5
 u4U/B7/V4kUdX0s7exfVXuW/VaZtM0scyVFrLyyl+9TEDgeKU8uwRLuZ49NDS3rQPpqJ
 TWE4me1IIa3pUaEV31yVYbdz2C2W+/QL7T30NmjtPygbK6JDnbAiezzdZdF6R+RbJPZ2
 +j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298169; x=1683890169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3oYUJMojD0ryoRHItO91lvPbTnTt0bQOfwf2G2otABA=;
 b=r73z0alR7kffSQYJJ6HjPe7Azs8dogdHNg3qz54/NHnCr+/8VrRrYGseDAtsXd6iQ9
 xEaUC7MANjNIIUHbhyAF1Mww9fi72WSiejvWiN36XL3ml/hRe+8brdO17gjNVMvedxPk
 XwMO4z7rJrEkHMFAWwPC1d+Sw/vKK33poHiSzBGzZA6a/cywUk4pMHXdwnxD6givIIVY
 OLBTEykAXQ2B+8crrDfS1nuO0AC3hoB28merPdlSLPlcAPbv1UC7MHaI7pnVbmbhxntA
 A2NGzX87ZzWqlLQUl0/wEFhd9S915J2ran29tQfD7eWl7WwWZZsAPck1KPz4t6oAVCWx
 G/+A==
X-Gm-Message-State: AAQBX9dnrB0PSKrCtlvEbIEJoqAJK5VfslDX7H2DL5a4DYFqFhqq21Ws
 DIhLU795+dLx28XNo6yLXTk=
X-Google-Smtp-Source: AKy350Ytb3nPP2kCpTxqr/Xs1qPJNN6qUvMq7Y9nRQ5UQ+DeYLvOYyNhKVCasxGI+ZcqtJSr3tcJjQ==
X-Received: by 2002:a1c:cc17:0:b0:3eb:9822:f0 with SMTP id
 h23-20020a1ccc17000000b003eb982200f0mr4214599wmb.30.1681298168974; 
 Wed, 12 Apr 2023 04:16:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003edc11c2ecbsm2055322wmc.4.2023.04.12.04.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:16:07 -0700 (PDT)
Message-ID: <9f42d92c-c111-1ad7-ea5b-c52efb71d15d@gmail.com>
Date: Wed, 12 Apr 2023 13:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-3-yang.lee@linux.alibaba.com>
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
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b2439..5cee84cce0be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -159,7 +159,6 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_disp_ccorr *priv;
> -	struct resource *res;
>   	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -172,8 +171,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->clk);
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->regs = devm_ioremap_resource(dev, res);
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->regs)) {
>   		dev_err(dev, "failed to ioremap ccorr\n");
>   		return PTR_ERR(priv->regs);
