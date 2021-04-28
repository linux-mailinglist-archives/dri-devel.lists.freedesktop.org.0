Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8736D849
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47146EB3D;
	Wed, 28 Apr 2021 13:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD646E209
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:25:52 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id bkCIlVh38k1MGbkCNlOQ2l; Wed, 28 Apr 2021 15:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619616351; bh=ZhPX/2YiOfLQlY4NwXvUB7h3vdPmjqi/LUYqzOp/Vv8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=hYDP5nf1f9J3FgMLusk9jnVK7napz+lpLjC8qHZN6dVQomsRK7S0xAWRfr0b+KOjx
 yLSQ+xaE3IyvyXKuJLBYb9ytJxE5TK5aM0yCvHnHDS+fpCy9QmMjwUn8FrGuAOxQSZ
 Z388+AM3NysLMIlNxRV8DGYQwHui9a5iaMm4W2Fp0ziTbAwvgomDQu2nQOd14AHPD5
 2osUBLzre/+MeCnV/yWqLSpO7mk2JpYNxV7yjqVX1Iai/oYylMyaLMvqh1oOs30MzE
 iWtQo9I+L4ZT9HZTG8Ton9BomRHsRzwji/VAeWkN4M3fDMX0/PiivIvzkx2eRGdRpz
 VpXEGblZ1oBaA==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv3 5/6] dra7.dtsi/omap5.dtsi: add cec clock
Date: Wed, 28 Apr 2021 15:25:44 +0200
Message-Id: <20210428132545.1205162-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNLevcGa/vJcvtKdvEIiHy92QMBtnAfp4gJ5oaF5BD04x2mRHL2FhkBxrDLGL/QF5SPbt8HI0K+xfQ1Qw3yCultLrCTAHCKvOnCJ77XntJwkqGsYDCER
 sMdKdN4TwFN5jfiE+O8c2mWa1O//6otapFxvm1OLdj09IsuKC/QCGSA/qF6vVY53j2xCnRo5Lq7lCRu0n37yP915eacPs3eg8MNrT38veFJyliJ21OK7Uilr
 pkPFu/GVH+PNhH6/SQ7W1AzJH0UU03vmbsf6mFmLutLALKGFgVN99IXSsXqxQ5U8CnYVj+A9R4oIESz5JCzoMkwPMtcn4sLmjjBDzQ4eMwyKkFMV1ukiI9Hy
 WcCcb+I4wbzjr8EJgAu5yT4YxF0PSzgZw/+Y+rgTQalM2ShZZyK73V2cE3uw8B7MudRkCYV1
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
Cc: Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cec clock to the dra7 and omap5 device trees.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
