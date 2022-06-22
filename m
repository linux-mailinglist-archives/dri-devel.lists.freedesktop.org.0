Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6C554D5A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC081133A7;
	Wed, 22 Jun 2022 14:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0191133A1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id ED8C732009B9;
 Wed, 22 Jun 2022 10:35:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908501; x=1655994901; bh=mY
 yNBjfyQJdnCjja69WAvxClXz2TRopLInZg7atUW9M=; b=VydmZhiVwsLEd63rsf
 3DC7qlIZ6Vmnanvq6EMEqrp6csDysw2ZrmovX5doxEJBwMLcBpJtRZcnBJlvBySM
 b1qwUpEMneDZFoc1WW2hAhQ+dUpr0Ut/BJvWg4zr9n0FqIvdbY+Uwfscr5dwOkUz
 0QwMexZeuoLqmT1EQAff7qWbO1LuLfnnyBYFF2ZACpScWtNt6vJINqGenRQl4juV
 2V0vmkRfcOokocTQ7aPeBfkwZZ4lsYxLmW7toMu/+im61Fopiedx53GiXXSMpvir
 0hb50kVz0iw6XgTJijUscNc68gP7RQpYZLVDef8ZRmPhCR81tgfuHDB/kQeFSOu1
 Zkkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908501; x=1655994901; bh=mYyNBjfyQJdnC
 jja69WAvxClXz2TRopLInZg7atUW9M=; b=vV1/LhQh2kg8uk3aUlVds3kh9nApx
 e6Buna5bujF3M9s9O+XXUpMSLJb08ulXtY9btuFMnz0WBngv0c+0DI9kHbQfAt9Q
 2pUQMbAX+3TGzQDPKVj0c2o/zxdM/kiAXICthcAM+m8XIIWX6/Ck6Xt6zqmDySq3
 oR4StRHryNxoK4RThyF8MyJxKNFfinmI503PaKJvGt65OqqRMPjycOydk07PldBP
 z3J1L5nM9vop4rVsKgx4GvyHPsYXAQkM8wQ7r/AWgWhBwQZtFjHdDg7XraQ2gCgA
 jJ9UUK08JOrtfkiK7jhZvkHlCt/Ohjj31dw6k8Gz0Xm3jg5BrKv4eO2kA==
X-ME-Sender: <xms:lSizYsCbxfDQ-tETKx2ReeGZ9dg6fv_1schbtM-m9LAWkpoEonO9yw>
 <xme:lSizYujsB2uSuyExascIXYjD9CN4_XyHeu_OF2dwlVY9tK0rNGCFLkkIR5kD4YuSk
 p-NGMse8CDYv6gIIbY>
X-ME-Received: <xmr:lSizYvmmeD5M4TqNqYy0FtzOZk8DsByU9VFUZKhh8B3ARh7TsMbAXC79BKCRUHu-cq1Erlf8JjMKNzH4hiaPY7qwJlvdbMfB0JnG5Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lSizYiw60h8iJVjVeVveUxxOB6VkB0PoKWK5hUoOmOJPA_lyp5BvJg>
 <xmx:lSizYhQRmnEoCVYIzhPZoEsFmJKuUyLuZae56N6OZGzGLyviRCO_8Q>
 <xmx:lSizYtbZR2EzfGPfNfeP-njTojZk4IWwdQdjj-ox66Uu0_0ROubfrA>
 <xmx:lSizYvO0PNPGiaEfqzwqAPkm-HvW157O07hudQIt07Oq-Zqu4uELkA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 53/68] drm/vc4: vec: Remove vc4_dev vec pointer
Date: Wed, 22 Jun 2022 16:31:54 +0200
Message-Id: <20220622143209.600298-54-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_vec.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9c5b31fa4b9c..ce12d7ec9c6e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -83,7 +83,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_vec *vec;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..99fe40c8cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -532,7 +532,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec;
 	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
@@ -585,8 +584,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4->vec = vec;
-
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
@@ -601,15 +598,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(vec->connector);
 	drm_encoder_cleanup(vec->encoder);
 	pm_runtime_disable(dev);
-
-	vc4->vec = NULL;
 }
 
 static const struct component_ops vc4_vec_ops = {
-- 
2.36.1

