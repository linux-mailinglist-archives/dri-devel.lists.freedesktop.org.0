Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB53914FE3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E63710E46E;
	Mon, 24 Jun 2024 14:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rq3k4dnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFD610E46E;
 Mon, 24 Jun 2024 14:28:20 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a725041ad74so64923566b.3; 
 Mon, 24 Jun 2024 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719239298; x=1719844098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqKLNgTuFKM0ZCtxXKtMgTqLY0aOhJLT00CcJPHXIww=;
 b=Rq3k4dnd+3JnanosKnApDFpQmvDWpiqX2XXGVRK3fyz29ToL6hekKkgiSIbHBi9lU1
 L3fPvAUa0HAyCxW8nS0sSiHBu82Uv1mEJmH5EnPXlscG25TkxprUmQhFNOFICyU0/Tu3
 tDairsWipbdTuDdQrJpMciU3Az8L9uculiWJyLhUZbznRicS4wMEKEvyAzBilPIakpLn
 Ud+WlQysuYmlSxTtw0X7neZ1dIioV1ADRqi2rs3zN4/JKDMfU0TFJtIlfsEd9q0Zl8PV
 A+2vY37cXP89Zi5jb5DT26mFeEjMYZ5GjAUDitlVHbkUlCvJo5YxNlgMWUK9gMm9a+fu
 w3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719239298; x=1719844098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqKLNgTuFKM0ZCtxXKtMgTqLY0aOhJLT00CcJPHXIww=;
 b=MGh3J2Aqta2YBPEsjeV5TaRKlATap9z1mJyTKeU9lTRxVXRMT62wSbWIq+PCecNMPx
 ZlLVT9TltjVkjVeIGBJHJhkQlxm3BRPnagF2GbDXZ5rB1NxWtwHI9WynIUvV7dJfHi/g
 vAjvkIeMdaSn1VeY0pHcnzSWGwCuI7kaJD00vw9ClsgcDJSk+TTwzut0ivm4mSQIRuez
 tC8pbwGjb3KUcBJ1qG+/J647SN1nttjtoaAbQY1o2q6BTEJCN0WeVuUK4x4dQUGXUtCF
 hcQ9+SLPIg/1OfNeW/H1MHsp0p0Eo3LgY29DwXp/fGxGuohRo7WWUAT6/BkPqBTRtWKK
 W0dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX52O91VTx8179USHvBpRtvhCLb/u9DHS99Ou6uLK8fujuaTSXC/+gD0iClfQcSmQsQdlBZODvr8xRrrdsH2VcW7xMlHuFuGKMxC9HWQQ8w
X-Gm-Message-State: AOJu0YxbioYEJjoIYSyQIERJOawYg6fDXZUiuTzO9+PVGqu3DQpowlmp
 Pq83YTHAtRxJFa9Iycfk1tUnheISV6Tl6PuiVOC/RP1zERzE++k6gdSAgq5K5j1M7rVzJRhsQjA
 TqsPTpuGbeP4YqgsBdTSrIwMH5h0=
X-Google-Smtp-Source: AGHT+IFwOxUB2g0LO6vpR019qwMsG9+gEf3VPde7nLgxFLGZ7hxLAghHqprjYJFoum0OHF6FJg2/THwzvXC6WnTCdRQ=
X-Received: by 2002:a50:9f6d:0:b0:57c:671d:8455 with SMTP id
 4fb4d7f45d1cf-57d4bd728c8mr3451952a12.14.1719239298308; Mon, 24 Jun 2024
 07:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
In-Reply-To: <CAF6AEGti-Qibmb0YCgWypx7S1sVmtu3287a1reMnUgYqMzTKsw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 07:28:06 -0700
Message-ID: <CAF6AEGvWFUOk-N8oRxZZYm-EWGV61yiLfjZAUSjHdmy9RhDiAA@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 7:25=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Sun, Jun 23, 2024 at 4:08=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >
> > Add support in drm/msm driver for the Adreno X185 gpu found in
> > Snapdragon X1 Elite chipset.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >  4 files changed, 36 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu,=
 unsigned int state)
> >          */
> >         gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> >
> > +       if (adreno_is_x185(adreno_gpu)) {
> > +               chipid =3D 0x7050001;
> >         /* NOTE: A730 may also fall in this if-condition with a future =
GMU fw update. */
> > -       if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) =
{
> > +       } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno=
_gpu)) {
> >                 /* A7xx GPUs have obfuscated chip IDs. Use constant maj=
 =3D 7 */
> >                 chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
> >
> > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct d=
evice *dev, u32 *votes,
> >         if (!pri_count)
> >                 return -EINVAL;
> >
> > -       sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > -       if (IS_ERR(sec))
> > -               return PTR_ERR(sec);
> > +       /*
> > +        * Some targets have a separate gfx mxc rail. So try to read th=
at first and then fall back
> > +        * to regular mx rail if it is missing
> > +        */
> > +       sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > +       if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> > +               return -EPROBE_DEFER;
> > +       } else if (IS_ERR(sec)) {
> > +               sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > +               if (IS_ERR(sec))
> > +                       return PTR_ERR(sec);
> > +       }
> >
> >         sec_count >>=3D 1;
> >         if (!sec_count)
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 973872ad0474..97837f7f2a40 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >                 count =3D ARRAY_SIZE(a660_protect);
> >                 count_max =3D 48;
> >                 BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> > -       } else if (adreno_is_a730(adreno_gpu) ||
> > -                  adreno_is_a740(adreno_gpu) ||
> > -                  adreno_is_a750(adreno_gpu)) {
> > +       } else if (adreno_is_a7xx(adreno_gpu)) {
> >                 regs =3D a730_protect;
> >                 count =3D ARRAY_SIZE(a730_protect);
> >                 count_max =3D 48;
> > @@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
> >         gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
> >
> >         /* Set weights for bicubic filtering */
> > -       if (adreno_is_a650_family(adreno_gpu)) {
> > +       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_=
gpu)) {
> >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0=
);
> >                 gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> >                         0x3fe05ff4);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index c3703a51287b..139c7d828749 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] =3D {
> >                 .zapfw =3D "a740_zap.mdt",
> >                 .hwcg =3D a740_hwcg,
> >                 .address_space_size =3D SZ_16G,
> > +       }, {
> > +               .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" =
*/
> > +               .family =3D ADRENO_7XX_GEN2,
> > +               .fw =3D {
> > +                       [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> > +                       [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> > +               },
> > +               .gmem =3D 3 * SZ_1M,
> > +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                         ADRENO_QUIRK_HAS_HW_APRIV,
> > +               .init =3D a6xx_gpu_init,
> > +               .hwcg =3D a740_hwcg,
> > +               .address_space_size =3D SZ_16G,
>
> I'm kinda thinking we should drop the address_space_size and add
> instead ADRENO_QUIRK_4G or something along those lines, since there
> are devices with 32 or 64G

or alternatively put in a correct address_space_size (I guess 2^^48 or 2^^5=
6 ?)

BR,
-R

> (a690 is incorrect in this way too)
>
> BR,
> -R
>
> >         }, {
> >                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" =
*/
> >                 .family =3D ADRENO_7XX_GEN3,
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..d9ea8e0f6ad5 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno_gpu=
 *gpu)
> >         return gpu->info->chip_ids[0] =3D=3D 0x43051401;
> >  }
> >
> > +static inline int adreno_is_x185(struct adreno_gpu *gpu)
> > +{
> > +       return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
> > +}
> > +
> >  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> >  {
> >         if (WARN_ON_ONCE(!gpu->info))
> > --
> > 2.45.1
> >
