Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42852554D6D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5EB1133C8;
	Wed, 22 Jun 2022 14:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED3D1133B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 51FA632009B7;
 Wed, 22 Jun 2022 10:35:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908534; x=1655994934; bh=aM
 9Nydv0pTCyRHGuU4QRGVrbMid7WiWlH+6v03W1Xx4=; b=XuVfH9OTSZzCHtXOR6
 l/ycYOlP47A0/jhGNvvToPqhuzB7YusE+BpU6tPDTqlb6Ndk65c5oA+yRQusfH6c
 EloJkAELz2YRAFwyn4owTRAJjua4CUen+s2Nz+KcYqP7V+tM1DN9f90cDaEVhu8T
 aZhUGGLODky5gcsnT44RtT0I4m3/Q8SxVgLi7M3hOuX0lC6pEOGQ21YqAb0ppkIP
 OZHr5x/dRJX0Uvjq9NkNxbRpUCBSUm5cyJidQuKVmPMlixvZmS1dm8hnHR3n+0cn
 VF2QX39KdpbLgtq4S+h1m/JERUvQ6rnw6RpEWvm80cUhFvKeH0MjBaE1lHWLXJrq
 TKdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908534; x=1655994934; bh=aM9Nydv0pTCyR
 HGuU4QRGVrbMid7WiWlH+6v03W1Xx4=; b=DK/+B7yqtndqSV53iFG9LXQJEmB9W
 5Kh40bsA2S+1jUJbDI/MsOFBfQRBN0pIQLPAvzZXp7UPPw1/AzhlzWP9/l9qTqcc
 STwIADqEf9RIqiw8UFhtawfiNucNVnDD9QxrNpN8eGPFgq2QZeoXFfrh3QcCrJjR
 qnarwLz7gCVOM3Na1VE1FmVRcX/+r//G1pFbWN7z2D6cAhKrFonJeb7VBlC1r9KZ
 mQS+Pc1acGOa9CxWSbj8X6hMBCoLSxcmDhjcq+zH4nlkH9OH8oTnB4tNjOxq3qig
 qfrpfbCO7IOY6nqmVmUjc0w4WnkTRtoDaq19ijiUuKB8ZsMGoW5w5SY+w==
X-ME-Sender: <xms:tiizYkLgXNVyny0RMryXNHLyAYSeJl57ywjkXnVlo4nLRL8fj_x9yg>
 <xme:tiizYkLk1IpD_m4SGnBPBt8YKwNrc-NylGf9JMiyUmsnE3PirNONg_B2Tw7t1WlVS
 sf0Uazs5-gtb6mvos0>
X-ME-Received: <xmr:tiizYkvU8AHQy3v0xrIwP0fDeNlotOCb7yvw0ArygSySCr4Ubfcorl0gU9t5ujNC07ipC4lb80vFhUsKvLjYoE-5RrgV1QXGCvcW6jY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedujeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tiizYhYyTTYS6Zt7K-dTrI2LnKzZjaMxaHLVhHT56iAnH7uFsVfsIw>
 <xmx:tiizYrbbafbIkm6HPSnVEnVB9Vbv9Q2ODr-uVk-cEVNSKCqW4VxJXg>
 <xmx:tiizYtCsJuezqfb369tCH37qDzJTQpWrTMoSxYxFTQs2h6Jl848PCg>
 <xmx:tiizYqUBALzRJaCulCa67KTAsicuU8W2flFoiQQfiKTND2sS8aCYNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 64/68] drm/vc4: Switch to drmm_mutex_init
Date: Wed, 22 Jun 2022 16:32:05 +0200
Message-Id: <20220622143209.600298-65-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c   | 15 +++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.c  |  4 +++-
 drivers/gpu/drm/vc4/vc4_gem.c  | 10 ++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c |  5 ++++-
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 19807e4e0c55..312a1a936caf 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -392,6 +392,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
+	int ret;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return ERR_PTR(-ENODEV);
@@ -402,7 +403,11 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
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
@@ -1003,6 +1008,7 @@ static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
 int vc4_bo_cache_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	int ret;
 	int i;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
@@ -1022,7 +1028,12 @@ int vc4_bo_cache_init(struct drm_device *dev)
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
index 06d605a12633..c85f86a87bda 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -305,7 +305,9 @@ static int vc4_drm_bind(struct device *dev)
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
index ef46dc34316a..8f6531e2a500 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3196,7 +3196,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

