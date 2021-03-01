Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7F1327D13
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 12:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6ED89838;
	Mon,  1 Mar 2021 11:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7989838
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 11:22:53 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121BGarF001171; Mon, 1 Mar 2021 03:22:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=r2eobpgLhOS+/a0Zzr6ujaMDBK7MXht0C3mBXeYu0LU=;
 b=dJrs123h/CLPalMc8q8v4vJL6JiUBX8+7M1WvqnGT/8balnpFC6EtIIwwFUBlL9WfUU0
 E9d6U4LQW4XbID6w+pxJBBP69dnEzmpJD3IJNM4QxPjMcQcX33hsKNGFe3nTjAjT/Ars
 9EXsv9ukRH4QqQraOXQmz2Gxk0PGq2hPPRIu+QFTX3DnVjg1M7xUJ1fRsVhWKSZrOx71
 hiv6/oa7vgH+/UH6v78PDm+HQFJaXcEIwnSiVB7IFS5GxERzw5bgEMZuaw4GkDHTsRFP
 oynicECGYtN7778kKGUVWPT4T01MQ85LFLfWCp2g2yWKvmV/7UxJAK76UTk1EL8qWTTg 8w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0014ca01.pphosted.com with ESMTP id 36ykh1mpeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 03:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPcwBGCMUymsJvB7gCecfncWV6rzUe65MvSL2fma70RoEs5Yv28SN2xHNm9vnvTSnzJHItfq54sxOvO3iUmVy/M8ejgcAhSDxtqvQmaVKD7XBT90PD4Rsf9rH/uCZgfqR5mopRqx51NBM4p1J8Qoz8cKY7MvFCLZumN2wPZ0LemJjfCQgWjYl+ZY/fyio8DnGnl9HQIVpaFv0tNeo0LoVqsl1PQIpI1BFVLlkisXje9HuCskbIL4zAb7HGTDjXYy4W4eHcoKffJi0/L/7toQdVNjK4DYBc97pjcTJ8YxUjNANfZ5h2Rg2vueahC5rU3RJu6AR8klyzRyiVvjoAk8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2eobpgLhOS+/a0Zzr6ujaMDBK7MXht0C3mBXeYu0LU=;
 b=MzTMO2qVQwD1+HgFIJ8RmPrBdiFngSV7i6LAjWQyLGA+tujQrgU1306Y6RpWVjm84P1VMaYRUEYckdA3fXkwN1GXdkaSu/GNUSKVpFWZ1MMkertki3Wev+VCSyGcihn8diBvo7D7DIto1IWm/+OGEksvEUbTHlifR68PwnCEtUDruc6mM15vJ/d/nStf+FlbgXlZb/UFQ73VlJ2NnVwO+oyjrZVJOGTbAPVPm8JdfWfRELIGeWbWBeTbHqdh5z5Sa9muunbkYok7eXp7r/ZTsFxFZxH5l10HqwC43zW3jmlOFS+LYQlkykP3/a5Ma6rkH9W2fr2+Ths95Klxdy0HIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2eobpgLhOS+/a0Zzr6ujaMDBK7MXht0C3mBXeYu0LU=;
 b=tOHvUysQzma3tOng92mQDBBw+T0S4+BSRmiou9M7qSRxbxMrdXcd1UF73QPCgsuSNmKpP13wniKMvQKT3gA8Ie/TFzTpmhDvRZHY1rC9wj/rJwFFUYWyVmXVHPxZouZC7o+09/xzn5bmip8gq507s1m9vvlmYtCmitdYDNoB7VE=
Received: from DM5PR08CA0049.namprd08.prod.outlook.com (2603:10b6:4:60::38) by
 DM6PR07MB8028.namprd07.prod.outlook.com (2603:10b6:5:7c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Mon, 1 Mar 2021 11:22:34 +0000
Received: from DM6NAM12FT044.eop-nam12.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::59) by DM5PR08CA0049.outlook.office365.com
 (2603:10b6:4:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Mon, 1 Mar 2021 11:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 DM6NAM12FT044.mail.protection.outlook.com (10.13.178.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Mon, 1 Mar 2021 11:22:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 121BMTeX088979
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 03:22:31 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 1 Mar 2021 12:22:29 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 1 Mar 2021 12:22:29 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 121BMThC004614;
 Mon, 1 Mar 2021 12:22:29 +0100
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 121BMTB2004613;
 Mon, 1 Mar 2021 12:22:29 +0100
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Date: Mon, 1 Mar 2021 12:22:26 +0100
Message-ID: <1614597746-4563-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40c35c4d-126d-45c7-2622-08d8dca44ee4
X-MS-TrafficTypeDiagnostic: DM6PR07MB8028:
X-Microsoft-Antispam-PRVS: <DM6PR07MB80287C1D2634C92F3B1AAB1FC19A9@DM6PR07MB8028.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KDCc7Q7wkk4vdzn5FPcovJmM5/Tsow9AjYz+bAddyyhhTMihXnj3tkmb/0sjAnvXPUFCF3CptBws4qsWqU4Yf0gN1+1GX71XDY508+M4vpLgSYKDvcoNR03XM5HD8pG7v04f0G8sClpTfcPEPoRrsy4hu1B99SqwpboYNINmzICMLo9sEgEZ0q4w4yZnkS89yPvXmk1KciiRwMm/StrdFGfo/ZOtm66sgvQ8cCG+9g9NU80L65yZjxbcuRrwKqODMecH/mMvfGg3inzHHsGz9CAsbyj4zQskzJyQi0Ua4MzMZb8VN/vektfJuT0Jhb7XIBmEsVoGnKnlVTSf9caF5VJlng+3AwRGyWuCnbsmpQswolK9UAgxSP9kLifxNtUd91xv2dk5GlsEr3eAeY+EgFvFYwkhIyc92nQhyDM2PQ/uNnjMoP7RRmq7MbdNR5h2s/DqPIViUp82rfH2B6eevr0PQVZ0J5UL2I625XS8RWJoCHJCMVuvSr73H4PtVSbn1DrCXwznf30m/dos2bJcd7eG/1l3mxxeGNpoMhYP58bspQ5uZeR7CWVGVXImeZhqkOa8XUdTaBHm+zKrm/Ljpf+hXig8T1MN4XPQGs4j9HHK7HubtM42+voYXxs5+6X/v31iOh63s9Ytr7yj/rz27K5bE+uyCP9pqm+krKxWBm3MsbpXE7W2P893kd1StlaIG0NNBXYGfGysObsmbA+MI+kQHWwffA4wbQfDHOq8Oo=
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(36092001)(36840700001)(46966006)(2906002)(54906003)(70206006)(82310400003)(36860700001)(107886003)(110136005)(86362001)(316002)(5660300002)(82740400003)(36906005)(47076005)(70586007)(42186006)(478600001)(8676002)(81166007)(26005)(6666004)(186003)(4326008)(336012)(7416002)(83380400001)(36756003)(426003)(356005)(2616005)(8936002)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 11:22:32.8077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c35c4d-126d-45c7-2622-08d8dca44ee4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT044.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB8028
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_05:2021-02-26,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010096
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
This binding is not used in any upstreamed DTS yet, so changing
index of property 'j721e-intg' should not affect anything.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 .../display/bridge/cdns,mhdp8546.yaml         | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 63427878715e..5fdadadaac16 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -17,21 +17,24 @@ properties:
       - ti,j721e-mhdp8546
 
   reg:
-    minItems: 1
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
     items:
       - description:
           Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
           The AUX and PMA registers are not part of this range, they are instead
           included in the associated PHY.
+      - description:
+          Register block of mhdptx sapb registers.
       - description:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
 
   reg-names:
-    minItems: 1
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
     items:
       - const: mhdptx
+      - const: mhdptx-sapb
       - const: j721e-intg
 
   clocks:
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
@@ -129,8 +137,9 @@ examples:
 
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
