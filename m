Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B4A3BE498
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EBF6E840;
	Wed,  7 Jul 2021 08:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4016E840
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0D0352B0093C;
 Wed,  7 Jul 2021 04:48:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 04:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=77NxfyfOo9DLw
 z8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=CM2SeCXmgbYxRgbBHz4J+K2hKYs2h
 09iuJLNwqBpLP3GgnwZpbLFre18Q1AEla1sTQWjULoxNhw/fXnjqABqMqyKu/fcZ
 6DphAwdcKk3JpuTF13cpWJxs9WbVfBoeSeX/u3azHLt7FAKCs1HEH7gMKufrWkIt
 O/nXPWlLEZtoBe++4vqi5ond8FCeCub6sumcpkWYBQFDVvsuhQIqoYaZGZskx7zi
 72Wmt0F7BY5sk2XT9gzaAjpvegkI0RuQnlk5JfNonnu0rACo5/sLEaSHD6GOggay
 WZssuqsaSl0ozeo67NOGoE1xIKcKeewvfzCuPxzJbfMTWYHfaEXysohdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=77NxfyfOo9DLwz8TAC3B5G9MPinKPBqJ4QlxHLjZkjg=; b=goivKa/z
 R7PwHYs9E6G9cEO+0CVH1KS0/h64vMWgHP1FnCrIlLGOcy631l/71RwZMhFmQ6RG
 s3psS6jEK8ZKU5tTiMjLwJ6UHEetxPqTB6qXj+2SZiB4oORVSIQ/DtFg7nWU/TuV
 8S4fc3wsbtrvaSNgdW4oXzNL4tIHCIdE7aIVI+9vwl9cnfaU/WJC8Nx9u3WbK0bh
 Tc6JDZkjz6n0RklfzcZ00MszlI1QQYgqaq4CIqSLjkda4wLQqX6ISLaYpYyjalis
 KdUboXErd5kXzoHBdAy5Cj2DLz2RGIPwv+v9pVsdSabBDWbpczMP81lHI3vPOYgb
 So/nRjO67e2JcQ==
X-ME-Sender: <xms:RmrlYB46eg71ZTh7Uz4CKYPFeKhuqe5FUQH-k13NKGvE5q8-pjSXCA>
 <xme:RmrlYO7O39mU3Cf1fSkh1st2Dv0j5iEHu57RQ0WoMmc1I4m4fcpo_vABsZ0CYNCCr
 Ot6QceN6STbxa4B6tg>
X-ME-Received: <xmr:RmrlYIdH_fb1T0YrLG11rttCkRKItQEuzmsZNU04G3VcWa8VBg9kr11KEgE0o8Ol-fls9dYeX9v7y2C8A-lMGNQN6OCHg0wG9cln>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RmrlYKIqcv9VnPpp-ZK0srd_DFjR_83By0sOm1kkvzdEGIFRorHkMw>
 <xmx:RmrlYFJ3hVv06QJLz2z6owWRuO0-qfONyWr31EMl2JCJ484UK1WNpw>
 <xmx:RmrlYDwWhn19WjQFSJCiovLS4PuGoyel1l2kD2pPoh1Xyjxw9-i6aQ>
 <xmx:RmrlYHgnZScxbTmkGrL8Au7MrVjwmCDdKp4Z6fENmgkvwxPeoC1bQbc4Gr0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:48:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 04/10] drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
 prototype
Date: Wed,  7 Jul 2021 10:47:39 +0200
Message-Id: <20210707084745.1365390-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_crtc_config_pv() retrieves the encoder again, even though its only
caller, vc4_crtc_atomic_enable(), already did.

Pass the encoder pointer as an argument instead of going through all the
connectors to retrieve it again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 902862a67341..93d2413d0842 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -313,12 +313,11 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
 }
 
-static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
+static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
+			       struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
-							   drm_atomic_get_new_connector_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
@@ -580,7 +579,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder, state);
 
-	vc4_crtc_config_pv(crtc, state);
+	vc4_crtc_config_pv(crtc, encoder, state);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-- 
2.31.1

