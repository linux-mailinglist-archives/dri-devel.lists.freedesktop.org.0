Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB7432A11
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 01:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DA86EAA8;
	Mon, 18 Oct 2021 23:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE596EAA8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 23:12:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634598766; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UwFwPr9uFaBvP9YOGlOTwgO/YZ769ROalaDw+sCCibE=;
 b=HAlUYOyk/sOsUddTs+YBEYTFqY1hyTwcCS2CfnqVmhMa9TKsteT9S40hghn2q0+kT6v5I0fB
 1t7WTOLm+iOZGbHSrq0aCh7MwTHhNwZvOwWiT8K4NrIHGCa6eTUR9NM/cS3WG5IcaRO4kVki
 0Os0V30QGRpr0cLTG/DLyqlpUcw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 616dff6667f107c61169270c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 23:12:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46F76C4360D; Mon, 18 Oct 2021 23:12:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4129DC4338F;
 Mon, 18 Oct 2021 23:12:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Oct 2021 16:12:37 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP controllers
In-Reply-To: <20211016221843.2167329-8-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-8-bjorn.andersson@linaro.org>
Message-ID: <5ac4f440db255c6b436d7d85da52c36d@codeaurora.org>
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

On 2021-10-16 15:18, Bjorn Andersson wrote:
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to 
> the
> DP driver.
> 
> Link:
> https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v4:
> - Use the MSM_DP_CONTROLLER_n enums
> - const the msm_dp_desc array
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_display.c            | 11 +++++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 47d5d71eb5d3..0ac6a79e8af9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -918,13 +918,13 @@ static const struct dpu_intf_cfg sc7280_intf[] = 
> {
>  };
> 
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0,
> 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index
> until this is supported */
>  	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, 1, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 2, 24,
> INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1,
> 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2,
> 24, INTF_SC8180X_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
> 
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index d3c9d7273354..70dcd4e6d466 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = 
> {
>  	.num_descs = 1,
>  };
> 
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +	.descs = (const struct msm_dp_desc[]) {
> +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type =
> DRM_MODE_CONNECTOR_DisplayPort },
> +		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type =
> DRM_MODE_CONNECTOR_DisplayPort },
> +		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type =
> DRM_MODE_CONNECTOR_eDP },
> +	},
> +	.num_descs = 3,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
>  	{}
>  };
