Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4D621E89
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 22:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3CC10E2B8;
	Tue,  8 Nov 2022 21:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F10A10E2B8;
 Tue,  8 Nov 2022 21:27:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f37so22966378lfv.8;
 Tue, 08 Nov 2022 13:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nNGGMyCOLpmxcwimAd7d1JNDC8irulEDPwNmVkkpOGQ=;
 b=alX57a0KugSynuS+NdT7MG6vVfPLxJzuDOo8Ufz4tmYpEgZ1rfWCE8waSQWkiKk6oX
 jrUC9MI8qA1Zg3z9KeAXKZtyLGdhuBst7UVhEFmqEh6kQEBfrYfoAPOy/AL45vDpOMpE
 RNASkkvH08H+a1LAyz3uk9VuAS6j/WTDKbTHGVfUVo9GGM2Lm3LExqHo6hOeSrumikH1
 AEt6K1r+oQBgFG+2KtGmb2tHTKz6+ieMIoJUlt7d7aLU6HEh2g7lI3HzHBt0pwPQK393
 U+yRXD3m72+JE8SrVAQECe4ck979GKs9c4kfyDpiUrLZd6DMAeosTedx31YrUadkknUa
 M0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNGGMyCOLpmxcwimAd7d1JNDC8irulEDPwNmVkkpOGQ=;
 b=xetlhqJU7pwUVvK/L7Y3dOcUSyav7ERos8eJSneTPL5K7K9EI5T4XzfSfYluD64Dhh
 JMRT/Lkpwu8b5V+o6i5TtUl/vSYUVMj6neOkiRAaTC3I2gQluO5rMBA5AlY5P6ogvIf1
 bvj1INLPWeBJyQZ/h0+b6c2A8crJuPF4Mx0uIn2ExGQJ6YibEKsZi1BMcqNpNXa01O4c
 Co2f68KbmzrrX5ghn2CZ8kQ3GfvZL0ijCHvPkyjfUPMVP023/Ku5k6KMZ1YU/FFAvr3n
 nzD6JZxIu8Tc8hNE6I5lCxJZ+/8Q31vn1oMY1XYNOQbqmxtdmMRBE/UpttaGAOZsUmuR
 0GFw==
X-Gm-Message-State: ACrzQf10vjbX/giSlCbhgl5iAojxTLi+iHs6Vgg0LG1S5RSyKmxbP96T
 EU6Oip9wVB1UwUIDbVYC9X4=
X-Google-Smtp-Source: AMsMyM72gBxTU06I+Kv2ParcX2IpJ7JL9w+B/WRU3aweEN085ZxOUqTGeN3liwt9VlTcfIO7IOL1/g==
X-Received: by 2002:a05:6512:33d2:b0:4a2:a44b:a461 with SMTP id
 d18-20020a05651233d200b004a2a44ba461mr22661082lfg.551.1667942840154; 
 Tue, 08 Nov 2022 13:27:20 -0800 (PST)
Received: from ?IPV6:2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7?
 ([2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7])
 by smtp.googlemail.com with ESMTPSA id
 t9-20020a05651c204900b0026fc8855c20sm1877755ljo.19.2022.11.08.13.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:27:19 -0800 (PST)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <b6b7c689-a50f-cd63-7e48-8739b0d91e61@gmail.com>
Date: Tue, 8 Nov 2022 22:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v7 15/23] drm/modes: Introduce more named modes
Content-Language: pl
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-15-7072a478c6b3@cerno.tech>
 <262f0953-1e05-e68e-3e96-2ac2132a1e57@tronnes.org>
 <ba532387-6329-c57a-1fa2-627b2cf40281@tronnes.org>
In-Reply-To: <ba532387-6329-c57a-1fa2-627b2cf40281@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

W dniu 8.11.2022 o 10:38, Noralf Trønnes pisze:
>
> Den 07.11.2022 19.03, skrev Noralf Trønnes:
>>
>> Den 07.11.2022 15.16, skrev Maxime Ripard:
>>> Now that we can easily extend the named modes list, let's add a few more
>>> analog TV modes that were used in the wild, and some unit tests to make
>>> sure it works as intended.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>> ---
>>> Changes in v6:
>>> - Renamed the tests to follow DRM test naming convention
>>>
>>> Changes in v5:
>>> - Switched to KUNIT_ASSERT_NOT_NULL
>>> ---
>>>  drivers/gpu/drm/drm_modes.c                     |  2 +
>>>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
>>>  2 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>>> index 49441cabdd9d..17c5b6108103 100644
>>> --- a/drivers/gpu/drm/drm_modes.c
>>> +++ b/drivers/gpu/drm/drm_modes.c
>>> @@ -2272,7 +2272,9 @@ struct drm_named_mode {
>>>  
>>>  static const struct drm_named_mode drm_named_modes[] = {
>>>  	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
>>> +	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
>>>  	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
>>> +	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
>>>  };
>> I'm now having second thoughts about the tv_mode commandline option. Can
>> we just add all the variants to this table and drop the tv_mode option?
>> IMO this will be more user friendly and less confusing.
>>
> One downside of this is that it's not possible to force connector status
> when using named modes, but I think it would be better to have a force
> option than a tv_mode option. A lot of userspace treats unknown status
> as disconnected.
>
> Anyone know if it's possible to set the connector status sysfs file
> using a udev rule?
>
> Noralf.

I think that leaving named modes only would be a bit limiting. There are use
cases for custom modes, e.g. we might want progressive 240p "NTSC" (like 80s/90s
home computers and video game consoles) or the modes with non-13.5MHz pixel
clock that Geert requested with Amiga in mind.

I'm not sure if the current cmdline-to-drm_mode conversion is flexible enough
to meaningfully facilitate those, but we're at least getting the syntax down.

Best regards,
Mateusz Kwiatkowski

