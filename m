Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678A5770AE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E843114ABE8;
	Sat, 16 Jul 2022 18:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5893E11B3B4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=MgqcKXSWGAJghPwjHXDECVqbIIh388zeay0Xe1aC0oI=;
 b=lNiwjS0dtMUVBGzZZxl11UFDQSEiu621ryJtu0qnOBRItxnZwK2aGoOCGKRmhxfjtg/M2FMAVIG+P
 WyVKrXcXCv/yT5Z8IkqPCCIZQV4lVmIlRq4iTy/D4PTaJLwc3TdpBwHP33WtQ0oKnTuKYlLCYZlnEZ
 oacjP3t0u2XIYevWA5EDnB27S/5o2UT5Cm2q7IV9Wa34POrR4MVYXfxLNnisbSYSVhFYx8RU2fUFys
 D/0bX93CWMyCSvoCSSWF2XOQkdtH5MhyL68xdr+aJQwOuMfRutzgEzY5EG82As0Bldhz8ljtxWCB5P
 Nv1clDLS4P7mlywqpuC9gTql40OlK1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=MgqcKXSWGAJghPwjHXDECVqbIIh388zeay0Xe1aC0oI=;
 b=lyTvRkP730iQYSd8UTNCQcxCaP2LfbKZIPvb60XvnoNxfo9lVMCMZtA99yBM7HOFs/3wRqF82oAa6
 SFXUADHCw==
X-HalOne-Cookie: 1c15d79fce480e7eb0ff9c04329b3ae079e84783
X-HalOne-ID: a82568dc-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a82568dc-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:14 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 11/11] drm: Move dri1 core files to drm/dri1
Date: Sat, 16 Jul 2022 20:17:50 +0200
Message-Id: <20220716181750.3874838-12-sam@ravnborg.org>
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

To have more of the dri1 specific support in one place move the dri1
core files to the dri1 folder.
The files continue to be part of the drm module, we just refer to the files
with a folder name.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/Makefile                     | 10 +++++++---
 drivers/gpu/drm/{ => dri1}/drm_agpsupport.c  |  0
 drivers/gpu/drm/{ => dri1}/drm_bufs.c        |  0
 drivers/gpu/drm/{ => dri1}/drm_context.c     |  0
 drivers/gpu/drm/{ => dri1}/drm_dma.c         |  0
 drivers/gpu/drm/{ => dri1}/drm_hashtab.c     |  0
 drivers/gpu/drm/{ => dri1}/drm_irq.c         |  0
 drivers/gpu/drm/{ => dri1}/drm_legacy_misc.c |  0
 drivers/gpu/drm/{ => dri1}/drm_lock.c        |  0
 drivers/gpu/drm/{ => dri1}/drm_memory.c      |  0
 drivers/gpu/drm/{ => dri1}/drm_scatter.c     |  0
 drivers/gpu/drm/{ => dri1}/drm_vm.c          |  0
 12 files changed, 7 insertions(+), 3 deletions(-)
 rename drivers/gpu/drm/{ => dri1}/drm_agpsupport.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_bufs.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_context.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_dma.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_hashtab.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_irq.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_legacy_misc.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_lock.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_memory.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_scatter.c (100%)
 rename drivers/gpu/drm/{ => dri1}/drm_vm.c (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a3bd337bcab4..02ae13a71281 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,9 +18,13 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o \
 		drm_managed.o drm_vblank_work.o
-drm-$(CONFIG_DRM_DRI1) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
-			  drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
-			  drm_memory.o drm_scatter.o drm_vm.o
+
+drm-$(CONFIG_DRM_DRI1) += dri1/drm_agpsupport.o dri1/drm_bufs.o \
+			  dri1/drm_context.o dri1/drm_dma.o \
+			  dri1/drm_hashtab.o dri1/drm_irq.o \
+			  dri1/drm_legacy_misc.o dri1/drm_lock.o \
+			  dri1/drm_memory.o dri1/drm_scatter.o \
+			  dri1/drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/dri1/drm_agpsupport.c
similarity index 100%
rename from drivers/gpu/drm/drm_agpsupport.c
rename to drivers/gpu/drm/dri1/drm_agpsupport.c
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/dri1/drm_bufs.c
similarity index 100%
rename from drivers/gpu/drm/drm_bufs.c
rename to drivers/gpu/drm/dri1/drm_bufs.c
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/dri1/drm_context.c
similarity index 100%
rename from drivers/gpu/drm/drm_context.c
rename to drivers/gpu/drm/dri1/drm_context.c
diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/dri1/drm_dma.c
similarity index 100%
rename from drivers/gpu/drm/drm_dma.c
rename to drivers/gpu/drm/dri1/drm_dma.c
diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/dri1/drm_hashtab.c
similarity index 100%
rename from drivers/gpu/drm/drm_hashtab.c
rename to drivers/gpu/drm/dri1/drm_hashtab.c
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/dri1/drm_irq.c
similarity index 100%
rename from drivers/gpu/drm/drm_irq.c
rename to drivers/gpu/drm/dri1/drm_irq.c
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/dri1/drm_legacy_misc.c
similarity index 100%
rename from drivers/gpu/drm/drm_legacy_misc.c
rename to drivers/gpu/drm/dri1/drm_legacy_misc.c
diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/dri1/drm_lock.c
similarity index 100%
rename from drivers/gpu/drm/drm_lock.c
rename to drivers/gpu/drm/dri1/drm_lock.c
diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/dri1/drm_memory.c
similarity index 100%
rename from drivers/gpu/drm/drm_memory.c
rename to drivers/gpu/drm/dri1/drm_memory.c
diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/dri1/drm_scatter.c
similarity index 100%
rename from drivers/gpu/drm/drm_scatter.c
rename to drivers/gpu/drm/dri1/drm_scatter.c
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/dri1/drm_vm.c
similarity index 100%
rename from drivers/gpu/drm/drm_vm.c
rename to drivers/gpu/drm/dri1/drm_vm.c
-- 
2.34.1

