Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F5C0F45B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D69410E4F4;
	Mon, 27 Oct 2025 16:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QjBrNJgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059E10E4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:28:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8A7E6035A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84255C116D0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761582510;
 bh=fMenu6Yz1dq6zD+MZ2kntyQwfvO1AlHWbUVPFlNZHb4=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=QjBrNJgPN2J+PdfNRb2TaFKtGlxPdFKzV1VY+Dts/k/KuYsSt1pxbVIxS6mvghoBU
 VjSQp2AwmDyg1Q0x/AJ1NFnCfGx0VhOHdLlhh1O9f91Ehrou0siTZSQBsxgKwFQDKK
 xfYQSOCWpC0BztLlQzHyLgGd24JvL48Czecrk9C2AbSxDXzHxS7NGYojViZye8ckph
 Xs36GqhgYIhehHg4yIhZFSBiiUU6GPNYS9PUudCowjL/SOuytaHAb/+vh7ioHFFAuT
 8SvSKBGZyHZPiSCEC/SOOuKDPKINOz+7piqTaFBpdHECcFRP9WOUZ5WDa6MHJtRaS4
 Jk0TGk1RA9bTA==
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-378e622e9e3so42935561fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlXuRoSkJOJyPTJz0MFsRkAlR1zRI3ox5qWIYStD/NBtWDrL4uqZt5YkNOM0wSI41Utr5v8KFs+Nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS001GmjCq47xKLfBD7tAwF7mBJfPc4u3vdhRDGazGbfyoJevX
 7h5LuSykfxlPWrSbmyyAGA9bkyxQPZ2k6Zj3G2VxlPyYKWyz4+uWOPWYZYyf5z1fXfxkbT2wmWj
 eH3dA8NBWlqoJbx1RZ5xUd6J42VR9XDs=
X-Google-Smtp-Source: AGHT+IGr03Psc7IsDVuI7yBuiNpX7NgGOZZdYIYCrKCF0skdMpdkze/KFWqxct1dY9Bgybzo997IvN+845ppP7qCOgg=
X-Received: by 2002:a05:651c:1444:b0:372:221a:b124 with SMTP id
 38308e7fff4ca-37907b313edmr360691fa.0.1761582508856; Mon, 27 Oct 2025
 09:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-11-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-11-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:28:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v651SuBsN2SxsN3wRhVeNnzENkicbjQMVwOmB_9TQycTKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkWdarzFS1VL6yseX35ShJMc0dIOsuN3Cbpqr0YIgGq5nI4qQttqtOqeeU
Message-ID: <CAGb2v651SuBsN2SxsN3wRhVeNnzENkicbjQMVwOmB_9TQycTKQ@mail.gmail.com>
Subject: Re: [PATCH 10/30] drm/sun4i: mixer: Remove setting layer enable bit
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This task is now done by plane atomic update callback. There is no fear
> that bit would be set incorrectly, as all register reads are eliminated.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

You should probably mention the new path used to quickly disable a layer,
otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 24 ------------------------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 ++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 13 ++++++++++++-
>  3 files changed, 24 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index a3194b71dc6d..1fca05a760b8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -250,24 +250,6 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw=
_format)
>         return -EINVAL;
>  }
>
> -static void sun8i_layer_enable(struct sun8i_layer *layer, bool enable)
> -{
> -       u32 ch_base =3D sun8i_channel_base(layer->mixer, layer->channel);
> -       u32 val, reg, mask;
> -
> -       if (layer->type =3D=3D SUN8I_LAYER_TYPE_UI) {
> -               val =3D enable ? SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN : 0;
> -               mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> -               reg =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->ov=
erlay);
> -       } else {
> -               val =3D enable ? SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN : 0;
> -               mask =3D SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
> -               reg =3D SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->ov=
erlay);
> -       }
> -
> -       regmap_update_bits(layer->mixer->engine.regs, reg, mask, val);
> -}
> -
>  static void sun8i_mixer_commit(struct sunxi_engine *engine,
>                                struct drm_crtc *crtc,
>                                struct drm_atomic_state *state)
> @@ -304,12 +286,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *=
engine,
>                                  plane->base.id, layer->channel, layer->o=
verlay,
>                                  enable, zpos, x, y, w, h);
>
> -               /*
> -                * We always update the layer enable bit, because it can =
clear
> -                * spontaneously for unknown reasons.
> -                */
> -               sun8i_layer_enable(layer, enable);
> -
>                 if (!enable)
>                         continue;
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 8634d2ee613a..9d5d5e0b7e63 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -25,6 +25,15 @@
>  #include "sun8i_ui_scaler.h"
>  #include "sun8i_vi_scaler.h"
>
> +static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
> +                                  int channel, int overlay)
> +{
> +       u32 ch_base =3D sun8i_channel_base(mixer, channel);
> +
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0)=
;
> +}
> +
>  static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
>                                              int channel, int overlay,
>                                              struct drm_plane *plane)
> @@ -201,8 +210,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_=
plane *plane,
>         struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
> -       if (!new_state->crtc || !new_state->visible)
> +       if (!new_state->crtc || !new_state->visible) {
> +               sun8i_ui_layer_disable(mixer, layer->channel, layer->over=
lay);
>                 return;
> +       }
>
>         sun8i_ui_layer_update_attributes(mixer, layer->channel,
>                                          layer->overlay, plane);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index dcc4429368d6..727117658c6c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -18,6 +18,15 @@
>  #include "sun8i_vi_layer.h"
>  #include "sun8i_vi_scaler.h"
>
> +static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
> +                                  int channel, int overlay)
> +{
> +       u32 ch_base =3D sun8i_channel_base(mixer, channel);
> +
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0)=
;
> +}
> +
>  static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
>                                              int channel, int overlay,
>                                              struct drm_plane *plane)
> @@ -320,8 +329,10 @@ static void sun8i_vi_layer_atomic_update(struct drm_=
plane *plane,
>         struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
> -       if (!new_state->crtc || !new_state->visible)
> +       if (!new_state->crtc || !new_state->visible) {
> +               sun8i_vi_layer_disable(mixer, layer->channel, layer->over=
lay);
>                 return;
> +       }
>
>         sun8i_vi_layer_update_attributes(mixer, layer->channel,
>                                          layer->overlay, plane);
> --
> 2.51.0
>
>
