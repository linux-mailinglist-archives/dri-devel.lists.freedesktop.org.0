Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF9CD16C8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA6E10F07B;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="3K6dl4Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7910F072;
 Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9NvSm9B5endm091xxJ6Qok7LbA5K+Elj4jZPILxrHhM=; b=3K6dl4LtJE4tHAiBee8n1PCvwr
 cIZBwC9IvWcVBlgh4BVUd3xT1YrOoC6KCUcYbR6GeJ9w/m85PwnCB8yI+mzCEKR8EG6Fo069DO/Ul
 1y6uuWBMJ4uAIMFSgzTl00lD+lel4go9U+mnbEgNTMShWHFqo4bJFUckmi+QXid/27w3ehbfARnPY
 V/SXiFNT6DfsWlQOC8FZ4yrGY9BrOd5npM3SHVun4csdWD3514Lxpy01FoRyIP9qWS4hfBw1knW1/
 SWJfw5Y6SAQPb3MBG7bz44k+2t+0paEaHwzTScwjjxK5lOKlxnN0f00HYMIkixf3/K2wf8GKFIkXL
 UcOxOZfQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUv-0000000AqkV-185m; Fri, 19 Dec 2025 18:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:21 -0800
Message-ID: <20251219184638.1813181-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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

Correct and add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/dp/dp_debug.h:31 expecting prototype for
 msm_dp_debug_get(). Prototype was for msm_dp_debug_init() instead
Warning: ../drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter
 'connector' not described in 'msm_dp_bridge_detect'
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:90 expecting prototype for
 mdss_dp_test_bit_depth_to_bpp(). Prototype was for
 msm_dp_link_bit_depth_to_bpp() instead
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
 'aux' not described in 'msm_dp_link_get'
Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
 'dev' not described in 'msm_dp_link_get'
Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:70 function parameter
 'bw_code' not described in 'is_link_rate_valid'
Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:84 expecting prototype for
 msm_dp_link_is_lane_count_valid(). Prototype was for
 is_lane_count_valid() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/dp/dp_debug.h |    2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c   |    1 +
 drivers/gpu/drm/msm/dp/dp_link.h  |    9 +++++----
 drivers/gpu/drm/msm/dp/dp_panel.h |    8 ++++----
 4 files changed, 11 insertions(+), 9 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_debug.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -12,7 +12,7 @@
 #if defined(CONFIG_DEBUG_FS)
 
 /**
- * msm_dp_debug_get() - configure and get the DisplayPlot debug module data
+ * msm_dp_debug_init() - configure and get the DisplayPlot debug module data
  *
  * @dev: device instance of the caller
  * @panel: instance of panel module
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_drm.c
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -18,6 +18,7 @@
 /**
  * msm_dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
  * Returns: Bridge's 'is connected' status
  */
 static enum drm_connector_status
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_link.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_link.h
@@ -80,11 +80,11 @@ struct msm_dp_link {
 };
 
 /**
- * mdss_dp_test_bit_depth_to_bpp() - convert test bit depth to bpp
+ * msm_dp_link_bit_depth_to_bpp() - convert test bit depth to bpp
  * @tbd: test bit depth
  *
- * Returns the bits per pixel (bpp) to be used corresponding to the
- * git bit depth value. This function assumes that bit depth has
+ * Returns: the bits per pixel (bpp) to be used corresponding to the
+ * bit depth value. This function assumes that bit depth has
  * already been validated.
  */
 static inline u32 msm_dp_link_bit_depth_to_bpp(u32 tbd)
@@ -120,7 +120,8 @@ bool msm_dp_link_send_edid_checksum(stru
 
 /**
  * msm_dp_link_get() - get the functionalities of dp test module
- *
+ * @dev: kernel device structure
+ * @aux: DisplayPort AUX channel
  *
  * return: a pointer to msm_dp_link struct
  */
--- linux-next-20251119.orig/drivers/gpu/drm/msm/dp/dp_panel.h
+++ linux-next-20251119/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -63,9 +63,9 @@ void msm_dp_panel_disable_vsc_sdp(struct
 
 /**
  * is_link_rate_valid() - validates the link rate
- * @lane_rate: link rate requested by the sink
+ * @bw_code: link rate requested by the sink
  *
- * Returns true if the requested link rate is supported.
+ * Returns: true if the requested link rate is supported.
  */
 static inline bool is_link_rate_valid(u32 bw_code)
 {
@@ -76,10 +76,10 @@ static inline bool is_link_rate_valid(u3
 }
 
 /**
- * msm_dp_link_is_lane_count_valid() - validates the lane count
+ * is_lane_count_valid() - validates the lane count
  * @lane_count: lane count requested by the sink
  *
- * Returns true if the requested lane count is supported.
+ * Returns: true if the requested lane count is supported.
  */
 static inline bool is_lane_count_valid(u32 lane_count)
 {
