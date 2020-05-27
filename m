Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8531E594E
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE996E497;
	Thu, 28 May 2020 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D76E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C29958207D;
 Wed, 27 May 2020 11:50:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YtBDdhaCMl7iI
 LeZk8zLlw9oJnVrw5gwZNyT00IhFwI=; b=Ii8hx4Un0msqVryK25ujrZnW379fE
 Apu7NPOfyKcpBGuOaK3zzU78LObaxGWye2uPBBN8GujOqI99o0hDodN6/VIDk9/0
 TYd98Qgct6q2bWYdD2ggC/nOg93zWsdfAbGSdJOAb71DNf1d5v0un2XBblvLkiSX
 KJG2GG0YXu9w6q0ZO4oQgtPDoNh1Nc+olJLb35AGIDv/3gHUKYGKDctaRXPXaHw3
 KWgtjt2Htk5TB/jATQxYrLmh72ZcFhLCQkvMsdWx5Eow5W7qLComwXTD/Mp8BZcJ
 eKwjgz9sM5/Ld4LcLBhUhlaNXyGTN/LwgmIcQmn7Q1rD0W0/3sbQzbi0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YtBDdhaCMl7iILeZk8zLlw9oJnVrw5gwZNyT00IhFwI=; b=E8McCqRL
 9g2tLY3fUCt2ClPIBCTvIP7DGGMl95g37Z6Plk2WRXmSbWJPli2O0qvev8icPF6C
 JT19uSZIYLQ0nJNDT1OmxJ9UwyMi5USdMDIVoDoTl3vj4yAoZ3tX7VEGihzsrXO1
 hUMx08qv5H8XpvH8xqRilSwcI2rk0wXO/fHfbg7e9e8Pck0qxrdU/vcIqkZy06AV
 hgHbai38JLx53e+sM1bGTFxHDNp+hB7bwIIFL4ll6U2m5+apnMJYrjspnqtTQWPy
 nBFEf0IUN1QPQKyH/wrqEBuC9OlSeZc717vAcm9WaYP+sgkWfkhgtj2M0LMQNFYY
 OUo0X+1ZBncA9A==
X-ME-Sender: <xms:PYzOXoNDNnKywU1OQlj11iPmFop37iKrbIINz9ozVmn8TaEtPim5Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvddune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PYzOXu-MfICBrl9FRnP00a0CLwpATd5e9F4fNMFqn_BcUBdOP3x76w>
 <xmx:PYzOXvQTW8HlSi_1GrE5txyRlV-IvCnhZutFzEt-4H7eWlcZBeuXgA>
 <xmx:PYzOXgsjiGm1CRhx0N-qMA3Vox7S_T6TbIZfvsBfTSdXv2iAM9jpcQ>
 <xmx:PYzOXuswbwe1Y03ywPRygUXxTkm3rWS3ynO5Nx0kwVHB8MYHC-w2yA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB1F6328005A;
 Wed, 27 May 2020 11:50:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 040/105] drm/vc4: crtc: Turn pixelvalve reset into a
 function
Date: Wed, 27 May 2020 17:48:10 +0200
Message-Id: <2c6a651cac6359cb0244a40d3b7a14e72918f169.1590594512.git-series.maxime@cerno.tech>
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

The driver resets the pixelvalve FIFO in a number of occurences without
always using the same sequence.

Since this will be critical for BCM2711, let's move that sequence to a
function so that we are consistent.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9ec345254808..983ae476c203 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -308,6 +308,15 @@ static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc)
 	return NULL;
 }
 
+static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
+{
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+
+	/* The PV needs to be disabled before it can be flushed */
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
+}
+
 static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
@@ -322,10 +331,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = vc4_crtc->data->pixels_per_clock;
 
-	/* Reset the PV fifo. */
-	CRTC_WRITE(PV_CONTROL, 0);
-	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
-	CRTC_WRITE(PV_CONTROL, 0);
+	vc4_crtc_pixelvalve_reset(crtc);
 
 	CRTC_WRITE(PV_HORZA,
 		   VC4_SET_FIELD((mode->htotal - mode->hsync_end) * pixel_rep / ppc,
@@ -573,9 +579,9 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	require_hvs_enabled(dev);
 
-	/* Reset the PV fifo. */
-	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) |
-		   PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
+	vc4_crtc_pixelvalve_reset(crtc);
+
+	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
 	/* Enable vblank irq handling before crtc is started otherwise
 	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
