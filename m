Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259EE5853D8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F951120A1;
	Fri, 29 Jul 2022 16:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D88113830
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED3FF580998;
 Fri, 29 Jul 2022 12:37:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112642; x=
 1659119842; bh=z4dxjRqvnKjKZwixc6luRyBYXpbYzQTl9ZlCu9EH/IU=; b=Q
 qP2/0/C+YlMyNU+sk1Kdeqo8bSQ3lwkno0QIHBxNQSNZqNIFKHzXaPKP0itf1aOY
 3CaBxbDIE+F9pk1CipIetvq0DmMiqzryDtJDyFJSPd7rMuYxSyqfmN5tZKLai+Xg
 OlkjZ+0mwPPvkoD69fS/IfG5QxNeK3HtKWWjfZ2/hQjvaI5p5tgE9lV20uJCorvg
 R8ikZVCpbRzxRUM/JIoU7GGxsWy+UXMOt7tt35meCMWI4LgRBNgHCVOoMZjsfi6w
 GICVRAKcuPVqHePSvUohIfxsCye9MJmCjzh2c5r2K5eoZkkr5XxUlT3R5GfI3MXo
 zQdaw3D7wInlLeM2mRVEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112642; x=
 1659119842; bh=z4dxjRqvnKjKZwixc6luRyBYXpbYzQTl9ZlCu9EH/IU=; b=W
 7oJFQyOa/ClnJErQ7+wP0S9yo2XmGYZdadbj0KKqNKw0fL34M3v9inLPmmJe+L5D
 6PqOM9oqJ5dHASzIgQjGwvng/K/G0J9vxY/HuExgrmSa38DQYj7iiKEHEBFOUiOK
 xRNRXUIcv1jYF+KmOP6VrX21CBhXQlfFtvgO7vbg/JoXLrvo45boXwhM6oyWN1Zt
 uVO23e3nOM25+kCAhBAEqdhcIg6jJ4y4lYITCaW7LsJJnsoC60LUesJEWsdVPHq/
 vQpY7qZQcuHujD6HZBoQO0Dh8vKCaX7beBBZ1aObKLZhjf9HmMMRPTi/NWzX08OD
 tONJUkWlPSEeBtxSNLgBg==
X-ME-Sender: <xms:wgzkYpLryowbu_hbwlufvXbUH9fQ0bKtJfPOWNHv0FMlb-nHyscWJA>
 <xme:wgzkYlKVmVDFaKfMLMjfbLbjdzyvu4ism_LClPDhPxePkVYBRx4E_WbTUNdIA05CU
 9iVYGYLZAFvJw2lv3s>
X-ME-Received: <xmr:wgzkYhuYhAjDW2PTDfZ9aA5rPkRGYAq0ti57OfksYHeGFuOoK_VWrNx-Qj8q6kVHFu3x6tewEUmVO96hde4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wgzkYqZx5KiYb_AWXWdfxYd5x9ejQ-3JiZ-x4RT9IPpX7fCvxdqsZw>
 <xmx:wgzkYgZMqxy9pZAwkuJyresa9RijHPiJo8uv1Pq9Dvhf6PXn5F4dlQ>
 <xmx:wgzkYuBeq-W962pQXvL2CuOEPIdA6H1Q-LpJbA4W6tKN0ek3j-SR5w>
 <xmx:wgzkYsKjmA3pP2GX3NJUaMY14lm5OgQt__sZAzanSuHE1vqbJFbUrw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 31/35] drm/sun4i: tv: Add missing reset assertion
Date: Fri, 29 Jul 2022 18:35:14 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rG0fPy6TTfoZ/9j5IF0mB2xjJYA3taP2O8nA2ubJBbY=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VGKOrZow3PTjO3hm1/mWvau6GpTXVbIW3fdqLTs0CLl
 JWHiHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEwkWoSR4ea5cmWVmhw+/uYopR1bPi
 RtXqyVws+38MUqU7auiwLhZxgZ7v+QO92VcuqCw5p7uzYv/MAerqZwYfKuqRJXH17O4Chv3Q4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reset line is deasserted at bind, and asserted if we ever encounter an
error there. However, it's never deasserted in unbind which will lead to a
resource unbalance.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index ad6a3739bfa9..74ff5ad6a8b9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -605,6 +605,7 @@ static void sun4i_tv_unbind(struct device *dev, struct device *master,
 	drm_connector_cleanup(&tv->connector);
 	drm_encoder_cleanup(&tv->encoder);
 	clk_disable_unprepare(tv->clk);
+	reset_control_assert(tv->reset);
 }
 
 static const struct component_ops sun4i_tv_ops = {

-- 
b4 0.10.0-dev-49460
