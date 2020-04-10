Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CB1A4955
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB186ED28;
	Fri, 10 Apr 2020 17:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9668C6ED28
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:39:24 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id e4so1954365oig.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UVlxIE0CSKdKwuyXIBQDvbaJJFV3N43f9jUNTBByOKM=;
 b=WDGD5Ldniu2Mcou0gTUijxCRwZ4qBh5IPySXF5I06DP8/OM1GLwGTINArZg3P5MhXw
 lIWRV8o+WZbSZ8VfZbwRcvPhCaHGeIcE+tzsYmKNWqzJMhCOKVAuGepGf2ClA7lt7cNn
 TPxqsgT+sB+w5+hm00w/WNcp5JvIc2Ep51guapMYX+M1Zobj5oz0nkgVPRXv5O90vU8i
 rD3OX+FF/kz9veduS+GG9QVVVk7keioSznp+0w45L7qjTP1PwgJf4rQ1E2O7wrobSRgx
 36fQwbA3jI5mRSngYHBnURY83O+xJC5mJ38io9ueAQc1LsNNnfy7HQ66eOqTRsMaqsR0
 KSnw==
X-Gm-Message-State: AGi0PubSvk4vP7erkqngVv9OEPV7xL7vCP7HSEzkkXvMuejHFthor7/F
 fzrAhuOAPP1RsT3T6GS/YQ==
X-Google-Smtp-Source: APiQypIbEr9eAuDn8ap/2ErWe8F05Nq4R1u7xjJ+3zCkjJKKNwFWVUzijYYdI42B6WOSqS3yiJsmAw==
X-Received: by 2002:a05:6808:1c1:: with SMTP id
 x1mr3845478oic.55.1586540363863; 
 Fri, 10 Apr 2020 10:39:23 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id d21sm1480776otp.39.2020.04.10.10.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:39:23 -0700 (PDT)
Received: (nullmailer pid 6854 invoked by uid 1000);
 Fri, 10 Apr 2020 17:33:24 -0000
Date: Fri, 10 Apr 2020 12:33:24 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2 2/2] powerpc: Remove Xilinx PPC405/PPC440 support
Message-ID: <20200410173324.GA28512@bogus>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <9c3e02ffa9812c6f046708b45932d40f33e8817a.1585575111.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c3e02ffa9812c6f046708b45932d40f33e8817a.1585575111.git.michal.simek@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, sfr@canb.auug.org.au,
 Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 git@xilinx.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 monstr@monstr.eu, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 03:32:17PM +0200, Michal Simek wrote:
> The latest Xilinx design tools called ISE and EDK has been released in
> October 2013. New tool doesn't support any PPC405/PPC440 new designs.
> These platforms are no longer supported and tested.
> 
> PowerPC 405/440 port is orphan from 2013 by
> commit cdeb89943bfc ("MAINTAINERS: Fix incorrect status tag") and
> commit 19624236cce1 ("MAINTAINERS: Update Grant's email address and maintainership")
> that's why it is time to remove the support fot these platforms.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> 
> Changes in v2:
> - Based on my chat with Arnd I removed arch/powerpc/xmon/ changes done in
>   v1 to keep them the same as before. (kbuild reported some issues with it
>   too)
> 
>  Documentation/devicetree/bindings/xilinx.txt | 143 ------

Acked-by: Rob Herring <robh@kernel.org>

>  Documentation/powerpc/bootwrapper.rst        |  28 +-
>  MAINTAINERS                                  |   6 -
>  arch/powerpc/Kconfig.debug                   |   2 +-
>  arch/powerpc/boot/Makefile                   |   7 +-
>  arch/powerpc/boot/dts/Makefile               |   1 -
>  arch/powerpc/boot/dts/virtex440-ml507.dts    | 406 ----------------
>  arch/powerpc/boot/dts/virtex440-ml510.dts    | 466 -------------------
>  arch/powerpc/boot/ops.h                      |   1 -
>  arch/powerpc/boot/serial.c                   |   5 -
>  arch/powerpc/boot/uartlite.c                 |  79 ----
>  arch/powerpc/boot/virtex.c                   |  97 ----
>  arch/powerpc/boot/virtex405-head.S           |  31 --
>  arch/powerpc/boot/wrapper                    |   8 -
>  arch/powerpc/configs/40x/virtex_defconfig    |  75 ---
>  arch/powerpc/configs/44x/virtex5_defconfig   |  74 ---
>  arch/powerpc/configs/ppc40x_defconfig        |   8 -
>  arch/powerpc/configs/ppc44x_defconfig        |   8 -
>  arch/powerpc/include/asm/xilinx_intc.h       |  16 -
>  arch/powerpc/include/asm/xilinx_pci.h        |  21 -
>  arch/powerpc/kernel/cputable.c               |  39 --
>  arch/powerpc/platforms/40x/Kconfig           |  31 --
>  arch/powerpc/platforms/40x/Makefile          |   1 -
>  arch/powerpc/platforms/40x/virtex.c          |  54 ---
>  arch/powerpc/platforms/44x/Kconfig           |  37 --
>  arch/powerpc/platforms/44x/Makefile          |   2 -
>  arch/powerpc/platforms/44x/virtex.c          |  60 ---
>  arch/powerpc/platforms/44x/virtex_ml510.c    |  30 --
>  arch/powerpc/platforms/Kconfig               |   4 -
>  arch/powerpc/sysdev/Makefile                 |   2 -
>  arch/powerpc/sysdev/xilinx_intc.c            |  88 ----
>  arch/powerpc/sysdev/xilinx_pci.c             | 132 ------
>  drivers/char/Kconfig                         |   2 +-
>  drivers/video/fbdev/Kconfig                  |   2 +-
>  34 files changed, 7 insertions(+), 1959 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
