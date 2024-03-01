Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF586DDE4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203CC10E1D7;
	Fri,  1 Mar 2024 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BxOkAoWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6365E10E1FB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1709284241; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Wnp0K/c2jn/Ld3sdKbW2JbmVvraHQoeDkcCCW9FRwWg=;
 b=BxOkAoWBJWq+PaHHAJzMiQT9lZgfAUXkkm3iPotbX4GKrzm1JSzvChhth1N7nwzCGpDLOP+2uztFvEccnNu7zL7CuRNuRysytjYo1xwei9KPx1aZrrBi3rM8jWZiPQCdg8DH7ykU9+OKu+84aj+8OFbjqJbrZxdUk+P0bLB1yUU=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0W1awj9j_1709283935; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0W1awj9j_1709283935) by smtp.aliyun-inc.com;
 Fri, 01 Mar 2024 17:05:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: thomas.hellstrom@linux.intel.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next 1/2] drm/dp: Remove unneeded semicolon
Date: Fri,  1 Mar 2024 17:05:34 +0800
Message-Id: <20240301090535.87969-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

This patch removes the unnecessary semicolons at the end of the
for statements which cleans up the code and ensures consistency
with the rest of the kernel coding style.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 120e0de674c1..479dd004f365 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1125,7 +1125,7 @@ static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
 		}
 
 		timeout = wait_woken(&wait, TASK_UNINTERRUPTIBLE, timeout);
-	};
+	}
 
 	remove_wait_queue(&mgr->bw_req_queue, &wait);
 
-- 
2.20.1.7.g153144c

