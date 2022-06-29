Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A152C56003A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E7D14A67D;
	Wed, 29 Jun 2022 12:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6265A14A67D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 327333200982;
 Wed, 29 Jun 2022 08:38:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506312; x=1656592712; bh=D+
 4PgdbbxddQo2/voUO4ltBZBkuFayOslUSekWfSYBs=; b=DPxK9tCrJHuGguTemW
 xYNhwzuwfU/8ZUp+10b2QO7VYBcQwoSocj9Bgs+clD+YxrHoXoNL3U+KipLXM5/r
 zS2dcDNGam+dfyaPDCKZ1g/ozc3aivmX92oVy2vW+qI5vSCQvDhXyQdJKdp7spbe
 87iE2HLVDDCMGeWtjGKZqSg0ulMzvexlv7545eEunikXwBbcxsHuSQMrkcpyCxlj
 CJWVqrneHoK+HHNNyhY0UkbG7JLTWkKozYkKJ8102GG8Kfn9TMZl0kul6WTXworu
 tLDzmgJUwE8rYRGx3QvEnY1jY0zkUG31ZxAKwVUpvEQmuLj3AvwsWMX6Jo7IuBL/
 bMMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506312; x=1656592712; bh=D+4PgdbbxddQo
 2/voUO4ltBZBkuFayOslUSekWfSYBs=; b=V4w7KyOUOmhXGhif2rqMebHEYHaj7
 QVVTlIoSv7xw4EQu61PsBt8KnEIK8htIuUNwIQTrrd/hw0mLFWTnKQgPf43xDS6k
 rtIiayJa7mZInsCvNmxxTiv0MneE11UApo9t1tTmjhLQZc7WzCNIiZ5TOU9bL6vP
 p8mLoepDYiP01OwExBUwJCLVrgGSpHfEKjzpLoRvkfsJfhXHt+OGjVF5MpdMtXww
 kk3qo6+pIOf1VR46wq4C1YYmI7xJjsue2Oepz5FYy15lk8CCagwUBg9N26Sl4zjh
 E0pyxjF+QYIf/8EeK87/4y6XGxBW/bQGnxp+li3sHoGgD133s0+tUrOfA==
X-ME-Sender: <xms:yEe8YtJJ1OmTbZ6VBYvVtJTdnwl-c98lgLDIxoheSQH8VONfcMd1nQ>
 <xme:yEe8YpI2RLtWr03mh30Y81lFqjr43vXQ3Wq9k_FLMED4oBmKLfWXpdiHpxGkPXScG
 o78odht5GZQ5qMubN4>
X-ME-Received: <xmr:yEe8YlvACufC-pGl5CbEjEkMYpWin4rru8mpHt6rkC8p8XQ7ysUVCnAH60mO-dV9lHeSB3qw1VAMbKtHJp9KJ_GFFk96WkiCIUCVr8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yEe8YuYULYvwjodnMUcNo3GtVYMepv3ntXcR557HDXQLBgrXBU6Njw>
 <xmx:yEe8YkZORLfYGL_mEsSQQKnnu_LI83d9mBkLsSQ1wKG-VjhQtLlNlA>
 <xmx:yEe8YiDU1sMfkmVA5xDFk270NEXPYnQbsTbgnUCsMGwB8Zd0_IJMqQ>
 <xmx:yEe8YrUwQ8nFw_45fAFq9mFasWHEyv3RZz2oZ7nD8ffNbUA18D0j-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 67/71] drm/vc4: Switch to drmm_mutex_init
Date: Wed, 29 Jun 2022 14:35:06 +0200
Message-Id: <20220629123510.1915022-68-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
index 942b5442b843..ff6eb879b469 100644
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
index 4acc865576f0..6f61a1b8a1a3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3270,7 +3270,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

