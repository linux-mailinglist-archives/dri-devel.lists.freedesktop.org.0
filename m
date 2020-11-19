Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CC2B8EC3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F32389AAE;
	Thu, 19 Nov 2020 09:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6889AAE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1eZn60Fo7Ij/LbOiyYCRMEM9wS7LZwHULX9fIAsYg8q6in+6gCRXGRcK81BOncPzEoPGWOLZ8JF4oHr/Eiy6U/TVpsKKWpDy3mefmAQ7Ce5F9yTJo6tWu3jvNU3Sp/kfuKZbq1+yWvzp4yeNNaJryNrjRhk9KLmmovK9gqR78biKV3NsuxfwqMrtThdcNnjWkFi8L76qmz0rMeetrkBbTIaCAtDyVNQ4yRsFcTfbUO8pToX++snfji6j/7rsFJ07ULPfataDqhJRC4z1Diyc8gcQ8bclCHC899xE1vLE+5GkbBckn0lPpIqPce9mX04NIdDoI7YiD4VJs+RXf8IhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Dk4VRjb+riKb3v/gm9D6uqlcwvZnIkXwv1iCNqVgc=;
 b=hxt25+JqctzBaxZxM46qnu1zIQ2iA7fH0xbT/xJ61bW04tmvOWt97AON4fp1OCJHn1955YRQI95ZDIy+lKI6lCWSvKbxLFvgVXzmGU5kytPIe533825NBFONN6OUKJ0dJiRFXkLnAjkrsweUSLoy/cYjg6mt3pTN/8a5nehd4JTocBtqnA03bCx5mkpddZks0p3Npmhm/X7VGITLaX+kRpy6vVVZY9/GtX4rl8UEEf5Iab+ADyoxhOqfle94/cQ5kejO8zxGLIlwyIGUD0tHK7jdTJ8i6DGo4Fy5adOlNQpylW3DDuw+8sKbQtEpKh57MalyV+RVlaH5n1qBhBoXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Dk4VRjb+riKb3v/gm9D6uqlcwvZnIkXwv1iCNqVgc=;
 b=AmOsi9q6fpzKxh+530MooBLYVrD4Gwr8VfdR9LxyqtaNI1z5W3lGFVS6aQlm01SCemTvpS3Fv8JXzhMbmZgIuc4tPLZ7QZN/MeqFR6dIRcyb1Vp4gM/Vy/BvCerHM3SoV+mBmHqve2XyPM0NhjQtxkdh5QiWPZROPTgyNKUcGxg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:32 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Thu, 19 Nov 2020 17:22:19 +0800
Message-Id: <1605777745-23625-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a5e6326-7630-45c0-bed5-08d88c6d9f45
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29735B975D14A4FFAA37540698E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7+09CuATujflqJMeDdJfyJS+D08RZymlI0TTeYqwyM+CUhLSHwRUuIHoqKELV9nbR66LNmBF7nsPm0Ct/2F/I+PB0hs5U/fn+hL92lhqr1lZ0o4mVisO5urf1BuGrgO45NEVfrAbGHoIAQ9JQp/iUM+i9cb5pf8cfNjqFU2rrvvM98dC1comZmdLMe5bS9W0FOYtQXE/r5RVZ3Smrd2d7s9cqBmlRlK7NUSEK9ULcybxS7cZaM4ZPCYnPPm5LXE1w6n2r/q5mK1tcBkeRD77Kkd4/e0tGf1HbtMrrpEi7Zlz8Vaudih7S7zo0qjYKd5DaXlRXYu6GXOyOyEK/x29pPrG+8sn7eFsLlu7myu8kpSz4do3OF8UG21CqIqoFRWBMp3Le0K+nW57TA1pYoKCS3IxnUXoi/fxY6lJnhHuwTXplNxo/P9sPOdTd/7khbVZ/rd1FGEohqqIMS/RAJmaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(966005)(478600001)(4326008)(7416002)(6666004)(8676002)(69590400008)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XIgua5YhU8sdmKqMIi3Au43qV7xRiBQEUAFqFh2Z+z/S9hjfRWpJvXI9G+wekoSAuPgngqiYM/PsK1i2Jwp+qHmyZS4OndaMvUjdaX1c7jdEd0AGQSi2YAITGtB8Yb4tsHKxV95LvC54ObrtfstVcc9WDCUVM0bBBnpVeKIrbrPbUCuA1rygQH6rzybjaNDuA4M9Bvp4ol/j+B+j1LPj32G/JyeUJrdFf5zdQ39RKYhREOcWdrbbENO0vJe4hxk1MLliE2pEJdai5depo3VBgK25q8i/m/0Z8RAVioy/XIqTroToAlhM9jVEr5cv8lwGa7tQP+4NHJnT1GyUSmA1FvXYaOhGZxKVKUgl2/Ig6Sva1lHkPfE4PBV2jC0+3JB04H+DxvTXMslsSWMr1yMlxNq/zaU8oM2dgd7v0GyuVHQao/YQlSWAoPTu4G9Oobf/RpQdfSfRd9IGh/UphRX5Ud+2+Om7lXMoWLav90VIRw+yktI+t/RB8sVIKRWfkMWVifLGSIQ19d4bGVgeYfFLdUQettj8Zpfak/K3k4bJZtMIdQbx61l70cLNaFsyq9ODfZoVQfkepd3+WXwvR7S1eLmHVBJoydGS7AKTyaTtR7K0k+ULXX7XeDUCfkbIeFZP2CsAoaYaHHN60QAHfaudlw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5e6326-7630-45c0-bed5-08d88c6d9f45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:32.6476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SW+8zX/Sqrbq93NwxOPnNVwztUBUe4yZdJmKmUu+l2XNkUV+WByfefQCvHaTV/epl7uG2boB+9Zy7pmE4bcEHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..d043f2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx8qxp-prg
+      - const: fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_lpcg IMX_DC0_LPCG_PRG0_RTRAM_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_PRG0_APB_CLK>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
