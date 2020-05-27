Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176751E5932
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC396E3F4;
	Thu, 28 May 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F686E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3994D582030;
 Wed, 27 May 2020 11:49:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FGHgip5pCgsef
 Z4M/vFInKoncWLsvsxW7FNyZtJgmzk=; b=yYHqLeeTM+s0JuUFx5k0doTF+khCA
 MBjLG0djSmTRIK45cNzxKKflIclQE6lK9L5NNcA88H0nVyTHIoai5+m29VdWEAgd
 g6hj5UJ9w38de+R79XuPs3IZn+WNN7LqXOa26JU/k2k4k24kZuSebm86Lv+u/5WK
 JEk/m2JbhZqETNFE3kE92eWHOn9yBtuLIvLzcN7vC841OC+YonV7mLi9twFEaypn
 E01VW48VExpB7y2jGIBCYbQ3XtC54AnQHFsgKpE7Wu83dHIuH0g09rPzNRFDqByg
 p6NZgR939fYveNWH0Hf1oGv7xhxc0uAIICQkWAtF9Moh3Kqc2CtXDa7qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FGHgip5pCgsefZ4M/vFInKoncWLsvsxW7FNyZtJgmzk=; b=mfCerUHn
 7tbvVA0B/mMWEDtBCMmONK31ovGYj0pCPhq/V/f90eZV4pXjKkDu5YNUgJXk9LNv
 v7GSN62YQRozBV1MSpFAmORDaYMYQi7S96zR5kEs2oBG5Ier51mKpyABx3ps5owa
 R3Zrp0oKg6rpno+5lw5YZ1cPssj3AA9myFwAgC8Yqdj1+mv+DtC70QyLHvJ6FY/Z
 +z12FnHnwuCyVfQ3JWKntM7/Wm4HaRyBeih33MOkUuXBGW5GRhOfMFtZo79Id8WZ
 sawnnhVTBfftSYQ5CeYdEYIFbuxjbbFv/tGInnxhxlRZqu5NPQ/kKeSn8TodwVHv
 3UbL6TACfPg3ng==
X-ME-Sender: <xms:HIzOXqFDH5o-_Qy8DUoOhUpkzTz8P9j95KfAeiNrynV22rLfRajVCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HIzOXrWNdPTSWzoB6wpWZwzQpRfhwEaaZpr-36HBCs5W8-mzwfD4cw>
 <xmx:HIzOXkJMLV2BuiPie6Foecpez46L9naT3InCIKJyLLgeKEBX6eB03A>
 <xmx:HIzOXkEwiCxK8dskKfOYGyBJIe84B28HgYqpdkHuoa182s4s6Xfd8w>
 <xmx:HIzOXjHvIAMGDv5JopO3lQ_WK5jTj3_5trhnXO7YJA1Hgi4tR-iQ4A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3457328005E;
 Wed, 27 May 2020 11:49:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 020/105] drm/vc4: plane: Create overlays for any CRTC
Date: Wed, 27 May 2020 17:47:50 +0200
Message-Id: <74d84c75511974bc1ff4bc044413894a43a907a6.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have everything in place, we can now register all the overlay
planes that can be assigned to all the CRTCs.

This has two side effects:

  - The number of overlay planes is reduced from 24 to 8. This is temporary
    and will be increased again in the next patch.

  - The ID of the various planes is changed again, and we will now have all
    the primary planes, then all the overlay planes and finally the cursor
    planes. This shouldn't cause any issue since the ordering between
    primary, overlay and cursor planes is preserved.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 35 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 824c188980b0..5335123ae2a0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1378,26 +1378,27 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	drm_for_each_crtc(crtc, drm) {
-		/* Set up some arbitrary number of planes.  We're not limited
-		 * by a set number of physical registers, just the space in
-		 * the HVS (16k) and how small an plane can be (28 bytes).
-		 * However, each plane we set up takes up some memory, and
-		 * increases the cost of looping over planes, which atomic
-		 * modesetting does quite a bit.  As a result, we pick a
-		 * modest number of planes to expose, that should hopefully
-		 * still cover any sane usecase.
-		 */
-		for (i = 0; i < 8; i++) {
-			struct drm_plane *plane =
-				vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
+	/* Set up some arbitrary number of planes.  We're not limited
+	 * by a set number of physical registers, just the space in
+	 * the HVS (16k) and how small an plane can be (28 bytes).
+	 * However, each plane we set up takes up some memory, and
+	 * increases the cost of looping over planes, which atomic
+	 * modesetting does quite a bit.  As a result, we pick a
+	 * modest number of planes to expose, that should hopefully
+	 * still cover any sane usecase.
+	 */
+	for (i = 0; i < 8; i++) {
+		struct drm_plane *plane =
+			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
 
-			if (IS_ERR(plane))
-				continue;
+		if (IS_ERR(plane))
+			continue;
 
-			plane->possible_crtcs = drm_crtc_mask(crtc);
-		}
+		plane->possible_crtcs =
+			GENMASK(drm->mode_config.num_crtc - 1, 0);
+	}
 
+	drm_for_each_crtc(crtc, drm) {
 		/* Set up the legacy cursor after overlay initialization,
 		 * since we overlay planes on the CRTC in the order they were
 		 * initialized.
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
