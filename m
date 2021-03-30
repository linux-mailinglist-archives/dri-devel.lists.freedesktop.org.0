Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6234DF12
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 05:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4D6E839;
	Tue, 30 Mar 2021 03:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262D6E839
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:16:34 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so3441687oof.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 20:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BbiUtJcTU0s9GBE7VMo5ArmKSVJ+whelLeWlW4S+Rl8=;
 b=NTh/nyb6jyS0BDMpH4EFPz5UFr9EjQfVqwO6IDspXDj635dD9lQAo4/BYfk3M4eaDj
 dzDUavx1dOxwuLKZl3bd09Pdwvk+vQ9f6V9jf7e8X3IOtSmTCDPUM4c+M8IrkNymqNjN
 6R+cAfcxu3ly/CFOXfN/8TkUfuCRY2yDKw57Yfd5BVVMsqkZ1CFjnyG/txrSgwEzLpqv
 n6xdyCW+ps75JLDBrIRZ5sqggrTyK6tL8cvVd/07FH1IKaMh999rXFqYcd9mGU0csQRs
 NEqTJsfQJMvhpP3kmpUI7JBSmQ7b3O33VdbxjJ6Av3uWkZ995vgl8aF72dgc5gjLYQrq
 oulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BbiUtJcTU0s9GBE7VMo5ArmKSVJ+whelLeWlW4S+Rl8=;
 b=p88/B6v9x/lfgJPSQhvrh3L3VdfR+nQLPjm8Dqa9FBCABestv8Gt5qSttTet8b74c/
 SWfTFcHpl41VbVFiMQDyI83jICaeq4VXD0LJJJ9FvaEemTIqAIqcuY+BPVLCezyhNJUo
 6W1CFOGThj/hj7tut1dIs99vqaMOGvH1Y5aJgzD3EgJFxU0Lzwq5t31WQy+4WOk1cH+7
 X0c1xxHK7iCbpkCUQ/FpEha61PzI0v/ooNqW8NI/L/c1Poj7phoWTrh/ecQ6Axe3/GvF
 QUqq1cyG1LqT0yuRv1HVxsCg45BblBDZwAREIsQKYb+8M3z422Qe9eIJEY6JBL4dpd4G
 UVJg==
X-Gm-Message-State: AOAM531m30m/t1EgqMqF9jX2BlJq4VXVHfP77NKNjYijFQ/J7yXGPRHI
 +09USD0k9F8DX00NIvsEqY7hRw==
X-Google-Smtp-Source: ABdhPJzYp2O4gVtnixVZG2kbyQF+HvlHY3ouevBNmotObRpgcE/psp/e5x8OWYmI375hx5v48UDavg==
X-Received: by 2002:a4a:d88a:: with SMTP id b10mr23514407oov.29.1617074193873; 
 Mon, 29 Mar 2021 20:16:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m19sm4137863oop.6.2021.03.29.20.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 20:16:33 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:16:31 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
Message-ID: <YGKYDzCzwz+1pxOi@builder.lan>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
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
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 29 Mar 07:00 CDT 2021, Dmitry Baryshkov wrote:

> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sdm845-dpu", },
>  	{ .compatible = "qcom,sc7180-dpu", },
> +	{ .compatible = "qcom,sm8150-dpu", },
> +	{ .compatible = "qcom,sm8250-dpu", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..928f13d4bfbc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
>  	 * Populate the children devices, find the MDP5/DPU node, and then add
>  	 * the interfaces to our components list.
>  	 */
> -	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> -	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> -	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> +	if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {

Please consider reviewing my proposed alternative solution for this
hunk:

https://lore.kernel.org/linux-arm-msm/20210317025634.3987908-1-bjorn.andersson@linaro.org/

For the rest

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>  		if (ret) {
>  			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>  	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>  	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> +	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> -- 
> 2.30.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
