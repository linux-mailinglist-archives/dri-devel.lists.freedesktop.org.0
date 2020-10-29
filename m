Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691529FFA5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F846E995;
	Fri, 30 Oct 2020 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8F36E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B87D5807F7;
 Thu, 29 Oct 2020 15:01:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XV+NVdGaEh8mQ
 Vk7eZM6N7UCiTwKhu67OZ1OBCKDQ+0=; b=JibC6dlW42RgXML2grFUzeQ6V9RjD
 ibhhQWjcfUxXcHmLkSdJW9rcMjEIOqqDDMJoDBBRX1Es/RR1TY8V9Aah3FfhIDZV
 51Dz8TRGVuf/SWpKrgyAIW6sdsDDkc/ZPgQ++IwYYuFGncl0ipC48CKU8gCsQDCb
 SF8C2KRz/7DxgY/l88sm+4IsrBiHFyOFkciRhowRMmv/3zKA/7gWQ+J1+1r16zbp
 sxnRZA0nWjSYY5OxuGPWpXGxjygzd/v0iqnnPKJw2nGU+hnu6ledVwEuaE4czYnH
 uyuIfJEcUHShlB9RUT5/fdLVvbIvsxaiQDqet11fZYz10BgAHPaXMjufQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=XV+NVdGaEh8mQVk7eZM6N7UCiTwKhu67OZ1OBCKDQ+0=; b=lnxzYppI
 p8jya0XwOB5Z5rBFzz6x3sL1Vd5eZ+5a1oi+jSBMIkj/N80Jg7Jfz0TOLvwWx72N
 wjV/QzsKnBBiGoXCF5O9Sr1YKiG6p9MRiK7pxIOYrxHby7mGwPmeqlPHckUu+FxC
 gVl0XJoATRf9jpqAjITDm1nstLf9LjVy9yX7zfpdPRvi/WkdJMXP/PMkHffouguj
 EKKmr6ZnjGY5YgypqtWqK9RiXlDQ5GCH5C8KIwRULXsbNNhxfHLEITTxJTh769sd
 AyYQP9Y3SIhLBRq7c2dV4fSP2O6ZwfNjkKUHaaPv9QKLHmOwoU/NwefXTX2g/ndx
 5gIxC6kqJLUJUg==
X-ME-Sender: <xms:dhGbXwow2AvO-K3XLlbCzM3NROeVZScl4hYNFkg3YXCmg3Bnk843wg>
 <xme:dhGbX2qMY4MJHwYtzl440pcVN_R0fqZHSLh1FPUV6SvVWdmOAAu8KSq3F6lGWfHLW
 EtrN6CdHAPSx7WBTcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dhGbX1NdorbPnVuKPVvP-Zq0DetY_P3gnioYGi4z6QBbvWqRJuG-8A>
 <xmx:dhGbX366YerDF3tjPuOaTPZYxsBgT-yVKXkzBobqYRBN673TxHuJUQ>
 <xmx:dhGbX_5flQXZnmPQiaNoMGjye-rIMk8wd4PyeRoy7k0G-fWVou0dFQ>
 <xmx:dhGbX5tAP0WtJEXqpSavw0otrNR0ok58ETlEC8K7B1lASCwfzv-ncg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 055CE328006C;
 Thu, 29 Oct 2020 15:01:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/6] drm/vc4: gem: Add a managed action to cleanup the job
 queue
Date: Thu, 29 Oct 2020 20:01:01 +0100
Message-Id: <20201029190104.2181730-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029190104.2181730-1-maxime@cerno.tech>
References: <20201029190104.2181730-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The job queue needs to be cleaned up using vc4_gem_destroy, but it's
not used consistently (vc4_drv's bind calls it in its error path, but
doesn't in unbind), and we can make that automatic through a managed
action. Let's remove the requirement to call vc4_gem_destroy.

Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_drv.h | 3 +--
 drivers/gpu/drm/vc4/vc4_gem.c | 9 +++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0bcc541486a9..ab873e27aa0e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -273,11 +273,13 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto dev_put;
 
-	vc4_gem_init(drm);
+	ret = vc4_gem_init(drm);
+	if (ret)
+		goto dev_put;
 
 	ret = component_bind_all(dev, drm);
 	if (ret)
-		goto gem_destroy;
+		goto dev_put;
 
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
@@ -302,8 +304,6 @@ static int vc4_drm_bind(struct device *dev)
 
 unbind_all:
 	component_unbind_all(dev, drm);
-gem_destroy:
-	vc4_gem_destroy(drm);
 dev_put:
 	drm_dev_put(drm);
 	return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3a989e8b39a2..b1a038df00f3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -873,8 +873,7 @@ extern struct platform_driver vc4_dsi_driver;
 extern const struct dma_fence_ops vc4_fence_ops;
 
 /* vc4_gem.c */
-void vc4_gem_init(struct drm_device *dev);
-void vc4_gem_destroy(struct drm_device *dev);
+int vc4_gem_init(struct drm_device *dev);
 int vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
 int vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 9f01ddd5b932..071626ad8551 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1263,8 +1263,8 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-void
-vc4_gem_init(struct drm_device *dev)
+static void vc4_gem_destroy(struct drm_device *dev, void *unused);
+int vc4_gem_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
@@ -1285,10 +1285,11 @@ vc4_gem_init(struct drm_device *dev)
 
 	INIT_LIST_HEAD(&vc4->purgeable.list);
 	mutex_init(&vc4->purgeable.lock);
+
+	return drmm_add_action(dev, vc4_gem_destroy, NULL);
 }
 
-void
-vc4_gem_destroy(struct drm_device *dev)
+static void vc4_gem_destroy(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
