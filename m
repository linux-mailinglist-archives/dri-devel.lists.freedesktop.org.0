Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386469A8FC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D67310EF38;
	Fri, 17 Feb 2023 10:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0132310EF38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:20:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 8-20020a05600c230800b003ddca7a2bcbso522395wmo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 02:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WBDuZ1YsthJFSmgGckbyCZ1GxJY3h4+AR0nDnSv5p9E=;
 b=WuRKgVx/abcZcK0HucJ8OjzXyIpHTyHaEz58egQAstY1ADJVR1JsTDjiROMTeDn2Uq
 UFIxDNUqOqEYb/Yh98Skh8i1EqZD8J5voak28hEzBJTErFxFz5IgwFpGgX2F5MQNSjFe
 FH6yX2PU0TFCrYpUIpN+7qXCdgFPKkYVbeywTF4aZPBS6awLEgJj+eyHNp3kT3oQgWDx
 e/+OLuHHd/o/NEBP3PkabCf0j0O2twILyrxffS5tRO4ngZqMN24Bm/svmGh5Wt7JBRj2
 v0YU+wG5jBK66ZAAGj9BYlTjvdWp5WTmq6SMTfeUTvkr0DYn+iacsV0QtDe6Zj8pkhjP
 8hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBDuZ1YsthJFSmgGckbyCZ1GxJY3h4+AR0nDnSv5p9E=;
 b=4QNS7OzNO/ffFPvxWMXPwiKWpRiypJF9ex3Ddmtl9eHr2JLhm5SmmfORedQD//8dtT
 Xh47ppyUW5PFOMo5NReRvwaM8skwTPoxpuPK51MEeleZk4zlTZVMa2XYTT/7ZSubVng6
 cdyF9vE4T+M7raEvfTY2n0TS+7HF4zVmTYeqZaY6nbZAZV8/LgjuPMvAVBknGsAnKH5K
 nIWqoxcuewpth4kKp6g+1U58zO1Ud4YpGIrElZ95rQycpRXjOInfFpe0/ynH6P8itF+v
 4EK3iATV4wnctYTdi3t3m1BzByZPd0kZWjUEigYKNCHvXRzDuYjJzBKi4FcyuzSx90fF
 f2WQ==
X-Gm-Message-State: AO0yUKXNVC8GCF8FK/ZZC2PMjo4hp8enDr6GQ23DJ07BL6qEU56CRZwL
 rOIvJX5iGNJ2u4qEW9uQQTl05A==
X-Google-Smtp-Source: AK7set/NxxmCSIJR7gO1gNoNDErjpfId+Gjra9KrBytdDA56fqSSwlfB1IfuBIhwiAKMe6dJjTWjZA==
X-Received: by 2002:a05:600c:4d06:b0:3dc:1ad6:55fd with SMTP id
 u6-20020a05600c4d0600b003dc1ad655fdmr893227wmp.32.1676629214411; 
 Fri, 17 Feb 2023 02:20:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f65e:92aa:85d5:15c5?
 ([2a01:e0a:982:cbb0:f65e:92aa:85d5:15c5])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adff685000000b002c559def236sm3028656wrp.57.2023.02.17.02.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 02:20:13 -0800 (PST)
Message-ID: <86b55b41-3faf-dbb8-a072-9a905d111eaa@linaro.org>
Date: Fri, 17 Feb 2023 11:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson/meson_venc: Relax the supported mode checks
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Da Xue <da@lessconfused.com>
References: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 10:32, Carlo Caione wrote:
> Relax a bit the supported modes list by including also 480x1920 and
> 400x1280. This was actually tested on real hardware and it works
> correctly.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> In particular relax the resolution checks to allow more resolutions like
> 480x1920 and 400x1280.
> ---
> Changes in v2:
> - Lower the hdisplay limit to support 400x1280 as well.
> - Link to v1: https://lore.kernel.org/r/20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com
> ---
>   drivers/gpu/drm/meson/meson_venc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 3c55ed003359..fcd532db19c1 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
>   			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
>   		return MODE_BAD;
>   
> -	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
> +	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
>   		return MODE_BAD_HVALUE;
>   
> -	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
> +	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
>   		return MODE_BAD_VVALUE;
>   
>   	return MODE_OK;
> 
> ---
> base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
> change-id: 20230210-relax_dmt_limits-355e2a1c7ccf
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
