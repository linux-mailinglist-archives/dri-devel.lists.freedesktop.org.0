Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66A253E4D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCEE6EB29;
	Thu, 27 Aug 2020 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E846E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 12:45:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p17so1663015wrj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+hzTqkFrfNBkiR/rvkXbcN3IkiaGHhlF+bCukUizmc=;
 b=dbVWGfycJceXjQfrYixZwVEtvmxS5R/1rhN1PXiVpdT3TqkG/qmCGhipTD9vd3Qdt4
 QNE9F9OcwhAfjXVvUJv4YhhnMAYmmcXQTks2T+y91ZNsmHLl2szhOHElmCWpQaM7c8QK
 +3JM+aZN5KXXyRB5W+aBVpQQ6kIhiMsR1E0bI0T++AWigtOAEVArjhN0k7IFtMgTidzT
 4nQdCjvnVL/ScIXkNIi+bpOl067uQfsCfPLbxo+y1pIiGhjTWdFLakUT/+hmBZW6fabr
 9yK7Iq771/Gz2rUOVL37ywse8QLWmTmOAgx3AGFTNy2ViyispOgIcBLZab5e/1B2alQc
 kwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+hzTqkFrfNBkiR/rvkXbcN3IkiaGHhlF+bCukUizmc=;
 b=FRFrA49ufrO3doyuaF6Fa/cDgM/kPbaTzK02EE6Q8wFX8lqULxi8HnCExXVq0MzYzx
 cpcoA5PFEL1Ep2nGbhAyfBojw7DgvxZWn1cfWKVmP82eFCzEfyzVMLSf26cyd0IDQ8AE
 QQ/f4lUz0w4FV91VYJckz94rqbKobm66yJqflpAdkaowpjDc1Jq16950i/hv2/ynAuGi
 tCJQdU1niXKonwuq31vWYXA/+KO7gSQ6EnN4kK6k202lRd+2Xd7ziyGM9EZYwRFs/2E3
 YQpkTA+tpnbAdKCgq/9YKj2pIl6HXhMFL7PPjuUBLv8bWY2AIqFczsJ+2Ne9+4N92WXs
 M5+A==
X-Gm-Message-State: AOAM530LLOnjDWtMsVwsxX3Pb7m29LrXUGs7dOm3G/k/7GKDjI450Y3K
 7VHER8acWDeNNdq+zNrYvbQ=
X-Google-Smtp-Source: ABdhPJyY6K+/hTlXaz+/ytiMdj2yfOTYMMtVX7sOApplvhHJ10lJyCh3Wsiub7OgzbKIv+8SMwivpw==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr15158232wrw.169.1598445945139; 
 Wed, 26 Aug 2020 05:45:45 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id u7sm5642591wmb.16.2020.08.26.05.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 05:45:44 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:45:40 +0500
From: Bilal Wasim <bwasim.lkml@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 4/5] drm/bridge: ps8640: Print an error if VDO
 control fails
Message-ID: <20200826174540.19813147@a-VirtualBox>
In-Reply-To: <20200826081526.674866-5-enric.balletbo@collabora.com>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
 <20200826081526.674866-5-enric.balletbo@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Aug 2020 10:15:25 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> Print an error message inside ps8640_bridge_vdo_control() function
> when it fails so we can simplify a bit the callers, they will only
> need to check the error code.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
> b/drivers/gpu/drm/bridge/parade-ps8640.c index
> ce3e8b2da8c9..9f7b7a9c53c5 100644 ---
> a/drivers/gpu/drm/bridge/parade-ps8640.c +++
> b/drivers/gpu/drm/bridge/parade-ps8640.c @@ -82,8 +82,11 @@ static
> int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge, ret =
> i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
> sizeof(vdo_ctrl_buf), vdo_ctrl_buf);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		DRM_ERROR("failed to %sable VDO: %d\n",
> +			  ctrl == ENABLE ? "en" : "dis", ret);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -150,10 +153,8 @@ static void ps8640_pre_enable(struct drm_bridge
> *bridge) }
>  
>  	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> -	if (ret) {
> -		DRM_ERROR("failed to enable VDO: %d\n", ret);
> +	if (ret)
>  		goto err_regulators_disable;
> -	}
>  
>  	/* Switch access edp panel's edid through i2c */
>  	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
> @@ -175,9 +176,7 @@ static void ps8640_post_disable(struct drm_bridge
> *bridge) struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	int ret;
>  
> -	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> -	if (ret < 0)
> -		DRM_ERROR("failed to disable VDO: %d\n", ret);
> +	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>  
>  	gpiod_set_value(ps_bridge->gpio_reset, 1);
>  	gpiod_set_value(ps_bridge->gpio_powerdown, 1);

Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>

-Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
