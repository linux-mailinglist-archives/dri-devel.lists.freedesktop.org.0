Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1456425BC7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051A36E59D;
	Thu,  7 Oct 2021 19:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DA96E837;
 Thu,  7 Oct 2021 19:38:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C61842B009FD;
 Thu,  7 Oct 2021 15:38:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 07 Oct 2021 15:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bjZP3Lgut5mp9
 xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=PF1a9GiJxU6Q74ZqTk7kMu6z12qgB
 AR49fr1TOKBXIwxxMQHznCFHztGY9DFqhQH4YmAlz/eVxdkatP8RrN/37LqBx7AD
 /ptdZVh4jfP9AptD8b++RnNs4cLatv8uIbjqko+57O3e6wjhPutbG0G2CD4Hi4tF
 gHfRf6bgVpw5E/eY6npsRzjtXJxP32C0FQ7nqE6OEyomdI/IkrjulGOkRPbQIaC0
 wwfE/dyGfK63a6bOuIdh6CCKluXjnev36He/172ePW0MN5yfI6THBgKZPeofhz+9
 OmJqDzfu2wkrgBvDoyFmlRrAVz2rZlxsX6EeBd86nfwQQ4miK5BhPZPww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bjZP3Lgut5mp9xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=Vyav2KIy
 XVNFrZAr+H8J/8njO7YJqRU2vO5m7horCTTXcw1fIM+RlLJkTDQojCi+eSrgDzns
 kSh+rFbrqYSwNdslQ7Ts1DUGOw2VqsWZYXg8RUfMaYceDHnVLjN2A6I/K+uJI6Ao
 8/0+MNKdALmklHTkiapu7spyz0bNj8cjA+na9k5jefloii3OcN7EacgOlTiyfk0r
 4wHoL37qbIq40WYnxrIVgydtbejHhGHf2GS1Fq8UNbJTzPU33TDmWxoTMHJiWap2
 YLSOC36bEAOrnvg/Y4OhUv3QbdvqEGTsOIoX7WMqOxmtbHySMtPp6ZV56TsMq8+g
 w2ucY1MxfLlfNw==
X-ME-Sender: <xms:p0xfYYGB_S7KmfvM-CzkzjCpOwAPLdVkTv4GmNyWTk0Wbgv906s7eQ>
 <xme:p0xfYRUmLE35PDDvVShQ9qAa5BeESpsswUaWfddF4KZSpsPUPwx6OoS3NBrL8CgN4
 FKwclY0oF9LNRAPGg>
X-ME-Received: <xmr:p0xfYSJtv87OsOUifWTqF96TTgBYzT8Ne2g26qPyQo4Hdf4VvohepMim7t0CzqhnOrDf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:p0xfYaFvyV9G3400itk0vLuyXK5iLPsPBsjoVtjwwGXmDpz65iJX9Q>
 <xmx:p0xfYeXxvoXiEgPD__IJ8nPyUw6YGw-Q720d4kclU6JZ_1Ny3t5H-Q>
 <xmx:p0xfYdNYo5XlU4Hp5EJz7XCvEkixLWGt7PmRAP5eYy3kDw-zfIxtTQ>
 <xmx:p0xfYaS6DfdyYMtrkU5yPKdj48H90eV9vQ1NqG5bTZ9Y4WXskdwgEr1X-8o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:12 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 03/20] drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:38 +0200
Message-Id: <20211007193755.29579-4-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace the boilerplate code
surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
and DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..abda52f09b09 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <drm/drm_drv.h>
+
 #include "msm_disp_snapshot.h"
 
 static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
@@ -99,20 +101,18 @@ static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
 {
 	struct drm_device *ddev;
 	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	disp_state->timestamp = ktime_get();
 
 	ddev = disp_state->drm_dev;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
-		drm_modeset_backoff(&ctx);
+	DRM_MODESET_LOCK_ALL_BEGIN(ddev, ctx, 0, ret);
 
 	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
 			&ctx);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+
+	DRM_MODESET_LOCK_ALL_END(ddev, ctx, ret);
 }
 
 void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
-- 
2.33.0

