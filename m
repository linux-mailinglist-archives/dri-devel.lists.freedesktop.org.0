Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92358595C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFDD10E907;
	Sat, 30 Jul 2022 09:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F05C10E907
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 09:12:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p5so8251331edi.12
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hll3ibUAqwWMG/OtKvhLlM3Hjch+TNh/bFfU6jv+6g4=;
 b=UIvlOiZjgq7+FWhOckuO00o7AIlyQZ2vDqbOSmqJnIrmhVs3J56EiTFct5I279Lkqf
 +eXwGIIecQdAbHOb+l2dJWwK/lr4IWvn2nDdgucESnOsZS3WLnG5r++kWrEXnIqL6t2b
 yElo8+B3x0fX7dLh4mMQabuoB0PE5PO1XMK0gYrC8qDyYujV8TAHQoCZmLn6j1f9azUc
 YzVJhvTOSMTX0zI6cAaIxHiY3BP2ybwCILXOVPqgwxt77MANU1iyXgpXCb3NvDHNJTTv
 yxUakWjvKPdk7KDgqdeB9DGPej6EBT8/T7FmJtCr7c9E7l+2NpQKxRwl65Ts+1XWrk52
 tsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hll3ibUAqwWMG/OtKvhLlM3Hjch+TNh/bFfU6jv+6g4=;
 b=22JK3ecIxQqs8cQ7cQWN9w6zoJ8yRNwVKFZpbLT4KsVX97+sr2Bnq0N+bTCCNGqFBg
 IMlZkEyjlhn57WBVX9yb5en7axIQMOBvlr/IGt9s59Li98h8P3R2p5Bjlrg1/W1GuAu1
 UN9+a0PleeGm1YIKfef3TkmQ+7SqzaX2I361TR5a4ARO+6oFd6vWUuulSlDnK61pGoQ/
 AAttwLaF18AokwfAftvKvXN9VHBfBkdVTN1VQbIWDf8jao5QDLjbkZ0OxOaqF3E57ztO
 osHqOgKHhK6tUOwXwgLKVFG2WajBjMNx8ZKrleZMxoe13PQsS/aln0CxrCQ6HXB8qm+M
 HuPw==
X-Gm-Message-State: AJIora/zWx8RFWZq4u8wMZss2JImRGaCqMYXaHg6EuggiUh9AHGsVrDg
 4E3bShH5yAK7HCOIYm0BL9g=
X-Google-Smtp-Source: AGRyM1s0xAfvYSqaUCZnsf6TarPfFgDLdgevrEr1is/O1hRHAi0uogjW59OUmgXy0aJbO16CWW7UwQ==
X-Received: by 2002:a05:6402:51d1:b0:43b:f89e:a751 with SMTP id
 r17-20020a05640251d100b0043bf89ea751mr6943326edd.391.1659172347045; 
 Sat, 30 Jul 2022 02:12:27 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net.
 [194.152.27.124]) by smtp.gmail.com with ESMTPSA id
 1-20020a170906200100b0072b40cb28a8sm2706263ejo.29.2022.07.30.02.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 02:12:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 26/35] drm/sun4i: tv: Convert to atomic hooks
Date: Sat, 30 Jul 2022 11:12:24 +0200
Message-ID: <2638619.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 29. julij 2022 ob 18:35:09 CEST je Maxime Ripard napisal(a):
> The VC4 VEC driver still uses legacy enable and disable hook

s/VC4 VEC/sun4i tv/

Best regards,
Jernej

> implementation. Let's convert to the atomic variants.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 53152d77c392..f7aad995ab5b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -339,7 +339,8 @@ static void sun4i_tv_mode_to_drm_mode(const struct
> tv_mode *tv_mode, mode->vtotal = mode->vsync_end  + tv_mode->vback_porch;
>  }
> 
> -static void sun4i_tv_disable(struct drm_encoder *encoder)
> +static void sun4i_tv_disable(struct drm_encoder *encoder,
> +			    struct drm_atomic_state *state)
>  {
>  	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
> @@ -353,7 +354,8 @@ static void sun4i_tv_disable(struct drm_encoder
> *encoder) sunxi_engine_disable_color_correction(crtc->engine);
>  }
> 
> -static void sun4i_tv_enable(struct drm_encoder *encoder)
> +static void sun4i_tv_enable(struct drm_encoder *encoder,
> +			    struct drm_atomic_state *state)
>  {
>  	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
> @@ -469,8 +471,8 @@ static void sun4i_tv_mode_set(struct drm_encoder
> *encoder, }
> 
>  static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
> -	.disable	= sun4i_tv_disable,
> -	.enable		= sun4i_tv_enable,
> +	.atomic_disable	= sun4i_tv_disable,
> +	.atomic_enable	= sun4i_tv_enable,
>  	.mode_set	= sun4i_tv_mode_set,
>  };




