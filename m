Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62EA3216D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 09:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C65B10E802;
	Wed, 12 Feb 2025 08:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FNPETwl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D510E352
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:49:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38dc5764fc0so5013902f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739350158; x=1739954958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
 b=FNPETwl9pYND5M6guC/5zQ1GbGoNlHXY2kT336/tiYAbyOoo3ZYqXPfad3zVJsMmwS
 hZR73BN3uR+qAYxv957TtpPB3LwGTs+TdPaAlhBdv3IoGlfK3kTimoSGxgcgTgrMDEnQ
 6/2LhS9OJuRMYPUF5d7AgTKPtXOMQFOKkNaqqBxrY3HPRG2qyYINcFSyhYU6KaSPcHPC
 wd1ldm9nA3EdDyADcn3JTZAlzga4NJcstnRmTxWMVJXnlYWpmLYdQFErMbSRZ9q1ybK4
 MhooaAmplQ8RzN1gB1Ax/YtxTuivyWmSx6HQQHL4kSJrB5rGgDr2gBJeeBv3Z1IXLIrb
 DaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739350158; x=1739954958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
 b=LKxRlU+7s4WRfb8dG7Plnc5QAM2i3B1ONbPlEc4DJuE6hfkiw4GL+x0saEad6unoR2
 t3vC5D6UtLqT80h4ztOMsbGUZLb74IWZpP0pBByfpPTx0hplw76ffB8lE90d5YRUZjwS
 gSynh0fPOwR+gPi/P70TBNH2degjGS9yh54RlhSr4bAviRrrlMD7f/ku8mTW54weEA6q
 MWCfNtwsAK0uvjPBvWhPdbX0FjZIrth0GODffiP2UU20eYxiTxeDEXQC7JJY4BlQtFqJ
 LxlG2rj695JzqGqiYfGSHEQVQVK5ny4bS4xdNZi/9BNLvGJ9PecdRjK5EZ3ymmXmfvAP
 CqWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcMnNfLfVUS3ZeROW0NA8MQWl075ylaEYxHALI2+or/RqYv0nYLY3UMyKk/G1ocr/yu4G6xXdiO9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRm29AyXnGh5RSbdkYnxKXkTcUcSlcHnPM285HtYCMqwRasRFf
 l7lID0I70b8uMv/e8T2NSHYwK5o7FCUopj0Inx44WWy2qqh5uuA9
X-Gm-Gg: ASbGncu+t4ATBuGmllc15KL0UrMPtYO9u8kiErHPeDxqLBOivT6GroyMzk9u/yHHNZY
 A4knpvaQLhJwVoI/xrl6s8MnMZ3wJEXcqy458i72Gh/B+czlNO0taAhMvSdIiTNDmEoyymOPl4o
 fBZPlQusqx6FBvXFfvZQR6WQrLKxLmSHGmKL7N+3cnGZmWj4Qx6cs9U3CDFbLfPFEgsvzrhORbA
 d84UNT/4RIpkWfeVBHKf51WS7ppxLaS6M1XeDf12UNOLC/CKZup2YbJMGvGaXvMQhliGjGV/d6l
 8+XNp64+6sc6/xkr
X-Google-Smtp-Source: AGHT+IGCCRY7NE2FbXpz20DFZcUlyeCjQeTEvVxZfELxzuLtNHlgPa/u0fy/uhEp0tfuZ1QmZa76kQ==
X-Received: by 2002:a05:6000:144f:b0:38d:dfdc:52b6 with SMTP id
 ffacd0b85a97d-38dea2e963dmr1714220f8f.37.1739350158120; 
 Wed, 12 Feb 2025 00:49:18 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd49d2cafsm11400302f8f.16.2025.02.12.00.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 00:49:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, danvet.vetter@ffwl.ch, sylphrenadin@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/vkms: Fix use after free and double free on init error
Date: Wed, 12 Feb 2025 09:49:12 +0100
Message-ID: <20250212084912.3196-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the driver initialization fails, the vkms_exit() function might
access an uninitialized or freed default_config pointer and it might
double free it.

Fix both possible errors by initializing default_config only when the
driver initialization succeeded.

Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 7c142bfc3bd9..b6de91134a22 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -235,17 +235,19 @@ static int __init vkms_init(void)
 	if (!config)
 		return -ENOMEM;
 
-	default_config = config;
-
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
 
 	ret = vkms_create(config);
-	if (ret)
+	if (ret) {
 		kfree(config);
+		return ret;
+	}
 
-	return ret;
+	default_config = config;
+
+	return 0;
 }
 
 static void vkms_destroy(struct vkms_config *config)
@@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
-	if (default_config->dev)
-		vkms_destroy(default_config);
+	if (!default_config)
+		return;
 
+	vkms_destroy(default_config);
 	kfree(default_config);
 }
 
-- 
2.48.1

