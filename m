Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423B3546262
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AD512B4DC;
	Fri, 10 Jun 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDB312B614
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BA9AE5C011C;
 Fri, 10 Jun 2022 05:31:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853469; x=1654939869; bh=DI
 nou6OLERZVjeI8wJNgfgPjZzRMBxdj+MuoRnhSxsM=; b=JiEem3RdlRlcVWh1LC
 Fj4OSk6v9b5DT/1Hi1RPP8yL+4tS7ORdC75EhL+lPEFBfWPSU5/a5kttQ57ljpvg
 Q/FZClwTQdH4IpmLQHR4Zh5v5ijQY/pC7pkVHUR+lS0Jcidiq0sRINl/L8r+iqLb
 wtd4s+9h6GhfVHIynyTo86pDnnsHqMcNg2WEiIXC4DVuQK81XZWhUZKufrbPGvC/
 v+GcLCTarhtPIvYSyioV4MtQvqij7KCzmtgX6GQLiPvwddWtRVtuRk5BQqcMw65Y
 P2Xfy28+KBaT1yv4Z6IEYChVa3P91CkGmj3SsUVGaUe9WlYr7i2Gc5FfG83wPwtz
 aKOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853469; x=1654939869; bh=DInou6OLERZVj
 eI8wJNgfgPjZzRMBxdj+MuoRnhSxsM=; b=txIytn0kjT2u9+nmQ02Mxqkj230rg
 EvXEizsGs/KJPWKX9BzDFR1gOC5GQvktMGXij85crNM88SLyp9ajLuvGvdw84IjV
 4VN+QklgYpw/vHavb8Lp+5nbvCClKeuE1TMv9k5SqY9XIDTL7fzYn+BmYN2Q+dgO
 XJmC5yDQHh2k2E8xhL6HijGba8tOfP+orVgJ/Kl32j6rKW40kPGO5asOp/yalVxw
 ctIQRxluItUa2l0dphtB/k8OHGR4n+4IG9rGOp9s4S/CNo6dZZOvRIrbQhbKcaeI
 TCM1n4swSlk+68gjGZEsjgSNXEfUVbtQaHodIIuZY2xCbCeZUU1DXHQbQ==
X-ME-Sender: <xms:XQ-jYp3eSauez_lOpgcIDOjyUzrYqST9M_95jRx_jDknaRnXjjty4g>
 <xme:XQ-jYgHzJvN-3XATKPBtvmAlA8SyhkweudfWufaqsC5zT6QzPECSt5ZBZGs0WnE9t
 zdfoVI0LzpSKya-z8Y>
X-ME-Received: <xmr:XQ-jYp61NGAuUtJl12987WLdhliN5xwLZ3d1w6lHiBZ9e1aLivzLo3uyLX5I7qllz5mo72PbePSb1sgG2voNjH3AYVZjv0UHUIx4-Sc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XQ-jYm20KAhiYW9NE3tBJkbTOmAKWPF7U1e_DkkndBtkxlcD5gFOtw>
 <xmx:XQ-jYsGELiJHvGwbCCvZdkfk0_lbfKqshui-SZunJvOAKpvoMVtn9Q>
 <xmx:XQ-jYn-I5plgdWY2rF6LpE09MJf95FpuoRywF_nsDVAQyGlFU2WBWQ>
 <xmx:XQ-jYoiSOWD-_OV7Byzr7EtdLfcjSvKwynVTz9MxyYBNBhDuCMlyMg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 58/64] drm/vc4: debugfs: Return an error on failure
Date: Fri, 10 Jun 2022 11:29:18 +0200
Message-Id: <20220610092924.754942-59-maxime@cerno.tech>
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
index 12ab6df30629..3d1482f414c8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -859,25 +859,27 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
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

