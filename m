Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F715A2FA4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 21:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76EC10E095;
	Fri, 26 Aug 2022 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88010E082
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 19:07:33 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oRefx-0005kg-OO; Fri, 26 Aug 2022 21:07:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
Date: Fri, 26 Aug 2022 21:07:27 +0200
Message-Id: <20220826190728.3213793-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marco Felsch <m.felsch@pengutronix.de>

The GPU is found on the NXP i.MX8MN SoC. The feature bits are taken from
the NXP downstream kernel driver 6.4.3.p2.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index f2fc645c7956..eaed08a3d281 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -68,6 +68,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x00004040,
 		.minor_features11 = 0x00000024,
 	},
+	{
+		.model = 0x7000,
+		.revision = 0x6203,
+		.product_id = ~0U,
+		.customer_id = ~0U,
+		.eco_id = ~0U,
+		.stream_count = 16,
+		.register_max = 64,
+		.thread_count = 512,
+		.shader_core_count = 2,
+		.vertex_cache_size = 16,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 512,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 16,
+		.features = 0xe0287c8d,
+		.minor_features0 = 0xc1589eff,
+		.minor_features1 = 0xfefbfad9,
+		.minor_features2 = 0xeb9d4fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xdb0dafc7,
+		.minor_features5 = 0x3b5ac333,
+		.minor_features6 = 0xfcce6000,
+		.minor_features7 = 0xfffbfa6f,
+		.minor_features8 = 0x00e10ef3,
+		.minor_features9 = 0x00c8003c,
+		.minor_features10 = 0x00004040,
+		.minor_features11 = 0x00000024,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6204,
-- 
2.30.2

