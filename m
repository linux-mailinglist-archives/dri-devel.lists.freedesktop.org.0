Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A07406CB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A46E9F4;
	Fri, 10 Sep 2021 13:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D780D6E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:09:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C00052B012A6;
 Fri, 10 Sep 2021 09:09:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 10 Sep 2021 09:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=foGgf4V/HXkaP
 7N33tq+jhHErQtWL7Z9BGtAet+z27I=; b=LKhgWSRFkIIsq/dG12LOeNfVg8U8k
 ePm/Rq+vb60VSLQzpOjNeEd6MsAMgo+s+GVUx3N1FVxCx6JnDzFyJ5pVy+0U7lI1
 cea9iqGdFOZWVsWDL1PQ6hh+7j1mRG85WRKdRkwRAbwjdmzd3SynAzEpN0CqVRYQ
 aq95Zw/2diP2EwZ1r4Wvh+t+CqgLuXNcliqOW4wRAp6J/fyHvl4XP5nDMrMyX2kg
 ddRvpqV0bqCUdY61O/ERBDL7mz0aMJv5T/pUQkQ4WOgyMJEqvRCDelPalcL8hKML
 FAdT7DlTfHGBnRl9J2oa522XdhXo+J8uOhQtkHPHgThfywKbk+qyZnCwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=foGgf4V/HXkaP7N33tq+jhHErQtWL7Z9BGtAet+z27I=; b=BlHnIi76
 OkVX1M9BaXvCg9sAfie2Q3UsGsNC8o2D5NRffvyeWF2e8+GxEqwqNG5UyNEd/hgM
 aZKKz5T8faKVhBxee/yMB81h1xoZu4oY4mFdeYMZ0R7UDy9sEp5wqUrR9yidWjr3
 rdeestSlCYy7d7gZPD1+vuDLVyXI2H7fkkgrQz3qD7OqqPD9NCLG1U/ITh54/+r/
 DFJBvXb7t0VAH9lPd+mCZ+yx7QQ8d1+nVGLfPf0V57UpMRAWW4sTli1U5jMeZEsY
 iUCb7kSD8Kq2/2yulTfQ0aOLwcpaPXqDhLd/y4xrR8XFUrV2OdCNPmItbB18sDC8
 Y8WFDre7E6P/AQ==
X-ME-Sender: <xms:I1k7YQhT9yuUASYx5qh3yncUG3QALSLPteGxzGVY6WU7ra2Wt-clxA>
 <xme:I1k7YZCmPbA7RPsnlz5ItilnsboBVIxI46HQV0ky11QBvz5UpcStGU9b-HNc9EWoO
 rxk-8SbmaOKFLf9hXQ>
X-ME-Received: <xmr:I1k7YYGjBdJ7d5FCuE-Wf_AdS49etJ0HnzG3n5-fjpD3NN59AmXDB0XsNnrMz-VTR2Mf3RKD_pzEVC3qPxRU8YgPr1u95kMl9oSf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:I1k7YRTwG1u5tWawwPuH4Y3EJMP5t_gktlXJf2K0nupNnFLiZZhADw>
 <xmx:I1k7Ydz0SsvKn-t4CTqXnEr_ztBCw1H54Q6kOeQzMgv83chKIuK2sg>
 <xmx:I1k7Yf6Fnur-aRfbvIcIoxq7ZWwJIQQmLv-WHkcHCbaexOoRnlSTeQ>
 <xmx:I1k7YSp2CDha8izUuR765CyikjfRZ2j9SoIDq-1pR35_H2HgaFdQrFwAzZY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 09:09:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vc4: dpi: Switch to devm_drm_of_get_bridge
Date: Fri, 10 Sep 2021 15:09:40 +0200
Message-Id: <20210910130941.1740182-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910130941.1740182-1-maxime@cerno.tech>
References: <20210910130941.1740182-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new devm_drm_of_get_bridge removes most of the boilerplate we
have to deal with. Let's switch to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index a90f2545baee..c180eb60bee8 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -229,26 +229,19 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
 	struct device *dev = &dpi->pdev->dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	int ret;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &bridge);
-	if (ret) {
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.
 		 */
-		if (ret == -ENODEV)
+		if (PTR_ERR(bridge) == -ENODEV)
 			return 0;
 		else
-			return ret;
+			return PTR_ERR(bridge);
 	}
 
-	if (panel)
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DPI);
-
 	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
 }
 
-- 
2.31.1

