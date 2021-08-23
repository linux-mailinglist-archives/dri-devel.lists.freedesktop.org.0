Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA73F46D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 10:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D3889D4F;
	Mon, 23 Aug 2021 08:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8189CF2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 08:47:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 890AC580C64;
 Mon, 23 Aug 2021 04:47:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Aug 2021 04:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JCU2ehb6Gf4ei
 N1mk9E0FgXqA8oWv65LIeaicebSq3s=; b=ylacWhkaWfGzw653XRMPNB37h0yDh
 q2gK2qJfW8JRjHUunQNPyVrpBb3zamwlMUptSSK0CVSKu5YjYCfJYe4vEQM2j7e2
 nZ2N8rixb18KBpJ2Lo6OQC+13TY21yYSt7PoIbpT289rXJQPALFOZEmIBLI/pTsC
 etih1rt6PfhXCYa8b2+1dxC7rbHGmvGMNiwFdEsacAmqiBLkrS6xLis8W+ICrRuR
 nkiyRFjGPqG923JnQRBNEjIJuEgiwngQ+GH79rz+rUkD/1CY/V/2Gxa7Mibk1xK/
 4ZoECgDxwLPW13+SSL0mfdFrbH3ISEMi6oWOncSB5kYwx45mkyE4WCGhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=JCU2ehb6Gf4eiN1mk9E0FgXqA8oWv65LIeaicebSq3s=; b=E1O212cx
 YCSJAX6eWgXVlLwkL0lANnFILiKI5Dw02Et56BfxlcWoAViduytOev3TPg6TZAej
 0bPg3s6i67zq/m0LP2DLMPMO+xjz1n5yfi7utcnl7AWnRjqzZwgLQIYi6WoWPemn
 yOp7oA/pxvrFz2u4l0AA9vMV1e2/7QIuSn4seBI8Cdt5NaxtJNpnyw9QaajdjLs8
 C53RRUoOkjXjTvEMESTCCUEq+aQhlB5V12m3cVRBtvX9JYZxkGNDJQxQwuOP4oa7
 ydMJGDRQlJmo4f0E9vDH/NQG1jHOu2ITi0MqynXQF8gTrc56ZM8C7T1DV7lNYVte
 mzU0+i/zBmjc0Q==
X-ME-Sender: <xms:rWAjYfgVJttUKcWYIDMmukrREQ8HcFQZ3pcXLF7cTMEgf_hrsqYSjw>
 <xme:rWAjYcBGih8P_OEJNPVqxDKMfe7Kpw-bIWFXiRC04XJH9p19GNf336G3hWnZyJ35M
 7p8x_PcBlTzjJz3F9U>
X-ME-Received: <xmr:rWAjYfH30Fl7XwucOdiqJvfXHTBRDlYfWecST7Ju7ub2MKfL0FbkdlFvj8AMQ2R13TSGiWJGQWRDZJRL24_9qQ3L0RvJknf4aRmS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rWAjYcSDy9FD-hp0FOcPVBKQ8yk86qyu1ZA7OzHo536OvywkCosz9w>
 <xmx:rWAjYcz2_NjISNDK3AA4CXEb5vR7KnSzrliAlOxEI5wJ9CySQr34vA>
 <xmx:rWAjYS75ZpYYKpTkmlAOjv5P6PnQYRg6AoKwZ_GauCTcqEdcTyKtrw>
 <xmx:rWAjYYjEKYxszTZ54j6F60GrU8nsPG6wpjHYpnc4rHs7otrh8O4J2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:47:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/8] drm/mipi-dsi: Create devm device attachment
Date: Mon, 23 Aug 2021 10:47:19 +0200
Message-Id: <20210823084723.1493908-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823084723.1493908-1-maxime@cerno.tech>
References: <20210823084723.1493908-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 35 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ddf67463eaa1..18cef04df2f2 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -391,6 +391,41 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
 }
 EXPORT_SYMBOL(mipi_dsi_detach);
 
+static void devm_mipi_dsi_detach(void *arg)
+{
+	struct mipi_dsi_device *dsi = arg;
+
+	mipi_dsi_detach(dsi);
+}
+
+/**
+ * devm_mipi_dsi_attach - Attach a MIPI-DSI device to its DSI Host
+ * @dev: device to tie the MIPI-DSI device attachment lifetime to
+ * @dsi: DSI peripheral
+ *
+ * This is the managed version of mipi_dsi_attach() which automatically
+ * calls mipi_dsi_detach() when @dev is unbound.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure.
+ */
+int devm_mipi_dsi_attach(struct device *dev,
+			 struct mipi_dsi_device *dsi)
+{
+	int ret;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_mipi_dsi_detach, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
+
 static ssize_t mipi_dsi_device_transfer(struct mipi_dsi_device *dsi,
 					struct mipi_dsi_msg *msg)
 {
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index d0032e435e08..147e51b6d241 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -233,6 +233,7 @@ devm_mipi_dsi_device_register_full(struct device *dev, struct mipi_dsi_host *hos
 struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi);
 int mipi_dsi_detach(struct mipi_dsi_device *dsi);
+int devm_mipi_dsi_attach(struct device *dev, struct mipi_dsi_device *dsi);
 int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
-- 
2.31.1

