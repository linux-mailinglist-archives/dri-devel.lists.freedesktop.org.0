Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3153FC9E5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79E6E093;
	Tue, 31 Aug 2021 14:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2A96E093
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:35:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b6so28050191wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4rZGwfZEIOrCqcjibED3N9c7CMYt/1s+laPidanJ9U=;
 b=yC/J2IkaFivBRU9NGiW59trje7d4yntYagBVo9vlQoNWteSJIXEi+XV1UN92LQXU6Y
 6X+b1KiPiOuE0hH9FDgslu7r9hvH7P1KkUXuKL+2BDJnLDMtlb7yZkAhciDqUppAOdx9
 cjcp2KWoXQIDBLLoadxkk9MFxIjtU2mFpVIX6OC6Lg1X2zAZFt1mItcD5/zuvAjBsbwq
 Xwrhr6/tGl5uf6t/ImCIhMMM0L9ucBr9VrsuIps+nHNZUa/DJPkvLzRtcXVn8b+XUT7K
 wox/1EqzDbBcObZAKMxZNbe6AC80atzRyp7evrBnWvdIx2ainMfCLIZ/b86bm9k0CO2P
 xrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t4rZGwfZEIOrCqcjibED3N9c7CMYt/1s+laPidanJ9U=;
 b=jlTJRiUF/8EPJVRMmoyzsPdyPkgOZ9rnSILW9GR76K5rTc3+8bUB5xP4fqYs3zd6dH
 NFWfNuFNOmSoiq7dX3EmW6uxfTuIyDNZj3Ro/Xd53IvdNBuCzopxapucV4Ceft73uW0p
 UWXw981LEwwtVubgztiR5iMJFWIXZopkxdSK6zOV4r3cF5ErN3XCtDI3eg9ADUqyepZy
 bWib7VRcuttVBEQdcgKS3NVRhFnCYecoPr5waPLUhhEKOv9ZSE5ac+0eUGNEFa6E5ttM
 BHUYSOCfJuAKcbqZKiptNED+9t31UX21YFeM5kECckz0bVqRATzlqnQBGsDD2DVWKy/e
 OqYA==
X-Gm-Message-State: AOAM531nUBoREkjcfsXnfOHYL2wW6eop3D+ZXtL6K//NBfCxHzWgxWVl
 rVhUgzx/MJ/4Er6M88FJbJ0XUA==
X-Google-Smtp-Source: ABdhPJz1pzwOW6HFn9CswPOaXqf3E3MWOvhHxsRINvTlHKrnGPthKiywMBDC/0mPhZNzBg8b+xY76g==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr31431795wrq.412.1630420544859; 
 Tue, 31 Aug 2021 07:35:44 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:fc41:6c:2c4e:2156?
 ([2001:861:44c0:66c0:fc41:6c:2c4e:2156])
 by smtp.gmail.com with ESMTPSA id c24sm18471493wrb.57.2021.08.31.07.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:35:44 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Make use of the helper function
 devm_platform_ioremap_resourcexxx()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210831135644.4576-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <896e4f35-f410-41e8-50ad-ed16c65cab45@baylibre.com>
Date: Tue, 31 Aug 2021 16:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831135644.4576-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 31/08/2021 15:56, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c     | 3 +--
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 +---
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index bc0d60df04ae..7f41a33592c8 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -206,8 +206,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	priv->compat = match->compat;
>  	priv->afbcd.ops = match->afbcd_ops;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
> -	regs = devm_ioremap_resource(dev, res);
> +	regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
>  	if (IS_ERR(regs)) {
>  		ret = PTR_ERR(regs);
>  		goto free_drm;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2ed87cfdd735..0afbd1e70bfc 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -978,7 +978,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	struct dw_hdmi_plat_data *dw_plat_data;
>  	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
> -	struct resource *res;
>  	int irq;
>  	int ret;
>  
> @@ -1042,8 +1041,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	meson_dw_hdmi->hdmitx = devm_ioremap_resource(dev, res);
> +	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(meson_dw_hdmi->hdmitx))
>  		return PTR_ERR(meson_dw_hdmi->hdmitx);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
