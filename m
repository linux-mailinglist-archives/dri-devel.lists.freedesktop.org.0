Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A75331A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D6510E351;
	Tue, 24 May 2022 19:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492110E351
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 19:14:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ck4so33013451ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUNbIM3O9IVgMuURLoH1enWN67UzqQk+sae4XN4TllE=;
 b=i5W5Hr3TnPWdLCB0yyT/B6rlkC5BY9u1hPBetlVyy3/9wyZlcUkPyuq/uZSfouPrmj
 7zxfYmw6VMvMW77zOYDZ/46ckoGLiX0+vMRvUhyuch4GzskvhC87e5ogtTmLSPEC6o0I
 21TVLo5M+A2PIcQZZyZMpG2Femy4fhFEH8E3dmUZJkyGmdk6XnDbkiBDd73wKI6lPC70
 X5iU8RSEqhnVQ+0JAI94/8SuDk0KklDE+92ihtHb8Vwd6ccdyf411ykhpqCg7eyeYHaD
 xVUJQ2aQK850GVmNVJdJFsx+fJwqqXLNIf6NWV+VVI7JGjsaeBDbp7b4gtICECuv4fY1
 PCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUNbIM3O9IVgMuURLoH1enWN67UzqQk+sae4XN4TllE=;
 b=EpQy2Q5AyrqcHX5u93g/5eBQq/hEivHN19+UowQTIwNscDeRMtgdhhaUSDJJUCG9ki
 bBsEU1LvQjvMEeblL3A+sxYt6hv4hpGfEI23R1TasvFXWYzcS4+myH6QuYJ/VeNB0a8x
 cv/WKi5HZ4bQ4fp1Y7hIu/s7AdIivrZReq6MapkZBCXKkKLxhR1zxNyqb5ZCgQNypNAQ
 pa0jF5g+zMTdT5Am61Tq868H1X3S5WK0/jXhCS8zKQDp/AtZli012DWS0ebf9r7IbLlq
 qBTMBHkx3z9T6ivoWbedN8fqYedTjITfFa7/UjvGrS45+lcMsljMxVKY0aStfZbviQG5
 FgWg==
X-Gm-Message-State: AOAM533gYke72UTs/VX71D2pPkxE1sWn0a4/rguZ1b6XuGhs1SYQ1oVR
 I5SCQ5lPO5jP85Vdo9mPY7I=
X-Google-Smtp-Source: ABdhPJy55BARM8sTDIdGNAvfeVy4m0ARiKvAodu9th+WWcY2lPc3PErfQprwXDlrx7DmiVmvM8dwug==
X-Received: by 2002:a17:906:d552:b0:6f5:942e:bc5f with SMTP id
 cr18-20020a170906d55200b006f5942ebc5fmr25761129ejc.110.1653419644250; 
 Tue, 24 May 2022 12:14:04 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 r17-20020a056402019100b0042abf2affebsm9767860edv.67.2022.05.24.12.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:14:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for
 DE2.0/DE3.0
Date: Tue, 24 May 2022 21:14:02 +0200
Message-ID: <3174733.44csPzL39Z@kista>
In-Reply-To: <CAGphcdnbAS64yUomkaAMWqStO6mO3nLq2qrOU-W99htH0_Fz-g@mail.gmail.com>
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
 <CAGphcdnbAS64yUomkaAMWqStO6mO3nLq2qrOU-W99htH0_Fz-g@mail.gmail.com>
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

Dne torek, 24. maj 2022 ob 19:14:35 CEST je Roman Stratiienko napisal(a):
> By the way, not related to this issue:
>=20
> I cherry-picked
> https://patchwork.kernel.org/project/dri-devel/patch/20220424162633.12369=
=2D9-samuel@sholland.org/
> and got a blank FB console on OPI3.
> Can you check it please?

Reply to that patch and we'll talk.

Best regards,
Jernej

>=20
> Regards,
> Roman
>=20
>=20
>=20
> =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 20:10, Roman Stra=
tiienko <r.stratiienko@gmail.com>:
> >
> > Please draft a test for the zpos issue you're mentioning.
> >
> > It's very easy to do with kmsxx using python wrapper.
> >
> > Or explain steps to reproduce here, I will write it by myself.
> >
> > Thanks.
> > Regards
> > Roman
> >
> > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 19:21, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> > >
> > > Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko=20
napisal(a):
> > > > NAK for this. Further testing showed such an approach is not reliab=
le
> > > > due to .atomic_update() callback called only in case planes have so=
me
> > > > changes.
> > >
> > > Additionally, I think it would be better to fix underlaying zpos issu=
e=20
first
> > > (attempted many times) and then worry about blending.
> > >
> > > Best regards,
> > > Jernej
> > >
> > > >
> > > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Roma=
n Stratiienko=20
<r.stratiienko@gmail.com>:
> > > > >
> > > > > Corruption happens when plane zpos is updated
> > > > >
> > > > > Example scenario:
> > > > >
> > > > > Initial frame blender state:
> > > > >     PLANE_ZPOS =3D {0, 1, 2, 3}
> > > > >     BLD_ROUTE  =3D {0, 1, 2, 0}
> > > > >     BLD_EN     =3D {1, 1, 1, 0}
> > > > >
> > > > > New frame commit (Only ZPOS has been changed):
> > > > >
> > > > >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> > > > >
> > > > > Expected results after plane state update:
> > > > >                 Z0 Z1 Z2 Z3
> > > > >     BLD_ROUTE =3D {1, 2, 0, 0}
> > > > >     BLD_EN    =3D {1, 1, 1, 0}
> > > > >
> > > > > What is currently happening:
> > > > >
> > > > > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0):
> > > > >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> > > > >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> > > > >
> > > > > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1):
> > > > >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> > > > >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> > > > >
> > > > > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2):
> > > > >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> > > > >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> > > > >
> > > > > After updating of all the planes we are ending up with BLD_EN[2]=
=3D0,
> > > > > which makes this channel disabled.
> > > > >
> > > > > To fix this issue, clear BLEND registers before updating the plan=
es
> > > > > and do not clear the old state while processing every plane.
> > > > >
> > > > > Signed-off-by: Roman Stratiienko=20
<roman.o.stratiienko@globallogic.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
> > > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 +++
+----------------------
> > > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 +++
+----------------------
> > > > >  3 files changed, 24 insertions(+), 48 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/dr=
m/
sun4i/
> > > sun8i_mixer.c
> > > > > index f5e8aeaa3cdf..004377a000fc 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format,=
=20
u32
> > > *hw_format)
> > > > >         return -EINVAL;
> > > > >  }
> > > > >
> > > > > +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> > > > > +                              struct drm_crtc_state *old_state)
> > > > > +{
> > > > > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engin=
e);
> > > > > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > > > > +
> > > > > +       regmap_write(engine->regs,
> > > > > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > +                    0);
> > > > > +
> > > > > +       regmap_write(engine->regs,
> > > > > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > +                    0);
> > > > > +}
> > > > > +
> > > > >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> > > > >  {
> > > > >         DRM_DEBUG_DRIVER("Committing changes\n");
> > > > > @@ -299,6 +314,7 @@ static struct drm_plane=20
**sun8i_layers_init(struct
> > > drm_device *drm,
> > > > >  }
> > > > >
> > > > >  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> > > > > +       .atomic_begin   =3D sun8i_atomic_begin,
> > > > >         .commit         =3D sun8i_mixer_commit,
> > > > >         .layers_init    =3D sun8i_layers_init,
> > > > >  };
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/
drm/
> > > sun4i/sun8i_ui_layer.c
> > > > > index 7845c2a53a7f..b294a882626a 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > @@ -24,8 +24,7 @@
> > > > >  #include "sun8i_ui_scaler.h"
> > > > >
> > > > >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int=
=20
channel,
> > > > > -                                 int overlay, bool enable, unsig=
ned=20
int
> > > zpos,
> > > > > -                                 unsigned int old_zpos)
> > > > > +                                 int overlay, bool enable, unsig=
ned=20
int
> > > zpos)
> > > > >  {
> > > > >         u32 val, bld_base, ch_base;
> > > > >
> > > > > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct=20
sun8i_mixer
> > > *mixer, int channel,
> > > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> > > overlay),
> > > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val=
);
> > > > >
> > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > -
> > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > -                                  0);
> > > > > -
> > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > -                                 =20
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > -
> > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > -                                  0);
> > > > > -       }
> > > > > -
> > > > >         if (enable) {
> > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > > >
> > > > > @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(stru=
ct
> > > drm_plane *plane,
> > > > >  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plan=
e,
> > > > >                                           struct drm_atomic_state=
=20
*state)
> > > > >  {
> > > > > -       struct drm_plane_state *old_state =3D
> > > drm_atomic_get_old_plane_state(state,
> > > > > -
> > > plane);
> > > > >         struct sun8i_ui_layer *layer =3D=20
plane_to_sun8i_ui_layer(plane);
> > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > >
> > > > > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > false, 0,
> > > > > -                             old_zpos);
> > > > > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > false, 0);
> > > > >  }
> > > > >
> > > > >  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > > > >                                          struct drm_atomic_state=
=20
*state)
> > > > >  {
> > > > > -       struct drm_plane_state *old_state =3D
> > > drm_atomic_get_old_plane_state(state,
> > > > > -
> > > plane);
> > > > >         struct drm_plane_state *new_state =3D
> > > drm_atomic_get_new_plane_state(state,
> > > > >
> > > plane);
> > > > >         struct sun8i_ui_layer *layer =3D=20
plane_to_sun8i_ui_layer(plane);
> > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > >
> > > > >         if (!new_state->visible) {
> > > > >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > > > > -                                     layer->overlay, false, 0,=20
old_zpos);
> > > > > +                                     layer->overlay, false, 0);
> > > > >                 return;
> > > > >         }
> > > > >
> > > > > @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(stru=
ct
> > > drm_plane *plane,
> > > > >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > > >                                      layer->overlay, plane);
> > > > >         sun8i_ui_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > > > -                             true, zpos, old_zpos);
> > > > > +                             true, zpos);
> > > > >  }
> > > > >
> > > > >  static const struct drm_plane_helper_funcs=20
sun8i_ui_layer_helper_funcs =3D
> > > {
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/
drm/
> > > sun4i/sun8i_vi_layer.c
> > > > > index bb7c43036dfa..4653244b2fd8 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > @@ -18,8 +18,7 @@
> > > > >  #include "sun8i_vi_scaler.h"
> > > > >
> > > > >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int=
=20
channel,
> > > > > -                                 int overlay, bool enable, unsig=
ned=20
int
> > > zpos,
> > > > > -                                 unsigned int old_zpos)
> > > > > +                                 int overlay, bool enable, unsig=
ned=20
int
> > > zpos)
> > > > >  {
> > > > >         u32 val, bld_base, ch_base;
> > > > >
> > > > > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct=20
sun8i_mixer
> > > *mixer, int channel,
> > > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > > overlay),
> > > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val=
);
> > > > >
> > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > -
> > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > -                                  0);
> > > > > -
> > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > -                                 =20
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > -
> > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > -                                  0);
> > > > > -       }
> > > > > -
> > > > >         if (enable) {
> > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > > >
> > > > > @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(stru=
ct
> > > drm_plane *plane,
> > > > >  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plan=
e,
> > > > >                                           struct drm_atomic_state=
=20
*state)
> > > > >  {
> > > > > -       struct drm_plane_state *old_state =3D
> > > drm_atomic_get_old_plane_state(state,
> > > > > -
> > > plane);
> > > > >         struct sun8i_vi_layer *layer =3D=20
plane_to_sun8i_vi_layer(plane);
> > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > >
> > > > > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > false, 0,
> > > > > -                             old_zpos);
> > > > > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > false, 0);
> > > > >  }
> > > > >
> > > > >  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > > > >                                          struct drm_atomic_state=
=20
*state)
> > > > >  {
> > > > > -       struct drm_plane_state *old_state =3D
> > > drm_atomic_get_old_plane_state(state,
> > > > > -
> > > plane);
> > > > >         struct drm_plane_state *new_state =3D
> > > drm_atomic_get_new_plane_state(state,
> > > > >
> > > plane);
> > > > >         struct sun8i_vi_layer *layer =3D=20
plane_to_sun8i_vi_layer(plane);
> > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > >
> > > > >         if (!new_state->visible) {
> > > > >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > > > > -                                     layer->overlay, false, 0,=20
old_zpos);
> > > > > +                                     layer->overlay, false, 0);
> > > > >                 return;
> > > > >         }
> > > > >
> > > > > @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(stru=
ct
> > > drm_plane *plane,
> > > > >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > > >                                      layer->overlay, plane);
> > > > >         sun8i_vi_layer_enable(mixer, layer->channel, layer->overl=
ay,
> > > > > -                             true, zpos, old_zpos);
> > > > > +                             true, zpos);
> > > > >  }
> > > > >
> > > > >  static const struct drm_plane_helper_funcs=20
sun8i_vi_layer_helper_funcs =3D
> > > {
> > > > > --
> > > > > 2.30.2
> > > > >
> > > >
> > >
> > >
>=20


