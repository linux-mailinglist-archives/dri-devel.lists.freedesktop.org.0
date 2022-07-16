Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4D5770AF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434011BBD3;
	Sat, 16 Jul 2022 18:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A135F1137EF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=QNlqCDzBC/xc9ObXOnKybDxb7MBaSlE35AVrZ/ElDiE=;
 b=ken5ZUOtrSkH79Djlbgg04afbXhsQnL0GTW0w9L084+MSO0ppz4AG/nPUtnxzC/50lFY6QqcEx/6+
 lfSa8B9xQnlqv3W5Zef5ZUIxA7Esock/xdzOMna6lELNV7S5qdgtAxNVi8RTnu/eGsM0+2z3aJNs4V
 RQx0nL734LnEUnE+oKTTIme6l0GIsLJbo+2k45I3fIdBXNClDRRddZf7kLHf1LOdsUQNB4pmJcKJAC
 51B3Zc6FOmZtEAUhyNujIhSiXpOgfNzMMDRsZLmaPdxPFL5G7b1u/YPNFBiWzbWFmBSLpEfb1DK0BI
 v6CTTeaq+VHfX+jYz3YiWqa6hXhRilw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=QNlqCDzBC/xc9ObXOnKybDxb7MBaSlE35AVrZ/ElDiE=;
 b=XCG826ZmL26v/J5sQ73VtxT3DAkkPaOVVf1GnIrnsu7G2O3cFNsiCG7AqUwsIJNvttmw1LPA8T9fq
 HnUEfEQDA==
X-HalOne-Cookie: a691bb4bf282d6cf169d4d6ef68570725fe6511c
X-HalOne-ID: a69d0114-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a69d0114-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:11 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 06/11] drm/mga: Move the mga driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:45 +0200
Message-Id: <20220716181750.3874838-7-sam@ravnborg.org>
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
 drivers/gpu/drm/{ => dri1}/mga/Makefile    | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_dma.c   | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_drv.c   | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_drv.h   | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_ioc32.c | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_irq.c   | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_state.c | 0
 drivers/gpu/drm/{ => dri1}/mga/mga_warp.c  | 0
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/{ => dri1}/mga/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_dma.c (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_drv.h (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_ioc32.c (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_irq.c (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_state.c (100%)
 rename drivers/gpu/drm/{ => dri1}/mga/mga_warp.c (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9a664a4a021d..363cecfff919 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -86,7 +86,6 @@ obj-$(CONFIG_DRM_SCHED)	+= scheduler/
 obj-$(CONFIG_DRM_DRI1)	+= dri1/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
-obj-$(CONFIG_DRM_MGA)	+= mga/
 obj-$(CONFIG_DRM_I915)	+= i915/
 obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index d16bfdf26888..c254e443aa3a 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -3,5 +3,6 @@
 # Makefile for DRI1 drm device drivers
 
 obj-$(CONFIG_DRM_I810)		+= i810/
+obj-$(CONFIG_DRM_MGA)		+= mga/
 obj-$(CONFIG_DRM_R128)		+= r128/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
diff --git a/drivers/gpu/drm/mga/Makefile b/drivers/gpu/drm/dri1/mga/Makefile
similarity index 100%
rename from drivers/gpu/drm/mga/Makefile
rename to drivers/gpu/drm/dri1/mga/Makefile
diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/dri1/mga/mga_dma.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_dma.c
rename to drivers/gpu/drm/dri1/mga/mga_dma.c
diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/dri1/mga/mga_drv.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_drv.c
rename to drivers/gpu/drm/dri1/mga/mga_drv.c
diff --git a/drivers/gpu/drm/mga/mga_drv.h b/drivers/gpu/drm/dri1/mga/mga_drv.h
similarity index 100%
rename from drivers/gpu/drm/mga/mga_drv.h
rename to drivers/gpu/drm/dri1/mga/mga_drv.h
diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/dri1/mga/mga_ioc32.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_ioc32.c
rename to drivers/gpu/drm/dri1/mga/mga_ioc32.c
diff --git a/drivers/gpu/drm/mga/mga_irq.c b/drivers/gpu/drm/dri1/mga/mga_irq.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_irq.c
rename to drivers/gpu/drm/dri1/mga/mga_irq.c
diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/dri1/mga/mga_state.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_state.c
rename to drivers/gpu/drm/dri1/mga/mga_state.c
diff --git a/drivers/gpu/drm/mga/mga_warp.c b/drivers/gpu/drm/dri1/mga/mga_warp.c
similarity index 100%
rename from drivers/gpu/drm/mga/mga_warp.c
rename to drivers/gpu/drm/dri1/mga/mga_warp.c
-- 
2.34.1

