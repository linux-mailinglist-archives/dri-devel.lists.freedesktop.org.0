Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107473622A8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1326EC18;
	Fri, 16 Apr 2021 14:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16C6EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:40:10 +0000 (UTC)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lXPdg-0008Uh-M4
 for dri-devel@lists.freedesktop.org; Fri, 16 Apr 2021 14:40:08 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so2083133ejc.15
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSjWTZ/Z5DNODKF+c0WPTkeFDX79xKYMxkTcm2HoLd4=;
 b=L6gs0DwEx6qXu/S3A7IAIct4becAHcalZyNzzeuIP2o5ucoFb4/UUvz4+tItDp/iNC
 8M7o0GZ1d0GzGnrf/0gc6pqR9tgksUJQRsdK+XfXuMq/Pq2B2QV55cnho+vjZZccxefZ
 VUav4l95HbEJYiCqHyKcxziUaUDVA1ouiHTN32l4IiQlaXdV6k+mphZtpN94F3Kc59zX
 N+kqCJ3+2xiivOsN1x3NBV0H30AFIuFvFaSNb7vTmWeW2v8r7uwRWUMTR5/ylI93il+U
 tkxJUvvaKRV416Z6eFsWu0iS95VyZnZjIJWIONzEOgUkZIxB5IbWigGnTh4q/lNy6Hmj
 eMiQ==
X-Gm-Message-State: AOAM530RBOd314nCit3cvHahZ+FTTHHDbPY0tDqe2e+y6ardufETdE8i
 LoylGZ7mhic08r60FK9NlH3scG48NIFDuGXMFfjtNPBtAL42f9VRngceOCKsgGzf3DHWvYzj+Gq
 AYmxyiG8WIOxWu1llcDtAcmGlkg37lvimRwLh8FGJxKjYCA==
X-Received: by 2002:a05:6402:3592:: with SMTP id
 y18mr10107028edc.360.1618584008186; 
 Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqIT1TOvyHKrbuARFcYx9jG1/j3L7k9n1N225zWDszydFHt4CPZHqWrxmI/gzjjqbJS3IMcg==
X-Received: by 2002:a05:6402:3592:: with SMTP id
 y18mr10107011edc.360.1618584008076; 
 Fri, 16 Apr 2021 07:40:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id m14sm1832815edc.18.2021.04.16.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:40:07 -0700 (PDT)
Subject: Re: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name
 with its header
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-35-lee.jones@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
Date: Fri, 16 Apr 2021 16:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-35-lee.jones@linaro.org>
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 16:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning: expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Lee,

I already sent a fix for this one on 5th of April:
https://lore.kernel.org/lkml/20210405181524.52426-1-krzysztof.kozlowski@canonical.com/


Best regards,
Krzysztof

> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 49a2e0c539187..ae576122873e0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -723,7 +723,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
>  }
>  
>  /**
> - * shadow_protect_win() - disable updating values from shadow registers at vsync
> + * fimd_shadow_protect_win() - disable updating values from shadow registers at vsync
>   *
>   * @ctx: local driver data
>   * @win: window to protect registers for
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
