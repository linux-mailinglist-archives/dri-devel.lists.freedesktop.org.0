Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2391CD2C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 15:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B71210E149;
	Sat, 29 Jun 2024 13:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N2bbFsEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7610E113;
 Sat, 29 Jun 2024 13:32:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57d2fc03740so1815957a12.0; 
 Sat, 29 Jun 2024 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719667938; x=1720272738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZgrWGkd1meoHWo3+J42luLI3PD/AXRaWnAoTRiKZiA=;
 b=N2bbFsEvkhH0/VLo6HXyEgpSFoXv8c0JVm2BxV+mhnBb82qHYUSUJkBsGZxF3qT/jO
 dok7mZ/qWD9NdQtSbZUy3GPDZackeLh6cJYm4wN6NWWHaCQsK4QIDqeMLLgr63eejaam
 KhOuxbRebU3WqzyvI5NDW6pP0f7KJGCj52t+SgaNVroXX6YJ9UzsOdV2X+XiGXaibQKp
 b/P7c+BHnub7cKqIPT/Jyo3rc186u2+pTYFoAJtaD7pBPlduYK6Bbn/y3aCrDXl/Twlu
 krtMkaIrcuTnn4eF5Tn3s3WyFyN8s/xTb2SpHw+OqQmHMsGA7f/ct/v7OucvFN42gkGb
 sq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719667938; x=1720272738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ZgrWGkd1meoHWo3+J42luLI3PD/AXRaWnAoTRiKZiA=;
 b=TDxNPFEPuNF+6Ey+xBx6uyY2EvMYpb0WDB/Mn9rDRubC8KmQf4X/5Etd5J8pnpGgC/
 EDXyB+iRcicovSCvRHegrX1cCaa91fewuox/UPfDW6pf6igQndg6dOuWebLeQM756AZj
 eVfti96VICo81ETbuOyhwOBgZhoJF0v+IyFRb3orWHPGupIeG3CT6t9oeNTrwDjgzAqh
 HZF2wdfGk3UlvgxQcsLLQZwiWchLYGjzwRLgHDACkZQWA2AXaRXVJoiuoNBBPM+A39Pp
 4ynNm5nAm1W/1OeeQf9R+QbhV6Km0tsKrX2b/OuOz3dSimbwv9xE8FQMh8W+EtGKRn7N
 Pb4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTpabdpNBtqN+O4d+CSzbcLDZJMTFBuAapInQeKGrGhqqWIjoX3VG31cIPs9E+KFRvhnbDPUO6EQgJIO7vsNH6K7gxu400lDtdMP+3sg32
X-Gm-Message-State: AOJu0Yyoop8YspjHjqvOE18HO8BQT4XVXU0ojvPGGmidgHozvDZA7N1W
 +chQXRyu57wKxrUTt6WmpfmEtqIyWU2UvGU5QX9TxLWn4HXe4Mj1qdjLwRI53pDV/3/VhsUuOka
 PrcG66olg7016JoHDmudpdOz5oJI=
X-Google-Smtp-Source: AGHT+IFvFuLSfoqQo8otUXQUXzOPg8zdgXZW8DX2SjfJm3mHt6zQq6wbuQpB8S2qspBnkctoW6DN/nj6zMo3ATVh4Z8=
X-Received: by 2002:a05:6402:1d4e:b0:57c:60f0:98bc with SMTP id
 4fb4d7f45d1cf-5879f59bc5bmr749843a12.11.1719667938126; Sat, 29 Jun 2024
 06:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-2-robdclark@gmail.com>
 <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 29 Jun 2024 06:32:05 -0700
Message-ID: <CAF6AEGtHyGZhBaqNXtujNMg7Cv_cLkUQoCiAckKAWUihzO1i4Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 28, 2024 at 6:58=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Jun 18, 2024 at 09:42:47AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split into a separate table per generation, in preparation to move each
> > gen's device table to it's own file.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
> >  2 files changed, 63 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index c3703a51287b..a57659eaddc2 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -20,7 +20,7 @@ bool allow_vram_carveout =3D false;
> >  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in p=
lace of IOMMU");
> >  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 060=
0);
> >
> > -static const struct adreno_info gpulist[] =3D {
> > +static const struct adreno_info a2xx_gpus[] =3D {
> >       {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x02000000),
> >               .family =3D ADRENO_2XX_GEN1,
> > @@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a2xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a2xx);
> > +
> > +static const struct adreno_info a3xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x03000512),
> >               .family =3D ADRENO_3XX,
> >               .fw =3D {
> > @@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a3xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a3xx);
> > +
> > +static const struct adreno_info a4xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x04000500),
> >               .family =3D ADRENO_4XX,
> >               .revn  =3D 405,
> > @@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .gmem  =3D (SZ_1M + SZ_512K),
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >               .init  =3D a4xx_gpu_init,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a4xx);
> > +
> > +static const struct adreno_info a5xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x05000600),
> >               .family =3D ADRENO_5XX,
> >               .revn =3D 506,
> > @@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .quirks =3D ADRENO_QUIRK_LMLOADKILL_DISABLE,
> >               .init =3D a5xx_gpu_init,
> >               .zapfw =3D "a540_zap.mdt",
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a5xx);
> > +
> > +static const struct adreno_info a6xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x06010000),
> >               .family =3D ADRENO_6XX_GEN1,
> >               .revn =3D 610,
> > @@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] =3D {
> >               .zapfw =3D "a690_zap.mdt",
> >               .hwcg =3D a690_hwcg,
> >               .address_space_size =3D SZ_16G,
> > -     }, {
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a6xx);
> > +
> > +static const struct adreno_info a7xx_gpus[] =3D {
> > +     {
> >               .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> >               .family =3D ADRENO_6XX_GEN1, /* NOT a mistake! */
> >               .fw =3D {
> > @@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] =3D {
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "gen70900_zap.mbn",
> >               .address_space_size =3D SZ_16G,
> > -     },
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a7xx);
> > +
> > +static const struct adreno_gpulist *gpulists[] =3D {
> > +     &a2xx_gpulist,
> > +     &a3xx_gpulist,
> > +     &a4xx_gpulist,
> > +     &a5xx_gpulist,
> > +     &a6xx_gpulist,
> > +     &a6xx_gpulist,
>
> Typo. a6xx_gpulist -> a7xx_gpulist.

yup, already have a patch fixing that in msm-next-robclark

BR,
-R

> -Akhil
>
> >  };
> >
> >  MODULE_FIRMWARE("qcom/a300_pm4.fw");
> > @@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> >  static const struct adreno_info *adreno_info(uint32_t chip_id)
> >  {
> >       /* identify gpu: */
> > -     for (int i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > -             const struct adreno_info *info =3D &gpulist[i];
> > -             if (info->machine && !of_machine_is_compatible(info->mach=
ine))
> > -                     continue;
> > -             for (int j =3D 0; info->chip_ids[j]; j++)
> > -                     if (info->chip_ids[j] =3D=3D chip_id)
> > -                             return info;
> > +     for (int i =3D 0; i < ARRAY_SIZE(gpulists); i++) {
> > +             for (int j =3D 0; j < gpulists[i]->gpus_count; j++) {
> > +                     const struct adreno_info *info =3D &gpulists[i]->=
gpus[j];
> > +
> > +                     if (info->machine && !of_machine_is_compatible(in=
fo->machine))
> > +                             continue;
> > +
> > +                     for (int k =3D 0; info->chip_ids[k]; k++)
> > +                             if (info->chip_ids[k] =3D=3D chip_id)
> > +                                     return info;
> > +             }
> >       }
> >
> >       return NULL;
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..17aba8c58f3d 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -114,6 +114,16 @@ struct adreno_info {
> >
> >  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> >
> > +struct adreno_gpulist {
> > +     const struct adreno_info *gpus;
> > +     unsigned gpus_count;
> > +};
> > +
> > +#define DECLARE_ADRENO_GPULIST(name)                  \
> > +const struct adreno_gpulist name ## _gpulist =3D {      \
> > +     name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
> > +}
> > +
> >  /*
> >   * Helper to build a speedbin table, ie. the table:
> >   *      fuse | speedbin
> > --
> > 2.45.2
> >
