Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01EA36F12
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 16:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C64210E174;
	Sat, 15 Feb 2025 15:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GlRxK2xL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB5310E174
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 15:22:53 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e587cca1e47so2741697276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739632972; x=1740237772; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ya1HOp4At8o4rZdZ1CZR9DS9vtC+SlJcJNAQgmy2no=;
 b=GlRxK2xLgzzL3vd+L7enMFcjNIrQH/yeyfKNsTzxgQga7GGb0wIUlhO4qv/y5iuWSb
 lAouaDFkRrdCEpZ/JsQLxFLf7Dy4VBeBoq6n3UdUnQzdOusoU1fwaGn1vVErXoMRUEeh
 0g9ftMDLpT9jkgdSt766nGiGqNqHTU6IkJ7GiGiO2PuYMjQhVHuTKQm1SSqPec8rpZvl
 L2W8Dxi6vFkOYpJmqC4shHUusl4Zuy4g1Eiwl5F4R3Zghk2337iNQFeUEN4qUkXctcsF
 Sqr6yNAGJYV/wFpsrBUR+poXQi6wKlZFs2VROkmwuknxNbxkwrxfBF1/azlMrrMSf83b
 Timw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739632972; x=1740237772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ya1HOp4At8o4rZdZ1CZR9DS9vtC+SlJcJNAQgmy2no=;
 b=EjzjuHTZzbvPIgYbJPgMD05MOg/+D3wck/owVL8CRc1erd3DJStYOIk6oldoK9cScL
 eI0SmkfV1k6foY0m2OECfb5+8oClOEaCyYX9WHY3qdAmttjptlkfacA6M1lkWHJ52LgW
 4XWo35m3K6fITonRmh1E/K2LhwN7+gjhfiBJnhtSQBpCdFa1Bls5obrXaV4lCkZN/fok
 d7/FGPdjIMfL0wAtZJPyKl8qZzYDYNV7ovIHEaBFFAFUEE92KTVs6okf8c9UvQMK/ltk
 0ZE+41ZW0wsUGkPeHLAA/iSJ3oJsFr5NYEFRUYaHwXrIWjIWP0jgTvoMMkgfGfakTXDy
 pNNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzl82ui4esK5x13UsOUZ3If44sGdD89dn6k1Yo+UhegjU/cKPujcWUGn+ZL8LF5nAVOmvx9FE9TPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz5ewUqnsAa4/bOR99/LJa3LUDyglxDguTqgHR3jfdr49WssMq
 xQ/uqwr0oj9aO+kba1cCFXolJqJmlewdcLalyKQ5QJ035nDKlq0XFQWuSYDJJH5ZB/ulAOkTi2f
 RXmBIA410KDSpJOh51wSg6F0U0PCtsXk+xShbDQ==
X-Gm-Gg: ASbGncsrwBbVonXigYWfl2a76n7dtkSHyTp9bkHKRS6jYxq0Zrei3FZeib1SWUGrCbq
 4+fd4+XBkHPa6gHwXDsA36xXM1RSbWcDkV0YqoAwA61fk6BO4mypYp0km5plMEp0Q4u2rlsmHKm
 QvodNBYkNfAXJIJCOdRVGCY9HEGg==
X-Google-Smtp-Source: AGHT+IHCM9nGvMBLMHM0urprzaVEMr1E9JJGwJN2aU4oCsO5lmJSn8L5sb5ABAdmNNdEk78PHDTei2/liPwZS3V/suk=
X-Received: by 2002:a05:690c:6405:b0:6ef:6f24:d093 with SMTP id
 00721157ae682-6fb58260edamr32798287b3.6.1739632972228; Sat, 15 Feb 2025
 07:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
 <ttipuo56z76svx3womcrrqurglvovkqehsx2orgnegjj2z7uxn@d3cov6qmmalm>
 <182b7896-9cfc-4f94-b9d4-759fd85fd997@quicinc.com>
In-Reply-To: <182b7896-9cfc-4f94-b9d4-759fd85fd997@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Feb 2025 17:22:40 +0200
X-Gm-Features: AWEUYZkkpka5cr642Meq7bthCAe5gt3dTkRMkIvHVkAt9bN0FOufwH7vzAGO4cA
Message-ID: <CAA8EJppO6ob+oQTzPkx1D6Fmq7bfyNquEyXwFXhmiiTKtXrOAA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jie Zhang <quic_jiezh@quicinc.com>
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

On Sat, 15 Feb 2025 at 13:49, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 2/13/2025 10:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 09:40:07PM +0530, Akhil P Oommen wrote:
> >> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>
> >> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> >>
> >> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
> >>  4 files changed, 43 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index edffb7737a97..ac156c8b5af9 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
> >>                      { 0, 0 },
> >>                      { 137, 1 },
> >>              ),
> >> +    }, {
> >> +            .chip_ids = ADRENO_CHIP_IDS(0x06020300),
> >> +            .family = ADRENO_6XX_GEN3,
> >> +            .fw = {
> >> +                    [ADRENO_FW_SQE] = "a650_sqe.fw",
> >> +                    [ADRENO_FW_GMU] = "a623_gmu.bin",
> >> +            },
> >> +            .gmem = SZ_512K,
> >> +            .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >> +            .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >> +                    ADRENO_QUIRK_HAS_HW_APRIV,
> >> +            .init = a6xx_gpu_init,
> >> +            .a6xx = &(const struct a6xx_info) {
> >> +                    .hwcg = a620_hwcg,
> >> +                    .protect = &a650_protect,
> >> +                    .gmu_cgc_mode = 0x00020200,
> >> +                    .prim_fifo_threshold = 0x00010000,
> >> +                    .bcms = (const struct a6xx_bcm[]) {
> >> +                            { .name = "SH0", .buswidth = 16 },
> >> +                            { .name = "MC0", .buswidth = 4 },
> >> +                            {
> >> +                                    .name = "ACV",
> >> +                                    .fixed = true,
> >> +                                    .perfmode = BIT(3),
> >> +                            },
> >> +                            { /* sentinel */ },
> >> +                    },
> >> +            },
> >> +            .address_space_size = SZ_16G,
> >>      }, {
> >>              .chip_ids = ADRENO_CHIP_IDS(
> >>                      0x06030001,
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 0ae29a7c8a4d..1820c167fcee 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>              gpu->ubwc_config.uavflagprd_inv = 2;
> >>      }
> >>
> >> +    if (adreno_is_a623(gpu)) {
> >> +            gpu->ubwc_config.highest_bank_bit = 16;
> >> +            gpu->ubwc_config.amsbc = 1;
> >
> > This bit causes my question: the patch for msm_mdss states that on the
> > display side both UBWC encoder and decoder are 4.0, which means that the
> > UBWC_AMSBC bit won't be set in the UBWC_STATIC register.
>
> Not sure, but my guess is that AMSBC encoding is probably implicitly
> enabled by MDSS HW when UBWC v4 is configured.

Ack.

>
> -Akhil
>
> >
> >> +            gpu->ubwc_config.rgb565_predicator = 1;
> >> +            gpu->ubwc_config.uavflagprd_inv = 2;
> >> +            gpu->ubwc_config.macrotile_mode = 1;
> >> +    }
> >> +
> >>      if (adreno_is_a640_family(gpu))
> >>              gpu->ubwc_config.amsbc = 1;
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> index 2c10474ccc95..3222a406d089 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> @@ -1227,7 +1227,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
> >>      _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
> >>              &a6xx_state->gmu_registers[1], true);
> >>
> >> -    if (adreno_is_a621(adreno_gpu))
> >> +    if (adreno_is_a621(adreno_gpu) || adreno_is_a623(adreno_gpu))
> >>              _a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
> >>                      &a6xx_state->gmu_registers[2], false);
> >>      else
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> index dcf454629ce0..92caba3584da 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -442,6 +442,11 @@ static inline int adreno_is_a621(const struct adreno_gpu *gpu)
> >>      return gpu->info->chip_ids[0] == 0x06020100;
> >>  }
> >>
> >> +static inline int adreno_is_a623(const struct adreno_gpu *gpu)
> >> +{
> >> +    return gpu->info->chip_ids[0] == 0x06020300;
> >> +}
> >> +
> >>  static inline int adreno_is_a630(const struct adreno_gpu *gpu)
> >>  {
> >>      return adreno_is_revn(gpu, 630);
> >>
> >> --
> >> 2.45.2
> >>
> >
>


-- 
With best wishes
Dmitry
