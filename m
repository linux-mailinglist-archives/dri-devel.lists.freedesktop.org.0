Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB27047FC
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA76E10E32E;
	Tue, 16 May 2023 08:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Tue, 16 May 2023 08:37:18 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355810E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:37:18 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3A37D6004402;
 Tue, 16 May 2023 09:28:38 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id uknSLdMuR8gQ; Tue, 16 May 2023 09:28:35 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C3CDF600440F;
 Tue, 16 May 2023 09:28:35 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1684225715;
 bh=OxCRSDocyyu6pmMK9pivMm1r/2v3QJFXAvDDNRdf5Kk=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=p0iEu+t93fmNEE3Pv9CuzlIgoXbaUCWOziOBObOcqb66yQgtpnpZDzbl0M1gFxddK
 82SjoBrEwqKeJ0WKJHU4/2RAbl9mmjkPT0rng2I2qA2CWsEQFMIzCvoH4B4h9gnPmB
 jJwftAflP/eqK/02PafL6Gdt0znHGOF5Be1MbNCs=
Received: from wslaptop.Home (unknown
 [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 986ED36007C;
 Tue, 16 May 2023 09:28:35 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: tegra: smaug: add GPU power rail regulator
Date: Tue, 16 May 2023 09:28:28 +0100
Message-Id: <20230516082829.15326-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
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

Add the GPU power rail regulator node for the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
V1 -> V2: Use generic DT node name and GPIO flag
	  defines (Krzysztof Kozlowski)

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index e55bff859692..929372f24339 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1406,6 +1406,23 @@ max77621_cpu: max77621@1b {
 			maxim,externally-enable;
 		};
 
+		max77621_gpu: regulator@1c {
+			compatible = "maxim,max77621";
+			reg = <0x1c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(A, 6) IRQ_TYPE_LEVEL_LOW>;
+			regulator-min-microvolt = <840000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-name = "PPVAR_GPU";
+			regulator-ramp-delay = <12500>;
+			maxim,dvs-default-state = <1>;
+			maxim,enable-active-discharge;
+			maxim,enable-bias-control;
+			maxim,disable-etr;
+			maxim,enable-gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+			maxim,externally-enable;
+		};
+
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-- 
2.40.1

