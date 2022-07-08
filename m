Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862A56B6C8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AAB10F50D;
	Fri,  8 Jul 2022 10:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFE910F50D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C3FF332009DB;
 Fri,  8 Jul 2022 06:00:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 06:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274417; x=1657360817; bh=ly
 3s9TS2Dz/uH9IQlq62e4d26iz+DDkcN3FFoZGJU7I=; b=ajrMpYY9ViHdU05wJQ
 d7m40sv2CnWQ9MQc/YrOG+RZox0np3PiEU+Dj2ymxBNQVrQy1/VbMjkkUo9uwmuf
 Vlvu1MWY55rqodNcBabmMFvm+A0Ox7yzX5GirxU9t9GPeQ2uAM/E8aWn/u0rFBgJ
 mj4izm8T7zTPIXuf2yeJ40IrPRI5c79fflNqJ0PNqRl6E2Y85TMlnNrFhgHAwBGq
 tYWcwep3d50rhB++IZz/sTGuTUlGH0gARWGhMzxPATWWeXkAXt33G6Qx5gPDOz50
 bL6erzdyEz60DcEj5Vss0lw9A4/03ghSPujyFd+LeUBiZ86fIyRaPsISKRgZYM5k
 hLwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274417; x=1657360817; bh=ly3s9TS2Dz/uH
 9IQlq62e4d26iz+DDkcN3FFoZGJU7I=; b=xVc4uHEstWj+SO7MvrtdpCWh9OXbK
 pgPHqxXCTErrXVAW8ZlB18I2x2B9JJutxtjfa9GEEFcddIvZeS+1EkQO6638XljT
 5GArsGIiTFuY83AsDWGPr2gyZqqf/ylpVCmbLBwV8qV0t5fGF22tsKDi6afnMlVT
 L0CmVh6sef0yWWnkmHkJJKgW6dJYoHKCJidL5VCrAk2y76HYwVyQa4x+7Y0ix0bb
 kIh7bMiNfNnZGRI6roVQ66n5Hmz1CGwG5pVVNVMGvtgMHav5i+zng95a1f/jORXF
 BlJ7HJWKFtz77PVxiQ2d5WBNS47pNieXlgL/zC9iLeXvSB4aV3+tnxwAQ==
X-ME-Sender: <xms:MQDIYl4Ozea3FYD97N55aVERyHQ9IkOE6dyzPa2RPCS9sI9zjl3Fzw>
 <xme:MQDIYi6u1YoAaUoEKJyN-eLX76Qj3vvmyB3Z_KHpkqzyNdCmVYhtfjsObM_pi0wZm
 bKhZfUfkNQA_K4ebK0>
X-ME-Received: <xmr:MQDIYsfVQIWU8p-tqOe7BtVNBiKKRwFO-67WNER9nE7FzK5URR2vs56xdsaIe5EesJpVDU5IN4yh73xNosBWdfQrj7jHgk33tV6WOlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MQDIYuI7A-cEZW80sN2j_PpFk9omwTyhZEkNtb3agkY5TDDUOvXw6Q>
 <xmx:MQDIYpJPybCXOchVUEtD5gPGFymUOyBfs3VVBW6LE7kfxgC5V4s7iA>
 <xmx:MQDIYnypspq_PHH0tfnbkj9Y8NpEkKczaCKOhBjJVXVsxo4IwdIsoQ>
 <xmx:MQDIYmEKpVJCjcqXHHfcYLGpxSYrI9C-kBA41TDDGANVUi79Qbl4Sg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 63/69] drm/vc4: debugfs: Return an error on failure
Date: Fri,  8 Jul 2022 11:57:01 +0200
Message-Id: <20220708095707.257937-64-maxime@cerno.tech>
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

vc4_debugfs_add_file() can fail, so let's propagate its error code instead
of silencing it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 20 +++++++++++---------
 drivers/gpu/drm/vc4/vc4_drv.h     | 30 ++++++++++++++++--------------
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index d6350a8ca048..b857fb9c94bc 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -67,10 +67,10 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
  * track the request and delay it to be called on each minor during
  * vc4_debugfs_init().
  */
-void vc4_debugfs_add_file(struct drm_device *dev,
-			  const char *name,
-			  int (*show)(struct seq_file*, void*),
-			  void *data)
+int vc4_debugfs_add_file(struct drm_device *dev,
+			 const char *name,
+			 int (*show)(struct seq_file*, void*),
+			 void *data)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
@@ -78,18 +78,20 @@ void vc4_debugfs_add_file(struct drm_device *dev,
 		devm_kzalloc(dev->dev, sizeof(*entry), GFP_KERNEL);
 
 	if (!entry)
-		return;
+		return -ENOMEM;
 
 	entry->info.name = name;
 	entry->info.show = show;
 	entry->info.data = data;
 
 	list_add(&entry->link, &vc4->debugfs_list);
+
+	return 0;
 }
 
-void vc4_debugfs_add_regset32(struct drm_device *drm,
-			      const char *name,
-			      struct debugfs_regset32 *regset)
+int vc4_debugfs_add_regset32(struct drm_device *drm,
+			     const char *name,
+			     struct debugfs_regset32 *regset)
 {
-	vc4_debugfs_add_file(drm, name, vc4_debugfs_regset32, regset);
+	return vc4_debugfs_add_file(drm, name, vc4_debugfs_regset32, regset);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index b7ccdc2b09de..5d857816426b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -866,25 +866,27 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 /* vc4_debugfs.c */
 void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
-void vc4_debugfs_add_file(struct drm_device *drm,
-			  const char *filename,
-			  int (*show)(struct seq_file*, void*),
-			  void *data);
-void vc4_debugfs_add_regset32(struct drm_device *drm,
-			      const char *filename,
-			      struct debugfs_regset32 *regset);
+int vc4_debugfs_add_file(struct drm_device *drm,
+			 const char *filename,
+			 int (*show)(struct seq_file*, void*),
+			 void *data);
+int vc4_debugfs_add_regset32(struct drm_device *drm,
+			     const char *filename,
+			     struct debugfs_regset32 *regset);
 #else
-static inline void vc4_debugfs_add_file(struct drm_device *drm,
-					const char *filename,
-					int (*show)(struct seq_file*, void*),
-					void *data)
+static inline int vc4_debugfs_add_file(struct drm_device *drm,
+				       const char *filename,
+				       int (*show)(struct seq_file*, void*),
+				       void *data)
 {
+	return 0;
 }
 
-static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
-					    const char *filename,
-					    struct debugfs_regset32 *regset)
+static inline int vc4_debugfs_add_regset32(struct drm_device *drm,
+					   const char *filename,
+					   struct debugfs_regset32 *regset)
 {
+	return 0;
 }
 #endif
 
-- 
2.36.1

