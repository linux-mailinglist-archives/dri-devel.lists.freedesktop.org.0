Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C234E65A5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898B210E8C6;
	Thu, 24 Mar 2022 14:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A4E10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:47:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DF94E3200F9C;
 Thu, 24 Mar 2022 10:47:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 10:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=cOYEGaUxjwptj+iN+Mx/jJHi4cRBrU
 /BJIdwHuWq3hc=; b=ajukEUNONUe1qsq5+BnGhchfC0wvYN406f1VwS31WBWzPO
 Naarad6QhD/EMWwTORQj1p2tHj4Ky2p55xymR3FWufdAqA+pTzvG7iLlRN9nBIRA
 Whh/civ5NmZKLOPfRiZSqA4OqKkHy1GIdcD5/72PiRlhxUgOHCmVmVV/Xpff8FWC
 hGU4apMvzhYzjDST20qvHIB4bc60cqrRPMYODQDAK3BWZXqWfhujLfWG/ekRmV9j
 0yYUzEh5IYevTSMTw/ikzrpVSD5WOmNl7tSMZd/vwDwrzxmkKCr+0QePyW0KvtgH
 A+jj3Xx2S6GvpIV8tVxZhjxbUuQn0w3/XWNQ2F3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cOYEGa
 Uxjwptj+iN+Mx/jJHi4cRBrU/BJIdwHuWq3hc=; b=Um0xbMc0P633qx2/fp36fw
 +pkOl0xB/yCwexc8L1x/Txf1hl1VO+yAfTEM9z9Moqeh+Pis6t5cIqfi6xZBjfTV
 hoYpkl4MnbYz8DTzKLB0KWBwjg05p7eJvc/bHEXk1Bv3abVzpqj7EmXF7870D2mW
 ZbupM3zmWWD5XKGGE8WXnlVq8wYPuUgbEO5QIfFtOPeLJQyUW7DUxsK3xGJRHFoD
 oiuM6agaSh5J6mx8qsAPCjtTXB05+IDP3BqmUnkijnzu+wuj+Z/cAPQRHXHPX65b
 3eOMzJcqE4Sj6zqAAprSBlS7GsgS9OvqzPHeUOo9m01jC9mDvz7CSPZk8A7M7aBg
 ==
X-ME-Sender: <xms:i4Q8YhmcymapKRgYf4aRBItrRJb2fF26D4YPXqGSI4wo9bA8dZcraA>
 <xme:i4Q8Ys0IhamUK9_R3nQ7C0p3WGMS-otmeBxlNjEw-rjCz6tmH27peB8HBTjv4XKPn
 _deXC-kFnSNbgILvfU>
X-ME-Received: <xmr:i4Q8YnpF6Y1kikt50Gp7fcC2aD6BWkzzU6-WeVD1Gz1aVIyuiSi-ysXbSnWpWWuKqfQ6BANVkvE6z1oFb1mzqYiUIBkT9zd3j8lExwo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i4Q8YhmdGR6A2daGqxn7hgwpfabOIfPqcZWQt--IuS22igxZeFmjDw>
 <xmx:i4Q8Yv0dXJGw3cx2upKqn2DtjCYICPHLi58S1o2EuXkl6NbBC1FSTw>
 <xmx:i4Q8YguvTDP0EEkp7cAkHEuwnTAZpuFTcwn9mO0yGyPgh33fIvFW4w>
 <xmx:i4Q8YqTby2z8gjideW258yYCBwE4C_Vy7biJ9VLEOhN7_Qi39SBhYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:47:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/vc4: Implement atomic_print_state for HVS channel
 state
Date: Thu, 24 Mar 2022 15:47:24 +0100
Message-Id: <20220324144724.1306133-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324144724.1306133-1-maxime@cerno.tech>
References: <20220324144724.1306133-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS state configuration is useful when debugging what's going on in
the vc4 hardware pipeline. Add an implementation of .atomic_print_state.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 26b771c919b1..bffd81d4bfcf 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -701,9 +701,26 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
 	kfree(hvs_state);
 }
 
+static void vc4_hvs_channels_print_state(struct drm_printer *p,
+					 const struct drm_private_state *state)
+{
+	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
+	unsigned int i;
+
+	drm_printf(p, "HVS State\n");
+	drm_printf(p, "\tCore Clock Rate: %lu\n", hvs_state->core_clock_rate);
+
+	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
+		drm_printf(p, "\tChannel %d\n", i);
+		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
+		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
+	}
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
+	.atomic_print_state = vc4_hvs_channels_print_state,
 };
 
 static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
-- 
2.35.1

