Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32E1B1737
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 22:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273BA6E28B;
	Mon, 20 Apr 2020 20:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE676E0B8;
 Mon, 20 Apr 2020 20:36:52 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i22so9339443otp.12;
 Mon, 20 Apr 2020 13:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0kqh5Q9Co3AbSPBrTmVcdN3oyZQj3KIAbrC9Aw9Jey8=;
 b=VK4fiOcXattty9tENMM9I5FKFp+BZGcaiAob+fTcLqN2WTD9ozSi1se7909H7Ezg+S
 8TJ5e37yp2Wb7Aht/EtE7MKSgIjXXzBcNkPRWD/TK5WsQQyHA0fV6kQG6F4CkBqDjOSn
 zzQpugZJ8wuDK2prtJNLr84qv8pLifq3TiBFlADRfm370LUzu17vQbtTZq5d0AtMzCcf
 RABNZJ9w6LGK9CLGckXO61ksr4mfJrXPldwZa2/w4Pqwv5uWIiiSgnImWxHdHAQZqyMd
 PTOhiEC+Z1ukBwuCnv68f2I5XdAz9raDESxTTzvCgpC6252Ufb6TwSZ0cLf6xI+ZLL4w
 YbWQ==
X-Gm-Message-State: AGi0PubuUz9yG+PiXMN/O9D4aStQ1loa1obXASRZ9QzurZRIgsDRYXHf
 Zsh7bRGFg2gYmGDEwcBOOQ==
X-Google-Smtp-Source: APiQypIKf0vB7yfwu8rT/KxQM+HvZK1R4I7Apur0UzYjSjNLrYCJKeDB/Ne3EnK+UZ4pWSPP25JeDQ==
X-Received: by 2002:a9d:6a02:: with SMTP id g2mr11554009otn.196.1587415011744; 
 Mon, 20 Apr 2020 13:36:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r21sm190334otg.67.2020.04.20.13.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:36:50 -0700 (PDT)
Received: (nullmailer pid 18971 invoked by uid 1000);
 Mon, 20 Apr 2020 20:36:47 -0000
Date: Mon, 20 Apr 2020 15:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Hadar Gat <hadar.gat@arm.com>
Subject: Re: [PATCH] of_device: removed #include that caused a recursion in
 included headers
Message-ID: <20200420203647.GA23189@bogus>
References: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
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
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Gilad Ben-Yossef <gilad@benyossef.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Ofir Drang <ofir.drang@arm.com>,
 linux-gpio@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 04:35:53PM +0300, Hadar Gat wrote:
> Both of_platform.h and of_device.h were included each other.
> In of_device.h, removed unneeded #include to of_platform.h
> and added include to of_platform.h in the files that needs it.

Guess we forgot about that temporary comment!

Both of these headers have a lot of things we don't want 'normal' 
drivers calling. The most common thing needed from of_device.h is 
of_match_device/of_device_get_match_data. A good number are only for 
ibmebus. Maybe the header should be split or the former just moved 
to of.h.

For of_platform.h, it seems we have a bunch of unneeded includes:

$ git grep 'of_platform\.h' drivers/ | wc
    560    1120   36049
$ git grep -E 'of_(platform_(pop|def)|find_device)' drivers/ | wc
    248    1215   20630

Would nice to drop those (or switch to of_device.h?) too.

Be sure to build on Sparc. It's the oddball.

> 
> Signed-off-by: Hadar Gat <hadar.gat@arm.com>
> ---
>  drivers/base/platform.c                           | 1 +
>  drivers/bus/vexpress-config.c                     | 1 +
>  drivers/dma/at_hdmac.c                            | 1 +
>  drivers/dma/stm32-dmamux.c                        | 1 +
>  drivers/dma/ti/dma-crossbar.c                     | 1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
>  drivers/iio/adc/stm32-adc-core.c                  | 1 +
>  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
>  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
>  drivers/iommu/tegra-smmu.c                        | 1 +
>  drivers/memory/atmel-ebi.c                        | 1 +
>  drivers/mfd/palmas.c                              | 1 +
>  drivers/mfd/ssbi.c                                | 1 +
>  drivers/mtd/nand/raw/omap2.c                      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  drivers/net/ethernet/ti/cpsw.c                    | 1 +
>  drivers/phy/tegra/xusb.c                          | 1 +
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
>  drivers/soc/samsung/exynos-pmu.c                  | 1 +
>  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
>  include/linux/of_device.h                         | 2 --
>  lib/genalloc.c                                    | 1 +
>  26 files changed, 25 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
