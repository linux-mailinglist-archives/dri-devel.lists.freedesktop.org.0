Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C274BA21
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2C10E620;
	Fri,  7 Jul 2023 23:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6510E620;
 Fri,  7 Jul 2023 23:52:58 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-563439ea4a2so1789742eaf.0; 
 Fri, 07 Jul 2023 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688773977; x=1691365977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhBNl+x27EGIrHlrbRcheA8RJ1lqRzdgUia98AB/1w4=;
 b=Jy4XH9aq5GPrSMaBWpif1+7sCrTGuVGREbIpFWRGxqQnysQNrs/I+IDEHngUQKUYLl
 JLpA4vx4NwEsYAuZOV59lXQ0xaQCOPQDXEz79MKiUdJQEkSMABvYphunUgupixyQYS1G
 8ZuNCxahXRuoI4c0j1iITChxFoprIPfY5MOHk1CiCMELNYchWTZDOyln3SVZ2RPnmys7
 j3qS4wfF85ybqmy8U4zpG3sG/YvQ84hiqOG3ECGGvlrPn1hyWpny6Rvv8bqp+GgNEX4V
 XyWC59gxVRTr/h7EShMbIRi7Wwhurw7ba2Eoi/qAyXq433PgDJuBv2JDOKRdDTlOabHk
 7ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688773977; x=1691365977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhBNl+x27EGIrHlrbRcheA8RJ1lqRzdgUia98AB/1w4=;
 b=Mux+NAKsncp7UYawdxN8JNbBqGBTaW/WAj6fOk8F9dryfVox5C2yyMaWiZnOf+Woid
 oHyNfWc+gMZdQ6zSwDW7YAn0mFbGk8tlJMJoOARaKSrCrsBnyhTEtRYoBrsrdOU8vd7s
 9jJgo2bTBlOmGRzk4aaZFw+ymPcdvz4RG1iLVZcXTO6lGH6rcjF0eh+/XLFqFa2KxhBR
 7CE+H2PZdvflMPHqcLLGVgcHx5G0dnJMxMs9vnn9RJpeasPouf3pMpI4wEfqG+1tH080
 jd0/zVVDcIVoi4DaFVa8sMSfduEQzjD7PgJB7q2ABN0nETIP1HzIVoaJVnwxnuMHFrc7
 tKpw==
X-Gm-Message-State: ABy/qLYwiU0GCLtM5mZbsb/PIq4s3iL5p8in2LX3qbsIsCoJ/3dmTeKE
 JEFp2xiLItKDaT0HEsSdftFc6ye1LXkjDKm+L5VfN4/1
X-Google-Smtp-Source: APBJJlHU8J7bJhkj2K9qh7APQs0aMCFDoCz7szNl7em8IvJ34se+RKVgfttFTToa/KJN4O53NjV0HMsIg5b7zDtia2Y=
X-Received: by 2002:a4a:4110:0:b0:566:3723:a029 with SMTP id
 x16-20020a4a4110000000b005663723a029mr5147620ooa.3.1688773976719; Fri, 07 Jul
 2023 16:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-10-robdclark@gmail.com>
 <c41b8ce0-8149-911b-0c6e-f963c830ac92@linaro.org>
 <688c5dc3-ad46-2dfe-e418-c1b1cba767b8@linaro.org>
In-Reply-To: <688c5dc3-ad46-2dfe-e418-c1b1cba767b8@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Jul 2023 16:52:45 -0700
Message-ID: <CAF6AEGtGcyUNfFfEWPti5U+=z0hZ9Sj57u5SGpObXwz14QcZ4g@mail.gmail.com>
Subject: Re: [PATCH 09/12] drm/msm/adreno: Add adreno family
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 8:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/07/2023 02:35, Konrad Dybcio wrote:
> > On 6.07.2023 23:10, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> Sometimes it is useful to know the sub-generation (or "family").  And =
in
> >> any case, this helps us get away from infering the generation from the
> >> numerical chip-id.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> > [...]
> >
> >>              .rev   =3D ADRENO_REV(5, 0, 8, ANY_ID),
> >> +            .family =3D ADRENO_5XX,
> >>              .revn =3D 508,
> > 508 is from 530 fam
> >
> >>              .fw =3D {
> >>                      [ADRENO_FW_PM4] =3D "a530_pm4.fw",
> >> @@ -156,6 +168,7 @@ static const struct adreno_info gpulist[] =3D {
> >>              .zapfw =3D "a508_zap.mdt",
> >>      }, {
> >>              .rev   =3D ADRENO_REV(5, 0, 9, ANY_ID),
> >> +            .family =3D ADRENO_5XX,
> >>              .revn =3D 509,
> > 509 and 512 are from 540 fam
> >
> >>              .fw =3D {
> >>                      [ADRENO_FW_PM4] =3D "a530_pm4.fw",
> >> @@ -173,6 +186,7 @@ static const struct adreno_info gpulist[] =3D {
> >>              .zapfw =3D "a512_zap.mdt",
> >>      }, {
> >>              .rev   =3D ADRENO_REV(5, 1, 0, ANY_ID),
> >> +            .family =3D ADRENO_5XX,
> >>              .revn =3D 510,
> > 510 is 530ish but I think it's closer to 505 or whatever the
> > 8953 gpu was called
>
> I'd say, there were following generations here:
>
> - a505 / a506 / a508
> - a509 / a512
> - a510
> - a530
> - a540
>
> Indeed a50x were close to a530 in some aspects and a509/512 being closer
> to a540, but I don't think they were the same family.

As a practical matter, I chose to defer splitting a3xx/a4xx/a5xx into
sub-generations, simply because we didn't have any use for that yet.
For a2xx and a6xx there was a clear immediate use for (most of) it,
and what isn't used falls out of usage of sub-generation
classification we have in mesa, so I have a lot of confidence in the
split.

We can try and map it all out for the other gens now.. or simply just
wait until there is a use for it.  I'm not super against mapping it
out better now, but didn't feel that there was any down side to just
punting on that.  It would be easy enough to do follow-up patches that
refactor the code and split out the subgen enums at the same time.

BR,
-R

> >
> > [...]
> >
> >> -    priv->is_a2xx =3D config.rev.core =3D=3D 2;
> >> +    priv->is_a2xx =3D info->family < ADRENO_3XX;
> > is this variable even needed now that there are explicit family values?
> >
> > Konrad
> >>      priv->has_cached_coherent =3D
> >>              !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index 2e62a7ce9f13..75ff7fb46099 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -1079,8 +1079,13 @@ int adreno_gpu_init(struct drm_device *drm, str=
uct platform_device *pdev,
> >>      u32 speedbin;
> >>      int ret;
> >>
> >> +    adreno_gpu->funcs =3D funcs;
> >> +    adreno_gpu->info =3D adreno_info(config->rev);
> >> +    adreno_gpu->rev =3D *rev;
> >> +
> >>      /* Only handle the core clock when GMU is not in use (or is absen=
t). */
> >> -    if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
> >> +    if (adreno_has_gmu_wrapper(adreno_gpu) ||
> >> +        adreno_gpu->info->family < ADRENO_6XX_GEN1) {
> >>              /*
> >>               * This can only be done before devm_pm_opp_of_add_table(=
), or
> >>               * dev_pm_opp_set_config() will WARN_ON()
> >> @@ -1096,10 +1101,6 @@ int adreno_gpu_init(struct drm_device *drm, str=
uct platform_device *pdev,
> >>                      devm_pm_opp_set_clkname(dev, "core");
> >>      }
> >>
> >> -    adreno_gpu->funcs =3D funcs;
> >> -    adreno_gpu->info =3D adreno_info(config->rev);
> >> -    adreno_gpu->rev =3D *rev;
> >> -
> >>      if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> >>              speedbin =3D 0xffff;
> >>      adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 6066cfaaea52..2fa14dcd4e40 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -29,6 +29,25 @@ enum {
> >>      ADRENO_FW_MAX,
> >>   };
> >>
> >> +/**
> >> + * @enum adreno_family: identify generation and possibly sub-generati=
on
> >> + *
> >> + * In some cases there are distinct sub-generations within a major re=
vision
> >> + * so it helps to be able to group the GPU devices by generation and =
if
> >> + * necessary sub-generation.
> >> + */
> >> +enum adreno_family {
> >> +    ADRENO_2XX_GEN1,  /* a20x */
> >> +    ADRENO_2XX_GEN2,  /* a22x */
> >> +    ADRENO_3XX,
> >> +    ADRENO_4XX,
> >> +    ADRENO_5XX,
> >> +    ADRENO_6XX_GEN1,  /* a630 family */
> >> +    ADRENO_6XX_GEN2,  /* a640 family */
> >> +    ADRENO_6XX_GEN3,  /* a650 family */
> >> +    ADRENO_6XX_GEN4,  /* a660 family */
> >> +};
> >> +
> >>   #define ADRENO_QUIRK_TWO_PASS_USE_WFI              BIT(0)
> >>   #define ADRENO_QUIRK_FAULT_DETECT_MASK             BIT(1)
> >>   #define ADRENO_QUIRK_LMLOADKILL_DISABLE            BIT(2)
> >> @@ -63,6 +82,7 @@ extern const struct adreno_reglist a660_hwcg[], a690=
_hwcg[];
> >>   struct adreno_info {
> >>      const char *machine;
> >>      struct adreno_rev rev;
> >> +    enum adreno_family family;
> >>      uint32_t revn;
> >>      const char *fw[ADRENO_FW_MAX];
> >>      uint32_t gmem;
> >> @@ -188,14 +208,14 @@ static inline bool adreno_is_a2xx(const struct a=
dreno_gpu *gpu)
> >>   {
> >>      if (WARN_ON_ONCE(!gpu->info))
> >>              return false;
> >> -    return (gpu->info->revn < 300);
> >> +    return gpu->info->family < ADRENO_2XX_GEN2;
> >>   }
> >>
> >>   static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
> >>   {
> >>      if (WARN_ON_ONCE(!gpu->info))
> >>              return false;
> >> -    return (gpu->info->revn < 210);
> >> +    return gpu->info->family =3D=3D ADRENO_2XX_GEN1;
> >>   }
> >>
> >>   static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
> >> @@ -338,29 +358,31 @@ static inline int adreno_is_a690(const struct ad=
reno_gpu *gpu)
> >>   /* check for a615, a616, a618, a619 or any a630 derivatives */
> >>   static inline int adreno_is_a630_family(const struct adreno_gpu *gpu=
)
> >>   {
> >> -    return adreno_is_revn(gpu, 630) ||
> >> -            adreno_is_revn(gpu, 615) ||
> >> -            adreno_is_revn(gpu, 616) ||
> >> -            adreno_is_revn(gpu, 618) ||
> >> -            adreno_is_revn(gpu, 619);
> >> +    if (WARN_ON_ONCE(!gpu->info))
> >> +            return false;
> >> +    return gpu->info->family =3D=3D ADRENO_6XX_GEN1;
> >>   }
> >>
> >>   static inline int adreno_is_a660_family(const struct adreno_gpu *gpu=
)
> >>   {
> >> -    return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c=
3(gpu);
> >> +    if (WARN_ON_ONCE(!gpu->info))
> >> +            return false;
> >> +    return gpu->info->family =3D=3D ADRENO_6XX_GEN4;
> >>   }
> >>
> >>   /* check for a650, a660, or any derivatives */
> >>   static inline int adreno_is_a650_family(const struct adreno_gpu *gpu=
)
> >>   {
> >> -    return adreno_is_revn(gpu, 650) ||
> >> -            adreno_is_revn(gpu, 620) ||
> >> -            adreno_is_a660_family(gpu);
> >> +    if (WARN_ON_ONCE(!gpu->info))
> >> +            return false;
> >> +    return gpu->info->family >=3D ADRENO_6XX_GEN3;
> >>   }
> >>
> >>   static inline int adreno_is_a640_family(const struct adreno_gpu *gpu=
)
> >>   {
> >> -    return adreno_is_a640(gpu) || adreno_is_a680(gpu);
> >> +    if (WARN_ON_ONCE(!gpu->info))
> >> +            return false;
> >> +    return gpu->info->family =3D=3D ADRENO_6XX_GEN2;
> >>   }
> >>
> >>   u64 adreno_private_address_space_size(struct msm_gpu *gpu);
>
> --
> With best wishes
> Dmitry
>
