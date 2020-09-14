Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F804269F34
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BC36E84C;
	Tue, 15 Sep 2020 07:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F276E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 12:49:08 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08ECiREd023215; Mon, 14 Sep 2020 05:48:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=DsBXX2pDRyQwEauQsnGT5qu6sld2gsn91ENq+y2pys0f6Tk4fS7NsyXeuMzm9ewv5Dtb
 U6xK5opP1idVbCQEBHS3WGhWWuwno2Ys9JNySI3MI36bqMYnRPUbNE4tt2mqDBd0DB/M
 M2V7XQGkw47dF8WdHMBY+8wYdu39OLYhw6jnPDD5ys2LXcQRAO9t8DTHg49T7FtdTQH9
 wa8y6nr4r/Z6giuvlOjXsp+wWQWlGuk+1RRhT3/dTzbxUZiYBkhT1HwtUB1QZz8ri7Lv
 TpPcUfgj354av37m2XoJ/5Ufjzh7RGkySgnTXUt61LYqE78x+Qz4V5GzYfnk2Hw1T2ww 0g== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33gswy5vw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 05:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb4mJjC1RLPZCvfp0AhHFHe9jpBi+4xVv2vUQK5J3sv/4inq74v3tscqUsf7/pV7QYJOQloiDvSRUI2Wg2a2Nk969VdjcGv2GK8F95S/nFjzuRciYXZbeG4/OlxMV4R4U4HvHYd94DoCkVuRKTvKfFDXkbNJwopkEO4D1mBpxik5QNaAFF6idlz8/olAGLr5SzcwVi5Tpxc4MSL4UPl05j8R38yNa5B8FxAtZloANVYj8ZUOLWjUkZIADoGkikhSj7StCCBTLZX+d1yw2Vf76nrIx72yTVCwfhXo0ppmZ+xMh7pKp6SUR+hfMfc+E+JBSfKjCr7TgBhqVkhRcOKBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=fP9zMalWBbP4ekUEHCOLSRSLifiwb6NxEACYWSEjlQrUs97XtuUOFyy5VLvBt0opmuEH9oV3vFMIzRIBRGQjV+pYyl5iP4/Nt3q+8v/V5CEuryGMx2kGWr5H7CY0KMMl6DfbYRFcemYssftp+7Dl7bb8ZM5nHypKGbBlHq3+gYeam5SaJfD8UY6bVoHhdO+J+xB2itPXxI3F4UP7LAKpKG3R47zitCYDvSdtxi6Wr+gq7ReH8Xi43YNxJY2K3GqtDyYRj6as9NqitSjdBxxPH11zyTUGd+ojXyRy5q8yhlvveLFJA0EX3D8ISVWZcGggnKn4FJW34kAkzPBj0jzniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=DC26JWeof7swp08PU+r2Y8yx3lrq9jGZYwqT3F/4f1hvaDqyaB6Gv/SO9ZSMZqNJEgEfP5S1GFabJ2gpM+gZcgxRjod+C4pk/i8+xfCqINsL+Y82OJEq3Cwfp83ROyn9TSbGTumbYsTGOnOLahMh3eX3CLNMgFAg3WbSdg6PtfE=
Received: from BN4PR10CA0019.namprd10.prod.outlook.com (2603:10b6:403::29) by
 BN8PR07MB6372.namprd07.prod.outlook.com (2603:10b6:408:b4::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Mon, 14 Sep 2020 12:48:46 +0000
Received: from BN8NAM12FT059.eop-nam12.prod.protection.outlook.com
 (2603:10b6:403:0:cafe::c2) by BN4PR10CA0019.outlook.office365.com
 (2603:10b6:403::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17 via Frontend
 Transport; Mon, 14 Sep 2020 12:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 BN8NAM12FT059.mail.protection.outlook.com (10.13.183.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 12:48:45 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 08ECmd4i017910
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 14 Sep 2020 05:48:40 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 14 Sep 2020 14:48:37 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 14 Sep 2020 14:48:37 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08ECmbTi015771;
 Mon, 14 Sep 2020 14:48:37 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08ECmbED015770;
 Mon, 14 Sep 2020 14:48:37 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 1/3] dt-bindings: drm/bridge: Document Cadence MHDP8546
 bridge bindings
Date: Mon, 14 Sep 2020 14:48:33 +0200
Message-ID: <1600087715-15729-2-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
References: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781ffe31-1278-4659-aaaa-08d858ac84d1
X-MS-TrafficTypeDiagnostic: BN8PR07MB6372:
X-Microsoft-Antispam-PRVS: <BN8PR07MB63727DB3C7E76B78A41955F2C5230@BN8PR07MB6372.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZWyvuBARfwU8O4dFQGey/FHPIw//vd1bFjr7mXSEuiKH4BfMj5/ZneOg+LQHVbkQd15SRtDxzh7LEI0QKN+54A+jleYiz/Wf+fuLgkzIoNEGu2i2ydzqcPo4uvwTCqI/DlTiBKiBEPBouR9zbTE5p2UFFt3PTkhh8o+nLEh6Ps1+atOf6yF8yMSxCaX1bxG6yO3MXYEVbfv0VTDLB9/RY2QVvh24OC7v3DEb5w/xxdkIy2/cySCDLHyPTuo+YSa7NongQe0C8NqEbfV55MIg3RNb8aEdMurInoSXCB73AW6/Oxsne5oN3pipBc7dzH23gBbTRXolD1h3GXinZCEFoVIW+n1oc6agm5edmIAf0ZrZXdoGRwnwivCqyotXZuo/Vso1ce66CPgcxMNtYMih0M28jRN1JwVGTZVu/uvjIOonYR9MeoVTLJxWGBw+BfhtiJOnzFuhCIC9i7WjKGNb18J/7JsgbIPXyyGlfCvsmZO0iD6D9up+Mj5r1Y6w79MVuMbyOjgFG26xPD4ByY2LZ5jUt6sYzW4gzS3w2wmkoHD57UKPmWjl5aCvuS7UlJqNkOvoofBXsZPu8jYVspbag==
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36092001)(46966005)(82310400003)(82740400003)(42186006)(336012)(356005)(2616005)(70586007)(5660300002)(86362001)(186003)(426003)(7636003)(83380400001)(26005)(110136005)(54906003)(478600001)(47076004)(36906005)(316002)(7416002)(8676002)(70206006)(36756003)(2906002)(4326008)(8936002)(6666004)(921003)(21314003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 12:48:45.7438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781ffe31-1278-4659-aaaa-08d858ac84d1
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT059.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6372
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_03:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140103
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com, nikhil.nd@ti.com
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
 .../display/bridge/cdns,mhdp8546.yaml         | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
new file mode 100644
index 000000000000..a21a4bfe15cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -0,0 +1,154 @@
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
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
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
