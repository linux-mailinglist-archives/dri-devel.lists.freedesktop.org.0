Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09245310705
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2260B6E17F;
	Fri,  5 Feb 2021 08:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D30A6E17F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:51:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1999064F45
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612515076;
 bh=f1dhRH8qQVND4R1479IjRVss06316QcvlxsGyjWQGfg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E4qdn3l2DTolpG3Jgr7/BjqMrGPbmUUnCHsK2tmtvRLvjbZGyGBhWLiFEe3RuicAJ
 06xmbVZG5tXkS0jveHWNWGOCGL+He+zj+Vc1I103ZTVnXjy9yNnO8TeICKPMsn0gtb
 QBwIW5KuwPQMxFsO7LbHg3pIR86pPVQzLjCjWOwAFFsxPy8evdP+MHacDwIDX2W8hu
 7LMjh1f00S0Por5H1YU2s7shH/g/18pHSBXJoaKI6L1E+BjxUhd1cELfMVVhReJIIS
 yoci5LbVN+X0jQrL6k1qaFYRiwRGJo9A/UcOBDovh/QXB47AQAK41S1pYAQNO66kvR
 2xbSc6bndK2xA==
Received: by mail-io1-f46.google.com with SMTP id j5so6211755iog.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 00:51:16 -0800 (PST)
X-Gm-Message-State: AOAM5303vJj4CGVZSxvhbBpqxoqVqX2Ov5KH6801tI3TfPI7mh1ZLBSD
 1DfoYmzWw6wT3gzzLHMNY8Aq7afJnrq7Tdv51Tk=
X-Google-Smtp-Source: ABdhPJyIXmS9MpG6fZ/ZnXJjzi62BrVyJjvXryhq32iLFrjx3wVXlZKP5w47dx8o+ueC9ZuB8T/FyrIFjEw9700mskk=
X-Received: by 2002:a5d:9d57:: with SMTP id k23mr3163111iok.112.1612515075145; 
 Fri, 05 Feb 2021 00:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20210205031039.15202-1-lichenyang@loongson.cn>
In-Reply-To: <20210205031039.15202-1-lichenyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Feb 2021 16:51:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5yxEnpznS0PST2mz63KvuCgxmwgH2_F-QOmCO8s-fv3A@mail.gmail.com>
Message-ID: <CAAhV-H5yxEnpznS0PST2mz63KvuCgxmwgH2_F-QOmCO8s-fv3A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
To: Chenyang Li <lichenyang@loongson.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chenyang,

On Fri, Feb 5, 2021 at 4:33 PM Chenyang Li <lichenyang@loongson.cn> wrote:
>
> This patch adds an initial DRM driver for the Loongson LS7A1000
> bridge chip(LS7A). The LS7A bridge chip contains two display
> controllers, support dual display output. The maximum support for
> each channel display is to 1920x1080@60Hz.
> At present, DC device detection and DRM driver registration are
> completed, the crtc/plane/encoder/connector objects has been
> implemented.
> On Loongson 3A4000 CPU and 7A1000 system, we have achieved the use
> of dual screen, and support dual screen clone mode and expansion
> mode.
>
> v4:
> - Move the mode_valid function to the crtc.
>
> v3:
> - Move the mode_valid function to the connector and optimize it.
> - Fix num_crtc calculation method.
>
> v2:
> - Complete the case of 32-bit color in CRTC.
>
> Signed-off-by: Chenyang Li <lichenyang@loongson.cn>
> ---
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/loongson/Kconfig              |  14 +
>  drivers/gpu/drm/loongson/Makefile             |  14 +
>  drivers/gpu/drm/loongson/loongson_connector.c |  48 ++++
>  drivers/gpu/drm/loongson/loongson_crtc.c      | 241 ++++++++++++++++
>  drivers/gpu/drm/loongson/loongson_device.c    |  54 ++++
>  drivers/gpu/drm/loongson/loongson_drv.c       | 269 ++++++++++++++++++
>  drivers/gpu/drm/loongson/loongson_drv.h       | 131 +++++++++
>  drivers/gpu/drm/loongson/loongson_encoder.c   |  37 +++
>  drivers/gpu/drm/loongson/loongson_plane.c     | 102 +++++++
>  11 files changed, 913 insertions(+)
>  create mode 100644 drivers/gpu/drm/loongson/Kconfig
>  create mode 100644 drivers/gpu/drm/loongson/Makefile
>  create mode 100644 drivers/gpu/drm/loongson/loongson_connector.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_crtc.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_device.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_drv.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_drv.h
>  create mode 100644 drivers/gpu/drm/loongson/loongson_encoder.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_plane.c
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0973f408d75f..6ed1b6dc2f25 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -374,6 +374,8 @@ source "drivers/gpu/drm/xen/Kconfig"
>
>  source "drivers/gpu/drm/vboxvideo/Kconfig"
>
> +source "drivers/gpu/drm/loongson/Kconfig"
> +
>  source "drivers/gpu/drm/lima/Kconfig"
>
>  source "drivers/gpu/drm/panfrost/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index fefaff4c832d..f87da730ea6d 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_DRM_PL111) += pl111/
>  obj-$(CONFIG_DRM_TVE200) += tve200/
>  obj-$(CONFIG_DRM_XEN) += xen/
>  obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
> +obj-$(CONFIG_DRM_LOONGSON) += loongson/
>  obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
> diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
> new file mode 100644
> index 000000000000..43eb0c80cc12
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_LOONGSON
> +       tristate "DRM support for LS7A1000 bridge chipset"
> +       depends on DRM && PCI
> +       depends on CPU_LOONGSON64
> +       select DRM_KMS_HELPER
> +       select DRM_VRAM_HELPER
> +       select DRM_TTM
> +       select DRM_TTM_HELPER
> +       default n
> +       help
> +         Support the display controllers found on the Loongson LS7A1000
> +         bridge.
You can use LS7A instead of LS7A1000.

> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
> new file mode 100644
> index 000000000000..22d063953b78
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for loongson drm drivers.
> +# This driver provides support for the
> +# Direct Rendering Infrastructure (DRI)
> +
> +ccflags-y := -Iinclude/drm
> +loongson-y := loongson_drv.o \
> +       loongson_crtc.o \
> +       loongson_plane.o \
> +       loongson_device.o \
> +       loongson_connector.o \
> +       loongson_encoder.o
> +obj-$(CONFIG_DRM_LOONGSON) += loongson.o
> diff --git a/drivers/gpu/drm/loongson/loongson_connector.c b/drivers/gpu/drm/loongson/loongson_connector.c
> new file mode 100644
> index 000000000000..6b1f0ffa33bd
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_connector.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static int loongson_get_modes(struct drm_connector *connector)
> +{
> +       int count;
> +
> +       count = drm_add_modes_noedid(connector, 1920, 1080);
> +       drm_set_preferred_mode(connector, 1024, 768);
> +
> +       return count;
> +}
> +
> +static const struct drm_connector_helper_funcs loongson_connector_helper = {
> +       .get_modes = loongson_get_modes,
> +};
> +
> +static const struct drm_connector_funcs loongson_connector_funcs = {
> +       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .destroy = drm_connector_cleanup,
> +       .reset = drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +int loongson_connector_init(struct loongson_device *ldev, int index)
> +{
> +       struct drm_connector *connector;
> +       struct loongson_connector *lconnector;
> +
> +       lconnector = kzalloc(sizeof(struct loongson_connector), GFP_KERNEL);
> +       if (!lconnector) {
> +               DRM_INFO("loongson connector kzalloc failed\n");
> +               return -1;
> +       }
> +
> +       lconnector->ldev = ldev;
> +       lconnector->id = index;
> +
> +       ldev->mode_info[index].connector = lconnector;
> +       connector = &lconnector->base;
> +       drm_connector_init(ldev->dev, connector, &loongson_connector_funcs,
> +                          DRM_MODE_CONNECTOR_Unknown);
> +       drm_connector_helper_add(connector, &loongson_connector_helper);
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/loongson_crtc.c b/drivers/gpu/drm/loongson/loongson_crtc.c
> new file mode 100644
> index 000000000000..ec678118da0d
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_crtc.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void try_each_loopc(u32 clk, u32 pstdiv, u32 frefc,
> +                          struct pix_pll *pll_config)
> +{
> +       u32 loopc;
> +       u32 loopc_p;
> +       u32 c;
> +       u32 min = 1000;
> +
> +       for (loopc = 24; loopc < 161; loopc++) {
> +               if ((loopc < 12 * frefc) || (loopc > 32 * frefc))
> +                       continue;
Why use magic value 24, 161, 12 and 32? You can define meaningful macros.

> +
> +               loopc_p = 100000L * loopc / frefc;
> +               c = (clk > loopc_p) ? (clk - loopc_p) : (loopc_p - clk);
> +               if (c < min) {
> +                       pll_config->l2_div = pstdiv;
> +                       pll_config->l1_loopc = loopc;
> +                       pll_config->l1_frefc = frefc;
> +               }
> +       }
> +}
> +
> +static void cal_freq(u32 pixclock, struct pix_pll *pll_config)
> +{
> +       u32 pstdiv;
> +       u32 frefc;
> +       u32 clk;
> +
> +       for (pstdiv = 1; pstdiv < 64; pstdiv++) {
> +               clk = pixclock * pstdiv;
> +               for (frefc = 3; frefc < 6; frefc++)
> +                       try_each_loopc(clk, pstdiv, frefc, pll_config);
> +       }
> +}
> +
> +static void config_pll(struct loongson_device *ldev, unsigned long pll_base,
> +                      struct pix_pll *pll_cfg)
> +{
> +       u32 val;
> +       u32 count = 0;
> +
> +       /* clear sel_pll_out0 */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val &= ~(1UL << 8);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +
> +       /* set pll_pd */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val |= (1UL << 13);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +
> +       /* clear set_pll_param */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val &= ~(1UL << 11);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +
> +       /* clear old value & config new value */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val &= ~(0x7fUL << 0);
> +       val |= (pll_cfg->l1_frefc << 0); /* refc */
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +       val = ls_io_rreg(ldev, pll_base + 0x0);
> +       val &= ~(0x7fUL << 0);
> +       val |= (pll_cfg->l2_div << 0); /* div */
> +       val &= ~(0x1ffUL << 21);
> +       val |= (pll_cfg->l1_loopc << 21); /* loopc */
> +       ls_io_wreg(ldev, pll_base + 0x0, val);
> +
> +       /* set set_pll_param */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val |= (1UL << 11);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +       /* clear pll_pd */
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val &= ~(1UL << 13);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +
> +       while (!(ls_io_rreg(ldev, pll_base + 0x4) & 0x80)) {
> +               cpu_relax();
> +               count++;
> +               if (count >= 1000) {
> +                       DRM_ERROR("loongson-7A PLL lock failed\n");
> +                       break;
> +               }
> +       }
> +
> +       val = ls_io_rreg(ldev, pll_base + 0x4);
> +       val |= (1UL << 8);
> +       ls_io_wreg(ldev, pll_base + 0x4, val);
> +}
> +
> +static void loongson_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct loongson_device *ldev = dev->dev_private;
> +       struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +       struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +       const struct drm_format_info *format;
> +       struct pix_pll pll_cfg;
> +       u32 hr, hss, hse, hfl;
> +       u32 vr, vss, vse, vfl;
> +       u32 pix_freq;
> +       u32 reg_offset;
> +
> +       hr = mode->hdisplay;
> +       hss = mode->hsync_start;
> +       hse = mode->hsync_end;
> +       hfl = mode->htotal;
> +
> +       vr = mode->vdisplay;
> +       vss = mode->vsync_start;
> +       vse = mode->vsync_end;
> +       vfl = mode->vtotal;
> +
> +       pix_freq = mode->clock;
> +       reg_offset = lcrtc->reg_offset;
> +       format = crtc->primary->state->fb->format;
> +
> +       ls_mm_wreg_locked(ldev, FB_DITCFG_REG + reg_offset, 0);
> +       ls_mm_wreg_locked(ldev, FB_DITTAB_LO_REG + reg_offset, 0);
> +       ls_mm_wreg_locked(ldev, FB_DITTAB_HI_REG + reg_offset, 0);
> +       ls_mm_wreg_locked(ldev, FB_PANCFG_REG + reg_offset, FB_PANCFG_DEF);
> +       ls_mm_wreg_locked(ldev, FB_PANTIM_REG + reg_offset, 0);
> +
> +       ls_mm_wreg_locked(ldev, FB_HDISPLAY_REG + reg_offset, (hfl << 16) | hr);
> +       ls_mm_wreg_locked(ldev, FB_HSYNC_REG + reg_offset,
> +                         FB_HSYNC_PULSE | (hse << 16) | hss);
> +
> +       ls_mm_wreg_locked(ldev, FB_VDISPLAY_REG + reg_offset, (vfl << 16) | vr);
> +       ls_mm_wreg_locked(ldev, FB_VSYNC_REG + reg_offset,
> +                         FB_VSYNC_PULSE | (vse << 16) | vss);
> +
> +       switch (format->format) {
> +       case DRM_FORMAT_RGB565:
> +               lcrtc->cfg_reg |= 0x3;
> +               break;
> +       case DRM_FORMAT_RGB888:
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +       default:
> +               lcrtc->cfg_reg |= 0x4;
> +               break;
> +       }
> +       ls_mm_wreg_locked(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +
> +       cal_freq(pix_freq, &pll_cfg);
> +       config_pll(ldev, LS_PIX_PLL + reg_offset, &pll_cfg);
> +}
> +
> +static void loongson_crtc_atomic_enable(struct drm_crtc *crtc,
> +                                       struct drm_crtc_state *old_state)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct loongson_device *ldev = dev->dev_private;
> +       struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +       u32 reg_offset = lcrtc->reg_offset;
> +
> +       lcrtc->cfg_reg |= CFG_ENABLE;
> +       ls_mm_wreg_locked(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +}
> +
> +static void loongson_crtc_atomic_disable(struct drm_crtc *crtc,
> +                                        struct drm_crtc_state *old_state)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct loongson_device *ldev = dev->dev_private;
> +       struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +       u32 reg_offset = lcrtc->reg_offset;
> +
> +       lcrtc->cfg_reg &= ~CFG_ENABLE;
> +       ls_mm_wreg_locked(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +}
> +
> +static enum drm_mode_status loongson_mode_valid(struct drm_crtc *crtc,
> +                                               struct drm_display_mode *mode)
> +{
> +       if (mode->hdisplay > 1920)
> +               return MODE_BAD;
> +       if (mode->vdisplay > 1080)
> +               return MODE_BAD;
> +       if (mode->hdisplay % 64)
> +               return MODE_BAD;
> +       if (mode->clock > 173000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_crtc_helper_funcs loongson_crtc_helper_funcs = {
> +       .mode_valid = loongson_mode_valid,
> +       .atomic_enable = loongson_crtc_atomic_enable,
> +       .atomic_disable = loongson_crtc_atomic_disable,
> +       .mode_set_nofb = loongson_crtc_mode_set_nofb,
> +};
> +
> +static const struct drm_crtc_funcs loongson_crtc_funcs = {
> +       .set_config = drm_atomic_helper_set_config,
> +       .page_flip = drm_atomic_helper_page_flip,
> +       .reset = drm_atomic_helper_crtc_reset,
> +       .destroy = drm_crtc_cleanup,
> +       .atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +int loongson_crtc_init(struct loongson_device *ldev, int index)
> +{
> +       struct loongson_crtc *lcrtc;
> +       u32 ret;
> +
> +       lcrtc = kzalloc(sizeof(struct loongson_crtc), GFP_KERNEL);
> +       if (lcrtc == NULL)
> +               return -1;
> +
> +       lcrtc->ldev = ldev;
> +       lcrtc->reg_offset = index * REG_OFFSET;
> +       lcrtc->cfg_reg = CFG_RESET;
> +       lcrtc->crtc_id = index;
> +
> +       ret = loongson_plane_init(lcrtc);
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_crtc_init_with_planes(ldev->dev, &lcrtc->base, lcrtc->plane,
> +                                       NULL, &loongson_crtc_funcs, NULL);
> +       if (ret) {
> +               DRM_ERROR("failed to init crtc %d\n", index);
> +               drm_plane_cleanup(lcrtc->plane);
> +               return ret;
> +       }
> +
> +       drm_crtc_helper_add(&lcrtc->base, &loongson_crtc_helper_funcs);
> +
> +       ldev->mode_info[index].crtc = lcrtc;
> +
> +       return 0;
> +}
> +
> diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
> new file mode 100644
> index 000000000000..8fef61c042b5
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_device.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +u32 loongson_gpu_offset(struct drm_plane_state *state)
> +{
> +       struct drm_gem_vram_object *gbo;
> +       struct loongson_crtc *lcrtc;
> +       struct loongson_device *ldev;
> +       u32 gpu_addr;
> +
> +       lcrtc = to_loongson_crtc(state->crtc);
> +       ldev = lcrtc->ldev;
> +
> +       gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
> +       gpu_addr = ldev->vram_start + drm_gem_vram_offset(gbo);
> +
> +       return gpu_addr;
> +}
> +
> +u32 ls_io_rreg(struct loongson_device *ldev, u32 offset)
> +{
> +       u32 val;
> +
> +       val = readl(ldev->io + offset);
> +
> +       return val;
> +}
> +
> +void ls_io_wreg(struct loongson_device *ldev, u32 offset, u32 val)
> +{
> +       writel(val, ldev->io + offset);
> +}
> +
> +u32 ls_mm_rreg_locked(struct loongson_device *ldev, u32 offset)
> +{
> +       u32 val;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ldev->mmio_lock, flags);
> +       val = readl(ldev->mmio + offset);
> +       spin_unlock_irqrestore(&ldev->mmio_lock, flags);
> +
> +       return val;
> +}
> +
> +void ls_mm_wreg_locked(struct loongson_device *ldev, u32 offset, u32 val)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ldev->mmio_lock, flags);
> +       writel(val, ldev->mmio + offset);
> +       spin_unlock_irqrestore(&ldev->mmio_lock, flags);
> +}
You can use ls7a_ instead of ls_ as a more meaningful prefix.

> diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
> new file mode 100644
> index 000000000000..8739c0dbc1b7
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson LS7A1000 bridge chipset drm driver
> + */
> +
> +#include <linux/console.h>
> +#include <linux/pci.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include "loongson_drv.h"
> +
> +/* Interface history:
> + * 0.1 - riginal.
original?

> + */
> +#define DRIVER_MAJOR 0
> +#define DRIVER_MINOR 1
> +
> +static const struct drm_mode_config_funcs loongson_mode_funcs = {
> +       .fb_create = drm_gem_fb_create,
> +       .atomic_check = drm_atomic_helper_check,
> +       .atomic_commit = drm_atomic_helper_commit,
> +       .output_poll_changed = drm_fb_helper_output_poll_changed,
> +       .mode_valid = drm_vram_helper_mode_valid
> +};
> +
> +static int loongson_device_init(struct drm_device *dev, uint32_t flags)
> +{
> +       struct loongson_device *ldev = dev->dev_private;
> +       struct pci_dev *gpu_pdev;
> +       resource_size_t aper_base;
> +       resource_size_t aper_size;
> +       resource_size_t mmio_base;
> +       resource_size_t mmio_size;
> +
> +       /* GPU MEM */
> +       /* We need get 7A-gpu pci device information for ldev->gpu_pdev */
> +       /* dev->pdev save 7A-dc pci device information */
> +       gpu_pdev = pci_get_device(PCI_VENDOR_ID_LOONGSON,
> +                                 PCI_DEVICE_ID_LOONGSON_GPU, NULL);
> +       if (IS_ERR(gpu_pdev))
> +               return PTR_ERR(gpu_pdev);
> +
> +       ldev->gpu_pdev = gpu_pdev;
> +       aper_base = pci_resource_start(gpu_pdev, 2);
> +       aper_size = pci_resource_len(gpu_pdev, 2);
> +       ldev->vram_start = (u32)aper_base;
> +       ldev->vram_size = (u32)aper_size;
> +
> +       if (!devm_request_mem_region(ldev->dev->dev, ldev->vram_start,
> +                                    ldev->vram_size, "loongson_vram")) {
> +               DRM_ERROR("Can't reserve VRAM\n");
> +               return -ENXIO;
> +       }
> +
> +       /* DC MEM */
> +       mmio_base = pci_resource_start(ldev->dev->pdev, 0);
> +       mmio_size = pci_resource_len(ldev->dev->pdev, 0);
> +       ldev->mmio = devm_ioremap(dev->dev, mmio_base, mmio_size);
> +       if (!ldev->mmio) {
> +               drm_err(dev, "Cannot map mmio region\n");
> +               return -ENOMEM;
> +       }
> +
> +       if (!devm_request_mem_region(ldev->dev->dev, mmio_base,
> +                                    mmio_size, "loongson_mmio")) {
> +               DRM_ERROR("Can't reserve mmio registers\n");
> +               return -ENOMEM;
> +       }
> +
> +       /* DC IO */
> +       ldev->io = (void *)TO_UNCAC(LS7A_CHIPCFG_REG_BASE);
> +       if (ldev->io == NULL)
> +               return -ENOMEM;
> +
> +       DRM_INFO("DC mmio_base 0x%llx mmio_size 0x%llx io 0x%x\n",
> +                mmio_base, mmio_size, *(int *)ldev->io);
> +       DRM_INFO("GPU vram_start = 0x%x vram_size = 0x%x\n",
> +                ldev->vram_start, ldev->vram_size);
> +
> +       return 0;
> +}
> +
> +int loongson_modeset_init(struct loongson_device *ldev)
> +{
> +       struct drm_encoder *encoder;
> +       struct drm_connector *connector;
> +       int i;
> +       u32 ret;
> +
> +       ldev->dev->mode_config.allow_fb_modifiers = true;
> +
> +       for (i = 0; i < 2; i++) {
> +               ret = loongson_crtc_init(ldev, i);
> +               if (ret) {
> +                       DRM_WARN("loongson crtc%d init failed\n", i);
> +                       continue;
> +               }
> +
> +               ret = loongson_encoder_init(ldev, i);
> +               if (ret) {
> +                       DRM_ERROR("loongson_encoder_init failed\n");
> +                       return -1;
> +               }
> +
> +               ret = loongson_connector_init(ldev, i);
> +               if (ret) {
> +                       DRM_ERROR("loongson_vga_init failed\n");
> +                       return -1;
> +               }
> +
> +               encoder = &ldev->mode_info[i].encoder->base;
> +               connector = &ldev->mode_info[i].connector->base;
> +               drm_connector_attach_encoder(connector, encoder);
> +               ldev->num_crtc++;
> +       }
> +
> +       return 0;
> +}
> +
> +static int loongson_drm_load(struct drm_device *dev, unsigned long flags)
> +{
> +       struct loongson_device *ldev;
> +       int ret;
> +
> +       ldev = devm_kzalloc(dev->dev, sizeof(*ldev), GFP_KERNEL);
> +       if (!ldev)
> +               return -ENOMEM;
> +
> +       dev->dev_private = ldev;
> +       ldev->dev = dev;
> +
> +       ret = loongson_device_init(dev, flags);
> +       if (ret)
> +               goto err;
> +
> +       ret = drmm_vram_helper_init(dev, ldev->vram_start, ldev->vram_size);
> +       if (ret)
> +               goto err;
> +
> +       drm_mode_config_init(dev);
> +       dev->mode_config.funcs = (void *)&loongson_mode_funcs;
> +       dev->mode_config.min_width = 1;
> +       dev->mode_config.min_height = 1;
> +       dev->mode_config.max_width = 4096;
> +       dev->mode_config.max_height = 4096;
> +       dev->mode_config.preferred_depth = 32;
> +       dev->mode_config.prefer_shadow = 1;
> +       dev->mode_config.fb_base = ldev->vram_start;
> +
> +       pci_set_drvdata(dev->pdev, dev);
> +
> +       ret = loongson_modeset_init(ldev);
> +       if (ret)
> +               dev_err(dev->dev, "Fatal error during modeset init: %d\n", ret);
> +
> +       drm_kms_helper_poll_init(dev);
> +       drm_mode_config_reset(dev);
> +
> +       return 0;
> +
> +err:
> +       drm_err(dev, "failed to initialize drm driver: %d\n", ret);
> +       return ret;
> +}
> +
> +static void loongson_drm_unload(struct drm_device *dev)
> +{
> +       drm_vram_helper_release_mm(dev);
> +       drm_mode_config_cleanup(dev);
> +       dev->dev_private = NULL;
> +       dev_set_drvdata(dev->dev, NULL);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(fops);
> +
> +static struct drm_driver loongson_drm_driver = {
> +       .driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +       .fops = &fops,
> +       DRM_GEM_VRAM_DRIVER,
> +
> +       .name = DRIVER_NAME,
> +       .desc = DRIVER_DESC,
> +       .date = DRIVER_DATE,
> +       .major = DRIVER_MAJOR,
> +       .minor = DRIVER_MINOR,
> +};
> +
> +static int loongson_pci_probe(struct pci_dev *pdev,
> +                             const struct pci_device_id *ent)
> +{
> +       int ret;
> +       struct drm_device *dev;
> +
> +       dev = drm_dev_alloc(&loongson_drm_driver, &pdev->dev);
> +       if (IS_ERR(dev)) {
> +               DRM_ERROR("failed to allocate drm_device\n");
> +               return PTR_ERR(dev);
> +       }
> +
> +       dev->pdev = pdev;
> +       pci_set_drvdata(pdev, dev);
> +
> +       ret = pci_enable_device(pdev);
> +       if (ret) {
> +               drm_err(dev, "failed to enable pci device: %d\n", ret);
> +               goto err_free;
> +       }
> +
> +       ret = loongson_drm_load(dev, 0x0);
> +       if (ret) {
> +               drm_err(dev, "failed to load loongson: %d\n", ret);
> +               goto err_pdev;
> +       }
> +
> +       ret = drm_dev_register(dev, 0);
> +       if (ret) {
> +               drm_err(dev, "failed to register drv for userspace access: %d\n",
> +                       ret);
> +               goto err_pdev;
> +       }
> +
> +       drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +
> +       return 0;
> +
> +err_pdev:
> +       pci_disable_device(pdev);
> +err_free:
> +       drm_dev_put(dev);
> +       return ret;
> +}
> +
> +static void loongson_pci_remove(struct pci_dev *pdev)
> +{
> +       struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +       drm_dev_unregister(dev);
> +       loongson_drm_unload(dev);
> +       drm_dev_put(dev);
> +}
> +
> +static struct pci_device_id loongson_pci_devices[] = {
> +       { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC) },
> +       {0,}
> +};
> +
> +static struct pci_driver loongson_drm_pci_driver = {
> +       .name = DRIVER_NAME,
> +       .id_table = loongson_pci_devices,
> +       .probe = loongson_pci_probe,
> +       .remove = loongson_pci_remove,
> +};
> +
> +static int __init loongson_drm_init(void)
> +{
> +       return pci_register_driver(&loongson_drm_pci_driver);
> +}
> +
> +static void __exit loongson_drm_exit(void)
> +{
> +       pci_unregister_driver(&loongson_drm_pci_driver);
> +}
> +
> +module_init(loongson_drm_init);
> +module_exit(loongson_drm_exit);
> +
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
> new file mode 100644
> index 000000000000..fba66559914b
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __LOONGSON_DRV_H__
> +#define __LOONGSON_DRV_H__
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +
> +/* General customization:
> + */
> +#define DRIVER_AUTHOR "Loongson graphics driver team"
> +#define DRIVER_NAME "loongson-drm"
> +#define DRIVER_DESC "Loongson LS7A1000 DRM driver"
Use LS7A, as above.

> +#define DRIVER_DATE "20200915"
> +
> +#define to_loongson_crtc(x) container_of(x, struct loongson_crtc, base)
> +#define to_loongson_encoder(x) container_of(x, struct loongson_encoder, base)
> +
> +#define LS7A_CHIPCFG_REG_BASE (0x10010000)
> +#define PCI_DEVICE_ID_LOONGSON_DC 0x7a06
> +#define PCI_DEVICE_ID_LOONGSON_GPU 0x7a15
> +#define LS_PIX_PLL (0x04b0)
Use LS7A prefix, as above.

> +#define REG_OFFSET (0x10)
> +#define FB_CFG_REG (0x1240)
> +#define FB_ADDR0_REG (0x1260)
> +#define FB_ADDR1_REG (0x1580)
> +#define FB_STRI_REG (0x1280)
> +#define FB_DITCFG_REG (0x1360)
> +#define FB_DITTAB_LO_REG (0x1380)
> +#define FB_DITTAB_HI_REG (0x13a0)
> +#define FB_PANCFG_REG (0x13c0)
> +#define FB_PANTIM_REG (0x13e0)
> +#define FB_HDISPLAY_REG (0x1400)
> +#define FB_HSYNC_REG (0x1420)
> +#define FB_VDISPLAY_REG (0x1480)
> +#define FB_VSYNC_REG (0x14a0)
> +
> +#define CFG_FMT GENMASK(2, 0)
> +#define CFG_FBSWITCH BIT(7)
> +#define CFG_ENABLE BIT(8)
> +#define CFG_FBNUM BIT(11)
> +#define CFG_GAMMAR BIT(12)
> +#define CFG_RESET BIT(20)
> +
> +#define FB_PANCFG_DEF 0x80001311
> +#define FB_HSYNC_PULSE (1 << 30)
> +#define FB_VSYNC_PULSE (1 << 30)
> +
> +struct pix_pll {
> +       u32 l2_div;
> +       u32 l1_loopc;
> +       u32 l1_frefc;
> +};
> +
> +struct loongson_crtc {
> +       struct drm_crtc base;
> +       struct loongson_device *ldev;
> +       u32 crtc_id;
> +       u32 reg_offset;
> +       u32 cfg_reg;
> +       struct drm_plane *plane;
> +};
> +
> +struct loongson_encoder {
> +       struct drm_encoder base;
> +       struct loongson_device *ldev;
> +       struct loongson_crtc *lcrtc;
> +};
> +
> +struct loongson_connector {
> +       struct drm_connector base;
> +       struct loongson_device *ldev;
> +       u16 id;
> +       u32 type;
> +};
> +
> +struct loongson_mode_info {
> +       struct loongson_device *ldev;
> +       struct loongson_crtc *crtc;
> +       struct loongson_encoder *encoder;
> +       struct loongson_connector *connector;
> +};
> +
> +struct loongson_device {
> +       struct drm_device *dev;
> +       struct drm_atomic_state *state;
> +
> +       spinlock_t mmio_lock;
> +       void __iomem *mmio;
> +       void __iomem *io;
> +       u32 vram_start;
> +       u32 vram_size;
> +
> +       u32 num_crtc;
> +       struct loongson_mode_info mode_info[2];
> +       struct pci_dev *gpu_pdev; /* loongson 7A gpu device info */
Use LS7A instead of "loongson 7A", for consistency.

> +};
> +
> +/* crtc */
> +int loongson_crtc_init(struct loongson_device *ldev, int index);
> +
> +/* connector */
> +int loongson_connector_init(struct loongson_device *ldev, int index);
> +
> +/* encoder */
> +int loongson_encoder_init(struct loongson_device *ldev, int index);
> +
> +/* plane */
> +int loongson_plane_init(struct loongson_crtc *lcrtc);
> +
> +/* device */
> +u32 loongson_gpu_offset(struct drm_plane_state *state);
> +u32 ls_mm_rreg_locked(struct loongson_device *ldev, u32 offset);
> +void ls_mm_wreg_locked(struct loongson_device *ldev, u32 offset, u32 val);
> +u32 ls_io_rreg(struct loongson_device *ldev, u32 offset);
> +void ls_io_wreg(struct loongson_device *ldev, u32 offset, u32 val);
> +
> +#endif /* __LOONGSON_DRV_H__ */
> diff --git a/drivers/gpu/drm/loongson/loongson_encoder.c b/drivers/gpu/drm/loongson/loongson_encoder.c
> new file mode 100644
> index 000000000000..2002cee00303
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_encoder.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void loongson_encoder_destroy(struct drm_encoder *encoder)
> +{
> +       struct loongson_encoder *lencoder = to_loongson_encoder(encoder);
> +
> +       drm_encoder_cleanup(encoder);
> +       kfree(lencoder);
> +}
> +
> +static const struct drm_encoder_funcs loongson_encoder_funcs = {
> +       .destroy = loongson_encoder_destroy,
> +};
> +
> +int loongson_encoder_init(struct loongson_device *ldev, int index)
> +{
> +       struct drm_encoder *encoder;
> +       struct loongson_encoder *lencoder;
> +
> +       lencoder = kzalloc(sizeof(struct loongson_encoder), GFP_KERNEL);
> +       if (!lencoder)
> +               return -1;
> +
> +       lencoder->lcrtc = ldev->mode_info[index].crtc;
> +       lencoder->ldev = ldev;
> +       encoder = &lencoder->base;
> +       encoder->possible_crtcs = 1 << index;
> +
> +       drm_encoder_init(ldev->dev, encoder, &loongson_encoder_funcs,
> +                        DRM_MODE_ENCODER_DAC, NULL);
> +
> +       ldev->mode_info[index].encoder = lencoder;
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/loongson_plane.c b/drivers/gpu/drm/loongson/loongson_plane.c
> new file mode 100644
> index 000000000000..288b6c894222
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_plane.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void loongson_plane_atomic_update(struct drm_plane *plane,
> +                                        struct drm_plane_state *old_state)
> +{
> +       struct loongson_crtc *lcrtc;
> +       struct loongson_device *ldev;
> +       struct drm_plane_state *state = plane->state;
> +       u32 gpu_addr = 0;
> +       u32 fb_addr = 0;
> +       u32 reg_val = 0;
> +       u32 reg_offset;
> +       u32 pitch;
> +       u8 depth;
> +       u32 x, y;
> +
> +       if (!state->crtc || !state->fb)
> +               return;
> +
> +       pitch = state->fb->pitches[0];
> +       lcrtc = to_loongson_crtc(state->crtc);
> +       ldev = lcrtc->ldev;
> +       reg_offset = lcrtc->reg_offset;
> +       x = state->crtc->x;
> +       y = state->crtc->y;
> +       depth = state->fb->format->cpp[0] << 3;
> +
> +       gpu_addr = loongson_gpu_offset(state);
> +       reg_val = (pitch + 255) & ~255;
> +       ls_mm_wreg_locked(ldev, FB_STRI_REG + reg_offset, reg_val);
> +
> +       switch (depth) {
> +       case 12 ... 16:
> +               fb_addr = gpu_addr + y * pitch + ALIGN(x, 64) * 2;
> +               break;
> +       case 24 ... 32:
> +       default:
> +               fb_addr = gpu_addr + y * pitch + ALIGN(x, 64) * 4;
> +               break;
> +       }
> +
> +       ls_mm_wreg_locked(ldev, FB_ADDR0_REG + reg_offset, fb_addr);
> +       ls_mm_wreg_locked(ldev, FB_ADDR1_REG + reg_offset, fb_addr);
> +       reg_val = lcrtc->cfg_reg | CFG_ENABLE;
> +       ls_mm_wreg_locked(ldev, FB_CFG_REG + reg_offset, reg_val);
> +}
> +
> +static const uint32_t loongson_formats[] = {
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +};
> +
> +static const uint64_t loongson_format_modifiers[] = { DRM_FORMAT_MOD_LINEAR,
> +                                                     DRM_FORMAT_MOD_INVALID };
> +
> +static const struct drm_plane_funcs loongson_plane_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +       .destroy = drm_plane_cleanup,
> +       .disable_plane = drm_atomic_helper_disable_plane,
> +       .reset = drm_atomic_helper_plane_reset,
> +       .update_plane = drm_atomic_helper_update_plane,
> +};
> +
> +static const struct drm_plane_helper_funcs loongson_plane_helper_funcs = {
> +       .prepare_fb     = drm_gem_vram_plane_helper_prepare_fb,
> +       .cleanup_fb     = drm_gem_vram_plane_helper_cleanup_fb,
> +       .atomic_update = loongson_plane_atomic_update,
> +};
> +
> +int loongson_plane_init(struct loongson_crtc *lcrtc)
> +{
> +       struct loongson_device *ldev;
> +       int crtc_id;
> +       int ret;
> +
> +       ldev = lcrtc->ldev;
> +       crtc_id = lcrtc->crtc_id;
> +
> +       lcrtc->plane = devm_kzalloc(ldev->dev->dev, sizeof(*lcrtc->plane),
> +                                   GFP_KERNEL);
> +       if (!lcrtc->plane)
> +               return -ENOMEM;
> +
> +       ret = drm_universal_plane_init(ldev->dev, lcrtc->plane, BIT(crtc_id),
> +                                      &loongson_plane_funcs, loongson_formats,
> +                                      ARRAY_SIZE(loongson_formats),
> +                                      loongson_format_modifiers,
> +                                      DRM_PLANE_TYPE_PRIMARY, NULL);
> +       if (ret) {
> +               DRM_ERROR("fail to init planed crtc %d\n", crtc_id);
> +               return ret;
> +       }
> +
> +       drm_plane_helper_add(lcrtc->plane, &loongson_plane_helper_funcs);
> +
> +       return 0;
> +}
> --
> 2.29.2

Thanks,
Huacai
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
