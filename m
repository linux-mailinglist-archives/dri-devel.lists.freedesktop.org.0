Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD633FFDA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 07:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A233F6E43A;
	Thu, 18 Mar 2021 06:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322FC6E43A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 06:45:46 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12I6dOZW023937; Wed, 17 Mar 2021 23:45:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=ACe93BWZrAFeKX9uDd1f4RnzJZcPgY+9TjE7K51wcF6mf6Pa9tteFbr2nGbaX2aVq1Gi
 12OZ7UXERtSV6GTSFOu/6f4cohoE/b+EoJWFRfdhcFpPbk19vCafL3cWa+68yppX1D3x
 1NDG3zZvBJ9KCJJOEPP0hdcFdcObtajOLLtv3ASkbK+K/kzt0pagaqhV7b9mHUGCAIxB
 0e5UkAxQS5JCjwTaDN+gG+LqSMQlusmCZCWKsOuOcEI7SPWz0dEaKBsukSM+uJv+tU3E
 8IIQwaD++iFXD/+pcgfZgBQhnSzwvcy4QlNDMTk2SGK156iB2VB5AjeXM5gPMnPxXSkm AA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by mx0b-0014ca01.pphosted.com with ESMTP id 378sv2rj43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 23:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POxXDU265OUK/oNvjchf0KxBUlx574nHAQc9JovP2vbZGp/0f4gdEMBkWtoQgi7AIhIeA6+Z7UNGA2MrCo9wCeSHDwYAkieZo5satQnxf0PofL+PgNYfu3mYXW8HKtd2mcP/z9l/Lk2E7juG5HrAfUrevZRPF5pkCQQ4f87Hxg/q0kwVhpffgmfF1wRYUZmis+86gsspe/kJUKZEKMrYb27edfUyJ+6zPTZQtu8qMJuXZEN32/JdnPZ9on2YB7EOciQKIA2M0IdTn0yaYHWa6CEUXFeBZA4urLh0PFXqRl/AnSkwhVY9+Kdisk347GaZ7h7saoLyrOc0dYhZ6mVvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=TgHa6HB1+9qqU7iXB2+R4uMnhHGGCpIljZMRx1cj5DMno4BEJzGN1NmaBJ7i6AiQqOQMIQ8mYtxm116ZukUMSrJD38GPxawoL/mhwH/eoSopvQiAtvfILnRcyuGwSNTGkCgHnvA8zgQkM1VpX5zOMQtoXfhsxaM4a7JMlqh8Y8W3unbebEp1+IsfP7y1XuxAzvHjDX309ruWkqndb54/OwvkU1wyuFl2klo/UkmxNOqpjFA05ARTb2d5XHcsCa/DpEGZXFrNuciPPvegXOGAomszvVefYtQlrNeVbJqXGoa7WPyq0ASoOaZa8AewAhLeB8PYBAPJH0j0WJNZmHzcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=Z6FEgSsVbpI7tSzauVincVsHGRbjHKh+PkQ9wpwhpk8lEEWF5DyF3pyM9/Ti8FvdasgoSD7SM21ypjj7c3fXBkRNTys954qrqYOXhhezydxrJeTmru+WFweQk8iygL0+rko2M9fofAhM4hn1L1MvevZBa/C1b3h0A6mTMlnCRiM=
Received: from BN9PR03CA0339.namprd03.prod.outlook.com (2603:10b6:408:f6::14)
 by DM6PR07MB6844.namprd07.prod.outlook.com (2603:10b6:5:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 06:45:38 +0000
Received: from BN8NAM12FT023.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::15) by BN9PR03CA0339.outlook.office365.com
 (2603:10b6:408:f6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 06:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT023.mail.protection.outlook.com (10.13.183.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Thu, 18 Mar 2021 06:45:35 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 12I6jWEI196748
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 23:45:33 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 07:45:31 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 18 Mar 2021 07:45:31 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12I6jVb8031504;
 Thu, 18 Mar 2021 07:45:31 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12I6jVB6031503;
 Thu, 18 Mar 2021 07:45:31 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Date: Thu, 18 Mar 2021 07:45:30 +0100
Message-ID: <1616049930-31457-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1616049882-29712-1-git-send-email-pthombar@cadence.com>
References: <1616049882-29712-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d31c9de6-86f0-48ce-c7d9-08d8e9d96f7f
X-MS-TrafficTypeDiagnostic: DM6PR07MB6844:
X-Microsoft-Antispam-PRVS: <DM6PR07MB684494363B4B10C8F713AACEC1699@DM6PR07MB6844.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9lllGS5w8JXeQhw7EmUh+L+67YPlOAR0tGX2KE3cca3J/0Oogmvolum/mRhkrEYpjVHZd4vZ9VHxDwxXPUdfNbSDZchnEmC6ZBpg+HPFFNBMysGd6FJ+Bi3Pq4skC7BpX7WG+QvLPrJnnpq4QmCBDcZCPO71TNySG+pMCRGP9sbZc2mhv4g5FH3p0VFtv3cMisHqBBlPpJ12Rua/HS98sb2muIVqbsCbYb/Kso9R/yNm9noEpZrbZbIf1VBpncqbQogjIH7Al5V57e4QTYZwVQ3OUdcbLEXIQRg/TH5wGZLY5c1WSLqMLapqpVNiUfiE1nR6kqCb0s7+RAr9YJMBgG6HyjMhtaXmybYpfBgMnf+Rr/QwHsRt2e0HYNEkz8tesQtA6ClTJH/ZcQVCCSUIZBivQIg7gaoiZkb7hdeAjtZ5Mght3sTTQbCwB/SjDn9jfy+TsGhjMvxOtXF3kz3pYKC9m4aNUsg65Icme3r4raOvP03TPhir8/3FP31LnMSFdhjdRri1N4sY0Dy7WDsemCBA/W/A+fGMjyIHJ9Bl1KTeDJLZm04//iiAwhYBguRy/diKrRvQhY+1ZbjvD8wZcl78wUk4GvFNFLBKF1lNBqR9FsJyYvVom+47Rnpi4+tFoO/hNVpSN+F6s/l29xLvvgx7YnweHVb6iW4k77lHG2rSKo/uJRSnOGjegFkqIlkH/4oPKRSswuoL1TQkYId7Q0oXDIsMwT/aCWMB8BGM8Yg=
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36092001)(46966006)(36840700001)(8936002)(36756003)(336012)(26005)(110136005)(36860700001)(82310400003)(70586007)(5660300002)(70206006)(54906003)(426003)(186003)(2906002)(7416002)(2616005)(81166007)(86362001)(83380400001)(356005)(107886003)(82740400003)(8676002)(4326008)(36906005)(316002)(42186006)(478600001)(47076005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 06:45:35.9246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31c9de6-86f0-48ce-c7d9-08d8e9d96f7f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT023.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6844
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_02:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180051
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
 .../display/bridge/cdns,mhdp8546.yaml         | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 63427878715e..8a85768f6202 100644
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
@@ -26,13 +26,16 @@ properties:
           included in the associated PHY.
       - description:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
+      - description:
+          Register block of mhdptx sapb registers.
 
   reg-names:
-    minItems: 1
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
     items:
       - const: mhdptx
       - const: j721e-intg
+      - const: mhdptx-sapb
 
   clocks:
     maxItems: 1
@@ -98,15 +101,15 @@ allOf:
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
@@ -129,8 +132,9 @@ examples:
 
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
