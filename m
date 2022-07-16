Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA15770AA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78515113E13;
	Sat, 16 Jul 2022 18:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7041137EF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=ALw7Zr+63bSFTJU6e0zttKiOAORGVGGBPrHCT91HdoQ=;
 b=I9GQcKCvd0U+XF4CMSQMxEy6+8KLq9iH0sP6pbQj4IGeh8OxLb2va6s4CoZ4jLnjETH7wVTmwzSDx
 4CIOoklEKB0SZZ/CoyxUmbRgCu3Sp5zoE3lMj2n2LUUQ2pIgvNKXx5FjUWtvqq9xZygE2/HC1i0eAu
 O/9bEi+xxG2kDRf+eDuJdzxC6n3fxJBBua2+2znDfCjQ5iQuib3WEC0L6rzGMZRE2lXaYt66CT/hhc
 ZpiZMtMvc80LMcalVQdl0nUDXGC4RXiYrBXAt9YGnMIDCvoSluYJ8jlSAJmdQNQZFo9mXTwAOYcuXD
 LOEwkwxBe6g+VczD7QwMjRHJJvsWtiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=ALw7Zr+63bSFTJU6e0zttKiOAORGVGGBPrHCT91HdoQ=;
 b=qvxrmOpDhkBOI1E9UsfZWJFTaiYjDQVZRpP19lFOAeCylQKbhvBEC51Kvm32lhCSUTA9eCGdRvk6V
 4M01CMaBw==
X-HalOne-Cookie: f61b55bf35c4a516d7cc57a6110fcefe56f9c213
X-HalOne-ID: a5c7c8e8-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a5c7c8e8-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:10 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 03/11] drm/tdfx: Move the tdfx driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:42 +0200
Message-Id: <20220716181750.3874838-4-sam@ravnborg.org>
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
 drivers/gpu/drm/Makefile                   | 2 +-
 drivers/gpu/drm/dri1/Makefile              | 5 +++++
 drivers/gpu/drm/{ => dri1}/tdfx/Makefile   | 0
 drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.c | 0
 drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.h | 0
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/dri1/Makefile
 rename drivers/gpu/drm/{ => dri1}/tdfx/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.h (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index dd7f296ef9b8..08a65237ce4e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -83,7 +83,7 @@ obj-y			+= arm/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
-obj-$(CONFIG_DRM_TDFX)	+= tdfx/
+obj-$(CONFIG_DRM_DRI1)	+= dri1/
 obj-$(CONFIG_DRM_R128)	+= r128/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
new file mode 100644
index 000000000000..a3525b545670
--- /dev/null
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for DRI1 drm device drivers
+
+obj-$(CONFIG_DRM_TDFX)		+= tdfx/
diff --git a/drivers/gpu/drm/tdfx/Makefile b/drivers/gpu/drm/dri1/tdfx/Makefile
similarity index 100%
rename from drivers/gpu/drm/tdfx/Makefile
rename to drivers/gpu/drm/dri1/tdfx/Makefile
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/dri1/tdfx/tdfx_drv.c
similarity index 100%
rename from drivers/gpu/drm/tdfx/tdfx_drv.c
rename to drivers/gpu/drm/dri1/tdfx/tdfx_drv.c
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.h b/drivers/gpu/drm/dri1/tdfx/tdfx_drv.h
similarity index 100%
rename from drivers/gpu/drm/tdfx/tdfx_drv.h
rename to drivers/gpu/drm/dri1/tdfx/tdfx_drv.h
-- 
2.34.1

