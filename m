Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55348245CF7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2A6E423;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880156EACA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w14so8110551ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+P5lHjTDW+fpgZUM8BgJNYEzbDCPkB4hSqWnbuezGc=;
 b=EySEbHRj8lAX/ziH2r7hioBLUDLTOiq1l4nhjtxA6x4iAYbmlGz6BjPEMsVsqH26uS
 SryjeKSCLu2WEg60aUl9/RPthN1aAbIbAWR3OXsBMy5mQACkFvZVtbMM4WHops+1mz3C
 61Y0W+BmFZr0Apgj6lV7qCTCZP4xCqpWdpuNqWxQjFf65iHvPpjCEbpnut71M/n1ODs9
 ZmmYXuMKrQT9FVfSqC/fH/9ipaO8j4ZjZt97YYGMJ9iDuTLuuRdIKuH9evKbRS8fuMR3
 XbEhzzcdLwQ9GKXfwnxwRGK1/xIi2ckb7oJSc6vud4R+6jpZuf1hwBpavMVLNHRclWbb
 bX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+P5lHjTDW+fpgZUM8BgJNYEzbDCPkB4hSqWnbuezGc=;
 b=lrsEDHjQ/G2JffJg8INVoqNB5yQZPND7veJJ1cZEuGBqSeILYmHfGe4AqLpTA3sToA
 nn5kQaAdGGnLrkssherAa/XAipDk9M0RgopfzN5IxiJfIJifBRNbjTsZd1aWqUvGcHS5
 p5Tg+szF3sNVhWnZzPtA/oIasGTipcQSrZAv01c6kCSHviI+vHjtqZ5172X6FtUYLkF/
 5Peemh/vkfY9RdVhnlniKShDqrCpO3hoIHhegOE4WBVUCEyzzurn4EMisyp1AhEdDlHs
 VQIacsV5QCBuIUMdXe8SQdOp58vx3jZShybViHlXfFPTmy9njZFVDqVjdoZcaEnNRozf
 v5Mw==
X-Gm-Message-State: AOAM532rtJ2bxiEQvlJr8pxzCwDAXmeHCV+SSDnoq09NJWY/1QZdWUdi
 9qauio/wRqhuR0p03klPSZc=
X-Google-Smtp-Source: ABdhPJxN2MUM9Mw5JSHMWrAhsyOHEh6piHoXBwWqQRZ7a0KEkuP3vubYu1Eb8DMZZs8aWTIwlcECNA==
X-Received: by 2002:a05:651c:284:: with SMTP id
 b4mr110032ljo.278.1597363649040; 
 Thu, 13 Aug 2020 17:07:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:28 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 25/36] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Fri, 14 Aug 2020 03:06:10 +0300
Message-Id: <20200814000621.8415-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
index 72a4211a618f..629ad101c43b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -111,6 +111,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -128,6 +137,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -630,15 +648,17 @@ mc: memory-controller@7000f000 {
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
