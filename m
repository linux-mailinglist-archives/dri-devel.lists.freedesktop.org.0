Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9D416C4D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06E6EE6F;
	Fri, 24 Sep 2021 06:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2A86EE01;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1698158106D;
 Fri, 24 Sep 2021 02:43:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 24 Sep 2021 02:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=o5bKC/lveiRjA
 d/NQvwiZM4j13eSxDb8YWz9skkQNGo=; b=I1e+wtT4DWyRr0MgOfqCrsaWxHnuA
 yCZuRRSEDw3JYNpLPe1le3IzwToP0g8mWi5lxRUGAZmyaTADyngGM5ZrJtrrwwLx
 tEm+xB1skkFVdSNhtnOrtyqmSHmAKUgO19KWa4dQ6GVC38yPYhu6+zuEnGsqg1h6
 n/S1IzFEDMzPpZ7X7ZVzOEOrdb5i13j5Q1HEZDxMRU6Fa4pYyfT/C2GT2u7RdLxI
 0skv3CKjPNW29+S3mf8xL6rx80DX1SuwM7L71Hd7WpBVCPVh6INg7SXN9Jr4MSrP
 k+H6TdLNDqdUlaPWCRft4QNlOfxOBw6a57h8ghaM19mPmW7uAXUCvp0QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=o5bKC/lveiRjAd/NQvwiZM4j13eSxDb8YWz9skkQNGo=; b=wqXMNlBy
 goAbA+kctdgQcHq8D4v+qcQPUZONDq2i7NGZABqg4jJysDgPoDOGOwGbLCTsBdPQ
 DoQ4/mlqaxwKkIfqLyWa37RLsaiRJzpnXKQiWfBb6xxh/MK4oR9JktMVT1+E356o
 CRV62E/XA4aNdOFw/0lIUKTVO+sBxNPHnRlEKFJdki+0dgcqxGTEJ+W+iV8uiakK
 QBKR1sbcKCnNX9lFvZzsvNzFGGwYL2OwAW1ZBObLJjbHXrkcmEE1jUXmJPPv8hOq
 V3rpdBHol177LVo7Go2ua5X4YGW1N7laV2tA56GjKnLfMnS0X1/kiZbq/MbLmqKf
 dMe4F4+XhOyg6Q==
X-ME-Sender: <xms:qHNNYSdNQekglEyXgiA2_xB9NDr7tkb4IhLjyOu4SgIoICF6nn_HqQ>
 <xme:qHNNYcP_CDZxel4QlhwynULuMBdPfUQNdhWHZC4mEy46xPE1qorz0_hKpCkYwTs8m
 IYF5zB8bQX5z1usyQ>
X-ME-Received: <xmr:qHNNYThwwvDdA0pChvOd0vVsd_Wjxm5Uk5AS8uXlf1NvPHzgVwIit-5tg18FKdyD_WQL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:qHNNYf-DH3yDLDCZfjIiowDwKubfDxAM__V3B0Mcye98z561f4C8VQ>
 <xmx:qHNNYesRWjfa7rqg6M0llYUPjtkJ6IjQUt4DGNE22FcaymS0Us3GUg>
 <xmx:qHNNYWFf_UzFTwGtlCakABKA9aWHHh3lSLgZMPRmWmwJzUSw6emRhg>
 <xmx:qXNNYYKiqU92NyyTzZ9w8AyAKBN44vxFNK4l7-XaDvyPt2yXJwdbtA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:50 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 07/17] drm/shmobile: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:14 +0200
Message-Id: <20210924064324.229457-8-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 7db01904d18d..8ee215ab614e 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -156,10 +156,12 @@ static int shmob_drm_pm_suspend(struct device *dev)
 static int shmob_drm_pm_resume(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(sdev->ddev);
+	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
 	shmob_drm_crtc_resume(&sdev->crtc);
-	drm_modeset_unlock_all(sdev->ddev);
+	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
 
 	drm_kms_helper_poll_enable(sdev->ddev);
 	return 0;
-- 
2.33.0

