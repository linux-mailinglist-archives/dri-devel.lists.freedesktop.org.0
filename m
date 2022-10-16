Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017196002F8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9EC10E854;
	Sun, 16 Oct 2022 18:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437810E853;
 Sun, 16 Oct 2022 18:56:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d6so14464259lfs.10;
 Sun, 16 Oct 2022 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9R5DRkDar97t7RGa7ZkHbwXUyJ5tEv/b58zZkFRpKIU=;
 b=UqSCa35znTFAW2XjpbRvdh7DaqZHpIJN6v4AXacEElZvxQlvD6nM1NZ8Ag4JRpl3yk
 tQA8VjWsFBR1wJX/Ss+CPqCol92EEvV5Raj+pM0cSuC99zTk0doGl7wmBnhKuxgF1Ygk
 fg/0fyZAwvrTzcQj7VkncMJ+fonMoDA4arz05pgdToty0rBiXkoKPedTqvwmaoXAbTg+
 v3woOrrTfXBCGMASf2KyRUme4mDbwgrtVNogi54B0uEQTGHlblMTfWTbB8IpJkPkXm6d
 e3JS1uHEJHUVESdK67TNOFvIWA7dgP90CYwGzpBFC03lpCGGnnp4EI/sbS04iqDtsz+L
 ezsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9R5DRkDar97t7RGa7ZkHbwXUyJ5tEv/b58zZkFRpKIU=;
 b=6E80ZwsjpspaV7aQxvTFnTLQl4BfKQhSxkgdL1aKUhCq3RTkAJC/PY4PLTNSoFX/9F
 2ky12Y2fYnpavxxvp/7+bi64ApPv9DCdiSMtVlOtZYAd9e3u81GT7R0oBFVs3qrCX/1A
 IvVY11FwkDIx5VYOT0ZHT+xBnMeSOIjUpgx/Tk08cZV6A20bvbzudd9MqeC7DCTzeiFk
 Bk7Gyx9pprivsUBhfJCo81x7GhG+Zsx70FDUrhMOcK5wvhJ7slrUPBFYt2SaWtv4qHBa
 jDzxPqDiEzRbsW/3P79Cb+7AZB9kvFbs0FKCB8V1f9kRJFNoDk9DJp8C54qjjPLCoblS
 Ojdg==
X-Gm-Message-State: ACrzQf1oHbrAR4pAUUr98XDMYEANleVMFuMo+HnqM8CqvW1d+i4ZewM8
 AqUXbPjDkdVhkhkh3Jv7uU0=
X-Google-Smtp-Source: AMsMyM5uYxB/6xJ5gGhOv3WAH6+V6GDD4KbrqZFfIThsPvWDKXTV721fShUokapp2H2agrxIAik1vw==
X-Received: by 2002:ac2:46da:0:b0:4a2:2963:71b0 with SMTP id
 p26-20020ac246da000000b004a2296371b0mr2564386lfo.600.1665946584951; 
 Sun, 16 Oct 2022 11:56:24 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 p24-20020a2ea4d8000000b0026de7400f3bsm1237043ljm.5.2022.10.16.11.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 11:56:24 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0f2beec2-ae8e-5579-f0b6-a73d9dae1af4@gmail.com>
Date: Sun, 16 Oct 2022 20:56:22 +0200
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
 <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
Content-Language: pl
In-Reply-To: <c1949248-fb40-682c-492e-bafbd915cee3@gmail.com>
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

Urgh. I cannot send e-mails apparently today, as I removed the second half of
the previous message. Here goes:

> @@ -454,13 +563,6 @@ static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
>  					struct drm_connector_state *conn_state)
>  {
>  	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;

You could add here something like:

+	const struct vc4_vec_tv_mode *tv_mode =
+		vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+
+	if (!tv_mode)
+		return -EINVAL;

This should explicitly make it impossible to enter the equivalent condition in
vc4_vec_encoder_enable() that causes the problem mentioned in the previous
e-mail.

This is probably basically impossible already, but I triggered that when testing
a follow-up change I'd like to post shortly.

> -	const struct vc4_vec_tv_mode *vec_mode;
> -
> -	vec_mode = &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
> -
> -	if (conn_state->crtc &&
> -	    !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
> -		return -EINVAL;

If you're removing the reference mode, then I think you should at least add
checks that the crtc_clock is set to 13.5 MHz (it's otherwise ignored) and that
crtc_htotal is either 858 or 864 (using a switch over reference_mode->htotal as
I proposed in my comment to patch 19/22 would double as such check), as all
other values causes VEC to output garbage.

Best regards,
Mateusz Kwiatkowski

