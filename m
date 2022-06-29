Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745A56003C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBF710FA91;
	Wed, 29 Jun 2022 12:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D614A672
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 58FED3200956;
 Wed, 29 Jun 2022 08:38:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506306; x=1656592706; bh=Vd
 Lz+bNDyU6wNwEuYDjzbgjwCrsbL40xe63mL5tzsGg=; b=J3MO/TTkWl9Ynptl9p
 D9Npr71vmaf+dNqS1GSkfzfj0JoNf8l0tHtJpnJ8HsHO8uODTbkr5zY40WqinKBx
 0dm+M1fxZjigA6VQKYKk+QvrnJ1mnnf/JRxrmuvCmp5B8TgWC40B4rqhRK7rXh97
 OHx2/MQ6JGRzZlT8dljDYPhfZk+aY01ySEp75jJMaJ+pRE7VU7utHtlqvec+IZDU
 sLvdjoCXBOrY6eYyyXpFkbGVhUzZYHn1itNcHEE0W8vjkJGuWeclfPygjHHD0ZUU
 JpISOmgiXzMYjCj4GWTCJQlwhMU60Ze++TJimVtLX2qcR60dF904lhW8ZO+ABd7O
 468g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506306; x=1656592706; bh=VdLz+bNDyU6wN
 wEuYDjzbgjwCrsbL40xe63mL5tzsGg=; b=BGZ5kd9dgu+11w2gcJhZJLxZZEz1a
 3a00N8rxrz0Shg7StEs28h1qfthKbupe4G095MJ8EnYqZsf2LS5HpnKnm04SA65n
 nSdZQCfJGvrMw3kuLG/QjNRg7bgv5vQUAIiz+ofRVRiOA7Nbw70w+vo6DCgGY7rr
 v+JCEiSj4KRtKY2X15pyX64p+8RZR7HgB8/lKavu1FbxSSR7o33ThnUxPiKUI3Hn
 YBAbvNbgTEQxdrYB6AFElWz8zc4fL2X9t17Ce4eEJM9oYNRt4o0edCkhRgnRA7Yq
 b9Za75wn17Z8vGD9+9f3nWQDdnnxzEA6ReVkVKxsqdiD3OCxoUWKgxpUw==
X-ME-Sender: <xms:wke8YtIjsexq-przU7eduRnIn8kMjxR4xSCvoy_P4llTdgEpVAYG5g>
 <xme:wke8YpIIKVdjw5gmSOwx7zVOZbhtzj4nHnlwDQsq13muvTohpgWiLr-iUldS1vrAV
 w4i_3FP68cR_Y3JYUA>
X-ME-Received: <xmr:wke8YlsqJHRDJke--tzabMfKk1BawLCg99AfROG8df9DOUbzryyIFjHbeoHiXx9xsAp0CLFhM5DutMojKEGNfWlyYQ0ef-EjD9awygM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wke8YuY2OyxeGGFG43arTsCfGNu-jXjLcPAugv2gkitlA34Ohyzmsw>
 <xmx:wke8YkbI1FQGg7PhmURZsfg1agvPfukRlRqBRqpxnBd451qX5TvNnQ>
 <xmx:wke8YiDG9h_PSVl9Ppt-iNvv5zfzD_qDI48hUzazsal8mpOAfIN_Bg>
 <xmx:wke8YrV6QKGjv2vXSd_sIHIeGFrf6_Mamg9LJ5WkqT_jngwSFr40ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 65/71] drm/vc4: debugfs: Return an error on failure
Date: Wed, 29 Jun 2022 14:35:04 +0200
Message-Id: <20220629123510.1915022-66-maxime@cerno.tech>
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

