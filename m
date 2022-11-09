Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD7A622B23
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4310E162;
	Wed,  9 Nov 2022 12:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2201 seconds by postgrey-1.36 at gabe;
 Wed, 09 Nov 2022 12:12:31 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3910E162
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1w1KxuQLOzKAfPrO0TPD8gaw+ElGwsDTcm6+497frE4=; b=jp6skOOR1Z2OKFrmcAzgLmpCdb
 LyQ4vW3cAfw9TV7SX335iIwwhFpxHvYDPVyVmwOp8/CnvtrJlKDWELSXOMZYH9cQK0O0+hoebW+Ks
 VuPtH8d2t03ScoKhk+hvuU6DfWawvXKHXTMtMWOgkBMRlRKVl2IUAWG+juj0ZUcU98MHBrrCpXKaJ
 mQHcB+4RpgWFTDtJ0qwRirtJoM5tODTYzfZYsBDoRiKnQUhrpohZnZsyp19IYmQiI9Xi2h6pbYId3
 /Gvk8nS6J6TnH8/c23uYLwPY/5WhfUwErFEMudy73N/qE4sBo3+X1fePa7VMraeZ9cATUiyjIuPm8
 RxKr7UsQ==;
Received: from [41.42.191.11] (helo=alaa..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osjQz-00EvLH-3i; Wed, 09 Nov 2022 12:39:57 +0100
From: Alaa Emad <aemad@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: change min cursor size to accept smaller values
Date: Wed,  9 Nov 2022 13:39:45 +0200
Message-Id: <20221109113945.20938-1-aemad@igalia.com>
X-Mailer: git-send-email 2.34.1
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
Cc: hamohammed.sa@gmail.com, andrealmeid@igalia.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mwen@igalia.com,
 aemad@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

change min cursor size of vkms driver from 20 to 10, to increase the IGT test
coverage of vkms by enabling 32x10 cursor size subtests in kms_cursor_crc

Signed-off-by: Alaa Emad <aemad@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0a67b8073f7e..4a248567efb2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,8 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
-#define XRES_MIN    20
-#define YRES_MIN    20
+#define XRES_MIN    10
+#define YRES_MIN    10
 
 #define XRES_DEF  1024
 #define YRES_DEF   768
-- 
2.34.1

