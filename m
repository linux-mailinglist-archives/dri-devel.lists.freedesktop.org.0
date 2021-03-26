Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5334AE05
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6E6F460;
	Fri, 26 Mar 2021 17:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE326F460
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:54:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781287; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lXTbs2aeFzgOimMDHvl+FVMRpCRAmEAhjA+xxAIZovM=;
 b=wjl029jNncouv9J+PzI9qnilfQcr9DlT8dFtE9w1saOU1jxUXnPGh3XPICBTqlXWAL3xzW2L
 tARvn0fsBMwSH3z0MzLfTReHqks9ICUfJkACabPJindvQcalMG/C+YfpQPZKeAQYJqzXLgbF
 2pO00izn+IDE3BrVwMZR7PrADcQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 605e1fd4853c0a2c4644a861 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:54:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2703AC433ED; Fri, 26 Mar 2021 17:54:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 917D2C43466;
 Fri, 26 Mar 2021 17:54:25 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:54:25 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 10/28] drm/msm/dsi: remove
 msm_dsi_pll_set_usecase
In-Reply-To: <20210324151846.2774204-11-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-11-dmitry.baryshkov@linaro.org>
Message-ID: <9e94fbc46e367b61634a0917162ab928@codeaurora.org>
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
> msm_dsi_pll_set_usecase() function is not used outside of individual 
> DSI
> PHY drivers, so drop it in favour of calling the the respective
> set_usecase functions directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h              | 7 -------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 2 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 9 ---------
>  6 files changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 98a4b296fa30..b310cf344ed4 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -100,8 +100,6 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll 
> *pll,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
>  int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
> -int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
> -			    enum msm_dsi_phy_usecase uc);
>  #else
>  static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
>  {
> @@ -118,11 +116,6 @@ static inline int
> msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
>  {
>  	return 0;
>  }
> -static inline int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
> -					  enum msm_dsi_phy_usecase uc)
> -{
> -	return -ENODEV;
> -}
>  #endif
> 
>  /* dsi host */
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 000e4207dabc..f737bef74b91 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -29,8 +29,6 @@ struct msm_dsi_pll_ops {
>  	void (*destroy)(struct msm_dsi_pll *pll);
>  	void (*save_state)(struct msm_dsi_pll *pll);
>  	int (*restore_state)(struct msm_dsi_pll *pll);
> -	int (*set_usecase)(struct msm_dsi_pll *pll,
> -			   enum msm_dsi_phy_usecase uc);
>  };
> 
>  struct msm_dsi_phy_cfg {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 5f9d0cfc4e03..7a98e420414f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -1049,7 +1049,7 @@ static int dsi_10nm_phy_enable(struct
> msm_dsi_phy *phy, int src_pll_id,
>  	/* Select full-rate mode */
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
> 
> -	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> @@ -1109,7 +1109,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
> -		.set_usecase = dsi_pll_10nm_set_usecase,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> @@ -1136,7 +1135,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.destroy = dsi_pll_10nm_destroy,
>  		.save_state = dsi_pll_10nm_save_state,
>  		.restore_state = dsi_pll_10nm_restore_state,
> -		.set_usecase = dsi_pll_10nm_set_usecase,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 8e4528301e5d..bab86fa6dc4b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1190,7 +1190,7 @@ static int dsi_14nm_phy_enable(struct
> msm_dsi_phy *phy, int src_pll_id,
>  				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
>  				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
> 
> -	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_pll_14nm_set_usecase(phy->pll, phy->usecase);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> @@ -1231,7 +1231,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> -		.set_usecase = dsi_pll_14nm_set_usecase,
>  		.disable_seq = dsi_pll_14nm_disable_seq,
>  		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
> @@ -1260,7 +1259,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.destroy = dsi_pll_14nm_destroy,
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> -		.set_usecase = dsi_pll_14nm_set_usecase,
>  		.disable_seq = dsi_pll_14nm_disable_seq,
>  		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 4831d6769da7..5acdfe1f63be 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1064,7 +1064,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy
> *phy, int src_pll_id,
>  	/* Select full-rate mode */
>  	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
> 
> -	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
> +	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
>  	if (ret) {
>  		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
>  			__func__, ret);
> @@ -1142,7 +1142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
> -		.set_usecase = dsi_pll_7nm_set_usecase,
>  	},
>  	.min_pll_rate = 600000000UL,
>  	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
> @@ -1170,7 +1169,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.destroy = dsi_pll_7nm_destroy,
>  		.save_state = dsi_pll_7nm_save_state,
>  		.restore_state = dsi_pll_7nm_restore_state,
> -		.set_usecase = dsi_pll_7nm_set_usecase,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index e607adffe001..98ee4560581a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -113,12 +113,3 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll 
> *pll)
> 
>  	return 0;
>  }
> -
> -int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
> -			    enum msm_dsi_phy_usecase uc)
> -{
> -	if (pll->cfg->pll_ops.set_usecase)
> -		return pll->cfg->pll_ops.set_usecase(pll, uc);
> -
> -	return 0;
> -}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
