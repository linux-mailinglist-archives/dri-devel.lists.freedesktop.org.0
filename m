Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C15AA1DA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 00:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44DD10E348;
	Thu,  1 Sep 2022 22:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDD610E33B;
 Thu,  1 Sep 2022 22:00:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bt10so724051lfb.1;
 Thu, 01 Sep 2022 15:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=9ZOA/uLVkdbadD8sl+x2FgrUVnWNaT54IH6CMV7M0qU=;
 b=LHm7XQKmoioehKLe+x8wv4sg51dxY3iK7GBIf0ie+fcfdWHmpj8uhKVo1qfStRYUDt
 hYYwKyXLa6F8Vss8qsGXnhsSbaWjrIFZiJWH0w+6WT1drr8SW/5N5uWQUY13CtCu8RT7
 XFGF/pp/ZAdp6alq7wI37+qWMkMsD15jW9A1A3zaqPv8x1Ugm06xru39RntLJn/t21Zd
 Io+z1YLdKsVMwCmBwJgUdIXcFGDcNDdzsiH8DINgDlhluHlE98GV0dVvSpde0N5jFpG/
 4M6RwAzfFXYpV1BXP/VnjdTCqnFT6/utQ9dJtdN/u84FrH7SItMET/4Tm6x8CjaYhOPO
 0DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=9ZOA/uLVkdbadD8sl+x2FgrUVnWNaT54IH6CMV7M0qU=;
 b=gGQkfy3UtYK3mMTYfQWTCfVx/9Ze79mtVuNrVg+SoLNrcMtv/qC+b8FnzACzQWXN7/
 dYn/jSOEjEhtJKRACSgXtD4gJmDPRweYdOoF04dE16pZo9oNKjTPN+h6u+OK200/lqcX
 bYhkmhtDZVrj13FbTyKF5ZXWHu25uSLN0evBGsITjvAoXZMdI9hICrFj7hTzHARIdfQh
 BWwV+g+mjBXG12WKto286WtTk9tN8vCCvmvlHaY0PJNf9g6VmPVWAPwu75KJiKyOyUxV
 bEoWOcboL7fxkpEQ9mFTDh3gkg+SVBYtZBnr/r7dzHlYuC0+yNhFGQPE4ef6OE5Gg1TU
 iC1A==
X-Gm-Message-State: ACgBeo0jx+LmuBto2+1P/FjTOn/FoQa3M4YNG6cGBEPtpgj2lUfssZJd
 Wyil5+G/0GV6hmi3FcFmN1s=
X-Google-Smtp-Source: AA6agR4a/l8hP1u0P8WpD1zmFedHFbGPzszs2HMqNR8fDJ9LD3T/K1IWhmRhwuymqEvOv4w8sp3YdA==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4134 with SMTP id
 h3-20020a056512350300b0048144704134mr11024002lfs.42.1662069637088; 
 Thu, 01 Sep 2022 15:00:37 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852?
 ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
 by smtp.googlemail.com with ESMTPSA id
 w15-20020a2e160f000000b0025e4e7c016dsm25477ljd.16.2022.09.01.15.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 15:00:36 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
Date: Fri, 2 Sep 2022 00:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
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
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
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

W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> The TV mode property has been around for a while now to select and get the
> current TV mode output on an analog TV connector.
>
> Despite that property name being generic, its content isn't and has been
> driver-specific which makes it hard to build any generic behaviour on top
> of it, both in kernel and user-space.
>
> Let's create a new bitmask tv norm property, that can contain any of the
> analog TV standards currently supported by kernel drivers. Each driver can
> then pass in a bitmask of the modes it supports.

This is not a bitmask property anymore, you've just changed it to an enum.
The commit message is now misleading.

> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
> +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> +};

I did not comment on it the last time, but this list looks a little bit random.

Compared to the standards defined by V4L2, you also define SECAM-60 (a good
thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
SECAM-H, SECAM-LC (whatever that is - probably just another name for SECAM-L,
see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTSC).

Like I mentioned previously, I'm personally not a fan of including all those
CCIR/ITU system variants, as they don't mean any difference to the output unless
there is an RF modulator involved. But I get it that they have already been used
and regressing probably wouldn't be a very good idea. But in that case keeping
it consistent with the set of values used by V4L2 would be wise, I think.

> +/**
> + * drm_mode_create_tv_properties - create TV specific connector properties
> + * @dev: DRM device
> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
> +
> + * Called by a driver's TV initialization routine, this function creates
> + * the TV specific connector properties for a given device.  Caller is
> + * responsible for allocating a list of format names and passing them to
> + * this routine.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_mode_create_tv_properties(struct drm_device *dev,
> +                  unsigned int supported_tv_modes)

supported_tv_modes is supposed to be a bitmask of BIT(DRM_MODE_TV_MODE_*)
(or (1<<DRM_MODE_TV_MODE_*)) rather than DRM_MODE_TV_MODE_* directly, but this
is not said explicitly anywhere in this doc comment.

> +    /**
> +     * @DRM_MODE_TV_MODE_PAL_NC: Seems equivalent to
> +     * @DRM_MODE_TV_MODE_PAL_N.
> +     */
> +    DRM_MODE_TV_MODE_PAL_NC,

AFAIK, the entire reason that "PAL-Nc" is ever mentioned as something separate
from PAL-N is a result of a misunderstanding or misreading of the CCIR/ITU
documents. See also the posting signed as Alchaemist here:
https://en.wikipedia.org/wiki/Talk:PAL#PAL-N_versus_PAL-Nc

That being said, we probably want to keep it if we want to remaing compatible
with the loads of software and drivers which enumerate those as separate
systems. But from a technical standpoint, PAL-N and PAL-Nc (and N/PAL, PAL-CN
etc.) are just different "spellings" referring to exactly the same system.

> +    /**
> +     * @DRM_MODE_TV_MODE_SECAM_K: CCIR System G together with the
> +     * SECAM color system. Similar to @DRM_MODE_TV_MODE_SECAM_G but
> +     * with different channels.
> +     */
> +    DRM_MODE_TV_MODE_SECAM_K,
> +
> +    /**
> +     * @DRM_MODE_TV_MODE_SECAM_K1: CCIR System G together with the
> +     * SECAM color system. Similar to @DRM_MODE_TV_MODE_SECAM_G and
> +     * @DRM_MODE_TV_MODE_SECAM_K but with different channels.
> +     */
> +    DRM_MODE_TV_MODE_SECAM_K1,

Typos: you meant CCIR Systems K and K1, not System G.

Best regards,
Mateusz Kwiatkowski
