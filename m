Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E772873AE1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D72A10EE4D;
	Wed,  6 Mar 2024 15:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ihUgh79U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68EB10EE4D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:38:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 94FA3CE13D9;
 Wed,  6 Mar 2024 15:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58414C433C7;
 Wed,  6 Mar 2024 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709739525;
 bh=to7hc+iFZkutpmt/gF7U97nNfajbMA19g8xLSnruV9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ihUgh79UuVM9ucjToYYXKp5eRVHOyte0xF8ro0fpCoxytT7xdKQuqzqt0RtkO3Cej
 KI5/YLSY0lm5l702D5wJs1c3909v8cHJWwyWEcFEpwkG2/IkOPb6gEIN1yy9svDXK+
 j4Lp0gdukZ4Tz7duIVLCZ/bOAbb09pDefZvM34+1xssK+6GsDGWXgdLUTmz5B4qxdY
 mKfHvAvVpoiA/PNBRTNmds830W1rI9FbZRJdvpTYXXWYdRXRJy1aX5HQ/E5gMDJXDv
 WaUH9tCNSaVtN2MOHIMi7y25wRquYRDM53qlJoLTy1Ve1JRECImw94kpPR3jg/QOsg
 OzLxfn9y7BN0w==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH v2 1/2] MAINTAINERS: Update drm-misc.git URL
Date: Wed,  6 Mar 2024 16:38:38 +0100
Message-ID: <20240306153841.698693-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the drm-misc tree has moved to Gitlab, adjust the MAINTAINERS
git trees to reflect the location change.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS | 172 ++++++++++++++++++++++++++--------------------------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a95919fbc3d..d4e33b3a3bc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1649,11 +1649,11 @@ F:	drivers/power/reset/arm-versatile-reboot.c
 F:	drivers/soc/versatile/
 
 ARM KOMEDA DRM-KMS DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/arm,komeda.yaml
 F:	Documentation/gpu/komeda-kms.rst
 F:	drivers/gpu/drm/arm/display/include/
 F:	drivers/gpu/drm/arm/display/komeda/
 
@@ -1661,30 +1661,30 @@ ARM MALI PANFROST DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Rob Herring <robh@kernel.org>
 R:	Steven Price <steven.price@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
 M:	Liviu Dudau <liviu.dudau@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/arm,malidp.yaml
 F:	Documentation/gpu/afbc.rst
 F:	drivers/gpu/drm/arm/
 
 ARM MFM AND FLOPPY DRIVERS
@@ -6268,11 +6268,11 @@ M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Christian König <christian.koenig@amd.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/driver-api/dma-buf.rst
 F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
@@ -6322,11 +6322,11 @@ R:	John Stultz <jstultz@google.com>
 R:	T.J. Mercier <tjmercier@google.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/dma-buf/dma-heap.c
 F:	drivers/dma-buf/heaps/*
 F:	include/linux/dma-heap.h
 F:	include/uapi/linux/dma-heap.h
 
@@ -6530,11 +6530,11 @@ F:	include/linux/power/smartreflex.h
 DRM ACCEL DRIVERS FOR INTEL VPU
 M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
 M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/accel/ivpu/
 F:	include/uapi/drm/ivpu_accel.h
 
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
@@ -6550,47 +6550,47 @@ DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
 DRM DRIVER FOR ARM PL111 CLCD
 S:	Orphan
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/pl111/
 
 DRM DRIVER FOR ARM VERSATILE TFT PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
 F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 
 DRM DRIVER FOR ASPEED BMC GFX
 M:	Joel Stanley <joel@jms.id.au>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
 F:	drivers/gpu/drm/aspeed/
 
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
 R:	Jocelyn Falempe <jfalempe@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ast/
 
 DRM DRIVER FOR BOCHS VIRTUAL GPU
 M:	Gerd Hoffmann <kraxel@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/bochs.c
 
 DRM DRIVER FOR BOE HIMAX8279D PANELS
 M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
 S:	Maintained
@@ -6604,18 +6604,18 @@ F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c
 
 DRM DRIVER FOR EBBG FT8719 PANEL
 M:	Joel Selvaraj <jo@jsfamily.in>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 F:	drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 
 DRM DRIVER FOR FARADAY TVE200 TV ENCODER
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tve200/
 
 DRM DRIVER FOR FEIXIN K101 IM2BA02 MIPI-DSI LCD PANELS
 M:	Icenowy Zheng <icenowy@aosc.io>
 S:	Maintained
@@ -6631,11 +6631,11 @@ F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_aperture.c
 F:	drivers/gpu/drm/tiny/ofdrm.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
@@ -6650,53 +6650,53 @@ F:	drivers/gpu/drm/panel/panel-edp.c
 
 DRM DRIVER FOR GENERIC USB DISPLAY
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
 W:	https://github.com/notro/gud/wiki
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/gud/
 F:	include/drm/gud.h
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
 
 DRM DRIVER FOR HX8357D PANELS
 S:	Orphan
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/himax,hx8357d.txt
 F:	drivers/gpu/drm/tiny/hx8357d.c
 
 DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
 M:	Deepak Rawat <drawat.floss@gmail.com>
 L:	linux-hyperv@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/hyperv
 
 DRM DRIVER FOR ILITEK ILI9225 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ilitek,ili9225.txt
 F:	drivers/gpu/drm/tiny/ili9225.c
 
 DRM DRIVER FOR ILITEK ILI9486 PANELS
 M:	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
 DRM DRIVER FOR ILITEK ILI9805 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
@@ -6711,18 +6711,18 @@ F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/logicvc/
 
 DRM DRIVER FOR LVDS PANELS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/lvds.yaml
 F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
 F:	drivers/gpu/drm/panel/panel-lvds.c
 
 DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
@@ -6736,25 +6736,25 @@ DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
 R:	Jocelyn Falempe <jfalempe@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/mgag200/
 
 DRM DRIVER FOR MI0283QT
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 F:	drivers/gpu/drm/tiny/mi0283qt.c
 
 DRM DRIVER FOR MIPI DBI compatible panels
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
 W:	https://github.com/notro/panel-mipi-dbi/wiki
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
@@ -6774,32 +6774,32 @@ F:	drivers/gpu/drm/msm/
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER FOR NOVATEK NT35510 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
 
 DRM DRIVER FOR NOVATEK NT35560 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35560.c
 
 DRM DRIVER FOR NOVATEK NT36523 PANELS
 M:	Jianhua Lu <lujianhua000@gmail.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
 
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Karol Herbst <kherbst@redhat.com>
@@ -6829,30 +6829,30 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
 F:	drivers/gpu/drm/bridge/parade-ps8640.c
 
 DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Obsolete
 W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/tiny/cirrus.c
 
 DRM DRIVER FOR QXL VIRTUAL GPU
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
 L:	virtualization@lists.linux.dev
 L:	spice-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/qxl/
 F:	include/uapi/drm/qxl_drm.h
 
 DRM DRIVER FOR RAYDIUM RM67191 PANELS
 M:	Robert Chiras <robert.chiras@nxp.com>
@@ -6861,20 +6861,20 @@ F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-db7430.c
 
 DRM DRIVER FOR SAMSUNG MIPI DSIM BRIDGE
 M:	Inki Dae <inki.dae@samsung.com>
 M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 F:	drivers/gpu/drm/bridge/samsung-dsim.c
 F:	include/drm/bridge/samsung-dsim.h
 
 DRM DRIVER FOR SAMSUNG S6D27A1 PANELS
@@ -6890,11 +6890,11 @@ F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
@@ -6911,26 +6911,26 @@ F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
 F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
 
 DRM DRIVER FOR SITRONIX ST7735R PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/tiny/st7735r.c
 
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
 DRM DRIVER FOR ST-ERICSSON MCDE
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
 DRM DRIVER FOR SYNAPTICS R63353 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
@@ -6950,55 +6950,55 @@ F:	Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
 F:	drivers/gpu/drm/bridge/ti-sn65dsi86.c
 
 DRM DRIVER FOR TPO TPG110 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
 F:	drivers/gpu/drm/panel/panel-tpo-tpg110.c
 
 DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/udl/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
 M:	Melissa Wen <melissa.srw@gmail.com>
 M:	Maíra Canal <mairacanal@riseup.net>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Daniel Vetter <daniel@ffwll.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/vkms.rst
 F:	drivers/gpu/drm/vkms/
 
 DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/vboxvideo/
 
 DRM DRIVER FOR VMWARE VIRTUAL GPU
 M:	Zack Rusin <zack.rusin@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/vmwgfx/
 F:	include/uapi/drm/vmwgfx_drm.h
 
 DRM DRIVER FOR WIDECHIPS WS2401 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c
 
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
@@ -7020,11 +7020,11 @@ DRM DRIVERS AND MISC GPU PATCHES
 M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Maintained
 W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
@@ -7047,21 +7047,21 @@ X:	drivers/gpu/drm/tegra/
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/allwinner*
 F:	drivers/gpu/drm/sun4i/
 
 DRM DRIVERS FOR AMLOGIC SOCS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
 F:	Documentation/gpu/meson.rst
 F:	drivers/gpu/drm/ci/xfails/meson*
 F:	drivers/gpu/drm/meson/
@@ -7069,11 +7069,11 @@ F:	drivers/gpu/drm/meson/
 DRM DRIVERS FOR ATMEL HLCDC
 M:	Sam Ravnborg <sam@ravnborg.org>
 M:	Boris Brezillon <bbrezillon@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/atmel/
 F:	drivers/gpu/drm/atmel-hlcdc/
 
 DRM DRIVERS FOR BRIDGE CHIPS
 M:	Andrzej Hajda <andrzej.hajda@intel.com>
@@ -7081,11 +7081,11 @@ M:	Neil Armstrong <neil.armstrong@linaro.org>
 M:	Robert Foss <rfoss@kernel.org>
 R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
 R:	Jonas Karlman <jonas@kwiboo.se>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
 F:	drivers/gpu/drm/drm_bridge.c
 F:	drivers/gpu/drm/drm_bridge_connector.c
 F:	include/drm/drm_bridge.h
@@ -7106,20 +7106,20 @@ F:	include/uapi/drm/exynos_drm.h
 DRM DRIVERS FOR FREESCALE DCU
 M:	Stefan Agner <stefan@agner.ch>
 M:	Alison Wang <alison.wang@nxp.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
 F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
 F:	drivers/gpu/drm/fsl-dcu/
 
 DRM DRIVERS FOR FREESCALE IMX 5/6
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 T:	git git://git.pengutronix.de/git/pza/linux
 F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
@@ -7135,11 +7135,11 @@ F:	drivers/gpu/drm/bridge/imx/
 
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/gma500/
 
 DRM DRIVERS FOR HISILICON
 M:	Xinliang Liu <xinliang.liu@linaro.org>
 M:	Tian Tao  <tiantao6@hisilicon.com>
@@ -7147,28 +7147,28 @@ R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
 R:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Yongqin Liu <yongqin.liu@linaro.org>
 R:	John Stultz <jstultz@google.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/hisilicon/
 F:	drivers/gpu/drm/hisilicon/
 
 DRM DRIVERS FOR LIMA
 M:	Qiang Yu <yuq825@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 L:	lima@lists.freedesktop.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
 DRM DRIVERS FOR LOONGSON
 M:	Sui Jingfeng <suijingfeng@loongson.cn>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/loongson/
 
 DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
@@ -7212,96 +7212,96 @@ F:	drivers/gpu/drm/renesas/rcar-du/
 DRM DRIVERS FOR RENESAS RZ
 M:	Biju Das <biju.das.jz@bp.renesas.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 F:	drivers/gpu/drm/renesas/rz-du/
 
 DRM DRIVERS FOR RENESAS SHMOBILE
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
 
 DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
 M:	Andy Yan <andy.yan@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/rockchip/
 F:	drivers/gpu/drm/ci/xfails/rockchip*
 F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
 F:	drivers/gpu/drm/sti
 
 DRM DRIVERS FOR STM
 M:	Yannick Fertre <yannick.fertre@foss.st.com>
 M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
 M:	Philippe Cornu <philippe.cornu@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
 F:	drivers/gpu/drm/stm
 
 DRM DRIVERS FOR TI KEYSTONE
 M:	Jyri Sarha <jyri.sarha@iki.fi>
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
 F:	drivers/gpu/drm/tidss/
 
 DRM DRIVERS FOR TI LCDC
 M:	Jyri Sarha <jyri.sarha@iki.fi>
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/tilcdc/
 F:	drivers/gpu/drm/tilcdc/
 
 DRM DRIVERS FOR TI OMAP
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ti/
 F:	drivers/gpu/drm/omapdrm/
 
 DRM DRIVERS FOR V3D
 M:	Melissa Wen <mwen@igalia.com>
 M:	Maíra Canal <mcanal@igalia.com>
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
 F:	drivers/gpu/drm/v3d/
 F:	include/uapi/drm/v3d_drm.h
 
 DRM DRIVERS FOR VC4
 M:	Maxime Ripard <mripard@kernel.org>
 S:	Supported
 T:	git git://github.com/anholt/linux
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
 DRM DRIVERS FOR VIVANTE GPU IP
@@ -7318,65 +7318,65 @@ F:	include/uapi/drm/etnaviv_drm.h
 DRM DRIVERS FOR XEN
 M:	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
 L:	dri-devel@lists.freedesktop.org
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/xen-front.rst
 F:	drivers/gpu/drm/xen/
 
 DRM DRIVERS FOR XILINX
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
 M:	Luben Tuikov <ltuikov89@gmail.com>
 M:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Jessica Zhang <quic_jesszhan@quicinc.com>
 R:	Sam Ravnborg <sam@ravnborg.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/
 F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
 
 DRM PRIVACY-SCREEN CLASS
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_privacy_screen*
 F:	include/drm/drm_privacy_screen*
 
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.koike@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/automated_testing.rst
 F:	drivers/gpu/drm/ci/
 
 DSBR100 USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
@@ -8422,11 +8422,11 @@ W:	https://floatingpoint.billm.au/
 F:	arch/x86/math-emu/
 
 FRAMEBUFFER CORE
 M:	Daniel Vetter <daniel@ffwll.ch>
 S:	Odd Fixes
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/video/fbdev/core/
 
 FRAMEBUFFER LAYER
 M:	Helge Deller <deller@gmx.de>
 L:	linux-fbdev@vger.kernel.org
@@ -10494,11 +10494,11 @@ F:	drivers/media/rc/img-ir/
 
 IMGTEC POWERVR DRM DRIVER
 M:	Frank Binns <frank.binns@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
@@ -11281,11 +11281,11 @@ F:	tools/testing/selftests/iommu/
 
 IOSYS-MAP HELPERS
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	include/linux/iosys-map.h
 
 IO_URING
 M:	Jens Axboe <axboe@kernel.dk>
 R:	Pavel Begunkov <asml.silence@gmail.com>
@@ -11474,11 +11474,11 @@ F:	drivers/media/tuners/it913x*
 
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 F:	drivers/gpu/drm/bridge/ite-it66121.c
 
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
@@ -15025,11 +15025,11 @@ F:	drivers/media/tuners/mxl5007t.*
 MXSFB DRM DRIVER
 M:	Marek Vasut <marex@denx.de>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 F:	drivers/gpu/drm/mxsfb/
 
 MYLEX DAC960 PCI RAID Controller
 M:	Hannes Reinecke <hare@kernel.org>
@@ -15765,11 +15765,11 @@ F:	include/uapi/linux/dw100.h
 NXP i.MX 8MQ DCSS DRIVER
 M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
 R:	Lucas Stach <l.stach@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 F:	drivers/gpu/drm/imx/dcss/
 
 NXP i.MX 8QXP ADC DRIVER
 M:	Cai Huoqing <cai.huoqing@linux.dev>
@@ -18074,11 +18074,11 @@ M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
 R:	Carl Vanderlip <quic_carlv@quicinc.com>
 R:	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/qaic/
 F:	drivers/accel/qaic/
 F:	include/uapi/drm/qaic_accel.h
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
@@ -21194,11 +21194,11 @@ SYNC FILE FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Gustavo Padovan <gustavo@padovan.org>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/driver-api/sync_file.rst
 F:	drivers/dma-buf/dma-fence*
 F:	drivers/dma-buf/sw_sync.c
 F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
@@ -22966,11 +22966,11 @@ F:	lib/iov_iter.c
 
 USERSPACE DMA BUFFER DRIVER
 M:	Gerd Hoffmann <kraxel@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/dma-buf/udmabuf.c
 F:	include/uapi/linux/udmabuf.h
 
 USERSPACE I/O (UIO)
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
@@ -23142,11 +23142,11 @@ S:	Maintained
 F:	drivers/vfio/platform/
 
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/vga-switcheroo.rst
 F:	drivers/gpu/vga/vga_switcheroo.c
 F:	include/linux/vga_switcheroo.h
 
 VIA RHINE NETWORK DRIVER
@@ -23335,11 +23335,11 @@ M:	Gerd Hoffmann <kraxel@redhat.com>
 R:	Gurchetan Singh <gurchetansingh@chromium.org>
 R:	Chia-I Wu <olvaffe@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 L:	virtualization@lists.linux.dev
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ci/xfails/virtio*
 F:	drivers/gpu/drm/virtio/
 F:	include/uapi/linux/virtio_gpu.h
 
 VIRTIO HOST (VHOST)
-- 
2.43.2

