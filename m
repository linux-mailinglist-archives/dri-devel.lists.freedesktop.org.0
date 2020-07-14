Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8CF21E9C6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C06E91C;
	Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE1E6E8FF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A99C22210;
 Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594710799;
 bh=wtiSdBLfP/oEAjuWCJVaVyY3I3kTknkon20LM58lCn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ma1kr062avGaCtPZxmJRmXknz8+TQaEl9Q3AbmoS0hy2TQGZfBkAApQnSYGoEriwP
 EpHqDHxs8uAL5L9xI+ViOnQBAnf83qBRaDgcbKQTGjbWlXuyA4sRwK//gurtz7wz1P
 KsjULFwPDE680eeYxP0PBREMEHmiZJKc1c2RN9gM=
Received: by wens.tw (Postfix, from userid 1000)
 id 114FF5FCF6; Tue, 14 Jul 2020 15:13:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/5] ARM: dts: sun7i: Add LCD0 RGB888 pins
Date: Tue, 14 Jul 2020 15:13:04 +0800
Message-Id: <20200714071305.18492-5-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

In some designs, the full 24 bits of RGB plus the control / sync signals
for the LCD panel are used.

Add a pinmux option for this.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 6d6a37940db2..eec6b4473cbd 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -934,6 +934,18 @@ ir1_tx_pin: ir1-tx-pin {
 				function = "ir1";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
 			/omit-if-no-ref/
 			lcd_lvds0_pins: lcd-lvds0-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
