Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B7431F3A9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 02:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CBF6E436;
	Fri, 19 Feb 2021 01:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F24F6E436
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 01:39:36 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DhZ2S5WGGzlMFH;
 Fri, 19 Feb 2021 09:37:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 09:39:30 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/ioctl: fix space prohibited after that open parenthesis
Date: Fri, 19 Feb 2021 09:38:59 +0800
Message-ID: <1613698739-10001-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch resolves below errors reported by checkpath
ERROR: space prohibited after that open parenthesis '('

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/drm_ioc32.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index f86448a..5b77db4 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -43,35 +43,35 @@
 #define DRM_IOCTL_GET_UNIQUE32		DRM_IOWR(0x01, drm_unique32_t)
 #define DRM_IOCTL_GET_MAP32		DRM_IOWR(0x04, drm_map32_t)
 #define DRM_IOCTL_GET_CLIENT32		DRM_IOWR(0x05, drm_client32_t)
-#define DRM_IOCTL_GET_STATS32		DRM_IOR( 0x06, drm_stats32_t)
+#define DRM_IOCTL_GET_STATS32		DRM_IOR(0x06, drm_stats32_t)
 
-#define DRM_IOCTL_SET_UNIQUE32		DRM_IOW( 0x10, drm_unique32_t)
+#define DRM_IOCTL_SET_UNIQUE32		DRM_IOW(0x10, drm_unique32_t)
 #define DRM_IOCTL_ADD_MAP32		DRM_IOWR(0x15, drm_map32_t)
 #define DRM_IOCTL_ADD_BUFS32		DRM_IOWR(0x16, drm_buf_desc32_t)
-#define DRM_IOCTL_MARK_BUFS32		DRM_IOW( 0x17, drm_buf_desc32_t)
+#define DRM_IOCTL_MARK_BUFS32		DRM_IOW(0x17, drm_buf_desc32_t)
 #define DRM_IOCTL_INFO_BUFS32		DRM_IOWR(0x18, drm_buf_info32_t)
 #define DRM_IOCTL_MAP_BUFS32		DRM_IOWR(0x19, drm_buf_map32_t)
-#define DRM_IOCTL_FREE_BUFS32		DRM_IOW( 0x1a, drm_buf_free32_t)
+#define DRM_IOCTL_FREE_BUFS32		DRM_IOW(0x1a, drm_buf_free32_t)
 
-#define DRM_IOCTL_RM_MAP32		DRM_IOW( 0x1b, drm_map32_t)
+#define DRM_IOCTL_RM_MAP32		DRM_IOW(0x1b, drm_map32_t)
 
-#define DRM_IOCTL_SET_SAREA_CTX32	DRM_IOW( 0x1c, drm_ctx_priv_map32_t)
+#define DRM_IOCTL_SET_SAREA_CTX32	DRM_IOW(0x1c, drm_ctx_priv_map32_t)
 #define DRM_IOCTL_GET_SAREA_CTX32	DRM_IOWR(0x1d, drm_ctx_priv_map32_t)
 
 #define DRM_IOCTL_RES_CTX32		DRM_IOWR(0x26, drm_ctx_res32_t)
 #define DRM_IOCTL_DMA32			DRM_IOWR(0x29, drm_dma32_t)
 
-#define DRM_IOCTL_AGP_ENABLE32		DRM_IOW( 0x32, drm_agp_mode32_t)
-#define DRM_IOCTL_AGP_INFO32		DRM_IOR( 0x33, drm_agp_info32_t)
+#define DRM_IOCTL_AGP_ENABLE32		DRM_IOW(0x32, drm_agp_mode32_t)
+#define DRM_IOCTL_AGP_INFO32		DRM_IOR(0x33, drm_agp_info32_t)
 #define DRM_IOCTL_AGP_ALLOC32		DRM_IOWR(0x34, drm_agp_buffer32_t)
-#define DRM_IOCTL_AGP_FREE32		DRM_IOW( 0x35, drm_agp_buffer32_t)
-#define DRM_IOCTL_AGP_BIND32		DRM_IOW( 0x36, drm_agp_binding32_t)
-#define DRM_IOCTL_AGP_UNBIND32		DRM_IOW( 0x37, drm_agp_binding32_t)
+#define DRM_IOCTL_AGP_FREE32		DRM_IOW(0x35, drm_agp_buffer32_t)
+#define DRM_IOCTL_AGP_BIND32		DRM_IOW(0x36, drm_agp_binding32_t)
+#define DRM_IOCTL_AGP_UNBIND32		DRM_IOW(0x37, drm_agp_binding32_t)
 
-#define DRM_IOCTL_SG_ALLOC32		DRM_IOW( 0x38, drm_scatter_gather32_t)
-#define DRM_IOCTL_SG_FREE32		DRM_IOW( 0x39, drm_scatter_gather32_t)
+#define DRM_IOCTL_SG_ALLOC32		DRM_IOW(0x38, drm_scatter_gather32_t)
+#define DRM_IOCTL_SG_FREE32		DRM_IOW(0x39, drm_scatter_gather32_t)
 
-#define DRM_IOCTL_UPDATE_DRAW32		DRM_IOW( 0x3f, drm_update_draw32_t)
+#define DRM_IOCTL_UPDATE_DRAW32		DRM_IOW(0x3f, drm_update_draw32_t)
 
 #define DRM_IOCTL_WAIT_VBLANK32		DRM_IOWR(0x3a, drm_wait_vblank32_t)
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
