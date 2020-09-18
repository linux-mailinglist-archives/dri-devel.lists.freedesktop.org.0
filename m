Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333F3270C06
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410986E1D5;
	Sat, 19 Sep 2020 08:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710D6ECE7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:09:47 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IC8tID007162; Fri, 18 Sep 2020 05:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=lEbS1gpBmXjT5gEwxoWOxGsIznj1j2HkKsmIO+haYGk=;
 b=tfgeBS8Vm+8qR6l6kG9Om4ixsvnuQrrZpKWPIvDCqSFcdC/CKBIe9m33t3zv9FsPmBdi
 3Q98FIhiMJKWrSKzBmQHh5+dYPapCsIu0FE2boznyFmozID/dgttnn4ftwkSJEz0RNBp
 75UNwtxswlTlMQalLHQtmEsUp9tMch4Z+DknyZNgYJETVgbYOI5EyzGkkcugN2+YIPkp
 PdX/fOwYFVjEYS0eRckoGkPmMtCNXp1vRl/Gv0qqolzR4cgkeDV9C/r/GHPaB5/f5ZT0
 LEu7iDJnvJ58En2ab9EY4dfgT7/jYEbM1IiWGjwMoo1oyrTFZYg6aAVhlxBw4V66Pbz3 jw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33k5nk3ym8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 05:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afio24zQ3YGcA9Cs89A2t2nSQHvtQcx5tIznt05fV6AnihT2LgUUVI9HALVWOB495rd6t5WKbLoXFI7mAwM8/mZbgvuiefMeexOB6IXKl+16bWvhchqyo/ow/xBb0sSzR5PKluSusNxLrv7/IkRWZm9LXYUQINwzL2ZVZIjmkYq3SUs841qTJySo1AjKGyYfsXmzduGYCyrycTSb+jbBzbKuxUWk1+umN4yOHLLBWC3WBGG7fSIjQcUVnysJ1u/BdqpNHnhd0iJceMrmiioRPIlL/fNZlwRg16FoauDV0+w36/KW8RodgcuZyBb94sfQsURWjWaJYeBjT0GXPivTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEbS1gpBmXjT5gEwxoWOxGsIznj1j2HkKsmIO+haYGk=;
 b=nGqIutF8nP3VZc91775ymu3RXOXxJh/W+UsdIZxZTuIeMdx01IJTP46gmZLY5hHcBBlyhuProvsDs4CC7jZmWkkk7cdJplih16o/aHm8V+leidJyV0Pkr9/KTMmhGvy25WewG/oUPsj7rTuzOsWHDS4oxlvcZ4tfeZaBCDmar0hXn6AseJqX82+Ed/AHChHfmD44wo+DUU3eL/AxE8JB6KtK1Ml7b1u3BqEb4kDKUjwKg9RFpIIgPrzjPxiro32Eg64sGus6S6sk76WbCtBuVvW6SWtcPrtohTxa7RxoYGPQsMPyZjH6ukajczqt9ATvS3skHZkvIRVqotPYt8qK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEbS1gpBmXjT5gEwxoWOxGsIznj1j2HkKsmIO+haYGk=;
 b=yfm4C1Panxadki0r0qyxIAA2XCMjjiNxZ756XdsQRAleqzRJpQGLF/9hAQI1ywY9t9ldGzioerTdEO6tqNPaK+kHXuZD5J+wlYnvUiXrGZR10RybLWtOuPehGxVRea+BihL+7KgNgnMnY70nVAJzAld2A0Fxht2MYGxlqaPxrOA=
Received: from BN4PR11CA0015.namprd11.prod.outlook.com (2603:10b6:403:1::25)
 by MN2PR07MB7263.namprd07.prod.outlook.com (2603:10b6:208:1df::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 12:09:33 +0000
Received: from BN8NAM12FT011.eop-nam12.prod.protection.outlook.com
 (2603:10b6:403:1:cafe::dd) by BN4PR11CA0015.outlook.office365.com
 (2603:10b6:403:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Fri, 18 Sep 2020 12:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT011.mail.protection.outlook.com (10.13.183.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.6 via Frontend Transport; Fri, 18 Sep 2020 12:09:31 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 08IC9RGr092496
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 05:09:28 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 18 Sep 2020 14:09:26 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 18 Sep 2020 14:09:26 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08IC9Q60023795;
 Fri, 18 Sep 2020 14:09:26 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08IC9QTW023794;
 Fri, 18 Sep 2020 14:09:26 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 1/3] dt-bindings: drm/bridge: Document Cadence MHDP8546
 bridge bindings
Date: Fri, 18 Sep 2020 14:09:21 +0200
Message-ID: <1600430963-23753-2-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1600430963-23753-1-git-send-email-sjakhade@cadence.com>
References: <1600430963-23753-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c020df-ddbb-484d-bbe6-08d85bcbb350
X-MS-TrafficTypeDiagnostic: MN2PR07MB7263:
X-Microsoft-Antispam-PRVS: <MN2PR07MB7263802A1D361B7BB6821B7DC53F0@MN2PR07MB7263.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwSEr+qUL4aJvdaAjUKgaLPahFbRo7d6p49mSoHH0BgMl6X6xWLsXmGjS02OxdoqO0LBYMuVlMotbUNVfzmRej8MXwf6gJRTr3LrFT9Typqhr8xd8ho+lF+FdJEgznJ9Q6D/NqADSfBbx1el39XgUFhEkSvmA9caIpaQDHRTdmuEuONwN+4c9IITvkxuCJRssNOFviN3tl3Xtt9NfQqTvMa25vn7OlqkGrE9BEGhT1R2mTNmMaqVbk+F5UltFQG2LTUJfC/qt4wYf5V9RVI7zGywPgwZV2O24hOy7PRjGE3galI8x3+HWLmuNH+ZlK8LLS0LBmBIcfL+0SC1sU4TiB1a4ham8b5BE1YDFu4LuoYFHUEVQWwKp4o9j/QDnrI/SVZVUuri+04/kwzAxiAwi2ISWA/0HfwnikG8IXFrjlVc5uXv9tjVkvZdJs8Sl25qGFlARu5ufIonBliSsUGC6y9+/zSqrFiO1ZSmbCBjq/EdIYx/dUda8Va/D2Yj6U8huSDLMNo3VI79WzOc4Vm/WBKAqCqTyxCKHFfTC3N+ckjZRVbDhrT6jLt5Z7PrYGo2S1oTMHlZjIm2NJtUCAbaVQ==
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36092001)(46966005)(2616005)(356005)(82310400003)(81166007)(47076004)(82740400003)(6666004)(478600001)(83380400001)(26005)(110136005)(426003)(36906005)(42186006)(4326008)(8936002)(336012)(54906003)(316002)(70586007)(86362001)(5660300002)(36756003)(186003)(70206006)(2906002)(8676002)(7416002)(921003)(21314003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 12:09:31.6277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c020df-ddbb-484d-bbe6-08d85bcbb350
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT011.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB7263
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180101
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
 jsarha@ti.com, vkoul@kernel.org, tomi.valkeinen@ti.com, sjakhade@cadence.com,
 nikhil.nd@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yuti Amonkar <yamonkar@cadence.com>

Document the bindings used for the Cadence MHDP8546 DPI/DP bridge in
yaml format.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../display/bridge/cdns,mhdp8546.yaml         | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
new file mode 100644
index 000000000000..74d675fc6e7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp8546.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence MHDP8546 bridge
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
+    maxItems: 1
+    description:
+      phandle to the DisplayPort PHY.
+
+  phy-names:
+    items:
+      - const: dpphy
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+          First input port representing the DP bridge input.
+
+      port@1:
+        type: object
+        description:
+          Second input port representing the DP bridge input.
+
+      port@2:
+        type: object
+        description:
+          Third input port representing the DP bridge input.
+
+      port@3:
+        type: object
+        description:
+          Fourth input port representing the DP bridge input.
+
+      port@4:
+        type: object
+        description:
+          Output port representing the DP bridge output.
+
+    required:
+      - port@0
+      - port@4
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
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
+  - phys
+  - phy-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mhdp: dp-bridge@f0fb000000 {
+            compatible = "cdns,mhdp8546";
+            reg = <0xf0 0xfb000000 0x0 0x1000000>;
+            reg-names = "mhdptx";
+            clocks = <&mhdp_clock>;
+            phys = <&dp_phy>;
+            phy-names = "dpphy";
+            interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dp_bridge_input: endpoint {
+                        remote-endpoint = <&xxx_dpi_output>;
+                    };
+                };
+
+                port@4 {
+                    reg = <4>;
+                    dp_bridge_output: endpoint {
+                        remote-endpoint = <&xxx_dp_connector_input>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
