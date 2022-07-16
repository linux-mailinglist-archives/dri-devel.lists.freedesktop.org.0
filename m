Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B05770A8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554D211B2AE;
	Sat, 16 Jul 2022 18:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180D910E710
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=IXtw3tafU4mScuN2nLd9yErjeYseeDy3/hqtfWpDzI4=;
 b=BPQPGMHZXDax8otqWDMJYhP1E/C5pJiVsIEZ5fmj/LtGjMuasGsYu06dAJzkiptpRknZpDBFw6+Jm
 bUkHkmpX3DCnLZXvCks0HygoZeGI9f7i13Xu7WQLi9hPzU4hhyLle5GWCU9i5t2yRUgbBuxmAujeve
 TPOreFSng1jyjywByr23iVKpyarduxO7CwgFaOAUG1+2BDaEoA57h43WDehAd/1qpyxX2fkV6fPysn
 /AMTFYiCGX9yOqmIo/Zw6UuEfUcok7RJqp8XnEHnyT6g4QJFIa1r3fmKMERSNvxIsbG8xMBou3/eC0
 ThitmKjjuMuEdYa6cesjlmwWECP/D4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=IXtw3tafU4mScuN2nLd9yErjeYseeDy3/hqtfWpDzI4=;
 b=P7ASg2yf2mDHxh1rEvKNYdlX1RPxKcrug+ViThzL2dT/XO+1UhRlhFpT5jaurg3NFz7bBLT4zSF0a
 S7Zk5swCg==
X-HalOne-Cookie: af5d15f1f4993f6a506e049e346c18e41a640f06
X-HalOne-ID: a6ea2f2f-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a6ea2f2f-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 07/11] drm/sis: Move the sis driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:46 +0200
Message-Id: <20220716181750.3874838-8-sam@ravnborg.org>
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
 drivers/gpu/drm/Makefile                 | 1 -
 drivers/gpu/drm/dri1/Makefile            | 1 +
 drivers/gpu/drm/{ => dri1}/sis/Makefile  | 0
 drivers/gpu/drm/{ => dri1}/sis/sis_drv.c | 0
 drivers/gpu/drm/{ => dri1}/sis/sis_drv.h | 0
 drivers/gpu/drm/{ => dri1}/sis/sis_mm.c  | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/{ => dri1}/sis/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/sis/sis_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/sis/sis_drv.h (100%)
 rename drivers/gpu/drm/{ => dri1}/sis/sis_mm.c (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 363cecfff919..7de784da6345 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -91,7 +91,6 @@ obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
-obj-$(CONFIG_DRM_SIS)   += sis/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VIA)	+=via/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index c254e443aa3a..23e33398fdf5 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -5,4 +5,5 @@
 obj-$(CONFIG_DRM_I810)		+= i810/
 obj-$(CONFIG_DRM_MGA)		+= mga/
 obj-$(CONFIG_DRM_R128)		+= r128/
+obj-$(CONFIG_DRM_SIS)		+= sis/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
diff --git a/drivers/gpu/drm/sis/Makefile b/drivers/gpu/drm/dri1/sis/Makefile
similarity index 100%
rename from drivers/gpu/drm/sis/Makefile
rename to drivers/gpu/drm/dri1/sis/Makefile
diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/dri1/sis/sis_drv.c
similarity index 100%
rename from drivers/gpu/drm/sis/sis_drv.c
rename to drivers/gpu/drm/dri1/sis/sis_drv.c
diff --git a/drivers/gpu/drm/sis/sis_drv.h b/drivers/gpu/drm/dri1/sis/sis_drv.h
similarity index 100%
rename from drivers/gpu/drm/sis/sis_drv.h
rename to drivers/gpu/drm/dri1/sis/sis_drv.h
diff --git a/drivers/gpu/drm/sis/sis_mm.c b/drivers/gpu/drm/dri1/sis/sis_mm.c
similarity index 100%
rename from drivers/gpu/drm/sis/sis_mm.c
rename to drivers/gpu/drm/dri1/sis/sis_mm.c
-- 
2.34.1

