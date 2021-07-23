Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDED3D4198
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 22:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42026EA74;
	Fri, 23 Jul 2021 20:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248D76EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 20:33:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627072400; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lxM7FSYBNI/KMt33mBjhA8tdIQ6+GVXlVgXqExsNcZI=;
 b=EVQkyCnLYAIYf3bnE5MrMtGMq1dHLpTrYEhCQW4U1CbX5QLh/cp3cN4auFq948SuzngdGOHg
 Uat5mG6PnTnYjkrv9c6H9kgaaubym+xMNizs7H4f+aDchYH2EKNrm++lk7QR5checqeRQW7x
 V6EE6vT90Tb8DCz12iNBBJEnyQw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60fb27864815712f3aef47ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 20:33:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78F7FC433D3; Fri, 23 Jul 2021 20:33:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EC2CC433F1;
 Fri, 23 Jul 2021 20:33:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Jul 2021 13:33:07 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dp: Allow sub-regions to be
 specified in DT
In-Reply-To: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-6-bjorn.andersson@linaro.org>
Message-ID: <2d969e35f13b6a5313a901ac8b6dde9e@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Tanmay Shah <tanmay@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-21 19:42, Bjorn Andersson wrote:
> Not all platforms has P0 at an offset of 0x1000 from the base address,
> so add support for specifying each sub-region in DT. The code falls 
> back
> to the predefined offsets in the case that only a single reg is
> specified, in order to support existing DT.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
The change itself looks good, hence
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

But as a follow up to this change, can we move the existing DP DT on
sc7180 to this model and then drop this legacy path?

That will clean this up nicely.

> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 1a10901ae574..fc8a6452f641 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -63,18 +63,45 @@ static int dp_parser_ctrl_res(struct dp_parser 
> *parser)
>  		return PTR_ERR(dss->ahb);
>  	}
> 
> -	if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> -		DRM_ERROR("legacy memory region not large enough\n");
> -		return -EINVAL;
> -	}
> +	dss->aux = dp_ioremap(pdev, 1, &dss->aux_len);
> +	if (IS_ERR(dss->aux)) {
> +		/*
> +		 * The initial binding had a single reg, but in order to
> +		 * support variation in the sub-region sizes this was split.
> +		 * dp_ioremap() will fail with -ENODEV here if only a single
> +		 * reg is specified, so fill in the sub-region offsets and
> +		 * lengths based on this single region.
> +		 */
> +		if (PTR_ERR(dss->aux) == -ENODEV) {
> +			if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> +				DRM_ERROR("legacy memory region not large enough\n");
> +				return -EINVAL;
> +			}
> +
> +			dss->ahb_len = DP_DEFAULT_AHB_SIZE;
> +			dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
> +			dss->aux_len = DP_DEFAULT_AUX_SIZE;
> +			dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
> +			dss->link_len = DP_DEFAULT_LINK_SIZE;
> +			dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
> +			dss->p0_len = DP_DEFAULT_P0_SIZE;
> +		} else {
> +			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux);
> +			return PTR_ERR(dss->aux);
> +		}
> +	} else {
> +		dss->link = dp_ioremap(pdev, 2, &dss->link_len);
> +		if (IS_ERR(dss->link)) {
> +			DRM_ERROR("unable to remap link region: %pe\n", dss->link);
> +			return PTR_ERR(dss->link);
> +		}
> 
> -	dss->ahb_len = DP_DEFAULT_AHB_SIZE;
> -	dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
> -	dss->aux_len = DP_DEFAULT_AUX_SIZE;
> -	dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
> -	dss->link_len = DP_DEFAULT_LINK_SIZE;
> -	dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
> -	dss->p0_len = DP_DEFAULT_P0_SIZE;
> +		dss->p0 = dp_ioremap(pdev, 3, &dss->p0_len);
> +		if (IS_ERR(dss->p0)) {
> +			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0);
> +			return PTR_ERR(dss->p0);
> +		}
> +	}
> 
>  	io->phy = devm_phy_get(&pdev->dev, "dp");
>  	if (IS_ERR(io->phy))
