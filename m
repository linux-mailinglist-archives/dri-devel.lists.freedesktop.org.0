Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93844509E75
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A0F10F384;
	Thu, 21 Apr 2022 11:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270510E3BB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:44:45 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id 12so2853722pll.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xImE356a59BZUnW4Cic4JbWC5DVqpMAKjv6nwKPx9DI=;
 b=OL+QXVJEpjV7Z4HuC//q37HqEuUht5h1CcpKGCCRPAuSYfx2YaqLCPrvEiiO6kkGQk
 ggnMOq4NmaIE9B/cPhZqsf2wZexOSYOkZPiDlrJdAHQqubU8MJXkS448ovjQVaRnX2e5
 LgEycZiGsVjUMCg/zKHNyTA3QJf2e1fWo5sPcrVoK5ceeKR5+XlHe/v27vaSfj2kNKZm
 Lme5O2auyyEXGSeMUH5F9xazkNNEa6Oq/msiVIUxgriDElUFLOTt3BxB9fFZuOIoJPDR
 AGZh/1BBFqOc7WG1aCYUXuhGLOOD5R0CwNE7wt0mGMLXgsVtmHrbHmdtHto+xpq+O7Qx
 +r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xImE356a59BZUnW4Cic4JbWC5DVqpMAKjv6nwKPx9DI=;
 b=tNS/Fj8dXF9yxbZXhhNqlUU8tAT/x9wD1JConANmkTvlO2lbI4oKUm9FdJFA6vZTaJ
 BUUllR0PtLyKSHXPTY/hAqhDEtxl0blcX8BvombVwkSmZb4Bvb4xWEMtTHOkeqE0ZM86
 QsPmVHkmHR50oeJgqlp9OtXoFtNTwPQVAqZ8vTuLQRPDxQOlcmp3WCCNFUNR/+FAITlL
 c3vbNUQXw0VScqiudCx0ZhylRZsc4qGM3l6uNRLDOI5X0y5nwm4++W1yDATfK6xSnTov
 CoDA20a+aTGYVp/j8ZWAGLGmcqkGmDw/Pw027vL9VLzH3mtJZFRl3nrtSE19i7zFBFNx
 Pi2A==
X-Gm-Message-State: AOAM533XZq01x1qdg9IEikAhsYbvDtt7eXrczdzus3aTFqhSQ7CEZBs7
 rama5MseubNd0aUJeV5uGGI=
X-Google-Smtp-Source: ABdhPJyBl+Q5YR9vFVRt1kP8/H8gZas/M80UgmaibWxL0BJyPvZZ1qF4/ahkBpyves1PD3Tl2tbTiQ==
X-Received: by 2002:a17:902:b48a:b0:158:e38d:ca23 with SMTP id
 y10-20020a170902b48a00b00158e38dca23mr21918715plr.115.1650487484960; 
 Wed, 20 Apr 2022 13:44:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fe4b:9301:599b:d734])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a635719000000b0039da6cdf82dsm20914985pgb.83.2022.04.20.13.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:44:43 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:44:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 15/41] input: omap: void using mach/*.h headers
Message-ID: <YmBwuBc9UVH6MK+M@google.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-16-arnd@kernel.org>
X-Mailman-Approved-At: Thu, 21 Apr 2022 11:22:59 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 03:36:57PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The omap-keypad driver currently relies on including mach/memory.h
> implicitly, but that won't happen once omap1 is converted to
> CONFIG_ARCH_MULTIPLATFORM. Include the required header
> explicitly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/omap-keypad.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
> index eb3a687796e7..57447d6c9007 100644
> --- a/drivers/input/keyboard/omap-keypad.c
> +++ b/drivers/input/keyboard/omap-keypad.c
> @@ -24,6 +24,7 @@
>  #include <linux/gpio.h>
>  #include <linux/platform_data/gpio-omap.h>
>  #include <linux/platform_data/keypad-omap.h>
> +#include <linux/soc/ti/omap1-io.h>
>  
>  #undef NEW_BOARD_LEARNING_MODE
>  
> -- 
> 2.29.2
> 

-- 
Dmitry
