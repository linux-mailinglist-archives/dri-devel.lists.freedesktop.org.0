Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00660EB64
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 00:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB6310E53E;
	Wed, 26 Oct 2022 22:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC810E53B;
 Wed, 26 Oct 2022 22:02:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s24so13856796ljs.11;
 Wed, 26 Oct 2022 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=vdgNzDxQTO6bdUosOm0eh7BG6o7NyvcQ+Csx9d4p3mU=;
 b=hVGfulv077UBxsCtfjWKjttGMkhjPh4/Hf9rDhRbZDsum/itTcad9RTU1pC69hYnH4
 9k1YuY9UxLIiVPXb3HwL3UPoWvKhihpgwxTEZ5ch2rFIzc2KDyTz1PXgYzEOoTIAxWji
 0fcw9CBPwvkD7Cu/10sUAMuFJjZp52i9aJ9hD6THhpmT2E2bInxB89sJ1qw6GH7xMcBb
 dkjH9kLpoPcLQlOyqka5xGNGAuLoz8+aa3SovNXgokAk4K8jhW/88cPvotghUpvcGFa3
 BamcsNgnvR9P8Nsdd7EYxrLctpprENAiLlNtyDm9dgj0xUD1gsJ4EQB9bOkmGVAbO8Iy
 aqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdgNzDxQTO6bdUosOm0eh7BG6o7NyvcQ+Csx9d4p3mU=;
 b=Pxx4pWsfeuaimfxkv3lDIlqNqz4/+Y0WwLZtuFQ9eX3jKLXZ+PgRgShsLvMvtWDB9+
 cObGn/dhCytCvi5ZqlbYqyJevi7/tOpP8k7A3Qy1tDvBFkVIk8Wy4pSm2BdAGSxJHaht
 GTHovYVq9CYmKcQD9wsYTXKwiZQ3VctssmLRvNQRRZLJGjWcPG3YTNDlxeFgTBylyxPF
 3+iRz5YMLZw55vRoevvr+Q8FlGtRU9WtYHrDpykIIQ7Q05b1S9Pb3f3lcyscIcI+3WPz
 JifXhmc95tF6wkZYXAoQx8CJTC2mOrKxKt/2QEnokQHR+a3kesUIZv0VX0ZAsJIxGwMw
 odxw==
X-Gm-Message-State: ACrzQf0a9Tw5Gc19NB5FXBdaR0D3H8OigqHTRJcGeAbRCnJSBmg0GiGv
 sQqtThkDDAcV7tnhIlHzt1w=
X-Google-Smtp-Source: AMsMyM5+7FXwwLPlb9qIuDs7qKIPm1MbION3iWvH0DJZ+41PbaxEGy2+MUlPXsrTQOO45XWlwDc8OQ==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id
 g3-20020a2e9e43000000b0025dd8e97b15mr17315108ljk.234.1666821746508; 
 Wed, 26 Oct 2022 15:02:26 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:c898:de98:30b3:a07?
 ([2a02:a31a:a240:1700:c898:de98:30b3:a07])
 by smtp.googlemail.com with ESMTPSA id
 m17-20020a056512359100b004ac269b7792sm987675lfr.127.2022.10.26.15.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 15:02:26 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <8d0eee22-50f5-5b0a-c1e6-c5f61dd5bbcd@gmail.com>
Date: Thu, 27 Oct 2022 00:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v6 16/23] drm/probe-helper: Provide a TV get_modes helper
Content-Language: pl
To: maxime@cerno.tech, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Ben Skeggs <bskeggs@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
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

First of all, nice idea with the helper function that can be reused by different
drivers. This is neat!

But looking at this function, it feels a bit overcomplicated. You're creating
the two modes, then checking which one is the default, then set the preferred
one and possibly reorder them. Maybe it can be simplified somehow?

Although when I tried to refactor it myself, I ended up with something that's
not better at all. Maybe it needs to be complicated, after all :(

Anyway, the current version seems to have a couple of bugs:

> +	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_N) ||
> +	    tv_mode_supported(connector, DRM_MODE_TV_MODE_SECAM)) {
> +		mode = drm_mode_analog_pal_576i(connector->dev);
> +		if (!mode)
> +			return 0;
> +
> +		tv_modes[count++] = mode;
> +	}

If the 480i mode has been created properly, but there's an error creating the
576i one (we enter the if (!mode) clause), the 480i mode will leak.

> +	if (count == 1) {

You're handling the count == 1 case specially, but if count == 0, the rest of
the code will assume that two modes exist and probably segfault in the process.

> +	ret = drm_object_property_get_default_value(&connector->base,
> +						    dev->mode_config.tv_mode_property,
> +						    &default_mode);
> +	if (ret)
> +		return 0;
> +
> +	if (cmdline->tv_mode_specified)
> +		default_mode = cmdline->tv_mode;

In case of an error (ret != 0), the modes created so far in the tv_modes array
will leak.

Also, I wonder if maybe the if (cmdline->tv_mode_specified) clause should go
first? If we're going to use the default from cmdline, there's no point in even
querying the property default value.

Best regards,
Mateusz Kwiatkowski

