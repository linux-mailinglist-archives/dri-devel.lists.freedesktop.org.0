Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168A45BA816
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933B910ECD9;
	Fri, 16 Sep 2022 08:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2C010ECDC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:22:27 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C2CF496;
 Fri, 16 Sep 2022 10:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663316545;
 bh=fYeV+cbQCWldkWdo8LIksuwCzN5jDYIPYNI5pXw6Mfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+uMZfkUmvhSd6JH+A3vecq29zy2fBGwswKwgLzJeEpivI2j8dGnYUMJ0JnblVDYD
 BaMKXBPGT5/sUIpnTyzmlcr7fjM2oghLBu9vFlZ2ux194EUFLRYK5mSfQT3In2PfmZ
 BIARSw7+XIAWmp6SS27oIrcE64TEP+Zyz6qrB8zY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: [PATCH 2/2] drm/omap: Fix kernel docs
Date: Fri, 16 Sep 2022 11:22:06 +0300
Message-Id: <20220916082206.167427-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916082206.167427-1-tomi.valkeinen@ideasonboard.com>
References: <20220916082206.167427-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix doc related warnings seen with W=1: the function names have changed
but the docs have not been changed accordingly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index cf571796fd26..d6b4934fa0fd 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -605,7 +605,7 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 
 /**
- * omap_gem_dumb_map	-	buffer mapping for dumb interface
+ * omap_gem_dumb_map_offset - create an offset for a dumb buffer
  * @file: our drm client file
  * @dev: drm device
  * @handle: GEM handle to the object (from dumb_create)
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 4aca14dab927..a6f0bbc879d2 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -99,7 +99,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 }
 
 /**
- * enable_vblank - enable vblank interrupt events
+ * omap_irq_enable_vblank - enable vblank interrupt events
  * @crtc: DRM CRTC
  *
  * Enable vblank interrupts for @crtc.  If the device doesn't have
@@ -129,7 +129,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
 }
 
 /**
- * disable_vblank - disable vblank interrupt events
+ * omap_irq_disable_vblank - disable vblank interrupt events
  * @crtc: DRM CRTC
  *
  * Disable vblank interrupts for @crtc.  If the device doesn't have
-- 
2.34.1

