Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492624943BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 00:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6110E2C8;
	Wed, 19 Jan 2022 23:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F1B10E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 23:14:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b14so14511490lff.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PbQl0BUn++ZB1i9uODmQ5ljj1iJBVeOFEPuDnyWs3xs=;
 b=BghlF19x8AQECHFk1LWzUs8loj0o450isIXnhV5UFd4gJH+MjeY6SxVNFPaiChU+rE
 mSFxggcrXUa+WFBYkj1zJiAlg1Va+0EkufrCanIuJmrwWs2pUUE8SnruiSYx1WEiUf8W
 P9+a2vUkbTG32v167Eiw+U+afcLyJSRDqxUKwCwV/GfgcKO8OyVUfCYWBpivzBCUowH9
 xd5ah/LFgz2pAPe0QzyT/S28Zf6ETKlocAuVMsCr3/EI2Ab6AR201k7dutPsyPO49mkE
 c3RLlxjLmLzmFq4nTGs9U0C+evsqyLp0ClWrbdFKXS2xP/nK7UgKPva2VZE2wT/ErfUn
 hOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PbQl0BUn++ZB1i9uODmQ5ljj1iJBVeOFEPuDnyWs3xs=;
 b=epAM4S8VIoqXuDQrYRPy10hHDmvxryC2r0SU9OJNc040hABSy13+uwnhcVx9iJQ5Vm
 NX5po+OeV3+wH7bNZ3MMtqAjU1mATT4FqErGmAa7QY1xaTEKGb6B6r2TF89sDHFU3kBr
 h5QufhGDKEyRYNDXx1ld4l32q4tXCZtBFZToeTCWu82m+mwfACXrTlA4rA817QZztbW5
 9/mS4I9xuf96hpTy1VR6o9NTSaVo3QsKuLbgB5yC7m2xNzvhBGbe/bhdaD6OCSS4xiG+
 ttv6+QP5bxN4+csUCByVJIDOKpbPRSxtVTTfkcn8ob/a3Y+AhIVGo0tOD192IKPi20pS
 P+Gg==
X-Gm-Message-State: AOAM530G/6PddBVVAYbL7g6FtpST0P8XSvme45pxmoF4FNJ+dxRTiLbJ
 n+zqbuZ7wUimd6Mo+CwCl6tH5g==
X-Google-Smtp-Source: ABdhPJyIGbFbXxIUsw5VhJwKDJr0lHFFTp7Ydun85LWYMO1pX6Qobx0Wz20uLUDHliD8JnPJUCZV5w==
X-Received: by 2002:a2e:b896:: with SMTP id r22mr15946359ljp.390.1642634063482; 
 Wed, 19 Jan 2022 15:14:23 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l22sm107192lfh.137.2022.01.19.15.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 15:14:22 -0800 (PST)
Message-ID: <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org>
Date: Thu, 20 Jan 2022 02:14:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/dp: Add DisplayPort controller for SM8350
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/12/2021 07:59, Bjorn Andersson wrote:
> The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> add support for this in the DisplayPort driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
>   drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 5457612ab136..cd05cfd76536 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,6 +21,7 @@ properties:
>         - qcom,sc7280-edp
>         - qcom,sc8180x-dp
>         - qcom,sc8180x-edp
> +      - qcom,sm8350-dp
>   
>     reg:
>       items:
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8d9c19dbf33e..fd0fd03f8fed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>   	.num_descs = 2,
>   };
>   
> +static const struct msm_dp_config sm8350_dp_cfg = {
> +	.descs = (const struct msm_dp_desc[]) {
> +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	},
> +	.num_descs = 1,
> +};
> +
>   static const struct of_device_id dp_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>   	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
>   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
>   	{}
>   };
>   


-- 
With best wishes
Dmitry
