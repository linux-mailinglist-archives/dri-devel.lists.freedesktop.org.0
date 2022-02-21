Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFE4BD8D9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868D310E847;
	Mon, 21 Feb 2022 10:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00ED10E847
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0809E58025B;
 Mon, 21 Feb 2022 04:59:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=mQII0g0HG1+0YE0cuhdlfpkX9aXomQ
 j19N1oQuni/3Q=; b=WvpPSWuVaE6I2EMq850a+C4uO6xzAseC1tXnZ04YgbiYVf
 3m4XSV4Y9aPJp9mJrJB6bwD+dF3btbwNK0C1nNOB7Vh/JXqglNbXLeQPlXM9aSMd
 iLDB+TmbeHdOQ8MU/t2TPIukUoDu7QPPJWIE6tuegrZosj7l8tdLzngwb/qEh60X
 9dFUPskKhwCbIjqw+rX9fnxjlt7t5XIX+JM1K5qeDrfeTqR+1CMnO6cTwBIx6Lzj
 h4GZqVh1Y4xcqI5220DnJARYGdZNqaonnlvsogDXNyzHYofdDkUHE/5xeP8tjY+p
 tVO7s7Nd4gquorNx/5nNmgF7+JhSaniF5WVQLAJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mQII0g
 0HG1+0YE0cuhdlfpkX9aXomQj19N1oQuni/3Q=; b=ZmidVOS1Pfp3c+YAitpd6t
 sox2QzDPyLhEZqoylsvTBx/NoJEO/LdpS43SWx0Pg6cdaKXpjPSh98fed5LFZRqc
 yjBjqCp2+D0CC6XW+B8BpRykL0p2Nfl6ZAwQ01OOu5BQgk+3bCZaS7bz1gLiF6+n
 YgfpN4Lc+7ut0/adhHHGb0ZeypiTLRL5R6Bb75L2WIhv7hnHfgqytMYvNdOfQmI4
 2m400GpEJUagsjvmZhQ2dA34IV3iDeJtdDEbRvGqZxcsTpgQkq0it4iPN2Pq0fIB
 NjI0VSTDUKPZM432CYWfcISkF5LPqv09kKwFVRqBmorYy7q9Ur6MCupT/5NrnLIg
 ==
X-ME-Sender: <xms:nWITYpvOkGwVgFA9nE5T_ElAOfsMh1FqfzeOq6iUloo9FIsakeYqXg>
 <xme:nWITYidWIXw-iuutfir9IKV8PTDkYHQ2uPuH9hvwTAVNlushFi8cbCD9ZGqWsa-Wv
 LC_LMcwkUMT7Xz7oyM>
X-ME-Received: <xmr:nWITYswQ7QKsCDjyyZAvyP3jLHf8ztdTiPa25Uf1fB1dYTl9atboP9tRPSs09oUJtp5IMRzaUeTBGIYFsHx5MxE1Jj1wPQLszePEe3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nWITYgPb-uQrv-h3GbNGT9P2v71kIKBR0Hd3ss_rgdRwkmryItq_gg>
 <xmx:nWITYp-2m5w6EQJBl2quycT5pAAkKAF-A_ePj-4aDITgEtp1seiKHw>
 <xmx:nWITYgU42lHqmoSH5hyhpGhSctZlBw32_CkVzaEKIxOlmSebhbd9xw>
 <xmx:nmITYq0uaeudy7T5AJDMxF6n8BHtcwa8TX-rEeK3L0wffLjlY76fEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 16/22] drm/sti: plane: Remove redundant zpos initialisation
Date: Mon, 21 Feb 2022 10:59:12 +0100
Message-Id: <20220221095918.18763-17-maxime@cerno.tech>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Phil Elwell <phil@raspberrypi.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sti KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in sti_plane_reset().
However, the helpers have been adjusted to set it properly at reset, so
this is not needed anymore.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sti/sti_cursor.c | 2 +-
 drivers/gpu/drm/sti/sti_gdp.c    | 2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c  | 2 +-
 drivers/gpu/drm/sti/sti_plane.c  | 6 ------
 drivers/gpu/drm/sti/sti_plane.h  | 1 -
 5 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 1d6051b4f6fe..414c9973aa6d 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -351,7 +351,7 @@ static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_cursor_late_register,
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index d1a35d97bc45..3db3768a3241 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -905,7 +905,7 @@ static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_gdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 3c61ba8b43e0..2201a50353eb 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1283,7 +1283,7 @@ static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_hqvdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 3da4a46df2f2..173409cdb99e 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -112,12 +112,6 @@ static int sti_plane_get_default_zpos(enum drm_plane_type type)
 	return 0;
 }
 
-void sti_plane_reset(struct drm_plane *plane)
-{
-	drm_atomic_helper_plane_reset(plane);
-	plane->state->zpos = sti_plane_get_default_zpos(plane->type);
-}
-
 static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane,
 					     enum drm_plane_type type)
 {
diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
index 065ffffbfb4a..8e33e629d9b0 100644
--- a/drivers/gpu/drm/sti/sti_plane.h
+++ b/drivers/gpu/drm/sti/sti_plane.h
@@ -81,5 +81,4 @@ void sti_plane_update_fps(struct sti_plane *plane,
 
 void sti_plane_init_property(struct sti_plane *plane,
 			     enum drm_plane_type type);
-void sti_plane_reset(struct drm_plane *plane);
 #endif
-- 
2.35.1

