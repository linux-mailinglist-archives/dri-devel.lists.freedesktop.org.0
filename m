Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B54BD8D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8F10EB5C;
	Mon, 21 Feb 2022 10:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658310E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2859580261;
 Mon, 21 Feb 2022 04:59:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 04:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ML8P7fn2nPFhXDP1CoxGxF14httBLF
 ZO6LfSVA3wyuc=; b=aYFJM0aG769G/hBOPBMnDh5OyxqVjCsWcWaMA6XzO1i6Ur
 zUDuUYW4j32VS9dorZdSPzJJWq+1u35+GnVlKULboPHq/nR/6GTEjRhNN71BAZfD
 Muy5HKkkLb9KTcR6PfZGrT4d6+O1RPlWJwybVF81eUOlqcA3efqMT8376QtHQ3Mh
 pw8H2SJTzxQbmrhVDSaC4MD8xUUqB4CFjqEg6MeB+XOLRxe80GD2Wye+BcAyd1f5
 9ifjTOd/HtYji0pwHr01NYk5gT8UJ9LuTl8q3A7XVWpCbCG9Ky9573xbNAn3ewyJ
 TnRWd8mv04BOQ29jqfhCENwnmNYACTMGcFsd39sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ML8P7f
 n2nPFhXDP1CoxGxF14httBLFZO6LfSVA3wyuc=; b=kL9l/zP8upf+4x0eTpeY/f
 yqQYfpJ7Dmgp0FQ053ob3DvgyCVPMhR1h9Zb+2Kx7F4yzXEsWtMBZ9BbbJ1AieZO
 7OIaAuDkJC9lF8WOZG9WfQsmrpH3Oaid0VKBATdlX4WIDbrEKsh6eDmpWLQpZim/
 mds13dj3RDcK6jy1pCHF74+UuS6j8EP0JAKZnh3Ow7L8nm4ouuhXQ6nlbHt01Q3m
 GFMYt18/RTCJZ6kDrCcjTHhdPyKIqswFAlllGFmIKIB4rZqKCBoqm9tQ3H1kxzqZ
 I6khTlFKVVde9Vx7l8nOzGZcZHmBx/3iMUh7TcknD5Ohlb7Lnsijql+fofSbU/wQ
 ==
X-ME-Sender: <xms:mWITYnN8H-RrZAHnvr3T60hzRcLQGFiv201yqalM_8CgGRd4j9bEiw>
 <xme:mWITYh9rMSeGLG-AdT2f9gZ3Hz119DKa1LIkkBx5XQe2VtFem7LXbGx7q71tQiHST
 s_EmEYm3OnnyPtO63E>
X-ME-Received: <xmr:mWITYmTOPLAiPm56vyjEju4ecUr22m8ArLHXXboyo0iljoC-fVTDuGs9jlhBuB4ZhyMxeZF8iRT6KJ9GVjVQSmgIHhZTjMppNMJiMqY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mWITYrskZeymkmVFQFjSWIjcIOqHEAi7HZbH-57wFlk9l_wr6PVcew>
 <xmx:mWITYvdpuMiijzf2bHTvyrtenxfvYtKbUvjvsOGS5JuOnWVykcTOjg>
 <xmx:mWITYn2kU4jL_qJ62cxNPLhgQFMWofTg8ohKhuhXOodmvrdbxqJK5A>
 <xmx:mWITYj7qyLG4uB_P6VtGSGt0luDABRIFrewcG0oqeC_7eX3RZlMUFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 14/22] drm/omap: plane: Remove redundant zpos initialisation
Date: Mon, 21 Feb 2022 10:59:10 +0100
Message-Id: <20220221095918.18763-15-maxime@cerno.tech>
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

The omap KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index and the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in omap_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Reviewed-by: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index e67baf9a942c..d96bc929072a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -414,13 +414,6 @@ static void omap_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
-
-	/*
-	 * Set the zpos default depending on whether we are a primary or overlay
-	 * plane.
-	 */
-	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
-			   ? 0 : omap_plane->id;
 	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
-- 
2.35.1

