Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57001B8039
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E46EB8F;
	Fri, 24 Apr 2020 20:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64198916B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A53A91450;
 Fri, 24 Apr 2020 11:36:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fse909+Uy/SxW
 fg4vh9c6yKXmMtSynUFNN2rQ9mVfiM=; b=hYg3l6fdlAFrgZSWEPIjkWIcnwxha
 Qag9Q+JwYNlM7yuaeHtnZkjWUgobDiHdDkUEDifCesulStvhzgToa2V7xDR8Enhu
 eHpW4umfiDGwfsnkpa8A/T43CgzS1Uya7KSPlFMp9YuradUY8FZOF4rCpCLQ0ag2
 4DiCCkJf2/UwbQzlRt8DstlVP6bA6OIIsp68or4K7o8Ypqdi1/2H7NXgkV8RVt+/
 M/MAMmNMUHydEjCRIN69GOYp9KEFcQjINNfMZlyJxgv+fRXCzvIDAMC6lR2DdcGX
 orm/YIaunefNoCJfaaki7WCouxZ5SdfK7emE6Y5hjSDvPKn6GbfAkCieQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fse909+Uy/SxWfg4vh9c6yKXmMtSynUFNN2rQ9mVfiM=; b=3dbYHeoB
 vE8Rep/MlLNAwsRAjDoVCQieqM6vDGvn0dJIRRkSY7IW6x91Rc3yHESjkQ3uf0MU
 AhbkIQHLzRgaAN2PG8Pum9HPxPw6JW7xMszdecVOyFVdFwhpXprNL4D9hxYZXXkE
 c4NIyLJxZPE475AN5A88ceWCpOgYOsUE7+0CWdS3hyuACrr9lo0qXUU4B//iUva4
 u1OjoU/5lTblc5BbTsJD3+GR6oAXknFvNRiNGseQS3bJGaf3VgIN7B0gty1KF8Ek
 8BuYAaFOwOE1u3rWoNxhBnmVkx2EnnP1PrmAcBrneL06xYcsPRoPpFPYrBZsjm51
 q2eIoyTEaH+0iQ==
X-ME-Sender: <xms:dQejXrnq73nQPyNZoLBmnICCDNsSUX8uT1GXm1tU89F3kW7TJcYjDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefgeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dQejXsMdFZ8tNIdtV4geE6mfEWw6_JKnV6e1eN0VLLmpciUQsqM7WA>
 <xmx:dQejXtrSYBNBw1oYoxWmXk3MjnxdC7DMKm-Kz3RdXlR24lq0VlxAqg>
 <xmx:dQejXnQlbEycIu-6U53_z58JBTO6WH2cy4j4qFK9_0WS0ics_iTiaA>
 <xmx:dQejXgydEpi0GVzKuAAWdKn2qwzECNW4rKUG7luDWnkkQ1RXIzBYGdrCWZk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC519328006A;
 Fri, 24 Apr 2020 11:36:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 42/91] drm/vc4: plane: Create more planes
Date: Fri, 24 Apr 2020 17:34:23 +0200
Message-Id: <3f6e92b101bee5fc8609c41440d9fc81f69a6704.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
index 5335123ae2a0..c190ccc42c51 100644
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
