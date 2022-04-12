Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D54FCDED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813010EDDB;
	Tue, 12 Apr 2022 04:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5DF10EDD6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C28F83201C39;
 Tue, 12 Apr 2022 00:28:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 00:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737717; x=1649824117; bh=hg
 4vbwwgDxCoO0JjkQYHi3molBTd0nVF/MYYM4L3YxI=; b=sEVhfneTaVZpNGbR53
 PgQ9MgUDwDYOWd+v7g5fmIntzt8nipoGQnGquENyGX6cAcEizt+csBJt9EAe5Cbf
 LzCZR5dzsV0KWeKqhMaCLIn4i9884wMNwPvhT51YTt1LfwBkIU35dQ5VbqGZ3IVf
 ojO3Ld+ORQsgYH9GU6Ctzl0l7MUdqcdkKp/2c2mfrp60bEaZ/3d3qmg67B6uL95F
 zqc97TmU/Xnnytqe0ngkxsMBmi1TZy+SlMQSXkRDPH8oF4nCFhrEJKyzFIMoM5rV
 BIXd4MlfFJVGO/7B7hFcS7Jd5NS9FXqc3xsf45Kmg8wucpER7v2XDP0WJpfxbj30
 1qpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737717; x=1649824117; bh=hg4vbwwgDxCoO0JjkQYHi3molBTd0nVF/MY
 YM4L3YxI=; b=moflfF2DF6Lj54o1Gs60WPvFgBr2TCMQ/701ANkZRqscjmUo2Hp
 g09Qd2RnnMSc0PZPqIh89mk2K2tjxRRkX9WP3ZnSiK0iGPW2V95ADBRE5kMlY0gB
 yw6zQ8HMlCYyLIN+lWiXX1FqY1vnughbAlPsO85sKs1BNRjV9rpyW1yDPExEesuG
 /sqfPtx+4iZhtR+G4/K/F3uKz1CI0NWLHjdMhY6xTPJyiS1oAPRkb8aDdrQw082b
 rd97aD26M44LgHTl0ySbzxoD02ff56nEp05hteOfanib5cKEvStZilUn5+uVOSe1
 66ne7x3BOy16fX9xZArNB63eE1w9ObUmHGg==
X-ME-Sender: <xms:9f9UYgY8v1CMnqt5J7Ee9_9Wpu7lidVQGWa6CJPP3IUcWNmHuYqwWw>
 <xme:9f9UYrYO2AIBY7fGiRyH6vcVVIlj64CNyFlNkMu54SZcF-zIkt01o-a6oVBV6Q9Yl
 QsfuvPY7G1bhQshmQ>
X-ME-Received: <xmr:9f9UYq8fXq5zLSGnlAd_w2cx06L9Tq8YSQIewQ06qHNjsmW-sgMP5q_xN2JxO5AMi-AO6qxBgv4rFbYzGC_s8UpvY9TTx_ZHh5X5FBUxyK6qPaOYyVrbSmtjhlVTwzmoyoUt4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:9f9UYqojwgobPuBCJ0o_T9RS7eTCAqc7bQ1uRweaq30FqPpNy4N6Rw>
 <xmx:9f9UYrqvr4m7gOLKyp9aBZI19dD7LlJIjzthB4AM9sjp7QmAacqAlQ>
 <xmx:9f9UYoSKDUR7FJDUnyCPLQioRuzmjTMU1FmdvS1kal1jESEDQeM7sA>
 <xmx:9f9UYkRG6-RhyUQykOd-5EJ5y2-P_92nxHWJHd3pi0zMpzrGzU7Jkg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:36 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 09/14] drm/sun4i: Allow VI layers to be primary planes
Date: Mon, 11 Apr 2022 23:28:01 -0500
Message-Id: <20220412042807.47519-10-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

D1's mixer 1 has no UI layers, only a single VI layer. That means the
mixer can only be used if the primary plane comes from this VI layer.
Add the code to handle this case.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Use Jernej's patches for mixer mode setting.

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bb7c43036dfa..f7d0b082d634 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -542,6 +542,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					       struct sun8i_mixer *mixer,
 					       int index)
 {
+	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_vi_layer *layer;
@@ -560,12 +561,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
 	}
 
+	if (!mixer->cfg->ui_num && index == 0)
+		type = DRM_PLANE_TYPE_PRIMARY;
+
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
 				       formats, format_count,
 				       sun8i_layer_modifiers,
-				       DRM_PLANE_TYPE_OVERLAY, NULL);
+				       type, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialize layer\n");
 		return ERR_PTR(ret);
-- 
2.35.1

