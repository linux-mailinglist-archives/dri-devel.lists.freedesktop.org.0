Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07011153FD4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395AE6E487;
	Thu,  6 Feb 2020 08:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBD46E37C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 06:30:19 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0166TLdC010492; Wed, 5 Feb 2020 22:30:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=rDnl8rijU7FW/1zEqKOhqMlwtv5fnbgpduMVnLjP48Feyv1PAC+0IseFqRmCUf+tVvev
 upIC/O7/d1G4DSrN9EPZxuac9srx0l3P3fAoo5I1SIm3jPc2pxpkqcHKH2YAnY7sn6R0
 zEwxReDkNyyrJSkEWxQC9Gq754KhQNeMWnSrePkn1PMNsAlM3E1Y69nOdnw6X2qvOpuO
 IjxnDkCP6SdzS03ypvNL529w5quzLBuJug+0DUMjnm66w0+KBlMgDgbgm0FkAN/fRXQZ
 6icq0Br/XbqssWyEAo0N6Gnw4DIXRt9tbHYN8p309FNa7TEoORVuAGNXlh8Bxqdc9fw5 mA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2xyhkunt17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2020 22:30:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPtx/8N9hlN5KDj7eh6c3r7TXUeZTFqTR/PokZFKTtoQ1VBVlv8ZlsVbCsWktE+ufCIK4bozMFdAiigc+OSwxWS8WjsWHbHxY3rLmtlTnWpY2nTgRqtYK0S/QqNFoFOENILKx47MOEhapgsTd7zMYdr1NmWpl6khiL8u8T7gnkjJM9nn9meY7W7oqjZuSXN5bZ2C+g3NnsTkYNm2o69ZrCK8XgfrHcFndJqbDpLBNbIF7ezAEerIA/sMmuBdD2Atpp/aW32BM4m7jYf6vCGI4NRsRCNP6cBlupj8wBat8M1/wHYp4Nnsaoi3t10GA1gGBAfSvLjrdZnq5kZCrA7j7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=AxcE0LmcHS/rj0WCMWxl34yuz952xOegubOu/PjdSIGjtNrnVI2CvLwA/DKCKVOc0Dj6Sh9Y3yxXvN5zEoNkXgRVlUbrVP+kngkvRBar4HlZ/+fyKNV3SBL3E5OqYJkB6dEqUIRRrQc60JUUH1y1g03SLGj8WUwsenpiBg2z7EJcZ/GFwO/VXw71//47cI+D6tjE0HST+cdnHO0drvHZIaqqMloFlXDknGDZZg6MlaSN9wKCbuAQgnhgKhN/F8NHUEpNweXZAq4YpLsx6WFpvq0xCeWHShgO7mmjxhTamQneP+iU00j4StYtqy/xdGSPqeHRTv2RI/iJSTz5m8EGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGLmL+Hezq/kfeotyjG/FsxuXIwdei+vvf3WST4MsLQ=;
 b=ftlQOeVXFhwiPdgpZkBbKJXKIcKgtPfRaHK0nLhQppmrX1mQeBys3u4Cg+BvnRZ+LdxeXat4z0DDzXiZqGnBHAzPcfSiiqxO4LNBsye1eX2SBwKwAIAsiq/kfUAsAyI/4VMqikE0dfpKbiYTUB+MXnFFISsqxJgAk2olZXkd/KU=
Received: from SN4PR0701CA0010.namprd07.prod.outlook.com
 (2603:10b6:803:28::20) by BYAPR07MB5750.namprd07.prod.outlook.com
 (2603:10b6:a03:a2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.32; Thu, 6 Feb
 2020 06:30:01 +0000
Received: from DM6NAM12FT027.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::201) by SN4PR0701CA0010.outlook.office365.com
 (2603:10b6:803:28::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.32 via Frontend
 Transport; Thu, 6 Feb 2020 06:30:01 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM6NAM12FT027.mail.protection.outlook.com (10.13.178.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.10 via Frontend Transport; Thu, 6 Feb 2020 06:30:00 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 0166TqcX023018
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 5 Feb 2020 22:29:59 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 6 Feb 2020 07:29:51 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 6 Feb 2020 07:29:51 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 0166TpmU021644;
 Thu, 6 Feb 2020 07:29:51 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 0166Tp7O021643;
 Thu, 6 Feb 2020 07:29:51 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v4 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings.
Date: Thu, 6 Feb 2020 07:29:46 +0100
Message-ID: <1580970588-21596-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1580970588-21596-1-git-send-email-yamonkar@cadence.com>
References: <1580970588-21596-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(36092001)(107886003)(4326008)(336012)(186003)(426003)(8936002)(26005)(8676002)(356004)(6666004)(2616005)(5660300002)(86362001)(70206006)(7636002)(246002)(7416002)(70586007)(26826003)(36756003)(316002)(42186006)(110136005)(54906003)(478600001)(2906002)(921003)(21314003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB5750; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4db2e356-0cbc-441b-d07f-08d7aacdfe78
X-MS-TrafficTypeDiagnostic: BYAPR07MB5750:
X-Microsoft-Antispam-PRVS: <BYAPR07MB57500373D0300A900DF84C9FD21D0@BYAPR07MB5750.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0305463112
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hub0gSLyG7vlgVn5gvQaAwBpzHh9MmI5p5D+RrQ/jpjNLZI8Dxfx9iFgnIYMf2A8m8FOaON/TLBS+t0vC2KpD3cqKWe9jMaGQ3wRNLqlERLkEuWByTeqaqxX0RdNGuZmlXHjWDiTU4X/37vlyZCeaQD6CdBQjYSEmiHJ0gTbhYPysVtF49gcj4Bh7hWD/wKw9Gp0R80Ae5L3tA+hdNrnz9jHg9DqhOpnK2VSBNiSuTv6JE8PQ+vgySh55CWf+EsVrex8isRu7UlfD4FXtgiu2dDgMgPfuiUvxzMgPt/l2FsVu6NFhKYHHz5PM6CWOFxSxPE383gF9xfoH5QPgQRE93CJzlymnnjh+sMLT6CAEbpi2lAT36FoLw3DZUVzF5dbz5qbh8oDq1ExSG3g3JGguBf85QPGaZG5rtv2uk1+8M1hhA7l7cdI1OWqUEFu4Ct3vXKKeLdMrX4Mo3+6XfWU+eVxu6EB10njqxCq7nnhBxIvS9AVqd0o5mxQ/Lqc+IeHLj5YLqyvUexZZ0aP2ZfB1lY6o6vcAS0e0Hlf7t8SuN1GfQZl5ZKvd5Bw5G1D1P13XDfIbncMBl4HFvJhAjL9PSG4imBTjMTKTWV893fxY4zC37ARHmUr1U6pi8k8/5wKh4uGNDAu4gCqNWUf8npi0ra9vWPxUf74rPazweAlp1w=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 06:30:00.9393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db2e356-0cbc-441b-d07f-08d7aacdfe78
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5750
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060049
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
