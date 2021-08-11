Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E43E8712
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 02:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F96E063;
	Wed, 11 Aug 2021 00:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D4B6E063
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 00:13:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628640785; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Z/494PJccCYTOlJ/bn/7QtP5uBxFdSACn3ge8hoXvIw=;
 b=se2ZbzXFIyQlKW4GmDXSI+nsUSC5c19RA1GMQe7m5nwGlX+6gYM3xbWDAHsLMso6eSvjItkL
 4olhIMv6RsMmlXumg6MZ2MsVQZrLMnuyHeNMqQe7qPj0DjIPypHDLwKCt0E0y8LXYfBxIyMT
 mG+ZeUdlk9ddhZDeh0RC+d3oSd4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 611315fb66ff107904883f78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 00:12:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BA3D4C43217; Wed, 11 Aug 2021 00:12:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6608AC433D3;
 Wed, 11 Aug 2021 00:12:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Aug 2021 17:12:38 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5] drm/msm/dsi: add continuous clock support for 7nm PHY
In-Reply-To: <20210805170817.3337665-1-dmitry.baryshkov@linaro.org>
References: <20210805170817.3337665-1-dmitry.baryshkov@linaro.org>
Message-ID: <60f750e156b3b0f775e04f65d752224e@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-05 10:08, Dmitry Baryshkov wrote:
> Unlike previous generations, 7nm PHYs are required to collaborate with
> the host for conitnuos clock mode. Add changes neccessary to enable
/continuous
/necessary
> continuous clock mode in the 7nm DSI PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes since v4:
>  - Fix the comment regarding msm_dsi_phy_set_continuous_clock()
> 
> Changes since v3:
>  - Invert the DSI_LANE_CTRL_HS_REQ_SEL_PHY bit logic, as noted by
>    Abhinav.
> 
> Changes since v2:
>  - Really drop msm_dsi_phy_needs_hs_phy_sel()
> 
> Changes since v1:
>  - Remove the need for a separate msm_dsi_phy_needs_hs_phy_sel() call
>  - Fix setting continuous clock for a dual DSI case.
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h             |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  9 +++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
>  7 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b07eced..58e63bf34fe9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -109,7 +109,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi);
> +			bool is_dual_dsi, struct msm_dsi_phy *phy);
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
> @@ -175,6 +175,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy);
> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index eadbcc78fd72..473c81605054 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -518,6 +518,7 @@ static inline uint32_t
> DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
>  #define DSI_LANE_STATUS_DLN0_DIRECTION				0x00010000
> 
>  #define REG_DSI_LANE_CTRL					0x000000a8
> +#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
>  #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
> 
>  #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..3558e5cd400f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -834,7 +834,7 @@ static inline enum dsi_cmd_dst_format 
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
> @@ -929,6 +929,10 @@ static void dsi_ctrl_config(struct msm_dsi_host
> *msm_host, bool enable,
> 
>  	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>  		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
> +
> +		if (msm_dsi_phy_set_continuous_clock(phy, enable))
> +			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
> +
>  		dsi_write(msm_host, REG_DSI_LANE_CTRL,
>  			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
>  	}

While checking downstream code and the HPG, the sequence seems to be to 
program ctrl bits first
and then the PHY bits. Here its reverse. I think it should still work 
but to maintain consistency,
can we change the order here to program controller first and then call 
msm_dsi_phy_set_continuous_clock?

Unrelated to this change itself but while reviewing the sequence, I just 
observed we never clear the continuous
clk bits during disable(). In other words the disable sequence just 
clears the controller and comes out.
As a follow up, I will plan to clean up this a bit.


> @@ -2354,7 +2358,7 @@ static void msm_dsi_sfpb_config(struct
> msm_dsi_host *msm_host, bool enable)
> 
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi)
> +			bool is_dual_dsi, struct msm_dsi_phy *phy)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> @@ -2394,7 +2398,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
> *host,
> 
>  	dsi_timing_setup(msm_host, is_dual_dsi);
>  	dsi_sw_reset(msm_host);
> -	dsi_ctrl_config(msm_host, true, phy_shared_timings);
> +	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
> 
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> @@ -2425,7 +2429,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host 
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
> index 4ebfedc4a9ac..1b89fef8f805 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -381,7 +381,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	if (ret)
>  		goto phy_en_fail;
> 
> -	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
> is_dual_dsi);
> +	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> is_dual_dsi, msm_dsi->phy);
>  	if (ret) {
>  		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>  		goto host_on_fail;
> @@ -389,7 +389,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
> 
>  	if (is_dual_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_on(msm_dsi1->host,
> -				&phy_shared_timings[DSI_1], is_dual_dsi);
> +				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi1->phy);
>  		if (ret) {
>  			pr_err("%s: power on host1 failed, %d\n",
>  							__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 6ca6bfd4809b..723d2eeafa69 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -835,6 +835,15 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
> *phy,
>  		phy->usecase = uc;
>  }
> 
> +/* Returns true if we have to clear DSI_LANE_CTRL.HS_REQ_SEL_PHY */
> +bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	if (!phy || !phy->cfg->ops.set_continuous_clock)
> +		return false;
> +
> +	return phy->cfg->ops.set_continuous_clock(phy, enable);
> +}
> +
>  int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 5b0feef87127..43dee28450b4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_pll_state)(struct msm_dsi_phy *phy);
>  	int (*restore_pll_state)(struct msm_dsi_phy *phy);
> +	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
>  };
> 
>  struct msm_dsi_phy_cfg {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 7c23d4c47338..a78a0c45d101 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -932,6 +932,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
> *phy,
>  	return 0;
>  }
> 
> +static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool 
> enable)
> +{
> +	void __iomem *base = phy->base;
> +	u32 data;
> +
> +	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
Do you want to leave one blank line here?
> +	if (enable)
> +		data |= BIT(5) | BIT(6);
> +	else
> +		data &= ~(BIT(5) | BIT(6));
and here?
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
> +
> +	return enable;
> +}
> +
>  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>  {
>  	void __iomem *base = phy->base;
> @@ -972,6 +987,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
>  	},
>  	.min_pll_rate = 600000000UL,
>  #ifdef CONFIG_64BIT
> @@ -998,6 +1014,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs 
> = {
>  		.pll_init = dsi_pll_7nm_init,
>  		.save_pll_state = dsi_7nm_pll_save_state,
>  		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
