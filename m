Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A021F5770A5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A601137EF;
	Sat, 16 Jul 2022 18:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B366E10E710
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=sr4QeAPTC5rOv2Gwu52vXoePzx1RjcJLoxawdkPFE20=;
 b=e3K1c1oKd4orgnUTdbFKYQYSyzKZu/FbqHo15VYp7ZOtE+Mvg86P3r2El+Ehkgg38F7Lz30I5bI+o
 UtzYDDdn8FECu2pI2Vyb/btVvvc6Nfd4oT69gT3ebumhVJVJuPru6HXruVKoJER2DWvRwqMFkZk2dM
 2fzr+HOu2RLgO7Kw3ORpkPUJh5BNZItYkC4ut+0sCDSMjV7+M43NA4ER4Is4jVEVfaWAzDHWb/IkD1
 tlRyOKY5NGaE2/O8z2HUx97jcJWjmoQK38u30xBw0IbIOI0IjYU37g7oiAPu16uX4jrje5rU5glfcE
 k7WBB8wbct0+ESAaS3T1YqduLT3qXXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=sr4QeAPTC5rOv2Gwu52vXoePzx1RjcJLoxawdkPFE20=;
 b=q6AzY/oD0iJki9xRmZAWxva3oBjyGto8jEn6YslvTwXg0pIgxAAIP9MJlL/g83JEIWR/MWJYBwp9B
 S0nl3fDAw==
X-HalOne-Cookie: db05ffed2a408ad3cb95e0f165514b1bf98ffb0b
X-HalOne-ID: a607b8ae-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a607b8ae-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:10 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 04/11] drm/r128: Move the r128 driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:43 +0200
Message-Id: <20220716181750.3874838-5-sam@ravnborg.org>
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
 drivers/gpu/drm/Makefile                      | 1 -
 drivers/gpu/drm/dri1/Makefile                 | 1 +
 drivers/gpu/drm/{ => dri1}/r128/Makefile      | 0
 drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.c | 0
 drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.h | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_cce.c    | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_drv.c    | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_drv.h    | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_ioc32.c  | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_irq.c    | 0
 drivers/gpu/drm/{ => dri1}/r128/r128_state.c  | 0
 11 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/{ => dri1}/r128/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.c (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.h (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_cce.c (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_drv.h (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_ioc32.c (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_irq.c (100%)
 rename drivers/gpu/drm/{ => dri1}/r128/r128_state.c (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 08a65237ce4e..0b6b33e64261 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -84,7 +84,6 @@ obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
 obj-$(CONFIG_DRM_DRI1)	+= dri1/
-obj-$(CONFIG_DRM_R128)	+= r128/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_MGA)	+= mga/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index a3525b545670..f243aac48bb9 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -2,4 +2,5 @@
 #
 # Makefile for DRI1 drm device drivers
 
+obj-$(CONFIG_DRM_R128)		+= r128/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
diff --git a/drivers/gpu/drm/r128/Makefile b/drivers/gpu/drm/dri1/r128/Makefile
similarity index 100%
rename from drivers/gpu/drm/r128/Makefile
rename to drivers/gpu/drm/dri1/r128/Makefile
diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/dri1/r128/ati_pcigart.c
similarity index 100%
rename from drivers/gpu/drm/r128/ati_pcigart.c
rename to drivers/gpu/drm/dri1/r128/ati_pcigart.c
diff --git a/drivers/gpu/drm/r128/ati_pcigart.h b/drivers/gpu/drm/dri1/r128/ati_pcigart.h
similarity index 100%
rename from drivers/gpu/drm/r128/ati_pcigart.h
rename to drivers/gpu/drm/dri1/r128/ati_pcigart.h
diff --git a/drivers/gpu/drm/r128/r128_cce.c b/drivers/gpu/drm/dri1/r128/r128_cce.c
similarity index 100%
rename from drivers/gpu/drm/r128/r128_cce.c
rename to drivers/gpu/drm/dri1/r128/r128_cce.c
diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/dri1/r128/r128_drv.c
similarity index 100%
rename from drivers/gpu/drm/r128/r128_drv.c
rename to drivers/gpu/drm/dri1/r128/r128_drv.c
diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/dri1/r128/r128_drv.h
similarity index 100%
rename from drivers/gpu/drm/r128/r128_drv.h
rename to drivers/gpu/drm/dri1/r128/r128_drv.h
diff --git a/drivers/gpu/drm/r128/r128_ioc32.c b/drivers/gpu/drm/dri1/r128/r128_ioc32.c
similarity index 100%
rename from drivers/gpu/drm/r128/r128_ioc32.c
rename to drivers/gpu/drm/dri1/r128/r128_ioc32.c
diff --git a/drivers/gpu/drm/r128/r128_irq.c b/drivers/gpu/drm/dri1/r128/r128_irq.c
similarity index 100%
rename from drivers/gpu/drm/r128/r128_irq.c
rename to drivers/gpu/drm/dri1/r128/r128_irq.c
diff --git a/drivers/gpu/drm/r128/r128_state.c b/drivers/gpu/drm/dri1/r128/r128_state.c
similarity index 100%
rename from drivers/gpu/drm/r128/r128_state.c
rename to drivers/gpu/drm/dri1/r128/r128_state.c
-- 
2.34.1

