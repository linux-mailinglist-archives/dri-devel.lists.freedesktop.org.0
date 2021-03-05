Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3432F57B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCA66EC76;
	Fri,  5 Mar 2021 21:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661B6EC71;
 Fri,  5 Mar 2021 21:48:05 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id f33so3211774otf.11;
 Fri, 05 Mar 2021 13:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MsvaHSrA2KfcUjnv4vA6nQsXub6eBcDK5+F0v/X+u8s=;
 b=tQxDLr6XfvGe0vriTmSk86sxgiC3iayvznrxe8rKGEYZQaoTVwESDvFETJc8wWLqew
 fiXqVl3mpUBiC8TORsjECv5cgTBq7M8AvPAnUjn2JMCKNRL645MseVaBMwmqh8ZeP3MN
 4aR0NQHzX7H4WPC1H0kFCMbZZG0qwqCsPNR8/3Tc+HHUXGnPd9ib/OsZWW9ijdjigRDA
 5uaGzaTcp94bzC8Cnog7oJg3Dky9XOg7kEmrlQaFdh/S7gjP/B7rZ2PSSR9CHsudhgTS
 pIr4BIkdPkOFqwpK3EdWPfaWA8TQk1upa6iIPiY/G1Kr+QzhEHPltiDmc7EUrabwjkHB
 tqzw==
X-Gm-Message-State: AOAM533gkW0rje2Y9OfQ7RBEonqGVEuUYcFwTl0IhjoKRHzCwER7ubF3
 /2ASDackvudlh2GL9Xb6Ww==
X-Google-Smtp-Source: ABdhPJxwvimO0/dFr73Um4xDfE3xiCaxphUXwnERxN9fOcSzTunPCcRAlE4BYD5FPT58LLEl93Extg==
X-Received: by 2002:a9d:a46:: with SMTP id 64mr9514097otg.320.1614980884325;
 Fri, 05 Mar 2021 13:48:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m11sm779230oih.34.2021.03.05.13.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 13:48:03 -0800 (PST)
Received: (nullmailer pid 703721 invoked by uid 1000);
 Fri, 05 Mar 2021 21:48:02 -0000
Date: Fri, 5 Mar 2021 15:48:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Message-ID: <20210305214802.GA701567@robh.at.kernel.org>
References: <20210215162805.21481-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215162805.21481-1-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 11:27:44AM -0500, Jonathan Marek wrote:
> Add the required changes to support 7nm pll/phy in CPHY mode.
> 
> This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
> the CPHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt   |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.c                 | 12 +--
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  6 +-
>  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 49 +++++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 89 ++++++++++++++-----
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |  4 +-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  5 +-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 71 +++++++++------
>  11 files changed, 210 insertions(+), 66 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index b9a64d3ff184..7ffc86a9816b 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -124,6 +124,7 @@ Required properties:
>  Optional properties:
>  - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
>    regulator is wanted.
> +- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is wanted.

This is board or SoC dependent? The latter should be implied by an SoC 
specific compatible.

>  - qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
>  					panels in microseconds. Driver uses this number to adjust
>  					the clock rate according to the expected transfer time.
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 627048851d99..68d8547f7264 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -13,7 +13,7 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>  	return msm_dsi->encoder;
>  }
>  
> -static int dsi_get_phy(struct msm_dsi *msm_dsi)
> +static int dsi_get_phy(struct msm_dsi *msm_dsi, bool *cphy_mode)
>  {
>  	struct platform_device *pdev = msm_dsi->pdev;
>  	struct platform_device *phy_pdev;
> @@ -29,6 +29,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  	if (phy_pdev)
>  		msm_dsi->phy = platform_get_drvdata(phy_pdev);
>  
> +	*cphy_mode = of_property_read_bool(phy_node, "qcom,dsi-phy-cphy-mode");
>  	of_node_put(phy_node);
>  
>  	if (!phy_pdev || !msm_dsi->phy) {
> @@ -65,6 +66,7 @@ static void dsi_destroy(struct msm_dsi *msm_dsi)
>  static struct msm_dsi *dsi_init(struct platform_device *pdev)
>  {
>  	struct msm_dsi *msm_dsi;
> +	bool cphy_mode;
>  	int ret;
>  
>  	if (!pdev)
> @@ -79,13 +81,13 @@ static struct msm_dsi *dsi_init(struct platform_device *pdev)
>  	msm_dsi->pdev = pdev;
>  	platform_set_drvdata(pdev, msm_dsi);
>  
> -	/* Init dsi host */
> -	ret = msm_dsi_host_init(msm_dsi);
> +	/* GET dsi PHY */
> +	ret = dsi_get_phy(msm_dsi, &cphy_mode);
>  	if (ret)
>  		goto destroy_dsi;
>  
> -	/* GET dsi PHY */
> -	ret = dsi_get_phy(msm_dsi);
> +	/* Init dsi host */
> +	ret = msm_dsi_host_init(msm_dsi, cphy_mode);
>  	if (ret)
>  		goto destroy_dsi;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 78ef5d4ed922..8db4edc286ee 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -108,7 +108,7 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
>  struct msm_dsi_pll;
>  #ifdef CONFIG_DRM_MSM_DSI_PLL
>  struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
> -			enum msm_dsi_phy_type type, int dsi_id);
> +			enum msm_dsi_phy_type type, bool cphy_mode, int id);
>  void msm_dsi_pll_destroy(struct msm_dsi_pll *pll);
>  int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
> @@ -118,7 +118,7 @@ int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
>  			    enum msm_dsi_phy_usecase uc);
>  #else
>  static inline struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
> -			 enum msm_dsi_phy_type type, int id) {
> +			 enum msm_dsi_phy_type type, bool cphy_mode, int id) {
>  	return ERR_PTR(-ENODEV);
>  }
>  static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
> @@ -177,7 +177,7 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  void msm_dsi_host_destroy(struct mipi_dsi_host *host);
>  int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>  					struct drm_device *dev);
> -int msm_dsi_host_init(struct msm_dsi *msm_dsi);
> +int msm_dsi_host_init(struct msm_dsi *msm_dsi, bool cphy_mode);
>  int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..5087a65d3e11 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -621,6 +621,8 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>  	return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
>  }
>  
> +#define REG_DSI_CPHY_MODE_CTRL					0x000002d4
> +
>  #define REG_DSI_PHY_PLL_CTRL_0					0x00000200
>  #define DSI_PHY_PLL_CTRL_0_ENABLE				0x00000001
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ab281cba0f08..39346817a27a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -168,6 +168,9 @@ struct msm_dsi_host {
>  	int dlane_swap;
>  	int num_data_lanes;
>  
> +	/* from phy DT */
> +	bool cphy_mode;
> +
>  	u32 dma_cmd_ctrl_restore;
>  
>  	bool registered;
> @@ -511,6 +514,7 @@ int msm_dsi_runtime_resume(struct device *dev)
>  
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  {
> +	u32 byte_intf_rate;
>  	int ret;
>  
>  	DBG("Set clk rates: pclk=%d, byteclk=%d",
> @@ -530,8 +534,13 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	}
>  
>  	if (msm_host->byte_intf_clk) {
> -		ret = clk_set_rate(msm_host->byte_intf_clk,
> -				   msm_host->byte_clk_rate / 2);
> +		/* For CPHY, byte_intf_clk is same as byte_clk */
> +		if (msm_host->cphy_mode)
> +			byte_intf_rate = msm_host->byte_clk_rate;
> +		else
> +			byte_intf_rate = msm_host->byte_clk_rate / 2;
> +
> +		ret = clk_set_rate(msm_host->byte_intf_clk, byte_intf_rate);
>  		if (ret) {
>  			pr_err("%s: Failed to set rate byte intf clk, %d\n",
>  			       __func__, ret);
> @@ -711,7 +720,11 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>  		lanes = 1;
>  	}
>  
> -	do_div(pclk_bpp, (8 * lanes));
> +	/* CPHY "byte_clk" is in units of 16 bits */
> +	if (msm_host->cphy_mode)
> +		do_div(pclk_bpp, (16 * lanes));
> +	else
> +		do_div(pclk_bpp, (8 * lanes));
>  
>  	msm_host->pixel_clk_rate = pclk_rate;
>  	msm_host->byte_clk_rate = pclk_bpp;
> @@ -937,6 +950,9 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	data |= DSI_CTRL_ENABLE;
>  
>  	dsi_write(msm_host, REG_DSI_CTRL, data);
> +
> +	if (msm_host->cphy_mode)
> +		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>  }
>  
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
> @@ -1818,7 +1834,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>  	return -EINVAL;
>  }
>  
> -int msm_dsi_host_init(struct msm_dsi *msm_dsi)
> +int msm_dsi_host_init(struct msm_dsi *msm_dsi, bool cphy_mode)
>  {
>  	struct msm_dsi_host *msm_host = NULL;
>  	struct platform_device *pdev = msm_dsi->pdev;
> @@ -1833,6 +1849,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>  	}
>  
>  	msm_host->pdev = pdev;
> +	msm_host->cphy_mode = cphy_mode;
>  	msm_dsi->host = &msm_host->base;
>  
>  	ret = dsi_host_parse_dt(msm_host);
> @@ -2303,7 +2320,14 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>  		return;
>  	}
>  
> -	clk_req->bitclk_rate = msm_host->byte_clk_rate * 8;
> +	/* CPHY transmits 16 bits over 7 clock cycles
> +	 * "byte_clk" is in units of 16-bits (see dsi_calc_pclk),
> +	 * so multiply by 7 to get the "bitclk rate"
> +	 */
> +	if (msm_host->cphy_mode)
> +		clk_req->bitclk_rate = msm_host->byte_clk_rate * 7;
> +	else
> +		clk_req->bitclk_rate = msm_host->byte_clk_rate * 8;
>  	clk_req->escclk_rate = msm_host->esc_clk_rate;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index e8c1a727179c..c8b758ab259a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -460,6 +460,51 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>  	return 0;
>  }
>  
> +int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
> +	struct msm_dsi_phy_clk_request *clk_req)
> +{
> +	const unsigned long bit_rate = clk_req->bitclk_rate;
> +	const unsigned long esc_rate = clk_req->escclk_rate;
> +	s32 ui, ui_x7;
> +	s32 tmax, tmin;
> +	s32 coeff = 1000; /* Precision, should avoid overflow */
> +	s32 temp;
> +
> +	if (!bit_rate || !esc_rate)
> +		return -EINVAL;
> +
> +	ui = mult_frac(NSEC_PER_MSEC, coeff, bit_rate / 1000);
> +	ui_x7 = ui * 7;
> +
> +	temp = S_DIV_ROUND_UP(38 * coeff, ui_x7);
> +	tmin = max_t(s32, temp, 0);
> +	temp = (95 * coeff) / ui_x7;
> +	tmax = max_t(s32, temp, 0);
> +	timing->clk_prepare = linear_inter(tmax, tmin, 50, 0, false);
> +
> +	tmin = DIV_ROUND_UP(50 * coeff, ui_x7);
> +	tmax = 255;
> +	timing->hs_rqst = linear_inter(tmax, tmin, 1, 0, false);
> +
> +	tmin = DIV_ROUND_UP(100 * coeff, ui_x7) - 1;
> +	tmax = 255;
> +	timing->hs_exit = linear_inter(tmax, tmin, 10, 0, false);
> +
> +	tmin = 1;
> +	tmax = 32;
> +	timing->shared_timings.clk_post = linear_inter(tmax, tmin, 80, 0, false);
> +
> +	tmin = min_t(s32, 64, S_DIV_ROUND_UP(262 * coeff, ui_x7) - 1);
> +	tmax = 64;
> +	timing->shared_timings.clk_pre = linear_inter(tmax, tmin, 20, 0, false);
> +
> +	DBG("%d, %d, %d, %d, %d",
> +		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
> +		timing->clk_prepare, timing->hs_exit, timing->hs_rqst);
> +
> +	return 0;
> +}
> +
>  void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
>  				u32 bit_mask)
>  {
> @@ -683,6 +728,8 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>  
>  	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>  				"qcom,dsi-phy-regulator-ldo-mode");
> +	phy->cphy_mode = of_property_read_bool(dev->of_node,
> +				"qcom,dsi-phy-cphy-mode");
>  
>  	phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
>  	if (IS_ERR(phy->base)) {
> @@ -715,7 +762,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto fail;
>  
> -	phy->pll = msm_dsi_pll_init(pdev, phy->cfg->type, phy->id);
> +	phy->pll = msm_dsi_pll_init(pdev, phy->cfg->type, phy->cphy_mode, phy->id);
>  	if (IS_ERR_OR_NULL(phy->pll)) {
>  		DRM_DEV_INFO(dev,
>  			"%s: pll init failed: %ld, need separate pll clk driver\n",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index d2bd74b6f357..699d3d4a8ba8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -89,6 +89,7 @@ struct msm_dsi_phy {
>  
>  	enum msm_dsi_phy_usecase usecase;
>  	bool regulator_ldo_mode;
> +	bool cphy_mode;
>  
>  	struct msm_dsi_pll *pll;
>  };
> @@ -104,6 +105,8 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
>  int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
> +int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
> +				struct msm_dsi_phy_clk_request *clk_req);
>  void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
>  				u32 bit_mask);
>  int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 79c034ae075d..69291babd871 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -79,15 +79,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  	struct msm_dsi_dphy_timing *timing = &phy->timing;
>  	void __iomem *base = phy->base;
>  	bool less_than_1500_mhz;
> -	u32 vreg_ctrl_0, glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> +	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
> +	u32 glbl_pemph_ctrl_0;
> +	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>  	u32 glbl_rescode_top_ctrl, glbl_rescode_bot_ctrl;
>  	u32 data;
>  
>  	DBG("");
>  
> -	if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
> +	if (phy->cphy_mode)
> +		ret = msm_dsi_cphy_timing_calc_v4(timing, clk_req);
> +	else
> +		ret = msm_dsi_dphy_timing_calc_v4(timing, clk_req);
> +	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev,
> -			"%s: D-PHY timing calculation failed\n", __func__);
> +			"%s: PHY timing calculation failed\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -108,6 +114,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>  	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>  
> +	/* For C-PHY, no low power settings for lower clk rate */
> +	if (phy->cphy_mode)
> +		less_than_1500_mhz = false;
> +
>  	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
>  		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>  		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
> @@ -122,6 +132,17 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  		glbl_rescode_bot_ctrl = 0x3c;
>  	}
>  
> +	if (phy->cphy_mode) {
> +		vreg_ctrl_0 = 0x51;
> +		vreg_ctrl_1 = 0x55;
> +		glbl_pemph_ctrl_0 = 0x11;
> +		lane_ctrl0 = 0x17;
> +	} else {
> +		vreg_ctrl_1 = 0x5c;
> +		glbl_pemph_ctrl_0 = 0x00;
> +		lane_ctrl0 = 0x1f;
> +	}
> +
>  	/* de-assert digital and pll power down */
>  	data = BIT(6) | BIT(5);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
> @@ -142,15 +163,22 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG0, 0x21);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG1, 0x84);
>  
> +	if (phy->cphy_mode)
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_CTRL, BIT(6));
> +
>  	/* Enable LDO */
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_0, vreg_ctrl_0);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, 0x5c);
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, vreg_ctrl_1);
> +
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x00);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL,
>  		      glbl_str_swi_cal_sel_ctrl);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0,
>  		      glbl_hstx_str_ctrl_0);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0, 0x00);
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0,
> +		      glbl_pemph_ctrl_0);
> +	if (phy->cphy_mode)
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1, 0x01);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL,
>  		      glbl_rescode_top_ctrl);
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL,
> @@ -160,10 +188,11 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  	/* Remove power down from all blocks */
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x7f);
>  
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0x1f);
> +	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, lane_ctrl0);
>  
>  	/* Select full-rate mode */
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
> +	if (!phy->cphy_mode)
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
>  
>  	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
>  	if (ret) {
> @@ -173,22 +202,36 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
>  	}
>  
>  	/* DSI PHY timings */
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
> -		      timing->shared_timings.clk_pre);
> -	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
> -		      timing->shared_timings.clk_post);
> +	if (phy->cphy_mode) {
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5,
> +			timing->shared_timings.clk_pre);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->clk_prepare);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7,
> +			timing->shared_timings.clk_post);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> +	} else {
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
> +			timing->shared_timings.clk_pre);
> +		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
> +			timing->shared_timings.clk_post);
> +	}
>  
>  	/* DSI lane settings */
>  	dsi_phy_hw_v4_0_lane_settings(phy);
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> index a45fe95aff49..9ad9a8774982 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> @@ -142,7 +142,7 @@ int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
>  }
>  
>  struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
> -			enum msm_dsi_phy_type type, int id)
> +			enum msm_dsi_phy_type type, bool cphy_mode, int id)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct msm_dsi_pll *pll;
> @@ -163,7 +163,7 @@ struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
>  		break;
>  	case MSM_DSI_PHY_7NM:
>  	case MSM_DSI_PHY_7NM_V4_1:
> -		pll = msm_dsi_pll_7nm_init(pdev, id);
> +		pll = msm_dsi_pll_7nm_init(pdev, cphy_mode, id);
>  		break;
>  	default:
>  		pll = ERR_PTR(-ENXIO);
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> index 3405982a092c..d8d3e5b09053 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> @@ -117,10 +117,11 @@ msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
>  }
>  #endif
>  #ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
> -struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
> +struct msm_dsi_pll *
> +msm_dsi_pll_7nm_init(struct platform_device *pdev, bool cphy_mode, int id);
>  #else
>  static inline struct msm_dsi_pll *
> -msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
> +msm_dsi_pll_7nm_init(struct platform_device *pdev, bool cphy_mode, int id)
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 93bf142e4a4e..edc1fb491bc7 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -86,6 +86,7 @@ struct pll_7nm_cached_state {
>  
>  struct dsi_pll_7nm {
>  	struct msm_dsi_pll base;
> +	bool cphy_mode;
>  
>  	int id;
>  	struct platform_device *pdev;
> @@ -327,7 +328,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
> -	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
> +	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, pll->cphy_mode ? 0x00 : 0x10);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
>  }
>  
> @@ -668,7 +669,8 @@ static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
>  	of_clk_del_provider(dev->of_node);
>  
>  	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
> -	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
> +	if (pll_7nm->pclk_mux_hw)
> +		clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
>  	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
>  	clk_hw_unregister_fixed_factor(pll_7nm->by_2_bit_clk_hw);
>  	clk_hw_unregister_fixed_factor(pll_7nm->byte_clk_hw);
> @@ -751,7 +753,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>  
>  	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
>  	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> -					  CLK_SET_RATE_PARENT, 1, 8);
> +					  CLK_SET_RATE_PARENT, 1,
> +					  pll_7nm->cphy_mode ? 7 : 8);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
>  		goto err_bit_clk_hw;
> @@ -775,8 +778,10 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>  	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
>  	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
>  
> -	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
> -					  0, 1, 4);
> +	if (pll_7nm->cphy_mode)
> +		hw = clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 2, 7);
> +	else
> +		hw = clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 4);
>  	if (IS_ERR(hw)) {
>  		ret = PTR_ERR(hw);
>  		goto err_by_2_bit_clk_hw;
> @@ -784,27 +789,40 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>  
>  	pll_7nm->post_out_div_clk_hw = hw;
>  
> -	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->id);
> -	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
> -	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
> -	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
> -	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
> -
> -	hw = clk_hw_register_mux(dev, clk_name,
> -				 ((const char *[]){
> -				 parent, parent2, parent3, parent4
> -				 }), 4, 0, pll_7nm->phy_cmn_mmio +
> -				 REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				 0, 2, 0, NULL);
> -	if (IS_ERR(hw)) {
> -		ret = PTR_ERR(hw);
> -		goto err_post_out_div_clk_hw;
> +	/* in CPHY mode, pclk_mux will always have post_out_div as parent
> +	 * don't register a pclk_mux clock and just use post_out_div instead
> +	 */
> +	if (pll_7nm->cphy_mode) {
> +		void __iomem *base = pll_7nm->phy_cmn_mmio;
> +		u32 data;
> +
> +		data = pll_read(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		pll_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data | 3);
> +
> +		snprintf(parent, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
> +	} else {
> +		snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->id);
> +		snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
> +		snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
> +		snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
> +		snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
> +
> +		hw = clk_hw_register_mux(dev, clk_name,
> +					((const char *[]){
> +					parent, parent2, parent3, parent4
> +					}), 4, 0, pll_7nm->phy_cmn_mmio +
> +					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> +					0, 2, 0, NULL);
> +		if (IS_ERR(hw)) {
> +			ret = PTR_ERR(hw);
> +			goto err_post_out_div_clk_hw;
> +		}
> +
> +		pll_7nm->pclk_mux_hw = hw;
> +		snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
>  	}
>  
> -	pll_7nm->pclk_mux_hw = hw;
> -
>  	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->id);
> -	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
>  
>  	/* PIX CLK DIV : DIV_CTRL_7_4*/
>  	hw = clk_hw_register_divider(dev, clk_name, parent,
> @@ -835,7 +853,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>  err_dsiclk_hw:
>  	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
>  err_pclk_mux_hw:
> -	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
> +	if (pll_7nm->pclk_mux_hw)
> +		clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
>  err_post_out_div_clk_hw:
>  	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
>  err_by_2_bit_clk_hw:
> @@ -852,7 +871,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>  	return ret;
>  }
>  
> -struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
> +struct msm_dsi_pll *
> +msm_dsi_pll_7nm_init(struct platform_device *pdev, bool cphy_mode, int id)
>  {
>  	struct dsi_pll_7nm *pll_7nm;
>  	struct msm_dsi_pll *pll;
> @@ -865,6 +885,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
>  	DBG("DSI PLL%d", id);
>  
>  	pll_7nm->pdev = pdev;
> +	pll_7nm->cphy_mode = cphy_mode;
>  	pll_7nm->id = id;
>  	pll_7nm_list[id] = pll_7nm;
>  
> -- 
> 2.26.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
