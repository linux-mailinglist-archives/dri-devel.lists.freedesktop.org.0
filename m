Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF43A76C7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661DE89F2D;
	Tue, 15 Jun 2021 05:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ADE89C6B;
 Mon, 14 Jun 2021 22:26:30 +0000 (UTC)
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F174622236;
 Tue, 15 Jun 2021 00:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623709085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiA6WFJLQmDmGswf6HKqvP1ckPiqK+OvVCtTG11hdnk=;
 b=U59GsHIxEshtK/0fYXBs4asusQOMsX58iQ+aBfaU5b7uVgRiFi7EitsV9QhQ/gaSVWfP15
 hLwOuPVzaqiIakN6lykym9o/7aVrlFmaGP+b3BO99xHranQD6GMDW76uiWAI7bzz7duK32
 CgvmtHHjcRCqCzqYoniTVHsorytqfrI=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6202
Date: Tue, 15 Jun 2021 00:17:51 +0200
Message-Id: <20210614221752.1251-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614221752.1251-1-michael@walle.cc>
References: <20210614221752.1251-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jun 2021 05:52:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, Michael Walle <michael@walle.cc>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU is found on the NXP LS1028A SoC. The feature bits are taken from
the NXP downstream kernel driver 6.4.3.p1.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index dfc0f536b3b9..f2fc645c7956 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -37,6 +37,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x0,
 		.minor_features11 = 0x0,
 	},
+	{
+		.model = 0x7000,
+		.revision = 0x6202,
+		.product_id = 0x70003,
+		.customer_id = 0,
+		.eco_id = 0,
+		.stream_count = 8,
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
+		.features = 0xe0287cad,
+		.minor_features0 = 0xc1489eff,
+		.minor_features1 = 0xfefbfad9,
+		.minor_features2 = 0xeb9d4fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xdb0dafc7,
+		.minor_features5 = 0x3b5ac333,
+		.minor_features6 = 0xfccee201,
+		.minor_features7 = 0x03fffa6f,
+		.minor_features8 = 0x00e10ef0,
+		.minor_features9 = 0x0088003c,
+		.minor_features10 = 0x00004040,
+		.minor_features11 = 0x00000024,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6204,
-- 
2.20.1

