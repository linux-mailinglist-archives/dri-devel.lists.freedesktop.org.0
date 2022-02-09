Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B04B07CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AB510E744;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A338610E38D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:11:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 813EA580194;
 Wed,  9 Feb 2022 07:00:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 09 Feb 2022 07:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=k/14lupStqZ3f+
 qyVcVh73Hc4Y8P8+3tsS/s0bTopnA=; b=tMF6Ms7pA4NERuAW03cQdv9rTiWtwZ
 VrkX8GlNLI1yfrscquXOTvEDHIOfVBGvxlgGr47Tkj8wOmRsCpEF/yFfWWqAfVVB
 QZTFisRec5R957W7xRrkjjJRd6R5WV7017CDRd5toiUZGvumM9Tre6m8fwVB/ZdF
 cbRtNeoDCHRgl0gJ4+vu9xa2OIYUCGxrQHcsWnfquL6Cw+xXWpTv8BPT2isWzbkg
 WkUQmdWp0WxddEo2+Y76t2D90Y0EtSsUrxNawho+cBe1qIkvofaNGS5jO6KPLkyD
 qyzVwCUapi2XbpL91GW3rJijAUf70Rcmkx8TRjxcPlFuBU79V+bPdOLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=k/14lupStqZ3f+qyVcVh73Hc4Y8P8+3tsS/s0bTop
 nA=; b=fZNmxAWMJIJSDWxtWT9oIWmcBK2IT9sUrQdVkNUfUe5cnQsLHjLbCsw31
 oP1WP+06tEnGJkcPTR7VpPPdvxvDUh0dr0Djt+0G1mFnoXCyu6R857FMm5l2DsUr
 4uPf2dy7P97HTQG7WVuIwQ5lCVnBnFwyxoY8P84NdEVATOa7uvfzBgqVH2lyW6v3
 TW1/44RBULdIQrGKcgPurBC2bSbwq8mYM/Q+Zvd2CFnVH+czIIKRDOuRbYAE34JP
 VLGrtUOm/tOi+XbUnKSlnbOvOnDClX77MDzp0JZAaFyZvsgxXK1n9JdG5dGhL11A
 ZkXs8TkdL3HmPdHpWXDmT614mvKfw==
X-ME-Sender: <xms:9KwDYp08JqwKs58hfWVfV9eOnIfs0IN0SAWIMNfB4oxpDXhIcA08pw>
 <xme:9KwDYgH5bvUXx1Eh_dyfTf6_DAyYwyKI4dW1k1Lu3pKUglLmiMJWn2cjUHYrNo27Y
 My8TW-FpLv1ebjafac>
X-ME-Received: <xmr:9KwDYp5DQ5aGQ0jfh3Y86J2XbmHjIW3wif28O6zrv8R7Rgde056XXgln0JCGxJ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefkffggfgfuvfhfhfgjtgfg
 sehtkeertddtfeejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrd
 ihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepleffgeeiiedt
 gfevieeuudetgedtkefhudefudeihedtiedthfffheeufeeljedvnecuffhomhgrihhnpe
 guvggsihgrnhdrohhrghdpghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
 htrdgtohhm
X-ME-Proxy: <xmx:9awDYm0q7wcKzutDRKp4YzrpOb8_PcTBEekPUP9dk3nh4EfRAQMQow>
 <xmx:9awDYsHCsh80ok8fGMmYmOZbu7P7TWB3pNYpyf4or3vn6sn2DDvqsw>
 <xmx:9awDYn_u6ILecuNazwXVi5xeiCkN3p9JcCsgv9-asy8zyOvf89Pb5A>
 <xmx:9qwDYq9zbks952R0HB6S4OFI4mb4ecc8fI-nhIsOT2wooYFepTQ4_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 07:00:50 -0500 (EST)
Message-ID: <d2e26781-4cef-696d-f7c8-88bb4b71fd87@flygoat.com>
Date: Wed, 9 Feb 2022 12:00:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 0/3] drm/lsdc: add drm driver for loongson display
 controller
To: Sui Jingfeng <15330273260@189.cn>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Roland Scheidegger <sroland@vmware.com>,
 Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng <suijingfeng@loongson.cn>
References: <20220203082546.3099-1-15330273260@189.cn>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220203082546.3099-1-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

Could you please keep me CCed for the for the whole thread when you respin
the patch? Cuz I'm maintain MIPS/LOONGSON64 stuff and I believe this series
is partially based on my work at Lemote.

I will help with reviewing and explain some Loongson64 specified issue 
if possible.

Thanks.
- Jiaxun

在 2022/2/3 8:25, Sui Jingfeng 写道:
> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> bridge, and the DC in those chip is a PCI device. This patch provide
> a minimal support for this display controller which is mainly for
> graphic environment bring up.
>
> This display controller has two display pipes but with only one hardware
> cursor. Each way has a DVO output interface and the CRTC is able to scanout
> from 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048@60hz.
>
> LS2K1000 is a SoC, only system memory is available. Therefore scanout from
> system memory is the only choice. We prefer the CMA helper base solution
> because the gc1000 gpu can use etnaviv driver, in this case etnaviv and
> lsdc could made a compatible pair. Even through it is possible to use VRAM
> helper base solution on ls2k1000 by carving out part of system memory as
> VRAM.
>
> For LS7A1000, there are 4 gpios whos control register is located at the dc
> register space which is not the geneal purpose GPIO. The 4 gpios can emulate
> two way i2c. One for DVO0, another for DVO1. This is the reason the why we
> are not using the drm bridge framework.
>
> LS2K1000 and LS2K0500 SoC don't have such hardware, they use general purpose
> GPIO emulated i2c or hardware i2c adapter from other module to serve this
> purpose. Drm bridge and drm panel is suitable for those SoC, we have already
> implement it on our own downstream kernel. But due to the upstream kernel
> don't have gpio, pwm and i2c driver support for LS2K1000. We just can not
> upstream our support for the drm bridge subsystem.
>
> The DC in LS7A1000 can scanout from both the system memory and the dedicate
> VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
> VRAM is proved to be a reliable solution for massive product. Scanout from
> the system memory suffer from some hardware deficiency which cause the
> screen flickering under RAM pressure. This is the reason why we integrate
> two distict helpers into one piece of device driver. But CMA base helper is
> still usable on ls7a1000 for normal usage, expecially on ls7a1000+ bridge
> chip. We have also implemented demage update on top of CMA helper which
> copy the demaged shadow framebuffer region from system RAM to the real
> framebuffer in VRAM manually. Using "lsdc.dirty_update=1" in the commmand
> line will enable this driver mode.
>
> LS7A1000 have a 32x32 harware cursor, we just let the two CRTC share it
> simply with the help of universe plane. LS7A2000 have two 64x64 harware
> cursor. Surport for LS7A2000 is on the way.
>
> In short, we have built-in gpio emulated i2c support, we also have hardware
> cursor support. The kind of tiny drivers in drm/tiny is not suitable for us,
> we are not "tiny".
>
>      +------+  HyperTransport 3.0
>      | DDR4 |       |
>      +------+       |     +------------------------------------+
>         || MC0      |     |   LS7A1000            +------------|
>    +----------+     |     |                       |    DDR3    |   +------+
>    | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
>    |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
>    +----------+           | +--------+  +-+---+-+ +------------|
>         || MC1            +---------------|---|----------------+
>      +------+                             |   |
>      | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
>      +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
>                        +-------+                       +------+
>
> The above picture give a simple usage of LS7A1000, note that the encoder
> is not necessary adv7125 or tfp410, it is a choice of the downstream board
> manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
> etc. Therefore, we need device tree to provide board specific information.
> Besides, the dc in both ls2k1000 and ls7k1000 have the vendor:device id of
> 0x0014:0x7a06, the reverison id is also same. We can't tell it apart simply
> (this is the firmware engineer's mistake). But firmware already flushed to
> the board and borad already sold out, we choose to resolve those issues by
> introduing device tree with board specific device support.
>
> For lsdc, there is only a 1:1 mapping of encoders and connectors.
>
>       +-------------------+                                      _________
>       |                   |                                     |         |
>       |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monitor |
>       |                   |           ^            ^            |_________|
>       |                   |           |            |
>       |                <----- i2c0 ----------------+
>       |   LSDC IP CORE    |
>       |                <----- i2c1 ----------------+
>       |                   |           |            |             _________
>       |                   |           |            |            |         |
>       |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
>       |                   |                                     |_________|
>       +-------------------+
>
> Below is a brief introduction of loongson's CPU, bridge chip and SoC.
> LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
> a bridge chip made by Loongson corporation which act as north and/or south
> bridge of loongson's desktop and server level processor. It is equivalent
> to AMD RS780E+SB710 or something like that. More details can be read from
> its user manual[2].
>
> This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
> LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
> LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
> LS3A5000 is 4 core 2.5gHz loongarch cpu[3].
>
> Nearly all mordern loongson CPU's cache coherency is maintained by hardware,
> except for early version of ls2k1000. So we using cached coherent memory by
> default, not writecombine.
>
> v2: fixup warnings reported by kernel test robot
>
> v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>      more details about lsdc.
>
> v4:
>     1) Add dts required and explain why device tree is required.
>     2) Give more description about lsdc and vram helper base driver.
>     3) Fix warnings reported by kernel test robot.
>     4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>        stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500 SoC.
>        But ls7a2000 improve it to 32 bytes, We are prepare for extend the
>        support for the on coming device.
>
> v5:
>     1) using writel and readl replace writeq and readq, to fix kernel test
>        robot report build error on other archtecture
>     2) set default fb format to XRGB8888 at crtc reset time.
>     3) fix typos.
>
> v6:
>     1) Explain why we are not switch to drm dridge subsystem.
>     2) Explain why tiny drm driver is not suitable for us.
>     3) Give a short description of the trival dirty uppdate implement based
>        on CMA helper.
>     4) code clean up.
>
> [1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
> [2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
> [3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>
> suijingfeng (3):
>    drm/lsdc: add drm driver for loongson display controller
>    dt-bindings: ls2k1000: add the display controller device node
>    dt-bindings: mips: loongson: introduce board specific dts
>
>   arch/mips/boot/dts/loongson/lemote_a1901.dts  |  64 ++
>   .../boot/dts/loongson/loongson64-2k1000.dtsi  |  11 +
>   .../boot/dts/loongson/ls3a4000_7a1000_evb.dts |  68 ++
>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   2 +-
>   drivers/gpu/drm/Kconfig                       |   2 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/lsdc/Kconfig                  |  38 +
>   drivers/gpu/drm/lsdc/Makefile                 |  15 +
>   drivers/gpu/drm/lsdc/lsdc_connector.c         | 443 +++++++++
>   drivers/gpu/drm/lsdc/lsdc_connector.h         |  60 ++
>   drivers/gpu/drm/lsdc/lsdc_crtc.c              | 440 +++++++++
>   drivers/gpu/drm/lsdc/lsdc_drv.c               | 846 ++++++++++++++++++
>   drivers/gpu/drm/lsdc/lsdc_drv.h               | 216 +++++
>   drivers/gpu/drm/lsdc/lsdc_encoder.c           |  79 ++
>   drivers/gpu/drm/lsdc/lsdc_i2c.c               | 220 +++++
>   drivers/gpu/drm/lsdc/lsdc_i2c.h               |  61 ++
>   drivers/gpu/drm/lsdc/lsdc_irq.c               |  77 ++
>   drivers/gpu/drm/lsdc/lsdc_irq.h               |  37 +
>   drivers/gpu/drm/lsdc/lsdc_plane.c             | 681 ++++++++++++++
>   drivers/gpu/drm/lsdc/lsdc_pll.c               | 657 ++++++++++++++
>   drivers/gpu/drm/lsdc/lsdc_pll.h               | 109 +++
>   drivers/gpu/drm/lsdc/lsdc_regs.h              | 246 +++++
>   22 files changed, 4372 insertions(+), 1 deletion(-)
>   create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>   create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>   create mode 100644 drivers/gpu/drm/lsdc/Makefile
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.h
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_encoder.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
>

