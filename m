Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609715A33A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834066F481;
	Wed, 12 Feb 2020 08:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291316E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 04:27:17 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01C4Pm0T028917; Tue, 11 Feb 2020 20:27:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=aeN3ITfQpWw/wevJUnjk7tUHuRojPavBPF6Wca2bADHsdsBaU2sWNZxbf5A0QgptyoKa
 eEshzFWEeT6BYM5ULmOJLcZOYFmIhx1KlzQg4Bb28VG0+CcZAqLESh3PZ2K6HDn4Brsq
 5l0QKON78yOx4mcWtk9ndHn6YDp1Y2FJu7jTEeO5+RViyaBWaRzO7GBumJvpEBshY4UI
 V9GEY2DxWUCR3DeMnmwzz8mIWfvK7SXn3E0ifiVjGdzmHMl0wNyBXF95Xm+iGeeux+16
 tmP0hvLOOaN5t04juHnevVi7G/CHIzpcm6fXpzmkbrr+5tzKBU1Bw49BQLcGDlbPcoRS TQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2y1u17mxnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 20:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNLzAnzCrfoHm3iurF0+I79vn+heNa61ZC40/XYrTPQtBLMaQ4ZvJBpDVhK1CKocZvvKX4jgjl194fjeQ7AlK7wcNeJGQ47S34uKtky/lPzRKQRTPGbr2GCacBXHRieYmZ6zlg0tqfCOxk45A3zmsPwlj6FDceIyNp8B7+RdeCFj2/QvWKlqYs9mQ6XmX6pBKJGhR2aKiAOhIEPZA83PQil+2pzr8GYJ78wKLKk++2ifzjyqHDmq7rQ/yEgVK6ySpiFVqam7XPuaa2Xp8y48Zl9li6BoOT9s0ylIev1VGAsOWba2++jHG+cI2km6hOJdRCqkEwhSWiKz9fRUHSwEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=lcRgvd+t50NwN0tmS8ea3ERmCzgXF7tdknTnKMQtzDYPDV/LyUQwIl7hFHG9FKO9vY6WeG+a22558zqvDcOa8KsCKcY+Vp5SqDrHg2Hddr8KhSJ0k9NUVOpXB8Ndx2SbHuQs+W3yJLKKZLMQkIOjhlICR35AOdXuuX0YrVh2yo4fOm6PhF1ciAI7IrRI6r/p5YqbccsOnmEB9TO8mkyH6FoQl1+rIy4xh5qgBen4qP4DLTFAcTrg43uT9Vuzj1cg5HgQa8hm33/rgyAvCG8AJJKIQQGI+ovoUIV9hYmKPCoebmuLSG/T2LRDQ7PjExKmAwq1Xas2/RabbIJdb+F/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=x1Jk0hN+LlpAMSyVj5kBeZkNVv3PQonLCaH5miJ1ijzt86Ni1oaoT8x38Vxf8O6n7H5F/JLHUXec27n0QAzryP4h0bLdmHDOTYX2du69Td5rCIogciB9DX3ZzPVFT4ZUYy0u4oGzOIsU8e3fUEpK+fY8mwh39dgCG5BamYlARmU=
Received: from CY1PR07CA0031.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::41) by BN8PR07MB6132.namprd07.prod.outlook.com
 (2603:10b6:408:b5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23; Wed, 12 Feb
 2020 04:27:00 +0000
Received: from MW2NAM12FT044.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::206) by CY1PR07CA0031.outlook.office365.com
 (2a01:111:e400:c60a::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via Frontend
 Transport; Wed, 12 Feb 2020 04:27:00 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT044.mail.protection.outlook.com (10.13.180.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.10 via Frontend Transport; Wed, 12 Feb 2020 04:26:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01C4Qnka007965
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 11 Feb 2020 23:26:51 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01C4Qnlc024549;
 Wed, 12 Feb 2020 05:26:49 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01C4Qnqw024548;
 Wed, 12 Feb 2020 05:26:49 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v5 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings.
Date: Wed, 12 Feb 2020 05:26:42 +0100
Message-ID: <1581481604-24499-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
References: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36092001)(199004)(189003)(8676002)(6666004)(70206006)(316002)(36756003)(356004)(110136005)(8936002)(42186006)(478600001)(54906003)(2616005)(26005)(426003)(81156014)(70586007)(336012)(186003)(81166006)(86362001)(2906002)(5660300002)(107886003)(7416002)(4326008)(26826003)(921003)(21314003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6132; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0ecd2ad-656a-42a3-325e-08d7af73cd92
X-MS-TrafficTypeDiagnostic: BN8PR07MB6132:
X-Microsoft-Antispam-PRVS: <BN8PR07MB6132E4D6DCAEAE3735FCEFBAD21B0@BN8PR07MB6132.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0311124FA9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5n7OMKVBdBOnvbb0IW/y3FpO1RbB81MAFjwwR30AnnSYTqc7HJdolOYFNCXbKhSHVQS/FIeq/IFvmS5aFMZXZyn8Myx9XJIBxkj3MtfCE7iQI0+eYFqPo/Y5pR2TaArnuP1eY/zC8UzIiSmX00Bj+Lxx0pS3ZpAZGTlOGqYCJg4TW1kFnudQCO5ei0vIItv5/QgU7lqo8/eGd48cT8SyeCq0UYF2IY+TvDtWKMVY7j9p0axe3Wdo8DK1YBP5lH2WQs2Whmp03RjMELm2yectDbKga4KCIOx21VwQx4+Vmqh+DKftCWuyG2pULaEoG/xmX++t0lnsoWzyalI1FSpjOJEVczBIMsUXXfUOUXCw8NeGb+TO0sjgY/2ie2Tg7br3th10uxPavnSSPmQzZkwQQWxca2pqjgYrIlFUrI+ksuidgodhO7z/osSIy3IXdaQQHj56L8rFkVWetEohvAgPKPEj0d8BfOWtG39OcVQ7cvkOfh6OkDtmkk1lgAMdp4/fb+LG3WtemqApX/odf24O2vaRz1ntATb+SyPPXewtg6bmHT9XINlma30+qcOdOQaY2MTeSnx3aRj8crkhbb1+TQfyVs1aB0K3q5XkYejkzck6RXFT/DkMYllF8OLxvWOLGDNEet5YjvUUL8Yg2hGyjpxuAdbHArlUIb7f0efst/E=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 04:26:59.9635 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ecd2ad-656a-42a3-325e-08d7af73cd92
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6132
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_07:2020-02-11,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002120031
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/cdns,mhdp.yaml    | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 000000000000..e7f84ed1d2da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,125 @@
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
+  clocks:
+    maxItems: 1
+    description:
+      DP bridge clock, it's used by the IP to know how to translate a number of
+      clock cycles into a time (which is used to comply with DP standard timings
+      and delays).
+
+  phys:
+    description: Phandle to the DisplyPort phy.
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devicetree/bindings/graph.txt
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
+          input port representing the DP bridge input
+
+      port@1:
+        type: object
+        description:
+          output port representing the DP bridge output.
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
