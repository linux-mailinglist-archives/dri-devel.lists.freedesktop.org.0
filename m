Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6731AA10B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B57A6E221;
	Wed, 15 Apr 2020 12:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2C6E221
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:43:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a25so18970614wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xz+YTOHNYCXdP1BDbqG5YAFKwQGTYMNNrFa2gvIXERM=;
 b=fZQxdNoApyvNeBsn2jIoaMwXN15cK/vKO9+PLRI3LBOsjXFLn1GeBzPPyjw8+KtTjs
 2bWgWwxitVfu/M9wMaOThxOv5T6M1Yli+RdLaZpOoKLavGVebcSEYNu5W9DM3WtPApxF
 2BW8mDeLeATpX7He1zzfcqJPEz4C6aKSWI1qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xz+YTOHNYCXdP1BDbqG5YAFKwQGTYMNNrFa2gvIXERM=;
 b=ccR3zBTvIxQJZ2UCA2IfkROzXMRRv4zM6tfHGISsDVtyxgpgfrUVEnDIBND5IWqI16
 b/W1nue/edtomzey8K8PkNds/HSSZWS+YVy/KeywIDG1iC6TrG5BwF/IQyXT597DespB
 eYDKxKah8Ru623ipNrkQeDTmmzwzMDyZD/U20CUUJA10s8kLuluP1PIec7CN6a4lnfo+
 WVrQVNIggmlRW2PTTOGhZ0P55TpcGVoyyGLISCOPAVr2YR8XcVP0AsPz6ccOQbAR67C+
 S1Re6q++J7EsfDQfr/Bkrfb6JUDU35v+pPyoaThGaMLKnqNIbzzk91ld/kadY3cAQyhd
 oLZQ==
X-Gm-Message-State: AGi0PuabFdx9E35EPJSmPgue9pLp+s0dby1+dKeJnPbF12iYUbpfwc/M
 ojNhn0aMPfhV2LLBUrbaeP1w8A==
X-Google-Smtp-Source: APiQypI/joouelURTy4OKxn0y/Uzbjwa4A81ZP3a5dY66+yY/aNdM1czkBjo4FY/RYkgSehhK70yMg==
X-Received: by 2002:adf:afe4:: with SMTP id y36mr29792465wrd.205.1586954587467; 
 Wed, 15 Apr 2020 05:43:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t13sm7139552wre.70.2020.04.15.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 05:43:06 -0700 (PDT)
Date: Wed, 15 Apr 2020 14:43:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Message-ID: <20200415124305.GC3456981@phenom.ffwll.local>
References: <20200415122427.111769-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415122427.111769-1-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> The Tegra DRM drivers includes the legacy GPIO headers
> <linux/gpio.h> and <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc
> structs are ever referenced.
> 
> Include the right header on the top level tegra/drm.h
> file and drop all the surplus includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hm, I wonder whether we should do similar splits for drm_bridge and
drm_panel, so that drivers don't pick the wrong interfaces ...

Anyway this looks neat, I spent a bit of time looking at how this is done,
fwiw (not much) and assuming it compiles:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/dpaux.c | 2 --
>  drivers/gpu/drm/tegra/drm.h   | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c  | 1 -
>  drivers/gpu/drm/tegra/sor.c   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 7dfb50f65067..105fb9cdbb3b 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -5,12 +5,10 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index ed99b67deb29..bf0512177e8f 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -9,7 +9,7 @@
>  
>  #include <linux/host1x.h>
>  #include <linux/iova.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_edid.h>
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 38252c0f068d..94fb0193fa3d 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -7,7 +7,6 @@
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
>  #include <linux/hdmi.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 81226a4953c1..b010826e86da 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -6,7 +6,6 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/debugfs.h>
> -#include <linux/gpio.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -- 
> 2.25.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
