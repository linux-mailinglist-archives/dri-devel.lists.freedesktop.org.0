Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0529E5F1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA466E863;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E46E513
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6100580143;
 Wed, 28 Oct 2020 08:41:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zHv8g/0wGKqhI
 RffMNPMMWCiBMbhGrdlj6tIrzrXJ6E=; b=FJ8cSKxDlNFUI6KpsIX76jHZezgM6
 IyQdNK1ncTM7Sf8w/HafpsgNyNv+Sl8kwkvtLX/2JBe66W8AG0rdVXdt58vEFcxX
 6USUTm6sLirWvpfRpvsXSkAyte3DAl3X8qlYM2jXlrdPow00m4UlgvzAn4EbSlTX
 xZkJSafC9arWXKHuYdyD+aRkVDYxDCUaj8cJc+rQ7VMUrqfWXTL245WCquCDiVJf
 ivMAcAN58d8PeaPgeuTfk3+vFbq1nr2eTLru6jOaTMC0tbYP8UeZzcUqUfL4RXW6
 XjLXWvS3zDJGiOYfVmtUxvoXm6M1RcrI9A4Vw1KXaRDQ9GbaWH4buvYGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zHv8g/0wGKqhIRffMNPMMWCiBMbhGrdlj6tIrzrXJ6E=; b=NJ04lXZo
 PDQ01HRaEgy1tKgDzwVm265HS6wXTfE/YUyGE7VlwlxXFy6BfriJwO2kfUYa51VA
 8WYC3XYb3oE2Sscl3cDw3F4ryTi6fRjAxJ+mlIpGE4apJM5s2fzxyYL/sjTsfg5g
 JgsNOQ9z9wfhMUFNsGb9epmReVdziJeMj4m+dCaoQgpoRmzMIkqQgWEKabzYLZRJ
 RgyGJwQTImJDEan6WWNbvIPZCuAkXpDmQadBUwEAEHC+4eMmCnr7d1uOJrIUw8bW
 PikQ9omRjqrbKiarPayfq5e+ATHnh3STVhhdF0ua4BP3cAKQLFpmzzMevgJrm1Uq
 1bfvL/XPEd7a7g==
X-ME-Sender: <xms:52aZX7oyr59RjpSNeW7zG6_vCvCgO3jZQB5bPk80g7PjguYbUBbvdA>
 <xme:52aZX1rRmbxGrMETep--poHWDqp5V3N7t0amPF-fftIq_6tma0_CmtEDTXuhpUWou
 Z1DT6E-Cbd66ls7D40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:52aZX4NX7YGmaC03wnOV3raLv6e2RrwwDcgg0HERA3K9m0-HNFROAQ>
 <xmx:52aZX-5gVRr5notOEkQ2jY0fGYsag2H5wZdNGeQL31GtApGtd15QeA>
 <xmx:52aZX67dG-eu27ku4oM8TN_g5sa3hHynPGxvY6-vhpzDpF7vb1zQKA>
 <xmx:52aZX9reonLGWujmVuinncvs7jDd9qaT2usmrV0CDXMm_tZ8B70t0Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 568003064686;
 Wed, 28 Oct 2020 08:41:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 4/7] drm/vc4: kms: Document the muxing corner cases
Date: Wed, 28 Oct 2020 13:41:01 +0100
Message-Id: <aa88b754887b0a53b33e6a2447a09ff50281fd54.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had a number of muxing corner-cases with specific ways to reproduce
them, so let's document them to make sure they aren't lost and introduce
regressions later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 4aa0577bd055..b0043abec16d 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -612,6 +612,28 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 };
 
 
+/*
+ * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
+ * the TXP (and therefore all the CRTCs found on that platform).
+ *
+ * The naive (and our initial) implementation would just iterate over
+ * all the active CRTCs, try to find a suitable FIFO, and then remove it
+ * from the available FIFOs pool. However, there's a few corner cases
+ * that need to be considered:
+ *
+ * - When running in a dual-display setup (so with two CRTCs involved),
+ *   we can update the state of a single CRTC (for example by changing
+ *   its mode using xrandr under X11) without affecting the other. In
+ *   this case, the other CRTC wouldn't be in the state at all, so we
+ *   need to consider all the running CRTCs in the DRM device to assign
+ *   a FIFO, not just the one in the state.
+ *
+ * - Since we need the pixelvalve to be disabled and enabled back when
+ *   the FIFO is changed, we should keep the FIFO assigned for as long
+ *   as the CRTC is enabled, only considering it free again once that
+ *   CRTC has been disabled. This can be tested by booting X11 on a
+ *   single display, and changing the resolution down and then back up.
+ */
 static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 				      struct drm_atomic_state *state)
 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
