Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44585BEE0A7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 10:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626D510E1A4;
	Sun, 19 Oct 2025 08:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25B910E1A1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 08:25:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-57e03279bfeso3826112e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760862324; x=1761467124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VW3mkeflKClv9lw164K4YGIw8SIsux7V05xBSu2+GpY=;
 b=P+5e4qL1DmPLxcGqUrzdmCDJcvNacqN5r7ppA8Crnj2a2BgIkmDuF3CHvCuDdKRsoa
 jBY4eWINCpbUx5Ddyi1jsw0MsT2VeeDo/JmlE8Qo4gufu1TizPQPXNq5Jis3Bvo/4SDA
 ByH4h64hW2Gsx29UHuGRmgOf7loeyYzxHmYF/UijDQZP35j1Xru3o9JkZidUgeCX2e53
 YImj65pBpDbrYGIK6t5Vs1BBamLBeyblt/VhUBTOIjQ6wbaUURxPq5uJCvCusjrB+CFu
 aNmXJ6WVVutR2jm7qX0jIOhoi68GlmXNIRtq6EGS9SXDJznTUrMiqg9nQV8rz11d9Fpc
 wpOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDIDo59z5upDSqEWJ/zs2BYr7sw89E8ar4dWbfIibjyL39380iBKUDbbCCtMdKQadGgzip6z187SM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKfqx+CQiJZsjgMqyPcdd93OcXiqFt7dlKIlRis68E3XNh88Gl
 RcRr7N+RuHw8U6fJ09TeCUwv2aTThBSuQ+3HXkcAqy1F0XmoznwlfhGgpqXY9P5n
X-Gm-Gg: ASbGncu5ZzKDg8CHiNRAmoO33H3iDncGfCFyygUgqnjpJLE+izW+SlhRvxmhskDsB4B
 DP/3CYz64o5ALm/X/2f4U7jqqVxOpqrCl3PmV/N+kKjnTINCVFAZ1oSgxKqv6n93debt7Prs1e0
 dc7PjxkCO8XBNivH/KU2VfFsK/txIhEPE5otjF3QT/4rWxcfDdodVJPTEslg/UFxZsTmb9Xy4wJ
 WQcEmpqmkzn145gTDWxSCWgMnQOe4zumQMwYiQSYZJ72w6Wq1aoeWzxDYH2Gavo1A2kcxm+OHJm
 /w3f+aHJ3nNh/Jjb48cEg3bCdJbEuUxXL3D8KsW37M324EarZc5YPAdxQMINzFhOQzxRI4NhQI5
 P0PyPyh+1B/bX1ljMbAdTIDLcyjE0Pm9QJq1IsLtg0Eiyd0CHhtgH/f4/SJDQ0pDMZddvik9jNm
 cMSnfIM9lgV+S2xFOb/WNj3dD2DoZKju68
X-Google-Smtp-Source: AGHT+IF88HGULIlEt3D77q8q6bU/ehOcqVDpO97nQwJp7G7DWAfUNYt4J/PnMklDS9/NODuzr3CBPw==
X-Received: by 2002:a05:6512:118a:b0:591:d0fe:d4b7 with SMTP id
 2adb3069b0e04-591d83e5bb5mr3431867e87.13.1760862323461; 
 Sun, 19 Oct 2025 01:25:23 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec0c46sm1361249e87.44.2025.10.19.01.25.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 01:25:23 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-371e4858f74so40333611fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 01:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW20HW+p34bJ9mHI8/rVNpWsx3OAkbcWe1DMOcCe12Fb9OZaLE50j/vNYX+7zq8qerXxqG5YUVNQI0=@lists.freedesktop.org
X-Received: by 2002:a05:651c:25da:10b0:376:41f5:a6ca with SMTP id
 38308e7fff4ca-37781f4148fmr32251171fa.0.1760862322639; Sun, 19 Oct 2025
 01:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-6-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
X-Gm-Features: AS18NWC1T4rH1wgxWICMNRFWZoKmEq_TA059og5Su5dyIUywI4YDjh2R7R0IKKc
Message-ID: <CAGb2v66XAFkKaM8Gi=0fZknvrit0WmXA0G_kBYmye5APnhxOOQ@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/sun4i: vi_layer: Move check from update to
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
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_update callback.

Same comment as the previous patch.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index bd6c7915bbc4..c80bdece5ffc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -217,16 +217,11 @@ static int sun8i_vi_layer_update_formats(struct sun=
8i_mixer *mixer, int channel,
>         struct drm_plane_state *state =3D plane->state;
>         u32 val, ch_base, csc_mode, hw_fmt;
>         const struct drm_format_info *fmt;
> -       int ret;
>
>         ch_base =3D sun8i_channel_base(mixer, channel);
>
>         fmt =3D state->fb->format;
> -       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> -       if (ret) {
> -               DRM_DEBUG_DRIVER("Invalid format\n");
> -               return ret;
> -       }
> +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
>
>         val =3D hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
>         regmap_update_bits(mixer->engine.regs,
> @@ -322,7 +317,9 @@ static int sun8i_vi_layer_atomic_check(struct drm_pla=
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
> @@ -332,6 +329,13 @@ static int sun8i_vi_layer_atomic_check(struct drm_pl=
ane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       fmt =3D new_plane_state->fb->format;
> +       ret =3D sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +       if (ret) {
> +               DRM_DEBUG_DRIVER("Invalid plane format\n");
> +               return ret;
> +       }
> +
>         min_scale =3D DRM_PLANE_NO_SCALING;
>         max_scale =3D DRM_PLANE_NO_SCALING;
>
> --
> 2.51.0
>
>
