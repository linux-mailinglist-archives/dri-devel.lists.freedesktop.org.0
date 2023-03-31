Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADD6D230F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955B10F277;
	Fri, 31 Mar 2023 14:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15C10F27C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:52:41 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id f2se2900N1C8whw062sej2; Fri, 31 Mar 2023 16:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG2N-00FUgr-6b;
 Fri, 31 Mar 2023 16:48:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG36-008fIi-KO;
 Fri, 31 Mar 2023 16:48:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC
 platforms
Date: Fri, 31 Mar 2023 16:48:11 +0200
Message-Id: <972e66cd36e9173ea6817d41565f708cb84bc2f4.1680273039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>
References: <cover.1680273039.git.geert+renesas@glider.be>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCD Controller supported by the drm-shmob driver is not only present
on SuperH SH-Mobile SoCs, but also on Renesas ARM SH/R-Mobile SoCs.
Make its option visible, so the user can enable support for it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/shmobile/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/shmobile/Kconfig
index 4ec5dc74a6b0b880..719d4e7a5cd75aad 100644
--- a/drivers/gpu/drm/shmobile/Kconfig
+++ b/drivers/gpu/drm/shmobile/Kconfig
@@ -2,7 +2,7 @@
 config DRM_SHMOBILE
 	tristate "DRM Support for SH Mobile"
 	depends on DRM && ARM
-	depends on ARCH_SHMOBILE || COMPILE_TEST
+	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.34.1

