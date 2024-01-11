Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89382A99C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7D10E010;
	Thu, 11 Jan 2024 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F610E7C8;
 Thu, 11 Jan 2024 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ni/Dp2TvD0TRWHDQMg
 VzzpzRHqxOJtCixJqVl2DQb8Y=; b=BJbCfXv6cFr6FRO1BQaZmZeIvYivDsglbn
 MmC/v7A27XKkwdTkt4TOakGCMooYSzfN1udA1Gfo7cLDrD5JFeBopF+G+OAgu6G5
 Jgdqy6/UDE8/3Wd+p/ArmkSL0QWJKojX7Iu2dzzBcG2SQ49sdz8KmBlyeQSY3aUx
 SBEaQ7VK0=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3H+8wm59lXcWSAA--.18886S2;
 Thu, 11 Jan 2024 15:39:28 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in r600_dpm.h
Date: Thu, 11 Jan 2024 07:39:25 +0000
Message-Id: <20240111073925.10663-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H+8wm59lXcWSAA--.18886S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1ktF1UWr1kZF1xJw13urg_yoW3WrX_u3
 WxXw47X34I9Fn8Wr1SvF4xJ34SvF1UZF4xCa4rtFyrKry7tr4rXayktFy8X3WUJ3W3XFs5
 A3y8ta9IyrZFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtrcDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBVi1mVOBk9-FwAAsD
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/r600_dpm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_dpm.h b/drivers/gpu/drm/radeon/r600_dpm.h
index 6e4d22ed2a00..5c2513c84c48 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.h
+++ b/drivers/gpu/drm/radeon/r600_dpm.h
@@ -119,8 +119,7 @@ enum r600_display_watermark {
 	R600_DISPLAY_WATERMARK_HIGH = 1,
 };
 
-enum r600_display_gap
-{
+enum r600_display_gap {
     R600_PM_DISPLAY_GAP_VBLANK_OR_WM = 0,
     R600_PM_DISPLAY_GAP_VBLANK       = 1,
     R600_PM_DISPLAY_GAP_WATERMARK    = 2,
-- 
2.17.1

