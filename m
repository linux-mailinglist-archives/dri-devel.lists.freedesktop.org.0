Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB04BF9DA5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 05:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A4A10E694;
	Wed, 22 Oct 2025 03:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="A/mnp4P9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HRgT+llP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABF910E683
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 03:39:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4crvzW066Mz9t0n;
 Wed, 22 Oct 2025 05:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761104359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBsqi8aVtRrr0aLVx99HkB7KLWoQPtqbsgQso7hQozw=;
 b=A/mnp4P9vvcLPDSdClIAwzrxbFtzmXpuZyChltBLo9WDG0q45QqaGwsPHWmuLPk9Mz9bxn
 MVd0fWmTP3Mj/jpJYKQlHi8idm88+V/LMoCWs3d5UDutajtaOr9PLD12/i3IpNuFjLI8Z5
 aNrayD1Aoo0JRL/+kPq+9lULXF1CC+yy9RarxMvrGcaXyCL6JT6WsHFQM5qF4kP07vnX/q
 efimqvlM3W4H9NftRrLrLIp45EXhoziXvWqV57xIQvTJI4CbfYJy+AUjEoBgYs1+mUUnuc
 0O4X1fS0FAgiFO/iybeU4ifDKrrb2uFF/SQYaeuPtWaK2KwoZZ/XFr/YqjphlQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HRgT+llP;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761104357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBsqi8aVtRrr0aLVx99HkB7KLWoQPtqbsgQso7hQozw=;
 b=HRgT+llPNrsJ4P1s6n8YGQ1YxdtQcWKvsiO21U6rRt5G2N7CjHbsqKjC5tDf5So5aKcs+U
 oVhlAfjR3ZKqERaEuNjUxqV9uL+ZHfrDFN90+9YakJTYUJbyVTI9gAovbqxOF1s9ESewxU
 LBHQdQ08n/6Vl2Goo+jmQLa8q5VInooJ0oeGfHgkAPrAjv3Wes12VLuaDrAmuXydZth57t
 xESpC9WtoqivaN+EcPhAzrlWZp4OF5kFkv15XSpkWwW39XWGflDyORADD1x5i49e9n/PxL
 SwPzgprFgrKC7b2gaDj6hD8uHPnpdqrSSrTtcGvSRO1gxFWaKKNZO4AafbDZMA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Matt Coster <matt.coster@imgtec.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Date: Wed, 22 Oct 2025 05:37:57 +0200
Message-ID: <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f69b06254ed5cf3ae28
X-MBO-RS-META: eeua13kwu5kksjep79ytb3idpqginpem
X-Rspamd-Queue-Id: 4crvzW066Mz9t0n
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
present in Renesas R-Car R8A77961 M3-W+ SoC.

Acked-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
V2: - Add RB from Niklas
    - Fix up power-domains = <&sysc R8A77961_PD_3DG_B>; for 77961
    - Fill in all three clock and two power domains
V3: - Add AB from Matt
    - Disable the GPU by default
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 12435ad9adc04..31b11bdab69b9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2455,6 +2455,23 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77961_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77961_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77961_PD_3DG_A>,
+					<&sysc R8A77961_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0

