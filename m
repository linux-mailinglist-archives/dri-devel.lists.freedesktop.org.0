Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379E49A232
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 02:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FA610E7D7;
	Tue, 25 Jan 2022 01:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEE710E7D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 01:56:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b14so7786972ljb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XumZnCMB4R0k14jBBoNxw5hhL3IoIcFAxpFnFyRDfEk=;
 b=EtGus1Z/GBCkeyfdjSVPULA65m+1qMx8aMjQVOVp4A+K0IXaTiuKzFuMi1Wb3vmDE/
 6O6uqiX+0p0QQE31ZRWVNSLEyVVJGla9AYewxq4+iFNRh73G4bJKW2AadpZJg6BcEMpq
 Alm41kdvZxu5yS1xAu6qYKMNgg+NbuzQ2SogTbYsRcTpzaUd65NaMlfTKvCVdXgzEdBU
 +pidS5Ujz2RplkHmVJITMtZU+PPCMlbXW7HUy8STYSwUbsmTyFd8pOouZHQ9vE2Dg4KG
 L3KmrE3qTxtZaoUsi8fAu3cw0i3GPDUVBdZmycabk6nwwlq0sw0avCSUPZLhLCOZXzV8
 d9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XumZnCMB4R0k14jBBoNxw5hhL3IoIcFAxpFnFyRDfEk=;
 b=6Hvn9uBBmzvpddPXQ8EJV3gS5ZasowwRTC5H5hXYZ6Z2p3IQdxVq191dUZtBGfpYlA
 X/oTFEqzGzAJSkw/JbwUlrOXabPNxMWGkBdre4twbVAsNqMcKrzkObc4nObEDetwoy9E
 RUdsPvTxQG5UgB6uhaNqSgk6AP7l9jiEKrWCVCJjeqTzRimW/uTgcYF8z0LSP7CJRymd
 4JAPIwm9DBkUuhFb0loxSuBjUckLW4R21l8QOL3jmggY5K8ScK442dJT9CYtHtC3byAT
 RbW5dOu8eNm2NXmc6dFN+jwXlkMv79xqVY1UY5jnsGeOIRck1MzBhInRV+4XjAo4Sxet
 MKHQ==
X-Gm-Message-State: AOAM532dnf1ECi/0OPx+PzK1OrDreNK/dtpkonS+UzitbAwqgsuRY01C
 WfXhVAWsVS1BuKwcf/2gYJSQ1Q==
X-Google-Smtp-Source: ABdhPJytbIIGcWaK7gKPu6s2vuRyGpH4kx7gQHALuL4nozP2kuWdVQNGlDDyi+SNxSeHTxNJm7Oo4A==
X-Received: by 2002:a05:651c:216:: with SMTP id
 y22mr7492882ljn.143.1643075780232; 
 Mon, 24 Jan 2022 17:56:20 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g17sm822199lfr.30.2022.01.24.17.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 17:56:19 -0800 (PST)
Message-ID: <0bab02c6-a59d-d68e-392e-a72f33de3969@linaro.org>
Date: Tue, 25 Jan 2022 04:56:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v3 3/3] drm/msm/dsi: Add 10nm dsi phy tuning configuration
 support
Content-Language: en-GB
To: Rajeev Nandan <quic_rajeevny@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
 <1642538320-1127-4-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642538320-1127-4-git-send-email-quic_rajeevny@quicinc.com>
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

On 18/01/2022 23:38, Rajeev Nandan wrote:
> The clock and data lanes of the DSI PHY have a calibration circuitry
> feature. As per the MSM DSI PHY tuning guidelines, the drive strength
> tuning can be done by adjusting rescode offset for hstop/hsbot, and
> the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
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
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 97 ++++++++++++++++++++++++++++--
>   1 file changed, 91 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index d8128f5..2d225fb 100644
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
> @@ -922,6 +940,71 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
>   	DBG("DSI%d PHY disabled", phy->id);
>   }
>   
> +static int dsi_10nm_phy_parse_dt(struct msm_dsi_phy *phy)
> +{
> +	struct device *dev = &phy->pdev->dev;
> +	struct dsi_phy_10nm_tuning_cfg *tuning_cfg;
> +	u8 offset_top[DSI_LANE_MAX] = { 0 }; /* No offset */
> +	u8 offset_bot[DSI_LANE_MAX] = { 0 }; /* No offset */
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
> +	if (ret && ret != -EINVAL)
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-rescode-offset-top, %d\n", ret);
> +
> +	for (i = 0; i < DSI_LANE_MAX; i++)
> +		tuning_cfg->rescode_offset_top[i] = 0x3f & offset_top[i];

You should validate offset_top and offset_bot to be withing expected 
ranges and return an error otherwise.

> +
> +	ret = of_property_read_u8_array(dev->of_node, "qcom,phy-rescode-offset-bot",
> +					offset_bot, DSI_LANE_MAX);
> +	if (ret && ret != -EINVAL)
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-rescode-offset-bot, %d\n", ret);
> +
> +	for (i = 0; i < DSI_LANE_MAX; i++)
> +		tuning_cfg->rescode_offset_bot[i] = 0x3f & offset_bot[i];
> +
> +	/* Drive level/amplitude adjustment parameters */
> +	ret = of_property_read_u32(dev->of_node, "qcom,phy-drive-ldo-level", &ldo_level);
> +	if (ret && ret != -EINVAL)
> +		DRM_DEV_ERROR(dev, "failed to parse qcom,phy-drive-ldo-level, %d\n", ret);
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
> +		level = 1; /* 400mV */

Please change to:
dev_err(....);
return -EINVAL;

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
> @@ -936,6 +1019,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>   		.pll_init = dsi_pll_10nm_init,
>   		.save_pll_state = dsi_10nm_pll_save_state,
>   		.restore_pll_state = dsi_10nm_pll_restore_state,
> +		.parse_dt_properties = dsi_10nm_phy_parse_dt,
>   	},
>   	.min_pll_rate = 1000000000UL,
>   	.max_pll_rate = 3500000000UL,
> @@ -957,6 +1041,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
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
