Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C417122F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8E66EC23;
	Thu, 27 Feb 2020 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D369898F5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:23:27 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QADwbp019959; Wed, 26 Feb 2020 02:23:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=2zJpwDJD7rTBJSBnET5BQwzNFonsRn15GQ9+Kjo93qg=;
 b=B4iOQdDocFDoNj3+0wdPyBMHBgRzSOSBOPc+GYrCtBcVK1EXSy9X09uRJOwGXIaeBYkp
 kEd7Lfo/JicpXk6SEzgvXGvs3F4h4iIFnpub8zJcINvpzPV6MhJhHY+pzl4sNoZNhb46
 EKgwcAsAZjexdZx0M0FF+nH37gHEG4dIw1xPcEKzaT3CRyFm1Dv9I4ybsUOgQqhRQ7aJ
 1Z3w9ng3AdC6zZjU3GjXQIppAYW1Ce1+sXW40eSPXTUsYr60GS5SNXgMcG0LrM0uFb7V
 E9Dt6CTpxlYQiITTm0YGiMVLku3QZnRebyCnFIF003PkXRf3XljJLcxJR8R18G5RtGlz 3w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2ydcj9jb14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 02:23:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdEMkLBflpjatfYHGxJxOvYX1d9oWcqPac9WRM++R5FAjEJq6GDjz2qlhuCIU2P9r/QSBKqRlK4mrKli25HVwQHnDPpm4XSTLoZXmk05gvEINuq2j5Vx0enFopA1D0B29PQzx02POz/0NyUgvHPG7Rp5+/jFjQTXVLY2f1q1kfHzmK8/maPCGnYwAOuKnYs9HV4inBSm2Mm5TqGj3SSOhfyHnqix7lN4L3QXJNVRpdC4STXMp9GYpu1RQtoeocSsrt/JAHCMUnqTx/rEUr4yOFDhiMIYyZ9smzbEigfr84WpsmQtwEB++4nEmHI7ja0UV5hbzsJcFgtnm1dan5tw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zJpwDJD7rTBJSBnET5BQwzNFonsRn15GQ9+Kjo93qg=;
 b=VLH2XH9MianNfsq9cjVciilfub00kCfW/QmmQRVFehSL9NUpjBomPPL1PX5cYfWwbF23Ue8r4QXReTJKTGGbyKuntUZriOwWX42+S2EYW3YLcasyTR37UqXoH3pufGRlz5/YYy0L53CJN/iEr8qPCLtqZyZwfGz4WafT0vnco/khFRqnI6I5hbJuKM2Wbf1/Xo+cEwHdp0u/5IngaBwFtBAr7zfBscmLJ5TM6DVyc8vlrArJdfRJ4uhWyZybgCmNsXI8LrZz6j/EVBv3AktHKJjiq8jbxXE3Lei2ARXh5CAbAe3cMdsdHEPgxH+/ck4VvwGuoHd8S23qBYu8MiuruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zJpwDJD7rTBJSBnET5BQwzNFonsRn15GQ9+Kjo93qg=;
 b=XMd2dR5GDd6kPCXYNwJqBiKGtZjXm2qvvLmWMRU8C/tuGGrJ9rJ2eLmm6y6ICOvTAyFfH33Hk12292LyB+QzoJOnAl48JYBa7nzCuDSuxigWO6xzdHFG94BCsyI9f/c9tASc7rKqQSB85W0vH5WyGIhP427mDzfJOnaeFoLRwCY=
Received: from DM6PR03CA0029.namprd03.prod.outlook.com (2603:10b6:5:40::42) by
 CH2PR07MB6630.namprd07.prod.outlook.com (2603:10b6:610:2a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 26 Feb 2020 10:23:11 +0000
Received: from DM6NAM12FT014.eop-nam12.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::f9) by DM6PR03CA0029.outlook.office365.com
 (2603:10b6:5:40::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21 via Frontend
 Transport; Wed, 26 Feb 2020 10:23:11 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT014.mail.protection.outlook.com (10.13.178.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.6 via Frontend Transport; Wed, 26 Feb 2020 10:23:10 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01QAN2O9018412
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 26 Feb 2020 05:23:03 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01QAN1nn028551;
 Wed, 26 Feb 2020 11:23:01 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01QAN1A2028550;
 Wed, 26 Feb 2020 11:23:01 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v6 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings
Date: Wed, 26 Feb 2020 11:22:57 +0100
Message-ID: <1582712579-28504-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(36092001)(199004)(189003)(498600001)(186003)(2616005)(42186006)(110136005)(36756003)(26005)(54906003)(26826003)(336012)(426003)(6666004)(356004)(107886003)(7416002)(2906002)(8936002)(81156014)(81166006)(5660300002)(70206006)(86362001)(70586007)(4326008)(8676002)(921003)(21314003)(2101003)(1121003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR07MB6630; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 721dcf4d-850b-4e66-ec3b-08d7baa5e169
X-MS-TrafficTypeDiagnostic: CH2PR07MB6630:
X-Microsoft-Antispam-PRVS: <CH2PR07MB663081F4EEAE2C2323201210D2EA0@CH2PR07MB6630.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8isaa2hiePohHjWCuErK6QGPY70g2JcZgPYkbYf32cVY5ODnmmvUUeB4TfjTeMZhQw5dGDRC1+zXKRF84Gbc3n+b+/mDwoFlZekrYxjVq8fYa4VsMcgAzOTBaCD4wznjKu0MbZj3doIK/PVgJgVfMldKBCvTcwoEXe1VctjeZvkD5L8nAaMBWKEmi6MjiZJMh1NxidJBKnRaNpJB29H6AlkUhHidQ4ZM6PByCAxzJHOlNQcU4kn7cysIUFyrnM3L0rjhnyfDuKG8FBPYsd5tRfyO4ewwMbOFHM+ITyoUO8DBOLeRkqcTesnK+KtourtsHcOEyijUQVHzEsyo+ZYLgvfFfwE5OgkDq7ZqxO14aodN263Cm0tKm5ORlRzrY5SkrWHWT/OuSIJywszUrs9xqMApaqqoWN9/uWozb75kUJMhUKsQYIrewg7K9pkwdnt7eP7PY745C4QpCMwX+nbLyb4tiGuDpco94GCWBqbiLAh52H6t6O10DirjZpmJfu4VcUHIB2MB3SyZEspQ6eXdKILOkc03W88uwMToFywGPQiBtiuZ4AjpkUfDZNTJhN8MfTSTXj7J4L+mNFVKiF8lsX8YiI+pCnDxde/LCjC96GtSYNj7zOJzqPxYbz0U0VIX/uM7BmKFLGov7SDpNaEBQsAEl6jg9DmuUgnC5QlfdFI=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 10:23:10.9590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721dcf4d-850b-4e66-ec3b-08d7baa5e169
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6630
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260078
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
