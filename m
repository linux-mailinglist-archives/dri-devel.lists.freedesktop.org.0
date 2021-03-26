Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1C34ADF8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7CF6F468;
	Fri, 26 Mar 2021 17:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9AE6F472
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:53:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781212; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lGhgzLJkeLQaXouOCV6Xt98g41yrW6yL8pWHBwAKtew=;
 b=lILOd0dTG3Z6CoOp8Y7h9giUvTjDK+4TpUqDeeCFhjMF1qO6sn0jP978rC8iZCGJcXWrlEj0
 LBwwooKaqgxdqSIpYAjS/UShJIt6dsShj7GF89VQn7aRDQWukPagOhdH2x7S3VTW+aDh+n6O
 urGLJ6uRBI+AxU7em0y8/jxLHRQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 605e1f87a2ab6642dbb90bc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:53:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 65C73C4346B; Fri, 26 Mar 2021 17:53:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 21096C43461;
 Fri, 26 Mar 2021 17:53:09 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:53:09 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 09/28] drm/msm/dsi: move min/max PLL rate
 to phy config
In-Reply-To: <20210324151846.2774204-10-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-10-dmitry.baryshkov@linaro.org>
Message-ID: <1bdfb597f07f0d4ebe670bc4ad863acd@codeaurora.org>
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  3 +++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  6 ++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  6 ++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  8 ++++++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 12 ++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c           |  8 ++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h           |  3 ---
>  8 files changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 39abb86446f9..000e4207dabc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -38,6 +38,9 @@ struct msm_dsi_phy_cfg {
>  	struct msm_dsi_phy_ops ops;
>  	const struct msm_dsi_pll_ops pll_ops;
> 
> +	unsigned long	min_pll_rate;
> +	unsigned long	max_pll_rate;
> +
>  	/*
>  	 * Each cell {phy_id, pll_id} of the truth table indicates
>  	 * if the source PLL selection bit should be set for each PHY.
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index dc8ccc994759..5f9d0cfc4e03 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -864,8 +864,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	spin_lock_init(&pll_10nm->postdiv_lock);
> 
>  	pll = &pll_10nm->base;
> -	pll->min_rate = 1000000000UL;
> -	pll->max_rate = 3500000000UL;
>  	pll->cfg = phy->cfg;
> 
>  	pll_10nm->vco_delay = 1;
> @@ -1113,6 +1111,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.restore_state = dsi_pll_10nm_restore_state,
>  		.set_usecase = dsi_pll_10nm_set_usecase,
>  	},
> +	.min_pll_rate = 1000000000UL,
> +	.max_pll_rate = 3500000000UL,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
>  };
> @@ -1138,6 +1138,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.restore_state = dsi_pll_10nm_restore_state,
>  		.set_usecase = dsi_pll_10nm_set_usecase,
>  	},
> +	.min_pll_rate = 1000000000UL,
> +	.max_pll_rate = 3500000000UL,
>  	.io_start = { 0xc994400, 0xc996400 },
>  	.num_dsi_phy = 2,
>  	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index d78f846cf8e4..8e4528301e5d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1078,8 +1078,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  	spin_lock_init(&pll_14nm->postdiv_lock);
> 
>  	pll = &pll_14nm->base;
> -	pll->min_rate = VCO_MIN_RATE;
> -	pll->max_rate = VCO_MAX_RATE;
>  	pll->cfg = phy->cfg;
> 
>  	pll_14nm->vco_delay = 1;
> @@ -1237,6 +1235,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.disable_seq = dsi_pll_14nm_disable_seq,
>  		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0x994400, 0x996400 },
>  	.num_dsi_phy = 2,
>  };
> @@ -1264,6 +1264,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.disable_seq = dsi_pll_14nm_disable_seq,
>  		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0xc994400, 0xc996000 },
>  	.num_dsi_phy = 2,
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index bb33261d606d..d267b25e5da0 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -625,8 +625,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
>  	}
> 
>  	pll = &pll_28nm->base;
> -	pll->min_rate = VCO_MIN_RATE;
> -	pll->max_rate = VCO_MAX_RATE;
>  	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		pll_28nm->vco_delay = 1000;
>  	else
> @@ -811,6 +809,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.disable_seq = dsi_pll_28nm_disable_seq,
>  		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0xfd922b00, 0xfd923100 },
>  	.num_dsi_phy = 2,
>  };
> @@ -837,6 +837,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.disable_seq = dsi_pll_28nm_disable_seq,
>  		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0x1a94400, 0x1a96400 },
>  	.num_dsi_phy = 2,
>  };
> @@ -863,6 +865,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  		.disable_seq = dsi_pll_28nm_disable_seq,
>  		.enable_seq = dsi_pll_28nm_enable_seq_lp,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0x1a98500 },
>  	.num_dsi_phy = 1,
>  	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 79b0842a8dc4..31e7910c6050 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -508,8 +508,6 @@ static int dsi_pll_28nm_8960_init(struct 
> msm_dsi_phy *phy)
>  	}
> 
>  	pll = &pll_28nm->base;
> -	pll->min_rate = VCO_MIN_RATE;
> -	pll->max_rate = VCO_MAX_RATE;
> 
>  	pll->cfg = phy->cfg;
> 
> @@ -711,6 +709,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  		.disable_seq = dsi_pll_28nm_disable_seq,
>  		.enable_seq = dsi_pll_28nm_enable_seq,
>  	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
>  	.io_start = { 0x4700300, 0x5800300 },
>  	.num_dsi_phy = 2,
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 44ae495e8fca..4831d6769da7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -889,14 +889,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> 
>  	pll = &pll_7nm->base;
> -	pll->min_rate = 1000000000UL;
> -	pll->max_rate = 3500000000UL;
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> -		pll->min_rate = 600000000UL;
> -		pll->max_rate = (unsigned long)5000000000ULL;
> -		/* workaround for max rate overflowing on 32-bit builds: */
> -		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
> -	}
>  	pll->cfg = phy->cfg;
> 
>  	pll_7nm->vco_delay = 1;
> @@ -1152,6 +1144,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.restore_state = dsi_pll_7nm_restore_state,
>  		.set_usecase = dsi_pll_7nm_set_usecase,
>  	},
> +	.min_pll_rate = 600000000UL,
> +	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
>  	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
> @@ -1178,6 +1172,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.restore_state = dsi_pll_7nm_restore_state,
>  		.set_usecase = dsi_pll_7nm_set_usecase,
>  	},
> +	.min_pll_rate = 1000000000UL,
> +	.max_pll_rate = 3500000000UL,
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index c7ff0eba0e8b..e607adffe001 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -14,10 +14,10 @@ long msm_dsi_pll_helper_clk_round_rate(struct 
> clk_hw *hw,
>  {
>  	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> 
> -	if      (rate < pll->min_rate)
> -		return  pll->min_rate;
> -	else if (rate > pll->max_rate)
> -		return  pll->max_rate;
> +	if      (rate < pll->cfg->min_pll_rate)
> +		return  pll->cfg->min_pll_rate;
> +	else if (rate > pll->cfg->max_pll_rate)
> +		return  pll->cfg->max_pll_rate;
>  	else
>  		return rate;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index 4fa73fbcba52..8306911f8318 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -18,9 +18,6 @@ struct msm_dsi_pll {
>  	bool		pll_on;
>  	bool		state_saved;
> 
> -	unsigned long	min_rate;
> -	unsigned long	max_rate;
> -
>  	const struct msm_dsi_phy_cfg *cfg;
>  };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
