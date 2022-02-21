Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 734394BD8D4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335410E5E0;
	Mon, 21 Feb 2022 09:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163A10E315
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2BB5958025D;
 Mon, 21 Feb 2022 04:59:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=5SwP/wwc/vji0e+BnXTjQlaHZGE6Eq
 QxGRcx2sNfgvo=; b=t4EqtBH+aBn3iMwaR2aSD0TikusGOJqBSjlo2fTT19l7YA
 u3jXYkr4d4UtKfsDj8z87X7kfoE8grPj/GLcaNxJJ5IeW1xeVZqDnmo7GjF2xKKr
 aZhuN0l7XJS+TIRadBpYigYOrls60gvjaD5ttVaB6dM0RY0nrkF2ztOfXFwKLnZJ
 JUEhsuFGDiqGcasOQk+WtnU6JQLrNrGdpqvYwKQego5LWd1PCXRghfHbWKAwsPAt
 VayxXT/ppE8EcTXbOXgUAzMpO0AYn1nNuYTzpny/3SXAn1baeo90Bi57pkEkYqyr
 QK43NTsYBSICvTIjbe6NfOKf4HcOr4cqi/6rL13w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5SwP/w
 wc/vji0e+BnXTjQlaHZGE6EqQxGRcx2sNfgvo=; b=h00QJ57JZE+qd4UtnpTmFv
 27l0Xyyjux0IPiTPGEEuAC03SvkISSoW/txM/U76mhf2u0HLm+WOOUf82UxWb6FD
 D7sLG+3wsEGu+46FHs9L1B1t8hjETHtAsnNmQE2IOEApQCG5h5wmnBJnErufvEBE
 LDF/3bEwvUg7Zf+6fX1eHzw1BPLjzkmG9+uEska8R9Q96aSNshfKjZ/kEU3mHoTx
 6Fufn/qhkOxtm+oPiG5ccfwuyx9i055tl+gHp8uofj62gYqUN/maDc72o7n1Iorp
 /jIzO+plVvzws14qw59YtqrEMQG2YGGEqd30AZAOll0J9LjYNRBbKiQGlzc8av0A
 ==
X-ME-Sender: <xms:iWITYsiWwakM49irTecCQoZyI3FQcpGGZaaLxpfTZtS3F_alPBJRzw>
 <xme:iWITYlD_Ou1CuIY78t3iJYeLvivSzLwQ-Q9tg1Vca4OUM5Z7kkq2IonKnC5NMG7FP
 qyLpRK4rmBMnpMIFbA>
X-ME-Received: <xmr:iWITYkHtoLhfc2ggkAsqylRqm5N2-yVEl4ohrc4T61buI6jS_y5HvlL4nCZx0LN78ME8coLjeOrw1t_UUNhReae8fcUH8H-gzqRuZPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:imITYtTWfIxfBhytIY9qYMACA5x70tw9XIBsG56R9zj91-rf9x9hOg>
 <xmx:imITYpy03RmmTMgrp7W0ng2ByNYXYwO6_WLTiktK-PM54CkesBF5Ng>
 <xmx:imITYr6qYHy13qyH3HzU8knFkDsuqs3iopSX4dxaXLIc8KvV7myijQ>
 <xmx:imITYuqlyjOdxM7sWeaWV7kPeVozKzshnqvGDudRpsjpXotOUIY3LA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/22] drm/object: Add default zpos value at reset
Date: Mon, 21 Feb 2022 10:59:03 +0100
Message-Id: <20220221095918.18763-8-maxime@cerno.tech>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The drm_plane_create_zpos_property() function asks for an initial value,
and will set the associated plane state variable with that value if a
state is present.

However, that function is usually called at a time where there's no
state yet. Since the drm_plane_state reset helper doesn't take care of
reading that value when it's called, it means that in most cases the
initial value will be 0, or the drivers will have to work around it.

Let's add some code in __drm_atomic_helper_plane_state_reset() to get
the initial zpos value if the property has been attached in order to fix
this.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ddcf5c2c8e6a..1412cee404ca 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -243,11 +243,22 @@ EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 					   struct drm_plane *plane)
 {
+	u64 val;
+
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+
+	if (plane->zpos_property) {
+		if (!drm_object_property_get_default_value(&plane->base,
+							   plane->zpos_property,
+							   &val)) {
+			plane_state->zpos = val;
+			plane_state->normalized_zpos = val;
+		}
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
 
-- 
2.35.1

