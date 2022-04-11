Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911084FB303
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182C10EBA3;
	Mon, 11 Apr 2022 04:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7110EB7E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:41:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 856A932019B4;
 Mon, 11 Apr 2022 00:34:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Apr 2022 00:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649651676; x=1649738076; bh=up
 wHJZq3ilcL1V7e9ZySCks1e8OXo9GLaTCqa/VWglI=; b=cMKxBiYnFNGVEXH555
 dJBeoA6cVb4BFPkeHTy5ENKz/h/PjKItLQ592w57FjD16pSCApgkM/+zOuguvpZZ
 An5AmEDawAxBBQOf5z2UCDHJjYgGtbi49fekV4wNplGzV9B9b/29iTjBh3eAu1zw
 uM+a0NAcKnnDMy4RKg1OdsaKcXym7GyKFHharxpawH76iNPqJdXXUD+6WYA7jCcD
 Q/739ete+jJ3pDf+K4yATnTBGv92n6CEWezVwoCSJN19sO8zZakRt9tz3emTbO1+
 vdDHk1h/gOZ7295fh2ddIKHEqXkRbmH++mSkCTfe/YPQ5qsvfhDGSSBTLSszJtNv
 bZ4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649651676; x=1649738076; bh=upwHJZq3ilcL1V7e9ZySCks1e8OXo9GLaTC
 qa/VWglI=; b=U8KNP18qvy77w5UYdrFh8NTfBE4YuB/nAQfTySlEYICaB93eo/f
 h5MOpBStwBRzEznaYuteTVzgiwkJWrUTeWfE1uW1mM08WWrIGunJ/XetCUXyBJTu
 0MIQpvH1yDifCJ/zL4iaxRAxrcNAhmFGby6J2n5e00dS9tf6pmvt33sgTxnn1Mp3
 SEqO+ywCNwjGFqfmfQnECWoqMg+dCO8guPPe8cm15sRvhCXHl5NjTbMtmi3QNkD0
 1dl4ttHXh77FMYxqXzELQ6C1PXLgNNgYnchIxN1vZqrwPylpOdtESZHwEemQfzbB
 zvHFrFHKnaOdisIGgjzH3VwjmPwCs8dF1Yw==
X-ME-Sender: <xms:3K9TYg161CD_SoIe_wS9CTXHZRTpxgl0yOMzH6U1kp13DNsgPA3E5g>
 <xme:3K9TYrHBEfJpWKF04zRLOoL9HCQ7V_aD2QP812y5QtT5W2VgRWwZL5VYn8A_bzMEI
 NsFvpygVy3eq374QQ>
X-ME-Received: <xmr:3K9TYo7WIAprOgJnODmpQnzzb0jZ8ZRcvxC3KPYC1vQJLaZGJab7B2SbQCe_MGBcZp4aOSodg3oELutN0X_kCOmgjQxK_j2fqnm-OIiWG8oTQ5obVscb5mOHiMYteWwrjZ-lVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:3K9TYp1aigR6hq-YI7Eidh_Tq4Nx731Bpr_2kr2_XpOt0Xq97CXnjQ>
 <xmx:3K9TYjFnUSeFV5jZn_tefXYV92EhSmQ_OD-ypawI621dAfAPJNN0Cw>
 <xmx:3K9TYi-ScQD-ccdf3Wxout6TVtiJH9f6XFqdVsSDZ1K12Qnmr7oKxQ>
 <xmx:3K9TYq-O3Bv6V02WmY2EBuvncNc5BaGIe5U2K8hbJqn5ODweNIctfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:34:35 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 03/10] drm/sun4i: Remove obsolete references to PHYS_OFFSET
Date: Sun, 10 Apr 2022 23:34:15 -0500
Message-Id: <20220411043423.37333-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411043423.37333-1-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a
central place") added a platform device notifier that sets the DMA
offset for all of the display engine frontend and backend devices.

The code applying the offset to DMA buffer physical addresses was then
removed from the backend driver in commit 756668ba682e ("drm/sun4i:
backend: Remove the MBUS quirks"), but the code subtracting PHYS_OFFSET
was left in the frontend driver.

As a result, the offset was applied twice in the frontend driver. This
likely went unnoticed because it only affects specific configurations
(scaling or certain pixel formats) where the frontend is used, on boards
with both one of these older SoCs and more than 1 GB of DRAM.

In addition, the references to PHYS_OFFSET prevent compiling the driver
on architectures where PHYS_OFFSET is not defined.

Fixes: b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central place")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun4i_frontend.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 56ae38389db0..462fae73eae9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -222,13 +222,11 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 
 	/* Set the physical address of the buffer in memory */
 	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
-	paddr -= PHYS_OFFSET;
 	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
 
 	if (fb->format->num_planes > 1) {
 		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 2 : 1);
-		paddr -= PHYS_OFFSET;
 		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR1_REG,
 			     paddr);
@@ -236,7 +234,6 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 
 	if (fb->format->num_planes > 2) {
 		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 1 : 2);
-		paddr -= PHYS_OFFSET;
 		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR2_REG,
 			     paddr);
-- 
2.35.1

