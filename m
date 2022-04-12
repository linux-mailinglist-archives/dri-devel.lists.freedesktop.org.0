Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D44FCDDA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3489581;
	Tue, 12 Apr 2022 04:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3989286
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 42B863202053;
 Tue, 12 Apr 2022 00:28:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 12 Apr 2022 00:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737698; x=1649824098; bh=se
 q0O/JjDWLm3q7ZpJodrcTjPueq2LdslcJSA34pQRY=; b=NswCqMMABkzxFXUa6a
 RgsTGXItBtqlhJCFUicWr2+ordV/20MFWnj99AHWReG192o6qa6muKnA8UeqxvZQ
 kGigjpmOlkeUmNwjYFCEaUGx7RiiKStfy2V/C3p0adazV4CFdDWsPwJ9Da4gT4tC
 Ez1C+zgfG3jBtn44N3ptCpmIakycpMozhFt4hRWFD98CvZwaLduIEHLW4fxThIUn
 d7PbIW/7jGkODqOQWRqiiQ5Wgmt18UTbOhYcrtDXhogtoZcyUfDd0iJWIfaaSXZn
 b5o9lOu5Hf3OLdhz/PX9wUIfPfZsjGzszCr0dBPdRQMv8Vz22eroGpIFNHKjk/pw
 Pxog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737698; x=1649824098; bh=seq0O/JjDWLm3q7ZpJodrcTjPueq2LdslcJ
 SA34pQRY=; b=V/iTfovQEVmr7B4ZoKhO0AymwIkV0OWSiLrpT4auI10iecL+bl2
 hOFmSdtJoLAa6eaTZXRQIJ62bugwRHEgFhVyv5lu+IAVeb1hnRYZAvoDuQkXPX1w
 c9LYoa0RzIvnTN0LsIbJHezFTn7qTabdMkL+VtE6vo6rD7L1rq/3cE61qm8sjES+
 Gguo6doOvr5J5PXrdHhQ4DK6ifZU3ODufGU3iCG4FJAAhdCUlBYHX83e3Em2Bjjj
 ptqBdIvPMHLx2U91ugzrt3TXDZuo8cXVjgTmVZMvSrWQ0BOY5Yj71/1XouPEXHUU
 zkVPlc5/G8YAzHJoxdPKyusbcCbg+b91g3Q==
X-ME-Sender: <xms:4v9UYptnpIEQjRbU7enWV2vrxFfcGTNU55B6XsYwKlTbjz5tFp4QQg>
 <xme:4v9UYid77xwOtc2FUPM0tmWTAbV-VZJ7OGG2vM9Btb-DuCtbls5ATbMQLjcseQM-r
 8C9pThWE3ZjRwp1ZQ>
X-ME-Received: <xmr:4v9UYszR8MtC6bvK5af9YymSpF9oGnRHrMQ8sKbjdCnebp6I08RF76WsSEoLnbFb80YDdYIiIW-dlcvEjj3496d7Pz37HDYeAS1oEG6JbM6tFjzMrDX3wL6DrXUJi37kdGs_2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:4v9UYgMI-sYsn7mi_JrXpNgKa9LUClrfP-jQO1S9_Lo7UBPkF9kQaw>
 <xmx:4v9UYp_fr5T3-yj5LjgdekbnLqXRIe4VpL-D9bIhZlWMXaxVke4sMA>
 <xmx:4v9UYgWtRdsKbrO9es1Dtd-MNrZdNbbgE1ckIDkVYwyGrrZj7tAptg>
 <xmx:4v9UYgUL5bz3WFGj10Gm9_O3nOOUg4OCUzIZ8AHHYBdYHy66OR9e3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:17 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 03/14] drm/sun4i: Remove obsolete references to PHYS_OFFSET
Date: Mon, 11 Apr 2022 23:27:55 -0500
Message-Id: <20220412042807.47519-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

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

