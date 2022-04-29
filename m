Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D083B51547C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA310EA64;
	Fri, 29 Apr 2022 19:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E7A10E135
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:30:14 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l19so11662414ljb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EpAcbnx+U/L1NwXa16pvqhPXcqBubVwUeHlDIja2sKs=;
 b=fVBaXJcaF9JmA9kT3gJGJ1d182xVAxExs/K2C2cpg9fOUq9K4LgvkN5/2cWKEV8XX1
 vdk0G98yxS2sLJ8zWaB7rhdyyJXKLgvzNqBV6A8afXlXuOH91elyLLmUDaTqdKe4V69x
 AAvZ50gl//UGXVXDm7KrqMLY7C8sZcSZWv2FS0leIXeR83qD9QrBN8p2fl+Pq8HASr1G
 TKXvllgu1hI2pYC43JwELnhiq4v7YL5/ugckF8nanpl/WTJIHkmE7zH4QJz9h7FqOUVT
 0Jz3z+e4DkBb7K3Koshx7MxQKB7Q04DFmhKx0W84Bksadz0n4fPxx9SVm6StU8NgbLlo
 18pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EpAcbnx+U/L1NwXa16pvqhPXcqBubVwUeHlDIja2sKs=;
 b=IDp9R+EDmeN4nekqfHfOAoQ3nRURry4dO2W3Fn5FGX0HCcUn/tKgIi70kA0SWpw8mN
 4VncTljGODJKPgv9DE5uO0UTCOp6nj4oMyfhx5ZPz5s5mQ+RDfVHGzxNHP711piWC5MD
 3DjDLLNh6a/Ph4wzzH62i2mUvgRv63iFphWXa4TpOfjFKp27YuGNRSB9GIsHG4kwRGQL
 Ul7QzMh1iGFrmsKAvOpMVDgarsHpk2zr10SNL/gPjeWM0MaSyDq5ixOTetmJSRmohdQQ
 zJgN8eUCX1dqbVTEmfk9Acp08N5f5U0FEz2B/rk6j+Wl4lz+aQaTO4PbYhoUT2N8DGNb
 aM2Q==
X-Gm-Message-State: AOAM532dVdoN/JGzuViNkYv+nd9dz/gVCWKt6/J6rnVf2ABoeFvXLHgW
 Ge9eZPD0i/JtgMVK2L3eTg0=
X-Google-Smtp-Source: ABdhPJyG5g1UMJHbAE7oQdPUIBwsTGD8b2GZt4x0YMEODqQnagM+tQa4NgqWxwqwNFjLTVjBd5ZQlA==
X-Received: by 2002:a2e:8502:0:b0:24f:1036:b405 with SMTP id
 j2-20020a2e8502000000b0024f1036b405mr465514lji.220.1651260612572; 
 Fri, 29 Apr 2022 12:30:12 -0700 (PDT)
Received: from [10.0.0.42] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac24c83000000b0047255d2115dsm5721lfl.140.2022.04.29.12.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 12:30:12 -0700 (PDT)
Message-ID: <7e47c5fa-4cff-b12f-20ce-2e62b62ec538@gmail.com>
Date: Fri, 29 Apr 2022 22:36:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 22/41] ARM: omap1: move plat/dma.c to mach/omap-dma.c
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-omap@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, jmkrzyszt@gmail.com
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-23-arnd@kernel.org>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220419133723.1394715-23-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/22 16:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most of the interface functions in plat/dma.c are only used from the
> USB driver, which is practically OMAP1 specific, except for compile
> testing.
> 
> The omap_get_plat_info(), omap_request_dma() and omap_free_dma()
> functions are never called on omap2 because of runtime checks.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap1/Makefile                        | 2 +-
>  arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} | 0
>  arch/arm/plat-omap/Makefile                         | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} (100%)
> 
> diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
> index 450bbf552b57..0615cb0ba580 100644
> --- a/arch/arm/mach-omap1/Makefile
> +++ b/arch/arm/mach-omap1/Makefile
> @@ -5,7 +5,7 @@
>  
>  # Common support
>  obj-y := io.o id.o sram-init.o sram.o time.o irq.o mux.o flash.o \
> -	 serial.o devices.o dma.o fb.o
> +	 serial.o devices.o dma.o omap-dma.o fb.o
>  obj-y += clock.o clock_data.o opp_data.o reset.o pm_bus.o timer.o
>  
>  ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
> diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/mach-omap1/omap-dma.c
> similarity index 100%
> rename from arch/arm/plat-omap/dma.c
> rename to arch/arm/mach-omap1/omap-dma.c
> diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
> index 68ccec9de106..5d55295a14ee 100644
> --- a/arch/arm/plat-omap/Makefile
> +++ b/arch/arm/plat-omap/Makefile
> @@ -6,4 +6,4 @@
>  ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
>  
>  # Common support
> -obj-y := sram.o dma.o
> +obj-y := sram.o

-- 
Péter
