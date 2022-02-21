Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AC4BD8E0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BF210EE4A;
	Mon, 21 Feb 2022 10:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D0D10EADC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D7AEC580264;
 Mon, 21 Feb 2022 05:00:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 05:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=r8igaXWRbTdz1AtfUYgtcf0nwGWdBN
 3fb9njaFHdLZE=; b=ZEmn/7x3QqIiQJWwP9xHtSlu0R72jXQEFISczudzzhMPKp
 WXYT/euD6oAPBT2ZB3GP/0O1LrkNNZMQ4drt7y97HM6F+mlKNOR+f02lm5rZgSiO
 buCBiodhzRF+qZaaT6UiamDADpMW4jlRn89Khe/izxok3Fl5hQthCAWG8mADtcKu
 WLTTDWTUiG2DpP3n27RXli0KZr1wdIhkV++pxkMCyIOU+7J+hrXpzsBndYxRkJS7
 VvELA60NAvJChoztpGPBEjNDiRic7I40aQhxHZfwYJ5oKRfXGhnjeTm/2qWUE3+2
 EdSDeyZk3cwmphMz73O4QHKy4q0DKJDx+fiO0Gsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=r8igaX
 WRbTdz1AtfUYgtcf0nwGWdBN3fb9njaFHdLZE=; b=VOLwq9UfDS/4Q57Qi5Jjt3
 RQBKCDGLVTSplS526qJoa8hsyU8rNALb33Vhy8Z0ypFzhh+cZ7IIYPkkOqLJ0KeX
 /ntUDx3nX8RvgfrWvikLyRn4V6lzHyyukU3D9IHLxBP9bCNg19l5ruYy4RUlsiU8
 TvZ21u/j8238tcKIPwcssXAtg4AcG4PY+xNCmChubSwVZKfHrCR6mcARZxn51ZbU
 zKv0PVc0IJDDgv7M8sjP/TYFuuH+EzDYPjxP7jVyeB6qo8FSaQpskzWWMl3RHAy0
 1aqScfw591+nTPMnVCTdL6c8ib9u74zJV3mQD0KZED4+OxQp0YqV+DzuDHbabPTw
 ==
X-ME-Sender: <xms:rWITYnZAu7Ac4VrXxP-Ud9staSeJW3iCwhRHnv1hh3HMahP7fahsXQ>
 <xme:rWITYmaSYoSyybqpDJosQ7GyQK7MGB7VoAfijfRBmIaoDTnPzT7XcK2uGw5zicPOE
 pihSEHPD_2ORVFyDXg>
X-ME-Received: <xmr:rWITYp9R6E6e-ZZugGKMXAVIH8FlWLAL54QA9zy5UfL_rImRQDKKMDF_Pg_kjBqnGKUJmi6gSnkghGX6n4e1r77Hr1LtxLvYWV8q7mM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rWITYtoGt7fDo2TVf83B6gD_VSE7I6DVuMqFURlIYNcQo5qjz_FZ5Q>
 <xmx:rWITYiqLUUIZ0nbYfNt9PfWIbw0pQCxWb8-iz-BPvdD2qAwFnFVCxw>
 <xmx:rWITYjSZXrdpOPJ3a3HwOjwVUDN38MLjwfCKZIVmn1ff4j41mUi9Rg>
 <xmx:rWITYh2SYws5HztX8nsRa8laomLi_yQ7sYm--7K3uoriXXLPYrWl-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:00:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 22/22] drm/omap: plane: Remove redundant color encoding and
 range initialisation
Date: Mon, 21 Feb 2022 10:59:18 +0100
Message-Id: <20220221095918.18763-23-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The omap KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Full Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in omap_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Reviewed-by: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d96bc929072a..b83d91ec030a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -403,7 +403,6 @@ void omap_plane_install_properties(struct drm_plane *plane,
 
 static void omap_plane_reset(struct drm_plane *plane)
 {
-	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct omap_plane_state *omap_state;
 
 	if (plane->state)
@@ -414,8 +413,6 @@ static void omap_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
-	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
-	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
 static struct drm_plane_state *
-- 
2.35.1

