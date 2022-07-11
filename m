Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD757094E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBC090378;
	Mon, 11 Jul 2022 17:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC099034B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B31895C006F;
 Mon, 11 Jul 2022 13:41:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561290; x=1657647690; bh=ly
 3s9TS2Dz/uH9IQlq62e4d26iz+DDkcN3FFoZGJU7I=; b=nVqyxe4xgAJP2+O5Mc
 3CzvoV8yiYj8RTS4z54VHyBGEZgjpMrf9WobRQLX9m61qEr81fV3RkeoDLo+79n7
 t8eamP6qhNoOk81tu/5fDTujIBH0swRwVVFjhuuD/5lE5Id1ySC7jwi+7gq8AmDP
 JY3LHhR0ZHcyhGbeXsJXPZKvf1ajqK/nyQ0haGkX3xzDP4FQiE7SaSbFhhtwCcOS
 Ood/veBYZMbfuC4dU9u6+JiZlQaKNIIY7quNidPZPwFLWBApWy99KMSXHE73ZzPS
 d47CNdAqZclwK7mvOwbyPVFpLVzE0NhLqRXXrKxuuwAFAY/qaaQtP1bCYZjgqqp3
 zgDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561290; x=1657647690; bh=ly3s9TS2Dz/uH
 9IQlq62e4d26iz+DDkcN3FFoZGJU7I=; b=UQQ8OvEEfIQVOei15/juvd8PZ/Vv4
 z8zPVI5lB6Yfclye9Jlcc1k1l1xOHth9rFTv+cKMFsp2Mrm/3YlLNfPNfSQCdaBe
 V/8wqtyS3ATecWfTBRe/z3jXml1KRtU6/Mt7PRR9k5HaX0QJtoGVN7Vg8ULhwRvh
 KGYRcveESVpFTJYYF09Xtix8n/ussR5ijGxl8UwxsrKDYBCFYYG7u+LmL5phPNBr
 EJ5UcYZJIKW0Dx2NL+EBTaVSIC5z5TM7YCYHfT3pwKOjjZx6rK9qHPMdE942X/3/
 4uZIG+YaikG4d5pEV3SFG0zEzRfm4ww1zLPMPZ++B7G/I/PUE1NJYZ7hw==
X-ME-Sender: <xms:ymDMYn3O4xosbtIQoMNmLgQwJK1cOSE2Ah_ni-hUV-SyNPwABFnB0g>
 <xme:ymDMYmFVtSe5FP2C0DOPIxbtwpfcGl9qtNd02qx6UYIpqV_OUwK2u1KbOF-nXukzT
 OLf74WtY8LRlliVs10>
X-ME-Received: <xmr:ymDMYn7Ytp2qrkCSxNnTrZyWTHSvBTFyCqjQFp2fnP-CPX9hdTyHo-dJm5d5OCWp3D3HFsTknoqvPv8yFp0IHx1Qb3olEMdblwi3Kck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ymDMYs3NZopU-6oalIM81o0aKIxe_0VpUSSwNVLAPops2zGRP8RHFw>
 <xmx:ymDMYqGS6wXJ1LY73_Gn7_D_NeK8geUhpONhmI2rCX9hAgh3Jy6iCw>
 <xmx:ymDMYt-wXHYyzQinut4yHuyoEEh9ayrILbYweeWln4yeDpZr0pRkqw>
 <xmx:ymDMYmg_eIPPVt2tupFWDlJ9bXPaNfm-deMuvevxmSzvG0Wm66TI8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 63/69] drm/vc4: debugfs: Return an error on failure
Date: Mon, 11 Jul 2022 19:39:33 +0200
Message-Id: <20220711173939.1132294-64-maxime@cerno.tech>
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

