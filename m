Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9A53F1AD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 23:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468E210E8E0;
	Mon,  6 Jun 2022 21:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2687910E8E0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 21:27:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k19so21472406wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9WXEt0d5VWVPT45RFnI3iwWeV57Th5zrE4OG14fWsM=;
 b=UKJAaMHvsMk3isiZOfnAHzy5T2BlXzSGz/br0IRqcPitgBBVswDiMU6CXUv2eiX+nx
 RtmdEv+IiJCozRPwLIHyhiIyHX8UkEIEekJdyqSEVdGV+zcFG2qYr1e9p6q8bvQixB7p
 15JkXEd+vp/VA3LRa3S4XcxWTbO8UKgPqHnx5ErXRzDDHDfnR2sWqATzGOV0K6e5Vl1x
 yG3GYe/AUb11OTOogIbyyneef7kjpiAg/E6/Ii1t5wUVPjW4lMUi+k1MDO/miT7zHmp2
 Mh4ATTgL3Zvtj5mbpJrMAn/yZZF5Tud1O7hRPZUG6QEVu7P+pw3aPO3eicFyto8R2A8f
 pfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9WXEt0d5VWVPT45RFnI3iwWeV57Th5zrE4OG14fWsM=;
 b=Dk0Wyf1ccovQodmHengy+QR9pjwRWljbl4Wpcz5ZEpepUt7YZoKLDvUPI0uDonINHI
 PddJRZElGSuJ5Yv9YalbRqbu+C80Yi7mfPI/I9JbDzpTu0BwkQE5uqkHMRDDg8eiDj1b
 PPKJ6ssSA/yUL6kBY4MiXggKyOx23gHr9/5hwBAkIgRhMNmqLY4ajUEYOvPiWXj9b09X
 yj7rP/RZO5cwVTBH5zdj1KUUKAOHEz9Wmi/uZjPJ+xce1ZmQML9Verg3v9uiWK3wyhK6
 ItBKeyTbgf3vGQqByVxuGteDHy0D80diKiJGbs7fBcc3teuB4U/AKZF9r6zHSgIl5Esm
 ORIg==
X-Gm-Message-State: AOAM531VIpsXYBXJ8I1O60l1O2Zkj+y2gTwysH3vI0ITdHujj/N513oQ
 UyRkUG1wlhK7qULQnvAs9Lw=
X-Google-Smtp-Source: ABdhPJyTo9+sRapDu7NrIA5yA88XZaxNNZffIkE8/f8rSHy8reybydN8y/QdAITvfzIrsF/UeVWGSw==
X-Received: by 2002:a5d:44d1:0:b0:218:418a:3e8e with SMTP id
 z17-20020a5d44d1000000b00218418a3e8emr6120121wrr.112.1654550826754; 
 Mon, 06 Jun 2022 14:27:06 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b0039b006bd6d9sm24758061wmq.6.2022.06.06.14.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:27:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode
 property
Date: Mon, 06 Jun 2022 23:27:05 +0200
Message-ID: <2240089.ElGaqSPkdT@kista>
In-Reply-To: <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
 <4714286.GXAFRqVoOG@jernej-laptop>
 <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
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
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 06. junij 2022 ob 10:17:20 CEST je Roman Stratiienko=20
napisal(a):
> Hello Jernej,
>=20
> Thank you for having a look.
>=20
> =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:37, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko=20
napisal(a):
> > > Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> > > "None", "Pre-multiplied", "Coverage"
> > >
> > > Add the blend mode property and route it to the appropriate registers.
> > >
> > > Note:
> > > "force_premulti" parameter was added to handle multi-overlay channel
> > > cases in future changes. It must be set to true for cases when more
> > > than 1 overlay layer is used within a channel and at least one of the
> > > overlay layers within a group uses premultiplied blending mode.
> >
> > Please remove this parameter. It's nothing special, so it can be easily=
=20
added
> > once it's actually needed. For now, it only complicates code.
>=20
> I would prefer keeping it if you do not have any strong opinion against i=
t.

Actually I do. Patch will be smaller and easier to follow if there is no ex=
tra=20
variables with fixed values in it.

>=20
> I am working now on exposing all overlays, so it will be needed soon anyw=
ay.

Well, it will just be one patch more there, if at all.

Regards,
Jernej

>=20
> Also it helps to better understand the COV2PREMULT mode which has not
> the best description in the datasheet. Only after testing this
> register using devmem I became confident on its purpose.
>=20
> >
> > >
> > > Test:
> > > Manually tested all the modes using kmsxx python wrapper with and
> > > without 'force_premulti' flag enabled.
> > >
> > > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 ++
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 48 ++++++++++++++++++++-----
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 49 ++++++++++++++++++++++--=
=2D-
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  5 +++
> > >  5 files changed, 94 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.h index ebfc276b2464..5c05907e26fb
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > > @@ -65,6 +65,8 @@
> > >  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)  (0xf << ((n) << 2))
> > >  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)        ((n) << 2)
> > >
> > > +#define SUN8I_MIXER_BLEND_PREMULTIPLY_EN(pipe)       BIT(pipe)
> > > +
> > >  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED  BIT(1)
> > >
> > >  #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)    BIT(ch)
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index 6ccbbca3176d..
29c0d9cca19a
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > @@ -58,24 +58,46 @@ static void sun8i_ui_layer_enable(struct sun8i_mi=
xer
> > > *mixer, int channel, }
> > >
> > >  static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, i=
nt
> > > channel, -                                    int overlay, struct
> > drm_plane *plane)
> > > +                                     int overlay, struct
> > drm_plane *plane,
> > > +                                     unsigned int zpos,
> > bool force_premulti)
> > >  {
> > > -     u32 mask, val, ch_base;
> > > +     u32 mask, val, ch_base, bld_base;
> > > +     bool in_premulti, out_premulti;
> > >
> > > +     bld_base =3D sun8i_blender_base(mixer);
> > >       ch_base =3D sun8i_channel_base(mixer, channel);
> > >
> > > +     in_premulti =3D plane->state->pixel_blend_mode =3D=3D
> > DRM_MODE_BLEND_PREMULTI;
> > > +     out_premulti =3D force_premulti || in_premulti;
> > > +
> > >       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > > +            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK |
> > > +            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK;
> > >
> > >       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alph=
a >>
> > 8);
> > >
> > > -     val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> > > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > > +     if (plane->state->pixel_blend_mode =3D=3D DRM_MODE_BLEND_PIXEL_=
NONE) {
> > > +             val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYE=
R;
> > > +     } else {
> > > +             val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OP=
AQUE)
> > ?
> > > +
> > SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > > +
> > SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > > +
> > > +             if (in_premulti)
> > > +                     val |=3D
> > SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI;
> > > +     }
> > > +
> > > +     if (!in_premulti && out_premulti)
> > > +             val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM;
> > >
> > >       regmap_update_bits(mixer->engine.regs,
> > >                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> > overlay),
> > >                          mask, val);
> > > +
> > > +     regmap_update_bits(
> > > +             mixer->engine.regs,
> > SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> > > +             SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> > > +             out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) :
> > 0);
> > >  }
> > >
> > >  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int
> > > channel, @@ -274,7 +296,7 @@ static void
> > > sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > > sun8i_ui_layer_update_coord(mixer, layer->channel,
> > >                                   layer->overlay, plane, zpos);
> > >       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> > > -                                 layer->overlay, plane);
> > > +                                 layer->overlay, plane, zpos,
> > false);
> > >       sun8i_ui_layer_update_formats(mixer, layer->channel,
> > >                                     layer->overlay, plane);
> > >       sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > @@ -332,8 +354,8 @@ struct sun8i_ui_layer=20
*sun8i_ui_layer_init_one(struct
> > > drm_device *drm, {
> > >       enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
> > >       int channel =3D mixer->cfg->vi_num + index;
> > > +     unsigned int plane_cnt, blend_modes;
> > >       struct sun8i_ui_layer *layer;
> > > -     unsigned int plane_cnt;
> > >       int ret;
> > >
> > >       layer =3D devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
> > > @@ -362,6 +384,16 @@ struct sun8i_ui_layer=20
*sun8i_ui_layer_init_one(struct
> > > drm_device *drm, return ERR_PTR(ret);
> > >       }
> > >
> > > +     blend_modes =3D BIT(DRM_MODE_BLEND_PREMULTI) |
> > > +                   BIT(DRM_MODE_BLEND_COVERAGE) |
> > > +                   BIT(DRM_MODE_BLEND_PIXEL_NONE);
> > > +
> > > +     ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> > blend_modes);
> > > +     if (ret) {
> > > +             dev_err(drm->dev, "Couldn't add blend mode
> > property\n");
> > > +             return ERR_PTR(ret);
> > > +     }
> > > +
> > >       ret =3D drm_plane_create_zpos_property(&layer->plane, channel,
> > >                                            0, plane_cnt -
> > 1);
> > >       if (ret) {
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h index=20
43c48cf7bc51..bd3c30e8058d
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > > @@ -46,6 +46,11 @@
> > >  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER             =
=20
((1) << 1)
> > >  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED   ((2) <<=
 1)
> > >
> > > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK    GENMASK(17, 16)
> > > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COVERAGE        ((0) <<=
 16)
> > > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM        ((1) <<=
 16)
> > > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI        ((2) <<=
 16)
> > > +
> > >  struct sun8i_mixer;
> > >
> > >  struct sun8i_ui_layer {
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index=20
662ba1018cc4..6581fc7d9668
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > @@ -52,21 +52,38 @@ static void sun8i_vi_layer_enable(struct sun8i_mi=
xer
> > > *mixer, int channel, }
> > >
> > >  static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, i=
nt
> > > channel, -                                    int overlay, struct
> > drm_plane *plane)
> > > +                                     int overlay, struct
> > drm_plane *plane,
> > > +                                     unsigned int zpos,
> > bool force_premulti)
> > >  {
> > > -     u32 mask, val, ch_base;
> > > +     u32 mask, val, ch_base, bld_base;
> > > +     bool in_premulti =3D false, out_premulti =3D false;
> > >
> > >       ch_base =3D sun8i_channel_base(mixer, channel);
> > > +     bld_base =3D sun8i_blender_base(mixer);
> > >
> > >       if (mixer->cfg->is_de3) {
> > > +             in_premulti =3D plane->state->pixel_blend_mode =3D=3D
> > DRM_MODE_BLEND_PREMULTI;
> > > +             out_premulti =3D force_premulti || in_premulti;
> > > +
> > >               mask =3D SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
> > > -                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
> > > +                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK
> > |
> > > +                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK;
> > >               val =3D SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
> > >                       (plane->state->alpha >> 8);
> > >
> > > -             val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OP=
AQUE)
> > ?
> > > -
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > > -
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > > +             if (plane->state->pixel_blend_mode =3D=3D
> > DRM_MODE_BLEND_PIXEL_NONE) {
> > > +                     val |=3D
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER;
> > > +             } else {
> > > +                     val |=3D (plane->state->alpha =3D=3D
> > DRM_BLEND_ALPHA_OPAQUE) ?
> > > +
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > > +
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > > +
> > > +                     if (in_premulti)
> > > +                             val |=3D
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI;
> > > +             }
> > > +
> > > +             if (!in_premulti && out_premulti)
> > > +                     val |=3D
> > SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM;
> > >
> > >               regmap_update_bits(mixer->engine.regs,
> > >
> > SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > > @@ -79,6 +96,11 @@ static void sun8i_vi_layer_update_alpha(struct
> > > sun8i_mixer *mixer, int channel, SUN8I_MIXER_FCC_GLOBAL_ALPHA
> > >                                       (plane->state->alpha
> > >> 8));
> > >       }
> > > +
> > > +     regmap_update_bits(
> > > +             mixer->engine.regs,
> > SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> > > +             SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> > > +             out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) :
> > 0);
> >
> > Shouldn't be above block inside DE3 if block?
>=20
> No, we have to update the value to non-premulti in case it was set to
> premulti by another layer.
>=20
>=20
> Regards,
> Roman.
>=20
> >
> > Looks good otherwise.
> >
> > Best regards,
> > Jernej
> >
> > >  }
> > >
> > >  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int
> > > channel, @@ -408,7 +430,7 @@ static void
> > > sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > > sun8i_vi_layer_update_coord(mixer, layer->channel,
> > >                                   layer->overlay, plane, zpos);
> > >       sun8i_vi_layer_update_alpha(mixer, layer->channel,
> > > -                                 layer->overlay, plane);
> > > +                                 layer->overlay, plane, zpos,
> > false);
> > >       sun8i_vi_layer_update_formats(mixer, layer->channel,
> > >                                     layer->overlay, plane);
> > >       sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > @@ -563,6 +585,19 @@ struct sun8i_vi_layer=20
*sun8i_vi_layer_init_one(struct
> > > drm_device *drm, }
> > >       }
> > >
> > > +     if (mixer->cfg->is_de3) {
> > > +             unsigned int blend_modes =3D BIT(DRM_MODE_BLEND_PREMULT=
I)
> > |
> > > +
> > BIT(DRM_MODE_BLEND_COVERAGE) |
> > > +
> > BIT(DRM_MODE_BLEND_PIXEL_NONE);
> > > +
> > > +             ret =3D drm_plane_create_blend_mode_property(&layer-
> > >plane,
> > > +
> > blend_modes);
> > > +             if (ret) {
> > > +                     dev_err(drm->dev, "Couldn't add blend mode
> > property\n");
> > > +                     return ERR_PTR(ret);
> > > +             }
> > > +     }
> > > +
> > >       ret =3D drm_plane_create_zpos_property(&layer->plane, index,
> > >                                            0, plane_cnt -
> > 1);
> > >       if (ret) {
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h index=20
9939a4cc7a52..ccf91f09f1fe
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > > @@ -44,6 +44,11 @@
> > >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK   GENMASK(31, 24)
> > >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)     ((x) << 24)
> > >
> > > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK   GENMASK(17, 16)
> > > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COVERAGE       ((0) <<=
 16)
> > > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM       ((1) <<=
 16)
> > > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI       ((2) <<=
 16)
> > > +
> > >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL     ((0) <<
> > 1)
> > >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER     ((1) <<
> > 1)
> > >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED  ((2) <<=
 1)
> >
> >
> >
> >
>=20


