Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4049E060
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513F10F020;
	Thu, 27 Jan 2022 11:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33B610F021
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:14:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B93AC5C0139;
 Thu, 27 Jan 2022 06:14:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 06:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=NnBiMlzgWSiHZ7yMEXCszurayQHoFit5/UHR6uK34js=; b=ez1U/
 sh2348fHzmotY6zhRIW1q/rBXb+ELGi+zDpP8P+AkYF93X2YrxIiP04mQCv3lt/O
 +WToECXuCpwchhPbP/wyM3tjPNfd1gjhbDw0I5USzopa/M5JED7QrvBdMQE0qpcx
 rJ6F8izvufzBGr/s1DektH85cfxgu2b7VBvEZLpna8NouGIQu58PKMD8qijqSnGG
 wRjiN+iqrjd0wDkYm66syBsg90jfoDrKAZ995qAU45n3xG0pUcTwbzJ9LpbbKO7y
 l0b2FwDL1tn5IZFZOushef0LcNEpTWOmUwAtOcSynexrDWOFresLvd2q9fVRYZe9
 v7Cy+SEKpqXmE3CNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=NnBiMlzgWSiHZ7yMEXCszurayQHoF
 it5/UHR6uK34js=; b=Wd3B1R4iERrRxMOr28sQtDfT8LH8v7MnqmNOSDWtypKpE
 eKGBMYXYJPAHiDP2SQoDzAzoWdCsRHmYSfGr36O1hENCpZwAyW/5Mqa/FUUxHFpe
 srb2BA0VcE+MVIHFxwheWFytl/SGTzX9duzIpEpFKxnqjon6+8+1luOb0JsDubvv
 E11oVcjBs1tO6xtdfr3w+CY5wipM5fPf4ONmGE0LYjHw594SDr3KVjfKH5JwSVW4
 CKvwkCgmSTW+ccokBOa8v7BHD815ky5Irxi6/RW3mNax2CMOWE6rmN2Uxq+R+E0x
 RttDmnbbiv+Ry00m+Pu+5YRbBBwXjMibOEH3N7hpw==
X-ME-Sender: <xms:gH7yYYQXkEF5AB0tuw0TkEUrQktNdj2CDnTc1MkrPwyyGnuaq_wgCA>
 <xme:gH7yYVy3IM3zoJc6ueipptITIXRW_OS_qITe6gXenQ213o6mKACtUidAI55dUlIvA
 VJ2RSEoylGJihvs0F0>
X-ME-Received: <xmr:gH7yYV0S24M1VQ0PlH9HXgjjsonkfphOqbKV7vZf8LqiwpVLhBEyd9VYsiyhBO0Y6gDH217Z1DsBZyJ86jLSAhY5GdsGGN4KB0eFImc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gH7yYcDLZc__xFIdeJsw0ayDeC8kC5c-bFv9MP3vIgDj3SrnrlGMCQ>
 <xmx:gH7yYRgFqlSwvIF2zRo_5ygS_piO0KvyDsqwl_M1KczA4Ol6PT7KnQ>
 <xmx:gH7yYYpX_s8qZg-kEYfEGuIzXfO4yKmE1KLlk0AIXdSOUcSVN8Nv5w>
 <xmx:gH7yYSVMl5pVUrBuWSu8rtyqFvZPf7sLe5xNIp-QpxQ2pEngSwjlhQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 06:14:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Simplify the connector state retrieval
Date: Thu, 27 Jan 2022 12:14:04 +0100
Message-Id: <20220127111404.221882-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we have the entire DRM state, retrieving the connector state only
requires the drm_connector pointer. Fortunately for us, we have
allocated it as a part of the vc4_hdmi structure, so we can retrieve get
a pointer by simply accessing our field in that structure.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2c83252819e9..efffe21d2e73 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1002,30 +1002,15 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 }
 
-static struct drm_connector_state *
-vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
-				     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state;
-	struct drm_connector *connector;
-	unsigned int i;
-
-	for_each_new_connector_in_state(state, connector, conn_state, i) {
-		if (conn_state->best_encoder == encoder)
-			return conn_state;
-	}
-
-	return NULL;
-}
-
 static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 						struct drm_atomic_state *state)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *conn_state =
-		vc4_hdmi_encoder_get_connector_state(encoder, state);
+		drm_atomic_get_new_connector_state(state, connector);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
 	unsigned long bvb_rate, hsm_rate;
-- 
2.34.1

