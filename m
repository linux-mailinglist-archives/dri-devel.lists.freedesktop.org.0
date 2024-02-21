Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE785ED20
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 00:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211B10E060;
	Wed, 21 Feb 2024 23:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tmuJ3/5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E31110E060
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 23:38:58 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-607d9c4fa90so75486507b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708558737; x=1709163537; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/dnZ6qXwhjaIXNXWlJKsv9Hd+U+Uq/9NkmI5u+eHav8=;
 b=tmuJ3/5MWwoZGPubBh8BXwenM1ubds+fW25+F54Knq31GoOuJU6G1cSXOo9i5nqIdT
 1B6644b/JDB+MU0ZsqW7yCt9d5sV0ZSB+UARLFD1ytKc3CVJ0yzUTiiJGUMIzrenfU2b
 k2mS/bTZgu3V2NAsagB+qI060s7dMricvT6M990qi9TplugWL6bz6DSGLewBpn4KEEH1
 LN6zAvwMooo2nc3ovc06xdWky598qmJjUrHTXed9FLCb7O+zql/26P7cjq8pIZlt7bt8
 lFvDDKw+CEqK89nBIxdfhM8u9PuEeUJNqcTykURaTsAywGhAsKpI3cC8FGFN6vAA9ugv
 SQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708558737; x=1709163537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dnZ6qXwhjaIXNXWlJKsv9Hd+U+Uq/9NkmI5u+eHav8=;
 b=t/PbVl61N7lw5bQOYMboPomkFZ9nWB1TnTZ0PCfBFsri4GXUMTAaq2Whg28Upd++0Z
 Iy0T9b4k/6Vr/eQWFRrJU0+BHWEENq+i1wwIkDEGZkcDSmRrLw8XGFoYRdUwbqnb/j8i
 YQS8U1A9s3zdlsqiFbTCnE/MV64cmQjkf9yDG394tEmznIOD16+RgqNp23wSiPYdn3e6
 O2lO4MeSfqHMbu0o4wM6bLwUYnXlTmG8OJmddBdiSRgzqAnN8f0LLV/zCiavCJH+Vzul
 NKF46QI8FMGBSl90dqFb7oePgP6hYA8pzH9jFJNdoFwblf6F1YtYgT4TXzNacFiB4lx3
 qRHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwk8ul0ModVievFo+tiqwWUc9piWY06ts68irVrIpT1rkNtWCIdkEl3xU4zNi0xHSmaBylWK+1J88DW1nkMQomtuvajUVU3S/jN2Bnd2W3
X-Gm-Message-State: AOJu0YymZhVR3IiUTwvMa2FTnvAd7pHwhOItZQ+djBKbvYo4+e6wc2xF
 OOefCgvdSSRpvCcL7qD5XvhcOvQ9kPX26BKMn0PexDLXL1XCMi3k0Kq09b71fXXgy498J43gfoj
 pivqh//XKP0a9xIjoL9mXHnBYL17x1HthrESbyg==
X-Google-Smtp-Source: AGHT+IE0tGrX7UsWdp8xy5caWpOZ9THC0fnnletXSK4P9Z3hp437QPqk/DB8NiySph7r7h/gOnZ8DNQ5BKCpKPKAobA=
X-Received: by 2002:a81:7184:0:b0:604:230a:a823 with SMTP id
 m126-20020a817184000000b00604230aa823mr19674257ywc.50.1708558736962; Wed, 21
 Feb 2024 15:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:38:45 +0200
Message-ID: <CAA8EJprXXjvanBU_HGv7X_dS3nyZ867AsvKj5+S3pnWcpsk1ug@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/dp: Add DP support to combo instance in SC7280
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> When upstreamed the SC7280 DP controllers where described as one being
> DP and one eDP, but they can infact both be DP or eDP.
>
> Extend the list of DP controllers to cover both instances, and rely on
> the newly introduced mechanism for selecting which mode they should
> operate in.
>
> Move qcom,sc7280-edp to a dedicated list, to ensure existing DeviceTree
> will continue to select eDP.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7b8c695d521a..1792ba9f7259 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -129,7 +129,12 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
>  };
>
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },

I think we need to keep .connector_type here, don't we?

> +       {}
> +};
> +
> +static const struct msm_dp_desc sc7280_edp_descs[] = {
>         { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>         {}
>  };
> @@ -182,7 +187,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> -       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_descs },
>         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
>         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
>         { .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
