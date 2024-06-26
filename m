Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07218919992
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B578110E105;
	Wed, 26 Jun 2024 21:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YUcxt+k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684B610E0D8;
 Wed, 26 Jun 2024 21:02:25 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so1184814a12.1; 
 Wed, 26 Jun 2024 14:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719435743; x=1720040543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmkVUbtxGq5Kd55y7UpEeg65+sX0oH7l0Siw+Fdlx50=;
 b=YUcxt+k8HpfofCqFbsE4J4i7RnmZTDBVsxl8qWFB9JVuyMoA5OgFJWabVSvSoCWa5X
 rCMT217nz0zk9tNoCxcRgxMYazztxq8eZTTjB8V/DCemaDnhGoTUlW1p5GWkoDogI3VN
 u9SHEWdCo9xA7DdRYBnaPS4ZKREytCNWvZsVw88Gss4PSkM6Q4YuqPaEe+xaFfcgZ+/E
 KeplbfDumDv5OaalUqKx2rzscp+fjJgJny/cBoCromAqQNHU1obL4CvL2Bljw0QDbEMT
 MnCzTJXTDjOoxsohNXMFoZJ4jVriId/NgDm748xClpmINE9/WUcJ01VwE5ySSVGTuZmL
 9qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719435743; x=1720040543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmkVUbtxGq5Kd55y7UpEeg65+sX0oH7l0Siw+Fdlx50=;
 b=XGNiIt9e8/vwpCIznx032JoAOF5vUIdQN6gf3BKOWDnJuYyaWV/lcuTZomN0MsV6vw
 FUCC6nR4ckRAjoZaP+TqoVDkRYMNL9hcDlRFhcxDyFttO7yXjabyUd5kU0KZ/9f4l8Gd
 prBmv0pmCqgyuInrAkpOc+ItuXe7UsE2puXQQLfJL3SXOrBZxdAPiBIny0xj/+CttS7N
 M8rn421jzhumuo4hAm4dZLFjbGgf2tqTUxSgym5NAMa54McIZvce/uUpmEjxKLY+ldtl
 8djA7BxT+S61WRNLHKJh0aDOTEtKkvsbXmzhjW5OLL3E4tdYxAAI9qGfNOkGBuZEPYQO
 3cuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRR67lPzpZKq+gUzZBQM6lzFFMPeKZnpQD4qGtnPSuqwKJqZXtBNf90tpgrgdLZOrnw1/Ly2bgT69wJalRoMta5pi4ox4T+oQebrYCDmM1
X-Gm-Message-State: AOJu0YyFSn3hv51Sl6YnO0HCxVwvMv75qAsGOwlZQOErvQXakMj5vtEM
 CyXn9KJ5FhyIxgcirGBA6DYE0p8cQZ0pEmSkg84DDY+Hlc1H4bGdfPC1mXh7kyPt57ig1BxQSez
 jwyuyn6LU3Afszh7JiyviYrGYYVc=
X-Google-Smtp-Source: AGHT+IGlByTPxbgHve5YOiShodnO9ZK/wz4GslKuSEfF0rTWCXbpIBVF4OiAcQDtsjLA8sjTgIxyq37Ww1xvkNJUUJ8=
X-Received: by 2002:aa7:c650:0:b0:57c:ff0d:b781 with SMTP id
 4fb4d7f45d1cf-584bdabcabfmr95346a12.16.1719435743352; Wed, 26 Jun 2024
 14:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
 <CAF6AEGvWFUOk-N8oRxZZYm-EWGV61yiLfjZAUSjHdmy9RhDiAA@mail.gmail.com>
 <20240626204906.kgvtf7xo4dqepvpz@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240626204906.kgvtf7xo4dqepvpz@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 14:02:10 -0700
Message-ID: <CAF6AEGvwjMJXNStwAx4whQMv_PdB+wTJ7Bu4X7wpSwRMrajkTQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
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

On Wed, Jun 26, 2024 at 1:49=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Mon, Jun 24, 2024 at 07:28:06AM -0700, Rob Clark wrote:
> > On Mon, Jun 24, 2024 at 7:25=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Sun, Jun 23, 2024 at 4:08=E2=80=AFAM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> > > >
> > > > Add support in drm/msm driver for the Adreno X185 gpu found in
> > > > Snapdragon X1 Elite chipset.
> > > >
> > > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++---=
-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> > > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> > > >  4 files changed, 36 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gmu.c
> > > > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *=
gmu, unsigned int state)
> > > >          */
> > > >         gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> > > >
> > > > +       if (adreno_is_x185(adreno_gpu)) {
> > > > +               chipid =3D 0x7050001;
> > > >         /* NOTE: A730 may also fall in this if-condition with a fut=
ure GMU fw update. */
> > > > -       if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gp=
u)) {
> > > > +       } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(ad=
reno_gpu)) {
> > > >                 /* A7xx GPUs have obfuscated chip IDs. Use constant=
 maj =3D 7 */
> > > >                 chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
> > > >
> > > > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(stru=
ct device *dev, u32 *votes,
> > > >         if (!pri_count)
> > > >                 return -EINVAL;
> > > >
> > > > -       sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > > -       if (IS_ERR(sec))
> > > > -               return PTR_ERR(sec);
> > > > +       /*
> > > > +        * Some targets have a separate gfx mxc rail. So try to rea=
d that first and then fall back
> > > > +        * to regular mx rail if it is missing
> > > > +        */
> > > > +       sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > > > +       if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> > > > +               return -EPROBE_DEFER;
> > > > +       } else if (IS_ERR(sec)) {
> > > > +               sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > > +               if (IS_ERR(sec))
> > > > +                       return PTR_ERR(sec);
> > > > +       }
> > > >
> > > >         sec_count >>=3D 1;
> > > >         if (!sec_count)
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> > > > index 973872ad0474..97837f7f2a40 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > @@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gp=
u *gpu)
> > > >                 count =3D ARRAY_SIZE(a660_protect);
> > > >                 count_max =3D 48;
> > > >                 BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> > > > -       } else if (adreno_is_a730(adreno_gpu) ||
> > > > -                  adreno_is_a740(adreno_gpu) ||
> > > > -                  adreno_is_a750(adreno_gpu)) {
> > > > +       } else if (adreno_is_a7xx(adreno_gpu)) {
> > > >                 regs =3D a730_protect;
> > > >                 count =3D ARRAY_SIZE(a730_protect);
> > > >                 count_max =3D 48;
> > > > @@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
> > > >         gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
> > > >
> > > >         /* Set weights for bicubic filtering */
> > > > -       if (adreno_is_a650_family(adreno_gpu)) {
> > > > +       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adr=
eno_gpu)) {
> > > >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_=
0, 0);
> > > >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_=
1,
> > > >                         0x3fe05ff4);
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/g=
pu/drm/msm/adreno/adreno_device.c
> > > > index c3703a51287b..139c7d828749 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > @@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] =3D =
{
> > > >                 .zapfw =3D "a740_zap.mdt",
> > > >                 .hwcg =3D a740_hwcg,
> > > >                 .address_space_size =3D SZ_16G,
> > > > +       }, {
> > > > +               .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512=
v2" */
> > > > +               .family =3D ADRENO_7XX_GEN2,
> > > > +               .fw =3D {
> > > > +                       [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> > > > +                       [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> > > > +               },
> > > > +               .gmem =3D 3 * SZ_1M,
> > > > +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > > +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > > > +                         ADRENO_QUIRK_HAS_HW_APRIV,
> > > > +               .init =3D a6xx_gpu_init,
> > > > +               .hwcg =3D a740_hwcg,
> > > > +               .address_space_size =3D SZ_16G,
> > >
> > > I'm kinda thinking we should drop the address_space_size and add
> > > instead ADRENO_QUIRK_4G or something along those lines, since there
> > > are devices with 32 or 64G
> >
> > or alternatively put in a correct address_space_size (I guess 2^^48 or =
2^^56 ?)
>
> Although I don't see any reason why the end address couldn't be the
> 'ttbr0/1 split address', we can keep 256GB as AS size for now. I will
> check this further and see if we can have a general logic for non-a630_fa=
mily.

Ahh, good point, I'd overlooked the ttbr0/ttrbr1 split.  Since this is
actually the userspace address space size it should be the size of
ttbr0.

For generations that do not support per-process pgtables, the
address_space_size doesn't really matter (since in that case we don't
allow userspace to allocate the iova's)

BR,
-R

> -Akhil
>
> >
> > BR,
> > -R
> >
> > > (a690 is incorrect in this way too)
> > >
> > > BR,
> > > -R
> > >
> > > >         }, {
> > > >                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520=
v2" */
> > > >                 .family =3D ADRENO_7XX_GEN3,
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/=
drm/msm/adreno/adreno_gpu.h
> > > > index 77526892eb8c..d9ea8e0f6ad5 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > @@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno=
_gpu *gpu)
> > > >         return gpu->info->chip_ids[0] =3D=3D 0x43051401;
> > > >  }
> > > >
> > > > +static inline int adreno_is_x185(struct adreno_gpu *gpu)
> > > > +{
> > > > +       return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
> > > > +}
> > > > +
> > > >  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> > > >  {
> > > >         if (WARN_ON_ONCE(!gpu->info))
> > > > --
> > > > 2.45.1
> > > >
