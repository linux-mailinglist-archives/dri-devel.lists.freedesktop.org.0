Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37E4AC5CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D1E10F76B;
	Mon,  7 Feb 2022 16:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1313D10F76B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D93D5801E1;
 Mon,  7 Feb 2022 11:35:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=EwNtqwTz4wJMKViqLw0g5DhuPbcVe3
 1YFuSiAGaRGSQ=; b=Csgb2OuGWPA1xTWxg6M7/jOB7wsmuAePCO/NlXwZUY2w/7
 lr/JxT95F8xpKzviHQlUt+dNxWKX2KIIlzcmJu4JIYH2fatmGoWNy849VR9jauva
 VNG4ECXwUYmJojraifpXCzErOKHiEtgD+2xFZO1VOUWfa33HtdC4TKtLrLNGdc35
 8sq6JiNd6oB3BR5un2vZSEK02SA8NS/x5ZlDMTTcNDrCYyzsfWJO1yxJcWor/1Uj
 pH4DJcVV9HNOyun9+iR5DnbBy9xzbh64dyu1MzY0X6pFSr/3mu16FWL4nvLDZYfE
 nEJn+iuQwnq8mTbgOiKWevb/JLbGj8DdEasQjkMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EwNtqw
 Tz4wJMKViqLw0g5DhuPbcVe31YFuSiAGaRGSQ=; b=S8SomocG97/Ygy0Scz6MSH
 wLPbOkw6LM0xcwddWLPyAwMLX/AB3SYju5xh9Tn++8e4ZgASipOxB0ASfXDvJliW
 KETZvVhyFayfB4aNyg0TkW4RbY/UtXuzXNSZa74gkEMxhQ8yrOxQDcmGSiXm85RS
 q/kUiPk8N0NDOJmGVXP2R2NWFjaLdwvG8rAONIlY/5+Flr4xrikImFnADVgnEHgA
 QjU2bxNr7O0e3LcGoDneON9uGSYSS9Osk3YZKNxopQ40Ww50XKBxL8psc4AiYoDo
 lZjiEAhL2Zp+QtrQIIrkEu26IN0jIyb0BwXbeOXtew8TmpeJ/qiMj0prSAWt9DkA
 ==
X-ME-Sender: <xms:XkoBYip6rzXjyllpJMhW5vbuA8AiIfsw55c-X1a-zhN8YHH4RFk2Bw>
 <xme:XkoBYgrcJtZ8-nrGsdfDZwgoSnyvzEp6yW-3MmFLPuQb6trbJ9d3FTe5GxpSz5v2K
 vFtYoE4fHTDzJxCbA0>
X-ME-Received: <xmr:XkoBYnME1ZT9dEGxl8MmU_liBoIE69s-sFkrvOohZeN3cuBoI_d0lpti4Htn5zuIho9aMdiiDlt7_Ax1bwB_2t07fiY6mbjuj491jV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XkoBYh6jmdmTMO5pRtj7ICPsPTCiXHLgxUgz5lo9zlzhgqdGZ2Z5PQ>
 <xmx:XkoBYh4s407WNWqV4Yd0-ZYWhUeweZXUC5RsjleYc0h3G6qW43XlUQ>
 <xmx:XkoBYhhZ6-BUFOTVmwyio5Gy_JRPyLMRbm-l9ZmRvOEERfF0bGTC8Q>
 <xmx:XkoBYtjh6Y-QMlaJeTNT-zfplHojq21Qh-9KF-thLTvYju-orUW_jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 08/23] drm/tegra: plane: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:00 +0100
Message-Id: <20220207163515.1038648-9-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tegra KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index.

Since the initial value wasn't carried over in the state, the driver had
to set it again in tegra_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index ec0822c86926..a00913d064d3 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -25,7 +25,6 @@ static void tegra_plane_destroy(struct drm_plane *plane)
 
 static void tegra_plane_reset(struct drm_plane *plane)
 {
-	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_plane_state *state;
 	unsigned int i;
 
@@ -38,8 +37,6 @@ static void tegra_plane_reset(struct drm_plane *plane)
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		plane->state->zpos = p->index;
-		plane->state->normalized_zpos = p->index;
 
 		for (i = 0; i < 3; i++)
 			state->iova[i] = DMA_MAPPING_ERROR;
-- 
2.34.1

