Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC76A0C12
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD25610E507;
	Thu, 23 Feb 2023 14:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B310E507
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 14:44:01 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536cb25982eso171650457b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/sBV+h1ZZvgBmdh6JHeKYkMRdTQWncyMylaoJIbzas=;
 b=HvW6IeDHSN1NGL3KNmAKobVCkP9ho7Ht0SSCadvCdBvVVuJDwSQXG39AafDhj+a10t
 8dgAVvO7GTmD2ljPa/9xqprqHfUxzr8XX0xOLchcFxmX4xRsFH6Mne7iqNVtUyRpGxIc
 9fTNphrWmrxqXzGaKBTf2qMw3sMgV2oXYJtJxp93XlRYhgY/wtWB5bH9qVXhga/V7Rp0
 I8N8ZEMiD8dbyQStKP+GwB291xDxEimG7dNUX50eXbyRyu8KLrQH+CM8e/ffWVUm4E9j
 MxZ2oqvBgw89xx4vLzcbvUq5e9riKZCS+Vz/3AKpVbMFYDMKjsV3VsQIFkl39vlPEjGS
 hOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/sBV+h1ZZvgBmdh6JHeKYkMRdTQWncyMylaoJIbzas=;
 b=mcNCIoBbAt43Q/T0HhLWhjJlLcqi2kJVjGf9PjY+3Wkt1nkvE+KAvAnpouuVrLcZkv
 W43/H54HpsdXl/x1J9k9vFEeH3jmXyNR/A+apg9v05NnRmNRRRrnlBUVYw0KKyrBjBZU
 AVk3DFdNwzA7I8Dfm4jOX8amTzJ0mgX5fAJpDedfe+ZmUrHoBOHaah+DpKd8nI4+y3uQ
 Z4fxNZk91CEKn6VPbrOCPZ2TOZfu8ogjXVlvn5p0dLwTstsVf5+FVm8rUHdLKrgTju6E
 utLYZaPVWnxhgYtQrveRAMY9P4dj5y8tgVgXSe40x+S1Z+YUoyhh0PrVW1/GWKlepp0r
 ORzQ==
X-Gm-Message-State: AO0yUKWl8QwpbZ+6dWK6q079yeBonJi3J8HH2ye6hceMuKL5GGEprAHG
 T5drtVHr0rt4Job8FCjGTpIiGED35e/ybnk/CuF5NA==
X-Google-Smtp-Source: AK7set83ljNH/eisAJHvZkpMcqzeq3GqC+kRYbk6hiv3pAL7kV8MYGW0K4cTumbrjp4STujcKOD5Or2B2g5M+f2b3yQ=
X-Received: by 2002:a25:908e:0:b0:87a:957b:fd67 with SMTP id
 t14-20020a25908e000000b0087a957bfd67mr2148272ybl.10.1677163440372; Thu, 23
 Feb 2023 06:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-5-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-5-5be55a336819@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 16:43:49 +0200
Message-ID: <CAA8EJpptwvxahDL34HCo59Lh9nNjFwiyhru-jYmVHJOLQ7yC7g@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] drm/msm/a6xx: Introduce GMU wrapper support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 14:06, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
> but don't implement the associated GMUs. This is due to the fact that
> the GMU directly pokes at RPMh. Sadly, this means we have to take care
> of enabling & scaling power rails, clocks and bandwidth ourselves.
>
> Reuse existing Adreno-common code and modify the deeply-GMU-infused
> A6XX code to facilitate these GPUs. This involves if-ing out lots
> of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
> the actual name that Qualcomm uses in their downstream kernels).
>
> This is essentially a register region which is convenient to model
> as a device. We'll use it for managing the GDSCs. The register
> layout matches the actual GMU_CX/GX regions on the "real GMU" devices
> and lets us reuse quite a bit of gmu_read/write/rmw calls.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  53 +++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 244 +++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
>  5 files changed, 282 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 90e636dcdd5b..b2c56561cde6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c

[skipped]

>  struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> @@ -2063,18 +2235,36 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>
>         adreno_gpu->registers = NULL;
>
> +       /* Check if there is a GMU phandle and set it up */
> +       node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +       /* FIXME: How do we gracefully handle this? */
> +       BUG_ON(!node);

I thought that we should fix it, but then I noticed that this code was
just moved from the part below.

> +
> +       adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
> +
>         /*
>          * We need to know the platform type before calling into adreno_gpu_init
>          * so that the hw_apriv flag can be correctly set. Snoop into the info
>          * and grab the revision number
>          */
>         info = adreno_info(config->rev);
> -
> -       if (info && (info->revn == 650 || info->revn == 660 ||
> -                       adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))

Are we losing A635 here? I don't see it in the condition below.

> +       if (!info)
> +               return ERR_PTR(-EINVAL);
> +
> +       /* Assign these early so that we can use the is_aXYZ helpers */
> +       /* Numeric revision IDs (e.g. 630) */
> +       adreno_gpu->revn = info->revn;
> +       /* New-style ADRENO_REV()-only */
> +       adreno_gpu->rev = info->rev;
> +       /* Quirk data */
> +       adreno_gpu->info = info;
> +
> +       if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
>                 adreno_gpu->base.hw_apriv = true;
>
> -       a6xx_llc_slices_init(pdev, a6xx_gpu);
> +       /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> +       if (!adreno_has_gmu_wrapper(adreno_gpu))
> +               a6xx_llc_slices_init(pdev, a6xx_gpu);
>
>         ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>         if (ret) {
> @@ -2082,7 +2272,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>                 return ERR_PTR(ret);
>         }
>
> -       ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +       if (adreno_has_gmu_wrapper(adreno_gpu))
> +               ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
> +       else
> +               ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>         if (ret) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
>                 return ERR_PTR(ret);
> @@ -2095,13 +2288,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>         if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>                 priv->gpu_clamp_to_idle = true;
>
> -       /* Check if there is a GMU phandle and set it up */
> -       node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> -
> -       /* FIXME: How do we gracefully handle this? */
> -       BUG_ON(!node);
> -
> -       ret = a6xx_gmu_init(a6xx_gpu, node);
> +       if (adreno_has_gmu_wrapper(adreno_gpu))
> +               ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
> +       else
> +               ret = a6xx_gmu_init(a6xx_gpu, node);
>         of_node_put(node);
>         if (ret) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eea2e60ce3b7..51a7656072fa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b7e217d00a22..e11e8a02ac22 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>         /* Get the generic state from the adreno core */
>         adreno_gpu_state_get(gpu, &a6xx_state->base);
>
> -       a6xx_get_gmu_registers(gpu, a6xx_state);
> +       if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +               a6xx_get_gmu_registers(gpu, a6xx_state);
>
> -       a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> -       a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> -       a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
> +               a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> +               a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> +               a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>
> -       a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +               a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +       }
>
>         /* If GX isn't on the rest of the data isn't going to be accessible */
> -       if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> +       if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>                 return &a6xx_state->base;
>
>         /* Get the banks of indexed registers */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b4f9b1343d63..2c0f0ef094cb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -115,6 +115,7 @@ struct adreno_gpu {
>          * code (a3xx_gpu.c) and stored in this common location.
>          */
>         const unsigned int *reg_offsets;
> +       bool gmu_is_wrapper;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>
> @@ -145,6 +146,11 @@ struct adreno_platform_config {
>
>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
> +static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
> +{
> +       return gpu->gmu_is_wrapper;
> +}
> +
>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
>  {
>         return (gpu->revn < 300);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
