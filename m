Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CC1E59B5
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC826E4A2;
	Thu, 28 May 2020 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06B6E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ADCFB5820D5;
 Wed, 27 May 2020 11:51:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Z1BN/HoQLkbcj
 o0BxZGMcqOkT9HeGniShqJTIFpowsA=; b=Vn6gVAYOPjBo0geluN+1b9VLByO+a
 21tmUdrJNaRaoBo+tJD58dq9PAC/OcL2mb+fXEW5W2g74gRV/LOz3kubifhEeK3j
 N2+7jc4sI6KNyaN7Ha/wCrTWmRg90JQIiCwADJGErbFl53Mx6cfqIh3R9Vp0ovod
 LYyjQwJZAugaD9Jg3axUVt6TE0V3iowStrhKpukpcizyEzerfVMOsVP93MMFHlYu
 +mwD2XPZrrtGhJBCK11pyCvELB1YCw9QRdLvIVVXhd+oTZQaDmaAPUc69CaW7bDb
 jtc0cAkL903h50z36fFPhvCAbfc+L6jfPZiGMntIlcj0SQIDHkEE7KJ5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z1BN/HoQLkbcjo0BxZGMcqOkT9HeGniShqJTIFpowsA=; b=GzTjeg0z
 lcKdrimUmYAEOH3DSMKu5ryZqj7EhIG21cPKjtir4MJzfGvdE3fV+6mbLSkvjS/b
 5LopJAVRMPOQhdrwq1XncwHtF6BEqRhU61nlQfzR1bV3cLHrrRx1j+Hcrx97/FZn
 3fV376YbFXRvLrXsIWmpkZEIxv1xQTP7RATw+Nr5aOlOig3/4+plTse+vBEgrDrh
 xPauE1W5L6HljXih7yt7nHmCgCrMvkQQsP9X8uj7TAxb2Ckt7IDM12RXvd4pI4Q+
 J3bit0fIWcUJdW08oTuc8ndWd9OQcqLsNd+/FjPzwzzTL8JBJVvzXVb1PiFeLs6T
 Z78fZFQJDWsd9Q==
X-ME-Sender: <xms:Z4zOXvUM-C6NdnNHBQCJfgDcXrQK0-eYow7Tp0p5kVZql_sJlacgVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z4zOXnm-E4u9cDdkKd40kOkPiBUvKZBUbhn1m97uI9xIG3HHqsSyrg>
 <xmx:Z4zOXrYndXExJIIs0_dXPoVrb9AEMAva0exXLZUNh-59nrE8tYngbA>
 <xmx:Z4zOXqXYOkWwTEHwuWZiTvWgZp6org_4afd-3cTzkVjPz19EA0hVdg>
 <xmx:Z4zOXvXYvRhrOZmjACugr3J51c9J0OaN1RA_KUmZA26XIRzJcbLYeQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C79A30618B7;
 Wed, 27 May 2020 11:51:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 067/105] drm/vc4: crtc: Remove the feed_txp tests
Date: Wed, 27 May 2020 17:48:37 +0200
Message-Id: <f2ede4ea0fa77dec423d9a664059802cb5e19d1f.1590594512.git-series.maxime@cerno.tech>
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

Now that the code in vc4_crtc accessing registers is only meant for the
pixelvalve, it doesn't make sense anymore to test whether we're accessing
the TXP or not and we can safely remove those checks.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d6eca130644d..e15dc1553df9 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -405,19 +405,16 @@ static void require_hvs_enabled(struct drm_device *dev)
 
 static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
 {
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	int ret;
 
-	if (!vc4_state->feed_txp) {
-		CRTC_WRITE(PV_V_CONTROL,
-			   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
-		ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
-		WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
-	}
+	CRTC_WRITE(PV_V_CONTROL,
+		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
+	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
+	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
 	mdelay(20);
 
@@ -488,7 +485,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
@@ -504,10 +500,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder);
 
-	if (!vc4_state->feed_txp) {
-		vc4_crtc_config_pv(crtc);
-		CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
-	}
+	vc4_crtc_config_pv(crtc);
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
 	if (vc4_encoder->pre_crtc_enable)
 		vc4_encoder->pre_crtc_enable(encoder);
@@ -515,9 +509,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
 	 */
-	if (!vc4_state->feed_txp)
-		CRTC_WRITE(PV_V_CONTROL,
-			   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
+	CRTC_WRITE(PV_V_CONTROL,
+		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 
 	if (vc4_encoder->post_crtc_enable)
 		vc4_encoder->post_crtc_enable(encoder);
@@ -596,10 +589,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 static int vc4_enable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-
-	if (vc4_state->feed_txp)
-		return 0;
 
 	CRTC_WRITE(PV_INTEN, PV_INT_VFP_START);
 
@@ -609,10 +598,6 @@ static int vc4_enable_vblank(struct drm_crtc *crtc)
 static void vc4_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-
-	if (vc4_state->feed_txp)
-		return;
 
 	CRTC_WRITE(PV_INTEN, 0);
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
