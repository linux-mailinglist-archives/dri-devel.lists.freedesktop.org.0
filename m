Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB30219924
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3206E9E3;
	Thu,  9 Jul 2020 07:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6B6E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B88452F2;
 Wed,  8 Jul 2020 13:42:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NTcrnxvQck9gY
 DiF2BJtKRRo7ypRR9x+FvwIvb6tAhs=; b=fNrfs2R0HC+Zq5JbncInyHuwJqbWD
 nhnOTndwA4f1p3C8jha1BX1JopXgyR1O4/5mMOCYt2pdmKCoeNlYPHgvqRHjxaFL
 xfrWMbbaG4IrJlP8PmoffQisqwJDKoWV94JKsD4XiCRA8cmCcPN/7xCOGvoGks2y
 hNuU8Va71qSo7KWu15c1ACBoHVCdBvx1/Xr3r2BGPTnClwXqATuYhc/tIl7CpZYn
 bRDPzUVnS1uUtTIDHbzEIDrdeuuHXQUr9M/lqcw8mNMtpSR5GqhYZrVuvnZ6FGy0
 Ybq96vSG/So6BOERr9IEPRUS9DvJ0GUBw+mtcy1mkZE9gV0ImfdkBKWig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NTcrnxvQck9gYDiF2BJtKRRo7ypRR9x+FvwIvb6tAhs=; b=ZKOSFTZ3
 PNZut6RCJotCOZLPqkCc87dlqDZBeBVtRb655EK1iLPXsUv1C8Czdm8ydR2r2r26
 +99A9LQ3LTl9NZ/38FISJs37gr1MHbk0nuDVcO9ot6V6dEXqiPcWpWaD72c8Ovvx
 PkzI7ftZWNw65cL8o1Sclbaa93L89shwYd2zJUvuAoPeOtHjaou5HqdiAuD2eYLU
 9S4uRyIT6lz3QcG11vHzlGETDTFG9H48LzdnMZFkmdyQmh1VsmE1XjC/RLt/EapE
 pdi5+JhqE9IKiMlgLUfNwKI0XGXr7zacQuEQtU8xWFgVlYCrCw4KtymMP3Y/c+Y1
 S+1H7HTLUJaT8A==
X-ME-Sender: <xms:oQUGX-7UC2fO6bwqkEZEDOQu2DBQNG2ACmCu7pxdxRorYRfohFPf1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oQUGX36ZtXiSeoKLyHYCOCkJbqR1VinkRkd0VhUyLXSJvyrk4RJhtw>
 <xmx:oQUGX9fmwUgUlVYN5IfYOybFtoQrvuIq-i9KBsr_aTtZYKd_04Xp4w>
 <xmx:oQUGX7LfC7VTtw7GLjZGZm6GlKQt71lJycrqx2Qr81Y_SWzmokYUfA>
 <xmx:oQUGXzp_0ND_SF6_tYw973jPn1t274eUz70nY_7UjQiHMqGv_f-daaht9S8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F16B4328005A;
 Wed,  8 Jul 2020 13:42:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 18/78] drm/vc4: crtc: Add HDMI1 encoder type
Date: Wed,  8 Jul 2020 19:41:26 +0200
Message-Id: <6b2ca2dacd997bdf24a38318d427cfe4d6fbb7e7.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The BCM2711 sports a second HDMI controller, so let's add that second HDMI
encoder type.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5781773aec4b..4126506b3a69 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -427,6 +427,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
 	VC4_ENCODER_TYPE_HDMI0,
+	VC4_ENCODER_TYPE_HDMI1,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
 	VC4_ENCODER_TYPE_DSI1,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
