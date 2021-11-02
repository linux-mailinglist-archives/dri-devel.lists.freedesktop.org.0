Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D852A443123
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE2F72E8A;
	Tue,  2 Nov 2021 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76D672E7C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CBE058073F;
 Tue,  2 Nov 2021 11:00:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 11:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=WPxl8b/6DNiPh
 KdfuCz/ddYih6AGCZWHkJ/ZYNp8wkU=; b=kABoDVdISeS+XD9Gj8RMwXIUDvhRD
 t/ozo0iR7stEeKpD3O/GcDxpQjylTYEn6APff2hTJMZ5q+MJnFd9qBWDnfVeNUde
 hzy79xgPuKOPMzgzrKPnGd92RdyIebl1oUmjntOvENZsNodxR1zuqGqm/Bd2Zi1c
 DAGQeA6cy35GjpzxL3TxfPbnz4abJM7uMaaNzs6BDI2r0jIkYKwySXu6qKsDA2wT
 jQy+0gIJjMUOETZ4Rxy5hYN2TpcF5C73H5ZoEAOQJDt6AshuX9hAzYMju5zupMIH
 1BpggWP93AXDVgfA9fk/PVuQVhur/e6qPBV9ZqjqY6GD/kxC6o4ZIJkng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=WPxl8b/6DNiPhKdfuCz/ddYih6AGCZWHkJ/ZYNp8wkU=; b=aO4bZXJ4
 5dhOwGeXq9UwORV1fVWeg57dSITAly21OsybwO/H1vE8GkkCC+fIbh019j14iXvQ
 aCq6GHSzGcZvVoQNKrJSL5eq+X488NEL6Itlstq3K9UBaRjdvXV91GUacUQUEI9L
 k78bSp4XWGYJ6dQY83eUhh/dfGqsXNpJXM3N8sAvo834uR0vDdm74jKExKIbERzu
 kduJtPMnjkurqemVFK86dObC9aT4Al7D8uGmLeUSQFKeNHNNMtPPMmocJh9+JlSM
 DSFqTg8JrkuGp/fGIXd8TkS4/JXYPuGXY98GkWP97MOgW3MgTkiBcAq23f5j7PZ7
 tIGiJHfauqL5Nw==
X-ME-Sender: <xms:fVKBYTy237lR887TGjoJBjlddggP5sCZBVI9f3ufVYYTPqhehUtHsQ>
 <xme:fVKBYbSbQHEuEnA0hMgdknN6ZIR5ZonQRzYEjzeDS_RFVcgEPpOyoySbDoaQRGGfA
 PLs4nf9S7HO7nJWifU>
X-ME-Received: <xmr:fVKBYdVbtt3exHeCxZuWRthhqJwB98R-hRlTlkEiT0FF4GBFZapupp0at0pkuRFJzQqrlOrTALKyOn6saKh1Sn9gpOORsGj_X8_cZg_V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fVKBYdjjZeBJpMnxkfzJCj8h4LiAZvECkWaslzF07BnemzPrxQipww>
 <xmx:fVKBYVDXea09kHgCzdPNW5OQkY8fFE6LUwqrU5imZ1ZWnH6knk5p1Q>
 <xmx:fVKBYWIp-bLEeJSFyEkRLrjkxfAaw4WGWokoyNPjNiOg921SMPLpwQ>
 <xmx:fVKBYZuqmyBp--r0mcVn4hUy9LEiCnMEq9RaM0txCrqInfUfgOl2DQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/13] drm/vc4: hdmi: Simplify the connector state retrieval
Date: Tue,  2 Nov 2021 15:59:41 +0100
Message-Id: <20211102145944.259181-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
index 4f2f138f93e3..2d7c34b306c9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -996,30 +996,15 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
2.32.0

