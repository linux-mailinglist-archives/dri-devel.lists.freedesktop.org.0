Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32756B6C6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1F21138BE;
	Fri,  8 Jul 2022 09:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F6112ED2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 61F7E32009E1;
 Fri,  8 Jul 2022 05:59:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274389; x=1657360789; bh=3y
 8cQNpi869mLnyLx311rfT1TwxIzJOtcu51Uwda8F4=; b=XfuQOL/0YNJQJx8tQa
 wrYz2Bnh0UGGQS7jIf6ewFpwwbvaQo++R+ofMeLzGFY+dRadMTCU1L0pmF+PPNc3
 5P5BO2dBTByvDdK5venIxf+jtX9Cddd5GuOnqDJKXiVtl/q8E5zjnbLDFNxr6N5m
 GjqbZsgtlLvKJRm2OdNRs85tSkgzYzf6hOAujj/gBgoBujBbg6QqE9ce1AZu1uM9
 1X5AHJX+1BIDBsTZlZ04UcC6bC3hjUxP3gwYKUiasB+r0Srmo0zyNYMHSl8INvSm
 eR1tRmegz1jlOVZVGoHC6If5swvi0XWUUCmZ5B+zD8HA/lGLRrvTPmJ+BhuWpScH
 ysHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274389; x=1657360789; bh=3y8cQNpi869mL
 nyLx311rfT1TwxIzJOtcu51Uwda8F4=; b=bY/TRVXrIn8xBTSY5zsNAWGvAKzAK
 IFE8pKct/gi3AvS5gNYkPczew42L/6Zx4la0NYVWWYAZFF4gvccKuwb0Bc6noDNy
 xTH7d8l6tFBll5pQOrcUckOLl60yflKoSt/Yi1MR1npSYVbQA2xmSy4Z3AJ3/FkU
 0k91aDV9hDpFJtzsg1Xl4w1qudLLrcOir/NT745s0gla0IMxM9/dQS80yGKoaRV+
 N0RG0k3FtFYo1jOzEzq90fRBvc3toSN4+tG2LGm0giqZ6Nmj2r7JgKK0s/4jcXIR
 38zHVimpoOTg6gnJJaGQbs9BYuaUpAtjCVggd39AKEz1FlMDOXc7i7Nog==
X-ME-Sender: <xms:FQDIYrcNGVAIqqywoeljyfawcEsrvn3lqwzbJFNaie06hSpnRC956Q>
 <xme:FQDIYhNdpzsyNo08hBRkyOYthUB5YmCQN1qxNHbKWTc7nYjmCCghvKkCrKF_e_wjZ
 8HMa0ah4Xuclz0YCtE>
X-ME-Received: <xmr:FQDIYkgLxgK3x23kyA3imIRlYNu26fDFWzV-Q0ubQch9X9RkBijq1n29OiogAVtvWLaLgLGMTeTAK77DVOoY5L79qOvI3oMDfHbvMQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FQDIYs_puDem_B4r9Zw7WDGFAbuV0AYf7a72RQAGbgOaAym6320PGQ>
 <xmx:FQDIYntL4yS2YOMrYjQhBmfvmAL6_FYO4qT7kNazkkKiJug5958SYw>
 <xmx:FQDIYrFB4qoVtsifmVmQEZDE8D4t6jqrCsQp6II0yoz9d6D7496wvQ>
 <xmx:FQDIYhIY1YAQGRDzDALSiWIJBCrHDYjhPbEyxgZYNgqjmDWoXD7nEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 54/69] drm/vc4: vec: Remove vc4_dev vec pointer
Date: Fri,  8 Jul 2022 11:56:52 +0200
Message-Id: <20220708095707.257937-55-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no user for that pointer so let's just get rid of it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_vec.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 0eb5f8a669fe..b7ccdc2b09de 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,7 +84,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_vec *vec;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..99fe40c8cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -532,7 +532,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec;
 	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
@@ -585,8 +584,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4->vec = vec;
-
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
@@ -601,15 +598,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(vec->connector);
 	drm_encoder_cleanup(vec->encoder);
 	pm_runtime_disable(dev);
-
-	vc4->vec = NULL;
 }
 
 static const struct component_ops vc4_vec_ops = {
-- 
2.36.1

