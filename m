Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B031CEF8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 18:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10806E3D2;
	Tue, 16 Feb 2021 17:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353796E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 16:54:30 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id b14so10064927qkk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Zhyu+nC9+CPMV4JA3grDQ6Xc5qBaXkOYbaPkzmAlcg=;
 b=gbFxfeL0ybh8TJ11CwDsF8YXkz5foMi6jC7WLCPgNjrHnNJyO5lsI0RR+hGTUzCstP
 rfjAqDYTpnJgkHzoZUKAr+cKMf/vHLLDZ0OFL9+S2Xx4wbBQZxa8memc4+v1TgD/fFwE
 k5rIpN3IMKkU6MsdR3u6USf51Vmse//UQHpEiyDVGd3FLPCsYtCwyNIjibsVRtmycboE
 GNaMDoVw5rOEOa2yFK0wVy7iRy3T1kRSkN72kHwq80EFeXFYXVnBN7OjQo+PkK1fvkdA
 los2vdAuCqT22DC3wS2OCGU4brNnY8sCSZo6qZ1bqTTRJE7oIR9HHzRQ+ciLfhJv1WT3
 heVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Zhyu+nC9+CPMV4JA3grDQ6Xc5qBaXkOYbaPkzmAlcg=;
 b=t371nS/5xspfLsZ0XEEAsLfOvyX2zQ1nlvL5vjckwWbTVoBtc26eJDU/506a+Y2TVB
 65IhVCeEo5L7x6wgFpjgnDSt8lM2U6jjBg3jF2bbhdh/zjjFqhBBx4raqrz2TAim62XB
 YWRCk9oIktMHUWzlZiRca41BMCtVTUlvD886hsvrdo4aOJ5QTSICiQHwDXpl58YI/phD
 b4cC0GRjpoWrsrKsvJ9ivBNGb1qy1hKm2DFKZTIQDcmI3EFxgdy8M3Xl0CI1CCXHHUrj
 4gtmxHaWt743MlR5SdtdAZwg1vWn4O6TB7RThHC/SyZ7ik1N11HkHzk2Wyub9b5XX8QM
 bCFw==
X-Gm-Message-State: AOAM530/kg8QvZUfIN3cMy+LOmhrpqkXhFq2BqMbqNW0cY4rsZFGysnF
 I7ZQfmVszITeg9MEQMr3OjqHPEMOigfNWmSOtXUODg==
X-Google-Smtp-Source: ABdhPJy5giYk3zchfxtQjLAyvp7G+emQEY5YPUBbkl2jA55BNYnMtVotkiP14rfgzioNsAOrXutaR1HTIJjckO8Gk78=
X-Received: by 2002:a37:5702:: with SMTP id l2mr20738364qkb.486.1613494469361; 
 Tue, 16 Feb 2021 08:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20210215161537.14696-1-jonathan@marek.ca>
 <20210215161537.14696-2-jonathan@marek.ca>
In-Reply-To: <20210215161537.14696-2-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Feb 2021 19:54:16 +0300
Message-ID: <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: add compatibles for sm8150/sm8250 display
To: Jonathan Marek <jonathan@marek.ca>
X-Mailman-Approved-At: Tue, 16 Feb 2021 17:27:59 +0000
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Tanmay Shah <tanmay@codeaurora.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
>
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26f60da..5763f43200a0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>
>  MDSS:
>  Required properties:
> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
>  - reg: physical base address and length of contoller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
> @@ -41,7 +41,7 @@ Optional properties:
>
>  MDP:
>  Required properties:
> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
>  - reg: physical base address and length of controller's registers.
>  - reg-names : register region names. The following region is required:
>    * "mdp"

These two chunks should probably go to the separate patch 'dt-bindings:...'.

Also, could you please pinpoint the reason for adding more
compatibility strings, while they map to the same internal data?
I think we might want instead to use some generic name for the dpu
block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
platform name.


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  static const struct of_device_id dpu_dt_match[] = {
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
> +       { .compatible = "qcom,sm8150-dpu", },
> +       { .compatible = "qcom,sm8250-dpu", },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..928f13d4bfbc 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
>          * Populate the children devices, find the MDP5/DPU node, and then add
>          * the interfaces to our components list.
>          */
> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
>                 ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>                 if (ret) {
>                         DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
>         { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>         { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>         { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
