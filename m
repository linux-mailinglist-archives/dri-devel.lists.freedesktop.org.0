Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BC726034
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9945710E4F3;
	Wed,  7 Jun 2023 13:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CD410E4F1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:00:13 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6slm-0003pt-Cf; Wed, 07 Jun 2023 15:00:10 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: add HWDB entry for GC520 r5341 c204
Date: Wed,  7 Jun 2023 15:00:09 +0200
Message-Id: <20230607130009.3519602-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the 2D GPU found on the i.MX8MP SoC. Feature bits taken
from the downstream kernel driver 6.4.3.p4.4.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 2e63afa6c798..e25776d49971 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -38,6 +38,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x0,
 		.minor_features11 = 0x0,
 	},
+	{
+		.model = 0x520,
+		.revision = 0x5341,
+		.product_id = 0x5202,
+		.customer_id = 0x204,
+		.eco_id = 0,
+		.stream_count = 1,
+		.register_max = 64,
+		.thread_count = 256,
+		.shader_core_count = 1,
+		.vertex_cache_size = 8,
+		.vertex_output_buffer_size = 512,
+		.pixel_pipes = 1,
+		.instruction_count = 256,
+		.num_constants = 168,
+		.buffer_size = 0,
+		.varyings_count = 8,
+		.features = 0xe02c7eca,
+		.minor_features0 = 0xe9399eff,
+		.minor_features1 = 0xfe1fb2db,
+		.minor_features2 = 0xcedf0080,
+		.minor_features3 = 0x10800005,
+		.minor_features4 = 0x20000000,
+		.minor_features5 = 0x00020880,
+		.minor_features6 = 0x00000000,
+		.minor_features7 = 0x00001000,
+		.minor_features8 = 0x00000000,
+		.minor_features9 = 0x00000000,
+		.minor_features10 = 0x00000000,
+		.minor_features11 = 0x00000000,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6202,
-- 
2.39.2

