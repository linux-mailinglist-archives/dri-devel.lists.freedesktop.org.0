Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E842D2609
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC2B6E97C;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038C589AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F99C580360;
 Mon,  7 Dec 2020 08:39:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+FLuH02fVjhIH
 VRcbz7WGmCYqG7nOLKp3bfnQHwu+0M=; b=QDh1HQwPK2lqJu40x1fBvkAxk54VU
 4b/dCs72BqiEJU7vFnNFJcnRWNc/IesRzsi0YZu+L3arNI1z9mUWPMxPaPCl9QvC
 O1wn0mvs2vxk4Xc1UaRzuiJhvnLeQtj9dwzeGhSx5r0eIh0vSuG+TQybbT/ZyrtB
 rF9IqQqrDU6hxvia5l3J1yzDG2ORByExDDAXukYLubdJjHiNjk5YmpHnzP0cU6IL
 NwIWSpQlxB8deTE9Pbe8gLKcKx2IgXi5rBpdG3B8ufs6++bIZLD8nWzH7SOud+TD
 ixzQlQ9jeu5qZPdT62ZqKPVGOJfTlPfyF6KtFod7te5FaXMcxTi0EieNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+FLuH02fVjhIHVRcbz7WGmCYqG7nOLKp3bfnQHwu+0M=; b=WY2qMSls
 47yp1Cp+IxTGst0qnL4VBfP+Sd1TGCIlJc/dg2OLLUZBV7D+F+nQt+nge7aYj0a/
 e7rZa6jlFlR63Dk2PRUCeGlCC0WKei5vmS5zQtP6gUJKHrOa0iHiLLVghhR2JfUH
 Yt2g9Om/O0h5dPE819adYQR1A+bgUz/nqw1/sB6mFyPj50DnB3KtG8SbmLiL7A6f
 gdCcYeGwXeG/FCfH5hxeXatIk5aV+tEu4a7v7XpHII4BGBxovxkXmgedHRQuc3b9
 w8YzgSEPiZPFDPeOOe5duKD0MvG+DcvoNcaji7GuwOPDCiZ2MaKhiOIGIjdJE8HG
 ayLwl+/b7G5pZA==
X-ME-Sender: <xms:rDDOX9WNIE6OO8Io9-Ar9pwBKzpbdk9pI25yLFsN8CVU_jGTMC4m7g>
 <xme:rDDOX9ndm0GuLrhxN0541astGYxEGPVBnf98yJ4vwepKHL8C--o9vJLuRo4E3WZAk
 PdlRsLMsCeh4u5m_us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rDDOX5bDGqL2ORBrReT1shueud4hdIwZkQUVuZ2358lr-3BPiKJr6w>
 <xmx:rDDOXwV3SbjxIhBr5jki_LiFxj2fTcmAwobFND7dQM7nUFaLfrq-TA>
 <xmx:rDDOX3nvFcP_HRBJrfZtFy-2NQh3RfqUpVnOUFfM6kbMcyUujRv25g>
 <xmx:rDDOX569-XV8zcx6n2I7AgDxhOjOKgRzHMC4N2LQwSThFRJUkUAxTA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E813F1080057;
 Mon,  7 Dec 2020 08:39:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 4/8] drm/vc4: hdmi: Create a custom connector state
Date: Mon,  7 Dec 2020 14:39:44 +0100
Message-Id: <20201207133948.2109194-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207133948.2109194-1-maxime@cerno.tech>
References: <20201207133948.2109194-1-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When run with a higher bpc than 8, the clock of the HDMI controller needs
to be adjusted. Let's create a connector state that will be used at
atomic_check and atomic_enable to compute and store the clock rate
associated to the state.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 112c09873eb4..862c93708e9a 100644
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
