Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E39766FAC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1310E6A1;
	Fri, 28 Jul 2023 14:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB31110E0D9;
 Fri, 28 Jul 2023 14:43:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so2830432e87.3; 
 Fri, 28 Jul 2023 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690555429; x=1691160229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHzUY9sYMItLasKpt4uG/MHkQcPQOL+MsJeYY06IBUU=;
 b=OZlVW/1N+7b9oDDNV6D8sCeYYoq5+CFVC7BFZYUFeVle884vF2/SSqBLtBEjVfaUfW
 drAiQWCNTEq9DHFmx2tIx5NDTMxatGYdvl2qNUyAPPJlSgUxZVcLcWDpU31YdiWb/oOE
 QvSLf5/M/SDpTtF/9S2oZTPaHLuoIWLotoQb1RhwxWYJ6JE6KNNcbnE/RlzZBq3SCFK7
 K6ig68ERvt84LejC1lZKgoxLlzx/jzON7DHoH3I4J8qP5euvbiP4LOPee24LlGCMvgzD
 ESknGtO3iDvPsTEQJoJn5a4e7h7WmDQI410RXS86/1xVuAIWqrmmZi/pUsxfm6HwoG2j
 XlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690555429; x=1691160229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHzUY9sYMItLasKpt4uG/MHkQcPQOL+MsJeYY06IBUU=;
 b=MXElX9HbWdnCW3EamhNYLbijLAskgwgEleANe2TFlJHoomRkocOMF+tJ3F4kSXBHQj
 ODU04lDT2mail0mZkRmCdfsJ4zYmCasesRtj8iuLgUcfW/Vu1XQvVQ21GWw4YJ9o4SuE
 qopmrFkSwhldac3D/eTFU3a8vRNrNQXDiwvyow6QbH1zesU2qMX6ek0lN/ZcVmGuGPle
 dzjYuPsOpDvQLxjsZEsovPDZOH4CSMLEiIzc1E4jAXfkwUVLp8osPJTklC8dHX3VMZzI
 vfibYe5cZh+YOjnIANMfdiRAVAOnbUjsxDPEXeW8IVm036DSpgl/+f9B8igIwdO27ABA
 RX2w==
X-Gm-Message-State: ABy/qLag8iLT9g+/MPf6TvPSePVVH343PFo+m9IIztkXt7pQG0WAznbX
 mZZZ8hfEqsVl3bIccp78PoIja3LbKQm+G1YSKNY=
X-Google-Smtp-Source: APBJJlEiCi1ztnb5VEvUBph+MaUcqhJjJh7os+xkTNI+vPTwQ4wcs69s0jkiJXtjqd3HECMpaP2G2R9iVuC3rTD5KWU=
X-Received: by 2002:a05:6512:3e6:b0:4fb:73ce:8e7d with SMTP id
 n6-20020a05651203e600b004fb73ce8e7dmr1740686lfq.15.1690555428780; Fri, 28 Jul
 2023 07:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
 <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
 <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
 <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
 <f58998c9-82d3-d2fe-6f1c-801e616467be@linaro.org>
 <CAF6AEGu4_9kWyHCV0TOOU0vCqLBmrtEZDm9fAeMHNeDei7K8aQ@mail.gmail.com>
 <CAA8EJpr7Ed3ZBXfFxPV4u0t5obsP8yL5h3vwPMZSHjAMDQaA9w@mail.gmail.com>
 <CAF6AEGsMx3dfn5AiFyiacH22Zhf6jcO7+apam_mckhLreNCRtA@mail.gmail.com>
 <CAA8EJpoZhw1k5b346YDFX_cpSNG22NYRUsckA0hKiTspC8on6g@mail.gmail.com>
In-Reply-To: <CAA8EJpoZhw1k5b346YDFX_cpSNG22NYRUsckA0hKiTspC8on6g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 07:43:37 -0700
Message-ID: <CAF6AEGtM6_R=PeLTFA+V_116kjGzCM7GoSCvDMzyrx8Z7j=8Qg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 3:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 28 Jul 2023 at 00:13, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Jul 26, 2023 at 3:33=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 27 Jul 2023 at 01:04, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 26, 2023 at 2:43=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On 26/07/2023 23:11, Rob Clark wrote:
> > > > > > On Wed, Jul 26, 2023 at 1:00=E2=80=AFPM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >>
> > > > > >> On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> =
wrote:
> > > > > >>>
> > > > > >>> On Thu, Jul 13, 2023 at 1:26=E2=80=AFPM Akhil P Oommen <quic_=
akhilpo@quicinc.com> wrote:
> > > > > >>>>
> > > > > >>>> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov w=
rote:
> > > > > >>>>>
> > > > > >>>>> On 07/07/2023 00:10, Rob Clark wrote:
> > > > > >>>>>> From: Rob Clark <robdclark@chromium.org>
> > > > > >>>>>>
> > > > > >>>>>> There are cases where there are differences due to SoC int=
egration.
> > > > > >>>>>> Such as cache-coherency support, and (in the next patch) e=
-fuse to
> > > > > >>>>>> speedbin mappings.
> > > > > >>>>>
> > > > > >>>>> I have the feeling that we are trying to circumvent the way=
 DT works. I'd
> > > > > >>>>> suggest adding explicit SoC-compatible strings to Adreno bi=
ndings and then
> > > > > >>>>> using of_device_id::data and then of_device_get_match_data(=
).
> > > > > >>>>>
> > > > > >>>> Just thinking, then how about a unique compatible string whi=
ch we match
> > > > > >>>> to identify gpu->info and drop chip-id check completely here=
?
> > > > > >>>
> > > > > >>> Ok, I think we could do this, so something like:
> > > > > >>>
> > > > > >>>    compatible =3D "qcom,sm4350-adreno-619.0", qcom,adreno-619=
.0", "qcom,adreno"
> > > > > >>>
> > > > > >>> ?
> > > > > >>>
> > > > > >>> It looks like we don't have gpu dt bits upstream yet for eith=
er sm4350
> > > > > >>> or sm6375, so I suppose we could get away with this change
> > > > > >>
> > > > > >> I think we can even skip the 619.0 part in the SoC compat stri=
ng.
> > > > > >> So it will be:
> > > > > >>
> > > > > >> compatible =3D "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom=
,adreno";
> > > > > >>
> > > > > >> In future we can drop the chipid part completely and handle th=
at as a
> > > > > >> part of SoC data:
> > > > > >>
> > > > > >> compatible =3D "qcom,sm4350-adreno", "qcom,adreno";
> > > > > >>
> > > > > >> With the driver knowing that sm4350-adreno means ADRENO_ID(6,1=
,9,0)
> > > > > >>
> > > > > >
> > > > > > I don't think we can do that, there are cases where the same So=
C had
> > > > > > multiple revisions of adreno.
> > > > >
> > > > > Is that the case for the production versions of the SoC? In other
> > > > > subsystems what we usually do is that we add support only for the=
 latest
> > > > > SoC revision (which would probably mean the latest GPU patch revi=
sion).
> > > > > Previous GPU revisions can be added in the following way (pure ex=
ample):
> > > > >
> > > > > qcom,sm4350-adreno -> 6,1,9,1 // assuming v2.0 or v1.1 is the com=
mercial
> > > > > sample
> > > > > qcom,sm4350-v1-adreno -> 6,1,9,0
> > > > >
> > > >
> > > > My recollection was that nexus4 shipped with an early version of 80=
64
> > > > which needed userspace workarounds that later 8064 did not.  Not su=
re
> > > > if that is the only such example, but it is one that userspace need=
ed
> > > > to be aware of.
> > >
> > > Good question. I don't have nexus4, and both nexus7 and ifc6410 work =
fine.
> > >
> > > And this is a perfect use case for "qcom,apq8064-v1.1-adreno" compat =
string.
> >
> > At this point, I'm failing to see why my original solution of just
> > checking of_machine_is_compatible() is worse ;-)
> >
> > I mean what is the difference between checking
> > "qcom,apq8064-v1.1-adreno" and "qcom,apq8064-v1.1".  I wouldn't really
> > want to use of_match_node() in either case.
>
> I have been proposing to use of_device_get_match_data().

That has the same limitation when it comes to our needs.. our current
setup lets us have a single table entry that matches multiple
chip-id's.  I don't really see the point of using of_match_node() or
of_device_get_match_data() just for the sake of using them.

BR,
-R

> >
> > BR,
> > -R
> >
> > > >
> > > > Anyways, future things, it sounds like we'll be able to read the id
> > > > from the hw/fw.  I'm not really a fan of breaking dtb fwd/bk compat=
,
> > > > so I don't want to change any of the existing compat strings.
> > >
> > > I think so too. Current compat strings should stay.
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > >  We could possibly do that with future
> > > > > > things where we can read the chip-id from fw.
> > > > > >
> > > > > > What we _could_ do at the expense of making the compatible pars=
ing a
> > > > > > tiny bit more complex is something like:
> > > > > >
> > > > > >     compatible =3D "qcom,sm4350-adreno-619.0", "qcom,adreno"
> > > > > >
> > > > > > BR,
> > > > > > -R
> > > > > >
> > > > > >>>
> > > > > >>> BR,
> > > > > >>> -R
> > > > > >>>
> > > > > >>>> -Akhil
> > > > > >>>>
> > > > > >>>>>>
> > > > > >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > >>>>>> ---
> > > > > >>>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++=
++++++++++++---
> > > > > >>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> > > > > >>>>>>    2 files changed, 31 insertions(+), 4 deletions(-)
> > > > > >>>>>>
> > > > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/=
drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > >>>>>> index 3c531da417b9..e62bc895a31f 100644
> > > > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > > >>>>>> @@ -258,6 +258,32 @@ static const struct adreno_info gpuli=
st[] =3D {
> > > > > >>>>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > > >>>>>>              .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > > > > >>>>>>              .init =3D a6xx_gpu_init,
> > > > > >>>>>> +   }, {
> > > > > >>>>>> +           .machine =3D "qcom,sm4350",
> > > > > >>>>>> +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > > > >>>>>> +           .revn =3D 619,
> > > > > >>>>>> +           .fw =3D {
> > > > > >>>>>> +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > > > >>>>>> +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > > > >>>>>> +           },
> > > > > >>>>>> +           .gmem =3D SZ_512K,
> > > > > >>>>>> +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > > >>>>>> +           .init =3D a6xx_gpu_init,
> > > > > >>>>>> +           .zapfw =3D "a615_zap.mdt",
> > > > > >>>>>> +           .hwcg =3D a615_hwcg,
> > > > > >>>>>> +   }, {
> > > > > >>>>>> +           .machine =3D "qcom,sm6375",
> > > > > >>>>>> +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > > > >>>>>> +           .revn =3D 619,
> > > > > >>>>>> +           .fw =3D {
> > > > > >>>>>> +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > > > >>>>>> +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > > > >>>>>> +           },
> > > > > >>>>>> +           .gmem =3D SZ_512K,
> > > > > >>>>>> +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > > >>>>>> +           .init =3D a6xx_gpu_init,
> > > > > >>>>>> +           .zapfw =3D "a615_zap.mdt",
> > > > > >>>>>> +           .hwcg =3D a615_hwcg,
> > > > > >>>>>>      }, {
> > > > > >>>>>>              .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > > > >>>>>>              .revn =3D 619,
> > > > > >>>>>> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(=
struct adreno_rev rev)
> > > > > >>>>>>      /* identify gpu: */
> > > > > >>>>>>      for (i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > > > > >>>>>>              const struct adreno_info *info =3D &gpulist[i=
];
> > > > > >>>>>> +           if (info->machine && !of_machine_is_compatible=
(info->machine))
> > > > > >>>>>> +                   continue;
> > > > > >>>>>>              if (adreno_cmp_rev(info->rev, rev))
> > > > > >>>>>>                      return info;
> > > > > >>>>>>      }
> > > > > >>>>>> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *=
dev, struct device *master, void *data)
> > > > > >>>>>>              config.rev.minor, config.rev.patchid);
> > > > > >>>>>>      priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > > > > >>>>>> +   priv->has_cached_coherent =3D
> > > > > >>>>>> +           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHE=
RENT);
> > > > > >>>>>>      gpu =3D info->init(drm);
> > > > > >>>>>>      if (IS_ERR(gpu)) {
> > > > > >>>>>> @@ -574,10 +604,6 @@ static int adreno_bind(struct device =
*dev, struct device *master, void *data)
> > > > > >>>>>>      if (ret)
> > > > > >>>>>>              return ret;
> > > > > >>>>>> -   priv->has_cached_coherent =3D
> > > > > >>>>>> -           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHE=
RENT) &&
> > > > > >>>>>> -           !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > > > > >>>>>> -
> > > > > >>>>>>      return 0;
> > > > > >>>>>>    }
> > > > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/dri=
vers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > >>>>>> index e08d41337169..d5335b99c64c 100644
> > > > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > >>>>>> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_=
hwcg[], a615_hwcg[], a630_hwcg[], a640_h
> > > > > >>>>>>    extern const struct adreno_reglist a660_hwcg[], a690_hw=
cg[];
> > > > > >>>>>>    struct adreno_info {
> > > > > >>>>>> +   const char *machine;
> > > > > >>>>>>      struct adreno_rev rev;
> > > > > >>>>>>      uint32_t revn;
> > > > > >>>>>>      const char *fw[ADRENO_FW_MAX];
> > > > > >>>>>
> > > > > >>>>> --
> > > > > >>>>> With best wishes
> > > > > >>>>> Dmitry
> > > > > >>>>>
> > > > > >>
> > > > > >>
> > > > > >>
> > > > > >> --
> > > > > >> With best wishes
> > > > > >> Dmitry
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > > > >
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry
