Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D657090B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39439902FC;
	Mon, 11 Jul 2022 17:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C125A902F9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2036C5C015E;
 Mon, 11 Jul 2022 13:40:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561211; x=1657647611; bh=hm
 6271RTN8xsRIYP7cmZXIatnDes90SwSdCjM9cSQf4=; b=uOx9R2JfnXgzkn5vU0
 /cWtafzTwr7Cz942fHWE2XYUnHu7EYFb+QP0/5wLI+Hidt/S9RkyGDY4BvRIM1A3
 T9IPb5jh7IwGyKfEKFvAOb6DxvwqOKWx0iqEOlLqe4kpEwbxsNkHPRxdOTdAoseK
 FwYWShy2706ePIJbP4qhhucoL2SFHn8LfLgcSmixwzZBoXmWzUFp4LXj0ro4DfiE
 KfB8eIqFx4f9A3fsJ/N2msLVfaCs5JE2m9V0y+H+ClISzj9FBqqemVRpWeRtgJJF
 ryjM+xOrkydsmktcuSJbQ2CgAx/MO8nOuppMh5uBL8hCBGrVUZBHy80PuNFLXRAX
 Ocmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561211; x=1657647611; bh=hm6271RTN8xsR
 IYP7cmZXIatnDes90SwSdCjM9cSQf4=; b=k/4pyBXf0e7KZhBmVvuuT/SUkI9aX
 JEkXi8xaE/OFvqFM3KbXaugE3f3HqCNq0rjxasQ3zoki/7895y8PY3gWvd8/4PR1
 ggPjAgpzuE6pno7WhxJifbDH+74uSy37K99GTd4+f+mUGFTAAviEfI/ND5yITIyC
 TaDUf44eI9lyATczCXr7W9g03Tay2mUapcZJVdMF/i+i4Xb078h2XCTXQTUR3oUO
 kXiFD8TFpf2uk6fwvoCge/3nA9v982QwBVpV10MDPcj/A/XoUewGdbKMK2/7+m9y
 fcvrTtg/PHkb/ODOMjrmd1gAzALoqnybfOvpKtuID67D8vCidgMYAvufA==
X-ME-Sender: <xms:emDMYmIuqxsyvh0N29BJAafn9CvVVK2zLFQ3fVeSUfF8GYWCFVNl1A>
 <xme:emDMYuLn3JlmoXQMXFK2rNOFat5y2STGIcx_YFEfAUCLLioL3bjZREGThAIIUegMR
 -V1KolDnlqo0zi1jY8>
X-ME-Received: <xmr:emDMYmsfHLPmZ4ZOKK8WjEWnmQPmyEuYdduwfo1pgftAS5UuKsGisdmMjR-pvEh-mnjyIQAY4Xugm2qDq3kkaxsxz78Ki2U5bXnAXZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:e2DMYrbuuowrbk3gpcfZ5HLhybQ3Rre--i6u3ptyY-94KI4HyaDLuw>
 <xmx:e2DMYtbrGv6iNBF9FxdfL2GWAUst6wcLD4VBMIhsQQmAkuPPrQQ1_A>
 <xmx:e2DMYnBKh9-8aRDx6YtUMW_YXjSNl7wRFLleMHWqqKGrfdNloHKW5w>
 <xmx:e2DMYgwCI9NiblqQ2xePf2gcX57pFCK6tuNYRwGDKp92EY9Mf4p2xQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 16/69] drm/vc4: hvs: Remove planes currently allocated
 before taking down
Date: Mon, 11 Jul 2022 19:38:46 +0200
Message-Id: <20220711173939.1132294-17-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the HVS driver is unbound, a lot of memory allocations in the LBM and
DLIST RAM are still assigned to planes that are still allocated.

Thus, we hit a warning when calling drm_mm_takedown() since the memory pool
is not completely free of allocations.

Let's free all the currently live entries before calling drm_mm_takedown().

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

