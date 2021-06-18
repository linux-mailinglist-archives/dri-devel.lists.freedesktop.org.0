Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0A3ACA96
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5DB6E9FF;
	Fri, 18 Jun 2021 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE1C6E9FD;
 Fri, 18 Jun 2021 12:04:49 +0000 (UTC)
Received: from mwalle01.kontron.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 514C422256;
 Fri, 18 Jun 2021 14:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1624017884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pb2ddFIgTBHERtp9vN5V2Hnvu1Prge3tG6KGOIXVFLQ=;
 b=ri9MU5w6mWbOpo6q7/bmWKSC/EIRikTp9DJ2blZlitglWBdmS6QnoW+bYo4Lf/C28lQy2U
 MPEE1jd7qWlpY49xI4JKALq5MdXjaS9ip98APSc7qUkLphnpt6U70h8zntw7k0zJhC7Ing
 oCNJqnDIPeZQg0q4lKxaBa5FdWs4F0Q=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6202
Date: Fri, 18 Jun 2021 14:04:32 +0200
Message-Id: <20210618120433.14746-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618120433.14746-1-michael@walle.cc>
References: <20210618120433.14746-1-michael@walle.cc>
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
Cc: David Airlie <airlied@linux.ie>, Michael Walle <michael@walle.cc>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU is found on the NXP LS1028A SoC. The feature bits are taken from
the NXP downstream kernel driver 6.4.3.p1.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since RFC:
 - none

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

