Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6409FE5FC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878C210E4BE;
	Mon, 30 Dec 2024 12:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zU/vSbs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FA410E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:46:32 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3043e84c687so80710041fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735562731; x=1736167531; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tYYedohEc9vf/SRWvXYMUw8vyrAayil4GiZBetI0DRQ=;
 b=zU/vSbs9DjogGtYwCHP+1QFPRVKZGc/rWNg+ZxfXqVU7WKDEudCrHcAoRCdenbgRoF
 m3n9GR+QN3y5KgDLDiuKBPpWzKu7xYnwbl0NCv2fB9mj/kbRA97kI0x62rXCF/qodXJR
 0G3GROkbWZKNQlNuvaJpB4J4aRBoJQm1yBrh5v4r00sDUg7vXIASz6Bl8enkeY+VrtjN
 w4LD5DLtv0h2FkhDBixM6Gas2v8smda8jQXtZrWfbIQsU3Vu/lEELD1wuv11y9detYkF
 H9Xg9xASlLbzIqpKBtbG0GlqYRAX47B9xCZIOSALbcFo/dh6DQ1TERayi3j0zDZmoe2u
 GNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735562731; x=1736167531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYYedohEc9vf/SRWvXYMUw8vyrAayil4GiZBetI0DRQ=;
 b=hQIxSey3VYzC0oYamxByaqVKemt4rwRdj+3v2Yf3pzjRrfyUibSxYn0ukBPFqA4Y7p
 JcyogoX2M5oS0JEEcG5ehpFer7pWfkV9arqE10tJ515VGKsZIlaZheB84a18pokWLW3C
 i7vFab+xTyIJ9ta4Lhdi4NTsVz/ID25GbqWORBCsvLloLrC/8h+xOFR0viE69nr5ioL+
 BnKBfeBldUB56jQ76YfM0Bjx0kpeoe+pRxE+X02mZt1LuAqHyrTkYv7kGHacSkliY/20
 52PiBY/5f+xRF+vtL7SCCYRfUnREkoXEp2OpXfpO9S584PcJVBENeWyVWxami0vkl8XR
 NEWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU35LzXslG/fwShDw61vccAM756AUaT+EB8wxTlqZ1Ecol3n65ai6RegrNJNZgH8S5FiN96bTHidYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf8uCZsS5UPOXohbUHZbIrfK6jfaMuhCMaDw+wnMd7u3Hix1jJ
 +v3Pl8gm/I16L1j5BcRr9A2WfxR6JQAtVQFdrNMTLx1CW3R/hz5/05MGq1Cx7WM=
X-Gm-Gg: ASbGncuk3p1G1zuIhqD3Hk3/8FJy3njQ0u1+9w0i7hBlCaqcgTWvdJxnqtfGFoVNkUU
 cofqMEHgGwDl7BLyxthCgQkwxsIaFe8DWoL18M8sTROGBZuJqI0xFvZqWNxWogmAP0eVKpc+keh
 2cca/bWuFwVYNxnXIyOI+G1aSBBfDxmgzv/vElGLT02Wxz6TTpzompbQTFg/CpyvHtNFvxBFHxp
 hSjA+ROAWCAEHUPfCoPuX8MdgKA1Qe/1X7qbwTWmiNSGcXb7n4NgX1SjMWK1T//DlLuT/r48MMX
 Iw7P4CQXxTAMhGKTcDpIPCbM/idO8cOwvWih
X-Google-Smtp-Source: AGHT+IFHlYAccbO2U+l1/+qdqnOJIZ9pmRBeI/fEyYOfTMJsxs8AYRAGyUUI0bNMBdlPg6thA6H6QQ==
X-Received: by 2002:a05:651c:2223:b0:302:4130:e19d with SMTP id
 38308e7fff4ca-30468535947mr120605401fa.9.1735562731167; 
 Mon, 30 Dec 2024 04:45:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cae6sm34594261fa.23.2024.12.30.04.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:45:30 -0800 (PST)
Date: Mon, 30 Dec 2024 14:45:27 +0200
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
Subject: Re: [PATCH v4 07/17] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-8-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:03PM +0800, Damon Ding wrote:
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate have been verified according
> to the eDP 1.3 requirements.

Well... Please describe what's happening here. That the HDMI PHY on your
platform also provides support for DP / eDP. Please document any design
decisions that you had to make.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the module author
> 
> Changes in v3:
> - Split this patch into two, one for correction and the other for
>   extension
> 
> Changes in v4:
> - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
>   phy_configure() result for &phy_configure_opts.dp.link_rate and
>   &phy_configure_opts.dp.lanes
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 896 +++++++++++++++++-
>  1 file changed, 889 insertions(+), 7 deletions(-)
> 
> @@ -933,9 +1484,339 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>  	return rk_hdptx_phy_consumer_put(hdptx, false);
>  }
>  
> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				 int submode)
> +{
> +	return 0;
> +}

No need for the stub, please drop it. The host controller driver can
still call phy_set_mode() / _ext(), the call will return 0.

> +
> +static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
> +				      struct phy_configure_opts_dp *dp)
> +{
> +	int i;
> +
> +	if (dp->set_rate) {
> +		switch (dp->link_rate) {
> +		case 1620:
> +		case 2700:
> +		case 5400:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_lanes) {
> +		switch (dp->lanes) {
> +		case 0:

Is it really a valid config to have 0 lanes?

> +		case 1:
> +		case 2:
> +		case 4:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_voltages) {
> +		for (i = 0; i < hdptx->lanes; i++) {
> +			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
> +				return -EINVAL;
> +
> +			if (dp->voltage[i] + dp->pre[i] > 3)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

[..]

> +
> +static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
> +	enum phy_mode mode = phy_get_mode(phy);
> +	int ret;
> +
> +	if (mode != PHY_MODE_DP)
> +		return -EINVAL;

I'd say, return 0;

> +
> +	ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
> +	if (ret) {
> +		dev_err(hdptx->dev, "invalid params for phy configure\n");
> +		return ret;
> +	}
> +
> +	if (opts->dp.set_rate) {
> +		ret = rk_hdptx_phy_set_rate(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set rate: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_lanes) {
> +		ret = rk_hdptx_phy_set_lanes(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set lanes: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_voltages) {
> +		ret = rk_hdptx_phy_set_voltages(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set voltages: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct phy_ops rk_hdptx_phy_ops = {
>  	.power_on  = rk_hdptx_phy_power_on,
>  	.power_off = rk_hdptx_phy_power_off,
> +	.set_mode  = rk_hdptx_phy_set_mode,
> +	.configure = rk_hdptx_phy_configure,
>  	.owner	   = THIS_MODULE,
>  };
>  
> @@ -1149,5 +2030,6 @@ module_platform_driver(rk_hdptx_phy_driver);
>  
>  MODULE_AUTHOR("Algea Cao <algea.cao@rock-chips.com>");
>  MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@collabora.com>");
> +MODULE_AUTHOR("Damon Ding <damon.ding@rock-chips.com>");
>  MODULE_DESCRIPTION("Samsung HDMI/eDP Transmitter Combo PHY Driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
