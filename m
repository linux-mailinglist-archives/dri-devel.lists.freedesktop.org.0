Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB84554D6B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C2B1133B8;
	Wed, 22 Jun 2022 14:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB51133BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F395832009A4;
 Wed, 22 Jun 2022 10:35:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908528; x=1655994928; bh=Vd
 Lz+bNDyU6wNwEuYDjzbgjwCrsbL40xe63mL5tzsGg=; b=VEyjr9UK/Qv89V6ahq
 stS1uMfQgpkIeCBZAnoleId5wdma9oZj2gHZM/W14uUGScCQKSsPjxT+b9EkyXpx
 8mC5J4uznqvb9QLLP4KAKfbZnXmmpAd8iquUFtwfMeSqc4sTAYXs9UlMSLwQnh36
 9KfZnhRsPkuN5scS2TR7X9ArfVU1uAiykYIYdkIOHOYDcEJCuHEEaMYpLQxbrJUK
 LhKH9HuxO6pH5u0yWDMHRzWG16H/YGKPgEJ5GTs1DDKvQF2KSsYfPo33zHy3VwAO
 q0Ny9EduG08Vib+i5AUBdW2y03n4VzN5mX7db07aMFuRocyEJvSluADh7+JvxiaN
 7TdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908528; x=1655994928; bh=VdLz+bNDyU6wN
 wEuYDjzbgjwCrsbL40xe63mL5tzsGg=; b=hhXKMIGt7XaKyqtzjdyvyBIrfpij9
 ZgO/v4AnycZMW/E1iy7Cp+nWrbXFHRKeqZA9jv2XFUcB1YFIYt9SfI6mMv63QAEW
 2ik7DKpXM4bqmNbOvYvQABS5Fh6+n9zjNfkrnFlGpFmR/DAsk9hGmVKvDfmKM8xT
 kZ63/c9i8xOWGhzEKBX5HgeHu5gSvVM9/ZcmcewB/u7KsBalrkLrjBc31X4gKECx
 eXW8oU4ljWn+PF7s/pGp2+/xYGMqn3a1R75jJuMFv9f3jE3WjFKebmrqvS6RKZi3
 4gOB5UGUs3aQIekP7tYd7sq543rj6i4ac0cOhcy/3TPrMI0jdiAPSLhLA==
X-ME-Sender: <xms:sCizYmVMU70ejeCvXPART-ZipEmNCItZXydBQ7AGXcEYnBMrPEtxEg>
 <xme:sCizYilhLL7DMJHq9lN3cEtkzkecMQ-Ef-8k9ZY2XktjwuqhXDgKOQTtg4BgY6AQa
 melBESbAynx_MytZkQ>
X-ME-Received: <xmr:sCizYqaMXO_EZoN1VBsW8xSQS0-JXJo9jhug2Yj6gavsuOk0yDyVe1tdveOAzTmF3vBE4bO1uPb7foPPrwbnHgJwDRTrOBN10lElWnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sCizYtVysPJPQjGWuUbKRt0peSqyzMJ1AjiRrKJLTXykL_YCxVhSxA>
 <xmx:sCizYgkH7Kpm2IrXcLLstov5GV37reOB1wLunNCoTxbrvsDX9VxDgg>
 <xmx:sCizYiexA6BWQMH7GL_OEVdBGa5Nt8s_9fqdx1ByCYqq5Wtmdm_I3A>
 <xmx:sCizYhA7UO9ZwmMFCdcXAwEswhxRjcrfBqqxmmyW7KCDiOc5p_hd5g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 62/68] drm/vc4: debugfs: Return an error on failure
Date: Wed, 22 Jun 2022 16:32:03 +0200
Message-Id: <20220622143209.600298-63-maxime@cerno.tech>
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

vc4_debugfs_add_file() can fail, so let's propagate its error code instead
of silencing it.

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
index ce12d7ec9c6e..e029dbd4567b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -865,25 +865,27 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
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

