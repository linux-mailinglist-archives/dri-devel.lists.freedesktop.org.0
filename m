Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CAB532ED7
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 18:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55310E0D0;
	Tue, 24 May 2022 16:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462B10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 16:21:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id f21so22732583ejh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Cb91IyEAr0B5p/ob7IK1Ar4noLymKdOsr8SJytxtMJA=;
 b=jzaDMCylIHYl9KbN3+pd1vKSi6LvEYnakIsh+mSV8RE0MXAeso82EpRMvk5kp3Im7i
 V+yBAFiJej31TdJCV83hY43Y/KDY4n7iq914FW5R4ZtTf3nsT4K2ZJurognr2qfz77mK
 ztGuetJCPEWEk09e+4xfybrkj6imIkR55AAYGKanlZveWO4Mb5gBozyGs6dRPhm4TR5c
 XtlbQB+Ed24N9482mjRtSXr0vtqcS1/2HSOu+0779Vdu36HMenYwwyYGrDY3BzZ1i+bk
 wIHK5yaZrvm6STDuq/jDpzJ9Bb0XednDlCwz5jX7FSXkGCtefGMqFtqoMrV/Z2ZANbrk
 Hlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cb91IyEAr0B5p/ob7IK1Ar4noLymKdOsr8SJytxtMJA=;
 b=CDeSVjdaB0VxkSBHG0qQttDKAZNiVmj39WUcfBkyIZoF7JQ+Hx9JozOVhLSQ+GpIdu
 OA/AOWkoCxmRHl0yzXsieCP4vuu6cjkvxpidUttIsEMUFOb+XOqrEnmte6Rk68AgG9hf
 +avVDBUoHw6G0i6cbS5GiPqr27IHJKe00ozF3NC6ZtUfvgCsj5y5b6x7S+P1qN5TCNwl
 CGr5Js0dmCcXYKE0GcguT0qjs8TUzkpAh2ArF54Mv+LmdSSjBD6AvfkUb8QFW8OVWTDp
 7aQLX2II+5QFBCr33ZOz5dODkYwfbs/nI3EYwie0OfgfFqU6Zg3pD3Ks8k4f5fqN1IAe
 uOqw==
X-Gm-Message-State: AOAM532iooxinYRTIbO2RM6aYxT8/vLxeXZTnCNDql3ca83stgcfDXRS
 Nm6okfbJ/ID5NV2EjNWD+xE=
X-Google-Smtp-Source: ABdhPJx8A+b//0x2b4fG5OtqL9vifmcAevWuPfpSs3ilLxwDLKDbolhxliTD7r71dRH6UYINmssHtQ==
X-Received: by 2002:a17:907:c0d:b0:6fe:b448:61e3 with SMTP id
 ga13-20020a1709070c0d00b006feb44861e3mr17780920ejc.673.1653409276594; 
 Tue, 24 May 2022 09:21:16 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 c25-20020aa7d619000000b0042a5a39ba7esm9669414edr.25.2022.05.24.09.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 09:21:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for
 DE2.0/DE3.0
Date: Tue, 24 May 2022 17:36:16 +0200
Message-ID: <2629819.mvXUDI8C0e@kista>
In-Reply-To: <CAGphcd=wTPnTqNxP+TQ8YCDsT=7EUVssAKDpG2J_G=R-7N=YKQ@mail.gmail.com>
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <CAGphcd=wTPnTqNxP+TQ8YCDsT=7EUVssAKDpG2J_G=R-7N=YKQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko napisal(a):
> NAK for this. Further testing showed such an approach is not reliable
> due to .atomic_update() callback called only in case planes have some
> changes.

Additionally, I think it would be better to fix underlaying zpos issue firs=
t=20
(attempted many times) and then worry about blending.

Best regards,
Jernej

>=20
> =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Roman Stra=
tiienko <r.stratiienko@gmail.com>:
> >
> > Corruption happens when plane zpos is updated
> >
> > Example scenario:
> >
> > Initial frame blender state:
> >     PLANE_ZPOS =3D {0, 1, 2, 3}
> >     BLD_ROUTE  =3D {0, 1, 2, 0}
> >     BLD_EN     =3D {1, 1, 1, 0}
> >
> > New frame commit (Only ZPOS has been changed):
> >
> >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> >
> > Expected results after plane state update:
> >                 Z0 Z1 Z2 Z3
> >     BLD_ROUTE =3D {1, 2, 0, 0}
> >     BLD_EN    =3D {1, 1, 1, 0}
> >
> > What is currently happening:
> >
> > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0):
> >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> >
> > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1):
> >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> >
> > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2):
> >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> >
> > After updating of all the planes we are ending up with BLD_EN[2]=3D0,
> > which makes this channel disabled.
> >
> > To fix this issue, clear BLEND registers before updating the planes
> > and do not clear the old state while processing every plane.
> >
> > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 ++++----------------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 ++++----------------------
> >  3 files changed, 24 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/
sun8i_mixer.c
> > index f5e8aeaa3cdf..004377a000fc 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32=20
*hw_format)
> >         return -EINVAL;
> >  }
> >
> > +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> > +                              struct drm_crtc_state *old_state)
> > +{
> > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > +
> > +       regmap_write(engine->regs,
> > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > +                    0);
> > +
> > +       regmap_write(engine->regs,
> > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > +                    0);
> > +}
> > +
> >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> >  {
> >         DRM_DEBUG_DRIVER("Committing changes\n");
> > @@ -299,6 +314,7 @@ static struct drm_plane **sun8i_layers_init(struct=
=20
drm_device *drm,
> >  }
> >
> >  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> > +       .atomic_begin   =3D sun8i_atomic_begin,
> >         .commit         =3D sun8i_mixer_commit,
> >         .layers_init    =3D sun8i_layers_init,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/
sun4i/sun8i_ui_layer.c
> > index 7845c2a53a7f..b294a882626a 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -24,8 +24,7 @@
> >  #include "sun8i_ui_scaler.h"
> >
> >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int chann=
el,
> > -                                 int overlay, bool enable, unsigned in=
t=20
zpos,
> > -                                 unsigned int old_zpos)
> > +                                 int overlay, bool enable, unsigned in=
t=20
zpos)
> >  {
> >         u32 val, bld_base, ch_base;
> >
> > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer=
=20
*mixer, int channel,
> >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,=20
overlay),
> >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> >
> > -       if (!enable || zpos !=3D old_zpos) {
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > -                                  0);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                 =20
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > -                                  0);
> > -       }
> > -
> >         if (enable) {
> >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> >
> > @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(struct=20
drm_plane *plane,
> >  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
> >                                           struct drm_atomic_state *stat=
e)
> >  {
> > -       struct drm_plane_state *old_state =3D=20
drm_atomic_get_old_plane_state(state,
> > -                                                                      =
   =20
plane);
> >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer =3D layer->mixer;
> >
> > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,=20
false, 0,
> > -                             old_zpos);
> > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,=20
false, 0);
> >  }
> >
> >  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> >                                          struct drm_atomic_state *state)
> >  {
> > -       struct drm_plane_state *old_state =3D=20
drm_atomic_get_old_plane_state(state,
> > -                                                                      =
   =20
plane);
> >         struct drm_plane_state *new_state =3D=20
drm_atomic_get_new_plane_state(state,
> >                                                                        =
   =20
plane);
> >         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> >         unsigned int zpos =3D new_state->normalized_zpos;
> > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer =3D layer->mixer;
> >
> >         if (!new_state->visible) {
> >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > -                                     layer->overlay, false, 0, old_zpo=
s);
> > +                                     layer->overlay, false, 0);
> >                 return;
> >         }
> >
> > @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(struct=20
drm_plane *plane,
> >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >         sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> > -                             true, zpos, old_zpos);
> > +                             true, zpos);
> >  }
> >
> >  static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs=
 =3D=20
{
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/
sun4i/sun8i_vi_layer.c
> > index bb7c43036dfa..4653244b2fd8 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -18,8 +18,7 @@
> >  #include "sun8i_vi_scaler.h"
> >
> >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int chann=
el,
> > -                                 int overlay, bool enable, unsigned in=
t=20
zpos,
> > -                                 unsigned int old_zpos)
> > +                                 int overlay, bool enable, unsigned in=
t=20
zpos)
> >  {
> >         u32 val, bld_base, ch_base;
> >
> > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer=
=20
*mixer, int channel,
> >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,=20
overlay),
> >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
> >
> > -       if (!enable || zpos !=3D old_zpos) {
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                 =20
SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > -                                  0);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                 =20
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > -                                  0);
> > -       }
> > -
> >         if (enable) {
> >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> >
> > @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(struct=20
drm_plane *plane,
> >  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
> >                                           struct drm_atomic_state *stat=
e)
> >  {
> > -       struct drm_plane_state *old_state =3D=20
drm_atomic_get_old_plane_state(state,
> > -                                                                      =
   =20
plane);
> >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer =3D layer->mixer;
> >
> > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,=20
false, 0,
> > -                             old_zpos);
> > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,=20
false, 0);
> >  }
> >
> >  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> >                                          struct drm_atomic_state *state)
> >  {
> > -       struct drm_plane_state *old_state =3D=20
drm_atomic_get_old_plane_state(state,
> > -                                                                      =
   =20
plane);
> >         struct drm_plane_state *new_state =3D=20
drm_atomic_get_new_plane_state(state,
> >                                                                        =
   =20
plane);
> >         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> >         unsigned int zpos =3D new_state->normalized_zpos;
> > -       unsigned int old_zpos =3D old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer =3D layer->mixer;
> >
> >         if (!new_state->visible) {
> >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > -                                     layer->overlay, false, 0, old_zpo=
s);
> > +                                     layer->overlay, false, 0);
> >                 return;
> >         }
> >
> > @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(struct=20
drm_plane *plane,
> >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >         sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> > -                             true, zpos, old_zpos);
> > +                             true, zpos);
> >  }
> >
> >  static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs=
 =3D=20
{
> > --
> > 2.30.2
> >
>=20


