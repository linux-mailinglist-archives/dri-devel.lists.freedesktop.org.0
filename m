Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674BA26D9B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403A10E5CB;
	Tue,  4 Feb 2025 08:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=beims.me header.i=@beims.me header.b="nJiKzJpD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="q61s0vZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0010E54E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:31:12 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 58A96114017A;
 Mon,  3 Feb 2025 14:25:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 03 Feb 2025 14:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1738610737;
 x=1738697137; bh=2Hgo1jRUZ9s9TXxYIqNPV38Gn6KA2bh3Lhj0CvQNpgQ=; b=
 nJiKzJpDhFyd34EVjkRUO9OS3PqE/WVvVA3/lYZc3KHiaYRgcB06jdMBB3tQaWmd
 jxkrtl7KhCaZy15qwh8JT+1Nj4YEU+NDIsrkIQe1QwZf0+gLNAq27SChC+prSfQX
 7E17+u1/HeYpk0fPB7uvc/xVTupDiposcy1bFyoADnExGE4wI0l+IoBQfKxRBCIq
 wKg+TK1XfITaCWNdM3wCUpiaX9UhireUa2TyFPbwzGhvykk9GnvMgxUbrm4ve/3F
 b3RTvu/D0dZutyMNsNXoQ9haeZ4s84tCSzqQwgPZPykR+6LpXkipZxAti+vuOvjI
 mqKfwzsxnLMvSU9y059ZYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738610737; x=
 1738697137; bh=2Hgo1jRUZ9s9TXxYIqNPV38Gn6KA2bh3Lhj0CvQNpgQ=; b=q
 61s0vZawASRcLa7egkJZDWnb3Dj1Y64QhJUJ2bQx8yxUveZrJdiy/JLbtEdwO0mN
 pBpKJeuajilHLeIhFutEJI5kw2PhV08eDwlBYpE+0r9nAwKoZGXuU2fWOo45ZfPi
 GIYgyH2oUFgY0mXLYW6u6dr3znIKGvT+M+3MqKUgroL3Q+pGlk1X0xyc9nW2J5ed
 t8wS/3dKJjlfnddFXtyWRC/6zzhknslfljkVo8tF0NGCYRmpB0Exj0R39iqIrOB4
 l0SHNVptBUfQ/2FMwTcJ/CrT7eZMLsh/MMAV2Kr/yuXgjsYbGD9O/KWPU+pdvnNC
 Q+v4D16bywxvMLOe4FUVw==
X-ME-Sender: <xms:MRihZzqOSYRHjLRpCSWRnLROgOEwAW5_8OdQ_9fP9zhVTfwXPATfFw>
 <xme:MRihZ9rGhxpnBXf4-PUtc9jg3isgMgMjuERxSJzPpq45O5Ny78s_JWtHm5oTSM3NV
 TU8TrltB4PigJXqZwQ>
X-ME-Received: <xmr:MRihZwPfz5wQOk6KU119BhzKe1xvwfUme7i-YNfgNj6edOFGjVMLEGU4VVkMbQW4Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
 jeenucfhrhhomheprhgrfhgrvghlsegsvghimhhsrdhmvgenucggtffrrghtthgvrhhnpe
 eggeeffeegveffleejtdeggeetgfffueehgeegtedvgeefudevveehheetvdehtdenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghfrggvlh
 essggvihhmshdrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtoheprggurhhivghnrdhgrhgrshhsvghinhesghhmrghilhdrtghomhdprh
 gtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthht
 ohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhope
 hrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhn
 tghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsh
 eskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhm
 rghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlih
 hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghl
 rdhorhhg
X-ME-Proxy: <xmx:MRihZ24Shvz7DHqBS8BtGP8meqzyLjwkHRFwtqtyZl8bmTbmJX0QEQ>
 <xmx:MRihZy5xUJdxwXpEMaQwCbx6XcBVzXb_64phOk3GNUIkwlRLQCKPXQ>
 <xmx:MRihZ-ggPm6xwiJVnifaQE4IxnQvx-DqVy22XksGvlUrA0tp0ljurQ>
 <xmx:MRihZ04Egrr8_UKi1dpL92goBtbO2khOi4csOIRewH_AlD_zqjlqow>
 <xmx:MRihZ44gglIyra6qfsWAKtghpnywUpN53CS9293PWO65NhkNO51NpVge>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 14:25:32 -0500 (EST)
From: rafael@beims.me
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Rafael Beims <rafael.beims@toradex.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: lt8912b: Add support for audio
Date: Mon,  3 Feb 2025 16:23:56 -0300
Message-ID: <20250203192401.244651-3-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203192401.244651-1-rafael@beims.me>
References: <20250203192401.244651-1-rafael@beims.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

From: Rafael Beims <rafael.beims@toradex.com>

Add support for HDMI codec with audio coming from the I2S input.
Support 48kHz and 96kHz sample rate, with 16 bits word size.

Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
---
 drivers/gpu/drm/bridge/Kconfig           |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 107 ++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa..489ce1041203 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -117,6 +117,7 @@ config DRM_ITE_IT6505
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
+	select SND_SOC_HDMI_CODEC if SND_SOC
 	depends on OF
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 52da204f5740..2100b41e5f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -8,6 +8,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/media-bus-format.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_probe_helper.h>
@@ -16,6 +18,8 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <video/videomode.h>
 
 #define I2C_MAIN 0
@@ -24,7 +28,10 @@
 #define I2C_CEC_DSI 1
 #define I2C_ADDR_CEC_DSI 0x49
 
-#define I2C_MAX_IDX 2
+#define I2C_AUDIO 2
+#define I2C_ADDR_AUDIO 0x4a
+
+#define I2C_MAX_IDX 3
 
 struct lt8912 {
 	struct device *dev;
@@ -38,6 +45,7 @@ struct lt8912 {
 	struct drm_bridge *hdmi_port;
 
 	struct mipi_dsi_device *dsi;
+	struct platform_device *audio_pdev;
 
 	struct gpio_desc *gp_reset;
 
@@ -226,6 +234,7 @@ static int lt8912_init_i2c(struct lt8912 *lt, struct i2c_client *client)
 	struct i2c_board_info info[] = {
 		{ I2C_BOARD_INFO("lt8912p0", I2C_ADDR_MAIN), },
 		{ I2C_BOARD_INFO("lt8912p1", I2C_ADDR_CEC_DSI), },
+		{ I2C_BOARD_INFO("lt8912p2", I2C_ADDR_AUDIO), },
 	};
 
 	if (!lt)
@@ -754,6 +763,97 @@ static int lt8912_put_dt(struct lt8912 *lt)
 	return 0;
 }
 
+static int lt8912_hdmi_hw_params(struct device *dev, void *data,
+				 struct hdmi_codec_daifmt *fmt,
+				 struct hdmi_codec_params *hparms)
+{
+	struct lt8912 *lt = data;
+	unsigned int audio_params = 0x08; /* 16 bit word size */
+
+	if (hparms->sample_width != 16)
+		return -EINVAL;
+
+	if (hparms->sample_rate == 48000)
+		audio_params |= 0x20;
+	else if (hparms->sample_rate == 96000)
+		audio_params |= 0xa0;
+	else
+		return -EINVAL;
+
+	regmap_write(lt->regmap[I2C_AUDIO], 0x0f, audio_params);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x35, 0x00);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x36, 0x18);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x37, 0x00);
+
+	return 0;
+}
+
+static int lt8912_audio_startup(struct device *dev, void *data)
+{
+	struct lt8912 *lt = data;
+
+	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0xe2);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x60);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0xf0);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x08);
+
+	return 0;
+}
+
+static void lt8912_audio_shutdown(struct device *dev, void *data)
+{
+	struct lt8912 *lt = data;
+
+	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x00);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0x00);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0x52);
+	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x40);
+}
+
+static int lt8912_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
+				      struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port != 2)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops lt8912_codec_ops = {
+	.hw_params = lt8912_hdmi_hw_params,
+	.audio_shutdown = lt8912_audio_shutdown,
+	.audio_startup = lt8912_audio_startup,
+	.get_dai_id = lt8912_hdmi_i2s_get_dai_id,
+};
+
+static int lt8912_audio_init(struct device *dev, struct lt8912 *lt)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &lt8912_codec_ops,
+		.max_i2s_channels = 2,
+		.i2s = 1,
+		.data = lt,
+	};
+
+	lt->audio_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+						       PLATFORM_DEVID_AUTO,
+						       &codec_data, sizeof(codec_data));
+
+	return PTR_ERR_OR_ZERO(lt->audio_pdev);
+}
+
+static void lt8912_audio_exit(struct lt8912 *lt)
+{
+	platform_device_unregister(lt->audio_pdev);
+}
+
 static int lt8912_probe(struct i2c_client *client)
 {
 	static struct lt8912 *lt;
@@ -788,6 +888,10 @@ static int lt8912_probe(struct i2c_client *client)
 	if (ret)
 		goto err_attach;
 
+	ret = lt8912_audio_init(dev, lt);
+	if (ret)
+		goto err_attach;
+
 	return 0;
 
 err_attach:
@@ -803,6 +907,7 @@ static void lt8912_remove(struct i2c_client *client)
 {
 	struct lt8912 *lt = i2c_get_clientdata(client);
 
+	lt8912_audio_exit(lt);
 	drm_bridge_remove(&lt->bridge);
 	lt8912_free_i2c(lt);
 	lt8912_put_dt(lt);
-- 
2.47.2

