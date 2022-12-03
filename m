Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CE6415FC
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 11:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F04891A3;
	Sat,  3 Dec 2022 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B5010E1E9
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 10:38:51 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1670063930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKli1j81Mt49ShJw5xd91e0oo3zditEnNv2n0wOvdeE=;
 b=ojrwLtOP+27fz8furSw/BrnhDyU9SyFLG5HmTcnR6uECEOqEUxnvAXjLxVj3U7baiA6AcO
 nT6hqkEv/Ju7oezuVImVIXVizp0ucN06v76v73MFqRYAXWhAO7OI9TsMtsoQVakRo/6v9f
 LAIbSC7ku46kr7+jzWB/zGYsCmLyZsY=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: tzimmermann@suse.de
Subject: [RESEND PATCH linux-next v2 10/10] MAINTAINERS: Remove some obsolete
 drivers info(tdfx, mga, i810, savage, r128, sis)
Date: Sat,  3 Dec 2022 18:23:01 +0800
Message-Id: <20221203102502.3185-11-cai.huoqing@linux.dev>
In-Reply-To: <20221203102502.3185-1-cai.huoqing@linux.dev>
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
marked these drivers obsolete 7 years ago.
And the mesa UMD of this drm driver already in deprecated list
in the link: https://docs.mesa3d.org/systems.html
3dfx Glide-->driver/gpu/drm/tdfx
Matrox-->driver/gpu/drm/mga
Intel i810-->driver/gpu/drm/i810
S3 Savage-->drivers/gpu/drm/savage
ATI Rage 128->drivers/gpu/drm/r128
Silicon Integrated Systems->drivers/gpu/drm/sis

It's time to remove these drivers.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 MAINTAINERS | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d023bb9445d..5a33e34d35a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6569,11 +6569,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 F:	drivers/gpu/drm/tiny/ili9486.c
 
-DRM DRIVER FOR INTEL I810 VIDEO CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/i810/
-F:	include/uapi/drm/i810_drm.h
-
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
 S:	Maintained
@@ -6602,11 +6597,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml
 F:	drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
 
-DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/mga/
-F:	include/uapi/drm/mga_drm.h
-
 DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 R:	Thomas Zimmermann <tzimmermann@suse.de>
@@ -6725,11 +6715,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/qxl/
 F:	include/uapi/drm/qxl_drm.h
 
-DRM DRIVER FOR RAGE 128 VIDEO CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/r128/
-F:	include/uapi/drm/r128_drm.h
-
 DRM DRIVER FOR RAYDIUM RM67191 PANELS
 M:	Robert Chiras <robert.chiras@nxp.com>
 S:	Maintained
@@ -6757,11 +6742,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
 F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
 
-DRM DRIVER FOR SAVAGE VIDEO CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/savage/
-F:	include/uapi/drm/savage_drm.h
-
 DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 M:	Javier Martinez Canillas <javierm@redhat.com>
@@ -6777,11 +6757,6 @@ F:	include/drm/drm_aperture.h
 F:	include/linux/aperture.h
 F:	include/video/nomodeset.h
 
-DRM DRIVER FOR SIS VIDEO CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/sis/
-F:	include/uapi/drm/sis_drm.h
-
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
@@ -6809,10 +6784,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
-DRM DRIVER FOR TDFX VIDEO CARDS
-S:	Orphan / Obsolete
-F:	drivers/gpu/drm/tdfx/
-
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-- 
2.25.1

