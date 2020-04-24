Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E331B8008
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7786EB49;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0567489B78
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0EC6D144E;
 Fri, 24 Apr 2020 11:36:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JNjtzlAqDA9+g
 wfnpcyHMYWUnTOc/3kzSZCf4w6U+OU=; b=TPANBAfETOT2h3oOong+BLrk8KY+b
 CnGjzxLnIkIw22U0zKGIo65vT8aT8Tz9SmIZk8uqrXalX/rhC97y9r6Fz+/QFOII
 n/6BugrDOQ4G+7MyfNnkdHaGhjPhwS3gGI27kgld3e80jORHEwmmNTO+T4ZNNUPL
 JVgiA8gaw1Vsr6OlX9dH8IvGGvRFgq3UiU/TinomGrTK++rx1MjY7/EzAl2IdNXb
 9mhv9c0alK9cfRqXfPlecVf4It0XI8OUJL3YZLOUKtHT/mD9elz7hAsyosmfR3Vr
 oPd3dZDUz9ioOB+o1PCB9seiqvfVHoMM+cd9zPDm34AhpgCNTrCx4EvXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JNjtzlAqDA9+gwfnpcyHMYWUnTOc/3kzSZCf4w6U+OU=; b=K2LORPcj
 Lre8C0ysdK2c9Ya5lTwcwUSlYvr/m5ULCYtuQark64ZHQ1MsYe7IntA7gEY5Hs4S
 zI0rutJfvdfFmaC18p6L5OxqAVyk8Qo81aREyVj5ZMK1/f6o/PcrRoWCvNtzUTqd
 5iUJ2eoRyZs0p5EhJ/8PUzqpnZpUaP0H/QyNj5na3Tp60+iDIcIFDC0zElZHgmmA
 QVflBI1OJnAXo22HIxBCRM+tUQaXplAg4mB2y3DuFB6W6gzvObR0tUfC/bthcoML
 2zSikw0se47dSIacjSUWKIv86jKPXaLqWZUKMwJpSqiX7Y2pXVurs8+yq0LSyOT3
 gua+M6FB++HEHQ==
X-ME-Sender: <xms:dgejXir_nbk6kf7mD4TSFkc2bFOW4LgTcRvGsz5rfRYwebGr2P41Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefkeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dgejXr1UWDKtDVJcot0RQoNdxUfQbHuvERKw_8fPiJG2KKBkaG4VLQ>
 <xmx:dgejXmU9EOQGzXB1l4-PKgV-XAGpfSKjybmZeSmLtjVH3m5zEHGLZg>
 <xmx:dgejXiKgxq4kmkH9XCPmKtFq9_jPddKb1zxvF4ndwwzM0wNdvHdW-w>
 <xmx:dgejXjIiqJYNEp5Erv_DFD9clt_MMrtTA86G8LQfSIv0MFptbBC_8_sS4g0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DFD33065DA3;
 Fri, 24 Apr 2020 11:36:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 43/91] drm/vc4: crtc: Rename SoC data structures
Date: Fri, 24 Apr 2020 17:34:24 +0200
Message-Id: <56fcb796f96befc5fe024a50520718a1cc76900c.1587742492.git-series.maxime@cerno.tech>
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

Since we're going to introduce pixelvalve data structures for other SoCs
than the BCM2835, let's rename the structures defined in the code to
make it obvious which SoC we're targeting.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2131164779dd..9fdb0ccc4a28 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1058,7 +1058,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.get_scanout_position = vc4_crtc_get_scanout_position,
 };
 
-static const struct vc4_crtc_data pv0_data = {
+static const struct vc4_crtc_data bcm2835_pv0_data = {
 	.hvs_channel = 0,
 	.debugfs_name = "crtc0_regs",
 	.encoder_types = {
@@ -1067,7 +1067,7 @@ static const struct vc4_crtc_data pv0_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv1_data = {
+static const struct vc4_crtc_data bcm2835_pv1_data = {
 	.hvs_channel = 2,
 	.debugfs_name = "crtc1_regs",
 	.encoder_types = {
@@ -1076,7 +1076,7 @@ static const struct vc4_crtc_data pv1_data = {
 	},
 };
 
-static const struct vc4_crtc_data pv2_data = {
+static const struct vc4_crtc_data bcm2835_pv2_data = {
 	.hvs_channel = 1,
 	.debugfs_name = "crtc2_regs",
 	.encoder_types = {
@@ -1086,9 +1086,9 @@ static const struct vc4_crtc_data pv2_data = {
 };
 
 static const struct of_device_id vc4_crtc_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &pv0_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &pv1_data },
-	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &pv2_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
+	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &bcm2835_pv2_data },
 	{}
 };
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
