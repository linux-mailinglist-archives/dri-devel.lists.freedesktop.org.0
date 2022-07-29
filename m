Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F195858DC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 08:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395FE10E757;
	Sat, 30 Jul 2022 06:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114CB10E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 17:16:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id m9so5855996ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5tQz/NMPslChwSMnONrCdmO2dJnpmKkolnTnPw4eCOM=;
 b=fSDE7YVh9xbFTXNS5LZLQJheA3LRFlbSKRw0HJ3975j8T+YkBi3sUY5F44r6tJBPY4
 ibnp1PMNUq604gAh8Dd18ErP5mkljzVJd7R1o1kHrDRHMI5CFFv+ZsXg4mQ+EhM+uW8F
 kFsjJtGSEV4ForHBQnE5GCAHMjU8+iMLpKimKthWH29A3jBi4P6EQ9rV9w++4CdaNolE
 ssS0cY9s5N8tmcv0UQ3xlrlcOEbxgiPedVEIJHIAE4iEOpLLwUj83wPSFhLPrgMWtCwJ
 pZt4RqOCiK1/ncaLRZzoA3UEfzJdNi2xDOe/bzykpCAAav5k7WfoRcqkV5b1I6XdwD3M
 t+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5tQz/NMPslChwSMnONrCdmO2dJnpmKkolnTnPw4eCOM=;
 b=hwL6Hv6jvb5cKCKJ3KB4hbPui73NWlF7JBEe4GawLJ82sbEzRkZ2CxsQV90T/S2Zrq
 lmorXX7EWGg/Bb1hucKx3sKAOAgbynNi3xpENyDBuzpu9edlr7RMU5ZBfM/mhqmlWMO0
 0AwaTOv2wsyrddUwLfurHqpZi781gBRojRuzp+wLi+1W2q3r6CgtcuP9I59kxQqxJXLk
 9OJdqZfjwz277dhHSYwHNGW8YmRjbcMIn3w1yGevSdTwmqdvFIOjNbb1DGjyZMQ9jEfM
 y1FGQp9fJx/QP28kTLKdw8npkfnnqchsElkcL1xxO/iOnKmP4Dq4C2uthHfccicVAydK
 RHOw==
X-Gm-Message-State: AJIora/NF7ljigCmsCgxUMwxWIOChMpmjRwQTspvRf8ETI1HqZO6thRE
 MrM+i2nDV9tI1LaSFrhlFI8=
X-Google-Smtp-Source: AGRyM1udnGMHy9uVMFfvjher5OK+mYMcBbqbsG+Mld7ipyIFF7Ud6/dNHXBQ7phe91Mt/V4O5m1lhw==
X-Received: by 2002:a2e:6101:0:b0:25d:eb9d:4c79 with SMTP id
 v1-20020a2e6101000000b0025deb9d4c79mr1467737ljb.354.1659114996070; 
 Fri, 29 Jul 2022 10:16:36 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs377004.centertel.pl.
 [37.47.103.237]) by smtp.googlemail.com with ESMTPSA id
 a29-20020a19ca1d000000b0047f7b641951sm712762lfg.272.2022.07.29.10.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:16:35 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
Date: Fri, 29 Jul 2022 19:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 14/35] drm/atomic-helper: Add an analog TV atomic_check
 implementation
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Jul 2022 06:32:44 +0000
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I'm pretty sure that PAL-60 and SECAM-60 should be tied to the 480i 
mode. Those are non-standard "norms" that use 60 Hz sync (which is 
largely synonymous with 480i in the analog TV world) with PAL/SECAM 
color encoding.

Best regards,
Mateusz Kwiatkowski

W dniu 29.07.2022 o 18:34, Maxime Ripard pisze:
> The analog TV connector drivers share some atomic_check logic, and the new
> TV standard property have created a bunch of new constraints that needs to
> be shared across drivers too.
>
> Let's create an atomic_check helper for those use cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 6d14cb0c64b1..fce5569bd66a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -552,6 +552,93 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
>   }
>   EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>   
> +/**
> + * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
> + * @connector: DRM Connector
> + * @state: the DRM State object
> + *
> + * Checks the state object to see if the requested state is valid for an
> + * analog TV connector.
> + *
> + * Returns:
> + * Zero for success, a negative error code on error.
> + */
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> +					 struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *old_conn_state =
> +		drm_atomic_get_old_connector_state(state, connector);
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +	const struct drm_display_mode *mode;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +
> +	crtc = new_conn_state->crtc;
> +	if (!crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (!crtc_state)
> +		return -EINVAL;
> +
> +	switch (new_conn_state->tv.norm) {
> +	case DRM_MODE_TV_NORM_NTSC_443:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_NTSC_J:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_NTSC_M:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_M:
> +		mode = &drm_mode_480i;
> +		break;
> +
> +	case DRM_MODE_TV_NORM_PAL_60:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_B:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_D:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_G:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_H:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_I:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_N:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_PAL_NC:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_60:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_B:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_D:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_G:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_K:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_K1:
> +		fallthrough;
> +	case DRM_MODE_TV_NORM_SECAM_L:
> +		mode = &drm_mode_576i;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!drm_mode_equal(mode, &crtc_state->mode))
> +		return -EINVAL;
> +
> +	if (old_conn_state->tv.norm != new_conn_state->tv.norm)
> +		crtc_state->mode_changed = true;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
> +
>   /**
>    * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>    * @connector: connector object
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index c8fbce795ee7..b9740edb2658 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -26,6 +26,7 @@
>   
>   #include <linux/types.h>
>   
> +struct drm_atomic_state;
>   struct drm_bridge;
>   struct drm_bridge_state;
>   struct drm_crtc;
> @@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
>   					 struct drm_connector_state *conn_state);
>   void drm_atomic_helper_connector_reset(struct drm_connector *connector);
>   void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
> +int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
> +					 struct drm_atomic_state *state);
>   void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
>   void
>   __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,
>

