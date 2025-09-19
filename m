Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A38B8AEB1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F259E10EA65;
	Fri, 19 Sep 2025 18:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ApD3TEpD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LG1sxtYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7310EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:30:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cT1KY35pTz9tKY;
 Fri, 19 Sep 2025 20:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758306657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qyz89ykv+3PQfLNoFeepyaFSjz8XuaU06hwLEDmgOC8=;
 b=ApD3TEpDL3JtkZcMbRBV7w6ue1iq2BZ7IewKF1d+SX3q1Sq84uYEwj1oxRXZblyfRyFO1J
 /UBEf9IsOUKoX+5ESMmbWnKT4B3uJmebK4ydfct95+TYrqBgw26zEUOWYU6HRE7SYmRNrX
 24CSVde1T0ivKrpmHQTtZPvBWxXeOulNQABPhDhswcjW5s8MHaQt07GfMI5d+fHodb46QN
 7qmXuZZuHchSz41al43cU0ZxXS8yXGQs7Yz695SdYcGWYuernxD0fn3VZEraul9jdoPpb2
 ezfY3wos5JRJlR6UUH9nAZqNnS+D3lZOsRB5zv1I3JnkL0Spe0kog/7J2F4B+g==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758306655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qyz89ykv+3PQfLNoFeepyaFSjz8XuaU06hwLEDmgOC8=;
 b=LG1sxtYd/eFsNtegp3v3PU6HGLTkqj1rGHtEqfwftNjZd7Xpk7RIg2aLkeCsHyQVhJBO8g
 j8MwzOCheFkZwsv8f6SPA1eWRg3i+m/dj729frIFR2SSERRy6ir/dFSPfegxKHnTIxb4nt
 k1QWLr5MX94AdezOw10jSKdv92AjMiwfNxhFrClxy7Qz3wSuT0V/Lsnuuu95R+mT71v9Fv
 +TphVj7L1UTZbxuKgqI2AzQPSLUA/O7SGkGn0n4R9UclA7sKa3i5+WOaehjTV6cMjXqjJ2
 9ERbFiywQ5yb6a3wXWJDr8xCcaZ0q79py+qJTKhCGHaHjZ1f/+YDfjeE9coiNQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP r6205
Date: Fri, 19 Sep 2025 20:30:15 +0200
Message-ID: <20250919183042.273687-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: miwz5zh6kzm75e6998mahtbp47czc7fo
X-MBO-RS-ID: 51cfb359eaed5b08efb
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

This is the GPU/NPU combined device found on the ST STM32MP25 SoC.
Feature bits taken from the downstream kernel driver 6.4.21.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 8665f2658d51b..32d710baf17fe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -196,6 +196,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x90044250,
 		.minor_features11 = 0x00000024,
 	},
+	{
+		.model = 0x8000,
+		.revision = 0x6205,
+		.product_id = 0x80003,
+		.customer_id = 0x15,
+		.eco_id = 0,
+		.stream_count = 16,
+		.register_max = 64,
+		.thread_count = 512,
+		.shader_core_count = 2,
+		.nn_core_count = 2,
+		.vertex_cache_size = 16,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 512,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 16,
+		.features = 0xe0287c8d,
+		.minor_features0 = 0xc1799eff,
+		.minor_features1 = 0xfefbfad9,
+		.minor_features2 = 0xeb9d4fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xdb0dafc7,
+		.minor_features5 = 0x7b5ac333,
+		.minor_features6 = 0xfcce6000,
+		.minor_features7 = 0x03fbfa6f,
+		.minor_features8 = 0x00ef0ef0,
+		.minor_features9 = 0x0eca703c,
+		.minor_features10 = 0x898048f0,
+		.minor_features11 = 0x00000034,
+	},
 	{
 		.model = 0x8000,
 		.revision = 0x7120,
-- 
2.51.0

