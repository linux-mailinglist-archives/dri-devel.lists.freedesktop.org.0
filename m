Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884885853E6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BFD10F72E;
	Fri, 29 Jul 2022 16:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59D10F48C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2FD86580970;
 Fri, 29 Jul 2022 12:37:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112631; x=
 1659119831; bh=+5E38+xZJMqYKmGrfI9Nt4r8XFy7N2jsoRvZqx2cZ10=; b=r
 BkenR+XksQHlSX/BAJw8y4H9rzdmqEcwi3Zm6ynYruJpbMytDehshtuhaofk6php
 gUwZM90D23gF8NWtjhHFzrJQp7A1tYfgLLFvgxUMYUVW/0EVUMUCEoF/o9EIAGOC
 ipZVNIAfdGNnkRHNU9s4qrgOdyukxZwQuhcnb7WTDMxOYNIlVXtRKegdUspasLK7
 Nwd0FsFMdYAh+YuSwkraSgi1r8pImZt+2zaDYIxGD76x3gD1lq4AokYesPW3OQO7
 iMeN3Y8wwWdq8N0FtS/9nYEQpdBoqfeZdUSe1TYAj+QxX6k/PxE3FtgSKB2UDx1K
 4Kfj/9FXQeybOMP8nIsUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112631; x=
 1659119831; bh=+5E38+xZJMqYKmGrfI9Nt4r8XFy7N2jsoRvZqx2cZ10=; b=g
 nEIAYE8TviTyA201GDG+dm7FyhztchoT8Zu9rL9CMkGHY/3QZj46Ahkxmqj+k6Xl
 0KWOxPLxGVVwwE4Rk+di2QZaXpC7e6URMnoy5RXDMZ5VunE5kLCxEQtbGBrVLpL1
 oV5WuYF39FvSZo7fGDppd4mjvhKxLp3JZMH852yQcREjThxlWrOz6v+ORLU+h1cx
 NRrok7OPAUn+TsFgr9T4lJZjwWwntroQsoyVPgCSjuNfWcIbzHRR7Mtk1O8n+rCr
 gYcaNzKDxgTQTcsEzUhBRfr23CphG0Qn0pJ0IikRl98ppb3b41zrImBOYvUVG9B7
 P2KxKEor8BJnamtOSUgww==
X-ME-Sender: <xms:twzkYrMuM1H3ZFZonv0WFWL-HoXMwPvfB_SBc8fLdsUnS_1ciASmUw>
 <xme:twzkYl_QuR0QVXanqdkezR1szSwCxV6Hh_Tl2DYLK6rR62bleqvauAWDRzuI2Z594
 yhMq4zdBAvebJpMPq8>
X-ME-Received: <xmr:twzkYqRqRwqu9mZufCv3KLMhM4xOzSmq01S5i8Y2oKVtEUHd5tuHVhXnj7elFV_PJso0xdKRs3QoKD8ZMbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:twzkYvsrS1Yol3B2iXCkaS9btSxHBZxl_EWGgLCbjgEAicppKPF0qg>
 <xmx:twzkYjcALbnjOIL2D9G84ykFQKX0dHnjr6xfNAsgkOL7wlDqPshTqw>
 <xmx:twzkYr0d9atXIUHTF0CqMBQ7uc3FGD68_b1UnL_9hffDL5cfbKx1Rw>
 <xmx:twzkYstuDCwRyBez-c3qXYvf5OtfDt1Be6XjAj_lMC-25Jr8rNaasg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:09 -0400 (EDT)
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
Subject: [PATCH v1 28/35] drm/sun4i: tv: Remove useless function
Date: Fri, 29 Jul 2022 18:35:11 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-28-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3TBhnmWcnMOIjFQ9wN7h7LBx+REzOKQhe2V3iuF2js0=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VEK2xdZHPRYpTL3Qf97rhcTp6zhmb9r7bzt64M7SvPS
 +LcydZSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjARvlcMf4WfyB5WPrfr34tNPdpW5b
 8uvpx4IUghMvV+nfEhH8b5JhUMf4Vaalo8H/MpnGNdMu934fsbPG/lXx92Xzat9M+Xtpq3PB8A
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

The drm_connector_to_sun4i_tv() function isn't used anywhere in the driver,
so let's remove it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 3944da9a3c34..52bbba8f19dc 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -275,13 +275,6 @@ drm_encoder_to_sun4i_tv(struct drm_encoder *encoder)
 			    encoder);
 }
 
-static inline struct sun4i_tv *
-drm_connector_to_sun4i_tv(struct drm_connector *connector)
-{
-	return container_of(connector, struct sun4i_tv,
-			    connector);
-}
-
 /*
  * FIXME: If only the drm_display_mode private field was usable, this
  * could go away...

-- 
b4 0.10.0-dev-49460
