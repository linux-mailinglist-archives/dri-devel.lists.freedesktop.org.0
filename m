Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA36E8D19
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3430410EBF8;
	Thu, 20 Apr 2023 08:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69A910EBF7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:47:54 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id l5so1665709ybe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681980472; x=1684572472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5oAqCslyeZbhwZTq6RFTTQ4PQFGAxsJkatHKOyp9J0=;
 b=bxyEIQuckrZovTT6ZFDvK22g7vQcjK9MDIwUGnHTk7f1r03inGlP8Hg9uKZa89pY2F
 B3CdN9Si8aiLyM5WkeIVd0OS07FeUt/8E9sp7wOC4wSLOOgSLMRu620yYy+6ouQkBHHU
 OrRntp7qLe1qDjiVgICBWJqoGb24YPjPlc4oXe6bqvwmnzFg63ZMtNQDai3YN0ouObvz
 DtgFueQzO3xaAVO8HU5DHmuGly+qIhBGxBt8k6nddjhT4RXBfuAErQ07j5zQuzK/w1Pr
 eyw7x9OYffXFfglyZ1E3bla8PnYZVQpnFyc/5NbE27VDNtomqydwHgJ7tFs+QXm7X/EA
 m4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681980472; x=1684572472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5oAqCslyeZbhwZTq6RFTTQ4PQFGAxsJkatHKOyp9J0=;
 b=YOuuLur8j/2s8+Y0tf9ZhCF577HYmNAthFdXP09ws1saQ/RrEMm80T7ywLxiTKzlcx
 RchwkO/PA8GGu+2cdb3u3SKtXRNL7bFrpXTjg7Dqph7dcsXPT7udecOXImGKxNZAqmFU
 NjqW6gr3Kuf3zsJ7qK7ZPDy5FnNnnJYFPSU9OZPsRhm2CK8ZSYvyz4/NNf7zvcd7tfCb
 6kyOJ7whqx2ovyGRq5J/TLwSiECRIbji0U8AY6MC7OlWZ9avVVJRvJ6Tb/mVNxuuqWQQ
 fQSy7EceXXCASB706Q1UI0aU9WBDtKrlEI2jddlDo+YcfR4GRrA3QfvYH/ixMmQK6dy1
 0geQ==
X-Gm-Message-State: AAQBX9dq/FTaRY4LultbPXGXO6HgeJ07s++Ad2zZLxwq3gmfgI6qcjGv
 eML25PCGhgA5hMZWP9eVHV7L0VI52uhjfhbui0wKUw==
X-Google-Smtp-Source: AKy350Yj07sfBe+SClXcBzSUONtgncb/id4YtuYg1fsL8LaTx7utG5puu9AQK1O//i8VSR4O9bit6lJq4Bxk2wl2vpY=
X-Received: by 2002:a25:d181:0:b0:b79:6c89:86c0 with SMTP id
 i123-20020a25d181000000b00b796c8986c0mr662624ybg.42.1681980471793; Thu, 20
 Apr 2023 01:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-7-d1bac46db075@freebox.fr>
 <405ff057-e4da-3f2f-b860-ce2eeacaab94@linaro.org>
 <CAG9NU68aLLZ0KGNmsirzm5RtGw6CC_i=+kTwyfhy+bjSkRTO4Q@mail.gmail.com>
In-Reply-To: <CAG9NU68aLLZ0KGNmsirzm5RtGw6CC_i=+kTwyfhy+bjSkRTO4Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Apr 2023 11:47:40 +0300
Message-ID: <CAA8EJppa86WWE0tkUaFG4JpfKwr9husvgHWkCVjRbWiF=Ei7aQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/msm/dpu: add sspp cursor blocks to msm8998 hw
 catalog
To: Arnaud Vrac <avrac@freebox.fr>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Apr 2023 at 10:06, Arnaud Vrac <avrac@freebox.fr> wrote:
>
> Le jeu. 20 avr. 2023 =C3=A0 01:10, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> a =C3=A9crit :
> >
> > On 19/04/2023 17:41, Arnaud Vrac wrote:
> > > Now that cursor sspp blocks can be used for cursor planes, enable the=
m
> > > on msm8998. The dma sspp blocks that were assigned to cursor planes c=
an
> > > now be used for overlay planes instead.
> >
> > While the change is correct, there is more about it. Composers, using
> > universal planes, will see this plane too. They have no obligations to
> > use it only for the cursor. At the minimum could you please extend the
> > plane_atomic_check to check for the plane dimensions for the CURSOR pip=
es?
>
> Hum, I had assumed the generic atomic checks would already do this,

Atomic will have these checks for the legacy cursor API (using the
mode_config.cursor_width/cursor_height that you have added). But I
don't think there is a generic API for telling the core 'this plane is
slightly limited'.

Fortunately, once the virtual planes land and are taught about the
SSPP_CURSOR peculiarities, it should not matter, since the driver will
know that it should not select these pipes in the inappropriate cases.

> but it's not the case. I'll add the check when the pipe is of type
> SSPP_CURSOR in another patch coming before, thanks.
>
> >
> > For this change:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > >
> > > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > > ---
> > >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 +++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 34 +++++++++++=
+++++++++++
> > >   2 files changed, 40 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h =
b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > > index b07e8a9941f79..7de393b0f91d7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > > @@ -90,10 +90,14 @@ static const struct dpu_sspp_cfg msm8998_sspp[] =
=3D {
> > >               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0)=
,
> > >       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
> > >               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1)=
,
> > > -     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM89=
98_MASK,
> > > +     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_MSM8998_MASK=
,
> > >               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2)=
,
> > > -     SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM89=
98_MASK,
> > > +     SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_MSM8998_MASK=
,
> > >               sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3=
),
> > > +     SSPP_BLK("sspp_12", SSPP_CURSOR0, 0x34000, 0x1ac, DMA_CURSOR_MS=
M8998_MASK,
> > > +             msm8998_cursor_sblk_0, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTR=
L_CURSOR0),
> > > +     SSPP_BLK("sspp_13", SSPP_CURSOR1, 0x36000, 0x1ac, DMA_CURSOR_MS=
M8998_MASK,
> > > +             msm8998_cursor_sblk_1, 10, SSPP_TYPE_CURSOR, DPU_CLK_CT=
RL_CURSOR1),
> > >   };
> > >
> > >   static const struct dpu_lm_cfg msm8998_lm[] =3D {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > index 8d5d782a43398..f34fa704936bc 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > @@ -242,6 +242,22 @@ static const uint32_t wb2_formats[] =3D {
> > >       DRM_FORMAT_XBGR4444,
> > >   };
> > >
> > > +static const uint32_t cursor_formats[] =3D {
> > > +     DRM_FORMAT_ARGB8888,
> > > +     DRM_FORMAT_ABGR8888,
> > > +     DRM_FORMAT_RGBA8888,
> > > +     DRM_FORMAT_BGRA8888,
> > > +     DRM_FORMAT_XRGB8888,
> > > +     DRM_FORMAT_ARGB1555,
> > > +     DRM_FORMAT_ABGR1555,
> > > +     DRM_FORMAT_RGBA5551,
> > > +     DRM_FORMAT_BGRA5551,
> > > +     DRM_FORMAT_ARGB4444,
> > > +     DRM_FORMAT_ABGR4444,
> > > +     DRM_FORMAT_RGBA4444,
> > > +     DRM_FORMAT_BGRA4444,
> > > +};
> > > +
> > >   /*************************************************************
> > >    * SSPP sub blocks config
> > >    *************************************************************/
> > > @@ -300,6 +316,19 @@ static const uint32_t wb2_formats[] =3D {
> > >       .virt_num_formats =3D ARRAY_SIZE(plane_formats), \
> > >       }
> > >
> > > +#define _CURSOR_SBLK(num) \
> > > +     { \
> > > +     .maxdwnscale =3D SSPP_UNITY_SCALE, \
> > > +     .maxupscale =3D SSPP_UNITY_SCALE, \
> > > +     .smart_dma_priority =3D 0, \
> > > +     .src_blk =3D {.name =3D STRCAT("sspp_src_", num), \
> > > +             .id =3D DPU_SSPP_SRC, .base =3D 0x00, .len =3D 0x150,},=
 \
> > > +     .format_list =3D cursor_formats, \
> > > +     .num_formats =3D ARRAY_SIZE(cursor_formats), \
> > > +     .virt_format_list =3D cursor_formats, \
> > > +     .virt_num_formats =3D ARRAY_SIZE(cursor_formats), \
> > > +     }
> > > +
> > >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =3D
> > >                               _VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED=
3);
> > >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =3D
> > > @@ -309,6 +338,11 @@ static const struct dpu_sspp_sub_blks msm8998_vi=
g_sblk_2 =3D
> > >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =3D
> > >                               _VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED=
3);
> > >
> > > +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_0 =3D
> > > +                             _CURSOR_SBLK("12");
> > > +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_1 =3D
> > > +                             _CURSOR_SBLK("13");
> > > +
> > >   static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 =3D {
> > >       .rot_maxheight =3D 1088,
> > >       .rot_num_formats =3D ARRAY_SIZE(rotation_v2_formats),
> > >
> >
> > --
> > With best wishes
> > Dmitry
> >



--=20
With best wishes
Dmitry
