Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFF25763F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F56989DA9;
	Mon, 31 Aug 2020 09:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932F489CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:24:02 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07V88aSM007825; Mon, 31 Aug 2020 01:23:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=prB5d3UpNSLb5ZXg6pCuLXJ2gXfF6Nsjxwq79ePfklFIS5V+c+ERlLIqsySogiYIZpOB
 q2/YR6jxJWsRHyRV5XFPrKke62JghvlVxBcChnimISHFr/wwPqiHo8uxJTxQqkkXAJ+h
 JdF9MlH1UgvD82elqEPFhzsgUtmh6NoiMaxgs4MRjM5i5KWHuV8sF/FE/mKDHnXYde1J
 AIkWtNn30ooO7JExyGqR49dwZfmR0Htj0fbM7npVUMvvkGqBLwdAKDcPLojPeOlqRe+j
 dd9u/9a8TUx/x7X1pOUykGYsbCDNEuHaDUUdji3uaBBKEWlL3oCOSAVdNu0TJXBaum6g sw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0a-0014ca01.pphosted.com with ESMTP id 337kjxe1rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 01:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ym68W/+yeMstHP6/b3PA8NIuqSOSveaFiKEXTJyvRxIF+kOBdksB57reuZpXfujjPmab/g6INWMpxAuMU6b17WWKpFqDf7BTboWZx2xWO94fzA8yoOhXCgJGUDpbxmd/GzzKPqbw7h6FE5thWUOHcdFgn/VDs1YFVNQaR+xWDYiVomSB5UmSrrDSzbDRMBIg69pyzRyOwovEstma+kq4SCniMjJqHSBuZMNLOgZrksn0YR8O/iTp+XOXGrNRALpW5Z1tPrztt0dDXhx+P3F3MXN2SlcrY2WI/xP/qNMwgHY2tfXgwdChTlSdbqEcaFYYjK9yrAOgE7WDcgLBqYLC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=aws2SlsvaSpDu+m8yBT3aZqludwH+r5scJ9a4xE2cGIUrOrVJ4KmzUTTgeCG1HqGozWYWriTuaphtfxC2VmExySkCrTP0eI2iKavmt0SowkzRbpinlLs2CAja/nmSyv1+a2qX4oVwtAhxDYTJqgAe7QN7gA3URcMkvUpPeD9iE2zzkDS1Y8L1pTwFbxzXXJkc5rYk4WVellXqnwYCSrulBuAkP6JBIia3YLvduvxUw5SHwCGNrC/fsSDZIxKwgWAFetpvffJnLSPbAhX9cbnXKR9O9lRUqfpL/gr+GPRioKlFWkGsyY7XRTzlQ0R1Vp0fyR89yo7GhzccAdKyK3SAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DixOWORt/YDCiKgHqsV7lEHjI243knGayPrCqMyV4is=;
 b=3zkol4x+KE4Xxd2l5sZUlvQRihVfGgGctN8jfuc8zDxqRTdj/zsCDNd52qVFgKIfC0NUnnwfGa/1w2EF9Kx6wgJRXf9IebrioUPXY48a3EZNeHWVFx6GaYD3ZlrveCJDWmpIBVOX4P/ICQeR3ie/yntyLZaUCQALyy2gFodgp3Y=
Received: from BN6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:404:23::11)
 by MWHPR07MB2896.namprd07.prod.outlook.com (2603:10b6:300:1f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 08:23:48 +0000
Received: from BN8NAM12FT004.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:23:cafe::a7) by BN6PR03CA0001.outlook.office365.com
 (2603:10b6:404:23::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 08:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT004.mail.protection.outlook.com (10.13.183.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.7 via Frontend Transport; Mon, 31 Aug 2020 08:23:47 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 07V8NeKS010126
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 31 Aug 2020 04:23:46 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 07V8NdQU010291;
 Mon, 31 Aug 2020 10:23:39 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 07V8Ndka010290;
 Mon, 31 Aug 2020 10:23:39 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 1/3] dt-bindings: drm/bridge: Document Cadence MHDP8546
 bridge bindings
Date: Mon, 31 Aug 2020 10:23:33 +0200
Message-ID: <1598862215-10222-2-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f0cd26-16a2-489e-475e-08d84d872f12
X-MS-TrafficTypeDiagnostic: MWHPR07MB2896:
X-Microsoft-Antispam-PRVS: <MWHPR07MB289605570B06662B6D826618C5510@MWHPR07MB2896.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4M2V5Y3zc+wwj4nCVVl71DvNpVtJlPAm+lQnRP+oL9W18AJ5taEa0ca8US69DdUfjUfhZmDgC58KgrogLAT+rc5X0yuLgoGEqq9AdDPXUJ3NyP8Ib8XTIZAgBlwLp1wkDnoGFZtAL3Al0ow0Mcc4yBNrcY2kmNA5lnW1rAwnw2UoPsK8pLwMdOCNPPGmGES1rFvtJT0n1fDpLO2E0VoGVl/cgnKTEnyEy5vcCFi2knbdpPGjoeCPJX9Q1u+ha2TiFc9IkoalTGzDje360/s4xVZjYorFCmq9Nnbr29UGgIA3WBV0bhkwbKh9CJ07OLBUaL+zgi5LPjEMAENttCHsMcRRR8PWJ8mtHRL0qG1Tyh0u1wyl9/RL/8lB2ukH2e8rAqUEpkxaiJwjzLEs5a5GPgeQWvk/yyrzu9+L0rDjldyNDvmNvDSzkpL9nwuRC0UaXz8slIIEuqViMpFfQWB5aRkzDVmlBs722mJUTELFqQooZPIyn/YOQjQAMgeD1+Cy3Qgdqq+FST7OYjkMAHTK9gyfUSrObSRHQSHqeFr4iT6gxmJkw4/80JV0m1e9PIQEhaQzHVxAzxZwrtcX8Ow3Ow==
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36092001)(46966005)(6666004)(356005)(426003)(8676002)(47076004)(81166007)(316002)(2906002)(5660300002)(83380400001)(8936002)(2616005)(82310400002)(82740400003)(4326008)(36756003)(54906003)(70206006)(70586007)(186003)(86362001)(26005)(42186006)(478600001)(336012)(7416002)(110136005)(921003)(21314003)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 08:23:47.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f0cd26-16a2-489e-475e-08d84d872f12
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT004.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB2896
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_01:2020-08-28,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310050
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
