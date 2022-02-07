Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0F4AC5D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7D810FA33;
	Mon,  7 Feb 2022 16:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9410FA33
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CA0823202112;
 Mon,  7 Feb 2022 11:36:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=wwBGRwX6fIvwQu1qIr7O/rvQ8eDF27
 yEWJYNBAgMOK0=; b=VymyWnuh6mX4OsQRa7RDqDoGwcgig2M2BZhasHSjVqTQ7E
 TmDSEEeu1VzEGBEZwVFNERF+gAnt+C/gXmCfnALiLJwoDoTNWSQr1tC0Ug8lQGZp
 DjSjyJJSr8QlvLQKa36REMjgjQO1t1sFIJ9wv4nz95g/H0BcNwWW+rBrOz7h1iIH
 E1MVBDiXTcp6CmOYvOBmsRIERDv6g+oLjsOnYn6Qp0UscEoABjGGg9VhSA+UL5wf
 v+6VCHcpHNmxMkiA3T2wgpTrVRc6t09px4xIuF/69iLZkCBHNcMnKiKaFfqCNhNW
 ecc6rEg2Iq80pyqw42wwihg998HewLo6iBhE76hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wwBGRw
 X6fIvwQu1qIr7O/rvQ8eDF27yEWJYNBAgMOK0=; b=X5uyvBTkumvgSbqOePPs6y
 vC/zzoXmNKPXiV2FB9H9kmcqmu483R0asiSNLwwCbQLawVsfpSn9/6tbUDiYkNdH
 /60OVxnY6M2rZa6Yr4NZmgslaI04/RZ/EIdajIMIm61pnvAfymFXrZwSfZBhw3Kq
 k5juWc6YUyPjuLTfV+NF25fsucypig4PNb3/2dy48aFf60kld9q3BXhi0FK4tmhM
 6LqU59ZKn/70+/2oNc/JirmPk7dviS/swK9CkN9ikpOEFmyaSe2zBi9oja35ho6o
 LJlutHzWIfJJsj9nz4HJrdyN1YEw0oFl/lo/3fwojABYaGuWq6eZqBf2XgrcHP3g
 ==
X-ME-Sender: <xms:g0oBYlwX5_twH2aZMjm-D39KBdapwe1YnA8-4fA_XUiv128WjmTNsg>
 <xme:g0oBYlS2J3lVuoxrZ-4JrvbbScZYm-E6QLae2Ms9BUpH03y_fkZYvXpIbFKRneOvn
 H7OAlVdAcAFZ0D8bhg>
X-ME-Received: <xmr:g0oBYvVxiCgLUom2yIC8JLTOZ7qiWW9mv1c26DGGiy63zyLrhypkyLvOfyGMN7sQCoLo-_2WkGyEXN-HRfKTVLTOEZSIf32ZabMMu3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g0oBYngPOqG27X_30gDeLfHx9NjJdTdbjjDuJZ82ZsUt-Qf2alsZ9Q>
 <xmx:g0oBYnAqgl6EW-QZNLku_fvP2GmLR-6anheBl-lOEvyB623BdTpJIA>
 <xmx:g0oBYgJOs-9Tun8nnKxaarWbUZ18QunU3rqKFgFb8lQQnk9zHfc8Cw>
 <xmx:hEoBYr3BOxaJJJPyVMBa8KLq-FRAe3X55S6siBXvIbFBtXQCUQJy-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 19/23] drm/object: Add default color encoding and range value
 at reset
Date: Mon,  7 Feb 2022 17:35:11 +0100
Message-Id: <20220207163515.1038648-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
2.34.1

