Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B857839AD59
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6D6F512;
	Thu,  3 Jun 2021 21:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F7C6F512
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:59:01 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t8so6178872pgb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bvlEqGWQS/mWxIPH9jHaX3vWyQoNnaB5BXBZR+ZVMms=;
 b=QHO+8GpQPY/r6sesfT4vQwl/4pnfALlnxhPtz5ED3qRuJrY2Wmu4d6xW2AD0sgleJ7
 J2kFpXNRl/RulVThNYbtuc4A5xrKcEZ3UQ5MUYCunXxDjvFQ5TIKTpV9AkIgjcVPQ6Nn
 whpkNyqG8ic/ILf0Gc1bk6qdur5+x3JmUlK3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bvlEqGWQS/mWxIPH9jHaX3vWyQoNnaB5BXBZR+ZVMms=;
 b=Jw2Vo0nUxKuaqwTziWx4ZgZv/8NgEiy6twQFwAKT6pVd/nSIHuM2L7I7vEze9a21YN
 rCgOqg+Opa26bAjmEW8F1MYY4k6rUR7m1XzPh2i0jWj528lolwxrx6U0aIGNXSypT04n
 ULtpFRhxm9GLYrtDGwSp4AOTkVECGqS6PNr/tj+elucGxfEWy0OZX8Ssu80iLzmjtshY
 OmX237PKVnWqrXqsHFd0O/hiRz6GO2N++juYn/KAJxjDHUb/TW9dFyfau0XpvJKV4jCq
 CEGfjQ416KnpXC5RZ2DwZem6XYrEAtkvBFik/zD41cwUAoyRjB/iL+njU4EsH56DC6MX
 oKYw==
X-Gm-Message-State: AOAM532FA+QmpU2OA5AdmuCGDX6S6TrEUswOSuv0OwPYa4jUYOl1lAav
 LNJ/WwwxtGl4dOKhjWJuBB8hCLzjEhf9QA==
X-Google-Smtp-Source: ABdhPJw5M2Zfob07VpqFw8nR1AmRecmSTqx7m5d7TwVAdZST9TFmGluMzs3vqOfrDZPvsOLS23nYlw==
X-Received: by 2002:a63:ff43:: with SMTP id s3mr1588011pgk.86.1622757540838;
 Thu, 03 Jun 2021 14:59:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 18sm52372pfx.71.2021.06.03.14.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:59:00 -0700 (PDT)
Date: Thu, 3 Jun 2021 14:58:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/pl111: Fix CONFIG_VEXPRESS_CONFIG depend
Message-ID: <202106031458.DCF675EF7@keescook>
References: <20210603213412.3903724-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603213412.3903724-1-keescook@chromium.org>
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
Cc: kernel test robot <lkp@intel.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 02:34:12PM -0700, Kees Cook wrote:
> Avoid randconfig build failures by requiring VEXPRESS_CONFIG either be
> missing, built-in, or modular when pl111 is modular. Fixing this warning
> when:
> 
> CONFIG_VEXPRESS_CONFIG=m
> CONFIG_DRM_PL111=y
> 
> aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'

Please ignore this in favor of:
https://lore.kernel.org/lkml/20210603215819.3904733-1-keescook@chromium.org

Thanks!

-Kees

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202105300926.fX0MYySp-lkp@intel.com/
> Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: avoid forcing VEXPRESS_CONFIG be enabled
> v1: https://lore.kernel.org/lkml/20210602215252.695994-4-keescook@chromium.org
> ---
>  drivers/gpu/drm/pl111/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..b84879ca430d 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -3,6 +3,7 @@ config DRM_PL111
>  	tristate "DRM Support for PL111 CLCD Controller"
>  	depends on DRM
>  	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM
>  	depends on COMMON_CLK
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
> -- 
> 2.25.1
> 

-- 
Kees Cook
