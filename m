Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6719D89FB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD97310E688;
	Mon, 25 Nov 2024 16:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49B10E688
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:11:00 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffc86948dcso7627181fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732551058; x=1733155858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f4agveOwge0PFPBakCbLt+oYuwIz3qhwiYZMG0RcOCo=;
 b=fl1Aqbr8O/hThLcWb7xeLbtC1nwb8yNuKY9cToQOUB1JPgWEeDmBbQIAr8Oj60g6l1
 HanM32i9QLkb+/aMiinB4ue+jmywUstGbOdPVt2qw8WMupROiMbVFs1SPvg+J/svX6t8
 PDeZBVM3dOV44Q4FrIy4sOqxZu36Y4KwKH4lZCQVggNwIwXaV20eeGTJiSxoTgXZFDPg
 tLp9GDbU/FHes6fbPSptTfudB6AQlZEDTOH15khj97jhOfCMjRbduBTRgmq1FkRdCKDb
 S40VleOuI6/cdzZM3uQWRqE5pETNmzW2ydzDt+nkiU1LLrv3U8omti+MQl2T/LjaElfq
 COFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpudirgjUajtDHb+E1KgpIW8IOOA5BlWm4pcK45tBeF2b45P+4gkC2/JcdEmIez+RCLtZBZCOazeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtd9iJcq79oIZ19sDwJG9g8jEVcmav1RYNXn7OYW4fnqPwZPK1
 0Gpq4AIQW4mOmCEvhIckiZ65DJHsnqtzWB5wS2BiVWRHypw39Xfed7xNfFN2
X-Gm-Gg: ASbGncsox1bSugmqypXA70R8VU39ko2YYNnESEkeazVXvbbL2Vt6Ye+TK/TDjPj+qts
 xmqrXVD4dkF+LffaXpqMZzWgj4aoX3xBmtw+/YtdHNz22xkuSN7WNSqVDz6wfY8X9w712uvJzDj
 dih7mH+mm6FkHIgK5rmUDOdRfe8ymkYyrOE96t+hbUyHBF6UuUvPLlImKYtiDEBiV1JIuFAvVee
 XAb17zqbfEjMcMkPEAygJVsKVJCvFiboji2SFE0I/b1cxPdA1E0g8q25pfIqa0BNRPsOvXBn5yw
 88z9oVM=
X-Google-Smtp-Source: AGHT+IFVXKRozjxkPDg83wgug66KLCcXun8dSGM14eaHqrL8kg146cS61msUPw0k7VZdD09guGHI1Q==
X-Received: by 2002:a05:651c:150e:b0:2ff:8f67:bc69 with SMTP id
 38308e7fff4ca-2ffa6d1c684mr68833471fa.0.1732551057079; 
 Mon, 25 Nov 2024 08:10:57 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffb156c169sm11364741fa.50.2024.11.25.08.10.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:10:56 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so48338921fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Bkr4gBfJBA/VAM/+ys/g5g7k1Qvjkf3eZMRfq/iCaS1ICdx3ObJ6K7CwX0SpsgRdJs7nOvf8Tr8=@lists.freedesktop.org
X-Received: by 2002:a2e:be8e:0:b0:2ff:c368:5765 with SMTP id
 38308e7fff4ca-2ffc3685815mr25260511fa.8.1732551055307; Mon, 25 Nov 2024
 08:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 26 Nov 2024 00:10:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/sun4i: use drm_mode_validate_mode() helper
 function
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
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

On Mon, Nov 25, 2024 at 9:50=E2=80=AFPM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> Use new helper function for HDMI mode validation

This is a bit misleading since this is actually the DPI or parallel
output encoder, not HDMI. HDMI is in drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
and drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c

ChenYu

> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_rgb.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/su=
n4i_rgb.c
> index dfb6acc42f02efc40f36914e2925510cd8056d0b..4f8100e32769cf31c25f5dd84=
9a18f5b77376090 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> @@ -51,14 +51,6 @@ static int sun4i_rgb_get_modes(struct drm_connector *c=
onnector)
>         return drm_panel_get_modes(rgb->panel, connector);
>  }
>
> -/*
> - * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> - * CVT spec reuses that tolerance in its examples, so it looks to be a
> - * good default tolerance for the EDID-based modes. Define it to 5 per
> - * mille to avoid floating point operations.
> - */
> -#define SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE 5
> -
>  static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crt=
c,
>                                                  const struct drm_display=
_mode *mode)
>  {
> @@ -67,8 +59,8 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct=
 drm_encoder *crtc,
>         u32 hsync =3D mode->hsync_end - mode->hsync_start;
>         u32 vsync =3D mode->vsync_end - mode->vsync_start;
>         unsigned long long rate =3D mode->clock * 1000;
> -       unsigned long long lowest, highest;
>         unsigned long long rounded_rate;
> +       int ret;
>
>         DRM_DEBUG_DRIVER("Validating modes...\n");
>
> @@ -122,15 +114,9 @@ static enum drm_mode_status sun4i_rgb_mode_valid(str=
uct drm_encoder *crtc,
>         tcon->dclk_max_div =3D 127;
>         rounded_rate =3D clk_round_rate(tcon->dclk, rate);
>
> -       lowest =3D rate * (1000 - SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE)=
;
> -       do_div(lowest, 1000);
> -       if (rounded_rate < lowest)
> -               return MODE_CLOCK_LOW;
> -
> -       highest =3D rate * (1000 + SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE=
);
> -       do_div(highest, 1000);
> -       if (rounded_rate > highest)
> -               return MODE_CLOCK_HIGH;
> +       ret =3D drm_mode_validate_mode(mode, rounded_rate);
> +       if (ret)
> +               return ret;
>
>  out:
>         DRM_DEBUG_DRIVER("Clock rate OK\n");
>
> --
> 2.46.2
>
>
