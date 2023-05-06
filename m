Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A196F9135
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B650310E25D;
	Sat,  6 May 2023 10:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2210E5EC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:08:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E8FF6423A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370A7C433AC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683342527;
 bh=dGCgPIxsqfTmRReXWzxIpkTa6lrCo7wDw2fuNYKCYPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ujs0pwVDwyq7wvDvnl1goq7PKZgpm0c9vxhn8lbF0qUFn7/n77FQ9rDACFHnyXY1w
 xEJRcqTvzWiFuPhdmOoRVBBwATpd0hlgr9WTvBQJ81hwM0oYcBJoWBqAC/zDmSrnnl
 WIiqUd2oi8zyqtQil5keCaJ+rI2xe+vGgxiZh0AnZvW9h17mcmplnnloOCNlLgFcrn
 MkOZeW5xRjdh3sdL7/+N6WvKCwVYR02d/dk178DjLK1NMAzQAB8VS7dSU2hQ9vX08V
 gbVb7aPeFgMhOCqU+FnSSFdRUCeFzNJPyTpuxL4NF2OK+G1t4pGxoxcFNeJoRIKV7C
 F0bHe84HX2CKQ==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so4814906a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 20:08:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDwI1ZK91JhFJ3M0x5iwrW0NHeKMALoofpf3NoHXdzUBHjh7ztiz
 kduXXaNM07yuhLcQhqe9UQiDeHqya5La5sUa0uY=
X-Google-Smtp-Source: ACHHUZ5wTesF65PirGOWZxm0b73vc13zXmNDT1o9HxpaBIMS/HMD/Co0Y7/zc9pBnhogZUoVQJ6Rmw1DcZWfxHNrm5I=
X-Received: by 2002:a17:907:6d0b:b0:965:5cba:4a16 with SMTP id
 sa11-20020a1709076d0b00b009655cba4a16mr3042550ejc.77.1683342524695; Fri, 05
 May 2023 20:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230504080406.1213623-1-suijingfeng@loongson.cn>
 <20230504080406.1213623-3-suijingfeng@loongson.cn>
In-Reply-To: <20230504080406.1213623-3-suijingfeng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 May 2023 11:08:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5j-86EQfw_Ar_Hyu+Kcuuu7wDCLxBKhO20Se48tnRGUg@mail.gmail.com>
Message-ID: <CAAhV-H5j-86EQfw_Ar_Hyu+Kcuuu7wDCLxBKhO20Se48tnRGUg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] drm: add kms driver for loongson display
 controller
To: Sui Jingfeng <suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, nathan@kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Li Yi <liyi@loongson.cn>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jingfeng,

On Thu, May 4, 2023 at 4:04=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.c=
n> wrote:
>
> Loongson display controller IP has been integrated in both Loongson north
> bridge chipset(ls7a1000/ls7a2000) and Loongson SoCs(ls2k1000/ls2k2000), i=
t
> has been even included in Loongson self-made BMC products.
>
> This display controller is a PCI device. It has two display pipes and eac=
h
> display pipe support a primary plane and a cursor plane. For the DC in th=
e
> ls7a1000 and ls2k1000, each display pipe has a DVO output interface which
> provide RGB888 signals, vertical & horizontal synchronisations and pixel
> clock. Each CRTC is able to support 1920x1080@60Hz, the maximum resolutio=
n
> of each display pipe is 2048x2048 according to the hardware spec.
>
> For the DC in LS7A2000, each display pipe is equipped with a built-in HDM=
I
> encoder which is compliant with the HDMI 1.4 specification, thus it suppo=
rt
> 3840x2160@30Hz. The first display pipe is also equipped with a transparen=
t
> vga encoder which is parallel with the HDMI encoder. The DC in LS7A2000 i=
s
> more complete compare with the one in old chips, besides above feature, i=
t
> has two hardware cursors, two hardware vblank counter and two scanout
> position recorders unit. It also support tiled framebuffer format which
> can be scanout the tiled framebuffer rendered by the LoongGPU directly.
>
> v1 -> v2:
>  1) Use hpd status reg when polling for ls7a2000
>  2) Fix all warnings emerged when compile with W=3D1
>
> v2 -> v3:
>  1) Add COMPILE_TEST in Kconfig and make the driver off by default
>  2) Alphabetical sorting headers (Thomas)
>  3) Untangle register access functions as much as possible (Thomas)
>  4) Switch to TTM based memory manager and prefer cached mapping
>     for Loongson SoC (Thomas)
>  5) Add chip id detection method, now all models are distinguishable.
>  6) Revise builtin HDMI phy driver, nearly all main stream mode
>     below 4K@30Hz is tested, this driver supported these mode very
>     well including clone display mode and extend display mode.
>
> v3 -> v4:
>  1) Quickly fix a small mistake.
>
> v4 -> v5:
>  1) Drop potential support for Loongson 2K series SoC temporary,
>     this part should be resend with the DT binding patch in the future.
>  2) Add per display pipe debugfs support to the builtin HDMI encoder.
>  3) Rewrite atomic_update() for hardware cursors plane(Thomas)
>  4) Rewrite encoder and connector initialization part, untangle it
>     according to the chip(Thomas).
>
> v5 -> v6:
>  1) Remove stray code which didn't get used, say lsdc_of_get_reserved_ram
>  2) Fix all typos I could found, make sentences and code more readable
>  3) Untangle lsdc_hdmi*_connector_detect() function according to the pipe
>  4) After a serious consideration, we rename this driver as loongson.
>     Because we also have drivers toward the LoongGPU IP in LS7A2000 and
>     LS2K2000. Besides, there are also drivers about the external encoder,
>     HDMI audio driver and vbios support etc. This patch only provide DC
>     driver part, my teammate Li Yi believe that loongson will be more
>     suitable for loongson graphics than lsdc in the long run.
>
>     loongson.ko =3D LSDC + LoongGPU + encoders driver + vbios/DT ...
>
> v6 -> v7:
>  1) Add prime support, self-sharing is works. sharing buffer with etnaviv
>     is also tested, and its works with limitation.
>  2) Implement buffer objects tracking with list_head.
>  3) S3(sleep to RAM) is tested on ls3a5000+ls7a2000 evb and it works.
>  4) Rewrite lsdc_bo_move, since ttm core stop allocating resources
>     during BO creation. Patch V1 ~ V6 of this series no longer works
>     on latest kernel. Thus, we send V7 to revival them.
>
> v7 -> v8:
>  1) Zero a compile warnnings on 32-bit platform, compile with W=3D1
>  2) Revise lsdc_bo_gpu_offset() and minor cleanup
>  3) Pageflip tested on the virtual terminal with following commands
>
>     modetest -M loongson -s 32:1920x1080 -v
>     modetest -M loongson -s 34:1920x1080 -v -F tiles
>
>    It works like a charm, when running pageflip test with dual screnn
>    configuration, another two additional bo created by the modetest
>    emerged, VRAM usage up to 40+MB, well we have at least 64MB, still
>    enough.
>
>    # cat bos
>
>        bo[0000]: size:     8112kB VRAM
>        bo[0001]: size:       16kB VRAM
>        bo[0002]: size:       16kB VRAM
>        bo[0003]: size:    16208kB VRAM
>        bo[0004]: size:     8112kB VRAM
>        bo[0005]: size:     8112kB VRAM
>
> v8 -> v9:
>  1) Select I2C and I2C_ALGOBIT in Kconfig and should depend on MMU.
>  2) Using pci_get_domain_bus_and_slot to get the GPU device.
>  3) Other minor improvements.
>
>  Those patches are tested on ls3a5000 + ls7a1000 CRB, ls3a5000 + ls7a2000
>  evb, and lemote a1901 board(ls3a4000 + ls7a1000). On loongson mips CPU,
>  the write combine support should be enabled, to get a decent performance
>  for writing framebuffer data to the VRAM.
>
> v9 -> v10:
>  1) Revise lsdc_drm_freeze() to implement S3 completely and correctly.
>     I suddenly realized that pinned buffer can not move and VRAM lost
>     power when sleep to RAM. Thus, the data in the buffer who is pinned
>     in VRAM will get lost when resume. Yet it's not big problem because
>     we are software rendering solution which relay on the CPU update the
>     front framebuffer. We can see the garbage data when resume from S3,
>     but the screen will show correct image as I move the cursor. This is
>     due to the cpu repaint. v10 of this patch make S3 perfect by unpin
>     all of BOs in VRAM, evict them all to system RAM.
>
> v10 -> v11:
>  1) On double screen case, the single giant framebuffer is referenced by
>     two GEM object, hence, it will be pinned by prepare_fb() at lease two
>     times. This cause its pin count > 1. V10 of this patch only unpin VRA=
M
>     BOs once when suspend, which is not correct on double screen case. V1=
1
>     of this patch unpin BOs until its pin count reach to zero when suspen=
d.
>     Then, we make the S3 support complete finally. With v11, I can't see
>     any garbage data after resume. Teste on both ls7a1000 and ls7a2000
>     platform, with single screen and double screen configuration tested.
>  2) Fix vblank wait timeout when disable CRTC.
>  3) Test against IGT, at least fbdev test and kms_flip test of it passed,
>     while most tests of it passed.
>  4) Rewrite pixel PLL update function, magic numbers eliminated (Emil)
>  5) Drop a few common hardware features description in lsdc_desc (Emil)
>  6) Drop lsdc_mode_config_mode_valid(), instead add restrictions in dumb
>     create function. (Emil)
>  7) Untangle the ls7a1000 case and ls7a2000 case completely (Thomas)
>
> v11 -> v12:
>  none
>
> Signed-off-by: Li Yi <liyi@loongson.cn>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/Kconfig                     |    2 +
>  drivers/gpu/drm/Makefile                    |    1 +
>  drivers/gpu/drm/loongson/Kconfig            |   17 +
>  drivers/gpu/drm/loongson/Makefile           |   19 +
>  drivers/gpu/drm/loongson/ls7a1000_outputs.c |  160 +++
>  drivers/gpu/drm/loongson/ls7a2000_outputs.c |  534 ++++++++++
>  drivers/gpu/drm/loongson/lsdc_crtc.c        | 1064 +++++++++++++++++++
>  drivers/gpu/drm/loongson/lsdc_debugfs.c     |   78 ++
>  drivers/gpu/drm/loongson/lsdc_device.c      |  104 ++
>  drivers/gpu/drm/loongson/lsdc_drv.c         |  484 +++++++++
>  drivers/gpu/drm/loongson/lsdc_drv.h         |  485 +++++++++
>  drivers/gpu/drm/loongson/lsdc_gem.c         |  319 ++++++
>  drivers/gpu/drm/loongson/lsdc_gem.h         |   37 +
>  drivers/gpu/drm/loongson/lsdc_gfxpll.c      |  199 ++++
>  drivers/gpu/drm/loongson/lsdc_gfxpll.h      |   52 +
>  drivers/gpu/drm/loongson/lsdc_i2c.c         |  179 ++++
>  drivers/gpu/drm/loongson/lsdc_i2c.h         |   29 +
>  drivers/gpu/drm/loongson/lsdc_irq.c         |   81 ++
>  drivers/gpu/drm/loongson/lsdc_irq.h         |   16 +
>  drivers/gpu/drm/loongson/lsdc_output.h      |   21 +
>  drivers/gpu/drm/loongson/lsdc_pixpll.c      |  485 +++++++++
>  drivers/gpu/drm/loongson/lsdc_pixpll.h      |   86 ++
>  drivers/gpu/drm/loongson/lsdc_plane.c       |  639 +++++++++++
>  drivers/gpu/drm/loongson/lsdc_probe.c       |   56 +
>  drivers/gpu/drm/loongson/lsdc_probe.h       |   12 +
>  drivers/gpu/drm/loongson/lsdc_regs.h        |  400 +++++++
>  drivers/gpu/drm/loongson/lsdc_ttm.c         |  547 ++++++++++
>  drivers/gpu/drm/loongson/lsdc_ttm.h         |   88 ++
>  28 files changed, 6194 insertions(+)
>  create mode 100644 drivers/gpu/drm/loongson/Kconfig
>  create mode 100644 drivers/gpu/drm/loongson/Makefile
>  create mode 100644 drivers/gpu/drm/loongson/ls7a1000_outputs.c
>  create mode 100644 drivers/gpu/drm/loongson/ls7a2000_outputs.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_device.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
>  create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ba3fb04bb691..d1fa87d2acb7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -331,6 +331,8 @@ source "drivers/gpu/drm/v3d/Kconfig"
>
>  source "drivers/gpu/drm/vc4/Kconfig"
>
> +source "drivers/gpu/drm/loongson/Kconfig"
> +
>  source "drivers/gpu/drm/etnaviv/Kconfig"
>
>  source "drivers/gpu/drm/hisilicon/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a33257d2bc7f..131531453b8e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -194,3 +194,4 @@ obj-y                       +=3D gud/
>  obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
>  obj-y                  +=3D solomon/
>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> +obj-$(CONFIG_DRM_LOONGSON) +=3D loongson/
> diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/=
Kconfig
> new file mode 100644
> index 000000000000..df6946d505fa
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config DRM_LOONGSON
> +       tristate "DRM support for Loongson Graphics"
> +       depends on DRM && PCI && MMU
> +       select DRM_KMS_HELPER
> +       select DRM_TTM
> +       select I2C
> +       select I2C_ALGOBIT
> +       help
> +         This is a DRM driver for Loongson Graphics, it may including
> +         LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
> +         series are bridge chipset, while Loongson LS2K series are SoC.
> +
> +         If "M" is selected, the module will be called loongson.
> +
> +         If in doubt, say "N".
> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson=
/Makefile
> new file mode 100644
> index 000000000000..b9f5f7c2ecfd
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +loongson-y :=3D \
> +       lsdc_crtc.o \
> +       lsdc_debugfs.o \
> +       lsdc_device.o \
> +       lsdc_drv.o \
> +       lsdc_gem.o \
> +       lsdc_gfxpll.o \
> +       lsdc_i2c.o \
> +       lsdc_irq.o \
> +       lsdc_plane.o \
> +       lsdc_pixpll.o \
> +       lsdc_probe.o \
> +       lsdc_ttm.o
> +
> +loongson-y +=3D ls7a1000_outputs.o ls7a2000_outputs.o
> +
> +obj-$(CONFIG_DRM_LOONGSON) +=3D loongson.o
> diff --git a/drivers/gpu/drm/loongson/ls7a1000_outputs.c b/drivers/gpu/dr=
m/loongson/ls7a1000_outputs.c
> new file mode 100644
> index 000000000000..8bd3259700f6
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/ls7a1000_outputs.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
Our regular name is "Loongson Technology Corporation Limited".

> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_output.h"
> +
> +/*
> + * Currently, we assume the external encoders connected with the DVO is
> + * transparent. Loongson DVO interface can directly drive RGB888 panels.
> + *
> + *  TODO: Add support for non-transparent encoders ...
> + */
> +
> +static int ls7a1000_generic_connector_get_modes(struct drm_connector *co=
nn)
> +{
> +       unsigned int num =3D 0;
> +       struct edid *edid;
> +
> +       if (conn->ddc) {
> +               edid =3D drm_get_edid(conn, conn->ddc);
> +               if (edid) {
> +                       drm_connector_update_edid_property(conn, edid);
> +                       num =3D drm_add_edid_modes(conn, edid);
> +                       kfree(edid);
> +               }
> +
> +               return num;
> +       }
> +
> +       num =3D drm_add_modes_noedid(conn, 1920, 1200);
> +
> +       drm_set_preferred_mode(conn, 1024, 768);
> +
> +       return num;
> +}
> +
> +static struct drm_encoder *
> +ls7a1000_generic_connector_get_best_encoder(struct drm_connector *connec=
tor,
> +                                           struct drm_atomic_state *stat=
e)
> +{
> +       struct lsdc_display_pipe *pipe =3D connector_to_display_pipe(conn=
ector);
> +
> +       return &pipe->encoder;
> +}
> +
> +static const struct drm_connector_helper_funcs
> +ls7a1000_generic_connector_helpers =3D {
> +       .atomic_best_encoder =3D ls7a1000_generic_connector_get_best_enco=
der,
> +       .get_modes =3D ls7a1000_generic_connector_get_modes,
> +};
> +
> +static enum drm_connector_status
> +ls7a1000_generic_connector_detect(struct drm_connector *connector, bool =
force)
> +{
> +       struct i2c_adapter *ddc =3D connector->ddc;
> +
> +       if (ddc) {
> +               if (drm_probe_ddc(ddc))
> +                       return connector_status_connected;
> +
> +               return connector_status_disconnected;
> +       }
> +
> +       return connector_status_unknown;
> +}
> +
> +static const struct drm_connector_funcs ls7a1000_generic_connector_funcs=
 =3D {
> +       .detect =3D ls7a1000_generic_connector_detect,
> +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> +       .destroy =3D drm_connector_cleanup,
> +       .reset =3D drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> +       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te
> +};
> +
> +static void ls7a1000_pipe0_encoder_reset(struct drm_encoder *encoder)
> +{
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +       /*
> +        * We need this, for S3 resume, screen will not lightup if don't =
set
> +        * correctly.
> +        */
> +       lsdc_wreg32(ldev, LSDC_CRTC0_PANEL_CONF_REG,
> +                   PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN);
> +}
> +
> +static void ls7a1000_pipe1_encoder_reset(struct drm_encoder *encoder)
> +{
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +       /*
> +        * We need this, for S3 resume, screen will not lightup if don't =
set
> +        * correctly.
> +        */
> +       lsdc_wreg32(ldev, LSDC_CRTC1_PANEL_CONF_REG,
> +                   PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN);
> +}
> +
> +static const struct drm_encoder_funcs ls7a1000_encoder_funcs[2] =3D {
> +       {
> +               .reset =3D ls7a1000_pipe0_encoder_reset,
> +               .destroy =3D drm_encoder_cleanup,
> +       },
> +       {
> +               .reset =3D ls7a1000_pipe1_encoder_reset,
> +               .destroy =3D drm_encoder_cleanup,
> +       },
> +};
> +
> +int ls7a1000_output_init(struct drm_device *ddev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        struct i2c_adapter *ddc,
> +                        unsigned int pipe)
> +{
> +       struct drm_encoder *encoder =3D &dispipe->encoder;
> +       struct drm_connector *connector =3D &dispipe->connector;
> +       int ret;
> +
> +       ret =3D drm_encoder_init(ddev,
> +                              encoder,
> +                              &ls7a1000_encoder_funcs[pipe],
> +                              DRM_MODE_ENCODER_TMDS,
> +                              "encoder-%u",
> +                              dispipe->index);
> +       if (ret)
> +               return ret;
> +
> +       encoder->possible_crtcs =3D BIT(pipe);
> +
> +       ret =3D drm_connector_init_with_ddc(ddev,
> +                                         connector,
> +                                         &ls7a1000_generic_connector_fun=
cs,
> +                                         DRM_MODE_CONNECTOR_DPI,
> +                                         ddc);
> +       if (ret)
> +               return ret;
> +
> +       drm_info(ddev, "display pipe-%u has a DVO\n", pipe);
> +
> +       drm_connector_helper_add(connector, &ls7a1000_generic_connector_h=
elpers);
> +
> +       drm_connector_attach_encoder(connector, encoder);
> +
> +       connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> +                           DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +       connector->interlace_allowed =3D 0;
> +       connector->doublescan_allowed =3D 0;
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/ls7a2000_outputs.c b/drivers/gpu/dr=
m/loongson/ls7a2000_outputs.c
> new file mode 100644
> index 000000000000..5ee37da3b88e
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/ls7a2000_outputs.c
> @@ -0,0 +1,534 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_output.h"
> +
> +static int ls7a2000_connector_get_modes(struct drm_connector *connector)
> +{
> +       unsigned int num =3D 0;
> +       struct edid *edid;
> +
> +       if (connector->ddc) {
> +               edid =3D drm_get_edid(connector, connector->ddc);
> +               if (edid) {
> +                       drm_connector_update_edid_property(connector, edi=
d);
> +                       num =3D drm_add_edid_modes(connector, edid);
> +                       kfree(edid);
> +               }
> +
> +               return num;
> +       }
> +
> +       num =3D drm_add_modes_noedid(connector, 1920, 1200);
> +
> +       drm_set_preferred_mode(connector, 1024, 768);
> +
> +       return num;
> +}
> +
> +static struct drm_encoder *
> +ls7a2000_connector_get_best_encoder(struct drm_connector *connector,
> +                                   struct drm_atomic_state *state)
> +{
> +       struct lsdc_display_pipe *dispipe;
> +
> +       dispipe =3D connector_to_display_pipe(connector);
> +
> +       return &dispipe->encoder;
> +}
> +
> +static const struct drm_connector_helper_funcs ls7a2000_connector_helper=
s =3D {
> +       .atomic_best_encoder =3D ls7a2000_connector_get_best_encoder,
> +       .get_modes =3D ls7a2000_connector_get_modes,
> +};
> +
> +/* debugfs */
> +
> +#define LSDC_HDMI_REG(i, reg) {                               \
> +       .name =3D __stringify_1(LSDC_HDMI##i##_##reg##_REG),    \
> +       .offset =3D LSDC_HDMI##i##_##reg##_REG,                 \
> +}
> +
> +static const struct lsdc_reg32 ls7a2000_hdmi0_encoder_regs[] =3D {
> +       LSDC_HDMI_REG(0, ZONE),
> +       LSDC_HDMI_REG(0, INTF_CTRL),
> +       LSDC_HDMI_REG(0, PHY_CTRL),
> +       LSDC_HDMI_REG(0, PHY_PLL),
> +       LSDC_HDMI_REG(0, AVI_INFO_CRTL),
> +       LSDC_HDMI_REG(0, PHY_CAL),
> +       LSDC_HDMI_REG(0, AUDIO_PLL_LO),
> +       LSDC_HDMI_REG(0, AUDIO_PLL_HI),
> +       {NULL, 0},  /* MUST be {NULL, 0} terminated */
> +};
> +
> +static const struct lsdc_reg32 ls7a2000_hdmi1_encoder_regs[] =3D {
> +       LSDC_HDMI_REG(1, ZONE),
> +       LSDC_HDMI_REG(1, INTF_CTRL),
> +       LSDC_HDMI_REG(1, PHY_CTRL),
> +       LSDC_HDMI_REG(1, PHY_PLL),
> +       LSDC_HDMI_REG(1, AVI_INFO_CRTL),
> +       LSDC_HDMI_REG(1, PHY_CAL),
> +       LSDC_HDMI_REG(1, AUDIO_PLL_LO),
> +       LSDC_HDMI_REG(1, AUDIO_PLL_HI),
> +       {NULL, 0},  /* MUST be {NULL, 0} terminated */
> +};
> +
> +static int ls7a2000_hdmi_encoder_regs_show(struct seq_file *m, void *dat=
a)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct drm_device *ddev =3D node->minor->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       const struct lsdc_reg32 *preg;
> +
> +       preg =3D (const struct lsdc_reg32 *)node->info_ent->data;
> +
> +       while (preg->name) {
> +               u32 offset =3D preg->offset;
> +
> +               seq_printf(m, "%s (0x%04x): 0x%08x\n",
> +                          preg->name, offset, lsdc_rreg32(ldev, offset))=
;
> +               ++preg;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct drm_info_list ls7a2000_hdmi0_debugfs_files[] =3D {
> +       { "regs", ls7a2000_hdmi_encoder_regs_show, 0, (void *)ls7a2000_hd=
mi0_encoder_regs },
> +};
> +
> +static const struct drm_info_list ls7a2000_hdmi1_debugfs_files[] =3D {
> +       { "regs", ls7a2000_hdmi_encoder_regs_show, 0, (void *)ls7a2000_hd=
mi1_encoder_regs },
> +};
> +
> +static void ls7a2000_hdmi0_late_register(struct drm_connector *connector=
,
> +                                        struct dentry *root)
> +{
> +       struct drm_device *ddev =3D connector->dev;
> +       struct drm_minor *minor =3D ddev->primary;
> +
> +       drm_debugfs_create_files(ls7a2000_hdmi0_debugfs_files,
> +                                ARRAY_SIZE(ls7a2000_hdmi0_debugfs_files)=
,
> +                                root,
> +                                minor);
Don't need split to so many lines, the last three lines can be combined.

> +}
> +
> +static void ls7a2000_hdmi1_late_register(struct drm_connector *connector=
,
> +                                        struct dentry *root)
> +{
> +       struct drm_device *ddev =3D connector->dev;
> +       struct drm_minor *minor =3D ddev->primary;
> +
> +       drm_debugfs_create_files(ls7a2000_hdmi1_debugfs_files,
> +                                ARRAY_SIZE(ls7a2000_hdmi1_debugfs_files)=
,
> +                                root,
> +                                minor);
> +}
> +
> +/* monitor present detection */
> +
> +static enum drm_connector_status
> +ls7a2000_hdmi0_vga_connector_detect(struct drm_connector *connector, boo=
l force)
> +{
> +       struct drm_device *ddev =3D connector->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
> +
> +       if (val & HDMI0_HPD_FLAG)
> +               return connector_status_connected;
> +
> +       if (connector->ddc) {
> +               if (drm_probe_ddc(connector->ddc))
> +                       return connector_status_connected;
> +
> +               return connector_status_disconnected;
> +       }
> +
> +       return connector_status_unknown;
> +}
> +
> +static enum drm_connector_status
> +ls7a2000_hdmi1_connector_detect(struct drm_connector *connector, bool fo=
rce)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(connector->dev);
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
> +
> +       if (val & HDMI1_HPD_FLAG)
> +               return connector_status_connected;
> +
> +       return connector_status_disconnected;
> +}
> +
> +static const struct drm_connector_funcs ls7a2000_hdmi_connector_funcs[2]=
 =3D {
> +       {
> +               .detect =3D ls7a2000_hdmi0_vga_connector_detect,
> +               .fill_modes =3D drm_helper_probe_single_connector_modes,
> +               .destroy =3D drm_connector_cleanup,
> +               .reset =3D drm_atomic_helper_connector_reset,
> +               .atomic_duplicate_state =3D drm_atomic_helper_connector_d=
uplicate_state,
> +               .atomic_destroy_state =3D drm_atomic_helper_connector_des=
troy_state,
> +               .debugfs_init =3D ls7a2000_hdmi0_late_register,
> +       },
> +       {
> +               .detect =3D ls7a2000_hdmi1_connector_detect,
> +               .fill_modes =3D drm_helper_probe_single_connector_modes,
> +               .destroy =3D drm_connector_cleanup,
> +               .reset =3D drm_atomic_helper_connector_reset,
> +               .atomic_duplicate_state =3D drm_atomic_helper_connector_d=
uplicate_state,
> +               .atomic_destroy_state =3D drm_atomic_helper_connector_des=
troy_state,
> +               .debugfs_init =3D ls7a2000_hdmi1_late_register,
> +       },
> +};
> +
> +/* Even though some board has only one hdmi on display pipe 1,
> + * We still need hook lsdc_encoder_funcs up on display pipe 0,
> + * This is because we need its reset() callback get called, to
> + * set the LSDC_HDMIx_CTRL_REG using software gpio emulated i2c.
> + * Otherwise, the firmware may set LSDC_HDMIx_CTRL_REG blindly.
> + */
> +static void ls7a2000_hdmi0_encoder_reset(struct drm_encoder *encoder)
> +{
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       u32 val;
> +
> +       val =3D PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
> +       lsdc_wreg32(ldev, LSDC_CRTC0_PANEL_CONF_REG, val);
> +
> +       /* using software gpio emulated i2c */
> +       val =3D lsdc_rreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG);
> +       val &=3D ~HW_I2C_EN;
> +       val |=3D HDMI_INTERFACE_EN | HDMI_PACKET_EN;
> +       lsdc_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, val);
> +
> +       /* get out of reset state */
> +       val |=3D HDMI_PHY_RESET_N;
> +       lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
> +
> +       mdelay(20);
> +
> +       drm_dbg(ddev, "HDMI-0 Reset\n");
> +}
> +
> +static void ls7a2000_hdmi1_encoder_reset(struct drm_encoder *encoder)
> +{
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       u32 val;
> +
> +       val =3D PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
> +       lsdc_wreg32(ldev, LSDC_CRTC1_PANEL_CONF_REG, val);
> +
> +       /* using software gpio emulated i2c */
> +       val =3D lsdc_rreg32(ldev, LSDC_HDMI1_INTF_CTRL_REG);
> +       val &=3D ~HW_I2C_EN;
> +       val |=3D HDMI_INTERFACE_EN | HDMI_PACKET_EN;
> +       lsdc_wreg32(ldev, LSDC_HDMI1_INTF_CTRL_REG, val);
> +
> +       /* reset */
> +
> +       /* get out of reset state */
> +       val =3D HDMI_PHY_RESET_N;
> +       lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
> +
> +       mdelay(20);
> +
> +       drm_dbg(ddev, "HDMI-1 Reset\n");
> +}
> +
> +static const struct drm_encoder_funcs ls7a2000_encoder_funcs[2] =3D {
> +       {
> +               .reset =3D ls7a2000_hdmi0_encoder_reset,
> +               .destroy =3D drm_encoder_cleanup,
> +       },
> +       {
> +               .reset =3D ls7a2000_hdmi1_encoder_reset,
> +               .destroy =3D drm_encoder_cleanup,
> +       }
> +};
> +
> +static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
> +                                          struct drm_display_mode *mode)
> +{
> +       struct lsdc_display_pipe *dispipe =3D encoder_to_display_pipe(enc=
oder);
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       unsigned int index =3D dispipe->index;
> +       struct hdmi_avi_infoframe infoframe;
> +       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> +       unsigned char *ptr =3D &buffer[HDMI_INFOFRAME_HEADER_SIZE];
> +       unsigned int content0, content1, content2, content3;
> +       int err;
> +
> +       err =3D drm_hdmi_avi_infoframe_from_display_mode(&infoframe,
> +                                                      &dispipe->connecto=
r,
> +                                                      mode);
As above, the last two lines can be combined.

> +       if (err < 0) {
> +               drm_err(ddev, "failed to setup AVI infoframe: %d\n", err)=
;
> +               return err;
> +       }
> +
> +       /* Fixed infoframe configuration not linked to the mode */
> +       infoframe.colorspace =3D HDMI_COLORSPACE_RGB;
> +       infoframe.quantization_range =3D HDMI_QUANTIZATION_RANGE_DEFAULT;
> +       infoframe.colorimetry =3D HDMI_COLORIMETRY_NONE;
> +
> +       err =3D hdmi_avi_infoframe_pack(&infoframe, buffer, sizeof(buffer=
));
> +       if (err < 0) {
> +               drm_err(ddev, "failed to pack AVI infoframe: %d\n", err);
> +                       return err;
> +       }
> +
> +       content0 =3D *(unsigned int *)ptr;
> +       content1 =3D *(ptr + 4);
> +       content2 =3D *(unsigned int *)(ptr + 5);
> +       content3 =3D *(unsigned int *)(ptr + 9);
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT0, index, content0);
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT1, index, content1);
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT2, index, content2);
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_CONTENT3, index, content3);
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_AVI_INFO_CRTL_REG, index,
> +                        AVI_PKT_ENABLE | AVI_PKT_UPDATE);
> +
> +       drm_dbg(ddev, "Update HDMI-%u avi infoframe\n", index);
> +
> +       return 0;
> +}
> +
> +static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
> +                                        struct drm_atomic_state *state)
> +{
> +       struct lsdc_display_pipe *dispipe =3D encoder_to_display_pipe(enc=
oder);
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       unsigned int index =3D dispipe->index;
> +       u32 val;
> +
> +       /* Disable the hdmi phy */
> +       val =3D lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index);
> +       val &=3D ~HDMI_PHY_EN;
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
> +
> +       /* Disable the hdmi interface */
> +       val =3D lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index);
> +       val &=3D ~HDMI_INTERFACE_EN;
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index, val);
> +
> +       drm_dbg(ddev, "HDMI-%u disabled\n", index);
> +}
> +
> +static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
> +                                       struct drm_atomic_state *state)
> +{
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct lsdc_display_pipe *dispipe =3D encoder_to_display_pipe(enc=
oder);
> +       unsigned int index =3D dispipe->index;
> +       u32 val;
> +
> +       /* datasheet say it should larger than 48 */
> +       val =3D 64 << HDMI_H_ZONE_IDLE_SHIFT | 64 << HDMI_V_ZONE_IDLE_SHI=
FT;
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_ZONE_REG, index, val);
> +
> +       val =3D HDMI_PHY_TERM_STATUS |
> +             HDMI_PHY_TERM_DET_EN |
> +             HDMI_PHY_TERM_H_EN |
> +             HDMI_PHY_TERM_L_EN |
> +             HDMI_PHY_RESET_N |
> +             HDMI_PHY_EN;
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, index, val);
> +
> +       udelay(2);
> +
> +       val =3D HDMI_CTL_PERIOD_MODE |
> +             HDMI_AUDIO_EN |
> +             HDMI_PACKET_EN |
> +             HDMI_INTERFACE_EN |
> +             (8 << HDMI_VIDEO_PREAMBLE_SHIFT);
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_INTF_CTRL_REG, index, val);
> +
> +       drm_dbg(ddev, "HDMI-%u enabled\n", index);
> +}
> +
> +/*
> + *  Fout =3D M * Fin
> + *
> + *  M =3D (4 * LF) / (IDF * ODF)
> + *
> + *  IDF: Input Division Factor
> + *  ODF: Output Division Factor
> + *   LF: Loop Factor
> + *    M: Required Mult
> + *
> + *  +--------------------------------------------------------+
> + *  |     Fin (kHZ)     | M  | IDF | LF | ODF |   Fout(Mhz)  |
> + *  |-------------------+----+-----+----+-----+--------------|
> + *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~ 3400  |
> + *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~ 1700  |
> + *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~ 850   |
> + *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~ 425  |
> + *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~ 212.5 |
> + *  +--------------------------------------------------------+
> + */
> +static void ls7a2000_hdmi_phy_pll_config(struct lsdc_device *ldev,
> +                                        int fin,
> +                                        unsigned int index)
> +{
> +       struct drm_device *ddev =3D &ldev->base;
> +       int count =3D 0;
> +       u32 val;
> +
> +       /* Firstly, disable phy pll */
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, 0x0);
> +
> +       /*
> +        * Most of time, loongson HDMI require M =3D 10
> +        * for example, 10 =3D (4 * 40) / (8 * 2)
> +        * here, write "1" to the ODF will get "2"
> +        */
> +
> +       if (fin >=3D 170000)
> +               val =3D (16 << HDMI_PLL_IDF_SHIFT) |
> +                     (40 << HDMI_PLL_LF_SHIFT) |
> +                     (0 << HDMI_PLL_ODF_SHIFT);
> +       else if (fin >=3D 85000)
> +               val =3D (8 << HDMI_PLL_IDF_SHIFT) |
> +                     (40 << HDMI_PLL_LF_SHIFT) |
> +                     (1 << HDMI_PLL_ODF_SHIFT);
> +       else if (fin >=3D 42500)
> +               val =3D (4 << HDMI_PLL_IDF_SHIFT) |
> +                     (40 << HDMI_PLL_LF_SHIFT) |
> +                     (2 << HDMI_PLL_ODF_SHIFT);
> +       else if  (fin >=3D 21250)
> +               val =3D (2 << HDMI_PLL_IDF_SHIFT) |
> +                     (40 << HDMI_PLL_LF_SHIFT) |
> +                     (3 << HDMI_PLL_ODF_SHIFT);
> +       else
> +               val =3D (1 << HDMI_PLL_IDF_SHIFT) |
> +                     (40 << HDMI_PLL_LF_SHIFT) |
> +                     (4 << HDMI_PLL_ODF_SHIFT);
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, val);
> +
> +       val |=3D HDMI_PLL_ENABLE;
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, index, val);
> +
> +       udelay(2);
> +
> +       drm_dbg(ddev, "Fin of HDMI-%u: %d kHz\n", index, fin);
> +
> +       /* Wait hdmi phy pll lock */
> +       do {
> +               val =3D lsdc_hdmi_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, in=
dex);
> +
> +               if (val & HDMI_PLL_LOCKED) {
> +                       drm_dbg(ddev, "Setting HDMI-%u PLL take %d cycles=
\n",
> +                               index, count);
> +                       break;
> +               }
> +               ++count;
> +       } while (count < 1000);
> +
> +       lsdc_hdmi_wreg32(ldev, LSDC_HDMI0_PHY_CAL_REG, index, 0x0f000ff0)=
;
> +
> +       if (count >=3D 1000)
> +               drm_err(ddev, "Setting HDMI-%u PLL failed\n", index);
> +}
> +
> +static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
> +                                         struct drm_crtc_state *crtc_sta=
te,
> +                                         struct drm_connector_state *con=
n_state)
> +{
> +       struct lsdc_display_pipe *dispipe =3D encoder_to_display_pipe(enc=
oder);
> +       struct drm_device *ddev =3D encoder->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct drm_display_mode *mode =3D &crtc_state->mode;
> +
> +       ls7a2000_hdmi_phy_pll_config(ldev, mode->clock, dispipe->index);
> +
> +       ls7a2000_hdmi_set_avi_infoframe(encoder, mode);
> +
> +       drm_dbg(ddev, "HDMI-%u modeset finished\n", dispipe->index);
> +}
> +
> +static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_fun=
cs =3D {
> +       .atomic_disable =3D ls7a2000_hdmi_atomic_disable,
> +       .atomic_enable =3D ls7a2000_hdmi_atomic_enable,
> +       .atomic_mode_set =3D ls7a2000_hdmi_atomic_mode_set,
> +};
> +
> +/*
> + * For LS7A2000:
> + *
> + * 1) Most of board export one vga + hdmi output interface.
> + * 2) Yet, Some boards export double hdmi output interface.
> + * 3) Still have boards export three output(2 hdmi + 1 vga).
> + *
> + * So let's hook hdmi helper funcs to all display pipe, don't miss.
> + * writing hdmi register do no harms.
> + */
> +int ls7a2000_output_init(struct drm_device *ddev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        struct i2c_adapter *ddc,
> +                        unsigned int pipe)
> +{
> +       struct drm_encoder *encoder =3D &dispipe->encoder;
> +       struct drm_connector *connector =3D &dispipe->connector;
> +       int ret;
> +
> +       ret =3D drm_encoder_init(ddev,
> +                              encoder,
> +                              &ls7a2000_encoder_funcs[pipe],
> +                              DRM_MODE_ENCODER_TMDS,
> +                              "encoder-%u",
> +                              pipe);
Same problem.

> +       if (ret)
> +               return ret;
> +
> +       encoder->possible_crtcs =3D BIT(pipe);
> +
> +       drm_encoder_helper_add(encoder, &ls7a2000_encoder_helper_funcs);
> +
> +       ret =3D drm_connector_init_with_ddc(ddev,
> +                                         connector,
> +                                         &ls7a2000_hdmi_connector_funcs[=
pipe],
> +                                         DRM_MODE_CONNECTOR_HDMIA,
> +                                         ddc);
Same problem.

> +       if (ret)
> +               return ret;
> +
> +       drm_info(ddev, "display pipe-%u has HDMI %s\n", pipe, pipe ? "" :=
 "and/or VGA");
> +
> +       drm_connector_helper_add(connector, &ls7a2000_connector_helpers);
> +
> +       drm_connector_attach_encoder(connector, encoder);
> +
> +       connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> +                           DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +       connector->interlace_allowed =3D 0;
> +       connector->doublescan_allowed =3D 0;
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loong=
son/lsdc_crtc.c
> new file mode 100644
> index 000000000000..9c23fa569dd5
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
> @@ -0,0 +1,1064 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lsdc_drv.h"
> +
> +/*
> + * The soft reset cause the vblank counter reset to zero, but the addres=
s
> + * and other settings in the crtc register remains.
> + */
> +
> +static void lsdc_crtc0_soft_reset(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +       val &=3D CFG_VALID_BITS_MASK;
> +
> +       /* soft reset bit, active low */
> +       val &=3D ~CFG_RESET_N;
> +
> +       val &=3D ~CFG_PIX_FMT_MASK;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
> +
> +       udelay(5);
> +
> +       val |=3D CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
> +
> +       mdelay(20);
> +}
> +
> +static void lsdc_crtc1_soft_reset(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +       val &=3D CFG_VALID_BITS_MASK;
> +
> +       /* soft reset bit, active low */
> +       val &=3D ~CFG_RESET_N;
> +
> +       val &=3D ~CFG_PIX_FMT_MASK;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
> +
> +       udelay(5);
> +
> +       val |=3D CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
> +
> +       msleep(20);
> +}
> +
> +static void lsdc_crtc0_enable(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +       /*
> +        * If bit 24 of LSDC_CRTC0_CFG_REG is set, it say that the DC har=
dware
> +        * stop working anymore, anchored. This maybe caused by improper
> +        * operation sequence, may happens on extreme rarely case.
> +        *
> +        * Luckily, a soft reset helps bring it to normal on such a case.
> +        * So we add a warn here, hope to catch something if it happens.
> +        */
> +
> +       if (val & BIT(24)) {
> +               drm_warn(&ldev->base, "%s anchored\n", lcrtc->base.name);
> +               return lsdc_crtc0_soft_reset(lcrtc);
> +       }
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val | CFG_OUTPUT_ENABLE);
> +}
> +
> +static void lsdc_crtc0_disable(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_clr(ldev, LSDC_CRTC0_CFG_REG, CFG_OUTPUT_ENABLE);
> +
> +       udelay(9);
> +}
> +
> +static void lsdc_crtc1_enable(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +       if (val & BIT(24)) {
> +               drm_warn(&ldev->base, "%s anchored\n", lcrtc->base.name);
> +               return lsdc_crtc1_soft_reset(lcrtc);
> +       }
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val | CFG_OUTPUT_ENABLE);
> +}
> +
> +static void lsdc_crtc1_disable(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_clr(ldev, LSDC_CRTC1_CFG_REG, CFG_OUTPUT_ENABLE);
> +
> +       udelay(9);
> +}
> +
> +/* All loongson display controller support scanout position hardware */
> +
> +static void lsdc_crtc0_scan_pos(struct lsdc_crtc *lcrtc, int *hpos, int =
*vpos)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG);
> +
> +       *hpos =3D val >> 16;
> +       *vpos =3D val & 0xffff;
> +}
> +
> +static void lsdc_crtc1_scan_pos(struct lsdc_crtc *lcrtc, int *hpos, int =
*vpos)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC1_SCAN_POS_REG);
> +
> +       *hpos =3D val >> 16;
> +       *vpos =3D val & 0xffff;
> +}
> +
> +static void lsdc_crtc0_enable_vblank(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
> +}
> +
> +static void lsdc_crtc0_disable_vblank(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC0_VSYNC_EN);
> +}
> +
> +static void lsdc_crtc1_enable_vblank(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
> +}
> +
> +static void lsdc_crtc1_disable_vblank(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_clr(ldev, LSDC_INT_REG, INT_CRTC1_VSYNC_EN);
> +}
> +
> +static void lsdc_crtc0_flip(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_CRTC0_CFG_REG, CFG_PAGE_FLIP);
> +}
> +
> +static void lsdc_crtc1_flip(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_CRTC1_CFG_REG, CFG_PAGE_FLIP);
> +}
> +
> +/*
> + * CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using hardware logic=
.
> + * Hardware engineer say this would help to saving bandwidth on clone mo=
de.
> + *
> + * This may useful on custom clone application.
> + */
> +
> +static void lsdc_crtc0_clone(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_CRTC0_CFG_REG, CFG_HW_CLONE);
> +}
> +
> +static void lsdc_crtc1_clone(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_ureg32_set(ldev, LSDC_CRTC1_CFG_REG, CFG_HW_CLONE);
> +}
> +
> +static void lsdc_crtc0_set_mode(struct lsdc_crtc *lcrtc,
> +                               const struct drm_display_mode *mode)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_HDISPLAY_REG,
> +                   (mode->crtc_htotal << 16) | mode->crtc_hdisplay);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_VDISPLAY_REG,
> +                   (mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_HSYNC_REG,
> +                   (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start=
 | HSYNC_EN);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_VSYNC_REG,
> +                   (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start=
 | VSYNC_EN);
> +}
> +
> +static void lsdc_crtc1_set_mode(struct lsdc_crtc *lcrtc,
> +                               const struct drm_display_mode *mode)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_HDISPLAY_REG,
> +                   (mode->crtc_htotal << 16) | mode->crtc_hdisplay);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_VDISPLAY_REG,
> +                   (mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_HSYNC_REG,
> +                   (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start=
 | HSYNC_EN);
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_VSYNC_REG,
> +                   (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start=
 | VSYNC_EN);
> +}
> +
> +/*
> + * This is required for S3 support.
> + *
> + * After resume from suspend, LSDC_CRTCx_CFG_REG (x=3D0 or 1)is filled w=
ith
> + * garbarge value which may cause the CRTC completely hang. This functio=
n
> + * give a minimal setting to the affected registers. This also override
> + * the firmware's setting on startup, eliminate potential blinding setti=
ng.
> + *
> + * Making the CRTC works on our own now, this is similar with the functi=
onal
> + * of GPU POST(Power On Self Test). Only touch CRTC hardware related par=
t.
> + */
> +
> +static void lsdc_crtc0_reset(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       struct drm_crtc *crtc =3D &lcrtc->base;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +       /* This help to see what is it */
> +       drm_dbg(&ldev->base, "value of %s configure register: %x\n",
> +               crtc->name, val);
> +
> +       /*
> +        * Help the CRTC get out of soft reset sate, as the CRTC is compl=
etely
> +        * halt on soft reset mode (BIT(20) =3D 0). It does not event gen=
erate
> +        * vblank, cause vblank wait timeout. This happends when resume f=
rom
> +        * S3.
> +        *
> +        * Also give a sane format, after resume from suspend S3, this
> +        * register is filled with garbarge value. A meaningless value ma=
y
> +        * also cause the CRTC halt or crash.
> +        */
> +
> +       val =3D CFG_RESET_N | LSDC_PF_XRGB8888;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
> +}
> +
> +static void lsdc_crtc1_reset(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       struct drm_crtc *crtc =3D &lcrtc->base;
> +       u32 val;
> +
> +       val =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +       drm_dbg(&ldev->base, "value of %s configue register: %x\n",
> +               crtc->name, val);
> +
> +       /*
> +        * Help the CRTC get out of soft reset sate, give a sane format,
> +        * Otherwise it will complete halt there.
> +        */
> +       val =3D CFG_RESET_N | LSDC_PF_XRGB8888;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
> +}
> +
> +static const struct lsdc_crtc_hw_ops ls7a1000_crtc_hw_ops[2] =3D {
> +       {
> +               .enable =3D lsdc_crtc0_enable,
> +               .disable =3D lsdc_crtc0_disable,
> +               .enable_vblank =3D lsdc_crtc0_enable_vblank,
> +               .disable_vblank =3D lsdc_crtc0_disable_vblank,
> +               .flip =3D lsdc_crtc0_flip,
> +               .clone =3D lsdc_crtc0_clone,
> +               .set_mode =3D lsdc_crtc0_set_mode,
> +               .get_scan_pos =3D lsdc_crtc0_scan_pos,
> +               .soft_reset =3D lsdc_crtc0_soft_reset,
> +               .reset =3D lsdc_crtc0_reset,
> +       },
> +       {
> +               .enable =3D lsdc_crtc1_enable,
> +               .disable =3D lsdc_crtc1_disable,
> +               .enable_vblank =3D lsdc_crtc1_enable_vblank,
> +               .disable_vblank =3D lsdc_crtc1_disable_vblank,
> +               .flip =3D lsdc_crtc1_flip,
> +               .clone =3D lsdc_crtc1_clone,
> +               .set_mode =3D lsdc_crtc1_set_mode,
> +               .get_scan_pos =3D lsdc_crtc1_scan_pos,
> +               .soft_reset =3D lsdc_crtc1_soft_reset,
> +               .reset =3D lsdc_crtc1_reset,
> +       },
> +};
> +
> +/*
> + * The 32-bit hardware vblank counter is available since ls7a2000/ls2k20=
00,
> + * The counter grow up even the CRTC is being disabled, it will got rese=
t
> + * if the crtc is being soft reset.
> + *
> + * Those registers are also readable for ls7a1000, but its value does no=
t
> + * change.
> + */
> +
> +static u32 lsdc_crtc0_get_vblank_count(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       return lsdc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG);
> +}
> +
> +static u32 lsdc_crtc1_get_vblank_count(struct lsdc_crtc *lcrtc)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +
> +       return lsdc_rreg32(ldev, LSDC_CRTC1_VSYNC_COUNTER_REG);
> +}
> +
> +/*
> + * The DMA step register is available since ls7a2000/ls2k2000, for suppo=
rt
> + * odd resolutions. But a large DMA step may save bandwidth. Behavior of
> + * writing thoes bits field on ls7a1000/ls2k1000 is underfined.
> + */
> +
> +static void lsdc_crtc0_set_dma_step(struct lsdc_crtc *lcrtc,
> +                                   enum lsdc_dma_steps dma_step)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +       val &=3D ~CFG_DMA_STEP_MASK;
> +       val |=3D dma_step << CFG_DMA_STEP_SHIFT;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
> +}
> +
> +static void lsdc_crtc1_set_dma_step(struct lsdc_crtc *lcrtc,
> +                                   enum lsdc_dma_steps dma_step)
> +{
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       u32 val =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +       val &=3D ~CFG_DMA_STEP_MASK;
> +       val |=3D dma_step << CFG_DMA_STEP_SHIFT;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
> +}
> +
> +static const struct lsdc_crtc_hw_ops ls7a2000_crtc_hw_ops[2] =3D {
> +       {
> +               .enable =3D lsdc_crtc0_enable,
> +               .disable =3D lsdc_crtc0_disable,
> +               .enable_vblank =3D lsdc_crtc0_enable_vblank,
> +               .disable_vblank =3D lsdc_crtc0_disable_vblank,
> +               .flip =3D lsdc_crtc0_flip,
> +               .clone =3D lsdc_crtc0_clone,
> +               .set_mode =3D lsdc_crtc0_set_mode,
> +               .soft_reset =3D lsdc_crtc0_soft_reset,
> +               .get_scan_pos =3D lsdc_crtc0_scan_pos,
> +               .set_dma_step =3D lsdc_crtc0_set_dma_step,
> +               .get_vblank_counter =3D lsdc_crtc0_get_vblank_count,
> +               .reset =3D lsdc_crtc0_reset,
> +       },
> +       {
> +               .enable =3D lsdc_crtc1_enable,
> +               .disable =3D lsdc_crtc1_disable,
> +               .enable_vblank =3D lsdc_crtc1_enable_vblank,
> +               .disable_vblank =3D lsdc_crtc1_disable_vblank,
> +               .flip =3D lsdc_crtc1_flip,
> +               .clone =3D lsdc_crtc1_clone,
> +               .set_mode =3D lsdc_crtc1_set_mode,
> +               .get_scan_pos =3D lsdc_crtc1_scan_pos,
> +               .soft_reset =3D lsdc_crtc1_soft_reset,
> +               .set_dma_step =3D lsdc_crtc1_set_dma_step,
> +               .get_vblank_counter =3D lsdc_crtc1_get_vblank_count,
> +               .reset =3D lsdc_crtc1_reset,
> +       },
> +};
> +
> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +       struct lsdc_crtc_state *priv_crtc_state;
> +
> +       if (crtc->state)
> +               crtc->funcs->atomic_destroy_state(crtc, crtc->state);
> +
> +       priv_crtc_state =3D kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL)=
;
> +
> +       if (!priv_crtc_state)
> +               __drm_atomic_helper_crtc_reset(crtc, NULL);
> +       else
> +               __drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->ba=
se);
> +
> +       /*
> +        * Reset the crtc hardware, this is need for S3 support,
> +        * otherwise, wait for vblank timeout
> +        */
> +       ops->reset(lcrtc);
> +}
> +
> +static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +                                          struct drm_crtc_state *state)
> +{
> +       struct lsdc_crtc_state *priv_state =3D to_lsdc_crtc_state(state);
> +
> +       __drm_atomic_helper_crtc_destroy_state(&priv_state->base);
> +
> +       kfree(priv_state);
> +}
> +
> +static struct drm_crtc_state *
> +lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc_state *new_priv_state;
> +       struct lsdc_crtc_state *old_priv_state;
> +
> +       new_priv_state =3D kzalloc(sizeof(*new_priv_state), GFP_KERNEL);
> +       if (!new_priv_state)
> +               return NULL;
> +
> +       __drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->b=
ase);
> +
> +       old_priv_state =3D to_lsdc_crtc_state(crtc->state);
> +
> +       memcpy(&new_priv_state->pparms, &old_priv_state->pparms,
> +              sizeof(new_priv_state->pparms));
> +
> +       return &new_priv_state->base;
> +}
> +
> +static u32 lsdc_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       return ops->get_vblank_counter(lcrtc);
> +}
> +
> +static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       ops->enable_vblank(lcrtc);
> +
> +       return 0;
> +}
> +
> +static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       ops->disable_vblank(lcrtc);
> +}
> +
> +/* CRTC related debugfs
> + *
> + * Primary planes and cursor planes are also belong to the CRTC for our =
case,
> + * so also append other registers to here, for sake of convient.
> + */
> +
> +#define REG_DEF(reg) { .name =3D __stringify_1(LSDC_##reg##_REG), .offse=
t =3D LSDC_##reg##_REG }
> +
> +static const struct lsdc_reg32 lsdc_crtc_regs_array[2][21] =3D {
> +       [0] =3D {
> +               REG_DEF(CRTC0_CFG),
> +               REG_DEF(CRTC0_FB_ORIGIN),
> +               REG_DEF(CRTC0_PANEL_CONF),
> +               REG_DEF(CRTC0_HDISPLAY),
> +               REG_DEF(CRTC0_HSYNC),
> +               REG_DEF(CRTC0_VDISPLAY),
> +               REG_DEF(CRTC0_VSYNC),
> +               REG_DEF(CRTC0_GAMMA_INDEX),
> +               REG_DEF(CRTC0_GAMMA_DATA),
> +               REG_DEF(CRTC0_SYNC_DEVIATION),
> +               REG_DEF(CRTC0_VSYNC_COUNTER),
> +               REG_DEF(CRTC0_SCAN_POS),
> +               REG_DEF(CRTC0_STRIDE),
> +               REG_DEF(CRTC0_FB1_ADDR_HI),
> +               REG_DEF(CRTC0_FB1_ADDR_LO),
> +               REG_DEF(CRTC0_FB0_ADDR_HI),
> +               REG_DEF(CRTC0_FB0_ADDR_LO),
> +               REG_DEF(CURSOR0_CFG),
> +               REG_DEF(CURSOR0_POSITION),
> +               REG_DEF(CURSOR0_BG_COLOR),
> +               REG_DEF(CURSOR0_FG_COLOR),
> +       },
> +       [1] =3D {
> +               REG_DEF(CRTC1_CFG),
> +               REG_DEF(CRTC1_FB_ORIGIN),
> +               REG_DEF(CRTC1_PANEL_CONF),
> +               REG_DEF(CRTC1_HDISPLAY),
> +               REG_DEF(CRTC1_HSYNC),
> +               REG_DEF(CRTC1_VDISPLAY),
> +               REG_DEF(CRTC1_VSYNC),
> +               REG_DEF(CRTC1_GAMMA_INDEX),
> +               REG_DEF(CRTC1_GAMMA_DATA),
> +               REG_DEF(CRTC1_SYNC_DEVIATION),
> +               REG_DEF(CRTC1_VSYNC_COUNTER),
> +               REG_DEF(CRTC1_SCAN_POS),
> +               REG_DEF(CRTC1_STRIDE),
> +               REG_DEF(CRTC1_FB1_ADDR_HI),
> +               REG_DEF(CRTC1_FB1_ADDR_LO),
> +               REG_DEF(CRTC1_FB0_ADDR_HI),
> +               REG_DEF(CRTC1_FB0_ADDR_LO),
> +               REG_DEF(CURSOR1_CFG),
> +               REG_DEF(CURSOR1_POSITION),
> +               REG_DEF(CURSOR1_BG_COLOR),
> +               REG_DEF(CURSOR1_FG_COLOR),
> +       },
> +};
> +
> +static int lsdc_crtc_show_regs(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_crtc *lcrtc =3D (struct lsdc_crtc *)node->info_ent->d=
ata;
> +       struct lsdc_device *ldev =3D lcrtc->ldev;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < lcrtc->nreg; i++) {
> +               const struct lsdc_reg32 *preg =3D &lcrtc->preg[i];
> +               u32 offset =3D preg->offset;
> +
> +               seq_printf(m, "%s (0x%04x): 0x%08x\n",
> +                          preg->name, offset, lsdc_rreg32(ldev, offset))=
;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lsdc_crtc_show_scan_position(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_crtc *lcrtc =3D (struct lsdc_crtc *)node->info_ent->d=
ata;
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +       int x, y;
> +
> +       ops->get_scan_pos(lcrtc, &x, &y);
> +
> +       seq_printf(m, "scanout position: x: %08u, y: %08u\n", x, y);
> +
> +       return 0;
> +}
> +
> +static int lsdc_crtc_show_vblank_counter(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_crtc *lcrtc =3D (struct lsdc_crtc *)node->info_ent->d=
ata;
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       seq_printf(m, "CRTC-0 vblank counter: %08u\n\n",
> +                  ops->get_vblank_counter(lcrtc));
> +
> +       return 0;
> +}
> +
> +static int lsdc_pixpll_show_clock(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_crtc *lcrtc =3D (struct lsdc_crtc *)node->info_ent->d=
ata;
> +       struct lsdc_pixpll *pixpll =3D &lcrtc->pixpll;
> +       const struct lsdc_pixpll_funcs *funcs =3D pixpll->funcs;
> +       struct drm_crtc *crtc =3D &lcrtc->base;
> +       struct drm_display_mode *mode =3D &crtc->state->mode;
> +       struct drm_printer printer =3D drm_seq_file_printer(m);
> +       unsigned int out_khz;
> +
> +       out_khz =3D funcs->get_rate(pixpll);
> +
> +       seq_printf(m, "%s: %dx%d@%d\n", crtc->name,
> +                  mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode=
));
> +
> +       seq_printf(m, "Pixel clock required: %d kHz\n", mode->clock);
> +       seq_printf(m, "Actual frequency output: %u kHz\n", out_khz);
> +       seq_printf(m, "Diff: %d kHz\n", out_khz - mode->clock);
> +
> +       funcs->print(pixpll, &printer);
> +
> +       return 0;
> +}
> +
> +static struct drm_info_list lsdc_crtc_debugfs_list[2][4] =3D {
> +       [0] =3D {
> +               { "regs", lsdc_crtc_show_regs, 0, NULL },
> +               { "pixclk", lsdc_pixpll_show_clock, 0, NULL },
> +               { "scanpos", lsdc_crtc_show_scan_position, 0, NULL },
> +               { "vblanks", lsdc_crtc_show_vblank_counter, 0, NULL },
> +       },
> +       [1] =3D {
> +               { "regs", lsdc_crtc_show_regs, 0, NULL },
> +               { "pixclk", lsdc_pixpll_show_clock, 0, NULL },
> +               { "scanpos", lsdc_crtc_show_scan_position, 0, NULL },
> +               { "vblanks", lsdc_crtc_show_vblank_counter, 0, NULL },
> +       },
> +};
> +
> +/* operate manually */
> +
> +static int lsdc_crtc_man_op_show(struct seq_file *m, void *data)
> +{
> +       seq_puts(m, "soft_reset: soft reset this CRTC\n");
> +       seq_puts(m, "enable: enable this CRTC\n");
> +       seq_puts(m, "disable: disable this CRTC\n");
> +       seq_puts(m, "flip: trigger the page flip\n");
> +       seq_puts(m, "clone: clone the another crtc with hardware logic\n"=
);
> +
> +       return 0;
> +}
> +
> +static int lsdc_crtc_man_op_open(struct inode *inode, struct file *file)
> +{
> +       struct drm_crtc *crtc =3D inode->i_private;
> +
> +       return single_open(file, lsdc_crtc_man_op_show, crtc);
> +}
> +
> +static ssize_t lsdc_crtc_man_op_write(struct file *file,
> +                                     const char __user *ubuf,
> +                                     size_t len,
> +                                     loff_t *offp)
Same problem.

> +{
> +       struct seq_file *m =3D file->private_data;
> +       struct drm_crtc *crtc =3D m->private;
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       char buf[16];
> +
> +       if (len > sizeof(buf) - 1)
> +               return -EINVAL;
> +
> +       if (copy_from_user(buf, ubuf, len))
> +               return -EFAULT;
> +
> +       buf[len] =3D '\0';
> +
> +       if (sysfs_streq(buf, "soft_reset"))
> +               ops->soft_reset(lcrtc);
> +       else if (sysfs_streq(buf, "enable"))
> +               ops->enable(lcrtc);
> +       else if (sysfs_streq(buf, "disable"))
> +               ops->disable(lcrtc);
> +       else if (sysfs_streq(buf, "flip"))
> +               ops->flip(lcrtc);
> +       else if (sysfs_streq(buf, "clone"))
> +               ops->clone(lcrtc);
> +
> +       return len;
> +}
> +
> +static const struct file_operations lsdc_crtc_man_op_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .open =3D lsdc_crtc_man_op_open,
> +       .read =3D seq_read,
> +       .llseek =3D seq_lseek,
> +       .release =3D single_release,
> +       .write =3D lsdc_crtc_man_op_write,
> +};
> +
> +static int lsdc_crtc_late_register(struct drm_crtc *crtc)
> +{
> +       struct lsdc_display_pipe *dispipe =3D crtc_to_display_pipe(crtc);
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       struct drm_minor *minor =3D crtc->dev->primary;
> +       unsigned int index =3D dispipe->index;
> +       unsigned int i;
> +
> +       lcrtc->preg =3D lsdc_crtc_regs_array[index];
> +       lcrtc->nreg =3D ARRAY_SIZE(lsdc_crtc_regs_array[index]);
> +       lcrtc->p_info_list =3D lsdc_crtc_debugfs_list[index];
> +       lcrtc->n_info_list =3D ARRAY_SIZE(lsdc_crtc_debugfs_list[index]);
> +
> +       for (i =3D 0; i < lcrtc->n_info_list; ++i)
> +               lcrtc->p_info_list[i].data =3D lcrtc;
> +
> +       drm_debugfs_create_files(lcrtc->p_info_list,
> +                                lcrtc->n_info_list,
> +                                crtc->debugfs_entry,
> +                                minor);
> +
> +       /* supported manual operations */
> +       debugfs_create_file("ops", 0644, crtc->debugfs_entry, crtc,
> +                           &lsdc_crtc_man_op_fops);
> +
> +       return 0;
> +}
> +
> +static void lsdc_crtc_atomic_print_state(struct drm_printer *p,
> +                                        const struct drm_crtc_state *sta=
te)
> +{
> +       const struct lsdc_crtc_state *priv_state;
> +       const struct lsdc_pixpll_parms *pparms;
> +
> +       priv_state =3D container_of_const(state, struct lsdc_crtc_state, =
base);
> +       pparms =3D &priv_state->pparms;
> +
> +       drm_printf(p, "\tInput clock divider =3D %u\n", pparms->div_ref);
> +       drm_printf(p, "\tMedium clock Multiplier =3D %u\n", pparms->loopc=
);
> +       drm_printf(p, "\tOutput clock divider =3D %u\n", pparms->div_out)=
;
> +}
> +
> +static const struct drm_crtc_funcs ls7a1000_crtc_funcs =3D {
> +       .reset =3D lsdc_crtc_reset,
> +       .destroy =3D drm_crtc_cleanup,
> +       .set_config =3D drm_atomic_helper_set_config,
> +       .page_flip =3D drm_atomic_helper_page_flip,
> +       .atomic_duplicate_state =3D lsdc_crtc_atomic_duplicate_state,
> +       .atomic_destroy_state =3D lsdc_crtc_atomic_destroy_state,
> +       .late_register =3D lsdc_crtc_late_register,
> +       .enable_vblank =3D lsdc_crtc_enable_vblank,
> +       .disable_vblank =3D lsdc_crtc_disable_vblank,
> +       .get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_times=
tamp,
> +       .atomic_print_state =3D lsdc_crtc_atomic_print_state,
> +};
> +
> +static const struct drm_crtc_funcs ls7a2000_crtc_funcs =3D {
> +       .reset =3D lsdc_crtc_reset,
> +       .destroy =3D drm_crtc_cleanup,
> +       .set_config =3D drm_atomic_helper_set_config,
> +       .page_flip =3D drm_atomic_helper_page_flip,
> +       .atomic_duplicate_state =3D lsdc_crtc_atomic_duplicate_state,
> +       .atomic_destroy_state =3D lsdc_crtc_atomic_destroy_state,
> +       .late_register =3D lsdc_crtc_late_register,
> +       .get_vblank_counter =3D lsdc_crtc_get_vblank_counter,
> +       .enable_vblank =3D lsdc_crtc_enable_vblank,
> +       .disable_vblank =3D lsdc_crtc_disable_vblank,
> +       .get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_times=
tamp,
> +       .atomic_print_state =3D lsdc_crtc_atomic_print_state,
> +};
> +
> +static enum drm_mode_status
> +lsdc_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mod=
e *mode)
> +{
> +       struct drm_device *ddev =3D crtc->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       const struct lsdc_desc *descp =3D ldev->descp;
> +       unsigned int pitch;
> +
> +       if (mode->hdisplay > descp->max_width)
> +               return MODE_BAD_HVALUE;
> +
> +       if (mode->vdisplay > descp->max_height)
> +               return MODE_BAD_VVALUE;
> +
> +       if (mode->clock > descp->max_pixel_clk) {
> +               drm_dbg_kms(ddev, "mode %dx%d, pixel clock=3D%d is too hi=
gh\n",
> +                           mode->hdisplay, mode->vdisplay, mode->clock);
> +               return MODE_CLOCK_HIGH;
> +       }
> +
> +       /* 4 for DRM_FORMAT_XRGB8888 */
> +       pitch =3D mode->hdisplay * 4;
> +
> +       if (pitch % descp->pitch_align) {
> +               drm_dbg_kms(ddev, "aligned to %u bytes is required: %u\n"=
,
> +                           descp->pitch_align, pitch);
> +               return MODE_BAD_WIDTH;
> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
> +                                   struct drm_crtc_state *state)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       struct lsdc_pixpll *pixpll =3D &lcrtc->pixpll;
> +       const struct lsdc_pixpll_funcs *pfuncs =3D pixpll->funcs;
> +       struct lsdc_crtc_state *priv_state =3D to_lsdc_crtc_state(state);
> +       unsigned int clock =3D state->mode.clock;
> +       int ret;
> +
> +       ret =3D pfuncs->compute(pixpll, clock, &priv_state->pparms);
> +       if (ret) {
> +               drm_warn(crtc->dev, "find PLL parms for %ukHz failed\n", =
clock);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lsdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +                                        struct drm_atomic_state *state)
> +{
> +       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state, crtc);
> +
> +       if (!crtc_state->enable)
> +               return 0;
> +
> +       return lsdc_pixpll_atomic_check(crtc, crtc_state);
> +}
> +
> +static void lsdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *crtc_hw_ops =3D lcrtc->hw_ops;
> +       struct lsdc_pixpll *pixpll =3D &lcrtc->pixpll;
> +       const struct lsdc_pixpll_funcs *pixpll_funcs =3D pixpll->funcs;
> +       struct drm_crtc_state *state =3D crtc->state;
> +       struct drm_display_mode *mode =3D &state->mode;
> +       struct lsdc_crtc_state *priv_state =3D to_lsdc_crtc_state(state);
> +
> +       pixpll_funcs->update(pixpll, &priv_state->pparms);
> +
> +       if (crtc_hw_ops->set_dma_step) {
> +               unsigned int width_in_bytes =3D mode->hdisplay * 4;
> +               enum lsdc_dma_steps dma_step;
> +
> +               /*
> +                * Using large dma step as much as possible, for improvin=
g
> +                * hardware DMA efficiency.
> +                */
> +               if (width_in_bytes % 256 =3D=3D 0)
> +                       dma_step =3D LSDC_DMA_STEP_256_BYTES;
> +               else if (width_in_bytes % 128 =3D=3D 0)
> +                       dma_step =3D LSDC_DMA_STEP_128_BYTES;
> +               else if (width_in_bytes % 64 =3D=3D 0)
> +                       dma_step =3D LSDC_DMA_STEP_64_BYTES;
> +               else  /* width_in_bytes % 32 =3D=3D 0 */
> +                       dma_step =3D LSDC_DMA_STEP_32_BYTES;
> +
> +               crtc_hw_ops->set_dma_step(lcrtc, dma_step);
> +       }
> +
> +       crtc_hw_ops->set_mode(lcrtc, mode);
> +}
> +
> +static void lsdc_crtc_send_vblank(struct drm_crtc *crtc)
> +{
> +       struct drm_device *ddev =3D crtc->dev;
> +       unsigned long flags;
> +
> +       if (!crtc->state || !crtc->state->event)
> +               return;
> +
> +       drm_dbg(ddev, "send vblank manually\n");
> +
> +       spin_lock_irqsave(&ddev->event_lock, flags);
> +       drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +       crtc->state->event =3D NULL;
> +       spin_unlock_irqrestore(&ddev->event_lock, flags);
> +}
> +
> +static void lsdc_crtc_atomic_enable(struct drm_crtc *crtc,
> +                                   struct drm_atomic_state *state)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       drm_crtc_vblank_on(crtc);
> +
> +       drm_dbg(crtc->dev, "%s enable\n", crtc->name);
> +
> +       ops->enable(lcrtc);
> +}
> +
> +static void lsdc_crtc_atomic_disable(struct drm_crtc *crtc,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +
> +       drm_crtc_vblank_off(crtc);
> +
> +       ops->disable(lcrtc);
> +
> +       drm_dbg(crtc->dev, "%s disable\n", crtc->name);
> +
> +       /*
> +        * Make sure we issue a vblank event after disabling the CRTC if
> +        * someone was waiting it.
> +        */
> +       lsdc_crtc_send_vblank(crtc);
> +}
> +
> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
> +                                  struct drm_atomic_state *state)
> +{
> +       spin_lock_irq(&crtc->dev->event_lock);
> +       if (crtc->state->event) {
> +               if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> +                       drm_crtc_arm_vblank_event(crtc, crtc->state->even=
t);
> +               else
> +                       drm_crtc_send_vblank_event(crtc, crtc->state->eve=
nt);
> +               crtc->state->event =3D NULL;
> +       }
> +       spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static bool lsdc_crtc_get_scanout_position(struct drm_crtc *crtc,
> +                                          bool in_vblank_irq,
> +                                          int *vpos,
> +                                          int *hpos,
> +                                          ktime_t *stime,
> +                                          ktime_t *etime,
> +                                          const struct drm_display_mode =
*mode)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       const struct lsdc_crtc_hw_ops *ops =3D lcrtc->hw_ops;
> +       int vsw, vbp, vactive_start, vactive_end, vfp_end;
> +       int x, y;
> +
> +       vsw =3D mode->crtc_vsync_end - mode->crtc_vsync_start;
> +       vbp =3D mode->crtc_vtotal - mode->crtc_vsync_end;
> +
> +       vactive_start =3D vsw + vbp + 1;
> +       vactive_end =3D vactive_start + mode->crtc_vdisplay;
> +
> +       /* last scan line before VSYNC */
> +       vfp_end =3D mode->crtc_vtotal;
> +
> +       if (stime)
> +               *stime =3D ktime_get();
> +
> +       ops->get_scan_pos(lcrtc, &x, &y);
> +
> +       if (y > vactive_end)
> +               y =3D y - vfp_end - vactive_start;
> +       else
> +               y -=3D vactive_start;
> +
> +       *vpos =3D y;
> +       *hpos =3D x;
> +
> +       if (etime)
> +               *etime =3D ktime_get();
> +
> +       return true;
> +}
> +
> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs =3D {
> +       .mode_valid =3D lsdc_crtc_mode_valid,
> +       .mode_set_nofb =3D lsdc_crtc_mode_set_nofb,
> +       .atomic_enable =3D lsdc_crtc_atomic_enable,
> +       .atomic_disable =3D lsdc_crtc_atomic_disable,
> +       .atomic_check =3D lsdc_crtc_helper_atomic_check,
> +       .atomic_flush =3D lsdc_crtc_atomic_flush,
> +       .get_scanout_position =3D lsdc_crtc_get_scanout_position,
> +};
> +
> +int ls7a1000_crtc_init(struct drm_device *ddev,
> +                      struct drm_crtc *crtc,
> +                      struct drm_plane *primary,
> +                      struct drm_plane *cursor,
> +                      unsigned int index)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       int ret;
> +
> +       ret =3D lsdc_pixpll_init(&lcrtc->pixpll, ddev, index);
> +       if (ret) {
> +               drm_err(ddev, "crtc init with pll failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       lcrtc->ldev =3D to_lsdc(ddev);
> +       lcrtc->hw_ops =3D &ls7a1000_crtc_hw_ops[index];
> +
> +       ret =3D drm_crtc_init_with_planes(ddev,
> +                                       crtc,
> +                                       primary,
> +                                       cursor,
> +                                       &ls7a1000_crtc_funcs,
> +                                       "CRTC-%d",
> +                                       index);
> +       if (ret) {
> +               drm_err(ddev, "crtc init with planes failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
> +
> +       ret =3D drm_mode_crtc_set_gamma_size(crtc, 256);
> +       if (ret)
> +               return ret;
> +
> +       drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> +
> +       return 0;
> +}
> +
> +int ls7a2000_crtc_init(struct drm_device *ddev,
> +                      struct drm_crtc *crtc,
> +                      struct drm_plane *primary,
> +                      struct drm_plane *cursor,
> +                      unsigned int index)
> +{
> +       struct lsdc_crtc *lcrtc =3D to_lsdc_crtc(crtc);
> +       int ret;
> +
> +       ret =3D lsdc_pixpll_init(&lcrtc->pixpll, ddev, index);
> +       if (ret) {
> +               drm_err(ddev, "crtc init with pll failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       lcrtc->ldev =3D to_lsdc(ddev);
> +       lcrtc->hw_ops =3D &ls7a2000_crtc_hw_ops[index];
> +
> +       ret =3D drm_crtc_init_with_planes(ddev,
> +                                       crtc,
> +                                       primary,
> +                                       cursor,
> +                                       &ls7a2000_crtc_funcs,
> +                                       "CRTC-%d",
> +                                       index);
Same problem.

> +       if (ret) {
> +               drm_err(ddev, "crtc init with planes failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
> +
> +       ret =3D drm_mode_crtc_set_gamma_size(crtc, 256);
> +       if (ret)
> +               return ret;
> +
> +       drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/lo=
ongson/lsdc_debugfs.c
> new file mode 100644
> index 000000000000..30d70a5dc7d5
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <drm/drm_debugfs.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_gem.h"
> +#include "lsdc_probe.h"
> +#include "lsdc_ttm.h"
> +
> +/* device level debugfs */
> +
> +static int lsdc_identify(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_device *ldev =3D (struct lsdc_device *)node->info_ent=
->data;
> +       const struct loongson_gfx_desc *gfx =3D to_loongson_gfx(ldev->des=
cp);
> +       u8 impl, rev;
> +
> +       loongson_cpu_get_prid(&impl, &rev);
> +
> +       seq_printf(m, "Running on cpu 0x%x, cpu revision: 0x%x\n",
> +                  impl, rev);
> +
> +       seq_printf(m, "Contained in: %s\n", gfx->model);
> +
> +       return 0;
> +}
> +
> +static int lsdc_show_mm(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct drm_device *ddev =3D node->minor->dev;
> +       struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +       drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
> +
> +       return 0;
> +}
> +
> +static int loongson_gfxpll_show_clock(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct lsdc_device *ldev =3D (struct lsdc_device *)node->info_ent=
->data;
> +       struct drm_printer printer =3D drm_seq_file_printer(m);
> +       struct loongson_gfxpll *gfxpll =3D ldev->gfxpll;
> +
> +       gfxpll->funcs->print(gfxpll, &printer, true);
> +
> +       return 0;
> +}
> +
> +static struct drm_info_list lsdc_debugfs_list[] =3D {
> +       { "chips",   lsdc_identify, 0, NULL },
> +       { "clocks", loongson_gfxpll_show_clock, 0, NULL },
> +       { "mm",     lsdc_show_mm, 0, NULL },
> +       { "bos",    lsdc_show_buffer_object, 0, NULL },
> +};
> +
> +void lsdc_debugfs_init(struct drm_minor *minor)
> +{
> +       struct drm_device *ddev =3D minor->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       unsigned int N =3D ARRAY_SIZE(lsdc_debugfs_list);
> +       unsigned int i;
> +
> +       for (i =3D 0; i < N; ++i)
> +               lsdc_debugfs_list[i].data =3D ldev;
> +
> +       drm_debugfs_create_files(lsdc_debugfs_list,
> +                                N,
> +                                minor->debugfs_root,
> +                                minor);
> +
> +       lsdc_ttm_debugfs_init(ldev);
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_device.c b/drivers/gpu/drm/loo=
ngson/lsdc_device.c
> new file mode 100644
> index 000000000000..e2dd0e357fa2
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_device.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include "lsdc_drv.h"
> +
> +static const struct lsdc_kms_funcs ls7a1000_kms_funcs =3D {
> +       .create_i2c =3D lsdc_create_i2c_chan,
> +       .irq_handler =3D ls7a1000_dc_irq_handler,
> +       .output_init =3D ls7a1000_output_init,
> +       .cursor_plane_init =3D ls7a1000_cursor_plane_init,
> +       .primary_plane_init =3D lsdc_primary_plane_init,
> +       .crtc_init =3D ls7a1000_crtc_init,
> +};
> +
> +static const struct lsdc_kms_funcs ls7a2000_kms_funcs =3D {
> +       .create_i2c =3D lsdc_create_i2c_chan,
> +       .irq_handler =3D ls7a2000_dc_irq_handler,
> +       .output_init =3D ls7a2000_output_init,
> +       .cursor_plane_init =3D ls7a2000_cursor_plane_init,
> +       .primary_plane_init =3D lsdc_primary_plane_init,
> +       .crtc_init =3D ls7a2000_crtc_init,
> +};
> +
> +static const struct loongson_gfx_desc ls7a1000_gfx =3D {
> +       .dc =3D {
> +               .num_of_crtc =3D 2,
> +               .max_pixel_clk =3D 200000,
> +               .max_width =3D 2048,
> +               .max_height =3D 2048,
> +               .num_of_hw_cursor =3D 1,
> +               .hw_cursor_w =3D 32,
> +               .hw_cursor_h =3D 32,
> +               .pitch_align =3D 256,
> +               .mc_bits =3D 40,
> +               .has_vblank_counter =3D false,
> +               .funcs =3D &ls7a1000_kms_funcs,
> +       },
> +       .conf_reg_base =3D LS7A1000_CONF_REG_BASE,
> +       .gfxpll =3D {
> +               .reg_offset =3D LS7A1000_PLL_GFX_REG,
> +               .reg_size =3D 8,
> +       },
> +       .pixpll =3D {
> +               [0] =3D {
> +                       .reg_offset =3D LS7A1000_PIXPLL0_REG,
> +                       .reg_size =3D 8,
> +               },
> +               [1] =3D {
> +                       .reg_offset =3D LS7A1000_PIXPLL1_REG,
> +                       .reg_size =3D 8,
> +               },
> +       },
> +       .chip_id =3D CHIP_LS7A1000,
> +       .model =3D "LS7A1000 bridge chipset",
> +};
> +
> +static const struct loongson_gfx_desc ls7a2000_gfx =3D {
> +       .dc =3D {
> +               .num_of_crtc =3D 2,
> +               .max_pixel_clk =3D 350000,
> +               .max_width =3D 4096,
> +               .max_height =3D 4096,
> +               .num_of_hw_cursor =3D 2,
> +               .hw_cursor_w =3D 64,
> +               .hw_cursor_h =3D 64,
> +               .pitch_align =3D 64,
> +               .mc_bits =3D 40, /* Support 48 but using 40 for backward =
compatibility */
> +               .has_vblank_counter =3D true,
> +               .funcs =3D &ls7a2000_kms_funcs,
> +       },
> +       .conf_reg_base =3D LS7A2000_CONF_REG_BASE,
> +       .gfxpll =3D {
> +               .reg_offset =3D LS7A2000_PLL_GFX_REG,
> +               .reg_size =3D 8,
> +       },
> +       .pixpll =3D {
> +               [0] =3D {
> +                       .reg_offset =3D LS7A2000_PIXPLL0_REG,
> +                       .reg_size =3D 8,
> +               },
> +               [1] =3D {
> +                       .reg_offset =3D LS7A2000_PIXPLL1_REG,
> +                       .reg_size =3D 8,
> +               },
> +       },
> +       .chip_id =3D CHIP_LS7A2000,
> +       .model =3D "LS7A2000 bridge chipset",
> +};
> +
> +const struct lsdc_desc *
> +lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip_id)
> +{
> +       if (chip_id =3D=3D CHIP_LS7A1000)
> +               return &ls7a1000_gfx.dc;
> +
> +       if (chip_id =3D=3D CHIP_LS7A2000)
> +               return &ls7a2000_gfx.dc;
> +
> +       return ERR_PTR(-ENODEV);
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongs=
on/lsdc_drv.c
> new file mode 100644
> index 000000000000..a91db7fe33c8
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -0,0 +1,484 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <video/nomodeset.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_gem.h"
> +#include "lsdc_i2c.h"
> +#include "lsdc_irq.h"
> +#include "lsdc_output.h"
> +#include "lsdc_probe.h"
> +#include "lsdc_ttm.h"
> +
> +#define DRIVER_AUTHOR           "Sui Jingfeng <suijingfeng@loongson.cn>"
> +#define DRIVER_NAME             "loongson"
> +#define DRIVER_DESC             "drm driver for loongson graphics"
> +#define DRIVER_DATE             "20220701"
> +#define DRIVER_MAJOR            1
> +#define DRIVER_MINOR            0
> +#define DRIVER_PATCHLEVEL       0
> +
> +DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
> +
> +static const struct drm_driver lsdc_drm_driver =3D {
> +       .driver_features =3D DRIVER_MODESET | DRIVER_RENDER | DRIVER_GEM =
| DRIVER_ATOMIC,
> +       .fops =3D &lsdc_gem_fops,
> +
> +       .name =3D DRIVER_NAME,
> +       .desc =3D DRIVER_DESC,
> +       .date =3D DRIVER_DATE,
> +       .major =3D DRIVER_MAJOR,
> +       .minor =3D DRIVER_MINOR,
> +       .patchlevel =3D DRIVER_PATCHLEVEL,
> +
> +       .debugfs_init =3D lsdc_debugfs_init,
> +       .dumb_create =3D lsdc_dumb_create,
> +       .dumb_map_offset =3D lsdc_dumb_map_offset,
> +       .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> +       .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> +       .gem_prime_import_sg_table =3D lsdc_prime_import_sg_table,
> +       .gem_prime_mmap =3D drm_gem_prime_mmap,
> +};
> +
> +static const struct drm_mode_config_funcs lsdc_mode_config_funcs =3D {
> +       .fb_create =3D drm_gem_fb_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +/* Display related */
> +
> +static int lsdc_modeset_init(struct lsdc_device *ldev,
> +                            unsigned int num_crtc,
> +                            const struct lsdc_kms_funcs *funcs)
> +{
> +       struct drm_device *ddev =3D &ldev->base;
> +       struct lsdc_display_pipe *dispipe;
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < num_crtc; i++) {
> +               dispipe =3D &ldev->dispipe[i];
> +
> +               /* We need a index before crtc is initialized */
> +               dispipe->index =3D i;
> +
> +               ret =3D funcs->create_i2c(ddev, dispipe, i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       for (i =3D 0; i < num_crtc; i++) {
> +               struct i2c_adapter *ddc =3D NULL;
> +
> +               dispipe =3D &ldev->dispipe[i];
> +               if (dispipe->li2c)
> +                       ddc =3D &dispipe->li2c->adapter;
> +
> +               ret =3D funcs->output_init(ddev, dispipe, ddc, i);
> +               if (ret)
> +                       return ret;
> +
> +               ldev->num_output++;
> +       }
> +
> +       for (i =3D 0; i < num_crtc; i++) {
> +               dispipe =3D &ldev->dispipe[i];
> +
> +               ret =3D funcs->primary_plane_init(ddev, &dispipe->primary=
.base, i);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D funcs->cursor_plane_init(ddev, &dispipe->cursor.b=
ase, i);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D funcs->crtc_init(ddev,
> +                                      &dispipe->crtc.base,
> +                                      &dispipe->primary.base,
> +                                      &dispipe->cursor.base,
> +                                      i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       drm_info(ddev, "total %u outputs\n", ldev->num_output);
> +
> +       return 0;
> +}
> +
> +static int lsdc_mode_config_init(struct drm_device *ddev,
> +                                const struct lsdc_desc *descp)
> +{
> +       int ret;
> +
> +       ret =3D drmm_mode_config_init(ddev);
> +       if (ret)
> +               return ret;
> +
> +       ddev->mode_config.funcs =3D &lsdc_mode_config_funcs;
> +       ddev->mode_config.min_width =3D 1;
> +       ddev->mode_config.min_height =3D 1;
> +       ddev->mode_config.max_width =3D descp->max_width * LSDC_NUM_CRTC;
> +       ddev->mode_config.max_height =3D descp->max_height * LSDC_NUM_CRT=
C;
> +       ddev->mode_config.preferred_depth =3D 24;
> +       ddev->mode_config.prefer_shadow =3D 1;
> +
> +       ddev->mode_config.cursor_width =3D descp->hw_cursor_h;
> +       ddev->mode_config.cursor_height =3D descp->hw_cursor_h;
> +
> +       if (descp->has_vblank_counter)
> +               ddev->max_vblank_count =3D 0xffffffff;
> +
> +       return ret;
> +}
> +
> +/*
> + * The GPU and display controller in LS7A1000/LS7A2000 are separated
> + * PCIE devices, they are two devices not one. The DC does not has a
> + * dedicate VRAM bar, because the BIOS engineer choose to assign the
> + * VRAM to the GPU device. Sadly, after years application, this form
> + * as a convention for loongson integrated graphics. Bar 2 of the GPU
> + * device contain the base address and size of the VRAM, both the GPU
> + * and the DC can access the on-board VRAM as long as the DMA address
> + * emitted fall in [base, base + size).
> + */
> +static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
> +                                  struct pci_dev *pdev_dc,
> +                                  const struct lsdc_desc *descp)
> +{
> +       struct drm_device *ddev =3D &ldev->base;
> +       struct pci_dev *pdev_gpu;
> +       resource_size_t base, size;
> +
> +       /*
> +        * The GPU has 00:06.0 as its BDF, while the DC has 00:06.1,
> +        * This is sure for LS7A1000, LS7A2000 and LS2K2000.
> +        */
> +       pdev_gpu =3D pci_get_domain_bus_and_slot(pci_domain_nr(pdev_dc->b=
us),
> +                                              pdev_dc->bus->number,
> +                                              PCI_DEVFN(6, 0));
> +       if (!pdev_gpu) {
> +               drm_err(ddev, "No GPU device, then no VRAM\n");
> +               return -ENODEV;
> +       }
> +
> +       base =3D pci_resource_start(pdev_gpu, 2);
> +       size =3D pci_resource_len(pdev_gpu, 2);
> +
> +       ldev->vram_base =3D base;
> +       ldev->vram_size =3D size;
> +       ldev->gpu =3D pdev_gpu;
> +
> +       drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
> +                (u64)base, (u32)(size >> 20));
> +
> +       return 0;
> +}
> +
> +static struct lsdc_device *
> +lsdc_create_device(struct pci_dev *pdev,
> +                  const struct lsdc_desc *descp,
> +                  const struct drm_driver *drv)
> +{
> +       struct lsdc_device *ldev;
> +       struct drm_device *ddev;
> +       int ret;
> +
> +       ldev =3D devm_drm_dev_alloc(&pdev->dev, drv, struct lsdc_device, =
base);
> +       if (IS_ERR(ldev))
> +               return ldev;
> +
> +       ddev =3D &ldev->base;
> +
> +       ldev->descp =3D descp;
> +
> +       loongson_gfxpll_create(ddev, &ldev->gfxpll);
> +
> +       ret =3D lsdc_get_dedicated_vram(ldev, pdev, descp);
> +       if (ret) {
> +               drm_err(ddev, "Init VRAM failed: %d\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       ret =3D drm_aperture_remove_conflicting_framebuffers(ldev->vram_b=
ase,
> +                                                          ldev->vram_siz=
e,
> +                                                          drv);
> +       if (ret) {
> +               drm_err(ddev, "remove firmware framebuffers failed: %d\n"=
, ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       ret =3D lsdc_ttm_init(ldev);
> +       if (ret) {
> +               drm_err(ddev, "memory manager init failed: %d\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       lsdc_gem_init(ddev);
> +
> +       /* BAR 0 of the DC device contain registers base address */
> +       ldev->reg_base =3D pcim_iomap(pdev, 0, 0);
> +       if (!ldev->reg_base)
> +               return ERR_PTR(-ENODEV);
> +
> +       spin_lock_init(&ldev->reglock);
> +
> +       ret =3D lsdc_mode_config_init(ddev, descp);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       ret =3D lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs)=
;
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       drm_mode_config_reset(ddev);
> +
> +       ret =3D drm_vblank_init(ddev, descp->num_of_crtc);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       drm_kms_helper_poll_init(ddev);
> +
> +       return ldev;
> +}
> +
> +static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_=
id *ent)
> +{
> +       const struct lsdc_desc *descp;
> +       struct drm_device *ddev;
> +       struct lsdc_device *ldev;
> +       int ret;
> +
> +       ret =3D pcim_enable_device(pdev);
> +       if (ret)
> +               return ret;
> +
> +       pci_set_master(pdev);
> +
> +       ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> +       if (ret)
> +               return ret;
> +
> +       descp =3D lsdc_device_probe(pdev, ent->driver_data);
> +       if (IS_ERR_OR_NULL(descp))
> +               return -ENODEV;
> +
> +       dev_info(&pdev->dev, "Found %s, revision: %u",
> +                to_loongson_gfx(descp)->model, pdev->revision);
> +
> +       ldev =3D lsdc_create_device(pdev, descp, &lsdc_drm_driver);
> +       if (IS_ERR(ldev))
> +               return PTR_ERR(ldev);
> +
> +       ldev->dc =3D pdev;
> +
> +       ddev =3D &ldev->base;
> +
> +       pci_set_drvdata(pdev, ddev);
> +
> +       ret =3D devm_request_irq(&pdev->dev,
> +                              pdev->irq,
> +                              descp->funcs->irq_handler,
> +                              IRQF_SHARED,
> +                              dev_name(&pdev->dev),
> +                              ddev);
> +       if (ret) {
> +               drm_err(ddev, "Failed to register interrupt: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D drm_dev_register(ddev, 0);
> +       if (ret)
> +               return ret;
> +
> +       drm_fbdev_generic_setup(ddev, 32);
> +
> +       return 0;
> +}
> +
> +static void lsdc_pci_remove(struct pci_dev *pdev)
> +{
> +       struct drm_device *ddev =3D pci_get_drvdata(pdev);
> +
> +       drm_dev_unregister(ddev);
> +       drm_atomic_helper_shutdown(ddev);
> +}
> +
> +static int lsdc_drm_freeze(struct drm_device *ddev)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct lsdc_bo *lbo;
> +       int ret;
> +
> +       /* unpin all of buffers in the vram */
> +       mutex_lock(&ldev->gem.mutex);
> +       list_for_each_entry(lbo, &ldev->gem.objects, list) {
> +               struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +               struct ttm_resource *resource =3D tbo->resource;
> +               unsigned int pin_count =3D tbo->pin_count;
> +
> +               drm_dbg(ddev,
> +                       "bo[%p], size: %zuKB, type: %s, pin count: %u\n",
> +                       lbo,
> +                       lsdc_bo_size(lbo) >> 10,
> +                       lsdc_mem_type_to_str(resource->mem_type),
> +                       pin_count);
> +
> +               if (!pin_count)
> +                       continue;
> +
> +               if (resource->mem_type =3D=3D TTM_PL_VRAM) {
> +                       ret =3D lsdc_bo_reserve(lbo);
> +                       if (unlikely(ret)) {
> +                               drm_err(ddev, "bo reserve failed: %d\n", =
ret);
> +                               continue;
> +                       }
> +
> +                       /*
> +                        * For double screen usage case, multiple crtc ma=
y
> +                        * reference to the single giant framebuffer bo.
> +                        * The single giant fb bo get pinned by multiple =
time.
> +                        * thus, it need to unpin until its pin counter r=
each
> +                        * zero.
> +                        */
> +                       do {
> +                               lsdc_bo_unpin(lbo);
> +                               --pin_count;
> +                       } while (pin_count);
> +
> +                       lsdc_bo_unreserve(lbo);
> +               }
> +       }
> +       mutex_unlock(&ldev->gem.mutex);
> +
> +       lsdc_bo_evict_vram(ddev);
> +
> +       ret =3D drm_mode_config_helper_suspend(ddev);
> +       if (unlikely(ret)) {
> +               drm_err(ddev, "freeze error: %d", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int lsdc_drm_resume(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +       struct drm_device *ddev =3D pci_get_drvdata(pdev);
> +
> +       return drm_mode_config_helper_resume(ddev);
> +}
> +
> +static int lsdc_pm_freeze(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +       struct drm_device *ddev =3D pci_get_drvdata(pdev);
> +
> +       return lsdc_drm_freeze(ddev);
> +}
> +
> +static int lsdc_pm_thaw(struct device *dev)
> +{
> +       return lsdc_drm_resume(dev);
> +}
> +
> +static int lsdc_pm_suspend(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +       int error;
> +
> +       error =3D lsdc_pm_freeze(dev);
> +       if (error)
> +               return error;
> +
> +       pci_save_state(pdev);
> +       /* Shut down the device */
> +       pci_disable_device(pdev);
> +       pci_set_power_state(pdev, PCI_D3hot);
> +
> +       return 0;
> +}
> +
> +static int lsdc_pm_resume(struct device *dev)
> +{
> +       struct pci_dev *pdev =3D to_pci_dev(dev);
> +
> +       pci_set_power_state(pdev, PCI_D0);
> +
> +       pci_restore_state(pdev);
> +
> +       if (pcim_enable_device(pdev))
> +               return -EIO;
> +
> +       return lsdc_pm_thaw(dev);
> +}
> +
> +static const struct dev_pm_ops lsdc_pm_ops =3D {
> +       .suspend =3D lsdc_pm_suspend,
> +       .resume =3D lsdc_pm_resume,
> +       .freeze =3D lsdc_pm_freeze,
> +       .thaw =3D lsdc_pm_thaw,
> +       .poweroff =3D lsdc_pm_freeze,
> +       .restore =3D lsdc_pm_resume,
> +};
> +
> +static const struct pci_device_id lsdc_pciid_list[] =3D {
> +       {PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH=
IP_LS7A1000},
> +       {PCI_VENDOR_ID_LOONGSON, 0x7a36, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH=
IP_LS7A2000},
> +       {0, 0, 0, 0, 0, 0, 0}
> +};
> +
> +static struct pci_driver lsdc_pci_driver =3D {
> +       .name =3D DRIVER_NAME,
> +       .id_table =3D lsdc_pciid_list,
> +       .probe =3D lsdc_pci_probe,
> +       .remove =3D lsdc_pci_remove,
> +       .driver.pm =3D &lsdc_pm_ops,
> +};
> +
> +static int __init loongson_module_init(void)
> +{
> +       struct pci_dev *pdev =3D NULL;
> +
> +       if (video_firmware_drivers_only())
> +               return -ENODEV;
> +
> +       /* Multiple video card workaround */
> +       while ((pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))=
) {
> +               if (pdev->vendor !=3D PCI_VENDOR_ID_LOONGSON) {
> +                       pr_info("Discrete graphic card detected, abort\n"=
);
> +                       return 0;
> +               }
> +       }
> +
> +       return pci_register_driver(&lsdc_pci_driver);
> +}
> +module_init(loongson_module_init);
> +
> +static void __exit loongson_module_exit(void)
> +{
> +       pci_unregister_driver(&lsdc_pci_driver);
> +}
> +module_exit(loongson_module_exit);
> +
> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongs=
on/lsdc_drv.h
> new file mode 100644
> index 000000000000..f3a1b6a347c8
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
> @@ -0,0 +1,485 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_DRV_H__
> +#define __LSDC_DRV_H__
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_plane.h>
> +#include <drm/ttm/ttm_device.h>
> +
> +#include "lsdc_i2c.h"
> +#include "lsdc_irq.h"
> +#include "lsdc_gfxpll.h"
> +#include "lsdc_pixpll.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_output.h"
> +
> +/* Currently, all loongson display controller has two display pipes */
> +#define LSDC_NUM_CRTC           2
> +
> +/*
> + * LS7A1000 and LS7A2000 function as south & north bridge chipset of the
> + * LS3A4000/LS3A5000/LS3A6000, They are typically equipped with on-board
> + * video RAM. While LS2K2000/LS2K1000/LS2K0500 are just low cost SoCs wh=
ich
From lower to greater may be better, e.g. LS2K0500/LS2K1000/LS2K2000.
And introduce LS7A1000 before LS7A2000 (see below).

> + * sharing the system RAM as video ram. They don't have dediacated VRAM.
> + *
> + * LS7A2000 integrated a 32-bit DDR4@2400 video memtory controller, whil=
e
> + * it is just 16-bit DDR3 for LS7A1000. LS7A2000 integrate Loongson self
> + * maded LoongGPU, LS7A1000 integrate GC1000 due to historical reasons.
> + *
> + * The display controller in LS7A2000 has two display pipe, yet it has
> + * integrate three encoders, display pipe 0 is attached with a transpare=
nt
> + * VGA encoder and a HDMI encoder, they are parallel. Display pipe 1 has
> + * only one HDMI phy connected.
> + *
> + *       ______________________                          _____________
> + *      |             +-----+  |                        |             |
> + *      | CRTC0 -+--> | VGA |  ----> VGA Connector ---> | VGA Monitor |<=
---+
> + *      |        |    +-----+  |                        |_____________| =
   |
> + *      |        |             |                         ______________ =
   |
> + *      |        |    +------+ |                        |              |=
   |
> + *      |        +--> | HDMI | ----> HDMI Connector --> | HDMI Monitor |=
<--+
> + *      |             +------+ |                        |______________|=
   |
> + *      |            +------+  |                                        =
   |
> + *      |            | i2c6 |  <----------------------------------------=
---+
> + *      |            +------+  |
> + *      |                      |
> + *      |    DC in LS7A2000    |
> + *      |                      |
> + *      |            +------+  |
> + *      |            | i2c7 |  <--------------------------------+
> + *      |            +------+  |                                |
> + *      |                      |                          ______|_______
> + *      |            +------+  |                         |              =
|
> + *      | CRTC1 ---> | HDMI |  ----> HDMI Connector ---> | HDMI Monitor =
|
> + *      |            +------+  |                         |______________=
|
> + *      |______________________|
> + *
> + *
> + * The display controller in LS7A1000 has only two-way DVO interface exp=
orted,
> + * thus, external encoder(TX chip) is required except connected with DPI=
 panel
> + * directly.
> + *       ___________________                                     _______=
__
> + *      |            -------|                                   |       =
  |
> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Displa=
y |
> + *      |  _   _     -------|        ^             ^            |_______=
__|
> + *      | | | | |  +------+ |        |             |
> + *      | |_| |_|  | i2c6 | <--------+-------------+
> + *      |          +------+ |
> + *      |                   |
> + *      |  DC in LS7A1000   |
> + *      |                   |
> + *      |  _   _   +------+ |
> + *      | | | | |  | i2c7 | <--------+-------------+
> + *      | |_| |_|  +------+ |        |             |             _______=
__
> + *      |            -------|        |             |            |       =
  |
> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel=
  |
> + *      |            -------|                                   |_______=
__|
> + *      |___________________|
> + *
> + * There is only a 1:1 mapping of crtcs, encoders and connectors for the=
 DC,
> + * display pipe 0 =3D crtc0 + dvo0 + encoder0 + connector0 + cursor0 + p=
rimary0
> + * display pipe 1 =3D crtc1 + dvo1 + encoder1 + connectro1 + cursor1 + p=
rimary1
> + * Each CRTC has two FB address registers.
> + *
> + * The DC in LS7A1000/LS2K1000 has the pci vendor/device ID: 0x0014:0x7a=
06,
> + * The DC in LS7A2000/LS2K2000 has the pci vendor/device ID: 0x0014:0x7a=
36.
> + *
> + * The GPU in LS7A1000 has the pci vendor/device ID: 0x0014:0x7a15,
> + * The GPU in LS7A2000 has the pci vendor/device ID: 0x0014:0x7a25.
> + *
> + * LS7A1000/LS7A2000 can only be used with LS3A4000, LS3A5000 and LS3A60=
00
> + * desktop or server class CPUs, thus CPU PRID can be used to distinguis=
h
> + * those SoC and the desktop level CPU on the runtime.
> + */
> +enum loongson_chip_id {
> +       CHIP_LS7A1000 =3D 0,
> +       CHIP_LS7A2000 =3D 1,
> +       CHIP_LS_LAST,
> +};
> +
> +const struct lsdc_desc *
> +lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip);
> +
> +struct lsdc_kms_funcs;
> +
> +/* DC specific */
> +
> +struct lsdc_desc {
> +       u32 num_of_crtc;
> +       u32 max_pixel_clk;
> +       u32 max_width;
> +       u32 max_height;
> +       u32 num_of_hw_cursor;
> +       u32 hw_cursor_w;
> +       u32 hw_cursor_h;
> +       u32 pitch_align;         /* CRTC DMA alignment constraint */
> +       u64 mc_bits;             /* physical address bus bit width */
> +       bool has_vblank_counter; /* 32 bit hw vsync counter */
> +
> +       /* device dependent ops, dc side */
> +       const struct lsdc_kms_funcs *funcs;
> +};
> +
> +/* GFX related resources wrangler */
> +
> +struct loongson_gfx_desc {
> +       struct lsdc_desc dc;
> +
> +       u32 conf_reg_base;
> +
> +       /* raw auxiliary resource */
> +
> +       /* GFXPLL shared by the DC, GMC and GPU */
> +       struct {
> +               u32 reg_offset;
> +               u32 reg_size;
> +       } gfxpll;
> +
> +       struct {
> +               u32 reg_offset;
> +               u32 reg_size;
> +       } pixpll[LSDC_NUM_CRTC];
> +
> +       enum loongson_chip_id chip_id;
> +       char model[64];
> +};
> +
> +static inline const struct loongson_gfx_desc *
> +to_loongson_gfx(const struct lsdc_desc *dcp)
> +{
> +       return container_of_const(dcp, struct loongson_gfx_desc, dc);
> +};
> +
> +struct lsdc_reg32 {
> +       char *name;
> +       u32 offset;
> +};
> +
> +/* crtc hardware related ops */
> +
> +struct lsdc_crtc;
> +
> +struct lsdc_crtc_hw_ops {
> +       void (*enable)(struct lsdc_crtc *lcrtc);
> +       void (*disable)(struct lsdc_crtc *lcrtc);
> +       void (*enable_vblank)(struct lsdc_crtc *lcrtc);
> +       void (*disable_vblank)(struct lsdc_crtc *lcrtc);
> +       void (*flip)(struct lsdc_crtc *lcrtc);
> +       void (*clone)(struct lsdc_crtc *lcrtc);
> +       void (*get_scan_pos)(struct lsdc_crtc *lcrtc, int *hpos, int *vpo=
s);
> +       void (*set_mode)(struct lsdc_crtc *lcrtc, const struct drm_displa=
y_mode *mode);
> +       void (*soft_reset)(struct lsdc_crtc *lcrtc);
> +       void (*reset)(struct lsdc_crtc *lcrtc);
> +
> +       u32  (*get_vblank_counter)(struct lsdc_crtc *lcrtc);
> +       void (*set_dma_step)(struct lsdc_crtc *lcrtc, enum lsdc_dma_steps=
 step);
> +};
> +
> +struct lsdc_crtc {
> +       struct drm_crtc base;
> +       struct lsdc_pixpll pixpll;
> +       struct lsdc_device *ldev;
> +       const struct lsdc_crtc_hw_ops *hw_ops;
> +       const struct lsdc_reg32 *preg;
> +       unsigned int nreg;
> +       struct drm_info_list *p_info_list;
> +       int n_info_list;
> +};
> +
> +/* primary plane hardware related ops */
> +
> +struct lsdc_primary;
> +
> +struct lsdc_primary_plane_ops {
> +       void (*update_fb_addr)(struct lsdc_primary *plane, u64 addr);
> +       void (*update_fb_stride)(struct lsdc_primary *plane, u32 stride);
> +       void (*update_fb_format)(struct lsdc_primary *plane,
> +                                const struct drm_format_info *format);
> +};
> +
> +struct lsdc_primary {
> +       struct drm_plane base;
> +       const struct lsdc_primary_plane_ops *ops;
> +       struct lsdc_device *ldev;
> +};
> +
> +/* cursor plane hardware related ops */
> +
> +struct lsdc_cursor;
> +
> +struct lsdc_cursor_plane_ops {
> +       void (*update_bo_addr)(struct lsdc_cursor *plane, u64 addr);
> +       void (*update_cfg)(struct lsdc_cursor *plane,
> +                          enum lsdc_cursor_size cursor_size,
> +                          enum lsdc_cursor_format);
> +       void (*update_position)(struct lsdc_cursor *plane, int x, int y);
> +};
> +
> +struct lsdc_cursor {
> +       struct drm_plane base;
> +       const struct lsdc_cursor_plane_ops *ops;
> +       struct lsdc_device *ldev;
> +};
> +
> +struct lsdc_display_pipe {
> +       struct lsdc_crtc crtc;
> +       struct lsdc_primary primary;
> +       struct lsdc_cursor cursor;
> +       struct drm_encoder encoder;
> +       struct drm_connector connector;
> +       struct lsdc_i2c *li2c;
> +       unsigned int index;
> +};
> +
> +struct lsdc_kms_funcs {
> +       irqreturn_t (*irq_handler)(int irq, void *arg);
> +
> +       int (*create_i2c)(struct drm_device *ddev,
> +                         struct lsdc_display_pipe *dispipe,
> +                         unsigned int index);
> +
> +       int (*output_init)(struct drm_device *ddev,
> +                          struct lsdc_display_pipe *dispipe,
> +                          struct i2c_adapter *ddc,
> +                          unsigned int index);
> +
> +       int (*cursor_plane_init)(struct drm_device *ddev,
> +                                struct drm_plane *plane,
> +                                unsigned int index);
> +
> +       int (*primary_plane_init)(struct drm_device *ddev,
> +                                 struct drm_plane *plane,
> +                                 unsigned int index);
> +
> +       int (*crtc_init)(struct drm_device *ddev,
> +                        struct drm_crtc *crtc,
> +                        struct drm_plane *primary,
> +                        struct drm_plane *cursor,
> +                        unsigned int index);
> +};
> +
> +static inline struct lsdc_crtc *
> +to_lsdc_crtc(struct drm_crtc *crtc)
> +{
> +       return container_of(crtc, struct lsdc_crtc, base);
> +}
> +
> +static inline struct lsdc_primary *
> +to_lsdc_primary(struct drm_plane *plane)
> +{
> +       return container_of(plane, struct lsdc_primary, base);
> +}
> +
> +static inline struct lsdc_cursor *
> +to_lsdc_cursor(struct drm_plane *plane)
> +{
> +       return container_of(plane, struct lsdc_cursor, base);
> +}
> +
> +static inline struct lsdc_display_pipe *
> +crtc_to_display_pipe(struct drm_crtc *crtc)
> +{
> +       return container_of(crtc, struct lsdc_display_pipe, crtc.base);
> +}
> +
> +static inline struct lsdc_display_pipe *
> +primary_to_display_pipe(struct drm_plane *plane)
> +{
> +       return container_of(plane, struct lsdc_display_pipe, primary.base=
);
> +}
> +
> +static inline struct lsdc_display_pipe *
> +cursor_to_display_pipe(struct drm_plane *plane)
> +{
> +       return container_of(plane, struct lsdc_display_pipe, cursor.base)=
;
> +}
> +
> +static inline struct lsdc_display_pipe *
> +connector_to_display_pipe(struct drm_connector *connector)
> +{
> +       return container_of(connector, struct lsdc_display_pipe, connecto=
r);
> +}
> +
> +static inline struct lsdc_display_pipe *
> +encoder_to_display_pipe(struct drm_encoder *encoder)
> +{
> +       return container_of(encoder, struct lsdc_display_pipe, encoder);
> +}
> +
> +struct lsdc_crtc_state {
> +       struct drm_crtc_state base;
> +       struct lsdc_pixpll_parms pparms;
> +};
> +
> +struct lsdc_gem {
> +       /* @mutex: protect objects list */
> +       struct mutex mutex;
> +       struct list_head objects;
> +};
> +
> +struct lsdc_device {
> +       struct drm_device base;
> +       struct ttm_device bdev;
> +
> +       /* @descp: features description of the DC variant */
> +       const struct lsdc_desc *descp;
> +       struct pci_dev *dc;
> +       struct pci_dev *gpu;
> +
> +       struct loongson_gfxpll *gfxpll;
> +
> +       /* @reglock: protects concurrent access */
> +       spinlock_t reglock;
> +
> +       void __iomem *reg_base;
> +       resource_size_t vram_base;
> +       resource_size_t vram_size;
> +
> +       resource_size_t gtt_base;
> +       resource_size_t gtt_size;
> +
> +       struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
> +
> +       struct lsdc_gem gem;
> +
> +       u32 irq_status;
> +
> +       /* tracking pinned memory */
> +       size_t vram_pinned_size;
> +       size_t gtt_pinned_size;
> +
> +       /* @num_output: count the number of active display pipe */
> +       unsigned int num_output;
> +};
> +
> +static inline struct lsdc_device *tdev_to_ldev(struct ttm_device *bdev)
> +{
> +       return container_of(bdev, struct lsdc_device, bdev);
> +}
> +
> +static inline struct lsdc_device *to_lsdc(struct drm_device *ddev)
> +{
> +       return container_of(ddev, struct lsdc_device, base);
> +}
> +
> +static inline struct lsdc_crtc_state *to_lsdc_crtc_state(struct drm_crtc=
_state *base)
> +{
> +       return container_of(base, struct lsdc_crtc_state, base);
> +}
> +
> +int ls7a1000_crtc_init(struct drm_device *ddev,
> +                      struct drm_crtc *crtc,
> +                      struct drm_plane *primary,
> +                      struct drm_plane *cursor,
> +                      unsigned int index);
> +
> +int ls7a2000_crtc_init(struct drm_device *ddev,
> +                      struct drm_crtc *crtc,
> +                      struct drm_plane *primary,
> +                      struct drm_plane *cursor,
> +                      unsigned int index);
> +
> +void lsdc_debugfs_init(struct drm_minor *minor);
> +
> +int lsdc_primary_plane_init(struct drm_device *ddev,
> +                           struct drm_plane *plane,
> +                           unsigned int index);
> +
> +int ls7a1000_cursor_plane_init(struct drm_device *ddev,
> +                              struct drm_plane *plane,
> +                              unsigned int index);
> +
> +int ls7a2000_cursor_plane_init(struct drm_device *ddev,
> +                              struct drm_plane *plane,
> +                              unsigned int index);
> +
> +/* registers access helpers */
> +
> +static inline u32 lsdc_rreg32(struct lsdc_device *ldev, u32 offset)
> +{
> +       return readl(ldev->reg_base + offset);
> +}
> +
> +static inline void lsdc_wreg32(struct lsdc_device *ldev, u32 offset, u32=
 val)
> +{
> +       writel(val, ldev->reg_base + offset);
> +}
> +
> +static inline void lsdc_ureg32_set(struct lsdc_device *ldev,
> +                                  u32 offset,
> +                                  u32 mask)
> +{
> +       void __iomem *addr =3D ldev->reg_base + offset;
> +       u32 val =3D readl(addr);
> +
> +       writel(val | mask, addr);
> +}
> +
> +static inline void lsdc_ureg32_clr(struct lsdc_device *ldev,
> +                                  u32 offset,
> +                                  u32 mask)
> +{
> +       void __iomem *addr =3D ldev->reg_base + offset;
> +       u32 val =3D readl(addr);
> +
> +       writel(val & ~mask, addr);
> +}
> +
> +static inline u32 lsdc_pipe_rreg32(struct lsdc_device *ldev,
> +                                  u32 offset,
> +                                  u32 pipe)
> +{
> +       return readl(ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
> +}
> +
> +#define lsdc_hdmi_rreg32 lsdc_pipe_rreg32
> +#define lsdc_crtc_rreg32 lsdc_pipe_rreg32
> +
> +static inline void lsdc_pipe_wreg32(struct lsdc_device *ldev,
> +                                   u32 offset,
> +                                   u32 pipe,
> +                                   u32 val)
> +{
> +       writel(val, ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET);
> +}
> +
> +#define lsdc_hdmi_wreg32 lsdc_pipe_wreg32
> +#define lsdc_crtc_wreg32 lsdc_pipe_wreg32
> +
> +static inline void lsdc_crtc_ureg32_set(struct lsdc_device *ldev,
> +                                       u32 offset,
> +                                       u32 pipe,
> +                                       u32 bit)
> +{
> +       void __iomem *addr;
> +       u32 val;
> +
> +       addr =3D ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET;
> +       val =3D readl(addr);
> +       writel(val | bit, addr);
> +}
> +
> +static inline void lsdc_crtc_ureg32_clr(struct lsdc_device *ldev,
> +                                       u32 offset,
> +                                       u32 pipe,
> +                                       u32 bit)
> +{
> +       void __iomem *addr;
> +       u32 val;
> +
> +       addr =3D ldev->reg_base + offset + pipe * CRTC_PIPE_OFFSET;
> +       val =3D readl(addr);
> +       writel(val & ~bit, addr);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongs=
on/lsdc_gem.c
> new file mode 100644
> index 000000000000..37b7577dfc46
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/dma-buf.h>
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_prime.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_gem.h"
> +#include "lsdc_ttm.h"
> +
> +static int lsdc_gem_prime_pin(struct drm_gem_object *obj)
> +{
> +       struct lsdc_bo *lbo =3D gem_to_lsdc_bo(obj);
> +       int ret;
> +
> +       ret =3D lsdc_bo_reserve(lbo);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       ret =3D lsdc_bo_pin(lbo, LSDC_GEM_DOMAIN_GTT, NULL);
> +       if (likely(ret =3D=3D 0))
> +               lbo->sharing_count++;
> +
> +       lsdc_bo_unreserve(lbo);
> +
> +       return ret;
> +}
> +
> +static void lsdc_gem_prime_unpin(struct drm_gem_object *obj)
> +{
> +       struct lsdc_bo *lbo =3D gem_to_lsdc_bo(obj);
> +       int ret;
> +
> +       ret =3D lsdc_bo_reserve(lbo);
> +       if (unlikely(ret))
> +               return;
> +
> +       lsdc_bo_unpin(lbo);
> +       if (lbo->sharing_count)
> +               lbo->sharing_count--;
> +
> +       lsdc_bo_unreserve(lbo);
> +}
> +
> +static struct sg_table *lsdc_gem_prime_get_sg_table(struct drm_gem_objec=
t *obj)
> +{
> +       struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> +       struct ttm_tt *tt =3D tbo->ttm;
> +
> +       if (!tt) {
> +               drm_err(obj->dev, "sharing a buffer without backing memor=
y\n");
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       return drm_prime_pages_to_sg(obj->dev, tt->pages, tt->num_pages);
> +}
> +
> +static void lsdc_gem_object_free(struct drm_gem_object *obj)
> +{
> +       struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> +
> +       if (tbo)
> +               ttm_bo_put(tbo);
> +}
> +
> +static int lsdc_gem_object_vmap(struct drm_gem_object *obj,
> +                               struct iosys_map *map)
> +{
> +       struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> +       struct lsdc_bo *lbo =3D to_lsdc_bo(tbo);
> +       int ret;
> +
> +       if (lbo->vmap_count > 0) {
> +               ++lbo->vmap_count;
> +               goto out;
> +       }
> +
> +       ret =3D lsdc_bo_pin(lbo, 0, NULL);
> +       if (unlikely(ret)) {
> +               drm_err(obj->dev, "pin %p for vmap failed\n", lbo);
> +               return ret;
> +       }
> +
> +       ret =3D ttm_bo_vmap(tbo, &lbo->map);
> +       if (ret) {
> +               drm_err(obj->dev, "ttm bo vmap failed\n");
> +               lsdc_bo_unpin(lbo);
> +               return ret;
> +       }
> +
> +       lbo->vmap_count =3D 1;
> +
> +out:
> +       *map =3D lbo->map;
> +
> +       return 0;
> +}
> +
> +static void lsdc_gem_object_vunmap(struct drm_gem_object *obj,
> +                                  struct iosys_map *map)
> +{
> +       struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> +       struct lsdc_bo *lbo =3D to_lsdc_bo(tbo);
> +
> +       if (unlikely(!lbo->vmap_count)) {
> +               drm_warn(obj->dev, "%p is not mapped\n", lbo);
> +               return;
> +       }
> +
> +       --lbo->vmap_count;
> +       if (lbo->vmap_count =3D=3D 0) {
> +               ttm_bo_vunmap(tbo, &lbo->map);
> +
> +               lsdc_bo_unpin(lbo);
> +       }
> +}
> +
> +static int lsdc_gem_object_mmap(struct drm_gem_object *obj,
> +                               struct vm_area_struct *vma)
> +{
> +       struct ttm_buffer_object *tbo =3D to_ttm_bo(obj);
> +       int ret;
> +
> +       ret =3D ttm_bo_mmap_obj(vma, tbo);
> +       if (unlikely(ret)) {
> +               drm_warn(obj->dev, "mmap %p failed\n", tbo);
> +               return ret;
> +       }
> +
> +       drm_gem_object_put(obj);
> +
> +       return 0;
> +}
> +
> +static const struct drm_gem_object_funcs lsdc_gem_object_funcs =3D {
> +       .free =3D lsdc_gem_object_free,
> +       .export =3D drm_gem_prime_export,
> +       .pin =3D lsdc_gem_prime_pin,
> +       .unpin =3D lsdc_gem_prime_unpin,
> +       .get_sg_table =3D lsdc_gem_prime_get_sg_table,
> +       .vmap =3D lsdc_gem_object_vmap,
> +       .vunmap =3D lsdc_gem_object_vunmap,
> +       .mmap =3D lsdc_gem_object_mmap,
> +};
> +
> +struct drm_gem_object *
> +lsdc_gem_object_create(struct drm_device *ddev,
> +                      u32 domain,
> +                      size_t size,
> +                      bool kerenl,
> +                      struct sg_table *sg,
> +                      struct dma_resv *resv)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct drm_gem_object *gobj;
> +       struct lsdc_bo *lbo;
> +       int ret;
> +
> +       lbo =3D lsdc_bo_create(ddev, domain, size, kerenl, sg, resv);
> +       if (IS_ERR(lbo)) {
> +               ret =3D PTR_ERR(lbo);
> +               return ERR_PTR(ret);
> +       }
> +
> +       gobj =3D &lbo->tbo.base;
> +       gobj->funcs =3D &lsdc_gem_object_funcs;
> +
> +       /* tracking the BOs we created */
> +       mutex_lock(&ldev->gem.mutex);
> +       list_add_tail(&lbo->list, &ldev->gem.objects);
> +       mutex_unlock(&ldev->gem.mutex);
> +
> +       return gobj;
> +}
> +
> +struct drm_gem_object *
> +lsdc_prime_import_sg_table(struct drm_device *ddev,
> +                          struct dma_buf_attachment *attach,
> +                          struct sg_table *sg)
> +{
> +       struct dma_resv *resv =3D attach->dmabuf->resv;
> +       u64 size =3D attach->dmabuf->size;
> +       struct drm_gem_object *gobj;
> +       struct lsdc_bo *lbo;
> +
> +       dma_resv_lock(resv, NULL);
> +       gobj =3D lsdc_gem_object_create(ddev, LSDC_GEM_DOMAIN_GTT, size,
> +                                     false, sg, resv);
> +       dma_resv_unlock(resv);
> +
> +       if (IS_ERR(gobj)) {
> +               drm_err(ddev, "Failed to import sg table\n");
> +               return gobj;
> +       }
> +
> +       lbo =3D gem_to_lsdc_bo(gobj);
> +       lbo->sharing_count =3D 1;
> +
> +       return gobj;
> +}
> +
> +int lsdc_dumb_create(struct drm_file *file,
> +                    struct drm_device *ddev,
> +                    struct drm_mode_create_dumb *args)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       const struct lsdc_desc *descp =3D ldev->descp;
> +       u32 domain =3D LSDC_GEM_DOMAIN_VRAM;
> +       struct drm_gem_object *gobj;
> +       size_t size;
> +       u32 pitch;
> +       u32 handle;
> +       int ret;
> +
> +       if (!args->width || !args->height)
> +               return -EINVAL;
> +
> +       /* Loongson diaplay controller only support 32-bit and 16-bit FB =
*/
> +       if (args->bpp !=3D 32 && args->bpp !=3D 16)
> +               return -EINVAL;
> +
> +       pitch =3D args->width * args->bpp / 8;
> +       pitch =3D ALIGN(pitch, descp->pitch_align);
> +       size =3D pitch * args->height;
> +       size =3D ALIGN(size, PAGE_SIZE);
> +
> +       /* Maximum bo size allowed is the half vram size available */
> +       if (size > ldev->vram_size) {
> +               drm_err(ddev, "Requesting(%zuMB) more than owned(%uMB)\n"=
,
> +                       size >> 20, (u32)(ldev->vram_size >> 20));
> +               return -ENOMEM;
> +       }
> +
> +       gobj =3D lsdc_gem_object_create(ddev,
> +                                     domain,
> +                                     size,
> +                                     false,
> +                                     NULL,
> +                                     NULL);
> +       if (IS_ERR(gobj)) {
> +               drm_err(ddev, "Failed to create gem object\n");
> +               return PTR_ERR(gobj);
> +       }
> +
> +       ret =3D drm_gem_handle_create(file, gobj, &handle);
> +
> +       /* drop reference from allocate, handle holds it now */
> +       drm_gem_object_put(gobj);
> +       if (ret)
> +               return ret;
> +
> +       args->pitch =3D pitch;
> +       args->size =3D size;
> +       args->handle =3D handle;
> +
> +       return 0;
> +}
> +
> +int lsdc_dumb_map_offset(struct drm_file *filp,
> +                        struct drm_device *ddev,
> +                        u32 handle,
> +                        uint64_t *offset)
> +{
> +       struct drm_gem_object *gobj;
> +
> +       gobj =3D drm_gem_object_lookup(filp, handle);
> +       if (!gobj)
> +               return -ENOENT;
> +
> +       *offset =3D drm_vma_node_offset_addr(&gobj->vma_node);
> +
> +       drm_gem_object_put(gobj);
> +
> +       return 0;
> +}
> +
> +void lsdc_gem_init(struct drm_device *ddev)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +
> +       mutex_init(&ldev->gem.mutex);
> +       INIT_LIST_HEAD(&ldev->gem.objects);
> +}
> +
> +int lsdc_show_buffer_object(struct seq_file *m, void *arg)
> +{
> +       struct drm_info_node *node =3D (struct drm_info_node *)m->private=
;
> +       struct drm_device *ddev =3D node->minor->dev;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct lsdc_bo *lbo;
> +       unsigned int i =3D 0;
> +
> +       mutex_lock(&ldev->gem.mutex);
> +
> +       list_for_each_entry(lbo, &ldev->gem.objects, list) {
> +               struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +               struct ttm_resource *resource =3D tbo->resource;
> +
> +               seq_printf(m, "bo[%04u][%p]: size: %8zu KB %s offset: %8l=
lx\n",
> +                          i, lbo,
> +                          lsdc_bo_size(lbo) >> 10,
> +                          lsdc_mem_type_to_str(resource->mem_type),
> +                          lsdc_bo_gpu_offset(lbo));
> +               i++;
> +       }
> +
> +       mutex_unlock(&ldev->gem.mutex);
> +
> +       seq_printf(m, "Pinned BO size: VRAM: %zu KB, GTT: %zu KB\n",
> +                  ldev->vram_pinned_size >> 10, ldev->gtt_pinned_size >>=
 10);
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongs=
on/lsdc_gem.h
> new file mode 100644
> index 000000000000..d6c0d0499e92
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_GEM_H__
> +#define __LSDC_GEM_H__
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_gem.h>
> +
> +struct drm_gem_object *
> +lsdc_prime_import_sg_table(struct drm_device *ddev,
> +                          struct dma_buf_attachment *attach,
> +                          struct sg_table *sg);
> +
> +int lsdc_dumb_map_offset(struct drm_file *file,
> +                        struct drm_device *dev,
> +                        u32 handle,
> +                        uint64_t *offset);
> +
> +int lsdc_dumb_create(struct drm_file *file,
> +                    struct drm_device *ddev,
> +                    struct drm_mode_create_dumb *args);
> +
> +void lsdc_gem_init(struct drm_device *ddev);
> +int lsdc_show_buffer_object(struct seq_file *m, void *arg);
> +
> +struct drm_gem_object *
> +lsdc_gem_object_create(struct drm_device *ddev,
> +                      u32 domain,
> +                      size_t size,
> +                      bool kerenl,
> +                      struct sg_table *sg,
> +                      struct dma_resv *resv);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.c b/drivers/gpu/drm/loo=
ngson/lsdc_gfxpll.c
> new file mode 100644
> index 000000000000..d45a03038841
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "lsdc_drv.h"
> +
> +/*
> + * GFX PLL is the PLL used by DC, GMC and GPU, the structure of the GFX =
PLL
> + * may suffer from change across chip variants.
> + *
> + *
> + *                                            +-------------+  sel_out_d=
c
> + *                                       +----| / div_out_0 | _____/ ___=
__ DC
> + *                                       |    +-------------+
> + * refclk   +---------+      +-------+   |    +-------------+  sel_out_g=
mc
> + * ---+---> | div_ref | ---> | loopc | --+--> | / div_out_1 | _____/ ___=
__ GMC
> + *    |     +---------+      +-------+   |    +-------------+
> + *    |          /               *       |    +-------------+  sel_out_g=
pu
> + *    |                                  +----| / div_out_2 | _____/ ___=
__ GPU
> + *    |                                       +-------------+
> + *    |                                                         ^
> + *    |                                                         |
> + *    +--------------------------- bypass ----------------------+
> + */
> +
> +struct loongson_gfxpll_bitmap {
> +       /* Byte 0 ~ Byte 3 */
> +       unsigned div_out_dc    : 7;  /*  6 : 0    DC output clock divider=
  */
> +       unsigned div_out_gmc   : 7;  /* 13 : 7    GMC output clock divide=
r */
> +       unsigned div_out_gpu   : 7;  /* 20 : 14   GPU output clock divide=
r */
> +       unsigned loopc         : 9;  /* 29 : 21   clock multiplier       =
  */
> +       unsigned _reserved_1_  : 2;  /* 31 : 30                          =
  */
> +
> +       /* Byte 4 ~ Byte 7 */
> +       unsigned div_ref       : 7;   /* 38 : 32   Input clock divider   =
 */
> +       unsigned locked        : 1;   /* 39        PLL locked indicator  =
 */
> +       unsigned sel_out_dc    : 1;   /* 40        dc output clk enable  =
 */
> +       unsigned sel_out_gmc   : 1;   /* 41        gmc output clk enable =
 */
> +       unsigned sel_out_gpu   : 1;   /* 42        gpu output clk enable =
 */
> +       unsigned set_param     : 1;   /* 43        Trigger the update    =
 */
> +       unsigned bypass        : 1;   /* 44                              =
 */
> +       unsigned powerdown     : 1;   /* 45                              =
 */
> +       unsigned _reserved_2_  : 18;  /* 46 : 63   no use                =
 */
> +};
> +
> +union loongson_gfxpll_reg_bitmap {
> +       struct loongson_gfxpll_bitmap bitmap;
> +       u32 w[2];
> +       u64 d;
> +};
> +
> +static void __gfxpll_rreg(struct loongson_gfxpll *this,
> +                         union loongson_gfxpll_reg_bitmap *reg)
> +{
> +#if defined(CONFIG_64BIT)
> +       reg->d =3D readq(this->mmio);
> +#else
> +       reg->w[0] =3D readl(this->mmio);
> +       reg->w[1] =3D readl(this->mmio + 4);
> +#endif
> +}
> +
> +/* Update new parameters to the hardware */
> +
> +static int loongson_gfxpll_update(struct loongson_gfxpll * const this,
> +                                 struct loongson_gfxpll_parms const *pin=
)
> +{
> +       /* None, TODO */
> +
> +       return 0;
> +}
> +
> +static void loongson_gfxpll_get_rates(struct loongson_gfxpll * const thi=
s,
> +                                     unsigned int *dc,
> +                                     unsigned int *gmc,
> +                                     unsigned int *gpu)
> +{
> +       struct loongson_gfxpll_parms *pparms =3D &this->parms;
> +       union loongson_gfxpll_reg_bitmap gfxpll_reg;
> +       unsigned int pre_output;
> +       unsigned int dc_mhz;
> +       unsigned int gmc_mhz;
> +       unsigned int gpu_mhz;
> +
> +       __gfxpll_rreg(this, &gfxpll_reg);
> +
> +       pparms->div_ref =3D gfxpll_reg.bitmap.div_ref;
> +       pparms->loopc =3D gfxpll_reg.bitmap.loopc;
> +
> +       pparms->div_out_dc =3D gfxpll_reg.bitmap.div_out_dc;
> +       pparms->div_out_gmc =3D gfxpll_reg.bitmap.div_out_gmc;
> +       pparms->div_out_gpu =3D gfxpll_reg.bitmap.div_out_gpu;
> +
> +       pre_output =3D pparms->ref_clock / pparms->div_ref * pparms->loop=
c;
> +
> +       dc_mhz =3D pre_output / pparms->div_out_dc / 1000;
> +       gmc_mhz =3D pre_output / pparms->div_out_gmc / 1000;
> +       gpu_mhz =3D pre_output / pparms->div_out_gpu / 1000;
> +
> +       if (dc)
> +               *dc =3D dc_mhz;
> +
> +       if (gmc)
> +               *gmc =3D gmc_mhz;
> +
> +       if (gpu)
> +               *gpu =3D gpu_mhz;
> +}
> +
> +static void loongson_gfxpll_print(struct loongson_gfxpll * const this,
> +                                 struct drm_printer *p,
> +                                 bool verbose)
> +{
> +       struct loongson_gfxpll_parms *parms =3D &this->parms;
> +       unsigned int dc, gmc, gpu;
> +
> +       if (verbose) {
> +               drm_printf(p, "reference clock: %u\n", parms->ref_clock);
> +               drm_printf(p, "div_ref =3D %u\n", parms->div_ref);
> +               drm_printf(p, "loopc =3D %u\n", parms->loopc);
> +
> +               drm_printf(p, "div_out_dc =3D %u\n", parms->div_out_dc);
> +               drm_printf(p, "div_out_gmc =3D %u\n", parms->div_out_gmc)=
;
> +               drm_printf(p, "div_out_gpu =3D %u\n", parms->div_out_gpu)=
;
> +       }
> +
> +       this->funcs->get_rates(this, &dc, &gmc, &gpu);
> +
> +       drm_printf(p, "dc: %uMHz, gmc: %uMHz, gpu: %uMHz\n", dc, gmc, gpu=
);
> +}
> +
> +/* GFX (DC, GPU, GMC) PLL initialization and destroy function */
> +
> +static void loongson_gfxpll_fini(struct drm_device *ddev, void *data)
> +{
> +       struct loongson_gfxpll *this =3D (struct loongson_gfxpll *)data;
> +
> +       iounmap(this->mmio);
> +
> +       kfree(this);
> +}
> +
> +static int loongson_gfxpll_init(struct loongson_gfxpll * const this)
> +{
> +       struct loongson_gfxpll_parms *pparms =3D &this->parms;
> +       struct drm_printer printer =3D drm_debug_printer("gfxpll:");
> +
> +       pparms->ref_clock =3D LSDC_PLL_REF_CLK;
> +
> +       this->mmio =3D ioremap(this->reg_base, this->reg_size);
> +       if (IS_ERR_OR_NULL(this->mmio))
> +               return -ENOMEM;
> +
> +       this->funcs->print(this, &printer, false);
> +
> +       return 0;
> +}
> +
> +static const struct loongson_gfxpll_funcs lsdc_gmc_gpu_funcs =3D {
> +       .init =3D loongson_gfxpll_init,
> +       .update =3D loongson_gfxpll_update,
> +       .get_rates =3D loongson_gfxpll_get_rates,
> +       .print =3D loongson_gfxpll_print,
> +};
> +
> +int loongson_gfxpll_create(struct drm_device *ddev,
> +                          struct loongson_gfxpll **ppout)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       const struct loongson_gfx_desc *gfx =3D to_loongson_gfx(ldev->des=
cp);
> +       struct loongson_gfxpll *this;
> +       int ret;
> +
> +       this =3D kzalloc(sizeof(*this), GFP_KERNEL);
> +       if (IS_ERR_OR_NULL(this))
> +               return -ENOMEM;
> +
> +       this->ddev =3D ddev;
> +       this->reg_size =3D gfx->gfxpll.reg_size;
> +       this->reg_base =3D gfx->conf_reg_base + gfx->gfxpll.reg_offset;
> +       this->funcs =3D &lsdc_gmc_gpu_funcs;
> +
> +       ret =3D this->funcs->init(this);
> +       if (unlikely(ret)) {
> +               kfree(this);
> +               return ret;
> +       }
> +
> +       *ppout =3D this;
> +
> +       return drmm_add_action_or_reset(ddev, loongson_gfxpll_fini, this)=
;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.h b/drivers/gpu/drm/loo=
ngson/lsdc_gfxpll.h
> new file mode 100644
> index 000000000000..b4749c2d0ef9
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_GFXPLL_H__
> +#define __LSDC_GFXPLL_H__
> +
> +#include <drm/drm_device.h>
> +
> +struct loongson_gfxpll;
> +
> +struct loongson_gfxpll_parms {
> +       unsigned int ref_clock;
> +       unsigned int div_ref;
> +       unsigned int loopc;
> +       unsigned int div_out_dc;
> +       unsigned int div_out_gmc;
> +       unsigned int div_out_gpu;
> +};
> +
> +struct loongson_gfxpll_funcs {
> +       int (*init)(struct loongson_gfxpll * const this);
> +
> +       int (*update)(struct loongson_gfxpll * const this,
> +                     struct loongson_gfxpll_parms const *pin);
> +
> +       void (*get_rates)(struct loongson_gfxpll * const this,
> +                         unsigned int *dc, unsigned int *gmc, unsigned i=
nt *gpu);
> +
> +       void (*print)(struct loongson_gfxpll * const this,
> +                     struct drm_printer *printer, bool verbose);
> +};
> +
> +struct loongson_gfxpll {
> +       struct drm_device *ddev;
> +       void __iomem *mmio;
> +
> +       /* PLL register offset */
> +       u32 reg_base;
> +       /* PLL register size in bytes */
> +       u32 reg_size;
> +
> +       const struct loongson_gfxpll_funcs *funcs;
> +
> +       struct loongson_gfxpll_parms parms;
> +};
> +
> +int loongson_gfxpll_create(struct drm_device *ddev,
> +                          struct loongson_gfxpll **ppout);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongs=
on/lsdc_i2c.c
> new file mode 100644
> index 000000000000..e8d07b30a508
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_output.h"
> +
> +/*
> + * __lsdc_gpio_i2c_set - set the state of a gpio pin indicated by mask
> + * @mask: gpio pin mask
> + * @state: "0" for low, "1" for high
> + */
> +static void __lsdc_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, =
int state)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(li2c->ddev);
> +       unsigned long flags;
> +       u8 val;
> +
> +       spin_lock_irqsave(&ldev->reglock, flags);
> +
> +       if (state) {
> +               /*
> +                * Setting this pin as input directly, write 1 for input.
> +                * The external pull-up resistor will pull the level up
> +                */
> +               val =3D readb(li2c->dir_reg);
> +               val |=3D mask;
> +               writeb(val, li2c->dir_reg);
> +       } else {
> +               /* First set this pin as output, write 0 for output */
> +               val =3D readb(li2c->dir_reg);
> +               val &=3D ~mask;
> +               writeb(val, li2c->dir_reg);
> +
> +               /* Then, make this pin output 0 */
> +               val =3D readb(li2c->dat_reg);
> +               val &=3D ~mask;
> +               writeb(val, li2c->dat_reg);
> +       }
> +
> +       spin_unlock_irqrestore(&ldev->reglock, flags);
> +}
> +
> +/*
> + * __lsdc_gpio_i2c_get - read value back from the gpio pin indicated by =
mask
> + * @mask: gpio pin mask
> + * return "0" for low, "1" for high
> + */
> +static int __lsdc_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(li2c->ddev);
> +       unsigned long flags;
> +       u8 val;
> +
> +       spin_lock_irqsave(&ldev->reglock, flags);
> +
> +       /* First set this pin as input */
> +       val =3D readb(li2c->dir_reg);
> +       val |=3D mask;
> +       writeb(val, li2c->dir_reg);
> +
> +       /* Then get level state from this pin */
> +       val =3D readb(li2c->dat_reg);
> +
> +       spin_unlock_irqrestore(&ldev->reglock, flags);
> +
> +       return (val & mask) ? 1 : 0;
> +}
> +
> +static void lsdc_gpio_i2c_set_sda(void *i2c, int state)
> +{
> +       struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +       /* set state on the li2c->sda pin */
> +       return __lsdc_gpio_i2c_set(li2c, li2c->sda, state);
> +}
> +
> +static void lsdc_gpio_i2c_set_scl(void *i2c, int state)
> +{
> +       struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +       /* set state on the li2c->scl pin */
> +       return __lsdc_gpio_i2c_set(li2c, li2c->scl, state);
> +}
> +
> +static int lsdc_gpio_i2c_get_sda(void *i2c)
> +{
> +       struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +       /* read value from the li2c->sda pin */
> +       return __lsdc_gpio_i2c_get(li2c, li2c->sda);
> +}
> +
> +static int lsdc_gpio_i2c_get_scl(void *i2c)
> +{
> +       struct lsdc_i2c * const li2c =3D (struct lsdc_i2c *)i2c;
> +       /* read the value from the li2c->scl pin */
> +       return __lsdc_gpio_i2c_get(li2c, li2c->scl);
> +}
> +
> +static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
> +{
> +       struct lsdc_i2c *li2c =3D (struct lsdc_i2c *)data;
> +
> +       if (li2c) {
> +               i2c_del_adapter(&li2c->adapter);
> +               kfree(li2c);
> +       }
> +}
> +
> +/*
> + * The DC in ls7a1000/ls7a2000/ls2k2000 has builtin gpio hardware
> + *
> + * @reg_base: gpio reg base
> + * @index: output channel index, 0 for PIPE0, 1 for PIPE1
> + */
> +int lsdc_create_i2c_chan(struct drm_device *ddev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        unsigned int index)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct i2c_adapter *adapter;
> +       struct lsdc_i2c *li2c;
> +       int ret;
> +
> +       li2c =3D kzalloc(sizeof(*li2c), GFP_KERNEL);
> +       if (!li2c)
> +               return -ENOMEM;
> +
> +       dispipe->li2c =3D li2c;
> +
> +       if (index =3D=3D 0) {
> +               li2c->sda =3D 0x01;  /* pin 0 */
> +               li2c->scl =3D 0x02;  /* pin 1 */
> +       } else if (index =3D=3D 1) {
> +               li2c->sda =3D 0x04;  /* pin 2 */
> +               li2c->scl =3D 0x08;  /* pin 3 */
> +       } else {
> +               return -ENOENT;
> +       }
> +
> +       li2c->ddev =3D ddev;
> +       li2c->dir_reg =3D ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
> +       li2c->dat_reg =3D ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
> +
> +       li2c->bit.setsda =3D lsdc_gpio_i2c_set_sda;
> +       li2c->bit.setscl =3D lsdc_gpio_i2c_set_scl;
> +       li2c->bit.getsda =3D lsdc_gpio_i2c_get_sda;
> +       li2c->bit.getscl =3D lsdc_gpio_i2c_get_scl;
> +       li2c->bit.udelay =3D 5;
> +       li2c->bit.timeout =3D usecs_to_jiffies(2200);
> +       li2c->bit.data =3D li2c;
> +
> +       adapter =3D &li2c->adapter;
> +       adapter->algo_data =3D &li2c->bit;
> +       adapter->owner =3D THIS_MODULE;
> +       adapter->class =3D I2C_CLASS_DDC;
> +       adapter->dev.parent =3D ddev->dev;
> +       adapter->nr =3D -1;
> +
> +       snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", disp=
ipe->index);
> +
> +       i2c_set_adapdata(adapter, li2c);
> +
> +       ret =3D i2c_bit_add_bus(adapter);
> +       if (ret) {
> +               kfree(li2c);
> +               return ret;
> +       }
> +
> +       ret =3D drmm_add_action_or_reset(ddev, lsdc_destroy_i2c, li2c);
> +       if (ret)
> +               return ret;
> +
> +       drm_info(ddev, "%s(sda pin mask=3D%u, scl pin mask=3D%u) created\=
n",
> +                adapter->name, li2c->sda, li2c->scl);
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h b/drivers/gpu/drm/loongs=
on/lsdc_i2c.h
> new file mode 100644
> index 000000000000..180b92fab031
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_I2C_H__
> +#define __LSDC_I2C_H__
> +
> +#include <linux/i2c.h>
> +#include <linux/i2c-algo-bit.h>
> +
> +struct lsdc_i2c {
> +       struct i2c_adapter adapter;
> +       struct i2c_algo_bit_data bit;
> +       struct drm_device *ddev;
> +       void __iomem *dir_reg;
> +       void __iomem *dat_reg;
> +       /* pin bit mask */
> +       u8 sda;
> +       u8 scl;
> +};
> +
> +struct lsdc_display_pipe;
> +
> +int lsdc_create_i2c_chan(struct drm_device *ddev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        unsigned int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongs=
on/lsdc_irq.c
> new file mode 100644
> index 000000000000..3f151beeb7d6
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_irq.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <drm/drm_vblank.h>
> +
> +#include "lsdc_irq.h"
> +
> +/*
> + * For the DC in ls7a2000, clearing interrupt status is achieved by
> + * write "1" to LSDC_INT_REG, For the DC in ls7a1000, clear interrupt
> + * status is achieved by write "0" to LSDC_INT_REG. Two different hardwa=
re
> + * engineer of Loongson modify it as their will.
The same, from ls7a1000 to ls7a2000.

> + */
> +
> +irqreturn_t ls7a2000_dc_irq_handler(int irq, void *arg)
> +{
> +       struct drm_device *ddev =3D arg;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct drm_crtc *crtc;
> +       u32 val;
> +
> +       /* Read the interrupt status */
> +       val =3D lsdc_rreg32(ldev, LSDC_INT_REG);
> +       if ((val & INT_STATUS_MASK) =3D=3D 0) {
> +               drm_warn(ddev, "no interrupt occurs\n");
> +               return IRQ_NONE;
> +       }
> +
> +       ldev->irq_status =3D val;
> +
> +       /* write "1" to clear the interrupt status */
> +       lsdc_wreg32(ldev, LSDC_INT_REG, val);
> +
> +       if (ldev->irq_status & INT_CRTC0_VSYNC) {
> +               crtc =3D drm_crtc_from_index(ddev, 0);
> +               drm_crtc_handle_vblank(crtc);
> +       }
> +
> +       if (ldev->irq_status & INT_CRTC1_VSYNC) {
> +               crtc =3D drm_crtc_from_index(ddev, 1);
> +               drm_crtc_handle_vblank(crtc);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/* For the DC in LS7A1000 and LS2K1000 */
> +irqreturn_t ls7a1000_dc_irq_handler(int irq, void *arg)
> +{
> +       struct drm_device *ddev =3D arg;
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct drm_crtc *crtc;
> +       u32 val;
> +
> +       /* Read the interrupt status */
> +       val =3D lsdc_rreg32(ldev, LSDC_INT_REG);
> +       if ((val & INT_STATUS_MASK) =3D=3D 0) {
> +               drm_warn(ddev, "no interrupt occurs\n");
> +               return IRQ_NONE;
> +       }
> +
> +       ldev->irq_status =3D val;
> +
> +       /* write "0" to clear the interrupt status */
> +       val &=3D ~(INT_CRTC0_VSYNC | INT_CRTC1_VSYNC);
> +       lsdc_wreg32(ldev, LSDC_INT_REG, val);
> +
> +       if (ldev->irq_status & INT_CRTC0_VSYNC) {
> +               crtc =3D drm_crtc_from_index(ddev, 0);
> +               drm_crtc_handle_vblank(crtc);
> +       }
> +
> +       if (ldev->irq_status & INT_CRTC1_VSYNC) {
> +               crtc =3D drm_crtc_from_index(ddev, 1);
> +               drm_crtc_handle_vblank(crtc);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_irq.h b/drivers/gpu/drm/loongs=
on/lsdc_irq.h
> new file mode 100644
> index 000000000000..cd1320252d1d
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_irq.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_IRQ_H__
> +#define __LSDC_IRQ_H__
> +
> +#include <linux/irqreturn.h>
> +
> +#include "lsdc_drv.h"
> +
> +irqreturn_t ls7a1000_dc_irq_handler(int irq, void *arg);
> +irqreturn_t ls7a2000_dc_irq_handler(int irq, void *arg);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loo=
ngson/lsdc_output.h
> new file mode 100644
> index 000000000000..a862d57957e3
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_output.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_OUTPUT_H__
> +#define __LSDC_OUTPUT_H__
> +
> +#include "lsdc_drv.h"
> +
> +int ls7a1000_output_init(struct drm_device *ddev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        struct i2c_adapter *ddc,
> +                        unsigned int index);
> +
> +int ls7a2000_output_init(struct drm_device *ldev,
> +                        struct lsdc_display_pipe *dispipe,
> +                        struct i2c_adapter *ddc,
> +                        unsigned int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.c b/drivers/gpu/drm/loo=
ngson/lsdc_pixpll.c
> new file mode 100644
> index 000000000000..61271061d32e
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_pixpll.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "lsdc_drv.h"
> +
> +/*
> + * The structure of the pixel PLL register is evolved with times,
> + * it can alse be different across different chip.
> + */
> +
> +/* size is u64, note that all loongson's cpu is little endian.
> + * This structure is same for ls7a2000, ls7a1000 and ls2k2000
> + */
> +struct lsdc_pixpll_reg {
> +       /* Byte 0 ~ Byte 3 */
> +       unsigned div_out       : 7;   /*  6 : 0     Output clock divider =
 */
> +       unsigned _reserved_1_  : 14;  /* 20 : 7                          =
 */
> +       unsigned loopc         : 9;   /* 29 : 21    Clock multiplier     =
 */
> +       unsigned _reserved_2_  : 2;   /* 31 : 30                         =
 */
> +
> +       /* Byte 4 ~ Byte 7 */
> +       unsigned div_ref       : 7;   /* 38 : 32    Input clock divider  =
 */
> +       unsigned locked        : 1;   /* 39         PLL locked indicator =
 */
> +       unsigned sel_out       : 1;   /* 40         output clk selector  =
 */
> +       unsigned _reserved_3_  : 2;   /* 42 : 41                         =
 */
> +       unsigned set_param     : 1;   /* 43         Trigger the update   =
 */
> +       unsigned bypass        : 1;   /* 44                              =
 */
> +       unsigned powerdown     : 1;   /* 45                              =
 */
> +       unsigned _reserved_4_  : 18;  /* 46 : 63    no use               =
 */
> +};
> +
> +union lsdc_pixpll_reg_bitmap {
> +       struct lsdc_pixpll_reg ls7a1000;
> +       struct lsdc_pixpll_reg ls7a2000;
> +       struct lsdc_pixpll_reg ls2k1000;
> +       struct lsdc_pixpll_reg bitmap;
> +       u32 w[2];
> +       u64 d;
> +};
> +
> +struct clk_to_pixpll_parms_lookup_t {
> +       /* kHz */
> +       unsigned int clock;
> +
> +       unsigned short width;
> +       unsigned short height;
> +       unsigned short vrefresh;
> +
> +       /* Stores parameters for programming the Hardware PLLs */
> +       unsigned short div_out;
> +       unsigned short loopc;
> +       unsigned short div_ref;
> +};
> +
> +static const struct clk_to_pixpll_parms_lookup_t pixpll_parms_table[] =
=3D {
> +       {148500, 1920, 1080, 60,  11, 49,  3},   /* 1920x1080@60Hz */
> +       {141750, 1920, 1080, 60,  11, 78,  5},   /* 1920x1080@60Hz */
> +                                                /* 1920x1080@50Hz */
> +       {174500, 1920, 1080, 75,  17, 89,  3},   /* 1920x1080@75Hz */
> +       {181250, 2560, 1080, 75,  8,  58,  4},   /* 2560x1080@75Hz */
> +       {297000, 2560, 1080, 30,  8,  95,  4},   /* 3840x2160@30Hz */
> +       {301992, 1920, 1080, 100, 10, 151, 5},   /* 1920x1080@100Hz */
> +       {146250, 1680, 1050, 60,  16, 117, 5},   /* 1680x1050@60Hz */
> +       {135000, 1280, 1024, 75,  10, 54,  4},   /* 1280x1024@75Hz */
> +       {119000, 1680, 1050, 60,  20, 119, 5},   /* 1680x1050@60Hz */
> +       {108000, 1600, 900,  60,  15, 81,  5},   /* 1600x900@60Hz  */
> +                                                /* 1280x1024@60Hz */
> +                                                /* 1280x960@60Hz */
> +                                                /* 1152x864@75Hz */
> +
> +       {106500, 1440, 900,  60,  19, 81,  4},   /* 1440x900@60Hz */
> +       {88750,  1440, 900,  60,  16, 71,  5},   /* 1440x900@60Hz */
> +       {83500,  1280, 800,  60,  17, 71,  5},   /* 1280x800@60Hz */
> +       {71000,  1280, 800,  60,  20, 71,  5},   /* 1280x800@60Hz */
> +
> +       {74250,  1280, 720,  60,  22, 49,  3},   /* 1280x720@60Hz */
> +                                                /* 1280x720@50Hz */
> +
> +       {78750,  1024, 768,  75,  16, 63,  5},   /* 1024x768@75Hz */
> +       {75000,  1024, 768,  70,  29, 87,  4},   /* 1024x768@70Hz */
> +       {65000,  1024, 768,  60,  20, 39,  3},   /* 1024x768@60Hz */
> +
> +       {51200,  1024, 600,  60,  25, 64,  5},   /* 1024x600@60Hz */
> +
> +       {57284,  832,  624,  75,  24, 55,  4},   /* 832x624@75Hz */
> +       {49500,  800,  600,  75,  40, 99,  5},   /* 800x600@75Hz */
> +       {50000,  800,  600,  72,  44, 88,  4},   /* 800x600@72Hz */
> +       {40000,  800,  600,  60,  30, 36,  3},   /* 800x600@60Hz */
> +       {36000,  800,  600,  56,  50, 72,  4},   /* 800x600@56Hz */
> +       {31500,  640,  480,  75,  40, 63,  5},   /* 640x480@75Hz */
> +                                                /* 640x480@73Hz */
> +
> +       {30240,  640,  480,  67,  62, 75,  4},   /* 640x480@67Hz */
> +       {27000,  720,  576,  50,  50, 54,  4},   /* 720x576@60Hz */
> +       {25175,  640,  480,  60,  85, 107, 5},   /* 640x480@60Hz */
> +       {25200,  640,  480,  60,  50, 63,  5},   /* 640x480@60Hz */
> +                                                /* 720x480@60Hz */
> +};
> +
> +static void lsdc_pixel_pll_free(struct drm_device *ddev, void *data)
> +{
> +       struct lsdc_pixpll *this =3D (struct lsdc_pixpll *)data;
> +
> +       iounmap(this->mmio);
> +
> +       kfree(this->priv);
> +
> +       drm_dbg(ddev, "pixpll private data freed\n");
> +}
> +
> +/*
> + * ioremap the device dependent PLL registers
> + *
> + * @this: point to the object where this function is called from
> + */
> +static int lsdc_pixel_pll_setup(struct lsdc_pixpll * const this)
> +{
> +       struct lsdc_pixpll_parms *pparms;
> +
> +       this->mmio =3D ioremap(this->reg_base, this->reg_size);
> +       if (IS_ERR_OR_NULL(this->mmio))
> +               return -ENOMEM;
> +
> +       pparms =3D kzalloc(sizeof(*pparms), GFP_KERNEL);
> +       if (IS_ERR_OR_NULL(pparms))
> +               return -ENOMEM;
> +
> +       pparms->ref_clock =3D LSDC_PLL_REF_CLK;
> +
> +       this->priv =3D pparms;
> +
> +       return drmm_add_action_or_reset(this->ddev, lsdc_pixel_pll_free, =
this);
> +}
> +
> +/*
> + * Find a set of pll parameters from a static local table which avoid
> + * computing the pll parameter eachtime a modeset is triggered.
> + *
> + * @this: point to the object where this function is called from
> + * @clock: the desired output pixel clock, the unit is kHz
> + * @pout: point to where the parameters to store if found
> + *
> + * Return 0 if success, return -1 if not found.
> + */
> +static int lsdc_pixpll_find(struct lsdc_pixpll * const this,
> +                           unsigned int clock,
> +                           struct lsdc_pixpll_parms *pout)
> +{
> +       unsigned int num =3D ARRAY_SIZE(pixpll_parms_table);
> +       const struct clk_to_pixpll_parms_lookup_t *pt;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < num; ++i) {
> +               pt =3D &pixpll_parms_table[i];
> +
> +               if (clock =3D=3D pt->clock) {
> +                       pout->div_ref =3D pt->div_ref;
> +                       pout->loopc   =3D pt->loopc;
> +                       pout->div_out =3D pt->div_out;
> +
> +                       return 0;
> +               }
> +       }
> +
> +       drm_dbg_kms(this->ddev, "pixel clock %u: miss\n", clock);
> +
> +       return -1;
> +}
> +
> +/*
> + * Find a set of pll parameters which have minimal difference with the
> + * desired pixel clock frequency. It does that by computing all of the
> + * possible combination. Compute the diff and find the combination with
> + * minimal diff.
> + *
> + * clock_out =3D refclk / div_ref * loopc / div_out
> + *
> + * refclk is determined by the oscillator mounted on motherboard(100MHz
> + * in almost all board)
> + *
> + * @this: point to the object from where this function is called
> + * @clock: the desired output pixel clock, the unit is kHz
> + * @pout: point to the out struct of lsdc_pixpll_parms
> + *
> + * Return 0 if a set of parameter is found, otherwise return the error
> + * between clock_kHz we wanted and the most closest candidate with it.
> + */
> +static int lsdc_pixel_pll_compute(struct lsdc_pixpll * const this,
> +                                 unsigned int clock,
> +                                 struct lsdc_pixpll_parms *pout)
> +{
> +       struct lsdc_pixpll_parms *pparms =3D this->priv;
> +       unsigned int refclk =3D pparms->ref_clock;
> +       const unsigned int tolerance =3D 1000;
> +       unsigned int min =3D tolerance;
> +       unsigned int div_out, loopc, div_ref;
> +       unsigned int computed;
> +
> +       if (!lsdc_pixpll_find(this, clock, pout))
> +               return 0;
> +
> +       for (div_out =3D 6; div_out < 64; div_out++) {
> +               for (div_ref =3D 3; div_ref < 6; div_ref++) {
> +                       for (loopc =3D 6; loopc < 161; loopc++) {
> +                               unsigned int diff =3D 0;
> +
> +                               if (loopc < 12 * div_ref)
> +                                       continue;
> +                               if (loopc > 32 * div_ref)
> +                                       continue;
> +
> +                               computed =3D refclk / div_ref * loopc / d=
iv_out;
> +
> +                               if (clock >=3D computed)
> +                                       diff =3D clock - computed;
> +                               else
> +                                       diff =3D computed - clock;
> +
> +                               if (diff < min) {
> +                                       min =3D diff;
> +                                       pparms->div_ref =3D div_ref;
> +                                       pparms->div_out =3D div_out;
> +                                       pparms->loopc =3D loopc;
> +
> +                                       if (diff =3D=3D 0) {
> +                                               *pout =3D *pparms;
> +                                               return 0;
> +                                       }
> +                               }
> +                       }
> +               }
> +       }
> +
> +       /* still acceptable */
> +       if (min < tolerance) {
> +               *pout =3D *pparms;
> +               return 0;
> +       }
> +
> +       drm_dbg(this->ddev, "can't find suitable params for %u khz\n", cl=
ock);
> +
> +       return min;
> +}
> +
> +/* Pixel pll hardware related ops, per display pipe */
> +
> +static void __pixpll_rreg(struct lsdc_pixpll *this,
> +                         union lsdc_pixpll_reg_bitmap *dst)
> +{
> +#if defined(CONFIG_64BIT)
> +       dst->d =3D readq(this->mmio);
> +#else
> +       dst->w[0] =3D readl(this->mmio);
> +       dst->w[1] =3D readl(this->mmio + 4);
> +#endif
> +}
> +
> +static void __pixpll_wreg(struct lsdc_pixpll *this,
> +                         union lsdc_pixpll_reg_bitmap *src)
> +{
> +#if defined(CONFIG_64BIT)
> +       writeq(src->d, this->mmio);
> +#else
> +       writel(src->w[0], this->mmio);
> +       writel(src->w[1], this->mmio + 4);
> +#endif
> +}
> +
> +static void __pixpll_ops_powerup(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.powerdown =3D 0;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_powerdown(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.powerdown =3D 1;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_on(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.sel_out =3D 1;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_off(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.sel_out =3D 0;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_bypass(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.bypass =3D 1;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_unbypass(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.bypass =3D 0;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_untoggle_param(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.set_param =3D 0;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_set_param(struct lsdc_pixpll * const this,
> +                                  struct lsdc_pixpll_parms const *p)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.div_ref =3D p->div_ref;
> +       pixpll_reg.bitmap.loopc =3D p->loopc;
> +       pixpll_reg.bitmap.div_out =3D p->div_out;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_toggle_param(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +
> +       __pixpll_rreg(this, &pixpll_reg);
> +
> +       pixpll_reg.bitmap.set_param =3D 1;
> +
> +       __pixpll_wreg(this, &pixpll_reg);
> +}
> +
> +static void __pixpll_ops_wait_locked(struct lsdc_pixpll * const this)
> +{
> +       union lsdc_pixpll_reg_bitmap pixpll_reg;
> +       unsigned int counter =3D 0;
> +
> +       do {
> +               __pixpll_rreg(this, &pixpll_reg);
> +
> +               if (pixpll_reg.bitmap.locked)
> +                       break;
> +
> +               ++counter;
> +       } while (counter < 2000);
> +
> +       drm_dbg(this->ddev, "%u loop waited\n", counter);
> +}
> +
> +/*
> + * Update the pll parameters to hardware, target to the pixpll in ls7a10=
00
> + *
> + * @this: point to the object from which this function is called
> + * @pin: point to the struct of lsdc_pixpll_parms passed in
> + *
> + * return 0 if successful.
> + */
> +static int lsdc_pixpll_update(struct lsdc_pixpll * const this,
> +                             struct lsdc_pixpll_parms const *pin)
> +{
> +       __pixpll_ops_bypass(this);
> +
> +       __pixpll_ops_off(this);
> +
> +       __pixpll_ops_powerdown(this);
> +
> +       __pixpll_ops_toggle_param(this);
> +
> +       __pixpll_ops_set_param(this, pin);
> +
> +       __pixpll_ops_untoggle_param(this);
> +
> +       __pixpll_ops_powerup(this);
> +
> +       udelay(2);
> +
> +       __pixpll_ops_wait_locked(this);
> +
> +       __pixpll_ops_on(this);
> +
> +       __pixpll_ops_unbypass(this);
> +
> +       return 0;
> +}
> +
> +static unsigned int lsdc_pixpll_get_freq(struct lsdc_pixpll * const this=
)
> +{
> +       struct lsdc_pixpll_parms *ppar =3D this->priv;
> +       union lsdc_pixpll_reg_bitmap pix_pll_reg;
> +       unsigned int freq;
> +
> +       __pixpll_rreg(this, &pix_pll_reg);
> +
> +       ppar->div_ref =3D pix_pll_reg.bitmap.div_ref;
> +       ppar->loopc =3D pix_pll_reg.bitmap.loopc;
> +       ppar->div_out =3D pix_pll_reg.bitmap.div_out;
> +
> +       freq =3D ppar->ref_clock / ppar->div_ref * ppar->loopc / ppar->di=
v_out;
> +
> +       return freq;
> +}
> +
> +static void lsdc_pixpll_print(struct lsdc_pixpll * const this,
> +                             struct drm_printer *p)
> +{
> +       struct lsdc_pixpll_parms *parms =3D this->priv;
> +
> +       drm_printf(p, "div_ref: %u, loopc: %u, div_out: %u\n",
> +                  parms->div_ref, parms->loopc, parms->div_out);
> +}
> +
> +/*
> + * LS7A1000, LS7A2000 and ls2k2000's pixel pll setting register is same,
> + * we take this as default, create a new instance if a different model i=
s
> + * introduced.
> + */
> +static const struct lsdc_pixpll_funcs default_pixpll_funcs =3D {
> +       .setup =3D lsdc_pixel_pll_setup,
> +       .compute =3D lsdc_pixel_pll_compute,
> +       .update =3D lsdc_pixpll_update,
> +       .get_rate =3D lsdc_pixpll_get_freq,
> +       .print =3D lsdc_pixpll_print,
> +};
> +
> +/* pixel pll initialization */
> +
> +int lsdc_pixpll_init(struct lsdc_pixpll * const this,
> +                    struct drm_device *ddev,
> +                    unsigned int index)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       const struct lsdc_desc *descp =3D ldev->descp;
> +       const struct loongson_gfx_desc *gfx =3D to_loongson_gfx(descp);
> +
> +       this->ddev =3D ddev;
> +       this->reg_size =3D 8;
> +       this->reg_base =3D gfx->conf_reg_base + gfx->pixpll[index].reg_of=
fset;
> +       this->funcs =3D &default_pixpll_funcs;
> +
> +       return this->funcs->setup(this);
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.h b/drivers/gpu/drm/loo=
ngson/lsdc_pixpll.h
> new file mode 100644
> index 000000000000..2f83e21d977d
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_pixpll.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_PIXPLL_H__
> +#define __LSDC_PIXPLL_H__
> +
> +#include <drm/drm_device.h>
> +
> +/*
> + * Loongson Pixel PLL hardware structure
> + *
> + * refclk: reference frequency, 100 MHz from external oscillator
> + * outclk: output frequency desired.
> + *
> + *
> + *               L1       Fref                      Fvco     L2
> + * refclk   +-----------+      +------------------+      +---------+   o=
utclk
> + * ---+---> | Prescaler | ---> | Clock Multiplier | ---> | divider | ---=
----->
> + *    |     +-----------+      +------------------+      +---------+    =
 ^
> + *    |           ^                      ^                    ^         =
 |
> + *    |           |                      |                    |         =
 |
> + *    |           |                      |                    |         =
 |
> + *    |        div_ref                 loopc               div_out      =
 |
> + *    |                                                                 =
 |
> + *    +---- bypass (bypass above software configurable clock if set) ---=
-+
> + *
> + *   outclk =3D refclk / div_ref * loopc / div_out;
> + *
> + *   sel_out: PLL clock output selector(enable).
> + *
> + *   If sel_out =3D=3D 1, then enable output clock (turn On);
> + *   If sel_out =3D=3D 0, then disable output clock (turn Off);
> + *
> + * PLL working requirements:
> + *
> + *  1) 20 MHz <=3D refclk / div_ref <=3D 40Mhz
> + *  2) 1.2 GHz <=3D refclk /div_out * loopc <=3D 3.2 Ghz
> + */
> +
> +struct lsdc_pixpll_parms {
> +       unsigned int ref_clock;
> +       unsigned int div_ref;
> +       unsigned int loopc;
> +       unsigned int div_out;
> +};
> +
> +struct lsdc_pixpll;
> +
> +struct lsdc_pixpll_funcs {
> +       int (*setup)(struct lsdc_pixpll * const this);
> +
> +       int (*compute)(struct lsdc_pixpll * const this,
> +                      unsigned int clock,
> +                      struct lsdc_pixpll_parms *pout);
> +
> +       int (*update)(struct lsdc_pixpll * const this,
> +                     struct lsdc_pixpll_parms const *pin);
> +
> +       unsigned int (*get_rate)(struct lsdc_pixpll * const this);
> +
> +       void (*print)(struct lsdc_pixpll * const this,
> +                     struct drm_printer *printer);
> +};
> +
> +struct lsdc_pixpll {
> +       const struct lsdc_pixpll_funcs *funcs;
> +
> +       struct drm_device *ddev;
> +
> +       /* PLL register offset */
> +       u32 reg_base;
> +       /* PLL register size in bytes */
> +       u32 reg_size;
> +
> +       void __iomem *mmio;
> +
> +       struct lsdc_pixpll_parms *priv;
> +};
> +
> +int lsdc_pixpll_init(struct lsdc_pixpll * const this,
> +                    struct drm_device *ddev,
> +                    unsigned int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loon=
gson/lsdc_plane.c
> new file mode 100644
> index 000000000000..4a18babe3736
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_plane.c
> @@ -0,0 +1,639 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_ttm.h"
> +
> +static const u32 lsdc_primary_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +};
> +
> +static const u32 lsdc_cursor_formats[] =3D {
> +       DRM_FORMAT_ARGB8888,
> +};
> +
> +static const u64 lsdc_fb_format_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
> +                                      struct drm_plane_state *state)
> +{
> +       unsigned int offset =3D fb->offsets[0];
> +
> +       offset +=3D fb->format->cpp[0] * (state->src_x >> 16);
> +       offset +=3D fb->pitches[0] * (state->src_y >> 16);
> +
> +       return offset;
> +}
> +
> +static u64 lsdc_fb_dma_base_addr(struct drm_framebuffer *fb)
> +{
> +       struct lsdc_bo *lbo =3D gem_to_lsdc_bo(fb->obj[0]);
> +       struct lsdc_device *ldev =3D to_lsdc(fb->dev);
> +
> +       return lsdc_bo_gpu_offset(lbo) + ldev->vram_base;
> +}
> +
> +static int lsdc_primary_atomic_check(struct drm_plane *plane,
> +                                    struct drm_atomic_state *state)
> +{
> +       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state, plane);
> +       struct drm_crtc *crtc =3D new_plane_state->crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +
> +       if (!crtc)
> +               return 0;
> +
> +       new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +
> +       return drm_atomic_helper_check_plane_state(new_plane_state,
> +                                                  new_crtc_state,
> +                                                  DRM_PLANE_NO_SCALING,
> +                                                  DRM_PLANE_NO_SCALING,
> +                                                  false,
> +                                                  true);
> +}
> +
> +static void lsdc_primary_atomic_update(struct drm_plane *plane,
> +                                      struct drm_atomic_state *state)
> +{
> +       struct lsdc_primary *primary =3D to_lsdc_primary(plane);
> +       struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_pl=
ane_state(state, plane);
> +       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state, plane);
> +       struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> +       struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +       const struct lsdc_primary_plane_ops *hw_ops =3D primary->ops;
> +       u64 fb_addr;
> +
> +       fb_addr =3D lsdc_fb_dma_base_addr(new_fb);
> +       fb_addr +=3D lsdc_get_fb_offset(new_fb, new_plane_state);
> +
> +       drm_dbg(plane->dev, "fb dma addr: %llx\n", fb_addr);
> +
> +       hw_ops->update_fb_addr(primary, fb_addr);
> +       hw_ops->update_fb_stride(primary, new_fb->pitches[0]);
> +
> +       if (!old_fb || old_fb->format !=3D new_fb->format)
> +               hw_ops->update_fb_format(primary, new_fb->format);
> +}
> +
> +static void lsdc_primary_atomic_disable(struct drm_plane *plane,
> +                                       struct drm_atomic_state *state)
> +{
> +       /* Do nothing, just prevent call into atomic_update().
> +        * Writing the format as LSDC_PF_NONE can disable the primary,
> +        * But it seems not necessary...
> +        */
> +       drm_dbg(plane->dev, "%s disabled\n", plane->name);
> +}
> +
> +static int lsdc_plane_prepare_fb(struct drm_plane *plane,
> +                                struct drm_plane_state *new_state)
> +{
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +       struct lsdc_bo *lbo;
> +       u64 gpu_vaddr;
> +       int ret;
> +
> +       if (!fb)
> +               return 0;
> +
> +       lbo =3D gem_to_lsdc_bo(fb->obj[0]);
> +
> +       ret =3D lsdc_bo_reserve(lbo);
> +       if (unlikely(ret)) {
> +               drm_err(plane->dev, "bo %p reserve failed\n", lbo);
> +               return ret;
> +       }
> +
> +       ret =3D lsdc_bo_pin(lbo, LSDC_GEM_DOMAIN_VRAM, &gpu_vaddr);
> +
> +       lsdc_bo_unreserve(lbo);
> +
> +       if (unlikely(ret)) {
> +               drm_err(plane->dev, "bo %p pin failed\n", lbo);
> +               return ret;
> +       }
> +
> +       lsdc_bo_ref(lbo);
> +
> +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +               drm_dbg(plane->dev, "%s[%p] pin at 0x%llx, bo size: %zu\n=
",
> +                       plane->name, lbo, gpu_vaddr, lsdc_bo_size(lbo));
> +
> +       return drm_gem_plane_helper_prepare_fb(plane, new_state);
> +}
> +
> +static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
> +                                 struct drm_plane_state *old_state)
> +{
> +       struct drm_framebuffer *fb =3D old_state->fb;
> +       struct lsdc_bo *lbo;
> +       int ret;
> +
> +       if (!fb)
> +               return;
> +
> +       lbo =3D gem_to_lsdc_bo(fb->obj[0]);
> +
> +       ret =3D lsdc_bo_reserve(lbo);
> +       if (unlikely(ret)) {
> +               drm_err(plane->dev, "%p reserve failed\n", lbo);
> +               return;
> +       }
> +
> +       lsdc_bo_unpin(lbo);
> +
> +       lsdc_bo_unreserve(lbo);
> +
> +       lsdc_bo_unref(lbo);
> +
> +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +               drm_dbg(plane->dev, "%s unpin\n", plane->name);
> +}
> +
> +static const struct drm_plane_helper_funcs lsdc_primary_helper_funcs =3D=
 {
> +       .prepare_fb =3D lsdc_plane_prepare_fb,
> +       .cleanup_fb =3D lsdc_plane_cleanup_fb,
> +       .atomic_check =3D lsdc_primary_atomic_check,
> +       .atomic_update =3D lsdc_primary_atomic_update,
> +       .atomic_disable =3D lsdc_primary_atomic_disable,
> +};
> +
> +static int lsdc_cursor_atomic_check(struct drm_plane *plane,
> +                                   struct drm_atomic_state *state)
> +{
> +       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state, plane);
> +       struct drm_crtc *crtc =3D new_plane_state->crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +
> +       if (!crtc)
> +               return 0;
> +
> +       new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +
> +       return drm_atomic_helper_check_plane_state(new_plane_state,
> +                                                  new_crtc_state,
> +                                                  DRM_PLANE_NO_SCALING,
> +                                                  DRM_PLANE_NO_SCALING,
> +                                                  true,
> +                                                  true);
> +}
> +
> +static void ls7a1000_cursor_atomic_update(struct drm_plane *plane,
> +                                         struct drm_atomic_state *state)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +       struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_pl=
ane_state(state, plane);
> +       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state, plane);
> +       struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> +       struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +       const struct lsdc_cursor_plane_ops *hw_ops =3D cursor->ops;
> +       u64 addr =3D lsdc_fb_dma_base_addr(new_fb);
> +
> +       hw_ops->update_position(cursor, new_plane_state->crtc_x, new_plan=
e_state->crtc_y);
> +
> +       if (!old_fb || new_fb !=3D old_fb)
> +               hw_ops->update_bo_addr(cursor, addr);
> +
> +       hw_ops->update_cfg(cursor, CURSOR_SIZE_32X32, CURSOR_FORMAT_ARGB8=
888);
> +}
> +
> +static void ls7a1000_cursor_atomic_disable(struct drm_plane *plane,
> +                                          struct drm_atomic_state *state=
)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +       const struct lsdc_cursor_plane_ops *hw_ops =3D cursor->ops;
> +
> +       hw_ops->update_cfg(cursor, CURSOR_SIZE_32X32, CURSOR_FORMAT_DISAB=
LE);
> +}
> +
> +static const struct drm_plane_helper_funcs ls7a1000_cursor_helper_funcs =
=3D {
> +       .prepare_fb =3D lsdc_plane_prepare_fb,
> +       .cleanup_fb =3D lsdc_plane_cleanup_fb,
> +       .atomic_check =3D lsdc_cursor_atomic_check,
> +       .atomic_update =3D ls7a1000_cursor_atomic_update,
> +       .atomic_disable =3D ls7a1000_cursor_atomic_disable,
> +};
> +
> +/* update the format, size and location of the cursor */
> +static void ls7a2000_cursor_atomic_update(struct drm_plane *plane,
> +                                         struct drm_atomic_state *state)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +       struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_pl=
ane_state(state, plane);
> +       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state, plane);
> +       struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> +       struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +       const struct lsdc_cursor_plane_ops *hw_ops =3D cursor->ops;
> +       u64 addr =3D lsdc_fb_dma_base_addr(new_fb);
> +
> +       hw_ops->update_position(cursor, new_plane_state->crtc_x, new_plan=
e_state->crtc_y);
> +
> +       if (!old_fb || new_fb !=3D old_fb)
> +               hw_ops->update_bo_addr(cursor, addr);
> +
> +       hw_ops->update_cfg(cursor, CURSOR_SIZE_64X64, CURSOR_FORMAT_ARGB8=
888);
> +}
> +
> +static void ls7a2000_cursor_atomic_disable(struct drm_plane *plane,
> +                                          struct drm_atomic_state *state=
)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +       const struct lsdc_cursor_plane_ops *hw_ops =3D cursor->ops;
> +
> +       hw_ops->update_cfg(cursor, CURSOR_SIZE_64X64, CURSOR_FORMAT_DISAB=
LE);
> +}
> +
> +static const struct drm_plane_helper_funcs ls7a2000_cursor_helper_funcs =
=3D {
> +       .prepare_fb =3D lsdc_plane_prepare_fb,
> +       .cleanup_fb =3D lsdc_plane_cleanup_fb,
> +       .atomic_check =3D lsdc_cursor_atomic_check,
> +       .atomic_update =3D ls7a2000_cursor_atomic_update,
> +       .atomic_disable =3D ls7a2000_cursor_atomic_disable,
> +};
> +
> +static void lsdc_plane_atomic_print_state(struct drm_printer *p,
> +                                         const struct drm_plane_state *s=
tate)
> +{
> +       struct drm_framebuffer *fb =3D state->fb;
> +       u64 addr;
> +
> +       if (!fb)
> +               return;
> +
> +       addr =3D lsdc_fb_dma_base_addr(fb);
> +
> +       drm_printf(p, "\tdma addr=3D%llx\n", addr);
> +}
> +
> +static const struct drm_plane_funcs lsdc_plane_funcs =3D {
> +       .update_plane =3D drm_atomic_helper_update_plane,
> +       .disable_plane =3D drm_atomic_helper_disable_plane,
> +       .destroy =3D drm_plane_cleanup,
> +       .reset =3D drm_atomic_helper_plane_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
> +       .atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> +       .atomic_print_state =3D lsdc_plane_atomic_print_state,
> +};
> +
> +/* primary plane hardware related ops, for primary plane 0 */
> +
> +static void lsdc_primary0_update_fb_addr(struct lsdc_primary *primary, u=
64 fb_addr)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +       u32 status;
> +       u32 lo, hi;
> +
> +       /* 40-bit width physical address bus */
> +       lo =3D fb_addr & 0xFFFFFFFF;
> +       hi =3D (fb_addr >> 32) & 0xFF;
> +
> +       status =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +       if (status & FB_REG_IN_USING) {
> +               lsdc_wreg32(ldev, LSDC_CRTC0_FB1_ADDR_LO_REG, lo);
> +               lsdc_wreg32(ldev, LSDC_CRTC0_FB1_ADDR_HI_REG, hi);
> +       } else {
> +               lsdc_wreg32(ldev, LSDC_CRTC0_FB0_ADDR_LO_REG, lo);
> +               lsdc_wreg32(ldev, LSDC_CRTC0_FB0_ADDR_HI_REG, hi);
> +       }
> +}
> +
> +static void lsdc_primary0_update_fb_stride(struct lsdc_primary *primary,=
 u32 stride)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
> +}
> +
> +static void lsdc_primary0_update_fb_format(struct lsdc_primary *primary,
> +                                          const struct drm_format_info *=
format)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +       u32 status;
> +
> +       status =3D lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +       /*
> +        * TODO: add RGB565 support, only support XRBG8888 currently
> +        */
> +       status &=3D ~CFG_PIX_FMT_MASK;
> +       status |=3D LSDC_PF_XRGB8888;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, status);
> +
> +       udelay(9);
> +}
> +
> +/* primary plane hardware related ops, for primary plane 1 */
> +
> +static void lsdc_primary1_update_fb_addr(struct lsdc_primary *primary, u=
64 fb_addr)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +       u32 status;
> +       u32 lo, hi;
> +
> +       /* 40-bit width physical address bus */
> +       lo =3D fb_addr & 0xFFFFFFFF;
> +       hi =3D (fb_addr >> 32) & 0xFF;
> +
> +       status =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +       if (status & FB_REG_IN_USING) {
> +               lsdc_wreg32(ldev, LSDC_CRTC1_FB1_ADDR_LO_REG, lo);
> +               lsdc_wreg32(ldev, LSDC_CRTC1_FB1_ADDR_HI_REG, hi);
> +       } else {
> +               lsdc_wreg32(ldev, LSDC_CRTC1_FB0_ADDR_LO_REG, lo);
> +               lsdc_wreg32(ldev, LSDC_CRTC1_FB0_ADDR_HI_REG, hi);
> +       }
> +}
> +
> +static void lsdc_primary1_update_fb_stride(struct lsdc_primary *primary,=
 u32 stride)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
> +}
> +
> +static void lsdc_primary1_update_fb_format(struct lsdc_primary *primary,
> +                                          const struct drm_format_info *=
format)
> +{
> +       struct lsdc_device *ldev =3D primary->ldev;
> +       u32 status;
> +
> +       status =3D lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +       /*
> +        * Only support XRBG8888 currently,
> +        * TODO: add RGB565 support
> +        */
> +       status &=3D ~CFG_PIX_FMT_MASK;
> +       status |=3D LSDC_PF_XRGB8888;
> +
> +       lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, status);
> +
> +       udelay(9);
> +}
> +
> +static const struct lsdc_primary_plane_ops primary_hw_ops[2] =3D {
> +       {
> +               .update_fb_addr =3D lsdc_primary0_update_fb_addr,
> +               .update_fb_stride =3D lsdc_primary0_update_fb_stride,
> +               .update_fb_format =3D lsdc_primary0_update_fb_format,
> +       },
> +       {
> +               .update_fb_addr =3D lsdc_primary1_update_fb_addr,
> +               .update_fb_stride =3D lsdc_primary1_update_fb_stride,
> +               .update_fb_format =3D lsdc_primary1_update_fb_format,
> +       },
> +};
> +
> +/*
> + * Update location, format, enable and disable state of the cursor,
> + * For those who have two hardware cursor, cursor 0 is attach it to CRTC=
-0,
> + * cursor 1 is attached to CRTC-1. Compositing the primary and cursor pl=
ane
> + * is automatically done by hardware, the cursor is alway on the top of =
the
> + * primary. In other word, z-order is fixed in hardware and cannot be ch=
anged.
> + * For those old DC who has only one hardware cursor, we made it shared =
by
> + * the two screen, this works on extend screen mode.
> + */
> +
> +/* cursor plane related hardware ops, for cursor plane 0 */
> +
> +static void lsdc_cursor0_update_bo_addr(struct lsdc_cursor *cursor, u64 =
addr)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       /* 40-bit width physical address bus */
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (addr >> 32) & 0xFF);
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, addr);
> +}
> +
> +static void lsdc_cursor0_update_position(struct lsdc_cursor *cursor, int=
 x, int y)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       if (x < 0)
> +               x =3D 0;
> +
> +       if (y < 0)
> +               y =3D 0;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
> +}
> +
> +static void lsdc_cursor0_update_cfg(struct lsdc_cursor *cursor,
> +                                   enum lsdc_cursor_size cursor_size,
> +                                   enum lsdc_cursor_format fmt)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +       u32 cfg;
> +
> +       cfg =3D CURSOR_ON_CRTC0 << CURSOR_LOCATION_SHIFT |
> +             cursor_size << CURSOR_SIZE_SHIFT |
> +             fmt << CURSOR_FORMAT_SHIFT;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg);
> +}
> +
> +/* cursor plane related hardware ops, for cursor plane 1 */
> +
> +static void lsdc_cursor1_update_bo_addr(struct lsdc_cursor *cursor, u64 =
addr)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       /* 40-bit width physical address bus */
> +       lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG, (addr >> 32) & 0xFF);
> +       lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG, addr);
> +}
> +
> +static void lsdc_cursor1_update_position(struct lsdc_cursor *cursor, int=
 x, int y)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       if (x < 0)
> +               x =3D 0;
> +
> +       if (y < 0)
> +               y =3D 0;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y << 16) | x);
> +}
> +
> +static void lsdc_cursor1_update_cfg(struct lsdc_cursor *cursor,
> +                                   enum lsdc_cursor_size cursor_size,
> +                                   enum lsdc_cursor_format fmt)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +       u32 cfg;
> +
> +       cfg =3D CURSOR_ON_CRTC1 << CURSOR_LOCATION_SHIFT |
> +             cursor_size << CURSOR_SIZE_SHIFT |
> +             fmt << CURSOR_FORMAT_SHIFT;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, cfg);
> +}
> +
> +static const struct lsdc_cursor_plane_ops ls7a2000_cursor_hw_ops[2] =3D =
{
> +       {
> +               .update_bo_addr =3D lsdc_cursor0_update_bo_addr,
> +               .update_cfg =3D lsdc_cursor0_update_cfg,
> +               .update_position =3D lsdc_cursor0_update_position,
> +       },
> +       {
> +               .update_bo_addr =3D lsdc_cursor1_update_bo_addr,
> +               .update_cfg =3D lsdc_cursor1_update_cfg,
> +               .update_position =3D lsdc_cursor1_update_position,
> +       },
> +};
> +
> +/* quirks for cursor 1, only for old loongson display controller device =
*/
> +
> +static void lsdc_cursor1_update_bo_addr_quirk(struct lsdc_cursor *cursor=
, u64 addr)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       /* 40-bit width physical address bus */
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (addr >> 32) & 0xFF);
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, addr);
> +}
> +
> +static void lsdc_cursor1_update_position_quirk(struct lsdc_cursor *curso=
r, int x, int y)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +
> +       if (x < 0)
> +               x =3D 0;
> +
> +       if (y < 0)
> +               y =3D 0;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
> +}
> +
> +static void lsdc_cursor1_update_cfg_quirk(struct lsdc_cursor *cursor,
> +                                         enum lsdc_cursor_size cursor_si=
ze,
> +                                         enum lsdc_cursor_format fmt)
> +{
> +       struct lsdc_device *ldev =3D cursor->ldev;
> +       u32 cfg;
> +
> +       cfg =3D CURSOR_ON_CRTC1 << CURSOR_LOCATION_SHIFT |
> +             cursor_size << CURSOR_SIZE_SHIFT |
> +             fmt << CURSOR_FORMAT_SHIFT;
> +
> +       lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, cfg);
> +}
> +
> +static const struct lsdc_cursor_plane_ops ls7a1000_cursor_hw_ops[2] =3D =
{
> +       {
> +               .update_bo_addr =3D lsdc_cursor0_update_bo_addr,
> +               .update_cfg =3D lsdc_cursor0_update_cfg,
> +               .update_position =3D lsdc_cursor0_update_position,
> +       },
> +       {
> +               .update_bo_addr =3D lsdc_cursor1_update_bo_addr_quirk,
> +               .update_cfg =3D lsdc_cursor1_update_cfg_quirk,
> +               .update_position =3D lsdc_cursor1_update_position_quirk,
> +       },
> +};
> +
> +int lsdc_primary_plane_init(struct drm_device *ddev,
> +                           struct drm_plane *plane,
> +                           unsigned int index)
> +{
> +       struct lsdc_primary *primary =3D to_lsdc_primary(plane);
> +       int ret;
> +
> +       ret =3D drm_universal_plane_init(ddev,
> +                                      plane,
> +                                      1 << index,
> +                                      &lsdc_plane_funcs,
> +                                      lsdc_primary_formats,
> +                                      ARRAY_SIZE(lsdc_primary_formats),
> +                                      lsdc_fb_format_modifiers,
> +                                      DRM_PLANE_TYPE_PRIMARY,
> +                                      "primary-%u",
> +                                      index);
> +       if (ret)
> +               return ret;
> +
> +       drm_plane_helper_add(plane, &lsdc_primary_helper_funcs);
> +
> +       primary->ldev =3D to_lsdc(ddev);
> +       primary->ops =3D &primary_hw_ops[index];
> +
> +       return 0;
> +}
> +
> +int ls7a1000_cursor_plane_init(struct drm_device *ddev,
> +                              struct drm_plane *plane,
> +                              unsigned int index)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +
> +       int ret;
> +
> +       ret =3D drm_universal_plane_init(ddev,
> +                                      plane,
> +                                      1 << index,
> +                                      &lsdc_plane_funcs,
> +                                      lsdc_cursor_formats,
> +                                      ARRAY_SIZE(lsdc_cursor_formats),
> +                                      lsdc_fb_format_modifiers,
> +                                      DRM_PLANE_TYPE_CURSOR,
> +                                      "cursor-%u",
> +                                      index);
> +       if (ret)
> +               return ret;
> +
> +       cursor->ldev =3D to_lsdc(ddev);
> +       cursor->ops =3D &ls7a1000_cursor_hw_ops[index];
> +
> +       drm_plane_helper_add(plane, &ls7a1000_cursor_helper_funcs);
> +
> +       return 0;
> +}
> +
> +/* The hardware cursors become normal since ls7a2000(including ls2k2000)=
 */
> +
> +int ls7a2000_cursor_plane_init(struct drm_device *ddev,
> +                              struct drm_plane *plane,
> +                              unsigned int index)
> +{
> +       struct lsdc_cursor *cursor =3D to_lsdc_cursor(plane);
> +
> +       int ret;
> +
> +       ret =3D drm_universal_plane_init(ddev,
> +                                      plane,
> +                                      1 << index,
> +                                      &lsdc_plane_funcs,
> +                                      lsdc_cursor_formats,
> +                                      ARRAY_SIZE(lsdc_cursor_formats),
> +                                      lsdc_fb_format_modifiers,
> +                                      DRM_PLANE_TYPE_CURSOR,
> +                                      "cursor-%u",
> +                                      index);
> +       if (ret)
> +               return ret;
> +
> +       cursor->ldev =3D to_lsdc(ddev);
> +       cursor->ops =3D &ls7a2000_cursor_hw_ops[index];
> +
> +       drm_plane_helper_add(plane, &ls7a2000_cursor_helper_funcs);
> +
> +       return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c b/drivers/gpu/drm/loon=
gson/lsdc_probe.c
> new file mode 100644
> index 000000000000..06fc2a63110b
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_probe.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_probe.h"
> +
> +/*
> + * Processor ID (implementation) values for bits 15:8 of the PRID regist=
er.
> + */
> +#define LOONGSON_CPU_IMP_MASK           0xff00
> +#define LOONGSON_CPU_IMP_SHIFT          8
> +
> +#define LOONGARCH_CPU_IMP_LS2K1000      0xa0
> +#define LOONGARCH_CPU_IMP_LS2K2000      0xb0
> +#define LOONGARCH_CPU_IMP_LS3A5000      0xc0
> +
> +#define LOONGSON_CPU_MIPS_IMP_LS2K      0x61 /* Loongson 2K Mips series =
SoC */
> +
> +/*
> + * Particular Revision values for bits 7:0 of the PRID register.
> + */
> +#define LOONGSON_CPU_REV_MASK           0x00ff
> +
> +#define LOONGARCH_CPUCFG_PRID_REG       0x0
> +
> +/*
> + * We can achieve fine control with the information about the host.
> + */
> +
> +unsigned int loongson_cpu_get_prid(u8 *imp, u8 *rev)
> +{
> +       unsigned int prid =3D 0;
> +
> +#if defined(__loongarch__)
> +       __asm__ volatile("cpucfg %0, %1\n\t"
> +                       : "=3D&r"(prid)
> +                       : "r"(LOONGARCH_CPUCFG_PRID_REG)
> +                       );
> +#endif
> +
> +#if defined(__mips__)
> +       __asm__ volatile("mfc0\t%0, $15\n\t"
> +                       : "=3Dr" (prid)
> +                       );
> +#endif
> +
> +       if (imp)
> +               *imp =3D (prid & LOONGSON_CPU_IMP_MASK) >> LOONGSON_CPU_I=
MP_SHIFT;
> +
> +       if (rev)
> +               *rev =3D prid & LOONGSON_CPU_REV_MASK;
> +
> +       return prid;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h b/drivers/gpu/drm/loon=
gson/lsdc_probe.h
> new file mode 100644
> index 000000000000..68ae93f90b67
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_probe.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_PROBE_H__
> +#define __LSDC_PROBE_H__
> +
> +/* Helpers for chip detection */
> +unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_regs.h b/drivers/gpu/drm/loong=
son/lsdc_regs.h
> new file mode 100644
> index 000000000000..4ae8fd7b0add
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_regs.h
> @@ -0,0 +1,400 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_REGS_H__
> +#define __LSDC_REGS_H__
> +
> +#include <linux/bitops.h>
> +#include <linux/types.h>
> +
> +/*
> + * PIXEL PLL Reference clock
> + */
> +#define LSDC_PLL_REF_CLK                100000           /* kHz */
> +
> +/*
> + * Those PLL registers are relative to LSxxxxx_CFG_REG_BASE. xxxxx =3D 7=
A1000,
> + * 7A2000, 2K2000, 2K1000 etc.
> + */
> +
> +/* LS7A1000 */
> +
> +#define LS7A1000_PIXPLL0_REG            0x04B0
> +#define LS7A1000_PIXPLL1_REG            0x04C0
> +
> +/* The DC, GPU, Graphic Memory Controller share the single gfxpll */
> +#define LS7A1000_PLL_GFX_REG            0x0490
> +
> +#define LS7A1000_CONF_REG_BASE          0x10010000
> +
> +/* LS7A2000 */
> +
> +#define LS7A2000_PIXPLL0_REG            0x04B0
> +#define LS7A2000_PIXPLL1_REG            0x04C0
> +
> +/* The DC, GPU, Graphic Memory Controller share the single gfxpll */
> +#define LS7A2000_PLL_GFX_REG            0x0490
> +
> +#define LS7A2000_CONF_REG_BASE          0x10010000
> +
> +/* For LSDC_CRTCx_CFG_REG */
> +#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
> +
> +enum lsdc_pixel_format {
> +       LSDC_PF_NONE =3D 0,
> +       LSDC_PF_XRGB444 =3D 1,    /* [12 bits] */
> +       LSDC_PF_XRGB555 =3D 2,    /* [15 bits] */
> +       LSDC_PF_XRGB565 =3D 3,    /* RGB [16 bits] */
> +       LSDC_PF_XRGB8888 =3D 4,   /* XRGB [32 bits] */
> +};
> +
> +/*
> + * Each crtc has two set fb address registers usable, FB_REG_IN_USING bi=
t of
> + * LSDC_CRTCx_CFG_REG indicate which fb address register is in using by =
the
> + * CRTC currently. CFG_PAGE_FLIP is used to trigger the switch, the swit=
ching
> + * will be finished at the very next vblank. Trigger it again if you wan=
t to
> + * switch back.
> + *
> + * If FB0_ADDR_REG is in using, we write the address to FB0_ADDR_REG,
> + * if FB1_ADDR_REG is in using, we write the address to FB1_ADDR_REG.
> + */
> +#define CFG_PAGE_FLIP                   BIT(7)
> +#define CFG_OUTPUT_ENABLE               BIT(8)
> +#define CFG_HW_CLONE                    BIT(9)
> +/* Indicate witch fb addr reg is in using, currently. read only */
> +#define FB_REG_IN_USING                 BIT(11)
> +#define CFG_GAMMA_EN                    BIT(12)
> +
> +/* The DC get soft reset if this bit changed from "1" to "0", active low=
 */
> +#define CFG_RESET_N                     BIT(20)
> +
> +/*
> + * The DMA step of the DC in LS7A2000/LS2K2000 is configurable,
> + * setting those bits on ls7a1000 platform make no effect.
> + */
> +#define CFG_DMA_STEP_MASK              GENMASK(17, 16)
> +#define CFG_DMA_STEP_SHIFT             16
> +enum lsdc_dma_steps {
> +       LSDC_DMA_STEP_256_BYTES =3D 0,
> +       LSDC_DMA_STEP_128_BYTES =3D 1,
> +       LSDC_DMA_STEP_64_BYTES =3D 2,
> +       LSDC_DMA_STEP_32_BYTES =3D 3,
> +};
> +
> +#define CFG_VALID_BITS_MASK             GENMASK(20, 0)
> +
> +/* For LSDC_CRTCx_PANEL_CONF_REG */
> +#define PHY_CLOCK_POL                   BIT(9)
> +#define PHY_CLOCK_EN                    BIT(8)
> +#define PHY_DE_POL                      BIT(1)
> +#define PHY_DATA_EN                     BIT(0)
> +
> +/* For LSDC_CRTCx_HSYNC_REG */
> +#define HSYNC_INV                       BIT(31)
> +#define HSYNC_EN                        BIT(30)
> +#define HSYNC_END_MASK                  GENMASK(28, 16)
> +#define HSYNC_END_SHIFT                 16
> +#define HSYNC_START_MASK                GENMASK(12, 0)
> +#define HSYNC_START_SHIFT               0
> +
> +/* For LSDC_CRTCx_VSYNC_REG */
> +#define VSYNC_INV                       BIT(31)
> +#define VSYNC_EN                        BIT(30)
> +#define VSYNC_END_MASK                  GENMASK(27, 16)
> +#define VSYNC_END_SHIFT                 16
> +#define VSYNC_START_MASK                GENMASK(11, 0)
> +#define VSYNC_START_SHIFT               0
> +
> +/*********** CRTC0 & DISPLAY PIPE0 ***********/
> +#define LSDC_CRTC0_CFG_REG              0x1240
> +#define LSDC_CRTC0_FB0_ADDR_LO_REG      0x1260
> +#define LSDC_CRTC0_FB0_ADDR_HI_REG      0x15A0
> +#define LSDC_CRTC0_STRIDE_REG           0x1280
> +#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
> +#define LSDC_CRTC0_PANEL_CONF_REG       0x13C0
> +#define LSDC_CRTC0_HDISPLAY_REG         0x1400
> +#define LSDC_CRTC0_HSYNC_REG            0x1420
> +#define LSDC_CRTC0_VDISPLAY_REG         0x1480
> +#define LSDC_CRTC0_VSYNC_REG            0x14A0
> +#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
> +#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
> +#define LSDC_CRTC0_FB1_ADDR_LO_REG      0x1580
> +#define LSDC_CRTC0_FB1_ADDR_HI_REG      0x15C0
> +
> +/*********** CTRC1 & DISPLAY PIPE1 ***********/
> +#define LSDC_CRTC1_CFG_REG              0x1250
> +#define LSDC_CRTC1_FB0_ADDR_LO_REG      0x1270
> +#define LSDC_CRTC1_FB0_ADDR_HI_REG      0x15B0
> +#define LSDC_CRTC1_STRIDE_REG           0x1290
> +#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
> +#define LSDC_CRTC1_PANEL_CONF_REG       0x13D0
> +#define LSDC_CRTC1_HDISPLAY_REG         0x1410
> +#define LSDC_CRTC1_HSYNC_REG            0x1430
> +#define LSDC_CRTC1_VDISPLAY_REG         0x1490
> +#define LSDC_CRTC1_VSYNC_REG            0x14B0
> +#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
> +#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
> +#define LSDC_CRTC1_FB1_ADDR_LO_REG      0x1590
> +#define LSDC_CRTC1_FB1_ADDR_HI_REG      0x15D0
> +
> +/*
> + * All of the DC variants has the hardware which record the scan positio=
n
> + * of the CRTC, [31:16] : current X position, [15:0] : current Y positio=
n
> + */
> +#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
> +#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
> +
> +/*
> + * LS7A2000 has Sync Deviation register.
> + */
> +#define SYNC_DEVIATION_EN               BIT(31)
> +#define SYNC_DEVIATION_NUM              GENMASK(12, 0)
> +#define LSDC_CRTC0_SYNC_DEVIATION_REG   0x1B80
> +#define LSDC_CRTC1_SYNC_DEVIATION_REG   0x1B90
> +
> +/*
> + * In gross, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG =3D 0x10, but not a=
ll of
> + * the registers obey this rule, LSDC_CURSORx_XXX_REG just don't honor t=
his.
> + * This is the root cause we can't untangle the code by manpulating offs=
et
> + * of the register access simply. Our hardware engineers are lack experi=
ance
> + * when they design this...
> + */
> +#define CRTC_PIPE_OFFSET                0x10
> +
> +/*
> + * There is only one hardware cursor unit in LS7A1000 and LS2K1000, let
> + * CFG_HW_CLONE_EN bit be "1" could eliminate this embarrassment, we mad=
e
> + * it on custom clone mode application. While LS7A2000 has two hardware
> + * cursor unit which is good enough.
> + */
> +#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
> +#define CURSOR_FORMAT_SHIFT             0
> +enum lsdc_cursor_format {
> +       CURSOR_FORMAT_DISABLE =3D 0,
> +       CURSOR_FORMAT_MONOCHROME =3D 1,   /* masked */
> +       CURSOR_FORMAT_ARGB8888 =3D 2,     /* A8R8G8B8 */
> +};
> +
> +/*
> + * LS7A1000 and LS2K1000 only support 32x32, LS2K2000 and LS7A2000 suppo=
rt
> + * 64x64, but it seems that setting this bit make no harms on LS7A1000, =
it
> + * just don't take effects.
> + */
> +#define CURSOR_SIZE_SHIFT               2
> +enum lsdc_cursor_size {
> +       CURSOR_SIZE_32X32 =3D 0,
> +       CURSOR_SIZE_64X64 =3D 1,
> +};
> +
> +#define CURSOR_LOCATION_SHIFT           4
> +enum lsdc_cursor_location {
> +       CURSOR_ON_CRTC0 =3D 0,
> +       CURSOR_ON_CRTC1 =3D 1,
> +};
> +
> +#define LSDC_CURSOR0_CFG_REG            0x1520
> +#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
> +#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
> +#define LSDC_CURSOR0_POSITION_REG       0x1540  /* [31:16] Y, [15:0] X *=
/
> +#define LSDC_CURSOR0_BG_COLOR_REG       0x1550  /* background color */
> +#define LSDC_CURSOR0_FG_COLOR_REG       0x1560  /* foreground color */
> +
> +#define LSDC_CURSOR1_CFG_REG            0x1670
> +#define LSDC_CURSOR1_ADDR_LO_REG        0x1680
> +#define LSDC_CURSOR1_ADDR_HI_REG        0x16e0
> +#define LSDC_CURSOR1_POSITION_REG       0x1690  /* [31:16] Y, [15:0] X *=
/
> +#define LSDC_CURSOR1_BG_COLOR_REG       0x16A0  /* background color */
> +#define LSDC_CURSOR1_FG_COLOR_REG       0x16B0  /* foreground color */
> +
> +/*
> + * DC Interrupt Control Register, 32bit, Address Offset: 1570
> + *
> + * Bits 15:0 inidicate the interrupt status
> + * Bits 31:16 control enable interrupts corresponding to bit 15:0 or not
> + * Write 1 to enable, write 0 to disable
> + *
> + * RF: Read Finished
> + * IDBU: Internal Data Buffer Underflow
> + * IDBFU: Internal Data Buffer Fatal Underflow
> + * CBRF: Cursor Buffer Read Finished Flag, no use.
> + * FBRF0: CRTC-0 reading from its framebuffer finished.
> + * FBRF1: CRTC-1 reading from its framebuffer finished.
> + *
> + * +-------+--------------------------+-------+--------+--------+-------=
+
> + * | 31:27 |         26:16            | 15:11 |   10   |   9    |   8   =
|
> + * +-------+--------------------------+-------+--------+--------+-------=
+
> + * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0 | IDBFU1 | IDBU0 =
|
> + * +-------+--------------------------+-------+--------+--------+-------=
+
> + *
> + * +-------+-------+-------+------+--------+--------+--------+--------+
> + * |   7   |   6   |   5   |  4   |   3    |   2    |   1    |   0    |
> + * +-------+-------+-------+------+--------+--------+--------+--------+
> + * | IDBU1 | FBRF0 | FBRF1 | CRRF | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
> + * +-------+-------+-------+------+--------+--------+--------+--------+
> + *
> + * unfortunately, CRTC0's interrupt is mess with CRTC1's interrupt in on=
e
> + * register again.
> + */
> +
> +#define LSDC_INT_REG                    0x1570
> +
> +#define INT_CRTC0_VSYNC                 BIT(2)
> +#define INT_CRTC0_HSYNC                 BIT(3)
> +#define INT_CRTC0_RF                    BIT(6)
> +#define INT_CRTC0_IDBU                  BIT(8)
> +#define INT_CRTC0_IDBFU                 BIT(10)
> +
> +#define INT_CRTC1_VSYNC                 BIT(0)
> +#define INT_CRTC1_HSYNC                 BIT(1)
> +#define INT_CRTC1_RF                    BIT(5)
> +#define INT_CRTC1_IDBU                  BIT(7)
> +#define INT_CRTC1_IDBFU                 BIT(9)
> +
> +#define INT_CRTC0_VSYNC_EN              BIT(18)
> +#define INT_CRTC0_HSYNC_EN              BIT(19)
> +#define INT_CRTC0_RF_EN                 BIT(22)
> +#define INT_CRTC0_IDBU_EN               BIT(24)
> +#define INT_CRTC0_IDBFU_EN              BIT(26)
> +
> +#define INT_CRTC1_VSYNC_EN              BIT(16)
> +#define INT_CRTC1_HSYNC_EN              BIT(17)
> +#define INT_CRTC1_RF_EN                 BIT(21)
> +#define INT_CRTC1_IDBU_EN               BIT(23)
> +#define INT_CRTC1_IDBFU_EN              BIT(25)
> +
> +#define INT_STATUS_MASK                 GENMASK(15, 0)
> +
> +/*
> + * LS7A1000/LS7A2000 have 4 gpios which are used to emulated I2C.
> + * They are under control of the LS7A_DC_GPIO_DAT_REG and LS7A_DC_GPIO_D=
IR_REG
> + * register, Those GPIOs has no relationship whth the GPIO hardware on t=
he
> + * bridge chip itself. Those offsets are relative to DC register base ad=
dress
> + *
> + * LS2k1000 don't have those registers, they use hardware i2c or general=
 GPIO
> + * emulated i2c from linux i2c subsystem.
> + *
> + * GPIO data register, address offset: 0x1650
> + *   +---------------+-----------+-----------+
> + *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
> + *   +---------------+-----------+-----------+
> + *   |               |    DVO1   |    DVO0   |
> + *   +      N/A      +-----------+-----------+
> + *   |               | SCL | SDA | SCL | SDA |
> + *   +---------------+-----------+-----------+
> + */
> +#define LS7A_DC_GPIO_DAT_REG            0x1650
> +
> +/*
> + *  GPIO Input/Output direction control register, address offset: 0x1660
> + */
> +#define LS7A_DC_GPIO_DIR_REG            0x1660
> +
> +/*
> + *  LS7A2000 has two built-in HDMI Encoder and one VGA encoder
> + */
> +
> +/*
> + * Number of continuous packets may be present
> + * in HDMI hblank and vblank zone, should >=3D 48
> + */
> +#define LSDC_HDMI0_ZONE_REG             0x1700
> +#define LSDC_HDMI1_ZONE_REG             0x1710
> +
> +#define HDMI_H_ZONE_IDLE_SHIFT          0
> +#define HDMI_V_ZONE_IDLE_SHIFT          16
> +
> +/* HDMI Iterface Control Reg */
> +#define HDMI_INTERFACE_EN               BIT(0)
> +#define HDMI_PACKET_EN                  BIT(1)
> +#define HDMI_AUDIO_EN                   BIT(2)
> +/*
> + * Preamble:
> + * Immediately preceding each video data period or data island period is=
 the
> + * preamble. This is a sequence of eight identical control characters th=
at
> + * indicate whether the upcoming data period is a video data period or i=
s a
> + * data island. The values of CTL0, CTL1, CTL2, and CTL3 indicate the ty=
pe of
> + * data period that follows.
> + */
> +#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
> +#define HDMI_VIDEO_PREAMBLE_SHIFT       4
> +/* 1: hw i2c, 0: gpio emu i2c, shouldn't put in LSDC_HDMIx_INTF_CTRL_REG=
 */
> +#define HW_I2C_EN                       BIT(8)
> +#define HDMI_CTL_PERIOD_MODE            BIT(9)
> +#define LSDC_HDMI0_INTF_CTRL_REG        0x1720
> +#define LSDC_HDMI1_INTF_CTRL_REG        0x1730
> +
> +#define HDMI_PHY_EN                     BIT(0)
> +#define HDMI_PHY_RESET_N                BIT(1)
> +#define HDMI_PHY_TERM_L_EN              BIT(8)
> +#define HDMI_PHY_TERM_H_EN              BIT(9)
> +#define HDMI_PHY_TERM_DET_EN            BIT(10)
> +#define HDMI_PHY_TERM_STATUS            BIT(11)
> +#define LSDC_HDMI0_PHY_CTRL_REG         0x1800
> +#define LSDC_HDMI1_PHY_CTRL_REG         0x1810
> +
> +/* High level duration need > 1us */
> +#define HDMI_PLL_ENABLE                 BIT(0)
> +#define HDMI_PLL_LOCKED                 BIT(16)
> +/* Bypass the software configured values, using default source from some=
where */
> +#define HDMI_PLL_BYPASS                 BIT(17)
> +
> +#define HDMI_PLL_IDF_SHIFT              1
> +#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
> +#define HDMI_PLL_LF_SHIFT               6
> +#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
> +#define HDMI_PLL_ODF_SHIFT              13
> +#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
> +#define LSDC_HDMI0_PHY_PLL_REG          0x1820
> +#define LSDC_HDMI1_PHY_PLL_REG          0x1830
> +
> +/* LS7A2000/LS2K2000 has hpd status reg, while the two hdmi's status
> + * located at the one register again.
> + */
> +#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
> +#define HDMI0_HPD_FLAG                  BIT(0)
> +#define HDMI1_HPD_FLAG                  BIT(1)
> +
> +#define LSDC_HDMI0_PHY_CAL_REG          0x18C0
> +#define LSDC_HDMI1_PHY_CAL_REG          0x18D0
> +
> +/* AVI InfoFrame */
> +#define LSDC_HDMI0_AVI_CONTENT0         0x18E0
> +#define LSDC_HDMI1_AVI_CONTENT0         0x18D0
> +#define LSDC_HDMI0_AVI_CONTENT1         0x1900
> +#define LSDC_HDMI1_AVI_CONTENT1         0x1910
> +#define LSDC_HDMI0_AVI_CONTENT2         0x1920
> +#define LSDC_HDMI1_AVI_CONTENT2         0x1930
> +#define LSDC_HDMI0_AVI_CONTENT3         0x1940
> +#define LSDC_HDMI1_AVI_CONTENT3         0x1950
> +
> +/* 1: enable avi infoframe packet, 0: disable avi infoframe packet */
> +#define AVI_PKT_ENABLE                  BIT(0)
> +/* 1: send one every two frame, 0: send one each frame */
> +#define AVI_PKT_SEND_FREQ               BIT(1)
> +/*
> + * 1: write 1 to flush avi reg content0 ~ content3 to the packet to be s=
end,
> + * The hardware will clear this bit automatically.
> + */
> +#define AVI_PKT_UPDATE                  BIT(2)
> +
> +#define LSDC_HDMI0_AVI_INFO_CRTL_REG    0x1960
> +#define LSDC_HDMI1_AVI_INFO_CRTL_REG    0x1970
> +
> +/*
> + * LS7A2000 has the hardware which count the number of vblank generated
> + */
> +#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
> +#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
> +
> +/*
> + * LS7A2000 has the audio hardware associate with the HDMI encoder.
> + */
> +#define LSDC_HDMI0_AUDIO_PLL_LO_REG     0x1A20
> +#define LSDC_HDMI1_AUDIO_PLL_LO_REG     0x1A30
> +
> +#define LSDC_HDMI0_AUDIO_PLL_HI_REG     0x1A40
> +#define LSDC_HDMI1_AUDIO_PLL_HI_REG     0x1A50
> +
> +#endif
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongs=
on/lsdc_ttm.c
> new file mode 100644
> index 000000000000..a792beeb4375
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -0,0 +1,547 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_prime.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_ttm.h"
> +
> +const char *lsdc_mem_type_to_str(uint32_t mem_type)
> +{
> +       switch (mem_type) {
> +       case TTM_PL_VRAM:
> +               return "VRAM";
> +       case TTM_PL_TT:
> +               return "GTT";
> +       case TTM_PL_SYSTEM:
> +               return "SYSTEM";
> +       default:
> +               break;
> +       }
> +
> +       return "Unknown";
> +}
> +
> +static void lsdc_bo_set_placement(struct lsdc_bo *lbo, u32 domain)
> +{
> +       u32 c =3D 0;
> +       u32 pflags =3D 0;
> +       u32 i;
> +
> +       if (lbo->tbo.base.size <=3D PAGE_SIZE)
> +               pflags |=3D TTM_PL_FLAG_TOPDOWN;
> +
> +       lbo->placement.placement =3D lbo->placements;
> +       lbo->placement.busy_placement =3D lbo->placements;
> +
> +       if (domain & LSDC_GEM_DOMAIN_VRAM) {
> +               lbo->placements[c].mem_type =3D TTM_PL_VRAM;
> +               lbo->placements[c++].flags =3D pflags;
> +       }
> +
> +       if (domain & LSDC_GEM_DOMAIN_GTT) {
> +               lbo->placements[c].mem_type =3D TTM_PL_TT;
> +               lbo->placements[c++].flags =3D pflags;
> +       }
> +
> +       if (domain & LSDC_GEM_DOMAIN_SYSTEM) {
> +               lbo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> +               lbo->placements[c++].flags =3D 0;
> +       }
> +
> +       if (!c) {
> +               lbo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> +               lbo->placements[c++].flags =3D 0;
> +       }
> +
> +       lbo->placement.num_placement =3D c;
> +       lbo->placement.num_busy_placement =3D c;
> +
> +       for (i =3D 0; i < c; ++i) {
> +               lbo->placements[i].fpfn =3D 0;
> +               lbo->placements[i].lpfn =3D 0;
> +       }
> +}
> +
> +static void lsdc_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *=
tt)
> +{
> +       ttm_tt_fini(tt);
> +       kfree(tt);
> +}
> +
> +static struct ttm_tt *
> +lsdc_ttm_tt_create(struct ttm_buffer_object *tbo, uint32_t page_flags)
> +{
> +       struct ttm_tt *tt;
> +       int ret;
> +
> +       tt =3D kzalloc(sizeof(*tt), GFP_KERNEL);
> +       if (!tt)
> +               return NULL;
> +
> +       ret =3D ttm_sg_tt_init(tt, tbo, page_flags, ttm_cached);
> +       if (ret < 0) {
> +               kfree(tt);
> +               return NULL;
> +       }
> +
> +       return tt;
> +}
> +
> +static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
> +                               struct ttm_tt *ttm,
> +                               struct ttm_operation_ctx *ctx)
> +{
> +       bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> +
> +       if (slave && ttm->sg) {
> +               drm_prime_sg_to_dma_addr_array(ttm->sg,
> +                                              ttm->dma_address,
> +                                              ttm->num_pages);
> +
> +               return 0;
> +       }
> +
> +       return ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +}
> +
> +static void lsdc_ttm_tt_unpopulate(struct ttm_device *bdev,
> +                                  struct ttm_tt *ttm)
> +{
> +       bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> +
> +       if (slave)
> +               return;
> +
> +       return ttm_pool_free(&bdev->pool, ttm);
> +}
> +
> +static void lsdc_bo_evict_flags(struct ttm_buffer_object *tbo,
> +                               struct ttm_placement *tplacement)
> +{
> +       struct ttm_resource *resource =3D tbo->resource;
> +       struct lsdc_bo *lbo =3D to_lsdc_bo(tbo);
> +
> +       switch (resource->mem_type) {
> +       case TTM_PL_VRAM:
> +               lsdc_bo_set_placement(lbo, LSDC_GEM_DOMAIN_GTT);
> +               break;
> +       case TTM_PL_TT:
> +       default:
> +               lsdc_bo_set_placement(lbo, LSDC_GEM_DOMAIN_SYSTEM);
> +               break;
> +       }
> +
> +       *tplacement =3D lbo->placement;
> +}
> +
> +static int lsdc_bo_move(struct ttm_buffer_object *tbo,
> +                       bool evict,
> +                       struct ttm_operation_ctx *ctx,
> +                       struct ttm_resource *new_mem,
> +                       struct ttm_place *hop)
> +{
> +       struct drm_device *ddev =3D tbo->base.dev;
> +       struct ttm_resource *old_mem =3D tbo->resource;
> +       struct lsdc_bo *lbo =3D to_lsdc_bo(tbo);
> +       int ret;
> +
> +       if (unlikely(tbo->pin_count > 0)) {
> +               drm_warn(ddev, "Can't move a pinned BO\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D ttm_bo_wait_ctx(tbo, ctx);
> +       if (ret)
> +               return ret;
> +
> +       if (!old_mem) {
> +               drm_dbg(ddev, "bo[%p] move: NULL to %s, size: %zu\n",
> +                       lbo, lsdc_mem_type_to_str(new_mem->mem_type),
> +                       lsdc_bo_size(lbo));
> +               ttm_bo_move_null(tbo, new_mem);
> +               return 0;
> +       }
> +
> +       if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && !tbo->ttm) {
> +               ttm_bo_move_null(tbo, new_mem);
> +               drm_dbg(ddev, "bo[%p] move: SYSTEM to NULL, size: %zu\n",
> +                       lbo, lsdc_bo_size(lbo));
> +               return 0;
> +       }
> +
> +       if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> +           new_mem->mem_type =3D=3D TTM_PL_TT) {
> +               drm_dbg(ddev, "bo[%p] move: SYSTEM to GTT, size: %zu\n",
> +                       lbo, lsdc_bo_size(lbo));
> +               ttm_bo_move_null(tbo, new_mem);
> +               return 0;
> +       }
> +
> +       if (old_mem->mem_type =3D=3D TTM_PL_TT &&
> +           new_mem->mem_type =3D=3D TTM_PL_SYSTEM) {
> +               drm_dbg(ddev, "bo[%p] move: GTT to SYSTEM, size: %zu\n",
> +                       lbo, lsdc_bo_size(lbo));
> +               ttm_resource_free(tbo, &tbo->resource);
> +               ttm_bo_assign_mem(tbo, new_mem);
> +               return 0;
> +       }
> +
> +       drm_dbg(ddev, "bo[%p] move: %s to %s, size: %zu\n",
> +               lbo,
> +               lsdc_mem_type_to_str(old_mem->mem_type),
> +               lsdc_mem_type_to_str(new_mem->mem_type),
> +               lsdc_bo_size(lbo));
> +
> +       return ttm_bo_move_memcpy(tbo, ctx, new_mem);
> +}
> +
> +static int lsdc_bo_reserve_io_mem(struct ttm_device *bdev,
> +                                 struct ttm_resource *mem)
> +{
> +       struct lsdc_device *ldev =3D tdev_to_ldev(bdev);
> +
> +       switch (mem->mem_type) {
> +       case TTM_PL_SYSTEM:
> +               break;
> +       case TTM_PL_TT:
> +               break;
> +       case TTM_PL_VRAM:
> +               mem->bus.offset =3D (mem->start << PAGE_SHIFT) + ldev->vr=
am_base;
> +               mem->bus.is_iomem =3D true;
> +               mem->bus.caching =3D ttm_write_combined;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct ttm_device_funcs lsdc_bo_driver =3D {
> +       .ttm_tt_create =3D lsdc_ttm_tt_create,
> +       .ttm_tt_populate =3D lsdc_ttm_tt_populate,
> +       .ttm_tt_unpopulate =3D lsdc_ttm_tt_unpopulate,
> +       .ttm_tt_destroy =3D lsdc_ttm_tt_destroy,
> +       .eviction_valuable =3D ttm_bo_eviction_valuable,
> +       .evict_flags =3D lsdc_bo_evict_flags,
> +       .move =3D lsdc_bo_move,
> +       .io_mem_reserve =3D lsdc_bo_reserve_io_mem,
> +};
> +
> +u64 lsdc_bo_gpu_offset(struct lsdc_bo *lbo)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +       struct drm_device *ddev =3D tbo->base.dev;
> +       struct ttm_resource *resource =3D tbo->resource;
> +
> +       if (unlikely(!tbo->pin_count)) {
> +               drm_err(ddev, "unpinned bo, gpu virtual address is invali=
d\n");
> +               return 0;
> +       }
> +
> +       if (unlikely(resource->mem_type =3D=3D TTM_PL_SYSTEM))
> +               return 0;
> +
> +       return resource->start << PAGE_SHIFT;
> +}
> +
> +size_t lsdc_bo_size(struct lsdc_bo *lbo)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +
> +       return tbo->base.size;
> +}
> +
> +int lsdc_bo_reserve(struct lsdc_bo *lbo)
> +{
> +       return ttm_bo_reserve(&lbo->tbo, true, false, NULL);
> +}
> +
> +void lsdc_bo_unreserve(struct lsdc_bo *lbo)
> +{
> +       return ttm_bo_unreserve(&lbo->tbo);
> +}
> +
> +int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr)
> +{
> +       struct ttm_operation_ctx ctx =3D { false, false };
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +       struct lsdc_device *ldev =3D tdev_to_ldev(tbo->bdev);
> +       int ret;
> +
> +       if (tbo->pin_count)
> +               goto bo_pinned;
> +
> +       if (lbo->sharing_count && domain =3D=3D LSDC_GEM_DOMAIN_VRAM)
> +               return -EINVAL;
> +
> +       if (domain)
> +               lsdc_bo_set_placement(lbo, domain);
> +
> +       ret =3D ttm_bo_validate(tbo, &lbo->placement, &ctx);
> +       if (unlikely(ret)) {
> +               drm_err(&ldev->base, "%p validate failed: %d\n", lbo, ret=
);
> +               return ret;
> +       }
> +
> +       if (domain =3D=3D LSDC_GEM_DOMAIN_VRAM)
> +               ldev->vram_pinned_size +=3D lsdc_bo_size(lbo);
> +       else if (domain =3D=3D LSDC_GEM_DOMAIN_GTT)
> +               ldev->gtt_pinned_size +=3D lsdc_bo_size(lbo);
> +
> +bo_pinned:
> +       ttm_bo_pin(tbo);
> +
> +       if (gpu_addr)
> +               *gpu_addr =3D lsdc_bo_gpu_offset(lbo);
> +
> +       return 0;
> +}
> +
> +void lsdc_bo_unpin(struct lsdc_bo *lbo)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +       struct lsdc_device *ldev =3D tdev_to_ldev(tbo->bdev);
> +
> +       if (unlikely(!tbo->pin_count)) {
> +               drm_dbg(&ldev->base, "%p unpin is not necessary\n", lbo);
> +               return;
> +       }
> +
> +       ttm_bo_unpin(tbo);
> +
> +       if (!tbo->pin_count) {
> +               if (tbo->resource->mem_type =3D=3D TTM_PL_VRAM)
> +                       ldev->vram_pinned_size -=3D lsdc_bo_size(lbo);
> +               else if (tbo->resource->mem_type =3D=3D TTM_PL_TT)
> +                       ldev->gtt_pinned_size -=3D lsdc_bo_size(lbo);
> +       }
> +}
> +
> +void lsdc_bo_ref(struct lsdc_bo *lbo)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +
> +       ttm_bo_get(tbo);
> +}
> +
> +void lsdc_bo_unref(struct lsdc_bo *lbo)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +
> +       ttm_bo_put(tbo);
> +}
> +
> +int lsdc_bo_kmap(struct lsdc_bo *lbo, void **pptr)
> +{
> +       struct ttm_buffer_object *tbo =3D &lbo->tbo;
> +       struct drm_gem_object *gem =3D &tbo->base;
> +       struct drm_device *ddev =3D gem->dev;
> +       bool is_iomem;
> +       long ret;
> +       int err;
> +
> +       ret =3D dma_resv_wait_timeout(gem->resv,
> +                                   DMA_RESV_USAGE_KERNEL,
> +                                   false,
> +                                   MAX_SCHEDULE_TIMEOUT);
> +       if (ret < 0) {
> +               drm_warn(ddev, "wait fence timeout\n");
> +               return ret;
> +       }
> +
> +       if (lbo->kptr)
> +               goto already_kmapped;
> +
> +       err =3D ttm_bo_kmap(tbo, 0, PFN_UP(lsdc_bo_size(lbo)), &lbo->kmap=
);
> +       if (err) {
> +               drm_err(ddev, "kmap %p failed: %d\n", lbo, err);
> +               return err;
> +       }
> +
> +       lbo->kptr =3D ttm_kmap_obj_virtual(&lbo->kmap, &is_iomem);
> +
> +already_kmapped:
> +       if (pptr)
> +               *pptr =3D lbo->kptr;
> +
> +       return 0;
> +}
> +
> +void lsdc_bo_kunmap(struct lsdc_bo *lbo)
> +{
> +       if (!lbo->kptr)
> +               return;
> +
> +       lbo->kptr =3D NULL;
> +       ttm_bo_kunmap(&lbo->kmap);
> +}
> +
> +int lsdc_bo_evict_vram(struct drm_device *ddev)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct ttm_device *bdev =3D &ldev->bdev;
> +       struct ttm_resource_manager *man;
> +
> +       man =3D ttm_manager_type(bdev, TTM_PL_VRAM);
> +       if (unlikely(!man))
> +               return 0;
> +
> +       return ttm_resource_manager_evict_all(bdev, man);
> +}
> +
> +static void lsdc_bo_destroy(struct ttm_buffer_object *tbo)
> +{
> +       struct lsdc_device *ldev =3D tdev_to_ldev(tbo->bdev);
> +       struct lsdc_bo *lbo =3D to_lsdc_bo(tbo);
> +
> +       mutex_lock(&ldev->gem.mutex);
> +       list_del_init(&lbo->list);
> +       mutex_unlock(&ldev->gem.mutex);
> +
> +       drm_gem_object_release(&tbo->base);
> +
> +       kfree(lbo);
> +}
> +
> +struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
> +                              u32 domain,
> +                              size_t size,
> +                              bool kernel,
> +                              struct sg_table *sg,
> +                              struct dma_resv *resv)
> +{
> +       struct lsdc_device *ldev =3D to_lsdc(ddev);
> +       struct ttm_device *bdev =3D &ldev->bdev;
> +       struct ttm_buffer_object *tbo;
> +       struct lsdc_bo *lbo;
> +       enum ttm_bo_type bo_type;
> +       int ret;
> +
> +       lbo =3D kzalloc(sizeof(*lbo), GFP_KERNEL);
> +       if (!lbo)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&lbo->list);
> +
> +       lbo->initial_domain =3D domain & (LSDC_GEM_DOMAIN_VRAM |
> +                                       LSDC_GEM_DOMAIN_GTT |
> +                                       LSDC_GEM_DOMAIN_SYSTEM);
> +
> +       tbo =3D &lbo->tbo;
> +
> +       size =3D ALIGN(size, PAGE_SIZE);
> +
> +       ret =3D drm_gem_object_init(ddev, &tbo->base, size);
> +       if (ret) {
> +               kfree(lbo);
> +               return ERR_PTR(ret);
> +       }
> +
> +       tbo->bdev =3D bdev;
> +
> +       if (kernel)
> +               bo_type =3D ttm_bo_type_kernel;
> +       else if (sg)
> +               bo_type =3D ttm_bo_type_sg;
> +       else
> +               bo_type =3D ttm_bo_type_device;
> +
> +       lsdc_bo_set_placement(lbo, domain);
> +
> +       ret =3D ttm_bo_init_validate(bdev,
> +                                  tbo,
> +                                  bo_type,
> +                                  &lbo->placement,
> +                                  0,
> +                                  false,
> +                                  sg,
> +                                  resv,
> +                                  lsdc_bo_destroy);
> +       if (ret) {
> +               kfree(lbo);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return lbo;
> +}
> +
> +static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
> +{
> +       struct lsdc_device *ldev =3D (struct lsdc_device *)data;
> +
> +       ttm_range_man_fini(&ldev->bdev, TTM_PL_VRAM);
> +       ttm_range_man_fini(&ldev->bdev, TTM_PL_TT);
> +
> +       ttm_device_fini(&ldev->bdev);
> +
> +       drm_dbg(ddev, "ttm finished\n");
> +}
> +
> +int lsdc_ttm_init(struct lsdc_device *ldev)
> +{
> +       struct drm_device *ddev =3D &ldev->base;
> +       unsigned long num_vram_pages;
> +       unsigned long num_gtt_pages;
> +       int ret;
> +
> +       ret =3D ttm_device_init(&ldev->bdev,
> +                             &lsdc_bo_driver,
> +                             ddev->dev,
> +                             ddev->anon_inode->i_mapping,
> +                             ddev->vma_offset_manager,
> +                             false,
> +                             false);
> +       if (ret)
> +               return ret;
> +
> +       num_vram_pages =3D ldev->vram_size >> PAGE_SHIFT;
> +
> +       ret =3D ttm_range_man_init(&ldev->bdev,
> +                                TTM_PL_VRAM,
> +                                false,
> +                                num_vram_pages);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       drm_info(ddev, "VRAM: %lu pages ready\n", num_vram_pages);
> +
> +       /* 512M is far enough for us now */
> +       ldev->gtt_size =3D 512 << 20;
> +
> +       num_gtt_pages =3D ldev->gtt_size >> PAGE_SHIFT;
> +
> +       ret =3D ttm_range_man_init(&ldev->bdev,
> +                                TTM_PL_TT,
> +                                true,
> +                                num_gtt_pages);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       drm_info(ddev, "GTT: %lu pages ready\n", num_gtt_pages);
> +
> +       return drmm_add_action_or_reset(ddev, lsdc_ttm_fini, ldev);
> +}
> +
> +void lsdc_ttm_debugfs_init(struct lsdc_device *ldev)
> +{
> +       struct ttm_device *bdev =3D &ldev->bdev;
> +       struct drm_device *ddev =3D &ldev->base;
> +       struct drm_minor *minor =3D ddev->primary;
> +       struct dentry *root =3D minor->debugfs_root;
> +       struct ttm_resource_manager *vram_man;
> +       struct ttm_resource_manager *gtt_man;
> +
> +       vram_man =3D ttm_manager_type(bdev, TTM_PL_VRAM);
> +       gtt_man =3D ttm_manager_type(bdev, TTM_PL_TT);
> +
> +       ttm_resource_manager_create_debugfs(vram_man, root, "vram_mm");
> +       ttm_resource_manager_create_debugfs(gtt_man, root, "gtt_mm");
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.h b/drivers/gpu/drm/loongs=
on/lsdc_ttm.h
> new file mode 100644
> index 000000000000..e4ba175c175e
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Loongson Corporation
> + */
> +
> +#ifndef __LSDC_TTM_H__
> +#define __LSDC_TTM_H__
> +
> +#include <linux/container_of.h>
> +#include <linux/iosys-map.h>
> +#include <linux/list.h>
> +
> +#include <drm/drm_gem.h>
> +#include <drm/ttm/ttm_bo.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#define LSDC_GEM_DOMAIN_SYSTEM          0x1
> +#define LSDC_GEM_DOMAIN_GTT             0x2
> +#define LSDC_GEM_DOMAIN_VRAM            0x4
> +
> +struct lsdc_bo {
> +       struct ttm_buffer_object tbo;
> +
> +       /* Protected by gem.mutex */
> +       struct list_head list;
> +
> +       struct iosys_map map;
> +
> +       unsigned int vmap_count;
> +       /* cross device driver sharing reference count */
> +       unsigned int sharing_count;
> +
> +       struct ttm_bo_kmap_obj kmap;
> +       void *kptr;
> +
> +       u32 initial_domain;
> +
> +       struct ttm_placement placement;
> +       struct ttm_place placements[4];
> +};
> +
> +static inline struct ttm_buffer_object *to_ttm_bo(struct drm_gem_object =
*gem)
> +{
> +       return container_of(gem, struct ttm_buffer_object, base);
> +}
> +
> +static inline struct lsdc_bo *to_lsdc_bo(struct ttm_buffer_object *tbo)
> +{
> +       return container_of(tbo, struct lsdc_bo, tbo);
> +}
> +
> +static inline struct lsdc_bo *gem_to_lsdc_bo(struct drm_gem_object *gem)
> +{
> +       return container_of(gem, struct lsdc_bo, tbo.base);
> +}
> +
> +const char *lsdc_mem_type_to_str(uint32_t mem_type);
> +
> +struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
> +                              u32 domain,
> +                              size_t size,
> +                              bool kernel,
> +                              struct sg_table *sg,
> +                              struct dma_resv *resv);
The same problem as above.

Huacai
> +
> +int lsdc_bo_reserve(struct lsdc_bo *lbo);
> +void lsdc_bo_unreserve(struct lsdc_bo *lbo);
> +
> +int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr);
> +void lsdc_bo_unpin(struct lsdc_bo *lbo);
> +
> +void lsdc_bo_ref(struct lsdc_bo *lbo);
> +void lsdc_bo_unref(struct lsdc_bo *lbo);
> +
> +u64 lsdc_bo_gpu_offset(struct lsdc_bo *lbo);
> +size_t lsdc_bo_size(struct lsdc_bo *lbo);
> +
> +int lsdc_bo_kmap(struct lsdc_bo *lbo, void **pptr);
> +void lsdc_bo_kunmap(struct lsdc_bo *lbo);
> +
> +int lsdc_bo_evict_vram(struct drm_device *ddev);
> +
> +int lsdc_ttm_init(struct lsdc_device *ldev);
> +void lsdc_ttm_debugfs_init(struct lsdc_device *ldev);
> +
> +#endif
> --
> 2.25.1
>
