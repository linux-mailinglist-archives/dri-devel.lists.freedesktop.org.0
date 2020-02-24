Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D416A296
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727C6E30E;
	Mon, 24 Feb 2020 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C736E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 6935F646;
 Mon, 24 Feb 2020 04:09:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9mEUX3JTKIXai
 djsl4GaUltJZBx/cUEhlnrgcGdx8Vg=; b=t01965Aw9Ztbh5zRB6jrJ3xQ193Bi
 wDM5jiBYoaquIhcMj0nNtqBpV9Sbw79qc2xcbiQqAzzGEsyu/SUaEgnBdA+kGi/M
 xNjSw8v+40hZQntUNF1hPydKeeZeqzDWJGeUMPn0L18y/A0qElBu08nXvfW9n/q4
 HY6kmXdHWa7RDLoKA+JaZJ0sHOgJB2/F0Ne96lKBN+Hgkgt3vLR8L1gQKOu9LF81
 nP4FLeszt+CJkC0mEuMxcMJmh2zJmLChEjJUZEW0xbB7c0bVOKWWTI8nfjL29Psc
 o2QjsNGcYxr5MIhVHDwfM26ifbF/bDyvvXRiCjaOGE2Pv5q6CtKCog7xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9mEUX3JTKIXaidjsl4GaUltJZBx/cUEhlnrgcGdx8Vg=; b=mtD5L2cS
 0M765OqpAW/w7F6gfzcukcSPyEQpgoWYSLp1Pt0r23SUwufU8fwPPQB1ivrdStv2
 ik+eoWym5a0Fqoh8ryf1qdpLJVCey9fa7Q+LZzZ0Wt0Q6lSR/HmH60EX1yf3YwqU
 YZVUax9weXebRPfA5XNwpDgnLGhn+cstsMICuyvNVumRr58T8+LzZkwsFV0ltmIt
 sVuHbfUK+Tku3CgKLwvXoOdW7zZ1H9jXxvYVriF3zGL38YGxE0tfy/vcktScYscW
 AcMhq1WuVQnYI8Cl8zZj12LoKYXULsMxvmzax6CZfEJSn7deO/7zHaWpGAm0DmLc
 LkSisW7rcnkLaA==
X-ME-Sender: <xms:3ZJTXipeQpt4qy3_XTEfozr-1vxbYqFrpqZC7SJcNftM0Mx759gyoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepfeehnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3ZJTXs_APricRYQGOL6zxIBrb2sf1tZgeFhmsyhTSrncYDxOwP5bIg>
 <xmx:3ZJTXp8bxSOnVgGIqw4AMVjs-HSAnN_xereN5UQCrBGlNOveyysTQQ>
 <xmx:3ZJTXjs85YLXvbIQMSUEH8ae5Y9Byx7VfPKttkO6WZGZ3iRNb-XM4Q>
 <xmx:3pJTXioSmuwETcrB_JlKLecmZ1sGFGP8BFMRazi3N2u66bcvbOqI5YaF0W8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A87B4328005D;
 Mon, 24 Feb 2020 04:09:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 42/89] drm/vc4: plane: Create more planes
Date: Mon, 24 Feb 2020 10:06:44 +0100
Message-Id: <551ec34a673f930262bf5fefe7a5e3616cbb1e7a.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Let's now create more planes that can be affected to all the CRTCs.

vc4 has 3 CRTCs, 1 primary and 1 cursor each, and was having 24 (8
planes per CRTC) overlays.

However, vc5 has 5 CRTCs, so keeping the same logic would put us at 50
planes which is well above the 32 planes limit imposed by DRM.

Using 16 seems like a good tradeoff between staying under 32 and yet
providing enough planes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ea1d848aad14..49278bccdae0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1387,7 +1387,7 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 * modest number of planes to expose, that should hopefully
 	 * still cover any sane usecase.
 	 */
-	for (i = 0; i < 8; i++) {
+	for (i = 0; i < 16; i++) {
 		struct drm_plane *plane =
 			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
