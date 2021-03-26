Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C434ADDB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7986F45D;
	Fri, 26 Mar 2021 17:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDEC6F45D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:49:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616780989; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=szLZd4PaaKcJkgsuGnwUHE1bhi1VZfGZkdhnZfakR68=;
 b=AZU99L7GCoevxnZNCz36ZtEayI702HkDLEhWGPRk+X1ABXjXxX4C/i5uxBshUKy+g7OTZJIy
 a6+BR+oxiYb2p7e0t3MwhdO1fHwOWmP6mm6mt7Wa1JxqdSJw5MbHO1Hk2crzZHW5g3MgFfEo
 Dt+OzPxIoYBisSEphjKoUo2NkoQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 605e1eae87ce1fbb560d54be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:49:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5DA4C43465; Fri, 26 Mar 2021 17:49:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EF99C433C6;
 Fri, 26 Mar 2021 17:49:32 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:49:32 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 06/28] drm/msm/dsi: drop multiple pll
 enable_seq support
In-Reply-To: <20210324151846.2774204-7-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-7-dmitry.baryshkov@linaro.org>
Message-ID: <c396bdee67acbf0f7f6be3d75be6d3a7@codeaurora.org>
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
> The only PLL using multiple enable sequences is the 28nm PLL, which 
> just
> does the single step in the loop. Push that support back into the PLL
> code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  3 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 23 +++++--
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  3 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 65 +++++++------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 +-
>  5 files changed, 42 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 6a63901da7a4..4386edfa91fe 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1087,8 +1087,7 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct
> platform_device *pdev, int id)
> 
>  	pll_14nm->vco_delay = 1;
> 
> -	pll->en_seq_cnt = 1;
> -	pll->enable_seqs[0] = dsi_pll_14nm_enable_seq;
> +	pll->enable_seq = dsi_pll_14nm_enable_seq;
> 
>  	ret = pll_14nm_register(pll_14nm);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 2f502efa4dd5..760cf7956fa2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -311,7 +311,7 @@ static const struct clk_ops 
> clk_ops_dsi_pll_28nm_vco = {
>  /*
>   * PLL Callbacks
>   */
> -static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
> +static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
>  	struct device *dev = &pll_28nm->pdev->dev;
> @@ -386,6 +386,19 @@ static int dsi_pll_28nm_enable_seq_hpm(struct
> msm_dsi_pll *pll)
>  	return locked ? 0 : -EINVAL;
>  }
> 
> +static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < 3; i++) {
> +		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	return ret;
> +}
> +
>  static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> @@ -619,15 +632,11 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct
> platform_device *pdev,
>  	if (type == MSM_DSI_PHY_28NM_HPM) {
>  		pll_28nm->vco_delay = 1;
> 
> -		pll->en_seq_cnt = 3;
> -		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_hpm;
> -		pll->enable_seqs[1] = dsi_pll_28nm_enable_seq_hpm;
> -		pll->enable_seqs[2] = dsi_pll_28nm_enable_seq_hpm;
> +		pll->enable_seq = dsi_pll_28nm_enable_seq_hpm;
>  	} else if (type == MSM_DSI_PHY_28NM_LP) {
>  		pll_28nm->vco_delay = 1000;
> 
> -		pll->en_seq_cnt = 1;
> -		pll->enable_seqs[0] = dsi_pll_28nm_enable_seq_lp;
> +		pll->enable_seq = dsi_pll_28nm_enable_seq_lp;
>  	} else {
>  		DRM_DEV_ERROR(&pdev->dev, "phy type (%d) is not 28nm\n", type);
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 4a40513057e8..2cfb7edf91d8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -515,8 +515,7 @@ struct msm_dsi_pll
> *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
>  	pll->save_state = dsi_pll_28nm_save_state;
>  	pll->restore_state = dsi_pll_28nm_restore_state;
> 
> -	pll->en_seq_cnt = 1;
> -	pll->enable_seqs[0] = dsi_pll_28nm_enable_seq;
> +	pll->enable_seq = dsi_pll_28nm_enable_seq;
> 
>  	ret = pll_28nm_register(pll_28nm);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index 3dc65877fa10..9e9fa90bf504 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -5,46 +5,6 @@
> 
>  #include "dsi_pll.h"
> 
> -static int dsi_pll_enable(struct msm_dsi_pll *pll)
> -{
> -	int i, ret = 0;
> -
> -	/*
> -	 * Certain PLLs do not allow VCO rate update when it is on.
> -	 * Keep track of their status to turn on/off after set rate success.
> -	 */
> -	if (unlikely(pll->pll_on))
> -		return 0;
> -
> -	/* Try all enable sequences until one succeeds */
> -	for (i = 0; i < pll->en_seq_cnt; i++) {
> -		ret = pll->enable_seqs[i](pll);
> -		DBG("DSI PLL %s after sequence #%d",
> -			ret ? "unlocked" : "locked", i + 1);
> -		if (!ret)
> -			break;
> -	}
> -
> -	if (ret) {
> -		DRM_ERROR("DSI PLL failed to lock\n");
> -		return ret;
> -	}
> -
> -	pll->pll_on = true;
> -
> -	return 0;
> -}
> -
> -static void dsi_pll_disable(struct msm_dsi_pll *pll)
> -{
> -	if (unlikely(!pll->pll_on))
> -		return;
> -
> -	pll->disable_seq(pll);
> -
> -	pll->pll_on = false;
> -}
> -
>  /*
>   * DSI PLL Helper functions
>   */
> @@ -64,15 +24,36 @@ long msm_dsi_pll_helper_clk_round_rate(struct 
> clk_hw *hw,
>  int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
>  {
>  	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	int ret = 0;
> 
> -	return dsi_pll_enable(pll);
> +	/*
> +	 * Certain PLLs do not allow VCO rate update when it is on.
> +	 * Keep track of their status to turn on/off after set rate success.
> +	 */
> +	if (unlikely(pll->pll_on))
> +		return 0;
> +
> +	ret = pll->enable_seq(pll);
> +	if (ret) {
> +		DRM_ERROR("DSI PLL failed to lock\n");
> +		return ret;
> +	}
> +
> +	pll->pll_on = true;
> +
> +	return 0;
>  }
> 
>  void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
>  {
>  	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> 
> -	dsi_pll_disable(pll);
> +	if (unlikely(!pll->pll_on))
> +		return;
> +
> +	pll->disable_seq(pll);
> +
> +	pll->pll_on = false;
>  }
> 
>  void msm_dsi_pll_helper_unregister_clks(struct platform_device *pdev,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index bbecb1de5678..eebf90671eec 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -12,7 +12,6 @@
>  #include "dsi.h"
> 
>  #define NUM_DSI_CLOCKS_MAX	6
> -#define MAX_DSI_PLL_EN_SEQS	10
> 
>  struct msm_dsi_pll {
>  	enum msm_dsi_phy_type type;
> @@ -23,9 +22,8 @@ struct msm_dsi_pll {
> 
>  	unsigned long	min_rate;
>  	unsigned long	max_rate;
> -	u32		en_seq_cnt;
> 
> -	int (*enable_seqs[MAX_DSI_PLL_EN_SEQS])(struct msm_dsi_pll *pll);
> +	int (*enable_seq)(struct msm_dsi_pll *pll);
>  	void (*disable_seq)(struct msm_dsi_pll *pll);
>  	int (*get_provider)(struct msm_dsi_pll *pll,
>  			struct clk **byte_clk_provider,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
