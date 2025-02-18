Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C1A39B90
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B7110E6A4;
	Tue, 18 Feb 2025 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Os6v8KsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635FE10E699
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:59:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so55910535e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739879975; x=1740484775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJwkMW+fR6PWnrXP7BmklxSTCrFBYNdKFnbyYQvG9uc=;
 b=Os6v8KsGHrnqyK/1Wi6/O1zgz9A2fhvuo8PSCu4zy//ZoFY3xXdqr7bMfdfkuiF3qt
 zocH6wJTU2mj0MRKKJQEXug1zA+1X1keoVQraIpOhmVc91FxLRxdIjzEtXCXA+cfk3XJ
 ejwqxXmq7sYNuevhgqvVbiA36zxXuiM8aaBYV7OYjoDj/5U+SFhI5kZ7D6AUBjMrLiHH
 2twqL7iXAWefqUVpTKRdt+GOcE40bI2GjT2w3uXb2BFLAkYbRYoPSV2UZ6l9tpKSmjAZ
 oXtj49ov03LeLmrEZM39wsvzOHbexqrUhVy/yqp3e4FjC3OTs9Ra7wOz0BDPNjFhZLL8
 sfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739879975; x=1740484775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJwkMW+fR6PWnrXP7BmklxSTCrFBYNdKFnbyYQvG9uc=;
 b=UWQl1FZvlsg+GReB0IBo3ut3DQigtvKizwbFHo75Hvbt10Y9CHiaUPAT8CA9yZVqCC
 QswVIhGa9nKu8LOsh14Cri7n8PgnlMopU2pTm8Y5RHJFxCNCAlsbHGD1fWoPrrGnyUIL
 hPNqKllq2ni4Un63PqcW3Vv5SMpzIIwFLvw4IRzUhkaP9++ct0VM1PLZAvorJeJRDsBh
 1qYaT2XMCqYRR2BgiLM35tz1q23aKcaphG0LTL7VhxpqpSgps3V9nR0okgD6p/wc/LAN
 NiUhrwKZVcqARxyxMGyiw2bmr6MXqgLVQjFqFJQ+mBXD0EKSowluIz2V9Z24g5QPCsNi
 VL6Q==
X-Gm-Message-State: AOJu0YwVzWclIiU7b5eecUk4ROL4NMqWy0u3fEl1fxdCsyislIOAHM2O
 feJdT7rpdADVUZQwILWkxxP7y1Ii6EinihvTO9L6wOBJlt732FFU
X-Gm-Gg: ASbGnctnFJ+8468enwzDV7p7AfiS/X1zKCYa11yrxbC0FB2QMD80MsGfMkTPRKeMW57
 RdA/XMsIRwpeAmwoZEGZPgQ9TnKpFW49R0nJSzWjfB1tyMYMZUqQdTlrfMeXDAJIEIfj1X9sjPB
 cywsMYRpk5Ygmrb71yg4WjFt28zr5spunYfoQFAEOxqpukuIlWAyL1d3LgKJJCabslVlV6zv9ON
 Zju75Me4lB5FIQoPCtkQ1fTHKkaXLVKU/wwtIc0rDn+6wx3rFqIb20Te0L9Ij8w3WILkTMGDJO2
 eXACurXzOrfdk+zRMZG4pnUdxYtfYWXdZEzxtN97P9VC
X-Google-Smtp-Source: AGHT+IEjGEbBg8RaF8tIzRsJYk8CHuKfBdlmsd8Q4ZTgmqFEA6CyOAfWf3dQWOU1FeBi7IN7eMmTOw==
X-Received: by 2002:a05:600c:3b8c:b0:439:3e46:4b1c with SMTP id
 5b1f17b1804b1-4396e6d7c2amr106215895e9.2.1739879974689; 
 Tue, 18 Feb 2025 03:59:34 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:59:34 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
Date: Tue, 18 Feb 2025 11:59:21 +0000
Message-ID: <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Mali-G31 GPU node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 5d4d999b450e..4d5baed02fda 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -105,6 +105,35 @@ L3_CA55: cache-controller-0 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-630000000 {
+			opp-hz = /bits/ 64 <630000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-315000000 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-157500000 {
+			opp-hz = /bits/ 64 <157500000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-78750000 {
+			opp-hz = /bits/ 64 <78750000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-19687500 {
+			opp-hz = /bits/ 64 <19687500>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -585,6 +614,28 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@14850000 {
+			compatible = "renesas,r9a09g057-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x14850000 0x0 0x10000>;
+			interrupts = <GIC_SPI 884 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 883 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD 0xf0>,
+				 <&cpg CPG_MOD 0xf1>,
+				 <&cpg CPG_MOD 0xf2>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdd>,
+				 <&cpg 0xde>,
+				 <&cpg 0xdf>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x14900000 0 0x20000>,
-- 
2.43.0

