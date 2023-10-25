Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08E7D6484
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 10:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244BB10E56E;
	Wed, 25 Oct 2023 08:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305C10E588
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:06:24 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a7ac4c3666so52488477b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698221184; x=1698825984; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9N86T/fG3CiL6tT7DD8PpjcJ48kzS/vl5vzR+4WaF7s=;
 b=rccL5Gay4pSFhJaA9FT9SQSndBcFI7cI6Tb7L4yEUuemnbx0lyrG6F4YneWAhs50Vp
 2GLlJgfj2+Uj3YOZqxMR5bhtxkgnGob4HNQ5FY/p+e/1CxebNNl8qUaqvz4mIluspQrU
 oy9v6FoOG7ERJUXiheNZz7AKRV6qI8PQKZGDtlj7qM/3n1NubfwVRcSO+kWshjXWz3Ys
 hZsqDP2KtljzcTQFdGgAHNfeCzXlgQVh9zKfZYRVU2+gcAZk9pGHJL7nk9sNPcEz1+Jp
 uBtSyvP/XRpZ9z7drhZlckuTuQbs9YxTvtgEI83/D3ApooAyRrf2037/us23su2tD84A
 WNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698221184; x=1698825984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9N86T/fG3CiL6tT7DD8PpjcJ48kzS/vl5vzR+4WaF7s=;
 b=GJX3FxyktCl+sugpz9VPy2I81zsYn/F7kuJYVSxBncDFbNAHBd9DPLuZxey1RhSb9t
 O2/+88fPvdDSrP+KTFrg6tVdukAtW/LXEWcykuPyfsGEdjJXXJpP33fz/V/4Ohr64St4
 WxxV/iSMQYA5X3gL7LL6hkzxqrO25XMgqxFYro/ig75HY0D5PMkiKNqc+7sm/WwVZWpI
 FPKdbrr+m+V13siq0J61gS5AfcFXnBeDrAb+8c0LzWhInSYGuUaQlAcw+ZlnyWsd47M1
 kVSRDYyj4nD5CoMlBDxu6r4gChb+oykq48D6A5YqLhAO8XRXD8ifXkS8bcHL+gRV7dqy
 +dvA==
X-Gm-Message-State: AOJu0YwPwvMJuv/X2HmJDHyMAPuBhNM8EYktcDb/1UpMXEKsWPH1AF2M
 iDdL82SmGrR6CrCqCxZ4tH2YXDfTutOHOkbGvdrIbA==
X-Google-Smtp-Source: AGHT+IFOv7ktMHogTahZY8772P50C84Y6Y6IVMSF12aYBnzD0gZtk/sfInd6pg/uGamC/Q/rKxezX3XuQVgFyeYbTQ4=
X-Received: by 2002:a0d:cb10:0:b0:5a7:c4a7:21c3 with SMTP id
 n16-20020a0dcb10000000b005a7c4a721c3mr16860297ywd.38.1698221184039; Wed, 25
 Oct 2023 01:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
 <20231025-topic-sm8650-upstream-mdss-v1-8-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-8-bb219b8c7a51@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Oct 2023 11:06:13 +0300
Message-ID: <CAA8EJpowPrNyXfyXC5wHz4OugzNFfp0E7qPo=5WS4k18U1LSqA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/msm: dsi: add support for DSI 2.8.0
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DSI Controller version 2.8.0 support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 1f98ff74ceb0..10ba7d153d1c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -190,6 +190,21 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>         },
>  };
>
> +static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
> +       { .supply = "vdda", .init_load_uA = 16600 },    /* 1.2 V */

Same comment regarding uA and sm8550 cfg.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +};
> +
> +static const struct msm_dsi_config sm8650_dsi_cfg = {
> +       .io_offset = DSI_6G_REG_SHIFT,
> +       .regulator_data = sm8650_dsi_regulators,
> +       .num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> +       .bus_clk_names = dsi_v2_4_clk_names,
> +       .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +       .io_start = {
> +               { 0xae94000, 0xae96000 },
> +       },
> +};
> +
>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>         { .supply = "vdda", .init_load_uA = 8350 },     /* 1.2 V */
>         { .supply = "refgen" },
> @@ -281,6 +296,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>                 &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>         {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
>                 &sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
> +               &sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  };
>
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 43f0dd74edb6..4c9b4b37681b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -28,6 +28,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0    0x20050000
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0    0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0    0x20070000
> +#define MSM_DSI_6G_VER_MINOR_V2_8_0    0x20080000
>
>  #define MSM_DSI_V2_VER_MINOR_8064      0x0
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
