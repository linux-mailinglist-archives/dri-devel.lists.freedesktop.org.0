Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D03BDF6E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EAD10E841;
	Wed, 15 Oct 2025 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="EN9IFy3D";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cClxOHrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766410E841
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:40:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmwJv5GBzz9tBF;
 Wed, 15 Oct 2025 17:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760542831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmHsI+NQ50S3BEL3SwaM//wPzcvyZxShmWxF/jqZM18=;
 b=EN9IFy3DAWf4esFvR1Da+qs8Iz0N1A7hlu45c5RupophREH98vadhPBuNeWKTQLBeiWy/X
 FbJgBq6k4CcUAH/aQ0d19Y2firI/t1OpDQ3iJUEWgB4VFuWSSlK1leuwFM6jghzz90tKmx
 SzkSIa4cjTRzcInLg4EKtQfYwx9047Cvv75Qxve+x21/PYP6PmoC3+NUtaCXKjNcW/kg1K
 Ra/blxtbqK7tTjGe0VEoKKCaKBACGxt/THqpIUdfmx6wzCuiLo6+EEezr635Y/D5XUnfLn
 k+l3wWCCPCVbYbUZJrOtVidQUI8EWuiXbF6JBbh+sPZrDxUFyDHbZdChcgFLXQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760542829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmHsI+NQ50S3BEL3SwaM//wPzcvyZxShmWxF/jqZM18=;
 b=cClxOHrb7UcshKLyjqxbouBG6la2t0kiotnlZ8CBv2n3nRpbDLS+mV0o34J0IKQZGV43wl
 mqP8Q5GdOE+FM6cE+lF06Ie0xfcICNaUGanLNKM7JQxamXEQE2aWqj2ZkcDFrplnt9gMGp
 PICtso5nT1M1XouEnZY5M11RPTirY8x5qWpvmNFF2qS4IqHqxzAZxbEBLzcmcjBaNbR9Hr
 FdohwLvAvDsfsJU4Ma/0HUZRR8KvoVqOc7KOe5PO35IXUI9rQMat/TOUOi2FUQGtDt/RzH
 BcKVtWtlVyjQbVe3x3/S8NbYsYLo3YlmxuaIIndwbHg58ctkjnANUTnVCI56Sw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
Subject: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Date: Wed, 15 Oct 2025 17:38:57 +0200
Message-ID: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d8561daaab33aaff276
X-MBO-RS-META: q3g1s4ksjthz8m1qth7n8a5r3dstmoaz
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
    - Fill in all three clock and two power domains
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 5b7e79b413394..0f7e63fdd075d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a7796-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
+				 <&cpg CPG_CORE R8A7796_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A7796_PD_3DG_A>,
+					<&sysc R8A7796_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7796",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0

