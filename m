Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6025F0C6F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284B910ECF4;
	Fri, 30 Sep 2022 13:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1654210ECF4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 13:29:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSxcC035818;
 Fri, 30 Sep 2022 08:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664544539;
 bh=+J8ZepVgPG6tUlNyVSfPMDV3lR1z5144rtww1yHUjS4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DOCT0P94sZYiOFdjRH3cz9emeX9/kPMI0cjYL3rHzEeN+CI46uYcrMV5v4J5Ml+Gg
 KoqGcqcSQQuBYkXBd8h+xv03yZ2ZxXHMl+uZ0Rq843+gW4bKbkoCCOH0lwScqFprXh
 rxXsGFJjpd+b3DI1gDRztIOoBbqxCROe2VW6k9ag=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28UDSxcJ123017
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Sep 2022 08:28:59 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 30
 Sep 2022 08:28:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 30 Sep 2022 08:28:59 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSwcx027570;
 Fri, 30 Sep 2022 08:28:58 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <nm@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721e-*: Fix the property name for dp
 pwr
Date: Fri, 30 Sep 2022 18:58:42 +0530
Message-ID: <20220930132842.23421-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930132842.23421-1-r-ravikumar@ti.com>
References: <20220930132842.23421-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, Rahul T R <r-ravikumar@ti.com>,
 linux-arm-kernel@lists.infradead.org, kristo@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the property name of displayport pwr in dp connector
nodes

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reported-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index b1691ac3442d..4cccb6653217 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -162,7 +162,7 @@ dp0: connector {
 		compatible = "dp-connector";
 		label = "DP0";
 		type = "full-size";
-		dp-pwr-supply = <&dp_pwr_3v3>;
+		dp-pwr = <&dp_pwr_3v3>;
 
 		port {
 			dp_connector_in: endpoint {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 80358cba6954..0e295c661aab 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -217,7 +217,7 @@ dp0: connector {
 		compatible = "dp-connector";
 		label = "DP0";
 		type = "full-size";
-		dp-pwr-supply = <&dp_pwr_3v3>;
+		dp-pwr = <&dp_pwr_3v3>;
 
 		port {
 			dp_connector_in: endpoint {
-- 
2.37.3

