Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D025D1D9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE376EA92;
	Fri,  4 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE906E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 61E0AB18;
 Thu,  3 Sep 2020 04:02:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XYgpM2+C6Ffr8
 9VX+fzprB+BVWrGtQKRxGxoZZAckPk=; b=ltsavqlYBZvTzH1f7fVLT/KAFbm2l
 5jlNBftY1TADBTtPIqUfkS4QhZPG65P2Z/LCLyBoeJrbul3OA6FwHcm2rQwDZbN9
 uTm2hFWNPWjUJikP5DsQmsA16lrQyk2YoqIfU+BlwtEtXJ/NCaIzk1RPfEacGQIG
 SSNtGSvXzgzfHDG8KK67NKJTD/NQp0HFaxjYZ40E0w3BV0GaVsplrlRLjtb3pS9L
 QQXafeUAKZYvSz6J483sbk+tjT6bUIYgu6BMoXOyF00MlMG11KKnYjcJCyduswsv
 bzPYTB9qgvMYn5Y8TZTRVEn/kGmrM/1ttYBtakH1AT0Sfd/EEx/LKLhWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XYgpM2+C6Ffr89VX+fzprB+BVWrGtQKRxGxoZZAckPk=; b=YC5pnwgP
 0iE77UhA/R6OMJCyk3SHcrSfWe+6tUWRTriifx3PEBvslN4agTqRf8uTpx0wpF6+
 cV22NjqH4lmXVS8RglndqAwHunSwS80btsk+f4nYOwcT85IDCTwvFh7YDSANtcsM
 WaeaSgOP1Z4/NZOw6jNvKvdzyOrXlzN3XAY0xE8y44k3At1PorbK1gdqzEgewEkj
 KXiWWGJXDs9Yx62Aa9lENhtNulEStuyTbflK0n7ATM081Hk5Uxo4Dp2x95siANMj
 x38iII10u+4Zccckr64ClxyWWvIaVBP6NJiCHsTry2ikxBSl+q/f0fjNuiA5ZTTU
 XvqRRhbAeboF5w==
X-ME-Sender: <xms:-qJQX18LRZNEQnCDVKfnBrildVnp4KA1xYVp0XR8dvGLNhWlKERTXw>
 <xme:-qJQX5tNJ-KuwnQlKG9BUv7nd15ZB5zyWmlzTMj_phmQpIGP9ghLGF1ffQY-YaIQr
 AVOEFpu6CeHxFs_N30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-qJQXzCluYYCVZaG_J1nK7szgG-djA3KAW4pap5mMD04kml_QkwbLg>
 <xmx:-qJQX5fhl1QY_9Nqs9SfxwjtWz_Ab96ifuX4l9IncCA-lmm8QnI1mQ>
 <xmx:-qJQX6N70J6m8sjiKxuj1iDkJ-0DyyKKrYE6hqppflErFpwDDM7bBA>
 <xmx:-6JQX7nlvyUk0gZMZwgGzRLXQY95h3rLktqY7hERV4eMpflD9mBFrggMc0I>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BF6B328005A;
 Thu,  3 Sep 2020 04:02:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 06/80] drm/vc4: plane: Create more planes
Date: Thu,  3 Sep 2020 10:00:38 +0200
Message-Id: <b41003001541fc2bb23668c699c0369ff7983be8.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
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

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 23916814b4e3..1e38e603f83b 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1384,7 +1384,7 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
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
