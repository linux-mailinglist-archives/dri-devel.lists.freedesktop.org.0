Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1740EC80
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BAF6E955;
	Thu, 16 Sep 2021 21:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614A6E5D2;
 Thu, 16 Sep 2021 21:25:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 8404D2B011EA;
 Thu, 16 Sep 2021 17:16:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+7EY5bAIOjry5
 w5SQBtfSsN4LcEPoeEdX3LXy/z/Ks4=; b=vPdLyNUJ53Svm6TKvV3heoDGw6EKz
 Hcrvjieivqhsc50//m8pHp6OnBxuLyC6y/O2N35EBinh2pPiQESLS9obD5NbzwBl
 QtOdoiCdYNbOxl7ZKT2X5Y0PmlClGahOqoKcs045OWQldwKAs8ViC78lqGS1rG+T
 LfX+hqB7l2dnnKu7Dsvh+9AaZ5Wro0qxA1ZvpC0FSn5Zo3Q+MLIRVw+bpHw+TVID
 F6bTPADdS3/wvLofo8Fd0FS0IhOUaMZ9GVbyXd4EFb2cfAK9pLAKR+dj6ZfEn97h
 IQQxqNbpWEPs3SCtkEQzlFKTzIaj/RTod02JZTqfhttJ6puvZkCmxxf9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+7EY5bAIOjry5w5SQBtfSsN4LcEPoeEdX3LXy/z/Ks4=; b=SrHkyv7K
 6S72y0gj7ovlQaPnDqC5QvGGRub5Uivup7m+fKQqnJ7bD/bm8eO8AQ1DKhkv0lTa
 He+cvaOQ2BfSWBSVYzDVhuzkEHZU9IeT2qBpZaZaVU8FvDeRHWL3Ed5ayPeUZEk2
 mjHfPU46sA9GxHSKxNvYSHQkgkWOJhrTi+ZrVXbAMUs+xDu/y21OAm8LxxM0kda+
 ZM+uQ3un5QLTmEHmjjvPvdpnAvDAeGj2Cy/DgH/0ZX1/K/3Xi/ofHM6zx0lL9NoX
 5kKSHVk5qFDJNbd829knGogCpWDQQEyzMdLt697lLJyjxA9LYFdkBfGpM0YMIsIn
 N/jXqCq3YGgSYg==
X-ME-Sender: <xms:LbRDYd7aywHHE2Sn9p5u8ppN_QVLW4nnspaKUEholpKe0ra-Jh_x6g>
 <xme:LbRDYa7ADXvzXN5YY230MC0R7R2EC0thcu0lQAzOTuR-27mtpzYb_bH1iMIVWFCVs
 vkdIb1ZhCkayYdAsw>
X-ME-Received: <xmr:LbRDYUe2vzupPOhk-Y7FGXlF2sP66SDjxqEyjQYr8MJAjOte6vsbv5BUWwWPIa6MPYKe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:LbRDYWLSu46eI4HriC8bwBqnOUKnG6d6d4PD8_1FjoblkVCEpXDnNQ>
 <xmx:LbRDYRJkmK9jhqQatVmhtPIsEUGKLdpdlCiTu7NbEEbQ0Deqgfnhwg>
 <xmx:LbRDYfxjSQsTOXzLwcguCrE7V3vxKgKix1ykD60puAStIGvdzqhNSg>
 <xmx:LbRDYaVP0uYQqj0P_7YJFMre_4oerTrhpeGM9Rc1lgimSz1sAs-Q6C1SiNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:27 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 07/15] drm/shmobile: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:44 +0200
Message-Id: <20210916211552.33490-8-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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

