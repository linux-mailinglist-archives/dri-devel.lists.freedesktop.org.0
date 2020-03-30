Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C18197549
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454CF6E1EC;
	Mon, 30 Mar 2020 07:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639C989F2E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z23so12740000lfh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FuqLVA2Ch1ge473EwwpJtLsZnteKNfYMkl72ih8U+c=;
 b=a1imk7xg6DJO18zhcZxKy5O1NJyW/KUhelh4pAugtSE8hQfVKLgMtRH877wdq/fWgk
 h7lIoG+UfMqesjXLOwCRcodeuhmCpiIjUNFKyaKqzARwS4HyQGNiSS83b6prJu7BCFTc
 S+h5vOv5N0Ny8mOLu8PPEqggvSHLD6m9LRQ544CdouBZkqSEsqUC27ZYWS86kpCWFIVS
 1J9xqFkDRSseaL5bvPt3fsr0x6bbOaaSnqdysNQv50AHhIwklrKWaZWKGTrTelBT7Ah0
 qZfuJdVs4Vl7U0EUjDkzylRd44bC4WgaqACYw/jN9627/gWPcuBEqu9iSF99YALsgVoO
 b82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FuqLVA2Ch1ge473EwwpJtLsZnteKNfYMkl72ih8U+c=;
 b=SOAgv9jz1DdtbDPhm+zuAPkZvI98nYdJ1YYcTY0zu0/VqJuRwg3iZ0hrBQ03Ui/flG
 GQnx+g6U2BXSHCRD3rmllzaJ+7bFf0XaPClvPHz/0MQ+y4aydaT/cbTJze6A85CYiQv4
 SF6E6gU+uJQnW9C4gfH/VyIsznJwUAQaso1wHZmpPfOFu3RFv505Hee5cxPWqR3A/HOq
 eyoniv3zcg702EnD4JXb8WQuQN6RHtZ5bJ/EWdzGFhFuYFGezcp1iMgqPacnQ6slpWMV
 M90IOc1Cz+5pSjGBJWVlghFRc15kl3/jeq1nR2aRW7RdZ1ui7E/wF/WD9b+IU2JryDXH
 67Jw==
X-Gm-Message-State: AGi0PubTpYRfA+MaejNWVQ9g7w+59/jYIl/uCmwlrSgmO3/VZPJ1+Anm
 MrN87v1LqVpfA0cyT0HLeDw=
X-Google-Smtp-Source: APiQypJ4ftA1ZlPdYQYD3PBQIBDGgxEHZTdSa7Dhm9yq5g30pRKLnMIFfBPHXLOVdy0wOQnSfxJX9A==
X-Received: by 2002:ac2:41d3:: with SMTP id d19mr6601388lfi.57.1585530583834; 
 Sun, 29 Mar 2020 18:09:43 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:43 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 09/22] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Mon, 30 Mar 2020 04:08:51 +0300
Message-Id: <20200330010904.27643-10-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra30.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d2d05f1da274..2b183025629f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -208,6 +208,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,
+					<&mc TEGRA30_MC_DISPLAY0B &emc>,
+					<&mc TEGRA30_MC_DISPLAY0C &emc>,
+					<&mc TEGRA30_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -227,6 +236,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA30_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -733,15 +751,18 @@ mc: memory-controller@7000f000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra30-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
