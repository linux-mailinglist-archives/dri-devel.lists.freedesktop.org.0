Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F5600276
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 19:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6E10E2BE;
	Sun, 16 Oct 2022 17:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768010E2BE;
 Sun, 16 Oct 2022 17:34:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id j23so11485226lji.8;
 Sun, 16 Oct 2022 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U4iSKyq/6RLyBw4TdJevIeK6LIwDkSY3maF+UHfhRrc=;
 b=Kb3uE39EqEeKXPUs/mXs6k65peycq9pdE/WXMK4E2BFk1YiAINvgg+vkC0YAaXyJnp
 VK5A3ChSRZG1GvlLyiVqIqR5FOG7BypHyXE38dY0/pytGejDjoy1MFeH0Fv01/KdamSk
 dZEaHlsAJAeQjNRCuzfXMbSHy6BItSb+Zs8ov21H6w0Gj+ByuPNU/m8dOTkEA+lrlBqH
 rF6WY3dsgRh0pnnkPbOdwVIrSy3hXsXiHkPJQJdUs7ysttYGu0er+okgYgRjQTy+uLr5
 dPyr+xyJy5N4rXlgSGh7/EXSDczjfBivOJ82p8PRq8ByRq2YVEecIGSpp222OndxdRHd
 XoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4iSKyq/6RLyBw4TdJevIeK6LIwDkSY3maF+UHfhRrc=;
 b=CBib52v5uOUlFwlMWv2ODHTS2e57rhegImUIbieNb22kO87+F0JEtH4ti1DiUAitgn
 gKYUexglr5Buwx+r0BYdRSuQW4sOhl2N00bXCznmKL2NOpKfqC6jpiYJb05B/bZpGHmv
 eMpq4GHo+7OzfXiUr2g0uK1ZF7mH5E1TaEbWQohLCqOshSyHJ+mJKle3pvMlJM5E7vpM
 zEMvenOIGkQXwknRdiPd7bXc0/rlRGwBcNv1pNJhHiI/gS8n4J38rHIHhjyPebxdME5E
 5biWl9jDfkRJUoxZ78+w3MWNKFf1bO7ErCR09UnSr6xirEqcQg+v4qlUOh5IAd5feeYx
 oSog==
X-Gm-Message-State: ACrzQf0KjKrOvG3yvq2LUzRleWjE9tk69PxuBeaHGhl6s04jgzqPM5tH
 prh6A+UAR5RCyYMs9Kp+19w=
X-Google-Smtp-Source: AMsMyM4FwFL8YTyWV0uuDmptwQ58R53jPCOYdbjm/t3gf92/x+NDTiDZK/HMDmSdTIkPCQ0ey+Q6jw==
X-Received: by 2002:a05:651c:114:b0:26f:a696:5a40 with SMTP id
 a20-20020a05651c011400b0026fa6965a40mr2909134ljb.350.1665941656107; 
 Sun, 16 Oct 2022 10:34:16 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 v23-20020ac258f7000000b0048a8586293asm1131359lfo.48.2022.10.16.10.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 10:34:15 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <30dbbcc8-1d14-0fc8-ed7c-0c3f7d094ea3@gmail.com>
Date: Sun, 16 Oct 2022 19:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 06/22] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
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
 <20220728-rpi-analog-tv-properties-v5-6-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-6-d841cc64fe4b@cerno.tech>
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

Hi Maxime & everyone,

Sorry for being inactive in the discussions about this patchset for the last
couple of weeks.

> +const static struct analog_parameters tv_modes_parameters[] = {
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,
> +			  NTSC_LINES_NUMBER,
> +			  NTSC_LINE_DURATION_NS,
> +			  PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,
> +				      NTSC_HACT_DURATION_TYP_NS,
> +				      NTSC_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,
> +				      NTSC_HFP_DURATION_TYP_NS,
> +				      NTSC_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,
> +				      NTSC_HSLEN_DURATION_TYP_NS,
> +				      NTSC_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,
> +				      NTSC_HBP_DURATION_TYP_NS,
> +				      NTSC_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,
> +				      NTSC_HBLK_DURATION_TYP_NS,
> +				      NTSC_HBLK_DURATION_MAX_NS),
> +			  16,
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(16, 17)),
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,
> +			  PAL_LINES_NUMBER,
> +			  PAL_LINE_DURATION_NS,
> +			  PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,
> +				      PAL_HACT_DURATION_TYP_NS,
> +				      PAL_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,
> +				      PAL_HFP_DURATION_TYP_NS,
> +				      PAL_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,
> +				      PAL_HSLEN_DURATION_TYP_NS,
> +				      PAL_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,
> +				      PAL_HBP_DURATION_TYP_NS,
> +				      PAL_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,
> +				      PAL_HBLK_DURATION_TYP_NS,
> +				      PAL_HBLK_DURATION_MAX_NS),
> +			  12,
> +
> +			  /*
> +			   * The front porch is actually 6 short sync
> +			   * pulses for the even field, and 5 for the
> +			   * odd field. Each sync takes half a life so
> +			   * the odd field front porch is shorter by
> +			   * half a line.
> +			   *
> +			   * In progressive, we're supposed to use 6
> +			   * pulses, so we're fine there
> +			   */
> +			  PARAM_FIELD(3, 2),
> +
> +			  /*
> +			   * The vsync length is 5 long sync pulses,
> +			   * each field taking half a line. We're
> +			   * shorter for both fields by half a line.
> +			   *
> +			   * In progressive, we're supposed to use 5
> +			   * pulses, so we're off by half
> +			   * a line.
> +			   *
> +			   * In interlace, we're now off by half a line
> +			   * for the even field and one line for the odd
> +			   * field.
> +			   */
> +			  PARAM_FIELD(3, 3),
> +
> +			  /*
> +			   * The back porch starts with post-equalizing
> +			   * pulses, consisting in 5 short sync pulses
> +			   * for the even field, 4 for the odd field. In
> +			   * progressive, it's 5 short syncs.
> +			   *
> +			   * In progressive, we thus have 2.5 lines,
> +			   * plus the 0.5 line we were missing
> +			   * previously, so we should use 3 lines.
> +			   *
> +			   * In interlace, the even field is in the
> +			   * exact same case than progressive. For the
> +			   * odd field, we should be using 2 lines but
> +			   * we're one line short, so we'll make up for
> +			   * it here by using 3.
> +			   *
> +			   * The entire blanking area is supposed to
> +			   * take 25 lines, so we also need to account
> +			   * for the rest of the blanking area that
> +			   * can't be in either the front porch or sync
> +			   * period.
> +			   */
> +			  PARAM_FIELD(19, 20)),
> +};

Nit: setting vbp limits like that makes it impossible to use
drm_analog_tv_mode() to generate modes that include the VBI for e.g. emitting
teletext.

This probably doesn't matter, as it can still be created as a custom mode from
userspace, hence I'm mentioning it as a nit.

> +		 * By convention, NSTC (aka 525/60) systems start with

Typo: s/NSTC/NTSC/

Best regards,
Mateusz Kwiatkowski

