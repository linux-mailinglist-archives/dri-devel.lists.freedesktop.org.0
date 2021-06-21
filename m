Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FEF3AF8B9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 00:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C46E43F;
	Mon, 21 Jun 2021 22:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9C96E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 22:42:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624315331; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LTU0kMJQINv4oK4bORfsLbA+F8T0fBnWWuCKgtiGUM0=;
 b=GS4o3gMGk2jikTD4Y6fUbkmrYgfwfwzJG3g8dUSMPI4YPpfHNqznNfJt6ZCG83/MWDqH4B9a
 18uH/q3LFTTTNtzdlrrdKU3vH2aj4fEpaB/cO2P7MBWH/5fnqd5/kBAHny2hiwVlJ/BfQTVz
 e68a8EAOuuQQytTNZ7DOskfx3zY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60d115ade27c0cc77f2f88f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:41:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5B434C4360C; Mon, 21 Jun 2021 22:41:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 40C16C433D3;
 Mon, 21 Jun 2021 22:41:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jun 2021 15:41:47 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm/dsi: drop
 msm_dsi_phy_get_shared_timings
In-Reply-To: <20210515131217.1540412-8-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-8-dmitry.baryshkov@linaro.org>
Message-ID: <68887c25ff97c62ad65fdbfda3b7b66f@codeaurora.org>
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
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> Instead of fetching shared timing through an extra function call, get
> them directly from msm_dsi_phy_enable. This would allow removing phy
> timings from the struct msm_dsi_phy in the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c |  3 +--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++++--------
>  3 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 2041980548f0..84f9900ff878 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -163,10 +163,9 @@ struct msm_dsi_phy_clk_request {
>  void msm_dsi_phy_driver_register(void);
>  void msm_dsi_phy_driver_unregister(void);
>  int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> -			struct msm_dsi_phy_clk_request *clk_req);
> +			struct msm_dsi_phy_clk_request *clk_req,
> +			struct msm_dsi_phy_shared_timings *shared_timings);
>  void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
> -void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
> -			struct msm_dsi_phy_shared_timings *shared_timing);
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 12efc8c69046..88d56a2bc8ab 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -118,8 +118,7 @@ static int enable_phy(struct msm_dsi *msm_dsi,
> 
>  	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_dual_dsi);
> 
> -	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req);
> -	msm_dsi_phy_get_shared_timings(msm_dsi->phy, shared_timings);
> +	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
> 
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index feaeb34b7071..53a02c02dd6e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -752,7 +752,8 @@ void __exit msm_dsi_phy_driver_unregister(void)
>  }
> 
>  int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> -			struct msm_dsi_phy_clk_request *clk_req)
> +			struct msm_dsi_phy_clk_request *clk_req,
> +			struct msm_dsi_phy_shared_timings *shared_timings)
>  {
>  	struct device *dev = &phy->pdev->dev;
>  	int ret;
> @@ -780,6 +781,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  		goto phy_en_fail;
>  	}
> 
> +	memcpy(shared_timings, &phy->timing.shared_timings,
> +	       sizeof(*shared_timings));
> +
>  	/*
>  	 * Resetting DSI PHY silently changes its PLL registers to reset 
> status,
>  	 * which will confuse clock driver and result in wrong output rate of
> @@ -819,13 +823,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
>  	dsi_phy_disable_resource(phy);
>  }
> 
> -void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
> -			struct msm_dsi_phy_shared_timings *shared_timings)
> -{
> -	memcpy(shared_timings, &phy->timing.shared_timings,
> -	       sizeof(*shared_timings));
> -}
> -
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc)
>  {
