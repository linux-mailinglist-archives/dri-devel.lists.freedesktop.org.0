Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB672CB6D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D0F6EA48;
	Wed,  2 Dec 2020 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577766E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:12:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C37E65805BC;
 Tue,  1 Dec 2020 08:12:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 01 Dec 2020 08:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TgAXov/V42sBt
 UXLOUvlAjcsuGYDXKyxOU7eXzDUF0s=; b=uySQQn5908OOlhV2YDku8azWX94uK
 29RcVhZZeJV4Q0qDksnp2Edgk3AcXh/iGGGIqiANjAE56lv9Rzfn7X7Ba9TGGj0T
 PkOGVkabQg6tOBvIKVO0qmLjBCT9I7iZzk8FMZvgKqIIjZn9wqSUz37CM/ahf6Ip
 KyUKk8cxwKvGE16r+y9aWedyUTpIAGlb3nnTqwqa5e+q1DmJD7LnaFQ4bVaKZG5H
 hrZzpHHHQSt24Rf9h0JEaa/DjBJI+suGj/7p+VvKSQdE6LOzfYW14umHFM0Elo6z
 TF+zxNqVRgS1iCKXD8w55GNHCnpY3bzhn7tQUAiAv/TDMOSPIkwf05cNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TgAXov/V42sBtUXLOUvlAjcsuGYDXKyxOU7eXzDUF0s=; b=lseUxmpM
 oicrpVQHj7iWFMvhz0FbLPwNQ7ia6JJ9ucO13htw3jrmY3MrcU7hVDhqSVex8V8U
 Rm4NT1k/J0VFwNszavdGg1+hLw7uYcnsSqBJkAfJoM/XcRx6bEGHxtmdpEgBSv1M
 zpj+0FMFWmUTCUTlwHk4eGh70ObCT1DJhgd0t5ebmpNik9fsGnN08YbGWt37EjMo
 ltT3vxJyPa8Hwopt1SJxRjpBK7KhPuBR7piTFAh1jZzt3e42uQhFCHnzBheIoW6/
 PbXbvnxRwtbB7bLL8SjaGoFWysMRF4NidinVjGss+xd2z1cpMw/0BaxSWzKeD3cf
 ynARmjj89ofJyg==
X-ME-Sender: <xms:V0HGX7yc14_aNmB0Pv4mMIMUfH36bp40f0oBheyp6-ZxfS4oY5-81Q>
 <xme:V0HGXzTA5MIchsX9ZRFhIptZRpxeDdAkRRwUbpH3zt-7nvecv4w6WLUskiVFPIKJL
 nbET7XqkWkB6C-s0ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:V0HGX1XmZL-xtIKK8p1zstt4T05dICNHHXA8gd1Q52b6cyJgvLpcfg>
 <xmx:V0HGX1jcJXayQ9jfwzqIqrCfKVA-1iIyD4uTadSGYr1d3wNqlpnZpg>
 <xmx:V0HGX9Clef9PTpnSmOHwGDrnrQWfpS1AYW2vzVlSODXERh2Phgoi2A>
 <xmx:V0HGXx0OntgQLOGvdXP7UJ_KX_tG61oCgVfYMHvD7xWIOfdbFDoOmA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4BACC108005B;
 Tue,  1 Dec 2020 08:12:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 3/7] drm/vc4: hdmi: Create a custom connector state
Date: Tue,  1 Dec 2020 14:12:45 +0100
Message-Id: <20201201131249.438273-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201131249.438273-1-maxime@cerno.tech>
References: <20201201131249.438273-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5a608ed1d75e..9fb7a77c86e8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -170,16 +170,39 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
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
