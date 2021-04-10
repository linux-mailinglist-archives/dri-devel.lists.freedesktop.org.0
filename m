Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DA35AF7C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 20:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340D6EC95;
	Sat, 10 Apr 2021 18:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60FE6EC95
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 18:15:22 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13AI5pca032341; Sat, 10 Apr 2021 11:15:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=BUT7Ky9AtztCtSaddH4c1RCzMTcKqRIj7SCvDfC8eIE=;
 b=ee5soIDCn1KrhQsb/6RcEFAONKxcqUx4HpTRofL4scOUknnBF4hmUk6gxAwGLyJ/mSrL
 +2I2kUI8sAViS+anfilAGbQA8qccTWvuM+o18XFsIz/HBKpWaS3mbpzwcTB7smGSfRBb
 aFO0yRQi40BK0+OvpwrhWzNBufFObAXM8WMlYVNCJ9h2A3cIMoy03j+2KJK2zlZ3jUFJ
 MytaIlLHac2HFEGDqsiGmkS20cQ9g9xykqmrDDGXEC5HV0sviKrjM+IEe6KaQX7+3+Qg
 FLvPbXlN+9Xf7OJ2zYwvL/VLuXp+okFCMp9WaAE8IUCo60azHGF3E5v69sUc8meNLxTJ DA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0b-0014ca01.pphosted.com with ESMTP id 37u7m0h1ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 11:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhYU+3Hhwx+Eg3QvSuTSqflmVxvu/FU/0zJ53VA/o3Td3eI369FPqg38ijT6Xc3AbTnGgawBTkpaGMIfGcmOloeJpRxRumDCiSnYHE/tJFz2aJXsVmDBDNVWlvyJQm+jMiJA5akZeIBX5lOooraxpjd9LN4S5aPvcTYE05ueNsa9fAb+PMqD2G0LhapA5W3D2Qv5aL3dPn9JOXuZbuG4C3E0yt/2rw9Xn9m4d33jb9Nw/+Ao24yub42d+riCYA0v7PaJVXJ3DxmreoJI5JNN2mw1QCtOyVwg+RbvYDr3jzKVNXQXoPo6ilzgZqREbI66Wj3oSxHBQHfdjwjn6G1fzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUT7Ky9AtztCtSaddH4c1RCzMTcKqRIj7SCvDfC8eIE=;
 b=EyziL6wHLNwH2yAbqJvYjOICLnDi+I3itBsct02Iqky2EixHa9uEPg91DrqP0guP33+8BExk7uoVnEWeDR4ylBn1R9KqpqNq/yg9UPhtb51ea28QnT3S4yWhu7ahPNl/M7MPkc8zBnvN/9TsSsQ6l0Z6ciqG4FRS2iWRBMc9pEYEUt03lclWQqgz38tixwheqEf2g9KdgxPDaWEFZYcLUyMXl8t5uDtCVI1vrcBM1I33o31jbKNaN5xGPlLYBr/Vc25AOaEBQaQqU7JdaGGXLa95Aiqt1BdAO3Knypxiruf+fDdUdvBqYnEiC0O4IjNxtYbTN0jSpZ9ytiZlhIT5uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.148) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUT7Ky9AtztCtSaddH4c1RCzMTcKqRIj7SCvDfC8eIE=;
 b=35XlVIxmfP7llPNjGBu6+IWnRRcpLgM9G14OcPTeJpZ87FeLJwtB3E29vQwiaMBbAuNauWO1wE+SUAsQvFCQxRBbOhzPA398GhbWvqG0uhHir+N6qxtw5Vw05sJfymKlvAnBgJkQbHP6vM5eSxGI+eF0qiNVcuWCnxyQxNs7sg4=
Received: from BN6PR1101CA0014.namprd11.prod.outlook.com
 (2603:10b6:405:4a::24) by DM6PR07MB6011.namprd07.prod.outlook.com
 (2603:10b6:5:18c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sat, 10 Apr
 2021 18:15:15 +0000
Received: from BN8NAM12FT032.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::9a) by BN6PR1101CA0014.outlook.office365.com
 (2603:10b6:405:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Sat, 10 Apr 2021 18:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.148)
 smtp.mailfrom=cadence.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.148 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.148; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.148) by
 BN8NAM12FT032.mail.protection.outlook.com (10.13.183.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Sat, 10 Apr 2021 18:15:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 13AIFBAe009999
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Apr 2021 11:15:12 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 20:15:10 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Sat, 10 Apr 2021 20:15:10 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 13AIFA98030515;
 Sat, 10 Apr 2021 20:15:10 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 13AIFAts030514;
 Sat, 10 Apr 2021 20:15:10 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <robert.foss@linaro.org>, <robh+dt@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v6 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Date: Sat, 10 Apr 2021 20:15:08 +0200
Message-ID: <1618078508-30466-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
References: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dabe5d13-1e12-4b01-4ffc-08d8fc4c9692
X-MS-TrafficTypeDiagnostic: DM6PR07MB6011:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6011FAAA4CF9A3B5AD3B42CFC1729@DM6PR07MB6011.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdN6WEYsV44KTYePJxjD/JX2j80m+JBMiuJmefYXAar8mMu58Zs5epB7a/N/ZUjlKuAUTZxB+p/dKcbE7DrLQRg13umaHWAg72XBqP2bT57DpypteK+ECPJNsSWmJXGjc7Gn4DWnZFfkB3ZAfn2LbiJS6HGpgwVhR7qHaqwNIA0sH+6NzUIMcVmsuvYTdZJStiLCI/N4Z1m2FgP0sywYm/Ka14F3y2SBXgbCSRhFyCG7P06CIC1GGE0LT2nVSFw4RnzuvKdb+dfN7mVz/H+qRyK7+AyQw4HhyBSJFJtLHeLNHv9nu8aIr63hfsY+Dt7KW+9jE/qcj2gcFSa+xJCcgF8bOgH6gCBNemzEfi9yxyEDHx2dXkO5iCXq2Sv135jXuMntjMA05CPWuvLwqkEV+ToqrnO6rCOpOQEyI1i2fb/LddWGZesMo4PcYQVbc15ss8vE8wBO/gBKjW6DA6AOpb1XZrUhevQD/dXRmzNnO4v3pPfX+Zm112ihcwZ1IjMwJvf2FwN/inofvNcvXSZmWwkA4NOAft/s0EjDnN8YmpFq3Nkk4ZcZeAnm9KB7tZZXvwiylGQ0qpe/X28aY0zC7RYzfO0CEYmggKu28f9dYoTeELLrLRlAe7rNZubSIwKFwh3wbvQCn0VSscSnxO5WpfF5eN+c163xu4JuRBNSgErkEC/HyVlZ9n/JMd+Yu206gb3V5/brGFnh3pcbDV6U0w==
X-Forefront-Antispam-Report: CIP:158.140.1.148; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx2.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36092001)(36840700001)(46966006)(316002)(5660300002)(47076005)(83380400001)(2616005)(478600001)(82740400003)(107886003)(36756003)(36906005)(70206006)(54906003)(42186006)(7636003)(8676002)(36860700001)(336012)(26005)(82310400003)(186003)(86362001)(426003)(8936002)(70586007)(110136005)(7416002)(4326008)(2906002)(356005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 18:15:14.5361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dabe5d13-1e12-4b01-4ffc-08d8fc4c9692
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.148];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT032.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6011
X-Proofpoint-ORIG-GUID: NRX1Zdj8T8aQemRm3Oj2kt-ufWkUDFoH
X-Proofpoint-GUID: NRX1Zdj8T8aQemRm3Oj2kt-ufWkUDFoH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104100138
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
 .../bindings/display/bridge/cdns,mhdp8546.yaml    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 63427878715e..2333fdbe9296 100644
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
@@ -99,14 +102,18 @@ allOf:
       properties:
         reg:
           minItems: 2
+          maxItems: 3
         reg-names:
           minItems: 2
+          maxItems: 3
     else:
       properties:
         reg:
-          maxItems: 1
+          minItems: 1
+          maxItems: 2
         reg-names:
-          maxItems: 1
+          minItems: 1
+          maxItems: 2
 
 required:
   - compatible
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
