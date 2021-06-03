Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1A3996C3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 02:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F8D6EEA6;
	Thu,  3 Jun 2021 00:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E0F6EEA5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 00:07:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622678871; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hNexLlHNzPD1QkobeOs9GIp/O4y0eGp99Rn2XZaTzlU=;
 b=MyA1zF227uvxWG2s3ZqPm33zWxU0mk2PN7QUBE+X3djeksiXOEELedt0P/b3ngyTeOcloBLI
 6lVA0tx84UOivw1e1uR3QgKdo9mS6MOcqDcY/emTs6nUF3wSPhYE5w6wq5xfCi/LdMXt9yno
 0QbiRQCuDRxSkp1yILMku/F3z3c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b81d55e27c0cc77f0427e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 00:07:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F35E6C43143; Thu,  3 Jun 2021 00:07:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D387C433D3;
 Thu,  3 Jun 2021 00:07:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Jun 2021 17:07:47 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: add continuous clock support for
 7nm PHY
In-Reply-To: <20210602144325.901560-1-dmitry.baryshkov@linaro.org>
References: <20210602144325.901560-1-dmitry.baryshkov@linaro.org>
Message-ID: <19daf9769bd8689964e1f4c9a25a2151@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 07:43, Dmitry Baryshkov wrote:
> Unlike previous generations, 7nm PHYs are required to collaborate with
> the host for conitnuos clock mode. Add changes neccessary to enable
> continuous clock mode in the 7nm DSI PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h             |  4 +++-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     | 15 +++++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
>  7 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7abfeab08165..c4e7cace120c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -108,7 +108,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi);
> +			bool is_dual_dsi, struct msm_dsi_phy *phy);
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
> @@ -173,6 +173,8 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> +bool msm_dsi_phy_needs_hs_phy_sel(struct msm_dsi_phy *phy);
> +void msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..b1b668ff7e10 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -511,6 +511,7 @@ static inline uint32_t
> DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
> 
>  #define REG_DSI_LANE_CTRL					0x000000a8
>  #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
> +#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
> 
>  #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
>  #define DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL__MASK			0x00000007
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 41e1d0f7ab6e..4507c16c9385 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -835,7 +835,7 @@ static inline enum dsi_cmd_dst_format 
> dsi_get_cmd_fmt(
>  }
> 
>  static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool 
> enable,
> -			struct msm_dsi_phy_shared_timings *phy_shared_timings)
> +			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct
> msm_dsi_phy *phy)
>  {
>  	u32 flags = msm_host->mode_flags;
>  	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
> @@ -930,8 +930,12 @@ static void dsi_ctrl_config(struct msm_dsi_host
> *msm_host, bool enable,
> 
>  	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>  		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
> +		if (msm_dsi_phy_needs_hs_phy_sel(phy))
> +			lane_ctrl |= DSI_LANE_CTRL_HS_REQ_SEL_PHY;
>  		dsi_write(msm_host, REG_DSI_LANE_CTRL,
>  			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
> +		if (msm_dsi_phy_needs_hs_phy_sel(phy))
cant we just check if phy->cfg->ops.set_continuous_clock is set and call 
this?
> +			msm_dsi_phy_set_continuous_clock(phy, enable);
>  	}
> 
>  	data |= DSI_CTRL_ENABLE;
> @@ -2360,7 +2364,7 @@ static void msm_dsi_sfpb_config(struct
> msm_dsi_host *msm_host, bool enable)
> 
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi)
> +			bool is_dual_dsi, struct msm_dsi_phy *phy)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> @@ -2400,7 +2404,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
> *host,
> 
>  	dsi_timing_setup(msm_host, is_dual_dsi);
>  	dsi_sw_reset(msm_host);
> -	dsi_ctrl_config(msm_host, true, phy_shared_timings);
> +	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
> 
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> @@ -2431,7 +2435,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host 
> *host)
>  		goto unlock_ret;
>  	}
> 
> -	dsi_ctrl_config(msm_host, false, NULL);
> +	dsi_ctrl_config(msm_host, false, NULL, NULL);
> 
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 0);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index e138a0c16085..082a20565886 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -382,7 +382,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
> -	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
> is_dual_dsi);
> +	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> is_dual_dsi, msm_dsi->phy);
>  	if (ret) {
>  		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>  		goto host_on_fail;
> @@ -390,7 +390,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
> 
>  	if (is_dual_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_on(msm_dsi1->host,
> -				&phy_shared_timings[DSI_1], is_dual_dsi);
> +				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi->phy);
>  		if (ret) {
>  			pr_err("%s: power on host1 failed, %d\n",
>  							__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ccbd19f7d9cf..c2c7a46463ac 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -851,6 +851,21 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
> *phy,
>  		phy->usecase = uc;
>  }
> 
> +bool msm_dsi_phy_needs_hs_phy_sel(struct msm_dsi_phy *phy)
> +{
> +	if (!phy)
> +		return false;
> +	return phy->cfg->needs_continuous_clock;
> +}

> +
> +void msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	if (!phy || !phy->cfg->ops.set_continuous_clock)
> +		return;
> +
> +	phy->cfg->ops.set_continuous_clock(phy, enable);
> +}
> +
>  int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..16d974f4d536 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_pll_state)(struct msm_dsi_phy *phy);
>  	int (*restore_pll_state)(struct msm_dsi_phy *phy);
> +	void (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
>  };
> 
>  struct msm_dsi_phy_cfg {
> @@ -38,6 +39,7 @@ struct msm_dsi_phy_cfg {
>  	const int quirks;
>  	bool has_phy_regulator;
>  	bool has_phy_lane;
> +	bool needs_continuous_clock;
>  };
> 
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..771fb31eb607 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -930,6 +930,19 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
> *phy,
>  	return 0;
>  }
> 
> +static void dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	void __iomem *base = phy->base;
> +	u32 data;
> +
> +	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
> +	if (enable)
> +		data |= BIT(5) | BIT(6);
> +	else
> +		data &= ~(BIT(5) | BIT(6));
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
> +}
> +
>  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  {
>  	void __iomem *base = phy->base;
> @@ -970,12 +983,14 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
>  	},
>  	.min_pll_rate = 600000000UL,
>  	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
>  	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
> +	.needs_continuous_clock = true,
>  };
> 
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
> @@ -992,9 +1007,11 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
we can just use set_continuous_clock check to detect the new phy 
versions, do we need another variable needs_continuous_clock?

>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
> +	.needs_continuous_clock = true,
>  };
