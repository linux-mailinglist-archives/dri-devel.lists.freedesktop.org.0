Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821C9D4244
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 19:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CD10E2D8;
	Wed, 20 Nov 2024 18:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="juba+k/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1854B10E075;
 Wed, 20 Nov 2024 18:54:37 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so4005539f.0; 
 Wed, 20 Nov 2024 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732128877; x=1732733677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywphHwRJ47bemIP9RZfgn34nLun0kYe1BEdTqOds8Rs=;
 b=juba+k/5py5UmNEJT1bzbfSsZzLFJJ0KtD6/PYApCE5ag9Dpj/gX7GYA1FWA8hUop5
 bqb47wVRF3IO4OlVLZ5R5Sni6JswFYl7EFxS/qiz4FzljbESDf20DaoT/fEKns55TGHw
 Vb+ivyDUmNPQ2GomzakhQRGQUva38QT5oNW2lkHjCwhwp+uOxStDgAG58JnUOWvl/l2G
 0ZvO6EHoKKWKlA7b020ru3Z2+3GVzT1skuARkbEMV+8hUyicWclTYV6ZiAWuE1y+eJKw
 33+LcgQx1Iw9kbj7/BEJpSkEM1lWyf3CHSPnsveJWjkklECnjZ1FMRBielRGOEua5EaH
 4lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732128877; x=1732733677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywphHwRJ47bemIP9RZfgn34nLun0kYe1BEdTqOds8Rs=;
 b=Kg3ugIWKvA4yvkJ5f3KXDC9SrfFGfGABlkBY3Q70y3pqi5X3DGVe2PamwjoLTVvTff
 6k7BrVxDN53djLVFFYcKLN/eVSVmatCRoMtblSVE7ztKRr1MshFoTONBZ+3mrIMGVsHa
 qe+oyjqEnmkyTkXQDH4lRV65uWxz7XiF1D96XxLnr1IvgwWfMCxgXwz6PAnx5gEywhg7
 FMP7Yo8qrW53xwr+bBD+Xq+XcQr3alfyliZO3NHe63YC19PODw+HBM/pvWmnrEV6NDcP
 eq6Uxj2kWk1J5e+wN6wJISO3pBIRzoKUOpv5r8B5SomNgHHuLpYNpiJslYIh1kwzwpVe
 hULA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW///R1amgGQiNm6TcFNWVL+x7KIjeUXjl1cRZbvgEeo2qinvjXVKdC2DRv1zF7ftZ+FoMOAgjxRUU=@lists.freedesktop.org,
 AJvYcCXodmzKkix4SLPnb2foPINJ2hZCh7XE8k/BFy5NVMYIAu6gx5jexD0KvDSJlkbGtV2jVrStkq1TuJXd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykIR7XtLXtvXd8sQ0RPEqgEhgyE5BihVIK6A5f2hGNB4KTJlw5
 3WPpSfqpINfHyZnO5QJqh8IxHLUchrbr0RqKObP1qrLz1reiJxrRP/yq2IpO7H/OY8tchVVAGtN
 3R36UgQR3CpulTQVyovd2RX3eNz0=
X-Gm-Gg: ASbGncu2tK6y2CHG2TOl6lwjuOqtmtCDCm8JtAYfOMvLyE90ckq5UkLsnFocvVJ+0ZR
 EIC48df8Xd83BorIJiOkYrSQ+Zum+w6qCTlHm7vMqBFemRSyXx4els1q4j1TC
X-Google-Smtp-Source: AGHT+IHd8C0gyOGxo8kEUV2MAn22vYluHbM6lDo81yALGvxv3opZ3P+eFDcZSWKWEXJFXyRB4VB0sPN5xiZpchHYexo=
X-Received: by 2002:a05:6602:6d8e:b0:834:d7b6:4fea with SMTP id
 ca18e2360f4ac-83eb5fce118mr454937039f.6.1732128877090; Wed, 20 Nov 2024
 10:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
 <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
In-Reply-To: <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 10:54:24 -0800
Message-ID: <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Wed, Nov 20, 2024 at 3:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> > Now the features defines have the right name, introduce a features
> > bitfield and move the features defines in it, fixing all code checking
> > for them.
> >
> > No functional changes intended.
>
> I think it might be better to squahs this patch into the previous one,
> it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
> .features for ADRENO_FEAT_bar.
>

IMHO better to keep this separated

But we don't have _that_ many features/quirks so I don't find
combining them all that problematic

BR,
-R

> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 34 +++++++++++++++-------=
--------
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 ++--
> >  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 +++---
> >  4 files changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 825c820def315968d508973c8ae40c7c7b646569..93f0d4bf50ba773ecde93e6=
c29a2fcec24ebb7b3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -743,7 +743,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a615_zap.mbn",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -769,7 +769,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .a6xx =3D &(const struct a6xx_info) {
> >                       .protect =3D &a630_protect,
> > @@ -839,7 +839,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a615_zap.mdt",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -864,7 +864,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                         ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a620_zap.mbn",
> > @@ -892,7 +892,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a630_zap.mdt",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -911,7 +911,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -934,7 +934,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_128K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                       ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a650_zap.mdt",
> > @@ -961,7 +961,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                       ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a660_zap.mdt",
> > @@ -981,7 +981,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                       ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -1000,7 +1000,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                       ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a660_zap.mbn",
> > @@ -1028,7 +1028,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_2M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -1046,7 +1046,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_4M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                       ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a690_zap.mdt",
> > @@ -1331,7 +1331,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_128K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_HW_APRIV,
> > +             .features =3D ADRENO_FEAT_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a702_zap.mbn",
> >               .a6xx =3D &(const struct a6xx_info) {
> > @@ -1355,7 +1355,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >               },
> >               .gmem =3D SZ_2M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                         ADRENO_FEAT_HAS_HW_APRIV |
> >                         ADRENO_FEAT_PREEMPTION,
> >               .init =3D a6xx_gpu_init,
> > @@ -1377,7 +1377,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >               },
> >               .gmem =3D 3 * SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                         ADRENO_FEAT_HAS_HW_APRIV |
> >                         ADRENO_FEAT_PREEMPTION,
> >               .init =3D a6xx_gpu_init,
> > @@ -1400,7 +1400,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >               },
> >               .gmem =3D 3 * SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                         ADRENO_FEAT_HAS_HW_APRIV |
> >                         ADRENO_FEAT_PREEMPTION,
> >               .init =3D a6xx_gpu_init,
> > @@ -1422,7 +1422,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >               },
> >               .gmem =3D 3 * SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> > +             .features =3D ADRENO_FEAT_HAS_CACHED_COHERENT |
> >                         ADRENO_FEAT_HAS_HW_APRIV |
> >                         ADRENO_FEAT_PREEMPTION,
> >               .init =3D a6xx_gpu_init,
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 2ebd3fac212576a1507e0b6afe2560cd0408dd89..654d0cff421f15901cd4bf3=
3b41e70004634ec75 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2478,7 +2478,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *=
dev)
> >       adreno_gpu->gmu_is_wrapper =3D of_device_is_compatible(node, "qco=
m,adreno-gmu-wrapper");
> >
> >       adreno_gpu->base.hw_apriv =3D
> > -             !!(config->info->quirks & ADRENO_FEAT_HAS_HW_APRIV);
> > +             !!(config->info->features & ADRENO_FEAT_HAS_HW_APRIV);
> >
> >       /* gpu->info only gets assigned in adreno_gpu_init() */
> >       is_a7xx =3D config->info->family =3D=3D ADRENO_7XX_GEN1 ||
> > @@ -2495,7 +2495,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *=
dev)
> >       }
> >
> >       if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 =
&&
> > -         (config->info->quirks & ADRENO_FEAT_PREEMPTION)))
> > +         (config->info->features & ADRENO_FEAT_PREEMPTION)))
> >               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 4);
> >       else if (is_a7xx)
> >               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 1);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 09d4569f77528c2a20cabc814668c4c930dd07f1..11a228472fa0cef3b6e4e21=
a366470fbbc3ea8df 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -207,7 +207,7 @@ static int adreno_bind(struct device *dev, struct d=
evice *master, void *data)
> >
> >       priv->is_a2xx =3D info->family < ADRENO_3XX;
> >       priv->has_cached_coherent =3D
> > -             !!(info->quirks & ADRENO_FEAT_HAS_CACHED_COHERENT);
> > +             !!(info->features & ADRENO_FEAT_HAS_CACHED_COHERENT);
> >
> >       gpu =3D info->init(drm);
> >       if (IS_ERR(gpu)) {
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 8782c25e8a393ec7d9dc23ad450908d039bd08c5..4702d4cfca3b58fb3cbb25c=
b6805f1c19be2ebcb 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -55,9 +55,9 @@ enum adreno_family {
> >  #define ADRENO_QUIRK_FAULT_DETECT_MASK               BIT(1)
> >  #define ADRENO_QUIRK_LMLOADKILL_DISABLE              BIT(2)
> >
> > -#define ADRENO_FEAT_HAS_HW_APRIV             BIT(3)
> > -#define ADRENO_FEAT_HAS_CACHED_COHERENT              BIT(4)
> > -#define ADRENO_FEAT_PREEMPTION                       BIT(5)
> > +#define ADRENO_FEAT_HAS_HW_APRIV             BIT(0)
> > +#define ADRENO_FEAT_HAS_CACHED_COHERENT              BIT(1)
> > +#define ADRENO_FEAT_PREEMPTION                       BIT(2)
> >
> >  /* Helper for formating the chip_id in the way that userspace tools li=
ke
> >   * crashdec expect.
> > @@ -98,6 +98,7 @@ struct adreno_info {
> >       uint32_t revn;
> >       const char *fw[ADRENO_FW_MAX];
> >       uint32_t gmem;
> > +     u64 features;
> >       u64 quirks;
> >       struct msm_gpu *(*init)(struct drm_device *dev);
> >       const char *zapfw;
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
