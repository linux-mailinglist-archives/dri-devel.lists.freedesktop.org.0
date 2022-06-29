Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8655FFF6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9E14A5FE;
	Wed, 29 Jun 2022 12:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D9C14A538
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D9C6B320094B;
 Wed, 29 Jun 2022 08:36:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506162; x=1656592562; bh=+W
 eFfyLITyCaj88o3xDxP0UgJIp3l83Vz4Hqax36yFQ=; b=LS+MtDwUCbrzH90hzT
 5XDiTrQ7+Ds+CxEawdEDgi1L8S5mSgo9DurWns8tr/KjEIVsBl880XKC5I4NsKcQ
 koH1aWWknN+3Mj0JVl5liDUJshfcSOAJHF5y+T545HE657L7OQakHIbY/5V+eV1+
 ZapxZZjlhA9NRBDR0FNcI2vwx6NKbm/zvbkeyABFwUyo/OZH1Rzy6Wicn6GGpjTq
 9N9zzHV2ozwCOnLlcE+aMEHr81RhR95MUvhT8qIxuz0iafq7/Ps/Cl4PmtDuCuAI
 taR8AdHn1YQTjKBm4lZNW0GceX6b0k0p7i/pjCfGaTCrhAoSrNQbT0NKQtr0AAMQ
 spRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506162; x=1656592562; bh=+WeFfyLITyCaj
 88o3xDxP0UgJIp3l83Vz4Hqax36yFQ=; b=YwLJMDPb1BJ6vLEB+cMYgAbHYZ4U3
 iUPXjKfVHwDB+Unsl5VK8qtrgMPBtfquIYnyDkvcaGc43J3x7vQDSXwlCDoEysNA
 YFChxDOydKffMpUf/Xw5CAXd7RTIIUQpLOl4sDF4SniWURPmCcLuDqWdRVrEb60M
 Ubt51q8oAZECxNtP0J9iGbacdYihH7v8ZoUJubPBjm/yDmSEUs7NOZvVVKhTVMl9
 F0fLtzRzEKPeJYYf8Mi4XSYyZ7HP48ksE2mazZquy9iMgcRSEnNrpDnIe2n4tBWy
 eijrjEMWZvQHiI0eWAxVo0X9PlcCkMQ/7A/bGrB/8jxshHKL4VlltqujQ==
X-ME-Sender: <xms:Mke8Yjyjxutwz7bBWieAPGuShnVE0MYvBhuvVuDBbZu79GlDJz1Sdg>
 <xme:Mke8YrSEgaXUAg2rzmFP4sENZtm6UloRDr-YIjSJn2ZFJ94ZDgOOyb6YQPlCi6G-E
 6ubAB1pJ3GLI5uKd64>
X-ME-Received: <xmr:Mke8YtWQrzpL8XpRJ49W8b4mPHXbj5UsJyBMC1u9-oasqmo9SbO6deDqmBTZDGEnb_HOn2-QO15TSL2VbKYzlr9Sb_qYNEwGWAl-6yI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Mke8Yth0HzgJe39APeKpT0siM11cUY_kvjJLz9Fcw8JkeKv2TPIV-A>
 <xmx:Mke8YlCUwmtJ719rgtIODK2X-r2jjxlzz-aHWnnaYd8gdCwhH3C16A>
 <xmx:Mke8YmKiv01lINjJvsNGNyAl18nuDs1bWEP29E830BGdGUB2d4FQLA>
 <xmx:Mke8Yo5OzBWu0--cRdlTIdOvXA7HJLZ7To-XQDpInklh2I6Yv3emdA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 16/71] drm/vc4: hvs: Remove planes currently allocated
 before taking down
Date: Wed, 29 Jun 2022 14:34:15 +0200
Message-Id: <20220629123510.1915022-17-maxime@cerno.tech>
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
index f2d6e62e7585..a62f222255ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -873,11 +873,18 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
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

