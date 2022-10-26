Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1260EACD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122E610E3C4;
	Wed, 26 Oct 2022 21:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E34A10E3C4;
 Wed, 26 Oct 2022 21:25:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d6so31456590lfs.10;
 Wed, 26 Oct 2022 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xwQzSxEYATvXw39X4hIfByL5axaSJ+hp0GX3dcFg9xE=;
 b=RpM/5T09Rkd7whH1lYSUsRaIYsLxkJ0RHNwjJCSxMK6DXCHNXTKvm/1fd6/rqZteFR
 Rx0Dd96ySW4Ipv/w5BooL5M2xPSrcjrb8u6NBcWH5FYSfZQAuMc7l+4tKtdhQ+GupunV
 QxDrwD5p/mLnrG+XlPTaY3Bs1cduAAinJEmPjaKEHtI6PU/jlh7sqgyaCKUUx4NHkvwe
 gQ7yfcspKa3yD8qwC59MMnhKCEbG5hH4oqDos1yN52iQjO8nTh3HigOQyXj7O5Dbi9ZV
 h8NZhnbLYWMt7sRrzSiuElVjYuCoOb7cJR9nec0Geq3YRRQA9H69XcMHraBJpty9UP+5
 LQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwQzSxEYATvXw39X4hIfByL5axaSJ+hp0GX3dcFg9xE=;
 b=wITjwy70WYHfhBvJkQa4ahdLHaGLdvJInoULoSTZZKgRjkAcPU+N6zby62Sg4OTt1I
 2JZK4Dr3vpMLU0p5pdBVWGvDtaMADY3o9foAkFE2n0b+kaS+lbLm60jRiuHxEn6csjAz
 tqU/4J2Wuu/f+cEO0xDzk1xSOFqfrTh0J6la40fsT2+lgfnO4Cu7tN9Fs8LE7FXsTRlS
 ut7r4Z6kYlLQbQ2kw/hWJvmObeIQz7741Nv4WC74w+1UQSTl2wIPLZeNu7U+b6AGAySB
 9N8WSfSfjbSL2UMnOfdeR31b4asafbHZ6uR9Vor66X26crer2h1O3vV40DaXkc+wwsxH
 77Cg==
X-Gm-Message-State: ACrzQf2u16dVPLaFjGiRyHa5XY+02woUPiMFTAf0o1bv8b2mj3EcWgPG
 5aJp3bCfeu12qd6YLruYpdQ=
X-Google-Smtp-Source: AMsMyM6ensEOd7HbTbNfYIT/f7EQdTyWIhqe5A2BIVTj3+ujPQdHszK3t50zI7jkiMDMZGau3DPaxg==
X-Received: by 2002:ac2:5b50:0:b0:4af:d01:63d0 with SMTP id
 i16-20020ac25b50000000b004af0d0163d0mr2786228lfp.596.1666819523402; 
 Wed, 26 Oct 2022 14:25:23 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:c898:de98:30b3:a07?
 ([2a02:a31a:a240:1700:c898:de98:30b3:a07])
 by smtp.googlemail.com with ESMTPSA id
 p8-20020a2eba08000000b00277041268absm1070023lja.78.2022.10.26.14.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 14:25:22 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <1adf0b0b-3743-4b5a-9416-823b8bf903fa@gmail.com>
Date: Wed, 26 Oct 2022 23:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v6 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
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
 <20220728-rpi-analog-tv-properties-v6-14-e7792734108f@cerno.tech>
Content-Language: pl
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-14-e7792734108f@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

> +static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
> +					       struct drm_cmdline_mode *cmd)
> +{
> +	struct drm_display_mode *mode;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
> +		const struct drm_named_mode *named_mode = &drm_named_modes[i];
> +
> +		if (strcmp(cmd->name, named_mode->name))
> +			continue;
> +
> +		if (!named_mode->tv_mode)
> +			continue;
> +
> +		mode = drm_analog_tv_mode(dev,
> +					  named_mode->tv_mode,
> +					  named_mode->pixel_clock_khz * 1000,
> +					  named_mode->xres,
> +					  named_mode->yres,
> +					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
> +		if (!mode)
> +			return NULL;
> +
> +		return mode;
> +	}
> +
> +	return NULL;
> +}
> +

You didn't add tv_mode_specified to struct drm_named_mode, and left the
if (!named_mode->tv_mode) condition here. This will break on NTSC.

Best regards,
Mateusz Kwiatkowski

