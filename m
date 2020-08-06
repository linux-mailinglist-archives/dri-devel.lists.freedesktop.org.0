Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4D23E7E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFEA6E972;
	Fri,  7 Aug 2020 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2486E370
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 11:35:05 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076BPHEA021976; Thu, 6 Aug 2020 04:34:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=lpu3R9pnJEeYMPfZkRDd6NNNOjlZmLlWX81096+hIF0=;
 b=tOwdgn1xj8iQeTTNkWlbqv/Z7e5ov9tvfiACiFqqopM4nQrVYB+LJCaA0vqzGpBsyl4i
 ECDKkaYuiq4CC1riaV41jEDfvhF4zFp0JMI4TchpIAIhcaN/9ZJ1F3ZXTAGC15PDVQa8
 /VTNEoWgcrSutU3nXHrKNafweVcFrpH+XTrcD2Qjl5eyAoANUpr0cbkBFGlp+W2OT9p7
 HfH0INjkF1/OjxH4dNDQTiCn3JnaW3A4+OXCK5Um+5zad1jvHRcNxYMSSvqtv/fumFWx
 L6D0HupBOseuNMYBexEJ2xwy+oKU0dqcgDSqfcAMTH6i2Obilvgk9dEotgT8u7H2hYNT Rw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0b-0014ca01.pphosted.com with ESMTP id 32n8gy1uv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 04:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6KIIb228bj11R77OeOpZU3wXab7L/Deq63qL90YrW8r1snK5Fir0jb1vhcZbGwVfZ1cBJ/C8dd94gXAlax5fLWKe1qv2xbczaFr+5VR/GpEd3LvNXOtkcSZZsaCvVIVOJ37g2RMZT5YSGdYqnRmh+QaHqOdzM5RNLX8TCXUYeYtBF/paurW8ZCg/4lX5xJ0a1uRQTseEJtmR/t6mui88a3jcNyphA0P/K5+7aeE09rS72oaJmLqRGtOHY0ihcKIvFPjrryiLUexaT7sZv1QknhX0JSHq+y9sUFs2aguvZSmiI9Sy5fG+MHyJsIJekhQN/T7sPgPu+dpeN2u99Zn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpu3R9pnJEeYMPfZkRDd6NNNOjlZmLlWX81096+hIF0=;
 b=fcVnIMqkk2K8LYcjX25IVMJzZzoC6qYP0PlOnM65d4ceW3P+ZsDPOeQMJqns5I9OBrnqvWYAiInK4LJVEW1DfiiL5LqdVdtga4kq6VtV9PgtaUymtG6Yuy+RVt9yggO+/XXoJSCOn9gAR+M7upGHaTF/H1lrjtKRjKh8m87YMln1R+EjE7neWFxCBO8gSWY+8nKVxpKo+Aeoc8XMJ9H4b0PLgSaoKUOAQ+0055fyPBMkF8xFitlv79haqHFFEmy3j1FzGa9kZBooiuD/m8Gny7GVi3kyEFyLSc9D49Q17xyq9W64xqwZUg3HYfVkPLFaTlOpG5N2thi/7BI8B8dicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=samsung.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpu3R9pnJEeYMPfZkRDd6NNNOjlZmLlWX81096+hIF0=;
 b=MUPEndLzT8+BVNZStgGY/AiFobRpIJ4wHQ6BfmpJkM6uxfR7laTDmDcCEjRsKMLNv5mYNH1vuGSLGWGZ/Aa4ouNmI9u9b5YzIXa2c17jEpTIJcnxNN80rEIDABIQqkGWArbIfdizPuW+oBn77tFjP9hMd+/9oS9x7HQgrplJiFA=
Received: from MWHPR21CA0040.namprd21.prod.outlook.com (2603:10b6:300:129::26)
 by BN7PR07MB4835.namprd07.prod.outlook.com (2603:10b6:406:f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Thu, 6 Aug
 2020 11:34:48 +0000
Received: from MW2NAM12FT039.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:129:cafe::14) by MWHPR21CA0040.outlook.office365.com
 (2603:10b6:300:129::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.0 via Frontend
 Transport; Thu, 6 Aug 2020 11:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT039.mail.protection.outlook.com (10.13.181.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.10 via Frontend Transport; Thu, 6 Aug 2020 11:34:46 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 076BYZWm083124
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 04:34:37 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 076BYZLq008204;
 Thu, 6 Aug 2020 13:34:35 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 076BYZd7008203;
 Thu, 6 Aug 2020 13:34:35 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings
Date: Thu, 6 Aug 2020 13:34:30 +0200
Message-ID: <1596713672-8146-2-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2c18fb-e488-464f-70c8-08d839fcb8d4
X-MS-TrafficTypeDiagnostic: BN7PR07MB4835:
X-Microsoft-Antispam-PRVS: <BN7PR07MB4835FC8D026B146DE90B33EDC5480@BN7PR07MB4835.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VE7roeJIKnK+Jfd7Ulve5dZTvD8CxfqyBVlj/HnwVk62aPU6H9hcvuZGifUCPFU4ImF/3gyrcbi/AyYM0n4P97MDopg20ZKR5pzWJf7rwA1VwNogV6uTy6OnychY6ZfZrnzryQhrBc9TA6i3EqhQDSBPnb1GkE+EFjln3Py6NMjaSQ5DxXs4KJ7EdypN+qNX5KQpr91jdsLm/vDUw2EQZ37nA4mFsk06La3YoNxghnJw3JWnwNhTpSZ3nIXbQvu+GZljRRqpsqKJeLL92U8o0jgwpQW3zKkk4a9YyuNDUO6kBzeqtNBkrzRyUoAVgsHf06C7djiC8SNipfY2N7b1puZgTz+tBOcYiQSnwRlGg8sk3cYMRG/cEdDHUzbZoNpt++PZtlY2M69kxtW980Ol/3BqdOBlARjnJNvivqur+Iu4Riqv73IsVRkBi9Mlx4LF4Qnoc7vgbSQ3LO6n/nmYIvhFh+rGcU+9/hkrWC51fSjmjYLyAWcDeGMTgW12slciaYO2oL5sY5SHnYUKhMldEvvwIL0SznhuQCFvMrpGogyDJZyu86Yg9yulHqUW/zEUr7efnR6kCCASagt0+L/W6g==
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36092001)(46966005)(8936002)(8676002)(7416002)(47076004)(4326008)(82740400003)(70586007)(478600001)(36756003)(186003)(81166007)(70206006)(26005)(83380400001)(82310400002)(356005)(86362001)(6666004)(36906005)(2616005)(336012)(426003)(2906002)(316002)(54906003)(42186006)(110136005)(5660300002)(921003)(21314003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 11:34:46.7797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2c18fb-e488-464f-70c8-08d839fcb8d4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT039.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4835
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008060083
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
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
 .../bindings/display/bridge/cdns,mhdp.yaml    | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 000000000000..dabccefe0983
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,139 @@
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
+                port@1 {
+                    reg = <1>;
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
