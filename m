Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC080806A7F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CBA10E6C1;
	Wed,  6 Dec 2023 09:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C3110E6C1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:14:32 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d7346442d4so42464787b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701854072; x=1702458872; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qlCErtIVhbxcjY7zXRIxndr41fNa6EZG3xUiEtLYnTA=;
 b=Z5nKDSlcJJIALjSiUxYI8AGnRRztMkO4vfuF5+s1md/r4Iv8lOPCbpDUX16J7uwNzk
 UrjScKJ/DSZfxPYz/iPShOh3/8ExlZMX1yRE18CWpvey4aMe9THOGgyjVmF32oQn3xiD
 7iyl1uLW+AeHmOlmpUhsuWOZXrZJSTzutmytESS2+mDrAGoC6oaTzXftZis1z7Ja5s0l
 rmu0nycfu88SoNSufX6HWT/fUQhpfyzVwWiUu0yYf2gtzaEdxPRARmEf7lhcOHnO7aAq
 u6QbXZsMc2Y9ZRepB24avLq/Zc8yGS9Zuf2lmeWQ9QMKUyZlbu0SBRnt8D39t0rVJ/yf
 fSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701854072; x=1702458872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qlCErtIVhbxcjY7zXRIxndr41fNa6EZG3xUiEtLYnTA=;
 b=SKfMma+aLpQ52f+9+ead85vQGeVcICOHVIC6ZCyDwIxpAmoqNvWW9DfcY4a1REtp2b
 Rs4aCR967/cYf00hwbL/dM3OXfumf12IUDu3vuv589gWFk/Fw4vE/uTTNNFPOx9o7lmJ
 /BtJH8+z+UOVZXxKWOU1OethKZIWjKr0X7hBskrKkp8CeaSAg7PDXwkhVRVzCVgdSyqn
 aht9+Of0ak7LhAaY0ZCpNvKdJTgHMCKuSlTCacErfbVyRnxmC6l/Og4EPEyCmhfHZyxo
 X2h2SAHZM81Vej6ACb+7aKuyF7dXcTgz/u3/6jlbjA7p6tXMFAJVjrKgx6e2OCrUH61e
 nybA==
X-Gm-Message-State: AOJu0Yz2Bks9QpTSSqi2dSlePBkC9sc8s0UZ39XSIHyPEOCrJHXULaJY
 AuJMzrfw4bO5x1TYL16xc6TLnG2XyYa7W4kszfp16Q==
X-Google-Smtp-Source: AGHT+IEY7MlxjGJ0ou3pMTDwF+WI1Yzm//LSBTheVhpZzwvfaZ3oo+MexaxWdAVJC7yGqc9Tkr197T6ymTxjjCmGp30=
X-Received: by 2002:a0d:dfc5:0:b0:5d7:cfe5:a476 with SMTP id
 i188-20020a0ddfc5000000b005d7cfe5a476mr473398ywe.74.1701854071856; Wed, 06
 Dec 2023 01:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-5-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:14:20 +0200
Message-ID: <CAA8EJppALBgHekKm=+DSQdHV_tvqahHrS2Vb7Yqy4J+VuupM5g@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/adreno: Move hwcg table into a6xx specific
 info
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Introduce a6xx_info where we can stash gen specific stuff without
> polluting the toplevel adreno_info struct.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 55 +++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
>  4 files changed, 58 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index a35d4c112a61..3fb9e249567a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include "adreno_gpu.h"
> +#include "a6xx_gpu.h"
>  #include "a6xx.xml.h"
>  #include "a6xx_gmu.xml.h"
>
> @@ -465,7 +466,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a610_zap.mdt",
> -               .hwcg = a612_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a612_hwcg,
> +               },
>                 /*
>                  * There are (at least) three SoCs implementing A610: SM6125
>                  * (trinket), SM6115 (bengal) and SM6225 (khaje). Trinket does
> @@ -492,6 +495,8 @@ const struct adreno_info a6xx_gpus[] = {
>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
> +               .a6xx = &(struct a6xx_info) {
> +               },
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0,   0 },
>                         { 169, 1 },
> @@ -510,7 +515,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a615_zap.mdt",
> -               .hwcg = a615_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a615_hwcg,
> +               },
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0,   0 },
>                         { 138, 1 },
> @@ -529,7 +536,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a615_zap.mdt",
> -               .hwcg = a615_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a615_hwcg,
> +               },
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0,   0 },
>                         { 190, 1 },
> @@ -548,7 +557,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a615_zap.mdt",
> -               .hwcg = a615_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a615_hwcg,
> +               },
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0,   0 },
>                         { 120, 4 },
> @@ -572,7 +583,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a630_zap.mdt",
> -               .hwcg = a630_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a630_hwcg,
> +               },
>         }, {
>                 .chip_ids = ADRENO_CHIP_IDS(0x06040001),
>                 .family = ADRENO_6XX_GEN2,
> @@ -586,7 +599,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a640_zap.mdt",
> -               .hwcg = a640_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a640_hwcg,
> +               },
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0, 0 },
>                         { 1, 1 },
> @@ -605,7 +620,9 @@ const struct adreno_info a6xx_gpus[] = {
>                         ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a650_zap.mdt",
> -               .hwcg = a650_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a650_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0, 0 },
> @@ -627,7 +644,9 @@ const struct adreno_info a6xx_gpus[] = {
>                         ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a660_zap.mdt",
> -               .hwcg = a660_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a660_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>         }, {
>                 .chip_ids = ADRENO_CHIP_IDS(0x06030500),
> @@ -642,7 +661,9 @@ const struct adreno_info a6xx_gpus[] = {
>                         ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a660_zap.mbn",
> -               .hwcg = a660_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a660_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>                 .speedbins = ADRENO_SPEEDBINS(
>                         { 0,   0 },
> @@ -663,7 +684,9 @@ const struct adreno_info a6xx_gpus[] = {
>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a640_zap.mdt",
> -               .hwcg = a640_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a640_hwcg,
> +               },
>         }, {
>                 .chip_ids = ADRENO_CHIP_IDS(0x06090000),
>                 .family = ADRENO_6XX_GEN4,
> @@ -677,7 +700,9 @@ const struct adreno_info a6xx_gpus[] = {
>                         ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a690_zap.mdt",
> -               .hwcg = a690_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a690_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>         }, {
>                 /* sentinal */
> @@ -822,7 +847,9 @@ const struct adreno_info a7xx_gpus[] = {
>                           ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a730_zap.mdt",
> -               .hwcg = a730_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a730_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>         }, {
>                 .chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
> @@ -837,7 +864,9 @@ const struct adreno_info a7xx_gpus[] = {
>                           ADRENO_QUIRK_HAS_HW_APRIV,
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a740_zap.mdt",
> -               .hwcg = a740_hwcg,
> +               .a6xx = &(struct a6xx_info) {
> +                       .hwcg = a740_hwcg,
> +               },
>                 .address_space_size = SZ_16G,
>         }, {
>                 /* sentinal */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e0414d0753ad..a064eb42eedd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -403,7 +403,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>         unsigned int i;
>         u32 val, clock_cntl_on, cgc_mode;
>
> -       if (!adreno_gpu->info->hwcg)
> +       if (!adreno_gpu->info->a6xx->hwcg)
>                 return;
>
>         if (adreno_is_a630(adreno_gpu))
> @@ -434,7 +434,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>         if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
>                 gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>
> -       for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
> +       for (i = 0; (reg = &adreno_gpu->info->a6xx->hwcg[i], reg->offset); i++)
>                 gpu_write(gpu, reg->offset, state ? reg->value : 0);
>
>         /* Enable SP clock */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 34822b080759..1840c1f3308e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -12,6 +12,15 @@
>
>  extern bool hang_debug;
>
> +/**
> + * struct a6xx_info - a6xx specific information from device table
> + *
> + * @hwcg: hw clock gating register sequence
> + */
> +struct a6xx_info {
> +       const struct adreno_reglist *hwcg;
> +};
> +
>  struct a6xx_gpu {
>         struct adreno_gpu base;
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 5d094c5ec363..cba53203de98 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -81,6 +81,8 @@ struct adreno_speedbin {
>         uint16_t speedbin;
>  };
>
> +struct a6xx_info;
> +
>  struct adreno_info {
>         const char *machine;
>         /**
> @@ -97,7 +99,9 @@ struct adreno_info {
>         struct msm_gpu *(*init)(struct drm_device *dev);
>         const char *zapfw;
>         u32 inactive_period;
> -       const struct adreno_reglist *hwcg;
> +       union {
> +               const struct a6xx_info *a6xx;
> +       };

I think the usual pattern is to subclass the common structure rather
than adding a polymorphic field.

So, from my point of view, it should be:

struct a6xx_info {
     struct adreno_info base;

     struct areno_reglist *hwcg;
};


>         u64 address_space_size;
>         /**
>          * @speedbins: Optional table of fuse to speedbin mappings
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
