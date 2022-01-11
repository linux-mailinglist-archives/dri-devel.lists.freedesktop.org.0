Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8148B642
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFD910E378;
	Tue, 11 Jan 2022 18:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE8B10E366
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641927523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHCCJzeah0w/vck/Nu/qw79rSV3jT1jN1nj4jAKTZPs=;
 b=bzyouv825rEOn5aRVyqGkxt3EYhpG/wBhju/frXXEvhsybm+Q0g2Bf3qh79QXnQ1DNSjXX
 IsM661kS39k1mzBarJjlI39HYT48/my6BAWcuBifijYE3rA3Q+My7xZ2I55+kZJdQpkpH5
 ZIGvUttTMzpyOgcJkEqvlqykVgvbO3M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-Qb5f9F6lNzmUiOWz16KwcQ-1; Tue, 11 Jan 2022 13:58:42 -0500
X-MC-Unique: Qb5f9F6lNzmUiOWz16KwcQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 z17-20020ac84311000000b002c5c70c851cso152502qtm.23
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=iHCCJzeah0w/vck/Nu/qw79rSV3jT1jN1nj4jAKTZPs=;
 b=qMtNbn0Tow16fLlPikXuNy1RfDI9We6Pp8oBNTEJydkA4xZQ8jqhmHbWQr+JjS7eRe
 uQnWPGr99UrVjBK6PZgJaoVUnz8fZ0NP2yGSD2w7Gp9EQDmUDVkUyukRif1GjBlFQ9nZ
 rhRIVgYmKGr1egjM2KKFbLj/Oq+l0Ol6yCr9+yvNxrER6DylOC5jvz3GbPZiQFHGj6OX
 pAe2RZf2JrNFHssOj2R7KtF092CKN4xqQ383YNFujhQznO3ITrpUH3MHMRZLpD87806P
 +L02/1fiSIG/8CWAkYCk32pP+wDFwWDs2pYlP3uGgPvij7glwNDgpF0wNQyMtdzUjXbE
 37UA==
X-Gm-Message-State: AOAM533bA6iFIG3gT8kBCKXpagZWdaKd6Ahk8hdd2nAjb/PmPmZPcgJa
 TnN+E47I48rlM3HxJ3HwhXAqCzHKEbtwbqA95EL6m6rOQsEhqBOGiEB21mj+mnBNaFlg/Wpe2Ny
 1nqlJSMRLG/oY38lGmS/iCNGC3xzU
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr4857315qtw.518.1641927521439; 
 Tue, 11 Jan 2022 10:58:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxELfMJ8r36duQkL4qxGsnpQpkIFw0eUnAJ5WcaVsOlMfn4wSG/TqH00Jgjg++5PwhTrD/yaA==
X-Received: by 2002:a05:622a:d5:: with SMTP id
 p21mr4857289qtw.518.1641927520997; 
 Tue, 11 Jan 2022 10:58:40 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id s27sm8164313qtc.0.2022.01.11.10.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:58:40 -0800 (PST)
Message-ID: <58056ee59acc791c0ef1562fab45e24f9aaa19b4.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into
 separate helper module
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch, 
 jani.nikula@linux.intel.com
Date: Tue, 11 Jan 2022 13:58:39 -0500
In-Reply-To: <20211215104318.18866-4-tzimmermann@suse.de>
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-12-15 at 11:43 +0100, Thomas Zimmermann wrote:
> Move DisplayPort functions into a separate module to reduce the size
> of the KMS helpers. Select DRM_DP_HELPER for all users of the code. To
> avoid naming conflicts, rename drm_dp_helper.c to drm_dp.c
> 
> This change can help to reduce the size of the kernel binary. Some
> numbers from a x86-64 test build:
> 
> Before:
>         drm_kms_helper.ko:      447480 bytes
> 
> After:
>         drm_dp_helper.ko:       216632 bytes
>         drm_kms_helper.ko:      239424 bytes
> 
> For early-boot graphics, generic DRM drivers, such as simpledrm,
> require DRM KMS helpers to be built into the kernel. Generic helper
> functions for DisplayPort take up a significant portion of DRM KMS
> helper library. These functions are not used by generic drivers and
> can be loaded as a module.
> 
> v2:
>         * move DP helper code into dp/ (Jani)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Kconfig                       |  8 +++++++
>  drivers/gpu/drm/Makefile                      | 10 ++++-----
>  drivers/gpu/drm/bridge/Kconfig                |  4 ++++
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  2 ++
>  drivers/gpu/drm/bridge/cadence/Kconfig        |  1 +
>  drivers/gpu/drm/dp/Makefile                   |  7 ++++++
>  .../gpu/drm/{drm_dp_helper.c => dp/drm_dp.c}  |  0
>  drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c     |  0
>  drivers/gpu/drm/{ => dp}/drm_dp_cec.c         |  0
>  .../drm/{ => dp}/drm_dp_dual_mode_helper.c    |  0
>  .../gpu/drm/{ => dp}/drm_dp_helper_internal.h |  0
>  drivers/gpu/drm/dp/drm_dp_helper_mod.c        | 22 +++++++++++++++++++
>  .../gpu/drm/{ => dp}/drm_dp_mst_topology.c    |  0
>  .../{ => dp}/drm_dp_mst_topology_internal.h   |  0
>  drivers/gpu/drm/drm_kms_helper_common.c       | 15 -------------
>  drivers/gpu/drm/i915/Kconfig                  |  1 +
>  drivers/gpu/drm/msm/Kconfig                   |  1 +
>  drivers/gpu/drm/nouveau/Kconfig               |  1 +
>  drivers/gpu/drm/rockchip/Kconfig              |  1 +
>  drivers/gpu/drm/tegra/Kconfig                 |  1 +
>  drivers/gpu/drm/xlnx/Kconfig                  |  1 +
>  21 files changed, 54 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/gpu/drm/dp/Makefile
>  rename drivers/gpu/drm/{drm_dp_helper.c => dp/drm_dp.c} (100%)
>  rename drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c (100%)
>  rename drivers/gpu/drm/{ => dp}/drm_dp_cec.c (100%)
>  rename drivers/gpu/drm/{ => dp}/drm_dp_dual_mode_helper.c (100%)
>  rename drivers/gpu/drm/{ => dp}/drm_dp_helper_internal.h (100%)
>  create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_mod.c
>  rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology.c (100%)
>  rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology_internal.h (100%)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b1f22e457fd0..91f54aeb0b7c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -80,6 +80,12 @@ config DRM_DEBUG_SELFTEST
>  
>           If in doubt, say "N".
>  
> +config DRM_DP_HELPER
> +       tristate
> +       depends on DRM
> +       help
> +         DRM helpers for DisplayPort.
> +
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> @@ -236,6 +242,7 @@ config DRM_RADEON
>         depends on DRM && PCI && MMU
>         depends on AGP || !AGP
>         select FW_LOADER
> +       select DRM_DP_HELPER
>          select DRM_KMS_HELPER
>          select DRM_TTM
>         select DRM_TTM_HELPER
> @@ -256,6 +263,7 @@ config DRM_AMDGPU
>         tristate "AMD GPU"
>         depends on DRM && PCI && MMU
>         select FW_LOADER
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_SCHED
>         select DRM_TTM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 301a44dc18e3..69be80ef1d31 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -48,21 +48,18 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>  drm_ttm_helper-y := drm_gem_ttm_helper.o
>  obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>  
> -drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o
> drm_dp_helper.o \
> +drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
>                 drm_dsc.o drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
>                 drm_probe_helper.o \
> -               drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o
> \
> -               drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
> +               drm_plane_helper.o drm_atomic_helper.o \
> +               drm_kms_helper_common.o \
>                 drm_simple_kms_helper.o drm_modeset_helper.o \
>                 drm_scdc_helper.o drm_gem_atomic_helper.o \
>                 drm_gem_framebuffer_helper.o \
>                 drm_atomic_state_helper.o drm_damage_helper.o \
>                 drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
> -
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>  drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
> -drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
> -drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>  
>  obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> @@ -72,6 +69,7 @@ obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
>  obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
>  obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=
> drm_panel_orientation_quirks.o
>  obj-y                  += arm/
> +obj-y                  += dp/
>  obj-$(CONFIG_DRM_TTM)  += ttm/
>  obj-$(CONFIG_DRM_SCHED)        += scheduler/
>  obj-$(CONFIG_DRM_TDFX) += tdfx/
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 61db5a66b493..a27435a4c9c4 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -183,6 +183,7 @@ config DRM_PARADE_PS8640
>         tristate "Parade PS8640 MIPI DSI to eDP Converter"
>         depends on OF
>         select DRM_DP_AUX_BUS
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> @@ -253,6 +254,7 @@ config DRM_TOSHIBA_TC358764
>  config DRM_TOSHIBA_TC358767
>         tristate "Toshiba TC358767 eDP bridge"
>         depends on OF
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
>         select DRM_PANEL
> @@ -272,6 +274,7 @@ config DRM_TOSHIBA_TC358768
>  config DRM_TOSHIBA_TC358775
>         tristate "Toshiba TC358775 DSI/LVDS bridge"
>         depends on OF
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
>         select DRM_PANEL
> @@ -299,6 +302,7 @@ config DRM_TI_SN65DSI83
>  config DRM_TI_SN65DSI86
>         tristate "TI SN65DSI86 DSI to eDP bridge"
>         depends on OF
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig
> b/drivers/gpu/drm/bridge/analogix/Kconfig
> index 2ef6eb2b786c..319ba0df57be 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -3,6 +3,7 @@ config DRM_ANALOGIX_ANX6345
>         tristate "Analogix ANX6345 bridge"
>         depends on OF
>         select DRM_ANALOGIX_DP
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
>         help
> @@ -14,6 +15,7 @@ config DRM_ANALOGIX_ANX6345
>  config DRM_ANALOGIX_ANX78XX
>         tristate "Analogix ANX78XX bridge"
>         select DRM_ANALOGIX_DP
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
>         help
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> b/drivers/gpu/drm/bridge/cadence/Kconfig
> index ef8c230e0f62..de697bade05e 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_CDNS_MHDP8546
>         tristate "Cadence DPI/DP bridge"
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_PANEL_BRIDGE
>         depends on OF
> diff --git a/drivers/gpu/drm/dp/Makefile b/drivers/gpu/drm/dp/Makefile
> new file mode 100644
> index 000000000000..5b892aeff5ab
> --- /dev/null
> +++ b/drivers/gpu/drm/dp/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: MIT
> +
> +drm_dp_helper-y := drm_dp.o drm_dp_dual_mode_helper.o drm_dp_helper_mod.o
> drm_dp_mst_topology.o
> +drm_dp_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
> +drm_dp_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> +
> +obj-$(CONFIG_DRM_DP_HELPER) += drm_dp_helper.o
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/dp/drm_dp.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_helper.c
> rename to drivers/gpu/drm/dp/drm_dp.c
> diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c
> b/drivers/gpu/drm/dp/drm_dp_aux_dev.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_aux_dev.c
> rename to drivers/gpu/drm/dp/drm_dp_aux_dev.c
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/dp/drm_dp_cec.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_cec.c
> rename to drivers/gpu/drm/dp/drm_dp_cec.c
> diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
> b/drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_dual_mode_helper.c
> rename to drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
> diff --git a/drivers/gpu/drm/drm_dp_helper_internal.h
> b/drivers/gpu/drm/dp/drm_dp_helper_internal.h
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_helper_internal.h
> rename to drivers/gpu/drm/dp/drm_dp_helper_internal.h
> diff --git a/drivers/gpu/drm/dp/drm_dp_helper_mod.c
> b/drivers/gpu/drm/dp/drm_dp_helper_mod.c
> new file mode 100644
> index 000000000000..db753de24000
> --- /dev/null
> +++ b/drivers/gpu/drm/dp/drm_dp_helper_mod.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <linux/module.h>
> +
> +#include "drm_dp_helper_internal.h"
> +
> +MODULE_DESCRIPTION("DRM DisplayPort helper");
> +MODULE_LICENSE("GPL and additional rights");
> +
> +static int __init drm_dp_helper_module_init(void)
> +{
> +       return drm_dp_aux_dev_init();
> +}
> +
> +static void __exit drm_dp_helper_module_exit(void)
> +{
> +       /* Call exit functions from specific dp helpers here */
> +       drm_dp_aux_dev_exit();
> +}
> +
> +module_init(drm_dp_helper_module_init);
> +module_exit(drm_dp_helper_module_exit);
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_mst_topology.c
> rename to drivers/gpu/drm/dp/drm_dp_mst_topology.c
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
> b/drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h
> similarity index 100%
> rename from drivers/gpu/drm/drm_dp_mst_topology_internal.h
> rename to drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c
> b/drivers/gpu/drm/drm_kms_helper_common.c
> index 88260d26409c..8be20080cd8d 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -29,7 +29,6 @@
>  
>  #include <drm/drm_print.h>
>  
> -#include "drm_dp_helper_internal.h"
>  #include "drm_crtc_helper_internal.h"
>  
>  MODULE_AUTHOR("David Airlie, Jesse Barnes");
> @@ -62,17 +61,3 @@ MODULE_PARM_DESC(edid_firmware,
>                  "DEPRECATED. Use drm.edid_firmware module parameter
> instead.");
>  
>  #endif
> -
> -static int __init drm_kms_helper_init(void)
> -{
> -       return drm_dp_aux_dev_init();
> -}
> -
> -static void __exit drm_kms_helper_exit(void)
> -{
> -       /* Call exit functions from specific kms helpers here */
> -       drm_dp_aux_dev_exit();
> -}
> -
> -module_init(drm_kms_helper_init);
> -module_exit(drm_kms_helper_exit);
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index a4c94dc2e216..b68e8b551b83 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -9,6 +9,7 @@ config DRM_I915
>         # the shmem_readpage() which depends upon tmpfs
>         select SHMEM
>         select TMPFS
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_PANEL
>         select DRM_MIPI_DSI
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 39197b4beea7..75015b0e165e 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MSM
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_PANEL
>         select DRM_BRIDGE
> diff --git a/drivers/gpu/drm/nouveau/Kconfig
> b/drivers/gpu/drm/nouveau/Kconfig
> index 9436310d0854..3ec690b6f0b4 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -4,6 +4,7 @@ config DRM_NOUVEAU
>         depends on DRM && PCI && MMU
>         select IOMMU_API
>         select FW_LOADER
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_TTM
>         select DRM_TTM_HELPER
> diff --git a/drivers/gpu/drm/rockchip/Kconfig
> b/drivers/gpu/drm/rockchip/Kconfig
> index 9f1ecefc3933..d59dca5efb52 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_ROCKCHIP
>         tristate "DRM Support for Rockchip"
>         depends on DRM && ROCKCHIP_IOMMU
> +       select DRM_DP_HELPER
>         select DRM_GEM_CMA_HELPER
>         select DRM_KMS_HELPER
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 1650a448eabd..dc88adc7ba40 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -5,6 +5,7 @@ config DRM_TEGRA
>         depends on COMMON_CLK
>         depends on DRM
>         depends on OF
> +       select DRM_DP_HELPER
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index d8d38d86d5c6..06cf477dbcdd 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -6,6 +6,7 @@ config DRM_ZYNQMP_DPSUB
>         depends on PHY_XILINX_ZYNQMP
>         depends on XILINX_ZYNQMP_DPDMA
>         select DMA_ENGINE
> +       select DRM_DP_HELPER
>         select DRM_GEM_CMA_HELPER
>         select DRM_KMS_HELPER
>         select GENERIC_PHY

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

