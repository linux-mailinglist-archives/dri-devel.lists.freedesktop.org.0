Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01654AC5D5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD3610F8BB;
	Mon,  7 Feb 2022 16:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9110F9B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A75632B0014F;
 Mon,  7 Feb 2022 11:36:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=3ECsOgE6DiFXZvAslMe1/R9Cbtn2FP
 rfKSgkACIPH+M=; b=aWPv/V+MBXUmywDI6fVrx2Z6lGwT0ik6Kj/4rm/zuEKmWM
 8gqtyv+HwtCgr7XBzxUOHJh8INlp4xA/m2hDgeNrk+lLEg75VsDxZSkuTLmrCIG5
 SOPGCaMIVfR96zmpbiWNUo4A7mpEixydBwFn1x23KE1BRkZX/TjkKCXxqqUOdWb6
 SxNRL5n6PXP9k9ocQhavxq1W0TtoN/xLt+vnZCUCbqHtYcHN4AaqxOIfYuSjaD2s
 XacfZiLCRjSCgtY9xXHceBEkV6zHzm2RwveSb4wuCYNURpnLzzcKS6ehrjypTcb5
 deEXcC81WwF3aq55ui4WuXDpyzXjqX5l4qGyGmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3ECsOg
 E6DiFXZvAslMe1/R9Cbtn2FPrfKSgkACIPH+M=; b=GArr8k/Jy8ef71AAKZ48EA
 BCdgEpXhDCpruogFWDhwHaocGMNPlViPzFbXWcSAq72hPfkjkch9JajrItsB2QME
 nZX/gqOdc/79WdVvxjolbrmLmtDjsc87ZoCieD1XPUPJWoxAw2iHMRXiF6FGWvaj
 stiISLf79oiCdSUmJIPfawE38DOaTQiUByc4828a1nfALtKYYquNo+zcABX7tyoY
 ntuRoAKP2Nj0Bx8vFmSdPETiQm3qrKCwqjWcAYiiron8k4RMfUaVbP9ayY3yiQb6
 4FzQH56PyMvCR8ofY9Sbo8bhWialA7bV683C8GUpVCmDW7rRTPzIHVAk08ET6KtQ
 ==
X-ME-Sender: <xms:eEoBYr0nr5iONbJECYx_lRdndmoregh4za46cY8cwglnQqzCkFI4Kw>
 <xme:eEoBYqHVeTChSYdv2P8gINnwaEd6UBBfb3WI4SvmGRIpAFh1mlb5BtSaLHdAP5O2r
 cg2-A_Xhva84Jy5BuY>
X-ME-Received: <xmr:eEoBYr7zmp-vaOfUXF2YqYe8Q5yeKhXEWX6Sk3MrW6fSrnjqQPEuy5msPJqR145t6ji82VvU2ZqHHiGbHYUQfE_kq5CG7LkhSlUu4QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eEoBYg3oAehT3kFOw-ggEwioQNcT8K5UQ6v9j4oX9BPUkunMpseB0A>
 <xmx:eEoBYuE_i-0NE8Fz8MdSeo9dWznQ3NBUorkS_5h8HLJqZVLnSZ4ouw>
 <xmx:eEoBYh_1AMIv3a8MxKlNiel4aCjWkWOP7rGPwfaaxAXNoUPCnzNC4Q>
 <xmx:eEoBYp-NyjTPupmenEjHYw8oK40K106qVUjAgPaOk1yVjvZGnZsVay42rnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 16/23] drm/rcar: plane: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:08 +0100
Message-Id: <20220207163515.1038648-17-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
However, the helpers have been adjusted to set it properly at reset, so
this is not needed anymore.

Cc: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 862197be1e01..9dda5e06457d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -696,7 +696,6 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
 	state->hwindex = -1;
 	state->source = RCAR_DU_PLANE_MEMORY;
 	state->colorkey = RCAR_DU_COLORKEY_NONE;
-	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
 }
 
 static int rcar_du_plane_atomic_set_property(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..719c60034952 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -362,7 +362,6 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &state->state);
-	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
 }
 
 static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
-- 
2.34.1

