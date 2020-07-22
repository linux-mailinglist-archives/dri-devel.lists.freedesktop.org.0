Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C421F22A94C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BB66E58B;
	Thu, 23 Jul 2020 07:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 808 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jul 2020 07:54:34 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233A26E125
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:54:34 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M7ZEwn011440; Wed, 22 Jul 2020 00:40:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=QJKZuhHibIrgtvT3Dji1W1SEcLBiCYce0b0FeynYO1c=;
 b=nycVwqwe7IhJOgHZOXQXCxYzmb5s4p7ok1zhsNATszPw4nb3uz6hZbJR3ireYLRyryHW
 pVEzizG9tCY82goYi4O3dTg8Ufch73kDJ33QrCNEiZGQCuO+9bhqpvmuyzWCC0YVycZa
 LpTDsWlcEsOGkoJ+AlVQ7ShMR3HAcQCBuKes4utLrCqqvHo10btqjr4GUExKEP98AoCG
 sVe0+sKjZ+3VF+SWt+d5hrCH9a1MIciqvnQyLnaIk3kF47GlcCf2U1VWw1JlVrNeOr1D
 xu5pFJuy4EU3lv7yOK3ucvpeZ+8O8WplKre4gwpsSLpdGX+OgraiIPZJ9gSP9/5CNB1A tA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0b-0014ca01.pphosted.com with ESMTP id 32bvnxcnf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 00:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHWqIB4pQjpJdXyJ3+LXPOGvcfcf+OC4+W8/ihprzlNTCW5z3P5UqclaIuGtJM4FMo5YeqgP34d3PuHmbV+A55BunCfG74yoT6s4o5rjAkwBClAGtKA+wMlWvzHPp3/mIaY0ST347K81lzBfIcqPk7wYWZAMjkmOwZI/oFfZMPjE3WKKGECz9dkRDq4KI6rbOSmuVdB8nW7wmbUGQz1SLOjP6hadX1F+srlaFpNdRiB7c8iczF5GMjS9uVwBjMj2A8YJwzK85Jq7JX1hDjceo/7kARbl5ae1DvN0xSe3ZkWl3VA5YbUZLPFt0koYiYoFwFYsjtEYn2AwnUrNsf6kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJKZuhHibIrgtvT3Dji1W1SEcLBiCYce0b0FeynYO1c=;
 b=jZRcGdezpDDjW00u+nKDaIFnbXfJrrZfGDKTviKJDoELIeADy20TF+sv5COfcuFtf0tVlW0AT8Ghom89Ln1SEVeJiaXVlqHWHkNC1LXwI+/ZRTTPeFPSHxa+FDe/A2fZX0jwXIWlnKjh50QMgyGK56TXXUFvPtQdW4iekZG8v/5eTv5rRTotcB+fjhR7qZBT4Tq/YKcp0eHD8Mvd4LsSqU9zrElT9nIVdse0Zx3+AQtIZbnLCvpsHWhenqQBQzLfMrVYbP6JEL8Xyn/KmnLLdk/NrqTOuaA9cctGPpSOcKbkIfl0agptzAFdUtZBR2v2ou+9MX5G9dOTerPpQ7HljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=samsung.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJKZuhHibIrgtvT3Dji1W1SEcLBiCYce0b0FeynYO1c=;
 b=3JYGC2fzJASILkvR+CuKunbv8kfLV/hiXarRkGeyMNv7FDW2UXHjA1lLVe5xiyfVclorPjHuZicZFMXoWi7F7CcE3gvLTJ3OZIF/Z/f35Q+FJSZmKAwcr+IjzdHv9vlbaJo734pHMZWlTuHVQfVhz8a+qCnVUCBfhrO/a7PN1XA=
Received: from BN4PR10CA0018.namprd10.prod.outlook.com (2603:10b6:403::28) by
 BY5PR07MB7219.namprd07.prod.outlook.com (2603:10b6:a03:210::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Wed, 22 Jul
 2020 07:40:54 +0000
Received: from BN8NAM12FT012.eop-nam12.prod.protection.outlook.com
 (2603:10b6:403:0:cafe::df) by BN4PR10CA0018.outlook.office365.com
 (2603:10b6:403::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Wed, 22 Jul 2020 07:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT012.mail.protection.outlook.com (10.13.182.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9 via Frontend Transport; Wed, 22 Jul 2020 07:40:51 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 06M7ehn1188912
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 00:40:45 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 22 Jul 2020 09:40:43 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jul 2020 09:40:43 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 06M7ehHR012877;
 Wed, 22 Jul 2020 09:40:43 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 06M7ehf8012874;
 Wed, 22 Jul 2020 09:40:43 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings
Date: Wed, 22 Jul 2020 09:40:38 +0200
Message-ID: <1595403640-12816-2-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36092001)(46966005)(8676002)(110136005)(82740400003)(26005)(70206006)(54906003)(2616005)(478600001)(186003)(70586007)(83380400001)(4326008)(47076004)(82310400002)(5660300002)(2906002)(36756003)(36906005)(316002)(8936002)(426003)(7416002)(86362001)(6666004)(336012)(42186006)(81166007)(356005)(921003)(21314003)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fcae3d0-ca1c-490b-96fe-08d82e128f4c
X-MS-TrafficTypeDiagnostic: BY5PR07MB7219:
X-Microsoft-Antispam-PRVS: <BY5PR07MB72194C52776A4679399BB903C5790@BY5PR07MB7219.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FPiOT3XYKEFtWvu6O0GJC/0HKremn30i/t8P4rGRL0hznYIPekslF0NNjxF24SzrR1DZgkthiME/5LHomY+RGkyJPTt3QUebQGRVIhob6GGAO10bsoP6/RIkbiC4XpgE8JvvsNu1id5TDmg/gORrmj6e4sJiaoznTLH9siCUAJJGtSpQ6RtJuFo2Nfj42NYws0nHIIOtukac/vSyjj5k6CCKB1V1pGaWrHH6+GWLb4Rg1Fo72wxTfYKsJ+LBcEnNYAETF39ZYMnOgxm18YeEQO3as1QRTV60zFf7XtSA87VXFQzMuuUVz/ZFUL4HEKALS2Y0VrLmMZan91KwLYPfigrdq3BOch2disn/kOOcA7kVXDNWCHd0KSNbQKG0HrIWNCUtwI7Ufno17VlM/iW21mzNiDaN3sT1QAgWobzo0MSbwZRTXpv3rQr++k/Xv+UhE75q5sln4ikg5yFicUsWbTo40QXzcCXo27l9gV/2tmPOwpQ5pgsUVkeZzJg1bkJ2OoDuTqAXuxNRTg19lg8sOJc3nliCYQPu4mJ1hklkgmRsztTUhdj710vIAmuswg7Bwt5y2g4RgcfRVY/Sbccfw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 07:40:51.9816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcae3d0-ca1c-490b-96fe-08d82e128f4c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT012.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB7219
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 clxscore=1011 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007220057
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:14 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, nsekhar@ti.com,
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yuti Amonkar <yamonkar@cadence.com>

Document the bindings used for the Cadence MHDP DPI/DP bridge in
yaml format.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/bridge/cdns,mhdp.yaml    | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 000000000000..cdf5760d4ec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence MHDP bridge
+
+maintainers:
+  - Swapnil Jakhade <sjakhade@cadence.com>
+  - Yuti Amonkar <yamonkar@cadence.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp8546
+      - ti,j721e-mhdp8546
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description:
+          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
+          The AUX and PMA registers are not part of this range, they are instead
+          included in the associated PHY.
+      - description:
+          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: mhdptx
+      - const: j721e-intg
+
+  clocks:
+    maxItems: 1
+    description:
+      DP bridge clock, used by the IP to know how to translate a number of
+      clock cycles into a time (which is used to comply with DP standard timings
+      and delays).
+
+  phys:
+    description:
+      phandle to the DisplayPort PHY.
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devicetree/bindings/graph.txt.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          Input port representing the DP bridge input.
+
+      port@1:
+        type: object
+        description:
+          Output port representing the DP bridge output.
+
+    required:
+      - port@0
+      - port@1
+      - '#address-cells'
+      - '#size-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,j721e-mhdp8546
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    mhdp: dp-bridge@f0fb000000 {
+        compatible = "cdns,mhdp8546";
+        reg = <0xf0 0xfb000000 0x0 0x1000000>;
+        reg-names = "mhdptx";
+        clocks = <&mhdp_clock>;
+        phys = <&dp_phy>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                     reg = <0>;
+                     dp_bridge_input: endpoint {
+                        remote-endpoint = <&xxx_dpi_output>;
+                     };
+              };
+
+              port@1 {
+                     reg = <1>;
+                     dp_bridge_output: endpoint {
+                        remote-endpoint = <&xxx_dp_connector_input>;
+                     };
+              };
+        };
+    };
+...
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
