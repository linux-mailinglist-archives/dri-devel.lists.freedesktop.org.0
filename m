Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05F9EC1E9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 03:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FBF10E8E3;
	Wed, 11 Dec 2024 02:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xmcGOKFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2024 02:04:29 UTC
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7289510E0A6;
 Wed, 11 Dec 2024 02:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1733882667; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=uNKa5z04ZraNM6iZozg2spe37vtJmJIyeDj6cALGgG4=;
 b=xmcGOKFUuljAUEOY48uP8N83ODunPlI7h3KL9i+dwjtvIjNz/qr0e34DSEgoVtI5kWF363Q6tlAhCKF45pR85yZ6DuVgvYlaSMrsOd734wMKmnCNtb75UtMIkXlnG7eAXA9urFpl4V3mnU3uhqno3FCCZ2Sz6aCwnBTM4hCIqpk=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WLGQprG_1733882315 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 11 Dec 2024 09:59:23 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: kherbst@redhat.com
Cc: lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/nouveau/gsp/r535: Modify mismatched function name
Date: Wed, 11 Dec 2024 09:58:34 +0800
Message-Id: <20241211015834.47562-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2174: warning: expecting prototype for create_debufgs(). Prototype was for create_debugfs() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=12292
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 58502102926b..93a7528a1193 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2162,7 +2162,7 @@ r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
 }
 
 /**
- * create_debufgs - create a blob debugfs entry
+ * create_debugfs - create a blob debugfs entry
  * @gsp: gsp pointer
  * @name: name of this dentry
  * @blob: blob wrapper
-- 
2.32.0.3.g01195cf9f

