Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF05853C5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECE010E649;
	Fri, 29 Jul 2022 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BF10E106
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF8A9580993;
 Fri, 29 Jul 2022 12:37:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112638; x=
 1659119838; bh=DRj0o8o77hO3EzoMp5SRtKxDnHiE4KTCCM8ByWQjBPA=; b=d
 +1SsrAbv4kBuNb/ABYMfTZZ4Z3x1HCQ0ubMEXeZ5ddjHEUtXOqC/7ls1nlSqsttP
 XOhMkxmK+VvnKtuFgswgbQgehpQhZNNbljIGUu3+Dj4XlZvx6A+wHh3MN2iO1+S0
 Z7pXqOjg/w34ViXEFsDKIdY/ba2ieh8n+T0BKEmcZS3elp2rhIXii2zXNpJtWHYu
 CYpyIJ9fRuHJONMgVn1C1nW7yj6EqqpKCCdngxu0Pdi3OwmgsEakj/mQgzvDhyKU
 92jEXQQu/pnxVtFjA/9Mb+weJgjn3kVDxAyd21Q9abjMzmOdk7/1/+dXk08Ud4ZJ
 NXrMBYXeTae/UuQghPNEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112638; x=
 1659119838; bh=DRj0o8o77hO3EzoMp5SRtKxDnHiE4KTCCM8ByWQjBPA=; b=z
 9ri8Sp2zO/Zw11o+M6bfROinlpV914iO3kPypC/CRgp94JA560+Ou6r/6YbB2aTs
 6FOl+hjTnBrDUUmo0Fuls3OSq0VdAFWPiT+kZuAQJZipHvyILvi2asnfzR8tJXlp
 KVR3+/I5Y+InlKTGBoVuiLP1iZPYnv8wZoL/kaVORySQfoj23XDBgD69DeylTUej
 MrlaBvFjg338/KQhxkA9SATPFk7Ne94au5YZUo+AsGfqPw6/y6Vwq5iUyY1hMjDZ
 oU6wtA2OE1YIug32w4BsVIUn1CuF0BxxWKfu7T4K4mN5POn24FfMuSWBxDJB0uKZ
 sBLrKARTTcRmsxlw2y+Hw==
X-ME-Sender: <xms:vgzkYlBHck09p-6tZaJa56Ixwp3fwJkr6-tH7wzlmEqMNYcRqDhmMg>
 <xme:vgzkYjhZcAvLQyvAEOhZM8IPQAWm2rWLGhpizvBSzo8SpsiwbS0NqTpQM-pJSPIfj
 Gs_SH4QD_W038rh5AI>
X-ME-Received: <xmr:vgzkYgml_pWAo3Lh29MpldcFjdDXcmWl89LgCvMN9oTFIUzqs3RwLhoFfXaxRBiH0uR9k7RabacDNNR7Lfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vgzkYvzG4dzm0Z3186IS-VtIxL-9i5BziO6qrU_aWG3w7JuHOj2yUw>
 <xmx:vgzkYqTlexkUnJ85IgN_Vf7Ysjs9x6I_04QbB8OCNBMgzj7QDNSjBg>
 <xmx:vgzkYia7KJYPbXxPqCzY2p3u3k2Wa0urXg9xkVIO-gxkLzjodDF3EA>
 <xmx:vgzkYrC_caXqybA3gsEsJKEdTAQkU3pr0rB8DAbp8aVXdlfMAi7PFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:17 -0400 (EDT)
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
Subject: [PATCH v1 30/35] drm/sun4i: tv: Rename error label
Date: Fri, 29 Jul 2022 18:35:13 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=T/yE0DYpsTv+6dkw5jRLTwJsI3mGSn03diR5FyZB77w=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHi+dgkYH09OSfiepjZqc/Pzi+QKdr2bUfHU4HobV+U
 pS5f6ShlYRDmYJAVU2S5LvjWji8syi2C58NmmDmsTCBDGLg4BWAiqWyMDFPfVD9lWvn3R3Xew4YHa9
 Z3LGp8uGXXfQ8jbv11dcu2vT/P8IfHZ3nDjUPTZj3bGOvf8bo2f57qxL+/zD4r6j1RjLp0vdEHAA==
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

The other error labels in sun4i_tv_bind() are named after the task they
perform (err_disable_clk to call clk_disable_unprepare for example).

However, the err_cleanup_connector is named after the calling site
(drm_connector_init failing) and will actually cleanup the encoder. Let's
rename it to err_cleanup_encoder to be consistent.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 6d7e1d51569a..ad6a3739bfa9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -580,7 +580,7 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	if (ret) {
 		dev_err(dev,
 			"Couldn't initialise the Composite connector\n");
-		goto err_cleanup_connector;
+		goto err_cleanup_encoder;
 	}
 	tv->connector.interlace_allowed = true;
 
@@ -588,7 +588,7 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	return 0;
 
-err_cleanup_connector:
+err_cleanup_encoder:
 	drm_encoder_cleanup(&tv->encoder);
 err_disable_clk:
 	clk_disable_unprepare(tv->clk);

-- 
b4 0.10.0-dev-49460
