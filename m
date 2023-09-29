Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E87B2ADB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 06:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555A10E0D1;
	Fri, 29 Sep 2023 04:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668CD10E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 04:09:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-405361bba99so135469495e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695960545; x=1696565345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUiX4IeP5dcs+VWg502cfRIf5MgfBL2Llr+m8u48rDc=;
 b=cDCNU27FjA3v7xWqSexN2pc6tnODwl5bLCbhY9YOCkrekKNAJuQ49ZP/ZSW8h3qC5V
 3WRFFazvopMCIx30h3vflz83uJ7p0ic3cEpna9eULfZgm5zBtRYCTVPmb8HOsqDYHBi5
 jr+JqLxukCLx4JdPKqHxNVPTSJ2VefnNQ0mCmMZOIfYGhtnMCf13POQWn+qMBnIQvkRY
 0YRgHNrbyc8ZgzhqIcxYU5LVe09vNHgNO5Kbpg+IPxA5YdP9zPOIgHzncbf+OAbbD32i
 F1uevdmiOigFAZ1MA+ErufbuKrB4k8sHiS9j/2SbakLvspCjAwg1naSsWSAzldvkleot
 CNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695960545; x=1696565345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUiX4IeP5dcs+VWg502cfRIf5MgfBL2Llr+m8u48rDc=;
 b=OX1+N5iV9jc4+rw/7tl97cQD8Kqa2RWOqfQmtLgZtPQBoPlfIhS/+hAqX86uc7Q0/d
 GpUJpqrgk0ZZiCyxR98YRDIbXhqhbhUSkKQnql+oBCdkzhAK4opX2H7thC62N88T7+DH
 JINPjYYHsWzAbzAq8udesVUcgd0rcDN5Bj1cbAZ84YuU4t9+JoT9pboCQB/zwiMa2Yk5
 mE+F7q5nLyvhE2b1JnAZ9PCBrj7ARb76no19qjBSzushQaPpjav4peF8eOEX8MipoJ/N
 t4Ld01JTORvJeiqV4bnsdZlosQghV/y4xTrvct4vmJSAKseC7aw6PKPV6q9s73Ak+L0Q
 j+4w==
X-Gm-Message-State: AOJu0YyvEUW9TEaMRMEEGkQsjxmg/5hAPmYmgqWW7DPQYSXyPXl9I/jO
 SYz93+/9c5CL9CNCft+oS5+BNA==
X-Google-Smtp-Source: AGHT+IEpeY+hEpdBdL8tAE7KjTMNsWXt2lQNzAWPfgLcdjDfX7T/mZ/pA1eqXRFYf5ZD3xcb+v7Oew==
X-Received: by 2002:a7b:c40f:0:b0:401:bcd9:4871 with SMTP id
 k15-20020a7bc40f000000b00401bcd94871mr2695453wmi.21.1695960544572; 
 Thu, 28 Sep 2023 21:09:04 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05600c11c900b0040596352951sm543237wmi.5.2023.09.28.21.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 21:09:04 -0700 (PDT)
Message-ID: <cd18fa16-e060-f69b-b53c-f1bce4f76430@linaro.org>
Date: Fri, 29 Sep 2023 06:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm: Spelling s/hardward/hardware/g
Content-Language: en-GB
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1695903065.git.geert+renesas@glider.be>
 <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 28/09/2023 à 14:16, Geert Uytterhoeven a écrit :
> Fix misspellings of "hardware".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   include/drm/drm_bridge.h                 | 2 +-
>   include/drm/drm_modeset_helper_vtables.h | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index cfb7dcdb66c4b0b5..05b360a4357fed01 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -107,7 +107,7 @@ struct drm_bridge_funcs {
>   	 * Since this function is both called from the check phase of an atomic
>   	 * commit, and the mode validation in the probe paths it is not allowed
>   	 * to look at anything else but the passed-in mode, and validate it
> -	 * against configuration-invariant hardward constraints. Any further
> +	 * against configuration-invariant hardware constraints. Any further
>   	 * limits which depend upon the configuration can only be checked in
>   	 * @mode_fixup.
>   	 *
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index e3c3ac615909474b..bbc516f313913254 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -134,7 +134,7 @@ struct drm_crtc_helper_funcs {
>   	 * Since this function is both called from the check phase of an atomic
>   	 * commit, and the mode validation in the probe paths it is not allowed
>   	 * to look at anything else but the passed-in mode, and validate it
> -	 * against configuration-invariant hardward constraints. Any further
> +	 * against configuration-invariant hardware constraints. Any further
>   	 * limits which depend upon the configuration can only be checked in
>   	 * @mode_fixup or @atomic_check.
>   	 *
> @@ -550,7 +550,7 @@ struct drm_encoder_helper_funcs {
>   	 * Since this function is both called from the check phase of an atomic
>   	 * commit, and the mode validation in the probe paths it is not allowed
>   	 * to look at anything else but the passed-in mode, and validate it
> -	 * against configuration-invariant hardward constraints. Any further
> +	 * against configuration-invariant hardware constraints. Any further
>   	 * limits which depend upon the configuration can only be checked in
>   	 * @mode_fixup or @atomic_check.
>   	 *

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
