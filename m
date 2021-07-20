Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C212C3CFB0E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028656E32F;
	Tue, 20 Jul 2021 13:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4926E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:46:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id F40112B00919;
 Tue, 20 Jul 2021 09:46:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 20 Jul 2021 09:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=oj0uWTcP4eN/7
 CWZDuDel6GfjZzcOM2ouml6hFdmYPA=; b=2UcA+t8Z1Ne7llgHOKoxMJN85t7E7
 Zw8vW751X1WKI3aM+j1A/mn2QmUb3QTZ86GFJohZ4aB0i58ZTREja3DuUNCI8tsA
 R4/qbcOyDD/+pnajpjWU/RbeMfSu8kd6pbubyJzTGB26+PVHLA9HjzFE2dik9Ts1
 RvWQEuTqbMqr+zx7MqjJ1vQPEK6bggmv8wsqR2J/A0+umULvrd/T7/wEYmrC/LBL
 p2frPhzdzXYfgu1nWk6lMo5SaqdKDZm7ZX1dyuMhsilmZwE1N+jPdccLxjcsHW/3
 OfglniPjIvV+ltveQl9UIAsUwzBQZSlDg4WPVYAC0tJyz1IYb0OlS2gnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oj0uWTcP4eN/7CWZDuDel6GfjZzcOM2ouml6hFdmYPA=; b=fQEL1Kxh
 R+4RnVcSaWFI+5xnYRu5NbPJl+NkA0zDFINLCIdSEs+LOTHZPW4DhtKsyKABcYKn
 3hz543/ff4aQJQVkU3pfS724/lW+libLC/dRStCUbLY0/eJoMYr1GqqAeHLSgyGj
 wwYETWosS8BhU+0aO89lkuvcLUG2aW+5YB6w91mdMfvBEi1ZiAirO4Cu7nZMaeVz
 KEvkCQKa0eKvdR9NezigJ7akHd9YM+XUnYn0X1m/ROyNBwQWP9yeIjewJhyA2PRh
 EyTe9xZwynZ7psRAy8Dwafe9Y31/7SujUVBzN9fMzoa8knTSU0kkpfJ7RVZwX78l
 5L/SyKyxVyZILg==
X-ME-Sender: <xms:ptP2YK_RyO3ceGn9GJIQKI0LwWtcLu_4arUOpTCX_TceheGuoOYHqw>
 <xme:ptP2YKudLgLm8lYfPY5t4qZBclKSJk6b0EPo_xQ_fx9Q3xq2oUJBC-SYovWiPpnmM
 p-bjmNXu1_XoMaFZ1I>
X-ME-Received: <xmr:ptP2YAAchWqvqTEb4W2QZVrIAqSkupt-4qB7D2qNoHDlHjb0fFrNg-WKxaHIT7RMaP70tI9-Nn7OrbVaqLk2Rbz_ysoRPIeuTbqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ptP2YCdYuAaFF4eQlb7GHmv1eg6YuPyFldCTVQ0WQo9qRV97wACBGg>
 <xmx:ptP2YPNW6M2CrQ9VMuwUmVotfs0swVzrujiNbzcUWS9MxLkgHEn0FQ>
 <xmx:ptP2YMnz9czHJtyQhMNwT5BPNiepAyDVMKbngI5JizeiPsUXOqhIkA>
 <xmx:p9P2YNumuYg7WcKpeKB_xeg-4xp1pUp4LbK_97U9xeD6r961XcNxCeVEA3E>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:46:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 10/10] drm/panel: raspberrypi-touchscreen: Remove MIPI-DSI
 driver
Date: Tue, 20 Jul 2021 15:45:25 +0200
Message-Id: <20210720134525.563936-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver was using a two-steps initialisation when probing with the
i2c probe first registering the MIPI-DSI device, and then when that
device was probed the driver would attach the device to its host. This
resulted in a fairly non-standard probe logic.

The previous commit changed that logic entirely though, resulting in a
completely empty MIPI-DSI device probe. Let's simplify the driver by
removing it entirely and just behave as a normal i2c driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../drm/panel/panel-raspberrypi-touchscreen.c | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 995c5cafb970..09937aa26c6a 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -483,16 +483,6 @@ static int rpi_touchscreen_remove(struct i2c_client *i2c)
 	return 0;
 }
 
-static int rpi_touchscreen_dsi_probe(struct mipi_dsi_device *dsi)
-{
-	return 0;
-}
-
-static struct mipi_dsi_driver rpi_touchscreen_dsi_driver = {
-	.driver.name = RPI_DSI_DRIVER_NAME,
-	.probe = rpi_touchscreen_dsi_probe,
-};
-
 static const struct of_device_id rpi_touchscreen_of_ids[] = {
 	{ .compatible = "raspberrypi,7inch-touchscreen-panel" },
 	{ } /* sentinel */
@@ -507,20 +497,7 @@ static struct i2c_driver rpi_touchscreen_driver = {
 	.probe = rpi_touchscreen_probe,
 	.remove = rpi_touchscreen_remove,
 };
-
-static int __init rpi_touchscreen_init(void)
-{
-	mipi_dsi_driver_register(&rpi_touchscreen_dsi_driver);
-	return i2c_add_driver(&rpi_touchscreen_driver);
-}
-module_init(rpi_touchscreen_init);
-
-static void __exit rpi_touchscreen_exit(void)
-{
-	i2c_del_driver(&rpi_touchscreen_driver);
-	mipi_dsi_driver_unregister(&rpi_touchscreen_dsi_driver);
-}
-module_exit(rpi_touchscreen_exit);
+module_i2c_driver(rpi_touchscreen_driver);
 
 MODULE_AUTHOR("Eric Anholt <eric@anholt.net>");
 MODULE_DESCRIPTION("Raspberry Pi 7-inch touchscreen driver");
-- 
2.31.1

