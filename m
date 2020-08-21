Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C824D08C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 10:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E6A6E0F4;
	Fri, 21 Aug 2020 08:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4AB6E0F4;
 Fri, 21 Aug 2020 08:30:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C05A2B57B;
 Fri, 21 Aug 2020 08:30:53 +0000 (UTC)
Subject: Re: [PATCH v6] drm/kmb: Add support for KeemBay Display
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org, bob.j.paauwe@intel.com,
 edmund.j.dea@intel.com
References: <1597096418-28937-1-git-send-email-anitha.chrisanthus@intel.com>
 <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <21c60f89-1496-4191-dbe8-1e0e0ef8ef52@suse.de>
Date: Fri, 21 Aug 2020 10:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1467437072=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1467437072==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KjChVzGWYubMkZC3lhIaXwhjbzl5nUHro"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KjChVzGWYubMkZC3lhIaXwhjbzl5nUHro
Content-Type: multipart/mixed; boundary="yqYMVtuSGoW5DRc7zaIUVVakzn3qUu0gz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org, bob.j.paauwe@intel.com,
 edmund.j.dea@intel.com
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <21c60f89-1496-4191-dbe8-1e0e0ef8ef52@suse.de>
Subject: Re: [PATCH v6] drm/kmb: Add support for KeemBay Display
References: <1597096418-28937-1-git-send-email-anitha.chrisanthus@intel.com>
 <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>
In-Reply-To: <1597096418-28937-2-git-send-email-anitha.chrisanthus@intel.com>

--yqYMVtuSGoW5DRc7zaIUVVakzn3qUu0gz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the driver. Please see my comments below for a (partial) revie=
w.

Best regards
Thomas

Am 10.08.20 um 23:53 schrieb Anitha Chrisanthus:
> This is a basic KMS atomic modesetting display driver for KeemBay famil=
y of
> SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> driver at the connector level.
>=20
> Single CRTC with LCD controller->mipi DSI-> ADV bridge
>=20
> Only 1080p resolution and single plane is supported at this time.
>=20
> v2: moved extern to .h, removed license text
>     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.
>=20
> v3: Squashed all 59 commits to one
>=20
> v4: review changes from Sam Ravnborg
> 	renamed dev_p to kmb
> 	moved clocks under kmb_clock, consolidated clk initializations
> 	use drmm functions
> 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
>=20
> v5: corrected spellings
> v6: corrected checkpatch warnings
>=20
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> ---
>  drivers/gpu/drm/Kconfig         |    2 +
>  drivers/gpu/drm/Makefile        |    1 +
>  drivers/gpu/drm/kmb/Kconfig     |   13 +
>  drivers/gpu/drm/kmb/Makefile    |    2 +
>  drivers/gpu/drm/kmb/kmb_crtc.c  |  217 +++++
>  drivers/gpu/drm/kmb/kmb_crtc.h  |   36 +
>  drivers/gpu/drm/kmb/kmb_drv.c   |  725 ++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.h   |  172 ++++
>  drivers/gpu/drm/kmb/kmb_dsi.c   | 1828 +++++++++++++++++++++++++++++++=
++++++++
>  drivers/gpu/drm/kmb/kmb_dsi.h   |  370 ++++++++
>  drivers/gpu/drm/kmb/kmb_plane.c |  519 +++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.h |  124 +++
>  drivers/gpu/drm/kmb/kmb_regs.h  |  748 ++++++++++++++++
>  13 files changed, 4757 insertions(+)
>  create mode 100644 drivers/gpu/drm/kmb/Kconfig
>  create mode 100644 drivers/gpu/drm/kmb/Makefile
>  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 147d61b..97a1631b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -275,6 +275,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
> =20
>  source "drivers/gpu/drm/i915/Kconfig"
> =20
> +source "drivers/gpu/drm/kmb/Kconfig"
> +
>  config DRM_VGEM
>  	tristate "Virtual GEM provider"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2f31579..2146ff8 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_AMDGPU)+=3D amd/amdgpu/
>  obj-$(CONFIG_DRM_MGA)	+=3D mga/
>  obj-$(CONFIG_DRM_I810)	+=3D i810/
>  obj-$(CONFIG_DRM_I915)	+=3D i915/
> +obj-$(CONFIG_DRM_KMB_DISPLAY)  +=3D kmb/
>  obj-$(CONFIG_DRM_MGAG200) +=3D mgag200/
>  obj-$(CONFIG_DRM_V3D)  +=3D v3d/
>  obj-$(CONFIG_DRM_VC4)  +=3D vc4/
> diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
> new file mode 100644
> index 0000000..e18b74c
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/Kconfig
> @@ -0,0 +1,13 @@
> +config DRM_KMB_DISPLAY
> +	tristate "INTEL KEEMBAY DISPLAY"
> +	depends on DRM && OF && (ARM || ARM64)
> +	depends on COMMON_CLK
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	help
> +	Choose this option if you have Intel's KeemBay SOC which integrates
> +	an ARM Cortex A53 CPU with an Intel Movidius VPU.
> +
> +	If M is selected the module will be called kmb-drm.
> diff --git a/drivers/gpu/drm/kmb/Makefile b/drivers/gpu/drm/kmb/Makefil=
e
> new file mode 100644
> index 0000000..527d737
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/Makefile
> @@ -0,0 +1,2 @@
> +kmb-drm-y :=3D kmb_crtc.o kmb_drv.o kmb_plane.o kmb_dsi.o
> +obj-$(CONFIG_DRM_KMB_DISPLAY)	+=3D kmb-drm.o
> diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_c=
rtc.c
> new file mode 100644
> index 0000000..dfb6946
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_data/simplefb.h>
> +
> +#include <video/videomode.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "kmb_crtc.h"
> +#include "kmb_drv.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +#include "kmb_dsi.h"

This include block needs to be sorted alphabetically.

> +
> +static void kmb_crtc_cleanup(struct drm_crtc *crtc)
> +{
> +	drm_crtc_cleanup(crtc);
> +}

Leave out the wrapper and use drm_crtc_cleanup() directly.

> +
> +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	/* Clear interrupt */
> +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +	/* Set which interval to generate vertical interrupt */
> +	kmb_write_lcd(kmb, LCD_VSTATUS_COMPARE,
> +		      LCD_VSTATUS_COMPARE_VSYNC);
> +	/* Enable vertical interrupt */
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +	return 0;
> +}
> +
> +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	/* Clear interrupt */
> +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +	/* Disable vertical interrupt */
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +}
> +
> +static const struct drm_crtc_funcs kmb_crtc_funcs =3D {
> +	.destroy =3D kmb_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank =3D kmb_crtc_enable_vblank,
> +	.disable_vblank =3D kmb_crtc_disable_vblank,
> +};
> +
> +static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)

This name sounds a lot like the old non-atomic driver interface. To
avoid confusion, I'd suggest to call it kmb_crtc_set_mode().


> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_display_mode *m =3D &crtc->state->adjusted_mode;
> +	struct kmb_crtc_timing vm;
> +	int vsync_start_offset;
> +	int vsync_end_offset;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +	unsigned int val =3D 0;
> +
> +	/* Initialize mipi */
> +	kmb_dsi_hw_init(dev, m);
> +	drm_info(dev,
> +		 "vfp=3D %d vbp=3D %d vsyc_len=3D%d hfp=3D%d hbp=3D%d hsync_len=3D%d=
\n",
> +		 m->crtc_vsync_start - m->crtc_vdisplay,
> +		 m->crtc_vtotal - m->crtc_vsync_end,
> +		 m->crtc_vsync_end - m->crtc_vsync_start,
> +		 m->crtc_hsync_start - m->crtc_hdisplay,
> +		 m->crtc_htotal - m->crtc_hsync_end,
> +		 m->crtc_hsync_end - m->crtc_hsync_start);
> +	val =3D kmb_read_lcd(kmb, LCD_INT_ENABLE);
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, ~0x0);
> +	vm.vfront_porch =3D 2;
> +	vm.vback_porch =3D 2;
> +	vm.vsync_len =3D 8;
> +	vm.hfront_porch =3D 0;
> +	vm.hback_porch =3D 0;
> +	vm.hsync_len =3D 28;
> +
> +	vsync_start_offset =3D  m->crtc_vsync_start -  m->crtc_hsync_start;
> +	vsync_end_offset =3D  m->crtc_vsync_end - m->crtc_hsync_end;
> +
> +	drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d vsync-w=3D=
%d h-active=3D%d h-bp=3D%d h-fp=3D%d hysnc-l=3D%d",
> +		__func__, __LINE__,
> +			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
> +			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> +			vm.hfront_porch, vm.hsync_len);

It might just be because of the email fornmting, but the indention
appears to be wrong here.


> +	kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
> +		      m->crtc_vdisplay - 1);
> +	kmb_write_lcd(kmb, LCD_V_BACKPORCH, vm.vback_porch);
> +	kmb_write_lcd(kmb, LCD_V_FRONTPORCH, vm.vfront_porch);
> +	kmb_write_lcd(kmb, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> +	kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
> +		      m->crtc_hdisplay - 1);
> +	kmb_write_lcd(kmb, LCD_H_BACKPORCH, vm.hback_porch);
> +	kmb_write_lcd(kmb, LCD_H_FRONTPORCH, vm.hfront_porch);
> +	kmb_write_lcd(kmb, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> +	/* This is hardcoded as 0 in the Myriadx code */
> +	kmb_write_lcd(kmb, LCD_VSYNC_START, 0);
> +	kmb_write_lcd(kmb, LCD_VSYNC_END, 0);
> +	/* Back ground color */
> +	kmb_write_lcd(kmb, LCD_BG_COLOUR_LS, 0x4);
> +	if (m->flags =3D=3D DRM_MODE_FLAG_INTERLACE) {
> +		kmb_write_lcd(kmb,
> +			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
> +		kmb_write_lcd(kmb,
> +			      LCD_V_BACKPORCH_EVEN, vm.vback_porch);
> +		kmb_write_lcd(kmb,
> +			      LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);
> +		kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT_EVEN,
> +			      m->crtc_vdisplay - 1);
> +		/* This is hardcoded as 10 in the Myriadx code */
> +		kmb_write_lcd(kmb, LCD_VSYNC_START_EVEN, 10);
> +		kmb_write_lcd(kmb, LCD_VSYNC_END_EVEN, 10);
> +	}
> +	kmb_write_lcd(kmb, LCD_TIMING_GEN_TRIG, ENABLE);
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_ENABLE);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> +}
> +
> +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *old_state)
> +{
> +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> +
> +	clk_prepare_enable(lcd->clk);
> +	kmb_crtc_mode_set_nofb(crtc);
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *old_state)
> +{
> +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> +
> +	/* Always disable planes on the CRTC that is being turned off */

Instead of this general note, rather put here a rational for why
disabling planes is requires. Because usually DRM's atomic helpers take
take of all this.

> +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> +
> +	drm_crtc_vblank_off(crtc);
> +	clk_disable_unprepare(lcd->clk);
> +}
> +
> +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *state)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +}
> +
> +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *state)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event)
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +	crtc->state->event =3D NULL;
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs =3D {
> +	.atomic_begin =3D kmb_crtc_atomic_begin,
> +	.atomic_enable =3D kmb_crtc_atomic_enable,
> +	.atomic_disable =3D kmb_crtc_atomic_disable,
> +	.atomic_flush =3D kmb_crtc_atomic_flush,
> +};
> +
> +int kmb_setup_crtc(struct drm_device *drm)
> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +	struct kmb_plane *primary;
> +	int ret;
> +
> +	primary =3D kmb_plane_init(drm);
> +	if (IS_ERR(primary))
> +		return PTR_ERR(primary);
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &kmb->crtc, &primary->base_pla=
ne,
> +					NULL, &kmb_crtc_funcs, NULL);
> +	if (ret) {
> +		kmb_plane_destroy(&primary->base_plane);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&kmb->crtc, &kmb_crtc_helper_funcs);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_crtc.h b/drivers/gpu/drm/kmb/kmb_c=
rtc.h
> new file mode 100644
> index 0000000..d363066
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_crtc.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_CRTC_H__
> +#define __KMB_CRTC_H__
> +
> +#include <linux/clk.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_data/simplefb.h>
> +#include <video/videomode.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/wait.h>
> +#include "kmb_drv.h"

This include block needs to be cleaned up or even removed. You're
including tons of files for adecalring a trivial structure. Do you
actually need kmb_crtc.h?

> +
> +struct kmb_crtc_timing {
> +	u32 vfront_porch;
> +	u32 vback_porch;
> +	u32 vsync_len;
> +	u32 hfront_porch;
> +	u32 hback_porch;
> +	u32 hsync_len;
> +};
> +
> +#endif /* __KMB_CRTC_H__ */
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_dr=
v.c
> new file mode 100644
> index 0000000..255048f
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -0,0 +1,725 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/console.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_irq.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "kmb_crtc.h"
> +#include "kmb_drv.h"
> +#include "kmb_dsi.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +/* #define DEBUG */

This line is noise. Please remove or document.

> +
> +int kmb_under_flow =3D 0, kmb_flush_done =3D 0, layer_no =3D 0;
> +static struct kmb_clock kmb_clk;
> +
> +static struct drm_bridge *adv_bridge;
> +
> +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_lcd);
> +	if (ret) {
> +		drm_err(&kmb->drm, "Failed to enable LCD clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi);
> +	if (ret) {
> +		drm_err(&kmb->drm, "Failed to enable MIPI clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_ecfg);
> +	if (ret) {
> +		drm_err(&kmb->drm,
> +			"Failed to enable MIPI_ECFG clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_cfg);
> +	if (ret) {
> +		drm_err(&kmb->drm,
> +			"Failed to enable MIPI_CFG clock: %d\n", ret);
> +		return ret;
> +	}
> +	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> +	return 0;
> +}
> +
> +int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device *=
dev)
> +{
> +	struct device_node *vpu_dev;
> +	unsigned long clk;
> +	int ret =3D 0;
> +
> +	kmb_clk.clk_lcd =3D clk_get(dev, "clk_lcd");
> +	if (IS_ERR(kmb_clk.clk_lcd)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
> +		return PTR_ERR(kmb_clk.clk_lcd);
> +	}
> +
> +	kmb_clk.clk_mipi =3D clk_get(dev, "clk_mipi");
> +	if (IS_ERR(kmb_clk.clk_mipi)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi\n");
> +		return PTR_ERR(kmb_clk.clk_mipi);
> +	}
> +
> +	kmb_clk.clk_mipi_ecfg =3D clk_get(dev, "clk_mipi_ecfg");
> +	if (IS_ERR(kmb_clk.clk_mipi_ecfg)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_ecfg\n");
> +		return PTR_ERR(kmb_clk.clk_mipi_ecfg);
> +	}
> +
> +	kmb_clk.clk_mipi_cfg =3D clk_get(dev, "clk_mipi_cfg");
> +	if (IS_ERR(kmb_clk.clk_mipi_cfg)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_cfg\n");
> +		return PTR_ERR(kmb_clk.clk_mipi_cfg);
> +	}
> +	vpu_dev =3D of_find_node_by_path("/soc/vpu-ipc");
> +	kmb_clk.clk_pll0 =3D of_clk_get_by_name(vpu_dev, "pll_0_out_0");
> +	if (IS_ERR(kmb_clk.clk_pll0)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
> +		return PTR_ERR(kmb_clk.clk_pll0);
> +	}
> +	kmb->sys_clk_mhz =3D clk_get_rate(kmb_clk.clk_pll0) / 1000000;
> +	drm_info(&kmb->drm, "system clk =3D %d Mhz", kmb->sys_clk_mhz);

All these drm_info messages are really just noise. It' should be
drm_dbg_() of some kind; or drm_warn()/drm_err() if it reports an actual
problem. Here and through-out the rest of the driver.

> +
> +	/* Set LCD clock to 200 Mhz */
> +	clk_set_rate(kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
> +	if (clk_get_rate(kmb_clk.clk_lcd) !=3D KMB_LCD_DEFAULT_CLK) {
> +		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
> +			KMB_LCD_DEFAULT_CLK);
> +		return -1;
> +	}
> +	drm_info(&kmb->drm, "clk_lcd =3D %ld\n", clk_get_rate(kmb_clk.clk_lcd=
));
> +
> +	/* Set MIPI clock to 24 Mhz */
> +	clk_set_rate(kmb_clk.clk_mipi, KMB_MIPI_DEFAULT_CLK);
> +	if (clk_get_rate(kmb_clk.clk_mipi) !=3D KMB_MIPI_DEFAULT_CLK) {
> +		drm_err(&kmb->drm, "failed to set to clk_mipi to %d\n",
> +			KMB_MIPI_DEFAULT_CLK);
> +		return -1;
> +	}
> +	drm_info(&kmb->drm, "clk_mipi =3D %ld\n", clk_get_rate(kmb_clk.clk_mi=
pi));
> +
> +	clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +		/* Set MIPI_ECFG clock to 24 Mhz */
> +		clk_set_rate(kmb_clk.clk_mipi_ecfg, KMB_MIPI_DEFAULT_CFG_CLK);
> +		clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +			drm_err(&kmb->drm,
> +				"failed to set to clk_mipi_ecfg to %d\n",
> +				 KMB_MIPI_DEFAULT_CFG_CLK);
> +			return -1;
> +		}
> +
> +		drm_info(&kmb->drm, "clk_mipi_ecfg after set =3D %ld\n", clk);
> +	}
> +
> +	clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +		/* Set MIPI_CFG clock to 24 Mhz */
> +		clk_set_rate(kmb_clk.clk_mipi_cfg, 24000000);
> +		clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +			drm_err(&kmb->drm,
> +				"failed to set clk_mipi_cfg to %d\n",
> +				  KMB_MIPI_DEFAULT_CFG_CLK);
> +			return -1;
> +		}
> +		drm_info(&kmb->drm,
> +			 "Get clk_mipi_cfg after set =3D %ld\n", clk);
> +	}
> +
> +	ret =3D kmb_display_clk_enable(kmb);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> +	kmb_set_bitmask_msscam(kmb, MSS_CAM_CLK_CTRL, 0x1fff);
> +	kmb_set_bitmask_msscam(kmb, MSS_CAM_RSTN_CTRL, 0xffffffff);
> +	return 0;
> +}
> +
> +static int kmb_display_clk_disable(void)
> +{
> +	if (kmb_clk.clk_lcd)
> +		clk_disable_unprepare(kmb_clk.clk_lcd);
> +	if (kmb_clk.clk_mipi)
> +		clk_disable_unprepare(kmb_clk.clk_mipi);
> +	if (kmb_clk.clk_mipi_ecfg)
> +		clk_disable_unprepare(kmb_clk.clk_mipi_ecfg);
> +	if (kmb_clk.clk_mipi_cfg)
> +		clk_disable_unprepare(kmb_clk.clk_mipi_cfg);
> +	return 0;
> +}
> +
> +static void __iomem *kmb_map_mmio(struct device *dev, char *name)
> +{
> +	struct resource *res;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	void __iomem *mem;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!res) {
> +		DRM_ERROR("failed to get resource for %s\n", name);

These old logging macros have to be replaced by drm_err() et al. Here
and everywere else.

> +		return ERR_PTR(-ENOMEM);
> +	}
> +	mem =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(mem))
> +		DRM_ERROR("failed to ioremap %s registers\n", name);
> +	return mem;
> +}
> +
> +static int kmb_load(struct drm_device *drm, unsigned long flags)

Load and unload are names of deprecated interfaces in struct drm_driver.
Better not use them to avoid confusion. But also see my comments on
restructuring the device setup: load and unload should go away IMHO.

> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	int irq_lcd;
> +	int ret =3D 0;
> +
> +	/* Map LCD MMIO registers */
> +	kmb->lcd_mmio =3D kmb_map_mmio(drm->dev, "lcd_regs");
> +	if (IS_ERR(kmb->lcd_mmio)) {
> +		drm_err(&kmb->drm, "failed to map LCD registers\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Map MIPI MMIO registers */
> +	kmb->mipi_mmio =3D kmb_map_mmio(drm->dev, "mipi_regs");
> +	if (IS_ERR(kmb->mipi_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MIPI registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		return -ENOMEM;
> +	}
> +
> +	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> +	 * MSS_CAM_CLK_CTRL register
> +	 */
> +	kmb->msscam_mmio =3D kmb_map_mmio(drm->dev, "msscam_regs");
> +	if (IS_ERR(kmb->msscam_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MSSCAM registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		iounmap(kmb->mipi_mmio);
> +		return -ENOMEM;
> +	}
> +
> +	if (IS_ERR(kmb->msscam_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MSSCAM registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		iounmap(kmb->mipi_mmio);
> +		return -ENOMEM;
> +	}
> +	/* Enable display clocks */
> +	kmb_initialize_clocks(kmb, &pdev->dev);
> +
> +	/* Register irqs here - section 17.3 in databook
> +	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
> +	 * firmware has redirected 79 to A53 IRQ 33
> +	 */
> +
> +	/* Allocate LCD interrupt resources, enable interrupt line,
> +	 * and setup IRQ handling
> +	 */
> +	irq_lcd =3D platform_get_irq_byname(pdev, "irq_lcd");
> +	if (irq_lcd < 0) {
> +		drm_err(&kmb->drm, "irq_lcd not found");
> +		goto setup_fail;
> +	}
> +
> +	/* Get the optional framebuffer memory resource */
> +	ret =3D of_reserved_mem_device_init(drm->dev);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	spin_lock_init(&kmb->irq_lock);
> +
> +	ret =3D kmb_setup_crtc(drm);
> +	if (ret < 0) {
> +		drm_err(&kmb->drm, "failed to create crtc\n");
> +		goto setup_fail;
> +	}
> +
> +	/* Initialize MIPI DSI */
> +	ret =3D kmb_dsi_init(drm, adv_bridge);
> +	if (ret) {
> +		drm_err(&kmb->drm, "failed to initialize DSI\n");
> +		goto setup_fail;
> +	}
> +
> +	ret =3D drm_irq_install(drm, irq_lcd);
> +	if (ret < 0) {
> +		drm_err(&kmb->drm, "failed to install IRQ handler\n");
> +		goto irq_fail;
> +	}
> +
> +	kmb->irq_lcd =3D irq_lcd;
> +
> +	return 0;
> +
> + irq_fail:
> +	drm_crtc_cleanup(&kmb->crtc);
> + setup_fail:
> +	of_reserved_mem_device_release(drm->dev);
> +
> +	return ret;
> +}
> +
> +int kmb_atomic_helper_check(struct drm_device *dev,
> +			    struct drm_atomic_state *state)
> +{
> +	if (!state)
> +		return 0;

Why is this necessary?

> +
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
> +static const struct drm_mode_config_funcs kmb_mode_config_funcs =3D {
> +	.fb_create =3D drm_gem_fb_create,
> +	.atomic_check =3D kmb_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int kmb_setup_mode_config(struct drm_device *drm)
> +{
> +	int ret;
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +	drm->mode_config.min_width =3D KMB_MIN_WIDTH;
> +	drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
> +	drm->mode_config.max_width =3D KMB_MAX_WIDTH;
> +	drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
> +	drm->mode_config.funcs =3D &kmb_mode_config_funcs;

Setup your CRTCs, planes, encoders, etc here. Then do
drm_mode_config_reset() to initialize all state.

> +	return 0;
> +}
> +
> +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> +{
> +	unsigned long status, val, val1;
> +	int plane_id, dma0_state, dma1_state;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	status =3D kmb_read_lcd(kmb, LCD_INT_STATUS);
> +
> +	if (status & LCD_INT_EOF) {
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF);
> +
> +		/* When disabling/enabling LCD layers, the change takes effect
> +		 * immediately and does not wait for EOF (end of frame).
> +		 * When kmb_plane_atomic_disable is called, mark the plane as
> +		 * disabled but actually disable the plane when EOF irq is
> +		 * being handled.
> +		 */
> +		for (plane_id =3D LAYER_0;
> +				plane_id < kmb->n_layers; plane_id++) {
> +			if (plane_status[plane_id].disable) {
> +				kmb_clr_bitmask_lcd(kmb,
> +						    LCD_LAYERn_DMA_CFG
> +						    (plane_id),
> +						    LCD_DMA_LAYER_ENABLE);
> +
> +				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> +						    plane_status[plane_id].ctrl);
> +
> +				plane_status[plane_id].disable =3D false;
> +			}
> +		}
> +		if (kmb_under_flow) {
> +			/* DMA Recovery after underflow */
> +			dma0_state =3D (layer_no =3D=3D 0) ?
> +			    LCD_VIDEO0_DMA0_STATE : LCD_VIDEO1_DMA0_STATE;
> +			dma1_state =3D (layer_no =3D=3D 0) ?
> +			    LCD_VIDEO0_DMA1_STATE : LCD_VIDEO1_DMA1_STATE;
> +
> +			do {
> +				kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> +				val =3D kmb_read_lcd(kmb, dma0_state)
> +				    & LCD_DMA_STATE_ACTIVE;
> +				val1 =3D kmb_read_lcd(kmb, dma1_state)
> +				    & LCD_DMA_STATE_ACTIVE;
> +			} while ((val || val1));
> +			/* disable dma */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(layer_no),
> +					    LCD_DMA_LAYER_ENABLE);
> +			kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> +			kmb_flush_done =3D 1;
> +			kmb_under_flow =3D 0;
> +		}
> +	}
> +
> +	if (status & LCD_INT_LINE_CMP) {
> +		/* clear line compare interrupt */
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
> +	}
> +
> +	if (status & LCD_INT_VERT_COMP) {
> +		/* Read VSTATUS */
> +		val =3D kmb_read_lcd(kmb, LCD_VSTATUS);
> +		val =3D (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> +		switch (val) {
> +		case LCD_VSTATUS_COMPARE_VSYNC:
> +			/* Clear vertical compare interrupt */
> +			kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +			if (kmb_flush_done) {
> +				kmb_set_bitmask_lcd(kmb,
> +						    LCD_LAYERn_DMA_CFG
> +						    (layer_no),
> +						    LCD_DMA_LAYER_ENABLE);
> +				kmb_flush_done =3D 0;
> +			}
> +			drm_handle_vblank(dev, 0);
> +			break;
> +		case LCD_VSTATUS_COMPARE_BACKPORCH:
> +		case LCD_VSTATUS_COMPARE_ACTIVE:
> +		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> +			kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +			break;
> +		}
> +	}
> +	if (status & LCD_INT_DMA_ERR) {
> +		val =3D
> +		    (status & LCD_INT_DMA_ERR &
> +		     kmb_read_lcd(kmb, LCD_INT_ENABLE));
> +		/* LAYER0 - VL0 */
> +		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> +			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> +			kmb_under_flow++;
> +			drm_info(&kmb->drm,
> +				 "!LAYER0:VL0 DMA UNDERFLOW val =3D 0x%lx,under_flow=3D%d",
> +			     val, kmb_under_flow);
> +			/* disable underflow interrupt */
> +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +					    LAYER0_DMA_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
> +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> +					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
> +			/* disable auto restart mode */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(0),
> +					    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> +			layer_no =3D 0;
> +		}
> +
> +		if (val & LAYER0_DMA_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER0:VL0 DMA OVERFLOW val =3D 0x%lx", val);

You're not really doing anything here and in the branches below. This
looks like debugging code, so it should use drm_dbg_*(). If it's a n
error it should use drm_warn() or drm_err().

> +		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER0:VL0 DMA CB OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER0:VL0 DMA CR OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER1 - VL1 */
> +		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> +			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> +			kmb_under_flow++;
> +			drm_info(&kmb->drm,
> +				 "!LAYER1:VL1 DMA UNDERFLOW val =3D 0x%lx, under_flow=3D%d",
> +			     val, kmb_under_flow);
> +			/* disable underflow interrupt */
> +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +					    LAYER1_DMA_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
> +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> +					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
> +			/* disable auto restart mode */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(1),
> +					    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> +			layer_no =3D 1;
> +		}
> +
> +		/* LAYER1 - VL1 */
> +		if (val & LAYER1_DMA_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER1:VL1 DMA OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER1:VL1 DMA CB OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER1:VL1 DMA CR OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER2 - GL0 */
> +		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER2:GL0 DMA UNDERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER2_DMA_FIFO_OVERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER2:GL0 DMA OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER3 - GL1 */
> +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER3:GL1 DMA UNDERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> +			drm_info(&kmb->drm,
> +				 "LAYER3:GL1 DMA OVERFLOW val =3D 0x%lx", val);
> +	}
> +
> +	if (status & LCD_INT_LAYER) {
> +		/* Clear layer interrupts */
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LAYER);
> +	}
> +
> +	/* Clear all interrupts */
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, 1);
> +	return IRQ_HANDLED;
> +}
> +
> +/* IRQ handler */
> +static irqreturn_t kmb_isr(int irq, void *arg)
> +{
> +	struct drm_device *dev =3D (struct drm_device *)arg;
> +	irqreturn_t ret =3D IRQ_NONE;
> +
> +	ret =3D handle_lcd_irq(dev);

There's no need for 'ret'. Or maybe just inline handle_lcd_irq

> +	return ret;
> +}
> +
> +static void kmb_irq_reset(struct drm_device *drm)
> +{
> +	kmb_write_lcd(to_kmb(drm), LCD_INT_CLEAR, 0xFFFF);
> +	kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(fops);
> +
> +static struct drm_driver kmb_driver =3D {
> +	.driver_features =3D DRIVER_GEM |
> +	    DRIVER_MODESET | DRIVER_ATOMIC,
> +	.irq_handler =3D kmb_isr,
> +	.irq_preinstall =3D kmb_irq_reset,
> +	.irq_uninstall =3D kmb_irq_reset,
> +	/* GEM Operations */
> +	.fops =3D &fops,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> +	.name =3D "kmb-drm",
> +	.desc =3D "KEEMBAY DISPLAY DRIVER ",
> +	.date =3D "20190122",
> +	.major =3D 1,
> +	.minor =3D 0,
> +};
> +
> +static void kmb_drm_unload(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +
> +#ifdef DEBUG
> +	dump_stack();
> +#endif

No.

> +	drm_dev_unregister(drm);
> +	drm_kms_helper_poll_fini(drm);
> +	of_node_put(kmb->crtc.port);
> +	kmb->crtc.port =3D NULL;
> +	pm_runtime_get_sync(drm->dev);
> +	drm_irq_uninstall(drm);
> +	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
> +
> +	if (kmb->lcd_mmio) {
> +		iounmap(kmb->lcd_mmio);

Mapped with devm_ function. Don't unmap manually.

> +		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
> +	}
> +
> +	if (kmb->mipi_mmio) {
> +		iounmap(kmb->mipi_mmio);
> +		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
> +	}
> +
> +	if (kmb->msscam_mmio) {
> +		iounmap(kmb->msscam_mmio);
> +		release_mem_region(MSS_CAM_BASE_ADDR, MSS_CAM_MMIO_SIZE);
> +	}
> +
> +	of_reserved_mem_device_release(drm->dev);
> +	drm_mode_config_cleanup(drm);

You used drmm_mode_config_init(). Don't cleanup manually.

> +
> +	/* Release clks */
> +	kmb_display_clk_disable();
> +	clk_put(kmb_clk.clk_lcd);
> +	clk_put(kmb_clk.clk_mipi);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +	/* Unregister DSI host */
> +	kmb_dsi_host_unregister();
> +}
> +
> +static int kmb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D get_device(&pdev->dev);
> +	struct kmb_drm_private *kmb;
> +	int ret =3D 0;
> +
> +	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> +	 * has a mipi_dsi_host to register its device to. So, we
> +	 * first register the DSI host during probe time, and then return
> +	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called aga=
in
> +	 *  and then the rest of the driver initialization can proceed
> +	 *  afterwards and the bridge can be successfully attached.
> +	 */
> +	adv_bridge =3D kmb_dsi_host_bridge_init(dev);
> +
> +	if (adv_bridge =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(adv_bridge)) {
> +		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> +		return PTR_ERR(adv_bridge);
> +	}
> +
> +	/* Create DRM device */
> +	kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
> +				 struct kmb_drm_private, drm);
> +	if (IS_ERR(kmb))
> +		return PTR_ERR(kmb);
> +
> +	dev_set_drvdata(dev, &kmb->drm);
> +
> +	ret =3D kmb_setup_mode_config(&kmb->drm);
> +	if (ret)
> +		goto err_free;
> +	dev_set_drvdata(dev, &kmb->drm);

You already did this.

> +
> +	/* Load driver */
> +	kmb->n_layers =3D KMB_MAX_PLANES;

I don't see n_layers being not KMB_MAX_PLANES; it's just a constant.
Therefore remove n_layers entirely.

> +	ret =3D kmb_load(&kmb->drm, 0);

The whole setup process looks unintuitive and fragile to me. Here are a
few steps to simplify:

  * inline kmb_load()
  * reorganize the device setup to first map I/O resouces, then setup
all mode-config structures (CRTCs, planes, etc)

> +	if (ret =3D=3D -EPROBE_DEFER) {
> +		drm_info(&kmb->drm, "wait for external bridge driver DT\n");

drm_warn() or drm_dbg_*() here.

> +		return -EPROBE_DEFER;
> +	} else if (ret) {
> +		goto err_free;
> +	}
> +
> +	/* Set the CRTC's port so that the encoder component can find it */
> +	kmb->crtc.port =3D of_graph_get_port_by_id(dev->of_node, 0);
> +	ret =3D drm_vblank_init(&kmb->drm, kmb->drm.mode_config.num_crtc);
> +	drm_info(&kmb->drm, "mode_config.num_crtc=3D%d\n",
> +		 kmb->drm.mode_config.num_crtc);
> +	if (ret < 0) {
> +		drm_err(&kmb->drm, "failed to initialize vblank\n");
> +		goto err_vblank;
> +	}
> +
> +	drm_mode_config_reset(&kmb->drm);

This call should better be located at the end of kmb_setup_mode_config().=


> +	drm_kms_helper_poll_init(&kmb->drm);
> +
> +	/* Register graphics device with the kernel */
> +	ret =3D drm_dev_register(&kmb->drm, 0);
> +

No empty line here.

> +	if (ret)
> +		goto err_register;
> +
> +	return 0;
> +
> + err_register:
> +	drm_kms_helper_poll_fini(&kmb->drm);
> + err_vblank:
> +	pm_runtime_disable(kmb->drm.dev);
> + err_free:
> +	drm_mode_config_cleanup(&kmb->drm);
> +	dev_set_drvdata(dev, NULL);
> +	kmb_dsi_host_unregister();
> +
> +	return ret;
> +}
> +
> +static int kmb_remove(struct platform_device *pdev)
> +{
> +	kmb_drm_unload(&pdev->dev);

Inline kmb_drm_unload().

> +	return 0;
> +}
> +
> +static const struct of_device_id kmb_of_match[] =3D {
> +	{.compatible =3D "intel,kmb_display"},
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, kmb_of_match);
> +
> +static int __maybe_unused kmb_pm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> +
> +	if (!kmb)
> +		return 0;

That cannot happpen.

> +
> +	drm_kms_helper_poll_disable(drm);
> +
> +	kmb->state =3D drm_atomic_helper_suspend(drm);
> +	if (IS_ERR(kmb->state)) {
> +		drm_kms_helper_poll_enable(drm);
> +		return PTR_ERR(kmb->state);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused kmb_pm_resume(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> +
> +	if (!kmb)
> +		return 0;
> +
> +	drm_atomic_helper_resume(drm, kmb->state);
> +	drm_kms_helper_poll_enable(drm);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
> +
> +static struct platform_driver kmb_platform_driver =3D {
> +	.probe =3D kmb_probe,
> +	.remove =3D kmb_remove,
> +	.driver =3D {
> +		   .name =3D "kmb-drm",
> +		   .pm =3D &kmb_pm_ops,
> +		   .of_match_table =3D kmb_of_match,
> +		   },

Bad indention. Here and elsewhere.

> +};
> +
> +module_platform_driver(kmb_platform_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Keembay Display driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_dr=
v.h
> new file mode 100644
> index 0000000..22a293e
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_DRV_H__
> +#define __KMB_DRV_H__
> +
> +#include "kmb_regs.h"
> +
> +#define KMB_MAX_WIDTH			1920 /*max width in pixels */
> +#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
> +#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
> +#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */=

> +#define KMB_LCD_DEFAULT_CLK		200000000
> +#define KMB_MIPI_DEFAULT_CLK		24000000
> +#define KMB_MIPI_DEFAULT_CFG_CLK	24000000
> +#define KMB_SYS_CLK_MHZ			500
> +
> +#define crtc_to_kmb_priv(x)	container_of(x, struct kmb_drm_private, cr=
tc)

static inline function?

> +
> +#define ICAM_MMIO		0x3b100000
> +#define ICAM_LCD_OFFSET		0x1080
> +#define ICAM_MMIO_SIZE		0x2000

Empty line here.

> +struct kmb_drm_private {
> +	struct drm_device		drm;
> +	void __iomem			*lcd_mmio;
> +	void __iomem			*mipi_mmio;
> +	void __iomem			*msscam_mmio;
> +	unsigned char			n_layers;
> +	struct clk			*clk;
> +	struct drm_crtc			crtc;
> +	struct kmb_plane		*plane;
> +	struct drm_atomic_state		*state;
> +	spinlock_t			irq_lock;
> +	int				irq_lcd;
> +	int				irq_mipi;
> +	int				sys_clk_mhz;
> +	dma_addr_t			fb_addr;
> +};
> +
> +struct kmb_clock {
> +	struct clk *clk_lcd;
> +	struct clk *clk_mipi;
> +	struct clk *clk_mipi_ecfg;
> +	struct clk *clk_mipi_cfg;
> +	struct clk *clk_pll0;
> +};
> +
> +static inline struct kmb_drm_private *to_kmb(const struct drm_device *=
dev)
> +{
> +	return container_of(dev, struct kmb_drm_private, drm);
> +}
> +
> +struct blt_layer_config {
> +	unsigned char layer_format;
> +};
> +
> +static inline void kmb_write_lcd(struct kmb_drm_private *dev_p,
> +				 unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->lcd_mmio + reg));
> +}
> +
> +static inline void kmb_write_mipi(struct kmb_drm_private *dev_p,
> +				  unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->mipi_mmio + reg));
> +}
> +
> +static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->msscam_mmio + reg));
> +}
> +
> +static inline u32 kmb_read_msscam(struct kmb_drm_private *dev_p,
> +				  unsigned int reg)
> +{
> +	return readl(dev_p->msscam_mmio + reg);
> +}
> +
> +static inline void kmb_set_bitmask_msscam(struct kmb_drm_private *dev_=
p,
> +					  unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_msscam(dev_p, reg);
> +
> +	kmb_write_msscam(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned=
 int reg)
> +{
> +	return readl(dev_p->lcd_mmio + reg);
> +}
> +
> +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> +
> +	kmb_write_lcd(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> +
> +	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> +}
> +
> +static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigne=
d int reg)
> +{
> +	return readl(dev_p->mipi_mmio + reg);
> +}
> +
> +static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 offset,
> +				       u32 num_bits, u32 value)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +	u32 mask =3D (1 << num_bits) - 1;
> +
> +	value &=3D mask;
> +	mask <<=3D offset;
> +	reg_val &=3D (~mask);
> +	reg_val |=3D (value << offset);
> +#ifdef DEBUG
> +	if (reg =3D=3D DPHY_FREQ_CTRL0_3 + 4) {
> +		DRM_INFO("%s : %d  reg=3D0x%x offset=3D%d num_bits=3D%d val=3D0x%x\n=
",
> +			 __func__, __LINE__, reg, offset, num_bits,
> +			 reg_val);
> +	}
> +#endif
> +	kmb_write_mipi(dev_p, reg, reg_val);
> +}
> +
> +static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 offset)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> +}
> +
> +static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 offset)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> +}
> +
> +static inline void kmb_set_bitmask_mipi(struct kmb_drm_private *dev_p,=

> +					unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private *dev_p,=

> +					unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> +}
> +
> +int kmb_setup_crtc(struct drm_device *dev);
> +void kmb_set_scanout(struct kmb_drm_private *lcd);
> +#endif /* __KMB_DRV_H__ */
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_ds=
i.c
> new file mode 100644
> index 0000000..21745ae
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -0,0 +1,1828 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =C2=A9 2019-2020 Intel Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "kmb_drv.h"
> +#include "kmb_dsi.h"
> +#include "kmb_regs.h"
> +
> +static int hw_initialized;
> +/* #define MIPI_TX_TEST_PATTERN_GENERATION */
> +/* #define DPHY_GET_FSM */
> +/* #define DPHY_READ_TESTCODE */
> +
> +static struct mipi_dsi_host *dsi_host;
> +static struct mipi_dsi_device *dsi_device;
> +
> +/* Default setting is 1080p, 4 lanes */
> +#define IMG_HEIGHT_LINES  1080
> +#define IMG_WIDTH_PX      1920
> +#define MIPI_TX_ACTIVE_LANES 4
> +
> +struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg =3D {
> +	.width_pixels =3D IMG_WIDTH_PX,
> +	.height_lines =3D IMG_HEIGHT_LINES,
> +	.data_type =3D DSI_LP_DT_PPS_RGB888_24B,
> +	.data_mode =3D MIPI_DATA_MODE1,
> +	.dma_packed =3D 0
> +};
> +
> +struct mipi_tx_frame_cfg mipitx_frame0_cfg =3D {
> +	.sections[0] =3D &mipi_tx_frame0_sect_cfg,
> +	.sections[1] =3D NULL,
> +	.sections[2] =3D NULL,
> +	.sections[3] =3D NULL,
> +	.vsync_width =3D 5,
> +	.v_backporch =3D 36,
> +	.v_frontporch =3D 4,
> +	.hsync_width =3D 44,
> +	.h_backporch =3D 148,
> +	.h_frontporch =3D 88
> +};
> +
> +struct mipi_tx_dsi_cfg mipitx_dsi_cfg =3D {
> +	.hfp_blank_en =3D 0,
> +	.eotp_en =3D 0,
> +	.lpm_last_vfp_line =3D 0,
> +	.lpm_first_vsa_line =3D 0,
> +	.sync_pulse_eventn =3D DSI_VIDEO_MODE_NO_BURST_EVENT,
> +	.hfp_blanking =3D SEND_BLANK_PACKET,
> +	.hbp_blanking =3D SEND_BLANK_PACKET,
> +	.hsa_blanking =3D SEND_BLANK_PACKET,
> +	.v_blanking =3D SEND_BLANK_PACKET,
> +};
> +
> +struct mipi_ctrl_cfg mipi_tx_init_cfg =3D {
> +	.index =3D MIPI_CTRL6,
> +	.type =3D MIPI_DSI,
> +	.dir =3D MIPI_TX,
> +	.active_lanes =3D MIPI_TX_ACTIVE_LANES,
> +	.lane_rate_mbps =3D MIPI_TX_LANE_DATA_RATE_MBPS,
> +	.ref_clk_khz =3D MIPI_TX_REF_CLK_KHZ,
> +	.cfg_clk_khz =3D MIPI_TX_CFG_CLK_KHZ,
> +	.data_if =3D MIPI_IF_PARALLEL,
> +	.tx_ctrl_cfg =3D {
> +			.frames[0] =3D &mipitx_frame0_cfg,
> +			.frames[1] =3D NULL,
> +			.frames[2] =3D NULL,
> +			.frames[3] =3D NULL,
> +			.tx_dsi_cfg =3D &mipitx_dsi_cfg,
> +			.line_sync_pkt_en =3D 0,
> +			.line_counter_active =3D 0,
> +			.frame_counter_active =3D 0,
> +			.tx_always_use_hact =3D 1,
> +			.tx_hact_wait_stop =3D 1,
> +			}
> +};
> +
> +struct  mipi_hs_freq_range_cfg {
> +	u16 default_bit_rate_mbps;
> +	u8 hsfreqrange_code;
> +};
> +
> +struct vco_params {
> +	u32 freq;
> +	u32 range;
> +	u32 divider;
> +};
> +
> +static struct vco_params vco_table[] =3D {
> +	{52, 0x3f, 8},
> +	{80, 0x39, 8},
> +	{105, 0x2f, 4},
> +	{160, 0x29, 4},
> +	{210, 0x1f, 2},
> +	{320, 0x19, 2},
> +	{420, 0x0f, 1},
> +	{630, 0x09, 1},
> +	{1100, 0x03, 1},
> +	{0xffff, 0x01, 1},
> +};
> +
> +static struct mipi_hs_freq_range_cfg
> +mipi_hs_freq_range[MIPI_DPHY_DEFAULT_BIT_RATES] =3D {
> +	{.default_bit_rate_mbps =3D 80, .hsfreqrange_code =3D 0x00},
> +	{.default_bit_rate_mbps =3D 90, .hsfreqrange_code =3D 0x10},
> +	{.default_bit_rate_mbps =3D 100, .hsfreqrange_code =3D 0x20},
> +	{.default_bit_rate_mbps =3D 110, .hsfreqrange_code =3D 0x30},
> +	{.default_bit_rate_mbps =3D 120, .hsfreqrange_code =3D 0x01},
> +	{.default_bit_rate_mbps =3D 130, .hsfreqrange_code =3D 0x11},
> +	{.default_bit_rate_mbps =3D 140, .hsfreqrange_code =3D 0x21},
> +	{.default_bit_rate_mbps =3D 150, .hsfreqrange_code =3D 0x31},
> +	{.default_bit_rate_mbps =3D 160, .hsfreqrange_code =3D 0x02},
> +	{.default_bit_rate_mbps =3D 170, .hsfreqrange_code =3D 0x12},
> +	{.default_bit_rate_mbps =3D 180, .hsfreqrange_code =3D 0x22},
> +	{.default_bit_rate_mbps =3D 190, .hsfreqrange_code =3D 0x32},
> +	{.default_bit_rate_mbps =3D 205, .hsfreqrange_code =3D 0x03},
> +	{.default_bit_rate_mbps =3D 220, .hsfreqrange_code =3D 0x13},
> +	{.default_bit_rate_mbps =3D 235, .hsfreqrange_code =3D 0x23},
> +	{.default_bit_rate_mbps =3D 250, .hsfreqrange_code =3D 0x33},
> +	{.default_bit_rate_mbps =3D 275, .hsfreqrange_code =3D 0x04},
> +	{.default_bit_rate_mbps =3D 300, .hsfreqrange_code =3D 0x14},
> +	{.default_bit_rate_mbps =3D 325, .hsfreqrange_code =3D 0x25},
> +	{.default_bit_rate_mbps =3D 350, .hsfreqrange_code =3D 0x35},
> +	{.default_bit_rate_mbps =3D 400, .hsfreqrange_code =3D 0x05},
> +	{.default_bit_rate_mbps =3D 450, .hsfreqrange_code =3D 0x16},
> +	{.default_bit_rate_mbps =3D 500, .hsfreqrange_code =3D 0x26},
> +	{.default_bit_rate_mbps =3D 550, .hsfreqrange_code =3D 0x37},
> +	{.default_bit_rate_mbps =3D 600, .hsfreqrange_code =3D 0x07},
> +	{.default_bit_rate_mbps =3D 650, .hsfreqrange_code =3D 0x18},
> +	{.default_bit_rate_mbps =3D 700, .hsfreqrange_code =3D 0x28},
> +	{.default_bit_rate_mbps =3D 750, .hsfreqrange_code =3D 0x39},
> +	{.default_bit_rate_mbps =3D 800, .hsfreqrange_code =3D 0x09},
> +	{.default_bit_rate_mbps =3D 850, .hsfreqrange_code =3D 0x19},
> +	{.default_bit_rate_mbps =3D 900, .hsfreqrange_code =3D 0x29},
> +	{.default_bit_rate_mbps =3D 1000, .hsfreqrange_code =3D 0x0A},
> +	{.default_bit_rate_mbps =3D 1050, .hsfreqrange_code =3D 0x1A},
> +	{.default_bit_rate_mbps =3D 1100, .hsfreqrange_code =3D 0x2A},
> +	{.default_bit_rate_mbps =3D 1150, .hsfreqrange_code =3D 0x3B},
> +	{.default_bit_rate_mbps =3D 1200, .hsfreqrange_code =3D 0x0B},
> +	{.default_bit_rate_mbps =3D 1250, .hsfreqrange_code =3D 0x1B},
> +	{.default_bit_rate_mbps =3D 1300, .hsfreqrange_code =3D 0x2B},
> +	{.default_bit_rate_mbps =3D 1350, .hsfreqrange_code =3D 0x3C},
> +	{.default_bit_rate_mbps =3D 1400, .hsfreqrange_code =3D 0x0C},
> +	{.default_bit_rate_mbps =3D 1450, .hsfreqrange_code =3D 0x1C},
> +	{.default_bit_rate_mbps =3D 1500, .hsfreqrange_code =3D 0x2C},
> +	{.default_bit_rate_mbps =3D 1550, .hsfreqrange_code =3D 0x3D},
> +	{.default_bit_rate_mbps =3D 1600, .hsfreqrange_code =3D 0x0D},
> +	{.default_bit_rate_mbps =3D 1650, .hsfreqrange_code =3D 0x1D},
> +	{.default_bit_rate_mbps =3D 1700, .hsfreqrange_code =3D 0x2E},
> +	{.default_bit_rate_mbps =3D 1750, .hsfreqrange_code =3D 0x3E},
> +	{.default_bit_rate_mbps =3D 1800, .hsfreqrange_code =3D 0x0E},
> +	{.default_bit_rate_mbps =3D 1850, .hsfreqrange_code =3D 0x1E},
> +	{.default_bit_rate_mbps =3D 1900, .hsfreqrange_code =3D 0x2F},
> +	{.default_bit_rate_mbps =3D 1950, .hsfreqrange_code =3D 0x3F},
> +	{.default_bit_rate_mbps =3D 2000, .hsfreqrange_code =3D 0x0F},
> +	{.default_bit_rate_mbps =3D 2050, .hsfreqrange_code =3D 0x40},
> +	{.default_bit_rate_mbps =3D 2100, .hsfreqrange_code =3D 0x41},
> +	{.default_bit_rate_mbps =3D 2150, .hsfreqrange_code =3D 0x42},
> +	{.default_bit_rate_mbps =3D 2200, .hsfreqrange_code =3D 0x43},
> +	{.default_bit_rate_mbps =3D 2250, .hsfreqrange_code =3D 0x44},
> +	{.default_bit_rate_mbps =3D 2300, .hsfreqrange_code =3D 0x45},
> +	{.default_bit_rate_mbps =3D 2350, .hsfreqrange_code =3D 0x46},
> +	{.default_bit_rate_mbps =3D 2400, .hsfreqrange_code =3D 0x47},
> +	{.default_bit_rate_mbps =3D 2450, .hsfreqrange_code =3D 0x48},
> +	{.default_bit_rate_mbps =3D 2500, .hsfreqrange_code =3D 0x49}
> +};
> +
> +union mipi_irq_cfg int_cfg =3D {
> +	.irq_cfg.frame_done =3D 1,
> +	.irq_cfg.ctrl_error =3D 1,
> +};
> +
> +static enum drm_mode_status
> +kmb_dsi_mode_valid(struct drm_connector *connector,
> +		   struct drm_display_mode *mode)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_mode_config *mode_config =3D &dev->mode_config;
> +
> +	if (mode->hdisplay < mode_config->min_width ||
> +	    mode->hdisplay > mode_config->max_width)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay < mode_config->min_height ||
> +	    mode->vdisplay > mode_config->max_height)
> +		return MODE_BAD_VVALUE;
> +
> +	return MODE_OK;
> +}
> +
> +static int kmb_dsi_get_modes(struct drm_connector *connector)
> +{
> +	int num_modes =3D 0;
> +
> +	num_modes =3D drm_add_modes_noedid(connector,
> +					 connector->dev->mode_config.max_width,
> +			 connector->dev->mode_config.max_height);
> +
> +	DRM_INFO("width=3D%d height=3D%d\n",
> +		 connector->dev->mode_config.max_width,
> +		 connector->dev->mode_config.max_height);
> +	DRM_INFO("num modes=3D%d\n", num_modes);
> +
> +	return num_modes;
> +}
> +
> +void kmb_dsi_host_unregister(void)
> +{
> +	mipi_dsi_host_unregister(dsi_host);
> +	kfree(dsi_host);
> +}
> +
> +static void kmb_dsi_connector_destroy(struct drm_connector *connector)=

> +{
> +	struct kmb_connector *kmb_connector =3D to_kmb_connector(connector);
> +
> +	drm_connector_cleanup(connector);
> +	kfree(kmb_connector);
> +}
> +
> +static void kmb_dsi_encoder_destroy(struct drm_encoder *encoder)
> +{
> +	struct kmb_dsi *kmb_dsi =3D to_kmb_dsi(encoder);
> +
> +	if (!kmb_dsi)
> +		return;
> +
> +	kfree(kmb_dsi->dsi_host);
> +
> +	drm_encoder_cleanup(encoder);
> +
> +	kmb_dsi_connector_destroy(&kmb_dsi->attached_connector->base);
> +
> +	kfree(kmb_dsi);
> +	if (!dsi_device)
> +		kfree(dsi_device);
> +}
> +
> +static const struct drm_encoder_funcs kmb_dsi_funcs =3D {
> +	.destroy =3D kmb_dsi_encoder_destroy,
> +};
> +
> +static const struct
> +drm_connector_helper_funcs kmb_dsi_connector_helper_funcs =3D {
> +	.get_modes =3D kmb_dsi_get_modes,
> +	.mode_valid =3D kmb_dsi_mode_valid,
> +};
> +
> +static const struct drm_connector_funcs kmb_dsi_connector_funcs =3D {
> +	.destroy =3D kmb_dsi_connector_destroy,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> +};
> +
> +static ssize_t kmb_dsi_host_transfer(struct mipi_dsi_host *host,
> +				     const struct mipi_dsi_msg *msg)
> +{
> +	return 0;
> +}
> +
> +static int kmb_dsi_host_attach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *dev)
> +{
> +	return 0;
> +}
> +
> +static int kmb_dsi_host_detach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops kmb_dsi_host_ops =3D {
> +	.attach =3D kmb_dsi_host_attach,
> +	.detach =3D kmb_dsi_host_detach,
> +	.transfer =3D kmb_dsi_host_transfer,
> +};
> +
> +static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
> +					      struct kmb_dsi *kmb_dsi)
> +{
> +	struct kmb_dsi_host *host;
> +
> +	host =3D kzalloc(sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return NULL;
> +
> +	host->base =3D dsi_host;
> +	host->base->ops =3D &kmb_dsi_host_ops;
> +	host->kmb_dsi =3D kmb_dsi;
> +
> +	host->base->dev =3D drm->dev;
> +
> +	dsi_device->host =3D host->base;
> +	host->device =3D dsi_device;
> +	return host;
> +}
> +
> +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
> +{
> +	struct drm_bridge *bridge =3D NULL;
> +	struct device_node *encoder_node;
> +
> +	/* Create and register MIPI DSI host */
> +	if (!dsi_host) {
> +		dsi_host =3D kzalloc(sizeof(*dsi_host), GFP_KERNEL);
> +		if (!dsi_host)
> +			return ERR_PTR(-ENOMEM);
> +
> +		dsi_host->ops =3D &kmb_dsi_host_ops;
> +
> +		if (!dsi_device) {
> +			dsi_device =3D kzalloc(sizeof(*dsi_device), GFP_KERNEL);
> +			if (!dsi_device) {
> +				kfree(dsi_host);
> +				return ERR_PTR(-ENOMEM);
> +			}
> +		}
> +
> +		dsi_host->dev =3D dev;
> +		mipi_dsi_host_register(dsi_host);
> +	}
> +	/* Find ADV7535 node and initialize it */
> +	encoder_node =3D of_parse_phandle(dev->of_node, "encoder-slave", 0);
> +
> +	if (!encoder_node) {
> +		DRM_ERROR("Failed to get bridge info from DT\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* Locate drm bridge from the hdmi encoder DT node */
> +	bridge =3D of_drm_find_bridge(encoder_node);
> +	of_node_put(encoder_node);
> +	if (!bridge) {
> +		DRM_INFO("Wait for external bridge driver DT\n");
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +	return bridge;
> +}
> +
> +u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
> +			     struct mipi_data_type_params *params)
> +{
> +	struct mipi_data_type_params data_type_param;
> +
> +	switch (data_type) {
> +	case DSI_LP_DT_PPS_YCBCR420_12B:
> +		data_type_param.size_constraint_pixels =3D 2;
> +		data_type_param.size_constraint_bytes =3D 3;
> +		switch (data_mode) {
> +			/* Case 0 not supported according to MDK */
> +		case 1:
> +		case 2:
> +		case 3:
> +			data_type_param.pixels_per_pclk =3D 2;
> +			data_type_param.bits_per_pclk =3D 24;
> +			break;
> +		default:
> +			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
> +			return -EINVAL;
> +		};
> +		break;
> +	case DSI_LP_DT_PPS_YCBCR422_16B:
> +		data_type_param.size_constraint_pixels =3D 2;
> +		data_type_param.size_constraint_bytes =3D 4;
> +		switch (data_mode) {
> +			/* Case 0 and 1 not supported according
> +			 * to MDK
> +			 */
> +		case 2:
> +			data_type_param.pixels_per_pclk =3D 1;
> +			data_type_param.bits_per_pclk =3D 16;
> +			break;
> +		case 3:
> +			data_type_param.pixels_per_pclk =3D 2;
> +			data_type_param.bits_per_pclk =3D 32;
> +			break;
> +		default:
> +			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
> +			return -EINVAL;
> +		};
> +		break;
> +	case DSI_LP_DT_LPPS_YCBCR422_20B:
> +	case DSI_LP_DT_PPS_YCBCR422_24B:
> +		data_type_param.size_constraint_pixels =3D 2;
> +		data_type_param.size_constraint_bytes =3D 6;
> +		switch (data_mode) {
> +			/* Case 0 not supported according to MDK */
> +		case 1:
> +		case 2:
> +		case 3:
> +			data_type_param.pixels_per_pclk =3D 1;
> +			data_type_param.bits_per_pclk =3D 24;
> +			break;
> +		default:
> +			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
> +			return -EINVAL;
> +		};
> +		break;
> +	case DSI_LP_DT_PPS_RGB565_16B:
> +		data_type_param.size_constraint_pixels =3D 1;
> +		data_type_param.size_constraint_bytes =3D 2;
> +		switch (data_mode) {
> +		case 0:
> +		case 1:
> +			data_type_param.pixels_per_pclk =3D 1;
> +			data_type_param.bits_per_pclk =3D 16;
> +			break;
> +		case 2:
> +		case 3:
> +			data_type_param.pixels_per_pclk =3D 2;
> +			data_type_param.bits_per_pclk =3D 32;
> +			break;
> +		default:
> +			DRM_ERROR("DSI: Invalid data_mode %d\n", data_mode);
> +			return -EINVAL;
> +		};
> +		break;
> +	case DSI_LP_DT_PPS_RGB666_18B:
> +		data_type_param.size_constraint_pixels =3D 4;
> +		data_type_param.size_constraint_bytes =3D 9;
> +		data_type_param.bits_per_pclk =3D 18;
> +		data_type_param.pixels_per_pclk =3D 1;
> +		break;
> +	case DSI_LP_DT_LPPS_RGB666_18B:
> +	case DSI_LP_DT_PPS_RGB888_24B:
> +		data_type_param.size_constraint_pixels =3D 1;
> +		data_type_param.size_constraint_bytes =3D 3;
> +		data_type_param.bits_per_pclk =3D 24;
> +		data_type_param.pixels_per_pclk =3D 1;
> +		break;
> +	case DSI_LP_DT_PPS_RGB101010_30B:
> +		data_type_param.size_constraint_pixels =3D 4;
> +		data_type_param.size_constraint_bytes =3D 15;
> +		data_type_param.bits_per_pclk =3D 30;
> +		data_type_param.pixels_per_pclk =3D 1;
> +		break;
> +	default:
> +		DRM_ERROR("DSI: Invalid data_type %d\n", data_type);
> +		return -EINVAL;
> +	};
> +
> +	*params =3D data_type_param;
> +	return 0;
> +}
> +
> +static u32 compute_wc(u32 width_px, u8 size_constr_p, u8 size_constr_b=
)
> +{
> +	/* Calculate the word count for each long packet */
> +	return (((width_px / size_constr_p) * size_constr_b) & 0xffff);
> +}
> +
> +static u32 compute_unpacked_bytes(u32 wc, u8 bits_per_pclk)
> +{
> +	/* Number of PCLK cycles needed to transfer a line
> +	 * with each PCLK cycle, 4 Bytes are sent through the PPL module
> +	 */
> +	return ((wc * 8) / bits_per_pclk) * 4;
> +}
> +
> +static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *kmb,
> +				       u8 frame_id, u8 section,
> +				       u32 height_lines, u32 unpacked_bytes,
> +				       struct mipi_tx_frame_sect_phcfg *ph_cfg)
> +{
> +	u32 cfg =3D 0;
> +	u32 ctrl_no =3D MIPI_CTRL6;
> +	u32 reg_adr;
> +
> +	/* Frame section packet header */
> +	/* Word count bits [15:0] */
> +	cfg =3D (ph_cfg->wc & MIPI_TX_SECT_WC_MASK) << 0;
> +
> +	/* Data type (bits [21:16]) */
> +	cfg |=3D ((ph_cfg->data_type & MIPI_TX_SECT_DT_MASK)
> +		<< MIPI_TX_SECT_DT_SHIFT);
> +
> +	/* Virtual channel (bits [23:22]) */
> +	cfg |=3D ((ph_cfg->vchannel & MIPI_TX_SECT_VC_MASK)
> +		<< MIPI_TX_SECT_VC_SHIFT);
> +
> +	/* Data mode (bits [24:25]) */
> +	cfg |=3D ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
> +		<< MIPI_TX_SECT_DM_SHIFT);
> +	if (ph_cfg->dma_packed)
> +		cfg |=3D MIPI_TX_SECT_DMA_PACKED;
> +
> +	drm_dbg(&kmb->drm,
> +		"ctrl=3D%d frame_id=3D%d section=3D%d cfg=3D%x packed=3D%d\n",
> +		  ctrl_no, frame_id, section, cfg, ph_cfg->dma_packed);
> +	kmb_write_mipi(kmb,
> +		       (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id, section)),
> +		       cfg);
> +
> +	/* Unpacked bytes */
> +
> +	/* There are 4 frame generators and each fg has 4 sections
> +	 * There are 2 registers for unpacked bytes (# bytes each
> +	 * section occupies in memory)
> +	 * REG_UNPACKED_BYTES0: [15:0]-BYTES0, [31:16]-BYTES1
> +	 * REG_UNPACKED_BYTES1: [15:0]-BYTES2, [31:16]-BYTES3
> +	 */
> +	reg_adr =3D
> +	    MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no,
> +						 frame_id) + (section / 2) * 4;
> +	kmb_write_bits_mipi(kmb, reg_adr, (section % 2) * 16, 16,
> +			    unpacked_bytes);
> +	drm_dbg(&kmb->drm,
> +		"unpacked_bytes =3D %d, wordcount =3D %d\n", unpacked_bytes,
> +		  ph_cfg->wc);
> +
> +	/* Line config */
> +	reg_adr =3D MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id, section=
);
> +	kmb_write_mipi(kmb, reg_adr, height_lines);
> +	return 0;
> +}
> +
> +static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *kmb,
> +				  u8 frame_id, u8 section,
> +				  struct mipi_tx_frame_section_cfg *frame_scfg,
> +				  u32 *bits_per_pclk, u32 *wc)
> +{
> +	u32 ret =3D 0;
> +	u32 unpacked_bytes;
> +	struct mipi_data_type_params data_type_parameters;
> +	struct mipi_tx_frame_sect_phcfg ph_cfg;
> +
> +	ret =3D mipi_get_datatype_params(frame_scfg->data_type,
> +				       frame_scfg->data_mode,
> +				       &data_type_parameters);
> +	if (ret)
> +		return ret;
> +
> +	/* Packet width has to be a multiple of the minimum packet width
> +	 * (in pixels) set for each data type
> +	 */
> +	if (frame_scfg->width_pixels %
> +	    data_type_parameters.size_constraint_pixels !=3D 0)
> +		return -EINVAL;
> +
> +	*wc =3D compute_wc(frame_scfg->width_pixels,
> +			 data_type_parameters.size_constraint_pixels,
> +			 data_type_parameters.size_constraint_bytes);
> +	unpacked_bytes =3D compute_unpacked_bytes(*wc,
> +						data_type_parameters.bits_per_pclk);
> +	ph_cfg.wc =3D *wc;
> +	ph_cfg.data_mode =3D frame_scfg->data_mode;
> +	ph_cfg.data_type =3D frame_scfg->data_type;
> +	ph_cfg.dma_packed =3D frame_scfg->dma_packed;
> +	ph_cfg.vchannel =3D frame_id;
> +
> +	mipi_tx_fg_section_cfg_regs(kmb, frame_id, section,
> +				    frame_scfg->height_lines,
> +				    unpacked_bytes, &ph_cfg);
> +
> +	/* Caller needs bits_per_clk for additional caluclations */
> +	*bits_per_pclk =3D data_type_parameters.bits_per_pclk;
> +
> +	return 0;
> +}
> +
> +static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *kmb, u8 frame_=
gen,
> +				struct mipi_tx_frame_timing_cfg *fg_cfg)
> +{
> +	u32 sysclk;
> +	u32 ppl_llp_ratio;
> +	u32 ctrl_no =3D MIPI_CTRL6, reg_adr, val, offset;
> +
> +	/* 500 Mhz system clock minus 50 to account for the difference in
> +	 * MIPI clock speed in RTL tests
> +	 */
> +	sysclk =3D kmb->sys_clk_mhz - 50;
> +
> +	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
> +	 * Frame genartor timing parameters are clocked on the system clock,
> +	 * whereas as the equivalent parameters in the LLP blocks are clocked=

> +	 * on LLP Tx clock from the D-PHY - BYTE clock
> +	 */
> +
> +	/* Multiply by 1000 to maintain precision */
> +	ppl_llp_ratio =3D ((fg_cfg->bpp / 8) * sysclk * 1000) /
> +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> +
> +	drm_dbg(&kmb->drm, "ppl_llp_ratio=3D%d\n", ppl_llp_ratio);
> +	drm_dbg(&kmb->drm, "bpp=3D%d sysclk=3D%d lane-rate=3D%d active-lanes=3D=
%d\n",
> +		fg_cfg->bpp, sysclk, fg_cfg->lane_rate_mbps,
> +		 fg_cfg->active_lanes);
> +
> +	/* Frame generator number of lines */
> +	reg_adr =3D MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr, fg_cfg->v_active);
> +
> +	/* vsync width
> +	 * There are 2 registers for vsync width (VSA in lines for
> +	 * channels 0-3)
> +	 * REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for channel=
1
> +	 * REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for channel=
3
> +	 */
> +	offset =3D (frame_gen % 2) * 16;
> +	reg_adr =3D MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);
> +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg->vsync_width);
> +
> +	/* vertical backporch (vbp) */
> +	reg_adr =3D MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen / 2);
> +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg->v_backporch);
> +
> +	/* vertical frontporch (vfp) */
> +	reg_adr =3D MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen / 2);
> +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg->v_frontporch);
> +
> +	/* vertical active (vactive) */
> +	reg_adr =3D MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen / 2);
> +	kmb_write_bits_mipi(kmb, reg_adr, offset, 16, fg_cfg->v_active);
> +
> +	/* hsync width */
> +	reg_adr =3D MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr,
> +		       (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
> +
> +	/* horizontal backporch (hbp) */
> +	reg_adr =3D MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr,
> +		       (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
> +
> +	/* horizontal frontporch (hfp) */
> +	reg_adr =3D MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr,
> +		       (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
> +
> +	/* horizontal active (ha) */
> +	reg_adr =3D MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
> +
> +	/* convert h_active which is wc in bytes to cycles */
> +	val =3D (fg_cfg->h_active * sysclk * 1000) /
> +	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
> +	val /=3D 1000;
> +	kmb_write_mipi(kmb, reg_adr, val);
> +
> +	/* llp hsync width */
> +	reg_adr =3D MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8))=
;
> +
> +	/* llp h backporch */
> +	reg_adr =3D MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8))=
;
> +
> +	/* llp h frontporch */
> +	reg_adr =3D MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
> +	kmb_write_mipi(kmb, reg_adr,
> +		       fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
> +}
> +
> +static void mipi_tx_fg_cfg(struct kmb_drm_private *kmb, u8 frame_gen,
> +			   u8 active_lanes, u32 bpp, u32 wc,
> +			   u32 lane_rate_mbps, struct mipi_tx_frame_cfg *fg_cfg)
> +{
> +	u32 i, fg_num_lines =3D 0;
> +	struct mipi_tx_frame_timing_cfg fg_t_cfg;
> +
> +	/* Calculate the total frame generator number of
> +	 * lines based on it's active sections
> +	 */
> +	for (i =3D 0; i < MIPI_TX_FRAME_GEN_SECTIONS; i++) {
> +		if (fg_cfg->sections[i])
> +			fg_num_lines +=3D fg_cfg->sections[i]->height_lines;
> +	}
> +
> +	fg_t_cfg.bpp =3D bpp;
> +	fg_t_cfg.lane_rate_mbps =3D lane_rate_mbps;
> +	fg_t_cfg.hsync_width =3D fg_cfg->hsync_width;
> +	fg_t_cfg.h_backporch =3D fg_cfg->h_backporch;
> +	fg_t_cfg.h_frontporch =3D fg_cfg->h_frontporch;
> +	fg_t_cfg.h_active =3D wc;
> +	fg_t_cfg.vsync_width =3D fg_cfg->vsync_width;
> +	fg_t_cfg.v_backporch =3D fg_cfg->v_backporch;
> +	fg_t_cfg.v_frontporch =3D fg_cfg->v_frontporch;
> +	fg_t_cfg.v_active =3D fg_num_lines;
> +	fg_t_cfg.active_lanes =3D active_lanes;
> +
> +	/* Apply frame generator timing setting */
> +	mipi_tx_fg_cfg_regs(kmb, frame_gen, &fg_t_cfg);
> +}
> +
> +static void mipi_tx_multichannel_fifo_cfg(struct kmb_drm_private *kmb,=

> +					  u8 active_lanes, u8 vchannel_id)
> +{
> +	u32 fifo_size, fifo_rthreshold;
> +	u32 ctrl_no =3D MIPI_CTRL6;
> +
> +	/* Clear all mc fifo channel sizes and thresholds */
> +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CTRL_EN, 0);
> +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0, 0);
> +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1, 0);
> +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_RTHRESHOLD0, 0);
> +	kmb_write_mipi(kmb, MIPI_TX_HS_MC_FIFO_RTHRESHOLD1, 0);
> +
> +	fifo_size =3D ((active_lanes > MIPI_D_LANES_PER_DPHY) ?
> +		     MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC :
> +		     MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC) - 1;
> +
> +	/* MC fifo size for virtual channels 0-3
> +	 * REG_MC_FIFO_CHAN_ALLOC0: [8:0]-channel0, [24:16]-channel1
> +	 * REG_MC_FIFO_CHAN_ALLOC1: [8:0]-2, [24:16]-channel3
> +	 */
> +	SET_MC_FIFO_CHAN_ALLOC(kmb, ctrl_no, vchannel_id, fifo_size);
> +
> +	/* Set threshold to half the fifo size, actual size=3Dsize*16 */
> +	fifo_rthreshold =3D ((fifo_size) * 8) & BIT_MASK_16;
> +	SET_MC_FIFO_RTHRESHOLD(kmb, ctrl_no, vchannel_id, fifo_rthreshold);
> +
> +	/* Enable the MC FIFO channel corresponding to the Virtual Channel */=

> +	kmb_set_bit_mipi(kmb, MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no),
> +			 vchannel_id);
> +}
> +
> +static void mipi_tx_ctrl_cfg(struct kmb_drm_private *kmb, u8 fg_id,
> +			     struct mipi_ctrl_cfg *ctrl_cfg)
> +{
> +	u32 sync_cfg =3D 0, ctrl =3D 0, fg_en;
> +	u32 ctrl_no =3D MIPI_CTRL6;
> +
> +	/* MIPI_TX_HS_SYNC_CFG */
> +	if (ctrl_cfg->tx_ctrl_cfg.line_sync_pkt_en)
> +		sync_cfg |=3D LINE_SYNC_PKT_ENABLE;
> +	if (ctrl_cfg->tx_ctrl_cfg.frame_counter_active)
> +		sync_cfg |=3D FRAME_COUNTER_ACTIVE;
> +	if (ctrl_cfg->tx_ctrl_cfg.line_counter_active)
> +		sync_cfg |=3D LINE_COUNTER_ACTIVE;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->v_blanking)
> +		sync_cfg |=3D DSI_V_BLANKING;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hsa_blanking)
> +		sync_cfg |=3D DSI_HSA_BLANKING;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hbp_blanking)
> +		sync_cfg |=3D DSI_HBP_BLANKING;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blanking)
> +		sync_cfg |=3D DSI_HFP_BLANKING;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->sync_pulse_eventn)
> +		sync_cfg |=3D DSI_SYNC_PULSE_EVENTN;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_first_vsa_line)
> +		sync_cfg |=3D DSI_LPM_FIRST_VSA_LINE;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_last_vfp_line)
> +		sync_cfg |=3D DSI_LPM_LAST_VFP_LINE;
> +
> +	/* Enable frame generator */
> +	fg_en =3D 1 << fg_id;
> +	sync_cfg |=3D FRAME_GEN_EN(fg_en);
> +
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_always_use_hact)
> +		sync_cfg |=3D ALWAYS_USE_HACT(fg_en);
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_hact_wait_stop)
> +		sync_cfg |=3D HACT_WAIT_STOP(fg_en);
> +
> +	drm_dbg(&kmb->drm, "sync_cfg=3D%d fg_en=3D%d\n", sync_cfg, fg_en);
> +
> +	/* MIPI_TX_HS_CTRL */
> +
> +	/* type:DSI, source:LCD */
> +	ctrl =3D HS_CTRL_EN | TX_SOURCE;
> +	ctrl |=3D LCD_VC(fg_id);
> +	ctrl |=3D ACTIVE_LANES(ctrl_cfg->active_lanes - 1);
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->eotp_en)
> +		ctrl |=3D DSI_EOTP_EN;
> +	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blank_en)
> +		ctrl |=3D DSI_CMD_HFP_EN;
> +
> +	/*67 ns stop time */
> +	ctrl |=3D HSEXIT_CNT(0x43);
> +
> +	kmb_write_mipi(kmb, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
> +	kmb_write_mipi(kmb, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
> +}
> +
> +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> +static void mipi_tx_hs_tp_gen(struct kmb_drm_private *kmb, int vc,
> +			      int tp_sel, u32 stripe_width, u32 color0,
> +			      u32 color1, u32 ctrl_no)
> +{
> +	int val =3D 0;
> +
> +	/* Select test pattern mode on the virtual channel */
> +	val =3D TP_SEL_VCm(vc, tp_sel);
> +
> +	/* Configure test pattern colors */
> +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR0(ctrl_no), color0);
> +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR1(ctrl_no), color1);
> +
> +	/* Enable test pattern generation on the virtual channel */
> +	val |=3D TP_EN_VCm(vc);
> +	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no), val);
> +}
> +#endif
> +
> +static u32 mipi_tx_init_cntrl(struct kmb_drm_private *kmb,
> +			      struct mipi_ctrl_cfg *ctrl_cfg)
> +{
> +	u32 ret =3D 0;
> +	u8 active_vchannels =3D 0;
> +	u8 frame_id, sect;
> +	u32 bits_per_pclk =3D 0;
> +	u32 word_count =3D 0;
> +	struct mipi_tx_frame_cfg *frame;
> +
> +	/* This is the order to initialize MIPI TX:
> +	 * 1. set frame section parameters
> +	 * 2. set frame specific parameters
> +	 * 3. connect lcd to mipi
> +	 * 4. multi channel fifo cfg
> +	 * 5. set mipitxcctrlcfg
> +	 */
> +
> +	for (frame_id =3D 0; frame_id < 4; frame_id++) {
> +		frame =3D ctrl_cfg->tx_ctrl_cfg.frames[frame_id];
> +
> +		/* Find valid frame, assume only one valid frame */
> +		if (!frame)
> +			continue;
> +
> +		/* Frame Section configuration */
> +		/* TODO - assume there is only one valid section in a frame,
> +		 * so bits_per_pclk and word_count are only set once
> +		 */
> +		for (sect =3D 0; sect < MIPI_CTRL_VIRTUAL_CHANNELS; sect++) {
> +			if (!frame->sections[sect])
> +				continue;
> +
> +			ret =3D mipi_tx_fg_section_cfg(kmb, frame_id, sect,
> +						     frame->sections[sect],
> +						     &bits_per_pclk,
> +						     &word_count);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* Set frame specific parameters */
> +		mipi_tx_fg_cfg(kmb, frame_id, ctrl_cfg->active_lanes,
> +			       bits_per_pclk, word_count,
> +			       ctrl_cfg->lane_rate_mbps, frame);
> +
> +		active_vchannels++;
> +
> +		/* Stop iterating as only one virtual channel
> +		 * shall be used for LCD connection
> +		 */
> +		break;
> +	}
> +
> +	if (active_vchannels =3D=3D 0)
> +		return -EINVAL;
> +	/* Multi-Channel FIFO Configuration */
> +	mipi_tx_multichannel_fifo_cfg(kmb, ctrl_cfg->active_lanes, frame_id);=

> +
> +	/* Frame Generator Enable */
> +	mipi_tx_ctrl_cfg(kmb, frame_id, ctrl_cfg);
> +
> +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> +	mipi_tx_hs_tp_gen(kmb, 0, MIPI_TX_HS_TP_V_STRIPES,
> +			  0x8, 0xff, 0xff00, MIPI_CTRL6);
> +#endif
> +
> +	drm_dbg(&kmb->drm, "IRQ_STATUS =3D 0x%x\n",
> +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> +
> +	return ret;
> +}
> +
> +#ifdef DPHY_READ_TESTCODE
> +int dphy_read_testcode(struct kmb_drm_private *kmb, int dphy_sel,
> +		       int test_code)
> +{
> +	u32 reg_wr_data;
> +	u32 reg_rd_data;
> +	int data;
> +
> +	reg_wr_data =3D dphy_sel;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	data =3D 0;
> +	reg_wr_data =3D 0;
> +	reg_rd_data =3D 0;
> +
> +	if (((dphy_sel >> 0 & 0x1) =3D=3D 1) | ((dphy_sel >> 4 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 8 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 0;
> +	if (((dphy_sel >> 1 & 0x1) =3D=3D 1) | ((dphy_sel >> 5 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 9 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 8;
> +	if (((dphy_sel >> 2 & 0x1) =3D=3D 1) | ((dphy_sel >> 6 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 10 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 16;
> +	if (((dphy_sel >> 3 & 0x1) =3D=3D 1) | ((dphy_sel >> 7 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 11 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 24;
> +
> +	if ((dphy_sel >> 0 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> +	if ((dphy_sel >> 4 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> +	if ((dphy_sel >> 8 & 0x3) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	reg_wr_data =3D (dphy_sel | dphy_sel << 12);
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	reg_wr_data =3D dphy_sel << 12;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	data =3D test_code >> 8 & 0xf;
> +	reg_wr_data =3D 0;
> +
> +	if (((dphy_sel >> 0 & 0x1) =3D=3D 1) | ((dphy_sel >> 4 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 8 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 0;
> +	if (((dphy_sel >> 1 & 0x1) =3D=3D 1) | ((dphy_sel >> 5 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 9 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 8;
> +	if (((dphy_sel >> 2 & 0x1) =3D=3D 1) | ((dphy_sel >> 6 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 10 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 16;
> +	if (((dphy_sel >> 3 & 0x1) =3D=3D 1) | ((dphy_sel >> 7 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 11 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 24;
> +
> +	if ((dphy_sel >> 0 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> +	if ((dphy_sel >> 4 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> +	if ((dphy_sel >> 8 & 0x3) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	reg_wr_data =3D dphy_sel;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	data =3D test_code & 0xff;
> +	reg_wr_data =3D 0;
> +
> +	if (((dphy_sel >> 0 & 0x1) =3D=3D 1) | ((dphy_sel >> 4 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 8 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 0;
> +	if (((dphy_sel >> 1 & 0x1) =3D=3D 1) | ((dphy_sel >> 5 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 9 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 8;
> +	if (((dphy_sel >> 2 & 0x1) =3D=3D 1) | ((dphy_sel >> 6 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 10 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 16;
> +	if (((dphy_sel >> 3 & 0x1) =3D=3D 1) | ((dphy_sel >> 7 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 11 & 0x1) =3D=3D 1))
> +		reg_wr_data |=3D data << 24;
> +
> +	if ((dphy_sel >> 0 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN0_3, reg_wr_data);
> +	if ((dphy_sel >> 4 & 0xf) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN4_7, reg_wr_data);
> +	if ((dphy_sel >> 8 & 0x3) > 0)
> +		kmb_write_mipi(kmb, DPHY_TEST_DIN8_9, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	reg_wr_data =3D (dphy_sel | dphy_sel << 12);
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	reg_wr_data =3D dphy_sel << 12;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	reg_wr_data =3D 0;
> +	kmb_write_mipi(kmb, DPHY_TEST_CTRL1, reg_wr_data);
> +
> +	if ((dphy_sel >> 0 & 0xf) > 0)
> +		reg_rd_data =3D kmb_read_mipi(kmb, DPHY_TEST_DOUBT0_3);
> +	if ((dphy_sel >> 4 & 0xf) > 0)
> +		reg_rd_data =3D kmb_read_mipi(kmb, DPHY_TEST_DOUBT4_7);
> +	if ((dphy_sel >> 8 & 0x3) > 0)
> +		reg_rd_data =3D kmb_read_mipi(kmb, DPHY_TEST_DOUBT8_9);
> +
> +	if (((dphy_sel >> 0 & 0x1) =3D=3D 1) | ((dphy_sel >> 4 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 8 & 0x1) =3D=3D 1))
> +		data =3D reg_rd_data >> 0;
> +	if (((dphy_sel >> 1 & 0x1) =3D=3D 1) | ((dphy_sel >> 5 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 9 & 0x1) =3D=3D 1))
> +		data =3D reg_rd_data >> 8;
> +	if (((dphy_sel >> 2 & 0x1) =3D=3D 1) | ((dphy_sel >> 6 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 10 & 0x1) =3D=3D 1))
> +		data =3D reg_rd_data >> 16;
> +	if (((dphy_sel >> 3 & 0x1) =3D=3D 1) | ((dphy_sel >> 7 & 0x1) =3D=3D =
1) |
> +	    ((dphy_sel >> 11 & 0x1) =3D=3D 1))
> +		data =3D reg_rd_data >> 24;
> +
> +	return data;
> +}
> +#endif
> +
> +static void test_mode_send(struct kmb_drm_private *kmb, u32 dphy_no,
> +			   u32 test_code, u32 test_data)
> +{
> +	if (test_code !=3D TEST_CODE_FSM_CONTROL)
> +		drm_dbg(&kmb->drm,
> +			"test_code =3D %02x, test_data =3D %08x\n", test_code,
> +			 test_data);
> +	/* Steps to send test code:
> +	 * - set testclk HIGH
> +	 * - set testdin with test code
> +	 * - set testen HIGH
> +	 * - set testclk LOW
> +	 * - set testen LOW
> +	 */
> +
> +	/* Set testclk high */
> +	SET_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> +
> +	/* Set testdin */
> +	SET_TEST_DIN0_3(kmb, dphy_no, test_code);
> +
> +	/* Set testen high */
> +	SET_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> +
> +	/* Set testclk low */
> +	CLR_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> +
> +	/* Set testen low */
> +	CLR_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> +
> +	if (test_code) {
> +		/*  Steps to send test data:
> +		 * - set testen LOW
> +		 * - set testclk LOW
> +		 * - set testdin with data
> +		 * - set testclk HIGH
> +		 */
> +
> +		/* Set testen low */
> +		CLR_DPHY_TEST_CTRL1_EN(kmb, dphy_no);
> +
> +		/* Set testclk low */
> +		CLR_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> +
> +		/* Set data in testdin */
> +		kmb_write_mipi(kmb,
> +			       DPHY_TEST_DIN0_3 + ((dphy_no / 0x4) * 0x4),
> +			       test_data << ((dphy_no % 4) * 8));
> +
> +		/* Set testclk high */
> +		SET_DPHY_TEST_CTRL1_CLK(kmb, dphy_no);
> +	}
> +}
> +
> +static inline void
> +	set_test_mode_src_osc_freq_target_low_bits(struct kmb_drm_private *km=
b,
> +						   u32 dphy_no,
> +						   u32 freq)
> +{
> +	/* Typical rise/fall time=3D166, refer Table 1207 databook,
> +	 * sr_osc_freq_target[7:0]
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
> +		       (freq & 0x7f));
> +}
> +
> +static inline void
> +	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_drm_private *kmb=
,
> +						  u32 dphy_no,
> +						  u32 freq)
> +{
> +	u32 data;
> +
> +	/* Flag this as high nibble */
> +	data =3D ((freq >> 6) & 0x1f) | (1 << 7);
> +
> +	/* Typical rise/fall time=3D166, refer Table 1207 databook,
> +	 * sr_osc_freq_target[11:7]
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
> +}
> +
> +static void mipi_tx_get_vco_params(struct vco_params *vco)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(vco_table); i++) {
> +		if (vco->freq < vco_table[i].freq) {
> +			*vco =3D vco_table[i];
> +			return;
> +		}
> +	}
> +
> +	WARN_ONCE(1, "Invalid vco freq =3D %u for PLL setup\n", vco->freq);
> +}
> +
> +static void mipi_tx_pll_setup(struct kmb_drm_private *kmb, u32 dphy_no=
,
> +			      u32 ref_clk_mhz, u32 target_freq_mhz)
> +{
> +	u32 best_n =3D 0, best_m =3D 0;
> +	u32 n =3D 0, m =3D 0, div =3D 0, delta, freq =3D 0, t_freq;
> +	u32 best_freq_delta =3D 3000;
> +
> +	/* pll_ref_clk: - valid range: 2~64 MHz; Typically 24 MHz
> +	 * Fvco: - valid range: 320~1250 MHz (Gen3 D-PHY)
> +	 * Fout: - valid range: 40~1250 MHz (Gen3 D-PHY)
> +	 * n: - valid range [0 15]
> +	 * N: - N =3D n + 1
> +	 *      -valid range: [1 16]
> +	 *      -conditions: - (pll_ref_clk / N) >=3D 2 MHz
> +	 *              -(pll_ref_clk / N) <=3D 8 MHz
> +	 * m: valid range [62 623]
> +	 * M: - M =3D m + 2
> +	 *      -valid range [64 625]
> +	 *      -Fvco =3D (M/N) * pll_ref_clk
> +	 */
> +	struct vco_params vco_p =3D {
> +		.range =3D 0,
> +		.divider =3D 1,
> +	};
> +
> +	vco_p.freq =3D target_freq_mhz;
> +	mipi_tx_get_vco_params(&vco_p);
> +
> +	/* Search pll n parameter */
> +	for (n =3D PLL_N_MIN; n <=3D PLL_N_MAX; n++) {
> +		/* Calculate the pll input frequency division ratio
> +		 * multiply by 1000 for precision -
> +		 * no floating point, add n for rounding
> +		 */
> +		div =3D ((ref_clk_mhz * 1000) + n) / (n + 1);
> +
> +		/* Found a valid n parameter */
> +		if ((div < 2000 || div > 8000))
> +			continue;
> +
> +		/* Search pll m parameter */
> +		for (m =3D PLL_M_MIN; m <=3D PLL_M_MAX; m++) {
> +			/* Calculate the Fvco(DPHY PLL output frequency)
> +			 * using the current n,m params
> +			 */
> +			freq =3D div * (m + 2);
> +			freq /=3D 1000;
> +
> +			/* Trim the potential pll freq to max supported */
> +			if (freq > PLL_FVCO_MAX)
> +				continue;
> +
> +			delta =3D abs(freq - target_freq_mhz);
> +
> +			/* Select the best (closest to target pll freq)
> +			 * n,m parameters so far
> +			 */
> +			if (delta < best_freq_delta) {
> +				best_n =3D n;
> +				best_m =3D m;
> +				best_freq_delta =3D delta;
> +			}
> +		}
> +	}
> +
> +	/* Program vco_cntrl parameter
> +	 * PLL_VCO_Control[5:0] =3D pll_vco_cntrl_ovr,
> +	 * PLL_VCO_Control[6]   =3D pll_vco_cntrl_ovr_en
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_VCO_CTRL, (vco_p.range
> +								| (1 << 6)));
> +
> +	/* Program m, n pll parameters */
> +	drm_dbg(&kmb->drm, "m =3D %d n =3D %d\n", best_m, best_n);
> +
> +	/* PLL_Input_Divider_Ratio[3:0] =3D pll_n_ovr */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_INPUT_DIVIDER,
> +		       (best_n & 0x0f));
> +
> +	/* m - low nibble PLL_Loop_Divider_Ratio[4:0]
> +	 * pll_m_ovr[4:0]
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
> +		       (best_m & 0x1f));
> +
> +	/* m - high nibble PLL_Loop_Divider_Ratio[4:0]
> +	 * pll_m_ovr[9:5]
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
> +		       ((best_m >> 5) & 0x1f) | PLL_FEEDBACK_DIVIDER_HIGH);
> +
> +	/* Enable overwrite of n,m parameters :pll_n_ovr_en, pll_m_ovr_en */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_OUTPUT_CLK_SEL,
> +		       (PLL_N_OVR_EN | PLL_M_OVR_EN));
> +
> +	/* Program Charge-Pump parameters */
> +
> +	/* pll_prop_cntrl-fixed values for prop_cntrl from DPHY doc */
> +	t_freq =3D target_freq_mhz * vco_p.divider;
> +	test_mode_send(kmb, dphy_no,
> +		       TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
> +		       ((t_freq > 1150) ? 0x0C : 0x0B));
> +
> +	/* pll_int_cntrl-fixed value for int_cntrl from DPHY doc */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,=

> +		       0x00);
> +
> +	/* pll_gmp_cntrl-fixed value for gmp_cntrl from DPHY doci */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_GMP_CTRL, 0x10);
> +
> +	/* pll_cpbias_cntrl-fixed value for cpbias_cntrl from DPHY doc */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
> +
> +	/* pll_th1 -Lock Detector Phase error threshold,
> +	 * document gives fixed value
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_PHASE_ERR_CTRL, 0x02);
> +
> +	/* PLL Lock Configuration */
> +
> +	/* pll_th2 - Lock Filter length, document gives fixed value */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_LOCK_FILTER, 0x60);
> +
> +	/* pll_th3- PLL Unlocking filter, document gives fixed value */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_UNLOCK_FILTER, 0x03);
> +
> +	/* pll_lock_sel-PLL Lock Detector Selection,
> +	 * document gives fixed value
> +	 */
> +	test_mode_send(kmb, dphy_no, TEST_CODE_PLL_LOCK_DETECTOR, 0x02);
> +}
> +
> +#ifdef DPHY_GET_FSM
> +static void dphy_get_fsm(struct kmb_drm_private *kmb, u32 dphy_no)
> +{
> +	test_mode_send(kmb, dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
> +
> +	drm_dbg(&kmb->drm, "dphy %d fsm_state =3D 0%x\n", dphy_no,
> +		kmb_read_mipi(kmb, DPHY_TEST_DOUBT4_7));
> +}
> +#endif
> +
> +static void dphy_init_sequence(struct kmb_drm_private *kmb,
> +			       struct mipi_ctrl_cfg *cfg, u32 dphy_no,
> +			       int active_lanes, enum dphy_mode mode)
> +{
> +	u32 test_code =3D 0, test_data =3D 0, val;
> +	int i =3D 0;
> +
> +	drm_info(&kmb->drm,
> +		 "dphy=3D%d mode=3D%d active_lanes=3D%d\n", dphy_no, mode,
> +		 active_lanes);
> +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n",
> +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> +
> +	/* Set D-PHY in shutdown mode */
> +	/* Assert RSTZ signal */
> +	CLR_DPHY_INIT_CTRL0(kmb, dphy_no, RESETZ);
> +
> +	/* Assert SHUTDOWNZ signal */
> +	CLR_DPHY_INIT_CTRL0(kmb, dphy_no, SHUTDOWNZ);
> +	val =3D kmb_read_mipi(kmb, DPHY_INIT_CTRL0);
> +
> +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL0 =3D 0x%x\n", val);
> +
> +	/* Init D-PHY_n
> +	 * Pulse testclear signal to make sure the d-phy configuration
> +	 * starts from a clean base
> +	 */
> +	CLR_DPHY_TEST_CTRL0(kmb, dphy_no);
> +	ndelay(15);
> +	SET_DPHY_TEST_CTRL0(kmb, dphy_no);
> +	ndelay(15);
> +	CLR_DPHY_TEST_CTRL0(kmb, dphy_no);
> +	ndelay(15);
> +
> +	drm_dbg(&kmb->drm, "DPHY_TEST_CTRL0=3D0x%x\n",
> +		kmb_read_mipi(kmb, DPHY_TEST_CTRL0));
> +
> +	/* Set mastermacro bit - Master or slave mode */
> +	test_code =3D TEST_CODE_MULTIPLE_PHY_CTRL;
> +
> +	/* DPHY has its own clock lane enabled (master) */
> +	if (mode =3D=3D MIPI_DPHY_MASTER)
> +		test_data =3D 0x01;
> +	else
> +		test_data =3D 0x00;
> +
> +	/* Send the test code and data */
> +	test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +	/* Set the lane data rate */
> +	for (i =3D 0; i < MIPI_DPHY_DEFAULT_BIT_RATES; i++) {
> +		if (mipi_hs_freq_range[i].default_bit_rate_mbps <
> +		    cfg->lane_rate_mbps)
> +			continue;
> +
> +		/* Send the test code and data */
> +		/* bit[6:0] =3D hsfreqrange_ovr bit[7] =3D hsfreqrange_ovr_en */
> +		test_code =3D TEST_CODE_HS_FREQ_RANGE_CFG;
> +		test_data =3D (mipi_hs_freq_range[i].hsfreqrange_code & 0x7f) |
> +		    (1 << 7);
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +		break;
> +	}
> +
> +	/* High-Speed Tx Slew Rate Calibration
> +	 * BitRate: > 1.5 Gbps && <=3D 2.5 Gbps: slew rate control OFF
> +	 */
> +	if (cfg->lane_rate_mbps > 1500) {
> +		/* Bypass slew rate calibration algorithm
> +		 * bits[1:0} srcal_en_ovr_en, srcal_en_ovr
> +		 */
> +		test_code =3D TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> +		test_data =3D 0x02;
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Disable slew rate calibration */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> +		test_data =3D 0x00;
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +	} else if (cfg->lane_rate_mbps > 1000) {
> +		/* BitRate: > 1 Gbps && <=3D 1.5 Gbps: - slew rate control ON
> +		 * typical rise/fall times: 166 ps
> +		 */
> +
> +		/* Do not bypass slew rate calibration algorithm
> +		 * bits[1:0}=3Dsrcal_en_ovr_en, srcal_en_ovr, bit[6]=3Dsr_range
> +		 */
> +		test_code =3D TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> +		test_data =3D (0x03 | (1 << 6));
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Enable slew rate calibration */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> +		test_data =3D 0x01;
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Set sr_osc_freq_target[6:0] low nibble
> +		 * typical rise/fall time=3D166, refer Table 1207 databook
> +		 */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_CYCLES;
> +		test_data =3D (0x72f & 0x7f);
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Set sr_osc_freq_target[11:7] high nibble
> +		 * Typical rise/fall time=3D166, refer Table 1207 databook
> +		 */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_CYCLES;
> +		test_data =3D ((0x72f >> 6) & 0x1f) | (1 << 7);
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +	} else {
> +		/* lane_rate_mbps <=3D 1000 Mbps
> +		 * BitRate:  <=3D 1 Gbps:
> +		 * - slew rate control ON
> +		 * - typical rise/fall times: 225 ps
> +		 */
> +
> +		/* Do not bypass slew rate calibration algorithm */
> +		test_code =3D TEST_CODE_SLEW_RATE_OVERRIDE_CTRL;
> +		test_data =3D (0x03 | (1 << 6));
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Enable slew rate calibration */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL;
> +		test_data =3D 0x01;
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Typical rise/fall time=3D255, refer Table 1207 databook */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_CYCLES;
> +		test_data =3D (0x523 & 0x7f);
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* Set sr_osc_freq_target[11:7] high nibble */
> +		test_code =3D TEST_CODE_SLEW_RATE_DDL_CYCLES;
> +		test_data =3D ((0x523 >> 6) & 0x1f) | (1 << 7);
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +	}
> +
> +	/* Set cfgclkfreqrange */
> +	val =3D (((cfg->cfg_clk_khz / 1000) - 17) * 4) & 0x3f;
> +	SET_DPHY_FREQ_CTRL0_3(kmb, dphy_no, val);
> +
> +	drm_dbg(&kmb->drm, "DPHY_FREQ =3D 0x%x\n",
> +		kmb_read_mipi(kmb, DPHY_FREQ_CTRL0_3 + 4));
> +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n",
> +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> +
> +	/* Enable config clk for the corresponding d-phy */
> +	kmb_set_bit_mipi(kmb, DPHY_CFG_CLK_EN, dphy_no);
> +
> +	drm_dbg(&kmb->drm, "DPHY_CFG_CLK_EN =3D 0x%x\n",
> +		kmb_read_mipi(kmb, DPHY_CFG_CLK_EN));
> +
> +	/* PLL setup */
> +	if (mode =3D=3D MIPI_DPHY_MASTER) {
> +		/* Set PLL regulator in bypass */
> +		test_code =3D TEST_CODE_PLL_ANALOG_PROG;
> +		test_data =3D 0x01;
> +		test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +		/* PLL Parameters Setup */
> +		mipi_tx_pll_setup(kmb, dphy_no, cfg->ref_clk_khz / 1000,
> +				  cfg->lane_rate_mbps / 2);
> +
> +		/* Set clksel */
> +		kmb_write_bits_mipi(kmb, DPHY_INIT_CTRL1,
> +				    PLL_CLKSEL_0, 2, 0x01);
> +
> +		/* Set pll_shadow_control */
> +		kmb_set_bit_mipi(kmb, DPHY_INIT_CTRL1, PLL_SHADOW_CTRL);
> +
> +		drm_dbg(&kmb->drm, "DPHY_INIT_CTRL1 =3D 0x%x\n",
> +			kmb_read_mipi(kmb, DPHY_INIT_CTRL1));
> +	}
> +
> +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n",
> +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> +
> +//#define MIPI_TX_FORCE_VOD
> +#ifdef MIPI_TX_FORCE_VOD
> +#define MIPI_TX_VOD_LVL	450
> +#define TEST_CODE_BANDGAP 0x24
> +	/* Set bandgap/VOD level */
> +	switch (MIPI_TX_VOD_LVL) {
> +	case 200:
> +		test_data =3D 0x00;
> +		break;
> +	case 300:
> +		test_data =3D 0x20;
> +		break;
> +	case 350:
> +		test_data =3D 0x40;
> +		break;
> +	case 450:
> +		test_data =3D 0x60;
> +		break;
> +	case 400:
> +	default:
> +		test_data =3D 0x70;
> +		break;
> +	}
> +	test_mode_send(kmb, dphy_no, TEST_CODE_BANDGAP, test_data);
> +#endif
> +
> +	/* Send NORMAL OPERATION test code */
> +	test_code =3D 0x0;
> +	test_data =3D 0x0;
> +	test_mode_send(kmb, dphy_no, test_code, test_data);
> +
> +	/* Configure BASEDIR for data lanes
> +	 * NOTE: basedir only applies to LANE_0 of each D-PHY.
> +	 * The other lanes keep their direction based on the D-PHY type,
> +	 * either Rx or Tx.
> +	 * bits[5:0]  - BaseDir: 1 =3D Rx
> +	 * bits[9:6] - BaseDir: 0 =3D Tx
> +	 */
> +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n",
> +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> +
> +	kmb_write_bits_mipi(kmb, DPHY_INIT_CTRL2, 0, 9, 0x03f);
> +	ndelay(15);
> +
> +	/* Enable CLOCK LANE
> +	 * Clock lane should be enabled regardless of the direction
> +	 * set for the D-PHY (Rx/Tx)
> +	 */
> +	kmb_set_bit_mipi(kmb, DPHY_INIT_CTRL2, 12 + dphy_no);
> +
> +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL2 =3D 0x%x\n",
> +		kmb_read_mipi(kmb, DPHY_INIT_CTRL2));
> +
> +	/* Enable DATA LANES */
> +	kmb_write_bits_mipi(kmb, DPHY_ENABLE, dphy_no * 2, 2,
> +			    ((1 << active_lanes) - 1));
> +
> +	drm_dbg(&kmb->drm,
> +		"DPHY_ENABLE =3D 0x%x\n", kmb_read_mipi(kmb, DPHY_ENABLE));
> +	ndelay(15);
> +
> +	/* Take D-PHY out of shutdown mode */
> +	/* Deassert SHUTDOWNZ signal */
> +	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n",
> +		kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));
> +	SET_DPHY_INIT_CTRL0(kmb, dphy_no, SHUTDOWNZ);
> +	ndelay(15);
> +
> +	/* Deassert RSTZ signal */
> +	SET_DPHY_INIT_CTRL0(kmb, dphy_no, RESETZ);
> +	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL0 =3D 0x%x\n",
> +		kmb_read_mipi(kmb, DPHY_INIT_CTRL0));
> +}
> +
> +static void dphy_wait_fsm(struct kmb_drm_private *kmb, u32 dphy_no,
> +			  enum dphy_tx_fsm fsm_state)
> +{
> +	enum dphy_tx_fsm val =3D DPHY_TX_POWERDWN;
> +	int i =3D 0;
> +	int status =3D 1;
> +
> +	do {
> +		test_mode_send(kmb, dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
> +
> +		val =3D GET_TEST_DOUT4_7(kmb, dphy_no);
> +		i++;
> +		if (i > TIMEOUT) {
> +			status =3D 0;
> +			break;
> +		}
> +	} while (val !=3D fsm_state);
> +
> +	drm_dbg(&kmb->drm, "%s: dphy %d val =3D %x\n", __func__, dphy_no, val=
);
> +	drm_info(&kmb->drm, "********** DPHY %d WAIT_FSM %s **********\n",
> +		 dphy_no, status ? "SUCCESS" : "FAILED");
> +}
> +
> +static void wait_init_done(struct kmb_drm_private *kmb, u32 dphy_no,
> +			   u32 active_lanes)
> +{
> +	u32 stopstatedata =3D 0;
> +	u32 data_lanes =3D (1 << active_lanes) - 1;
> +	int i =3D 0, val;
> +	int status =3D 1;
> +
> +	drm_dbg(&kmb->drm, "dphy=3D%d active_lanes=3D%d data_lanes=3D%d\n", d=
phy_no,
> +		active_lanes, data_lanes);
> +
> +	do {
> +		val =3D kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7);
> +		stopstatedata =3D GET_STOPSTATE_DATA(kmb, dphy_no) & data_lanes;
> +
> +		/* TODO-need to add a time out and return failure */
> +		i++;
> +
> +		if (i > TIMEOUT) {
> +			status =3D 0;
> +
> +			drm_info(&kmb->drm,
> +				 "! WAIT_INIT_DONE: TIMING OUT!(err_stat=3D%d)",
> +				 kmb_read_mipi(kmb, MIPI_DPHY_ERR_STAT6_7));
> +			drm_dbg(&kmb->drm,
> +				"MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n", val);
> +			drm_dbg(&kmb->drm,
> +				"stopdata =3D 0x%x data_lanes=3D0x%x\n",
> +				 stopstatedata, data_lanes);
> +
> +			break;
> +		}
> +
> +		if (i < 3) {
> +			drm_dbg(&kmb->drm,
> +				"stopdata =3D 0x%x data_lanes=3D0x%x\n",
> +				 stopstatedata, data_lanes);
> +			drm_dbg(&kmb->drm,
> +				"MIPI_DPHY_STAT0_4_7 =3D 0x%x)\n", val);
> +		}
> +	} while (stopstatedata !=3D data_lanes);
> +
> +	drm_info(&kmb->drm, "********** DPHY %d INIT - %s **********\n",
> +		 dphy_no, status ? "SUCCESS" : "FAILED");
> +}
> +
> +static void wait_pll_lock(struct kmb_drm_private *kmb, u32 dphy_no)
> +{
> +	int i =3D 0;
> +	int status =3D 1;
> +
> +	do {
> +		/* TODO-need to add a time out and return failure */
> +		i++;
> +		if (i > TIMEOUT) {
> +			status =3D 0;
> +
> +			drm_info(&kmb->drm, "%s: timing out", __func__);
> +			drm_dbg(&kmb->drm,
> +				"%s : PLL_LOCK =3D 0x%x ", __func__,
> +				kmb_read_mipi(kmb, DPHY_PLL_LOCK));
> +
> +			break;
> +		}
> +
> +		if ((i % 100) =3D=3D 0)
> +			drm_dbg(&kmb->drm,
> +				"%s : PLL_LOCK =3D 0x%x\n", __func__,
> +				kmb_read_mipi(kmb, DPHY_PLL_LOCK));
> +	} while (!GET_PLL_LOCK(kmb, dphy_no));
> +
> +	drm_info(&kmb->drm, "***** PLL Locked for DPHY %d - %s *****\n",
> +		 dphy_no, status ? "SUCCESS" : "FAILED");
> +}
> +
> +static u32 mipi_tx_init_dphy(struct kmb_drm_private *kmb,
> +			     struct mipi_ctrl_cfg *cfg)
> +{
> +	u32 dphy_no =3D MIPI_DPHY6;
> +
> +	drm_info(&kmb->drm,
> +		 "active_lanes=3D%d lane_rate=3D%d\n", cfg->active_lanes,
> +		MIPI_TX_LANE_DATA_RATE_MBPS);
> +
> +	/* Multiple D-PHYs needed */
> +	if (cfg->active_lanes > MIPI_DPHY_D_LANES) {
> +		/*
> +		 *Initialization for Tx aggregation mode is done according to
> +		 *a. start init PHY1
> +		 *b. poll for PHY1 FSM state LOCK
> +		 *   b1. reg addr 0x03[3:0] - state_main[3:0] =3D=3D 5 (LOCK)
> +		 *c. poll for PHY1 calibrations done :
> +		 *   c1. termination calibration lower section: addr 0x22[5]
> +		 *   - rescal_done
> +		 *   c2. slewrate calibration (if data rate < =3D 1500 Mbps):
> +		 *     addr 0xA7[3:2] - srcal_done, sr_finished
> +		 *d. start init PHY0
> +		 *e. poll for PHY0 stopstate
> +		 *f. poll for PHY1 stopstate
> +		 */
> +		/* PHY #N+1 ('slave') */
> +
> +		dphy_init_sequence(kmb, cfg, dphy_no + 1,
> +				   (cfg->active_lanes - MIPI_DPHY_D_LANES),
> +				   MIPI_DPHY_SLAVE);
> +		dphy_wait_fsm(kmb, dphy_no + 1, DPHY_TX_LOCK);
> +
> +		/* PHY #N master */
> +		dphy_init_sequence(kmb, cfg, dphy_no, MIPI_DPHY_D_LANES,
> +				   MIPI_DPHY_MASTER);
> +
> +		/* Wait for DPHY init to complete */
> +		wait_init_done(kmb, dphy_no, MIPI_DPHY_D_LANES);
> +		wait_init_done(kmb, dphy_no + 1,
> +			       cfg->active_lanes - MIPI_DPHY_D_LANES);
> +		wait_pll_lock(kmb, dphy_no);
> +		wait_pll_lock(kmb, dphy_no + 1);
> +		dphy_wait_fsm(kmb, dphy_no, DPHY_TX_IDLE);
> +	} else {		/* Single DPHY */
> +		dphy_init_sequence(kmb, cfg, dphy_no, cfg->active_lanes,
> +				   MIPI_DPHY_MASTER);
> +		dphy_wait_fsm(kmb, dphy_no, DPHY_TX_IDLE);
> +		wait_init_done(kmb, dphy_no, cfg->active_lanes);
> +		wait_pll_lock(kmb, dphy_no);
> +	}
> +
> +	return 0;
> +}
> +
> +void connect_lcd_to_mipi(struct kmb_drm_private *kmb)
> +{
> +	/* DISABLE MIPI->CIF CONNECTION */
> +	kmb_write_msscam(kmb, MSS_MIPI_CIF_CFG, 0);
> +
> +	/* ENABLE LCD->MIPI CONNECTION */
> +	kmb_write_msscam(kmb, MSS_LCD_MIPI_CFG, 1);
> +
> +	/* DISABLE LCD->CIF LOOPBACK */
> +	kmb_write_msscam(kmb, MSS_LOOPBACK_CFG, 0);
> +}
> +
> +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode *m=
ode)
> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +	u64 data_rate;
> +
> +	mipi_tx_init_cfg.active_lanes =3D MIPI_TX_ACTIVE_LANES;
> +
> +	if (mode) {
> +		mipi_tx_frame0_sect_cfg.width_pixels =3D mode->crtc_hdisplay;
> +		mipi_tx_frame0_sect_cfg.height_lines =3D mode->crtc_vdisplay;
> +		mipitx_frame0_cfg.vsync_width =3D
> +		    mode->crtc_vsync_end - mode->crtc_vsync_start;
> +		mipitx_frame0_cfg.v_backporch =3D
> +		    mode->crtc_vtotal - mode->crtc_vsync_end;
> +		mipitx_frame0_cfg.v_frontporch =3D
> +		    mode->crtc_vsync_start - mode->crtc_vdisplay;
> +		mipitx_frame0_cfg.hsync_width =3D
> +		    mode->crtc_hsync_end - mode->crtc_hsync_start;
> +		mipitx_frame0_cfg.h_backporch =3D
> +		    mode->crtc_htotal - mode->crtc_hsync_end;
> +		mipitx_frame0_cfg.h_frontporch =3D
> +		    mode->crtc_hsync_start - mode->crtc_hdisplay;
> +
> +		/* Lane rate =3D (vtotal*htotal*fps*bpp)/4 / 1000000
> +		 * to convert to Mbps
> +		 */
> +		data_rate =3D ((((u32)mode->crtc_vtotal *
> +				(u32)mode->crtc_htotal) *
> +				(u32)(drm_mode_vrefresh(mode)) *
> +			      MIPI_TX_BPP) / mipi_tx_init_cfg.active_lanes) /
> +		    1000000;
> +
> +		drm_info(&kmb->drm, "htotal=3D%d vtotal=3D%d refresh=3D%d\n",
> +			 mode->crtc_htotal, mode->crtc_vtotal,
> +			 drm_mode_vrefresh(mode));
> +		drm_info(&kmb->drm, "data_rate=3D%u active_lanes=3D%d\n",
> +			 (u32)data_rate, mipi_tx_init_cfg.active_lanes);
> +
> +		/* When late rate < 800, modeset fails with 4 lanes,
> +		 * so switch to 2 lanes
> +		 */
> +		if (data_rate < 800) {
> +			mipi_tx_init_cfg.active_lanes =3D 2;
> +			mipi_tx_init_cfg.lane_rate_mbps =3D data_rate * 2;
> +		} else {
> +			mipi_tx_init_cfg.lane_rate_mbps =3D data_rate;
> +		}
> +		drm_info(&kmb->drm,
> +			 "lane rate=3D%d\n", mipi_tx_init_cfg.lane_rate_mbps);
> +		drm_dbg(&kmb->drm,
> +			"vfp=3D %d vbp=3D %d vsyc_len=3D%d hfp=3D%d hbp=3D%d hsync_len=3D%d=
 lane-rate=3D%d",
> +		     mipitx_frame0_cfg.v_frontporch,
> +		     mipitx_frame0_cfg.v_backporch,
> +		     mipitx_frame0_cfg.vsync_width,
> +		     mipitx_frame0_cfg.h_frontporch,
> +		     mipitx_frame0_cfg.h_backporch,
> +		     mipitx_frame0_cfg.hsync_width,
> +		     mipi_tx_init_cfg.lane_rate_mbps);
> +	}
> +
> +	if (hw_initialized)
> +		return 0;
> +
> +	kmb_write_mipi(kmb, DPHY_ENABLE, 0);
> +	kmb_write_mipi(kmb, DPHY_INIT_CTRL0, 0);
> +	kmb_write_mipi(kmb, DPHY_INIT_CTRL1, 0);
> +	kmb_write_mipi(kmb, DPHY_INIT_CTRL2, 0);
> +
> +	/* Initialize mipi controller */
> +	mipi_tx_init_cntrl(kmb, &mipi_tx_init_cfg);
> +
> +	/* Dphy initialization */
> +	mipi_tx_init_dphy(kmb, &mipi_tx_init_cfg);
> +	drm_dbg(&kmb->drm, "IRQ_STATUS =3D 0x%x\n",
> +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> +
> +	connect_lcd_to_mipi(kmb);
> +
> +#ifdef MIPI_TX_TEST_PATTERN_GENERATION
> +	mipi_tx_hs_tp_gen(kmb, 0, MIPI_TX_HS_TP_V_STRIPES,
> +			  0x15, 0xff, 0xff00, MIPI_CTRL6);
> +
> +	drm_dbg(&kmb->drm, "IRQ_STATUS =3D 0x%x\n",
> +		GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));
> +#endif //MIPI_TX_TEST_PATTERN_GENERATION
> +
> +	hw_initialized =3D true;
> +
> +	drm_dbg(&kmb->drm, "MIPI_TXm_HS_CTRL =3D 0x%x\n",
> +		kmb_read_mipi(kmb, MIPI_TXm_HS_CTRL(6)));
> +	drm_dbg(&kmb->drm, "MIPI LOOP BACK =3D %x\n",
> +		kmb_read_mipi(kmb, MIPI_CTRL_DIG_LOOPBACK));
> +	drm_info(&kmb->drm, "mipi hw_initialized =3D %d\n", hw_initialized);
> +
> +	return 0;
> +}
> +
> +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
> +{
> +	struct kmb_dsi *kmb_dsi;
> +	struct drm_encoder *encoder;
> +	struct kmb_connector *kmb_connector;
> +	struct drm_connector *connector;
> +	struct kmb_dsi_host *host;
> +	int ret =3D 0;
> +
> +	kmb_dsi =3D kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
> +	if (!kmb_dsi) {
> +		DRM_ERROR("failed to allocate kmb_dsi\n");
> +		return -ENOMEM;
> +	}
> +
> +	kmb_connector =3D kzalloc(sizeof(*kmb_connector), GFP_KERNEL);
> +	if (!kmb_connector) {
> +		kfree(kmb_dsi);
> +		DRM_ERROR("failed to allocate kmb_connector\n");
> +		return -ENOMEM;
> +	}
> +
> +	kmb_dsi->attached_connector =3D kmb_connector;
> +
> +	host =3D kmb_dsi_host_init(dev, kmb_dsi);
> +	if (!host) {
> +		DRM_ERROR("Failed to allocate host\n");
> +		kfree(kmb_dsi);
> +		kfree(kmb_connector);
> +		return -ENOMEM;
> +	}
> +
> +	kmb_dsi->dsi_host =3D host;
> +	connector =3D &kmb_connector->base;
> +	encoder =3D &kmb_dsi->base;
> +	encoder->possible_crtcs =3D 1;
> +	encoder->possible_clones =3D 0;
> +
> +	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
> +			 "MIPI-DSI");
> +
> +	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
> +			   DRM_MODE_CONNECTOR_DSI);
> +
> +	drm_connector_helper_add(connector, &kmb_dsi_connector_helper_funcs);=

> +
> +	drm_info(dev, "connector =3D %s encoder =3D %s\n", connector->name,
> +		 encoder->name);
> +
> +	ret =3D drm_connector_attach_encoder(connector, encoder);
> +	drm_info(dev, "connector->encoder =3D 0x%p ret =3D %d\n",
> +		 connector->encoder,
> +		 ret);
> +
> +	/* Link drm_bridge to encoder */
> +	ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> +	if (ret) {
> +		DRM_ERROR("failed to attach bridge to MIPI\n");
> +		drm_encoder_cleanup(encoder);
> +		return ret;
> +	}
> +	drm_info(dev, "Bridge attached : SUCCESS\n");
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_ds=
i.h
> new file mode 100644
> index 0000000..c980823
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.h
> @@ -0,0 +1,370 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =C2=A9 2019-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_DSI_H__
> +#define __KMB_DSI_H__
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include "kmb_drv.h"
> +
> +/* MIPI TX CFG*/
> +#define MIPI_TX_LANE_DATA_RATE_MBPS 891
> +#define MIPI_TX_REF_CLK_KHZ         24000
> +#define MIPI_TX_CFG_CLK_KHZ         24000
> +#define MIPI_TX_BPP		    24
> +
> +/* DPHY Tx test codes*/
> +#define TEST_CODE_FSM_CONTROL				0x03
> +#define TEST_CODE_MULTIPLE_PHY_CTRL			0x0C
> +#define TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL	0x0E
> +#define TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL		0x0F
> +#define TEST_CODE_PLL_VCO_CTRL				0x12
> +#define TEST_CODE_PLL_GMP_CTRL				0x13
> +#define TEST_CODE_PLL_PHASE_ERR_CTRL			0x14
> +#define TEST_CODE_PLL_LOCK_FILTER			0x15
> +#define TEST_CODE_PLL_UNLOCK_FILTER			0x16
> +#define TEST_CODE_PLL_INPUT_DIVIDER			0x17
> +#define TEST_CODE_PLL_FEEDBACK_DIVIDER			0x18
> +#define   PLL_FEEDBACK_DIVIDER_HIGH			BIT(7)
> +#define TEST_CODE_PLL_OUTPUT_CLK_SEL			0x19
> +#define   PLL_N_OVR_EN					BIT(4)
> +#define   PLL_M_OVR_EN					BIT(5)
> +#define TEST_CODE_VOD_LEVEL				0x24
> +#define TEST_CODE_PLL_CHARGE_PUMP_BIAS			0x1C
> +#define TEST_CODE_PLL_LOCK_DETECTOR			0x1D
> +#define TEST_CODE_HS_FREQ_RANGE_CFG			0x44
> +#define TEST_CODE_PLL_ANALOG_PROG			0x1F
> +#define TEST_CODE_SLEW_RATE_OVERRIDE_CTRL		0xA0
> +#define TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL		0xA3
> +#define TEST_CODE_SLEW_RATE_DDL_CYCLES			0xA4
> +
> +/* DPHY params */
> +#define PLL_N_MIN	0
> +#define PLL_N_MAX	15
> +#define PLL_M_MIN	62
> +#define PLL_M_MAX	623
> +#define PLL_FVCO_MAX	1250
> +
> +#define TIMEOUT		600
> +
> +#define MIPI_TX_FRAME_GEN				4
> +#define MIPI_TX_FRAME_GEN_SECTIONS			4
> +#define MIPI_CTRL_VIRTUAL_CHANNELS			4
> +#define MIPI_D_LANES_PER_DPHY				2
> +#define MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC			255
> +#define MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC			511
> +/* 2 Data Lanes per D-PHY */
> +#define MIPI_DPHY_D_LANES				2
> +#define MIPI_DPHY_DEFAULT_BIT_RATES			63
> +
> +#define to_kmb_connector(x) container_of(x, struct kmb_connector, base=
)
> +#define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
> +#define to_kmb_dsi(x) container_of(x, struct kmb_dsi, base)
> +
> +struct kmb_connector;
> +struct kmb_dsi_host;
> +
> +struct kmb_dsi {
> +	struct drm_encoder base;
> +	struct kmb_connector *attached_connector;
> +	struct kmb_dsi_host *dsi_host;
> +	struct drm_bridge *bridge;
> +};
> +
> +struct kmb_dsi_host {
> +	struct mipi_dsi_host *base;
> +	struct kmb_dsi *kmb_dsi;
> +	struct mipi_dsi_device *device;
> +};
> +
> +struct kmb_connector {
> +	struct drm_connector base;
> +	struct drm_encoder *encoder;
> +	struct drm_display_mode *fixed_mode;
> +};
> +
> +/* DPHY Tx test codes */
> +
> +enum mipi_ctrl_num {
> +	MIPI_CTRL0 =3D 0,
> +	MIPI_CTRL1,
> +	MIPI_CTRL2,
> +	MIPI_CTRL3,
> +	MIPI_CTRL4,
> +	MIPI_CTRL5,
> +	MIPI_CTRL6,
> +	MIPI_CTRL7,
> +	MIPI_CTRL8,
> +	MIPI_CTRL9,
> +	MIPI_CTRL_NA
> +};
> +
> +enum mipi_dphy_num {
> +	MIPI_DPHY0 =3D 0,
> +	MIPI_DPHY1,
> +	MIPI_DPHY2,
> +	MIPI_DPHY3,
> +	MIPI_DPHY4,
> +	MIPI_DPHY5,
> +	MIPI_DPHY6,
> +	MIPI_DPHY7,
> +	MIPI_DPHY8,
> +	MIPI_DPHY9,
> +	MIPI_DPHY_NA
> +};
> +
> +enum mipi_dir {
> +	MIPI_RX,
> +	MIPI_TX
> +};
> +
> +enum mipi_ctrl_type {
> +	MIPI_DSI,
> +	MIPI_CSI
> +};
> +
> +enum mipi_data_if {
> +	MIPI_IF_DMA,
> +	MIPI_IF_PARALLEL
> +};
> +
> +enum mipi_data_mode {
> +	MIPI_DATA_MODE0,
> +	MIPI_DATA_MODE1,
> +	MIPI_DATA_MODE2,
> +	MIPI_DATA_MODE3
> +};
> +
> +enum mipi_dsi_video_mode {
> +	DSI_VIDEO_MODE_NO_BURST_PULSE,
> +	DSI_VIDEO_MODE_NO_BURST_EVENT,
> +	DSI_VIDEO_MODE_BURST
> +};
> +
> +enum mipi_dsi_blanking_mode {
> +	TRANSITION_TO_LOW_POWER,
> +	SEND_BLANK_PACKET
> +};
> +
> +enum mipi_dsi_eotp {
> +	DSI_EOTP_DISABLED,
> +	DSI_EOTP_ENABLES
> +};
> +
> +enum mipi_dsi_data_type {
> +	DSI_SP_DT_RESERVED_00 =3D 0x00,
> +	DSI_SP_DT_VSYNC_START =3D 0x01,
> +	DSI_SP_DT_COLOR_MODE_OFF =3D 0x02,
> +	DSI_SP_DT_GENERIC_SHORT_WR =3D 0x03,
> +	DSI_SP_DT_GENERIC_RD =3D 0x04,
> +	DSI_SP_DT_DCS_SHORT_WR =3D 0x05,
> +	DSI_SP_DT_DCS_RD =3D 0x06,
> +	DSI_SP_DT_EOTP =3D 0x08,
> +	DSI_LP_DT_NULL =3D 0x09,
> +	DSI_LP_DT_RESERVED_0A =3D 0x0a,
> +	DSI_LP_DT_RESERVED_0B =3D 0x0b,
> +	DSI_LP_DT_LPPS_YCBCR422_20B =3D 0x0c,
> +	DSI_LP_DT_PPS_RGB101010_30B =3D 0x0d,
> +	DSI_LP_DT_PPS_RGB565_16B =3D 0x0e,
> +	DSI_LP_DT_RESERVED_0F =3D 0x0f,
> +
> +	DSI_SP_DT_RESERVED_10 =3D 0x10,
> +	DSI_SP_DT_VSYNC_END =3D 0x11,
> +	DSI_SP_DT_COLOR_MODE_ON =3D 0x12,
> +	DSI_SP_DT_GENERIC_SHORT_WR_1PAR =3D 0x13,
> +	DSI_SP_DT_GENERIC_RD_1PAR =3D 0x14,
> +	DSI_SP_DT_DCS_SHORT_WR_1PAR =3D 0x15,
> +	DSI_SP_DT_RESERVED_16 =3D 0x16,
> +	DSI_SP_DT_RESERVED_17 =3D 0x17,
> +	DSI_SP_DT_RESERVED_18 =3D 0x18,
> +	DSI_LP_DT_BLANK =3D 0x19,
> +	DSI_LP_DT_RESERVED_1A =3D 0x1a,
> +	DSI_LP_DT_RESERVED_1B =3D 0x1b,
> +	DSI_LP_DT_PPS_YCBCR422_24B =3D 0x1c,
> +	DSI_LP_DT_PPS_RGB121212_36B =3D 0x1d,
> +	DSI_LP_DT_PPS_RGB666_18B =3D 0x1e,
> +	DSI_LP_DT_RESERVED_1F =3D 0x1f,
> +
> +	DSI_SP_DT_RESERVED_20 =3D 0x20,
> +	DSI_SP_DT_HSYNC_START =3D 0x21,
> +	DSI_SP_DT_SHUT_DOWN_PERIPH_CMD =3D 0x22,
> +	DSI_SP_DT_GENERIC_SHORT_WR_2PAR =3D 0x23,
> +	DSI_SP_DT_GENERIC_RD_2PAR =3D 0x24,
> +	DSI_SP_DT_RESERVED_25 =3D 0x25,
> +	DSI_SP_DT_RESERVED_26 =3D 0x26,
> +	DSI_SP_DT_RESERVED_27 =3D 0x27,
> +	DSI_SP_DT_RESERVED_28 =3D 0x28,
> +	DSI_LP_DT_GENERIC_LONG_WR =3D 0x29,
> +	DSI_LP_DT_RESERVED_2A =3D 0x2a,
> +	DSI_LP_DT_RESERVED_2B =3D 0x2b,
> +	DSI_LP_DT_PPS_YCBCR422_16B =3D 0x2c,
> +	DSI_LP_DT_RESERVED_2D =3D 0x2d,
> +	DSI_LP_DT_LPPS_RGB666_18B =3D 0x2e,
> +	DSI_LP_DT_RESERVED_2F =3D 0x2f,
> +
> +	DSI_SP_DT_RESERVED_30 =3D 0x30,
> +	DSI_SP_DT_HSYNC_END =3D 0x31,
> +	DSI_SP_DT_TURN_ON_PERIPH_CMD =3D 0x32,
> +	DSI_SP_DT_RESERVED_33 =3D 0x33,
> +	DSI_SP_DT_RESERVED_34 =3D 0x34,
> +	DSI_SP_DT_RESERVED_35 =3D 0x35,
> +	DSI_SP_DT_RESERVED_36 =3D 0x36,
> +	DSI_SP_DT_SET_MAX_RETURN_PKT_SIZE =3D 0x37,
> +	DSI_SP_DT_RESERVED_38 =3D 0x38,
> +	DSI_LP_DT_DSC_LONG_WR =3D 0x39,
> +	DSI_LP_DT_RESERVED_3A =3D 0x3a,
> +	DSI_LP_DT_RESERVED_3B =3D 0x3b,
> +	DSI_LP_DT_RESERVED_3C =3D 0x3c,
> +	DSI_LP_DT_PPS_YCBCR420_12B =3D 0x3d,
> +	DSI_LP_DT_PPS_RGB888_24B =3D 0x3e,
> +	DSI_LP_DT_RESERVED_3F =3D 0x3f
> +};
> +
> +enum mipi_tx_hs_tp_sel {
> +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR0 =3D 0,
> +	MIPI_TX_HS_TP_WHOLE_FRAME_COLOR1,
> +	MIPI_TX_HS_TP_V_STRIPES,
> +	MIPI_TX_HS_TP_H_STRIPES,
> +};
> +
> +enum dphy_mode {
> +	MIPI_DPHY_SLAVE =3D 0,
> +	MIPI_DPHY_MASTER
> +};
> +
> +enum dphy_tx_fsm {
> +	DPHY_TX_POWERDWN =3D 0,
> +	DPHY_TX_BGPON,
> +	DPHY_TX_TERMCAL,
> +	DPHY_TX_TERMCALUP,
> +	DPHY_TX_OFFSETCAL,
> +	DPHY_TX_LOCK,
> +	DPHY_TX_SRCAL,
> +	DPHY_TX_IDLE,
> +	DPHY_TX_ULP,
> +	DPHY_TX_LANESTART,
> +	DPHY_TX_CLKALIGN,
> +	DPHY_TX_DDLTUNNING,
> +	DPHY_TX_ULP_FORCE_PLL,
> +	DPHY_TX_LOCK_LOSS
> +};
> +
> +struct mipi_data_type_params {
> +	u8 size_constraint_pixels;
> +	u8 size_constraint_bytes;
> +	u8 pixels_per_pclk;
> +	u8 bits_per_pclk;
> +};
> +
> +struct mipi_tx_dsi_cfg {
> +	u8 hfp_blank_en;	/*horizontal front porch blanking enable */
> +	u8 eotp_en;	/*End of transmission packet enable */
> +	/*last vertical front porch blanking mode */
> +	u8 lpm_last_vfp_line;
> +	/*first vertical sync active blanking mode */
> +	u8 lpm_first_vsa_line;
> +	u8 sync_pulse_eventn;	/*sync type */
> +	u8 hfp_blanking;	/*horizontal front porch blanking mode */
> +	u8 hbp_blanking;	/*horizontal back porch blanking mode */
> +	u8 hsa_blanking;	/*horizontal sync active blanking mode */
> +	u8 v_blanking;	/*vertical timing blanking mode */
> +};
> +
> +struct mipi_tx_frame_section_cfg {
> +	u32 dma_v_stride;
> +	u16 dma_v_scale_cfg;
> +	u16 width_pixels;
> +	u16 height_lines;
> +	u8 dma_packed;
> +	u8 bpp;
> +	u8 bpp_unpacked;
> +	u8 dma_h_stride;
> +	u8 data_type;
> +	u8 data_mode;
> +	u8 dma_flip_rotate_sel;
> +};
> +
> +struct mipi_tx_frame_timing_cfg {
> +	u32 bpp;
> +	u32 lane_rate_mbps;
> +	u32 hsync_width;
> +	u32 h_backporch;
> +	u32 h_frontporch;
> +	u32 h_active;
> +	u16 vsync_width;
> +	u16 v_backporch;
> +	u16 v_frontporch;
> +	u16 v_active;
> +	u8 active_lanes;
> +};
> +
> +struct mipi_tx_frame_sect_phcfg {
> +	u32 wc;
> +	enum mipi_data_mode data_mode;
> +	enum mipi_dsi_data_type data_type;
> +	u8 vchannel;
> +	u8 dma_packed;
> +};
> +
> +struct mipi_tx_frame_cfg {
> +	struct mipi_tx_frame_section_cfg *sections[MIPI_TX_FRAME_GEN_SECTIONS=
];
> +	u32 hsync_width;	/*in pixels */
> +	u32 h_backporch;	/*in pixels */
> +	u32 h_frontporch;	/*in pixels */
> +	u16 vsync_width;	/*in lines */
> +	u16 v_backporch;	/*in lines */
> +	u16 v_frontporch;	/*in lines */
> +};
> +
> +struct mipi_tx_ctrl_cfg {
> +	struct mipi_tx_frame_cfg *frames[MIPI_TX_FRAME_GEN];
> +	struct mipi_tx_dsi_cfg *tx_dsi_cfg;
> +	u8 line_sync_pkt_en;
> +	u8 line_counter_active;
> +	u8 frame_counter_active;
> +	u8 tx_hsclkkidle_cnt;
> +	u8 tx_hsexit_cnt;
> +	u8 tx_crc_en;
> +	u8 tx_hact_wait_stop;
> +	u8 tx_always_use_hact;
> +	u8 tx_wait_trig;
> +	u8 tx_wait_all_sect;
> +};
> +
> +/*configuration structure for MIPI control */
> +struct mipi_ctrl_cfg {
> +	/* controller index : CTRL6 for connecting to LCD */
> +	u8 index;
> +	u8 type;		/* controller type : MIPI_DSI */
> +	u8 dir;		/* controller direction : MIPI_TX */
> +	u8 active_lanes;	/* # active lanes per controller 2/4 */
> +	u32 lane_rate_mbps;	/*MBPS */
> +	u32 ref_clk_khz;
> +	u32 cfg_clk_khz;
> +	u32 data_if;	/*MIPI_IF_DMA or MIPI_IF_PARALLEL */
> +	struct mipi_tx_ctrl_cfg tx_ctrl_cfg;
> +};
> +
> +/* Structure for storing user specified interrupts that are enabled */=

> +union mipi_irq_cfg {
> +	u8 value;
> +	struct {
> +		u8 line_compare:1;
> +		u8 dma_event:1;
> +		u8 frame_done:1;
> +		u8 ctrl_error:1;
> +		u8 dphy_error:1;
> +	} irq_cfg;
> +};
> +
> +struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
> +int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
> +void kmb_plane_destroy(struct drm_plane *plane);
> +void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
> +void kmb_dsi_host_unregister(void);
> +int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode *m=
ode);
> +#endif /* __KMB_DSI_H__ */
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_=
plane.c
> new file mode 100644
> index 0000000..31bcba0
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_data/simplefb.h>
> +#include <video/videomode.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_managed.h>
> +
> +#include "kmb_crtc.h"
> +#include "kmb_drv.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +struct layer_status plane_status[KMB_MAX_PLANES];
> +const u32 layer_irqs[] =3D {
> +	LCD_INT_VL0,
> +	LCD_INT_VL1,
> +	LCD_INT_GL0,
> +	LCD_INT_GL1
> +};
> +
> +static unsigned int check_pixel_format(struct drm_plane *plane, u32 fo=
rmat)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < plane->format_count; i++) {
> +		if (plane->format_types[i] =3D=3D format)
> +			return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int kmb_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	int ret;
> +
> +	fb =3D state->fb;
> +	if (!fb || !state->crtc)
> +		return 0;
> +
> +	ret =3D check_pixel_format(plane, fb->format->format);
> +	if (ret)
> +		return ret;
> +
> +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
> +		return -EINVAL;
> +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *state)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +	int plane_id =3D kmb_plane->id;
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	plane_status[plane_id].disable =3D true;
> +}
> +
> +unsigned int set_pixel_format(u32 format)
> +{
> +	unsigned int val =3D 0;
> +
> +	switch (format) {
> +		/* planar formats */
> +	case DRM_FORMAT_YUV444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_NV12:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +		/* packed formats */
> +		/* looks hw requires B & G to be swapped when RGB */
> +	case DRM_FORMAT_RGB332:
> +		val =3D LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBX4444;
> +		break;
> +	case DRM_FORMAT_ARGB4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444;
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555;
> +		break;
> +	case DRM_FORMAT_ARGB1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555;
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		val =3D LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR565:
> +		val =3D LCD_LAYER_FORMAT_RGB565;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		val =3D LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR888:
> +		val =3D LCD_LAYER_FORMAT_RGB888;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888;
> +		break;
> +	}
> +	DRM_INFO_ONCE("%s : %d format=3D0x%x val=3D0x%x\n",
> +		      __func__, __LINE__, format, val);
> +	return val;
> +}
> +
> +unsigned int set_bits_per_pixel(const struct drm_format_info *format)
> +{
> +	u32 bpp =3D 0;
> +	unsigned int val =3D 0;
> +
> +	if (format->num_planes > 1) {
> +		val =3D LCD_LAYER_8BPP;
> +		return val;
> +	}
> +
> +	bpp +=3D 8 * format->cpp[0];
> +
> +	switch (bpp) {
> +	case 8:
> +		val =3D LCD_LAYER_8BPP;
> +		break;
> +	case 16:
> +		val =3D LCD_LAYER_16BPP;
> +		break;
> +	case 24:
> +		val =3D LCD_LAYER_24BPP;
> +		break;
> +	case 32:
> +		val =3D LCD_LAYER_32BPP;
> +		break;
> +	}
> +
> +	DRM_DEBUG("bpp=3D%d val=3D0x%x\n", bpp, val);
> +	return val;
> +}
> +
> +static void config_csc(struct kmb_drm_private *kmb, int plane_id)
> +{
> +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id), csc_coef_lcd[0])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id), csc_coef_lcd[1])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id), csc_coef_lcd[2])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id), csc_coef_lcd[3])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id), csc_coef_lcd[4])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id), csc_coef_lcd[5])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id), csc_coef_lcd[6])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id), csc_coef_lcd[7])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id), csc_coef_lcd[8])=
;
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
> +}
> +
> +static void kmb_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	struct kmb_drm_private *kmb;
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int dma_len;
> +	struct kmb_plane *kmb_plane;
> +	unsigned int dma_cfg;
> +	unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> +	unsigned int src_w, src_h, crtc_x, crtc_y;
> +	unsigned char plane_id;
> +	int num_planes;
> +	static dma_addr_t addr[MAX_SUB_PLANES] =3D { 0, 0, 0 };
> +
> +	if (!plane || !plane->state || !state)
> +		return;
> +
> +	fb =3D plane->state->fb;
> +	if (!fb)
> +		return;
> +	num_planes =3D fb->format->num_planes;
> +	kmb_plane =3D to_kmb_plane(plane);
> +	plane_id =3D kmb_plane->id;
> +
> +	kmb =3D to_kmb(plane->dev);
> +
> +	if (kmb_under_flow || kmb_flush_done) {
> +		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning");
> +		return;
> +	}
> +
> +	src_w =3D (plane->state->src_w >> 16);
> +	src_h =3D plane->state->src_h >> 16;
> +	crtc_x =3D plane->state->crtc_x;
> +	crtc_y =3D plane->state->crtc_y;
> +
> +	drm_dbg(&kmb->drm,
> +		"src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x fb->flags=3D0x%x\n=
",
> +		  src_w, src_h, fb->format->format, fb->flags);
> +
> +	width =3D fb->width;
> +	height =3D fb->height;
> +	dma_len =3D (width * height * fb->format->cpp[0]);
> +	drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> +		      fb->pitches[0]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> +		      (width * fb->format->cpp[0]));
> +
> +	addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> +	kmb->fb_addr =3D addr[Y_PLANE];
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> +		      addr[Y_PLANE] + fb->offsets[0]);
> +	val =3D set_pixel_format(fb->format->format);
> +	val |=3D set_bits_per_pixel(fb->format);
> +	/* Program Cb/Cr for planar formats */
> +	if (num_planes > 1) {
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> +			      width * fb->format->cpp[0]);
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> +			      (width * fb->format->cpp[0]));
> +
> +		addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state,
> +							U_PLANE);
> +		/* check if Cb/Cr is swapped*/
> +		if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_ORDER))
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					addr[U_PLANE]);
> +		else
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					addr[U_PLANE]);
> +
> +		if (num_planes =3D=3D 3) {
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> +								plane->state,
> +								V_PLANE);
> +
> +			/* check if Cb/Cr is swapped*/
> +			if (val & LCD_LAYER_CRCB_ORDER)
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					      addr[V_PLANE]);
> +			else
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					      addr[V_PLANE]);
> +		}
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);
> +	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> +
> +	val |=3D LCD_LAYER_FIFO_100;
> +
> +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> +		val |=3D LCD_LAYER_CSC_EN;
> +
> +		/* Enable CSC if input is planar and output is RGB */
> +		config_csc(kmb, plane_id);
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	ctrl |=3D LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> +
> +	/* LCD is connected to MIPI on kmb
> +	 * Therefore this bit is required for DSI Tx
> +	 */
> +	ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> +
> +	/* FIXME no doc on how to set output format,these values are
> +	 * taken from the Myriadx tests
> +	 */
> +	out_format |=3D LCD_OUTF_FORMAT_RGB888;
> +
> +	/* Leave RGB order,conversion mode and clip mode to default */
> +	/* do not interleave RGB channels for mipi Tx compatibility */
> +	out_format |=3D LCD_OUTF_MIPI_RGB_MODE;
> +	kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> +
> +	dma_cfg =3D LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
> +	    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
> +
> +	/* Enable DMA */
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> +	drm_dbg(&kmb->drm, "dma_cfg=3D0x%x LCD_DMA_CFG=3D0x%x\n", dma_cfg,
> +		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +}
> +
> +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs =3D =
{
> +	.atomic_check =3D kmb_plane_atomic_check,
> +	.atomic_update =3D kmb_plane_atomic_update,
> +	.atomic_disable =3D kmb_plane_atomic_disable
> +};
> +
> +void kmb_plane_destroy(struct drm_plane *plane)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +
> +	drm_plane_cleanup(plane);
> +	kfree(kmb_plane);
> +}
> +
> +static void kmb_destroy_plane_state(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct kmb_plane_state *kmb_state =3D to_kmb_plane_state(state);
> +
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(kmb_state);
> +}
> +
> +struct drm_plane_state *kmb_plane_duplicate_state(struct drm_plane *pl=
ane)
> +{
> +	struct drm_plane_state *state;
> +	struct kmb_plane_state *kmb_state;
> +
> +	kmb_state =3D kmemdup(plane->state, sizeof(*kmb_state), GFP_KERNEL);
> +	if (!kmb_state)
> +		return NULL;
> +
> +	state =3D &kmb_state->base_plane_state;
> +	__drm_atomic_helper_plane_duplicate_state(plane, state);
> +
> +	return state;
> +}
> +
> +static void kmb_plane_reset(struct drm_plane *plane)
> +{
> +	struct kmb_plane_state *kmb_state =3D to_kmb_plane_state(plane->state=
);
> +
> +	if (kmb_state)
> +		__drm_atomic_helper_plane_destroy_state
> +		    (&kmb_state->base_plane_state);
> +	kfree(kmb_state);
> +
> +	plane->state =3D NULL;
> +	kmb_state =3D kzalloc(sizeof(*kmb_state), GFP_KERNEL);
> +	if (kmb_state) {
> +		kmb_state->base_plane_state.plane =3D plane;
> +		kmb_state->base_plane_state.rotation =3D DRM_MODE_ROTATE_0;
> +		plane->state =3D &kmb_state->base_plane_state;
> +		kmb_state->no_planes =3D KMB_MAX_PLANES;
> +	}
> +}
> +
> +static const struct drm_plane_funcs kmb_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D kmb_plane_destroy,
> +	.reset =3D kmb_plane_reset,
> +	.atomic_duplicate_state =3D kmb_plane_duplicate_state,
> +	.atomic_destroy_state =3D kmb_destroy_plane_state,
> +};
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> +{
> +	struct kmb_drm_private *lcd =3D to_kmb(drm);
> +	struct kmb_plane *plane =3D NULL;
> +	struct kmb_plane *primary =3D NULL;
> +	int i =3D 0;
> +	int ret =3D 0;
> +	enum drm_plane_type plane_type;
> +	const u32 *plane_formats;
> +	int num_plane_formats;
> +
> +	for (i =3D 0; i < lcd->n_layers; i++) {
> +		plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);

This is incorrect. You allocate with drmm_kzalloc() but free with
kfree() in the plane's destroy callback. Memory returned by drmm_kzalloc
wil be freed by DRM automatically.

Instead of allocating each plane individually, it's better to allocate
the whole plane array with drmm_kzalloc() first and that's all you need.
The plane init loop then doesn't have to bother about memory
allocation/freeing.

> +
> +		if (!plane) {
> +			drm_err(drm, "Failed to allocate plane\n");
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
> +		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> +		    DRM_PLANE_TYPE_OVERLAY;
> +		if (i < 2) {
> +			plane_formats =3D kmb_formats_v;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_v);
> +		} else {
> +			plane_formats =3D kmb_formats_g;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_g);
> +		}
> +
> +		ret =3D drm_universal_plane_init(drm, &plane->base_plane,
> +					       POSSIBLE_CRTCS, &kmb_plane_funcs,
> +					       plane_formats, num_plane_formats,
> +					       NULL, plane_type, "plane %d", i);
> +		if (ret < 0) {
> +			drm_err(drm, "drm_universal_plane_init failed (ret=3D%d)",
> +				ret);
> +			goto cleanup;
> +		}
> +		drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> +			__func__, __LINE__,
> +			  i, plane_type);
> +		drm_plane_helper_add(&plane->base_plane,
> +				     &kmb_plane_helper_funcs);
> +		if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			primary =3D plane;
> +			lcd->plane =3D plane;
> +		}
> +		drm_dbg(drm, "%s : %d primary=3D%p\n", __func__, __LINE__,
> +			&primary->base_plane);
> +		plane->id =3D i;
> +	}
> +
> +	return primary;
> +cleanup:
> +	kfree(plane);
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_=
plane.h
> new file mode 100644
> index 0000000..48f237f
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_PLANE_H__
> +#define __KMB_PLANE_H__
> +
> +#include "kmb_drv.h"
> +
> +extern int kmb_under_flow;
> +extern int kmb_flush_done;
> +
> +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UN=
DERFLOW)
> +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UN=
DERFLOW)
> +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE | LCD_INT_VL0_E=
RR)
> +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_E=
RR)
> +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_E=
RR)
> +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_E=
RR)
> +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
> +		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> +
> +#define POSSIBLE_CRTCS 1
> +#define INITIALIZED 1
> +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> +
> +#define to_kmb_plane_state(x) \
> +		container_of(x, struct kmb_plane_state, base_plane_state)
> +
> +enum layer_id {
> +	LAYER_0,
> +	LAYER_1,
> +	LAYER_2,
> +	LAYER_3,
> +//	KMB_MAX_PLANES,
> +};
> +
> +#define KMB_MAX_PLANES 1
> +
> +enum sub_plane_id {
> +	Y_PLANE,
> +	U_PLANE,
> +	V_PLANE,
> +	MAX_SUB_PLANES,
> +};
> +
> +struct kmb_plane {
> +	struct drm_plane base_plane;
> +	struct kmb_drm_private kmb_dev;
> +	unsigned char id;
> +};
> +
> +struct kmb_plane_state {
> +	struct drm_plane_state base_plane_state;
> +	unsigned char no_planes;
> +};
> +
> +/* Graphics layer (layers 2 & 3) formats, only packed formats  are sup=
ported */
> +static const u32 kmb_formats_g[] =3D {
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +};
> +
> +#define MAX_FORMAT_G	(ARRAY_SIZE(kmb_formats_g))
> +#define MAX_FORMAT_V	(ARRAY_SIZE(kmb_formats_v))
> +
> +/* Video layer ( 0 & 1) formats, packed and planar formats are support=
ed */
> +static const u32 kmb_formats_v[] =3D {
> +	/* packed formats */
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +	/*planar formats */
> +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> +};
> +
> +/* Conversion (yuv->rgb) matrix from myriadx */
> +static const u32 csc_coef_lcd[] =3D {
> +	1024, 0, 1436,
> +	1024, -352, -731,
> +	1024, 1814, 0,
> +	-179, 125, -226
> +};
> +
> +struct layer_status {
> +	bool disable;
> +	u32 ctrl;
> +};
> +
> +extern struct layer_status plane_status[KMB_MAX_PLANES];
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> +void kmb_plane_destroy(struct drm_plane *plane);
> +#endif /* __KMB_PLANE_H__ */
> diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_r=
egs.h
> new file mode 100644
> index 0000000..f794ac3
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_regs.h
> @@ -0,0 +1,748 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =C2=A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_REGS_H__
> +#define __KMB_REGS_H__
> +
> +#define ENABLE					 1
> +#define DISABLE					 0
> +/*from Data Book section 12.5.8.1 page 4322 */
> +#define CPR_BASE_ADDR                           (0x20810000)
> +#define MIPI_BASE_ADDR                          (0x20900000)
> +/*from Data Book section 12.11.6.1 page 4972 */
> +#define LCD_BASE_ADDR                           (0x20930000)
> +#define MSS_CAM_BASE_ADDR			(MIPI_BASE_ADDR + 0x10000)
> +#define LCD_MMIO_SIZE				(0x3000)
> +#define MIPI_MMIO_SIZE				(0x4000)
> +#define MSS_CAM_MMIO_SIZE			(0x30)
> +
> +/*********************************************************************=
******
> + *		   LCD controller control register defines
> + *********************************************************************=
******/
> +#define LCD_CONTROL				(0x4 * 0x000)
> +#define LCD_CTRL_PROGRESSIVE			  (0 << 0)

What's the point of shifting 0 by 0?

> +#define LCD_CTRL_INTERLACED			  BIT(0)
> +#define LCD_CTRL_ENABLE				  BIT(1)
> +#define LCD_CTRL_VL1_ENABLE			  BIT(2)
> +#define LCD_CTRL_VL2_ENABLE			  BIT(3)
> +#define LCD_CTRL_GL1_ENABLE			  BIT(4)
> +#define LCD_CTRL_GL2_ENABLE			  BIT(5)
> +#define LCD_CTRL_ALPHA_BLEND_VL1		  (0 << 6)
> +#define LCD_CTRL_ALPHA_BLEND_VL2		  BIT(6)
> +#define LCD_CTRL_ALPHA_BLEND_GL1		  (2 << 6)
> +#define LCD_CTRL_ALPHA_BLEND_GL2		  (3 << 6)
> +#define LCD_CTRL_ALPHA_TOP_VL1			  (0 << 8)
> +#define LCD_CTRL_ALPHA_TOP_VL2			  BIT(8)
> +#define LCD_CTRL_ALPHA_TOP_GL1			  (2 << 8)
> +#define LCD_CTRL_ALPHA_TOP_GL2			  (3 << 8)
> +#define LCD_CTRL_ALPHA_MIDDLE_VL1		  (0 << 10)
> +#define LCD_CTRL_ALPHA_MIDDLE_VL2		  BIT(10)
> +#define LCD_CTRL_ALPHA_MIDDLE_GL1		  (2 << 10)
> +#define LCD_CTRL_ALPHA_MIDDLE_GL2		  (3 << 10)
> +#define LCD_CTRL_ALPHA_BOTTOM_VL1		  (0 << 12)
> +#define LCD_CTRL_ALPHA_BOTTOM_VL2		  BIT(12)
> +#define LCD_CTRL_ALPHA_BOTTOM_GL1		  (2 << 12)
> +#define LCD_CTRL_ALPHA_BOTTOM_GL2		  (3 << 12)
> +#define LCD_CTRL_TIM_GEN_ENABLE			  BIT(14)
> +#define LCD_CTRL_CONTINUOUS			  (0 << 15)
> +#define LCD_CTRL_ONE_SHOT			  BIT(15)
> +#define LCD_CTRL_PWM0_EN			  BIT(16)
> +#define LCD_CTRL_PWM1_EN			  BIT(17)
> +#define LCD_CTRL_PWM2_EN			  BIT(18)
> +#define LCD_CTRL_OUTPUT_DISABLED		  (0 << 19)
> +#define LCD_CTRL_OUTPUT_ENABLED			  BIT(19)
> +#define LCD_CTRL_BPORCH_ENABLE			  BIT(21)
> +#define LCD_CTRL_FPORCH_ENABLE			  BIT(22)
> +#define LCD_CTRL_PIPELINE_DMA			  BIT(28)
> +#define LCD_CTRL_VHSYNC_IDLE_LVL		  BIT(31)
> +
> +/*interrupts */
> +#define LCD_INT_STATUS				(0x4 * 0x001)
> +#define LCD_INT_EOF				  BIT(0)
> +#define LCD_INT_LINE_CMP			  BIT(1)
> +#define LCD_INT_VERT_COMP			  BIT(2)
> +#define LAYER0_DMA_DONE				  BIT(3)
> +#define LAYER0_DMA_IDLE				  BIT(4)
> +#define LAYER0_DMA_FIFO_OVERFLOW		  BIT(5)
> +#define LAYER0_DMA_FIFO_UNDERFLOW		  BIT(6)
> +#define LAYER0_DMA_CB_FIFO_OVERFLOW		  BIT(7)
> +#define LAYER0_DMA_CB_FIFO_UNDERFLOW		  BIT(8)
> +#define LAYER0_DMA_CR_FIFO_OVERFLOW		  BIT(9)
> +#define LAYER0_DMA_CR_FIFO_UNDERFLOW		  BIT(10)
> +#define LAYER1_DMA_DONE				  BIT(11)
> +#define LAYER1_DMA_IDLE				  BIT(12)
> +#define LAYER1_DMA_FIFO_OVERFLOW		  BIT(13)
> +#define LAYER1_DMA_FIFO_UNDERFLOW		  BIT(14)
> +#define LAYER1_DMA_CB_FIFO_OVERFLOW		  BIT(15)
> +#define LAYER1_DMA_CB_FIFO_UNDERFLOW		  BIT(16)
> +#define LAYER1_DMA_CR_FIFO_OVERFLOW		  BIT(17)
> +#define LAYER1_DMA_CR_FIFO_UNDERFLOW		  BIT(18)
> +#define LAYER2_DMA_DONE				  BIT(19)
> +#define LAYER2_DMA_IDLE				  BIT(20)
> +#define LAYER2_DMA_FIFO_OVERFLOW		  BIT(21)
> +#define LAYER2_DMA_FIFO_UNDERFLOW		  BIT(22)
> +#define LAYER3_DMA_DONE				  BIT(23)
> +#define LAYER3_DMA_IDLE				  BIT(24)
> +#define LAYER3_DMA_FIFO_OVERFLOW		  BIT(25)
> +#define LAYER3_DMA_FIFO_UNDERFLOW		  BIT(26)
> +#define LCD_INT_LAYER				  (0x07fffff8)
> +#define LCD_INT_ENABLE				(0x4 * 0x002)
> +#define LCD_INT_CLEAR				(0x4 * 0x003)
> +#define LCD_LINE_COUNT				(0x4 * 0x004)
> +#define LCD_LINE_COMPARE			(0x4 * 0x005)
> +#define LCD_VSTATUS				(0x4 * 0x006)
> +
> +/*LCD_VSTATUS_COMPARE Vertcal interval in which to generate vertcal
> + * interval interrupt
> + */
> +/* BITS 13 and 14 */
> +#define LCD_VSTATUS_COMPARE			(0x4 * 0x007)
> +#define LCD_VSTATUS_VERTICAL_STATUS_MASK	  (3 << 13)
> +#define LCD_VSTATUS_COMPARE_VSYNC		  (0 << 13)
> +#define LCD_VSTATUS_COMPARE_BACKPORCH		  BIT(13)
> +#define LCD_VSTATUS_COMPARE_ACTIVE		  (2 << 13)
> +#define LCD_VSTATUS_COMPARE_FRONT_PORCH		  (3 << 13)
> +
> +#define LCD_SCREEN_WIDTH			(0x4 * 0x008)
> +#define LCD_SCREEN_HEIGHT			(0x4 * 0x009)
> +#define LCD_FIELD_INT_CFG			(0x4 * 0x00a)
> +#define LCD_FIFO_FLUSH				(0x4 * 0x00b)
> +#define LCD_BG_COLOUR_LS			(0x4 * 0x00c)
> +#define LCD_BG_COLOUR_MS			(0x4 * 0x00d)
> +#define LCD_RAM_CFG			        (0x4 * 0x00e)
> +
> +/*********************************************************************=
*******
> + *		   LCD controller Layer config register
> + *********************************************************************=
*******
> + */
> +#define LCD_LAYER0_CFG		        (0x4 * 0x100)
> +#define LCD_LAYERn_CFG(N)			(LCD_LAYER0_CFG + (0x400 * (N)))
> +#define LCD_LAYER_SCALE_H			BIT(1)
> +#define LCD_LAYER_SCALE_V			BIT(2)
> +#define LCD_LAYER_SCALE_H_V			(LCD_LAYER_SCALE_H | \
> +						      LCD_LAYER_SCALE_V)
> +#define LCD_LAYER_CSC_EN			BIT(3)
> +#define LCD_LAYER_ALPHA_STATIC			BIT(4)
> +#define LCD_LAYER_ALPHA_EMBED			BIT(5)
> +#define LCD_LAYER_ALPHA_COMBI			(LCD_LAYER_ALPHA_STATIC | \
> +						      LCD_LAYER_ALPHA_EMBED)
> +/* RGB multiplied with alpha */
> +#define LCD_LAYER_ALPHA_PREMULT			BIT(6)
> +#define LCD_LAYER_INVERT_COL			BIT(7)
> +#define LCD_LAYER_TRANSPARENT_EN		BIT(8)
> +#define LCD_LAYER_FORMAT_YCBCR444PLAN		(0 << 9)
> +#define LCD_LAYER_FORMAT_YCBCR422PLAN		BIT(9)
> +#define LCD_LAYER_FORMAT_YCBCR420PLAN		(2 << 9)
> +#define LCD_LAYER_FORMAT_RGB888PLAN		(3 << 9)
> +#define LCD_LAYER_FORMAT_YCBCR444LIN		(4 << 9)
> +#define LCD_LAYER_FORMAT_YCBCR422LIN		(5 << 9)
> +#define LCD_LAYER_FORMAT_RGB888			(6 << 9)
> +#define LCD_LAYER_FORMAT_RGBA8888		(7 << 9)
> +#define LCD_LAYER_FORMAT_RGBX8888		(8 << 9)
> +#define LCD_LAYER_FORMAT_RGB565			(9 << 9)
> +#define LCD_LAYER_FORMAT_RGBA1555		(0xa << 9)
> +#define LCD_LAYER_FORMAT_XRGB1555		(0xb << 9)
> +#define LCD_LAYER_FORMAT_RGB444			(0xc << 9)
> +#define LCD_LAYER_FORMAT_RGBA4444		(0xd << 9)
> +#define LCD_LAYER_FORMAT_RGBX4444		(0xe << 9)
> +#define LCD_LAYER_FORMAT_RGB332			(0xf << 9)
> +#define LCD_LAYER_FORMAT_RGBA3328		(0x10 << 9)
> +#define LCD_LAYER_FORMAT_RGBX3328		(0x11 << 9)
> +#define LCD_LAYER_FORMAT_CLUT			(0x12 << 9)
> +#define LCD_LAYER_FORMAT_NV12			(0x1c << 9)
> +#define LCD_LAYER_PLANAR_STORAGE		BIT(14)
> +#define LCD_LAYER_8BPP				(0 << 15)
> +#define LCD_LAYER_16BPP				BIT(15)
> +#define LCD_LAYER_24BPP				(2 << 15)
> +#define LCD_LAYER_32BPP				(3 << 15)
> +#define LCD_LAYER_Y_ORDER			BIT(17)
> +#define LCD_LAYER_CRCB_ORDER			BIT(18)
> +#define LCD_LAYER_BGR_ORDER			BIT(19)
> +#define LCD_LAYER_LUT_2ENT			(0 << 20)
> +#define LCD_LAYER_LUT_4ENT			BIT(20)
> +#define LCD_LAYER_LUT_16ENT			(2 << 20)
> +#define LCD_LAYER_NO_FLIP			(0 << 22)
> +#define LCD_LAYER_FLIP_V			BIT(22)
> +#define LCD_LAYER_FLIP_H			(2 << 22)
> +#define LCD_LAYER_ROT_R90			(3 << 22)
> +#define LCD_LAYER_ROT_L90			(4 << 22)
> +#define LCD_LAYER_ROT_180			(5 << 22)
> +#define LCD_LAYER_FIFO_00			(0 << 25)
> +#define LCD_LAYER_FIFO_25			BIT(25)
> +#define LCD_LAYER_FIFO_50			(2 << 25)
> +#define LCD_LAYER_FIFO_100			(3 << 25)
> +#define LCD_LAYER_INTERLEAVE_DIS		(0 << 27)
> +#define LCD_LAYER_INTERLEAVE_V			BIT(27)
> +#define LCD_LAYER_INTERLEAVE_H			(2 << 27)
> +#define LCD_LAYER_INTERLEAVE_CH			(3 << 27)
> +#define LCD_LAYER_INTERLEAVE_V_SUB		(4 << 27)
> +#define LCD_LAYER_INTERLEAVE_H_SUB		(5 << 27)
> +#define LCD_LAYER_INTERLEAVE_CH_SUB		(6 << 27)
> +#define LCD_LAYER_INTER_POS_EVEN		(0 << 30)
> +#define LCD_LAYER_INTER_POS_ODD			BIT(30)
> +
> +#define LCD_LAYER0_COL_START		(0x4 * 0x101)
> +#define LCD_LAYERn_COL_START(N)		(LCD_LAYER0_COL_START + (0x400 * (N))=
)
> +#define LCD_LAYER0_ROW_START		(0x4 * 0x102)
> +#define LCD_LAYERn_ROW_START(N)		(LCD_LAYER0_ROW_START + (0x400 * (N))=
)
> +#define LCD_LAYER0_WIDTH		(0x4 * 0x103)
> +#define LCD_LAYERn_WIDTH(N)		(LCD_LAYER0_WIDTH + (0x400 * (N)))
> +#define LCD_LAYER0_HEIGHT		(0x4 * 0x104)
> +#define LCD_LAYERn_HEIGHT(N)		(LCD_LAYER0_HEIGHT + (0x400 * (N)))
> +#define LCD_LAYER0_SCALE_CFG		(0x4 * 0x105)
> +#define LCD_LAYERn_SCALE_CFG(N)		(LCD_LAYER0_SCALE_CFG + (0x400 * (N))=
)
> +#define LCD_LAYER0_ALPHA		(0x4 * 0x106)
> +#define LCD_LAYERn_ALPHA(N)		(LCD_LAYER0_ALPHA + (0x400 * (N)))
> +#define LCD_LAYER0_INV_COLOUR_LS	(0x4 * 0x107)
> +#define LCD_LAYERn_INV_COLOUR_LS(N)	(LCD_LAYER0_INV_COLOUR_LS + \
> +					(0x400 * (N)))
> +#define LCD_LAYER0_INV_COLOUR_MS	(0x4 * 0x108)
> +#define LCD_LAYERn_INV_COLOUR_MS(N)	(LCD_LAYER0_INV_COLOUR_MS + \
> +					(0x400 * (N)))
> +#define LCD_LAYER0_TRANS_COLOUR_LS	(0x4 * 0x109)
> +#define LCD_LAYERn_TRANS_COLOUR_LS(N)	(LCD_LAYER0_TRANS_COLOUR_LS + \
> +					(0x400 * (N)))
> +#define LCD_LAYER0_TRANS_COLOUR_MS	(0x4 * 0x10a)
> +#define LCD_LAYERn_TRANS_COLOUR_MS(N)	(LCD_LAYER0_TRANS_COLOUR_MS + \
> +					(0x400 * (N)))
> +#define LCD_LAYER0_CSC_COEFF11		(0x4 * 0x10b)
> +#define LCD_LAYERn_CSC_COEFF11(N)	(LCD_LAYER0_CSC_COEFF11 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF12		(0x4 * 0x10c)
> +#define LCD_LAYERn_CSC_COEFF12(N)	(LCD_LAYER0_CSC_COEFF12 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF13		(0x4 * 0x10d)
> +#define LCD_LAYERn_CSC_COEFF13(N)	(LCD_LAYER0_CSC_COEFF13 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF21		(0x4 * 0x10e)
> +#define LCD_LAYERn_CSC_COEFF21(N)	(LCD_LAYER0_CSC_COEFF21 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF22		(0x4 * 0x10f)
> +#define LCD_LAYERn_CSC_COEFF22(N)	(LCD_LAYER0_CSC_COEFF22 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF23		(0x4 * 0x110)
> +#define LCD_LAYERn_CSC_COEFF23(N)	(LCD_LAYER0_CSC_COEFF23 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF31		(0x4 * 0x111)
> +#define LCD_LAYERn_CSC_COEFF31(N)	(LCD_LAYER0_CSC_COEFF31 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF32		(0x4 * 0x112)
> +#define LCD_LAYERn_CSC_COEFF32(N)	(LCD_LAYER0_CSC_COEFF32 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_COEFF33		(0x4 * 0x113)
> +#define LCD_LAYERn_CSC_COEFF33(N)	(LCD_LAYER0_CSC_COEFF33 + (0x400 * (=
N)))
> +#define LCD_LAYER0_CSC_OFF1		(0x4 * 0x114)
> +#define LCD_LAYERn_CSC_OFF1(N)		(LCD_LAYER0_CSC_OFF1 + (0x400 * (N)))
> +#define LCD_LAYER0_CSC_OFF2		(0x4 * 0x115)
> +#define LCD_LAYERn_CSC_OFF2(N)		(LCD_LAYER0_CSC_OFF2 + (0x400 * (N)))
> +#define LCD_LAYER0_CSC_OFF3		(0x4 * 0x116)
> +#define LCD_LAYERn_CSC_OFF3(N)		(LCD_LAYER0_CSC_OFF3 + (0x400 * (N)))
> +
> +/*  LCD controller Layer DMA config register */
> +#define LCD_LAYER0_DMA_CFG			(0x4 * 0x117)
> +#define LCD_LAYERn_DMA_CFG(N)			(LCD_LAYER0_DMA_CFG + \
> +						(0x400 * (N)))
> +#define LCD_DMA_LAYER_ENABLE			  BIT(0)
> +#define LCD_DMA_LAYER_STATUS			  BIT(1)
> +#define LCD_DMA_LAYER_AUTO_UPDATE		  BIT(2)
> +#define LCD_DMA_LAYER_CONT_UPDATE		  BIT(3)
> +#define LCD_DMA_LAYER_CONT_PING_PONG_UPDATE	  (LCD_DMA_LAYER_AUTO_UPDA=
TE \
> +						| LCD_DMA_LAYER_CONT_UPDATE)
> +#define LCD_DMA_LAYER_FIFO_ADR_MODE		  BIT(4)
> +#define LCD_DMA_LAYER_AXI_BURST_1		  BIT(5)
> +#define LCD_DMA_LAYER_AXI_BURST_2		  (2 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_3		  (3 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_4		  (4 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_5		  (5 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_6		  (6 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_7		  (7 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_8		  (8 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_9		  (9 << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_10		  (0xa << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_11		  (0xb << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_12		  (0xc << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_13		  (0xd << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_14		  (0xe << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_15		  (0xf << 5)
> +#define LCD_DMA_LAYER_AXI_BURST_16		  (0x10 << 5)
> +#define LCD_DMA_LAYER_VSTRIDE_EN		  BIT(10)
> +
> +#define LCD_LAYER0_DMA_START_ADR		(0x4 * 0x118)
> +#define LCD_LAYERn_DMA_START_ADDR(N)		(LCD_LAYER0_DMA_START_ADR \
> +						+ (0x400 * (N)))
> +#define LCD_LAYER0_DMA_START_SHADOW		(0x4 * 0x119)
> +#define LCD_LAYERn_DMA_START_SHADOW(N)		(LCD_LAYER0_DMA_START_SHADOW \=

> +						+ (0x400 * (N)))
> +#define LCD_LAYER0_DMA_LEN			(0x4 * 0x11a)
> +#define LCD_LAYERn_DMA_LEN(N)			(LCD_LAYER0_DMA_LEN + \
> +						(0x400 * (N)))
> +#define LCD_LAYER0_DMA_LEN_SHADOW		(0x4 * 0x11b)
> +#define LCD_LAYERn_DMA_LEN_SHADOW(N)		(LCD_LAYER0_DMA_LEN_SHADOW + \
> +						(0x400 * (N)))
> +#define LCD_LAYER0_DMA_STATUS			(0x4 * 0x11c)
> +#define LCD_LAYERn_DMA_STATUS(N)		(LCD_LAYER0_DMA_STATUS + \
> +						(0x400 * (N)))
> +#define LCD_LAYER0_DMA_LINE_WIDTH		(0x4 * 0x11d)
> +#define LCD_LAYERn_DMA_LINE_WIDTH(N)		(LCD_LAYER0_DMA_LINE_WIDTH + \
> +						(0x400 * (N)))
> +#define LCD_LAYER0_DMA_LINE_VSTRIDE		(0x4 * 0x11e)
> +#define LCD_LAYERn_DMA_LINE_VSTRIDE(N)		(LCD_LAYER0_DMA_LINE_VSTRIDE +=
\
> +						(0x400 * (N)))
> +#define LCD_LAYER0_DMA_FIFO_STATUS		(0x4 * 0x11f)
> +#define LCD_LAYERn_DMA_FIFO_STATUS(N)		(LCD_LAYER0_DMA_FIFO_STATUS + \=

> +						(0x400 * (N)))
> +#define LCD_LAYER0_CFG2				(0x4 * 0x120)
> +#define LCD_LAYERn_CFG2(N)			(LCD_LAYER0_CFG2 + (0x400 * (N)))
> +#define LCD_LAYER0_DMA_START_CB_ADR		(0x4 * 0x700)
> +#define LCD_LAYERn_DMA_START_CB_ADR(N)		(LCD_LAYER0_DMA_START_CB_ADR +=
 \
> +						(0x20 * (N)))
> +#define LCD_LAYER0_DMA_START_CB_SHADOW		(0x4 * 0x701)
> +#define LCD_LAYERn_DMA_START_CB_SHADOW(N)	(LCD_LAYER0_DMA_START_CB_SHA=
DOW\
> +						+ (0x20 * (N)))
> +#define LCD_LAYER0_DMA_CB_LINE_WIDTH		(0x4 * 0x702)
> +#define LCD_LAYERn_DMA_CB_LINE_WIDTH(N)		(LCD_LAYER0_DMA_CB_LINE_WIDTH=
 +\
> +						(0x20 * (N)))
> +#define LCD_LAYER0_DMA_CB_LINE_VSTRIDE		(0x4 * 0x703)
> +#define LCD_LAYERn_DMA_CB_LINE_VSTRIDE(N)	(LCD_LAYER0_DMA_CB_LINE_VSTR=
IDE\
> +						+ (0x20 * (N)))
> +#define LCD_LAYER0_DMA_START_CR_ADR		(0x4 * 0x704)
> +#define LCD_LAYERn_DMA_START_CR_ADR(N)		(LCD_LAYER0_DMA_START_CR_ADR +=
 \
> +						(0x20 * (N)))
> +#define LCD_LAYER0_DMA_START_CR_SHADOW		(0x4 * 0x705)
> +#define LCD_LAYERn_DMA_START_CR_SHADOW(N)	\
> +						(LCD_LAYER0_DMA_START_CR_SHADOW\
> +						 + (0x20 * (N)))
> +#define LCD_LAYER0_DMA_CR_LINE_WIDTH		(0x4 * 0x706)
> +#define LCD_LAYERn_DMA_CR_LINE_WIDTH(N)		(LCD_LAYER0_DMA_CR_LINE_WIDTH=
 +\
> +						(0x20 * (N)))
> +#define LCD_LAYER0_DMA_CR_LINE_VSTRIDE		(0x4 * 0x707)
> +#define LCD_LAYERn_DMA_CR_LINE_VSTRIDE(N)	(LCD_LAYER0_DMA_CR_LINE_VSTR=
IDE\
> +						+ (0x20 * (N)))
> +#define LCD_LAYER1_DMA_START_CB_ADR		(0x4 * 0x708)
> +#define LCD_LAYER1_DMA_START_CB_SHADOW		(0x4 * 0x709)
> +#define LCD_LAYER1_DMA_CB_LINE_WIDTH		(0x4 * 0x70a)
> +#define LCD_LAYER1_DMA_CB_LINE_VSTRIDE		(0x4 * 0x70b)
> +#define LCD_LAYER1_DMA_START_CR_ADR		(0x4 * 0x70c)
> +#define LCD_LAYER1_DMA_START_CR_SHADOW		(0x4 * 0x70d)
> +#define LCD_LAYER1_DMA_CR_LINE_WIDTH		(0x4 * 0x70e)
> +#define LCD_LAYER1_DMA_CR_LINE_VSTRIDE		(0x4 * 0x70f)
> +
> +/*********************************************************************=
*******
> + *		   LCD controller output format register defines
> + *********************************************************************=
*******/
> +#define LCD_OUT_FORMAT_CFG			(0x4 * 0x800)
> +#define LCD_OUTF_FORMAT_RGB121212                 (0x00)
> +#define LCD_OUTF_FORMAT_RGB101010                 (0x01)
> +#define LCD_OUTF_FORMAT_RGB888                    (0x02)
> +#define LCD_OUTF_FORMAT_RGB666                    (0x03)
> +#define LCD_OUTF_FORMAT_RGB565                    (0x04)
> +#define LCD_OUTF_FORMAT_RGB444                    (0x05)
> +#define LCD_OUTF_FORMAT_MRGB121212                (0x10)
> +#define LCD_OUTF_FORMAT_MRGB101010                (0x11)
> +#define LCD_OUTF_FORMAT_MRGB888                   (0x12)
> +#define LCD_OUTF_FORMAT_MRGB666                   (0x13)
> +#define LCD_OUTF_FORMAT_MRGB565                   (0x14)
> +#define LCD_OUTF_FORMAT_YCBCR420_8B_LEGACY        (0x08)
> +#define LCD_OUTF_FORMAT_YCBCR420_8B_DCI           (0x09)
> +#define LCD_OUTF_FORMAT_YCBCR420_8B               (0x0A)
> +#define LCD_OUTF_FORMAT_YCBCR420_10B              (0x0B)
> +#define LCD_OUTF_FORMAT_YCBCR420_12B              (0x0C)
> +#define LCD_OUTF_FORMAT_YCBCR422_8B               (0x0D)
> +#define LCD_OUTF_FORMAT_YCBCR422_10B              (0x0E)
> +#define LCD_OUTF_FORMAT_YCBCR444                  (0x0F)
> +#define LCD_OUTF_FORMAT_MYCBCR420_8B_LEGACY       (0x18)
> +#define LCD_OUTF_FORMAT_MYCBCR420_8B_DCI          (0x19)
> +#define LCD_OUTF_FORMAT_MYCBCR420_8B              (0x1A)
> +#define LCD_OUTF_FORMAT_MYCBCR420_10B             (0x1B)
> +#define LCD_OUTF_FORMAT_MYCBCR420_12B             (0x1C)
> +#define LCD_OUTF_FORMAT_MYCBCR422_8B              (0x1D)
> +#define LCD_OUTF_FORMAT_MYCBCR422_10B             (0x1E)
> +#define LCD_OUTF_FORMAT_MYCBCR444                 (0x1F)
> +#define LCD_OUTF_BGR_ORDER			  BIT(5)
> +#define LCD_OUTF_Y_ORDER			  BIT(6)
> +#define LCD_OUTF_CRCB_ORDER			  BIT(7)
> +#define LCD_OUTF_SYNC_MODE			  BIT(11)
> +#define LCD_OUTF_RGB_CONV_MODE			  BIT(14)
> +#define LCD_OUTF_MIPI_RGB_MODE			  BIT(18)
> +
> +#define LCD_HSYNC_WIDTH				(0x4 * 0x801)
> +#define LCD_H_BACKPORCH				(0x4 * 0x802)
> +#define LCD_H_ACTIVEWIDTH			(0x4 * 0x803)
> +#define LCD_H_FRONTPORCH			(0x4 * 0x804)
> +#define LCD_VSYNC_WIDTH				(0x4 * 0x805)
> +#define LCD_V_BACKPORCH				(0x4 * 0x806)
> +#define LCD_V_ACTIVEHEIGHT			(0x4 * 0x807)
> +#define LCD_V_FRONTPORCH			(0x4 * 0x808)
> +#define LCD_VSYNC_START				(0x4 * 0x809)
> +#define LCD_VSYNC_END				(0x4 * 0x80a)
> +#define LCD_V_BACKPORCH_EVEN			(0x4 * 0x80b)
> +#define LCD_VSYNC_WIDTH_EVEN			(0x4 * 0x80c)
> +#define LCD_V_ACTIVEHEIGHT_EVEN			(0x4 * 0x80d)
> +#define LCD_V_FRONTPORCH_EVEN			(0x4 * 0x80e)
> +#define LCD_VSYNC_START_EVEN			(0x4 * 0x80f)
> +#define LCD_VSYNC_END_EVEN			(0x4 * 0x810)
> +#define LCD_TIMING_GEN_TRIG			(0x4 * 0x811)
> +#define LCD_PWM0_CTRL				(0x4 * 0x812)
> +#define LCD_PWM0_RPT_LEADIN			(0x4 * 0x813)
> +#define LCD_PWM0_HIGH_LOW			(0x4 * 0x814)
> +#define LCD_PWM1_CTRL				(0x4 * 0x815)
> +#define LCD_PWM1_RPT_LEADIN			(0x4 * 0x816)
> +#define LCD_PWM1_HIGH_LOW			(0x4 * 0x817)
> +#define LCD_PWM2_CTRL				(0x4 * 0x818)
> +#define LCD_PWM2_RPT_LEADIN			(0x4 * 0x819)
> +#define LCD_PWM2_HIGH_LOW			(0x4 * 0x81a)
> +#define LCD_VIDEO0_DMA0_BYTES			(0x4 * 0xb00)
> +#define LCD_VIDEO0_DMA0_STATE			(0x4 * 0xb01)
> +#define LCD_DMA_STATE_ACTIVE			  BIT(3)
> +#define LCD_VIDEO0_DMA1_BYTES			(0x4 * 0xb02)
> +#define LCD_VIDEO0_DMA1_STATE			(0x4 * 0xb03)
> +#define LCD_VIDEO0_DMA2_BYTES			(0x4 * 0xb04)
> +#define LCD_VIDEO0_DMA2_STATE			(0x4 * 0xb05)
> +#define LCD_VIDEO1_DMA0_BYTES			(0x4 * 0xb06)
> +#define LCD_VIDEO1_DMA0_STATE			(0x4 * 0xb07)
> +#define LCD_VIDEO1_DMA1_BYTES			(0x4 * 0xb08)
> +#define LCD_VIDEO1_DMA1_STATE			(0x4 * 0xb09)
> +#define LCD_VIDEO1_DMA2_BYTES			(0x4 * 0xb0a)
> +#define LCD_VIDEO1_DMA2_STATE			(0x4 * 0xb0b)
> +#define LCD_GRAPHIC0_DMA_BYTES			(0x4 * 0xb0c)
> +#define LCD_GRAPHIC0_DMA_STATE			(0x4 * 0xb0d)
> +#define LCD_GRAPHIC1_DMA_BYTES			(0x4 * 0xb0e)
> +#define LCD_GRAPHIC1_DMA_STATE			(0x4 * 0xb0f)
> +
> +/*********************************************************************=
******
> + *		   MIPI controller control register defines
> + ***********************************************i*********************=
*******/
> +#define MIPI0_HS_BASE_ADDR			(MIPI_BASE_ADDR + 0x400)
> +#define HS_OFFSET(M)				(((M) + 1) * 0x400)
> +
> +#define MIPI_TX_HS_CTRL				(0x0)
> +#define   MIPI_TXm_HS_CTRL(M)			(MIPI_TX_HS_CTRL + HS_OFFSET(M))
> +#define   HS_CTRL_EN				BIT(0)
> +/*1:CSI 0:DSI */
> +#define   HS_CTRL_CSIDSIN			BIT(2)
> +/*1:LCD, 0:DMA */
> +#define   TX_SOURCE				BIT(3)
> +#define   ACTIVE_LANES(n)			((n) << 4)
> +#define   LCD_VC(ch)				((ch) << 8)
> +#define   DSI_EOTP_EN				BIT(11)
> +#define   DSI_CMD_HFP_EN			BIT(12)
> +#define   CRC_EN				BIT(14)
> +#define   HSEXIT_CNT(n)				((n) << 16)
> +#define   HSCLKIDLE_CNT				BIT(24)
> +#define MIPI_TX_HS_SYNC_CFG			(0x8)
> +#define   MIPI_TXm_HS_SYNC_CFG(M)		(MIPI_TX_HS_SYNC_CFG \
> +						+ HS_OFFSET(M))
> +#define   LINE_SYNC_PKT_ENABLE			BIT(0)
> +#define   FRAME_COUNTER_ACTIVE			BIT(1)
> +#define   LINE_COUNTER_ACTIVE			BIT(2)
> +#define   DSI_V_BLANKING			BIT(4)
> +#define   DSI_HSA_BLANKING			BIT(5)
> +#define   DSI_HBP_BLANKING			BIT(6)
> +#define   DSI_HFP_BLANKING			BIT(7)
> +#define   DSI_SYNC_PULSE_EVENTN			BIT(8)
> +#define   DSI_LPM_FIRST_VSA_LINE		BIT(9)
> +#define   DSI_LPM_LAST_VFP_LINE			BIT(10)
> +#define   WAIT_ALL_SECT				BIT(11)
> +#define   WAIT_TRIG_POS				BIT(15)
> +#define   ALWAYS_USE_HACT(f)			((f) << 19)
> +#define   FRAME_GEN_EN(f)			((f) << 23)
> +#define   HACT_WAIT_STOP(f)			((f) << 28)
> +#define MIPI_TX0_HS_FG0_SECT0_PH		(0x40)
> +#define   MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)	(MIPI_TX0_HS_FG0_SECT0_PH =
+ \
> +						HS_OFFSET(M) + (0x2C * (N)) \
> +						+ (8 * (O)))
> +#define   MIPI_TX_SECT_WC_MASK			(0xffff)
> +#define	  MIPI_TX_SECT_VC_MASK			(3)
> +#define   MIPI_TX_SECT_VC_SHIFT			(22)
> +#define   MIPI_TX_SECT_DT_MASK			(0x3f)
> +#define   MIPI_TX_SECT_DT_SHIFT			(16)
> +#define   MIPI_TX_SECT_DM_MASK			(3)
> +#define   MIPI_TX_SECT_DM_SHIFT			(24)
> +#define   MIPI_TX_SECT_DMA_PACKED		BIT(26)
> +#define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0	(0x60)
> +#define MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES1	(0x64)
> +#define   MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(M, N)	\
> +					(MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0 \
> +					+ HS_OFFSET(M) + (0x2C * (N)))
> +#define MIPI_TX_HS_FG0_SECT0_LINE_CFG		(0x44)
> +#define   MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O)	\
> +				(MIPI_TX_HS_FG0_SECT0_LINE_CFG + HS_OFFSET(M) \
> +				+ (0x2C * (N)) + (8 * (O)))
> +
> +#define MIPI_TX_HS_FG0_NUM_LINES		(0x68)
> +#define   MIPI_TXm_HS_FGn_NUM_LINES(M, N)	\
> +				(MIPI_TX_HS_FG0_NUM_LINES + HS_OFFSET(M) \
> +				+ (0x2C * (N)))
> +#define MIPI_TX_HS_VSYNC_WIDTHS0		(0x104)
> +#define   MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		\
> +				(MIPI_TX_HS_VSYNC_WIDTHS0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_V_BACKPORCHES0		(0x16c)
> +#define   MIPI_TXm_HS_V_BACKPORCHESn(M, N)	\
> +				(MIPI_TX_HS_V_BACKPORCHES0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_V_FRONTPORCHES0		(0x174)
> +#define   MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	\
> +				(MIPI_TX_HS_V_FRONTPORCHES0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_V_ACTIVE0			(0x17c)
> +#define   MIPI_TXm_HS_V_ACTIVEn(M, N)		\
> +				(MIPI_TX_HS_V_ACTIVE0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_HSYNC_WIDTH0			(0x10c)
> +#define   MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		\
> +				(MIPI_TX_HS_HSYNC_WIDTH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_H_BACKPORCH0			(0x11c)
> +#define   MIPI_TXm_HS_H_BACKPORCHn(M, N)		\
> +				(MIPI_TX_HS_H_BACKPORCH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_H_FRONTPORCH0		(0x12c)
> +#define   MIPI_TXm_HS_H_FRONTPORCHn(M, N)	\
> +				(MIPI_TX_HS_H_FRONTPORCH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_H_ACTIVE0			(0x184)
> +#define   MIPI_TXm_HS_H_ACTIVEn(M, N)		\
> +				(MIPI_TX_HS_H_ACTIVE0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_LLP_HSYNC_WIDTH0		(0x13c)
> +#define   MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	\
> +				(MIPI_TX_HS_LLP_HSYNC_WIDTH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_LLP_H_BACKPORCH0		(0x14c)
> +#define   MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	\
> +				(MIPI_TX_HS_LLP_H_BACKPORCH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define MIPI_TX_HS_LLP_H_FRONTPORCH0		(0x15c)
> +#define   MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	\
> +				(MIPI_TX_HS_LLP_H_FRONTPORCH0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +
> +#define MIPI_TX_HS_MC_FIFO_CTRL_EN		(0x194)
> +#define   MIPI_TXm_HS_MC_FIFO_CTRL_EN(M)	\
> +				(MIPI_TX_HS_MC_FIFO_CTRL_EN + HS_OFFSET(M))
> +
> +#define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0		(0x198)
> +#define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1		(0x19c)
> +#define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\
> +			(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + HS_OFFSET(M) \
> +			+ (0x4 * (N)))
> +#define   SET_MC_FIFO_CHAN_ALLOC(dev, ctrl, vc, sz)	\
> +		kmb_write_bits_mipi(dev, \
> +				MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
> +				(vc) / 2), ((vc) % 2) * 16, 16, sz)
> +#define MIPI_TX_HS_MC_FIFO_RTHRESHOLD0		(0x1a0)
> +#define MIPI_TX_HS_MC_FIFO_RTHRESHOLD1		(0x1a4)
> +#define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
> +				(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 + HS_OFFSET(M) \
> +				+ (0x4 * (N)))
> +#define   SET_MC_FIFO_RTHRESHOLD(dev, ctrl, vc, th)	\
> +	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, \
> +				(vc) / 2), ((vc) % 2) * 16, 16, th)
> +#define MIPI_TX_HS_DMA_CFG			(0x1a8)
> +#define MIPI_TX_HS_DMA_START_ADR_CHAN0		(0x1ac)
> +#define MIPI_TX_HS_DMA_LEN_CHAN0		(0x1b4)
> +
> +/* MIPI IRQ */
> +#define MIPI_CTRL_IRQ_STATUS0				(0x00)
> +#define   MIPI_DPHY_ERR_IRQ				1
> +#define   MIPI_DPHY_ERR_MASK				0x7FE	/*bits 1-10 */
> +#define   MIPI_HS_IRQ					13
> +/*bits 13-22 */
> +#define   MIPI_HS_IRQ_MASK				0x7FE000
> +#define   MIPI_LP_EVENT_IRQ				25
> +#define   MIPI_GET_IRQ_STAT0(dev)		kmb_read_mipi(dev, \
> +						MIPI_CTRL_IRQ_STATUS0)
> +#define MIPI_CTRL_IRQ_STATUS1				(0x04)
> +#define   MIPI_HS_RX_EVENT_IRQ				0
> +#define   MIPI_GET_IRQ_STAT1(dev)		kmb_read_mipi(dev, \
> +						MIPI_CTRL_IRQ_STATUS1)
> +#define MIPI_CTRL_IRQ_ENABLE0				(0x08)
> +#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)	kmb_set_bit_mipi(dev, \=

> +						MIPI_CTRL_IRQ_ENABLE0, \
> +						(M) + (N))
> +#define   MIPI_GET_IRQ_ENABLED0(dev)		kmb_read_mipi(dev, \
> +						MIPI_CTRL_IRQ_ENABLE0)
> +#define MIPI_CTRL_IRQ_ENABLE1				(0x0c)
> +#define   MIPI_GET_IRQ_ENABLED1(dev)		kmb_read_mipi(dev, \
> +						MIPI_CTRL_IRQ_ENABLE1)
> +#define MIPI_CTRL_IRQ_CLEAR0				(0x010)
> +#define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
> +		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, (M) + (N))
> +#define MIPI_CTRL_IRQ_CLEAR1				(0x014)
> +#define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
> +		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, (M) + (N))
> +#define MIPI_CTRL_DIG_LOOPBACK				(0x018)
> +#define MIPI_TX_HS_IRQ_STATUS				(0x01c)
> +#define   MIPI_TX_HS_IRQ_STATUSm(M)		(MIPI_TX_HS_IRQ_STATUS + \
> +						HS_OFFSET(M))
> +#define   GET_MIPI_TX_HS_IRQ_STATUS(dev, M)	kmb_read_mipi(dev, \
> +						MIPI_TX_HS_IRQ_STATUSm(M))
> +#define   MIPI_TX_HS_IRQ_LINE_COMPARE			BIT(1)
> +#define   MIPI_TX_HS_IRQ_FRAME_DONE_0			BIT(2)
> +#define   MIPI_TX_HS_IRQ_FRAME_DONE_1			BIT(3)
> +#define   MIPI_TX_HS_IRQ_FRAME_DONE_2			BIT(4)
> +#define   MIPI_TX_HS_IRQ_FRAME_DONE_3			BIT(5)
> +#define   MIPI_TX_HS_IRQ_DMA_DONE_0			BIT(6)
> +#define   MIPI_TX_HS_IRQ_DMA_IDLE_0			BIT(7)
> +#define   MIPI_TX_HS_IRQ_DMA_DONE_1			BIT(8)
> +#define   MIPI_TX_HS_IRQ_DMA_IDLE_1			BIT(9)
> +#define   MIPI_TX_HS_IRQ_DMA_DONE_2			BIT(10)
> +#define   MIPI_TX_HS_IRQ_DMA_IDLE_2			BIT(11)
> +#define   MIPI_TX_HS_IRQ_DMA_DONE_3			BIT(12)
> +#define   MIPI_TX_HS_IRQ_DMA_IDLE_3			BIT(13)
> +#define   MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW		BIT(14)
> +#define   MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW		BIT(15)
> +#define   MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY			BIT(16)
> +#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL		BIT(17)
> +#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR	BIT(18)
> +#define   MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR		BIT(20)
> +#define   MIPI_TX_HS_IRQ_FRAME_DONE			\
> +				(MIPI_TX_HS_IRQ_FRAME_DONE_0 | \
> +				MIPI_TX_HS_IRQ_FRAME_DONE_1 | \
> +				MIPI_TX_HS_IRQ_FRAME_DONE_2 | \
> +				MIPI_TX_HS_IRQ_FRAME_DONE_3)
> +
> +#define MIPI_TX_HS_IRQ_DMA_DONE				\
> +				(MIPI_TX_HS_IRQ_DMA_DONE_0 | \
> +				MIPI_TX_HS_IRQ_DMA_DONE_1 | \
> +				MIPI_TX_HS_IRQ_DMA_DONE_2 | \
> +				MIPI_TX_HS_IRQ_DMA_DONE_3)
> +
> +#define MIPI_TX_HS_IRQ_DMA_IDLE				\
> +				(MIPI_TX_HS_IRQ_DMA_IDLE_0 | \
> +				MIPI_TX_HS_IRQ_DMA_IDLE_1 | \
> +				MIPI_TX_HS_IRQ_DMA_IDLE_2 | \
> +				MIPI_TX_HS_IRQ_DMA_IDLE_3)
> +
> +#define MIPI_TX_HS_IRQ_ERROR				\
> +				(MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW | \
> +				MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW | \
> +				MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY | \
> +				MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL | \
> +				MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR | \
> +				MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR)
> +
> +#define MIPI_TX_HS_IRQ_ALL				\
> +				(MIPI_TX_HS_IRQ_FRAME_DONE | \
> +				MIPI_TX_HS_IRQ_DMA_DONE | \
> +				MIPI_TX_HS_IRQ_DMA_IDLE | \
> +				MIPI_TX_HS_IRQ_LINE_COMPARE | \
> +				MIPI_TX_HS_IRQ_ERROR)
> +
> +#define MIPI_TX_HS_IRQ_ENABLE				(0x020)
> +#define   SET_HS_IRQ_ENABLE(dev, M, val)	kmb_set_bitmask_mipi(dev, \
> +						MIPI_TX_HS_IRQ_ENABLE \
> +						+ HS_OFFSET(M), val)
> +#define   CLR_HS_IRQ_ENABLE(dev, M, val)	kmb_clr_bitmask_mipi(dev, \
> +						MIPI_TX_HS_IRQ_ENABLE \
> +						+ HS_OFFSET(M), val)
> +#define	  GET_HS_IRQ_ENABLE(dev, M)		kmb_read_mipi(dev, \
> +						MIPI_TX_HS_IRQ_ENABLE \
> +						+ HS_OFFSET(M))
> +#define MIPI_TX_HS_IRQ_CLEAR				(0x024)
> +#define   SET_MIPI_TX_HS_IRQ_CLEAR(dev, M, val)		\
> +			kmb_set_bitmask_mipi(dev, \
> +			MIPI_TX_HS_IRQ_CLEAR \
> +			+ HS_OFFSET(M), val)
> +
> +/* MIPI Test Pattern Generation */
> +#define MIPI_TX_HS_TEST_PAT_CTRL			(0x230)
> +#define   MIPI_TXm_HS_TEST_PAT_CTRL(M)			\
> +				(MIPI_TX_HS_TEST_PAT_CTRL + HS_OFFSET(M))
> +#define   TP_EN_VCm(M)					(1 << ((M) * 0x04))
> +#define   TP_SEL_VCm(M, N)				\
> +				((N) << (((M) * 0x04) + 1))
> +#define   TP_STRIPE_WIDTH(M)				((M) << 16)
> +#define MIPI_TX_HS_TEST_PAT_COLOR0			(0x234)
> +#define   MIPI_TXm_HS_TEST_PAT_COLOR0(M)		\
> +				(MIPI_TX_HS_TEST_PAT_COLOR0 + HS_OFFSET(M))
> +#define MIPI_TX_HS_TEST_PAT_COLOR1			(0x238)
> +#define   MIPI_TXm_HS_TEST_PAT_COLOR1(M)		\
> +				(MIPI_TX_HS_TEST_PAT_COLOR1 + HS_OFFSET(M))
> +
> +/* D-PHY regs */
> +#define DPHY_ENABLE				(0x100)
> +#define DPHY_INIT_CTRL0				(0x104)
> +#define   SHUTDOWNZ				0
> +#define   RESETZ				12
> +#define DPHY_INIT_CTRL1				(0x108)
> +#define   PLL_CLKSEL_0				18
> +#define   PLL_SHADOW_CTRL			16
> +#define DPHY_INIT_CTRL2				(0x10c)
> +#define   SET_DPHY_INIT_CTRL0(dev, dphy, offset)	\
> +			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0, \
> +					((dphy) + (offset)))
> +#define   CLR_DPHY_INIT_CTRL0(dev, dphy, offset)	\
> +			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0, \
> +					((dphy) + (offset)))
> +#define DPHY_INIT_CTRL2				(0x10c)
> +#define DPHY_PLL_OBS0				(0x110)
> +#define DPHY_PLL_OBS1				(0x114)
> +#define DPHY_PLL_OBS2				(0x118)
> +#define DPHY_FREQ_CTRL0_3			(0x11c)
> +#define DPHY_FREQ_CTRL4_7			(0x120)
> +#define   SET_DPHY_FREQ_CTRL0_3(dev, dphy, val)	\
> +			kmb_write_bits_mipi(dev, DPHY_FREQ_CTRL0_3 \
> +			+ (((dphy) / 4) * 4), (dphy % 4) * 8, 6, val)
> +
> +#define DPHY_FORCE_CTRL0			(0x128)
> +#define DPHY_FORCE_CTRL1			(0x12C)
> +#define MIPI_DPHY_STAT0_3			(0x134)
> +#define MIPI_DPHY_STAT4_7			(0x138)
> +#define	  GET_STOPSTATE_DATA(dev, dphy)		\
> +			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + \
> +					 ((dphy) / 4) * 4)) >> \
> +					 (((dphy % 4) * 8) + 4)) & 0x03)
> +
> +#define MIPI_DPHY_ERR_STAT6_7			(0x14C)
> +
> +#define DPHY_TEST_CTRL0				(0x154)
> +#define   SET_DPHY_TEST_CTRL0(dev, dphy)		\
> +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL0, (dphy))
> +#define   CLR_DPHY_TEST_CTRL0(dev, dphy)		\
> +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL0, \
> +						(dphy))
> +#define DPHY_TEST_CTRL1				(0x158)
> +#define   SET_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
> +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
> +#define   CLR_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
> +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
> +#define   SET_DPHY_TEST_CTRL1_EN(dev, dphy)	\
> +			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, ((dphy) + 12))
> +#define   CLR_DPHY_TEST_CTRL1_EN(dev, dphy)	\
> +			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, ((dphy) + 12))
> +#define DPHY_TEST_DIN0_3			(0x15c)
> +#define   SET_TEST_DIN0_3(dev, dphy, val)		\
> +			kmb_write_mipi(dev, DPHY_TEST_DIN0_3 + \
> +			4, ((val) << (((dphy) % 4) * 8)))
> +#define DPHY_TEST_DOUT0_3			(0x168)
> +#define   GET_TEST_DOUT0_3(dev, dphy)		\
> +			(kmb_read_mipi(dev, DPHY_TEST_DOUT0_3) \
> +			>> (((dphy) % 4) * 8) & 0xff)
> +#define DPHY_TEST_DOUT4_7			(0x16C)
> +#define   GET_TEST_DOUT4_7(dev, dphy)		\
> +			(kmb_read_mipi(dev, DPHY_TEST_DOUT4_7) \
> +			>> (((dphy) % 4) * 8) & 0xff)
> +#define DPHY_TEST_DOUT8_9			(0x170)
> +#define DPHY_TEST_DIN4_7			(0x160)
> +#define DPHY_TEST_DIN8_9			(0x164)
> +#define DPHY_PLL_LOCK				(0x188)
> +#define   GET_PLL_LOCK(dev, dphy)		\
> +			(kmb_read_mipi(dev, DPHY_PLL_LOCK) \
> +			& (1 << ((dphy) - MIPI_DPHY6)))
> +#define DPHY_CFG_CLK_EN				(0x18c)
> +
> +#define MSS_MIPI_CIF_CFG			(0x00)
> +#define MSS_LCD_MIPI_CFG			(0x04)
> +#define MSS_CAM_CLK_CTRL			(0x10)
> +#define MSS_LOOPBACK_CFG			(0x0C)
> +#define   LCD					BIT(1)
> +#define   MIPI_COMMON				BIT(2)
> +#define   MIPI_TX0				BIT(9)
> +#define MSS_CAM_RSTN_CTRL			(0x14)
> +#define MSS_CAM_RSTN_SET			(0x20)
> +#define MSS_CAM_RSTN_CLR			(0x24)
> +
> +#define MSSCPU_CPR_CLK_EN			(0x0)
> +#define MSSCPU_CPR_RST_EN			(0x10)
> +#define BIT_MASK_16				(0xffff)
> +/*icam lcd qos */
> +#define LCD_QOS_PRIORITY			(0x8)
> +#define LCD_QOS_MODE				(0xC)
> +#define LCD_QOS_BW				(0x10)
> +#endif /* __KMB_REGS_H__ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yqYMVtuSGoW5DRc7zaIUVVakzn3qUu0gz--

--KjChVzGWYubMkZC3lhIaXwhjbzl5nUHro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8/hiAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPPiAf/bVxkDFkzi+DIz6kWYWs2nZmoRGQg
RbSn0giUn04OhnRnstE+Qz/fHaYNHWDH24hGtyyhGeSk+zqXalYVM0RB5LV+qFOr
VNhGx1tccj3weU9P29Uq0ef5AlTctkEef54uv4kI99fK5YeoXbaJHWPkh9dytNNd
oC8eZITpN4HI/fgRtQzU6xQdDGTElj9ZZAVEAGjn+CDumzxuhM29emKUGawusAmS
FfLmksXVlKojjQlkrhCiC7qZc0nfm6y5HJAcYnBvigUKbYufVbHSWITk5ElexTdI
sklI9+U98RKcfy18Jxpei6QunaKgM8q7remwIN+G/PeiTgw10n4RNHIkPA==
=eJ/h
-----END PGP SIGNATURE-----

--KjChVzGWYubMkZC3lhIaXwhjbzl5nUHro--

--===============1467437072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1467437072==--
