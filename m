Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11D54626E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E96012B4E7;
	Fri, 10 Jun 2022 09:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FB712B57E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AA7C5C00D7;
 Fri, 10 Jun 2022 05:31:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853473; x=1654939873; bh=59
 +oNk6sa/JOmD2UlatD50nj4KoqV+xLaqB4lOH9cb0=; b=idhw7zwY1f8QFvt8+k
 WiE2+cMMzCoECxTI45yLioXtFmgn3yr+MSndd4dri/EPrd+fnDmQ5GfAe2nCmBkG
 pwHYxhCW4/F9nFDpAdzDWAueqDOt6eco6J5FLqNbsCX3QjirpjCVy3Tb8qp30Hit
 ejdN9V61AJORmvRdln2hH4okMfXXOCE711e87nit9SvIe9I7xouavXz3Oo9glhCH
 8bnZTYoKNMLMjPqWHrM6St1l7BD1aEoCU3smWXGrLi1a0926WWZmJzh/byGMWugZ
 woBmkTLVhX9eGH8qNiagRZSfclP5KrICTnaPsuKIy6vdsa9kRCdBNxAN+SyZaB5Q
 vTlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853473; x=1654939873; bh=59+oNk6sa/JOm
 D2UlatD50nj4KoqV+xLaqB4lOH9cb0=; b=ZvelTJXik7oQXN3NhKnu+2iEXDKPp
 0GCgO4c9GRUu3d+q1RbsNg3Rovq+maCle9RUhm9JEn28h5GVw4GE66ugM16KU7yG
 UGKRDxg72PhC0qSxfsP3Gn3OGx2OIg8IphOeIGG29kMfP+V+Mu4XrjoWOru9S44H
 EKGsey9z3R4f0C6i8Pf17+cHbtneRuCW6g7Z0QLjkdaEaVaogXnzw/ByrmujfYGP
 aDPOrWubtkTDhVNaOY77Y26I3/Ncjbux8CRLsrJYgzPnqNfS7G+/vQyGzzG0jgEU
 I8l3kFwIndsdjkyYMR4H2jdoaZnqHNFBmmI+YQxJbXMJoS1h2Z2o81ZpA==
X-ME-Sender: <xms:YA-jYl1FAR02JsYtSfTRbNrokcWb0hTX2X_F7YF3xShb4IPz1W3O6g>
 <xme:YA-jYsEyjl3aiOsF8QCBe9px_dtuc4moSaNcAqS9m075l-7MLaHrNyFtjQfeopiYF
 YIH2-nFQPmhpf2NfOI>
X-ME-Received: <xmr:YA-jYl5acbbweU5Lfuzz7bgwMCgBYT-HOSsjTUZ4Wi_Qq8zAMZUZ5-EAh1t6aL0D9ypPNKI9DACOUBMavGLlPGoHXVJzEt4VSeDcpug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YA-jYi1a_5wl_EY2qYKHxmk62socjNUTGO5jzCynOCzwJZYuHBIoYw>
 <xmx:YA-jYoGXfafY73BLNI4-ALyegmgN8gKac95sprWxlKW-HebZXoNq-A>
 <xmx:YA-jYj8EajAOx6DD9Z-mLaeXLz5YeqZXVWq0yiM6vdf-hLZcQhT5bA>
 <xmx:YQ-jYkgbsTE30UdBm0NFO-Z5RLumO1nIOE9WhOGIccs4nVMVWAB2hw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 60/64] drm/vc4: Switch to drmm_mutex_init
Date: Fri, 10 Jun 2022 11:29:20 +0200
Message-Id: <20220610092924.754942-61-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index 68fe9903947d..f52c2cd85650 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -386,6 +386,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
+	int ret;
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
@@ -393,7 +394,11 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
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
@@ -963,6 +968,7 @@ static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
 int vc4_bo_cache_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	int ret;
 	int i;
 
 	/* Create the initial set of BO labels that the kernel will
@@ -979,7 +985,12 @@ int vc4_bo_cache_init(struct drm_device *dev)
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
index 031f2cdd658d..df3b92d06bd0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -243,7 +243,9 @@ static int vc4_drm_bind(struct device *dev)
 	platform_set_drvdata(pdev, drm);
 	INIT_LIST_HEAD(&vc4->debugfs_list);
 
-	mutex_init(&vc4->bin_bo_lock);
+	ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
+	if (ret)
+		return ret;
 
 	ret = vc4_bo_cache_init(drm);
 	if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 9eaf304fc20d..45f96409a72e 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1275,6 +1275,7 @@ static void vc4_gem_destroy(struct drm_device *dev, void *unused);
 int vc4_gem_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	int ret;
 
 	vc4->dma_fence_context = dma_fence_context_alloc(1);
 
@@ -1289,10 +1290,15 @@ int vc4_gem_init(struct drm_device *dev)
 
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
index 2092231001c8..6672542811c9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3173,7 +3173,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

