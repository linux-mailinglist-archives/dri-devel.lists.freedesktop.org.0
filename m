Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24885546229
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D2511A381;
	Fri, 10 Jun 2022 09:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCAF11A270
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7ACEE5C012A;
 Fri, 10 Jun 2022 05:29:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853393; x=1654939793; bh=SQ
 0GSv0G6DSuOxO/53ghtsxCkAUsYmEKqfYZaife7Vk=; b=XleGmNt98CL4xEzmL6
 +H/PRwWUJCdbz4RVJnX8/8dbKoWj5wn8VxKkuBrzGWXnvc1QucRkJGqkWfxFTuf/
 rgsgSQenSDAjfUS3Scad1Gb2IEU7i53c2Oh5iN9ihDmUT/TrjaBY7s8q76Z+rd9t
 KzG8rFBLw7NOzBz9zFmMViF8pglpEGlK4ZQBenXaFwP31WA2iF4ku2DAEHdUiX3d
 96xeOrhXvBPpWD0d70frIga/2a4zSwUjXXV1yKijwqvXFB9glR3924qro1l6eXp0
 ZwE0whJkpexGD1XM2qCg4TDYhwQO7qBRUg1leok6+sfppZtfe4DDY8+8nCeFNyob
 mMsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853393; x=1654939793; bh=SQ0GSv0G6DSuO
 xO/53ghtsxCkAUsYmEKqfYZaife7Vk=; b=URP3A4TWrjbmcwrOQwzOUhXmEm0sQ
 5fk6k4+fq/rh41Cm4Ng3R36dXAllxjZlq3rEp+gQCT8Rn7I2WEzcZX5SmvyIeOhD
 tumcyRJVh2SAe2KrF2igq3KVvmJ11/2dGQG51hnagktH3GlL6hijyd/KnFce/cJU
 95MI+IohQLiP3PQBj4B70Vey/J1Iq7g2t+hZx5yqo33XrZt3yKZm2v8VKG/Menzl
 WrOny7WgHlTDiQhucXagG8Sg0uIeHBif3rqmf4/jtC1+CH+ZAu42glprtkChrzIS
 7IeC8uRH2Jkfgqut6iNpo8jwkQSxTArALNjBUEyb7FY9sctoDQwSpZV3w==
X-ME-Sender: <xms:EQ-jYuwX_yg_Z2KWQDr7vNPqnorny1z6ypD0yJwqFIHx03eHB-Tzqw>
 <xme:EQ-jYqRToaHqIpk8L3O2BqUdpUS-0ZavhEdLhQegjO7P2Ei7XO2-aQJyf83TQBreL
 8t3A0JwmkbhC-j6cZg>
X-ME-Received: <xmr:EQ-jYgVNZg0Uh6USc2vPZgLpd50M-3oE0Hmr7kAkM0kBspa7c8zckDrpq1V5hsMjln1myodpPmlLmo60ioalwJiXbJmeHZng2TIQSwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EQ-jYki1QDmGQ2yuQ7mkG7UR3HnBfxZg2sFkQymnkcI0FddMkyg_vQ>
 <xmx:EQ-jYgCkD05K9KKZ3LNn9jEMbPnNMZKSk1cZuKsghhkijCpN0pi3-A>
 <xmx:EQ-jYlJw5_rEx8ahVcODUNKJLRYvuUFaqLLGljYJ_nZncr-sTsBx4g>
 <xmx:EQ-jYj89Q3jM0XnCqRDltvKBHa9_hHBS2wD9flJx15uzmRGqCDoxfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 14/64] drm/vc4: hvs: Remove planes currently allocated before
 taking down
Date: Fri, 10 Jun 2022 11:28:34 +0200
Message-Id: <20220610092924.754942-15-maxime@cerno.tech>
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

When the HVS driver is unbound, a lot of memory allocations in the LBM and
DLIST RAM are still assigned to planes that are still allocated.

Thus, we hit a warning when calling drm_mm_takedown() since the memory pool
is not completely free of allocations.

Let's free all the currently live entries before calling drm_mm_takedown().

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 483053e7b14f..b0906bb96c32 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -834,11 +834,18 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
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

