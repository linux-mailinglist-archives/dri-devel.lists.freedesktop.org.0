Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A205C60A7EA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A3C10E58D;
	Mon, 24 Oct 2022 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0710E58D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:00:35 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1324e7a1284so11706874fac.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 06:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+x9joGdXdBFLPPxN1p6d7/jrm+b1E7zu0ZikUl9XbM=;
 b=GRQRo6BNeFAO+h7zACBPpWX3/S59Pd5g/IYU71UiAfvwCkFcx0VXacgzuuKtXMvhVH
 pnN2LNmlq1rSYfzfdWhzuZ+O6IuAKE2FzQpzdeRd3LHaATCdT7T15Nfh4MK6UI2j9grW
 6HGZqdvm8dQwM6cxWpb04SyY2RvxP9ERBPK8t9aga5Dtrw+pB+JV8BeGYML+rleq2aHf
 46JxUQ8NTZWMxfCYnqfW1Nw/xvc8Nw8cNjFjkKr4OxMXHdfr7/XFejeYpy6IXlu7+nRW
 QXRzrvQuRLUHueq6nqWmGJ6qTMg2Cor3w591EY3HhlW+unEWYvG9xHzuN68uvH0yn9Yy
 t3Tw==
X-Gm-Message-State: ACrzQf3It/aWqN7twSZ0tfooPcr3b6Cjks3lOx5tYWGC9rvbdSHdal5y
 ShnFAHBm8QOUTKU4l3llBQ==
X-Google-Smtp-Source: AMsMyM4RB1x55W7tWXLqKMCfn9+yNGKoyP28eeDXqoWuK46CSg7FurAIxSSG6961lNUtLuCZU2W88g==
X-Received: by 2002:a05:6870:e9a8:b0:133:223f:49a1 with SMTP id
 r40-20020a056870e9a800b00133223f49a1mr38235091oao.114.1666616434841; 
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g20-20020a056870c15400b0012796e8033dsm2716705oad.57.2022.10.24.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: (nullmailer pid 1652638 invoked by uid 1000);
 Mon, 24 Oct 2022 13:00:35 -0000
Date: Mon, 24 Oct 2022 08:00:35 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Message-ID: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

[...]

>  Documentation/arm/index.rst                   |    1 -
>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>  Documentation/arm/samsung/overview.rst        |   13 -

What about?:

Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt
Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Rob
