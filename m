Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E207858EE9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 12:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBF410E0F6;
	Sat, 17 Feb 2024 11:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="ax8iUlSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15010E077
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 11:04:25 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H4iTD5009886; Sat, 17 Feb 2024 12:04:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=0b38tedRyxz1wugMy9qAGe9nstQPcZ6cdawHN0/CbEE
 =; b=ax8iUlSOu7Az2JUb6/gbG4bCqdYduMelAn/GUAR6b9leGywAmdVxBE8Tkb9
 fVmrBsdAbg2tyJ85uVFHvex+Z+mmzi2irFfMuac7vVuZQ3w1vrGZxpXOqlIYGEBn
 Y6DVPpLLaohuIHJj9r8UMwF/h7j2kCJpUh6tN0mg7qTSejBckYzvvSwsLgnXHJKT
 R0pKN0mx5baYlYAVDCyMMphPy5SXawePTPo4TydZ3vGxFf3Vthoyz7SqdnSV4/VE
 3Cxe6mWnH34zzZBVQF9Is0QaFZESzx62S2C6dL0VzZPYw9APgIYPF4k/n44eZYdE
 0kCJMeV2FOnS4gtWj7chjWFPi3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa124n0cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Feb 2024 12:04:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CFFBA4005B;
 Sat, 17 Feb 2024 12:03:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EE62253B4B;
 Sat, 17 Feb 2024 12:03:13 +0100 (CET)
Received: from localhost (10.252.12.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Feb
 2024 12:03:10 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Sat, 17 Feb 2024 12:02:55 +0100
Subject: [PATCH v2 1/4] ARM: dts: stm32: add LTDC support for STM32MP13x
 SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240217-ltdc_mp13-v2-1-50881f1b394e@foss.st.com>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
In-Reply-To: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.12.210]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_07,2024-02-16_01,2023-05-22_02
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

STM32MP13x SoC family embeds a new version of LTDC (Liquid crystal
display - Thin film transistor) Display Controller.

It provides a parallel digital RGB (red, green, blue) and signals for
horizontal, vertical synchronization, pixel clock and data enable as
output to interface directly to a variety of LCD-TFT panels.

Main features
  * 2 input layers blended together to compose the display
  * Cropping of layers from any input size and location
  * Multiple input pixel formats:
    – Predefined ARGB, with 7 formats: ARGB8888, ABGR8888, RGBA8888,
    BGRA8888, RGB565, BGR565, RGB888packed.
    – Flexible ARGB, allowing any width and location for A,R,G,B
    components.
    – Predefined YUV, with 3 formats: YUV422-1L (FourCC: YUYV,
    Interleaved), YUV420-2L (FourCC: NV12, semi planar), YUV420-3L
    (FourCC: Yxx, full planar) with some flexibility on the sequence of
    the component.
  * Color look-up table (CLUT) up to 256 colors (256x24 bits) per layer
  * Color transparency keying
  * Composition with flexible window position and size versus output
  display
  * Blending with flexible layer order and alpha value (per pixel or
  constant)
  * Background underlying color
  * Gamma with non-linear configurable table
  * Dithering for output with less bits per component (pseudo-random on
  2 bits)
  * Polarity inversion for HSync, VSync, and DataEnable outputs
  * Output as RGB888 24 bpp or YUV422 16 bpp
  * Secure layer (using Layer2) capability, with grouped regs and
  additional interrupt set
  * Interrupts based on 7 different events
  * AXI master interface with long efficient bursts (64 or 128 bytes)

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
index 68d32f9f5314..834a4d545fe4 100644
--- a/arch/arm/boot/dts/st/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
@@ -19,5 +19,16 @@ dcmipp: dcmipp@5a000000 {
 			port {
 			};
 		};
+
+		ltdc: display-controller@5a001000 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x5a001000 0x400>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LTDC_PX>;
+			clock-names = "lcd";
+			resets = <&scmi_reset RST_SCMI_LTDC>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.25.1

