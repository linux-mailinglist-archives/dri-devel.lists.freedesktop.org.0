Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C22D5E7F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839A6EACD;
	Thu, 10 Dec 2020 14:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E36E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id EA2EA409;
 Thu, 10 Dec 2020 09:23:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Dec 2020 09:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=21KoWY2M/3wek
 qnjmiNvQStDFxz3608DfZqAOvc8Qv0=; b=qPK3955LvEa3Hc2lWXKsEL4ESzJoE
 4Darkz0gLvATM9uN9imw9DYCvvNcyILu144S+LoAniuXHDTg0JkDHFGNvi6NCL28
 fjkZP/WX7r7tA3Y6ao9Ryquk+sl6APmCjSHm8YqB27ThjBtSjTCJ6PHTYRGzNl1x
 lbUD86It+FpEDVZxbc6/DG7IYVjVl+GcP1UCf6ZQ30bZPRrth8tkQ2X+tofAUeWj
 GCqtBxO1VaWGACVUkqjPDurY0Tzx1jjaKLTP9WD6Rdm2RN62ybll+XEKsmQ77XI0
 yUvrNdzgM3JfWebQp7aqDdJQW816eZyVi4xqgv5Kqs21U8EbZRHqEgtnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=21KoWY2M/3wekqnjmiNvQStDFxz3608DfZqAOvc8Qv0=; b=Cd1cPb71
 9rK/56OME0wMV7BnPY2codsoaWQS5wyPbiuZpSJg5vpmZk7BIEpW6jrvNisMkq4z
 5BXh/fCxOs3vNLA+V0VHfeEiJtGRz2IHTAzcyuNyET0JZs6ZcJlvBXRfnsxgkzTe
 bg9XnCBCVFBCrQ70miLPHJaCjTsfBUwi/9Ho9oXVkDIa970LMg+cBDsa/OyMVA2C
 LSS8kX1iQUUGYFJiNQj5TphIz17u5snuTaO4+PuRCppdEhiunhizqKEExASJnNY6
 YN7cyLVqC3N38Zp7NOZVNzNt6HUMrlrNIC9+TnzjcN1Gw7+VlEk7bSvWpC8usABc
 2dJ4TTcAHvlv6w==
X-ME-Sender: <xms:aS_SX5PFxaqbtOdNnya3DzxY4JxfD1XA_orV3K9Md97w1UsvGxNxfw>
 <xme:aS_SX_pyrPqqcIkOaFPfiV3r13g9W2i07JhoW0P26P6gkxWUuUIpWgCLalQIfBW8R
 o3whA1S0_YhiZqxINk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aS_SXyHr9L1G8MI5JJpjf11ns2IVmFyMkv4ct_wNeongHde2UfDCHA>
 <xmx:aS_SX8oy4TAZyKtsMQ1j9BSRjxowFrs7Ir-yIAaVjBTCtNZLn43vaQ>
 <xmx:aS_SXzbrMYgkro7IXvNpN3zbc1JKdF_cwxVpz5ltV9USTgiQsw_nvQ>
 <xmx:aS_SX5LES6Q4tHLQN5JS6B721fJ78Z5_EeWEzVKgsqvjM1fDmjXma7UV6r0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51CF924005C;
 Thu, 10 Dec 2020 09:23:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 5/9] drm/vc4: hdmi: Create a custom connector state
Date: Thu, 10 Dec 2020 15:23:25 +0100
Message-Id: <20201210142329.10640-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 33 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 61039cc89d9d..8978df3f0ca4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -170,10 +170,37 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
-	drm_atomic_helper_connector_reset(connector);
+	struct vc4_hdmi_connector_state *old_state =
+		conn_state_to_vc4_hdmi_conn_state(connector->state);
+	struct vc4_hdmi_connector_state *new_state =
+		kzalloc(sizeof(*conn_state), GFP_KERNEL);
 
 	if (connector->state)
-		drm_atomic_helper_connector_tv_reset(connector);
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(old_state);
+
+	if (!new_state)
+		return;
+
+	__drm_atomic_helper_connector_reset(connector, &new_state->base);
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
