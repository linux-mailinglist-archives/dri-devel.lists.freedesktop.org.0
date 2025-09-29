Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954D5BA8109
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8634F10E152;
	Mon, 29 Sep 2025 06:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CA510E152
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 06:07:12 +0000 (UTC)
Received: from jtjnmail201605.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202509291407051677;
 Mon, 29 Sep 2025 14:07:05 +0800
Received: from localhost.localdomain.com (10.94.18.252) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.58; Mon, 29 Sep 2025 14:07:04 +0800
From: Chu Guangqing <chuguangqing@inspur.com>
To: <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: Re: Re: [PATCH v6 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Date: Mon, 29 Sep 2025 14:07:01 +0800
Message-ID: <20250929060701.3104-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <bvwmxalakynyfrtuns2wxvggkaq6ivbub6rv4bnrcwp7k5l3ti@slpcwysdul36>
References: <bvwmxalakynyfrtuns2wxvggkaq6ivbub6rv4bnrcwp7k5l3ti@slpcwysdul36>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.18.252]
tUid: 2025929140705b716c57d11655618ffb65bbc76531976
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

> 
> On Sun, Sep 28, 2025 at 01:41:23PM +0800, Chu Guangqing wrote:
> > add support for Yhgc BMC soc chipset
> 
> Could you please provide some more details about the BMC? Quick googling
> finds only a very links. What is the name of the vendor? Is there a product page
> somewhere?
> 

The ZX1000 (Z106) chip is a self-developed server management chip of the 
"Zhixin Series" by Yunhai Guochuang. It can monitor the operating status of 
servers in real time and perform various remote management operations on 
servers, including remote system installation, restart, power-on and power-off. 
It supports instruction sets of mainstream processor architectures such as X86, 
ARM, and LoongArch, with fully open firmware and software interfaces that are 
compatible with the third-party application ecosystem.
The company's official website is www.yhgch.com. However, there is no English 
version of the webpage. The vendor is YHGCH. 
> >
> > Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> > ---
> >  MAINTAINERS                            |   5 +
> >  drivers/gpu/drm/Kconfig                |   2 +
> >  drivers/gpu/drm/Makefile               |   1 +
> >  drivers/gpu/drm/yhgch/Kconfig          |  11 +
> >  drivers/gpu/drm/yhgch/Makefile         |   4 +
> >  drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 407
> +++++++++++++++++++++++++
> >  drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 310 +++++++++++++++++++
> > drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 ++++
> > drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
> > drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
> > drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 134 ++++++++
> >  11 files changed, 1247 insertions(+)
> >  create mode 100644 drivers/gpu/drm/yhgch/Kconfig  create mode
> 100644
> > drivers/gpu/drm/yhgch/Makefile  create mode 100644
> > drivers/gpu/drm/yhgch/yhgch_drm_de.c
> >  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> >  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
> >  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
> >  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
> >  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 520fb4e379a3..18fd2e2fcb81 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27781,6 +27781,11 @@ S:	Maintained
> >  F:	Documentation/input/devices/yealink.rst
> >  F:	drivers/input/misc/yealink.*
> >
> > +YHGC DRM DRIVER
> > +M:	chuguangqing <chuguangqing@inspur.com>
> 
> Please use full name here.
> 
ok, I will use Chu Guangqing

> > +S:	Maintained
> > +F:	drivers/gpu/drm/yhgch
> 
> How do you plan to maintain it? Do you plan to use drm-misc tree? (in such a
> case it should be mentioned here). Do you expect others to commit updates /
> fixes for you or do you have commit rights?
>
We can use the drm-misc tree, but I don't have the commit rights. My colleagues
 and I will submit the code, and I will conduct the review.
 
> > +
> >  Z8530 DRIVER FOR AX.25
> >  M:	Joerg Reuter <jreuter@yaina.de>
> >  L:	linux-hams@vger.kernel.org
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig index
> > f7ea8e895c0c..8e0b1d12c81f 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
> >
> >  source "drivers/gpu/drm/imagination/Kconfig"
> >
> > +source "drivers/gpu/drm/yhgch/Kconfig"
> > +
> >  config DRM_HYPERV
> >  	tristate "DRM Support for Hyper-V synthetic video device"
> >  	depends on DRM && PCI && HYPERV
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile index
> > 4dafbdc8f86a..f344e0173b29 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -231,6 +231,7 @@ obj-y			+= solomon/
> >  obj-$(CONFIG_DRM_SPRD) += sprd/
> >  obj-$(CONFIG_DRM_LOONGSON) += loongson/
> >  obj-$(CONFIG_DRM_POWERVR) += imagination/
> > +obj-$(CONFIG_DRM_YHGCH)  += yhgch/
> >
> >  # Ensure drm headers are self-contained and pass kernel-doc
> > hdrtest-files := \ diff --git a/drivers/gpu/drm/yhgch/Kconfig
> > b/drivers/gpu/drm/yhgch/Kconfig new file mode 100644 index
> > 000000000000..695d29409444
> > --- /dev/null
> > +++ b/drivers/gpu/drm/yhgch/Kconfig
> > @@ -0,0 +1,11 @@
> > +config DRM_YHGCH
> > +    tristate "DRM Support for Yhgch BMC"
> > +    depends on DRM && PCI && MMU
> > +    select DRM_CLIENT_SELECTION
> > +    select DRM_KMS_HELPER
> > +    select DRM_GEM_SHMEM_HELPER
> > +    help
> > +        Choose this option if you have a Yhgch soc chipset.
> > +        If M is selected the module will be called yhgch-drm.
> > +        IF Y is selected the module will be built into the kernel.
> > +        IF N is selected the module will be excluded from the kernel.
> > diff --git a/drivers/gpu/drm/yhgch/Makefile
> > b/drivers/gpu/drm/yhgch/Makefile new file mode 100644 index
> > 000000000000..30de2fd27f18
> > --- /dev/null
> > +++ b/drivers/gpu/drm/yhgch/Makefile
> > @@ -0,0 +1,4 @@
> > +yhgch-drm-y := yhgch_drm_drv.o yhgch_drm_de.o yhgch_drm_vdac.o
> > +yhgch_drm_i2c.o
> > +
> > +obj-$(CONFIG_DRM_YHGCH) += yhgch-drm.o
> > +
> > diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> > b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> > new file mode 100644
> > index 000000000000..de6dbd5acca7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> > @@ -0,0 +1,407 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/delay.h>
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_gem_atomic_helper.h> #include
> > +<drm/drm_atomic_helper.h> #include <drm/drm_gem_shmem_helper.h>
> > +#include <drm/drm_format_helper.h> #include
> <drm/drm_damage_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "yhgch_drm_drv.h"
> > +#include "yhgch_drm_regs.h"
> > +
> > +struct yhgch_dislay_pll_config {
> > +	u64 hdisplay;
> > +	u64 vdisplay;
> > +	u32 pll1_config_value;
> > +	u32 pll2_config_value;
> > +};
> > +
> > +static const struct yhgch_dislay_pll_config yhgch_pll_table[] = {
> > +	{ 640, 480, CRT_PLL1_NS_25MHZ, CRT_PLL2_NS_25MHZ },
> > +	{ 800, 600, CRT_PLL1_NS_40MHZ, CRT_PLL2_NS_40MHZ },
> > +	{ 1024, 768, CRT_PLL1_NS_65MHZ, CRT_PLL2_NS_65MHZ },
> > +	{ 1280, 1024, CRT_PLL1_NS_108MHZ, CRT_PLL2_NS_108MHZ },
> > +	{ 1920, 1080, CRT_PLL1_NS_148MHZ, CRT_PLL2_NS_148MHZ },
> 
> This list is very limited by the modern standards. Is there a way to calculate
> these values for other resultions from the driver side?
>
This is a graphics card installed on a server, which only supports a limited 
number of resolutions. Therefore, this simple list is used. 

> > +};
> > +
> > +static const u32 channel_formats1[] = {
> > +	DRM_FORMAT_RGB565, DRM_FORMAT_RGB888,
> > +	DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static struct drm_plane_funcs yhgch_plane_funcs = {
> > +	.update_plane = drm_atomic_helper_update_plane,
> > +	.disable_plane = drm_atomic_helper_disable_plane,
> > +	.destroy = drm_plane_cleanup,
> > +	.reset = drm_atomic_helper_plane_reset,
> > +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > +	DRM_GEM_SHADOW_PLANE_FUNCS,
> 
> This macro redefines several fields defined previously. You should have gotten a
> warning.
>
Delete the three preceding function definitions
 
> > +};
> > +
> > +
> > +static enum drm_mode_status
> > +yhgch_crtc_mode_valid(struct drm_crtc *crtc,
> > +		      const struct drm_display_mode *mode) {
> > +	size_t i = 0;
> > +	int vrefresh = drm_mode_vrefresh(mode);
> > +
> > +	if (vrefresh < 59 || vrefresh > 61)
> > +		return MODE_NOCLOCK;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(yhgch_pll_table); i++) {
> > +		if (yhgch_pll_table[i].hdisplay == mode->hdisplay &&
> > +		    yhgch_pll_table[i].vdisplay == mode->vdisplay)
> > +			return MODE_OK;
> > +	}
> > +
> > +	return MODE_BAD;
> > +}
> > +
> > +static void set_vclock_yhgch(struct drm_device *dev, u64 pll) {
> > +	u32 val;
> > +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> > +
> > +	val = readl(priv->mmio + CRT_PLL1_NS);
> > +	val &= ~(CRT_PLL1_NS_OUTER_BYPASS(1));
> > +	writel(val, priv->mmio + CRT_PLL1_NS);
> > +
> > +	val = CRT_PLL1_NS_INTER_BYPASS(1) | CRT_PLL1_NS_POWERON(1);
> > +	writel(val, priv->mmio + CRT_PLL1_NS);
> > +
> > +	writel(pll, priv->mmio + CRT_PLL1_NS);
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	val = pll & ~(CRT_PLL1_NS_POWERON(1));
> > +	writel(val, priv->mmio + CRT_PLL1_NS);
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	val &= ~(CRT_PLL1_NS_INTER_BYPASS(1));
> > +	writel(val, priv->mmio + CRT_PLL1_NS);
> > +
> > +	usleep_range(1000, 2000);
> > +
> > +	val |= CRT_PLL1_NS_OUTER_BYPASS(1);
> > +	writel(val, priv->mmio + CRT_PLL1_NS); }
> > +
> > +static void get_pll_config(u64 x, u64 y, u32 *pll1, u32 *pll2) {
> > +	size_t i;
> > +	size_t count = ARRAY_SIZE(yhgch_pll_table);
> > +
> > +	for (i = 0; i < count; i++) {
> > +		if (yhgch_pll_table[i].hdisplay == x &&
> > +		    yhgch_pll_table[i].vdisplay == y) {
> > +			*pll1 = yhgch_pll_table[i].pll1_config_value;
> > +			*pll2 = yhgch_pll_table[i].pll2_config_value;
> > +			return;
> > +		}
> > +	}
> > +
> > +	/* if found none, we use default value */
> 
> Can this happen granted your mode_valid check?
> 
After testing, the code will not run to this point, so delete these lines of 
code.

> > +	*pll1 = CRT_PLL1_NS_25MHZ;
> > +	*pll2 = CRT_PLL2_NS_25MHZ;
> > +}
> > +
> 
> [...]
> 
> > +
> > +static void yhgch_crtc_atomic_begin(struct drm_crtc *crtc,
> > +				    struct drm_atomic_state *old_state) {
> > +	u32 reg;
> > +	struct drm_device *dev = crtc->dev;
> > +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> > +
> > +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> > +
> > +	/* Enable display power gate & LOCALMEM power gate */
> > +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> > +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> > +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> > +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> > +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> > +	yhgch_set_current_gate(priv, reg);
> > +
> > +	/* We can add more initialization as needed. */
> 
> ???
>
Delete the redundant comments
 
> > +}
> > +
> 
> [..]
> 
> > diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> > b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> > new file mode 100644
> > index 000000000000..2d7588ab8e2c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> > @@ -0,0 +1,310 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/bitfield.h>
> > +
> > +#include <linux/aperture.h>
> > +#include <drm/clients/drm_client_setup.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fbdev_ttm.h>
> > +
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_fbdev_shmem.h>
> > +#include <drm/drm_gem_shmem_helper.h> #include
> <drm/drm_managed.h>
> > +#include <drm/drm_module.h> #include <drm/drm_vblank.h>
> > +
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "yhgch_drm_drv.h"
> > +#include "yhgch_drm_regs.h"
> > +
> > +#define MEM_SIZE_RESERVE4KVM 0x200000
> 
> Unused
>
Delete the macro definitions that are no longer used
 
> > +
> 
> --
> With best wishes
> Dmitry

Best Regards,
Chu Guangqing
