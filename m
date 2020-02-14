Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F959160CDB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF8A6E54C;
	Mon, 17 Feb 2020 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483FA6F903
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:24:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B3A9C7352;
 Fri, 14 Feb 2020 07:24:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aGIlfA2KuBAok
 WapNsxvxuUq+3OyrK2C0WS49FNUGu4=; b=tUVxtqrh+vW/O2BpQj+bR9+uhbZPd
 RjCe0jJLlss1RVaLKUAyd5JM9rv6a79cHUJatJfwAJZxJOA1gyTylKKtglYHNntl
 ikL+X2ThGq/5hvjDk9wwC/ZY2Gw5QjHMccH8zJAAqnrB/zLMiWqKwtuJpn5yl2Nc
 3GFuiupwc3/Yw8Epp6dzR9QAF5oeuGbtdmTfS7s8pV0gI6w5/2na9VXkhq49hU6J
 TgspOkIPpZMdd3b61kOohpUUoxOopEQ1mzwwUByeLzMlBAgEH87osj19/PJcO3Q1
 edlxfw1g32sCH0Al41pXOOBVkp/3Onhn69eLVh0s343SIX61pNdFtqcYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aGIlfA2KuBAokWapNsxvxuUq+3OyrK2C0WS49FNUGu4=; b=U6HoPEPH
 k5ZpvAkq40wNODLGmqWtZlTHImZwFZWPlu6GJoUTUkUzruh09ULKlzRAJkB4PhQg
 ddlewVly7VXFAC7CG3qrLr6RwIektH7Ln6xPco0Nh/DFUlaSepGhwbMxfE2+g+OI
 9qPaKKsBI9lVbX+F+XyvbH3IM5gFY1/Jic19yH8ybzmSsX4U/iNH0fGHuc0gf1+D
 WmqS/RH4nqcjyxoXhboEaPz3VmhWNqhTXwflF5r7GXOBeoHpjkl6uD4q2Fd42jfD
 wkqIQyoKC6vtGKVwiYlvfq+QD7Vf+n+clpTh+5//NdvwfnfFjNJz/trYdIXR3cMk
 m+LFhvhCA5GtAA==
X-ME-Sender: <xms:kJFGXnj3Tewq_HMV-xwPvLWFuU5krV-iib8MpsDZTfk6K3_UlRr40A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kJFGXlRKglcr9Uy1m2LmnuruiZJMviq-OX65GcZBKQExG3_x2bFp4g>
 <xmx:kJFGXvgheTHC0eJRs3zCIcAAr0R_kjJxFVeHxRX5DIrcsQAyrHpBZA>
 <xmx:kJFGXqdXKZho5XVpF5Nank1fXsShs6SHz0VCptx-G6n0Z8qECn95Eg>
 <xmx:kJFGXnwr2qMbb1zYOROgntbivBlGYj31nMc0Uwo0fnuqLk_m-H-FrA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51D1E328005A;
 Fri, 14 Feb 2020 07:24:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/panel: lvds: Support data and clock polarity flags
Date: Fri, 14 Feb 2020 13:24:40 +0100
Message-Id: <bf302a84ca3ce9c4f83293d33e43925a9d7aeac9.1581682983.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree properties to the panel-lvds driver to set the bus
flags properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/panel/panel-lvds.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5ce3f4a2b7a1..c0d6dcd9e9fc 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -31,6 +31,8 @@ struct panel_lvds {
 	unsigned int height;
 	struct videomode video_mode;
 	unsigned int bus_format;
+	bool clk_active_low;
+	bool data_active_low;
 	bool data_mirror;
 
 	struct regulator *supply;
@@ -83,6 +85,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 {
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 	struct drm_display_mode *mode;
+	unsigned int flags = 0;
 
 	mode = drm_mode_create(connector->dev);
 	if (!mode)
@@ -96,9 +99,23 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = lvds->height;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
-	connector->display_info.bus_flags = lvds->data_mirror
-					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
-					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
+	if (lvds->data_mirror)
+		flags |= DRM_BUS_FLAG_DATA_LSB_TO_MSB;
+	else
+		flags |= DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
+	if (lvds->clk_active_low)
+		flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
+	else
+		flags |= DRM_BUS_FLAG_PIXDATA_POSEDGE;
+
+	if (lvds->data_active_low)
+		flags |= DRM_BUS_FLAG_DATA_LOW;
+	else
+		flags |= DRM_BUS_FLAG_DATA_HIGH;
+
+	connector->display_info.bus_flags = flags;
 
 	return 1;
 }
@@ -159,6 +176,8 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 		return -EINVAL;
 	}
 
+	lvds->clk_active_low = of_property_read_bool(np, "clock-active-low");
+	lvds->data_active_low = of_property_read_bool(np, "data-active-low");
 	lvds->data_mirror = of_property_read_bool(np, "data-mirror");
 
 	return 0;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
