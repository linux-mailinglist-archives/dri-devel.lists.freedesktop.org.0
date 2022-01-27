Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A649E32F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D640810EABD;
	Thu, 27 Jan 2022 13:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7A710E4B8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:18:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 39CC35C01D5;
 Thu, 27 Jan 2022 08:18:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 27 Jan 2022 08:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=gWXURCbpMKITqJQmY5KtgJAjE/ozaGwvMBdjl0uJYM0=; b=eSV/O
 mWJKdKLhYC7BKfXhFxs3CMJ8wZCjk63Yrd/2djvhcmFpP/QJUlQ3Uh3r9WhuNKVF
 DtwRrkExmcmBBoLSM13AR/IlugGN9nNX8sCfS5F6g5l14y+Q7AOasy45OUUU3bny
 l82r5/e/w9toKIBXUdTIETIEE5FEfA7gSkY2X+Kd13nMXiLZ30crkFE6kiZnZaMh
 0hz0VXPlH284Ma9zqHr6V5EI23w/TfsDmnmTyHSE5y7clpmoMl4z3JlT8J+iETyy
 fpxTo0JQhsOy8I1jZmK/5k2vl9S57Ws00wBfhl3mfOBcyxDZPGdsRCq775KUWrBD
 bzyTdh/48XBBVZeDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=gWXURCbpMKITqJQmY5KtgJAjE/oza
 GwvMBdjl0uJYM0=; b=WTSrphaS+EzzzCWUfdRHLFWPokWWVnALpbliis4XJI5UP
 MuNS0Bf+ZIWYtz1HhX2uA87SoO80ruktGUkNd8QIZ8RhuexZ25NljLm7vzNtUmlM
 i8QY/YS3grl7gqew967gAY0iHZ+/sGAZEIll1NIxlkiqPmhebaaPorfdfBWchqXC
 zjOzREZ5YA2R8DnJjCjj3o4vrDLGY47cRYLahCVmdkRI+bcTr38QHESWSphv0SGy
 iNgnzeC7d/1aUuNGGQWyFaDRgp5qU9amxdSGU7nnsoPso3+HIAoVKV9rOa+2GEGs
 4ifGuKl1O8UVx6EDp/rVQghmmIdd0fYOpSipNObJw==
X-ME-Sender: <xms:iJvyYZk4d7Z587VqZmfKq8HvLpDCCOLnGp7erg_GlvugkXqiJtT-QA>
 <xme:iJvyYU2rnvCSpqeKdlt93yL7g9BGP7V6Fbz-EfvOXwhXwpUk36IvIB-OOo0ic11s7
 hH3M8ZLYh0teK8-ICU>
X-ME-Received: <xmr:iJvyYfp10qms1LaESCW4zkTkSaqxHvzxMW6y7oNs4GtcQAfioLNSOdNqIbGo_xpHfI7qJto7IXpdUr9Bfoknp3S18Onhj9tpTpnIauU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iJvyYZlD9jedxFRLTrFF0Y9KbM0_HFLPOKvZex2WunToleveodSgjw>
 <xmx:iJvyYX0C5k8zwBhGFSMMb2SqLuTaJkMnleeJ8J0CwxmGEtyLCNUZfA>
 <xmx:iJvyYYv5Td1YkIumXAUDCVwC8do1uCRyAJDQvrjQ9OB46MQKkoUgYA>
 <xmx:iZvyYQLRUjDUqMMHDHaFx2R05cN4qP3f7a8twBeSvKQWGnqabYgWaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 08:17:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Ensure we don't use 2711 HPD registers on Pi0-3
Date: Thu, 27 Jan 2022 14:17:54 +0100
Message-Id: <20220127131754.236074-1-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The existing logic was flawed in that it could try reading the
2711 specific registers for HPD on a CM1/3 where the HPD GPIO
hadn't been defined in DT.

Ensure we don't do the 2711 register read on invalid hardware,
and then

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 ++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e3121eb5f605..33ecfa1e3661 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -205,14 +205,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
 			connected = true;
 	} else {
-		unsigned long flags;
-		u32 hotplug;
-
-		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
-		hotplug = HDMI_READ(HDMI_HOTPLUG);
-		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
-
-		if (hotplug & VC4_HDMI_HOTPLUG_CONNECTED)
+		if (vc4_hdmi->variant->hp_detect &&
+		    vc4_hdmi->variant->hp_detect(vc4_hdmi))
 			connected = true;
 	}
 
@@ -1367,6 +1361,18 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 	return channel_map;
 }
 
+static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
+{
+	unsigned long flags;
+	u32 hotplug;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+	hotplug = HDMI_READ(HDMI_HOTPLUG);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	return !!(hotplug & VC4_HDMI_HOTPLUG_CONNECTED);
+}
+
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 					 unsigned int samplerate)
@@ -2747,6 +2753,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
 	.supports_hdr		= true,
+	.hp_detect		= vc5_hdmi_hp_detect,
 };
 
 static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
@@ -2775,6 +2782,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.phy_rng_disable	= vc5_hdmi_phy_rng_disable,
 	.channel_map		= vc5_hdmi_channel_map,
 	.supports_hdr		= true,
+	.hp_detect		= vc5_hdmi_hp_detect,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..933a468e10f3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -103,6 +103,9 @@ struct vc4_hdmi_variant {
 
 	/* Enables HDR metadata */
 	bool supports_hdr;
+
+	/* Callback for hardware specific hotplug detect */
+	bool (*hp_detect)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
-- 
2.34.1

