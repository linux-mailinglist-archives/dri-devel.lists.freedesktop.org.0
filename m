Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0653E187
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 10:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4DF10EE3E;
	Mon,  6 Jun 2022 08:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859010EE3E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 08:17:32 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id bi27so3794397qkb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 01:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0VB6ICitRovHxIYwUV+gm3Fi9aGF8p8zHqo2gL74d1Q=;
 b=IyECiN0NGcda9tsDvkw5eeqZYQb9MoyP7maNVPcuEEw5AUsSLv6qtEX+mTV23KbgjN
 PXFrqdSvj1XLDgHLw60qxDcv+sK0AQCIti3xcbsySH76dyEn/EDr9oZVyPNHrDw8COY0
 Np5Y1HZ+Y4t/9k2/zeJ48fa6hg41d62wU9KSMLb58RyiIhKDbAM6T9JlWdM1ODAlVVG6
 PZDsMui5wh9JspsfpkstCUtuRWOxT3hoCyt1eV1wBIX7c51aQheeCcCi49acNck+1khS
 Hzgfc7bQz3vaOzwHQVDPhPd1IJDawfcqSzzv08Zi82eE7zG1GoMhTFSJ958kM3Kn8ZWA
 cjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0VB6ICitRovHxIYwUV+gm3Fi9aGF8p8zHqo2gL74d1Q=;
 b=chvViCb8upzH3QfurCDg0OUpFdcUgR6O0KzUEE6UqhClb1Cfnp7YBbEZF5CUg0/WGr
 4OaF55mr8VIccEEni9kJwZxFKR3+SiHwLARYpXSOCGBoKhF8JujEuFKpSCB6K/quet8v
 /uUoUFd0rSGF/hjBxJWWTFR4uOzVebAbjVBI7UCrmEq4Dg2VKPMMITlJ8b8f/mw650mW
 qAHM8imPQ9EKLUzkYE5WncG6DNE+YxjCNeCwojns6yx3Tx3k/Mgy+reHE1CAiBrpqNbr
 uuPPl4p7iPZVcrzyONHFjy92K9kiNqewhZ1iG0g4hWSXFzJClCL2bK/SaqZGSipGwBEV
 TfJA==
X-Gm-Message-State: AOAM533EuhMeZD3caruL01/5GIu7NeAhJW0ow3oVvhMoxX3WXNDH6z+B
 UkQqIWxHZn85mBNS84cjKpX/TFsKunKq9EJ9G0w=
X-Google-Smtp-Source: ABdhPJwNXuLVvwNahmcnoYhvryCT5N0U9qupshmtSniU/vgKFF7ifk9ZOizThxKCi/9lppcxk7Ktq2EPEl7b8daj0eA=
X-Received: by 2002:a37:a1c4:0:b0:6a6:ac4f:1d3f with SMTP id
 k187-20020a37a1c4000000b006a6ac4f1d3fmr6633885qke.666.1654503451729; Mon, 06
 Jun 2022 01:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
 <4714286.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <4714286.GXAFRqVoOG@jernej-laptop>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 6 Jun 2022 11:17:20 +0300
Message-ID: <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode
 property
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
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jernej,

Thank you for having a look.

=D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:37, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko napisal=
(a):
> > Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> > "None", "Pre-multiplied", "Coverage"
> >
> > Add the blend mode property and route it to the appropriate registers.
> >
> > Note:
> > "force_premulti" parameter was added to handle multi-overlay channel
> > cases in future changes. It must be set to true for cases when more
> > than 1 overlay layer is used within a channel and at least one of the
> > overlay layers within a group uses premultiplied blending mode.
>
> Please remove this parameter. It's nothing special, so it can be easily a=
dded
> once it's actually needed. For now, it only complicates code.

I would prefer keeping it if you do not have any strong opinion against it.

I am working now on exposing all overlays, so it will be needed soon anyway=
.

Also it helps to better understand the COV2PREMULT mode which has not
the best description in the datasheet. Only after testing this
register using devmem I became confident on its purpose.

>
> >
> > Test:
> > Manually tested all the modes using kmsxx python wrapper with and
> > without 'force_premulti' flag enabled.
> >
> > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 ++
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 48 ++++++++++++++++++++-----
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 49 ++++++++++++++++++++++----
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  5 +++
> >  5 files changed, 94 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > b/drivers/gpu/drm/sun4i/sun8i_mixer.h index ebfc276b2464..5c05907e26fb
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -65,6 +65,8 @@
> >  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)  (0xf << ((n) << 2))
> >  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)        ((n) << 2)
> >
> > +#define SUN8I_MIXER_BLEND_PREMULTIPLY_EN(pipe)       BIT(pipe)
> > +
> >  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED  BIT(1)
> >
> >  #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)    BIT(ch)
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index 6ccbbca3176d..29c0d9cca1=
9a
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -58,24 +58,46 @@ static void sun8i_ui_layer_enable(struct sun8i_mixe=
r
> > *mixer, int channel, }
> >
> >  static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int
> > channel, -                                    int overlay, struct
> drm_plane *plane)
> > +                                     int overlay, struct
> drm_plane *plane,
> > +                                     unsigned int zpos,
> bool force_premulti)
> >  {
> > -     u32 mask, val, ch_base;
> > +     u32 mask, val, ch_base, bld_base;
> > +     bool in_premulti, out_premulti;
> >
> > +     bld_base =3D sun8i_blender_base(mixer);
> >       ch_base =3D sun8i_channel_base(mixer, channel);
> >
> > +     in_premulti =3D plane->state->pixel_blend_mode =3D=3D
> DRM_MODE_BLEND_PREMULTI;
> > +     out_premulti =3D force_premulti || in_premulti;
> > +
> >       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > +            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK |
> > +            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK;
> >
> >       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha =
>>
> 8);
> >
> > -     val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > -             SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +     if (plane->state->pixel_blend_mode =3D=3D DRM_MODE_BLEND_PIXEL_NO=
NE) {
> > +             val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER;
> > +     } else {
> > +             val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQ=
UE)
> ?
> > +
> SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > +
> SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +
> > +             if (in_premulti)
> > +                     val |=3D
> SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI;
> > +     }
> > +
> > +     if (!in_premulti && out_premulti)
> > +             val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM;
> >
> >       regmap_update_bits(mixer->engine.regs,
> >                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> overlay),
> >                          mask, val);
> > +
> > +     regmap_update_bits(
> > +             mixer->engine.regs,
> SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> > +             SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> > +             out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) :
> 0);
> >  }
> >
> >  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int
> > channel, @@ -274,7 +296,7 @@ static void
> > sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > sun8i_ui_layer_update_coord(mixer, layer->channel,
> >                                   layer->overlay, plane, zpos);
> >       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> > -                                 layer->overlay, plane);
> > +                                 layer->overlay, plane, zpos,
> false);
> >       sun8i_ui_layer_update_formats(mixer, layer->channel,
> >                                     layer->overlay, plane);
> >       sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > @@ -332,8 +354,8 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(stru=
ct
> > drm_device *drm, {
> >       enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
> >       int channel =3D mixer->cfg->vi_num + index;
> > +     unsigned int plane_cnt, blend_modes;
> >       struct sun8i_ui_layer *layer;
> > -     unsigned int plane_cnt;
> >       int ret;
> >
> >       layer =3D devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
> > @@ -362,6 +384,16 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(str=
uct
> > drm_device *drm, return ERR_PTR(ret);
> >       }
> >
> > +     blend_modes =3D BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                   BIT(DRM_MODE_BLEND_COVERAGE) |
> > +                   BIT(DRM_MODE_BLEND_PIXEL_NONE);
> > +
> > +     ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> blend_modes);
> > +     if (ret) {
> > +             dev_err(drm->dev, "Couldn't add blend mode
> property\n");
> > +             return ERR_PTR(ret);
> > +     }
> > +
> >       ret =3D drm_plane_create_zpos_property(&layer->plane, channel,
> >                                            0, plane_cnt -
> 1);
> >       if (ret) {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h index 43c48cf7bc51..bd3c30e805=
8d
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> > @@ -46,6 +46,11 @@
> >  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER              (=
(1) << 1)
> >  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED   ((2) << 1=
)
> >
> > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK    GENMASK(17, 16)
> > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COVERAGE        ((0) << 1=
6)
> > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREM        ((1) << 1=
6)
> > +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI        ((2) << 1=
6)
> > +
> >  struct sun8i_mixer;
> >
> >  struct sun8i_ui_layer {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index 662ba1018cc4..6581fc7d96=
68
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -52,21 +52,38 @@ static void sun8i_vi_layer_enable(struct sun8i_mixe=
r
> > *mixer, int channel, }
> >
> >  static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int
> > channel, -                                    int overlay, struct
> drm_plane *plane)
> > +                                     int overlay, struct
> drm_plane *plane,
> > +                                     unsigned int zpos,
> bool force_premulti)
> >  {
> > -     u32 mask, val, ch_base;
> > +     u32 mask, val, ch_base, bld_base;
> > +     bool in_premulti =3D false, out_premulti =3D false;
> >
> >       ch_base =3D sun8i_channel_base(mixer, channel);
> > +     bld_base =3D sun8i_blender_base(mixer);
> >
> >       if (mixer->cfg->is_de3) {
> > +             in_premulti =3D plane->state->pixel_blend_mode =3D=3D
> DRM_MODE_BLEND_PREMULTI;
> > +             out_premulti =3D force_premulti || in_premulti;
> > +
> >               mask =3D SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
> > -                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
> > +                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK
> |
> > +                    SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK;
> >               val =3D SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
> >                       (plane->state->alpha >> 8);
> >
> > -             val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQ=
UE)
> ?
> > -
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > -
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +             if (plane->state->pixel_blend_mode =3D=3D
> DRM_MODE_BLEND_PIXEL_NONE) {
> > +                     val |=3D
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER;
> > +             } else {
> > +                     val |=3D (plane->state->alpha =3D=3D
> DRM_BLEND_ALPHA_OPAQUE) ?
> > +
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> > +
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +
> > +                     if (in_premulti)
> > +                             val |=3D
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI;
> > +             }
> > +
> > +             if (!in_premulti && out_premulti)
> > +                     val |=3D
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM;
> >
> >               regmap_update_bits(mixer->engine.regs,
> >
> SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > @@ -79,6 +96,11 @@ static void sun8i_vi_layer_update_alpha(struct
> > sun8i_mixer *mixer, int channel, SUN8I_MIXER_FCC_GLOBAL_ALPHA
> >                                       (plane->state->alpha
> >> 8));
> >       }
> > +
> > +     regmap_update_bits(
> > +             mixer->engine.regs,
> SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> > +             SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> > +             out_premulti ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) :
> 0);
>
> Shouldn't be above block inside DE3 if block?

No, we have to update the value to non-premulti in case it was set to
premulti by another layer.


Regards,
Roman.

>
> Looks good otherwise.
>
> Best regards,
> Jernej
>
> >  }
> >
> >  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int
> > channel, @@ -408,7 +430,7 @@ static void
> > sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > sun8i_vi_layer_update_coord(mixer, layer->channel,
> >                                   layer->overlay, plane, zpos);
> >       sun8i_vi_layer_update_alpha(mixer, layer->channel,
> > -                                 layer->overlay, plane);
> > +                                 layer->overlay, plane, zpos,
> false);
> >       sun8i_vi_layer_update_formats(mixer, layer->channel,
> >                                     layer->overlay, plane);
> >       sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > @@ -563,6 +585,19 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(str=
uct
> > drm_device *drm, }
> >       }
> >
> > +     if (mixer->cfg->is_de3) {
> > +             unsigned int blend_modes =3D BIT(DRM_MODE_BLEND_PREMULTI)
> |
> > +
> BIT(DRM_MODE_BLEND_COVERAGE) |
> > +
> BIT(DRM_MODE_BLEND_PIXEL_NONE);
> > +
> > +             ret =3D drm_plane_create_blend_mode_property(&layer-
> >plane,
> > +
> blend_modes);
> > +             if (ret) {
> > +                     dev_err(drm->dev, "Couldn't add blend mode
> property\n");
> > +                     return ERR_PTR(ret);
> > +             }
> > +     }
> > +
> >       ret =3D drm_plane_create_zpos_property(&layer->plane, index,
> >                                            0, plane_cnt -
> 1);
> >       if (ret) {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h index 9939a4cc7a52..ccf91f09f1=
fe
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> > @@ -44,6 +44,11 @@
> >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK   GENMASK(31, 24)
> >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)     ((x) << 24)
> >
> > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK   GENMASK(17, 16)
> > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COVERAGE       ((0) << 1=
6)
> > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREM       ((1) << 1=
6)
> > +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI       ((2) << 1=
6)
> > +
> >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL     ((0) <<
> 1)
> >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER     ((1) <<
> 1)
> >  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED  ((2) << 1=
)
>
>
>
>
