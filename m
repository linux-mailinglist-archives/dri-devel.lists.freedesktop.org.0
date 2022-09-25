Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18A5E96F2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 01:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A7010E2EF;
	Sun, 25 Sep 2022 23:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3943E10E2EF;
 Sun, 25 Sep 2022 23:39:54 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k10so8345807lfm.4;
 Sun, 25 Sep 2022 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=st3O2pRGPWK1FLJTPBGRuCniY8P/u6abQYJb/fEYuJQ=;
 b=W3K2NP/a6+oTI8gFEGt5nGGS9enU+0KpjF9MSWpto/y/e8Pqkyk3KdNROeq1VReuw3
 4tbDUQNzhEsLSU0JCkjVpzqYzoF9pZhg9SvgEiWunM5yC5N0DLguvjWHMxFYGtncW+mc
 vOragtuGv5wtfYTpeKmAEjfsXd4V6tTTTzaNGi8+qtE32bmF4JD4wQ6frMIJoh9GGTge
 RAD/AaBmrSAOC5LqiVErhUkwhGjVz5+qH/Z27UJUyGp+GEOEmwJRfc1RTbiWoQbzjL5M
 mtmY0fn16PQvkz4jleVY/+noMI6YznIJxGIP6waxvJ+sh1wleUqUblTSTP3nNWAH+jkr
 pZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=st3O2pRGPWK1FLJTPBGRuCniY8P/u6abQYJb/fEYuJQ=;
 b=WwphXFysj+atz4I9xMY5vGxD4BppJEQZcwGMzhwCXK8XtZFxFSifg+J8JccFXfq6Es
 PKzltgZZIPqxAloQbkQ/HqjSREYSmRpjHmM+DVkdAUU1g2msxn+pbWALn1/BuMjcUM3y
 lEqJfCRRJ4KFTODfG8uavzIFPNAXcKRQ/0MPlxTFqw0D9T/W+EKVmk0PQqI3f8QgeMzK
 7OZNZDwapHbiMASMELJFfkX2bd3p8mJxM6R5wyQIuQ1d0/2VBpYDR/NHjoKa017SNYXi
 PM0JVUF1/vGAW9s05V1KAThkJ6d3/9U47Vic4kcMJ2mMli6ZuoHLOG7K/tMitqteUACH
 AMGg==
X-Gm-Message-State: ACrzQf22dU2VeDc36Nb/rYKAIhXAOOeU8U/a1WGj4gLp26W4fuLcNhhX
 iKuPlUUnV2OKTEgE8H/ynXQ=
X-Google-Smtp-Source: AMsMyM5aDKQS2b/KY3xFf9M+RoiDx1qfHHYGi1ptQgxDMi9xIzklVjEJFzIiBqGLPRgxtbvB3OmxiQ==
X-Received: by 2002:a05:6512:2215:b0:49e:ac45:22e1 with SMTP id
 h21-20020a056512221500b0049eac4522e1mr8247070lfu.33.1664149192424; 
 Sun, 25 Sep 2022 16:39:52 -0700 (PDT)
Received: from [192.168.2.145] (109-252-124-206.nat.spd-mgts.ru.
 [109.252.124.206]) by smtp.googlemail.com with ESMTPSA id
 i11-20020ac2522b000000b0048a921664e8sm2351312lfl.37.2022.09.25.16.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 16:39:51 -0700 (PDT)
Message-ID: <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
Date: Mon, 26 Sep 2022 02:39:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-3-hdegoede@redhat.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220825143726.269890-3-hdegoede@redhat.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.08.2022 17:36, Hans de Goede пишет:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
> 
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
> 
> Changes in v2:
> - Use drm_info(drm_dev,  ...) for log messages
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 681ebcda97ad..03c7966f68d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -8,6 +8,8 @@
>  #include <linux/pwm.h>
>  #include <linux/string_helpers.h>
>  
> +#include <acpi/video.h>
> +
>  #include "intel_backlight.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_connector.h"
> @@ -952,6 +954,11 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  
>  	WARN_ON(panel->backlight.max == 0);
>  
> +	if (!acpi_video_backlight_use_native()) {
> +		drm_info(&i915->drm, "Skipping intel_backlight registration\n");
> +		return 0;
> +	}
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  

This breaks backlight on Acer Chromebook Spin 713 because backlight
isn't registered anymore. Any ideas how to fix it?
