Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FF168F82
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00476E926;
	Sat, 22 Feb 2020 15:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898D16E91B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:52 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE0B81C51;
 Sat, 22 Feb 2020 16:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383710;
 bh=Yo85sZP57fb9tqz7qHk6MLEvsc6dLg0oxfoFCoh4yyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OcPv54xRDtrbav6QjBl2v8bdjMms6sx8wGy0cpDJkhY5JaqAvPg5eSY5389s+5VEL
 gu9B3vlY0SKy/UtqN128jDExSFWbh3GEpC08W2Ko78uFQb9zuj51goUS/DdsSOQBYc
 PJGLqfIfZMriDbcSB8fiat8mrPPQLIPda6iBSvnk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 14/54] drm/bridge: simple-bridge: Add support for the TI
 OPA362
Date: Sat, 22 Feb 2020 17:00:26 +0200
Message-Id: <20200222150106.22919-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TI OPA362 is an analog video amplifier controlled through a GPIO. Add
support for it to the simple-bridge driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes since v3:

- Fix device name in commit message
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 70e6092bdf6c..a2dca7a3ef03 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -305,6 +305,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "ti,opa362",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_Composite,
+		},
 	}, {
 		.compatible = "ti,ths8135",
 		.data = &(const struct simple_bridge_info) {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
