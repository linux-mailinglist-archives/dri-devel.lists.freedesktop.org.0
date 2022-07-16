Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3A5770AC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4875D11B722;
	Sat, 16 Jul 2022 18:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CB910E710
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=NNt1Kw96OrpHMORBjGtZQu5ATXnDc/FkkYhDy9P2fH4=;
 b=jjwlaJhWSqmUw4pjDWCXrwDW+V3SQmX6wwBVuTiqayTl0Joy5L1Z/1VxVb9ftJPKcFhHzO1kwILvq
 aoQVhV1PaVo8dIsSNP5wFgd2Ar50ltZSCCGkj1wSx4PPC5DYyPQq3W6pzKymDZ1njBlYSuDMZiMJbg
 XNSGBD/kQV0nRMjVEg/2faXAL/J9drWkGGbD+pqx1Nxm1ntR9CM4mf8YMRRUiREZbzh1KOdTvH/Efh
 9aD5U/exCIer/fJZAhqTN/rEjFxm9z9nIWuslOTo2PojlpTiNqD8fxlt9UtpvKqXTl9+SCOGScveiK
 yXx4lhPjyVZ1LulmUdM95vkrXTEmPag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=NNt1Kw96OrpHMORBjGtZQu5ATXnDc/FkkYhDy9P2fH4=;
 b=eO96aoDv1VZOmuvibB73eCJceizAmYu2kvTkJlBdoTJI7G8CMXgkIo5NgrmXa4vI/SCStYXISAz6v
 kXZYRJgBA==
X-HalOne-Cookie: 6e889f98c26160eda7a71683b9db1b924c3bb7f8
X-HalOne-ID: a770038b-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a770038b-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 09/11] drm/savage: Move the savage driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:48 +0200
Message-Id: <20220716181750.3874838-10-sam@ravnborg.org>
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
 drivers/gpu/drm/Makefile                         | 1 -
 drivers/gpu/drm/dri1/Makefile                    | 1 +
 drivers/gpu/drm/{ => dri1}/savage/Makefile       | 0
 drivers/gpu/drm/{ => dri1}/savage/savage_bci.c   | 0
 drivers/gpu/drm/{ => dri1}/savage/savage_drv.c   | 0
 drivers/gpu/drm/{ => dri1}/savage/savage_drv.h   | 0
 drivers/gpu/drm/{ => dri1}/savage/savage_state.c | 0
 7 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/{ => dri1}/savage/Makefile (100%)
 rename drivers/gpu/drm/{ => dri1}/savage/savage_bci.c (100%)
 rename drivers/gpu/drm/{ => dri1}/savage/savage_drv.c (100%)
 rename drivers/gpu/drm/{ => dri1}/savage/savage_drv.h (100%)
 rename drivers/gpu/drm/{ => dri1}/savage/savage_state.c (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index bb3d8ffb9dd6..a3bd337bcab4 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -91,7 +91,6 @@ obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
-obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index 73c0aa1c7b94..f639d5e0ae2e 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_DRM_I810)		+= i810/
 obj-$(CONFIG_DRM_MGA)		+= mga/
 obj-$(CONFIG_DRM_R128)		+= r128/
+obj-$(CONFIG_DRM_SAVAGE)	+= savage/
 obj-$(CONFIG_DRM_SIS)		+= sis/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
 obj-$(CONFIG_DRM_VIA)		+= via/
diff --git a/drivers/gpu/drm/savage/Makefile b/drivers/gpu/drm/dri1/savage/Makefile
similarity index 100%
rename from drivers/gpu/drm/savage/Makefile
rename to drivers/gpu/drm/dri1/savage/Makefile
diff --git a/drivers/gpu/drm/savage/savage_bci.c b/drivers/gpu/drm/dri1/savage/savage_bci.c
similarity index 100%
rename from drivers/gpu/drm/savage/savage_bci.c
rename to drivers/gpu/drm/dri1/savage/savage_bci.c
diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/dri1/savage/savage_drv.c
similarity index 100%
rename from drivers/gpu/drm/savage/savage_drv.c
rename to drivers/gpu/drm/dri1/savage/savage_drv.c
diff --git a/drivers/gpu/drm/savage/savage_drv.h b/drivers/gpu/drm/dri1/savage/savage_drv.h
similarity index 100%
rename from drivers/gpu/drm/savage/savage_drv.h
rename to drivers/gpu/drm/dri1/savage/savage_drv.h
diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/dri1/savage/savage_state.c
similarity index 100%
rename from drivers/gpu/drm/savage/savage_state.c
rename to drivers/gpu/drm/dri1/savage/savage_state.c
-- 
2.34.1

