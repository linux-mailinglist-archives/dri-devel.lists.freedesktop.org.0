Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4B84BD8DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A310EDA5;
	Mon, 21 Feb 2022 10:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1010E2FE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 50E3F58025B;
 Mon, 21 Feb 2022 05:00:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 05:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Q4y4umZ5GtDvlvHs4/TbYUj9BaIoYo
 +lH5fdqs2zx3Y=; b=WtI0IyGePcGX/gp1n6WH8w4NuQU5v6UVQM/IkO/OyywBWo
 cvJ6AmfFbjmqhfhq+L0/j2UCUExFZI/1WOyp5KO/+cvTf3bqVo+PU2rqK4gLJU85
 Djsc2UZOWFv44o/TaIGXv/oJAaiySdIcmGyZa+lfNaN2LOm1uukydgM5cuCDq5rP
 WOBVkgtM87KWm0niOl/LtVFhdP9eqOJzyP/QMFVs55+UmqaqWElDh3Zoq1C9H0+s
 eylFxbuzkm4lKLoHeTik4IkL3Y85RBwf7iwGFW3o7YOOBhOyG1r+YcGxbuMHZo2L
 EoIjy0Y4TxX8sQXrRvSzPBI/BPJNtf6COY+9Tv8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Q4y4um
 Z5GtDvlvHs4/TbYUj9BaIoYo+lH5fdqs2zx3Y=; b=V39Rzcg0S+WdZN73iqtuCS
 Lq285+d6w9XrYkB+d0i5oNgnK/qgQoZEzR4btJCNais2phda27mIZG3BjlDr8xWq
 2KuDCh3S4So6LB1JBpu6RcLjbcAkAMdwnP+NJDyE5SnclAh0gmschOp8UdqaqVPR
 y/SlbJuyoJkDdKS3UvPhbq8UCXHeRlFu6qhN00N5QBzvt0D8pBHrEEVdCXen9PGN
 wJ6r1PKE5EXxrsd0bV2uulR/VSWtOqTUDab2nCh903sgw2RaZWBpHtbpnx38Ov2d
 PvKhIX8wFoQDbUFxM4qAA8n8rVOSZ3bxBBZ9ay0nLuMAHkZYylCAIdg0WOXrBnSw
 ==
X-ME-Sender: <xms:omITYm4WdNc3Ykqq-A9Qz5DtTh9UZRbL1qgqwre2e4we5nUUxJWAPg>
 <xme:omITYv588mHXL0y7Cd49TbmWX9maumobU5ochvWiB8ivlV2knFg-1dCmEhQO9mmyV
 kiZEpTREyFDQENOVKs>
X-ME-Received: <xmr:omITYlfEEwax0m-LI6bLS_6t6cwLVD-69_0qpL1ATdwqzI9hzEtFDgzZGLMs7VqKj0MT37ZdrwAJ2ozyHDXjbXgLz-xynkHfBx-LRzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:omITYjIv6A95DWzbtecrcjubRrrdsTUPJ3i0RTTf7Hsb_PuSp6P8lg>
 <xmx:omITYqLInnoxr7lEk2xZyhCsaIHLLQkXUq5Q1Cacf-caKxUGcbRnOA>
 <xmx:omITYkyVG9D3ReJ-WBgFtthl7hoVEUjAFD2rdzHKAgzYuVH5eVEbDQ>
 <xmx:omITYnWADxo3LSwjr_Yf1Wl-KUedMs73Yx-Qqeu1ljeVVZCGJ2_KuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:00:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 18/22] drm/object: Add default color encoding and range
 value at reset
Date: Mon, 21 Feb 2022 10:59:14 +0100
Message-Id: <20220221095918.18763-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The drm_plane_create_color_properties() function asks for an initial
value for the color encoding and range, and will set the associated
plane state variable with that value if a state is present.

However, that function is usually called at a time where there's no
state yet. Since the drm_plane_state reset helper doesn't take care of
reading that value when it's called, it means that in most cases the
initial value will be 0 (so DRM_COLOR_YCBCR_BT601 and
DRM_COLOR_YCBCR_LIMITED_RANGE, respectively), or the drivers will have
to work around it.

Let's add some code in __drm_atomic_helper_plane_state_reset() to get
the initial encoding and range value if the property has been attached
in order to fix this.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 1412cee404ca..3b6d3bdbd099 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -251,6 +251,20 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 
+	if (plane->color_encoding_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->color_encoding_property,
+							   &val))
+			plane_state->color_encoding = val;
+	}
+
+	if (plane->color_range_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->color_range_property,
+							   &val))
+			plane_state->color_range = val;
+	}
+
 	if (plane->zpos_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->zpos_property,
-- 
2.35.1

