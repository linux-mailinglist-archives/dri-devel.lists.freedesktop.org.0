Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2EA626FB6
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33C10E20E;
	Sun, 13 Nov 2022 13:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1578 seconds by postgrey-1.36 at gabe;
 Sat, 12 Nov 2022 20:09:40 UTC
Received: from alt2.a-painless.mh.aa.net.uk (painless-a.thn.aa.net.uk
 [IPv6:2001:8b0:0:62::26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CEA10E1DB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fdy2.co.uk; 
 s=aaisp1;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7i9ukrlYExoHgLc7Xp0aOxtoeleb2MJDTd0lVWbJMI=; b=j/Ve8VIOTLwEjva+H2PA/TbzqP
 IFgqc3lNlki5m7CrjbG19PdH1V5/MqSyjPLUL2jCGtEpzm6PYwiSeP1lGzk4TVuyJs7QZIrVSG2k1
 FtG1wFxxyOTnftaq8RQYXH6dVxy8drprBreuKCjLHLgGjd1KN7jy9orulgdO6sJ+x9SuzXQN0+41x
 t4STfz1jIYB3ymN/TiHCMTnZgGrPJ9/T3LZCRRJTldSJ8sJ+MAs1BvGvDvc1LGPqIPI3lKIqwodCT
 MCFCDwwMYCYn2FuoE31cYxCeae3IHs1lC1ZjnwB82LgQAz5pezNUoFmEEMd8EScg8cfRxVT7G71+D
 OpqAyUdg==;
Received: from 176.158.187.81.in-addr.arpa ([81.187.158.176]
 helo=ren.fdy2.co.uk)
 by painless-a.thn.aa.net.uk with esmtp (Exim 4.94.2)
 (envelope-from <rjs@fdy2.co.uk>)
 id 1otwPx-007tld-Dk; Sat, 12 Nov 2022 19:43:52 +0000
Received: by ren.fdy2.co.uk (Postfix, from userid 100)
 id 097223062A8; Sat, 12 Nov 2022 19:42:10 +0000 (GMT)
From: Robert Swindells <rjs@fdy2.co.uk>
To: noralf@tronnes.org, liuzixian4@huawei.com, airlied@redhat.com,
 tzimmermann@suse.de, lucas.demarchi@intel.com, kraxel@redhat.com,
 robh@kernel.org, kuba@kernel.org, marcel.ziswiler@toradex.com,
 sfr@canb.auug.org.au, daniel.vetter@ffwll.ch, cai.huoqing@linux.dev,
 nroberts@igalia.com, m.szyprowski@samsung.com, emil.velikov@collabora.com,
 sam@ravnborg.org, boris.brezillon@collabora.com, dan.carpenter@oracle.com
Subject: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Date: Sat, 12 Nov 2022 19:42:10 +0000
Message-Id: <20221112194210.7657-2-rjs@fdy2.co.uk>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221112194210.7657-1-rjs@fdy2.co.uk>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Nov 2022 13:26:17 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Contributors to these files are:

Noralf Trønnes <noralf@tronnes.org>
Liu Zixian <liuzixian4@huawei.com>
Dave Airlie <airlied@redhat.com>
Thomas Zimmermann <tzimmermann@suse.de>
Lucas De Marchi <lucas.demarchi@intel.com>
Gerd Hoffmann <kraxel@redhat.com>
Rob Herring <robh@kernel.org>
Jakub Kicinski <kuba@kernel.org>
Marcel Ziswiler <marcel.ziswiler@toradex.com>
Stephen Rothwell <sfr@canb.auug.org.au>
Daniel Vetter <daniel.vetter@ffwll.ch>
Cai Huoqing <cai.huoqing@linux.dev>
Neil Roberts <nroberts@igalia.com>
Marek Szyprowski <m.szyprowski@samsung.com>
Emil Velikov <emil.velikov@collabora.com>
Sam Ravnborg <sam@ravnborg.org>
Boris Brezillon <boris.brezillon@collabora.com>
Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 include/drm/drm_gem_shmem_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..f1a68a71f876 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0 or MIT
 /*
  * Copyright 2018 Noralf Trønnes
  */
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index a2201b2488c5..56ac32947d1c 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
 
 #ifndef __DRM_GEM_SHMEM_HELPER_H__
 #define __DRM_GEM_SHMEM_HELPER_H__
-- 
2.38.0

