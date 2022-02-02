Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24234A75ED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802C710E371;
	Wed,  2 Feb 2022 16:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [85.215.255.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3E610E359
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643819491;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=SB7WF+uS6P5/t2dwpOjYUkPlGzh1hZqHZTK2na9w/fI=;
 b=m6WElPFa5wwUetkXYni87eezOdYWqUP3earTSuvG3Z4jqwrVy2d/IWZ8rHT/2yofNT
 n4g7NMdJDfkirCo/78xo4waPkUNibWep1MT6i1dYiN3Bv0cYkyJDfnMHqgHTEe/KuOka
 9hj6fsT+Tdq9Dv4QHI1+YD0YqaVj2I/BxHnFOgJYtyEs20Vkqx+o44UMceL6Icb3Bm2C
 mzVBfZWz0LoipC5XuqOWkgpkVMbSBHR6H4DbqR0L1UHUnPkQxatsnmVMTnEt4VCdB+WB
 /vUnttSfiqT2uL5QZ7XS1mqOE3xo9+jW9QB7dhpqOPPdrqx2wWo5JVGHH91rWKUucGOP
 tBhQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbjc9Y="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12GVUBmt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 17:31:30 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v13 8/9] MIPS: DTS: CI20: fix how ddc power is enabled
Date: Wed,  2 Feb 2022 17:31:22 +0100
Message-Id: <0e5dc9a7c67b1cdfdb4427f631a8caa43777270e.1643819482.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1643819482.git.hns@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally we proposed a new hdmi-5v-supply regulator reference
for CI20 device tree but that was superseded by a better idea to use
the already defined "ddc-en-gpios" property of the "hdmi-connector".

Since "MIPS: DTS: CI20: Add DT nodes for HDMI setup" has already
been applied to v5.17-rc1, we add this on top.

Fixes: ae1b8d2c2de9 ("MIPS: DTS: CI20: Add DT nodes for HDMI setup")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 3e336b3dbb109..ab6e3dc0bc1d0 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -83,6 +83,8 @@ hdmi_out: connector {
 		label = "HDMI OUT";
 		type = "a";
 
+		ddc-en-gpios = <&gpa 25 GPIO_ACTIVE_HIGH>;
+
 		port {
 			hdmi_con: endpoint {
 				remote-endpoint = <&dw_hdmi_out>;
@@ -114,17 +116,6 @@ otg_power: fixedregulator@2 {
 		gpio = <&gpf 14 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
-
-	hdmi_power: fixedregulator@3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "hdmi_power";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		gpio = <&gpa 25 0>;
-		enable-active-high;
-	};
 };
 
 &ext {
@@ -576,8 +567,6 @@ &hdmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_hdmi_ddc>;
 
-	hdmi-5v-supply = <&hdmi_power>;
-
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.33.0

