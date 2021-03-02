Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FC32A5D2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0B86E24D;
	Tue,  2 Mar 2021 16:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816766E1FB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:24:16 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id H7oZlNjwSOruFH7oklAWOO; Tue, 02 Mar 2021 17:24:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614702255; bh=JcmsffEL5WpBEoNeg3xiXwWYe1OCSoVS4wjvJzi8Lyo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=Z5p6AxY40Gdg4RncvYdR/6YBOWlashNd/+qCJa9TFcm9tB659XFHqZtdXQjp0cct+
 2ie9h58xaQtlOhel4ELRs+b9e3cktfPRG2ndCK9qD5Kn2jnRxDMv8L243yyD7a2tRM
 FpeNm+WqKqxFHAASxkSaMVOvA35Tx8ioJusQR+Csh8zlU6fqw37PBzq9WSVF8wTeeG
 l8fEsSHYUegvrsp5wBrVqvllIKMY1mehRcFKQpGioBKZEhYY9D2GXaXEDqm+AF6mzF
 VQE5IgNq2T8nnZqDrai1B71/oMyjeZQWZJl3mQm8b0uhC9UsLVjdPdwwAlr0Tz+s3w
 GX+9faNSB6jaQ==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 5/6] dra7.dtsi/omap5.dtsi: add cec clock
Date: Tue,  2 Mar 2021 17:24:02 +0100
Message-Id: <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNUB+sdY0Nm8qd3cl9r7BXSq0BBS7jqi5Lu6jbPac3arDT5eCsLhjN4ypUHGaM2YpYyJnV31GXmxKoYqT0CqX1Lz/ZMa6SdDIHgabasbOhLt6izKl1Tm
 UTyZAA8uUXpaZbycaoFWudPaObMjWAdDrSNQw41Bccl8+t60umcly65lV7yOFQBDPkOrIG8oqehso9PYjgDzE50hSUDZh9gvHh8jpP/CeYt+7ZzK3BuABCh2
 3NqeIsObJ0lCwJoHLZXHrvVIQWnH9H+xgaeD6tvtUof5lG/PApXApoFug8rXa+RUYy3jngEPKfV+9jbd12Af+qW0HieOIq9ngQT0JXi5384ddUjLh6lY5Wq0
 ZYPUHeVrrAaCMzswM4IEEO7W2l450QzGSMkP2omkQ748eSpJLmdkuUZdUVknZ4WOYlVgQbbGfr0w80i2aH3g6Gi/R6PrA1gRyxMyYdVYCkytHdzRHCMmy3+J
 LWZ+tE9IYAzu26jJI+qfl1M+YK8Akpy+dmg2zS082RTbuTC8BhC7A/YIM7E=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cec clock to the dra7 and omap5 device trees.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi  | 5 +++--
 arch/arm/boot/dts/omap5.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index ce1194744f84..efe579ddb324 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -879,8 +879,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma_xbar 76>;
 						dma-names = "audio_tx";
 					};
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index e025b7c9a357..6726e1f1b07c 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -586,8 +586,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma 76>;
 						dma-names = "audio_tx";
 					};
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
