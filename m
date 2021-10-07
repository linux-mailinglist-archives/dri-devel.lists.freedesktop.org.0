Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201C425BEA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41066F480;
	Thu,  7 Oct 2021 19:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E616F4C2;
 Thu,  7 Oct 2021 19:38:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 3413F2B009FD;
 Thu,  7 Oct 2021 15:38:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 07 Oct 2021 15:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=o5bKC/lveiRjA
 d/NQvwiZM4j13eSxDb8YWz9skkQNGo=; b=tt6VdytckCeWBFo23/EWsp2HOQ7+U
 pmBgr9MhfJQVimPZBdVZmS7S7gTqIZYzHnucVy81kiLd/WeTx3j8bhvoaB4KBQGM
 SedScMf1TvMzNekwiXBcPxO2w47n+7q8+npBy36NTXtIxmufQDYsY24C2NRr4UqP
 /6oUYff8igrVjTeQkqFm0Dip7rJysRxnNT6PI4zNedLhBnrA/WxoIRG3yRHmJYOO
 z8P+WWYFmsPc3BeI0FsbyXqccFkes6vyOCo0ddPYO6HBbsHR/D8jOSBwSBq1atys
 6xnxTQL4fRh9Ic5SSV9TnmbMacvp64B+ZjH/6MKa/n1fgh2bn1CoJJDMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=o5bKC/lveiRjAd/NQvwiZM4j13eSxDb8YWz9skkQNGo=; b=ai4uTBAj
 c1aIaSuj7SDzp97vGAEEEI72tmy66RQHKj5HYWmQOxf3KHpugBiSL/qabOQb0re6
 cKslYSmqQ6XTSgMjhEwh4aV/uPGsfQmVbrmaaVpMTa2uDuLnvLZ+T1CopMiskHGu
 P9HaQ/66QIb3taxR2bJ95h3fpXHqRvMJIE7iR2XZirQJpVgtt01GlrnN/4b3a/OC
 QBXWSR9Ed9NJAyvOgD8MSdK4I/AGh13It6gaq3jU0SBHwPxcBvxWPzyDtWtXSoPT
 k9GC4POcWEBunOuswPjsKoAbM43UTEpV9VZMLcGlPCVuWRSTod9MdROquEz5sgpW
 O7C1h+Nr8mPAUg==
X-ME-Sender: <xms:t0xfYajUZlXPFSiKlTzbwrOF7MC363FCz2C_zOH9d0qegjgz08_AVA>
 <xme:t0xfYbCXrcI6QvdMLtzzdAqRqkrRoDU9aZdQuUcm0LngpVcaNXmPHcyBlAvmZFO9J
 ZPwuVbzbSnpVBGvAw>
X-ME-Received: <xmr:t0xfYSEO0kfDdKH0XyZ3E1YyYVK9JnVHEA3Oh6sz7kuJS47S4f3djouI-Wuug9WaC-Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:t0xfYTQWcTYB9xwoQWWHCV-TPpH6v2MDLGl-hG7GsIwt4Mst34OSHA>
 <xmx:t0xfYXzwTJTEhcTw7KC_QvvJewK2zx5fkHqgirUngDWnmpEV2ta4xQ>
 <xmx:t0xfYR5pCACMWY_8eCKlObf1wXAzccvKZamkP8Xg5RviMy0IpyhctA>
 <xmx:t0xfYfcriGE5ljlwDCqhObIbkBiJKofgFnQ3OGA-o-RYhdS2KOQzLPgB1S0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:29 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 07/20] drm/shmobile: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:42 +0200
Message-Id: <20211007193755.29579-8-greenfoo@u92.eu>
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

