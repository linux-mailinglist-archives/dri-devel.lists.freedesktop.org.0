Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863CBEE0A1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 10:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9C510E057;
	Sun, 19 Oct 2025 08:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F3610E057
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 08:24:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-57d8ff3944dso3902418e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760862269; x=1761467069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FMwNP3my/AAtkqEoi875nhGGuoIYGuPvqPRBJ3G+A9w=;
 b=jTVaByoZPLZ/53o/WI09gRnn1QzstRyD9GAm6wRc3Cuj2i8tIRI7PFzBIYNsQb4Rg9
 PkyWgMMYa2x8cH6vVm76Iyb9MCwnX75/Gr5G15FTiC96yOF3nPFLYTsxK+7vWIFfz/1W
 nrgA6bJocrtx+wYUJwbJN6Q3kwA39nM8gdda6xvmYegfdSCQGH/c9nkBJbmHxcDe1cL4
 txylzyzzSGWDX2p4z1zOPLXgX8s6EWax1rIMci6tI9NLBdZwJpzRvrASTrKJaWfG25U4
 cuHLzhhhdv/MU5AieSAScNATmPVQmmYYW0Yi1MvEB5dso04r5aNhiTboI6c+83b6nh1X
 zUDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7EWMJTesyADBqsztj7i1oR5iAfW2F+sV1E/WNRas9Sbwf6qwqThU50fnMAu2OeLbMuraNqBaYFFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT7FH2qenYmmrI2d0n2W+X2P17NnJYUS+A1Oe23muq7sP851UE
 qTEC2jnEi7F7VtPliGeIbnzi9p1dFB7ZZRA+xV7mv23xNSoFn44ByXABIJd1ACD5
X-Gm-Gg: ASbGncsHbSyHDewlpDDHqDHgOcqkqh0HsnL0n1q0ix9C6LWneWMNt3+pL84hEQ2ZBwZ
 NJSZA3PWulnFQs5TNzA10HxMbF+F36MgR1y1u19QVSHAeXt62fRVeB/vlY/tTd5eYB1g8nVnyiH
 urhAq1WDeuz+kWHFAm55g5SE4EAt1AO64trJYQJSIP41DILYAy8k06gWNCpoFpIA093D/4zvGch
 Kru/gG/vZ55MTsDN80RZ5DQH/+gIaXo9S2BBRpptfEH0mBe1iA2+/mC/TeIr6P9SFnpdx6GX3Fv
 sbuTunA3BqFDmWKTzmAFFWnzjtRK+pPXcG3Q7Shgkrgb57Z5d4W9Mjmm3w55bPaN3CelHGgKh7K
 nTx7quU8ubtK2OGMN6Z+rZp78s5EtTk8RHoCzzvo1nLhsKJQebmDJv6+DQpktN4ErNCZVu7CqUY
 Kef473r0SeQEr+txxirzNdoOXovqcJ0TuS
X-Google-Smtp-Source: AGHT+IEhMFA17/W+Y7D6BWTYFEkg6iDwmjMe8coenUMZ/WTkyBLxAJpZB1qe7qDEGjCiULU/M10Skg==
X-Received: by 2002:a05:6512:3d89:b0:585:1ca7:1b69 with SMTP id
 2adb3069b0e04-591d84f9601mr3161123e87.13.1760862269150; 
 Sun, 19 Oct 2025 01:24:29 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def1b37dsm1375580e87.87.2025.10.19.01.24.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-36a6a3974fdso35108891fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHdf1aqlA91bf7TW3BRv7cS3BgYIkOM+F4YhG8g0tKObyxGGMfr59RXmN5TcDnSOUl/zqgRxXXD2c=@lists.freedesktop.org
X-Received: by 2002:a2e:bd86:0:b0:36b:f63:2785 with SMTP id
 38308e7fff4ca-37797a09b5emr26596581fa.27.1760862268372; Sun, 19 Oct 2025
 01:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-5-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-5-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:24:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
X-Gm-Features: AS18NWD0jnxz1Ue42cbwTGa97ilz_J4ZeWnbXU3EI3BU7YNx8yeEWNSRMp4bPA8
Message-ID: <CAGb2v64_HXub5SZn8U2=Smi_XheyK5-k-ycwR19wmboEvub3Rg@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/sun4i: ui_layer: Move check from update to
 check callback
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
> DRM requires that all checks are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

                                  ^ atomic_check?

Otherwise the commit message seems self-contradictory.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 9b786e5c7f3c..fce7b265c5d8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -134,16 +134,11 @@ static int sun8i_ui_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         const struct drm_format_info *fmt;
>         u32 val, ch_base, hw_fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret || fmt->is_yuv) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return -EINVAL;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -201,7 +196,9 @@ static int sun8i_ui_layer_atomic_check(struct drm_pla=
ne *plane,
>         struct sun8i_layer *layer =3D plane_to_sun8i_layer(plane);
>         struct drm_crtc *crtc =3D new_plane_state->crtc;
>         struct drm_crtc_state *crtc_state;
> -       int min_scale, max_scale;
> +       const struct drm_format_info *fmt;
> +       int min_scale, max_scale, ret;
> +       u32 hw_fmt;
>
>         if (!crtc)
>                 return 0;
> @@ -211,6 +208,13 @@ static int sun8i_ui_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret || fmt->is_yuv) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return -EINVAL;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>
