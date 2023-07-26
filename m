Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36419764016
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 22:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8DC10E4B8;
	Wed, 26 Jul 2023 20:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707A410E4B8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 20:00:32 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d09ba80fbcaso158614276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690401631; x=1691006431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2u8cAjsBTaS3O0e8Q9FK3b/6H8xr7sbQ+ScHjOs04k=;
 b=QfaIxvkNovkPi80GloFA076qkhVGC9CwCCmO6Gg+Z6WNhjf4dYzSvNECEp8+EzLFD1
 SNq6CriETQE0wn37lc1KQdq1fdNgKN10k9QF0D0jXV16MN0Kmr+jNuADgZcZ1fphMe5z
 CGnrmY6aqMcUi2wf0XDFC0bonVaGklZmZmzwfGxomP9c/8jRcmygtKZdCSP+hIwMJAjM
 zHHvPpSVfYr+f0vaexyeJzbmPNH7ZUzpGx34sK2Y3NRTPdnLn2c6zApsHvP0YB/spYcp
 silNV67dREV4+ZMXCPgIo5R9RYxkVrYYAl7iIDr+N3S0Py2taSqT2TgAAuE4fs/5vqwV
 4jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690401631; x=1691006431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2u8cAjsBTaS3O0e8Q9FK3b/6H8xr7sbQ+ScHjOs04k=;
 b=GHXKTDTm1LruGxNaB8bXd72pLlyiXDQRaMRKIuyvX+EKeWedKJBmkSWulk9EbxD2pQ
 urC+8Me42CrcU8j9wEGipRegGgDcQTYQ8NGbBzIKsmgZhXFr6tgvRKi99E8AdpdQ2pdC
 2y+RCz9JG06N1d0V8hTUg742CEFe4YYvihEm7Da9taAybZOPcVzB85IxDCRJRDz5g0fI
 /pkmX4CPiCHPd8dWU06IbZJAV76MkBw6jaTKb8ZL0ua+fcWs8QR4S4x+0nmtmXmCiXwb
 HBYV91S1EgKZMtm8Nq9GRJMQJQcbMjaTaUW6hhelmrcROaIY6uwkgg48xsV+XQl+KFIk
 76Cw==
X-Gm-Message-State: ABy/qLYoWv9XLszSerfoeWdlN7G/5I8ScoIeK66ZjmCTI/KDpmNUcuNL
 SKIP4HV6tmXwFmiczb42P6RRGikXvzi+DDRsRUF7Hg==
X-Google-Smtp-Source: APBJJlEjxLQzHmA+EtnewFmPDBjE5NDz2TErWbOtdZOzZlYWS/JdmMLQYv5PrY5YdT0vX5B/Y+SfA2H1R6UteJTCigw=
X-Received: by 2002:a25:8506:0:b0:c6d:e3e3:5592 with SMTP id
 w6-20020a258506000000b00c6de3e35592mr2503877ybk.54.1690401631504; Wed, 26 Jul
 2023 13:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
 <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
In-Reply-To: <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jul 2023 23:00:20 +0300
Message-ID: <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
To: Rob Clark <robdclark@gmail.com>
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

On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jul 13, 2023 at 1:26=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote:
> > >
> > > On 07/07/2023 00:10, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > There are cases where there are differences due to SoC integration.
> > > > Such as cache-coherency support, and (in the next patch) e-fuse to
> > > > speedbin mappings.
> > >
> > > I have the feeling that we are trying to circumvent the way DT works.=
 I'd
> > > suggest adding explicit SoC-compatible strings to Adreno bindings and=
 then
> > > using of_device_id::data and then of_device_get_match_data().
> > >
> > Just thinking, then how about a unique compatible string which we match
> > to identify gpu->info and drop chip-id check completely here?
>
> Ok, I think we could do this, so something like:
>
>   compatible =3D "qcom,sm4350-adreno-619.0", qcom,adreno-619.0", "qcom,ad=
reno"
>
> ?
>
> It looks like we don't have gpu dt bits upstream yet for either sm4350
> or sm6375, so I suppose we could get away with this change

I think we can even skip the 619.0 part in the SoC compat string.
So it will be:

compatible =3D "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom,adreno";

In future we can drop the chipid part completely and handle that as a
part of SoC data:

compatible =3D "qcom,sm4350-adreno", "qcom,adreno";

With the driver knowing that sm4350-adreno means ADRENO_ID(6,1,9,0)

>
> BR,
> -R
>
> > -Akhil
> >
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++=
++---
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> > > >   2 files changed, 31 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/g=
pu/drm/msm/adreno/adreno_device.c
> > > > index 3c531da417b9..e62bc895a31f 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] =3D =
{
> > > >             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > >             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > > >             .init =3D a6xx_gpu_init,
> > > > +   }, {
> > > > +           .machine =3D "qcom,sm4350",
> > > > +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > > +           .revn =3D 619,
> > > > +           .fw =3D {
> > > > +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > > +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > > +           },
> > > > +           .gmem =3D SZ_512K,
> > > > +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > +           .init =3D a6xx_gpu_init,
> > > > +           .zapfw =3D "a615_zap.mdt",
> > > > +           .hwcg =3D a615_hwcg,
> > > > +   }, {
> > > > +           .machine =3D "qcom,sm6375",
> > > > +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > > +           .revn =3D 619,
> > > > +           .fw =3D {
> > > > +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > > +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > > +           },
> > > > +           .gmem =3D SZ_512K,
> > > > +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > +           .init =3D a6xx_gpu_init,
> > > > +           .zapfw =3D "a615_zap.mdt",
> > > > +           .hwcg =3D a615_hwcg,
> > > >     }, {
> > > >             .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > >             .revn =3D 619,
> > > > @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct ad=
reno_rev rev)
> > > >     /* identify gpu: */
> > > >     for (i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > > >             const struct adreno_info *info =3D &gpulist[i];
> > > > +           if (info->machine && !of_machine_is_compatible(info->ma=
chine))
> > > > +                   continue;
> > > >             if (adreno_cmp_rev(info->rev, rev))
> > > >                     return info;
> > > >     }
> > > > @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, stru=
ct device *master, void *data)
> > > >             config.rev.minor, config.rev.patchid);
> > > >     priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > > > +   priv->has_cached_coherent =3D
> > > > +           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> > > >     gpu =3D info->init(drm);
> > > >     if (IS_ERR(gpu)) {
> > > > @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, str=
uct device *master, void *data)
> > > >     if (ret)
> > > >             return ret;
> > > > -   priv->has_cached_coherent =3D
> > > > -           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > > > -           !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > > > -
> > > >     return 0;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/=
drm/msm/adreno/adreno_gpu.h
> > > > index e08d41337169..d5335b99c64c 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a=
615_hwcg[], a630_hwcg[], a640_h
> > > >   extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
> > > >   struct adreno_info {
> > > > +   const char *machine;
> > > >     struct adreno_rev rev;
> > > >     uint32_t revn;
> > > >     const char *fw[ADRENO_FW_MAX];
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >



--=20
With best wishes
Dmitry
