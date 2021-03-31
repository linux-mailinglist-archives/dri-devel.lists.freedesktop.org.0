Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD692350614
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 20:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BC56EB3B;
	Wed, 31 Mar 2021 18:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621B8910E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 18:14:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617214443; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YMhxZY7W3t6iLu5TG0E26xWh8c8s7meHig7plGBI7Bw=;
 b=xKj9MQlbNHUvjHm97XKjCcVfKCjTnG4rtBGO+pxHrRifyGIi9sD4INB/DrQVgQcTsl+Ep7Xr
 pd1GW1Nq6SZIAskTF9wEzN9vOSH4rPztzAw/DSdVzXmO1ClEZ2Dyg5ERsz+PaJTPAHyhd/gK
 IsgYuTIl5jpzeONwe9z2snpxCpY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6064bbdf8166b7eff7d5ed3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 18:13:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3138C43465; Wed, 31 Mar 2021 18:13:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C857C433CA;
 Wed, 31 Mar 2021 18:13:48 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 31 Mar 2021 11:13:48 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 24/24] drm/msm/dsi: stop passing src_pll_id
 to the phy_enable call
In-Reply-To: <20210331105735.3690009-25-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-25-dmitry.baryshkov@linaro.org>
Message-ID: <2f8f4691e9710eabce79e3f238daa1f9@codeaurora.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-31 03:57, Dmitry Baryshkov wrote:
> Phy driver already knows the source PLL id basing on the set usecase 
> and
> the current PLL id. Stop passing it to the phy_enable call. As a
> reminder, dsi manager will always use DSI 0 as a clock master in a 
> slave
> mode, so PLL 0 is always a clocksource for DSI 0 and it is always a
> clocksource for DSI 1 too unless DSI 1 is used in the standalone mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                   |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c           | 11 +++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  2 +-
>  10 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7f99e12efd52..7abfeab08165 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -162,7 +162,7 @@ struct msm_dsi_phy_clk_request {
> 
>  void msm_dsi_phy_driver_register(void);
>  void msm_dsi_phy_driver_unregister(void);
> -int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index e116e5ff5d24..cd016576e8c5 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -114,7 +114,7 @@ static int dsi_mgr_setup_components(int id)
>  	return ret;
>  }
> 
> -static int enable_phy(struct msm_dsi *msm_dsi, int src_pll_id,
> +static int enable_phy(struct msm_dsi *msm_dsi,
>  		      struct msm_dsi_phy_shared_timings *shared_timings)
>  {
>  	struct msm_dsi_phy_clk_request clk_req;
> @@ -123,7 +123,7 @@ static int enable_phy(struct msm_dsi *msm_dsi, int
> src_pll_id,
> 
>  	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
> 
> -	ret = msm_dsi_phy_enable(msm_dsi->phy, src_pll_id, &clk_req);
> +	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
>  	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
> 
>  	return ret;
> @@ -136,7 +136,6 @@ dsi_mgr_phy_enable(int id,
>  	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>  	struct msm_dsi *mdsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
>  	struct msm_dsi *sdsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
> -	int src_pll_id = IS_DUAL_DSI() ? DSI_CLOCK_MASTER : id;
>  	int ret;
> 
>  	/* In case of dual DSI, some registers in PHY1 have been programmed
> @@ -149,11 +148,11 @@ dsi_mgr_phy_enable(int id,
>  			msm_dsi_host_reset_phy(mdsi->host);
>  			msm_dsi_host_reset_phy(sdsi->host);
> 
> -			ret = enable_phy(mdsi, src_pll_id,
> +			ret = enable_phy(mdsi,
>  					 &shared_timings[DSI_CLOCK_MASTER]);
>  			if (ret)
>  				return ret;
> -			ret = enable_phy(sdsi, src_pll_id,
> +			ret = enable_phy(sdsi,
>  					 &shared_timings[DSI_CLOCK_SLAVE]);
>  			if (ret) {
>  				msm_dsi_phy_disable(mdsi->phy);
> @@ -162,7 +161,7 @@ dsi_mgr_phy_enable(int id,
>  		}
>  	} else {
>  		msm_dsi_host_reset_phy(msm_dsi->host);
> -		ret = enable_phy(msm_dsi, src_pll_id, &shared_timings[id]);
> +		ret = enable_phy(msm_dsi, &shared_timings[id]);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 93e81bb78d26..f0a2ddf96a4b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -753,7 +753,7 @@ void __exit msm_dsi_phy_driver_unregister(void)
>  	platform_driver_unregister(&dsi_phy_platform_driver);
>  }
> 
> -int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct device *dev = &phy->pdev->dev;
> @@ -776,7 +776,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> int src_pll_id,
>  		goto reg_en_fail;
>  	}
> 
> -	ret = phy->cfg->ops.enable(phy, src_pll_id, clk_req);
> +	ret = phy->cfg->ops.enable(phy, clk_req);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: phy enable failed, %d\n", __func__, ret);
>  		goto phy_en_fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 00ef01baaebd..94a77ac364d3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -19,7 +19,7 @@
> 
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
> -	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
> +	int (*enable)(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  	void (*disable)(struct msm_dsi_phy *phy);
>  	void (*save_pll_state)(struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 64b8b0efc1a4..34bc93548fcf 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -788,7 +788,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	}
>  }
> 
> -static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>  			       struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9a2937589435..65d68eb9e3cb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -938,7 +938,7 @@ static void dsi_14nm_dphy_set_timing(struct
> msm_dsi_phy *phy,
>  		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
>  }
> 
> -static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
>  			       struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -996,7 +996,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
> 
>  	glbl_test_ctrl = dsi_phy_read(base + 
> REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
> -	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_SLAVE)
>  		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index f5b88c85a8fc..e96d789aea18 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -63,7 +63,7 @@ static void dsi_20nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
>  }
> 
> -static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -85,7 +85,7 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
> 
>  	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
> -	if (src_pll_id == DSI_1)
> +	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_STANDALONE)
>  		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 61f2f7f672ca..3304acda2165 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -698,7 +698,7 @@ static void dsi_28nm_phy_regulator_ctrl(struct
> msm_dsi_phy *phy, bool enable)
>  		dsi_28nm_phy_regulator_enable_dcdc(phy);
>  }
> 
> -static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> @@ -745,7 +745,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
> 
>  	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
> -	if (phy->id == DSI_1 && src_pll_id == DSI_0)
> +	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_SLAVE)
>  		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
>  	else
>  		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 83e275ed7476..582b1428f971 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -585,7 +585,7 @@ static void dsi_28nm_phy_lane_config(struct
> msm_dsi_phy *phy)
>  	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
>  }
> 
> -static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy, int 
> src_pll_id,
> +static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
>  				struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index dc28dd37c7f9..e76ce40a12ab 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -801,7 +801,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct
> msm_dsi_phy *phy)
>  	}
>  }
> 
> -static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
> +static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  			      struct msm_dsi_phy_clk_request *clk_req)
>  {
>  	int ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
