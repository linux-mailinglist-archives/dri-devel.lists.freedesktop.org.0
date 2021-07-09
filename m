Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A23C2B3A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7012489F03;
	Fri,  9 Jul 2021 22:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDA589DF9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 22:13:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625868842; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kjp1JYvm5kXQWte74x+l34+qeEGYyTHyVyGsdNwZanQ=;
 b=wD48mfu5uWMkfd8SxVgllh/KZUBgNpN8Fyt/omkf391rc60cm2Ie6UeHqEUDmCc+Zp9i8kka
 g2PiObdumO4JAdQIVvOkD3Y4IQZzmgvj4ZUf3XozDBixnDF8DVh4cqlyKNZnD8zYuIjOwd0K
 77XSO5bkK72UVnNVYUOYqULSUAo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e8ca207b2963a2829c016f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:13:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F193C43460; Fri,  9 Jul 2021 22:13:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCA02C4338A;
 Fri,  9 Jul 2021 22:13:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 15:13:48 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v1 1/7] drm/msm/dsi: rename dual DSI to bonded
 DSI
In-Reply-To: <20210708122833.363451-2-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-2-dmitry.baryshkov@linaro.org>
Message-ID: <a9f3576352130d677c641e7854368e4e@codeaurora.org>
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

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> We are preparing to support two independent DSI hosts in the DSI/DPU
> code. To remove possible confusion (as both configurations can be
> referenced as dual DSI) let's rename old "dual DSI" (two DSI hosts
> driving single device, with clocks being locked) to "bonded DSI".
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Thanks for renaming this,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  8 ++--
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h     |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 30 ++++++------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 69 +++++++++++++--------------
>  4 files changed, 54 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 9b8e9b07eced..856a532850c0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -109,7 +109,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi);
> +			bool is_bonded_dsi);
>  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  				  const struct drm_display_mode *mode);
> @@ -123,7 +123,7 @@ int msm_dsi_host_set_src_pll(struct mipi_dsi_host 
> *host,
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
>  void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  	struct msm_dsi_phy_clk_request *clk_req,
> -	bool is_dual_dsi);
> +	bool is_bonded_dsi);
>  void msm_dsi_host_destroy(struct mipi_dsi_host *host);
>  int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>  					struct drm_device *dev);
> @@ -145,8 +145,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host
> *msm_host, uint64_t *iova);
>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t 
> *iova);
>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi);
> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi);
> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi);
> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct
> mipi_dsi_host *host);
>  /* dsi phy */
>  struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index ade9b609c7d9..2bce00d5a9fc 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -47,7 +47,7 @@ struct msm_dsi_host_cfg_ops {
>  	void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
>  	void (*tx_buf_put)(struct msm_dsi_host *msm_host);
>  	int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t *iova);
> -	int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi);
> +	int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi);
>  };
> 
>  struct msm_dsi_cfg_handler {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..eb988faddbbf 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -679,7 +679,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
> *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
> 
> -static u32 dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
> +static u32 dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi)
>  {
>  	struct drm_display_mode *mode = msm_host->mode;
>  	u32 pclk_rate;
> @@ -692,17 +692,17 @@ static u32 dsi_get_pclk_rate(struct msm_dsi_host
> *msm_host, bool is_dual_dsi)
>  	 * the clock rates have to be split between the two dsi controllers.
>  	 * Adjust the byte and pixel clock rates for each dsi host 
> accordingly.
>  	 */
> -	if (is_dual_dsi)
> +	if (is_bonded_dsi)
>  		pclk_rate /= 2;
> 
>  	return pclk_rate;
>  }
> 
> -static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
> +static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi)
>  {
>  	u8 lanes = msm_host->lanes;
>  	u32 bpp = dsi_get_bpp(msm_host->format);
> -	u32 pclk_rate = dsi_get_pclk_rate(msm_host, is_dual_dsi);
> +	u32 pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
>  	u64 pclk_bpp = (u64)pclk_rate * bpp;
> 
>  	if (lanes == 0) {
> @@ -720,28 +720,28 @@ static void dsi_calc_pclk(struct msm_dsi_host
> *msm_host, bool is_dual_dsi)
> 
>  }
> 
> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi)
>  {
>  	if (!msm_host->mode) {
>  		pr_err("%s: mode not set\n", __func__);
>  		return -EINVAL;
>  	}
> 
> -	dsi_calc_pclk(msm_host, is_dual_dsi);
> +	dsi_calc_pclk(msm_host, is_bonded_dsi);
>  	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>  	return 0;
>  }
> 
> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi)
>  {
>  	u32 bpp = dsi_get_bpp(msm_host->format);
>  	u64 pclk_bpp;
>  	unsigned int esc_mhz, esc_div;
>  	unsigned long byte_mhz;
> 
> -	dsi_calc_pclk(msm_host, is_dual_dsi);
> +	dsi_calc_pclk(msm_host, is_bonded_dsi);
> 
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_dual_dsi) * bpp;
> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
>  	do_div(pclk_bpp, 8);
>  	msm_host->src_clk_rate = pclk_bpp;
> 
> @@ -938,7 +938,7 @@ static void dsi_ctrl_config(struct msm_dsi_host
> *msm_host, bool enable,
>  	dsi_write(msm_host, REG_DSI_CTRL, data);
>  }
> 
> -static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
> +static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool 
> is_bonded_dsi)
>  {
>  	struct drm_display_mode *mode = msm_host->mode;
>  	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
> @@ -962,7 +962,7 @@ static void dsi_timing_setup(struct msm_dsi_host
> *msm_host, bool is_dual_dsi)
>  	 * timings have to be split between the two dsi controllers.
>  	 * Adjust the DSI host timing values accordingly.
>  	 */
> -	if (is_dual_dsi) {
> +	if (is_bonded_dsi) {
>  		h_total /= 2;
>  		hs_end /= 2;
>  		ha_start /= 2;
> @@ -2285,13 +2285,13 @@ void msm_dsi_host_reset_phy(struct 
> mipi_dsi_host *host)
> 
>  void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_clk_request *clk_req,
> -			bool is_dual_dsi)
> +			bool is_bonded_dsi)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	int ret;
> 
> -	ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_dual_dsi);
> +	ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
>  	if (ret) {
>  		pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
>  		return;
> @@ -2354,7 +2354,7 @@ static void msm_dsi_sfpb_config(struct
> msm_dsi_host *msm_host, bool enable)
> 
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
> -			bool is_dual_dsi)
> +			bool is_bonded_dsi)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> @@ -2392,7 +2392,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host 
> *host,
>  		goto fail_disable_clk;
>  	}
> 
> -	dsi_timing_setup(msm_host, is_dual_dsi);
> +	dsi_timing_setup(msm_host, is_bonded_dsi);
>  	dsi_sw_reset(msm_host);
>  	dsi_ctrl_config(msm_host, true, phy_shared_timings);
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 4ebfedc4a9ac..1173663c6d5d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -21,14 +21,14 @@
>  struct msm_dsi_manager {
>  	struct msm_dsi *dsi[DSI_MAX];
> 
> -	bool is_dual_dsi;
> +	bool is_bonded_dsi;
>  	bool is_sync_needed;
>  	int master_dsi_link_id;
>  };
> 
>  static struct msm_dsi_manager msm_dsim_glb;
> 
> -#define IS_DUAL_DSI()		(msm_dsim_glb.is_dual_dsi)
> +#define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
>  #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>  #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
> 
> @@ -42,18 +42,17 @@ static inline struct msm_dsi 
> *dsi_mgr_get_other_dsi(int id)
>  	return msm_dsim_glb.dsi[(id + 1) % DSI_MAX];
>  }
> 
> -static int dsi_mgr_parse_dual_dsi(struct device_node *np, int id)
> +static int dsi_mgr_parse_of(struct device_node *np, int id)
>  {
>  	struct msm_dsi_manager *msm_dsim = &msm_dsim_glb;
> 
>  	/* We assume 2 dsi nodes have the same information of dual-dsi and
>  	 * sync-mode, and only one node specifies master in case of dual 
> mode.
>  	 */
> -	if (!msm_dsim->is_dual_dsi)
> -		msm_dsim->is_dual_dsi = of_property_read_bool(
> -						np, "qcom,dual-dsi-mode");
> +	if (!msm_dsim->is_bonded_dsi)
> +		msm_dsim->is_bonded_dsi = of_property_read_bool(np, 
> "qcom,dual-dsi-mode");
> 
> -	if (msm_dsim->is_dual_dsi) {
> +	if (msm_dsim->is_bonded_dsi) {
>  		if (of_property_read_bool(np, "qcom,master-dsi"))
>  			msm_dsim->master_dsi_link_id = id;
>  		if (!msm_dsim->is_sync_needed)
> @@ -72,7 +71,7 @@ static int dsi_mgr_setup_components(int id)
>  	struct msm_dsi *clk_slave_dsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
>  	int ret;
> 
> -	if (!IS_DUAL_DSI()) {
> +	if (!IS_BONDED_DSI()) {
>  		ret = msm_dsi_host_register(msm_dsi->host, true);
>  		if (ret)
>  			return ret;
> @@ -119,9 +118,9 @@ static int enable_phy(struct msm_dsi *msm_dsi,
>  {
>  	struct msm_dsi_phy_clk_request clk_req;
>  	int ret;
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
> 
> -	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
> +	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_bonded_dsi);
> 
>  	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
>  	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
> @@ -143,7 +142,7 @@ dsi_mgr_phy_enable(int id,
>  	 * will silently reset those PHY1 registers. Therefore we need to 
> reset
>  	 * and enable both PHYs before any PLL clock operation.
>  	 */
> -	if (IS_DUAL_DSI() && mdsi && sdsi) {
> +	if (IS_BONDED_DSI() && mdsi && sdsi) {
>  		if (!mdsi->phy_enabled && !sdsi->phy_enabled) {
>  			msm_dsi_host_reset_phy(mdsi->host);
>  			msm_dsi_host_reset_phy(sdsi->host);
> @@ -182,7 +181,7 @@ static void dsi_mgr_phy_disable(int id)
>  	 * first controller only when the second controller is disabled.
>  	 */
>  	msm_dsi->phy_enabled = false;
> -	if (IS_DUAL_DSI() && mdsi && sdsi) {
> +	if (IS_BONDED_DSI() && mdsi && sdsi) {
>  		if (!mdsi->phy_enabled && !sdsi->phy_enabled) {
>  			msm_dsi_phy_disable(sdsi->phy);
>  			msm_dsi_phy_disable(mdsi->phy);
> @@ -244,7 +243,7 @@ static int msm_dsi_manager_panel_init(struct
> drm_connector *conn, u8 id)
>  	struct msm_dsi *master_dsi, *slave_dsi;
>  	struct drm_panel *panel;
> 
> -	if (IS_DUAL_DSI() && !IS_MASTER_DSI_LINK(id)) {
> +	if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
>  		master_dsi = other_dsi;
>  		slave_dsi = msm_dsi;
>  	} else {
> @@ -264,7 +263,7 @@ static int msm_dsi_manager_panel_init(struct
> drm_connector *conn, u8 id)
>  		return PTR_ERR(panel);
>  	}
> 
> -	if (!panel || !IS_DUAL_DSI())
> +	if (!panel || !IS_BONDED_DSI())
>  		goto out;
> 
>  	drm_object_attach_property(&conn->base,
> @@ -366,7 +365,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct drm_panel *panel = msm_dsi->panel;
>  	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
>  	int ret;
> 
>  	DBG("id=%d", id);
> @@ -374,22 +373,22 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  		return;
> 
>  	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
>  	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
>  	if (ret)
>  		goto phy_en_fail;
> 
> -	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
> is_dual_dsi);
> +	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
> is_bonded_dsi);
>  	if (ret) {
>  		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
>  		goto host_on_fail;
>  	}
> 
> -	if (is_dual_dsi && msm_dsi1) {
> +	if (is_bonded_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_on(msm_dsi1->host,
> -				&phy_shared_timings[DSI_1], is_dual_dsi);
> +				&phy_shared_timings[DSI_1], is_bonded_dsi);
>  		if (ret) {
>  			pr_err("%s: power on host1 failed, %d\n",
>  							__func__, ret);
> @@ -415,7 +414,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  		goto host_en_fail;
>  	}
> 
> -	if (is_dual_dsi && msm_dsi1) {
> +	if (is_bonded_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_enable(msm_dsi1->host);
>  		if (ret) {
>  			pr_err("%s: enable host1 failed, %d\n", __func__, ret);
> @@ -431,7 +430,7 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	if (panel)
>  		drm_panel_unprepare(panel);
>  panel_prep_fail:
> -	if (is_dual_dsi && msm_dsi1)
> +	if (is_bonded_dsi && msm_dsi1)
>  		msm_dsi_host_power_off(msm_dsi1->host);
>  host1_on_fail:
>  	msm_dsi_host_power_off(host);
> @@ -446,7 +445,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge 
> *bridge)
>  	int id = dsi_mgr_bridge_get_id(bridge);
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>  	struct drm_panel *panel = msm_dsi->panel;
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
>  	int ret;
> 
>  	DBG("id=%d", id);
> @@ -454,7 +453,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge 
> *bridge)
>  		return;
> 
>  	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
>  	if (panel) {
> @@ -471,7 +470,7 @@ static void dsi_mgr_bridge_disable(struct
> drm_bridge *bridge)
>  	int id = dsi_mgr_bridge_get_id(bridge);
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>  	struct drm_panel *panel = msm_dsi->panel;
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
>  	int ret;
> 
>  	DBG("id=%d", id);
> @@ -479,7 +478,7 @@ static void dsi_mgr_bridge_disable(struct
> drm_bridge *bridge)
>  		return;
> 
>  	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
>  	if (panel) {
> @@ -497,7 +496,7 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct drm_panel *panel = msm_dsi->panel;
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
>  	int ret;
> 
>  	DBG("id=%d", id);
> @@ -510,14 +509,14 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
>  	 * won't be diabled until both PHYs request disable.
>  	 */
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>  		goto disable_phy;
> 
>  	ret = msm_dsi_host_disable(host);
>  	if (ret)
>  		pr_err("%s: host %d disable failed, %d\n", __func__, id, ret);
> 
> -	if (is_dual_dsi && msm_dsi1) {
> +	if (is_bonded_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_disable(msm_dsi1->host);
>  		if (ret)
>  			pr_err("%s: host1 disable failed, %d\n", __func__, ret);
> @@ -537,7 +536,7 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  	if (ret)
>  		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
> 
> -	if (is_dual_dsi && msm_dsi1) {
> +	if (is_bonded_dsi && msm_dsi1) {
>  		ret = msm_dsi_host_power_off(msm_dsi1->host);
>  		if (ret)
>  			pr_err("%s: host1 power off failed, %d\n",
> @@ -556,15 +555,15 @@ static void dsi_mgr_bridge_mode_set(struct
> drm_bridge *bridge,
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>  	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>  	struct mipi_dsi_host *host = msm_dsi->host;
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
> 
>  	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
> 
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>  		return;
> 
>  	msm_dsi_host_set_display_mode(host, adjusted_mode);
> -	if (is_dual_dsi && other_dsi)
> +	if (is_bonded_dsi && other_dsi)
>  		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>  }
> 
> @@ -640,7 +639,7 @@ struct drm_connector 
> *msm_dsi_manager_connector_init(u8 id)
> 
>  bool msm_dsi_manager_validate_current_config(u8 id)
>  {
> -	bool is_dual_dsi = IS_DUAL_DSI();
> +	bool is_bonded_dsi = IS_BONDED_DSI();
> 
>  	/*
>  	 * For dual DSI, we only have one drm panel. For this
> @@ -648,7 +647,7 @@ bool msm_dsi_manager_validate_current_config(u8 id)
>  	 * Skip bridge/connector initialisation if it is
>  	 * slave-DSI for dual DSI configuration.
>  	 */
> -	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id)) {
> +	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id)) {
>  		DBG("Skip bridge registration for slave DSI->id: %d\n", id);
>  		return false;
>  	}
> @@ -809,7 +808,7 @@ int msm_dsi_manager_register(struct msm_dsi 
> *msm_dsi)
> 
>  	msm_dsim->dsi[id] = msm_dsi;
> 
> -	ret = dsi_mgr_parse_dual_dsi(msm_dsi->pdev->dev.of_node, id);
> +	ret = dsi_mgr_parse_of(msm_dsi->pdev->dev.of_node, id);
>  	if (ret) {
>  		pr_err("%s: failed to parse dual DSI info\n", __func__);
>  		goto fail;
