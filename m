Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45451BD5D5A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0B410E4CB;
	Mon, 13 Oct 2025 19:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NEU6NP0V";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h/YTL95m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E566510E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:02:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4clmtz3sgXz9v10;
 Mon, 13 Oct 2025 21:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760382155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgEGPlNUK43rhNDXnUBKVU3d22Z0I72vU1ZHl0FA+5M=;
 b=NEU6NP0VJ9Uar8v/MJPQNoOOq9sDmy69JNJOHp54Bz9j337NYDY1p6UYICf7Zs52rROYxK
 TT3obK2au2EDzWVl/PbyqPi15kU4sDN8DrWlen6o98qkFUhPChs4YWaWZ0C6P/W3Z0F+4e
 ax692jpLk7DxslQY5lQyYbkhaWaC1WqEIKNuh25Qy/d/44XCV7rfOZz2QUNv4jjqcZlYlo
 BXZ/aFSFMTAH3FHk8q1WTDVDSs7CoAbB4NGLL7svApHvNcPrTtFchyfQTadPMybg7h36Fe
 ADOkcixHfRgE8kF/POquVEukjfxbJ1C+lxIbpg3WPlQYFT+cVBgjDZ9n4ujSLg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="h/YTL95m";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760382153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgEGPlNUK43rhNDXnUBKVU3d22Z0I72vU1ZHl0FA+5M=;
 b=h/YTL95mjqwfTRKo/7x3jZWSAxBUUgW5yAvJUbyE+Sf1551P+mzDlADqtkPnIKKZMSjUpA
 Kkv8FWIH6UFHPFS59z08Hx/S4ar1Fngn+Y2NXQsKT+xD/mfPmhPS28Lo1RF0rWprgwuThs
 4RF6X9q2vYAy/6m7V3FseKhgcJkUZJE14I6dUNoZ82NxGjhqXCur4rLKQCBRsSEpqJgU75
 kY+z2AeH8/oON5BC8TSH9UgzEbB2hf2NiZ1Mx8YnfF6NAUxtMDueHRWNiDqU3DqJMjSGIB
 Fti0WkrSXFfhA+jcstSUTaC4UN2liBpx2lh3gST/bxgKN8AR5/7Fn2RZ8Bb+3A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Date: Mon, 13 Oct 2025 21:01:18 +0200
Message-ID: <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0b0558fdda1c0b00138
X-MBO-RS-META: 5rj5rxchy4bzmxkt8mwszpzp5iyyk97c
X-Rspamd-Queue-Id: 4clmtz3sgXz9v10
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

Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6d039019905de..4f7b2e838c026 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77960-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			power-domains = <&sysc R8A7796_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7796",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0

