Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6B2D2616
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2A96E988;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B025F6E896
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2CC43580235;
 Mon,  7 Dec 2020 10:57:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 10:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sRercRhvCRkFB
 sThJJqbNnhdLNJtjtkAGX9JsQ3eCrE=; b=pNLvOExvK9u1YGPXR/oD9s4Nhevpc
 gO5GDoP/1cWtDx5JJKB50DbEHggpWhOUZJKVA3cSW5mTvMkzONoWxSxE4cuLlni3
 VxdxEwXemoqBn4Wr4rPPmWxnW4+5kw92Tjv1TcNX/xg9MxhYEfaBAeRdAyjwU52m
 kEDInaTARkZ+P3b5QesptQ4UbkZ4f8q17Vh6BUF9dPxhbziobrqQoKXqLqXH6sNS
 oyisMrBgCObv7bn993L3T+8bRyLtMGN0uleLgaGP0NPwjMhu9TsInQI43Nbvw1Fq
 UoK3CEWmIvKGOgqUyLE9bz6H3zBVXjFyttSZSdQjJ3w3ptuUY8055F5YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sRercRhvCRkFBsThJJqbNnhdLNJtjtkAGX9JsQ3eCrE=; b=DYshV/Cm
 0+lSmY3mF0Mqawqpc/4kLZcHwcqU9c0um+xMyVCb9uNgkqO1lV7wzb0HVtKeFamp
 rdjVVtE4ZUayRpqCBN8ikWPmGJhAXYFPwgjNKxUsSlBn36rN0DocUVHU3wd3x7ch
 S2BbzmrzNqBav3Hh4LhkgH2KLw1cYDwD2ScsP7ycY0JNXlsIgjqerkffhNxpDIyG
 9A8knPI6ft0iSYliU3rbj+RxKP4+4Hm/n/RZGwoG1zMUBb2kUcC/H2eJOihHdAg/
 wmKujrTojNlPTw1VXYZjQZIIW2p9IacVHOsjAY4D6rB7lR35K08rHXMVF0/m2jXg
 l3etM9+oXMnHVQ==
X-ME-Sender: <xms:51DOXw37GND4gFAT41LqyRu3l7DjYqC2Z5myf-TjbC_AJ1sf06M0Lg>
 <xme:51DOX7GuIgriwLPO44HkrQaRCvb2ED9zaGUyPyHoEuBPmvfvtO-rZY3GN_OhKPpiO
 fRtWqEq5V3oKFZfm-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:51DOX46_Q_qd4ckoovrt58MR8ELezkP8jsEUYMSFoxPRP4sxfpDNmg>
 <xmx:51DOX52PvWydbpH783XBf02Ay0IRk10i3dBVtB2hCD4hZq_ETRrgEw>
 <xmx:51DOXzH4vGK198xZhxkc0rys847KZ5bre7vX0gLKLHj8fNB7MHE1VQ>
 <xmx:6FDOX5anuVaTRqF2tP5kjO9ftSdRQdT0nFmTiWAB7QY4IWBmAjeF8g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A36321080063;
 Mon,  7 Dec 2020 10:57:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 5/9] drm/vc4: hdmi: Create a custom connector state
Date: Mon,  7 Dec 2020 16:57:15 +0100
Message-Id: <20201207155719.17149-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When run with a higher bpc than 8, the clock of the HDMI controller needs
to be adjusted. Let's create a connector state that will be used at
atomic_check and atomic_enable to compute and store the clock rate
associated to the state.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 61039cc89d9d..744396c8dcb9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -170,18 +170,41 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
+	struct vc4_hdmi_connector_state *conn_state = kzalloc(sizeof(*conn_state), GFP_KERNEL);
+
+	if (connector->state)
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(connector->state);
+
+	__drm_atomic_helper_connector_reset(connector, &conn_state->base);
 
 	if (connector->state)
 		drm_atomic_helper_connector_tv_reset(connector);
 }
 
+static struct drm_connector_state *
+vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
+{
+	struct drm_connector_state *conn_state = connector->state;
+	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
+	struct vc4_hdmi_connector_state *new_state;
+
+	new_state = kzalloc(sizeof(*new_state), GFP_KERNEL);
+	if (!new_state)
+		return NULL;
+
+	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
+
+	return &new_state->base;
+}
+
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vc4_hdmi_connector_destroy,
 	.reset = vc4_hdmi_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 0526a9cf608a..2cf5362052e2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -180,6 +180,16 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 	return container_of(_encoder, struct vc4_hdmi, encoder);
 }
 
+struct vc4_hdmi_connector_state {
+	struct drm_connector_state	base;
+};
+
+static inline struct vc4_hdmi_connector_state *
+conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
+{
+	return container_of(conn_state, struct vc4_hdmi_connector_state, base);
+}
+
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 		       struct drm_display_mode *mode);
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
