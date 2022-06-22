Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA4554D45
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9310F3C5;
	Wed, 22 Jun 2022 14:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BCA11264F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B39683200974;
 Wed, 22 Jun 2022 10:34:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908445; x=1655994845; bh=lI
 V/SlW19btf/FLMX8th1tWkF/7blX/huD7AdPQmx/8=; b=c8Gyvj+zO3C00jBse1
 4LMR1QLlqkoQnyyvKtWQWpqUUwJoHEPe85b0lkQ/iuvDlfAcNHSjFXEKKNFQG4Zz
 ImcpDyxPTt1RdQYdIFU6VNEwsGw+vKHxfZnAJvywg+t4S+agBljgre2artxoswW0
 cunzJ4rf70KPgemTVU1fXsaa6qB6CYbXwt7cojvN5boVc/O1WrEhvRuB3xwZ/69M
 7sKwRf5LbVQJHCTWwnJk7zu8DKw5PsQCczHpDhHDGfh4lM9t87+ZOjPdTe4irKXm
 cx/8wqs5PP98MIJhHvy9HTL37Gled2PtVqv3DnoC9vHGcAAdonp1d81957eJyEJh
 PKpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908445; x=1655994845; bh=lIV/SlW19btf/
 FLMX8th1tWkF/7blX/huD7AdPQmx/8=; b=OnJQ4RhkHuujjAnsCLIBJAhHifdLA
 m5QsRmJhVBPU8TgMHSAoksgPiCj9cUh1NRhdIpwC+EfSkjre1td2RNIX706NQkGV
 DaBCu/Rq4vNpjYjIxzMfWNKqpREbtJWlVregd8q6AafrZU03IPieyi53rTDQFErc
 xRoEo6njB18/Jt4IVoffzUq+MIos7DGyXyRac/KNUKWzwfUpvEjXL6hejtSHczX+
 QQ+a4Nl2pnwII8ESephlmS1WkYNscB9E28X5WHje7NSRQJfymB0gvt4fgOIPaS5z
 et5Grn+T0N8artjWkzNzLeZ1s8No5Q2Fgi1SIzEGFsoIR+kO6Mwt0Xf0Q==
X-ME-Sender: <xms:XSizYkeYHXwT16k3LotuyqiLloJzYB7aZ0nCuFfMROU_lhjPr16sMg>
 <xme:XSizYmO806paTd4DerXBylFKlYrOE000vN_5zQwCGjV4wBZl78hg6eQCW5XHX7hfc
 Sxw4mTeFK0i9MaYjwQ>
X-ME-Received: <xmr:XSizYliADHTiuOrtxK-gZsrCmg8e5pwHMRWbCjAd4B8cBTHUjTawkUG-2VPxNGayTa6E487zz8ifacrn429exB5g4n_ydVOqVYR8NrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XSizYp8hpYoY0BpkAC0kFMSLBUpgwmTo4b2J5F5ZNFRrFNVnmVMcAA>
 <xmx:XSizYgvvW4HKtaRRZRc1besknc-sUv0yaC9-B4AcuTEoyJLCw9DB4w>
 <xmx:XSizYgFG8xX6s0t7BrvZFXNF07Anas_9NOYxdKu08hze6fbZO6nq_g>
 <xmx:XSizYiKA7oni5If-LWyTII3SzkVzLFhVlCdEVw1P_QjUghKMfsAhuQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 35/68] drm/vc4: dsi: Switch to devm_pm_runtime_enable
Date: Wed, 22 Jun 2022 16:31:36 +0200
Message-Id: <20220622143209.600298-36-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 86d53d50ad9d..1157bf549633 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1635,6 +1635,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
@@ -1647,8 +1651,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
-	pm_runtime_enable(dev);
-
 	return 0;
 }
 
@@ -1658,8 +1660,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder.base;
 
-	pm_runtime_disable(dev);
-
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
-- 
2.36.1

