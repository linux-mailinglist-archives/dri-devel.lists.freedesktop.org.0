Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C927C147
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1376E1A3;
	Tue, 29 Sep 2020 09:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2916E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:32:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so4043148wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3lH2hRZWBD8vVlXP8FsK4E20UVB6fjD9T/WlNYXP22Y=;
 b=ENio1jS9/zhn3QkiD7jSHavE3dkN8Fst2QsTyFYUvQBe84za6EY36kC4fE4p8HTUOA
 a28zmFAk4pPn/SpBAkxGOiTw3QPWgACIKY/56RpHoVFNaJDNGAz85kwz39hhi7/jeeaC
 G/QX9hL1tTmDTZFbpd4HDIg6vTsRjk9JPMZh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3lH2hRZWBD8vVlXP8FsK4E20UVB6fjD9T/WlNYXP22Y=;
 b=HO/ja2ser3GPOZgJKt9D99xtEaQB6Q9pKJxA9HBq+lVAPR432qqQbvszJep4CzaHd9
 i6JrhEh4a2yUDUl5IqW5SbiMZyMEHiKvQ5fEwBCzYr+NxRwU17glgSHODLgBWY/BmePk
 9yYk7wuUyo9mf1psZVVoF/U7aozHvCV0DxyelYxDMwLxdXvcCupnGrrMkmI0bFGTlaQ7
 /lRr4GEnsiPf6OBeeiwAIFiAclSd3dOmkrH+vh3sJ/lhMcHRPSX9mNmfu9G+ZZYoEmUp
 0zWE6ieBXZ1jLcDEk0WZv207rnjxau+RjafyOJ5kHruPlPw/W79kVQp+nYKlHUR+oJQt
 KR+w==
X-Gm-Message-State: AOAM532vDX2zLGSsY8wpb/bhZQhBCUUoZlLcsg8j1dzNPkF+8OVIke1N
 B5CcdlgPTpCO3+HbFolEOJgYyw==
X-Google-Smtp-Source: ABdhPJymXMB1XUDNz+fd0H+JIYLjbkDIw3s9QUO784v62JORTMMMaAnmCEzRfxgsdMxXzVHF1RBxrQ==
X-Received: by 2002:a1c:96cf:: with SMTP id y198mr3722583wmd.104.1601371923948; 
 Tue, 29 Sep 2020 02:32:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o4sm4895212wru.55.2020.09.29.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:32:03 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:32:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Revert "video: fbdev: amba-clcd: Retire elder CLCD driver"
Message-ID: <20200929093201.GL438822@phenom.ffwll.local>
References: <20200928200856.1897023-1-pcc@google.com>
 <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>, Kevin Brodsky <Kevin.Brodsky@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 09:28:56AM +0200, Neil Armstrong wrote:
> Hi,
> =

> On 28/09/2020 22:08, Peter Collingbourne wrote:
> > Also revert the follow-up change "drm: pl111: Absorb the external
> > register header".
> > =

> > This reverts commits 7e4e589db76a3cf4c1f534eb5a09cc6422766b93
> > and 0fb8125635e8eb5483fb095f98dcf0651206a7b8.
> > =

> > The fbdev driver is used by Android's FVP configuration. Using the
> > DRM driver together with DRM's fbdev emulation results in a failure
> > to boot Android. The root cause is that Android's generic fbdev
> > userspace driver relies on the ability to set the pixel format via
> > FBIOPUT_VSCREENINFO, which is not supported by fbdev emulation.
> =

> Can't Android FVP use drm-hwcomposer instead ?

Also, if we need to add more random fbdev ioctls to the drm fbdev
emulation, then let's do that. Not keep fbdev drivers on life support for
longer than necessary.

> =

> Neil
> =

> > =

> > There have been other less critical behavioral differences identified
> > between the fbdev driver and the DRM driver with fbdev emulation. The
> > DRM driver exposes different values for the panel's width, height and
> > refresh rate, and the DRM driver fails a FBIOPUT_VSCREENINFO syscall
> > with yres_virtual greater than the maximum supported value instead
> > of letting the syscall succeed and setting yres_virtual based on yres.

Also something that should be fixed I think in upstream, in the drm fbdev
emulation. At least doesn't sound like it's something unfixable.
-Daniel

> > =

> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > View this change in Gerrit: https://linux-review.googlesource.com/q/I2d=
7e59b0e693d9fec206d40df190c5aa02844b56
> > =

> >  MAINTAINERS                             |   5 +
> >  drivers/gpu/drm/pl111/pl111_debugfs.c   |   1 +
> >  drivers/gpu/drm/pl111/pl111_display.c   |   1 +
> >  drivers/gpu/drm/pl111/pl111_drm.h       |  73 --
> >  drivers/gpu/drm/pl111/pl111_drv.c       |   1 +
> >  drivers/gpu/drm/pl111/pl111_versatile.c |   1 +
> >  drivers/video/fbdev/Kconfig             |  20 +
> >  drivers/video/fbdev/Makefile            |   1 +
> >  drivers/video/fbdev/amba-clcd.c         | 986 ++++++++++++++++++++++++
> >  include/linux/amba/clcd-regs.h          |  87 +++
> >  include/linux/amba/clcd.h               | 290 +++++++
> >  11 files changed, 1393 insertions(+), 73 deletions(-)
> >  create mode 100644 drivers/video/fbdev/amba-clcd.c
> >  create mode 100644 include/linux/amba/clcd-regs.h
> >  create mode 100644 include/linux/amba/clcd.h
> > =

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 190c7fa2ea01..671c1fa79e64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1460,6 +1460,11 @@ S:	Odd Fixes
> >  F:	drivers/amba/
> >  F:	include/linux/amba/bus.h
> >  =

> > +ARM PRIMECELL CLCD PL110 DRIVER
> > +M:	Russell King <linux@armlinux.org.uk>
> > +S:	Odd Fixes
> > +F:	drivers/video/fbdev/amba-clcd.*
> > +
> >  ARM PRIMECELL KMI PL050 DRIVER
> >  M:	Russell King <linux@armlinux.org.uk>
> >  S:	Odd Fixes
> > diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl=
111/pl111_debugfs.c
> > index 317f68abf18b..26ca8cdf3e60 100644
> > --- a/drivers/gpu/drm/pl111/pl111_debugfs.c
> > +++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
> > @@ -3,6 +3,7 @@
> >   *  Copyright =A9 2017 Broadcom
> >   */
> >  =

> > +#include <linux/amba/clcd-regs.h>
> >  #include <linux/seq_file.h>
> >  =

> >  #include <drm/drm_debugfs.h>
> > diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl=
111/pl111_display.c
> > index b3e8697cafcf..703ddc803c55 100644
> > --- a/drivers/gpu/drm/pl111/pl111_display.c
> > +++ b/drivers/gpu/drm/pl111/pl111_display.c
> > @@ -9,6 +9,7 @@
> >   * Copyright (C) 2011 Texas Instruments
> >   */
> >  =

> > +#include <linux/amba/clcd-regs.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/version.h>
> > diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/=
pl111_drm.h
> > index 2a46b5bd8576..ba399bcb792f 100644
> > --- a/drivers/gpu/drm/pl111/pl111_drm.h
> > +++ b/drivers/gpu/drm/pl111/pl111_drm.h
> > @@ -23,79 +23,6 @@
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >  =

> > -/*
> > - * CLCD Controller Internal Register addresses
> > - */
> > -#define CLCD_TIM0		0x00000000
> > -#define CLCD_TIM1		0x00000004
> > -#define CLCD_TIM2		0x00000008
> > -#define CLCD_TIM3		0x0000000c
> > -#define CLCD_UBAS		0x00000010
> > -#define CLCD_LBAS		0x00000014
> > -
> > -#define CLCD_PL110_IENB		0x00000018
> > -#define CLCD_PL110_CNTL		0x0000001c
> > -#define CLCD_PL110_STAT		0x00000020
> > -#define CLCD_PL110_INTR		0x00000024
> > -#define CLCD_PL110_UCUR		0x00000028
> > -#define CLCD_PL110_LCUR		0x0000002C
> > -
> > -#define CLCD_PL111_CNTL		0x00000018
> > -#define CLCD_PL111_IENB		0x0000001c
> > -#define CLCD_PL111_RIS		0x00000020
> > -#define CLCD_PL111_MIS		0x00000024
> > -#define CLCD_PL111_ICR		0x00000028
> > -#define CLCD_PL111_UCUR		0x0000002c
> > -#define CLCD_PL111_LCUR		0x00000030
> > -
> > -#define CLCD_PALL		0x00000200
> > -#define CLCD_PALETTE		0x00000200
> > -
> > -#define TIM2_PCD_LO_MASK	GENMASK(4, 0)
> > -#define TIM2_PCD_LO_BITS	5
> > -#define TIM2_CLKSEL		(1 << 5)
> > -#define TIM2_ACB_MASK		GENMASK(10, 6)
> > -#define TIM2_IVS		(1 << 11)
> > -#define TIM2_IHS		(1 << 12)
> > -#define TIM2_IPC		(1 << 13)
> > -#define TIM2_IOE		(1 << 14)
> > -#define TIM2_BCD		(1 << 26)
> > -#define TIM2_PCD_HI_MASK	GENMASK(31, 27)
> > -#define TIM2_PCD_HI_BITS	5
> > -#define TIM2_PCD_HI_SHIFT	27
> > -
> > -#define CNTL_LCDEN		(1 << 0)
> > -#define CNTL_LCDBPP1		(0 << 1)
> > -#define CNTL_LCDBPP2		(1 << 1)
> > -#define CNTL_LCDBPP4		(2 << 1)
> > -#define CNTL_LCDBPP8		(3 << 1)
> > -#define CNTL_LCDBPP16		(4 << 1)
> > -#define CNTL_LCDBPP16_565	(6 << 1)
> > -#define CNTL_LCDBPP16_444	(7 << 1)
> > -#define CNTL_LCDBPP24		(5 << 1)
> > -#define CNTL_LCDBW		(1 << 4)
> > -#define CNTL_LCDTFT		(1 << 5)
> > -#define CNTL_LCDMONO8		(1 << 6)
> > -#define CNTL_LCDDUAL		(1 << 7)
> > -#define CNTL_BGR		(1 << 8)
> > -#define CNTL_BEBO		(1 << 9)
> > -#define CNTL_BEPO		(1 << 10)
> > -#define CNTL_LCDPWR		(1 << 11)
> > -#define CNTL_LCDVCOMP(x)	((x) << 12)
> > -#define CNTL_LDMAFIFOTIME	(1 << 15)
> > -#define CNTL_WATERMARK		(1 << 16)
> > -
> > -/* ST Microelectronics variant bits */
> > -#define CNTL_ST_1XBPP_444	0x0
> > -#define CNTL_ST_1XBPP_5551	(1 << 17)
> > -#define CNTL_ST_1XBPP_565	(1 << 18)
> > -#define CNTL_ST_CDWID_12	0x0
> > -#define CNTL_ST_CDWID_16	(1 << 19)
> > -#define CNTL_ST_CDWID_18	(1 << 20)
> > -#define CNTL_ST_CDWID_24	((1 << 19) | (1 << 20))
> > -#define CNTL_ST_CEAEN		(1 << 21)
> > -#define CNTL_ST_LCDBPP24_PACKED	(6 << 1)
> > -
> >  #define CLCD_IRQ_NEXTBASE_UPDATE BIT(2)
> >  =

> >  struct drm_minor;
> > diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/=
pl111_drv.c
> > index 96e58fda75d8..da0c39dae874 100644
> > --- a/drivers/gpu/drm/pl111/pl111_drv.c
> > +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> > @@ -47,6 +47,7 @@
> >   */
> >  =

> >  #include <linux/amba/bus.h>
> > +#include <linux/amba/clcd-regs.h>
> >  #include <linux/dma-buf.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/=
pl111/pl111_versatile.c
> > index bdd883f4f0da..1127082e9a60 100644
> > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > @@ -9,6 +9,7 @@
> >   * Major contributions and discoveries by Russell King.
> >   */
> >  =

> > +#include <linux/amba/clcd-regs.h>
> >  #include <linux/bitops.h>
> >  #include <linux/device.h>
> >  #include <linux/mfd/syscon.h>
> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index b2c9dd4f0cb5..402e85450bb5 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -272,6 +272,26 @@ config FB_PM2_FIFO_DISCONNECT
> >  	help
> >  	  Support the Permedia2 FIFO disconnect feature.
> >  =

> > +config FB_ARMCLCD
> > +	tristate "ARM PrimeCell PL110 support"
> > +	depends on ARM || ARM64 || COMPILE_TEST
> > +	depends on FB && ARM_AMBA && HAS_IOMEM
> > +	select FB_CFB_FILLRECT
> > +	select FB_CFB_COPYAREA
> > +	select FB_CFB_IMAGEBLIT
> > +	select FB_MODE_HELPERS if OF
> > +	select VIDEOMODE_HELPERS if OF
> > +	select BACKLIGHT_CLASS_DEVICE if OF
> > +	help
> > +	  This framebuffer device driver is for the ARM PrimeCell PL110
> > +	  Colour LCD controller.  ARM PrimeCells provide the building
> > +	  blocks for System on a Chip devices.
> > +
> > +	  If you want to compile this as a module (=3Dcode which can be
> > +	  inserted into and removed from the running kernel), say M
> > +	  here and read <file:Documentation/kbuild/modules.rst>.  The module
> > +	  will be called amba-clcd.
> > +
> >  config FB_ACORN
> >  	bool "Acorn VIDC support"
> >  	depends on (FB =3D y) && ARM && ARCH_ACORN
> > diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
> > index cad4fb64442a..a0705b99e643 100644
> > --- a/drivers/video/fbdev/Makefile
> > +++ b/drivers/video/fbdev/Makefile
> > @@ -75,6 +75,7 @@ obj-$(CONFIG_FB_HIT)              +=3D hitfb.o
> >  obj-$(CONFIG_FB_ATMEL)		  +=3D atmel_lcdfb.o
> >  obj-$(CONFIG_FB_PVR2)             +=3D pvr2fb.o
> >  obj-$(CONFIG_FB_VOODOO1)          +=3D sstfb.o
> > +obj-$(CONFIG_FB_ARMCLCD)	  +=3D amba-clcd.o
> >  obj-$(CONFIG_FB_GOLDFISH)         +=3D goldfishfb.o
> >  obj-$(CONFIG_FB_68328)            +=3D 68328fb.o
> >  obj-$(CONFIG_FB_GBE)              +=3D gbefb.o
> > diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba=
-clcd.c
> > new file mode 100644
> > index 000000000000..b7682de412d8
> > --- /dev/null
> > +++ b/drivers/video/fbdev/amba-clcd.c
> > @@ -0,0 +1,986 @@
> > +/*
> > + *  linux/drivers/video/amba-clcd.c
> > + *
> > + * Copyright (C) 2001 ARM Limited, by David A Rusling
> > + * Updated to 2.5, Deep Blue Solutions Ltd.
> > + *
> > + * This file is subject to the terms and conditions of the GNU General=
 Public
> > + * License.  See the file COPYING in the main directory of this archive
> > + * for more details.
> > + *
> > + *  ARM PrimeCell PL110 Color LCD Controller
> > + */
> > +#include <linux/amba/bus.h>
> > +#include <linux/amba/clcd.h>
> > +#include <linux/backlight.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/fb.h>
> > +#include <linux/init.h>
> > +#include <linux/ioport.h>
> > +#include <linux/list.h>
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <video/display_timing.h>
> > +#include <video/of_display_timing.h>
> > +#include <video/videomode.h>
> > +
> > +#define to_clcd(info)	container_of(info, struct clcd_fb, fb)
> > +
> > +/* This is limited to 16 characters when displayed by X startup */
> > +static const char *clcd_name =3D "CLCD FB";
> > +
> > +/*
> > + * Unfortunately, the enable/disable functions may be called either fr=
om
> > + * process or IRQ context, and we _need_ to delay.  This is _not_ good.
> > + */
> > +static inline void clcdfb_sleep(unsigned int ms)
> > +{
> > +	if (in_atomic()) {
> > +		mdelay(ms);
> > +	} else {
> > +		msleep(ms);
> > +	}
> > +}
> > +
> > +static inline void clcdfb_set_start(struct clcd_fb *fb)
> > +{
> > +	unsigned long ustart =3D fb->fb.fix.smem_start;
> > +	unsigned long lstart;
> > +
> > +	ustart +=3D fb->fb.var.yoffset * fb->fb.fix.line_length;
> > +	lstart =3D ustart + fb->fb.var.yres * fb->fb.fix.line_length / 2;
> > +
> > +	writel(ustart, fb->regs + CLCD_UBAS);
> > +	writel(lstart, fb->regs + CLCD_LBAS);
> > +}
> > +
> > +static void clcdfb_disable(struct clcd_fb *fb)
> > +{
> > +	u32 val;
> > +
> > +	if (fb->board->disable)
> > +		fb->board->disable(fb);
> > +
> > +	if (fb->panel->backlight) {
> > +		fb->panel->backlight->props.power =3D FB_BLANK_POWERDOWN;
> > +		backlight_update_status(fb->panel->backlight);
> > +	}
> > +
> > +	val =3D readl(fb->regs + fb->off_cntl);
> > +	if (val & CNTL_LCDPWR) {
> > +		val &=3D ~CNTL_LCDPWR;
> > +		writel(val, fb->regs + fb->off_cntl);
> > +
> > +		clcdfb_sleep(20);
> > +	}
> > +	if (val & CNTL_LCDEN) {
> > +		val &=3D ~CNTL_LCDEN;
> > +		writel(val, fb->regs + fb->off_cntl);
> > +	}
> > +
> > +	/*
> > +	 * Disable CLCD clock source.
> > +	 */
> > +	if (fb->clk_enabled) {
> > +		fb->clk_enabled =3D false;
> > +		clk_disable(fb->clk);
> > +	}
> > +}
> > +
> > +static void clcdfb_enable(struct clcd_fb *fb, u32 cntl)
> > +{
> > +	/*
> > +	 * Enable the CLCD clock source.
> > +	 */
> > +	if (!fb->clk_enabled) {
> > +		fb->clk_enabled =3D true;
> > +		clk_enable(fb->clk);
> > +	}
> > +
> > +	/*
> > +	 * Bring up by first enabling..
> > +	 */
> > +	cntl |=3D CNTL_LCDEN;
> > +	writel(cntl, fb->regs + fb->off_cntl);
> > +
> > +	clcdfb_sleep(20);
> > +
> > +	/*
> > +	 * and now apply power.
> > +	 */
> > +	cntl |=3D CNTL_LCDPWR;
> > +	writel(cntl, fb->regs + fb->off_cntl);
> > +
> > +	/*
> > +	 * Turn on backlight
> > +	 */
> > +	if (fb->panel->backlight) {
> > +		fb->panel->backlight->props.power =3D FB_BLANK_UNBLANK;
> > +		backlight_update_status(fb->panel->backlight);
> > +	}
> > +
> > +	/*
> > +	 * finally, enable the interface.
> > +	 */
> > +	if (fb->board->enable)
> > +		fb->board->enable(fb);
> > +}
> > +
> > +static int
> > +clcdfb_set_bitfields(struct clcd_fb *fb, struct fb_var_screeninfo *var)
> > +{
> > +	u32 caps;
> > +	int ret =3D 0;
> > +
> > +	if (fb->panel->caps && fb->board->caps)
> > +		caps =3D fb->panel->caps & fb->board->caps;
> > +	else {
> > +		/* Old way of specifying what can be used */
> > +		caps =3D fb->panel->cntl & CNTL_BGR ?
> > +			CLCD_CAP_BGR : CLCD_CAP_RGB;
> > +		/* But mask out 444 modes as they weren't supported */
> > +		caps &=3D ~CLCD_CAP_444;
> > +	}
> > +
> > +	/* Only TFT panels can do RGB888/BGR888 */
> > +	if (!(fb->panel->cntl & CNTL_LCDTFT))
> > +		caps &=3D ~CLCD_CAP_888;
> > +
> > +	memset(&var->transp, 0, sizeof(var->transp));
> > +
> > +	var->red.msb_right =3D 0;
> > +	var->green.msb_right =3D 0;
> > +	var->blue.msb_right =3D 0;
> > +
> > +	switch (var->bits_per_pixel) {
> > +	case 1:
> > +	case 2:
> > +	case 4:
> > +	case 8:
> > +		/* If we can't do 5551, reject */
> > +		caps &=3D CLCD_CAP_5551;
> > +		if (!caps) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > +
> > +		var->red.length		=3D var->bits_per_pixel;
> > +		var->red.offset		=3D 0;
> > +		var->green.length	=3D var->bits_per_pixel;
> > +		var->green.offset	=3D 0;
> > +		var->blue.length	=3D var->bits_per_pixel;
> > +		var->blue.offset	=3D 0;
> > +		break;
> > +
> > +	case 16:
> > +		/* If we can't do 444, 5551 or 565, reject */
> > +		if (!(caps & (CLCD_CAP_444 | CLCD_CAP_5551 | CLCD_CAP_565))) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > +
> > +		/*
> > +		 * Green length can be 4, 5 or 6 depending whether
> > +		 * we're operating in 444, 5551 or 565 mode.
> > +		 */
> > +		if (var->green.length =3D=3D 4 && caps & CLCD_CAP_444)
> > +			caps &=3D CLCD_CAP_444;
> > +		if (var->green.length =3D=3D 5 && caps & CLCD_CAP_5551)
> > +			caps &=3D CLCD_CAP_5551;
> > +		else if (var->green.length =3D=3D 6 && caps & CLCD_CAP_565)
> > +			caps &=3D CLCD_CAP_565;
> > +		else {
> > +			/*
> > +			 * PL110 officially only supports RGB555,
> > +			 * but may be wired up to allow RGB565.
> > +			 */
> > +			if (caps & CLCD_CAP_565) {
> > +				var->green.length =3D 6;
> > +				caps &=3D CLCD_CAP_565;
> > +			} else if (caps & CLCD_CAP_5551) {
> > +				var->green.length =3D 5;
> > +				caps &=3D CLCD_CAP_5551;
> > +			} else {
> > +				var->green.length =3D 4;
> > +				caps &=3D CLCD_CAP_444;
> > +			}
> > +		}
> > +
> > +		if (var->green.length >=3D 5) {
> > +			var->red.length =3D 5;
> > +			var->blue.length =3D 5;
> > +		} else {
> > +			var->red.length =3D 4;
> > +			var->blue.length =3D 4;
> > +		}
> > +		break;
> > +	case 32:
> > +		/* If we can't do 888, reject */
> > +		caps &=3D CLCD_CAP_888;
> > +		if (!caps) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > +
> > +		var->red.length =3D 8;
> > +		var->green.length =3D 8;
> > +		var->blue.length =3D 8;
> > +		break;
> > +	default:
> > +		ret =3D -EINVAL;
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * >=3D 16bpp displays have separate colour component bitfields
> > +	 * encoded in the pixel data.  Calculate their position from
> > +	 * the bitfield length defined above.
> > +	 */
> > +	if (ret =3D=3D 0 && var->bits_per_pixel >=3D 16) {
> > +		bool bgr, rgb;
> > +
> > +		bgr =3D caps & CLCD_CAP_BGR && var->blue.offset =3D=3D 0;
> > +		rgb =3D caps & CLCD_CAP_RGB && var->red.offset =3D=3D 0;
> > +
> > +		if (!bgr && !rgb)
> > +			/*
> > +			 * The requested format was not possible, try just
> > +			 * our capabilities.  One of BGR or RGB must be
> > +			 * supported.
> > +			 */
> > +			bgr =3D caps & CLCD_CAP_BGR;
> > +
> > +		if (bgr) {
> > +			var->blue.offset =3D 0;
> > +			var->green.offset =3D var->blue.offset + var->blue.length;
> > +			var->red.offset =3D var->green.offset + var->green.length;
> > +		} else {
> > +			var->red.offset =3D 0;
> > +			var->green.offset =3D var->red.offset + var->red.length;
> > +			var->blue.offset =3D var->green.offset + var->green.length;
> > +		}
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int clcdfb_check_var(struct fb_var_screeninfo *var, struct fb_i=
nfo *info)
> > +{
> > +	struct clcd_fb *fb =3D to_clcd(info);
> > +	int ret =3D -EINVAL;
> > +
> > +	if (fb->board->check)
> > +		ret =3D fb->board->check(fb, var);
> > +
> > +	if (ret =3D=3D 0 &&
> > +	    var->xres_virtual * var->bits_per_pixel / 8 *
> > +	    var->yres_virtual > fb->fb.fix.smem_len)
> > +		ret =3D -EINVAL;
> > +
> > +	if (ret =3D=3D 0)
> > +		ret =3D clcdfb_set_bitfields(fb, var);
> > +
> > +	return ret;
> > +}
> > +
> > +static int clcdfb_set_par(struct fb_info *info)
> > +{
> > +	struct clcd_fb *fb =3D to_clcd(info);
> > +	struct clcd_regs regs;
> > +
> > +	fb->fb.fix.line_length =3D fb->fb.var.xres_virtual *
> > +				 fb->fb.var.bits_per_pixel / 8;
> > +
> > +	if (fb->fb.var.bits_per_pixel <=3D 8)
> > +		fb->fb.fix.visual =3D FB_VISUAL_PSEUDOCOLOR;
> > +	else
> > +		fb->fb.fix.visual =3D FB_VISUAL_TRUECOLOR;
> > +
> > +	fb->board->decode(fb, &regs);
> > +
> > +	clcdfb_disable(fb);
> > +
> > +	writel(regs.tim0, fb->regs + CLCD_TIM0);
> > +	writel(regs.tim1, fb->regs + CLCD_TIM1);
> > +	writel(regs.tim2, fb->regs + CLCD_TIM2);
> > +	writel(regs.tim3, fb->regs + CLCD_TIM3);
> > +
> > +	clcdfb_set_start(fb);
> > +
> > +	clk_set_rate(fb->clk, (1000000000 / regs.pixclock) * 1000);
> > +
> > +	fb->clcd_cntl =3D regs.cntl;
> > +
> > +	clcdfb_enable(fb, regs.cntl);
> > +
> > +#ifdef DEBUG
> > +	printk(KERN_INFO
> > +	       "CLCD: Registers set to\n"
> > +	       "  %08x %08x %08x %08x\n"
> > +	       "  %08x %08x %08x %08x\n",
> > +		readl(fb->regs + CLCD_TIM0), readl(fb->regs + CLCD_TIM1),
> > +		readl(fb->regs + CLCD_TIM2), readl(fb->regs + CLCD_TIM3),
> > +		readl(fb->regs + CLCD_UBAS), readl(fb->regs + CLCD_LBAS),
> > +		readl(fb->regs + fb->off_ienb), readl(fb->regs + fb->off_cntl));
> > +#endif
> > +
> > +	return 0;
> > +}
> > +
> > +static inline u32 convert_bitfield(int val, struct fb_bitfield *bf)
> > +{
> > +	unsigned int mask =3D (1 << bf->length) - 1;
> > +
> > +	return (val >> (16 - bf->length) & mask) << bf->offset;
> > +}
> > +
> > +/*
> > + *  Set a single color register. The values supplied have a 16 bit
> > + *  magnitude.  Return !=3D 0 for invalid regno.
> > + */
> > +static int
> > +clcdfb_setcolreg(unsigned int regno, unsigned int red, unsigned int gr=
een,
> > +		 unsigned int blue, unsigned int transp, struct fb_info *info)
> > +{
> > +	struct clcd_fb *fb =3D to_clcd(info);
> > +
> > +	if (regno < 16)
> > +		fb->cmap[regno] =3D convert_bitfield(transp, &fb->fb.var.transp) |
> > +				  convert_bitfield(blue, &fb->fb.var.blue) |
> > +				  convert_bitfield(green, &fb->fb.var.green) |
> > +				  convert_bitfield(red, &fb->fb.var.red);
> > +
> > +	if (fb->fb.fix.visual =3D=3D FB_VISUAL_PSEUDOCOLOR && regno < 256) {
> > +		int hw_reg =3D CLCD_PALETTE + ((regno * 2) & ~3);
> > +		u32 val, mask, newval;
> > +
> > +		newval  =3D (red >> 11)  & 0x001f;
> > +		newval |=3D (green >> 6) & 0x03e0;
> > +		newval |=3D (blue >> 1)  & 0x7c00;
> > +
> > +		/*
> > +		 * 3.2.11: if we're configured for big endian
> > +		 * byte order, the palette entries are swapped.
> > +		 */
> > +		if (fb->clcd_cntl & CNTL_BEBO)
> > +			regno ^=3D 1;
> > +
> > +		if (regno & 1) {
> > +			newval <<=3D 16;
> > +			mask =3D 0x0000ffff;
> > +		} else {
> > +			mask =3D 0xffff0000;
> > +		}
> > +
> > +		val =3D readl(fb->regs + hw_reg) & mask;
> > +		writel(val | newval, fb->regs + hw_reg);
> > +	}
> > +
> > +	return regno > 255;
> > +}
> > +
> > +/*
> > + *  Blank the screen if blank_mode !=3D 0, else unblank. If blank =3D=
=3D NULL
> > + *  then the caller blanks by setting the CLUT (Color Look Up Table) t=
o all
> > + *  black. Return 0 if blanking succeeded, !=3D 0 if un-/blanking fail=
ed due
> > + *  to e.g. a video mode which doesn't support it. Implements VESA sus=
pend
> > + *  and powerdown modes on hardware that supports disabling hsync/vsyn=
c:
> > + *    blank_mode =3D=3D 2: suspend vsync
> > + *    blank_mode =3D=3D 3: suspend hsync
> > + *    blank_mode =3D=3D 4: powerdown
> > + */
> > +static int clcdfb_blank(int blank_mode, struct fb_info *info)
> > +{
> > +	struct clcd_fb *fb =3D to_clcd(info);
> > +
> > +	if (blank_mode !=3D 0) {
> > +		clcdfb_disable(fb);
> > +	} else {
> > +		clcdfb_enable(fb, fb->clcd_cntl);
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_mmap(struct fb_info *info,
> > +		       struct vm_area_struct *vma)
> > +{
> > +	struct clcd_fb *fb =3D to_clcd(info);
> > +	unsigned long len, off =3D vma->vm_pgoff << PAGE_SHIFT;
> > +	int ret =3D -EINVAL;
> > +
> > +	len =3D info->fix.smem_len;
> > +
> > +	if (off <=3D len && vma->vm_end - vma->vm_start <=3D len - off &&
> > +	    fb->board->mmap)
> > +		ret =3D fb->board->mmap(fb, vma);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct fb_ops clcdfb_ops =3D {
> > +	.owner		=3D THIS_MODULE,
> > +	.fb_check_var	=3D clcdfb_check_var,
> > +	.fb_set_par	=3D clcdfb_set_par,
> > +	.fb_setcolreg	=3D clcdfb_setcolreg,
> > +	.fb_blank	=3D clcdfb_blank,
> > +	.fb_fillrect	=3D cfb_fillrect,
> > +	.fb_copyarea	=3D cfb_copyarea,
> > +	.fb_imageblit	=3D cfb_imageblit,
> > +	.fb_mmap	=3D clcdfb_mmap,
> > +};
> > +
> > +static int clcdfb_register(struct clcd_fb *fb)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * ARM PL111 always has IENB at 0x1c; it's only PL110
> > +	 * which is reversed on some platforms.
> > +	 */
> > +	if (amba_manf(fb->dev) =3D=3D 0x41 && amba_part(fb->dev) =3D=3D 0x111=
) {
> > +		fb->off_ienb =3D CLCD_PL111_IENB;
> > +		fb->off_cntl =3D CLCD_PL111_CNTL;
> > +	} else {
> > +		fb->off_ienb =3D CLCD_PL110_IENB;
> > +		fb->off_cntl =3D CLCD_PL110_CNTL;
> > +	}
> > +
> > +	fb->clk =3D clk_get(&fb->dev->dev, NULL);
> > +	if (IS_ERR(fb->clk)) {
> > +		ret =3D PTR_ERR(fb->clk);
> > +		goto out;
> > +	}
> > +
> > +	ret =3D clk_prepare(fb->clk);
> > +	if (ret)
> > +		goto free_clk;
> > +
> > +	fb->fb.device		=3D &fb->dev->dev;
> > +
> > +	fb->fb.fix.mmio_start	=3D fb->dev->res.start;
> > +	fb->fb.fix.mmio_len	=3D resource_size(&fb->dev->res);
> > +
> > +	fb->regs =3D ioremap(fb->fb.fix.mmio_start, fb->fb.fix.mmio_len);
> > +	if (!fb->regs) {
> > +		printk(KERN_ERR "CLCD: unable to remap registers\n");
> > +		ret =3D -ENOMEM;
> > +		goto clk_unprep;
> > +	}
> > +
> > +	fb->fb.fbops		=3D &clcdfb_ops;
> > +	fb->fb.flags		=3D FBINFO_FLAG_DEFAULT;
> > +	fb->fb.pseudo_palette	=3D fb->cmap;
> > +
> > +	strncpy(fb->fb.fix.id, clcd_name, sizeof(fb->fb.fix.id));
> > +	fb->fb.fix.type		=3D FB_TYPE_PACKED_PIXELS;
> > +	fb->fb.fix.type_aux	=3D 0;
> > +	fb->fb.fix.xpanstep	=3D 0;
> > +	fb->fb.fix.ypanstep	=3D 0;
> > +	fb->fb.fix.ywrapstep	=3D 0;
> > +	fb->fb.fix.accel	=3D FB_ACCEL_NONE;
> > +
> > +	fb->fb.var.xres		=3D fb->panel->mode.xres;
> > +	fb->fb.var.yres		=3D fb->panel->mode.yres;
> > +	fb->fb.var.xres_virtual	=3D fb->panel->mode.xres;
> > +	fb->fb.var.yres_virtual	=3D fb->panel->mode.yres;
> > +	fb->fb.var.bits_per_pixel =3D fb->panel->bpp;
> > +	fb->fb.var.grayscale	=3D fb->panel->grayscale;
> > +	fb->fb.var.pixclock	=3D fb->panel->mode.pixclock;
> > +	fb->fb.var.left_margin	=3D fb->panel->mode.left_margin;
> > +	fb->fb.var.right_margin	=3D fb->panel->mode.right_margin;
> > +	fb->fb.var.upper_margin	=3D fb->panel->mode.upper_margin;
> > +	fb->fb.var.lower_margin	=3D fb->panel->mode.lower_margin;
> > +	fb->fb.var.hsync_len	=3D fb->panel->mode.hsync_len;
> > +	fb->fb.var.vsync_len	=3D fb->panel->mode.vsync_len;
> > +	fb->fb.var.sync		=3D fb->panel->mode.sync;
> > +	fb->fb.var.vmode	=3D fb->panel->mode.vmode;
> > +	fb->fb.var.activate	=3D FB_ACTIVATE_NOW;
> > +	fb->fb.var.nonstd	=3D 0;
> > +	fb->fb.var.height	=3D fb->panel->height;
> > +	fb->fb.var.width	=3D fb->panel->width;
> > +	fb->fb.var.accel_flags	=3D 0;
> > +
> > +	fb->fb.monspecs.hfmin	=3D 0;
> > +	fb->fb.monspecs.hfmax   =3D 100000;
> > +	fb->fb.monspecs.vfmin	=3D 0;
> > +	fb->fb.monspecs.vfmax	=3D 400;
> > +	fb->fb.monspecs.dclkmin =3D 1000000;
> > +	fb->fb.monspecs.dclkmax	=3D 100000000;
> > +
> > +	/*
> > +	 * Make sure that the bitfields are set appropriately.
> > +	 */
> > +	clcdfb_set_bitfields(fb, &fb->fb.var);
> > +
> > +	/*
> > +	 * Allocate colourmap.
> > +	 */
> > +	ret =3D fb_alloc_cmap(&fb->fb.cmap, 256, 0);
> > +	if (ret)
> > +		goto unmap;
> > +
> > +	/*
> > +	 * Ensure interrupts are disabled.
> > +	 */
> > +	writel(0, fb->regs + fb->off_ienb);
> > +
> > +	fb_set_var(&fb->fb, &fb->fb.var);
> > +
> > +	dev_info(&fb->dev->dev, "%s hardware, %s display\n",
> > +	         fb->board->name, fb->panel->mode.name);
> > +
> > +	ret =3D register_framebuffer(&fb->fb);
> > +	if (ret =3D=3D 0)
> > +		goto out;
> > +
> > +	printk(KERN_ERR "CLCD: cannot register framebuffer (%d)\n", ret);
> > +
> > +	fb_dealloc_cmap(&fb->fb.cmap);
> > + unmap:
> > +	iounmap(fb->regs);
> > + clk_unprep:
> > +	clk_unprepare(fb->clk);
> > + free_clk:
> > +	clk_put(fb->clk);
> > + out:
> > +	return ret;
> > +}
> > +
> > +#ifdef CONFIG_OF
> > +static int clcdfb_of_get_dpi_panel_mode(struct device_node *node,
> > +		struct clcd_panel *clcd_panel)
> > +{
> > +	int err;
> > +	struct display_timing timing;
> > +	struct videomode video;
> > +
> > +	err =3D of_get_display_timing(node, "panel-timing", &timing);
> > +	if (err) {
> > +		pr_err("%pOF: problems parsing panel-timing (%d)\n", node, err);
> > +		return err;
> > +	}
> > +
> > +	videomode_from_timing(&timing, &video);
> > +
> > +	err =3D fb_videomode_from_videomode(&video, &clcd_panel->mode);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Set up some inversion flags */
> > +	if (timing.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> > +		clcd_panel->tim2 |=3D TIM2_IPC;
> > +	else if (!(timing.flags & DISPLAY_FLAGS_PIXDATA_POSEDGE))
> > +		/*
> > +		 * To preserve backwards compatibility, the IPC (inverted
> > +		 * pixel clock) flag needs to be set on any display that
> > +		 * doesn't explicitly specify that the pixel clock is
> > +		 * active on the negative or positive edge.
> > +		 */
> > +		clcd_panel->tim2 |=3D TIM2_IPC;
> > +
> > +	if (timing.flags & DISPLAY_FLAGS_HSYNC_LOW)
> > +		clcd_panel->tim2 |=3D TIM2_IHS;
> > +
> > +	if (timing.flags & DISPLAY_FLAGS_VSYNC_LOW)
> > +		clcd_panel->tim2 |=3D TIM2_IVS;
> > +
> > +	if (timing.flags & DISPLAY_FLAGS_DE_LOW)
> > +		clcd_panel->tim2 |=3D TIM2_IOE;
> > +
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_snprintf_mode(char *buf, int size, struct fb_videomo=
de *mode)
> > +{
> > +	return snprintf(buf, size, "%ux%u@%u", mode->xres, mode->yres,
> > +			mode->refresh);
> > +}
> > +
> > +static int clcdfb_of_get_backlight(struct device *dev,
> > +				   struct clcd_panel *clcd_panel)
> > +{
> > +	struct backlight_device *backlight;
> > +
> > +	/* Look up the optional backlight device */
> > +	backlight =3D devm_of_find_backlight(dev);
> > +	if (IS_ERR(backlight))
> > +		return PTR_ERR(backlight);
> > +
> > +	clcd_panel->backlight =3D backlight;
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_of_get_mode(struct device *dev, struct device_node *=
panel,
> > +			      struct clcd_panel *clcd_panel)
> > +{
> > +	int err;
> > +	struct fb_videomode *mode;
> > +	char *name;
> > +	int len;
> > +
> > +	/* Only directly connected DPI panels supported for now */
> > +	if (of_device_is_compatible(panel, "panel-dpi"))
> > +		err =3D clcdfb_of_get_dpi_panel_mode(panel, clcd_panel);
> > +	else
> > +		err =3D -ENOENT;
> > +	if (err)
> > +		return err;
> > +	mode =3D &clcd_panel->mode;
> > +
> > +	len =3D clcdfb_snprintf_mode(NULL, 0, mode);
> > +	name =3D devm_kzalloc(dev, len + 1, GFP_KERNEL);
> > +	if (!name)
> > +		return -ENOMEM;
> > +
> > +	clcdfb_snprintf_mode(name, len + 1, mode);
> > +	mode->name =3D name;
> > +
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_of_init_tft_panel(struct clcd_fb *fb, u32 r0, u32 g0=
, u32 b0)
> > +{
> > +	static struct {
> > +		unsigned int part;
> > +		u32 r0, g0, b0;
> > +		u32 caps;
> > +	} panels[] =3D {
> > +		{ 0x110, 1,  7, 13, CLCD_CAP_5551 },
> > +		{ 0x110, 0,  8, 16, CLCD_CAP_888 },
> > +		{ 0x110, 16, 8, 0,  CLCD_CAP_888 },
> > +		{ 0x111, 4, 14, 20, CLCD_CAP_444 },
> > +		{ 0x111, 3, 11, 19, CLCD_CAP_444 | CLCD_CAP_5551 },
> > +		{ 0x111, 3, 10, 19, CLCD_CAP_444 | CLCD_CAP_5551 |
> > +				    CLCD_CAP_565 },
> > +		{ 0x111, 0,  8, 16, CLCD_CAP_444 | CLCD_CAP_5551 |
> > +				    CLCD_CAP_565 | CLCD_CAP_888 },
> > +	};
> > +	int i;
> > +
> > +	/* Bypass pixel clock divider */
> > +	fb->panel->tim2 |=3D TIM2_BCD;
> > +
> > +	/* TFT display, vert. comp. interrupt at the start of the back porch =
*/
> > +	fb->panel->cntl |=3D CNTL_LCDTFT | CNTL_LCDVCOMP(1);
> > +
> > +	fb->panel->caps =3D 0;
> > +
> > +	/* Match the setup with known variants */
> > +	for (i =3D 0; i < ARRAY_SIZE(panels) && !fb->panel->caps; i++) {
> > +		if (amba_part(fb->dev) !=3D panels[i].part)
> > +			continue;
> > +		if (g0 !=3D panels[i].g0)
> > +			continue;
> > +		if (r0 =3D=3D panels[i].r0 && b0 =3D=3D panels[i].b0)
> > +			fb->panel->caps =3D panels[i].caps;
> > +	}
> > +
> > +	/*
> > +	 * If we actually physically connected the R lines to B and
> > +	 * vice versa
> > +	 */
> > +	if (r0 !=3D 0 && b0 =3D=3D 0)
> > +		fb->panel->bgr_connection =3D true;
> > +
> > +	return fb->panel->caps ? 0 : -EINVAL;
> > +}
> > +
> > +static int clcdfb_of_init_display(struct clcd_fb *fb)
> > +{
> > +	struct device_node *endpoint, *panel;
> > +	int err;
> > +	unsigned int bpp;
> > +	u32 max_bandwidth;
> > +	u32 tft_r0b0g0[3];
> > +
> > +	fb->panel =3D devm_kzalloc(&fb->dev->dev, sizeof(*fb->panel), GFP_KER=
NEL);
> > +	if (!fb->panel)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Fetch the panel endpoint.
> > +	 */
> > +	endpoint =3D of_graph_get_next_endpoint(fb->dev->dev.of_node, NULL);
> > +	if (!endpoint)
> > +		return -ENODEV;
> > +
> > +	panel =3D of_graph_get_remote_port_parent(endpoint);
> > +	if (!panel)
> > +		return -ENODEV;
> > +
> > +	err =3D clcdfb_of_get_backlight(&fb->dev->dev, fb->panel);
> > +	if (err)
> > +		return err;
> > +
> > +	err =3D clcdfb_of_get_mode(&fb->dev->dev, panel, fb->panel);
> > +	if (err)
> > +		return err;
> > +
> > +	err =3D of_property_read_u32(fb->dev->dev.of_node, "max-memory-bandwi=
dth",
> > +			&max_bandwidth);
> > +	if (!err) {
> > +		/*
> > +		 * max_bandwidth is in bytes per second and pixclock in
> > +		 * pico-seconds, so the maximum allowed bits per pixel is
> > +		 *   8 * max_bandwidth / (PICOS2KHZ(pixclock) * 1000)
> > +		 * Rearrange this calculation to avoid overflow and then ensure
> > +		 * result is a valid format.
> > +		 */
> > +		bpp =3D max_bandwidth / (1000 / 8)
> > +			/ PICOS2KHZ(fb->panel->mode.pixclock);
> > +		bpp =3D rounddown_pow_of_two(bpp);
> > +		if (bpp > 32)
> > +			bpp =3D 32;
> > +	} else
> > +		bpp =3D 32;
> > +	fb->panel->bpp =3D bpp;
> > +
> > +#ifdef CONFIG_CPU_BIG_ENDIAN
> > +	fb->panel->cntl |=3D CNTL_BEBO;
> > +#endif
> > +	fb->panel->width =3D -1;
> > +	fb->panel->height =3D -1;
> > +
> > +	if (of_property_read_u32_array(endpoint,
> > +			"arm,pl11x,tft-r0g0b0-pads",
> > +			tft_r0b0g0, ARRAY_SIZE(tft_r0b0g0)) !=3D 0)
> > +		return -ENOENT;
> > +
> > +	return clcdfb_of_init_tft_panel(fb, tft_r0b0g0[0],
> > +					tft_r0b0g0[1],  tft_r0b0g0[2]);
> > +}
> > +
> > +static int clcdfb_of_vram_setup(struct clcd_fb *fb)
> > +{
> > +	int err;
> > +	struct device_node *memory;
> > +	u64 size;
> > +
> > +	err =3D clcdfb_of_init_display(fb);
> > +	if (err)
> > +		return err;
> > +
> > +	memory =3D of_parse_phandle(fb->dev->dev.of_node, "memory-region", 0);
> > +	if (!memory)
> > +		return -ENODEV;
> > +
> > +	fb->fb.screen_base =3D of_iomap(memory, 0);
> > +	if (!fb->fb.screen_base)
> > +		return -ENOMEM;
> > +
> > +	fb->fb.fix.smem_start =3D of_translate_address(memory,
> > +			of_get_address(memory, 0, &size, NULL));
> > +	fb->fb.fix.smem_len =3D size;
> > +
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_of_vram_mmap(struct clcd_fb *fb, struct vm_area_stru=
ct *vma)
> > +{
> > +	unsigned long off, user_size, kernel_size;
> > +
> > +
> > +	off =3D vma->vm_pgoff << PAGE_SHIFT;
> > +	user_size =3D vma->vm_end - vma->vm_start;
> > +	kernel_size =3D fb->fb.fix.smem_len;
> > +
> > +	if (off >=3D kernel_size || user_size > (kernel_size - off))
> > +		return -ENXIO;
> > +
> > +	return remap_pfn_range(vma, vma->vm_start,
> > +			__phys_to_pfn(fb->fb.fix.smem_start) + vma->vm_pgoff,
> > +			user_size,
> > +			pgprot_writecombine(vma->vm_page_prot));
> > +}
> > +
> > +static void clcdfb_of_vram_remove(struct clcd_fb *fb)
> > +{
> > +	iounmap(fb->fb.screen_base);
> > +}
> > +
> > +static int clcdfb_of_dma_setup(struct clcd_fb *fb)
> > +{
> > +	unsigned long framesize;
> > +	dma_addr_t dma;
> > +	int err;
> > +
> > +	err =3D clcdfb_of_init_display(fb);
> > +	if (err)
> > +		return err;
> > +
> > +	framesize =3D PAGE_ALIGN(fb->panel->mode.xres * fb->panel->mode.yres *
> > +			fb->panel->bpp / 8);
> > +	fb->fb.screen_base =3D dma_alloc_coherent(&fb->dev->dev, framesize,
> > +			&dma, GFP_KERNEL);
> > +	if (!fb->fb.screen_base)
> > +		return -ENOMEM;
> > +
> > +	fb->fb.fix.smem_start =3D dma;
> > +	fb->fb.fix.smem_len =3D framesize;
> > +
> > +	return 0;
> > +}
> > +
> > +static int clcdfb_of_dma_mmap(struct clcd_fb *fb, struct vm_area_struc=
t *vma)
> > +{
> > +	return dma_mmap_wc(&fb->dev->dev, vma, fb->fb.screen_base,
> > +			   fb->fb.fix.smem_start, fb->fb.fix.smem_len);
> > +}
> > +
> > +static void clcdfb_of_dma_remove(struct clcd_fb *fb)
> > +{
> > +	dma_free_coherent(&fb->dev->dev, fb->fb.fix.smem_len,
> > +			fb->fb.screen_base, fb->fb.fix.smem_start);
> > +}
> > +
> > +static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
> > +{
> > +	struct clcd_board *board =3D devm_kzalloc(&dev->dev, sizeof(*board),
> > +			GFP_KERNEL);
> > +	struct device_node *node =3D dev->dev.of_node;
> > +
> > +	if (!board)
> > +		return NULL;
> > +
> > +	board->name =3D of_node_full_name(node);
> > +	board->caps =3D CLCD_CAP_ALL;
> > +	board->check =3D clcdfb_check;
> > +	board->decode =3D clcdfb_decode;
> > +	if (of_find_property(node, "memory-region", NULL)) {
> > +		board->setup =3D clcdfb_of_vram_setup;
> > +		board->mmap =3D clcdfb_of_vram_mmap;
> > +		board->remove =3D clcdfb_of_vram_remove;
> > +	} else {
> > +		board->setup =3D clcdfb_of_dma_setup;
> > +		board->mmap =3D clcdfb_of_dma_mmap;
> > +		board->remove =3D clcdfb_of_dma_remove;
> > +	}
> > +
> > +	return board;
> > +}
> > +#else
> > +static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
> > +{
> > +	return NULL;
> > +}
> > +#endif
> > +
> > +static int clcdfb_probe(struct amba_device *dev, const struct amba_id =
*id)
> > +{
> > +	struct clcd_board *board =3D dev_get_platdata(&dev->dev);
> > +	struct clcd_fb *fb;
> > +	int ret;
> > +
> > +	if (!board)
> > +		board =3D clcdfb_of_get_board(dev);
> > +
> > +	if (!board)
> > +		return -EINVAL;
> > +
> > +	ret =3D dma_set_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32));
> > +	if (ret)
> > +		goto out;
> > +
> > +	ret =3D amba_request_regions(dev, NULL);
> > +	if (ret) {
> > +		printk(KERN_ERR "CLCD: unable to reserve regs region\n");
> > +		goto out;
> > +	}
> > +
> > +	fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
> > +	if (!fb) {
> > +		ret =3D -ENOMEM;
> > +		goto free_region;
> > +	}
> > +
> > +	fb->dev =3D dev;
> > +	fb->board =3D board;
> > +
> > +	dev_info(&fb->dev->dev, "PL%03x designer %02x rev%u at 0x%08llx\n",
> > +		amba_part(dev), amba_manf(dev), amba_rev(dev),
> > +		(unsigned long long)dev->res.start);
> > +
> > +	ret =3D fb->board->setup(fb);
> > +	if (ret)
> > +		goto free_fb;
> > +
> > +	ret =3D clcdfb_register(fb);
> > +	if (ret =3D=3D 0) {
> > +		amba_set_drvdata(dev, fb);
> > +		goto out;
> > +	}
> > +
> > +	fb->board->remove(fb);
> > + free_fb:
> > +	kfree(fb);
> > + free_region:
> > +	amba_release_regions(dev);
> > + out:
> > +	return ret;
> > +}
> > +
> > +static int clcdfb_remove(struct amba_device *dev)
> > +{
> > +	struct clcd_fb *fb =3D amba_get_drvdata(dev);
> > +
> > +	clcdfb_disable(fb);
> > +	unregister_framebuffer(&fb->fb);
> > +	if (fb->fb.cmap.len)
> > +		fb_dealloc_cmap(&fb->fb.cmap);
> > +	iounmap(fb->regs);
> > +	clk_unprepare(fb->clk);
> > +	clk_put(fb->clk);
> > +
> > +	fb->board->remove(fb);
> > +
> > +	kfree(fb);
> > +
> > +	amba_release_regions(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct amba_id clcdfb_id_table[] =3D {
> > +	{
> > +		.id	=3D 0x00041110,
> > +		.mask	=3D 0x000ffffe,
> > +	},
> > +	{ 0, 0 },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(amba, clcdfb_id_table);
> > +
> > +static struct amba_driver clcd_driver =3D {
> > +	.drv 		=3D {
> > +		.name	=3D "clcd-pl11x",
> > +	},
> > +	.probe		=3D clcdfb_probe,
> > +	.remove		=3D clcdfb_remove,
> > +	.id_table	=3D clcdfb_id_table,
> > +};
> > +
> > +static int __init amba_clcdfb_init(void)
> > +{
> > +	if (fb_get_options("ambafb", NULL))
> > +		return -ENODEV;
> > +
> > +	return amba_driver_register(&clcd_driver);
> > +}
> > +
> > +module_init(amba_clcdfb_init);
> > +
> > +static void __exit amba_clcdfb_exit(void)
> > +{
> > +	amba_driver_unregister(&clcd_driver);
> > +}
> > +
> > +module_exit(amba_clcdfb_exit);
> > +
> > +MODULE_DESCRIPTION("ARM PrimeCell PL110 CLCD core driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/amba/clcd-regs.h b/include/linux/amba/clcd-r=
egs.h
> > new file mode 100644
> > index 000000000000..421b0fa90d6a
> > --- /dev/null
> > +++ b/include/linux/amba/clcd-regs.h
> > @@ -0,0 +1,87 @@
> > +/*
> > + * David A Rusling
> > + *
> > + * Copyright (C) 2001 ARM Limited
> > + *
> > + * This file is subject to the terms and conditions of the GNU General=
 Public
> > + * License.  See the file COPYING in the main directory of this archive
> > + * for more details.
> > + */
> > +
> > +#ifndef AMBA_CLCD_REGS_H
> > +#define AMBA_CLCD_REGS_H
> > +
> > +/*
> > + * CLCD Controller Internal Register addresses
> > + */
> > +#define CLCD_TIM0		0x00000000
> > +#define CLCD_TIM1 		0x00000004
> > +#define CLCD_TIM2 		0x00000008
> > +#define CLCD_TIM3 		0x0000000c
> > +#define CLCD_UBAS 		0x00000010
> > +#define CLCD_LBAS 		0x00000014
> > +
> > +#define CLCD_PL110_IENB		0x00000018
> > +#define CLCD_PL110_CNTL		0x0000001c
> > +#define CLCD_PL110_STAT		0x00000020
> > +#define CLCD_PL110_INTR 	0x00000024
> > +#define CLCD_PL110_UCUR		0x00000028
> > +#define CLCD_PL110_LCUR		0x0000002C
> > +
> > +#define CLCD_PL111_CNTL		0x00000018
> > +#define CLCD_PL111_IENB		0x0000001c
> > +#define CLCD_PL111_RIS		0x00000020
> > +#define CLCD_PL111_MIS		0x00000024
> > +#define CLCD_PL111_ICR		0x00000028
> > +#define CLCD_PL111_UCUR		0x0000002c
> > +#define CLCD_PL111_LCUR		0x00000030
> > +
> > +#define CLCD_PALL 		0x00000200
> > +#define CLCD_PALETTE		0x00000200
> > +
> > +#define TIM2_PCD_LO_MASK	GENMASK(4, 0)
> > +#define TIM2_PCD_LO_BITS	5
> > +#define TIM2_CLKSEL		(1 << 5)
> > +#define TIM2_ACB_MASK		GENMASK(10, 6)
> > +#define TIM2_IVS		(1 << 11)
> > +#define TIM2_IHS		(1 << 12)
> > +#define TIM2_IPC		(1 << 13)
> > +#define TIM2_IOE		(1 << 14)
> > +#define TIM2_BCD		(1 << 26)
> > +#define TIM2_PCD_HI_MASK	GENMASK(31, 27)
> > +#define TIM2_PCD_HI_BITS	5
> > +#define TIM2_PCD_HI_SHIFT	27
> > +
> > +#define CNTL_LCDEN		(1 << 0)
> > +#define CNTL_LCDBPP1		(0 << 1)
> > +#define CNTL_LCDBPP2		(1 << 1)
> > +#define CNTL_LCDBPP4		(2 << 1)
> > +#define CNTL_LCDBPP8		(3 << 1)
> > +#define CNTL_LCDBPP16		(4 << 1)
> > +#define CNTL_LCDBPP16_565	(6 << 1)
> > +#define CNTL_LCDBPP16_444	(7 << 1)
> > +#define CNTL_LCDBPP24		(5 << 1)
> > +#define CNTL_LCDBW		(1 << 4)
> > +#define CNTL_LCDTFT		(1 << 5)
> > +#define CNTL_LCDMONO8		(1 << 6)
> > +#define CNTL_LCDDUAL		(1 << 7)
> > +#define CNTL_BGR		(1 << 8)
> > +#define CNTL_BEBO		(1 << 9)
> > +#define CNTL_BEPO		(1 << 10)
> > +#define CNTL_LCDPWR		(1 << 11)
> > +#define CNTL_LCDVCOMP(x)	((x) << 12)
> > +#define CNTL_LDMAFIFOTIME	(1 << 15)
> > +#define CNTL_WATERMARK		(1 << 16)
> > +
> > +/* ST Microelectronics variant bits */
> > +#define CNTL_ST_1XBPP_444	0x0
> > +#define CNTL_ST_1XBPP_5551	(1 << 17)
> > +#define CNTL_ST_1XBPP_565	(1 << 18)
> > +#define CNTL_ST_CDWID_12	0x0
> > +#define CNTL_ST_CDWID_16	(1 << 19)
> > +#define CNTL_ST_CDWID_18	(1 << 20)
> > +#define CNTL_ST_CDWID_24	((1 << 19)|(1 << 20))
> > +#define CNTL_ST_CEAEN		(1 << 21)
> > +#define CNTL_ST_LCDBPP24_PACKED	(6 << 1)
> > +
> > +#endif /* AMBA_CLCD_REGS_H */
> > diff --git a/include/linux/amba/clcd.h b/include/linux/amba/clcd.h
> > new file mode 100644
> > index 000000000000..b6e0cbeaf533
> > --- /dev/null
> > +++ b/include/linux/amba/clcd.h
> > @@ -0,0 +1,290 @@
> > +/*
> > + * linux/include/asm-arm/hardware/amba_clcd.h -- Integrator LCD panel.
> > + *
> > + * David A Rusling
> > + *
> > + * Copyright (C) 2001 ARM Limited
> > + *
> > + * This file is subject to the terms and conditions of the GNU General=
 Public
> > + * License.  See the file COPYING in the main directory of this archive
> > + * for more details.
> > + */
> > +#include <linux/fb.h>
> > +#include <linux/amba/clcd-regs.h>
> > +
> > +enum {
> > +	/* individual formats */
> > +	CLCD_CAP_RGB444		=3D (1 << 0),
> > +	CLCD_CAP_RGB5551	=3D (1 << 1),
> > +	CLCD_CAP_RGB565		=3D (1 << 2),
> > +	CLCD_CAP_RGB888		=3D (1 << 3),
> > +	CLCD_CAP_BGR444		=3D (1 << 4),
> > +	CLCD_CAP_BGR5551	=3D (1 << 5),
> > +	CLCD_CAP_BGR565		=3D (1 << 6),
> > +	CLCD_CAP_BGR888		=3D (1 << 7),
> > +
> > +	/* connection layouts */
> > +	CLCD_CAP_444		=3D CLCD_CAP_RGB444 | CLCD_CAP_BGR444,
> > +	CLCD_CAP_5551		=3D CLCD_CAP_RGB5551 | CLCD_CAP_BGR5551,
> > +	CLCD_CAP_565		=3D CLCD_CAP_RGB565 | CLCD_CAP_BGR565,
> > +	CLCD_CAP_888		=3D CLCD_CAP_RGB888 | CLCD_CAP_BGR888,
> > +
> > +	/* red/blue ordering */
> > +	CLCD_CAP_RGB		=3D CLCD_CAP_RGB444 | CLCD_CAP_RGB5551 |
> > +				  CLCD_CAP_RGB565 | CLCD_CAP_RGB888,
> > +	CLCD_CAP_BGR		=3D CLCD_CAP_BGR444 | CLCD_CAP_BGR5551 |
> > +				  CLCD_CAP_BGR565 | CLCD_CAP_BGR888,
> > +
> > +	CLCD_CAP_ALL		=3D CLCD_CAP_BGR | CLCD_CAP_RGB,
> > +};
> > +
> > +struct backlight_device;
> > +
> > +struct clcd_panel {
> > +	struct fb_videomode	mode;
> > +	signed short		width;	/* width in mm */
> > +	signed short		height;	/* height in mm */
> > +	u32			tim2;
> > +	u32			tim3;
> > +	u32			cntl;
> > +	u32			caps;
> > +	unsigned int		bpp:8,
> > +				fixedtimings:1,
> > +				grayscale:1;
> > +	unsigned int		connector;
> > +	struct backlight_device	*backlight;
> > +	/*
> > +	 * If the B/R lines are switched between the CLCD
> > +	 * and the panel we need to know this and not try to
> > +	 * compensate with the BGR bit in the control register.
> > +	 */
> > +	bool			bgr_connection;
> > +};
> > +
> > +struct clcd_regs {
> > +	u32			tim0;
> > +	u32			tim1;
> > +	u32			tim2;
> > +	u32			tim3;
> > +	u32			cntl;
> > +	unsigned long		pixclock;
> > +};
> > +
> > +struct clcd_fb;
> > +
> > +/*
> > + * the board-type specific routines
> > + */
> > +struct clcd_board {
> > +	const char *name;
> > +
> > +	/*
> > +	 * Optional.  Hardware capability flags.
> > +	 */
> > +	u32	caps;
> > +
> > +	/*
> > +	 * Optional.  Check whether the var structure is acceptable
> > +	 * for this display.
> > +	 */
> > +	int	(*check)(struct clcd_fb *fb, struct fb_var_screeninfo *var);
> > +
> > +	/*
> > +	 * Compulsory.  Decode fb->fb.var into regs->*.  In the case of
> > +	 * fixed timing, set regs->* to the register values required.
> > +	 */
> > +	void	(*decode)(struct clcd_fb *fb, struct clcd_regs *regs);
> > +
> > +	/*
> > +	 * Optional.  Disable any extra display hardware.
> > +	 */
> > +	void	(*disable)(struct clcd_fb *);
> > +
> > +	/*
> > +	 * Optional.  Enable any extra display hardware.
> > +	 */
> > +	void	(*enable)(struct clcd_fb *);
> > +
> > +	/*
> > +	 * Setup platform specific parts of CLCD driver
> > +	 */
> > +	int	(*setup)(struct clcd_fb *);
> > +
> > +	/*
> > +	 * mmap the framebuffer memory
> > +	 */
> > +	int	(*mmap)(struct clcd_fb *, struct vm_area_struct *);
> > +
> > +	/*
> > +	 * Remove platform specific parts of CLCD driver
> > +	 */
> > +	void	(*remove)(struct clcd_fb *);
> > +};
> > +
> > +struct amba_device;
> > +struct clk;
> > +
> > +/* this data structure describes each frame buffer device we find */
> > +struct clcd_fb {
> > +	struct fb_info		fb;
> > +	struct amba_device	*dev;
> > +	struct clk		*clk;
> > +	struct clcd_panel	*panel;
> > +	struct clcd_board	*board;
> > +	void			*board_data;
> > +	void __iomem		*regs;
> > +	u16			off_ienb;
> > +	u16			off_cntl;
> > +	u32			clcd_cntl;
> > +	u32			cmap[16];
> > +	bool			clk_enabled;
> > +};
> > +
> > +static inline void clcdfb_decode(struct clcd_fb *fb, struct clcd_regs =
*regs)
> > +{
> > +	struct fb_var_screeninfo *var =3D &fb->fb.var;
> > +	u32 val, cpl;
> > +
> > +	/*
> > +	 * Program the CLCD controller registers and start the CLCD
> > +	 */
> > +	val =3D ((var->xres / 16) - 1) << 2;
> > +	val |=3D (var->hsync_len - 1) << 8;
> > +	val |=3D (var->right_margin - 1) << 16;
> > +	val |=3D (var->left_margin - 1) << 24;
> > +	regs->tim0 =3D val;
> > +
> > +	val =3D var->yres;
> > +	if (fb->panel->cntl & CNTL_LCDDUAL)
> > +		val /=3D 2;
> > +	val -=3D 1;
> > +	val |=3D (var->vsync_len - 1) << 10;
> > +	val |=3D var->lower_margin << 16;
> > +	val |=3D var->upper_margin << 24;
> > +	regs->tim1 =3D val;
> > +
> > +	val =3D fb->panel->tim2;
> > +	val |=3D var->sync & FB_SYNC_HOR_HIGH_ACT  ? 0 : TIM2_IHS;
> > +	val |=3D var->sync & FB_SYNC_VERT_HIGH_ACT ? 0 : TIM2_IVS;
> > +
> > +	cpl =3D var->xres_virtual;
> > +	if (fb->panel->cntl & CNTL_LCDTFT)	  /* TFT */
> > +		/* / 1 */;
> > +	else if (!var->grayscale)		  /* STN color */
> > +		cpl =3D cpl * 8 / 3;
> > +	else if (fb->panel->cntl & CNTL_LCDMONO8) /* STN monochrome, 8bit */
> > +		cpl /=3D 8;
> > +	else					  /* STN monochrome, 4bit */
> > +		cpl /=3D 4;
> > +
> > +	regs->tim2 =3D val | ((cpl - 1) << 16);
> > +
> > +	regs->tim3 =3D fb->panel->tim3;
> > +
> > +	val =3D fb->panel->cntl;
> > +	if (var->grayscale)
> > +		val |=3D CNTL_LCDBW;
> > +
> > +	if (fb->panel->caps && fb->board->caps && var->bits_per_pixel >=3D 16=
) {
> > +		/*
> > +		 * if board and panel supply capabilities, we can support
> > +		 * changing BGR/RGB depending on supplied parameters. Here
> > +		 * we switch to what the framebuffer is providing if need
> > +		 * be, so if the framebuffer is BGR but the display connection
> > +		 * is RGB (first case) we switch it around. Vice versa mutatis
> > +		 * mutandis if the framebuffer is RGB but the display connection
> > +		 * is BGR, we flip it around.
> > +		 */
> > +		if (var->red.offset =3D=3D 0)
> > +			val &=3D ~CNTL_BGR;
> > +		else
> > +			val |=3D CNTL_BGR;
> > +		if (fb->panel->bgr_connection)
> > +			val ^=3D CNTL_BGR;
> > +	}
> > +
> > +	switch (var->bits_per_pixel) {
> > +	case 1:
> > +		val |=3D CNTL_LCDBPP1;
> > +		break;
> > +	case 2:
> > +		val |=3D CNTL_LCDBPP2;
> > +		break;
> > +	case 4:
> > +		val |=3D CNTL_LCDBPP4;
> > +		break;
> > +	case 8:
> > +		val |=3D CNTL_LCDBPP8;
> > +		break;
> > +	case 16:
> > +		/*
> > +		 * PL110 cannot choose between 5551 and 565 modes in its
> > +		 * control register.  It is possible to use 565 with
> > +		 * custom external wiring.
> > +		 */
> > +		if (amba_part(fb->dev) =3D=3D 0x110 ||
> > +		    var->green.length =3D=3D 5)
> > +			val |=3D CNTL_LCDBPP16;
> > +		else if (var->green.length =3D=3D 6)
> > +			val |=3D CNTL_LCDBPP16_565;
> > +		else
> > +			val |=3D CNTL_LCDBPP16_444;
> > +		break;
> > +	case 32:
> > +		val |=3D CNTL_LCDBPP24;
> > +		break;
> > +	}
> > +
> > +	regs->cntl =3D val;
> > +	regs->pixclock =3D var->pixclock;
> > +}
> > +
> > +static inline int clcdfb_check(struct clcd_fb *fb, struct fb_var_scree=
ninfo *var)
> > +{
> > +	var->xres_virtual =3D var->xres =3D (var->xres + 15) & ~15;
> > +	var->yres_virtual =3D var->yres =3D (var->yres + 1) & ~1;
> > +
> > +#define CHECK(e,l,h) (var->e < l || var->e > h)
> > +	if (CHECK(right_margin, (5+1), 256) ||	/* back porch */
> > +	    CHECK(left_margin, (5+1), 256) ||	/* front porch */
> > +	    CHECK(hsync_len, (5+1), 256) ||
> > +	    var->xres > 4096 ||
> > +	    var->lower_margin > 255 ||		/* back porch */
> > +	    var->upper_margin > 255 ||		/* front porch */
> > +	    var->vsync_len > 32 ||
> > +	    var->yres > 1024)
> > +		return -EINVAL;
> > +#undef CHECK
> > +
> > +	/* single panel mode: PCD =3D max(PCD, 1) */
> > +	/* dual panel mode: PCD =3D max(PCD, 5) */
> > +
> > +	/*
> > +	 * You can't change the grayscale setting, and
> > +	 * we can only do non-interlaced video.
> > +	 */
> > +	if (var->grayscale !=3D fb->fb.var.grayscale ||
> > +	    (var->vmode & FB_VMODE_MASK) !=3D FB_VMODE_NONINTERLACED)
> > +		return -EINVAL;
> > +
> > +#define CHECK(e) (var->e !=3D fb->fb.var.e)
> > +	if (fb->panel->fixedtimings &&
> > +	    (CHECK(xres)		||
> > +	     CHECK(yres)		||
> > +	     CHECK(bits_per_pixel)	||
> > +	     CHECK(pixclock)		||
> > +	     CHECK(left_margin)		||
> > +	     CHECK(right_margin)	||
> > +	     CHECK(upper_margin)	||
> > +	     CHECK(lower_margin)	||
> > +	     CHECK(hsync_len)		||
> > +	     CHECK(vsync_len)		||
> > +	     CHECK(sync)))
> > +		return -EINVAL;
> > +#undef CHECK
> > +
> > +	var->nonstd =3D 0;
> > +	var->accel_flags =3D 0;
> > +
> > +	return 0;
> > +}
> > =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
