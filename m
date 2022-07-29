Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861985858DD
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 08:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8210F5F2;
	Sat, 30 Jul 2022 06:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77BA10E146
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 18:12:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bq11so3346516lfb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
 b=nKEbCpTn4ES338fo/oL+ZxbpzekkKK2V0nZCrR8D9coR5pJNycc5h9KHT3bd8XeneQ
 vPSuxtMcHwyAfCbOMCvpReAOZt0imu43u+fzDy1KqhXerbTrgMa2PFQ/1EM3YFWwnm20
 n+Pay0YAcn5etX+RhQMrfN2166BiRYs1f6LlxnUIgqQA17G+U4KzPhZlOZpPSwW9yDJc
 VqmOVvoVheAn8/IAIy+SueUv7yI1jmne/GlQE11VSytvv8R0SJvtANTgFeVKRxqOoG8P
 pbs6XpbiFip7/U/Ms8xoVcdMPVTz11kQDSLw9cyGEAoUlwClryZRDsAT/7eUJXB0Enty
 p/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=YRtWVtjASRhasg4zc8teXz0/znN+y1S+ZkqIbY7XKTA=;
 b=tTk/rg1mgVebk93FpUttoo036WyzATbBfMMr2DrU2GRpaTzdUqKZmx4VQ0mb4+W992
 kLZ86CRMe8vqgznAj564Nlrj8gxJfHG2ucB3SJ3Oqac9bwjA8W9Sshn3vQXcfhkwCVFd
 pTNXromxVyZIuhMFfbDbA745m3DWZp4hhpUH7pfrpAw/QxcGfr/PMwwoiiwPe6/Iz6uw
 k8ItDr0ylHqE1NrDS+2JBOVk1uQfpAKWmJy9OgQZPQw9yred2qqBIl9LNryOq6hRVfVe
 IsNVoTmEnH1o2JUxKN0paqwliWNdNWRGXIrjyyrmk5bSEZeEvvZLutQ8DoVwEoU3jYI2
 wAUg==
X-Gm-Message-State: AJIora8v2qoMF3TOSmSk4TSc+0YckobdLOohFhN2a6RSANjZgJt6lp4a
 sQwHVQX6tiduQAihFFHnb/Q=
X-Google-Smtp-Source: AGRyM1tGTdtn7I/aNBel79an2DZRtTumSuY2b+SFhmNnAAQda14q5JmpFf7rHUQ5FfW3XCUPU7bjZw==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id
 bq33-20020a056512152100b0048a3c5d5d17mr1600643lfb.587.1659118331035; 
 Fri, 29 Jul 2022 11:12:11 -0700 (PDT)
Received: from [192.168.177.6] (public-gprs370360.centertel.pl. [37.47.77.249])
 by smtp.googlemail.com with ESMTPSA id
 p3-20020a2e7403000000b0025e0b9ea91csm731173ljc.84.2022.07.29.11.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 11:12:10 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <0e285cf5-6ef2-3484-9fb7-5eb55c0ca269@gmail.com>
Date: Fri, 29 Jul 2022 20:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
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
 <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
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

I'm just noting that the modelines you defined in drm_modes.c are 
different to the ones you're removing here.

The horizontal sync differences probably doesn't matter too much, VC4 
uses those only as a hint anyway and generates sync autonomously, so the 
slight differences will only cause the image to slightly shift horizontally.

But you're also changing the 480i vertical sync (vsync_start is now 488 
instead of 487, etc.). Are you sure that this won't break anything? This 
will probably shift the image by 1 line (which for the 480i might 
actually mean going out of spec), and I _think_ it might control the odd 
vs. even field first modes on some drivers. I won't be able to test this 
before Monday, but I'm just pointing out the potential issue.

BTW, I've seen a similar thing in the sun4i driver changes (patch 32/35) 
and the differences in vertical sync are even more dramatic. It's 
entirely possible that the current timings in sun4i are broken and the 
new ones are correct (the new ones certainly look saner to me), but I'd 
double-check if that driver does not have any quirks that would 
_require_ such weird settings.

Best regards,
Mateusz Kwiatkowski

W dniu 29.07.2022 o 18:35, Maxime Ripard pisze:
> Now that the core has a definition for the 525 and 625 lines analog TV
> modes, let's switch to it for vc4.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 8f30a530b2d5..255bba563fce 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -224,38 +224,24 @@ static const struct debugfs_reg32 vec_regs[] = {
>   	VC4_REG32(VEC_DAC_MISC),
>   };
>   
> -static const struct drm_display_mode ntsc_mode = {
> -	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
> -		 480, 480 + 7, 480 + 7 + 6, 525, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
> -static const struct drm_display_mode pal_mode = {
> -	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
> -		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
> -		 576, 576 + 4, 576 + 4 + 6, 625, 0,
> -		 DRM_MODE_FLAG_INTERLACE)
> -};
> -
>   static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>   	[VC4_VEC_TV_MODE_NTSC] = {
> -		.mode = &ntsc_mode,
> +		.mode = &drm_mode_480i,
>   		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_NTSC_J] = {
> -		.mode = &ntsc_mode,
> +		.mode = &drm_mode_480i,
>   		.config0 = VEC_CONFIG0_NTSC_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_PAL] = {
> -		.mode = &pal_mode,
> +		.mode = &drm_mode_576i,
>   		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
>   	},
>   	[VC4_VEC_TV_MODE_PAL_M] = {
> -		.mode = &pal_mode,
> +		.mode = &drm_mode_576i,
>   		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>   		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>   		.custom_freq = 0x223b61d1,
>

