Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8833F4F9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 17:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3817C6E5D3;
	Wed, 17 Mar 2021 16:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338626E5D3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 16:05:25 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HFksnS014326; Wed, 17 Mar 2021 09:05:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=b09CkUloPEFsEPuvZHgMfqSj0xKfA3+LtaCTla7ME0YjTPNH+ACelQMficVueVWtT6pG
 qePAZNftGHFPU6WBbO4jV4B5pUvDb3yrRIVTJmTI4gho7nGtxnv095NpWeeIU00j06aA
 66GEZo3hV/fe2Wo9N5MX3kIw9UB6jFB/IoomiLlrXiBjgf/hx0Y+Wtv/5jGgwEY/qowj
 fMvlMEktiG/FPi99MKQeRZead1OUJrLXcOWNOcVcyv7wIbcpEmIJBGEpZOXMcJqtXS+3
 91lpAnNzue//vCv68VSGT6d7XFVHDA+w5VBtWg48PeKAxfh/wlYdxgMblIt/G7q3Ezrq Hw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0a-0014ca01.pphosted.com with ESMTP id 378tu25sda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 09:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk3AxSihKtf32kR8oBXx5NW602APlgz7eFwcvYHSE2AQouk3x47+Hrfs3v1jJfCT2A8qThR9UxuD+ZDDZ65ldtsmiElUSvMPy1hnVUJ2rCuyEA3oiJwppDJeCkVfLad7MJAc3nb2q6Sb5BFfciV7d7RWxQV3BZa6xqjeYkYyrcQLPn6OKNycY5pl6q2nxa+wNlbiEeCtLzTF9RM57oPze6NEzXync2sZtwK3ojOc3+ROP6BJlH2mE/Fy2gw27izHSoJzdOEIcPEqtl55LcvaXV2WSLwbhlMCZFuGVvxHjdeBoD1aDF4g6gUBnQ8v9fXOdLbI+oOWz0LNggLwVF37kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=Dnwv31TP90Fx5LNUBx7QkyVBzBw0DB6joA38VKRiIraGgKw/wK8hbhZZohbrSj98VPkJrFKwSRpHZfuhP64ZF2Yd9iXPAdq+pALIX9tBqEg8t+9jMkfgsjTP/OEBEpiFIXTF4/4Am8ziV7REuzucKNK7+k8p1UZ9aoWLIWpQ9DlHK9eWHjRzzd3tnLXrPHCa6rncHnooJfJgU9AG1mi2uJMz937eKTZfLVkETfQq3ulbRpU0q8j0RNMCka+lAbg+LeOzGuW8cd/+RnF5kCoGc3an8KnAgDHWgfZMPdkT1HfGtoQEQoFCzsBDMIPpsspbqg9I2tf/2esIpa0TBMhpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTmEhTrKLs0vPdfFeDDoRPykGzGmzmtFOdv53q0HUfU=;
 b=odrQ9iTA0dSzRMtvePFs6xD1P2D2Et8T1qfqGTbl5DA0c8a5TqkctWGkiVn8MZQA2M7KPQu8AXbC2DIbCmGRQwpt70CsjszvhEJusWGkb4Vvr24zujVE32NMA/1PlAfIVSTjNG63QpLViwfxRcfkVz1kP1/7Lk1Ia/Fw/3vglKQ=
Received: from CO2PR18CA0043.namprd18.prod.outlook.com (2603:10b6:104:2::11)
 by BYAPR07MB4949.namprd07.prod.outlook.com (2603:10b6:a03:16::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 16:05:13 +0000
Received: from MW2NAM12FT049.eop-nam12.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::6e) by CO2PR18CA0043.outlook.office365.com
 (2603:10b6:104:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 16:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 MW2NAM12FT049.mail.protection.outlook.com (10.13.181.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Wed, 17 Mar 2021 16:05:12 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 12HG58Qn018504
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 09:05:09 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 17:05:07 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 17 Mar 2021 17:05:07 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 12HG57iZ016467;
 Wed, 17 Mar 2021 17:05:07 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 12HG570R016441;
 Wed, 17 Mar 2021 17:05:07 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Date: Wed, 17 Mar 2021 17:05:04 +0100
Message-ID: <1615997104-16386-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1615997048-16043-1-git-send-email-pthombar@cadence.com>
References: <1615997048-16043-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e468245e-47eb-438d-9b41-08d8e95e725a
X-MS-TrafficTypeDiagnostic: BYAPR07MB4949:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4949E4F06F04092860730490C16A9@BYAPR07MB4949.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oaorood5QR4T+eZBEPg4pJfOmpE+iD4cueKy+9WllpW+oJS+iaACHqfxuoczKP8xC9AYBoS8tqRSCZL11yuDGWjiLKtTuMdxLFJ+loXQZkQPx2aDmMZBeWAxk9S+L00K1Jhosdb2WItt22OxJO9rWm5/vKPtNjxf8UM2fjv4CCL+23Eq0ib8I8h0+ccLKkvXC2ZL4dnibl1v2Qq3pDPKofKI8TY5rXq03Ix4/c+stuqLUseMPvH1lG1ACsLKF7IyhoWE7J8Y+36xozyBmhD0TSDKniB7bA9u+Q85jcUfVmAfYX4NrLOhBttS9ezCOQOFJleBSFnVhkXNb0FaAooPsR8zjQ0pMbCFJVXafDeEN1Lm7kCLyEBOP0M61JmnaXdxWeMGtyk0t2Xv2Q3345TiAu5s8v95iKYryuzJslr8YJ1Cca4PkdKT+6qhhiDfVn8VMJd86lbOKEhQhJxrx4PkuGBnwm4kcKl5JUrvWY/zwZbXj7L3hk3KIAxNWQbB1JAI+JaqR7xanATSMJVbcS0OveHAL4EsmgP0uEF499sj/vnVGaqki3r9qY2numI/IG+fH3DH7ALVVguav2PHYhM5wye7ASeeVoar2JfUGReqVewvQt8tOgjJVLjGJw+vj1Twa8YLhnO7/c8lI2hnmDnKB64dr9AhWDtUZBr/w+KaI1JPt6Kf7vKhNoI0R6iAFd3mqwb3TQ+ba57M+c8QKoCqTg==
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(36092001)(36840700001)(46966006)(2906002)(107886003)(7416002)(6666004)(336012)(8936002)(5660300002)(36860700001)(86362001)(36756003)(186003)(36906005)(42186006)(82310400003)(47076005)(7636003)(83380400001)(26005)(110136005)(54906003)(426003)(356005)(82740400003)(2616005)(70586007)(8676002)(478600001)(70206006)(316002)(4326008)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 16:05:12.7083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e468245e-47eb-438d-9b41-08d8e95e725a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT049.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4949
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_10:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170113
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
