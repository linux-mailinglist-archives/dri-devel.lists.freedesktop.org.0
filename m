Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4AE42CB88
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3F26EB19;
	Wed, 13 Oct 2021 20:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62F36EB19;
 Wed, 13 Oct 2021 20:49:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B9C1581176;
 Wed, 13 Oct 2021 16:49:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bjZP3Lgut5mp9
 xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=c6r33z9Y064wci5B+pw1tyY077FW3
 n1lca3QGK8RKDhvQ9WWyfvMVtL3GCAEbKPXWd9etVMNOtJR/mND8WSeYcZoqfg0Q
 YfKkF2Vdtb+vbWkeYy0raJYz07/4l6MEJJK5ev++p4jZEmIBSM1BA6qigA1nkTEy
 1N9cqazb37qhaFX/+dQH8tRcxK+QrdtxXKbFn5WiJG+fxWdevBn3F31HchFle683
 M6eTC7R1Ll1pte51A8W7iQDLNf2fAxReABHdns19MoXrsFmAz8hARE1e7OgPcsps
 9WPmvF2dk7UBe+R/D7UyDKF5bHEfs44llLkzW1GjNx4vdsclJxEyy2YpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bjZP3Lgut5mp9xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=neytJYoB
 opkPEnc6uJVGuAEuW174cVJqDHTP+Kj/d3DUB8pF4giUNgx1BhvoT1qatmWi+2Pi
 UfXsqaTUhSXZ1qD4QLFQVPPCbV1c9OU3fHuPsYb3OvHyEhOOueH6aQzOTuWnYgUo
 YCjRJBFFd/qTAWEMF8TEZS2EBQ0seNgErJEqViEbdtMK00z758TKKnHDN50p58iK
 WrU9CqAGhzO/k2+o7vKeXwwPg6v88Kyyn7DP7feGgLhdDUpCA1c77jw6R9+wIh2S
 K3eIizTb2iDs2VFm1rJgp04W7zz9th9D409u5bUv3iaWOJpbmHFjvCTD6n0PW8Lj
 9zTtzvo6UPhhng==
X-ME-Sender: <xms:PkZnYTDbYzcm6yMQ2PyqvV0U75E-IhrZdaYTDC5AJ-6Wt_4u6bW9pA>
 <xme:PkZnYZiPp0S0tu3wHaruMzYe54SlzM4mcV-ItcNAzQ5SVCGbpHNcKEJ5yRypR722i
 XZ3PT7qja92ZtvsyQ>
X-ME-Received: <xmr:PkZnYekL2-1UOqcXp0EePJPmpJdB-jKQskM8iggmEvMMgLS_ZDdqHP15WsAdtteYNbbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:PkZnYVzUpmA5kGL1Kc0qtvk8TnQQgeEGRl9juSlg95BIlokG4LD9Lw>
 <xmx:PkZnYYTX5tLF4uDSTGbdzmPRHVA0OMUY6k1SOManI3uSQe0qF-Lh_g>
 <xmx:PkZnYYb3gNj5gBu-_FAHTnXC12hRUDXhy0GLyH9f5pzJtrc9P-wBDA>
 <xmx:PkZnYR_Eya7Uhnr6VTNh1qDUcq8l42NUKkk_blhF6wZtIB4rNM5Fsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:48:59 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 03/20] drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:29 +0200
Message-Id: <20211013204846.90026-4-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

