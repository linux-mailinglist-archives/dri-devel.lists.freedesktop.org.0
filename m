Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE657093E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BABB90357;
	Mon, 11 Jul 2022 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183890353
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A5BF5C0102;
 Mon, 11 Jul 2022 13:41:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561294; x=1657647694; bh=Bg
 0r1H7FEdBHbJZ0awHukcSE6PQ0pmsX8wGU7txgMGw=; b=U4i/wMooOn2hJ3ASXj
 LRwSXuE+B/L+VKiAftpsoGH7N3IwiSgHVjU18iIoa7yCoaQIzsqWFIF9NVdxOman
 NYgfbttbWTaLXtnrOM0btIoYbyP5n55z9sCYoln8D1XH4LRfu6RioeWC5QxGeXFN
 jyIOiIsSU7JuOqS/qAtYAK09FkTkSm7apwmnE5HPnux/gE55GMftHtM5VyH/3q+0
 c40DSQHBHtFFXu20loxeyNRzfGKWlN9ierfxm+OsEg39PehCwk9pgW7hVeChkgUj
 f9pxpKve6kW75QC5o50mVOgmLXE5vn3rjlA3162x3D3Z+Yf9h1CGYzrCY3RA/qmj
 o1Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561294; x=1657647694; bh=Bg0r1H7FEdBHb
 JZ0awHukcSE6PQ0pmsX8wGU7txgMGw=; b=3CB7YRnF2aFvsZp0Po1byYW5Y9XUr
 XqyOPVGB79SH6h2YmHmoqJLiT13osoznHWiEIhOWMGiUUkdGD/lSJkCI3C+u9FAZ
 k7NELMdFkYh1VxMo3//PAoOEXL+ZmMQK7ezRyof8GKkjSftyAKt5CUJcHY2FIolT
 Xi/9SS49p3biug7NB8n3XAY3RnCPERLupqgKyPUm9/wqaJ/9qqb3rGZ278VZ6lRH
 kAj7F3bZQkXdL+JgEC0/K8mUP/fv4I72hNWASsDodj7OaX2cPlPQ8aZkH+u1ps0T
 26ZLAsG9xOj7lOMLmo8rMdnEP6PMPhh/mEyEt7aERF1A3Ly8N9Ld4CYww==
X-ME-Sender: <xms:zWDMYjA7aDXoK19dwDbSua1XhpbcaeEpao1XLvlp4WIEJ3OEbJ3ymA>
 <xme:zWDMYphvxNo_F_kedbY6ZJTd7HJkkexFh33Wf-Vfx_xfxhXXlevBzrzHWw53KYqG-
 rjyL2s_MDDDBQHwqnc>
X-ME-Received: <xmr:zWDMYulrZknML_Y1GC4DWD1m_YdWbd-WKvErt_N5vFpRXQSYU08mfQxHaWrgFsGAApqUX_8C7K3YVO8QLQcIr8RCQ0gZ6wdCnxLOwN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvddtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zWDMYly0PhO__wAs0XXLpZwMf3PhUYPYdMgSeZdm-lDaLwFSy5FG4Q>
 <xmx:zWDMYoQ30dDQXRAhiPMuMl1OEvqmf6bHKnYYO0XHPX4SaKBbFI-Dpg>
 <xmx:zWDMYobXiwfB9UUeqFRNMeE8RkdNC431G3OtyLcTWRF5Qtuv49Z4gQ>
 <xmx:zmDMYuNmQq-LT_PTXqnFgVTH9tNHxhvI4Bdavo96KRcK-MeApvoolw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 65/69] drm/vc4: Switch to drmm_mutex_init
Date: Mon, 11 Jul 2022 19:39:35 +0200
Message-Id: <20220711173939.1132294-66-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

