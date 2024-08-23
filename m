Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C732A95C28A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 02:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5210EBF6;
	Fri, 23 Aug 2024 00:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Sw2A2xgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 00:40:23 UTC
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9B110EBF6;
 Fri, 23 Aug 2024 00:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1724373621; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=JZ+Jb+HK5jzvd/d+WSjQLa2+SibX5DcDHdq7Wfdl5ac=;
 b=Sw2A2xgzwjDUIlt3PbjTNn2IK9olISfyjUufTnnyIHFOjBRG2N18HqHkz0iYuVgHcKsUWN4kdj1AXvC4b2Kv6uAfTU9ZLS6tfiR0ZTbnsDUsPqgYVY3zUA7iOvmmjsQAv1t+McAjVKbNejvNRD+MHL+e42apFz9ILVk6ofUtU2U=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WDRYTIY_1724373316) by smtp.aliyun-inc.com;
 Fri, 23 Aug 2024 08:35:17 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	alexander.deucher@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: Remove unnecessary semicolon after
 switch statement
Date: Fri, 23 Aug 2024 08:35:15 +0800
Message-Id: <20240823003515.57035-1-yang.lee@linux.alibaba.com>
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

This commit removes the unnecessary semicolon (`;`) following the
closing brace of the switch statement in the function
'dml2_core_utils_get_tile_block_size_bytes'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9804
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
index ab229e1598ae..695fe99e44d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
@@ -310,7 +310,7 @@ unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw
 	default:
 		DML2_ASSERT(0);
 		return 256;
-	};
+	}
 }
 
 
-- 
2.32.0.3.g01195cf9f

