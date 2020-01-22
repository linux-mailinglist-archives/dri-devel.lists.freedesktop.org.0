Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE214535A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 12:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53506F4A6;
	Wed, 22 Jan 2020 11:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBE26F4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 10:55:34 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MAkfED012969; Wed, 22 Jan 2020 02:55:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=RVX6AgzK6v/kwCB+kx/+Grjk7EniJ7uTJMLrsvoGVXo=;
 b=V+PiuyPlipwfbJtNLQibyfhq7rG9EBwkAKRuw/AkOrDoH+6QyOeNwzlb72tMmA06aVGq
 n0+fIYpyDeidSHi4VuxMgodMMZIR+dgP3echE8JctYxV4Uj7zK1iBLfHnteOOpjLfmYs
 o8GnQiLPNMEKKVvnw0pP/AEXyp4FD2r/ZgGNz/Caj65vCELGuzLqZ4zgsebYQV/ar+u2
 Vny+IwWnL/Hs7RZDom9XwCJMlaSbnkw3pdZu1VihWNHESoeFWFrF8shu8QEpMvIAVJKK
 dVXVHSq4BZGrBSRH3Qtlr43uS+guak4mdPrC2p82wrIqrapFqrQBDjVAF8ImMmiIUTcr 6Q== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2054.outbound.protection.outlook.com [104.47.44.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2xkyf5mhnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 02:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G92z6Ia6e7693CkDfN/qZrcUksMyShUEUSDWtm2XTRrimVdDl8gNlu+FZecWQTKb7Knbdb+4qJJLkr5MJY48cKQkYFF7INaPET7tb9IQNA1lMpBpkUPFFR6UeE73Rwe+NDCF+Gh+K/48usRdUUL+O7gBTat1XwCTXPwOelfyrI2jWoZ5KOaZWnZlv+JyWf5WsObg747J+2WQkilWqMq3iGnI/n9IyupfucMfCycWTRotsT4sKveKmEwMBUfBh0iDGCT8jh0RbND5hA9BMQhptGPUlLZX8hDIeEUws8I37rv/LzT8qmEzGmQFGmJcQevxuvjgZlMXyaK35VckbNEO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVX6AgzK6v/kwCB+kx/+Grjk7EniJ7uTJMLrsvoGVXo=;
 b=YSsvzZ3MsVHb8Be9WOssszE1xAZFUP1M/Px1LeKoDhWbW0ooAkod6Y0hWCj960yJ40B/mfgANFWQMsXHME5k1eTOzInky+hlzBL63B/ype4Ly0PqmnyfPaVzz5Zp1YlubMF/fTh85tCFsLM4X9TJQhpyvJ4GMq9dv8oOVNnI/7ECzcBDzPvyaRqkedz4MEpLHCI4L5pREc3BSNHJwTm3E83MegKFUX4XTh08wTti9ZS/4ynwmVqPDlvXemFYgrZ2toY9GfBTENPczt5tzXZ0YNTi5DmEUfD4BWsgApQ+oCwZwP2F4IVOEwIWZIAF5KZQ2oSlvnfK4CV/OYdeYOMSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVX6AgzK6v/kwCB+kx/+Grjk7EniJ7uTJMLrsvoGVXo=;
 b=BgMg5yy8u0A0TYOdWm5ZciWSui54aE+kP7rD+98m/5yiUDpwDHMUiQtOOO+X38iygS4G0uCijnafLLbVKx1pjUeJdhbN0khgnNKGndED+ualWz2TfrSd/EpxGhvS66jD2WVqopWu5TQEqsF7c+0AV+APJQPgGBK9iQ7OUy5twMs=
Received: from CO2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:100::19) by
 CO2PR07MB2614.namprd07.prod.outlook.com (2603:10b6:102:9::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Wed, 22 Jan 2020 10:55:15 +0000
Received: from DM6NAM12FT049.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::204) by CO2PR07CA0051.outlook.office365.com
 (2603:10b6:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Wed, 22 Jan 2020 10:55:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 DM6NAM12FT049.mail.protection.outlook.com (10.13.178.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.6 via Frontend Transport; Wed, 22 Jan 2020 10:55:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 00MAt78d071698
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 02:55:13 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 22 Jan 2020 11:55:07 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 11:55:07 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 00MAt6pt011119;
 Wed, 22 Jan 2020 11:55:06 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 00MAt6QR011106;
 Wed, 22 Jan 2020 11:55:06 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v3 1/3] dt-bindings: drm/bridge: Document Cadence MHDP bridge
 bindings in yaml format
Date: Wed, 22 Jan 2020 11:54:59 +0100
Message-ID: <1579690501-10698-2-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1579690501-10698-1-git-send-email-yamonkar@cadence.com>
References: <1579690501-10698-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(36092001)(189003)(199004)(186003)(6666004)(356004)(107886003)(26005)(478600001)(36756003)(7416002)(4326008)(2906002)(8936002)(8676002)(81166006)(81156014)(70586007)(36906005)(42186006)(336012)(54906003)(426003)(110136005)(316002)(86362001)(70206006)(2616005)(5660300002)(21314003)(921003)(2101003)(1121003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR07MB2614; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:unused.mynethost.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36cb739d-9b82-44ea-6d8d-08d79f298fab
X-MS-TrafficTypeDiagnostic: CO2PR07MB2614:
X-Microsoft-Antispam-PRVS: <CO2PR07MB26142E84EB05A0770D69171BD20C0@CO2PR07MB2614.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEvxVfOqAgnJsBy+i5eifAMc95SGy0qsGZdA9Abmc+1wuV0lS4hm7cOjJB1FpIWFwHDhb5BPZmhMeCD7ZX9PxjiwCmTRX/kgD5bHp04sPJk7kKtO1CMEW/9HBXT5juuXKnWS0Aa1Ri8L1FJl94Si7i/F3uGhZ1TbBrHmQ/KSzJDHZ1vDHSbN00FsVa3Go9TMQSMDoT/xrWAG4mqn9MwwnAcgvCIv9xhlQgb0QmhMg+zgAFhiAziE+S2H/VAkdV/HcgD6HEIZJjQrUEDcqmNbV0Z9Ib1Ozi4LlF1UtkQgOTg7dMf4wnqxuokZwXtHRKJ3Hl9ReCMnxd03cOe2MwgN4ESFJY09Z2bFPnpqwNb9iW6zlOfF5bUMujpsGRJ53i/Q7Xc2mCRjvctB3elkfRyQBWpgEXuPCev2FybP2awx7Ywy405n7PZhHtHUrDJ5Mf1mRX24UOUg6IaufoXsWF1QuXCohSvWpJeXs9hMMbALF4/45shc3ky7GwIPkriw6gqZTpkNal14wNSKn+LIGV3PpQw6XHTatRs26VjFuhwX7ESXJ8/08ReP4svW4kzgLndjxI7ObSJ9tJrQ11GRG2SJ28yTCDfEFC/71nAsZg8JuFjf9i1MXJ6L8VRXYKrdkaQ0djF0ViOnVlQoVdN0JaX6Yg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 10:55:14.7907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cb739d-9b82-44ea-6d8d-08d79f298fab
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2614
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001220099
X-Mailman-Approved-At: Wed, 22 Jan 2020 11:01:18 +0000
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
 .../bindings/display/bridge/cdns,mhdp.yaml         | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
new file mode 100644
index 0000000..696418a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
@@ -0,0 +1,131 @@
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
+  phy-names:
+    const: dpphy
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devicetree/bindings/graph.txt
+
+    properties:
+       '#address-cells':
+         const: 1
+
+       '#size-cells':
+         const: 0
+
+       port@0:
+         type: object
+         description:
+           input port representing the DP bridge input
+
+       port@1:
+         type: object
+         description:
+           output port representing the DP bridge output.
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
+          maxItems: 2
+        reg-names:
+          minItems: 2
+          maxItems: 2
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - reg-names
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
+        reg = <0xf0 0xfb000000 0x0 0x1000000>;
+        reg-names = "mhdptx";
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
+      };
+    };
+...
-- 
2.4.5

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
