Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8E48D972
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADCF10E474;
	Thu, 13 Jan 2022 14:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0A110E474
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3919D580801;
 Thu, 13 Jan 2022 09:07:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 13 Jan 2022 09:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=u7zNqovfjnk6W
 OKEOVEvyp++AUoBgBieUPwzYFFGkcA=; b=cMJODy+s7pO0SZ+69RBdpQHrWnVly
 v1dgxWbPECEGVTIgPT+DjSOqZE5gp/ApYcmH0A6YygVaeFlfvQ6rYkMH6UJZiiJw
 icALG8QmEsE4ulyzjAiqMrQHDmgjn1V7wc8FFRN6Xh2hkK82GuMh/WPmqhlw8plM
 50yt8N7oVxCTdrZpg/o61eYWda6bBuaEkRmAli4aYHHVebQxl84nQMMr8EMpv6ze
 lfjrWVox5hL6zpwst1rOwjCSI00BPhtxLZwRSokFyvMSsquXBXISQoUnbeawwZk3
 /3NOZe7m8RYw9sX/ldl6a0qNPAwg0bxmZJoO2q1kF7655nGanrOXKpbBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=u7zNqovfjnk6WOKEOVEvyp++AUoBgBieUPwzYFFGkcA=; b=EddsooHa
 +sJ3rx9cPbVHnGvkdA9oWSof9+YYNfZC8D9qWJAQYlKcW1EhzGtNVNcq8lZLxF2W
 xJf3ci4yeTf4Rlh4oJttXwp8+VnvNSdXAJvntzIhVl0nK53jHX45+AQQmzr8u4wK
 JEL2yzKESdXnHbGqAF6ACr96t5jTntC3RZ791ZINBLs7/shwKCjgW6xwIYV97Pr2
 c4NmQiJcDJGqkBC66joTVskJSP3EqM+ga1WY5bUXx6ou5sKyHa24T3axOuLkv+yt
 yJZW3Oeno3WhL62Q0iStuFWrZlIlt5NIvV5SOOXW3taNWkWT3Bg/IKgmwts1/1rj
 EUwE2AyUfMQZ7A==
X-ME-Sender: <xms:MzLgYQTZ2mLFiyBJCutl1feLER7IwcU-0CZJvPZe1A0IxMNL7_QEOQ>
 <xme:MzLgYdwazoXGkFW93xZL0duiUnYYVilvjKbSu6CA2sudSSSSBJGgGUqPQUKGpMk4U
 5bg4TbdwlsahWX8Ye4>
X-ME-Received: <xmr:MzLgYd1vE6eORVRYgpqyCowmlnjxD0qohS28vq6wpviK91R8tBK6KOwh3di1_VnEJgRRsEgV0npCd9VtvpAxYuQfRZhz0LF2WG5h3c8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MzLgYUCbZqS6IO8ecIQMC9l2D32n7C5yGraipl_X-xJUfKOopEJ3hw>
 <xmx:MzLgYZhebwqEXKOc20kw5y46N1_j1SC59vQFCQhCbTUrZzQsA4ZvPQ>
 <xmx:MzLgYQpzbgUB7CHWjqlODANueD_2vItKVrF1az0OciwyrsBy8_FYiw>
 <xmx:MzLgYebGSvJr7njLl8j6LPPnA1i6BF4qvTU6p76RIPZHpWaQ8vSIwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 10/16] drm/vc4: hdmi: Change CSC callback prototype
Date: Thu, 13 Jan 2022 15:07:14 +0100
Message-Id: <20220113140720.1678907-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support the YUV output, we'll need the atomic state to know
what is the state of the associated property in the CSC setup callback.

Let's change the prototype of that callback to allow us to access it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7fdb49e790f3..d79a70bae7f2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -735,6 +735,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 }
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
@@ -822,6 +823,7 @@ static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 }
 
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
@@ -1144,13 +1146,16 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
 	if (vc4_hdmi->variant->csc_setup)
-		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, conn_state, mode);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4a5536975bf6..2b6aaafc020a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -77,6 +77,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to enable / disable the CSC */
 	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  struct drm_connector_state *state,
 			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
-- 
2.34.1

