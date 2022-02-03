Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD864A80C3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE910E40A;
	Thu,  3 Feb 2022 08:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8610E40A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:58:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 117A8580290;
 Thu,  3 Feb 2022 03:58:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Feb 2022 03:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=gddeGMwd5HvIY97QboZsBEVQ7qY+HtThTvqM3w
 j7VBQ=; b=eMcvgoBO38Zyz8D+vVfbhwgRP/koxNeNUVSWWR0oufJUWOZJ+T95U6
 ZQR7dLuzXo0BYfnYYpQn7U5SRbI70V51kOVlA71JfkekHYBod1kVud+bi4w5xknI
 UqGDd8SyaHodu4KtnDM5riDXLEM9qOD8OOQ07e2Cpbd9863lIMz/B6UrKmRgZmkc
 F64S5aH6O8mxeRaZFdfyVVsZr19SUzBP5bNZloF1DfCR0Jsd3yBOccgDQCRdulo9
 6bu6bJ+MkPieiNp8TdN6qt0BVYMwo4YO2UCffiAIq7k9RxZ0Bsz1KBnU0b7LF8t7
 WGpJaVp/716+o3kkBMntvVjYQ0ouPqdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gddeGMwd5HvIY97Qb
 oZsBEVQ7qY+HtThTvqM3wj7VBQ=; b=I+3Tllpd7NGNwcLugopFECVcrRvmZ6mDj
 CTrG9rcxe9vEjwLYSIdTsntPVcvwXYahB92FxqbWOXgL3KtYxYQehzAG/BibnoZT
 ojDO+2nNLV/7zn8tRwhzpEPmlP5gVMzmpFvhut5jUG2HBC8dZBDEKANt9fPb37P3
 DTsGcfm8IbfFkFAjgLzFjsIDols+opxYBDFOXtFJOUhDw5BRqUQK+SV3vvSP9g8s
 OjlxoGXfiyO5X4PfMyo5TFTmLm4VHNWl2XLNBE9aN3OnzRfsW0rvVeTG6bDn+H95
 jJiv6cwUukjlPWzYC6DgggNHYUc8D2fd/OzPSCXPM0EWxIFaDtCQA==
X-ME-Sender: <xms:Tpn7YVv4r0T6chzvRM9ehViGhUQfwUJbp9R8mWU0IInKdERAFn-jgQ>
 <xme:Tpn7Yeec6H1kElKjxKFiAfuYnGTfViPO5O6kOVdBmWIgoCUP2-NoLt-Ty1dBqLt73
 B625a3I7e52FlsQDRQ>
X-ME-Received: <xmr:Tpn7YYywVocTztwvtocIUY__NIOwpO57t1YxUV-Ymr3L_5aYpj62IWlNamsV1KLRO4kXTPm4Y8jFJIQXFqEl3y-z0FGSXZpFwHtygK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtuggj
 sehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimh
 gvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepgefgudeigeefkefhffff
 vedutedugeegudduleetueetudeffeettefhgeejjeelnecuffhomhgrihhnpeguvggsih
 grnhdrohhrghdpghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Tpn7YcNfevCSpP3ON007tonUaLJ92EcLkQRfeo6ncLyJ0Xb2FZqAdg>
 <xmx:Tpn7YV-8K_StNyy9Xs5sW1_Uxpx52W_-OAtnV0WVZKFchD-POn2PKQ>
 <xmx:Tpn7YcUqV8zeelIRnp3TlvS7A65kSapLF8Ey4HS_RHw_JDlrBtFzNg>
 <xmx:UJn7Yai1ZjjOjbw2sulVq7QemwT9xc4XkeAPnjNhYEqeu5yt_hABwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 03:58:53 -0500 (EST)
Date: Thu, 3 Feb 2022 09:58:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220203085851.yqstkfgt4dz7rcnw@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pho5irsonjgn67rj"
Content-Disposition: inline
In-Reply-To: <20220203082546.3099-2-15330273260@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pho5irsonjgn67rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 03, 2022 at 04:25:44PM +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
>=20
> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> bridge, and the DC in those chip is a PCI device. This patch provide
> a minimal support for this display controller which is mainly for
> graphic environment bring up.
>=20
> This display controller has two display pipes but with only one hardware
> cursor. Each way has a DVO output interface and the CRTC is able to scano=
ut
> from 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048@60=
hz.
>=20
> LS2K1000 is a SoC, only system memory is available. Therefore scanout from
> system memory is the only choice. We prefer the CMA helper base solution
> because the gc1000 gpu can use etnaviv driver, in this case etnaviv and
> lsdc could made a compatible pair. Even through it is possible to use VRAM
> helper base solution on ls2k1000 by carving out part of system memory as
> VRAM.
>=20
> For LS7A1000, there are 4 gpios whos control register is located at the dc
> register space which is not the geneal purpose GPIO. The 4 gpios can emul=
ate
> two way i2c. One for DVO0, another for DVO1. This is the reason the why we
> are not using the drm bridge framework.
>=20
> LS2K1000 and LS2K0500 SoC don't have such hardware, they use general purp=
ose
> GPIO emulated i2c or hardware i2c adapter from other module to serve this
> purpose. Drm bridge and drm panel is suitable for those SoC, we have alre=
ady
> implement it on our own downstream kernel. But due to the upstream kernel
> don't have gpio, pwm and i2c driver support for LS2K1000. We just can not
> upstream our support for the drm bridge subsystem.
>=20
> The DC in LS7A1000 can scanout from both the system memory and the dedica=
te
> VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
> VRAM is proved to be a reliable solution for massive product. Scanout from
> the system memory suffer from some hardware deficiency which cause the
> screen flickering under RAM pressure. This is the reason why we integrate
> two distict helpers into one piece of device driver. But CMA base helper =
is
> still usable on ls7a1000 for normal usage, expecially on ls7a1000+ bridge
> chip. We have also implemented demage update on top of CMA helper which
> copy the demaged shadow framebuffer region from system RAM to the real
> framebuffer in VRAM manually. Using "lsdc.dirty_update=3D1" in the commma=
nd
> line will enable this driver mode.
>=20
> LS7A1000 have a 32x32 harware cursor, we just let the two CRTC share it
> simply with the help of universe plane. LS7A2000 have two 64x64 harware
> cursor. Surport for LS7A2000 is on the way.
>=20
> In short, we have built-in gpio emulated i2c support, we also have hardwa=
re
> cursor support. The kind of tiny drivers in drm/tiny is not suitable for =
us,
> we are not "tiny".
>=20
>     +------+  HyperTransport 3.0
>     | DDR4 |       |
>     +------+       |     +------------------------------------+
>        || MC0      |     |   LS7A1000            +------------|
>   +----------+     |     |                       |    DDR3    |   +------+
>   | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
>   |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
>   +----------+           | +--------+  +-+---+-+ +------------|
>        || MC1            +---------------|---|----------------+
>     +------+                             |   |
>     | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
>     +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
>                       +-------+                       +------+
>=20
> The above picture give a simple usage of LS7A1000, note that the encoder
> is not necessary adv7125 or tfp410, it is a choice of the downstream board
> manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
> etc. Therefore, we need device tree to provide board specific information.
> Besides, the dc in both ls2k1000 and ls7k1000 have the vendor:device id of
> 0x0014:0x7a06, the reverison id is also same. We can't tell it apart simp=
ly
> (this is the firmware engineer's mistake). But firmware already flushed to
> the board and borad already sold out, we choose to resolve those issues by
> introduing device tree with board specific device support.
>=20
> For lsdc, there is only a 1:1 mapping of encoders and connectors.
>=20
>      +-------------------+                                      _________
>      |                   |                                     |         |
>      |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monitor |
>      |                   |           ^            ^            |_________|
>      |                   |           |            |
>      |                <----- i2c0 ----------------+
>      |   LSDC IP CORE    |
>      |                <----- i2c1 ----------------+
>      |                   |           |            |             _________
>      |                   |           |            |            |         |
>      |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
>      |                   |                                     |_________|
>      +-------------------+
>=20
> Below is a brief introduction of loongson's CPU, bridge chip and SoC.
> LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
> a bridge chip made by Loongson corporation which act as north and/or south
> bridge of loongson's desktop and server level processor. It is equivalent
> to AMD RS780E+SB710 or something like that. More details can be read from
> its user manual[2].
>=20
> This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cp=
u.
> LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
> LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
> LS3A5000 is 4 core 2.5gHz loongarch cpu[3].
>=20
> Nearly all mordern loongson CPU's cache coherency is maintained by hardwa=
re,
> except for early version of ls2k1000. So we using cached coherent memory =
by
> default, not writecombine.
>=20
> v2: fixup warnings reported by kernel test robot
>=20
> v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>     more details about lsdc.
>=20
> v4:
>    1) Add dts required and explain why device tree is required.
>    2) Give more description about lsdc and vram helper base driver.
>    3) Fix warnings reported by kernel test robot.
>    4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>       stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500 S=
oC.
>       But ls7a2000 improve it to 32 bytes, We are prepare for extend the
>       support for the on coming device.
>=20
> v5:
>    1) using writel and readl replace writeq and readq, to fix kernel test
>       robot report build error on other archtecture
>    2) set default fb format to XRGB8888 at crtc reset time.
>    3) fix typos.
>=20
> v6:
>    1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
>    2) Explain why tiny drm driver is not suitable for us.
>    3) Give a short description of the trival dirty uppdate implement based
>       on CMA helper.
>    4) code clean up
>=20
> [1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
> [2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-us=
ermanual-EN.html
> [3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-us=
ermanual-EN.html
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  drivers/gpu/drm/Kconfig               |   2 +
>  drivers/gpu/drm/Makefile              |   1 +
>  drivers/gpu/drm/lsdc/Kconfig          |  38 ++
>  drivers/gpu/drm/lsdc/Makefile         |  15 +
>  drivers/gpu/drm/lsdc/lsdc_connector.c | 443 ++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_connector.h |  60 ++
>  drivers/gpu/drm/lsdc/lsdc_crtc.c      | 440 ++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_drv.c       | 846 ++++++++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_drv.h       | 216 +++++++
>  drivers/gpu/drm/lsdc/lsdc_encoder.c   |  79 +++
>  drivers/gpu/drm/lsdc/lsdc_i2c.c       | 220 +++++++
>  drivers/gpu/drm/lsdc/lsdc_i2c.h       |  61 ++
>  drivers/gpu/drm/lsdc/lsdc_irq.c       |  77 +++
>  drivers/gpu/drm/lsdc/lsdc_irq.h       |  37 ++
>  drivers/gpu/drm/lsdc/lsdc_plane.c     | 681 +++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_pll.c       | 657 ++++++++++++++++++++
>  drivers/gpu/drm/lsdc/lsdc_pll.h       | 109 ++++
>  drivers/gpu/drm/lsdc/lsdc_regs.h      | 246 ++++++++
>  18 files changed, 4228 insertions(+)
>  create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>  create mode 100644 drivers/gpu/drm/lsdc/Makefile
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_encoder.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>  create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dfdd3ec5f793..18de1485e2ed 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -405,6 +405,8 @@ source "drivers/gpu/drm/gud/Kconfig"
> =20
>  source "drivers/gpu/drm/sprd/Kconfig"
> =20
> +source "drivers/gpu/drm/lsdc/Kconfig"
> +
>  config DRM_HYPERV
>  	tristate "DRM Support for Hyper-V synthetic video device"
>  	depends on DRM && PCI && MMU && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8675c2af7ae1..2c5a76ced323 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -133,3 +133,4 @@ obj-y			+=3D xlnx/
>  obj-y			+=3D gud/
>  obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> +obj-$(CONFIG_DRM_LSDC) +=3D lsdc/
> diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
> new file mode 100644
> index 000000000000..7ed1b0fdbe1b
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/Kconfig
> @@ -0,0 +1,38 @@
> +config DRM_LSDC
> +	tristate "DRM Support for loongson's display controller"
> +	depends on DRM && PCI
> +	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
> +	select OF
> +	select CMA if HAVE_DMA_CONTIGUOUS
> +	select DMA_CMA if HAVE_DMA_CONTIGUOUS
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_FB_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	select BACKLIGHT_PWM if CPU_LOONGSON2K
> +	select I2C_GPIO if CPU_LOONGSON2K
> +	select I2C_LS2X if CPU_LOONGSON2K
> +	default m
> +	help
> +	  This is a KMS driver for the display controller in the LS7A1000
> +	  bridge chip and LS2K1000 SoC. The display controller has two
> +	  display pipes and it is a PCI device.
> +	  When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
> +	  is located at system memory.
> +	  If "M" is selected, the module will be called lsdc.
> +
> +	  If in doubt, say "Y".
> +
> +config DRM_LSDC_VRAM_DRIVER
> +	bool "vram helper based device driver support"
> +	depends on DRM_LSDC
> +	select DRM_VRAM_HELPER
> +	default y
> +	help
> +	  When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
> +	  platform, the LS7A1000 bridge chip has dedicated video RAM. Using
> +	  "lsdc.use_vram_helper=3D1" in the kernel command line will enable
> +	  this driver mode and then the framebuffer will be located at the
> +	  VRAM at the price of losing PRIME support.
> +
> +	  If in doubt, say "Y".

This doesn't sound right. The driver should make the proper decision
depending on the platform, not the user or the distribution.

> diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
> new file mode 100644
> index 000000000000..342990654478
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/Makefile
> @@ -0,0 +1,15 @@
> +#
> +# Makefile for the lsdc drm device driver.
> +#
> +
> +lsdc-y :=3D \
> +	lsdc_drv.o \
> +	lsdc_crtc.o \
> +	lsdc_irq.o \
> +	lsdc_plane.o \
> +	lsdc_pll.o \
> +	lsdc_i2c.o \
> +	lsdc_encoder.o \
> +	lsdc_connector.o
> +
> +obj-$(CONFIG_DRM_LSDC) +=3D lsdc.o
> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc=
/lsdc_connector.c
> new file mode 100644
> index 000000000000..ae5fc0c90961
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */

That's the MIT license, yet you claim the driver to be licensed under
the GPLv2 or later?

> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_connector.h>
> +
> +#include <video/videomode.h>
> +#include <video/of_display_timing.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_i2c.h"
> +#include "lsdc_connector.h"
> +
> +
> +static int lsdc_get_modes_from_edid(struct drm_connector *connector)
> +{
> +	struct drm_device *ddev =3D connector->dev;
> +	struct lsdc_connector *lconn =3D to_lsdc_connector(connector);
> +	struct edid *edid_p =3D (struct edid *)lconn->edid_data;
> +	int num =3D drm_add_edid_modes(connector, edid_p);
> +
> +	if (num)
> +		drm_connector_update_edid_property(connector, edid_p);
> +
> +	drm_dbg_kms(ddev, "%d modes added\n", num);
> +
> +	return num;
> +}
> +
> +
> +static int lsdc_get_modes_from_timings(struct drm_connector *connector)
> +{
> +	struct drm_device *ddev =3D connector->dev;
> +	struct lsdc_connector *lconn =3D to_lsdc_connector(connector);
> +	struct display_timings *disp_tim =3D lconn->disp_tim;
> +	unsigned int num =3D 0;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < disp_tim->num_timings; i++) {
> +		const struct display_timing *dt =3D disp_tim->timings[i];
> +		struct drm_display_mode *mode;
> +		struct videomode vm;
> +
> +		videomode_from_timing(dt, &vm);
> +		mode =3D drm_mode_create(ddev);
> +		if (!mode) {
> +			drm_err(ddev, "failed to add mode %ux%u\n",
> +					dt->hactive.typ, dt->vactive.typ);
> +			continue;
> +		}
> +
> +		drm_display_mode_from_videomode(&vm, mode);
> +
> +		mode->type |=3D DRM_MODE_TYPE_DRIVER;
> +
> +		if (i =3D=3D disp_tim->native_mode)
> +			mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> +
> +		drm_mode_probed_add(connector, mode);
> +		num++;
> +	}
> +
> +	drm_dbg_kms(ddev, "%d modes added\n", num);
> +
> +	return num;
> +}
> +
> +
> +static int lsdc_get_modes_from_ddc(struct drm_connector *connector,
> +				   struct i2c_adapter *ddc)
> +{
> +	unsigned int num =3D 0;
> +	struct edid *edid;
> +
> +	edid =3D drm_get_edid(connector, ddc);
> +	if (edid) {
> +		drm_connector_update_edid_property(connector, edid);
> +		num =3D drm_add_edid_modes(connector, edid);
> +		kfree(edid);
> +	}
> +
> +	return num;
> +}
> +
> +
> +static int lsdc_get_modes(struct drm_connector *connector)
> +{
> +	struct lsdc_connector *lconn =3D to_lsdc_connector(connector);
> +	unsigned int num =3D 0;
> +
> +	if (lconn->has_edid)
> +		return lsdc_get_modes_from_edid(connector);
> +
> +	if (lconn->has_disp_tim)
> +		return lsdc_get_modes_from_timings(connector);
> +
> +	if (IS_ERR_OR_NULL(lconn->ddc) =3D=3D false)
> +		return lsdc_get_modes_from_ddc(connector, lconn->ddc);
> +
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_VIRTUAL) {
> +		num =3D drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +
> +		drm_set_preferred_mode(connector, 1024, 768);
> +
> +		return num;
> +	}
> +
> +
> +	/*
> +	 * In case we cannot retrieve the EDIDs (broken or missing i2c
> +	 * bus), fallback on the XGA standards, because we are for board
> +	 * bringup.
> +	 */
> +	num =3D drm_add_modes_noedid(connector, 1920, 1200);
> +
> +	/* And prefer a mode pretty much anyone can handle */
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +	return num;
> +
> +}
> +
> +
> +static enum drm_connector_status
> +lsdc_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct lsdc_connector *lconn =3D to_lsdc_connector(connector);
> +
> +	if (lconn->has_edid =3D=3D true)
> +		return connector_status_connected;
> +
> +	if (lconn->has_disp_tim =3D=3D true)
> +		return connector_status_connected;
> +
> +	if (IS_ERR_OR_NULL(lconn->ddc) =3D=3D false)
> +		return drm_probe_ddc(lconn->ddc);
> +
> +	if (lconn->ddc && drm_probe_ddc(lconn->ddc))
> +		return connector_status_connected;
> +
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_VIRTUAL)
> +		return connector_status_connected;
> +
> +	if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DVIA) ||
> +	    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DVID) ||
> +	    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DVII))
> +		return connector_status_disconnected;
> +
> +	if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) ||
> +	    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> +		return connector_status_disconnected;
> +
> +	return connector_status_unknown;
> +}
> +
> +
> +/*
> + * @connector: point to the drm_connector structure
> + *
> + * Clean up connector resources
> + */
> +static void lsdc_connector_destroy(struct drm_connector *connector)
> +{
> +	struct drm_device *ddev =3D connector->dev;
> +	struct lsdc_connector *lconn =3D to_lsdc_connector(connector);
> +
> +	if (lconn) {
> +		if (lconn->ddc)
> +			lsdc_destroy_i2c(connector->dev, lconn->ddc);
> +
> +		drm_info(ddev, "destroying connector%u\n", lconn->index);
> +
> +		devm_kfree(ddev->dev, lconn);
> +	}
> +
> +	drm_connector_cleanup(connector);
> +}
> +
> +
> +static const struct drm_connector_helper_funcs lsdc_connector_helpers =
=3D {
> +	.get_modes =3D lsdc_get_modes,
> +};
> +
> +/*
> + * These provide the minimum set of functions required to handle a conne=
ctor
> + *
> + * Control connectors on a given device.
> + *
> + * Each CRTC may have one or more connectors attached to it.
> + * The functions below allow the core DRM code to control
> + * connectors, enumerate available modes, etc.
> + */
> +static const struct drm_connector_funcs lsdc_connector_funcs =3D {
> +	.dpms =3D drm_helper_connector_dpms,
> +	.detect =3D lsdc_connector_detect,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D lsdc_connector_destroy,
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +
> +/* Get the simple EDID data from the device tree
> + * the length must be EDID_LENGTH, since it is simple.
> + *
> + * @np: device node contain edid data
> + * @edid_data: where the edid data to store to
> + */
> +static bool lsdc_get_edid_from_dtb(struct device_node *np,
> +				   unsigned char *edid_data)
> +{
> +	int length;
> +	const void *prop;
> +
> +	if (np =3D=3D NULL)
> +		return false;
> +
> +	prop =3D of_get_property(np, "edid", &length);
> +	if (prop && (length =3D=3D EDID_LENGTH)) {
> +		memcpy(edid_data, prop, EDID_LENGTH);
> +		return true;
> +	}
> +
> +	return false;
> +}

You don't have a device tree binding for that driver, this is something
that is required. And it's not clear to me why you'd want EDID in the
DTB?

> +
> +/* Get display timings from the device tree
> + *
> + * @np: device node contain the display timings
> + * @pptim: point to where the pointer of struct display_timings store to
> + */
> +static void lsdc_get_display_timings_from_dtb(struct device_node *np,
> +					      struct display_timings **pptim)
> +{
> +	struct display_timings *timings;
> +
> +	if (np =3D=3D NULL)
> +		return;
> +
> +	timings =3D of_get_display_timings(np);
> +	if (timings)
> +		*pptim =3D timings;
> +}
> +
> +
> +static int lsdc_get_connector_type(struct drm_device *ddev,
> +				   struct device_node *output,
> +				   unsigned int index)
> +{
> +	const char *name;
> +	int ret;
> +
> +	ret =3D of_property_read_string(output, "connector", &name);
> +	if (ret < 0)
> +		return DRM_MODE_CONNECTOR_Unknown;
> +
> +	if (strncmp(name, "vga-connector", 13) =3D=3D 0) {
> +		ret =3D DRM_MODE_CONNECTOR_VGA;
> +		drm_info(ddev, "connector%d is VGA\n", index);
> +	} else if (strncmp(name, "dvi-connector", 13) =3D=3D 0) {
> +		bool analog, digital;
> +
> +		analog =3D of_property_read_bool(output, "analog");
> +		digital =3D of_property_read_bool(output, "digital");
> +
> +		if (analog && !digital)
> +			ret =3D DRM_MODE_CONNECTOR_DVIA;
> +		else if (analog && digital)
> +			ret =3D DRM_MODE_CONNECTOR_DVII;
> +		else
> +			ret =3D DRM_MODE_CONNECTOR_DVID;
> +
> +		drm_info(ddev, "connector%d is DVI\n", index);
> +	} else if (strncmp(name, "virtual-connector", 17) =3D=3D 0) {
> +		ret =3D DRM_MODE_CONNECTOR_VIRTUAL;
> +		drm_info(ddev, "connector%d is virtual\n", index);
> +	} else if (strncmp(name, "dpi-connector", 13) =3D=3D 0) {
> +		ret =3D DRM_MODE_CONNECTOR_DPI;
> +		drm_info(ddev, "connector%d is DPI\n", index);
> +	} else if (strncmp(name, "hdmi-connector", 14) =3D=3D 0) {
> +		int res;
> +		const char *hdmi_type;
> +
> +		res =3D of_property_read_string(output, "type", &hdmi_type);
> +		if (res =3D=3D 0) {
> +			if (!strcmp(hdmi_type, "b"))
> +				ret =3D DRM_MODE_CONNECTOR_HDMIB;
> +			else
> +				ret =3D DRM_MODE_CONNECTOR_HDMIA;
> +		} else
> +			ret =3D DRM_MODE_CONNECTOR_HDMIA;
> +
> +		drm_info(ddev, "connector%d is HDMI, type is %s\n",
> +			index, hdmi_type);
> +	} else {
> +		ret =3D DRM_MODE_CONNECTOR_Unknown;
> +		drm_info(ddev, "The type of connector%d is unknown\n", index);
> +	}
> +
> +	return ret;
> +}
> +
> +
> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
> +					   unsigned int index)
> +{
> +	struct drm_device *ddev =3D &ldev->drm;
> +	struct device_node *np =3D ddev->dev->of_node;
> +	struct device_node *output =3D NULL;
> +	struct lsdc_connector *lconn;
> +	struct drm_connector *connector;
> +	bool available =3D false;
> +	unsigned int connector_type;
> +	int ret;
> +
> +	lconn =3D devm_kzalloc(ddev->dev, sizeof(*lconn), GFP_KERNEL);
> +	if (lconn =3D=3D NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	lconn->index =3D index;
> +
> +	output =3D of_parse_phandle(np, "output-ports", index);
> +	if (output) {
> +		struct device_node *disp_tims_np;
> +
> +		available =3D of_device_is_available(output);
> +
> +		if (available =3D=3D false) {
> +			drm_info(ddev, "connector%d is not available\n", index);
> +			of_node_put(output);
> +			return NULL;
> +		}
> +
> +		lconn->has_edid =3D of_property_read_bool(output, "edid");
> +		disp_tims_np =3D of_get_child_by_name(output, "display-timings");
> +		if (disp_tims_np) {
> +			of_node_put(disp_tims_np);
> +			lconn->has_disp_tim =3D true;
> +		} else
> +			lconn->has_disp_tim =3D false;
> +	} else
> +		drm_warn(ddev, "no output-ports property, please update dtb\n");
> +
> +	/*
> +	 * Providing a blindly support even through there is
> +	 * no output-ports property in the dtb.
> +	 */
> +	if (lconn->has_edid) {
> +		lsdc_get_edid_from_dtb(output, lconn->edid_data);
> +		drm_info(ddev, "connector%d provide edid\n", index);
> +	}
> +
> +	if (lconn->has_disp_tim) {
> +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
> +		drm_info(ddev, "connector%d provide display timings\n", index);
> +	}
> +
> +	connector_type =3D lsdc_get_connector_type(ddev, output, index);
> +
> +	if (output)
> +		of_node_put(output);
> +
> +	connector =3D &lconn->base;
> +
> +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_VIRTUAL)
> +		goto SKIPED_CREATE_DDC;
> +
> +	/* bypass the ddc creation if the edid or display timing is provided */
> +	if ((lconn->has_edid =3D=3D false) &&
> +	    (lconn->has_disp_tim =3D=3D false)) {
> +		const struct lsdc_chip_desc * const dc =3D ldev->desc;
> +
> +		if (dc->have_builtin_i2c)
> +			lconn->ddc =3D lsdc_create_i2c_chan(ddev, index);
> +		else
> +			lconn->ddc =3D lsdc_get_i2c_adapter(ddev, index);
> +
> +		if (lconn->ddc && (IS_ERR(lconn->ddc) =3D=3D false)) {
> +			drm_info(ddev, "i2c%d for connector%d created\n",
> +					i2c_adapter_id(lconn->ddc), index);
> +
> +		} else
> +			drm_warn(ddev, "Get i2c adapter failed: %ld\n",
> +					PTR_ERR(lconn->ddc));
> +	}
> +
> +	/* only pull if the connector have a ddc */
> +	connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> +			    DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +SKIPED_CREATE_DDC:
> +	ret =3D drm_connector_init_with_ddc(ddev,
> +					  connector,
> +					  &lsdc_connector_funcs,
> +					  connector_type,
> +					  lconn->ddc);
> +	if (ret) {
> +		drm_err(ddev, "init connector%d failed\n", index);
> +		goto err_i2c_destroy;
> +	}
> +
> +	drm_connector_helper_add(connector, &lsdc_connector_helpers);
> +
> +	return lconn;
> +
> +err_i2c_destroy:
> +	lsdc_destroy_i2c(ddev, lconn->ddc);
> +	return NULL;
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.h b/drivers/gpu/drm/lsdc=
/lsdc_connector.h
> new file mode 100644
> index 000000000000..e9f94a969f74
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +
> +#ifndef __LSDC_CONNECTOR_H__
> +#define __LSDC_CONNECTOR_H__
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_connector.h>
> +
> +struct lsdc_connector {
> +	struct drm_connector base;
> +
> +	struct i2c_adapter *ddc;
> +
> +	/* pass EDID from dtb support */
> +	unsigned char edid_data[EDID_LENGTH];
> +	bool has_edid;
> +
> +	/* pass display timmings from dtb support */
> +	struct display_timings *disp_tim;
> +	bool has_disp_tim;
> +
> +	int index;
> +};
> +
> +#define to_lsdc_connector(x)        \
> +		container_of(x, struct lsdc_connector, base)
> +
> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
> +					   unsigned int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c b/drivers/gpu/drm/lsdc/lsdc=
_crtc.c
> new file mode 100644
> index 000000000000..7531389f4896
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
> @@ -0,0 +1,440 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_drv.h>
> +
> +
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +
> +static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(crtc->dev);
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	struct drm_crtc_state *state =3D crtc->state;
> +	u32 val;
> +
> +	if (state->enable) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_INT_REG);
> +
> +		if (index =3D=3D 0)
> +			val |=3D INT_CRTC0_VS_EN;
> +		else if (index =3D=3D 1)
> +			val |=3D INT_CRTC1_VS_EN;
> +
> +		lsdc_reg_write32(ldev, LSDC_INT_REG, val);
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(crtc->dev);
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	u32 val;
> +
> +	val =3D lsdc_reg_read32(ldev, LSDC_INT_REG);
> +
> +	if (index =3D=3D 0)
> +		val &=3D ~INT_CRTC0_VS_EN;
> +	else if (index =3D=3D 1)
> +		val &=3D ~INT_CRTC1_VS_EN;
> +
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, val);
> +}
> +
> +
> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	struct lsdc_crtc_state *priv_crtc_state;
> +	u32 val;
> +
> +	/* The crtc get soft reset if bit 20 of CRTC*_CFG_REG
> +	 * is write with falling edge.
> +	 *
> +	 * Doing this to switch from soft reset state to working state
> +	 */
> +	if (index =3D=3D 0) {
> +		val =3D CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index =3D=3D 1) {
> +		val =3D CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +
> +
> +	if (crtc->state) {
> +		priv_crtc_state =3D to_lsdc_crtc_state(crtc->state);
> +		__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
> +		kfree(priv_crtc_state);
> +	}
> +
> +	priv_crtc_state =3D kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
> +	if (!priv_crtc_state)
> +		return;
> +
> +	priv_crtc_state->pix_fmt =3D val & CFG_PIX_FMT_MASK;
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->base);
> +
> +	drm_info(ddev, "crtc%u reset\n", index);
> +}
> +
> +
> +static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *state)
> +{
> +	struct lsdc_crtc_state *priv_crtc_state =3D to_lsdc_crtc_state(state);
> +
> +	__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
> +
> +	kfree(priv_crtc_state);
> +}
> +
> +
> +static struct drm_crtc_state *lsdc_crtc_atomic_duplicate_state(struct dr=
m_crtc *crtc)
> +{
> +	struct lsdc_crtc_state *new_priv_state;
> +	struct lsdc_crtc_state *old_priv_state;
> +	struct drm_device *ddev =3D crtc->dev;
> +
> +	if (drm_WARN_ON(ddev, !crtc->state))
> +		return NULL;
> +
> +	new_priv_state =3D kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
> +	if (!new_priv_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->base);
> +
> +	old_priv_state =3D to_lsdc_crtc_state(crtc->state);
> +
> +	memcpy(&new_priv_state->pparams, &old_priv_state->pparams,
> +		sizeof(new_priv_state->pparams));
> +
> +	new_priv_state->pix_fmt =3D old_priv_state->pix_fmt;
> +
> +	return &new_priv_state->base;
> +}
> +
> +
> +static const struct drm_crtc_funcs lsdc_crtc_funcs =3D {
> +	.reset =3D lsdc_crtc_reset,
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state =3D lsdc_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state =3D lsdc_crtc_atomic_destroy_state,
> +	.enable_vblank =3D lsdc_crtc_enable_vblank,
> +	.disable_vblank =3D lsdc_crtc_disable_vblank,
> +};
> +
> +
> +static enum drm_mode_status
> +lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	const struct lsdc_chip_desc *desc =3D ldev->desc;
> +
> +	if (mode->hdisplay > desc->max_width)
> +		return MODE_BAD_HVALUE;
> +	if (mode->vdisplay > desc->max_height)
> +		return MODE_BAD_VVALUE;
> +
> +	if (mode->clock > desc->max_pixel_clk) {
> +		drm_dbg_kms(ddev, "mode %dx%d, pixel clock=3D%d is too high\n",
> +				mode->hdisplay, mode->vdisplay, mode->clock);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	/* the crtc hardware dma take 256 bytes once a time
> +	 * TODO: check RGB565 support
> +	 */
> +	if ((mode->hdisplay * 4) % desc->stride_alignment) {
> +		drm_dbg_kms(ddev, "stride is not %u bytes aligned\n",
> +				desc->stride_alignment);
> +		return MODE_BAD;
> +	}
> +
> +	return MODE_OK;
> +}

mode_valid will only prevent the mode from being advertised to the
userspace, but you need atomic_check if you want to prevent those modes
to be used by anybody.

> +
> +static void lsdc_update_pixclk(struct drm_crtc *crtc, unsigned int pixcl=
k, bool verbose)
> +{
> +	struct lsdc_display_pipe *dispipe;
> +	struct lsdc_pll *pixpll;
> +	const struct lsdc_pixpll_funcs *clkfun;
> +	struct lsdc_crtc_state *priv_crtc_state;
> +
> +	priv_crtc_state =3D to_lsdc_crtc_state(crtc->state);
> +
> +	dispipe =3D container_of(crtc, struct lsdc_display_pipe, crtc);
> +	pixpll =3D &dispipe->pixpll;
> +	clkfun =3D pixpll->funcs;
> +
> +	/* config the pixel pll */
> +	clkfun->update(pixpll, &priv_crtc_state->pparams);
> +
> +	if (verbose)
> +		clkfun->print(pixpll, pixclk);
> +}
> +
> +
> +static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	unsigned int hr =3D mode->hdisplay;
> +	unsigned int hss =3D mode->hsync_start;
> +	unsigned int hse =3D mode->hsync_end;
> +	unsigned int hfl =3D mode->htotal;
> +	unsigned int vr =3D mode->vdisplay;
> +	unsigned int vss =3D mode->vsync_start;
> +	unsigned int vse =3D mode->vsync_end;
> +	unsigned int vfl =3D mode->vtotal;
> +	unsigned int pixclock =3D mode->clock;
> +	unsigned int index =3D drm_crtc_index(crtc);
> +
> +
> +	if (index =3D=3D 0) {
> +		/* CRTC 0 */
> +		u32 hsync, vsync;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_FB_ORIGIN_REG, 0);
> +
> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HDISPLAY_REG,
> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
> +
> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VDISPLAY_REG,
> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
> +
> +		/* 26:16 hsync end, 10:0 hsync start */
> +		hsync =3D (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
> +
> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +			hsync |=3D INV_HSYNC_BIT;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HSYNC_REG, EN_HSYNC_BIT | hsync);
> +
> +		/* 26:16 vsync end, 10:0 vsync start */
> +		vsync =3D (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
> +
> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +			vsync |=3D INV_VSYNC_BIT;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VSYNC_REG, EN_VSYNC_BIT | vsync);
> +
> +	} else if (index =3D=3D 1) {
> +		/* CRTC 1 */
> +		u32 hsync, vsync;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_FB_ORIGIN_REG, 0);
> +
> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HDISPLAY_REG,
> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
> +
> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VDISPLAY_REG,
> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
> +
> +		/* 26:16 hsync end, 10:0 hsync start */
> +		hsync =3D (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
> +
> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +			hsync |=3D INV_HSYNC_BIT;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HSYNC_REG, EN_HSYNC_BIT | hsync);
> +
> +		/* 26:16 vsync end, 10:0 vsync start */
> +		vsync =3D (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
> +
> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +			vsync |=3D INV_VSYNC_BIT;
> +
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VSYNC_REG, EN_VSYNC_BIT | vsync);
> +	}
> +
> +	drm_dbg_kms(ddev, "hdisplay=3D%d, hsync_start=3D%d, hsync_end=3D%d, hto=
tal=3D%d\n",
> +			hr, hss, hse, hfl);
> +
> +	drm_dbg_kms(ddev, "vdisplay=3D%d, vsync_start=3D%d, vsync_end=3D%d, vto=
tal=3D%d\n",
> +			vr, vss, vse, vfl);
> +
> +	drm_dbg_kms(ddev, "%s modeset: %ux%u\n", crtc->name, hr, vr);
> +
> +	lsdc_update_pixclk(crtc, pixclock, ldev->verbose);
> +}
> +
> +
> +static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int i=
ndex)
> +{
> +	u32 val;
> +
> +	if (index =3D=3D 0) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val |=3D CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index =3D=3D 1) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val |=3D CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +}
> +
> +
> +static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int =
index)
> +{
> +	u32 val;
> +
> +	if (index =3D=3D 0) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val &=3D ~CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index =3D=3D 1) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val &=3D ~CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +}
> +
> +
> +static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	lsdc_enable_display(ldev, drm_crtc_index(crtc));
> +
> +	drm_dbg_kms(ddev, "%s: enabled\n", crtc->name);
> +}
> +
> +
> +static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					    struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev =3D crtc->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lsdc_disable_display(ldev, drm_crtc_index(crtc));
> +
> +	drm_dbg_kms(ddev, "%s: disabled\n", crtc->name);
> +}
> +
> +
> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_pending_vblank_event *event =3D crtc->state->event;
> +
> +	if (event) {
> +		crtc->state->event =3D NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +
> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs =3D {
> +	.mode_valid =3D lsdc_crtc_helper_mode_valid,
> +	.mode_set_nofb =3D lsdc_crtc_helper_mode_set_nofb,
> +	.atomic_enable =3D lsdc_crtc_helper_atomic_enable,
> +	.atomic_disable =3D lsdc_crtc_helper_atomic_disable,
> +	.atomic_flush =3D lsdc_crtc_atomic_flush,
> +};
> +
> +
> +
> +/**
> + * lsdc_crtc_init
> + *
> + * @ddev: point to the drm_device structure
> + * @index: hardware crtc index
> + *
> + * Init CRTC
> + */
> +int lsdc_crtc_init(struct drm_device *ddev,
> +		   struct drm_crtc *crtc,
> +		   unsigned int index,
> +		   struct drm_plane *primary,
> +		   struct drm_plane *cursor)
> +{
> +	int ret;
> +
> +	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
> +
> +	ret =3D drm_mode_crtc_set_gamma_size(crtc, 256);
> +	if (ret)
> +		drm_warn(ddev, "set the gamma table size failed\n");
> +
> +	return drm_crtc_init_with_planes(ddev,
> +					 crtc,
> +					 primary,
> +					 cursor,
> +					 &lsdc_crtc_funcs,
> +					 "crtc%d",
> +					 index);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_=
drv.c
> new file mode 100644
> index 000000000000..aac8901c3431
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
> @@ -0,0 +1,846 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/of_reserved_mem.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_irq.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_connector.h"
> +#include "lsdc_pll.h"
> +
> +
> +#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
> +#define DRIVER_NAME		"lsdc"
> +#define DRIVER_DESC		"drm driver for loongson's display controller"
> +#define DRIVER_DATE		"20200701"
> +#define DRIVER_MAJOR		1
> +#define DRIVER_MINOR		0
> +#define DRIVER_PATCHLEVEL	0
> +
> +static int lsdc_modeset =3D 1;
> +MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 =3D enabled(de=
fault), 0 =3D disabled)");
> +module_param_named(modeset, lsdc_modeset, int, 0644);
> +
> +static int lsdc_cached_coherent =3D 1;
> +MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 =3D ena=
bled(default), 0 =3D disabled)");
> +module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
> +
> +static int lsdc_dirty_update =3D -1;
> +MODULE_PARM_DESC(dirty_update, "enable dirty update(1 =3D enabled, 0 =3D=
 disabled(default))");
> +module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
> +
> +static int lsdc_use_vram_helper =3D -1;
> +MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 =3D =
enabled, 0 =3D disabled(default))");
> +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
> +
> +static int lsdc_verbose =3D -1;
> +MODULE_PARM_DESC(verbose, "Enable/disable print some key information");
> +module_param_named(verbose, lsdc_verbose, int, 0644);

It's not really clear to me why you need any of those parameters. Why
would a user want to use a non coherent mapping for example?

> +
> +static const struct lsdc_chip_desc dc_in_ls2k1000 =3D {
> +	.chip =3D LSDC_CHIP_2K1000,
> +	.num_of_crtc =3D LSDC_MAX_CRTC,
> +	/* ls2k1000 user manual say the max pixel clock can be about 200MHz */
> +	.max_pixel_clk =3D 200000,
> +	.max_width =3D 2560,
> +	.max_height =3D 2048,
> +	.num_of_hw_cursor =3D 1,
> +	.hw_cursor_w =3D 32,
> +	.hw_cursor_h =3D 32,
> +	.have_builtin_i2c =3D false,
> +	.stride_alignment =3D 256,
> +};
> +
> +static const struct lsdc_chip_desc dc_in_ls2k0500 =3D {
> +	.chip =3D LSDC_CHIP_2K0500,
> +	.num_of_crtc =3D LSDC_MAX_CRTC,
> +	.max_pixel_clk =3D 200000,
> +	.max_width =3D 2048,
> +	.max_height =3D 2048,
> +	.num_of_hw_cursor =3D 1,
> +	.hw_cursor_w =3D 32,
> +	.hw_cursor_h =3D 32,
> +	.have_builtin_i2c =3D false,
> +	.stride_alignment =3D 256,
> +};
> +
> +static const struct lsdc_chip_desc dc_in_ls7a1000 =3D {
> +	.chip =3D LSDC_CHIP_7A1000,
> +	.num_of_crtc =3D LSDC_MAX_CRTC,
> +	.max_pixel_clk =3D 200000,
> +	.max_width =3D 2048,
> +	.max_height =3D 2048,
> +	.num_of_hw_cursor =3D 1,
> +	.hw_cursor_w =3D 32,
> +	.hw_cursor_h =3D 32,
> +	.have_builtin_i2c =3D true,
> +	.stride_alignment =3D 256,
> +};
> +
> +/*
> + * We need the device tree provided additional information to tell the DC
> + * in different chip apart.
> + */
> +static const struct of_device_id lsdc_drm_of_match[] =3D {
> +	{ .compatible =3D "loongson,loongson64c-4core-ls7a", .data =3D &dc_in_l=
s7a1000 },
> +	{ .compatible =3D "loongson,loongson64g-4core-ls7a", .data =3D &dc_in_l=
s7a1000 },
> +	{ .compatible =3D "loongson,loongson64-2core-2k1000", .data =3D &dc_in_=
ls2k1000 },
> +	{ .compatible =3D "loongson,loongson2k1000", .data =3D &dc_in_ls2k1000 =
},
> +	{ .compatible =3D "loongson,ls2k1000", .data =3D &dc_in_ls2k1000 },
> +	{ .compatible =3D "loongson,display-subsystem", .data =3D &dc_in_ls2k10=
00 },
> +	{ .compatible =3D "loongson,ls-fb", .data =3D &dc_in_ls2k1000 },
> +	{ .compatible =3D "loongson,loongson2k0500", .data =3D &dc_in_ls2k0500 =
},
> +	{ /* sentinel */ },
> +};
> +
> +
> +static struct drm_framebuffer *
> +lsdc_drm_gem_fb_create(struct drm_device *ddev, struct drm_file *file,
> +			  const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	if (ldev->dirty_update)
> +		return drm_gem_fb_create_with_dirty(ddev, file, mode_cmd);
> +
> +	return drm_gem_fb_create(ddev, file, mode_cmd);
> +}
> +
> +
> +static enum drm_mode_status lsdc_device_mode_valid(struct drm_device *dd=
ev,
> +					const struct drm_display_mode *mode)
> +{
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	if (ldev->use_vram_helper =3D=3D true)
> +		return drm_vram_helper_mode_valid(ddev, mode);
> +#endif
> +
> +	return MODE_OK;
> +}
> +
> +
> +static const struct drm_mode_config_funcs lsdc_mode_config_funcs =3D {
> +	.fb_create =3D lsdc_drm_gem_fb_create,
> +	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +	.mode_valid =3D lsdc_device_mode_valid,
> +};
> +
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int lsdc_show_pxlclock(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node =3D (struct drm_info_node *)m->private;
> +	struct drm_device *ddev =3D node->minor->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_crtc *crtc;
> +
> +	drm_for_each_crtc(crtc, ddev) {
> +		struct drm_crtc_state *state =3D crtc->state;
> +		int index =3D drm_crtc_index(crtc);
> +		struct lsdc_display_pipe *pipe =3D &ldev->disp_pipe[index];
> +		struct lsdc_pll *pixpll =3D &pipe->pixpll;
> +		const struct lsdc_pixpll_funcs *clkfun =3D pixpll->funcs;
> +		unsigned int clkrate =3D clkfun->get_clock_rate(pixpll);
> +		unsigned int mode_clock =3D crtc->mode.crtc_clock;
> +
> +		seq_printf(m, "\n");
> +		seq_printf(m, "CRTC%u, %s, %s\n", index,
> +				state->active ? "active" : "non-active",
> +				state->enable ? "enabled" : "disabled");
> +		seq_printf(m, "hw clock: %u kHz\n", clkrate);
> +		seq_printf(m, "mode: %u kHz\n", mode_clock);
> +
> +		seq_printf(m, "div_out=3D%u, loopc=3D%u, div_ref=3D%u\n",
> +				pixpll->core_params.div_out,
> +				pixpll->core_params.loopc,
> +				pixpll->core_params.div_ref);
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static int lsdc_mm_show(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
> +	struct drm_device *ddev =3D node->minor->dev;
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +	drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
> +	return 0;
> +}
> +
> +static struct drm_info_list lsdc_debugfs_list[] =3D {
> +	{ "clocks", lsdc_show_pxlclock, 0 },
> +	{ "mm",     lsdc_mm_show,   0, NULL },
> +};
> +
> +static void lsdc_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(lsdc_debugfs_list,
> +				 ARRAY_SIZE(lsdc_debugfs_list),
> +				 minor->debugfs_root,
> +				 minor);
> +}
> +#endif
> +
> +
> +static struct drm_gem_object *
> +lsdc_drm_gem_create_object(struct drm_device *ddev, size_t size)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_gem_cma_object *obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> +
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (ldev->cached_coherent)
> +		obj->map_noncoherent =3D true;
> +
> +	return &obj->base;
> +}
> +
> +
> +static int lsdc_gem_cma_dumb_create(struct drm_file *file,
> +				    struct drm_device *ddev,
> +				    struct drm_mode_create_dumb *args)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	const struct lsdc_chip_desc *desc =3D ldev->desc;
> +	unsigned int bytes_per_pixel =3D (args->bpp + 7) / 8;
> +	unsigned int pitch =3D bytes_per_pixel * args->width;
> +
> +	/*
> +	 * The dc in ls7a1000/ls2k1000/ls2k0500 require the stride be a
> +	 * multiple of 256 bytes, which is for sake of optimize dma data
> +	 * transfer.
> +	 */
> +	args->pitch =3D roundup(pitch, desc->stride_alignment);
> +
> +	return drm_gem_cma_dumb_create_internal(file, ddev, args);
> +}
> +
> +
> +DEFINE_DRM_GEM_CMA_FOPS(lsdc_drv_fops);
> +
> +
> +static const struct drm_driver lsdc_drm_driver_cma_stub =3D {
> +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +
> +	.lastclose =3D drm_fb_helper_lastclose,
> +	.fops =3D &lsdc_drv_fops,
> +	.gem_create_object =3D lsdc_drm_gem_create_object,
> +
> +	.name =3D DRIVER_NAME,
> +	.desc =3D DRIVER_DESC,
> +	.date =3D DRIVER_DATE,
> +	.major =3D DRIVER_MAJOR,
> +	.minor =3D DRIVER_MINOR,
> +	.patchlevel =3D DRIVER_PATCHLEVEL,
> +
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(lsdc_gem_cma_dumb_create),
> +
> +#ifdef CONFIG_DEBUG_FS
> +	.debugfs_init =3D lsdc_debugfs_init,
> +#endif
> +};
> +
> +
> +DEFINE_DRM_GEM_FOPS(lsdc_fops);
> +
> +
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +static const struct drm_driver lsdc_vram_driver_stub =3D {
> +	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops =3D &lsdc_fops,
> +
> +	.name =3D DRIVER_NAME,
> +	.desc =3D DRIVER_DESC,
> +	.date =3D DRIVER_DATE,
> +	.major =3D DRIVER_MAJOR,
> +	.minor =3D DRIVER_MINOR,
> +	.patchlevel =3D DRIVER_PATCHLEVEL,
> +
> +	DRM_GEM_VRAM_DRIVER,
> +};
> +#endif
> +
> +
> +static int lsdc_modeset_init(struct lsdc_device *ldev, const uint32_t nu=
m_crtc)
> +{
> +	struct drm_device *ddev =3D &ldev->drm;
> +	struct lsdc_display_pipe *dispipe;
> +	struct lsdc_connector *lconn;
> +	unsigned int i;
> +	int ret;
> +
> +	/* first find all of connector available */
> +	for (i =3D 0; i < num_crtc; i++) {
> +		lconn =3D lsdc_connector_init(ldev, i);
> +		dispipe =3D &ldev->disp_pipe[i];
> +
> +		if (IS_ERR(lconn))
> +			return PTR_ERR(lconn);
> +		else if (lconn =3D=3D NULL) {
> +			dispipe->lconn =3D NULL;
> +			dispipe->available =3D false;
> +			continue;
> +		}
> +
> +		/* take a record */
> +		dispipe->available =3D true;
> +		dispipe->lconn =3D lconn;
> +		ldev->num_output++;
> +	}
> +
> +	drm_info(ddev, "number of outputs: %u\n", ldev->num_output);
> +
> +	for (i =3D 0; i < num_crtc; i++) {
> +		struct lsdc_display_pipe * const dispipe =3D &ldev->disp_pipe[i];
> +		struct drm_plane * const primary =3D &dispipe->primary;
> +		struct drm_plane * const cursor =3D &dispipe->cursor;
> +		struct drm_encoder * const encoder =3D &dispipe->encoder;
> +		struct drm_crtc * const crtc =3D &dispipe->crtc;
> +		struct lsdc_pll * const pixpll =3D &dispipe->pixpll;
> +
> +		dispipe->index =3D i;
> +
> +		ret =3D lsdc_pixpll_init(pixpll, ddev, i);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D lsdc_plane_init(ldev, primary, DRM_PLANE_TYPE_PRIMARY, i);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Initial all of the CRTC available, in this way the crtc
> +		 * index is equal to the hardware crtc index. That is:
> +		 * display pipe 0 =3D crtc0 + dvo0 + encoder0
> +		 * display pipe 1 =3D crtc1 + dvo1 + encoder1
> +		 */
> +		ret =3D lsdc_crtc_init(ddev, crtc, i, primary, cursor);
> +		if (ret)
> +			return ret;
> +
> +		if (dispipe->available) {
> +			ret =3D lsdc_encoder_init(encoder,
> +						&dispipe->lconn->base,
> +						ddev,
> +						i,
> +						ldev->num_output);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		drm_info(ddev, "display pipe %u initialized\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static int lsdc_mode_config_init(struct lsdc_device *ldev)
> +{
> +	const struct lsdc_chip_desc * const descp =3D ldev->desc;
> +	struct drm_device *ddev =3D &ldev->drm;
> +	int ret;
> +
> +	spin_lock_init(&ldev->reglock);
> +
> +	drm_mode_config_init(ddev);
> +
> +	ddev->mode_config.funcs =3D &lsdc_mode_config_funcs;
> +	ddev->mode_config.min_width =3D 1;
> +	ddev->mode_config.min_height =3D 1;
> +	ddev->mode_config.preferred_depth =3D 24;
> +	ddev->mode_config.prefer_shadow =3D 0;
> +
> +	ddev->mode_config.max_width =3D 4096;
> +	ddev->mode_config.max_height =3D 4096;
> +
> +	ddev->mode_config.cursor_width =3D descp->hw_cursor_h;
> +	ddev->mode_config.cursor_height =3D descp->hw_cursor_h;
> +
> +	if (ldev->vram_base)
> +		ddev->mode_config.fb_base =3D ldev->vram_base;
> +
> +	ret =3D lsdc_modeset_init(ldev, descp->num_of_crtc);
> +	if (ret)
> +		goto out_mode_config;
> +
> +	drm_mode_config_reset(ddev);
> +
> +	return 0;
> +
> +out_mode_config:
> +	drm_mode_config_cleanup(ddev);
> +
> +	return ret;
> +}
> +
> +
> +static void lsdc_mode_config_fini(struct drm_device *ddev)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	/* disable output polling */
> +	drm_kms_helper_poll_fini(ddev);
> +
> +	drm_dev_unregister(ddev);
> +
> +	devm_free_irq(ddev->dev, ldev->irq, ddev);
> +
> +	/* shutdown all CRTC, for driver unloading */
> +	drm_atomic_helper_shutdown(ddev);
> +
> +	drm_mode_config_cleanup(ddev);
> +}
> +
> +/*
> + * We need a function to tell different chips apart.
> + * Because there are difference between the dc in ls7a1000 and the dc in
> + * ls2k1000, ls7a1000 have two gpio emulated i2c built-in, but ls2k1000
> + * don't have such hardware feature. ls2k1000 grab i2c adapter from other
> + * module, eithor hardware i2c or external gpio-emulated i2c.
> + *
> + * Beside, the hardware pixel pll unit is also different.
> + */
> +static int lsdc_determine_chip(struct lsdc_device *ldev)
> +{
> +	struct device_node *np;
> +	const char *model;
> +	const char *compat;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(lsdc_drm_of_match); ++i) {
> +		compat =3D lsdc_drm_of_match[i].compatible;
> +
> +		np =3D of_find_compatible_node(NULL, NULL, compat);
> +		if (np) {
> +
> +			/* get additional information */
> +			of_property_read_string(np, "model", &model);
> +
> +			of_node_put(np);
> +
> +			ldev->desc =3D lsdc_drm_of_match[i].data;
> +
> +			break;
> +		}
> +	}
> +
> +	if (ldev->desc =3D=3D NULL) {
> +		drm_err(&ldev->drm, "unknown dc ip core, abort\n");
> +		return -ENOENT;
> +	}
> +
> +	drm_info(&ldev->drm, "%s found, model: %s\n", compat, model);
> +
> +	return 0;
> +}
> +
> +
> +static int lsdc_drm_suspend(struct device *dev)
> +{
> +	struct drm_device *ddev =3D dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_suspend(ddev);
> +}
> +
> +
> +static int lsdc_drm_resume(struct device *dev)
> +{
> +	struct drm_device *ddev =3D dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_resume(ddev);
> +}
> +
> +
> +static int lsdc_pm_freeze(struct device *dev)
> +{
> +	return lsdc_drm_suspend(dev);
> +}
> +
> +
> +static int lsdc_pm_thaw(struct device *dev)
> +{
> +	return lsdc_drm_resume(dev);
> +}
> +
> +
> +static int lsdc_pm_suspend(struct device *dev)
> +{
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	int error;
> +
> +	error =3D lsdc_pm_freeze(dev);
> +	if (error)
> +		return error;
> +
> +	pci_save_state(pdev);
> +	/* Shut down the device */
> +	pci_disable_device(pdev);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +
> +	return 0;
> +}
> +
> +
> +static int lsdc_pm_resume(struct device *dev)
> +{
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +
> +	if (pcim_enable_device(pdev))
> +		return -EIO;
> +
> +	pci_set_power_state(pdev, PCI_D0);
> +
> +	pci_restore_state(pdev);
> +
> +	return lsdc_pm_thaw(dev);
> +}
> +
> +
> +static const struct dev_pm_ops lsdc_pm_ops =3D {
> +	.suspend =3D lsdc_pm_suspend,
> +	.resume =3D lsdc_pm_resume,
> +	.freeze =3D lsdc_pm_freeze,
> +	.thaw =3D lsdc_pm_thaw,
> +	.poweroff =3D lsdc_pm_freeze,
> +	.restore =3D lsdc_pm_resume,
> +};
> +
> +
> +static int lsdc_remove_conflicting_framebuffers(const struct drm_driver =
*drv)
> +{
> +	/* lsdc is a pci device, but it don't have a dedicate vram bar because
> +	 * of historic reason(The display controller is ported from SoC product
> +	 * of Loongson, Loongson 2H series which date back to 2012)
> +	 * And simplefb node may have been located anywhere in memory.
> +	 */
> +	return drm_aperture_remove_conflicting_framebuffers(0, ~0, false, drv);
> +}
> +
> +
> +static int lsdc_vram_init(struct lsdc_device *ldev)
> +{
> +	struct drm_device *ddev =3D &ldev->drm;
> +	struct pci_dev *gpu;
> +	resource_size_t base, size;
> +	int ret;
> +
> +	/* BAR 2 of LS7A1000's GPU contain VRAM, It's GC1000 */
> +	gpu =3D pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7a15, NULL);
> +	base =3D pci_resource_start(gpu, 2);
> +	size =3D  pci_resource_len(gpu, 2);
> +
> +	drm_info(ddev, "vram start: 0x%llx, size: %uMB\n",
> +			base, (unsigned int)(size >> 20));
> +
> +	if (!request_mem_region(base, size, "lsdc_vram")) {
> +		drm_err(ddev, "can't reserve VRAM memory region\n");
> +		return -ENXIO;
> +	}
> +
> +	if (ldev->use_vram_helper) {
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +		ret =3D drmm_vram_helper_init(ddev, base, size);
> +		if (ret) {
> +			drm_err(ddev, "can't init vram helper\n");
> +			return ret;
> +		}
> +#endif
> +	} else if (ldev->dirty_update) {
> +		ldev->vram =3D devm_ioremap_wc(ddev->dev, base, size);
> +		if (ldev->vram =3D=3D NULL)
> +			return -ENOMEM;
> +
> +		drm_info(ddev, "vram virtual addr: 0x%llx\n", (u64)ldev->vram);
> +	}
> +
> +	ldev->vram_base =3D base;
> +	ldev->vram_size =3D size;
> +
> +	return 0;
> +}
> +
> +/*
> + * For the dc in ls7a1000, it is more reliable scanout from the VRAM.
> + * scanout from the system memory suffer from some hardware deficiency
> + * which cause the screen flickering under RAM pressure.
> + */
> +static bool lsdc_should_vram_helper_based(void)
> +{
> +	static const char * const dc_compat[] =3D { "pci0014,7a06.0",
> +						  "pci0014,7a06" };
> +	bool ret =3D false;
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dc_compat); ++i) {
> +		np =3D of_find_compatible_node(NULL, NULL, dc_compat[i]);
> +		if (!np)
> +			continue;
> +
> +		ret =3D of_property_read_bool(np, "use_vram_helper");
> +		of_node_put(np);
> +		break;
> +	}
> +
> +	if (ret)
> +		DRM_INFO("using vram base solution dictated by device tree\n");
> +
> +	return ret;
> +}
> +
> +
> +static int lsdc_pci_probe(struct pci_dev *pdev,
> +			  const struct pci_device_id * const ent)
> +{
> +	const struct drm_driver *driver =3D &lsdc_drm_driver_cma_stub;
> +	struct lsdc_device *ldev;
> +	struct drm_device *ddev;
> +	int ret;
> +
> +	lsdc_remove_conflicting_framebuffers(driver);
> +
> +	ret =3D pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev, "Set DMA Mask failed\n");
> +		return ret;
> +	}
> +
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Enable pci devive failed\n");
> +		return ret;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	/* Get the optional framebuffer memory resource */
> +	ret =3D of_reserved_mem_device_init(&pdev->dev);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +	if (lsdc_use_vram_helper && lsdc_should_vram_helper_based()) {
> +		driver =3D &lsdc_vram_driver_stub;
> +		lsdc_use_vram_helper =3D 1;
> +		DRM_INFO("using vram helper based solution\n");
> +	}
> +#endif
> +
> +	ldev =3D devm_drm_dev_alloc(&pdev->dev,
> +				  driver,
> +				  struct lsdc_device,
> +				  drm);
> +	if (IS_ERR(ldev))
> +		return PTR_ERR(ldev);
> +
> +	ddev =3D &ldev->drm;
> +
> +	pci_set_drvdata(pdev, ddev);
> +
> +	if (lsdc_use_vram_helper > 0)
> +		ldev->use_vram_helper =3D true;
> +	else {
> +		if (lsdc_cached_coherent > 0) {
> +			ldev->cached_coherent =3D true;
> +			drm_info(ddev, "cache coherency is maintained by hardware\n");
> +		}
> +
> +		if (lsdc_dirty_update > 0) {
> +			ldev->dirty_update =3D true;
> +			drm_info(ddev, "dirty update enabled\n");
> +		}
> +	}
> +
> +	if (lsdc_verbose > 0)
> +		ldev->verbose =3D true;
> +
> +	ret =3D lsdc_determine_chip(ldev);
> +	if (ret)
> +		return ret;
> +
> +	/* BAR 0 contains registers */
> +	ldev->reg_base =3D devm_ioremap_resource(&pdev->dev, &pdev->resource[0]=
);
> +	if (IS_ERR(ldev->reg_base))
> +		return PTR_ERR(ldev->reg_base);
> +
> +	/* LS2K1000/LS2K0500 is SoC, don't have a VRAM */
> +	if ((ldev->desc->chip =3D=3D LSDC_CHIP_7A1000) &&
> +	    (ldev->use_vram_helper || ldev->dirty_update))
> +		lsdc_vram_init(ldev);
> +
> +	ret =3D lsdc_mode_config_init(ldev);
> +	if (ret)
> +		goto err_out;
> +
> +
> +	ldev->irq =3D pdev->irq;
> +
> +	dev_info(&pdev->dev, "irq =3D %d\n", ldev->irq);
> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev,
> +					pdev->irq,
> +					lsdc_irq_handler_cb,
> +					lsdc_irq_thread_cb,
> +					IRQF_ONESHOT,
> +					dev_name(&pdev->dev),
> +					ddev);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register lsdc interrupt\n");
> +		goto err_out;
> +	}
> +
> +	ret =3D drm_vblank_init(ddev, LSDC_MAX_CRTC);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +				"Fatal error during vblank init: %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	/* Initialize and enable output polling */
> +	drm_kms_helper_poll_init(ddev);
> +
> +	ret =3D drm_dev_register(ddev, 0);
> +	if (ret)
> +		goto err_out;
> +
> +	drm_fbdev_generic_setup(ddev, 32);
> +
> +	return 0;
> +
> +err_out:
> +	drm_dev_put(ddev);
> +
> +	return ret;
> +}
> +
> +
> +static void lsdc_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *ddev =3D pci_get_drvdata(pdev);
> +
> +	lsdc_mode_config_fini(ddev);
> +
> +	drm_dev_put(ddev);
> +
> +	pci_clear_master(pdev);
> +
> +	pci_release_regions(pdev);
> +}
> +
> +
> +static const struct pci_device_id lsdc_pciid_list[] =3D {
> +	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{0, 0, 0, 0, 0, 0, 0}
> +};
> +
> +
> +static struct pci_driver lsdc_pci_driver =3D {
> +	.name =3D DRIVER_NAME,
> +	.id_table =3D lsdc_pciid_list,
> +	.probe =3D lsdc_pci_probe,
> +	.remove =3D lsdc_pci_remove,
> +	.driver.pm =3D &lsdc_pm_ops,
> +};
> +
> +
> +static int __init lsdc_drm_init(void)
> +{
> +	struct pci_dev *pdev =3D NULL;
> +
> +	if (drm_firmware_drivers_only())
> +		return -EINVAL;
> +
> +	if (lsdc_modeset =3D=3D 0)
> +		return -ENOENT;
> +
> +	while ((pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
> +		/*
> +		 * Multiple video card workaround
> +		 *
> +		 * This integrated video driver will always be selected as
> +		 * default boot device by vgaarb system.
> +		 */
> +		if (pdev->vendor !=3D PCI_VENDOR_ID_LOONGSON) {
> +			DRM_INFO("Discrete graphic card detected, abort\n");
> +			return 0;
> +		}
> +	}
> +
> +	return pci_register_driver(&lsdc_pci_driver);
> +}
> +module_init(lsdc_drm_init);
> +
> +static void __exit lsdc_drm_exit(void)
> +{
> +	pci_unregister_driver(&lsdc_pci_driver);
> +}
> +module_exit(lsdc_drm_exit);
> +
> +
> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h b/drivers/gpu/drm/lsdc/lsdc_=
drv.h
> new file mode 100644
> index 000000000000..89cf15248c3a
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
> @@ -0,0 +1,216 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_DRV_H__
> +#define __LSDC_DRV_H__
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_encoder.h>
> +
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +#include <drm/drm_gem_vram_helper.h>
> +#endif
> +
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +#define LSDC_MAX_CRTC           2
> +
> +/* There is only a 1:1 mapping of encoders and connectors for lsdc */
> +/*
> + *      +-------------------+                                      _____=
____
> + *      |                   |                                     |     =
    |
> + *      |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Mono=
tor |
> + *      |                   |           ^            ^            |_____=
____|
> + *      |                   |           |            |
> + *      |                <----- i2c0 ----------------+
> + *      |   LSDC IP CORE    |
> + *      |                <----- i2c1 ----------------+
> + *      |                   |           |            |             _____=
____
> + *      |                   |           |            |            |     =
    |
> + *      |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Pan=
el  |
> + *      |                   |                                     |_____=
____|
> + *      +-------------------+
> + */
> +
> +enum loongson_dc_family {
> +	LSDC_CHIP_UNKNOWN =3D 0,
> +	LSDC_CHIP_2K1000 =3D 1, /* 2-Core SoC, 64-bit */
> +	LSDC_CHIP_7A1000 =3D 2, /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
> +	LSDC_CHIP_2K0500 =3D 3, /* Reduced version of LS2K1000, single core */
> +	LSDC_CHIP_7A2000 =3D 4, /* Enhancement version of 7A1000 */
> +	LSDC_CHIP_LAST,
> +};
> +
> +enum lsdc_pixel_format {
> +	LSDC_PF_NONE =3D 0,
> +	LSDC_PF_ARGB4444 =3D 1,    /* ARGB A:4 bits R/G/B: 4 bits each [16 bits=
] */
> +	LSDC_PF_ARGB1555 =3D 2,    /* ARGB A:1 bit RGB:15 bits [16 bits] */
> +	LSDC_PF_RGB565 =3D 3,      /* RGB [16 bits] */
> +	LSDC_PF_XRGB8888 =3D 4,    /* XRGB [32 bits] */
> +};
> +
> +struct lsdc_chip_desc {
> +	enum loongson_dc_family chip;
> +	uint32_t num_of_crtc;
> +
> +	uint32_t max_pixel_clk;
> +
> +	uint32_t max_width;
> +	uint32_t max_height;
> +
> +	uint32_t num_of_hw_cursor;
> +	uint32_t hw_cursor_w;
> +	uint32_t hw_cursor_h;
> +	bool have_builtin_i2c;
> +	uint32_t stride_alignment;
> +};
> +
> +
> +/**
> + * struct lsdc_display_pipe - simple display pipeline
> + * @crtc: CRTC control structure
> + * @plane: Plane control structure
> + * @encoder: Encoder control structure
> + * @pixpll: Pll control structure
> + * @connector: point to connector control structure
> + *
> + * display pipeline with plane, crtc, encoder, pll collapsed into one
> + * entity. It should be initialized by calling drm_simple_display_pipe_i=
nit().
> + */
> +struct lsdc_display_pipe {
> +	struct drm_crtc crtc;
> +	struct drm_plane primary;
> +	struct drm_plane cursor;
> +	struct drm_encoder encoder;
> +	struct lsdc_pll pixpll;
> +	struct lsdc_connector *lconn;
> +
> +	int index;
> +	bool available;
> +};
> +
> +
> +struct lsdc_crtc_state {
> +	struct drm_crtc_state base;
> +	struct lsdc_pll_core_values pparams;
> +	unsigned int pix_fmt;
> +};
> +
> +
> +struct lsdc_device {
> +	struct drm_device drm;
> +
> +	void __iomem *reg_base;
> +	void __iomem *vram;
> +	resource_size_t vram_base;
> +	resource_size_t vram_size;
> +
> +	struct lsdc_display_pipe disp_pipe[LSDC_MAX_CRTC];
> +
> +	unsigned int num_output;
> +
> +	/* platform specific data */
> +	const struct lsdc_chip_desc *desc;
> +
> +	/* @reglock: protects concurrent register access */
> +	spinlock_t reglock;
> +
> +	/*
> +	 * @dirty_update: true if manual dirty update is wantted
> +	 */
> +	bool dirty_update;
> +	/*
> +	 * @cached_coherent: true if the host platform is hardware maintained
> +	 * cached coherent.
> +	 */
> +	bool cached_coherent;
> +	/*
> +	 * @use_vram_helper: using vram helper instead of cma helper base
> +	 * solution. As ls7a1000 has a dediacted video ram, the dc scanout
> +	 * from the vram is more reliable.
> +	 */
> +	bool use_vram_helper;
> +
> +	/*
> +	 * @verbose: set it to true if print useful information is wantted
> +	 */
> +	bool verbose;
> +
> +	int irq;
> +	u32 irq_status;
> +};
> +
> +#define to_lsdc(x) container_of(x, struct lsdc_device, drm)
> +
> +static inline struct lsdc_crtc_state *
> +to_lsdc_crtc_state(struct drm_crtc_state *base)
> +{
> +	return container_of(base, struct lsdc_crtc_state, base);
> +}
> +
> +static inline u32 lsdc_reg_read32(struct lsdc_device * const ldev, u32 o=
ffset)
> +{
> +	u32 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +	val =3D readl(ldev->reg_base + offset);
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +
> +	return val;
> +}
> +
> +static inline void lsdc_reg_write32(struct lsdc_device * const ldev, u32=
 offset, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +	writel(val, ldev->reg_base + offset);
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +}
> +
> +int lsdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc,
> +		   unsigned int index, struct drm_plane *primary,
> +		   struct drm_plane *cursor);
> +
> +int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
> +		    enum drm_plane_type type, unsigned int index);
> +
> +int lsdc_encoder_init(struct drm_encoder * const encoder,
> +		      struct drm_connector *connector,
> +		      struct drm_device *ddev,
> +		      unsigned int index,
> +		      unsigned int total);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_encoder.c b/drivers/gpu/drm/lsdc/l=
sdc_encoder.c
> new file mode 100644
> index 000000000000..0cdd95f5bc37
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_encoder.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *	Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +#include <drm/drm_print.h>
> +#include <drm/drm_crtc_helper.h>
> +
> +#include "lsdc_drv.h"
> +
> +static const struct drm_encoder_funcs lsdc_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
> +
> +int lsdc_encoder_init(struct drm_encoder * const encoder,
> +		      struct drm_connector *connector,
> +		      struct drm_device *ddev,
> +		      unsigned int index,
> +		      unsigned int total)
> +{
> +	int ret;
> +	int type;
> +
> +	encoder->possible_crtcs =3D BIT(index);
> +
> +	if (total =3D=3D 2)
> +		encoder->possible_clones =3D BIT(1) | BIT(0);
> +	else if (total < 2)
> +		encoder->possible_clones =3D 0;
> +
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_VGA)
> +		type =3D DRM_MODE_ENCODER_DAC;
> +	else if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) ||
> +		 (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) ||
> +		 (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DVID))
> +		type =3D DRM_MODE_ENCODER_TMDS;
> +	else if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DPI)
> +		type =3D DRM_MODE_ENCODER_DPI;
> +	else if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_VIRTUAL)
> +		type =3D DRM_MODE_ENCODER_VIRTUAL;
> +	else
> +		type =3D DRM_MODE_ENCODER_NONE;
> +
> +	ret =3D drm_encoder_init(ddev,
> +				encoder,
> +				&lsdc_encoder_funcs,
> +				type,
> +				"encoder%d",
> +				index);
> +	if (ret)
> +		return ret;
> +
> +	return drm_connector_attach_encoder(connector, encoder);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_=
i2c.c
> new file mode 100644
> index 000000000000..895e94ae6827
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <linux/string.h>
> +#include <linux/i2c.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_i2c.h"
> +
> +/*
> + * set the state of a gpio pin indicated by mask
> + * @mask: gpio pin mask
> + */
> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const i2c, int mask, int=
 state)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(i2c->ddev);
> +	u8 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +
> +	if (state) {
> +		val =3D readb(i2c->dir_reg);
> +		val |=3D mask;
> +		writeb(val, i2c->dir_reg);
> +	} else {
> +		val =3D readb(i2c->dir_reg);
> +		val &=3D ~mask;
> +		writeb(val, i2c->dir_reg);
> +
> +		val =3D readb(i2c->dat_reg);
> +		if (state)
> +			val |=3D mask;
> +		else
> +			val &=3D ~mask;
> +		writeb(val, i2c->dat_reg);
> +	}
> +
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +}
> +
> +/*
> + * read value back from gpio pin
> + * @mask: gpio pin mask
> + */
> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const i2c, int mask)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(i2c->ddev);
> +	u8 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +
> +	/* first set this pin as input */
> +	val =3D readb(i2c->dir_reg);
> +	val |=3D mask;
> +	writeb(val, i2c->dir_reg);
> +
> +	/* then get level state from this pin */
> +	val =3D readb(i2c->dat_reg);
> +
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +
> +	return (val & mask) ? 1 : 0;
> +}
> +
> +
> +/* set the state on the i2c->sda pin */
> +static void ls7a_i2c_set_sda(void *i2c, int state)
> +{
> +	struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
> +}
> +
> +/* set the state on the i2c->scl pin */
> +static void ls7a_i2c_set_scl(void *i2c, int state)
> +{
> +	struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
> +}
> +
> +/* read the value from the i2c->sda pin */
> +static int ls7a_i2c_get_sda(void *i2c)
> +{
> +	struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_get(li2c, li2c->sda);
> +}
> +
> +/* read the value from the i2c->scl pin */
> +static int ls7a_i2c_get_scl(void *i2c)
> +{
> +	struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_get(li2c, li2c->scl);
> +}
> +
> +/*
> + * Get i2c id from connector id
> + *
> + * TODO: get it from dtb
> + */
> +static int lsdc_get_i2c_id(struct drm_device *ddev, unsigned int index)
> +{
> +	return index;
> +}
> +
> +/*
> + * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
> + *
> + * @index : output channel index, 0 for DVO0, 1 for DVO1
> + */
> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
> +					 unsigned int index)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct i2c_adapter *adapter;
> +	struct lsdc_i2c *li2c;
> +	int ret;
> +
> +	li2c =3D devm_kzalloc(ddev->dev, sizeof(*li2c), GFP_KERNEL);
> +	if (li2c =3D=3D NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	li2c->ddev =3D ddev;
> +
> +	if (index =3D=3D 0) {
> +		li2c->sda =3D 0x01;
> +		li2c->scl =3D 0x02;
> +	} else if (index =3D=3D 1) {
> +		li2c->sda =3D 0x04;
> +		li2c->scl =3D 0x08;
> +	}
> +
> +	li2c->dir_reg =3D ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
> +	li2c->dat_reg =3D ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
> +
> +	li2c->bit.setsda =3D ls7a_i2c_set_sda;
> +	li2c->bit.setscl =3D ls7a_i2c_set_scl;
> +	li2c->bit.getsda =3D ls7a_i2c_get_sda;
> +	li2c->bit.getscl =3D ls7a_i2c_get_scl;
> +	li2c->bit.udelay =3D 5;
> +	li2c->bit.timeout =3D usecs_to_jiffies(2200); /* from VESA */
> +	li2c->bit.data =3D li2c;
> +
> +	adapter =3D &li2c->adapter;
> +
> +	adapter->algo_data =3D &li2c->bit;
> +	adapter->owner =3D THIS_MODULE;
> +	adapter->class =3D I2C_CLASS_DDC;
> +	adapter->dev.parent =3D ddev->dev;
> +	adapter->nr =3D -1;
> +
> +	snprintf(adapter->name, sizeof(adapter->name),
> +		"%s-%d", "lsdc_gpio_i2c", index);
> +
> +	i2c_set_adapdata(adapter, li2c);
> +
> +	ret =3D i2c_bit_add_numbered_bus(adapter);
> +	if (ret) {
> +		devm_kfree(ddev->dev, li2c);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return adapter;
> +}
> +
> +
> +/*
> + * Mainly for dc in ls2k1000, ls2k0500 SoC which should get a i2c adapter
> + * from i2c susystem.
> + *
> + * @index : output channel index, 0 for DVO0, 1 for DVO1
> + */
> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
> +					 unsigned int index)
> +{
> +	unsigned int i2c_id;
> +
> +	/* find mapping between i2c id and connector id */
> +	i2c_id =3D lsdc_get_i2c_id(ddev, index);
> +
> +	return i2c_get_adapter(i2c_id);
> +}
> +
> +
> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *adapt=
er)
> +{
> +	i2c_put_adapter(adapter);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.h b/drivers/gpu/drm/lsdc/lsdc_=
i2c.h
> new file mode 100644
> index 000000000000..f4560db3694a
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +
> +#ifndef __LSDC_I2C__
> +#define __LSDC_I2C__
> +
> +#include <linux/i2c.h>
> +#include <linux/i2c-algo-bit.h>
> +
> +
> +struct lsdc_i2c {
> +	struct drm_device *ddev;
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit;
> +	/* pin bit mask */
> +	u8 sda;
> +	u8 scl;
> +
> +	void __iomem *dir_reg;
> +	void __iomem *dat_reg;
> +};
> +
> +
> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *i2c);
> +
> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
> +					 unsigned int con_id);
> +
> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
> +					 unsigned int con_id);
> +
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c b/drivers/gpu/drm/lsdc/lsdc_=
irq.c
> new file mode 100644
> index 000000000000..7620de54aae4
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +#include <drm/drm_vblank.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_irq.h"
> +
> +/* Function to be called in a threaded interrupt context. */
> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg)
> +{
> +	struct drm_device *ddev =3D arg;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_crtc *crtc;
> +
> +	/* trigger the vblank event */
> +	if (ldev->irq_status & INT_CRTC0_VS) {
> +		crtc =3D drm_crtc_from_index(ddev, 0);
> +		drm_crtc_handle_vblank(crtc);
> +	}
> +
> +	if (ldev->irq_status & INT_CRTC1_VS) {
> +		crtc =3D drm_crtc_from_index(ddev, 1);
> +		drm_crtc_handle_vblank(crtc);
> +	}
> +
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, INT_CRTC0_VS_EN | INT_CRTC1_VS_EN);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +
> +/* Function to be called when the IRQ occurs */
> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg)
> +{
> +	struct drm_device *ddev =3D arg;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	/* Read & Clear the interrupt status */
> +	ldev->irq_status =3D lsdc_reg_read32(ldev, LSDC_INT_REG);
> +	if ((ldev->irq_status & INT_STATUS_MASK) =3D=3D 0) {
> +		drm_warn(ddev, "no interrupt occurs\n");
> +		return IRQ_NONE;
> +	}
> +
> +	/* clear all interrupt */
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, ldev->irq_status);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.h b/drivers/gpu/drm/lsdc/lsdc_=
irq.h
> new file mode 100644
> index 000000000000..ac187538d746
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_IRQ_H__
> +#define __LSDC_IRQ_H__
> +
> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg);
> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c b/drivers/gpu/drm/lsdc/lsd=
c_plane.c
> new file mode 100644
> index 000000000000..62801e100a13
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
> @@ -0,0 +1,681 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_drv.h>
> +
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +
> +static const uint32_t lsdc_primary_formats[] =3D {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const uint32_t lsdc_cursor_formats[] =3D {
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const u64 lsdc_fb_format_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +
> +static u32 lsdc_pixfmt_to_drm_pixfmt(enum lsdc_pixel_format pf)
> +{
> +	switch (pf) {
> +	case LSDC_PF_XRGB8888:
> +		return DRM_FORMAT_XRGB8888;
> +	case LSDC_PF_RGB565:
> +		return DRM_FORMAT_RGB565;
> +	case LSDC_PF_ARGB1555:
> +		return DRM_FORMAT_ARGB1555;
> +	case LSDC_PF_ARGB4444:
> +		return DRM_FORMAT_ARGB4444;
> +	case LSDC_PF_NONE:
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const char *lsdc_pixfmt_to_string(u32 reg)
> +{
> +	switch (reg & CFG_PIX_FMT_MASK) {
> +	case LSDC_PF_XRGB8888:
> +		return "XRGB8888";
> +	case LSDC_PF_RGB565:
> +		return "RGB565";
> +	case LSDC_PF_ARGB1555:
> +		return "ARGB1555";
> +	case LSDC_PF_ARGB4444:
> +		return "ARGB4444";
> +	case LSDC_PF_NONE:
> +		return "NONE";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +
> +
> +static void lsdc_update_fb_format(struct lsdc_device *ldev,
> +				  struct drm_crtc *crtc,
> +				  const struct drm_format_info *fmt_info)
> +{
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	u32 val =3D 0;
> +	u32 fmt;
> +
> +	switch (fmt_info->format) {
> +	case DRM_FORMAT_RGB565:
> +		fmt =3D LSDC_PF_RGB565;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		fmt =3D LSDC_PF_XRGB8888;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		fmt =3D LSDC_PF_XRGB8888;
> +		break;
> +	default:
> +		fmt =3D LSDC_PF_XRGB8888;
> +		break;
> +	}
> +
> +	if (ldev->verbose)
> +		drm_info(&ldev->drm, "fmt wanted is %s\n",
> +				lsdc_pixfmt_to_string(fmt));
> +
> +	if (index =3D=3D 0) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val =3D (val & ~CFG_PIX_FMT_MASK) | fmt;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +	} else if (index =3D=3D 1) {
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val =3D (val & ~CFG_PIX_FMT_MASK) | fmt;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +	}
> +
> +	if (ldev->verbose)
> +		drm_info(&ldev->drm, "after update fb%d format is %s\n",
> +				index, lsdc_pixfmt_to_string(val));
> +}
> +
> +
> +static u32 lsdc_primary_get_default_format(struct drm_crtc *crtc)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(crtc->dev);
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	u32 val;
> +
> +	if (index =3D=3D 0)
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +	else if (index =3D=3D 1)
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +	return val & CFG_PIX_FMT_MASK;
> +}
> +
> +
> +static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
> +				      struct drm_crtc *crtc,
> +				      u64 paddr)
> +{
> +	unsigned int index =3D drm_crtc_index(crtc);
> +	u32 addr_reg;
> +	u32 cfg_reg;
> +	u32 val;
> +
> +	/*
> +	 * Find which framebuffer address register should update.
> +	 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
> +	 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
> +	 */
> +	if (index =3D=3D 0) {
> +		/* CRTC0 */
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +		cfg_reg =3D LSDC_CRTC0_CFG_REG;
> +
> +		if (val & CFG_FB_IDX_BIT) {
> +			addr_reg =3D LSDC_CRTC0_FB_ADDR0_REG;
> +			drm_dbg_kms(&ldev->drm, "CRTC0 FB0 will be use\n");
> +		} else {
> +			addr_reg =3D LSDC_CRTC0_FB_ADDR1_REG;
> +			drm_dbg_kms(&ldev->drm, "CRTC0 FBq will be use\n");
> +		}
> +	} else if (index =3D=3D 1) {
> +		/* CRTC1 */
> +		val =3D lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +		cfg_reg =3D LSDC_CRTC1_CFG_REG;
> +
> +		if (val & CFG_FB_IDX_BIT) {
> +			addr_reg =3D LSDC_CRTC1_FB_ADDR0_REG;
> +			drm_dbg_kms(&ldev->drm, "CRTC1 FB0 will be use\n");
> +		} else {
> +			addr_reg =3D LSDC_CRTC1_FB_ADDR1_REG;
> +			drm_dbg_kms(&ldev->drm, "CRTC1 FBq will be use\n");
> +		}
> +	}
> +
> +	lsdc_reg_write32(ldev, addr_reg, paddr);
> +
> +	/*
> +	 * Then, we triger the fb switch, the switch of the framebuffer
> +	 * to be scanout will complete at the next vblank.
> +	 */
> +	lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
> +
> +	drm_dbg_kms(&ldev->drm, "crtc%u scantout from 0x%llx\n", index, paddr);
> +}
> +
> +
> +static void lsdc_handle_damage(struct lsdc_device *ldev,
> +			       struct drm_framebuffer *fb,
> +			       struct drm_rect *clip,
> +			       void *src)
> +{
> +	unsigned int offset;
> +	void __iomem *dst;
> +
> +	offset =3D drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
> +	dst =3D ldev->vram + offset;
> +	drm_fb_memcpy_toio(dst, fb->pitches[0], src, fb, clip);
> +}
> +
> +
> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
> +				       struct drm_plane_state *state,
> +				       unsigned int plane)
> +{
> +	unsigned int offset;
> +
> +	offset =3D fb->offsets[plane];
> +	offset +=3D fb->format->cpp[plane] * (state->src_x >> 16);
> +	offset +=3D fb->pitches[plane] * (state->src_y >> 16);
> +
> +	return offset;
> +}
> +
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
> +{
> +	struct drm_gem_vram_object *gbo;
> +	s64 gpu_addr;
> +
> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> +	gpu_addr =3D drm_gem_vram_offset(gbo);
> +
> +	return gpu_addr;
> +}
> +#endif
> +
> +
> +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev =3D plane->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_st=
ate(state, plane);
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state, plane);
> +	struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> +	struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	u32 new_format =3D new_fb->format->format;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct lsdc_crtc_state *priv_crtc_state;
> +	int ret;
> +
> +	if (!crtc)
> +		return 0;
> +
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!new_crtc_state))
> +		return -EINVAL;
> +
> +	priv_crtc_state =3D to_lsdc_crtc_state(new_crtc_state);
> +
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state,
> +						  new_crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  false,
> +						  true);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Require full modeset if enabling or disabling a plane,
> +	 * or changing its position, size, depth or format.
> +	 */
> +	if ((!new_fb || !old_fb ||
> +	     old_plane_state->crtc_x !=3D new_plane_state->crtc_x ||
> +	     old_plane_state->crtc_y !=3D new_plane_state->crtc_y ||
> +	     old_plane_state->crtc_w !=3D new_plane_state->crtc_w ||
> +	     old_plane_state->crtc_h !=3D new_plane_state->crtc_h ||
> +	     old_fb->format->format !=3D new_format))
> +		new_crtc_state->mode_changed =3D true;
> +
> +
> +	priv_crtc_state->pix_fmt =3D lsdc_primary_get_default_format(crtc);

Storing the pixel format in the CRTC state is weird? What would happen
if you have a primary plane and a cursor in different formats?

Also, reading the default format from a register doesn't look right.
atomic_check can occur at any time, including before a previous commit,
or while the hardware is disabled. You should rely on either a constant
or the previous state here.

> +	if (lsdc_pixfmt_to_drm_pixfmt(priv_crtc_state->pix_fmt) !=3D new_format=
) {
> +		drm_info(&ldev->drm, "mode changed\n");
> +		new_crtc_state->mode_changed =3D true;
> +	}
> +
> +	if (new_crtc_state->mode_changed) {
> +		struct lsdc_display_pipe *dispipe =3D container_of(plane, struct lsdc_=
display_pipe, primary);
> +		struct lsdc_pll *pixpll =3D &dispipe->pixpll;
> +		const struct lsdc_pixpll_funcs *pfuncs =3D pixpll->funcs;
> +
> +		ret =3D pfuncs->compute(pixpll,
> +				      new_crtc_state->mode.clock,
> +				      true,
> +				      &priv_crtc_state->pparams);
> +		if (ret =3D=3D false) {
> +			drm_warn(plane->dev,
> +				"failed find a set of pll param for mode %u\n",
> +				new_crtc_state->mode.clock);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (ldev->dirty_update)
> +		drm_atomic_helper_check_plane_damage(state, new_plane_state);
> +
> +	return 0;
> +}
> +
> +static void lsdc_update_stride(struct lsdc_device *ldev,
> +			       struct drm_crtc *crtc,
> +			       unsigned int stride)
> +{
> +	unsigned int index =3D drm_crtc_index(crtc);
> +
> +	if (index =3D=3D 0)
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
> +	else if (index =3D=3D 1)
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
> +
> +	drm_dbg_kms(&ldev->drm, "update stride to %u\n", stride);
> +}
> +
> +
> +
> +static void lsdc_primary_plane_atomic_update(struct drm_plane *plane,
> +					     struct drm_atomic_state *state)
> +{
> +	struct lsdc_device *ldev =3D to_lsdc(plane->dev);
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state, plane);
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
> +	u32 fb_offset =3D lsdc_get_fb_offset(fb, new_plane_state, 0);
> +	struct drm_gem_cma_object *obj;
> +	dma_addr_t fb_addr;
> +
> +	if (ldev->use_vram_helper) {
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +		s64 gpu_addr;
> +
> +		gpu_addr =3D lsdc_get_vram_bo_offset(fb);
> +		if (gpu_addr < 0)
> +			return;
> +
> +		fb_addr =3D ldev->vram_base + gpu_addr + fb_offset;
> +#endif
> +	} else {
> +		obj =3D drm_fb_cma_get_gem_obj(fb, 0);
> +
> +		if (ldev->dirty_update)
> +			fb_addr =3D ldev->vram_base + fb_offset;
> +		else
> +			fb_addr =3D obj->paddr + fb_offset;
> +	}
> +
> +	lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
> +
> +	lsdc_update_stride(ldev, crtc, fb->pitches[0]);
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc->state))
> +		lsdc_update_fb_format(ldev, crtc, fb->format);
> +
> +	if (ldev->dirty_update) {
> +		struct drm_plane_state *old_plane_state;
> +		struct drm_rect damage;
> +		bool valid;
> +
> +		old_plane_state =3D drm_atomic_get_old_plane_state(state, plane);
> +
> +		valid =3D drm_atomic_helper_damage_merged(old_plane_state,
> +							new_plane_state,
> +							&damage);
> +		if (valid)
> +			lsdc_handle_damage(ldev, fb, &damage, obj->vaddr);
> +	}
> +}
> +
> +
> +static void lsdc_primary_plane_atomic_disable(struct drm_plane *plane,
> +					struct drm_atomic_state *state)
> +{
> +	drm_dbg_kms(plane->dev, "%s disabled\n", plane->name);
> +}
> +
> +
> +static int lsdc_plane_prepare_fb(struct drm_plane *plane,
> +				   struct drm_plane_state *new_state)
> +{
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +	struct lsdc_device *ldev =3D to_lsdc(plane->dev);
> +
> +	if (ldev->use_vram_helper)
> +		return drm_gem_vram_plane_helper_prepare_fb(plane, new_state);
> +#endif
> +	return drm_gem_plane_helper_prepare_fb(plane, new_state);
> +}
> +
> +
> +static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
> +				    struct drm_plane_state *old_state)
> +{
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +	struct drm_device *ddev =3D plane->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +	if (ldev->use_vram_helper)
> +		return drm_gem_vram_plane_helper_cleanup_fb(plane, old_state);
> +#endif
> +}
> +
> +static const struct drm_plane_helper_funcs lsdc_primary_plane_helpers =
=3D {
> +	.prepare_fb =3D lsdc_plane_prepare_fb,
> +	.cleanup_fb =3D lsdc_plane_cleanup_fb,
> +	.atomic_check =3D lsdc_primary_plane_atomic_check,
> +	.atomic_update =3D lsdc_primary_plane_atomic_update,
> +	.atomic_disable =3D lsdc_primary_plane_atomic_disable,
> +};
> +
> +
> +

Don't use multiple blank lines. Generally speaking, there's a lot of
checkpatch warnings to fix. Make sure to run checkpatch.pl --strict and
fix whatever comes up.

> +static int lsdc_cursor_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state, plane);
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_framebuffer *fb =3D new_plane_state->fb;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	/* no need for further checks if the plane is being disabled */
> +	if (!crtc || !fb)
> +		return 0;
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state,
> +						   new_plane_state->crtc);
> +
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state,
> +						  crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  true,
> +						  true);
> +	if (ret)
> +		return ret;
> +
> +	if ((fb->width < LSDC_CURS_MIN_SIZE) ||
> +	    (fb->height < LSDC_CURS_MIN_SIZE) ||
> +	    (fb->width > LSDC_CURS_MAX_SIZE) ||
> +	    (fb->height > LSDC_CURS_MAX_SIZE)) {
> +		drm_err(plane->dev, "Invalid cursor size: %dx%d\n",
> +				fb->width, fb->height);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +
> +/* Update the location of the cursor */
> +static void lsdc_cursor_update_location(struct lsdc_device *ldev,
> +					struct drm_crtc *crtc)
> +{
> +	u32 val;
> +
> +	val =3D lsdc_reg_read32(ldev, LSDC_CURSOR_CFG_REG);
> +
> +	if ((val & CURSOR_FORMAT_MASK) =3D=3D 0)
> +		val |=3D CURSOR_FORMAT_ARGB8888;
> +
> +	/* Update the location of the cursor */
> +	if (drm_crtc_index(crtc))
> +		val |=3D CURSOR_LOCATION_BIT;
> +
> +	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, val);
> +}
> +
> +/* update the position of the cursor */
> +static void lsdc_cursor_update_position(struct lsdc_device *ldev, int x,=
 int y)
> +{
> +	if (x < 0)
> +		x =3D 0;
> +
> +	if (y < 0)
> +		y =3D 0;
> +
> +	lsdc_reg_write32(ldev, LSDC_CURSOR_POSITION_REG, (y << 16) | x);
> +}
> +
> +
> +static void lsdc_cursor_atomic_update(struct drm_plane *plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev =3D plane->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_st=
ate(state, plane);
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_st=
ate(state, plane);
> +	struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> +	struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +
> +	if (new_fb !=3D old_fb) {
> +		u64 cursor_addr;
> +
> +		if (ldev->use_vram_helper) {
> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
> +			s64 offset;
> +
> +			offset =3D lsdc_get_vram_bo_offset(new_fb);
> +			cursor_addr =3D ldev->vram_base + offset;
> +
> +			drm_dbg_kms(ddev, "%s offset: %llx\n",
> +					plane->name, offset);
> +#endif
> +		} else {
> +			struct drm_gem_cma_object *cursor_obj;
> +
> +			cursor_obj =3D drm_fb_cma_get_gem_obj(new_fb, 0);
> +			if (!cursor_obj)
> +				return;
> +
> +			cursor_addr =3D cursor_obj->paddr;
> +		}
> +
> +		lsdc_reg_write32(ldev, LSDC_CURSOR_ADDR_REG, cursor_addr);
> +	}
> +
> +	lsdc_cursor_update_position(ldev, new_plane_state->crtc_x,
> +					  new_plane_state->crtc_y);
> +
> +	lsdc_cursor_update_location(ldev, new_plane_state->crtc);
> +}
> +
> +
> +static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
> +				       struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev =3D plane->dev;
> +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> +	struct drm_plane_state *old_plane_state;
> +	struct drm_crtc *crtc;
> +
> +	old_plane_state =3D drm_atomic_get_old_plane_state(state, plane);
> +
> +	if (old_plane_state)
> +		crtc =3D old_plane_state->crtc;
> +
> +	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, 0);
> +
> +	drm_dbg_kms(ddev, "%s disable\n", plane->name);
> +}
> +
> +
> +static const struct drm_plane_helper_funcs lsdc_cursor_plane_helpers =3D=
 {
> +	.prepare_fb =3D lsdc_plane_prepare_fb,
> +	.cleanup_fb =3D lsdc_plane_cleanup_fb,
> +	.atomic_check =3D lsdc_cursor_atomic_check,
> +	.atomic_update =3D lsdc_cursor_atomic_update,
> +	.atomic_disable =3D lsdc_cursor_atomic_disable,
> +};
> +
> +
> +static int lsdc_plane_get_default_zpos(enum drm_plane_type type)
> +{
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		return 0;
> +	case DRM_PLANE_TYPE_OVERLAY:
> +		return 1;
> +	case DRM_PLANE_TYPE_CURSOR:
> +		return 7;
> +	}
> +	return 0;
> +}
> +
> +
> +static void lsdc_plane_reset(struct drm_plane *plane)
> +{
> +	drm_atomic_helper_plane_reset(plane);
> +
> +	plane->state->zpos =3D lsdc_plane_get_default_zpos(plane->type);
> +
> +	drm_dbg_kms(plane->dev, "%s reset\n", plane->name);
> +}
> +
> +
> +static const struct drm_plane_funcs lsdc_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D drm_plane_cleanup,
> +	.reset =3D lsdc_plane_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> +};
> +
> +
> +int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
> +		    enum drm_plane_type type, unsigned int index)
> +{
> +	struct drm_device *ddev =3D &ldev->drm;
> +	int zpos =3D lsdc_plane_get_default_zpos(type);
> +	unsigned int format_count;
> +	const uint32_t *formats;
> +	const char *name;
> +	int ret;
> +
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		formats =3D lsdc_primary_formats;
> +		format_count =3D ARRAY_SIZE(lsdc_primary_formats);
> +		name =3D "primary-%u";
> +		break;
> +	case DRM_PLANE_TYPE_CURSOR:
> +		formats =3D lsdc_cursor_formats;
> +		format_count =3D ARRAY_SIZE(lsdc_cursor_formats);
> +		name =3D "cursor-%u";
> +		break;
> +	case DRM_PLANE_TYPE_OVERLAY:
> +		drm_err(ddev, "overlay plane is not supported\n");
> +		break;
> +	}
> +
> +	ret =3D drm_universal_plane_init(ddev, plane, 1 << index,
> +				       &lsdc_plane_funcs,
> +				       formats, format_count,
> +				       lsdc_fb_format_modifiers,
> +				       type, name, index);
> +	if (ret) {
> +		drm_err(ddev, "%s failed: %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		drm_plane_helper_add(plane, &lsdc_primary_plane_helpers);
> +		drm_plane_create_zpos_property(plane, zpos, 0, 6);
> +		if (ldev->dirty_update)
> +			drm_plane_enable_fb_damage_clips(plane);
> +		break;
> +	case DRM_PLANE_TYPE_CURSOR:
> +		drm_plane_helper_add(plane, &lsdc_cursor_plane_helpers);
> +		drm_plane_create_zpos_immutable_property(plane, zpos);
> +		break;
> +	case DRM_PLANE_TYPE_OVERLAY:
> +		drm_err(ddev, "overlay plane is not supported\n");
> +		break;
> +	}
> +
> +	drm_plane_create_alpha_property(plane);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c b/drivers/gpu/drm/lsdc/lsdc_=
pll.c
> new file mode 100644
> index 000000000000..fcf3728a9067
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
> @@ -0,0 +1,657 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Loongson Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +/* device dependent pixpll regs */
> +
> +/* u64 */
> +struct ls7a1000_pixpll_bitmap {
> +	/* Byte 0 ~ Byte 3 */
> +	unsigned div_out      : 7;   /*  0 : 6     output clock divider  */
> +	unsigned reserved_1   : 14;  /*  7 : 20                          */
> +	unsigned loopc        : 9;   /* 21 : 29                          */
> +	unsigned reserved_2   : 2;   /* 30 : 31                          */
> +
> +	/* Byte 4 ~ Byte 7 */
> +	unsigned div_ref      : 7;   /*  0 : 6     input clock divider   */
> +	unsigned locked       : 1;   /*  7         PLL locked flag       */
> +	unsigned sel_out      : 1;   /*  8         output clk selector   */
> +	unsigned reserved_3   : 2;   /*  9 : 10    reserved              */
> +	unsigned set_param    : 1;   /*  11        set pll param         */
> +	unsigned bypass       : 1;   /*  12                              */
> +	unsigned powerdown    : 1;   /*  13                              */
> +	unsigned reserved_4   : 18;  /*  14 : 31                         */
> +};
> +
> +
> +/* u128 */
> +struct ls2k1000_pixpll_bitmap {
> +	/* Byte 0 ~ Byte 3 */
> +	unsigned sel_out      :  1;  /*  0      select this PLL          */
> +	unsigned reserved_1   :  1;  /*  1                               */
> +	unsigned sw_adj_en    :  1;  /*  2      allow software adjust    */
> +	unsigned bypass       :  1;  /*  3      bypass L1 PLL            */
> +	unsigned reserved_2   :  3;  /*  4:6                             */
> +	unsigned lock_en      :  1;  /*  7      enable lock L1 PLL       */
> +	unsigned reserved_3   :  2;  /*  8:9                             */
> +	unsigned lock_check   :  2;  /* 10:11   precision check          */
> +	unsigned reserved_4   :  4;  /* 12:15                            */
> +
> +	unsigned locked       :  1;  /* 16      PLL locked flag bit      */
> +	unsigned reserved_5   :  2;  /* 17:18                            */
> +	unsigned powerdown    :  1;  /* 19      powerdown the pll if set */
> +	unsigned reserved_6   :  6;  /* 20:25                            */
> +	unsigned div_ref      :  6;  /* 26:31   L1 Prescaler             */
> +
> +	/* Byte 4 ~ Byte 7 */
> +	unsigned loopc        : 10;  /* 32:41   Clock Multiplier         */
> +	unsigned l1_div       :  6;  /* 42:47   not used                 */
> +	unsigned reserved_7   : 16;  /* 48:63                            */
> +
> +	/* Byte 8 ~ Byte 15 */
> +	unsigned div_out      :  6;  /* 0 : 5   output clock divider     */
> +	unsigned reserved_8   : 26;  /* 6 : 31                           */
> +	unsigned reserved_9   : 32;  /* 70: 127                          */
> +};
> +
> +
> +/* u32 */
> +struct ls2k0500_pixpll_bitmap {
> +	/* Byte 0 ~ Byte 1 */
> +	unsigned sel_out      : 1;
> +	unsigned reserved_1   : 2;
> +	unsigned sw_adj_en    : 1;   /* allow software adjust              */
> +	unsigned bypass       : 1;   /* bypass L1 PLL                      */
> +	unsigned powerdown    : 1;   /* write 1 to powerdown the PLL       */
> +	unsigned reserved_2   : 1;
> +	unsigned locked       : 1;   /*  7     Is L1 PLL locked, read only */
> +	unsigned div_ref      : 6;   /*  8:13  ref clock divider           */
> +	unsigned reserved_3   : 2;   /* 14:15                              */
> +	/* Byte 2 ~ Byte 3 */
> +	unsigned loopc        : 8;   /* 16:23   Clock Multiplier           */
> +	unsigned div_out      : 6;   /* 24:29   output clock divider       */
> +	unsigned reserved_4   : 2;   /* 30:31                              */
> +};
> +
> +
> +/*
> + * NOTE: All loongson's cpu is little endian.
> + */
> +union lsdc_pix_pll_param {
> +	struct ls7a1000_pixpll_bitmap ls7a1000;
> +	struct ls2k1000_pixpll_bitmap ls2k1000;
> +	struct ls2k0500_pixpll_bitmap ls2k0500;
> +
> +	u32 dword[4];
> +};
> +
> +/*
> + * pixel clock to pll parameters translation table
> + */
> +struct pixclk_to_pll_parm {
> +	/* kHz */
> +	unsigned int clock;
> +
> +	/* unrelated information */
> +	unsigned short width;
> +	unsigned short height;
> +	unsigned short vrefresh;
> +
> +	/* Stores parameters for programming the Hardware PLLs */
> +	unsigned short div_out;
> +	unsigned short loopc;
> +	unsigned short div_ref;
> +};
> +
> +
> +/*
> + * Small cached value to speed up pll parameter calculation
> + */
> +static const struct pixclk_to_pll_parm pll_param_table[] =3D {
> +	{148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
> +						/* 1920x1080@50Hz */
> +	{174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
> +	{181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
> +	{146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
> +	{135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
> +
> +	{108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz  */
> +						/* 1280x1024@60Hz */
> +						/* 1280x960@60Hz */
> +						/* 1152x864@75Hz */
> +
> +	{106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
> +	{88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
> +	{83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
> +	{71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
> +
> +	{74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
> +						/* 1280x720@50Hz */
> +
> +	{78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
> +	{75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
> +	{65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
> +
> +	{51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
> +
> +	{57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
> +	{49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
> +	{50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
> +	{40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
> +	{36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
> +	{31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
> +						/* 640x480@73Hz */
> +
> +	{30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
> +	{27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
> +	{25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
> +	{25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
> +						/* 720x480@60Hz */
> +};
> +
> +/**
> + * lsdc_pixpll_setup
> + *
> + * @this: point to the object which calling this function
> + *
> + * ioremap the device dependent register before using it
> + */
> +static int lsdc_pixpll_setup(struct lsdc_pll * const this)
> +{
> +	this->mmio =3D ioremap(this->reg_base, this->reg_size);
> +
> +	drm_info(this->ddev, "PIXPLL%u REG[%x, %u] map to %llx\n",
> +		this->index, this->reg_base, this->reg_size, (u64)this->mmio);
> +
> +	return 0;
> +}
> +
> +
> +
> +/*
> + * Find a set of pll parameters (to generate pixel clock) from a static
> + * local table, which avoid to compute the pll parameter everytime a
> + * modeset is triggered.
> + *
> + * @this: point to the object which calling this function
> + * @clock: the desired pixel clock wanted to generate, the unit is kHz
> + * @pout: pointer to where hardware pll parameters(if found) to save
> + *
> + *  Return true if a parameter is found, otherwise return false.
> + */
> +static bool lsdc_pixpll_find(struct lsdc_pll * const this,
> +			     unsigned int clock,
> +			     struct lsdc_pll_core_values * const pout)
> +{
> +	unsigned int num =3D ARRAY_SIZE(pll_param_table);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < num; i++) {
> +		if (clock !=3D pll_param_table[i].clock)
> +			continue;
> +
> +		pout->div_ref =3D pll_param_table[i].div_ref;
> +		pout->loopc   =3D pll_param_table[i].loopc;
> +		pout->div_out =3D pll_param_table[i].div_out;
> +
> +		return true;
> +	}
> +
> +	drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
> +
> +	return false;
> +}
> +
> +/*
> + * Find a set of pll parameters which have minimal difference with desir=
ed
> + * clock frequency. It does that by computing the all of pll parameters
> + * combines possible and compare the diff and find the minimal.
> + *
> + *  clock_out =3D refclk / div_ref * loopc / div_out
> + *
> + *  refclk is fixed as 100MHz in ls7a1000, ls2k1000 and ls2k0500
> + *
> + * @this: point to the object which calling this function
> + * @clk: the desired pixel clock wanted to generate, the unit is kHz
> + * @verbose: print the pll parameter and the actual pixel clock.
> + * @pout: pointer to where hardware pll parameters(if found) to save
> + *
> + *  Return true if a parameter is found, otherwise return false.
> + */
> +static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
> +				unsigned int clk,
> +				bool verbose,
> +				struct lsdc_pll_core_values * const pout)
> +{
> +	unsigned int refclk =3D this->ref_clock;
> +	const unsigned int tolerance =3D 1000;
> +	unsigned int min =3D tolerance;
> +	unsigned int div_out, loopc, div_ref;
> +
> +	if (lsdc_pixpll_find(this, clk, pout))
> +		return true;
> +
> +	for (div_out =3D 6; div_out < 64; div_out++) {
> +		for (div_ref =3D 3; div_ref < 6; div_ref++) {
> +			for (loopc =3D 6; loopc < 161; loopc++) {
> +				int diff;
> +
> +				if (loopc < 12 * div_ref)
> +					continue;
> +				if (loopc > 32 * div_ref)
> +					continue;
> +
> +				diff =3D clk * div_out - refclk * loopc / div_ref;
> +
> +				if (diff < 0)
> +					diff =3D -diff;
> +
> +				if (diff < min) {
> +					min =3D diff;
> +					pout->div_ref =3D div_ref;
> +					pout->div_out =3D div_out;
> +					pout->loopc =3D loopc;
> +
> +					if (diff =3D=3D 0)
> +						return true;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (verbose) {
> +		unsigned int clk_out;
> +
> +		clk_out =3D refclk / pout->div_ref * pout->loopc / pout->div_out;
> +
> +		drm_info(this->ddev, "pixpll%u\n", this->index);
> +
> +		drm_info(this->ddev, "div_ref=3D%u, loopc=3D%u, div_out=3D%u\n",
> +				pout->div_ref, pout->loopc, pout->div_out);
> +
> +		drm_info(this->ddev, "desired clk=3D%u, actual out=3D%u, diff=3D%d\n",
> +				clk, clk_out, clk_out - clk);
> +	}
> +
> +	return min < tolerance;
> +}
> +
> +/*
> + * Update the pll parameters to hardware, target to the pixpll in ls7a10=
00
> + *
> + * @this: point to the object which calling this function
> + * @param: pointer to where the parameters passed in
> + *
> + *  Return true if a parameter is found, otherwise return false.
> + */
> +static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
> +			const struct lsdc_pll_core_values * const param)
> +{
> +	u32 val;
> +	unsigned int counter =3D 0;
> +	void __iomem *reg =3D this->mmio;
> +	bool locked;
> +
> +
> +	/* clear sel_pll_out0 */
> +	val =3D readl(reg + 0x4);
> +	val &=3D ~(1 << 8);
> +	writel(val, reg + 0x4);
> +
> +	/* set pll_pd */
> +	val =3D readl(reg + 0x4);
> +	val |=3D (1 << 13);
> +	writel(val, reg + 0x4);
> +
> +	/* clear set_pll_param */
> +	val =3D readl(reg + 0x4);
> +	val &=3D ~(1 << 11);
> +	writel(val, reg + 0x4);
> +
> +	/* clear old value & config new value */
> +	val =3D readl(reg + 0x04);
> +	val &=3D ~0x7F;
> +
> +	val |=3D param->div_ref;        /* div_ref */
> +	writel(val, reg + 0x4);
> +
> +	val =3D readl(reg);
> +	val &=3D ~(0x7f << 0);
> +	val |=3D param->div_out;        /* div_out */
> +	val &=3D ~(0x1ffUL << 21);
> +	val |=3D param->loopc << 21;    /* loopc */
> +	writel(val, reg);
> +
> +	/* set set_pll_param */
> +	val =3D readl(reg + 0x4);
> +	val |=3D (1 << 11);
> +	writel(val, reg + 0x4);
> +
> +	/* clear pll_pd */
> +	val =3D readl(reg + 0x4);
> +	val &=3D ~(1 << 13);
> +	writel(val, reg + 0x4);
> +
> +	/* wait pll lock */
> +	do {
> +		val =3D readl(reg + 0x4);
> +		locked =3D val & 0x80;
> +		counter++;
> +	} while (locked =3D=3D false);
> +
> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
> +
> +	/* set sel_pll_out0 */
> +	val =3D readl(reg + 0x4);
> +	val |=3D (1UL << 8);
> +	writel(val, reg + 0x4);
> +
> +	return 0;
> +}
> +
> +
> +/*
> + * Update the pll parameters to hardware, target to the pixpll in ls2k10=
00
> + *
> + * @this: point to the object which calling this function
> + * @param: pointer to where the parameters passed in
> + *
> + *  Return true if a parameter is found, otherwise return false.
> + */
> +static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
> +			const struct lsdc_pll_core_values * const param)
> +{
> +	void __iomem *reg =3D this->mmio;
> +	unsigned int counter =3D 0;
> +	bool locked =3D false;
> +	u32 val;
> +
> +	val =3D readl(reg);
> +	/* Bypass the software configured PLL, using refclk directly */
> +	val &=3D ~(1 << 0);
> +	writel(val, reg);
> +
> +	/* powerdown the PLL */
> +	val |=3D (1 << 19);
> +	writel(val, reg);
> +
> +	/* Allow the software configuration */
> +	val &=3D ~(1 << 2);
> +	writel(val, reg);
> +
> +	/* allow L1 PLL lock */
> +	val =3D (1L << 7) | (3L << 10);
> +	writel(val, reg);
> +
> +	/* clear div_ref bit field */
> +	val &=3D ~(0x3f << 26);
> +	/* set div_ref bit field */
> +	val =3D val | (param->div_ref << 26);
> +	writel(val, reg);
> +
> +	val =3D readl(reg + 4);
> +	/* clear loopc bit field */
> +	val &=3D ~0x0fff;
> +	/* set loopc bit field */
> +	val |=3D param->loopc;
> +	writel(val, reg + 4);
> +
> +	/* set div_out */
> +	writel(param->div_out, reg + 8);
> +
> +	val =3D readl(reg);
> +	/* use the software configure param */
> +	val |=3D (1 << 2);
> +	/* powerup the PLL */
> +	val &=3D ~(1 << 19);
> +	writel(val, reg);
> +
> +	/* wait pll setup and locked */
> +	do {
> +		val =3D readl(reg);
> +		locked =3D val & 0x10000;
> +		counter++;
> +	} while (locked =3D=3D false);
> +
> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
> +
> +	/* Switch to the above software configured PLL instead of refclk */
> +	val |=3D 1;
> +	writel(val, reg);
> +
> +	return 0;
> +}
> +
> +/*
> + * Update the pll parameters to hardware, target to the pixpll in ls2k05=
00
> + *
> + * @this: point to the object which calling this function
> + * @param: pointer to where the parameters passed in
> + *
> + *  Return true if a parameter is found, otherwise return false.
> + */
> +
> +static int ls2k0500_pixpll_param_update(struct lsdc_pll * const this,
> +			const struct lsdc_pll_core_values * const param)
> +{
> +	void __iomem *reg =3D this->mmio;
> +	unsigned int counter =3D 0;
> +	bool locked =3D false;
> +	u32 val;
> +
> +	/* Bypass the software configured PLL, using refclk directly */
> +	val =3D readl(reg);
> +	val &=3D ~(1 << 0);
> +	writel(val, reg);
> +
> +	/* Powerdown the PLL */
> +	val =3D readl(reg);
> +	val |=3D (1 << 5);
> +	writel(val, reg);
> +
> +	/* Allow the software configuration */
> +	val |=3D (1 << 3);
> +	writel(val, reg);
> +
> +	/* Update the pll params */
> +	val =3D (param->div_out << 24) |
> +	      (param->loopc << 16) |
> +	      (param->div_ref << 8);
> +
> +	writel(val, reg);
> +
> +	/* Powerup the PLL */
> +	val =3D readl(reg);
> +	val &=3D ~(1 << 5);
> +	writel(val, reg);
> +
> +	/* wait pll setup and locked */
> +	do {
> +		val =3D readl(reg);
> +		locked =3D val & 0x80;
> +		counter++;
> +	} while (locked =3D=3D false);
> +
> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
> +
> +	/* Switch to the above software configured PLL instead of refclk */
> +	writel((val | 1), reg);
> +
> +	return 0;
> +}
> +
> +
> +#define LSDC_PIXPLL_BITMAP(type,var,parms) \
> +		struct type ## _pixpll_bitmap *var =3D &parms.type
> +
> +#define LSDC_PIXPLL_PRINT_CODE_BLOCK(ddev,var,index,refclk)             =
   \
> +{                                                                       =
   \
> +	out_clk =3D refclk / var->div_ref * var->loopc / var->div_out;       \
> +	drm_info(ddev, "div_ref=3D%u, loopc=3D%u, div_out=3D%u\n",             =
  \
> +			var->div_ref, var->loopc, var->div_out);           \
> +	drm_info(ddev, "locked: %s\n", var->locked ? "Yes" : "No");        \
> +	drm_info(ddev, "bypass: %s\n", var->bypass ? "Yes" : "No");        \
> +	drm_info(ddev, "powerdown: %s\n", var->powerdown ? "Yes" : "No");  \
> +	drm_info(ddev, "set_out: %s\n", var->sel_out ? "Yes" : "No");      \
> +	drm_info(ddev, "pixpll%u generate %ukHz\n", index, out_clk);       \
> +	drm_info(ddev, "\n");                                              \
> +}

This should be a debug-level trace

Maxime

--pho5irsonjgn67rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfuZSwAKCRDj7w1vZxhR
xbgqAQD9B0S3qKCLFY5FEXW7Ux4BRh9tSBnllehpzrVSUI74vwEA5s4osLYGywo0
L5/8bzDsQVMRJ4JWxVNsBd1bdH910gc=
=1jeO
-----END PGP SIGNATURE-----

--pho5irsonjgn67rj--
