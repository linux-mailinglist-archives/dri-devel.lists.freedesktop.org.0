Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B63622AC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3A6EBFD;
	Fri, 16 Apr 2021 14:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEEB6EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:42:06 +0000 (UTC)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lXPfZ-0000Ch-FT
 for dri-devel@lists.freedesktop.org; Fri, 16 Apr 2021 14:42:05 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 d11-20020a170906370bb029037c87968c04so2091707ejc.17
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3orKY1/6E7It9couZQFwgWHB9x2xfiTMv49UiHX33I=;
 b=HusD68VA/CDN9p/BxGKXKvLOfU1R+ULQkZpUv3r7IQ28O2dULSOUIqmiktG8ZwWcp0
 R5S44Y3OnivB2r6k4uPGtvZ+FO7N+T5TjM5iI4ZSn4qgc75y7YVwAOPugaCF04DSgRdq
 mXEd1S503mxYcJ00m/aC+Ip/hiT3lbFNLOuHhO0n5I7bfHnIJHGegihWWDz8BI0UhYzM
 1aaLAeK+lmB8PB0YiM3OerJLo98fmcZokaFxolfVuxKdB+arrcQoHQdGAN2PyzJbiVEc
 +LJCiS9iEECWrlXpTQsFZ6eZxZPxPY79qk11zTOJcD0X44JkW+P6IlBEG6ISQdOeSi0r
 RAaw==
X-Gm-Message-State: AOAM533Fs8hVI8ItADF2QDvyOyOmQCR3o7KwQPT0KgfNPNQeNkON47bP
 16P20v/aM1C/k4FU8DoWtRnio5sxm/rrGn4JSLxDDu8tdrBNCjFUP5LwJkU1DD0vXRt5nQ2rTdh
 tjg65bSnkF1sSpISpu+ZXFwZjZqI88ENzcHRYk5asEjA0lg==
X-Received: by 2002:a17:906:3153:: with SMTP id
 e19mr8808148eje.351.1618584125253; 
 Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLYgDmRYOx7mlmnqWjHmwHF8mTlbAilqonRblj7lGIBqxozRBPiD2hV0hjFdS3yuqciMmEQw==
X-Received: by 2002:a17:906:3153:: with SMTP id
 e19mr8808134eje.351.1618584125122; 
 Fri, 16 Apr 2021 07:42:05 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id t7sm5532707edq.42.2021.04.16.07.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:42:04 -0700 (PDT)
Subject: Re: [PATCH 38/40] drm/exynos/exynos_drm_ipp: Fix some function name
 disparity issues
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-39-lee.jones@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <81a27ab8-9e2e-8f29-c1dd-19ec54ec3d28@canonical.com>
Date: Fri, 16 Apr 2021 16:42:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-39-lee.jones@linaro.org>
Content-Language: en-US
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c:105: warning: expecting prototype for exynos_drm_ipp_ioctl_get_res_ioctl(). Prototype was for exynos_drm_ipp_get_res_ioctl() instead
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c:153: warning: expecting prototype for exynos_drm_ipp_ioctl_get_caps(). Prototype was for exynos_drm_ipp_get_caps_ioctl() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
