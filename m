Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7D554D29
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24170112BE2;
	Wed, 22 Jun 2022 14:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C19112BE2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 00D8A3200094;
 Wed, 22 Jun 2022 10:33:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908390; x=1655994790; bh=cH
 IcDgqfV5GC83o+CqVoFqUS68FpTPv+mqLEAxRN7jI=; b=Q7m8CE/yuCvgFSLe3T
 Qa24882vAjx5TS3I2dKIoUVhn6iDFzYEslhkeJ89U5adqlx0dbXL80eZSIKSTHUL
 rooInsqKW9eWC293balQB1nfY7rY0xqbE42c6r/MJlrNgfFTj7s4KCrchODm2Nk2
 e8veUGPMe80C0JLe8/JfD9VZXNX5fvd0kXQMfxAmLy0EBxZdXbx+ypLrc2YnRdM+
 VncQpygFyKPxxW2Qk0P2YZPJSJAtQXDKUARHYKYaSvHzNDWQOT/bWMvjif7OAI0A
 XOJAZdYSHRSIjQaQNsZATcdCRhxgrxw9yHsdnGWRRyvwCkMpzBd6w2KBCZRHExeN
 MXFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908390; x=1655994790; bh=cHIcDgqfV5GC8
 3o+CqVoFqUS68FpTPv+mqLEAxRN7jI=; b=J+sHKFxX7GJW3XL3oP8h/uG0Tust/
 oIaW07wef0ZP9W9v5B3YPdooS6n5H65p6fMAw5x5Py+umzgxoK5yFOF0yX0skI1h
 NgA2DoKk6f8hQ98PEnfUK1txWodzKjAbSWl+NbUM0nT7t1t8IsnmLI5z8tYLnydt
 Cj5/DYzT+TfrMYZzpTO7DbamxDJowbpPo1gvZRFOVePmZnlZS6xqGak32vmJGMno
 XysWGs1RveQjkfqqfhtZaW+ACHArJ1bmMlsDNVcvB9/NhRoeE00X6hj1B/TdQhIm
 y28LctZqT6B0pB431P/GXNyv5kNIaKIsQQdr6N0hJ7m79C3ML8J6/2YBw==
X-ME-Sender: <xms:JiizYt1zY3CnLXDmdVAVLUih-f4mOm_Ms6VVtta9ixijWtlx2Pj84A>
 <xme:JiizYkH_IvJDVVBROuRqtDcawMrXkYzkPBkxa2uK87NuczrfbbPiwR0znbvegY6Nh
 sk-IbLRbbRZIaZ76wU>
X-ME-Received: <xmr:JiizYt5shy9jYe4VKn53JezlXfzApVrrcRdryXYa9Wli0pdwfSOfn8nUIaB-8KVEx8ReDk7atUfg6ZsrSnmjNSJ-xqepL9bnrKEvaOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JiizYq06BA6YWW_vNtfl40A2HIIHQKxkldqRrVkSard_dvaye39COg>
 <xmx:JiizYgEuRB5A7Jq64XRMjoz8d6pLCX8_QEVrxC5fVNsgTVEGlh_xUA>
 <xmx:JiizYr8YL-x5Vtb7X5QpaF_14WQ5o3lfJms0GpEzTcn29oHz7HgqfQ>
 <xmx:JiizYlM868W-RpzWaQf8wIzfT6P-5hGvHPXt-Pm18GwRHQ1PwphL-w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 18/68] drm/vc4: plane: Switch to
 drmm_universal_plane_alloc()
Date: Wed, 22 Jun 2022 16:31:19 +0200
Message-Id: <20220622143209.600298-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's switch to drmm_universal_plane_alloc() for our plane allocation and
initialisation to make the driver a bit simpler.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  1 -
 drivers/gpu/drm/vc4/vc4_plane.c | 23 ++++++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e559fdb217a5..84fd25e71c41 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1277,7 +1277,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	const struct vc4_pv_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *destroy_plane, *temp;
 	int ret;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index bc1f1c4172e7..813ed4c05b29 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1453,8 +1453,6 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs vc4_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	.set_property = NULL,
 	.reset = vc4_plane_reset,
 	.atomic_duplicate_state = vc4_plane_duplicate_state,
 	.atomic_destroy_state = vc4_plane_destroy_state,
@@ -1466,11 +1464,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_plane *plane = NULL;
+	struct drm_plane *plane;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
-	int ret = 0;
 	unsigned i;
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
@@ -1481,11 +1478,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		DRM_FORMAT_MOD_INVALID
 	};
 
-	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
-				 GFP_KERNEL);
-	if (!vc4_plane)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
 			formats[num_formats] = hvs_formats[i].drm;
@@ -1493,13 +1485,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		}
 	}
 
+	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
+					       possible_crtcs,
+					       &vc4_plane_funcs,
+					       formats, num_formats,
+					       modifiers, type, NULL);
+	if (IS_ERR(vc4_plane))
+		return ERR_CAST(vc4_plane);
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
-				       &vc4_plane_funcs,
-				       formats, num_formats,
-				       modifiers, type, NULL);
-	if (ret)
-		return ERR_PTR(ret);
 
 	if (vc4->is_vc5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
-- 
2.36.1

