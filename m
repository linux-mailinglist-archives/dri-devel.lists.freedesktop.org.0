Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F934DF22
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 05:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7676E83E;
	Tue, 30 Mar 2021 03:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB7A6E83B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:19:38 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso14258898ott.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 20:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vWMcwuXDEaOZKZXHrlr3QkkmeaCK7d19Zw1sSbsXamU=;
 b=iIcw4Em6TJlBVVKIcfj5QDSHtwSU2JpH4Flqmgc65pLlbwZ1TPgxQYivXJ5GAajbjB
 NwQflMsCdsCURjEqoYdLIgTnlp6EkYiJhvfbWmSrZCl7AkP/+89j18Dx9gb5E7sIXxJd
 pa8/j9YQM/4VuGDDWUFNiPLlL/SblndGa1OMdekP3rMNTOqLQF/yVe0G+/M9X2UwIpVq
 GhwI2rbGbvlU869yveYuM0AsDqynrQtAX4u0799JkPhQTPs4iD4bcAqObzgaQOhZM04d
 r9PP1TXpxSaLTe9RqenPlyhng9vmq67/SreMOBfXm9TD2/JYjHXFnjh19Bwfoy+a3I+6
 /cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vWMcwuXDEaOZKZXHrlr3QkkmeaCK7d19Zw1sSbsXamU=;
 b=eYyZLCg3dZ4XpUItKMGK7VLkSMfAxZ4s0YHaIAImYgTieYtP2kGPN6tBhviJb+098I
 j40mxpmviD3xSgaFp8K6afkQW38+J28l7IDx8lg/ImHpUxDpp7Msx2mOIEzcF7bGNjVC
 MeMWIqTWWe3suGr309hg+WyxXaiRO0QOVZpw4buH1F+A0Qer8YUartdM2tj1xzYJTXPl
 pt3pBxOdrWfogJjdewKwrVZyop94fdnJPMius/7MPemwncnZWLMWvYByU2jbjKpkreig
 DZg1ldJueJk0E++p+EhHlle0Pc8MK6kscXKFDzWJkcJASpBd8DuNAsT4lrA6CGH4Pom6
 D6Ww==
X-Gm-Message-State: AOAM533ekp0XqVwnxmapoO+s8lKKAdPFB1RwOEw81SK2NPQDME6+MfeB
 V4P2oKPWxY+gOfSTnY/iYLB44g==
X-Google-Smtp-Source: ABdhPJwy+FkuqOTsb99byi8EQNHEvnvxx2x9E+x/5qazQK1aiu8eRuAU9E7X3yQdMjNMqdnnVzmdpw==
X-Received: by 2002:a05:6830:243c:: with SMTP id
 k28mr24450959ots.306.1617074377672; 
 Mon, 29 Mar 2021 20:19:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v23sm4975200ots.63.2021.03.29.20.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 20:19:37 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:19:35 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
Message-ID: <YGKYx1AcjSBIUwqr@builder.lan>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
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

Rob, will you pick patch 2 and 3 for 5.13?

I've picked patch 1 and would like to pick patch 4 through my tree...

Regards,
Bjorn

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
