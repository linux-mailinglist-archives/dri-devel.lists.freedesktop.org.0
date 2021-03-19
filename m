Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0880341883
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031CB6E200;
	Fri, 19 Mar 2021 09:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AFB6E200
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:38:45 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12J9bChQ016003; Fri, 19 Mar 2021 02:38:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=blFYxzAaVG/WvFUYQD+oClhdcJpPP4/RUk1ThAPsHDk=;
 b=VMJ4z4D+4/2MalMe7fdwCK7RU85GXvDpzSBhgslX01GFJwdaD0628+0toDINaf/stSMv
 q974bItJrKztQBf4edlrQZogspe1xXWhfx6D2vC2SgvNOR/MzHnitdfYGU2X68JzOP9d
 Smm59SSpSoDze95wjdl+esVJ8uzWdyNC3X+EwB2iv8y8c8ZG+8jBgSR6SLkUo1BZAECR
 /aCZtNwd3ALi3H/+RF18FnZj11/Hf4lDV+sfdZ5kn/NOdSjtsR2KSTouBBgEmpSXIXiC
 LdrvpgiE2tHrqb4+6Q+tD3ijiquwNSoKMqLDdvCsoorGgFlsiY8DP3VP+eM12/kq+4iS Mw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 378tu2cjth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Mar 2021 02:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHVkHykOJDzyykvOM9Ao3631Hy4PmdXQ+Th7KOvGZCiAtPrap4fa4IInyQaKnNxWOYj6QCw7S3IozvLoVvfqZdN9Cvj4hy8YF2z3LUboMSp8v6BNhU0tHW619R5MwRjPoGkmo2/pC6nNCKs/8cakwtn3/Lj1yarowF8Npyzl3fSR7mb/9yhg/x6D6CE0heIlJok3wOZ6wsvIExDMECrzoMfFbNr62UOYNriEwZ9FXniLySJbFVdSb30BkFUuj4YQjR41XdCzI7f9cbbq3HRq7AI3ceSpLsdX9zknVso7fgrsS+FDNvoXd6R6x67mlg3OLDXqsEnKqiDmfqqUsbN3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blFYxzAaVG/WvFUYQD+oClhdcJpPP4/RUk1ThAPsHDk=;
 b=fN8GCbwiDjKSRp0WMjPbZ6VGD+vE2Sg7gGm/MciLtn0ce/4ERU372tTeA8xisjlv4+mM+uQXDVfhvShSUYsBmbLR2yRl34M9kfxEIG51pDJnfjxGujdVV6sd6m3CkGcVlvYSqraAdeAdrDM9+RNrCnIsb4Ka8HZoGl+oxuCq7brCwawMhNWiUoXr05D3fxG8tr/wWMNPaFW1fIXQDv+0iDLGQulerXMO4PrDfO2vYQdyGUXjZaZmhH1qnr3jOc9Cga07K4a6Z211+oLtF50cDKxcuRiwnJxCY5gPLzeN+jFcAQZpJ0Ng0TfUjRTOqQH2BxhG+LP08Ed8GYgmbbFWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blFYxzAaVG/WvFUYQD+oClhdcJpPP4/RUk1ThAPsHDk=;
 b=0PGPQ/AI0KkqNvzpsdUkuXEwsLOaPEL77eVwEG+TN7RYoa5kp5rV7KOADC3zToMxH/TbBYe+/FLGVNMycZL+K8Z9tZdbF2ARSa+40bgBX+IP98/+Xp/gfzyLtxZ5jNLxuK+v2gKplQkam99tpVWR92ld9IcQxEJwcv4VQCmphKM=
Received: from MW4PR04CA0100.namprd04.prod.outlook.com (2603:10b6:303:83::15)
 by PH0PR07MB8656.namprd07.prod.outlook.com (2603:10b6:510:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 09:38:36 +0000
Received: from MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::5b) by MW4PR04CA0100.outlook.office365.com
 (2603:10b6:303:83::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 09:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT063.mail.protection.outlook.com (10.13.181.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Fri, 19 Mar 2021 09:38:35 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 12J9cWJc041606
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 02:38:33 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Mar 2021 10:38:31 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 19 Mar 2021 10:38:31 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12J9cVIH007280;
 Fri, 19 Mar 2021 10:38:31 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12J9cVSQ007279;
 Fri, 19 Mar 2021 10:38:31 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Date: Fri, 19 Mar 2021 10:38:29 +0100
Message-ID: <1616146709-7227-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1616146664-6941-1-git-send-email-pthombar@cadence.com>
References: <1616146664-6941-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb45a4f1-aa7b-43d8-bbee-08d8eabac46e
X-MS-TrafficTypeDiagnostic: PH0PR07MB8656:
X-Microsoft-Antispam-PRVS: <PH0PR07MB8656E363F6314CAF37CC771EC1689@PH0PR07MB8656.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jPJc9CX1Uhs+Y3jSB1uBugi9WdTN+pDfMsQ0+9SpHaU1GjNjxUI0eSG/TawingfhKCtzroePKYRmnNKG3d0Aa6Nm6xeh+mWM92mqFug9H6QeFgsCfExWjVhI4BBGCYKXVxKKS3SdRYHeXBXLIXqNNVS8ufD6xFuNuM5sDsrTAlB+ZvTwBsaYovM6GXtuGwFKN1XlCSS7+w2QKOYUmWB1I+JIYwgsmrmzAlitSihO/mzlubVAHNZFzmn4jOEwnSL6Y4j6VTKjHwUhJ6Cwx8u/4YjQE1YwpDvwuy8tStQq7lz0vznJAhz78d/OniYTEkDC6Ear+zMuthQ/0i/I/Tht4DiWXV6Gu6+7Nk74WkNtE24g8eLCYMXnC5fIWmHrxgK4tUdOv3JYgT1IrMGcEjiuLq3qYXQbWcDAxJ619bV86Y+3sa/wcTQxK+se7J8vdnJoNFM0GaiuaynC+FG7bstmYxI+U2fHMXdkMJwbTNNgYDGeU+7MVp0xxSqkb8R3IG2UFxz5a72oIr5BeXebBPLTrIFwGx4181JdoDGnf/127v1fTTny67L1hQZODspbyBVx9o343h4ZQDIxt/oYB4n7wms9DZW2lEueJabd/3MlhnsPY64lrODq57MvGWIkpmaI/ViZScpZxtg7N8PInMFTF6Xhh5vWejbx09SpiROXteDqMgPNU/q72UqJb8arOhynQEdnjOyw8LWcLQ17+r8HWMAY2GFwV1iZq6nAlbQ370=
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(36092001)(36840700001)(46966006)(478600001)(4326008)(83380400001)(5660300002)(107886003)(42186006)(8936002)(110136005)(81166007)(426003)(36906005)(2906002)(7416002)(36756003)(54906003)(26005)(186003)(70206006)(47076005)(336012)(86362001)(82310400003)(70586007)(2616005)(82740400003)(8676002)(356005)(36860700001)(316002)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 09:38:35.2773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb45a4f1-aa7b-43d8-bbee-08d8eabac46e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB8656
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-19_03:2021-03-17,
 2021-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190068
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Parshuram Thombare <pthombar@cadence.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 sjakhade@cadence.com, nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 .../display/bridge/cdns,mhdp8546.yaml         | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 63427878715e..d571f4bb6b16 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -17,8 +17,8 @@ properties:
       - ti,j721e-mhdp8546
 
   reg:
-    minItems: 1
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
     items:
       - description:
           Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
@@ -26,13 +26,20 @@ properties:
           included in the associated PHY.
       - description:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+      - description:
+          Register block of mhdptx sapb registers.
 
   reg-names:
-    minItems: 1
-    maxItems: 2
-    items:
-      - const: mhdptx
-      - const: j721e-intg
+    minItems: 2
+    maxItems: 3
+    oneOf:
+      - items:
+          - const: mhdptx
+          - const: j721e-intg
+          - const: mhdptx-sapb
+      - items:
+          - const: mhdptx
+          - const: mhdptx-sapb
 
   clocks:
     maxItems: 1
@@ -98,15 +105,15 @@ allOf:
     then:
       properties:
         reg:
-          minItems: 2
+          minItems: 3
         reg-names:
-          minItems: 2
+          minItems: 3
     else:
       properties:
         reg:
-          maxItems: 1
+          maxItems: 2
         reg-names:
-          maxItems: 1
+          maxItems: 2
 
 required:
   - compatible
@@ -129,8 +136,9 @@ examples:
 
         mhdp: dp-bridge@f0fb000000 {
             compatible = "cdns,mhdp8546";
-            reg = <0xf0 0xfb000000 0x0 0x1000000>;
-            reg-names = "mhdptx";
+            reg = <0xf0 0xfb000000 0x0 0x1000000>,
+                  <0x0 0x4f48000 0x0 0x74>;
+            reg-names = "mhdptx", "mhdptx-sapb";
             clocks = <&mhdp_clock>;
             phys = <&dp_phy>;
             phy-names = "dpphy";
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
