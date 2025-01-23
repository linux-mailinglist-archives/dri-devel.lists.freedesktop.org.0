Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35878A1A2E6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7EF10E7E1;
	Thu, 23 Jan 2025 11:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="loey5F43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0B10E7DE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:26:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so979093e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631612; x=1738236412; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DFfpTSbOh8RvHyE6RIKYPSmJaoOLiJCGJd9BE4mSXsw=;
 b=loey5F43yzmAjngYUr085uI3JcdrIA2ticsFxKmzQtIZCCI7uc+1rHG1F7V9KWjr2E
 XuxeQ4oYrSlKW9afewKnuVZqBwobYXXGyNM2StuxlCKeBu5zW3ZFsTgboi6Z+cYEaKjY
 ATpVcFY5fn2wB/71jfsi7tD7mAyAfNAGgkXP9bC29tEtKOwBXO5QNOmxhz9XoLcffYFe
 igI1kMybPn9PkOVsd+KE67S82vu1vLoL3h8dgd03FiROQy7PDiiyrLPBWq3SfaVpnRvi
 i6+48NxpNe/3QVnqIG1yZk1IL/OvpYzEIzDEX7X7R8uocqMU+6Mk3BOlw5Tbg21mZN2O
 n4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631612; x=1738236412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFfpTSbOh8RvHyE6RIKYPSmJaoOLiJCGJd9BE4mSXsw=;
 b=r9oo6uTqMw2vL/tTAjV8Rvo9f0DT2AuEdutXJtwFbYH3edhhJ5eAnMxL8L7O6/qcTS
 W4hKbCe8DiMovOSuhUPhclZPiasGEdVfbgVbedGxVMtKA2Wu8WDTTzTrD2DwQpodYkvk
 JZNJVltAW48n3NoyccEItYQiua8XDUGw6oR1a78pY1pRueHMVCg6j7SiTCHTxvcKMyon
 UocV86pPTKzCj7+PP7sSRM4hREdxkJXciIV3a7e4WMS6wNujx3OkFPVdNQvp9sMnTs51
 fPsFrgQg5ffrVGonyW/3Y/DHEggogNyjKPWl3nI+BAq2nnS6KeVz5eH4uzldPEuOF0kJ
 +AVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhCy84W2QIA0QF9GJURhXiUH96Ra7ZZXdUUxUlqzCdQ5I4FXidNrhqsRtpFaAGMXr/+8lXClLpLIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWk9/ZYbgE42V7EVc6PR9GMZJv2jxVzLmsLSlCQf7Hi2h91uge
 79a/yIOK+AsUem7qGRCX4meYmcJw4g0eWmb4ozo99kkSlB3YKjNJYB/lQMn2Osc=
X-Gm-Gg: ASbGncvuA0lGNk8cEQwDDpBpb55WuUq4Tj+iGhntLtH2ljDHFW0ajiXYr4v+3jHdRyn
 W8JYQvF1U1MbAqdTbXIyrx4/AcG7mGP83Gcyp3KwP/huxB9l6hW1Q3Ljt84mUOYQxvNEzZeveiF
 fTzQPDahnvrjvo2cgSVxoHZn8Q96Lbh5iEuoaSPfBqi2HgPMc3V57CMiJTBkO3E4d4asKt+2y6c
 moTesbxeMfL7jLey3Nh/AsIr1RWKIJ90NgPTIa8zH/hGT1t6YCSO4h5BvJZ1hSxq8OcDgG46BBT
 U+Eh7dvsHdy3Wn26++RPePNDjn2ryMc6RhO0aJ8X5/xlQQw4wlJRhKKw75Xl
X-Google-Smtp-Source: AGHT+IGNOaD089OMXfqr3Dnm2V/eB8MHKGKnVwiIKkPGlQzS9RJucZ1gI7lV8A7Yejq/M0G2xCRCQQ==
X-Received: by 2002:a05:6512:2346:b0:53e:335e:7756 with SMTP id
 2adb3069b0e04-5439c287bf9mr8252435e87.46.1737631612246; 
 Thu, 23 Jan 2025 03:26:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543a24d2237sm2273345e87.9.2025.01.23.03.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:26:51 -0800 (PST)
Date: Thu, 23 Jan 2025 13:26:49 +0200
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
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <jhl5ae6wzydxmauvwlw7g6kqqdcanwfi6sgeenhczsbwzdzlym@n5pbe4jk6ult>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-9-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:41PM +0800, Damon Ding wrote:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
> 
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
> 
> Changes in v6:
> - Keep drm_err() in rockchip_dp_poweron()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 13f32aeea7ca..004b1b68d1cf 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -393,11 +393,27 @@ static const struct component_ops rockchip_dp_component_ops = {
>  	.unbind = rockchip_dp_unbind,
>  };
>  
> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = component_add(dp->dev, &rockchip_dp_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
>  static int rockchip_dp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct rockchip_dp_chip_data *dp_data;
> -	struct drm_panel *panel = NULL;
>  	struct rockchip_dp_device *dp;
>  	struct resource *res;
>  	int i;
> @@ -407,10 +423,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (!dp_data)
>  		return -ENODEV;
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret < 0 && ret != -ENODEV)
> -		return ret;
> -
>  	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp)
>  		return -ENOMEM;
> @@ -434,7 +446,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  
>  	dp->dev = dev;
>  	dp->adp = ERR_PTR(-ENODEV);
> -	dp->plat_data.panel = panel;
>  	dp->plat_data.dev_type = dp->data->chip_type;
>  	dp->plat_data.power_on = rockchip_dp_poweron;
>  	dp->plat_data.power_off = rockchip_dp_powerdown;
> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (IS_ERR(dp->adp))
>  		return PTR_ERR(dp->adp);
>  
> -	ret = component_add(dev, &rockchip_dp_component_ops);
> -	if (ret)
> -		return ret;
> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
> +	if (ret) {
> +		if (ret != -ENODEV) {
> +			drm_err(dp, "failed to populate aux bus : %d\n", ret);
> +			return ret;

return dev_err_probe().

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +		}
> +
> +		ret = rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
