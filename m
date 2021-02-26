Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEF3265AF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 17:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A176EE01;
	Fri, 26 Feb 2021 16:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1225 seconds by postgrey-1.36 at gabe;
 Fri, 26 Feb 2021 16:36:00 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104C26E417
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:35:59 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QG8sBp008814; Fri, 26 Feb 2021 08:15:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=uY15xeXndlQMjNZqcP0/UDUW9WdgPYQf1k2Zr/MNgG0=;
 b=WXZxftnmb1lLPHzm5hWYF/MejMaP7Mptr8pAeg0bcJzot++mQqLifiVywvWIsz/V0Yum
 l4brkJBLxrq5Rn8Xn89SnpR3QRK0sGDDRgaV0SqU+Q7jree2mq9Km2lQT1zdBqw2ND6o
 1iXk0xNDh5SUf/UTMY57f68OwjSJK87JXs7fcDvafUQ9O9Xc11U1ey7LLnPHlyIWhHjJ
 dK+QkCd8uns0UsXOtzIAo17aIpD4IZg7UiCqsYyyp5hPiI510lOXgOSSfcj74Iplhb3B
 imVVGEHnGiCDaOtsKk4AW0ty9f95l4Ptd0V5VizyVMfvf9bWGUvOeCwjXZL6kA1cC8Xu MA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-0014ca01.pphosted.com with ESMTP id 36txw3p9ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 08:15:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANwYDdSJffP5MFx4SGOQsX7xXsfe2IeYsn1nDxT3NHQ3RSQSOMNHcD12SnJvmlVdLOFOKNF+Xiw45G4iOaePQoz1/O2AX5M68hOcRB4cmBMSsyASN78+Gg8/bY0L8+KCZmcW8nk76S8zwaml7er+yYYuACq06SZi6YK4gMWvpi4FPwB8wO6LdNqs8d1LcrgMIooP/B0DyKtKf9XijZsxUcn0rgdGQ+dmtRUZ1t6DXl9wg9xxSZdNFg1WDL+G0LH1WPhuRf1P3m1NMS7XZuoDUIPdsqda4glpOAEyMqYzVFXPOD4cs1kc7d0n7RNuRPQ5UQVSYyCc18TKzTPNlup71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY15xeXndlQMjNZqcP0/UDUW9WdgPYQf1k2Zr/MNgG0=;
 b=gr86CE/oVD6+j0dGEyvSpd3EQFJedPDnJDjvOpiq6NKj0UrKC2wIxBCcltrqvc1msgtGIsl1uItAO5OyZGxIF5/UhJT8gX3ME6OxkhhlwBEQfLAkqjFUILznSYolySwoj/iSLugvfxECFoLSZuVOOkkzhBScwRK7ASXEUiQ0OolK5108NbVKOClIvQgRlHiy8RiRPombU3noGKkQE/O8V3/uIFT7hQZWTIdILXZs2MiszNR0N7HS2ffU6U4I2LSxqaDOjWoeV2hBi6cpbrxUonyznpD86BSwBwb1Lh8gGK/batAhO3dV2mxydMrk0kUTwmMm8Agbo8PP/zezFUglxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY15xeXndlQMjNZqcP0/UDUW9WdgPYQf1k2Zr/MNgG0=;
 b=Eo5aeDS+geb/Euz4j6JD0lrZi/eBJwhQdpDlLuD7tRTBJfNPiW5VCyCnzL7GV+Nzye7k8YnCiT0FitsdiBvK+wFxE996hj4DsuhXfQGXPyet7iEXvOf67/QKKcatido/kct2r6CmKDNOCTmo6Ak1uY7GVc91wlEKnBRGmlj/BEs=
Received: from MWHPR04CA0058.namprd04.prod.outlook.com (2603:10b6:300:6c::20)
 by BYAPR07MB4151.namprd07.prod.outlook.com (2603:10b6:a02:c2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 26 Feb
 2021 16:15:23 +0000
Received: from MW2NAM12FT026.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::d6) by MWHPR04CA0058.outlook.office365.com
 (2603:10b6:300:6c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Fri, 26 Feb 2021 16:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 MW2NAM12FT026.mail.protection.outlook.com (10.13.180.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Fri, 26 Feb 2021 16:15:23 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 11QGFKwU021418
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 08:15:21 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 26 Feb 2021 17:15:20 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 26 Feb 2021 17:15:20 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 11QGFKCS021467;
 Fri, 26 Feb 2021 17:15:20 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 11QGFKh1021465;
 Fri, 26 Feb 2021 17:15:20 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robh+dt@kernel.org>, <laurent.pinchart@ideasonboard.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding changes
 for HDCP
Date: Fri, 26 Feb 2021 17:15:18 +0100
Message-ID: <1614356118-21409-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1614356086-19745-1-git-send-email-pthombar@cadence.com>
References: <1614356086-19745-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e63eeb6e-231e-413a-2db8-08d8da71b850
X-MS-TrafficTypeDiagnostic: BYAPR07MB4151:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4151DBD0A07C520DF0EA2141C19D9@BYAPR07MB4151.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d370awR8XzNBzh1j7EcvjOqp6jD5/SnCiwW6NpvT4l+JzC4mS1C4SyTNGhTLGIf4WrDkm/R1VXbkdYgqxgmitwJtO5ZmMg1ORoIKeGY8UNVD0jpcMXq87oQio87XKu4OJad/4xQPRpem7RkZAptgKm/n7ExgQ7I3MSeHG+/1E4wXvzp1w1+r87sIMmFCax0NTNjxNnC6hfBqwblnDlFTgj6WJWP18VHuLbUmJ/CcKU+McNkEtvcr7Nm1OF6GjWgUAsjvp/lZFJnDlOnjgN0hUH69oq9S4ksLgM1qDWf7CtHxzBm0mgVUbeunMnmbE03WbK7c/Y5G3sBFLhZR1W4mCwpV3GrcyeBjXphKtcOqlJSA4UGZk3I56VSPReASYNY10a80+wYBwcYydjfj7xrBKseDnaOpT2Xk/p93rbbVm1U+Gt/W+02svjNLhg6ooN40N2QkZhr0VlacruttATlHciURWY/7NxcBRRUbiYeB6HiKQjB5CD7u/ME7PbldcYB9Dbugpr21LicCcCWyZ16qXCcudaOYB5g2DGd+MirkRqNIKQlLmfx2in8UhpzSvydYoDRcKBHqhG/y/LPsm6ET9v81trzYDMnHBUbMf8tdtM46+oVRUhIxlSckjSJeIul+gNh6n99D7JxiZQ87bWQWGt0zM+ZVH8s8O+1Dkd7VjyUBNmc56r0w23l27ek4B4Fk
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(376002)(396003)(136003)(36092001)(36840700001)(46966006)(5660300002)(478600001)(186003)(2616005)(83380400001)(36860700001)(36906005)(82310400003)(82740400003)(8676002)(36756003)(2906002)(7636003)(426003)(336012)(316002)(47076005)(7416002)(70586007)(70206006)(107886003)(42186006)(86362001)(8936002)(26005)(54906003)(356005)(4326008)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 16:15:23.0757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63eeb6e-231e-413a-2db8-08d8da71b850
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT026.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4151
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_05:2021-02-26,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102260122
X-Mailman-Approved-At: Fri, 26 Feb 2021 16:40:17 +0000
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
 .../display/bridge/cdns,mhdp8546.yaml         | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 63427878715e..89b4bf783c53 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -18,7 +18,7 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     items:
       - description:
           Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
@@ -26,13 +26,16 @@ properties:
           included in the associated PHY.
       - description:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+      - description:
+          Register block of mhdptx sapb registers.
 
   reg-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     items:
       - const: mhdptx
       - const: j721e-intg
+      - const: mhdptx-sapb
 
   clocks:
     maxItems: 1
@@ -53,6 +56,11 @@ properties:
   power-domains:
     maxItems: 1
 
+  hdcp-config:
+    maxItems: 1
+    description:
+      HDCP version supported. Bit [0]:HDCP2.2 [1]:HDCP1.4.
+
   interrupts:
     maxItems: 1
 
@@ -98,15 +106,15 @@ allOf:
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
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
