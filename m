Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B0C0F26D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188FE10E4DB;
	Mon, 27 Oct 2025 16:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5013510E4E4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:04:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-58d29830058so5571514e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761581093; x=1762185893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBt+IECqNVtAsegMkIX7fm58vbKYt/6Urfpjeenw3Ow=;
 b=gKMi1qkiphOIsZifevCvwXsY8r4SdKBveimd4tdajEd/qodSRAldJD0KvOPlq4MKrI
 R3SEu34pNfeEemMlqNjvQe/erkfja+/mZRrliIQkp+HYngjtJ6O55fAQxkRDQqRsmtH+
 aHedp/LeQ4ouxOfpKlI+KwbA1eXusgGKVBrEsIwhdQgL3usEJHJXC390lzIwHMg56a0e
 G3h68xuH3mf7Z+zHcb32t40dB0BS3tHrtPAjldhHB/RFiFRiZgsk627GVqctj/h1iXSV
 QiOr7jcK+w7Vy4YaPr+lnlRx9rgzm6YDsm9I76gVcsi4XCWGDRsmSATHEUgW8vWa5CkQ
 FgzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUf2BilnLkgYsRiFCTwtwy12nhd8LBya4z080qY6g9eovebsC250MOYHBo0EH5rQTJof4zvLbBEvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMnRn4bxcQDy6YiYCzDVWYGEE4l67BlRaxl4S4hBKlndD+fpCU
 3nuIkUTmx2HtHyJIXKzlNFnc2mJ3q4SrP+eL3xqflXAybxlSzevtZqIPUCImXrD1c0Q=
X-Gm-Gg: ASbGncua81OQ8Xe5LvjKKxNmGwxDBWXF/3FqVpi17NiKeid8dPVOkzq4WchayKJalSP
 Nm1i5jMWL8eyfibI8qpuidi2wew5zqQAIpeEx9SZNEaWIq5F7U9ZATa9ENZCo2eHQHRv2P5YpKk
 2YObL7u/HUloBykpaBOXmU0+0kMxfJB1IbmskDnZXxzWs6AHsoP+4hF8umChlT3GyRPuoUI5yRc
 peydV1mOC6VAittQPaBuXkPciQqU3r7oaVot6KxDwAdOfNKKRcG+wpkOOTP12kxUnJGcUEUhYJK
 6MRxmOU7I9WibcpXK3bPNVcg/qDEuLL1qwZXzVK1bua6q6MJ0C9yCpHg+bHHlRrcEDSgnkG3VBP
 FQrDrPNKmeflA6hgGCszLONnIK+sJrB8gRL6fRfekg68dNcmrL7fW13m8ldo2qL1fPvaCPlv0dk
 0r2e8qZDQ7IPH0r6DClUymbNep1ozZOqJdWopctYJRTNY=
X-Google-Smtp-Source: AGHT+IGLOt6uee2vyfM/cYGz57A49CSih8EMJIdzTcxLcO8E5A767YJJeyyn+IOJWDBIr+R9c71TqA==
X-Received: by 2002:a05:6512:ad4:b0:592:f8c0:c917 with SMTP id
 2adb3069b0e04-5930e99bc0emr166993e87.10.1761581093004; 
 Mon, 27 Oct 2025 09:04:53 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f5f98esm2388817e87.57.2025.10.27.09.04.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-378cfbf83f2so53504311fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXw681Jz2NJUYFnmKsdqwuqCV01DS/Axu5zNNPsu+pxGPqO7nifof+Sy9ZWiZPlgwZeMu0OWI247ho=@lists.freedesktop.org
X-Received: by 2002:a05:651c:222c:b0:378:d499:d34d with SMTP id
 38308e7fff4ca-379076d8741mr539671fa.15.1761581092345; Mon, 27 Oct 2025
 09:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-9-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:04:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm99AcS6yMWuT9w2DAubuMwkVTQftsOHcXhHkfhxsBt-ffhIxUo7tu2w44
Message-ID: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It turns out that none of the UI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework UI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
>  1 file changed, 16 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 12c83c54f9bc..8634d2ee613a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -25,25 +25,27 @@
>  #include "sun8i_ui_scaler.h"
>  #include "sun8i_vi_scaler.h"
>
> -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int c=
hannel,
> -                                       int overlay, struct drm_plane *pl=
ane)
> +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> +                                            int channel, int overlay,
> +                                            struct drm_plane *plane)
>  {
> -       u32 mask, val, ch_base;
> +       struct drm_plane_state *state =3D plane->state;
> +       const struct drm_format_info *fmt;
> +       u32 val, ch_base, hw_fmt;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
> +       fmt =3D state->fb->format;
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
> -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> -
> -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha =
>> 8);
> -
> -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?

Changing "plane->state" to "state" made the diff somewhat harder to read.

>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
>                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
>
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          mask, val);
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), va=
l);
>  }
>
>  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int c=
hannel,
> @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i=
_mixer *mixer, int channel,
>         }
>  }
>
> -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int=
 channel,
> -                                         int overlay, struct drm_plane *=
plane)
> -{
> -       struct drm_plane_state *state =3D plane->state;
> -       const struct drm_format_info *fmt;
> -       u32 val, ch_base, hw_fmt;
> -
> -       ch_base =3D sun8i_channel_base(mixer, channel);
> -
> -       fmt =3D state->fb->format;
> -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -
> -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> -       regmap_update_bits(mixer->engine.regs,
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
> -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val=
);
> -}
> -
>  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int =
channel,
>                                          int overlay, struct drm_plane *p=
lane)
>  {
> @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm=
_plane *plane,
>         if (!new_state->crtc || !new_state->visible)
>                 return;
>
> +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> +                                        layer->overlay, plane);
>         sun8i_ui_layer_update_coord(mixer, layer->channel,
>                                     layer->overlay, plane);
> -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> -                                   layer->overlay, plane);
> -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> -                                     layer->overlay, plane);
>         sun8i_ui_layer_update_buffer(mixer, layer->channel,
>                                      layer->overlay, plane);
>  }
> --
> 2.51.0
>
>
