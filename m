Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3E622B24
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A359710E5AC;
	Wed,  9 Nov 2022 12:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A4A10E162
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fxvA9Ekh4lxu/xW3PIvofXkuKFGco1K+KzF6xOViqnw=; b=OscCwWrlx9ZW/yt78YfXRD0TfW
 LWH0NFMwcXlqBMgVgOVyqyayH4ydK23NHGkOvq6SfbnlkXcblq6dOFuGPmX8vUTyvcKthOqiEYV6G
 8nJU0sSp31siqQyVfrdIgZfrQ+zkJH6ueWDLhSbYFl9VksJAIf6cN4XAUsGz/kH+4mdlRPCkZWcai
 QZPdLFVtfQi3oJcVPDs4KGUWtzZq2oqCR3GjztUnd2uoWFIwcrBRLfNNICoq9+20mnpyq89vz0NOO
 X8kkAorJ6vj0GR3ChlQ6+PNKB1QcXuhzhEevM4ByXc35MU6sc7Ut9qJ+5nL3r00zge6rfyAVxA+s7
 B5M5DKog==;
Received: from [41.42.191.11] (helo=alaa..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osjMx-00EvGw-Gc; Wed, 09 Nov 2022 12:35:47 +0100
From: Alaa Emad <aemad@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: change min cursor size to accept smaller values
Date: Wed,  9 Nov 2022 13:34:47 +0200
Message-Id: <20221109113447.20735-1-aemad@igalia.com>
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
 Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, aemad@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>

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

