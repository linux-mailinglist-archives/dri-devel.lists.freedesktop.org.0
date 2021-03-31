Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868234DF0A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 05:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666A6E836;
	Tue, 30 Mar 2021 03:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF226E836
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:13:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617074038; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LQJZQkg6qUMlJnB8pRWqGFJOwNmLw7+bUYUpnLA7iq8=;
 b=D5515QP04QCvO8nBRHYknQA93Yoi7kEiHYoFVLJykmjq2ebofpyNmyzSFE9o16U2atQpCOwq
 MBgLXARSirbgTw4Y8kz5gb7tQe61r2w/lcrbIbbsmbMRsoGJKcyQdZ551PyR4s3WMlQj7gWE
 j0bg0+QTKFpbp8bfBlHcQxRHRiQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60629775c39407c32742327d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 03:13:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F89BC43461; Tue, 30 Mar 2021 03:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A955C433CA;
 Tue, 30 Mar 2021 03:13:50 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 20:13:50 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 19/25] drm/msm/dsi: drop msm_dsi_pll
 abstracton
In-Reply-To: <20210327110305.3289784-20-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-20-dmitry.baryshkov@linaro.org>
Message-ID: <3cb76a5c44611391193ff4d17c031256@codeaurora.org>
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

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Drop the struct msm_dsi_pll abstraction, by including vco's clk_hw
> directly into struct msm_dsi_phy.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/Kconfig                   |  8 --
>  drivers/gpu/drm/msm/Makefile                  |  2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 36 +++++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 66 ++++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 78 ++++++++---------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 83 ++++++++++---------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 65 ++++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 74 +++++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 23 -----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         | 44 ----------
>  10 files changed, 221 insertions(+), 258 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
>  delete mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index dabb4a1ccdcf..1f0b3f0e7149 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -76,14 +76,6 @@ config DRM_MSM_DSI
>  	  Choose this option if you have a need for MIPI DSI connector
>  	  support.
> 
> -config DRM_MSM_DSI_PLL
> -	bool "Enable DSI PLL driver in MSM DRM"
> -	depends on DRM_MSM_DSI && COMMON_CLK
> -	default y
> -	help
> -	  Choose this option to enable DSI PLL driver which provides DSI
> -	  source clocks under common clock framework.
> -
>  config DRM_MSM_DSI_28NM_PHY
>  	bool "Enable DSI 28nm PHY driver in MSM DRM"
>  	depends on DRM_MSM_DSI
> diff --git a/drivers/gpu/drm/msm/Makefile 
> b/drivers/gpu/drm/msm/Makefile
> index 1be6996b80b7..610d630326bb 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -136,6 +136,4 @@ msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += 
> dsi/phy/dsi_phy_14nm.o
>  msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
>  msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> 
> -msm-$(CONFIG_DRM_MSM_DSI_PLL) += dsi/phy/dsi_pll.o
> -
>  obj-$(CONFIG_DRM_MSM)	+= msm.o
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index fa09f4c2c071..4fe410c97d3a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -7,6 +7,7 @@
>  #define __DSI_PHY_H__
> 
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/regulator/consumer.h>
> 
>  #include "dsi.h"
> @@ -14,15 +15,6 @@
>  #define dsi_phy_read(offset) msm_readl((offset))
>  #define dsi_phy_write(offset, data) msm_writel((data), (offset))
> 
> -struct msm_dsi_pll {
> -	struct clk_hw	clk_hw;
> -	bool		pll_on;
> -
> -	const struct msm_dsi_phy_cfg *cfg;
> -};
> -
> -#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
> -
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
> @@ -107,7 +99,8 @@ struct msm_dsi_phy {
>  	enum msm_dsi_phy_usecase usecase;
>  	bool regulator_ldo_mode;
> 
> -	struct msm_dsi_pll *pll;
> +	struct clk_hw *vco_hw;
> +	bool pll_on;
> 
>  	struct clk_hw_onecell_data *provided_clocks;
> 
> @@ -127,6 +120,27 @@ int msm_dsi_dphy_timing_calc_v4(struct
> msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
>  void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 
> reg,
>  				u32 bit_mask);
> +/* PLL accessors */
> +static inline void pll_write(void __iomem *reg, u32 data)
> +{
> +	msm_writel(data, reg);
> +}
> +
> +static inline u32 pll_read(const void __iomem *reg)
> +{
> +	return msm_readl(reg);
> +}
> +
> +static inline void pll_write_udelay(void __iomem *reg, u32 data, u32 
> delay_us)
> +{
> +	pll_write(reg, data);
> +	udelay(delay_us);
> +}
> +
> +static inline void pll_write_ndelay(void __iomem *reg, u32 data, u32 
> delay_ns)
> +{
> +	pll_write((reg), data);
> +	ndelay(delay_ns);
> +}
> 
>  #endif /* __DSI_PHY_H__ */
> -
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 25fd4d860c4d..dec9beadddaa 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -7,7 +7,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/iopoll.h>
> 
> -#include "dsi_pll.h"
>  #include "dsi_phy.h"
>  #include "dsi.xml.h"
> 
> @@ -85,11 +84,13 @@ struct pll_10nm_cached_state {
>  };
> 
>  struct dsi_pll_10nm {
> -	struct msm_dsi_pll base;
> +	struct clk_hw clk_hw;
> 
>  	int id;
>  	struct platform_device *pdev;
> 
> +	struct msm_dsi_phy *phy;
> +
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
> 
> @@ -104,11 +105,10 @@ struct dsi_pll_10nm {
> 
>  	struct pll_10nm_cached_state cached_state;
> 
> -	enum msm_dsi_phy_usecase uc;
>  	struct dsi_pll_10nm *slave;
>  };
> 
> -#define to_pll_10nm(x)	container_of(x, struct dsi_pll_10nm, base)
> +#define to_pll_10nm(x)	container_of(x, struct dsi_pll_10nm, clk_hw)
> 
>  /*
>   * Global list of private DSI PLL struct pointers. We need this for 
> Dual DSI
> @@ -302,8 +302,7 @@ static void dsi_pll_commit(struct dsi_pll_10nm 
> *pll)
>  static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long 
> rate,
>  				     unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
> 
>  	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->id, rate,
>  	    parent_rate);
> @@ -390,8 +389,7 @@ static void dsi_pll_enable_global_clk(struct
> dsi_pll_10nm *pll)
> 
>  static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  	struct device *dev = &pll_10nm->pdev->dev;
>  	int rc;
> 
> @@ -422,7 +420,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw 
> *hw)
>  		goto error;
>  	}
> 
> -	pll->pll_on = true;
> +	pll_10nm->phy->pll_on = true;
> 
>  	dsi_pll_enable_global_clk(pll_10nm);
>  	if (pll_10nm->slave)
> @@ -446,8 +444,7 @@ static void dsi_pll_disable_sub(struct dsi_pll_10nm 
> *pll)
> 
>  static void dsi_pll_10nm_vco_unprepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
> 
>  	/*
>  	 * To avoid any stray glitches while abruptly powering down the PLL
> @@ -463,14 +460,13 @@ static void dsi_pll_10nm_vco_unprepare(struct 
> clk_hw *hw)
>  	}
>  	/* flush, ensure all register writes are done */
>  	wmb();
> -	pll->pll_on = false;
> +	pll_10nm->phy->pll_on = false;
>  }
> 
>  static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  	struct dsi_pll_config *config = &pll_10nm->pll_configuration;
>  	void __iomem *base = pll_10nm->mmio;
>  	u64 ref_clk = pll_10nm->vco_ref_clk_rate;
> @@ -506,8 +502,21 @@ static unsigned long
> dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
> 
> +static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
> +
> +	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
> +		return  pll_10nm->phy->cfg->min_pll_rate;
> +	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
> +		return  pll_10nm->phy->cfg->max_pll_rate;
> +	else
> +		return rate;
> +}
> +
>  static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_10nm_clk_round_rate,
>  	.set_rate = dsi_pll_10nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
>  	.prepare = dsi_pll_10nm_vco_prepare,
> @@ -520,7 +529,7 @@ static const struct clk_ops 
> clk_ops_dsi_pll_10nm_vco = {
> 
>  static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -543,7 +552,7 @@ static void dsi_10nm_save_state(struct msm_dsi_phy 
> *phy)
> 
>  static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 val;
> @@ -562,7 +571,7 @@ static int dsi_10nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw,
> pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
> +	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw,
> pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -574,16 +583,15 @@ static int dsi_10nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	return 0;
>  }
> 
> -static int dsi_pll_10nm_set_usecase(struct msm_dsi_pll *pll,
> -				    enum msm_dsi_phy_usecase uc)
> +static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->vco_hw);
>  	void __iomem *base = pll_10nm->phy_cmn_mmio;
>  	u32 data = 0x0;	/* internal PLL */
> 
>  	DBG("DSI PLL%d", pll_10nm->id);
> 
> -	switch (uc) {
> +	switch (phy->usecase) {
>  	case MSM_DSI_PHY_STANDALONE:
>  		break;
>  	case MSM_DSI_PHY_MASTER:
> @@ -599,8 +607,6 @@ static int dsi_pll_10nm_set_usecase(struct 
> msm_dsi_pll *pll,
>  	/* set PLL src */
>  	pll_write(base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, (data << 2));
> 
> -	pll_10nm->uc = uc;
> -
>  	return 0;
>  }
> 
> @@ -628,9 +634,9 @@ static int pll_10nm_register(struct dsi_pll_10nm
> *pll_10nm, struct clk_hw **prov
>  	DBG("DSI%d", pll_10nm->id);
> 
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
> -	pll_10nm->base.clk_hw.init = &vco_init;
> +	pll_10nm->clk_hw.init = &vco_init;
> 
> -	ret = devm_clk_hw_register(dev, &pll_10nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_10nm->clk_hw);
>  	if (ret)
>  		return ret;
> 
> @@ -740,7 +746,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	struct platform_device *pdev = phy->pdev;
>  	int id = phy->id;
>  	struct dsi_pll_10nm *pll_10nm;
> -	struct msm_dsi_pll *pll;
>  	int ret;
> 
>  	pll_10nm = devm_kzalloc(&pdev->dev, sizeof(*pll_10nm), GFP_KERNEL);
> @@ -767,8 +772,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	spin_lock_init(&pll_10nm->postdiv_lock);
> 
> -	pll = &pll_10nm->base;
> -	pll->cfg = phy->cfg;
> +	pll_10nm->phy = phy;
> 
>  	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -776,7 +780,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  		return ret;
>  	}
> 
> -	phy->pll = pll;
> +	phy->vco_hw = &pll_10nm->clk_hw;
> 
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_save_state(phy);
> @@ -951,7 +955,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	/* Select full-rate mode */
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
> 
> -	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_10nm_set_usecase(phy);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index c7c462bfe96d..86f9aedd790f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -8,7 +8,6 @@
>  #include <linux/delay.h>
> 
>  #include "dsi_phy.h"
> -#include "dsi_pll.h"
>  #include "dsi.xml.h"
> 
>  #define PHY_14NM_CKLN_IDX	4
> @@ -114,7 +113,7 @@ struct pll_14nm_cached_state {
>  };
> 
>  struct dsi_pll_14nm {
> -	struct msm_dsi_pll base;
> +	struct clk_hw clk_hw;
> 
>  	int id;
>  	struct platform_device *pdev;
> @@ -122,6 +121,8 @@ struct dsi_pll_14nm {
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
> 
> +	struct msm_dsi_phy *phy;
> +
>  	struct dsi_pll_input in;
>  	struct dsi_pll_output out;
> 
> @@ -133,11 +134,10 @@ struct dsi_pll_14nm {
> 
>  	struct pll_14nm_cached_state cached_state;
> 
> -	enum msm_dsi_phy_usecase uc;
>  	struct dsi_pll_14nm *slave;
>  };
> 
> -#define to_pll_14nm(x)	container_of(x, struct dsi_pll_14nm, base)
> +#define to_pll_14nm(x)	container_of(x, struct dsi_pll_14nm, clk_hw)
> 
>  /*
>   * Private struct for N1/N2 post-divider clocks. These clocks are 
> similar to
> @@ -564,8 +564,7 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm 
> *pll,
>  static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long 
> rate,
>  				     unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
>  	struct dsi_pll_input *pin = &pll_14nm->in;
>  	struct dsi_pll_output *pout = &pll_14nm->out;
> 
> @@ -600,7 +599,7 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  	 * don't lock the slave PLL. We just ensure that the PLL/PHY 
> registers
>  	 * of the master and slave are identical
>  	 */
> -	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
> +	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
>  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
> 
>  		pll_db_commit_14nm(pll_14nm_slave, pin, pout);
> @@ -614,8 +613,7 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
>  	void __iomem *base = pll_14nm->mmio;
>  	u64 vco_rate, multiplier = BIT(20);
>  	u32 div_frac_start;
> @@ -654,15 +652,14 @@ static unsigned long
> dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
> 
>  static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
>  	void __iomem *base = pll_14nm->mmio;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	bool locked;
> 
>  	DBG("");
> 
> -	if (unlikely(pll->pll_on))
> +	if (unlikely(pll_14nm->phy->pll_on))
>  		return 0;
> 
>  	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
> @@ -677,29 +674,41 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw 
> *hw)
>  	}
> 
>  	DBG("DSI PLL lock success");
> -	pll->pll_on = true;
> +	pll_14nm->phy->pll_on = true;
> 
>  	return 0;
>  }
> 
>  static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> 
>  	DBG("");
> 
> -	if (unlikely(!pll->pll_on))
> +	if (unlikely(!pll_14nm->phy->pll_on))
>  		return;
> 
>  	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
> 
> -	pll->pll_on = false;
> +	pll_14nm->phy->pll_on = false;
> +}
> +
> +static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
> +
> +	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
> +		return  pll_14nm->phy->cfg->min_pll_rate;
> +	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
> +		return  pll_14nm->phy->cfg->max_pll_rate;
> +	else
> +		return rate;
>  }
> 
>  static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_14nm_clk_round_rate,
>  	.set_rate = dsi_pll_14nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
>  	.prepare = dsi_pll_14nm_vco_prepare,
> @@ -773,7 +782,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct
> clk_hw *hw, unsigned long rate,
>  	/* If we're master in dual DSI mode, then the slave PLL's 
> post-dividers
>  	 * follow the master's post dividers
>  	 */
> -	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
> +	if (pll_14nm->phy->usecase == MSM_DSI_PHY_MASTER) {
>  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
>  		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
> 
> @@ -797,7 +806,7 @@ static const struct clk_ops 
> clk_ops_dsi_pll_14nm_postdiv = {
> 
>  static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
> @@ -810,18 +819,18 @@ static void dsi_14nm_save_state(struct 
> msm_dsi_phy *phy)
>  	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
>  	    cached_state->n1postdiv, cached_state->n2postdiv);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
>  }
> 
>  static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
>  	int ret;
> 
> -	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
> +	ret = dsi_pll_14nm_vco_set_rate(phy->vco_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
> @@ -837,7 +846,7 @@ static int dsi_14nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
> 
>  	/* also restore post-dividers for slave DSI PLL */
> -	if (pll_14nm->uc == MSM_DSI_PHY_MASTER) {
> +	if (phy->usecase == MSM_DSI_PHY_MASTER) {
>  		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
>  		void __iomem *slave_base = pll_14nm_slave->phy_cmn_mmio;
> 
> @@ -847,14 +856,13 @@ static int dsi_14nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	return 0;
>  }
> 
> -static int dsi_pll_14nm_set_usecase(struct msm_dsi_pll *pll,
> -				    enum msm_dsi_phy_usecase uc)
> +static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->vco_hw);
>  	void __iomem *base = pll_14nm->mmio;
>  	u32 clkbuflr_en, bandgap = 0;
> 
> -	switch (uc) {
> +	switch (phy->usecase) {
>  	case MSM_DSI_PHY_STANDALONE:
>  		clkbuflr_en = 0x1;
>  		break;
> @@ -874,8 +882,6 @@ static int dsi_pll_14nm_set_usecase(struct 
> msm_dsi_pll *pll,
>  	if (bandgap)
>  		pll_write(base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP, bandgap);
> 
> -	pll_14nm->uc = uc;
> -
>  	return 0;
>  }
> 
> @@ -932,9 +938,9 @@ static int pll_14nm_register(struct dsi_pll_14nm
> *pll_14nm, struct clk_hw **prov
>  	DBG("DSI%d", pll_14nm->id);
> 
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
> -	pll_14nm->base.clk_hw.init = &vco_init;
> +	pll_14nm->clk_hw.init = &vco_init;
> 
> -	ret = devm_clk_hw_register(dev, &pll_14nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_14nm->clk_hw);
>  	if (ret)
>  		return ret;
> 
> @@ -990,7 +996,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  	struct platform_device *pdev = phy->pdev;
>  	int id = phy->id;
>  	struct dsi_pll_14nm *pll_14nm;
> -	struct msm_dsi_pll *pll;
>  	int ret;
> 
>  	if (!pdev)
> @@ -1020,8 +1025,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	spin_lock_init(&pll_14nm->postdiv_lock);
> 
> -	pll = &pll_14nm->base;
> -	pll->cfg = phy->cfg;
> +	pll_14nm->phy = phy;
> 
>  	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -1029,7 +1033,7 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  		return ret;
>  	}
> 
> -	phy->pll = pll;
> +	phy->vco_hw = &pll_14nm->clk_hw;
> 
>  	return 0;
>  }
> @@ -1131,7 +1135,7 @@ static int dsi_14nm_phy_enable(struct
> msm_dsi_phy *phy, int src_pll_id,
>  				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
>  				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
> 
> -	ret = dsi_pll_14nm_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_14nm_set_usecase(phy);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index bfd110eb25fc..1b95ea75235c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -7,7 +7,6 @@
>  #include <linux/clk-provider.h>
> 
>  #include "dsi_phy.h"
> -#include "dsi_pll.h"
>  #include "dsi.xml.h"
> 
>  /*
> @@ -66,16 +65,19 @@ struct pll_28nm_cached_state {
>  };
> 
>  struct dsi_pll_28nm {
> -	struct msm_dsi_pll base;
> +	struct clk_hw clk_hw;
> 
>  	int id;
>  	struct platform_device *pdev;
> +
> +	struct msm_dsi_phy *phy;
> +
>  	void __iomem *mmio;
> 
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> -#define to_pll_28nm(x)	container_of(x, struct dsi_pll_28nm, base)
> +#define to_pll_28nm(x)	container_of(x, struct dsi_pll_28nm, clk_hw)
> 
>  static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
>  				u32 nb_tries, u32 timeout_us)
> @@ -116,8 +118,7 @@ static void pll_28nm_software_reset(struct
> dsi_pll_28nm *pll_28nm)
>  static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long 
> rate,
>  		unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	void __iomem *base = pll_28nm->mmio;
>  	unsigned long div_fbx1000, gen_vco_clk;
> @@ -210,7 +211,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
> 
>  	/* Add hardware recommended delay for correct PLL configuration */
> -	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> +	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		udelay(1000);
>  	else
>  		udelay(1);
> @@ -233,8 +234,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw
> *hw, unsigned long rate,
> 
>  static int dsi_pll_28nm_clk_is_enabled(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> 
>  	return pll_28nm_poll_for_ready(pll_28nm, POLL_MAX_READS,
>  					POLL_TIMEOUT_US);
> @@ -243,8 +243,7 @@ static int dsi_pll_28nm_clk_is_enabled(struct 
> clk_hw *hw)
>  static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  		unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	void __iomem *base = pll_28nm->mmio;
>  	u32 sdm0, doubler, sdm_byp_div;
>  	u32 sdm_dc_off, sdm_freq_seed, sdm2, sdm3;
> @@ -289,9 +288,8 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  	return vco_rate;
>  }
> 
> -static int _dsi_pll_28nm_vco_prepare_hpm(struct msm_dsi_pll *pll)
> +static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm 
> *pll_28nm)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	void __iomem *base = pll_28nm->mmio;
>  	u32 max_reads = 5, timeout_us = 100;
> @@ -366,16 +364,16 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct
> msm_dsi_pll *pll)
> 
>  static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	int i, ret;
> 
> -	if (unlikely(pll->pll_on))
> +	if (unlikely(pll_28nm->phy->pll_on))
>  		return 0;
> 
>  	for (i = 0; i < 3; i++) {
> -		ret = _dsi_pll_28nm_vco_prepare_hpm(pll);
> +		ret = _dsi_pll_28nm_vco_prepare_hpm(pll_28nm);
>  		if (!ret) {
> -			pll->pll_on = true;
> +			pll_28nm->phy->pll_on = true;
>  			return 0;
>  		}
>  	}
> @@ -385,8 +383,7 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct 
> clk_hw *hw)
> 
>  static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	void __iomem *base = pll_28nm->mmio;
>  	bool locked;
> @@ -395,7 +392,7 @@ static int dsi_pll_28nm_vco_prepare_lp(struct 
> clk_hw *hw)
> 
>  	DBG("id=%d", pll_28nm->id);
> 
> -	if (unlikely(pll->pll_on))
> +	if (unlikely(pll_28nm->phy->pll_on))
>  		return 0;
> 
>  	pll_28nm_software_reset(pll_28nm);
> @@ -428,28 +425,40 @@ static int dsi_pll_28nm_vco_prepare_lp(struct 
> clk_hw *hw)
>  	}
> 
>  	DBG("DSI PLL lock success");
> -	pll->pll_on = true;
> +	pll_28nm->phy->pll_on = true;
> 
>  	return 0;
>  }
> 
>  static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> 
>  	DBG("id=%d", pll_28nm->id);
> 
> -	if (unlikely(!pll->pll_on))
> +	if (unlikely(!pll_28nm->phy->pll_on))
>  		return;
> 
>  	pll_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
> 
> -	pll->pll_on = false;
> +	pll_28nm->phy->pll_on = false;
> +}
> +
> +static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> +
> +	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
> +		return  pll_28nm->phy->cfg->min_pll_rate;
> +	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
> +		return  pll_28nm->phy->cfg->max_pll_rate;
> +	else
> +		return rate;
>  }
> 
>  static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_28nm_clk_round_rate,
>  	.set_rate = dsi_pll_28nm_clk_set_rate,
>  	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
>  	.prepare = dsi_pll_28nm_vco_prepare_hpm,
> @@ -458,7 +467,7 @@ static const struct clk_ops 
> clk_ops_dsi_pll_28nm_vco_hpm = {
>  };
> 
>  static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_28nm_clk_round_rate,
>  	.set_rate = dsi_pll_28nm_clk_set_rate,
>  	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
>  	.prepare = dsi_pll_28nm_vco_prepare_lp,
> @@ -472,7 +481,7 @@ static const struct clk_ops 
> clk_ops_dsi_pll_28nm_vco_lp = {
> 
>  static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -481,20 +490,20 @@ static void dsi_28nm_save_state(struct 
> msm_dsi_phy *phy)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
>  	cached_state->byte_mux = pll_read(base + 
> REG_DSI_28nm_PHY_PLL_VREG_CFG);
> -	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
> -		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
> +	if (dsi_pll_28nm_clk_is_enabled(phy->vco_hw))
> +		cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
>  	else
>  		cached_state->vco_rate = 0;
>  }
> 
>  static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -527,14 +536,14 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
> 
>  	DBG("%d", pll_28nm->id);
> 
> -	if (pll_28nm->base.cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> +	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
>  	else
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
> 
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
> -	pll_28nm->base.clk_hw.init = &vco_init;
> -	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
> +	pll_28nm->clk_hw.init = &vco_init;
> +	ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
>  	if (ret)
>  		return ret;
> 
> @@ -593,7 +602,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  	struct platform_device *pdev = phy->pdev;
>  	int id = phy->id;
>  	struct dsi_pll_28nm *pll_28nm;
> -	struct msm_dsi_pll *pll;
>  	int ret;
> 
>  	if (!pdev)
> @@ -612,8 +620,7 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  		return -ENOMEM;
>  	}
> 
> -	pll = &pll_28nm->base;
> -	pll->cfg = phy->cfg;
> +	pll_28nm->phy = phy;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -621,7 +628,7 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  		return ret;
>  	}
> 
> -	phy->pll = pll;
> +	phy->vco_hw = &pll_28nm->clk_hw;
> 
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index c71c5f07666d..3e63a3b70818 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -7,7 +7,6 @@
>  #include <linux/delay.h>
> 
>  #include "dsi_phy.h"
> -#include "dsi_pll.h"
>  #include "dsi.xml.h"
> 
>  /*
> @@ -58,16 +57,19 @@ struct clk_bytediv {
>  };
> 
>  struct dsi_pll_28nm {
> -	struct msm_dsi_pll base;
> +	struct clk_hw clk_hw;
> 
>  	int id;
>  	struct platform_device *pdev;
> +
> +	struct msm_dsi_phy *phy;
> +
>  	void __iomem *mmio;
> 
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> -#define to_pll_28nm(x)	container_of(x, struct dsi_pll_28nm, base)
> +#define to_pll_28nm(x)	container_of(x, struct dsi_pll_28nm, clk_hw)
> 
>  static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
>  				    int nb_tries, int timeout_us)
> @@ -95,8 +97,7 @@ static bool pll_28nm_poll_for_ready(struct
> dsi_pll_28nm *pll_28nm,
>  static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long 
> rate,
>  				     unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	void __iomem *base = pll_28nm->mmio;
>  	u32 val, temp, fb_divider;
> 
> @@ -136,8 +137,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw
> *hw, unsigned long rate,
> 
>  static int dsi_pll_28nm_clk_is_enabled(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> 
>  	return pll_28nm_poll_for_ready(pll_28nm, POLL_MAX_READS,
>  					POLL_TIMEOUT_US);
> @@ -146,8 +146,7 @@ static int dsi_pll_28nm_clk_is_enabled(struct 
> clk_hw *hw)
>  static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	void __iomem *base = pll_28nm->mmio;
>  	unsigned long vco_rate;
>  	u32 status, fb_divider, temp, ref_divider;
> @@ -180,8 +179,7 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
> 
>  static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	void __iomem *base = pll_28nm->mmio;
>  	bool locked;
> @@ -191,7 +189,7 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw 
> *hw)
> 
>  	DBG("id=%d", pll_28nm->id);
> 
> -	if (unlikely(pll->pll_on))
> +	if (unlikely(pll_28nm->phy->pll_on))
>  		return 0;
> 
>  	/*
> @@ -222,28 +220,40 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw 
> *hw)
>  	}
> 
>  	DBG("DSI PLL lock success");
> -	pll->pll_on = true;
> +	pll_28nm->phy->pll_on = true;
> 
>  	return 0;
>  }
> 
>  static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> 
>  	DBG("id=%d", pll_28nm->id);
> 
> -	if (unlikely(!pll->pll_on))
> +	if (unlikely(!pll_28nm->phy->pll_on))
>  		return;
> 
>  	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
> 
> -	pll->pll_on = false;
> +	pll_28nm->phy->pll_on = false;
> +}
> +
> +static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> +
> +	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
> +		return  pll_28nm->phy->cfg->min_pll_rate;
> +	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
> +		return  pll_28nm->phy->cfg->max_pll_rate;
> +	else
> +		return rate;
>  }
> 
>  static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_28nm_clk_round_rate,
>  	.set_rate = dsi_pll_28nm_clk_set_rate,
>  	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
>  	.prepare = dsi_pll_28nm_vco_prepare,
> @@ -336,7 +346,7 @@ static const struct clk_ops clk_bytediv_ops = {
>   */
>  static void dsi_28nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -347,17 +357,17 @@ static void dsi_28nm_save_state(struct 
> msm_dsi_phy *phy)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
>  }
> 
>  static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->vco_hw);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -407,9 +417,9 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
>  	vco_init.name = vco_name;
> 
> -	pll_28nm->base.clk_hw.init = &vco_init;
> +	pll_28nm->clk_hw.init = &vco_init;
> 
> -	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
>  	if (ret)
>  		return ret;
> 
> @@ -450,7 +460,6 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
>  	struct platform_device *pdev = phy->pdev;
>  	int id = phy->id;
>  	struct dsi_pll_28nm *pll_28nm;
> -	struct msm_dsi_pll *pll;
>  	int ret;
> 
>  	if (!pdev)
> @@ -469,9 +478,7 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
>  		return -ENOMEM;
>  	}
> 
> -	pll = &pll_28nm->base;
> -
> -	pll->cfg = phy->cfg;
> +	pll_28nm->phy = phy;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -479,7 +486,7 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
>  		return ret;
>  	}
> 
> -	phy->pll = pll;
> +	phy->vco_hw = &pll_28nm->clk_hw;
> 
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 015e099d7b7f..c922e46f5241 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -7,7 +7,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/iopoll.h>
> 
> -#include "dsi_pll.h"
>  #include "dsi_phy.h"
>  #include "dsi.xml.h"
> 
> @@ -85,11 +84,13 @@ struct pll_7nm_cached_state {
>  };
> 
>  struct dsi_pll_7nm {
> -	struct msm_dsi_pll base;
> +	struct clk_hw clk_hw;
> 
>  	int id;
>  	struct platform_device *pdev;
> 
> +	struct msm_dsi_phy *phy;
> +
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
> 
> @@ -104,11 +105,10 @@ struct dsi_pll_7nm {
> 
>  	struct pll_7nm_cached_state cached_state;
> 
> -	enum msm_dsi_phy_usecase uc;
>  	struct dsi_pll_7nm *slave;
>  };
> 
> -#define to_pll_7nm(x)	container_of(x, struct dsi_pll_7nm, base)
> +#define to_pll_7nm(x)	container_of(x, struct dsi_pll_7nm, clk_hw)
> 
>  /*
>   * Global list of private DSI PLL struct pointers. We need this for 
> Dual DSI
> @@ -164,7 +164,7 @@ static void dsi_pll_calc_dec_frac(struct 
> dsi_pll_7nm *pll)
> 
>  	dec = div_u64(dec_multiple, multiplier);
> 
> -	if (!(pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>  		regs->pll_clock_inverters = 0x28;
>  	else if (pll_freq <= 1000000000ULL)
>  		regs->pll_clock_inverters = 0xa0;
> @@ -259,7 +259,7 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_7nm *pll)
>  	void __iomem *base = pll->mmio;
>  	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
> 
> -	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		if (pll->vco_current_rate >= 3100000000ULL)
>  			analog_controls_five_1 = 0x03;
> 
> @@ -293,9 +293,9 @@ static void dsi_pll_config_hzindep_reg(struct
> dsi_pll_7nm *pll)
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
> -		  pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> +		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> 
> -	if (pll->base.cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>  		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>  		if (pll->slave)
>  			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 
> 0x22);
> @@ -321,8 +321,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
>  static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long 
> rate,
>  				     unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> 
>  	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->id, rate,
>  	    parent_rate);
> @@ -420,8 +419,7 @@ static void dsi_pll_phy_dig_reset(struct 
> dsi_pll_7nm *pll)
> 
>  static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	int rc;
> 
>  	dsi_pll_enable_pll_bias(pll_7nm);
> @@ -444,7 +442,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw 
> *hw)
>  		goto error;
>  	}
> 
> -	pll->pll_on = true;
> +	pll_7nm->phy->pll_on = true;
> 
>  	/*
>  	 * assert power on reset for PHY digital in case the PLL is
> @@ -471,8 +469,7 @@ static void dsi_pll_disable_sub(struct dsi_pll_7nm 
> *pll)
> 
>  static void dsi_pll_7nm_vco_unprepare(struct clk_hw *hw)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> 
>  	/*
>  	 * To avoid any stray glitches while abruptly powering down the PLL
> @@ -488,14 +485,13 @@ static void dsi_pll_7nm_vco_unprepare(struct 
> clk_hw *hw)
>  	}
>  	/* flush, ensure all register writes are done */
>  	wmb();
> -	pll->pll_on = false;
> +	pll_7nm->phy->pll_on = false;
>  }
> 
>  static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
>  	void __iomem *base = pll_7nm->mmio;
>  	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
> @@ -531,8 +527,21 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
> 
> +static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
> +		unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> +
> +	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
> +		return  pll_7nm->phy->cfg->min_pll_rate;
> +	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
> +		return  pll_7nm->phy->cfg->max_pll_rate;
> +	else
> +		return rate;
> +}
> +
>  static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.round_rate = dsi_pll_7nm_clk_round_rate,
>  	.set_rate = dsi_pll_7nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
>  	.prepare = dsi_pll_7nm_vco_prepare,
> @@ -545,7 +554,7 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco 
> = {
> 
>  static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -568,7 +577,7 @@ static void dsi_7nm_save_state(struct msm_dsi_phy 
> *phy)
> 
>  static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 val;
> @@ -587,7 +596,7 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy 
> *phy)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw,
> pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
> +	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
> pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -599,16 +608,15 @@ static int dsi_7nm_restore_state(struct 
> msm_dsi_phy *phy)
>  	return 0;
>  }
> 
> -static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
> -				    enum msm_dsi_phy_usecase uc)
> +static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	void __iomem *base = pll_7nm->phy_cmn_mmio;
>  	u32 data = 0x0;	/* internal PLL */
> 
>  	DBG("DSI PLL%d", pll_7nm->id);
> 
> -	switch (uc) {
> +	switch (phy->usecase) {
>  	case MSM_DSI_PHY_STANDALONE:
>  		break;
>  	case MSM_DSI_PHY_MASTER:
> @@ -624,8 +632,6 @@ static int dsi_pll_7nm_set_usecase(struct 
> msm_dsi_pll *pll,
>  	/* set PLL src */
>  	pll_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, (data << 2));
> 
> -	pll_7nm->uc = uc;
> -
>  	return 0;
>  }
> 
> @@ -653,9 +659,9 @@ static int pll_7nm_register(struct dsi_pll_7nm
> *pll_7nm, struct clk_hw **provide
>  	DBG("DSI%d", pll_7nm->id);
> 
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
> -	pll_7nm->base.clk_hw.init = &vco_init;
> +	pll_7nm->clk_hw.init = &vco_init;
> 
> -	ret = devm_clk_hw_register(dev, &pll_7nm->base.clk_hw);
> +	ret = devm_clk_hw_register(dev, &pll_7nm->clk_hw);
>  	if (ret)
>  		return ret;
> 
> @@ -765,7 +771,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	struct platform_device *pdev = phy->pdev;
>  	int id = phy->id;
>  	struct dsi_pll_7nm *pll_7nm;
> -	struct msm_dsi_pll *pll;
>  	int ret;
> 
>  	pll_7nm = devm_kzalloc(&pdev->dev, sizeof(*pll_7nm), GFP_KERNEL);
> @@ -792,8 +797,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> 
> -	pll = &pll_7nm->base;
> -	pll->cfg = phy->cfg;
> +	pll_7nm->phy = phy;
> 
>  	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>  	if (ret) {
> @@ -801,7 +805,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  		return ret;
>  	}
> 
> -	phy->pll = pll;
> +	phy->vco_hw = &pll_7nm->clk_hw;
> 
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_save_state(phy);
> @@ -966,7 +970,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	/* Select full-rate mode */
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
> 
> -	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_7nm_set_usecase(phy);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> deleted file mode 100644
> index cae668b669a4..000000000000
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
> - */
> -
> -#include "dsi_phy.h"
> -#include "dsi_pll.h"
> -
> -/*
> - * DSI PLL Helper functions
> - */
> -long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate)
> -{
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -
> -	if      (rate < pll->cfg->min_pll_rate)
> -		return  pll->cfg->min_pll_rate;
> -	else if (rate > pll->cfg->max_pll_rate)
> -		return  pll->cfg->max_pll_rate;
> -	else
> -		return rate;
> -}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> deleted file mode 100644
> index da83e4c11f4f..000000000000
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef __DSI_PLL_H__
> -#define __DSI_PLL_H__
> -
> -#include <linux/delay.h>
> -
> -#include "dsi.h"
> -
> -static inline void pll_write(void __iomem *reg, u32 data)
> -{
> -	msm_writel(data, reg);
> -}
> -
> -static inline u32 pll_read(const void __iomem *reg)
> -{
> -	return msm_readl(reg);
> -}
> -
> -static inline void pll_write_udelay(void __iomem *reg, u32 data, u32 
> delay_us)
> -{
> -	pll_write(reg, data);
> -	udelay(delay_us);
> -}
> -
> -static inline void pll_write_ndelay(void __iomem *reg, u32 data, u32 
> delay_ns)
> -{
> -	pll_write((reg), data);
> -	ndelay(delay_ns);
> -}
> -
> -/*
> - * DSI PLL Helper functions
> - */
> -
> -/* clock callbacks */
> -long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate);
> -
> -#endif /* __DSI_PLL_H__ */
> -
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
