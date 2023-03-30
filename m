Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EF6D006A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0203E10ED86;
	Thu, 30 Mar 2023 10:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459710ED9F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:59:52 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 471AB20755;
 Thu, 30 Mar 2023 11:59:49 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 4/6] drm/bridge: tc358768: Add TC9594
Date: Thu, 30 Mar 2023 11:59:39 +0200
Message-Id: <20230330095941.428122-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330095941.428122-1-francesco@dolcini.it>
References: <20230330095941.428122-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add TC9594 ids, from the software point of view this is fully compatible
with tc358768, the only difference is the automotive qualification.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 7c0cbe84611b..f4499ae7bee6 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -991,6 +991,7 @@ static const struct regmap_config tc358768_regmap_config = {
 static const struct i2c_device_id tc358768_i2c_ids[] = {
 	{ "tc358768", 0 },
 	{ "tc358778", 0 },
+	{ "tc9594", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc358768_i2c_ids);
@@ -998,6 +999,7 @@ MODULE_DEVICE_TABLE(i2c, tc358768_i2c_ids);
 static const struct of_device_id tc358768_of_ids[] = {
 	{ .compatible = "toshiba,tc358768", },
 	{ .compatible = "toshiba,tc358778", },
+	{ .compatible = "toshiba,tc9594", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tc358768_of_ids);
-- 
2.25.1

