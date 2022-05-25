Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCD533F9D
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D652F10FA6E;
	Wed, 25 May 2022 14:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655210FA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:56:08 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id t2so13373762qkb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/Ot+95wTH85e61GEd+xt96zGn3altJgPirB7QC1WIJI=;
 b=BmdVEbsQEp88423D8G5qsAheFzlxeCOflLaevWMMMRd5FWEOsIl5uRQ/F1Piw9DwHR
 aZPIaQipGgloI0ZxtDehg3E2fr+/LW4q5A6cXZTuLnTME8743NWCpGXCYM1leW/87Eo4
 kikrEIogY7JfY7TlMSKyjmQZYHwVaT5XsrJ1+yfXM4xq5bwcrmvnYwWmb89/bUwhggX/
 WwhKM3dKwvrFfxbg8+q9R7fMznCn+eW/jkXE4TkxD9tyS+aL6Z9tGcOu2gGM1PK4Apkm
 5Vr7jNI+Nx8WWW0KEj95QOHMxRcXw7tRoiMv9MMdtQh8oI76st5gamoVoPv/rm4ahBtv
 2mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/Ot+95wTH85e61GEd+xt96zGn3altJgPirB7QC1WIJI=;
 b=0kF/I65YvnOaj2ocqZBKxXgh1DK0vxQgEMjYFrtYX0oV1xcRGxphWWpqNdLq3RhBYs
 xByCbwSaJ4BOhBjE4PHDUIeWFlIiST3zKC8HyjkO8irSyi4wj+q/jCMH6x4Ur5cXVnY7
 tMuQkmLCHXjaaEchbYBQnaxCb9Oryxbz2VqPxaDOYVLFDE4Z/dwUKEgkpQNmpdIXXqXB
 8w7V5CjOfkbRgpJU+qpauYpDMfu8ovN6IM1hOBZkhwhi4pDdNDLCHVuz8i1IBjxRXPP4
 OFf/4Rp4n9u6pX05dVVdDPbAXUcXGX7IVg6Pn1o5N+wuUtBNXhrXx+bhxR29Rd4p241n
 Ef6A==
X-Gm-Message-State: AOAM533AAuxelcwHXXqVeRAaECz8a/7INeUz/JGqSBiazXT889rWEFhe
 C/ihIj+ziCL4hnyuT+Mg2N1Zz7MbCkzq81T4fkVtQ4Le
X-Google-Smtp-Source: ABdhPJz4ANZBeCyoxb1Xwja6okypsKoE/aUiXFywiyVvRKRVB1VexVdGTQCR+UbMXhN2ttDHH4+uIfvCdCjTbb57v7A=
X-Received: by 2002:a05:620a:c4f:b0:67d:4996:fd8 with SMTP id
 u15-20020a05620a0c4f00b0067d49960fd8mr20226797qki.518.1653490567736; Wed, 25
 May 2022 07:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <CAGphcdn=7r1p217m0DczgYZeGV+STe9PAAAuMjb0qXq2cteEwg@mail.gmail.com>
 <CAGphcdnbAS64yUomkaAMWqStO6mO3nLq2qrOU-W99htH0_Fz-g@mail.gmail.com>
 <3174733.44csPzL39Z@kista>
In-Reply-To: <3174733.44csPzL39Z@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Wed, 25 May 2022 17:55:56 +0300
Message-ID: <CAGphcdmfm43aTim5tVL+LYTrtq+mrwJU9nJxinafXqN4xEhz9w@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for
 DE2.0/DE3.0
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 22:14, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Dne torek, 24. maj 2022 ob 19:14:35 CEST je Roman Stratiienko napisal(a):
> > By the way, not related to this issue:
> >
> > I cherry-picked
> > https://patchwork.kernel.org/project/dri-devel/patch/20220424162633.123=
69-9-samuel@sholland.org/
> > and got a blank FB console on OPI3.
> > Can you check it please?
>
> Reply to that patch and we'll talk.

Despite the fact that I am the original author of the patches I'm not
even in CC, so I can respond to this thread.
Is there any other way to respond to the message where you're not in CC?

>
> Best regards,
> Jernej
>
> >
> > Regards,
> > Roman
> >
> >
> >
> > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 20:10, Roman St=
ratiienko <r.stratiienko@gmail.com>:
> > >
> > > Please draft a test for the zpos issue you're mentioning.
> > >
> > > It's very easy to do with kmsxx using python wrapper.
> > >
> > > Or explain steps to reproduce here, I will write it by myself.
> > >
> > > Thanks.
> > > Regards
> > > Roman
> > >
> > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 19:21, Jernej=
 =C5=A0krabec <jernej.skrabec@gmail.com>:
> > > >
> > > > Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko
> napisal(a):
> > > > > NAK for this. Further testing showed such an approach is not reli=
able
> > > > > due to .atomic_update() callback called only in case planes have =
some
> > > > > changes.
> > > >
> > > > Additionally, I think it would be better to fix underlaying zpos is=
sue
> first
> > > > (attempted many times) and then worry about blending.
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > > >
> > > > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Ro=
man Stratiienko
> <r.stratiienko@gmail.com>:
> > > > > >
> > > > > > Corruption happens when plane zpos is updated
> > > > > >
> > > > > > Example scenario:
> > > > > >
> > > > > > Initial frame blender state:
> > > > > >     PLANE_ZPOS =3D {0, 1, 2, 3}
> > > > > >     BLD_ROUTE  =3D {0, 1, 2, 0}
> > > > > >     BLD_EN     =3D {1, 1, 1, 0}
> > > > > >
> > > > > > New frame commit (Only ZPOS has been changed):
> > > > > >
> > > > > >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> > > > > >
> > > > > > Expected results after plane state update:
> > > > > >                 Z0 Z1 Z2 Z3
> > > > > >     BLD_ROUTE =3D {1, 2, 0, 0}
> > > > > >     BLD_EN    =3D {1, 1, 1, 0}
> > > > > >
> > > > > > What is currently happening:
> > > > > >
> > > > > > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0=
):
> > > > > >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> > > > > >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> > > > > >
> > > > > > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1=
):
> > > > > >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> > > > > >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> > > > > >
> > > > > > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2=
):
> > > > > >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> > > > > >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> > > > > >
> > > > > > After updating of all the planes we are ending up with BLD_EN[2=
]=3D0,
> > > > > > which makes this channel disabled.
> > > > > >
> > > > > > To fix this issue, clear BLEND registers before updating the pl=
anes
> > > > > > and do not clear the old state while processing every plane.
> > > > > >
> > > > > > Signed-off-by: Roman Stratiienko
> <roman.o.stratiienko@globallogic.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
> > > > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 +++
> +----------------------
> > > > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 +++
> +----------------------
> > > > > >  3 files changed, 24 insertions(+), 48 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/=
drm/
> sun4i/
> > > > sun8i_mixer.c
> > > > > > index f5e8aeaa3cdf..004377a000fc 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 forma=
t,
> u32
> > > > *hw_format)
> > > > > >         return -EINVAL;
> > > > > >  }
> > > > > >
> > > > > > +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> > > > > > +                              struct drm_crtc_state *old_state=
)
> > > > > > +{
> > > > > > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(eng=
ine);
> > > > > > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > > > > > +
> > > > > > +       regmap_write(engine->regs,
> > > > > > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > +                    0);
> > > > > > +
> > > > > > +       regmap_write(engine->regs,
> > > > > > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > +                    0);
> > > > > > +}
> > > > > > +
> > > > > >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> > > > > >  {
> > > > > >         DRM_DEBUG_DRIVER("Committing changes\n");
> > > > > > @@ -299,6 +314,7 @@ static struct drm_plane
> **sun8i_layers_init(struct
> > > > drm_device *drm,
> > > > > >  }
> > > > > >
> > > > > >  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> > > > > > +       .atomic_begin   =3D sun8i_atomic_begin,
> > > > > >         .commit         =3D sun8i_mixer_commit,
> > > > > >         .layers_init    =3D sun8i_layers_init,
> > > > > >  };
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/g=
pu/
> drm/
> > > > sun4i/sun8i_ui_layer.c
> > > > > > index 7845c2a53a7f..b294a882626a 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > > @@ -24,8 +24,7 @@
> > > > > >  #include "sun8i_ui_scaler.h"
> > > > > >
> > > > > >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, i=
nt
> channel,
> > > > > > -                                 int overlay, bool enable, uns=
igned
> int
> > > > zpos,
> > > > > > -                                 unsigned int old_zpos)
> > > > > > +                                 int overlay, bool enable, uns=
igned
> int
> > > > zpos)
> > > > > >  {
> > > > > >         u32 val, bld_base, ch_base;
> > > > > >
> > > > > > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct
> sun8i_mixer
> > > > *mixer, int channel,
> > > > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_ba=
se,
> > > > overlay),
> > > > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, v=
al);
> > > > > >
> > > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > -
> SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > -
> > > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > > -                                  0);
> > > > > > -
> > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > -
> SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > -
> > > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > > -                                  0);
> > > > > > -       }
> > > > > > -
> > > > > >         if (enable) {
> > > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > > > >
> > > > > > @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(st=
ruct
> > > > drm_plane *plane,
> > > > > >  static void sun8i_ui_layer_atomic_disable(struct drm_plane *pl=
ane,
> > > > > >                                           struct drm_atomic_sta=
te
> *state)
> > > > > >  {
> > > > > > -       struct drm_plane_state *old_state =3D
> > > > drm_atomic_get_old_plane_state(state,
> > > > > > -
> > > > plane);
> > > > > >         struct sun8i_ui_layer *layer =3D
> plane_to_sun8i_ui_layer(plane);
> > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > >
> > > > > > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > false, 0,
> > > > > > -                             old_zpos);
> > > > > > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > false, 0);
> > > > > >  }
> > > > > >
> > > > > >  static void sun8i_ui_layer_atomic_update(struct drm_plane *pla=
ne,
> > > > > >                                          struct drm_atomic_stat=
e
> *state)
> > > > > >  {
> > > > > > -       struct drm_plane_state *old_state =3D
> > > > drm_atomic_get_old_plane_state(state,
> > > > > > -
> > > > plane);
> > > > > >         struct drm_plane_state *new_state =3D
> > > > drm_atomic_get_new_plane_state(state,
> > > > > >
> > > > plane);
> > > > > >         struct sun8i_ui_layer *layer =3D
> plane_to_sun8i_ui_layer(plane);
> > > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > >
> > > > > >         if (!new_state->visible) {
> > > > > >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > > > > > -                                     layer->overlay, false, 0,
> old_zpos);
> > > > > > +                                     layer->overlay, false, 0)=
;
> > > > > >                 return;
> > > > > >         }
> > > > > >
> > > > > > @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(st=
ruct
> > > > drm_plane *plane,
> > > > > >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > > > >                                      layer->overlay, plane);
> > > > > >         sun8i_ui_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > > > -                             true, zpos, old_zpos);
> > > > > > +                             true, zpos);
> > > > > >  }
> > > > > >
> > > > > >  static const struct drm_plane_helper_funcs
> sun8i_ui_layer_helper_funcs =3D
> > > > {
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/g=
pu/
> drm/
> > > > sun4i/sun8i_vi_layer.c
> > > > > > index bb7c43036dfa..4653244b2fd8 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > > @@ -18,8 +18,7 @@
> > > > > >  #include "sun8i_vi_scaler.h"
> > > > > >
> > > > > >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, i=
nt
> channel,
> > > > > > -                                 int overlay, bool enable, uns=
igned
> int
> > > > zpos,
> > > > > > -                                 unsigned int old_zpos)
> > > > > > +                                 int overlay, bool enable, uns=
igned
> int
> > > > zpos)
> > > > > >  {
> > > > > >         u32 val, bld_base, ch_base;
> > > > > >
> > > > > > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct
> sun8i_mixer
> > > > *mixer, int channel,
> > > > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_ba=
se,
> > > > overlay),
> > > > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, v=
al);
> > > > > >
> > > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > -
> SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > -
> > > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > > -                                  0);
> > > > > > -
> > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > -
> SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > -
> > > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > > -                                  0);
> > > > > > -       }
> > > > > > -
> > > > > >         if (enable) {
> > > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > > > > >
> > > > > > @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(st=
ruct
> > > > drm_plane *plane,
> > > > > >  static void sun8i_vi_layer_atomic_disable(struct drm_plane *pl=
ane,
> > > > > >                                           struct drm_atomic_sta=
te
> *state)
> > > > > >  {
> > > > > > -       struct drm_plane_state *old_state =3D
> > > > drm_atomic_get_old_plane_state(state,
> > > > > > -
> > > > plane);
> > > > > >         struct sun8i_vi_layer *layer =3D
> plane_to_sun8i_vi_layer(plane);
> > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > >
> > > > > > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > false, 0,
> > > > > > -                             old_zpos);
> > > > > > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > false, 0);
> > > > > >  }
> > > > > >
> > > > > >  static void sun8i_vi_layer_atomic_update(struct drm_plane *pla=
ne,
> > > > > >                                          struct drm_atomic_stat=
e
> *state)
> > > > > >  {
> > > > > > -       struct drm_plane_state *old_state =3D
> > > > drm_atomic_get_old_plane_state(state,
> > > > > > -
> > > > plane);
> > > > > >         struct drm_plane_state *new_state =3D
> > > > drm_atomic_get_new_plane_state(state,
> > > > > >
> > > > plane);
> > > > > >         struct sun8i_vi_layer *layer =3D
> plane_to_sun8i_vi_layer(plane);
> > > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > >
> > > > > >         if (!new_state->visible) {
> > > > > >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > > > > > -                                     layer->overlay, false, 0,
> old_zpos);
> > > > > > +                                     layer->overlay, false, 0)=
;
> > > > > >                 return;
> > > > > >         }
> > > > > >
> > > > > > @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(st=
ruct
> > > > drm_plane *plane,
> > > > > >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > > > >                                      layer->overlay, plane);
> > > > > >         sun8i_vi_layer_enable(mixer, layer->channel, layer->ove=
rlay,
> > > > > > -                             true, zpos, old_zpos);
> > > > > > +                             true, zpos);
> > > > > >  }
> > > > > >
> > > > > >  static const struct drm_plane_helper_funcs
> sun8i_vi_layer_helper_funcs =3D
> > > > {
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > >
> > > >
> > > >
> >
>
>
