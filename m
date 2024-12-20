Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CF9F88E2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922F10E35D;
	Fri, 20 Dec 2024 00:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v7CO5E0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B003010E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:17:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so15418201fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734653874; x=1735258674; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=88ypJKEjfY/PQxYw2dDvihxL+GlYw4/eG83FW6BzWoY=;
 b=v7CO5E0AkHynOungOSP474YLlJmSwCBeqI625PvdS1wYUFkLdcjOnqUAJsdTepn3B0
 tHNQq4+sQl5xzyfMUbPisClOwwhVwWqIXYD9iveCGE1VV/vo2WhZW62SYFQ4gxsZl0Ja
 VaS3+Wc17wXRjYMjP1KAunf+HnYY4tBN2vEwclV3Ss1G1Pn39wYyRh0BUszK68PyquWB
 PYNwt/iP+WslH11vEPqlS97IgFS6fEh/u6HR21vAxcniyk2XerjOvzrCzCZGe9O9VAyi
 btnuAyO/I8z2SK6IL8ppKHj3IWWAUrrgzfW8SendWl59cp3dm9idwYWBbHjIwV3jfmC1
 0Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734653874; x=1735258674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88ypJKEjfY/PQxYw2dDvihxL+GlYw4/eG83FW6BzWoY=;
 b=oSGRvl66tbAwdvLiQegiiYcGbNek8n4nGZADuXjnFcgt9ycmeOUSBqEZzp2RdCg647
 KBB2hHUZeYsjYvX9MqvE1cpqhnQzhG28KJAW/295qkmx4pMI+bpwdM0ZezSEI974NpSN
 XMF/7HYpuTv3afgHn2Nxfc+20wP8CKUYbWNLst0/pCnJps09M/+5OuHSiTJbwSEkA8iS
 pfaGuEJ5wX0833sm7FiwRUfoPQB3BzSvFUMXEDYdoq1tw8sBGSAlwyM9CLyvxT0gN32b
 hj9O0d64GmIrMl9MjFVtqfjGSoYV3vliowmyKr+FlnLYlxBPhlHq6YI48rIhWplF2Bz6
 HJ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/yFp0znSq8m/sztAi1AcrAwfXsa/+UOqtGn0/Imxiqt8ZYBHzSBrYgII7KDY+DHkINqL2E0HrFRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9fVb2REPtcv7vnQFUkErPtvMM2mOw5gich0oiKU4eAaN20ki/
 A8PdqStBBx+d/hQ7rW8ELIlDsvtYve94xmioPZHKwfTAWuMP5xMoNfuoxYxZFgQ=
X-Gm-Gg: ASbGncuDrOCzTKwf8I2vnecra5OFcagg5DDv6TIvtPu7i0eI1/2QdrBFUB6VOdoj4Qx
 Lj/wuLEk11ByMjZwAIFQtLwM8UczJ8KX6YoRqdlSszyTdpUOKypIe4AF7teoPJ6umjGypNltiaI
 rWWbP5yngMwDcBbnmXTpCFJGmh0OEU9zZ2JKrGLTRiyoD4kqEiao62W0wyH+fum97l5JZ9DKLqJ
 urZNIcn273RO3BoWvxqEUBvD7PROBgVnfhm0rSUGYyoNsceO3Q1+3+g3hSDS74rt0/DZa29mfzD
 6YqQDJy39KuePpwHcbaiDMjmg+PE9dGOH0V5
X-Google-Smtp-Source: AGHT+IFB2i5vKnWXGFFd2MWZqu6ISfQEn6gsPEZ+iz0AquMdjU/HdGNzEaZYfYTM6DlCEi0nsU27SA==
X-Received: by 2002:a05:651c:4ca:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-30468571039mr2038491fa.19.1734653874050; 
 Thu, 19 Dec 2024 16:17:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cb8asm3815281fa.18.2024.12.19.16.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:17:52 -0800 (PST)
Date: Fri, 20 Dec 2024 02:17:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 09/15] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <irh3rei7to7gevrr5dqwa3qr3nl2lunenyvvvlqnpiyplbk2vj@ooedydnvl4df>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-10-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:05:58PM +0800, Damon Ding wrote:
> If the panel can not be found in the beginning of rockchip_dp_probe()
> using the platform bus, we can still try to find it in analogix_dp_bind()
> through the DP AUX bus after the &analogix_dp_device.aux has been
> initialized.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9429c50cc1bc..eae02819e3bb 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -19,12 +19,14 @@
>  #include <linux/platform_device.h>
>  
>  #include <drm/bridge/analogix_dp.h>
> +#include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1733,6 +1735,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  		goto err_disable_pm_runtime;
>  	}
>  
> +	if (!dp->plat_data->panel) {
> +		/*
> +		 * If the edp-panel module has not yet been initialized, the
> +		 * devm_of_dp_aux_populate_bus() function will return 0 and
> +		 * the done_probing() callback will not be called either.
> +		 * Consequently, the panel will never be found.
> +		 *
> +		 * This is the reason why we do not use the done_probing()
> +		 * callback and do not check the reture value here.

NAK. It is there for exactly this reason, to account for the panel
driver being not present yet. Please make a use of the done_probing()
callback.

> +		 */
> +		devm_of_dp_aux_populate_bus(&dp->aux, NULL);
> +		ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0,
> +						  &dp->plat_data->panel, NULL);
> +		if (ret)
> +			goto err_unregister_aux;
> +	}
> +
>  	ret = analogix_dp_create_bridge(drm_dev, dp);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
