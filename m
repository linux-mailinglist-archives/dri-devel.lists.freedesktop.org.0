Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB8B3F896
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E9F10E5F7;
	Tue,  2 Sep 2025 08:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OE9wNu6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF4F10E5F9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C3A34346C;
 Tue,  2 Sep 2025 08:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A02C4CEED;
 Tue,  2 Sep 2025 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802056;
 bh=rt6xHw1/6F4wIZvvIQx12pdyMgsEZs64/BuHhHgoQwY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OE9wNu6Fow/wzbcDKpaesIgEoPQDBgwiy3phinjKnfBpJjNYcFqDTaZHjgx22BYrn
 JuRDoSEXIkqzW0itymk/DH6pMziXluwWwdzaK+iVXOJTtTSQsRvv1yfW/ujpHICsQ0
 q4T+b0VOivpxSLB+1qqJILq4qz0cO96bawJs0sp8Zq+p94icSWLdxcEb76PA1qPFhR
 4Q2iGyB7eCWpA/9EEsruBBG8cW3I8eIZBu1ihtV/lcSFyxxqcQQRnXDTwbQeAFPxXy
 m3U5PqVjikq9gendmC5hS6dHCOJoUY4BJOEDz5UJqXN4CvKvEMtsGwr5WwyA+Vy/69
 /0D9ukBT7+UuA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:53 +0200
Subject: [PATCH 25/29] drm/tidss: dispc: Move dispc_device definition to
 headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-25-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rt6xHw1/6F4wIZvvIQx12pdyMgsEZs64/BuHhHgoQwY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu9vWbVg48IHYQnLPijEmvWE2DJstFfbbHFAdnr2j
 U3qJgwzO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEFu5irE/61DHnc6/J/VVS
 s56FM9Wvz+cTep4wMWl26IcmAfsrE+96Lti571nNreyAyQl9J8/tj2BsuFGn7jBlyck5LZu2met
 f/nS6tM74UY9ewYQeyz1dlZ97/CV37Up1TVi52KFgps8lCxklAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

We'll need to access the dispc_device structure from other parts of the
driver so let's move it to a header.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 33 ---------------------------------
 drivers/gpu/drm/tidss/tidss_dispc.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index ef948e3041e10bc65cf2c4794a4e4cffa7e3fb3a..2f9cf95d6d0525a02d8adaae968aa551b7e27077 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -476,43 +476,10 @@ const struct dispc_features dispc_am62l_feats = {
 	.vid_order = {0},
 };
 
 static const u16 *dispc_common_regmap;
 
-struct dss_vp_data {
-	u32 *gamma_table;
-};
-
-struct dispc_device {
-	struct tidss_device *tidss;
-	struct device *dev;
-
-	void __iomem *base_common;
-	void __iomem *base_vid[TIDSS_MAX_PLANES];
-	void __iomem *base_ovr[TIDSS_MAX_PORTS];
-	void __iomem *base_vp[TIDSS_MAX_PORTS];
-
-	struct regmap *am65x_oldi_io_ctrl;
-
-	struct clk *vp_clk[TIDSS_MAX_PORTS];
-
-	const struct dispc_features *feat;
-
-	struct clk *fclk;
-
-	bool is_enabled;
-
-	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
-
-	u32 *fourccs;
-	u32 num_fourccs;
-
-	u32 memory_bandwidth_limit;
-
-	struct dispc_errata errata;
-};
-
 static void CH(struct dispc_device *dispc)
 {
 	WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
 		(dispc->dev->power.runtime_status != RPM_RESUMING) &&
 		(dispc->dev->power.runtime_status != RPM_SUSPENDING));
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 849ec984026e223de7c8a55a4b5672c2262f38c0..f5d5798de1ba550dedbcba36b1ef41d5ecceaa0c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -95,10 +95,43 @@ struct dispc_features {
 	u32 num_vids;
 	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
 };
 
+struct dss_vp_data {
+	u32 *gamma_table;
+};
+
+struct dispc_device {
+	struct tidss_device *tidss;
+	struct device *dev;
+
+	void __iomem *base_common;
+	void __iomem *base_vid[TIDSS_MAX_PLANES];
+	void __iomem *base_ovr[TIDSS_MAX_PORTS];
+	void __iomem *base_vp[TIDSS_MAX_PORTS];
+
+	struct regmap *am65x_oldi_io_ctrl;
+
+	struct clk *vp_clk[TIDSS_MAX_PORTS];
+
+	const struct dispc_features *feat;
+
+	struct clk *fclk;
+
+	bool is_enabled;
+
+	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
+
+	u32 *fourccs;
+	u32 num_fourccs;
+
+	u32 memory_bandwidth_limit;
+
+	struct dispc_errata errata;
+};
+
 extern const struct dispc_features dispc_k2g_feats;
 extern const struct dispc_features dispc_am625_feats;
 extern const struct dispc_features dispc_am62a7_feats;
 extern const struct dispc_features dispc_am62l_feats;
 extern const struct dispc_features dispc_am65x_feats;

-- 
2.50.1

