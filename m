Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F1219936
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592D6E9F1;
	Thu,  9 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D81389D39
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 961A42F3;
 Wed,  8 Jul 2020 13:43:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jJT96cjpMrUPT
 3TFSL/kjJG0/8Nm5zA7+4C4i7Lqp1U=; b=DdfiOfLRT7fOKWuI/VZLvUxYdHO0y
 e4hsY+QFRsSYXhxGOXNYun6Ex9bfQo9rcutLONLsL/0wO6OCZN94FOVu752Ypu6s
 2a7lj5wBmtIOG+ftnZlSIMQuyuPut9yEKx0STPGKtczMBQ/BuNmy4Yo7HFdUFedO
 OYu1PttRVh+Hjyy02JYHC16Q3+mQ90M8dYurCKSQ0+Jt7Fi1fHAuCmTfhpB1nzVm
 /x3QpmwKvpif9BmYaEGJvWNdDf56A6Dxok7ngOL/I3gjsejqHAcaIFha9dFgIdqu
 SXPCeFCiv2hEPXOD+4DbCuAfmmYtSeNLiJ/Yz62fUvkDHE9++0TweTNFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jJT96cjpMrUPT3TFSL/kjJG0/8Nm5zA7+4C4i7Lqp1U=; b=cQZFaeSJ
 vsrNQIEQqHGyRufLzsexbqk4gS6trivlx2BTPTyf+bh0jeiDD4PPh6Tg91oqS+fp
 yRV0lBxTj05S+jjFMahSw6Rf8N6veoBV0dYcde7YVJ/VrWP8SYae7LZHrnaTqprN
 yNcPdjYcv+EA4gwELxDd3DFQoCLaof7HsQGeHTIg6iHJpZHlqF7MJndfc/Ogescr
 b1JNt8cttrbZkYmQeBR6ZTw6tcEPHSx+pQPd3wlEQtuSdMk3BGBUigfb4XFPITBN
 LaYst+44RRE+j3lk0lYxc4j+dL/mnEMVAcSrEDRnwH2SglE3G1w/QKrdv7zzuAED
 ckLCGpyh27dXzg==
X-ME-Sender: <xms:uAUGXyv7tlqVpMkvxNccd2wQmbBlLcX953aMalC0URl7d7oodZtAIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uAUGX3evKyOXr4aI_1ZVH6BoLb_nGehAPg_BKsLKE2mO36J7Yb6wzQ>
 <xmx:uAUGX9z3UiTEdrc4wQuyXRWz41lATgIzed_7jJZ5uWE43_FsuH9OdA>
 <xmx:uAUGX9Octo0QKkAqP_GP3m6dyPYIwnPO1dzrswKIL4ITb9xFjPLhOg>
 <xmx:uAUGX3MFzFkmxKOm52_KH0hbJIOSDXUgw8ptuCEa3sv2vKEn7sMfRXUCmy4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFAB7328005D;
 Wed,  8 Jul 2020 13:43:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 34/78] drm/vc4: crtc: Move the CRTC disable out
Date: Wed,  8 Jul 2020 19:41:42 +0200
Message-Id: <ce5012281c97560e9d41b6f146f7e0b764a60e76.1594230107.git-series.maxime@cerno.tech>
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

We'll need to reuse the part that disables the HVS and PixelValve during
boot too, so let's create a separate function.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 25a77cd46b28..69851e19e2ab 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -384,20 +384,14 @@ static void require_hvs_enabled(struct drm_device *dev)
 		     SCALER_DISPCTRL_ENABLE);
 }
 
-static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
-				    struct drm_crtc_state *old_state)
+static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
 	int ret;
 
-	require_hvs_enabled(dev);
-
-	/* Disable vblank irq handling before crtc is disabled. */
-	drm_crtc_vblank_off(crtc);
-
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
@@ -405,15 +399,31 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	mdelay(20);
 
-	if (vc4_encoder->post_crtc_disable)
+	if (vc4_encoder && vc4_encoder->post_crtc_disable)
 		vc4_encoder->post_crtc_disable(encoder);
 
 	vc4_crtc_pixelvalve_reset(crtc);
-	vc4_hvs_atomic_disable(crtc, old_state);
+	vc4_hvs_stop_channel(dev, channel);
 
-	if (vc4_encoder->post_crtc_powerdown)
+	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
 		vc4_encoder->post_crtc_powerdown(encoder);
 
+	return 0;
+}
+
+static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_state)
+{
+	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
+	struct drm_device *dev = crtc->dev;
+
+	require_hvs_enabled(dev);
+
+	/* Disable vblank irq handling before crtc is disabled. */
+	drm_crtc_vblank_off(crtc);
+
+	vc4_crtc_disable(crtc, old_vc4_state->assigned_channel);
+
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
 	 * someone was waiting it.
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
