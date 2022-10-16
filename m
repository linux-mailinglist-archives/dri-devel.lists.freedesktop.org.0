Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A66002F4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC0C10E859;
	Sun, 16 Oct 2022 18:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9510E853;
 Sun, 16 Oct 2022 18:52:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x18so11657306ljm.1;
 Sun, 16 Oct 2022 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L86zD4BE93sh72AeYReVIs01pAGXwZm6n1nhGapyqcU=;
 b=jkI8DFEtgd0iCPaVQhi7Teq9cyV9bjBA6KsEnb7GUTna6b0BCJ/q3e9KvJTJf+/pgH
 bOyBG8HxOgeA28keCz7WDK6bQaw7GOkXH38myfIhMm2tpSxgrZdyI6XUM9ar6yQrC5Ms
 sCyq/IboT6MblZ6+kbcRoePAU15ZfWyjW9NaE7+PyxSjlHZmcd0O57VpL4B6zvy9BJQ4
 yDvNX8fmFfeQ+q4Z+cyH8RJrVTMfh4jdZXQoTrGFsps4dRmokcopF3y1cpyx6H1ooDEE
 2UdfpED3Y926o9lCJrnqalYZX9xpISArgJbvfGj4LmoZspT7d+8owSUqeiZ4q0h0HBmW
 Cgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L86zD4BE93sh72AeYReVIs01pAGXwZm6n1nhGapyqcU=;
 b=yPLTOXfw/MpBx3raMn0xNtLxWUd5/w5hwR9j0wvB+ECW9FoARKbVKhSyThtze7kRQb
 HxHS4qmWqlzY2+8Klfk7whsAHOC8z8yCh8XQX1cPCxbttlTnsc3HplWvmw81zeUMmF6s
 iXf+XEC+pF9IXFSPyjFmEfGNsKoGy9v+uaDoqZ/UK/V/9zsLmcKr/1HgT0vpiAILBSRr
 ePegdbhBpkUu/+YORngCSm41uvklK4G2p7ktyos2taBkpRpzSD41bG6RojZX17D4WVgw
 25do+IsNlPU2XGzat0HmvcjEKCAb6i07OfwhpI5N/iYn/ubFkufyKp0NQM4JOMinOmbf
 LKtA==
X-Gm-Message-State: ACrzQf2qlA8GxOzfsTJR0n2thb9sIib5XOWx7tVmI3LaOZ13ahVRiw/i
 97C/AAinP0homiaPa9UeW1g=
X-Google-Smtp-Source: AMsMyM7Jz5dVg4MMw9epFOAljLEqm7fvWmI8tG8aPvCSkAkxqmjN6SH6pvd/9hhDRCoi+A0Wf3pFPw==
X-Received: by 2002:a2e:2e05:0:b0:26f:c234:3335 with SMTP id
 u5-20020a2e2e05000000b0026fc2343335mr2768156lju.76.1665946349247; 
 Sun, 16 Oct 2022 11:52:29 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 q8-20020a056512210800b0049d3614463dsm1143112lfr.77.2022.10.16.11.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 11:52:28 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
Date: Sun, 16 Oct 2022 20:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 20/22] drm/vc4: vec: Convert to the new TV mode property
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
Content-Language: pl
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-20-d841cc64fe4b@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct drm_connector_state *state = connector->state;
>  	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev,
> -				  vc4_vec_tv_modes[state->tv.legacy_mode].mode);
> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
>  	if (!mode) {
>  		DRM_ERROR("Failed to create a new display mode\n");
>  		return -ENOMEM;
>  	}
>  
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
>  	drm_mode_probed_add(connector, mode);
>  
> -	return 1;
> +	mode = drm_mode_analog_pal_576i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 2;
> +}

Referencing those previous discussions:
- https://lore.kernel.org/dri-devel/0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org/
- https://lore.kernel.org/dri-devel/c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com/

Unconditionally setting the 480i mode as DRM_MODE_TYPE_PREFERRED causes Xorg
(at least on current Raspberry Pi OS) to display garbage when
video=Composite1:PAL is specified on the command line, so I'm afraid this won't
do.

As I see it, there are three viable solutions for this issue:

a) Somehow query the video= command line option from this function, and set
   DRM_MODE_TYPE_PREFERRED appropriately. This would break the abstraction
   provided by global DRM code, but should work fine.

b) Modify drm_helper_probe_add_cmdline_mode() so that it sets
   DRM_MODE_TYPE_PREFERRED in addition to DRM_MODE_TYPE_USERDEF. This seems
   pretty robust, but affects the entire DRM subsystem, which may break
   userspace in different ways.

   - Maybe this could be mitigated by adding some additional conditions, e.g.
     setting the PREFERRED flag only if no modes are already flagged as such
     and/or only if the cmdline mode is a named one (~= analog TV mode)

c) Forcing userspace (Xorg / Raspberry Pi OS) to get fixed and honor the USERDEF
   flag.

Either way, hardcoding 480i as PREFERRED does not seem right.

Note: this also applies to the sun4i version (patch 22/22).

> @@ -366,13 +472,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>  	struct drm_connector *connector = &vec->connector;
>  	struct drm_connector_state *conn_state =
>  		drm_atomic_get_new_connector_state(state, connector);
> -	const struct vc4_vec_tv_mode *tv_mode =
> -		&vc4_vec_tv_modes[conn_state->tv.legacy_mode];
> +	const struct vc4_vec_tv_mode *tv_mode;
>  	int idx, ret;
>  
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> +	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> +	if (!tv_mode)
> +		goto err_dev_exit;
> +
>  	ret = pm_runtime_get_sync(&vec->pdev->dev);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to retain power domain: %d\n", ret);

If this (!tv_mode) condition is somehow triggered, the power management goes
somewhat crazy. vc4_vec_encoder_enable() cannot return an error, so when
vc4_vec_encoder_disable() is eventually called after a failed enable, it hangs
in pm_runtime_put() for quite a bit.

At least I think that's what's happening. Anyway, to solve this, I'd propose
this thing below:

Best regards,
Mateusz Kwiatkowski

