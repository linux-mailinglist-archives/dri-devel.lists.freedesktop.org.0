Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4AB0774C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B6E10E7CA;
	Wed, 16 Jul 2025 13:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/hiXrDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86E510E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:47:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F3DE450D3;
 Wed, 16 Jul 2025 13:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C0EC4CEF6;
 Wed, 16 Jul 2025 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752673663;
 bh=rdQDdI9JouSQXlopIgj0zTq8D4QW2KHFO3f9GHrlvrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J/hiXrDMKTQO05nvgVSvUQAgzWP8ULEvvHhKJo+3ZDWK0YCUhDi/uoyNF+ngznSZ/
 DcSEndLqgj70AVgNsiThGVM7FCWx8X4Eyay593WZUaf2YwXapEOr3p9acKsE+yWyVs
 uX7ItNEO35RyrxwTE5tKmEo5gLqLQSr+ErY4FQIl+iGrfsOnG/acyciI2AP297H3Uy
 xv0o1luCOglbDmxs5OBcpTQN5o9FEH+s01kTHYjYjV827XkWBvc+AMiqXVZDix8lAp
 FgpDyfB85TffhRocGdU1pS3T4+GPacOwLmAWspoJZT9cP/9NPGO3o0fhI94mmTj/Bu
 IbyM+UqBVYxwQ==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 3/3] arm64: dts: ti: add GPU node
Date: Wed, 16 Jul 2025 15:47:17 +0200
Message-Id: <20250716134717.4085567-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The J722S features a BXS-4 GPU. Add the node for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 17c0949ac1d7..8f3d39d8004b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1229,6 +1229,19 @@ dsi0: dsi@30500000 {
 		status = "disabled";
 	};
 
+	gpu: gpu@fd80000 {
+		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x00 0x0fd80000 0x00 0x80000>;
+		clocks = <&k3_clks 237 3>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 237 3>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+	};
+
 	vpu: video-codec@30210000 {
 		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
 		reg = <0x00 0x30210000 0x00 0x10000>;
-- 
2.39.5

