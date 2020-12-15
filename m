Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AC2DBD18
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0D89D58;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483B76E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 53DBAA64;
 Tue, 15 Dec 2020 10:42:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 10:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9J1VoKx1Bn8qf
 +MCItmqODVI0HxU+6JWOfysBXx2cPw=; b=Rnmb5OuzCmg3tOSkSa4kYzXvZIyKV
 22spEfnR6QLsTZAVZ31zBfb6JoXJOj6HbT06D/tj+Ibu3JcXPCqoUsv+1RfAJBGx
 q24aOLziIF0/mIK4e7I76Ar0pzq2vNKeY9nTO488lvm21sTtEiBjEC+AelfWfHi1
 4RcaoFSqhKHE8lkpnK3Y4UhdXBQQOZLpKsq0nPKDHgP6NDqM8CK7XHBmX+Egf7r8
 n3cnkt+4mhRHb5lptmrx0q0oMps/XW6NzhrTp1ZkF+UxD/y/p+BA0Fpjrwzavtlj
 wzgsbzIr1n2TYV2f7EuyI4ePhGOsIw/kkVllWfiXrgyfUCHvBRZ0HuupQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9J1VoKx1Bn8qf+MCItmqODVI0HxU+6JWOfysBXx2cPw=; b=GFEu6Z+d
 k6s9atPQXstWHZrKbnZeWPtc8mEwIX33oyF1Pjfafn5Jwtj0Z3ZKJrq7szfnuWLv
 XutqMh9lHK6DofBPj3yv/Deo78xGGOBCq03itf4UvLIVlmOs4CAPlhDZ6VE4CzSt
 1Mz0xOazE36686gTyS+GPKEfTyCzSOzN/BKyJD2Y4QPbeUraE8pgFo6ZeJXWbgEb
 bsU7QE1bOYjZLWlHS4+e4dYQbVzpvHtLPz04/BI1eSon6/K4SfQtJNAWNpkFv/eL
 eRV0/9CSgQRSwVqi4qfjmgWmneppbuEA6ttRlueFZ1qbGOR7vMKAKrUz9OI9mvGH
 tNKbvkof9YS8gg==
X-ME-Sender: <xms:fNnYX7KaO_Ke-GOd5afDARbyOP1zRcbUX9SnqsGN-rPkEi7oqvX4TA>
 <xme:fNnYX4Ejcaz2Bow_lsjkc6cWCZMg7F_2FzcEEGxgKDeuZBK-sXs3CsCjqXHtDT758
 HWwIUr3uOzx5OiRBxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fNnYX_RLNwEeLKCPxsn8dBlzdhFDKvBwJfxc_YvnHSL3g2Rn4jp-kg>
 <xmx:fNnYX0fQKce7vHzaM5L7wc5zaXqEIEp3L3c7ler7iCD1-8qh-rhSew>
 <xmx:fNnYX-rSJDqfbkusi4xsk7VEV5dDpcmq9953tMpnIoZLkgLTOCsI6Q>
 <xmx:fNnYX2eEjjS7yikBUNHqZC26ChAPOIE6dFsg0zEvtt8dXeE6QUqrqWEq38Y>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 841C1240062;
 Tue, 15 Dec 2020 10:42:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 5/9] drm/vc4: hdmi: Create a custom connector state
Date: Tue, 15 Dec 2020 16:42:39 +0100
Message-Id: <20201215154243.540115-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 33 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 920895deb2e7..d22a0dbd0ce2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -170,10 +170,37 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
+	struct vc4_hdmi_connector_state *old_state =
+		conn_state_to_vc4_hdmi_conn_state(connector->state);
+	struct vc4_hdmi_connector_state *new_state =
+		kzalloc(sizeof(*new_state), GFP_KERNEL);
 
 	if (connector->state)
-		drm_atomic_helper_connector_tv_reset(connector);
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(old_state);
+	__drm_atomic_helper_connector_reset(connector, &new_state->base);
+
+	if (!new_state)
+		return;
+
+	drm_atomic_helper_connector_tv_reset(connector);
+}
+
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
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
@@ -181,7 +208,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
