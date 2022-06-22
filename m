Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E424554D26
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1D6112B28;
	Wed, 22 Jun 2022 14:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4A112ABB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 54C445C01B4;
 Wed, 22 Jun 2022 10:33:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908382; x=1655994782; bh=o6
 wojDOOXdNMvwGiW/9LHw40yuT8AENJXrQofeEHl4U=; b=k2Xzf13vHXYy5Ya5o0
 1eAezxPYe2UuYLSbq1xDKwtqZGRQxL9AHVjDbP1xAkvxxOeACXUGt7LhSU1fCh0u
 bjSK6KX+XeGJXcz2kJy4/qMef2E04AC1DQb/zFd1l2iozYDt+8ElhZrdVIxef0Up
 CV8LbJVzIrLJausQeAzcwp19WbzTE9IG3zL5+ReAqtvNpep6Wvj13uS7GS7IPiKr
 OnegoJKychQf2Y7AhnvOMIGqzT3cFpuHBuKT243HUltqC+rKfAAOrN3ons/rJBCL
 kJSc4FCaWD2inqxXvBsMBM2XvRdToy7x3u1XE+rjY4mQHpEPP10KQHwpF8CR62Qn
 r6vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908382; x=1655994782; bh=o6wojDOOXdNMv
 wGiW/9LHw40yuT8AENJXrQofeEHl4U=; b=E3lcsLmqefEXR3npUxaw0p0uv4oi1
 JUGIVg6h+bKe6tOF5vF1xE4kAFuiQpc9aYIhRd//xL1K/85yE7fxBU163Ijgfv6C
 jeX1txyaZGRVMWe52ObpjkrAkW4a38DhABii8jniPqbYewQ69VG5dUgsVq0olL/X
 g0yQtwKd1YF1hwO3syq1M7MqI/ah7zwdtEy2wYoluObCh8Y8fsOuxz7nCYmky5Bc
 7hEYo9kEJduXfofdxSZu4FL86a7N4pefnzKZGO/k+6WSiSo2Vfb7pRh7UvKkKhWB
 ArIdTN1JJ9eqwEAESj4BiNduQ7zIQUKVpzIadNCV+rUut4uxJqazv/cTA==
X-ME-Sender: <xms:HiizYq9XuA0Si5NZff_0-zCPVCVuogCwy4svl4DuV9VecbP_UCQIDg>
 <xme:HiizYqurjlUu3KicZ9WSR8gRzHLr5jtBdFZnKjclW_apqK79b7bz-j10tPUSEjh-k
 t9vugioRZhcitdWQLQ>
X-ME-Received: <xmr:HiizYgAS_x7Mv4kQJaPUfidPrkx8zUDwUoAui_b4aPEBLVOlUuP9SpXLCq9veMW2xd_2XKI7eqSp-bVsTypqNt7K4-Qg4n8niXDrZjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HiizYicWqjlBiCosInifgJaye_oaayJwGpvcDfs2-4oiplXV-iomAQ>
 <xmx:HiizYvM8iteOQi9BdNxV2otL8jPXaHYivs2tqbUuxCwpoBF-isqpcA>
 <xmx:HiizYsnhiGMW7dO7NTu9GMfYsMTAxCjasGZ6WhPe2NTkT6NkHH8pKg>
 <xmx:HiizYq1erZWdCJakdS2mSTp03xy9mMTZiEZ8o-mIv24hpiAP9UYN3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 15/68] drm/vc4: hvs: Remove planes currently allocated
 before taking down
Date: Wed, 22 Jun 2022 16:31:16 +0200
Message-Id: <20220622143209.600298-16-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the HVS driver is unbound, a lot of memory allocations in the LBM and
DLIST RAM are still assigned to planes that are still allocated.

Thus, we hit a warning when calling drm_mm_takedown() since the memory pool
is not completely free of allocations.

Let's free all the currently live entries before calling drm_mm_takedown().

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c02243bcb61f..1994136a377e 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -831,11 +831,18 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_mm_node *node, *next;
 
 	if (drm_mm_node_allocated(&vc4->hvs->mitchell_netravali_filter))
 		drm_mm_remove_node(&vc4->hvs->mitchell_netravali_filter);
 
+	drm_mm_for_each_node_safe(node, next, &vc4->hvs->dlist_mm)
+		drm_mm_remove_node(node);
+
 	drm_mm_takedown(&vc4->hvs->dlist_mm);
+
+	drm_mm_for_each_node_safe(node, next, &vc4->hvs->lbm_mm)
+		drm_mm_remove_node(node);
 	drm_mm_takedown(&vc4->hvs->lbm_mm);
 
 	clk_disable_unprepare(hvs->core_clk);
-- 
2.36.1

