Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DED635BF4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EEB10E229;
	Wed, 23 Nov 2022 11:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEB910E22F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:41:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z4so4165459ljq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dHiine1RhDm4gP+RAeR7g29NgHCep1LPCKZEs9kQIp0=;
 b=VdLzEWk0yoD0GXZE1/ONu7+S4wxSpiSQk3pln/aXNL66PZK4SCY+q5/HyNnx1MvkVV
 wGn2acwqG2k1vzqny5h7l7Tfv39bxP8NIZcGZVUdRh1E7C4aWGvsDB1378wE1SRAI5Nn
 Y6pIapZIRe5xgJdDLn1ln0U9ky0ugZnEaecaw0eNo0DxO00qGRW5swcqiw3nsfX/e5s5
 Sl2VHGZcJbLRBJHIkf5wekGFwzEGqndtURtB1exq1scwvZdEHNnBN4Jxgz1FAklv+8gJ
 mrmUNMhlFF4ryZ0bSfhEVko/roMb6g+PBf76cSbDWl04Odh7M+gT6L2kr7HLZjKEUT6N
 jY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dHiine1RhDm4gP+RAeR7g29NgHCep1LPCKZEs9kQIp0=;
 b=RcAteUMLr4yN086nSxSGiLjRXnqutkX7BTvG/UQnkQCKx33dCltTF3HQ22fumL0ZRw
 hZV7CzuHLB0wkdlppSBCcSx27C3GtoCaXr34kXdX60t6wCDCzN5AEt/bUwb9mxpSmuJd
 uU5Cfly1QCg3WgFUSYxVyVmjT7hDipmbS9In6fmP0lPPVSGwJdg+1j2BiazyCgEJuUHN
 A/mJBKu0PftDOq95JGBIRrL5XLh3ONkX/KnRm3zFBhEdSi9eimg0CKPmVsnBjXiYMJQy
 /EcWZfLWl9p+yM5arHNMaBzXpiN3TqsHAZZyks3bQQe2kwRCYtXgKUUw7wzB5BR8SMlP
 G8ZQ==
X-Gm-Message-State: ANoB5plOLlaLZFy3OUVFjFAEdSvFpnzhUxwHun+fZqLSNbFTLWi4hQAf
 LuhZuY7JAuG0Dl626vq48GE2ag==
X-Google-Smtp-Source: AA0mqf7JqIvcQIno2S+2S/IBsNlJ2yJPfYBnjeb47asfmPsEXN9XoTmpr7ijyaGdC8o24THQAj/9+g==
X-Received: by 2002:a2e:a553:0:b0:277:665c:eb4c with SMTP id
 e19-20020a2ea553000000b00277665ceb4cmr2826919ljn.287.1669203693850; 
 Wed, 23 Nov 2022 03:41:33 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl.
 [95.49.32.48]) by smtp.gmail.com with ESMTPSA id
 t22-20020ac25496000000b004b491fe071fsm2833898lfk.36.2022.11.23.03.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:41:33 -0800 (PST)
Message-ID: <c9c07026-7f9e-6d80-0ecf-5314d67eceed@linaro.org>
Date: Wed, 23 Nov 2022 12:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 07/11] drm/msm/dsi: add support for DSI-PHY on SM8350
 and SM8450
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-8-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221122231235.3299737-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.11.2022 00:12, Dmitry Baryshkov wrote:
> SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
> with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
> variants inside the common 5+7nm driver.
> 
> Co-developed-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/Kconfig               |   6 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 119 ++++++++++++++++++++--
>  4 files changed, 118 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 3c9dfdb0b328..e7b100d97f88 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -140,12 +140,12 @@ config DRM_MSM_DSI_10NM_PHY
>  	  Choose this option if DSI PHY on SDM845 is used on the platform.
>  
>  config DRM_MSM_DSI_7NM_PHY
> -	bool "Enable DSI 7nm PHY driver in MSM DRM"
> +	bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
>  	depends on DRM_MSM_DSI
>  	default y
>  	help
> -	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
> -	  the platform.
> +	  Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
> +	  is used on the platform.
>  
>  config DRM_MSM_HDMI
>  	bool "Enable HDMI support in MSM DRM driver"
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ee6051367679..0c956fdab23e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -569,6 +569,10 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_7nm_8150_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8350",
> +	  .data = &dsi_phy_5nm_8350_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8450",
> +	  .data = &dsi_phy_5nm_8450_cfgs },
>  #endif
>  	{}
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 1096afedd616..f7a907ed2b4b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -57,6 +57,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>  
>  struct msm_dsi_dphy_timing {
>  	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 0b780f9d3d0a..7b2c16b3a36c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -39,8 +39,14 @@
>  #define VCO_REF_CLK_RATE		19200000
>  #define FRAC_BITS 18
>  
> +/* Hardware is pre V4.1 */
> +#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
>  /* Hardware is V4.1 */
> -#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
> +#define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
> +/* Hardware is V4.2 */
> +#define DSI_PHY_7NM_QUIRK_V4_2		BIT(2)
> +/* Hardware is V4.3 */
> +#define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
>  
>  struct dsi_pll_config {
>  	bool enable_ssc;
> @@ -116,7 +122,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>  	dec_multiple = div_u64(pll_freq * multiplier, divider);
>  	dec = div_u64_rem(dec_multiple, multiplier, &frac);
>  
> -	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
>  		config->pll_clock_inverters = 0x28;
>  	else if (pll_freq <= 1000000000ULL)
>  		config->pll_clock_inverters = 0xa0;
> @@ -197,16 +203,25 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>  	void __iomem *base = pll->phy->pll_base;
>  	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
>  
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>  		if (pll->vco_current_rate >= 3100000000ULL)
>  			analog_controls_five_1 = 0x03;
>  
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		if (pll->vco_current_rate < 1520000000ULL)
>  			vco_config_1 = 0x08;
>  		else if (pll->vco_current_rate < 2990000000ULL)
>  			vco_config_1 = 0x01;
>  	}
>  
> +	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) ||
> +	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
> +		if (pll->vco_current_rate < 1520000000ULL)
> +			vco_config_1 = 0x08;
> +		else if (pll->vco_current_rate >= 2990000000ULL)
> +			vco_config_1 = 0x01;
> +	}
> +
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
>  		      analog_controls_five_1);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
> @@ -231,9 +246,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
> -		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> +		  !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22);
>  
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
>  		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>  		if (pll->slave)
>  			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
> @@ -788,7 +803,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
>  	const u8 *tx_dctrl = tx_dctrl_0;
>  	void __iomem *lane_base = phy->lane_base;
>  
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
> +	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>  		tx_dctrl = tx_dctrl_1;
>  
>  	/* Strength ctrl settings */
> @@ -844,6 +859,12 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	if (dsi_phy_hw_v4_0_is_pll_on(phy))
>  		pr_warn("PLL turned on before configuring PHY\n");
>  
> +	/* Request for REFGEN READY */
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
> +		udelay(500);
> +	}
> +
>  	/* wait for REFGEN READY */
>  	ret = readl_poll_timeout_atomic(base + REG_DSI_7nm_PHY_CMN_PHY_STATUS,
>  					status, (status & BIT(0)),
> @@ -858,28 +879,46 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>  	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>  
> +	glbl_str_swi_cal_sel_ctrl = 0x00;
>  	if (phy->cphy_mode) {
>  		vreg_ctrl_0 = 0x51;
>  		vreg_ctrl_1 = 0x55;
> +		glbl_hstx_str_ctrl_0 = 0x00;
>  		glbl_pemph_ctrl_0 = 0x11;
>  		lane_ctrl0 = 0x17;
>  	} else {
> +		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  		vreg_ctrl_1 = 0x5c;
> +		glbl_hstx_str_ctrl_0 = 0x88;
>  		glbl_pemph_ctrl_0 = 0x00;
>  		lane_ctrl0 = 0x1f;
>  	}
>  
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		if (phy->cphy_mode) {
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +		} else {
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
> +		if (phy->cphy_mode) {
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +		} else {
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		if (phy->cphy_mode) {
> +			glbl_hstx_str_ctrl_0 = 0x88;
>  			glbl_rescode_top_ctrl = 0x00;
>  			glbl_rescode_bot_ctrl = 0x3c;
>  		} else {
> -			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>  			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
>  		}
> -		glbl_str_swi_cal_sel_ctrl = 0x00;
> -		glbl_hstx_str_ctrl_0 = 0x88;
>  	} else {
>  		if (phy->cphy_mode) {
>  			glbl_str_swi_cal_sel_ctrl = 0x03;
> @@ -1017,6 +1056,15 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  		pr_warn("Turning OFF PHY while PLL is on\n");
>  
>  	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
> +
> +	/* Turn off REFGEN Vote */
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
> +		wmb();
> +		/* Delay to ensure HW removes vote before PHY shut down */
> +		udelay(2);
> +	}
> +
>  	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
>  	/* disable all lanes */
> @@ -1040,6 +1088,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
>  	{ .supply = "vdds", .init_load_uA = 37550 },
>  };
>  
> +static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
> +	{ .supply = "vdds", .init_load_uA = 97800 },
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_7nm_36mA_regulators,
> @@ -1079,6 +1131,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>  	.max_pll_rate = 3500000000UL,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
>  };
>  
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
> @@ -1102,3 +1155,49 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
>  	.num_dsi_phy = 1,
>  	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_37750uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_37750uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> +};
