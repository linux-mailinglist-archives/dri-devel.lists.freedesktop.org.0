Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0509F88D8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1410E0B5;
	Fri, 20 Dec 2024 00:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h0s9cjUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA8610E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:13:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so1359984e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734653637; x=1735258437; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+t86gi9G7/Nyl3NdC1IVXRnYkcURnLh8hewaEmUmJ3Y=;
 b=h0s9cjUba8omUUXm0K2qajlmv3/BS3O/h7D/It0Md69BlzNF6oCxm7G7xglzkI/oRf
 4qj6BX1R/iTKwXVsGponuC81zRnETWT2NjDHPlJQAUZrR90aiFe5GgNw98qEch9np8JR
 ax4MrwKu59YTEicr+m3afqxOzmrRwhHiu2eiC/0USYlRJBlhnZ0rCCfJhvBUMyi6ZIRW
 N0yBbRDGV2oDC6/hl3MPnD1IMD/84zSS7+OhGdp5tnq70odiByt79HiJLTK9Bg3+QRab
 uxTxKZ2ynJrtOTByhwtS31KekYkcZ8MPk4pnr354R4lqChdXzTSAlTmJP0G0TzhJqsSt
 s4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734653637; x=1735258437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+t86gi9G7/Nyl3NdC1IVXRnYkcURnLh8hewaEmUmJ3Y=;
 b=rjh+UqxhuN7IAXqJ1NSdIaGW3qKdQ9Il7jhdOhFa4Nwm9kU5dQbh+tGBnlD8hzu2e5
 ArP/4PaMjTkHPeVpGwWRbqOHIGu0aTUm/oiuO8okYHzeBkaQFTEIcjoxHcZocFfCychg
 HaYLKLNRGu2w7SgXgnEbshK+KgOYls/lF8cEFtMRDm8WNdaBfVkaTRbqCBHX5UI7Z/mD
 GV5MzEyQBcjxy7f4UlPepU2A34+IjXXm2oU2dAVpcehiMNT8ZYqf8J5FROpMqjWas2ok
 GIPL638wo74iACfZ3UzV7spokcaJsrhbALk5CB5Vs4I3/1JrG1Z9l11+MaSJqNG9BGBF
 iUJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw538iRXlxmd8ujHBLXIdA43R+T9Z/dNhwoJcdXzJq/zRLbuu9OOLwAOStnHNQa3oRK1FkoxazlDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyjACPpoWWhRpklARLRZ/jY85/1mhGvUYp60L80Z8hWI3+bZWV
 +F5k65HRaJZ1+AOrBHJu1pk9Gcdn9WuChnQ8PAZzBS9ns4JM1PlXZPCRIYWThAo=
X-Gm-Gg: ASbGncs4ghtbMvCn8axkVaxIJAs7t65lLGU7AdAh3dTzbR0WS+d1mbi0hU24VHdILAW
 V29CTJ/l5dS3O6wF3lfCGEfdvtYjUiIZSwmDO/a2Yx+J768ex2w48I7olf2TOxU5IsapLKX/9i5
 +Vz+AKoiCMGkxdup/5g3v2sl230ijgZPc5AlLe2nMARpZKkO8ViqriSzmeX8il6lO5ilaEnJhlA
 447/yIUVjs9lbno/XlnEAviavLd1hCqPucnwJ6So9JtkxjSuLbqqzmOWiv9GxE+w6/jdXS/9JnF
 i1NeF2/NgN0zzwTKnv2AWTsHsbn2yvXLI26d
X-Google-Smtp-Source: AGHT+IF+jUkTs+trNuGfxVH/FmJYswxWVXFWxwsAch+XkSokcdZa7gP9TyRJCdDwYd2ZnKdNocqqsQ==
X-Received: by 2002:a05:6512:33cd:b0:540:358d:d9b7 with SMTP id
 2adb3069b0e04-5422957ac6cmr152434e87.52.1734653637396; 
 Thu, 19 Dec 2024 16:13:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238215b6sm308711e87.188.2024.12.19.16.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:13:56 -0800 (PST)
Date: Fri, 20 Dec 2024 02:13:53 +0200
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
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-8-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6f10d88a34c5..9429c50cc1bc 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
>  	if (dp->plat_data->power_on)
>  		dp->plat_data->power_on(dp->plat_data);
>  
> +	phy_set_mode(dp->phy, PHY_MODE_DP);
>  	phy_power_on(dp->phy);
>  
>  	analogix_dp_init_dp(dp);
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 3afc73c858c4..613ce504bea6 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -11,6 +11,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
>  
>  #include <drm/bridge/analogix_dp.h>
>  
> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
>  void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
>  {
>  	u32 reg;
> +	int ret;
>  
>  	reg = bwtype;
>  	if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
>  		writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;

Should not be necessary, you are only setting the .set_rate.

> +		phy_cfg.dp.link_rate =
> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> +		phy_cfg.dp.set_rate = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>  void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
>  {
>  	u32 reg;
> +	int ret;
>  
>  	reg = count;
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
> +		phy_cfg.dp.set_lanes = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>  void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
>  {
>  	u8 lane;
> +	int ret;
>  
>  	for (lane = 0; lane < dp->link_train.lane_count; lane++)
>  		writel(dp->link_train.training_lane[lane],
>  		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		for (lane = 0; lane < dp->link_train.lane_count; lane++) {
> +			u8 training_lane = dp->link_train.training_lane[lane];
> +			u8 vs, pe;
> +
> +			vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> +			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
> +			pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> +			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +			phy_cfg.dp.voltage[lane] = vs;
> +			phy_cfg.dp.pre[lane] = pe;
> +		}
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
> +		phy_cfg.dp.link_rate =
> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;

This two should not be necessary, please drop them.

> +		phy_cfg.dp.set_voltages = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
