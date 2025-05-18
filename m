Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E151BABB0F4
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60AA10E08A;
	Sun, 18 May 2025 16:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509E10E08A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:50:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-549b116321aso4114536e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747587051; x=1748191851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FMCSgP1jqOSpYfOyIfGCKgapP8IcMXQbC49KZ7zqoq0=;
 b=nMx+ZW63GG0EFoUEjqkBYQXyUXjpcXsGaP+wEt57qaX98s9lvwcGoR61VYaZTnQl0Q
 vNAjBJEbfcn3cV6i4XdpHP2+n1T8121LyuCcFLdCwlD+qU5NlHLAQr5GZH/LVzkALYGs
 b25V6UDbk7cmpCFz4rUEkb7BlabIO97d/gzATqY6aclq1d0Gd+ZF5IhFLB41qLejIPb3
 dJtuYbMuOM8gFdXYnY6CKoGyhELC7662pwA6oooOG9CP7x2M5LIaFJDhZBx/rUOs0mxS
 vNnZ+OMKmSOrpgOsq4iaHByq+HfJtNDh6SOon7ZvdVd1P0VQOmdKGMVVIJSD/K7LNZ/9
 uo/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKso08eZjXlBvHJNDQUx2kad9fjPLsjYjOjt+YjVVxn9Sz5NLCJ3AYHEpB4cB5FKaBZnT+ztI/a6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/UR5ZZUPTCYCuOvG4ydGArnoi4FVp5ZL31vYsznjTdrt3ZoE+
 e2lypRrr9f25BIaL7NFNIPyJ6U4i68Ym/uBdZuOyWVxU9DRhVp+omB9Lblpn/4XcSrU=
X-Gm-Gg: ASbGncsSi26bg+Tr+2/4rdmV0TGWj3fvzE80wp/LdbvrUgcHrDbTQ+Ff/lt4S5OC9ht
 8kAeZF4xFi54Z2UVDIkcmkE5KAtDIIllvxuUgZt/VPCf3Od7/0OlTim+UTxH/IdXFguj3sucTO6
 USU4EReG/jrLIHWLQoRO5rmUnRHiFV6edUgccqT+8Cu5xxie2VtJiSHUl5zGK4J0uHdGV10Y+qG
 aZanVAuUVnJxVyqrbzwrmeYohhByqHn9Aw5yZVLKXRAU1T8O6Fx55iPc5AN7EO9F1sMsgA647sv
 9cZk82YPIBusB2OdSVxJyOffipWc7pHB1Xdr1HVd95lLLkp8ASjxl2jJofmZ+skNUqhQvhPXN2y
 xvAF9/rBphtXfJ2CIFf4=
X-Google-Smtp-Source: AGHT+IF3OpwQ1l+4KrqLLaeW2ePseWxY8fK95+2H5pk4gmtxej97QNBkXyv/aPF//470d9mcCtC+GQ==
X-Received: by 2002:ac2:4c48:0:b0:54f:c34f:1022 with SMTP id
 2adb3069b0e04-550e9900752mr2536092e87.35.1747587051033; 
 Sun, 18 May 2025 09:50:51 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f15dbbsm1485823e87.36.2025.05.18.09.50.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:50:50 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so40632851fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbepNqBgGbS2WOYtBNuK12lfJgKbdF1JDaraoaRP/kEnUi9gjfLV3GW1262vr9aMygcbACz6tOp8k=@lists.freedesktop.org
X-Received: by 2002:a2e:8a88:0:b0:328:685:7cc4 with SMTP id
 38308e7fff4ca-32809782356mr26567051fa.30.1747587050098; Sun, 18 May 2025
 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:50:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
X-Gm-Features: AX0GCFthsimZ1Vpr-P15pdmflifaZ2Czon48jDxa1m9hAkmxkrKyvTCzCS0vxW4
Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
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

Hi,

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
>
> Changelog v7..v8:
> - Add top/disp regmaps to mixer for DE33
> - Remove YUV-specific code
> - Remove use of global double buffer
> - Remove unneeded if/then parentheses and fix an alignment issue as sugge=
sted by checkpatch.pl
>
> Changelog v9..v10:
> - Use names from vendor BSP kernel for register blocks.
>
> Changelog v10..v11:
> - move before vi_scaler patch as vi_scaler code references new DE33 enum.
>
> Changelog v10..v11:
> - Convert de_type enum to uppercase
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 15 +++++-
>  2 files changed, 84 insertions(+), 13 deletions(-)
>

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index b75008d05fc9..870f9b9daf0d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -21,6 +21,9 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF               0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE                        0xc
>
> +#define SUN50I_MIXER_GLOBAL_SIZE               0x8
> +#define SUN50I_MIXER_GLOBAL_CLK                        0xc
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN           BIT(0)
>
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE                BIT(0)
> @@ -154,6 +157,7 @@ enum {
>  enum sun8i_mixer_type {
>         SUN8I_MIXER_DE2,
>         SUN8I_MIXER_DE3,
> +       SUN8I_MIXER_DE33,
>  };
>
>  /**
> @@ -178,6 +182,7 @@ struct sun8i_mixer_cfg {
>         unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
> +       unsigned int    map[6];

This needs a corresponding change to the kernel-doc immediately
before it, or the doc generation build will produce a warning.

You can keep the reviewed-by after fixing it.

ChenYu
