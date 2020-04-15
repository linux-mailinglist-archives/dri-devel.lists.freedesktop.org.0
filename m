Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C91AB906
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E117E6EAF5;
	Thu, 16 Apr 2020 06:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C646E91A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939752;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dI0VDCpAYn4kjTlYFF4mkRzHkNsrf7BBn1IDt/EnVco=;
 b=iOdW1LNUgZQ/+loao/PRBxwcC2P4U9XFfxfqhSANnAYB4dBKf+eO6WEEcqerUq4maG
 odtgnTm3PVeJK6MoNPpsWzZQqTxDTnjzY1F7/lIEiUdiw9BCKOsJyf7WF50xGkxFiDqY
 YqbaJvls99jyXpsy2JRD8LU8+76JkSfiEo7gugCN8KhhCADz72MJa7urEEbcJsvZaMJ1
 OV7UAkLYy4x7Tv+x1d02Jy7CkeOVeATSUU0rdBvTszN6nGdDwG8EvKTPFvbEOkGISZoJ
 kb5KXTM3ycVEAoTexctzyqrNU/Kkjdiw12IXncHeUZHwy6iv269+FJjqU0rgG5Hmv1EU
 UNhA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F8ZR0Iu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:35:27 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Date: Wed, 15 Apr 2020 10:35:15 +0200
Message-Id: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Jonathan Bakker <xc-racer2@live.ca>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Bakker <xc-racer2@live.ca>

to add support for SGX540 GPU.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 2ad642f51fd9..e7fc709c0cca 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
 			#interrupt-cells = <1>;
 		};
 
+		g3d: g3d@f3000000 {
+			compatible = "samsung,s5pv210-sgx540-120";
+			reg = <0xf3000000 0x10000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <10>;
+			clock-names = "sclk";
+			clocks = <&clocks CLK_G3D>;
+
+			power-domains = <&pd S5PV210_PD_G3D>;
+
+			assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
+			assigned-clock-rates = <0>, <66700000>;
+			assigned-clock-parents = <&clocks MOUT_MPLL>;
+		};
+
 		fimd: fimd@f8000000 {
 			compatible = "samsung,s5pv210-fimd";
 			interrupt-parent = <&vic2>;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
