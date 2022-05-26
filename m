Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B5534A6F
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAB010F1EC;
	Thu, 26 May 2022 06:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2A010F02D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 05:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653543774; bh=ihjp0MbRfp/mCbKbHL5y75aIuhB1bqbnMEGzFf7HA7s=;
 h=From:To:Cc:Subject:Date;
 b=ETh925BuFD62STOWPXUZ+lr0VKlbVQEc1r0dNS6uAsKAt/C4Y6mQig58ccfzt/sCc
 n1JmO2CisydpwbgQ1tYVHiFR34ZZTxV6WpWrMxdRuUU4OS/F0NKq9Q70bgN52Pgh2I
 2OJWbmcUdtJygQ7mvsSjwcf+a3cAYIKU5NiNcAE4=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 9E5360C0; Thu, 26 May 2022 13:39:37 +0800
X-QQ-mid: xmsmtpt1653543577tm45c3c1q
Message-ID: <tencent_3584182D508B22C166A5E952AB277B02D706@qq.com>
X-QQ-XMAILINFO: N+tZcXNNUKPOROH/emN/ouscCLbthBNnYSn3LSqueYfbombCkMrwhjmGyl5//+
 QfP+5z+MDbU3FbFDHgITDpYR72UfH3QBesPAgF9I+hcEvzuPX7Ial8gcFMX3tFPfB7gYvnmPzJR9
 RQaNPcnu1QC7EFQZG4hV8JWTdkOGK/0JLbcaNji41cO2OXBxWF7gy75muLjpt73fWhA2ya7vYagb
 iStcqixgjeObgOd+PvDiY3qBxEMeBkj0Cq1FLrMoO3lLBu0zXwXuAUipZ4rae/19jLylFyI4EKgL
 LWINkZAgkUtsILF9n+D04Lg73z1zhvl8IAVlQmYN8GgcOLeCwNxyouzSrV26HtgNypAuyufNuA+4
 kQZEVhvjsOQbVgkKwk/ArwlZBnk78s4G0DM3khB9G89IZEDuED5cuJudq6OCTWrsXjy/mVDCQ2/2
 S0+GDjBgzMiGI7zVLL4IXs63FN6xqf8OGikpPNGGKlap7I60xuDwkAT4kxa9gqBgHuUntMqejAV2
 ZwmoIkXVe+hwUlb4GfGfHCHWbsesvxEZgtLeaGCI/r939+GYcnFF3Nz4rZXAaKlKyc2BSrYmnfdn
 YFQHJFbfZyoK0/PqVUfA/4hvremOmwNQR2kwD531XW339xZke9/kNhyz96zCt1pYBOQT4fjonSXP
 +OnhMzFGo46PIIZLGnh77v4J4kG+MMSYiW5blsiK9nZt5irgaHENcBNtpFyYBdoTm5DPxyPD/q4r
 nLHycqXInjP5hmJTzd8h9fIbG3ckvc9OC+kCtUMWDhbagfvc/AgoBIoB/A7ow6mI47R8woHNuku1
 8xhrKg8L/WDCWXvhMTxR+/NhWdAx6ai+GyhA0Ue3oavrge8vf1B2DvbAoiHnEc/x4Gw5H15dfqzg
 ==
From: 1064094935@qq.com
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] radeon: Fix spelling typo in comment
Date: Thu, 26 May 2022 13:39:25 +0800
X-OQ-MSGID: <20220526053925.1153265-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 May 2022 06:47:10 +0000
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
Cc: pengfuyuan <pengfuyuan@kylinos.cn>, linux-fbdev@vger.kernel.org,
 k2ci <kernel-bot@kylinos.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 include/video/radeon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/video/radeon.h b/include/video/radeon.h
index 005eae19ec09..72f94ccfa725 100644
--- a/include/video/radeon.h
+++ b/include/video/radeon.h
@@ -750,7 +750,7 @@
 #define WAIT_DMA_GUI_IDLE			   (1 << 9)
 #define WAIT_2D_IDLECLEAN			   (1 << 16)
 
-/* SURFACE_CNTL bit consants */
+/* SURFACE_CNTL bit constants */
 #define SURF_TRANSLATION_DIS			   (1 << 8)
 #define NONSURF_AP0_SWP_16BPP			   (1 << 20)
 #define NONSURF_AP0_SWP_32BPP			   (1 << 21)
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
