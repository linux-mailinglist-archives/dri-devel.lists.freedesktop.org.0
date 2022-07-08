Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936C56B6CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23A1138D3;
	Fri,  8 Jul 2022 10:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB0B1138CB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A14A232009FC;
 Fri,  8 Jul 2022 06:00:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 06:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274423; x=1657360823; bh=Bg
 0r1H7FEdBHbJZ0awHukcSE6PQ0pmsX8wGU7txgMGw=; b=IXv2H8bDAqAyJWZhnF
 vJ7mS8NzkXMhyN5XG4H9T6PGUzyn75Wa1AutRnBM6f0VlxI9ltBMtpPh9dnUm5u3
 A6K7/3t6yuyD8qAlJmZ210O/PrmKVTolDdqMkgOpuC0JmSlS8+QGNuAM8UBzlIp4
 vRaqDOXRTmDoQZ6oedHX0C5LsOCVSC9A3G6cfRLXO8kk58dpHwn55sGEEpmeigPT
 3ttzdJIRgbsgPXSqgd9to2+jZhW8yHPCBncMVZwTHu2qSC+5nGlxcm8YMdt5G4/3
 eeo1G3HkPWNR6fWMBEffvkbqlmyerrIZvvnky+SiJ4btSKv+MwWMzF/CFlBYvJ3x
 EwvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274423; x=1657360823; bh=Bg0r1H7FEdBHb
 JZ0awHukcSE6PQ0pmsX8wGU7txgMGw=; b=eRlIxEbC8U50Nx+WU+2TYCvFopgVE
 BKGC7sYcqhC4H6gzJR96Y+qvDwXOrQyHucjgSYL9erSDlgXiasBpUj4iZs4Kypar
 wiD0gyKv8IeqUwJELzoiw1bja/jmtbSHf1DWg0yc5wQ/63/88V1VuQR5S7tl79SL
 6F0oqNzNe0cn/SlgAp+6LXlmbJKdkbPIkMqwdRABaq0Es31ZHFDnFYCmOaw0zIot
 eurnJ3qWnM3jY5qS/OekTEvQns2wh0etTZh1QGRTY2bj7OlEVeYBYB43BEGUZjz4
 D94SSLJxp+kXAQPIurfPpeQxdwCkN9dCGjw057nJKURQTOasGKHr/U4cQ==
X-ME-Sender: <xms:NgDIYkx1E25I_zOO646JRJ91aFes5f_rAbBCVHp43wnyLGvw-V_iyg>
 <xme:NgDIYoRVsauaACPC0B51CIchm_7C5Lr1fnNnn79E7LekgTJm2jPyX3G8xzEyNVlGx
 HyGh4cpJy8ZAvh00vs>
X-ME-Received: <xmr:NgDIYmVZZrL-LCiRwteo5fapvRgGU4uEUBbnqAIhLSpzJgVzXmqq8uez5NvAAispqVDBjqAHcYK_ItIdQ4oTPdMsafHDMFZf8c3bLGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NwDIYig65C1CKEnaPLCso-AMLFFjuftgEBcI0E4MwmA_Q2e4OMJ-SA>
 <xmx:NwDIYmB3kB95O026E6p5Po9jXT8uUqQt_7iNGlhrbtCc4e2SZnfRJA>
 <xmx:NwDIYjKwKQlY_ahOyV_VtFLJzr6MdxTbMnuMKAX_8C-xjG0vAnfxPw>
 <xmx:NwDIYp-bU8wJ5mNhur9QGZa1D8qdWSuXae0b6BEyXFJAMHnKATaPUw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 65/69] drm/vc4: Switch to drmm_mutex_init
Date: Fri,  8 Jul 2022 11:57:03 +0200
Message-Id: <20220708095707.257937-66-maxime@cerno.tech>
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

mutex_init is supposed to be balanced by a call to mutex_destroy that we
were never doing in the vc4 driver.

Since a DRM-managed mutex_init variant has been introduced, let's just
switch to it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c   | 15 +++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.c  |  4 +++-
 drivers/gpu/drm/vc4/vc4_gem.c  | 10 ++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c |  5 ++++-
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 9706fec47bcd..2ccf96b764db 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -394,6 +394,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
+	int ret;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return ERR_PTR(-ENODEV);
@@ -404,7 +405,11 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
-	mutex_init(&bo->madv_lock);
+
+	ret = drmm_mutex_init(dev, &bo->madv_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	mutex_lock(&vc4->bo_lock);
 	bo->label = VC4_BO_TYPE_KERNEL;
 	vc4->bo_labels[VC4_BO_TYPE_KERNEL].num_allocated++;
@@ -1005,6 +1010,7 @@ static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
 int vc4_bo_cache_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	int ret;
 	int i;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
@@ -1024,7 +1030,12 @@ int vc4_bo_cache_init(struct drm_device *dev)
 	for (i = 0; i < VC4_BO_TYPE_COUNT; i++)
 		vc4->bo_labels[i].name = bo_type_names[i];
 
-	mutex_init(&vc4->bo_lock);
+	ret = drmm_mutex_init(dev, &vc4->bo_lock);
+	if (ret) {
+		kfree(vc4->bo_labels);
+		return ret;
+	}
+
 	INIT_LIST_HEAD(&vc4->bo_cache.time_list);
 
 	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 79a37d18aeb1..89975bdd607e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -324,7 +324,9 @@ static int vc4_drm_bind(struct device *dev)
 	INIT_LIST_HEAD(&vc4->debugfs_list);
 
 	if (!is_vc5) {
-		mutex_init(&vc4->bin_bo_lock);
+		ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
+		if (ret)
+			return ret;
 
 		ret = vc4_bo_cache_init(drm);
 		if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index fe10d9c3fff8..7acb43972e69 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1308,6 +1308,7 @@ static void vc4_gem_destroy(struct drm_device *dev, void *unused);
 int vc4_gem_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	int ret;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return -ENODEV;
@@ -1325,10 +1326,15 @@ int vc4_gem_init(struct drm_device *dev)
 
 	INIT_WORK(&vc4->job_done_work, vc4_job_done_work);
 
-	mutex_init(&vc4->power_lock);
+	ret = drmm_mutex_init(dev, &vc4->power_lock);
+	if (ret)
+		return ret;
 
 	INIT_LIST_HEAD(&vc4->purgeable.list);
-	mutex_init(&vc4->purgeable.lock);
+
+	ret = drmm_mutex_init(dev, &vc4->purgeable.lock);
+	if (ret)
+		return ret;
 
 	return drmm_add_action_or_reset(dev, vc4_gem_destroy, NULL);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ac9e0dd00321..719a3c3b4ef6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3271,7 +3271,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (!vc4_hdmi)
 		return -ENOMEM;
 
-	mutex_init(&vc4_hdmi->mutex);
+	ret = drmm_mutex_init(drm, &vc4_hdmi->mutex);
+	if (ret)
+		return ret;
+
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
-- 
2.36.1

