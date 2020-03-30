Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5F197552
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AD36E073;
	Mon, 30 Mar 2020 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016289F2E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n17so16300807lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hd6rY6XTqp00CNa6dRzJudRDwQrl4AYIk50UiFFMOiQ=;
 b=APeNjfm7l77Zij7S+5FueNHKVS7f2iUB46xAdhcZE1TgYucXVKDInptpz5mcRWP+4c
 P6ItvSGF//5mW9a//AX2vD5+k1djL7TjRbLNga7kESt+EbKoLKInY+V+uUZPm4u3ongI
 bNwVtPlQSzc18JgegPV+CIpul5pRwrT+Luw7iHMMXhVwRvG60EcxA8urVcy8wOmsDiaN
 xo1fFSiZg+iIqY/LoJ66KZ4rjSfT0hTiVrpCV/JCqrQsivSnHvLp65dgOKAs0CU8x4lD
 FTKgxaldEVuGtxBPYZ3CjzA2o4wXvygf1X1YhM/0VSfGeEHyplV9+oZT5/xsLYAAvzpN
 slFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd6rY6XTqp00CNa6dRzJudRDwQrl4AYIk50UiFFMOiQ=;
 b=t7udq/VNjIg2aFnDCySGpKctcA70sclZ8tK9bsRg2hNxTKfy13Pjd2C8rXE13QQ6pt
 Z1X854Km8glKnUdaitBneXS8keOmK2NYObeR22qgDrGVHK6pVDxpcFIiFrTQEJvN0XOg
 hYxf5FRAA1NShHgieAv3c2OZ3IywmY+9jTJspDKWyEwdHZLiPEli5V3Ue17LkFfpBKa8
 nkarZrUAAlTkJGuSDwiUgy3EsGz3xjNB13QZNeKpnnD6QODeBleoxNeBtHLesXCpHgeZ
 X87dmshXxxqU4fPu18yC45XfZV3cPH5OLaeV7dPFGWZXpTKCtLzIUHsYbY7e7/EBBttg
 iGcQ==
X-Gm-Message-State: AGi0PuZ3tUUL7AOZkikbZi2aFp+kn36eL5536FK5vBZj4oSpHpKH2f1C
 NLRUCY6kgnnq5IHxngBof28=
X-Google-Smtp-Source: APiQypJVjEp/caA9rjCoC4KqhKyXf5H1uzdrzEPfAmJeYTzn1FBkOErcY7T4srL/XaqigUAaNGShyA==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr5646503ljo.72.1585530582785;
 Sun, 29 Mar 2020 18:09:42 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:42 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 08/22] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Mon, 30 Mar 2020 04:08:50 +0300
Message-Id: <20200330010904.27643-9-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c3b8ad53b967..974048e83541 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -109,6 +109,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -126,6 +135,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -626,15 +644,17 @@ mc: memory-controller@7000f000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x200>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
