Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0520B55EFE
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 08:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9CD10E0CA;
	Sat, 13 Sep 2025 06:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DuvNALMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928D210E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 06:42:48 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58D6gKTY664124;
 Sat, 13 Sep 2025 01:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757745740;
 bh=HmXZZBLqPMRin98x10IxDTgtmk2hVLmhUHgQWCCpzxE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DuvNALMKbUAuOyIRaKXSXO/PD1hujuNboILvyZu52nFNsoMZToC3fKYOfzEFSs0qB
 lvGEX5LvvETQ1qU9UJywQbzLf/CkstqBbukpKg7ncFsl69MpuZLTjx3/efqCR3G782
 iRxbG/h38KpC2VdY/0Fh7Umu0IFfsL8wDK9XT+tc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58D6gKDP1841163
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Sat, 13 Sep 2025 01:42:20 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 13
 Sep 2025 01:42:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 13 Sep 2025 01:42:19 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58D6g5ux543875;
 Sat, 13 Sep 2025 01:42:13 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO
 Control
Date: Sat, 13 Sep 2025 12:12:04 +0530
Message-ID: <20250913064205.4152249-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250913064205.4152249-1-s-jain1@ti.com>
References: <20250913064205.4152249-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add TI DSS OLDI-IO control registers for AM625 DSS. This is a region of
12 32bit registers found in the TI AM625 CTRL_MMR0 register space[0].
They are used to control the characteristics of the OLDI DATA/CLK IO as
needed by the DSS display controller node.

[0]: https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 029380dc1a35..dcc71db8afd4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
 			assigned-clock-parents = <&k3_clks 157 18>;
 			#clock-cells = <0>;
 		};
+
+		dss_oldi_io_ctrl: oldi-io-controller@8600 {
+			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
+			reg = <0x8600 0x200>;
+		};
 	};
 
 	dmss: bus@48000000 {
