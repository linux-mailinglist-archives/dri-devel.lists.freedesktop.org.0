Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E9B28B85
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1210E2E0;
	Sat, 16 Aug 2025 07:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="T+Ewstl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644910E2DF;
 Sat, 16 Aug 2025 07:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330525; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VJuCYtbP8mrUQI9T1j4bi2711bcd1Ushr3otFT0qX9HfnUBl2yyrca5PiG8z2/j2LUn2yaOLEZQEw5bpGF4soUPnK6OrWeQmranSaxj/it98JH47ji/zQ8nCJr2LFWuWBfqd1C1v6caNqpSTHy/oLOMiNrYqs0c2RdUpF6SWmXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330525;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cN9lFebZvsPmUPzA51YhqeWIG+6E3sTLNVCRnql52zU=; 
 b=lsN3UfO1JlPm8BG0r2TtNGoDnKMfDwmIJ3BcTgo9A6rlKgLtsaLSlZ4whakDVutmWOkH7aIGToeh+hDmFA5jPtl/tyz6EK9MiCMJMCvhcYXj6H+9/EQfw1JjpcSUqaX1arzoSDQNte3xI5WWrDB7yOmDir8Wimw8/Cf7DVXtwbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330525; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cN9lFebZvsPmUPzA51YhqeWIG+6E3sTLNVCRnql52zU=;
 b=T+Ewstl5U9bHCOwOiew8z7hoW8vCH01/LbakLU+sxXKDLII9KDCemLjAerWcZtUa
 TtbWv1JhHUp04mJ3yG9XbCE7PVokb7U9UMYp+qUE9XhEk5Qb3jX3jo26aplbEXz6iKE
 KnDyJlrKejHjw09N8Yq7IsEBAuExfB3fvUoDvUV6quPKp3PVrwUcvnNZs3HnJLD5cxV
 QHW/u8qzmZUb2yIl9C8zLEVVYbj11qpNrg5ySI7BiCvX0ugMQbSeerG0sTaDHKeUdPN
 af2LNR8on3TeSmsd9J6rP3kJ5dbkEAa6LanGb8L5yOzfTcoDk39qzNaW4dOZZLkSEq4
 5CZP32aLPg==
Received: by mx.zohomail.com with SMTPS id 175533052326799.97496694678875;
 Sat, 16 Aug 2025 00:48:43 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/7] drm/etnaviv: add HWDB entry for GC620 r5552 c20b
Date: Sat, 16 Aug 2025 15:47:51 +0800
Message-ID: <20250816074757.2559055-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This is the 2D GPU found on the T-Head TH1520 SoC. Feature bits taken
from the downstream kernel driver 6.4.6.9.354872.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 8665f2658d51b..6a56f1ab44449 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -69,6 +69,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x00000000,
 		.minor_features11 = 0x00000000,
 	},
+	{
+		.model = 0x620,
+		.revision = 0x5552,
+		.product_id = 0x6200,
+		.customer_id = 0x20b,
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
+		.features = 0x001b4a40,
+		.minor_features0 = 0xa0600080,
+		.minor_features1 = 0x18050000,
+		.minor_features2 = 0x04f30000,
+		.minor_features3 = 0x00060005,
+		.minor_features4 = 0x20629000,
+		.minor_features5 = 0x0003380c,
+		.minor_features6 = 0x00000000,
+		.minor_features7 = 0x00001000,
+		.minor_features8 = 0x00000000,
+		.minor_features9 = 0x00000180,
+		.minor_features10 = 0x00004000,
+		.minor_features11 = 0x00000000,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6202,
-- 
2.50.1

