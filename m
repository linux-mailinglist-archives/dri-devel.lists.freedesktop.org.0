Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17334ADF4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA26F465;
	Fri, 26 Mar 2021 17:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB396F464
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:52:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781177; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=riSIyjecugmP/H6Kzcag83kLC5rOAfyFcdE4JsfZl3Y=;
 b=GBF13c9APoZbfPn4hF8APdB65HiFBOXN5kJtWf7cnsfsJuK72ujrtwYATCF+3GYkEM5Uk4OU
 a38y0VIsw99o3epPWjBC1sD0cCOFJqd9rchR1vpEWksfV07hUzwuBx4F0vwWMKsfD0h9eSeC
 Nl2mjcXi4AYzVDeY8XSsVptK4ek=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 605e1f64197975f05e3ac3de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:52:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A1014C43461; Fri, 26 Mar 2021 17:52:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0717C433CA;
 Fri, 26 Mar 2021 17:52:35 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:52:35 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 08/28] drm/msm/dsi: drop global
 msm_dsi_phy_type enumaration
In-Reply-To: <20210324151846.2774204-9-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-9-dmitry.baryshkov@linaro.org>
Message-ID: <65d826d3c120f0395aa9a22579fee895@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> With the current upstream driver the msm_dsi_phy_type enum does not 
> make
> much sense: all DSI PHYs are probed using the dt bindings, the phy type
> is not passed between drivers. Use quirks in phy individual PHY drivers
> to differentiate minor harware differences and drop the enum.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 | 12 -----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 11 +++++-----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  2 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 19 ++++++++----------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 20 ++++++++++---------
>  8 files changed, 25 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 21cf883fb6f1..98a4b296fa30 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -23,18 +23,6 @@
>  struct msm_dsi_phy_shared_timings;
>  struct msm_dsi_phy_clk_request;
> 
> -enum msm_dsi_phy_type {
> -	MSM_DSI_PHY_28NM_HPM,
> -	MSM_DSI_PHY_28NM_LP,
> -	MSM_DSI_PHY_20NM,
> -	MSM_DSI_PHY_28NM_8960,
> -	MSM_DSI_PHY_14NM,
> -	MSM_DSI_PHY_10NM,
> -	MSM_DSI_PHY_7NM,
> -	MSM_DSI_PHY_7NM_V4_1,
> -	MSM_DSI_PHY_MAX
> -};
> -
>  enum msm_dsi_phy_usecase {
>  	MSM_DSI_PHY_STANDALONE,
>  	MSM_DSI_PHY_MASTER,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 244d2c900d40..39abb86446f9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -13,9 +13,6 @@
>  #define dsi_phy_read(offset) msm_readl((offset))
>  #define dsi_phy_write(offset, data) msm_writel((data), (offset))
> 
> -/* v3.0.0 10nm implementation that requires the old timings settings 
> */
> -#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
> -
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
> @@ -37,7 +34,6 @@ struct msm_dsi_pll_ops {
>  };
> 
>  struct msm_dsi_phy_cfg {
> -	enum msm_dsi_phy_type type;
>  	struct dsi_reg_config reg_cfg;
>  	struct msm_dsi_phy_ops ops;
>  	const struct msm_dsi_pll_ops pll_ops;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index f697ff9a0d8e..dc8ccc994759 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -59,6 +59,9 @@ struct dsi_pll_regs {
>  	u32 ssc_control;
>  };
> 
> +/* v3.0.0 10nm implementation that requires the old timings settings 
> */
> +#define DSI_PHY_10NM_QUIRK_OLD_TIMINGS	BIT(0)
> +
>  struct dsi_pll_config {
>  	u32 ref_freq;
>  	bool div_override;
> @@ -915,7 +918,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
>  	void __iomem *lane_base = phy->lane_base;
> 
> -	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
> +	if (phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)
>  		tx_dctrl[3] = 0x02;
> 
>  	/* Strength ctrl settings */
> @@ -950,7 +953,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct
> msm_dsi_phy *phy)
>  			      tx_dctrl[i]);
>  	}
> 
> -	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
> +	if (!(phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)) {
>  		/* Toggle BIT 0 to release freeze I/0 */
>  		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
>  		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
> @@ -1090,7 +1093,6 @@ static void dsi_10nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
> -	.type = MSM_DSI_PHY_10NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
> @@ -1116,7 +1118,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
> -	.type = MSM_DSI_PHY_10NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
> @@ -1139,5 +1140,5 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  	},
>  	.io_start = { 0xc994400, 0xc996400 },
>  	.num_dsi_phy = 2,
> -	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
> +	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 011d285bf2c0..d78f846cf8e4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1215,7 +1215,6 @@ static void dsi_14nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
> -	.type = MSM_DSI_PHY_14NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
> @@ -1243,7 +1242,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> -	.type = MSM_DSI_PHY_14NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index b752636f7f21..5e73f811d645 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -125,7 +125,6 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
> -	.type = MSM_DSI_PHY_20NM,
>  	.src_pll_truthtable = { {false, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index fb6e19d9495d..bb33261d606d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -40,6 +40,9 @@
>  #define DSI_BYTE_PLL_CLK		0
>  #define DSI_PIXEL_PLL_CLK		1
> 
> +/* v2.0.0 28nm LP implementation */
> +#define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
> +
>  #define LPFR_LUT_SIZE			10
>  struct lpfr_cfg {
>  	unsigned long vco_rate;
> @@ -624,14 +627,10 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_28nm->base;
>  	pll->min_rate = VCO_MIN_RATE;
>  	pll->max_rate = VCO_MAX_RATE;
> -	if (phy->cfg->type == MSM_DSI_PHY_28NM_HPM) {
> -		pll_28nm->vco_delay = 1;
> -	} else if (phy->cfg->type == MSM_DSI_PHY_28NM_LP) {
> +	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		pll_28nm->vco_delay = 1000;
> -	} else {
> -		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", 
> phy->cfg->type);
> -		return -EINVAL;
> -	}
> +	else
> +		pll_28nm->vco_delay = 1;
> 
>  	pll->cfg = phy->cfg;
> 
> @@ -706,7 +705,7 @@ static void
> dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
> 
> -	if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
> +	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
>  	else
>  		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
> @@ -791,7 +790,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
> -	.type = MSM_DSI_PHY_28NM_HPM,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
> @@ -818,7 +816,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
> -	.type = MSM_DSI_PHY_28NM_HPM,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
> @@ -845,7 +842,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
> -	.type = MSM_DSI_PHY_28NM_LP,
>  	.src_pll_truthtable = { {true, true}, {true, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
> @@ -869,5 +865,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  	},
>  	.io_start = { 0x1a98500 },
>  	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
>  };
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 08f31be3b0dc..79b0842a8dc4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -690,7 +690,6 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
> -	.type = MSM_DSI_PHY_28NM_8960,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
>  	.has_phy_regulator = true,
>  	.reg_cfg = {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 68b54e5060e4..44ae495e8fca 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -59,6 +59,9 @@ struct dsi_pll_regs {
>  	u32 ssc_control;
>  };
> 
> +/* Hardware is V4.1 */
> +#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
> +
>  struct dsi_pll_config {
>  	u32 ref_freq;
>  	bool div_override;
> @@ -178,7 +181,7 @@ static void dsi_pll_calc_dec_frac(struct 
> dsi_pll_7nm *pll)
> 
>  	dec = div_u64(dec_multiple, multiplier);
> 
> -	if (pll->base.cfg->type != MSM_DSI_PHY_7NM_V4_1)
> +	if (!(pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>  		regs->pll_clock_inverters = 0x28;
>  	else if (pll_freq <= 1000000000ULL)
>  		regs->pll_clock_inverters = 0xa0;
> @@ -273,7 +276,7 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_7nm *pll)
>  	void __iomem *base = pll->mmio;
>  	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
> 
> -	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
> +	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		if (pll->vco_current_rate >= 3100000000ULL)
>  			analog_controls_five_1 = 0x03;
> 
> @@ -307,9 +310,9 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_7nm *pll)
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
> -		  pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
> +		  pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> 
> -	if (pll->base.cfg->type == MSM_DSI_PHY_7NM_V4_1) {
> +	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>  		if (pll->slave)
>  			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 
> 0x22);
> @@ -888,7 +891,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_7nm->base;
>  	pll->min_rate = 1000000000UL;
>  	pll->max_rate = 3500000000UL;
> -	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		pll->min_rate = 600000000UL;
>  		pll->max_rate = (unsigned long)5000000000ULL;
>  		/* workaround for max rate overflowing on 32-bit builds: */
> @@ -948,7 +951,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	const u8 *tx_dctrl = tx_dctrl_0;
>  	void __iomem *lane_base = phy->lane_base;
> 
> -	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1)
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
>  		tx_dctrl = tx_dctrl_1;
> 
>  	/* Strength ctrl settings */
> @@ -1012,7 +1015,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>  	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
> 
> -	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>  		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
> @@ -1129,7 +1132,6 @@ static void dsi_7nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  }
> 
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
> -	.type = MSM_DSI_PHY_7NM_V4_1,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
> @@ -1152,10 +1154,10 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = 
> {
>  	},
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
> -	.type = MSM_DSI_PHY_7NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
>  	.has_phy_lane = true,
>  	.reg_cfg = {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
