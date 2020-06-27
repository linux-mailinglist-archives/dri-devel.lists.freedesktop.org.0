Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD220C3F4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 22:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ABC6E056;
	Sat, 27 Jun 2020 20:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC57A6E056
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 20:07:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s1so13810085ljo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZFaQTsW/WXVn1iwJZRAZ2X6A/rfV1zt5VjDepA1EA4=;
 b=TnxOPw73YYPgAnmzZyKvoyT6zsK4TjlE9HVeQ/E6yn7NLoaSKQwsLf+5scBrOalL8i
 TOkE5/DcT4GKAyeMoY/i9en5h+p/PHTUM7vfVcURnWSvLcZjb4bFtrlBhXwFgJYKMUoQ
 wL/TNFGMdGQbYQeONs0R+8s8mqYhorLBHTtP0E6lItOSnZU4A9z/v1UCVXE1++TJ8276
 GirJedUbpkXmKH6OiW0006i9b4BZnLUFJ/SebTEsxtprfeXDDpjJkAUWHZhb1Iwlhg4j
 bZdIKvEB4k5xDCgyRO1pGethWS+uf+jO4s4fQjQmZL0taqZG/Zy+B0ba0mWsGpicYWWf
 BzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZFaQTsW/WXVn1iwJZRAZ2X6A/rfV1zt5VjDepA1EA4=;
 b=dgjBzlGsriMgwz7JcminbHMKsWlwdjb3phNAfoV/pEBRKjScb8kuySXkniHoO0XWCA
 Vu/HIHKK5uYY7MqJvrMNmPOMEp0PIBS6KDJ7zlwVGWjyi0dlrhfeqp8418BH7GoXubeD
 CtvaQM6seKmeZt72qAr+JJMYUp7vl0UHd9jBJ+goWErmRCyomBPsEvxFBBs7eCGysILd
 VFRthYQvZ0HKXXN1I/5ngtiterpMqHK5jCVHOt1Ejp5vEMdhhg7853u7dNMSWQiqOG8e
 +xHySIzi8nF2yfRfXRDU5aoQNpey46dS6JSLrx8BYPVLSrOo8q+bdaaA71zLHS/2actq
 Wivw==
X-Gm-Message-State: AOAM532uBJKaNX/DL6bziAieqnJhxqklnBKJQIbXj4loTLGLEkOW98ih
 3MmHadLMCp6zu3A+AqjR/Ft/329EzSrUnJHGcEQ=
X-Google-Smtp-Source: ABdhPJyYQgp5uVYjRrCGwBOC+NpoqjNVv5GhHr4UG3NSahywerK24X4oxuKNUvRusw+Ons/JfJGszMlZRydojKaecK4=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr4943099ljc.467.1593288425130; 
 Sat, 27 Jun 2020 13:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626220134.340209-1-linus.walleij@linaro.org>
In-Reply-To: <20200626220134.340209-1-linus.walleij@linaro.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 27 Jun 2020 22:06:54 +0200
Message-ID: <CAMeQTsYEzCTUUAqgfo3xGNYeZg1RM+kXT7CYNDMLwC9gOV1_-w@mail.gmail.com>
Subject: Re: [PATCH] drm: gma500: Drop surplus include
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 12:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This file includes <linux/gpio.h> but does not use any
> symbols from it, drop the include.

Hi Linus,
Seems the include should be moved to mdfld_dsi_output.c instead.

Thanks
Patrik

>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/gma500/psb_intel_drv.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
> index fb601983cef0..9221d1f545b0 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -13,7 +13,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> -#include <linux/gpio.h>
>  #include "gma_display.h"
>
>  /*
> --
> 2.25.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
