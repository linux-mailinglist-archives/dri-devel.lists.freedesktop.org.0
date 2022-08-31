Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F05A7379
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 03:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51C10E034;
	Wed, 31 Aug 2022 01:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069B10E034;
 Wed, 31 Aug 2022 01:44:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j14so7604684lfu.4;
 Tue, 30 Aug 2022 18:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=drG6RMH0zFREgohP7fUu6e8MBztAwMPOm+LE74724sA=;
 b=EFsFMp+canY/hKJink3xfIjzSIs5nK0ATMHsiNLvxO07lOyOzwsvad8rVyDd2wmSeg
 cWCjphxF3TSGFFDKqyBmATL/jehCiz7Ylb6ULQwm/mKEET2IUotRhOyHBInnuwebAx/W
 o98i4bzpAYKvvI2sU//Sa2wKHsHNlK0Ik4KVSfjlV5E7mJwynZVYZggwdjMG3KRyfVMo
 xPbIu9xAaQjWAcnqbsVBfJmmxCjJL8AJzz30l+qNOOOt1j+HNC9Xoq1+ko3At8FQwbwc
 GgYRNngTbp8HBenXcqfoYJexOO63aFwrEEDYhvuQd/DuP/2j454qxLb21o5XEYcIYyWs
 Dtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=drG6RMH0zFREgohP7fUu6e8MBztAwMPOm+LE74724sA=;
 b=a+9GKQ8x74vzchXjZqTcNUgtGaemIPuVs7S3SK/lrPtviFWj6C2cpBLfX3BImm9yA0
 /rc1j+C/M7DZMKwr+wLSV4zHkOYyz5Iz0k2oDbo9fZ/7E3nOHWn/LmqGVXQkLnHNuop7
 WIbedVKLV7nBu5ZsQIJNv9Y51+XVZNJEsHTDYdb4vVYiA1honmGvM2o1VrI9kMUP7Vhc
 s/ORtNOca6bnxWBx3iU5xouDkIwj7yraCwBbN0kY4NJLv/CYpQt8NZy7xtBXI7mzOl8I
 8JT4Xr+ercV6pa4dB+LJhzPb/j4WDcT4VxVro59U65R0hAlSjCAqZGxmYZwSy1rOZGhd
 0Ofw==
X-Gm-Message-State: ACgBeo3+AdI7rwyaPkU2Wbq2xgeuBuVfyMdceHVqlGdwrTTKiPBsj9wh
 7BV9l/bpFMGmshvddeMOZw0=
X-Google-Smtp-Source: AA6agR5Z8V/gUf3Mh2HitGw7sMfYSuNjRXxRlM0XOW/4Yz6ST42Ov+CXOy5ZF8ScFy9ud/OgRIMt7A==
X-Received: by 2002:ac2:4901:0:b0:494:88dc:7efc with SMTP id
 n1-20020ac24901000000b0049488dc7efcmr411746lfi.408.1661910295748; 
 Tue, 30 Aug 2022 18:44:55 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:d40b:b088:5bfe:3b81?
 ([2a02:a31a:a240:1700:d40b:b088:5bfe:3b81])
 by smtp.googlemail.com with ESMTPSA id
 g1-20020a0565123b8100b004948f583e6bsm42248lfv.138.2022.08.30.18.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 18:44:55 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
Date: Wed, 31 Aug 2022 03:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Wow. That's an enormous amount of effort put into this patch.

But I'm tempted to say that this is actually overengineered quite a bit :D
Considering that there's no way to access all these calculations from user
space, and I can't imagine anybody using anything else than those standard
480i/576i (and maybe 240p/288p) modes at 13.5 MHz any time soon... I'm not
sure if we actually need all this.

But anyway, I'm not the maintainer of this subsystem, so I'm not the one to
decide.

> +enum drm_mode_analog {
> +    DRM_MODE_ANALOG_NTSC,
> +    DRM_MODE_ANALOG_PAL,
> +};

Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes is common,
but strictly speaking a misnomer. Those are color encoding systems, and your
patchset fully supports lesser used, but standard encodings for those (e.g.
PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some more neutral
naming scheme. Some ideas:

- DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refresh rate)
- DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standard line
  count)
- DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding ITU System
  Letter Designations)

> +#define NTSC_HFP_DURATION_TYP_NS    1500
> +#define NTSC_HFP_DURATION_MIN_NS    1270
> +#define NTSC_HFP_DURATION_MAX_NS    2220

You've defined those min/typ/max ranges, but you're not using the "typ" field
for anything other than hslen. The actual "typical" value is thus always the
midpoint, which isn't necessarily the best choice.

In particular, for the standard 720px wide modes at 13.5 MHz, hsync_start
ends up being 735 for 480i and 734 for 576i, instead of 736 and 732 requested
by BT.601. That's all obviously within tolerances, but the image ends up
noticeably off-center (at least on modern TVs), especially in the 576i case.

> +    htotal = params->line_duration_ns * pixel_clock_hz / NSEC_PER_SEC;

You're multiplying an unsigned int and an unsigned long - both types are only
required to be 32 bit, so this is likely to overflow. You need to use a cast to
unsigned long long, and then call do_div() for 64-bit division.

This actually overflowed on me on my Pi running ARM32 kernel, resulting in
negative horizontal porch lengths, and drm_helper_probe_add_cmdline_mode()
taking over the mode generation (badly), and a horrible mess on screen.

> +    vfp = vfp_min + (porches_rem / 2);
> +    vbp = porches - vfp;

Relative position of the vertical sync within the VBI effectively moves the
image up and down. Adding that (porches_rem / 2) moves the image up off center
by that many pixels. I'd keep the VFP always at minimum to keep the image
centered.

Best regards,
Mateusz Kwiatkowski
