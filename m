Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDC288392
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AE76EC63;
	Fri,  9 Oct 2020 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF406E3D8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:44:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A4B85B57;
 Thu,  8 Oct 2020 08:44:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 08:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FubuiAuKqFfjQ
 nIPQ9D/R6Z1+KoDdbhfdfbwjkbVQF8=; b=WSZbzdiOoN+PWIBFmJW5bBKhe/Yxc
 GEcwgxaQFTfAd0QcypJoFJW2H6kcz1mVBnaWbU6P9pTyTo0fcr89pwE04VcZp0BX
 53D7P6Bx3P1/tOeM1v+3zspDTVWjKJRAY455bEP/iMuIcKOXsWzKeDby4pD6e0Lv
 se4qyThqJztuSD14FgORfwH9oZXb2ECgELsnN1sxeRgcvJG9aps6iQdDCDtMJNHm
 eJ/dyDpYupnpiQZLrK6jNQA63feUwtTg9Qstyi47N9Up6sPBHvMCPtUrddS/uYrV
 S4K8z+X+j6mo13RfOCntYHPH1cEHdWBzhrBIXbxwxxRvaiMyGd0q2wb9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FubuiAuKqFfjQnIPQ9D/R6Z1+KoDdbhfdfbwjkbVQF8=; b=DI3vcE/3
 sl0y/34amO7KcE3mVmz6pfn4xmYGosJX0F+ChF98KAvfh2rKing2Hm3UFwrO3mEX
 FLQo4Y7julhCVoE5RWu3CfceSgZH476sG0ZLCoqYgWTC/noESi7D2Hk9MJvk+h9W
 m1YfmzTWt1lhjHCk4bOKsRRXfERS0ROaXNcz4sN0zUPmjAcJZB5/Es45NCgMKK5w
 AmY523LulyosI5IsajiiZzpAUJhXHWSNuZUAlB62Py2fIHeBeBuv4CjRK8hkS5Gv
 rKPm6RH2aRK5Ksld+96qzFHP7n+t+FWk19JpagkcNCYZ+zZwf8r1VolIqSeqgoJR
 /LvaW9j9Tyv/dQ==
X-ME-Sender: <xms:swl_X5IcYXbZbldpHsgaDEsM9P7swD-7uPDhC7psH2zDUCyriUv69w>
 <xme:swl_X1JykuEICnwfo8vWlWVINlQGIuYtLkB_ghfsv0wnoTxAs7rTxIrrK4x69lDxS
 DPU3L2Mcc6ldpUgTEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:swl_XxuxCBVBIjsnGBWjSercQ4K32gQOVDiemeWA6SAJR88M999FWA>
 <xmx:swl_X6YWmbcRzRGgh2tju2cryggTrc3b6rYuPGqDl7MbN8jvLIu1xw>
 <xmx:swl_XwaN08d1WzNWUDOu81O_iNBhVit0LOjd1m1C1pq6lqhIGSBbjg>
 <xmx:swl_X9Rs7xreXRji0C-kPNqXo_JgTdFQz-UD6rwNusVlBIexN8C3zMw-jbc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9D79328005A;
 Thu,  8 Oct 2020 08:44:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 4/6] drm/vc4: hdmi: Create a custom connector state
Date: Thu,  8 Oct 2020 14:44:11 +0200
Message-Id: <c94a069f79057db24bee80f1adc3ee7d09bd031d.1602161031.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
References: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
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
index 7d2593398094..5e4ebb51a750 100644
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
index 63c6f8bddf1d..d53d9fd88bfe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -169,6 +169,16 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
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
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
