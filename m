Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895205770AB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9777211AE20;
	Sat, 16 Jul 2022 18:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ED51137EF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=ygd7x4eR1ku5jqLzs9upfQL0KZyzFuaUVslgwwd5MAc=;
 b=lVr1QVdQp7wWViVxSa4Kk1VH8EJ80aXHR2Ga5oHzs0RMldGOPLpsD3aqqhQl4lX5twoYUk3P3GAoQ
 QKHdXmtr5m09kODOLADG094GFMoaGbiih67wy7lB4OHyQgQLQ8Z9Y4P9X3I2N+2bIXqmjMWHww1f6I
 d6PtWp2mGgNhUN7UaWwBwl2xtmqZatFmxr/toLeb5SSMApRF0gf3R9jGSbs3cZ0oyM3Q5XpK15oy1h
 sm3Rky4WdvTk/el1QIsQ+t249/GkhoMADru1xzVc/cEu8531x9135pm/BOfHZDjfP49lMiCW83eNZn
 f5bJenIFCV8J455Gk1nqcvyvYC5Tk8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=ygd7x4eR1ku5jqLzs9upfQL0KZyzFuaUVslgwwd5MAc=;
 b=9c510AEsXHgkcwOgduSSmI+i8K7f2DkTLEaBG1Og3LVLWkn46jPMJIDzlSbgI2HzMVQxuwsOCLi0B
 e6CVkefBw==
X-HalOne-Cookie: af2adccfd935b75d08b75aa9130fc2892fc83c7b
X-HalOne-ID: a65b1f60-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a65b1f60-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:11 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 05/11] drm/i810: Move the i810 driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:44 +0200
Message-Id: <20220716181750.3874838-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220716181750.3874838-1-sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/dri1 is the new home for all the legacy DRI1 drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/Makefile                   | 1 -
 drivers/gpu/drm/dri1/Makefile              | 1 +
 drivers/gpu/drm/{ => dri1}/i810/Makefile   | 0
 drivers/gpu/drm/{ => dri1}/i810/i810_dma.c | 0
 drivers/gpu/drm/{ => dri1}/i810/i810_drv.c | 0
 drivers/gpu/drm/{ => dri1}/i810/i810_drv.h | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/{ => dri1}/i810/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/i810/i810_dma.c (100%)
 rename drivers/gpu/drm/{ => dri1}/i810/i810_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/i810/i810_drv.h (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0b6b33e64261..9a664a4a021d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -87,7 +87,6 @@ obj-$(CONFIG_DRM_DRI1)	+= dri1/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_MGA)	+= mga/
-obj-$(CONFIG_DRM_I810)	+= i810/
 obj-$(CONFIG_DRM_I915)	+= i915/
 obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index f243aac48bb9..d16bfdf26888 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -2,5 +2,6 @@
 #
 # Makefile for DRI1 drm device drivers
 
+obj-$(CONFIG_DRM_I810)		+= i810/
 obj-$(CONFIG_DRM_R128)		+= r128/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
diff --git a/drivers/gpu/drm/i810/Makefile b/drivers/gpu/drm/dri1/i810/Makefile
similarity index 100%
rename from drivers/gpu/drm/i810/Makefile
rename to drivers/gpu/drm/dri1/i810/Makefile
diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/dri1/i810/i810_dma.c
similarity index 100%
rename from drivers/gpu/drm/i810/i810_dma.c
rename to drivers/gpu/drm/dri1/i810/i810_dma.c
diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/dri1/i810/i810_drv.c
similarity index 100%
rename from drivers/gpu/drm/i810/i810_drv.c
rename to drivers/gpu/drm/dri1/i810/i810_drv.c
diff --git a/drivers/gpu/drm/i810/i810_drv.h b/drivers/gpu/drm/dri1/i810/i810_drv.h
similarity index 100%
rename from drivers/gpu/drm/i810/i810_drv.h
rename to drivers/gpu/drm/dri1/i810/i810_drv.h
-- 
2.34.1

