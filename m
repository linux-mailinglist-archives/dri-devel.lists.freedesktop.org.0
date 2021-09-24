Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A0416C5F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B75C6EE66;
	Fri, 24 Sep 2021 06:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170B16EDFD;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 353BF580B91;
 Fri, 24 Sep 2021 02:43:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 02:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bjZP3Lgut5mp9
 xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=Zl94LhRMGC48/RwmRjA3LvtvLrQ8T
 Xu5750J5s/5x8KQMAJRqV/VokYfVb4eyo5JUgpQktTx0dyK13OCvxGsECwSwSTki
 GR0h5StpeupfDBPT05yTF4FsaHsSpa2K0bsqStTRrHGXCmFA+/GrmC4XAHzBiJOL
 P+5QAHdOoC6i84D0qU5hXdX1F154w/svTpKIYCk8h1lUE0olm9+V/2tekhgb403+
 PiZaWvIueRDUpboKjly8rlYmHk2C/GJEcERj3Yh48jG/TyBvxr3QehG5BUri1KYq
 j0vwAzOUrtrjHRY04PGOooWWaIcSFywkzAYy+M/5DxYJIsE/kyTFXeMcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bjZP3Lgut5mp9xuokNNwrS2cdV0t8bE34sMk9sGPssk=; b=WlnJxQQe
 r/yYLIu2eGfj4+jRQIenuvmRAJfnGKzyoRpXEid0iNcWZOIVmsyps1Xh8Kj8+xQD
 KGHIoq3vJJy06/vNmqLBKpwhnCvAg4BIJQq3zvSoh+oKS6jWSJUlTmU6DeFrnYdm
 dCyjvOaNIJvPhNFMc/1OQQ8CAYTUwy45Ocl0OnBn66Xx9kqaAEO6LgDQxCWkvS0q
 HE4sRMq37SRRJD67El1srPYvqlqf0M/hAvtlhOsGzDbj3PFtKYOdMey6S8bUtQBu
 aAmU3rlqLsL0QCJmSjRxIWZr1PqHkK1F04PR5oSFeoY7TpFQsdllkqVebu5AYqSe
 SZWZrfg7TV0/pA==
X-ME-Sender: <xms:nXNNYRbkumS6Tk7M5It86zfYYnbRIMhNMCCoUYcy34TyYYIwy_WlnQ>
 <xme:nXNNYYb9vGx-F6agPDM-FSQ2zC1N7R4j2XbdWeZfe5502jxWoUBS9k9sniXqk59YE
 zERoEmAbNtbu02ARQ>
X-ME-Received: <xmr:nXNNYT-uJvvaTqafn0Tcsn3dzpDfytV8mHtbAQkO_3E5kOgXJyNI5OloKxzbFSHbcPV1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:nXNNYfo2_DgLJg0aoPpJDiJv6D7bRqS0rtLtSoXIoS3XWsNh33-sjQ>
 <xmx:nXNNYcrIg5Pqzwjs8pY0a6iFbwFazzAAn76MNLxZLl5VmjuQt6a-Nw>
 <xmx:nXNNYVSWoPzPNNRRRgcqJA4q1dj557FyrbG1mRzhf0cGW3JLwwZmiQ>
 <xmx:nXNNYT0K1TbEFpyoQBzq1CRqwoFBC9raflJ1zmJKZaUD6c9Wi7VwvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:38 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/17] drm/msm: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:10 +0200
Message-Id: <20210924064324.229457-4-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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

