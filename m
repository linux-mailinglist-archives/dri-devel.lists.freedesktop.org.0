Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224521991A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158326E9D9;
	Thu,  9 Jul 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732396E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7CEE1102D;
 Wed,  8 Jul 2020 13:44:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1mEX+3++0BewV
 JPrut0JzEcRQwhjaEVpe1Cyf0r7/ro=; b=cNb0scoyYyNACCyd9DH6nq4YpK1td
 AaLkYyXpdgNbV1f5WteZy/buxOsf7Zfxnqa+5q8msRKhbvUrr1YFA6fGPavJ918O
 k2J6r5b80VmJNax9fRmjKW6S0Js3U96INLwL9BgnGmOEGmHf3x+RrWimfrkv6QTg
 wn1fnUfcJpiQi4YGR0MBsBppHh3iFMy6vj3BZWqLBLorVuK1KJDUh+/qSdZfZ9Jp
 rqKEBpw8GHKKCq64F1LdsqnuyK4rBkG2jN672QVc4FidrZTdGS3nrxruETYJuU1I
 WR6olJ3F9E58/gdLXgnEJ6cqeEuMSp3N3092fdoEYTkhEcIcSmkvFP4nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1mEX+3++0BewVJPrut0JzEcRQwhjaEVpe1Cyf0r7/ro=; b=fGlsB1WP
 B0TKVh0GpmRgREEj7HFfH00RpKvJt97hmeqxTlC4M5u/mkMGe1OSKTPWWiDoor5v
 tLyDoF7OfAn3s+OmuhetjxRqvDnD5uvEwgoviAEQImV59p/oOsKzKeh71kX4FsTe
 4xjI87dvy5YouBTAae20tIONy/2d11vGIa4cZHgZIChfYVbhenntw+u5u2Y5p5ta
 H9a/EjDEhF2iKyM8BK78zFyti44pBPE0N4vabUA1DBwcTQfOsxdJnCMRnfooyluY
 DiUjHxmXFPlqKvsWGzuJ5Cwhe3Bg+kHDSW8mqtlPqg3Zs2DdsfrPJdoSVrNSeD1u
 iB+hgRaLyhWYmA==
X-ME-Sender: <xms:7gUGX-yq5tC_6HORJVgu3QHMd8J0AjJ1ZJlxM8typDLLmlw6Nmq2kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7gUGX6TqTLEoMRhuzu2hdWNAMoyH9nXLi5TUkMmL1ehvPzsxYBiv7Q>
 <xmx:7gUGXwWYHxfkq2OkQWIzgxYGQ1CIPdFV006h52c16rqe7Vr8QkNV6g>
 <xmx:7gUGX0ikh_rT4IoHsU00EHqETkEN5u2o0QrUrLBiHWK7ktjW1mpn7A>
 <xmx:7wUGX-BlFmN4NW8Href5Hca4NiMftQOKIRh1E70-i2rtA-HxoPvif8gfB50>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE6B0328005D;
 Wed,  8 Jul 2020 13:44:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 72/78] drm/vc4: hdmi: Do the VID_CTL configuration at once
Date: Wed,  8 Jul 2020 19:42:20 +0200
Message-Id: <06921938439fdf7da952fb8d148932fc9403f82a.1594230107.git-series.maxime@cerno.tech>
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

The VID_CTL setup is done in several places in the driver even though it's
not really required. Let's simplify it a bit to do the configuration in one
go.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bbe521ab000b..f56a718a3643 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -428,10 +428,6 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
-
-	HDMI_WRITE(HDMI_VID_CTL,
-		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 }
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
@@ -520,8 +516,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
 
-	HDMI_WRITE(HDMI_VID_CTL, 0);
-
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 		   VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
@@ -555,15 +549,19 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
 
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
 {
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
+	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	int ret;
 
 	HDMI_WRITE(HDMI_VID_CTL,
-		   HDMI_READ(HDMI_VID_CTL) |
 		   VC4_HD_VID_CTL_ENABLE |
 		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
-		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET);
+		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
+		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
+		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
 	if (vc4_encoder->hdmi_monitor) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
