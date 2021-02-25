Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA276324B36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 08:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C325E6EC4C;
	Thu, 25 Feb 2021 07:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87EE6EC4C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 07:28:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614238130; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rweQPpVnh7qp98De6bJw+H/FQNc1D6OQQm8bGdcfHy8=;
 b=Ch3L3D/wsduiEmOcvW+roN+gG1xKLey3FxjOo6LHk0Gs0RzlY+Dckxn/FNv4eLTK9rgIU8Q9
 jKg1KXU4LICcNcfc+T84vRW6+RAvRGO1cUtAS11yfa/Cg3abHHDPbKUQk+YSyhS678eNvvgf
 Wz4i06ontiCnpTmt5fvBQ8LW5FA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 603751a6090a774287953b1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 07:28:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83051C433C6; Thu, 25 Feb 2021 07:28:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DFB27C433CA;
 Thu, 25 Feb 2021 07:28:37 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 23:28:37 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits
 assignment
In-Reply-To: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
References: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
Message-ID: <74ec836c951c2eec2d978ba75ac8a7d7@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

Thanks for the patch.

On 2021-02-24 15:01, Dmitry Baryshkov wrote:
> The number of fractional registers bits is known and already set in
> the frac_bits variable of the dsi_pll_config struct here in 7nm:
> remove the TODO by simply using that variable. This is a copy of
> 196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier 
> frac_bits
> assignment").
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index c1f6708367ae..0458eda15114 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -509,6 +509,7 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  {
>  	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
>  	void __iomem *base = pll_7nm->mmio;
>  	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
>  	u64 vco_rate = 0x0;
> @@ -529,9 +530,8 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	/*
>  	 * TODO:
>  	 *	1. Assumes prescaler is disabled
> -	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
>  	 */
> -	multiplier = 1 << 18;
> +	multiplier = 1 << config->frac_bits;
>  	pll_freq = dec * (ref_clk * 2);
>  	tmp64 = (ref_clk * 2 * frac);
>  	pll_freq += div_u64(tmp64, multiplier);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
