Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00153319B
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACAB10FAE8;
	Tue, 24 May 2022 19:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD610FAE5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 19:13:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id wh22so37159605ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzsyUlkyiS/YzaEgtysgXXKOHxgS0XkeH6XhZ/9DzcI=;
 b=RAoVNQlaMYx37KumXh0hGrjUwAjD0INuS3O9Hxop0qlfjBSf2o+baBodGl+Ft/fYKU
 rM8ZNU7pRsVNKqt/TUCl31WwE347eoFxkd/3FBxIAYmOt8b/NafU1Hgb154V7KcDvCGf
 hA3sp8LCOpYW71ANq3ZzVex53wuQObEsodF0Hv0hPEHeo44VkLvCS53sOJDRzfl8Ad0q
 FHnxZ5KPFoCoqkhe2oX/69b0A7DQklL4H7zIBr9+nOpv+5U8gy0058MF3eaIIVn/vixc
 OhaGfs932+BEJ+OcHt/6P0v/3I4BSzn4A4AgSxzn09zrtYJuJpLmSyVz8uXaNzYGMP67
 f3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzsyUlkyiS/YzaEgtysgXXKOHxgS0XkeH6XhZ/9DzcI=;
 b=Kl5hO4cTYRVaDUTPD8+MJE0bWcT49kNQn2LueQSewvMGnwBpUauF45Ch6UO2S6+w0X
 ch0FCjzeqCTjZGQEudthxH3FanR/2dqdihaixdbyN+3XSRrMUkzrHry/EKJHc6c/mq33
 +ECrSbLx0USbn92GV4FhqQOvLxJAWLF5QZvcdZFst6kKqON+r5Jx6v0CXTbyU5RZ9TNl
 S7TFLmAiYCfFhkgADzwc6DdYuDh0S+BhxHAZd/zp94WhfrSTHdt9+Zr3K/wBXZm0q0HK
 tqdsuKtZuJXg6VA6LGOM8YSqai5fYrUi8KsbQLGHB2g3mNVl9VDz/vPANiSSYRHgk/Wx
 9Igw==
X-Gm-Message-State: AOAM532A42q1322SvyXOBPiXXwGLHeRfaFY10eFVlL1tFDolw29iZUJl
 ZlKhb3Zi+4LV9Un9UzasP78=
X-Google-Smtp-Source: ABdhPJwhIiB5LNWsM05p3UmylLy75saiNErANV1vYibc3/Mqe36oT9Gg7y+M+UJk+GivHhVotPQUMw==
X-Received: by 2002:a17:907:7fa8:b0:6f3:e975:abfa with SMTP id
 qk40-20020a1709077fa800b006f3e975abfamr25545210ejc.86.1653419602162; 
 Tue, 24 May 2022 12:13:22 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05640210cf00b0042aaa3b741esm9769308edu.1.2022.05.24.12.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:13:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for
 DE2.0/DE3.0
Date: Tue, 24 May 2022 21:13:20 +0200
Message-ID: <2827541.e9J7NaK4W3@kista>
In-Reply-To: <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <2629819.mvXUDI8C0e@kista>
 <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't top post, it's annoying and against rules.

Dne torek, 24. maj 2022 ob 19:10:06 CEST je Roman Stratiienko napisal(a):
> Please draft a test for the zpos issue you're mentioning.
>=20
> It's very easy to do with kmsxx using python wrapper.
>=20
> Or explain steps to reproduce here, I will write it by myself.

I'm talking about the issue which you, Ondrej Jirman and me all tried to fi=
x it=20
in the past one way or another:

https://patchwork.kernel.org/project/dri-devel/patch/20190914220337.646719-=
1-megous@megous.com/
https://patchwork.kernel.org/project/dri-devel/patch/20210106204630.1800284=
=2D1-jernej.skrabec@siol.net/

Best regards,
Jernej

>=20
> Thanks.
> Regards
> Roman
>=20
> =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 19:21, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko napisal(a=
):
> > > NAK for this. Further testing showed such an approach is not reliable
> > > due to .atomic_update() callback called only in case planes have some
> > > changes.
> >
> > Additionally, I think it would be better to fix underlaying zpos issue =
first
> > (attempted many times) and then worry about blending.
> >
> > Best regards,
> > Jernej
> >
> > >
> > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Roman =
Stratiienko <r.stratiienko@gmail.com>:
> > > >
> > > > Corruption happens when plane zpos is updated
> > > >
> > > > Example scenario:
> > > >
> > > > Initial frame blender state:
> > > >     PLANE_ZPOS =3D {0, 1, 2, 3}
> > > >     BLD_ROUTE  =3D {0, 1, 2, 0}
> > > >     BLD_EN     =3D {1, 1, 1, 0}
> > > >
> > > > New frame commit (Only ZPOS has been changed):
> > > >
> > > >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> > > >
> > > > Expected results after plane state update:
> > > >                 Z0 Z1 Z2 Z3
> > > >     BLD_ROUTE =3D {1, 2, 0, 0}
> > > >     BLD_EN    =3D {1, 1, 1, 0}
> > > >
> > > > What is currently happening:
> > > >
> > > > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0):
> > > >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> > > >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> > > >
> > > > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1):
> > > >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> > > >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> > > >
> > > > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2):
> > > >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> > > >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> > > >
> > > > After updating of all the planes we are ending up with BLD_EN[2]=3D=
0,
> > > > which makes this channel disabled.
> > > >
> > > > To fix this issue, clear BLEND registers before updating the planes
> > > > and do not clear the old state while processing every plane.
> > > >
> > > > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.c=
om>
> > > > ---
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
> > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 +++
+----------------------
> > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 +++
+----------------------
> > > >  3 files changed, 24 insertions(+), 48 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/
sun4i/
> > sun8i_mixer.c
> > > > index f5e8aeaa3cdf..004377a000fc 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u=
32
> > *hw_format)
> > > >         return -EINVAL;
> > > >  }
> > > >
> > > > +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> > > > +                              struct drm_crtc_state *old_state)
> > > > +{
> > > > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > > > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > > > +
> > > > +       regmap_write(engine->regs,
> > > > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > +                    0);
> > > > +
> > > > +       regmap_write(engine->regs,
> > > > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > +                    0);
> > > > +}
> > > > +
> > > >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> > > >  {
> > > >         DRM_DEBUG_DRIVER("Committing changes\n");
> > > > @@ -299,6 +314,7 @@ static struct drm_plane **sun8i_layers_init(str=
uct
> > drm_device *drm,
> > > >  }
> > > >
> > > >  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> > > > +       .atomic_begin   =3D sun8i_atomic_begin,
> > > >         .commit         =3D sun8i_mixer_commit,
> > > >         .layers_init    =3D sun8i_layers_init,
> > > >  };
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/d=
rm/
> > sun4i/sun8i_ui_layer.c
> > > > index 7845c2a53a7f..b294a882626a 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > @@ -24,8 +24,7 @@
> > > >  #include "sun8i_ui_scaler.h"
> > > >
> > > >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int=20
channel,
> > > > -                                 int overlay, bool enable, unsigne=
d=20
int
> > zpos,
> > > > -                                 unsigned int old_zpos)
> > > > +                                 int overlay, bool enable, unsigne=
d=20
int
> > zpos)
> > > >  {
> > > >         u32 val, bld_base, ch_base;
> > > >
> > > > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct=20
sun8i_mixer
> > *mixer, int channel,
> > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> > overlay),
> > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> > > >
> > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > -
> > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > -                                  0);
> > > > -
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base=
),
> > > > -
> > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > -                                  0);
> > > > -       }
> > > > -
> > > >         if (enable) {
> > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > >
> > > > @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(struct
> > drm_plane *plane,
> > > >  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
> > > >                                           struct drm_atomic_state=20
*state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(pl=
ane);
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> > false, 0,
> > > > -                             old_zpos);
> > > > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> > false, 0);
> > > >  }
> > > >
> > > >  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > > >                                          struct drm_atomic_state=20
*state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct drm_plane_state *new_state =3D
> > drm_atomic_get_new_plane_state(state,
> > > >
> > plane);
> > > >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(pl=
ane);
> > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > >         if (!new_state->visible) {
> > > >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > > > -                                     layer->overlay, false, 0,=20
old_zpos);
> > > > +                                     layer->overlay, false, 0);
> > > >                 return;
> > > >         }
> > > >
> > > > @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(struct
> > drm_plane *plane,
> > > >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > >                                      layer->overlay, plane);
> > > >         sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> > > > -                             true, zpos, old_zpos);
> > > > +                             true, zpos);
> > > >  }
> > > >
> > > >  static const struct drm_plane_helper_funcs=20
sun8i_ui_layer_helper_funcs =3D
> > {
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/d=
rm/
> > sun4i/sun8i_vi_layer.c
> > > > index bb7c43036dfa..4653244b2fd8 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > @@ -18,8 +18,7 @@
> > > >  #include "sun8i_vi_scaler.h"
> > > >
> > > >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int=20
channel,
> > > > -                                 int overlay, bool enable, unsigne=
d=20
int
> > zpos,
> > > > -                                 unsigned int old_zpos)
> > > > +                                 int overlay, bool enable, unsigne=
d=20
int
> > zpos)
> > > >  {
> > > >         u32 val, bld_base, ch_base;
> > > >
> > > > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct=20
sun8i_mixer
> > *mixer, int channel,
> > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > overlay),
> > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
> > > >
> > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > -
> > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > -                                  0);
> > > > -
> > > > -               regmap_update_bits(mixer->engine.regs,
> > > > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base=
),
> > > > -
> > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > -                                  0);
> > > > -       }
> > > > -
> > > >         if (enable) {
> > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > >
> > > > @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(struct
> > drm_plane *plane,
> > > >  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
> > > >                                           struct drm_atomic_state=20
*state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(pl=
ane);
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> > false, 0,
> > > > -                             old_zpos);
> > > > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> > false, 0);
> > > >  }
> > > >
> > > >  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > > >                                          struct drm_atomic_state=20
*state)
> > > >  {
> > > > -       struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > > > -
> > plane);
> > > >         struct drm_plane_state *new_state =3D
> > drm_atomic_get_new_plane_state(state,
> > > >
> > plane);
> > > >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(pl=
ane);
> > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > >
> > > >         if (!new_state->visible) {
> > > >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > > > -                                     layer->overlay, false, 0,=20
old_zpos);
> > > > +                                     layer->overlay, false, 0);
> > > >                 return;
> > > >         }
> > > >
> > > > @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(struct
> > drm_plane *plane,
> > > >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > >                                      layer->overlay, plane);
> > > >         sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> > > > -                             true, zpos, old_zpos);
> > > > +                             true, zpos);
> > > >  }
> > > >
> > > >  static const struct drm_plane_helper_funcs=20
sun8i_vi_layer_helper_funcs =3D
> > {
> > > > --
> > > > 2.30.2
> > > >
> > >
> >
> >
>=20


