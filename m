Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7E765F00
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E57310E626;
	Thu, 27 Jul 2023 22:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD63210E618
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:12:14 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-c4cb4919bb9so1415371276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690495934; x=1691100734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nyxlgbjWQI1FZk1odjU2qQ7ZGnhrJ/VcGeGlZKp3H0I=;
 b=Swl9iYEGSVZamrk5OReiH1RxqPdckbGLPIO15Ypr/QKEBugavTEhJ6CaOGCrem+xs3
 ooNpMkr5P1fPdRcP8A0cbG2C+9IlcgRIKqDT+gG+PYDOFZusZxj91isKXu9lLz0SBbE+
 TQQrt9HjT8RQC6m3tDScfy4Io8zFctswGd2w8JbDtfIgt4a7lbW2+jjxTBljl4UkmDmJ
 460HTUuovd9Z39qUt5n+7ZYGqp4oPAm6D6oVbqOMt6Jzvs3NY1uY+kVGLnWaIx/n6bVR
 E/vzS7zmqvP9EmnWsXoA+iwsRtG4hbw5XdNoJMZapDICLmIQeOucq5q3O+elxDp8zgOB
 IU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495934; x=1691100734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyxlgbjWQI1FZk1odjU2qQ7ZGnhrJ/VcGeGlZKp3H0I=;
 b=aIhGjrC62A90HoRPlrNMdPxCyVYs6gvDdbRaLGSe9hUq6MvDTWpTAMjX9F2pxrLW6t
 Fdkb6VQt6M4f2+UuRdZwxWe5t5jvdLrmDElB/Zjdu16iSTRAcf7Rf6c1XNrEws8km+Sn
 8f8DnRoBUX/qO+qTWegsxSDFtJgOu7MHXwUJH4LKp0fgoadNmUqzyIVP5we9xaPiJkTH
 SRxqvLTFOOqZNoBjXNkqX3KHT7INI5tvKrt07qbeY2EmZWhkOglMRVYN8RhvC2XRaD6n
 +srEhgCCZIMDvL9WSjBM8mgDFXPiE/mDhYE1CZ3R0cb/0hx3yBMiwV8WE3DZ2Zhj8huv
 AHRg==
X-Gm-Message-State: ABy/qLb/3kncHnyK3D5YfcRuM4ZbBXQSVHbDkQJsrq+d7s8CoRhIX87v
 mA1R3rFX6nXtC+HApaHJ8CRfJuXFVTMP1kX1ZII6Ng==
X-Google-Smtp-Source: APBJJlFJHyxgfqGptThS/aAKO4OBdDuZHzhrrj5yHfxOg5ECYPOGLOrvCrl8Vh6oiMCYOSLs8WffJdIN9Fe3sbxSCcM=
X-Received: by 2002:a25:5c8:0:b0:d15:d97f:89f8 with SMTP id
 191-20020a2505c8000000b00d15d97f89f8mr635148ybf.62.1690495933853; Thu, 27 Jul
 2023 15:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-7-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-7-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 01:12:02 +0300
Message-ID: <CAA8EJposUxVoqApJwx0g5D_6Zw0DOs=OVmYwoUNXWYue7w2PQg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] drm/msm/adreno: Allow SoC specific gpu device
 table entries
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> There are cases where there are differences due to SoC integration.
> Such as cache-coherency support, and (in the next patch) e-fuse to
> speedbin mappings.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 3c531da417b9..e62bc895a31f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
> +       }, {
> +               .machine = "qcom,sm4350",
> +               .rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +               .revn = 619,
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a630_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a619_gmu.bin",

If those are GMU-less platforms, do we need the ADRENO_FW_GMU firmware?

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +               },
> +               .gmem = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .zapfw = "a615_zap.mdt",
> +               .hwcg = a615_hwcg,
> +       }, {
> +               .machine = "qcom,sm6375",
> +               .rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +               .revn = 619,
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a630_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a619_gmu.bin",
> +               },
> +               .gmem = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .zapfw = "a615_zap.mdt",
> +               .hwcg = a615_hwcg,
>         }, {
>                 .rev = ADRENO_REV(6, 1, 9, ANY_ID),
>                 .revn = 619,
> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
>         /* identify gpu: */
>         for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
>                 const struct adreno_info *info = &gpulist[i];
> +               if (info->machine && !of_machine_is_compatible(info->machine))
> +                       continue;
>                 if (adreno_cmp_rev(info->rev, rev))
>                         return info;
>         }
> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>                 config.rev.minor, config.rev.patchid);
>
>         priv->is_a2xx = config.rev.core == 2;
> +       priv->has_cached_coherent =
> +               !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>
>         gpu = info->init(drm);
>         if (IS_ERR(gpu)) {
> @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       priv->has_cached_coherent =
> -               !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> -               !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> -
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e08d41337169..d5335b99c64c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
>  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>
>  struct adreno_info {
> +       const char *machine;
>         struct adreno_rev rev;
>         uint32_t revn;
>         const char *fw[ADRENO_FW_MAX];
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
