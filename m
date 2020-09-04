Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82525E4A9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86E06ECFC;
	Sat,  5 Sep 2020 00:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783A589DA3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:10:03 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 556882C47B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:00:36 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id E9D853FF6D;
 Fri,  4 Sep 2020 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdOFWohILbsEDDDJFVfgHhbn+dw2QRxvLWyTIr2kZpU=;
 b=jvNt3f7d3FF2fSMFKk0MXXDc/yD9IpNkiQC8nzWhBGIU5u3Czw6ncUImhneqUjLr9W9UhQ
 fDgtzqHkfh1NTc4vZBHK8IG7G3mhK0vJ3fOA+Kb9ARofzsVD9e+0Ovg1GsB6lGi7P1OJTd
 uVzJuz+/IhjSweGEb17llg551RRqZck=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 393E0360469;
 Fri,  4 Sep 2020 11:00:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 4/4] arm: dts: mt7623: add lima related regulator
Date: Fri,  4 Sep 2020 13:00:02 +0200
Message-Id: <20200904110002.88966-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904110002.88966-1-linux@fw-web.de>
References: <20200904110002.88966-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Alex Ryabchenko <d3adme4t@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Ryabchenko <d3adme4t@gmail.com>

GPU needs additional regulator, add it to devicetree of bpi-r2

Signed-off-by: Alex Ryabchenko <d3adme4t@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index f41f221e56ca..826912545ef1 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -79,6 +79,13 @@ reg_5v: regulator-5v {
 		regulator-always-on;
 	};
 
+	reg_vgpu: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed_vgpu";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -283,6 +290,11 @@ &i2c1 {
 	status = "okay";
 };
 
+&mali {
+	mali-supply = <&reg_vgpu>;
+	status = "okay";
+};
+
 &mmc0 {
 	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc0_pins_default>;
@@ -402,4 +414,3 @@ &u3phy1 {
 &u3phy2 {
 	status = "okay";
 };
-
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
