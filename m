Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DF82A976
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB9C10E820;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD3DA10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=NVv+cF4ZY8iq/CxQeH
 wl4R+lCg49TLG4aEk69o7hTFU=; b=EFzLr2LXADX7hN17Xu5LR2p88UxVgrAwuG
 lCJ3oSxEqqXQefttVaSM9EnPqSyN1mV4FATKLfkKNZX0HMS42hblMeQSlq3s4PWb
 M5mSOteuafFGOHJa1HP9vnX0E+JMLYtxlMFYWYcrDblBYrVRXdgX6OlGf5IPYacM
 iA0UMBM8g=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDnT_molZ9lUXaQAA--.18825S2;
 Thu, 11 Jan 2024 15:15:53 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: zackr@vmware.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Clean up errors in vmwgfx_msg.c
Date: Thu, 11 Jan 2024 07:15:52 +0000
Message-Id: <20240111071552.9970-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnT_molZ9lUXaQAA--.18825S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryfAr4UXr4xXF4xKF18Grg_yoWDCrXEk3
 WUGr43XFWDuF98uw12v39rJ34ay3W5uFZ3u3Wxt3W3G3Z2qw47Wry3Wr9xJa4fWF45GFZr
 Crs5GFnayrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEARi1mVOBk30WAABst
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: "foo* const bar" should be "foo * const bar"
ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 2651fe0ef518..b56936f95d31 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -87,8 +87,7 @@ struct rpc_channel {
 
 #if IS_ENABLED(CONFIG_DRM_VMWGFX_MKSSTATS)
 /* Kernel mksGuestStats counter names and desciptions; same order as enum mksstat_kern_stats_t */
-static const char* const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] =
-{
+static const char * const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] = {
 	{ "vmw_execbuf_ioctl", "vmw_execbuf_ioctl" },
 	{ "vmw_cotable_resize", "vmw_cotable_resize" },
 };
-- 
2.17.1

