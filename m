Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E94A4CC1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 18:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC96110E151;
	Mon, 31 Jan 2022 17:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401C10E151
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 17:08:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a25so20285414lji.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 09:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/EaEyhzCIbFmfpodVJ7dpacp2ypf7n4AgPuvkTEGOOY=;
 b=tUT4f9kYXLCkyG9XMROhPCHEj/blRGVVztFd+cV7Mx2DGtlcl8PBHZslsSYiO6TwmQ
 e4D7YIygY66wgIphUWZBHxKmZs6LURwhSHNGVWYIHWSMasjL5bUGfInGWWPQhKPY9W6z
 tQUJBeM+P3Yju8UJEvN5XiSZhNRXjccyLleTpYn0ipKdIXeORBzaExfcb0PgoVef2+om
 KGVNrAo6flepE1iE0JgLQw0l9CXpjUdLUMzV0/wfilFsqhvjOi/OeHjnzljdIhfaDlO2
 EPTgGcZOmoc9tsKYwqzYJTeMnyIDifwgAlN9JQQ7MbU9Zx66FuKRi1T6swFVOOzoi0gc
 482g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/EaEyhzCIbFmfpodVJ7dpacp2ypf7n4AgPuvkTEGOOY=;
 b=yARSZem7I5uTo9cziCezhKOKe8Rr4c9JgYr+XvoAoY0pFEJ5oPH5kPvNiF/9q8uUBa
 NQp4W6wUhTTL55zp2+/HBVFganCFBrI4KKy/F1+xQLal38pPfxqW4FTwjno6kZSAppXM
 /BILVR0i+LQsZMwxRBDFIoXp+gu2rGdoJuUO02vmgJeqaZDYGj8tmuQHOTKpZYJKx5rd
 jy2Xwd/FsujjcTUaGbb0gLCazBrYZNmJlN7vU2nfdHuUNFf0DA4NcCvDHZL8Vt3jp5vG
 JWevgzTpcEHQcUZm3+GPWgeUrXNXLHnvyN7ZQYnVhIXYZUKc/Ec2981IamLDaPYB80nS
 Z7ow==
X-Gm-Message-State: AOAM531omJfGes1S8Rl0BrCE4ckKLvbFSjWvh0qf4KyB3fyGzkl3rOOT
 mH/kFJapSEybX004CF6ugF+T3g==
X-Google-Smtp-Source: ABdhPJzmrb4zy6Nh2fq3C0Gxf2HNJj9/nitZcM9OhiZ9fF07QxAg1rXwYAgYRfxqDdzLQA/Cxlb48g==
X-Received: by 2002:a2e:3509:: with SMTP id z9mr14239807ljz.488.1643648887038; 
 Mon, 31 Jan 2022 09:08:07 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f11sm2799798lfg.132.2022.01.31.09.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 09:08:06 -0800 (PST)
Message-ID: <29240a62-c498-0fe6-221f-64177750ac35@linaro.org>
Date: Mon, 31 Jan 2022 20:08:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v5 3/3] drm/msm/dsi: Add 10nm dsi phy tuning configuration
 support
Content-Language: en-GB
To: Rajeev Nandan <quic_rajeevny@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1643573719-32095-1-git-send-email-quic_rajeevny@quicinc.com>
 <1643573719-32095-4-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1643573719-32095-4-git-send-email-quic_rajeevny@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2022 23:15, Rajeev Nandan wrote:
> The clock and data lanes of the DSI PHY have a calibration circuitry
> feature. As per the MSM DSI PHY tuning guidelines, the drive strength
> tuning can be done by adjusting rescode offset for hstop/hsbot, and
> the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes in v2:
>   - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
>   - Fix the backward compatibility (Dmitry Baryshkov)
> 
> Changes in v3:
>   - Address comments for phy tuning data structure (Dmitry Baryshkov)
>   - Make changes as per updated dt-bindings
> 
> Changes in v4:
>   - Return error in case of out of range values (Dmitry Baryshkov)
>   - Return error if dt property is present but parsing is failing
> 
> Changes in v5:
>   - Added missing printk arg ldo_level
> 
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 118 +++++++++++++++++++++++++++--
>   1 file changed, 112 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index d8128f5..86a6954 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -83,6 +83,18 @@ struct dsi_pll_10nm {
>   
>   #define to_pll_10nm(x)	container_of(x, struct dsi_pll_10nm, clk_hw)
>   
> +/**
> + * struct dsi_phy_10nm_tuning_cfg - Holds 10nm PHY tuning config parameters.
> + * @rescode_offset_top: Offset for pull-up legs rescode.
> + * @rescode_offset_bot: Offset for pull-down legs rescode.
> + * @vreg_ctrl: vreg ctrl to drive LDO level
> + */
> +struct dsi_phy_10nm_tuning_cfg {
> +	u8 rescode_offset_top[DSI_LANE_MAX];
> +	u8 rescode_offset_bot[DSI_LANE_MAX];
> +	u8 vreg_ctrl;
> +};
> +
>   /*
>    * Global list of private DSI PLL struct pointers. We need this for bonded DSI
>    * mode, where the master PLL's clk_ops needs access the slave's private data
> @@ -747,6 +759,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
>   	int i;
>   	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
>   	void __iomem *lane_base = phy->lane_base;
> +	struct dsi_phy_10nm_tuning_cfg *tuning_cfg = phy->tuning_cfg;
>   
>   	if (phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)
>   		tx_dctrl[3] = 0x02;
> @@ -775,10 +788,13 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
>   		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG2(i), 0x0);
>   		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG3(i),
>   			      i == 4 ? 0x80 : 0x0);
> -		dsi_phy_write(lane_base +
> -			      REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
> -		dsi_phy_write(lane_base +
> -			      REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
> +
> +		/* platform specific dsi phy drive strength adjustment */
> +		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i),
> +				tuning_cfg->rescode_offset_top[i]);
> +		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i),
> +				tuning_cfg->rescode_offset_bot[i]);
> +
>   		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i),
>   			      tx_dctrl[i]);
>   	}
> @@ -799,6 +815,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>   	u32 const timeout_us = 1000;
>   	struct msm_dsi_dphy_timing *timing = &phy->timing;
>   	void __iomem *base = phy->base;
> +	struct dsi_phy_10nm_tuning_cfg *tuning_cfg = phy->tuning_cfg;
>   	u32 data;
>   
>   	DBG("");
> @@ -834,8 +851,9 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>   	/* Select MS1 byte-clk */
>   	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL, 0x10);
>   
> -	/* Enable LDO */
> -	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
> +	/* Enable LDO with platform specific drive level/amplitude adjustment */
> +	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL,
> +		      tuning_cfg->vreg_ctrl);
>   
>   	/* Configure PHY lane swap (TODO: we need to calculate this) */
>   	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG0, 0x21);
> @@ -922,6 +940,92 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
>   	DBG("DSI%d PHY disabled", phy->id);
>   }
>   
> +static int dsi_10nm_phy_parse_dt(struct msm_dsi_phy *phy)
> +{
> +	struct device *dev = &phy->pdev->dev;
> +	struct dsi_phy_10nm_tuning_cfg *tuning_cfg;
> +	s8 offset_top[DSI_LANE_MAX] = { 0 }; /* No offset */
> +	s8 offset_bot[DSI_LANE_MAX] = { 0 }; /* No offset */
> +	u32 ldo_level = 400; /* 400mV */
> +	u8 level;
> +	int ret, i;
> +
> +	tuning_cfg = devm_kzalloc(dev, sizeof(*tuning_cfg), GFP_KERNEL);
> +	if (!tuning_cfg)
> +		return -ENOMEM;
> +
> +	/* Drive strength adjustment parameters */
> +	ret = of_property_read_u8_array(dev->of_node, "qcom,phy-rescode-offset-top",
> +					offset_top, DSI_LANE_MAX);
> +	if (ret && ret != -EINVAL) {
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-rescode-offset-top, %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < DSI_LANE_MAX; i++) {
> +		if (offset_top[i] < -32 || offset_top[i] > 31) {
> +			DRM_DEV_ERROR(dev,
> +				"qcom,phy-rescode-offset-top value %d is not in range [-32..31]\n",
> +				offset_top[i]);
> +			return -EINVAL;
> +		}
> +		tuning_cfg->rescode_offset_top[i] = 0x3f & offset_top[i];
> +	}
> +
> +	ret = of_property_read_u8_array(dev->of_node, "qcom,phy-rescode-offset-bot",
> +					offset_bot, DSI_LANE_MAX);
> +	if (ret && ret != -EINVAL) {
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-rescode-offset-bot, %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < DSI_LANE_MAX; i++) {
> +		if (offset_bot[i] < -32 || offset_bot[i] > 31) {
> +			DRM_DEV_ERROR(dev,
> +				"qcom,phy-rescode-offset-bot value %d is not in range [-32..31]\n",
> +				offset_bot[i]);
> +			return -EINVAL;
> +		}
> +		tuning_cfg->rescode_offset_bot[i] = 0x3f & offset_bot[i];
> +	}
> +
> +	/* Drive level/amplitude adjustment parameters */
> +	ret = of_property_read_u32(dev->of_node, "qcom,phy-drive-ldo-level", &ldo_level);
> +	if (ret && ret != -EINVAL) {
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-drive-ldo-level, %d\n", ret);
> +		return ret;
> +	}
> +
> +	switch (ldo_level) {
> +	case 375:
> +		level = 0;
> +		break;
> +	case 400:
> +		level = 1;
> +		break;
> +	case 425:
> +		level = 2;
> +		break;
> +	case 450:
> +		level = 3;
> +		break;
> +	case 475:
> +		level = 4;
> +		break;
> +	case 500:
> +		level = 5;
> +		break;
> +	default:
> +		DRM_DEV_ERROR(dev, "qcom,phy-drive-ldo-level %d is not supported\n", ldo_level);
> +		return -EINVAL;
> +	}
> +	tuning_cfg->vreg_ctrl = 0x58 | (0x7 & level);
> +
> +	phy->tuning_cfg = tuning_cfg;
> +
> +	return 0;
> +}
> +
>   const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>   	.has_phy_lane = true,
>   	.reg_cfg = {
> @@ -936,6 +1040,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>   		.pll_init = dsi_pll_10nm_init,
>   		.save_pll_state = dsi_10nm_pll_save_state,
>   		.restore_pll_state = dsi_10nm_pll_restore_state,
> +		.parse_dt_properties = dsi_10nm_phy_parse_dt,
>   	},
>   	.min_pll_rate = 1000000000UL,
>   	.max_pll_rate = 3500000000UL,
> @@ -957,6 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
>   		.pll_init = dsi_pll_10nm_init,
>   		.save_pll_state = dsi_10nm_pll_save_state,
>   		.restore_pll_state = dsi_10nm_pll_restore_state,
> +		.parse_dt_properties = dsi_10nm_phy_parse_dt,
>   	},
>   	.min_pll_rate = 1000000000UL,
>   	.max_pll_rate = 3500000000UL,


-- 
With best wishes
Dmitry
