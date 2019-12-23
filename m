Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB612A241
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1306E5BE;
	Tue, 24 Dec 2019 14:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B096E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 15:17:19 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBNFEpQm001038; Mon, 23 Dec 2019 07:17:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=YgyksHBAPeIEoz+j7AlhT4e/+oQ0oeeSvmEI9Cej+2w=;
 b=fUFDNsBJK0OR4vcC2NZpz2A2B123O8DFF+Br7ZBIGk70KDxnqe2R1XUN0PP09ra/HAYG
 x69eZvFrOOFbmcWxEJcaWrdJiGZ6iZHBEzNiG72BBO91eP7p7Efg4aM2J/GgKOafUGbX
 ta6jaCjv+hN4vhoK2iDb/gTZqfnrKgUbHZeKjLT5YNDd+a/WeMs+JNCilMjkvLJ2/JcS
 1yo63KP9mMlqENmn6h8Jm1ewLntFx0hoxc+Mvtf7Q/vwscRMwqy8eH0KeoEOu85Kkfox
 6llrbL3LAYtv0iuMdNoAGn180GqE7nzH5LP2MBBBiSjNM0HCyWW2bDr/W3aem4eq2+uy Bg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2x1gu4wau1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2019 07:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzeCpDorlB4QijypPW8U1OzZ0/ukyrNdZY5uZS0vcBNN3DW+aWO1/aKRJ4GBhw5qX9W0x01jJKGlAudAK314/kO0PEfo3LkKfVQh8GP2AseNCSeicAXGqWSO21ONtH0bWb2Bp32YbIhdZhxW/5zVtXg3FFm6BqITgil5U5xQYg+xT6K27axA7vEvTK6Ku3mumAW7NBmwQi1nQzPTpmVtM8/YVrJT2B9yZX+tNY7cd9/jOB4c0Xz3Yu4cpxePD4IapQseIfY6tTwDMMzAYBVaSX9Iq/cRISGejc/PBpnUWjPJNsK5h/G3byGw289RSc8m+Kg5zrIHxnZb8OdU1RK1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgyksHBAPeIEoz+j7AlhT4e/+oQ0oeeSvmEI9Cej+2w=;
 b=OnlsvIcWh1q7whaTUgOBStcTXsGnKRBTdSYzRI9SWG0Lrb9LiRaOUNRucDOCkWQQJq8j/gIJy7+C5lDAbryzNUYGcS+EJQb+B/xgGgXpa6k53NeOkRBmbhqIW+xiJzsgVwExjmqUnmzpQ2sffHqyJuw/Qs/hz9UoXAyEni+PteqUOk19GKxxM1U6pTEWThXYLjGHmmWZg8kSFUSyaI3djnVATo7FOipgpE161zC0SEtnc1yNmzoStVNolN6MZNVgsOoICaALd1MW9Ry0R9i2VBart31r0b/FnM5Oomg5bOQTvZ1y4d8D1fOKj98sCNjGi/+7ggk55ZC9ztbwdRrrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgyksHBAPeIEoz+j7AlhT4e/+oQ0oeeSvmEI9Cej+2w=;
 b=ZaF8OW9IwjgEATxCu2BTepGhjLluMQ5F6rkooMbOAHwQAoS84O8NFIYXBynLFFO0FRR/jRJsEcMGDGnFQg+vCpzqgyg+O4D/ujRACPRtMqcGzC4nfoFyRh2nh00Hqm6KmxHj/46sKvdPQlFK5/0fBAAf51MRqWwCm79VCAFpvNs=
Received: from DM5PR07CA0105.namprd07.prod.outlook.com (2603:10b6:4:ae::34) by
 BL0PR07MB3908.namprd07.prod.outlook.com (2603:10b6:207:3f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Mon, 23 Dec 2019 15:16:57 +0000
Received: from DM6NAM12FT068.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::202) by DM5PR07CA0105.outlook.office365.com
 (2603:10b6:4:ae::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Mon, 23 Dec 2019 15:16:57 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT068.mail.protection.outlook.com (10.13.179.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Mon, 23 Dec 2019 15:16:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBNFGkVP020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 23 Dec 2019 10:16:55 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 23 Dec 2019 16:16:46 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 16:16:46 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBNFGkYf016103;
 Mon, 23 Dec 2019 16:16:46 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBNFGjDM016100;
 Mon, 23 Dec 2019 16:16:45 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings in yaml format
Date: Mon, 23 Dec 2019 16:16:40 +0100
Message-ID: <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
References: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(36092001)(6666004)(356004)(336012)(426003)(2906002)(5660300002)(70206006)(70586007)(2616005)(478600001)(316002)(26826003)(8676002)(42186006)(7416002)(110136005)(8936002)(36756003)(86362001)(186003)(26005)(107886003)(4326008)(54906003)(81166006)(81156014)(76130400001)(21314003)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR07MB3908; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313a05a0-445e-4b48-9dd8-08d787bb2693
X-MS-TrafficTypeDiagnostic: BL0PR07MB3908:
X-Microsoft-Antispam-PRVS: <BL0PR07MB39081A908B28D6279550AC77D22E0@BL0PR07MB3908.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgGDlvInjQ3C8wq/kE+5B/7helziTGwUiPUDl7Jusxg9uB2fEvnZ+P3n2l4YwUPRt2hasVbgDJlrqFsAMl27g7Odxoh3XwGi6fehY47VYJ06rogLZH4NqGaLxj5zjfZdXTEQpI+tzTMy5ML8eTJgLCc1ywkqlgL4VrAWEIJQZ4j/B/4BwmglQ5CVzfLACv9OZvq6C8ZFbUXgHqnAe6yQnH6q/J2I6GdrXhSq5UDyyaezx2sTUWhHgzc0etDYHWI7S4oSaQwtzBLL8uyjZxSMbPDrmquXWQ+X+PIiDbkUvzITiPN1N38jksFQ1pV3q8w+pOTGz+mKrYR4JeeHx/KdbR4clDIU2iqZCwFJjBqO6x7CdJyxHTU6vj4nUXAFSLYUezR5Tzeecmv1z6NKxfSMC2RkeT17rIWQLiZoMedCQJyM9q3HOp7akWO6qvrjtb/Oj7U4NFdQuo40vmxTaY9htoy5ZxVjq1Ye9w39NO7jCo5JPtcGiT1uIefBRAOE6pc1p+9YyUvj8o4QGJ2FQMlrRBwtc5VAD+k56gImiUSALArpbsHAjkJesEPXPpUdHqNIKdV3wIXCst9jS4axxhlqN3UH8DOC3fn7YwbG0pRPovP1UKzRTjcUXTTMWkCfECAyYKUSKdXE/lqYa9qciVWxzg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 15:16:57.1336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 313a05a0-445e-4b48-9dd8-08d787bb2693
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB3908
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-23_06:2019-12-23,2019-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912230129
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the bindings used for the Cadence MHDP DPI/DP bridge in
yaml format.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
---
 .../bindings/display/bridge/cdns,mhdp.yaml         | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 0000000..aed6224
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,109 @@
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
+  clocks:
+    maxItems: 1
+    description:
+      DP bridge clock, it's used by the IP to know how to translate a number of
+      clock cycles into a time (which is used to comply with DP standard timings
+      and delays).
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description:
+          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
+          The AUX and PMA registers are mapped to associated phy driver.
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
+  phys:
+    description: see the Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+
+  phy-names:
+    const: dpphy
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devicetree/bindings/graph.txt
+    properties:
+       '#address-cells':
+         const: 1
+       '#size-cells':
+         const: 0
+       port@0:
+         description:
+           input port representing the DP bridge input
+
+       port@1:
+         description:
+           output port representing the DP bridge output
+    required:
+      - port@0
+      - port@1
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    mhdp: dp-bridge@f0fb000000 {
+        compatible = "cdns,mhdp8546";
+        reg = <0xf0 0xfb000000 0x0 0x1000000>,
+              <0xf0 0xfc000000 0x0 0x2000000>;
+        clocks = <&mhdp_clock>;
+        phys = <&dp_phy>;
+        phy-names = "dpphy";
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                     reg = <0>;
+                     dp_bridge_input: endpoint {
+                                    remote-endpoint = <&xxx_dpi_output>;
+                     };
+              };
+
+              port@1 {
+                     reg = <1>;
+                     dp_bridge_output: endpoint {
+                                     remote-endpoint = <&xxx_dp_connector_input>;
+                     };
+              };
+      };
+    };
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
