Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4D4AC5DA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510D10FB02;
	Mon,  7 Feb 2022 16:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A510FB57
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5CB442B00135;
 Mon,  7 Feb 2022 11:36:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ToAcedRTDsaA+E1VokpB3nJewie3lT
 X22mSVKPgVFPY=; b=skCsTaGZmC/P+PWRMsNj79KB4EbbypDT+ITZ/WzQMBMW86
 PHxV+dd+ZxeHRI4WzymznFmndsKxR17axm0CuOfkMknbGwpjp6ACMhgdQl4THTZ0
 fHHpla7InJ4Vf7r6rkbWa4Sm+Kc2dEHlDJmJeLMRMInZAUjpEThbpfi5sDcpTz4I
 IW5ibZAucJN86G0eEEiyIWgjQK42AwsCQtQiZc3RluJzbVSzzpUT7yQIe9X3BxSX
 JfaYOUyH/KQKWLEt/PmWxnuTB2rBpAu/ZS5oWYca5qpdderVr4fHINp0LbcT9tol
 Hxzqr+Y93uteyAdYQPFoPFxMPg1i/mpxLSRLmErA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ToAced
 RTDsaA+E1VokpB3nJewie3lTX22mSVKPgVFPY=; b=oO9ofnv+J3hcJR6FxCZwJU
 KsPv0+h1s9N+loLr2+9Usi5jsf0B9vWRUc05Ga8TA5WZHESrIXqYcYGO/Z0qfZ46
 JkH3iKLubtmdhojInbunjDEBa5q3w5O1HWOXZoT02/aUstwUFFEwAcQFrPRPy8Xx
 Owfp/Zx+LaTeRTTA0WkMptINnHx0eqe7341h6X0tkVRoSCtFETJDQ8mohXLSB4Lz
 WGQhvtFK09VpfaTtHJ+53KmDdd9IRYAvKPnnKWI9QZDGmILdvySYNnxjjUl7rQYf
 nItA++ZvI0EXk5lEbks/dQpb13mnr/8DKDuzWgr3RHwJ+UCXh9acRtU/myTBKxBA
 ==
X-ME-Sender: <xms:iUoBYlC5g6yUtodCqfAV4uHJD1NiqutVCCd3TKbYaSeBfiEuRr-mbQ>
 <xme:iUoBYjjjSUrSOqnlYbqPabIuavvDq81s8ENLlMToypeGe5vMXZAnTOZxVhS4L2dAx
 _B9QnE8nx521PGGqlU>
X-ME-Received: <xmr:iUoBYglnmgJ0rFzolrefKETG3UG-jxD0bjxdk4zlp_M-RhYUbWRt9AFnfyKzO9ITUljlHhPQ8vRbN5iK_sbHUpWAZNKx__o-FOnjafY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iUoBYvxgf-MhsM_GQ0tDtqZaRkz6SBz_kYihNFRagbfatyWVMKBJDw>
 <xmx:iUoBYqR38nppBRMtzeNM_bo0IQz3SRU3GS0oOAffnc4GR4HWGkGYIQ>
 <xmx:iUoBYibl0DRXPM4KQraXpDidBgvj68FlebTC2wSMp91viA53wJ_Dbw>
 <xmx:iUoBYr-4XlH7Ri4jg8f_mwKEl3P59nC5-7Cl8iuq9kHwCP-vXLuZy9nYaWc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 21/23] drm/armada: overlay: Remove redundant color encoding
 and range initialisation
Date: Mon,  7 Feb 2022 17:35:13 +0100
Message-Id: <20220207163515.1038648-22-maxime@cerno.tech>
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
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The armada KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in armada_overlay_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/armada/armada_overlay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 424250535fed..a25539039efd 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -325,8 +325,6 @@ static void armada_overlay_reset(struct drm_plane *plane)
 		state->contrast = DEFAULT_CONTRAST;
 		state->saturation = DEFAULT_SATURATION;
 		__drm_atomic_helper_plane_reset(plane, &state->base.base);
-		state->base.base.color_encoding = DEFAULT_ENCODING;
-		state->base.base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
 }
 
-- 
2.34.1

