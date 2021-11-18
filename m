Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CA545593B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE476EA41;
	Thu, 18 Nov 2021 10:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9576EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 671DF580912;
 Thu, 18 Nov 2021 05:38:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 18 Nov 2021 05:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dtP9AtLi8RMqE
 W4MHzzkGHok2CKm2FsAj8GLDbtJ0+I=; b=GOpckAWGIN+J+tZof8HiXS7NK1GwZ
 Bevqcql1MTqNOPdSJpvFs+XUPhTtZJNHKAZWf1A9wPKqeo8s1VIKSl40SisuRT54
 uMxoZs3HJ9DhwQLFerQ0XjbD8RUF+FZ3/S5sF5tr9Lw9iScVJwQTGE3FKupoNUok
 defUHCZZq9AKe/lRhb0Bz64a0RliPdUU4iVq2tJnjAQx0g8c7PLA6ej/ghjFBXEA
 +AyjaSuyp8XrX0HcsbE/RdaZ3wRFLHb5za5YAH8djHTvZvpL8Cwg35scAdsm7mHC
 9JoQPUxchTlpeZRxqT2lcvWaXo6fmzZae7tccWXbt2na/QVwk6jSy9Icw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=dtP9AtLi8RMqEW4MHzzkGHok2CKm2FsAj8GLDbtJ0+I=; b=d5WyIF9e
 MLqNk2evZQuJTFzyZ0ht5e25DW5RZZf84RfjngHljV3w6F2fwqn3gc2qtcgzeJVJ
 XK+ShUkEVJmCd0ttmJdWBKdRuXHovt0Xc7h/0z0vJNhnVwYw8quGzneQRcA2L703
 t08auHCWnqildpVs6kS6v6dmlhf0WTo7zCuK110wI/jcgRHQNlTASnecl/YNp/BT
 pMfh2dknbABW173HJEjFG9oyCf2ODR9YIL3BRKvDGrhBJ1LDygD4Coi2rvJRI95c
 pNV1YOpyBjTx28cmoMKx42aNpA2RYqXLnfRqIzjxseGEOLRKy8KY32at7l48wmyW
 3bedTICrX+pPSA==
X-ME-Sender: <xms:Ly2WYcW2xq6WYTU__bSiD8zV0S_oYweOPGzvvmWRb6zqOypDgHf_eQ>
 <xme:Ly2WYQnsYo7cWe763Mot1ZCOP4REnNGuXaEYSs3piYcAZBQMRXHKP0bkUs7rx1Iq-
 GC-8_OXAF2fCoI977k>
X-ME-Received: <xmr:Ly2WYQbu2t3-JYv9HeHouN0IIRsV8w5VzNtiDFyvWu6R4mNkyq5JKBsLKyR-1Z35rbSo2idNCy8_8PuyWP9GY7gfIKT0W_qhBY_h_K5V6eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ly2WYbUofA7VlDbZhfE-X_hiKbrchUeqUtNFawi-JyHB-37zi-7QEw>
 <xmx:Ly2WYWm3j3B4QmMvmkT_njX_dMzpE-NUlgqwknRPEQW-vF0R8wr-kw>
 <xmx:Ly2WYQcKrK8Pqp83icfGMGYOa-EBUupsN6xhXkUAKyHGwf3L2OXQrg>
 <xmx:Ly2WYbjg8BRTAU8-hlPgj2ovKgo9r1-TfzOw0Arab3yL_2gVif5T8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/13] drm/vc4: hdmi: Simplify the connector state retrieval
Date: Thu, 18 Nov 2021 11:38:11 +0100
Message-Id: <20211118103814.524670-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
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
index 7f44ef08f83a..db647c01dc0a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1013,30 +1013,15 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
 	unsigned long bvb_rate, hsm_rate;
-- 
2.33.1

