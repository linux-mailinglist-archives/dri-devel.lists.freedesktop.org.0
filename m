Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D04BD8D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B3910EA4F;
	Mon, 21 Feb 2022 10:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95D10E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C1D8A580261;
 Mon, 21 Feb 2022 04:59:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Feb 2022 04:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=lZx6QJtY1OfVXkk4liNafMSMojXN0L
 YL8ej+OsuKSTs=; b=o3T+u2xCPGKJpW3Ad+/ePTsbc3R4zBSrqz0qPGJQF72QPD
 FR3QcXRio/DseBsFY600wAuchj4uWvQVReCeDOKd43MBrs6b2veiO8MkOmXeNuAB
 LcnA8bbc8bz7GwF5bh17Oj0xgyZknhlxPOnY/aTJKcWR3isIa4ls7/7b/0XiwNRU
 GTZEOLcBOIjRKD0ZJ5+1cKE+8cW9wcaR1lWclQeq8aazVz03QgW8ldJyyb8aDznQ
 77ADP6+WuXW1je2fNO33D8kYWiSO4li0JQc7cMvmJgTMfHaRaHIQqIym3A6CZ9RY
 VdjdE0qjT6JwODHFuYkcdqp28+fbspa+EqvbPCaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lZx6QJ
 tY1OfVXkk4liNafMSMojXN0LYL8ej+OsuKSTs=; b=cIqFvO6Cz18A312yduXARt
 mzPlgpbYcrb+1MpSItVgPr5oY9OlXkGc6ZWtlv5t7Zhwtt54ZngcxlX558iebSRh
 aOg64zg/krWGbpOyyuOxNw0tZsYAdid/bSdoee3ppuXvOiN0GsNampaGMNp570Eb
 ZDVcydekyjkywvyT40FRe09N2Un7zVar02dquZdte5qpY6OjX49lNO1myjn8IMfw
 acz73LvOrADNRqeRr+uhXYGOApy3yZHIPom85Pifk6oC3OwvH8WRXDLvE9yAiJ2A
 Ix9trPBgX9JH/UDOCQg/7C8VCavK9zeY4C1YrWmeWZ3p47+lu9JZActu4fWJzhOA
 ==
X-ME-Sender: <xms:m2ITYlviEYzWQvejmzsBBYT6kS61fd2E_RNO48O1hhqXsZUq7C2b6A>
 <xme:m2ITYuc-1ZKMNGnzHXCZiRGXDTXzYL4CPzPxYTHV-qC8O4ID_s-k4shqxd_FAMz0X
 gdhk29KQmGAgoDPu3s>
X-ME-Received: <xmr:m2ITYoyqo2Ffjba_eG8sgJ4RFYsvvS020D3jksA07zb7UBib6KZItkUkQZbAZ3ICRJH-WaM-ZPsTSnJLXW5Mp7Gh6dltc7aERLVlIDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m2ITYsPR3INsVkYdqxV4R0cuXM4OJt4RVi4nrxG8I7RP8WQhMIayUg>
 <xmx:m2ITYl9Ggj8SL_xUFB77KcsuYBUMwuNezNPliTKWBLbEoBrvuHC0Og>
 <xmx:m2ITYsXsK9iaSZSimaNfKCB1IbaxJU0AlxxXUaCUOXm6tbKHc18DkA>
 <xmx:m2ITYsW62qJvRunI2p6YKYSZmlWpUL7KSIa6z4BWC4VN28h9DZsJuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 15/22] drm/rcar: plane: Remove redundant zpos initialisation
Date: Mon, 21 Feb 2022 10:59:11 +0100
Message-Id: <20220221095918.18763-16-maxime@cerno.tech>
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.35.1

