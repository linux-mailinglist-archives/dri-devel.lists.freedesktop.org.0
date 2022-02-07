Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546A4AC5D0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F210F7FF;
	Mon,  7 Feb 2022 16:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819D410F871
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE89D5801E3;
 Mon,  7 Feb 2022 11:35:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=xhKVkS6XIZgUH0LRLr+qOPiV5PE9/Z
 MNzxpdkFVUd1Q=; b=Xd3R5cOhPJN7Wz5H5LxykZUI5Aub4u9z3b0wuRF6LrcPP1
 LZjDRV2v1hXEPqQyhaUrbtEqG66GM4UYSUvN1f3Ty5JTbJfYXe8EFbnBibGi0Gsp
 NELHLgbdDapZT1/k276lVwoHQq50lwj+WJt1FEJhq0MA4uaTYKcoNzrZ2UXlJqaW
 J7CYXL/s97dZQHw8aeV7SRaAQc3z+yzZzG8ii2RcIul9iMY+VT6longG6Jc8/Xvl
 Ji7uwjrEumP12kGY2BZwB9lThAzJ2K3KPfi4O+dpdvfubRuawoiln8Q/FmjvNzSf
 sha+o3B1pVjn0Y3Ku/LseXNy2NhdXRJB7e8baelA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xhKVkS
 6XIZgUH0LRLr+qOPiV5PE9/ZMNzxpdkFVUd1Q=; b=b4fk5q7Q4sPW8OhQDSgjfv
 PbRoOen5Z6TfAFGoVYXCLDySJfXXPj6R6M22QvNFHy6A81bT6jE2Ddpy2QIagfOi
 PBoPe/tbbBZI/TGKImwj9JaP7emep8HgyNHYwzMJQ6zKnofIVhi+iG3463kY9kcL
 /NzB5VgZviP/jj+FYmSYnpHrd5Vi46SFG6Ux0OA9WIEGzMm8+otQ2SwCnuxHIhrP
 qDZ/02mjghwhux9s1dXE3/RVxYSvzwPPjS2e4FkqXNMUWbnjK9M9uDDBOzU0Z5lh
 cq6gK0RmWUtP9TBbtTpbuuomtnXeKaJBgtBhC9stZNhLfjB0L/M/bDTyJARHg6fw
 ==
X-ME-Sender: <xms:ZkoBYioJ4dVcsQt7bpDYCJvnz4aVcUtDYd7zNBACZL7iI2ituVAJsw>
 <xme:ZkoBYgq_umX_CMsLDpKay0rKdGSbOebd8EJuGw7vYLHwoE5ry-XT1nsLULQW90Xh-
 QYnlU8jXV_rQdrvRsU>
X-ME-Received: <xmr:ZkoBYnOrvtjH_GUhFs0XT9ll721XSkU3ucxoJkISNtPxdignx0awzsc4EYcKnlW_te2TJIpnShsK26zMRtzhOsdI1epfB-YL_X3e4N8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZkoBYh6-H6SsJprHIQv3BuoLV7zbbyr5XKNu7myawrkKn2Qu0-xogQ>
 <xmx:ZkoBYh6rPuoxEZRs2j8Iw7XseylUD8Njtunjg3x3THZm3V6g4opSzA>
 <xmx:ZkoBYhhs-k48MQmhVNEenFX94kc0BT6FFoiLEQzMH0S3Sc4O7HTCYg>
 <xmx:ZkoBYooeVjt0E3TcC_Gr5PpQIHjXzXwdWb31-zo9J86CXABYNTPE-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 11/23] drm/imx: ipuv3-plane: Remove redundant zpos
 initialisation
Date: Mon,  7 Feb 2022 17:35:03 +0100
Message-Id: <20220207163515.1038648-12-maxime@cerno.tech>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The imx KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in ipu_plane_state_reset(). However, the helpers have
been adjusted to set it properly at reset, so this is not needed
anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 846c1aae69c8..414bdf08d0b0 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -297,7 +297,6 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
-	unsigned int zpos = (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
 	struct ipu_plane_state *ipu_state;
 
 	if (plane->state) {
@@ -311,8 +310,6 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	if (ipu_state) {
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
-		ipu_state->base.zpos = zpos;
-		ipu_state->base.normalized_zpos = zpos;
 		ipu_state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
 		ipu_state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
-- 
2.34.1

