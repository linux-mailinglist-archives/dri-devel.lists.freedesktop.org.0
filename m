Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF136F819
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F036F520;
	Fri, 30 Apr 2021 09:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1BC6F51C;
 Fri, 30 Apr 2021 09:45:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 51FBC5800D8;
 Fri, 30 Apr 2021 05:45:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 05:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5S+8iGS5sspRC
 3LmHvAw2R2mgRl7edse2y1d2yUGnL4=; b=UWq7f1p/DEwAUKKzbO3upJbsSLKNX
 8GkyiHDgaopSwgthkJcVd7QmoPq0W3J5AsmBSGNngGHs12UWHG0IVOkqvczmbjBy
 wCqxAVtkYRfwmzEnE5QgugRqhumXeo3WL349WQJ4sFr8ECq/8DAsLmik3Wu4wNYw
 b7eIz7gYMH5fv5VGvxOHhjlhZFp4SF8dDIDDmGzP/RJMVHnRlYhntISNAzMqpcJQ
 b04tagKrZGgUTy0LV5rBgG5XaoG4cFpj/22qaksfbvDb0f4a5gYrPTFG9spVB691
 aXOzRHbJoj3wvnoNP1Z3E2vJ2I0qwLteeEd3vNHjhjLCRBSXPZ9m899OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5S+8iGS5sspRC3LmHvAw2R2mgRl7edse2y1d2yUGnL4=; b=wjqSzDpw
 0/IK0Nuq5Ze6UnXbUbeNiavhxBVrCz2x+crNY+GMjvFRdU/pVFNkvc0MDkilhX21
 Er4fJmMvMjDsCRsh6gipzMqaLX/Q0ndC1NgmsYbZPrJF9f7/Bj9mnmQLQdIDbesm
 1wzxbIfoL+3kGmtIwyMbznR2FPmCV1TmWjafF6DvZUtrHWj/S8pKGwBAaGTP3hLA
 EIiQzH9srnee/V/hSU/tWUeBi0BGpL3zxbDtF0GtwntuhQ7fPl9i7kCu9/Gtk0N0
 k2Q+5b4ABakgAmpJlUHqGFENKA4vMU1yNpqOKBFYbIydIRPoBfwx7zEaW70D/c+6
 O2l7TTYbtrc1fA==
X-ME-Sender: <xms:pNGLYJZ4f7YIFUge3hmhtG8iFQVKOIrxRwNZc2gGnzyuPAY6PswAfg>
 <xme:pNGLYAY428CSYuoRZG7qTP2fyBybOoMqg4ChNRW315K7DjsPrwPnOlSoWbJqt0s2J
 vdoDs6qpYchv1RTzqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pNGLYL-WlOJ52TCExCMuGl4g4O-529eadMmzKPwB398J9feD9u0BCw>
 <xmx:pNGLYHo1q9e2HKu6VNvpbKkX9Q1Oq8CCr2o340HNYfGTOmVIcnwk5A>
 <xmx:pNGLYEolrfpuIhUMKJl3bJWA26SJnSbyyC_k6mM_K89kA1n-jkY3sQ>
 <xmx:pNGLYP_1GlORU-lUJ-eNFydkDIMkmFgRF6gmxOnLzY5b3gWUgRLDeA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 05:45:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 4/5] drm/connector: Add a helper to attach the colorspace
 property
Date: Fri, 30 Apr 2021 11:44:50 +0200
Message-Id: <20210430094451.2145002-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430094451.2145002-1-maxime@cerno.tech>
References: <20210430094451.2145002-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, amd-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intel driver uses the same logic to attach the Colorspace property
in multiple places and we'll need it in vc4 too. Let's move that common
code in a helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - Rebased on current drm-misc-next

Changes from v1:
  - New patch
---
 drivers/gpu/drm/drm_connector.c               | 20 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    |  6 ++----
 include/drm/drm_connector.h                   |  1 +
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index eed9cd05c94e..733da42cfd31 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2172,6 +2172,26 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_attach_colorspace_property - attach "Colorspace" property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to allow the userspace to signal the output colorspace
+ * to the driver.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_colorspace_property(struct drm_connector *connector)
+{
+	struct drm_property *prop = connector->colorspace_property;
+
+	drm_object_attach_property(&connector->base, prop, DRM_MODE_COLORIMETRY_DEFAULT);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
+
 /**
  * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
  * @old_state: old connector state to compare
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index d5ceb7bdc14b..9bed1ccecea0 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -282,14 +282,12 @@ void
 intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 {
 	if (!drm_mode_create_hdmi_colorspace_property(connector))
-		drm_object_attach_property(&connector->base,
-					   connector->colorspace_property, 0);
+		drm_connector_attach_colorspace_property(connector);
 }
 
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
 	if (!drm_mode_create_dp_colorspace_property(connector))
-		drm_object_attach_property(&connector->base,
-					   connector->colorspace_property, 0);
+		drm_connector_attach_colorspace_property(connector);
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1f51d73ca715..714d1a01c065 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1671,6 +1671,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
