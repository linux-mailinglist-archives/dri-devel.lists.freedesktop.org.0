Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFA753D74
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D0D10E893;
	Fri, 14 Jul 2023 14:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E9010E893
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:30:59 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36ECVfNx003176; Fri, 14 Jul 2023 15:30:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=jIpBcKM9SkvEMFV+nVff0
 E5FaQZxh7jpAXOjfxrjU3k=; b=txRjPy7EQgqCMru9D/9FihB9TaGg3Y4UbndW+
 kEWRVOO2tMy/xTPaT9BUwiF2JA24aw9rFy26Gkb8ydVj/JF5pYN0LIcYAM473FQe
 XsGMAyShe3RB3llw6SXlG4+Dgz11Z9yX41oaLQZG1GZREDv1WKNIKuhvMt0ztspw
 hNFpxRZ42SHN1dhkyPMb0skXeE+5LfvKZWSiYruIYhUi0JRLDRlGvulgKiCLzbab
 bUJeqCxI8BfDJNu2f4Q2lxYoA16I/8t1G7zs/AWyFgvfjGJ9NhWXZCQP2Xu62KyZ
 bTeRMtbhJW8OqbtabFWBI8HAwuFT9qkwuEJWRZtL70aWXk/bw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu80m95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:30:46 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:30:45 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.49) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:30:45 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1oN+KM1swfQsL8V63ZhrGzgojlKW38RaLVyDhrP8dN9Brq47foGzPlp+UrvjL+CgG9nePJFxkton5/q3dyJcIcueQxgmGMEYQSmEm2OgMo2tnnEjKLCI1kwzD/3JXjofr7TA76/Orsve66Fxdpm5mq2YekLKBYB8F4aAoEx0AA3eV4SGM2JsOTowG/CfuNdvJiZXpajFEQgIZpt3Z/FQsf7jbD+1YYt1y3EKFM23iYf51xMXs01m+pD4c8g7O74YvY9AD376rJtpULeq447tEEF2mfwma7L9UQv6kPKVFiq1v6kNDYNT5Wf0E8QhwRetFcyTcbGUbw1TPz6S5H7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIpBcKM9SkvEMFV+nVff0E5FaQZxh7jpAXOjfxrjU3k=;
 b=EprWLM4WgcGOeYeZ3T5RG/bjzfovpxluuxsTcZxMzQgkN+73KQfqgQVn5O9izQJYzw4T1q8w0qPVdG9YTjLsP2mbEctu5zd1wnRh4fmBlmO3dJ+fbx7+g0aw5TEWxqOiT4vec6tmLxhCe0XOUZSkvFw0O7znWegVcAb0stGgPlkLUCNNwaV1QYQwGzAMiWejpn0716fjdNgZY9e3GNZJKG8rnElKw8LIcc1M+3aAYocRHYQsAG1p4NuPyiHBJEkfJYDxZq8smC7W5i0yqNZHJDIlXxRXw4xsZnrEPAQaMlG6MSMHcT3WwCl6Db0XTQl1jQzuNn77uzJ+6LAR9aJQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIpBcKM9SkvEMFV+nVff0E5FaQZxh7jpAXOjfxrjU3k=;
 b=eK0Id8+9sc1ep4W26qKpf1RgIxLzWW3u061W5PgFQbjPk1i5Jz6OtzMDnSncVKzscQnVCBWYLevfaRc0p9xHgGWWatvtsPp+BU2eFOY+7lvNWzdf8rtSEw0n4Q3qcfv/8btkifZgJQ9fev/lBWa3+ALSdcSgP0AA9+1O9v/1wWU=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO4P265MB6853.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:30:43 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:30:43 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 17/17] arm64: dts: ti: k3-am62-main: Add GPU device node
 [DO NOT MERGE]
Date: Fri, 14 Jul 2023 15:30:33 +0100
Message-Id: <20230714143033.112624-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO4P265MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ba3b6c-e6d2-4138-20ad-08db8476e7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgLcQ71J99bTrCZHzUieF9TH2rUL57d9huQnHuDolSPeHRaS2SCVq+1uUnGLwtLCUCYgIUYtnaoYLIAqRLN/g5F0JYqAjBNhrhKUmpnZBDxTM0h7C64IEp83lBvttV7CRRu46GV8QqIykParNXMIaOnRwkRNoz5ClPsGq5Q9dy4Q3FWTuAdyURMNTE87SdqhEIrfGvmHlctBuXFtEx2dnyZ6GkYE2faH8ljaeqkGUqRnt/unV7BGmQ6Lpk+Yz0EkTdBJ/ld7zG+aVsWyhniQLFGscLct/fPrEMGZ/TD+yt9xTtVcmehE408YNIjBdzZHl9MYnZbQIWP7ipv90YGj+HXTvhP3eN5spyLZCJA/oRRaPtulDwBk9tNZNH616tXAB3++e8Og3jhPDDi3M2OsdfccO+LAJWJjy9EkC3BOHKdJPFf3Nd4RM8n3FRzCkGEDAHDF9YUxfq1kbZtPbR4uA+K+h6mrt49KGf+fWRflarwAhCb/FCNFPL5z9aQ1adAlPVCe96Y/v3wzVsqoWJHB06OA01AqZDmqYot48wCTe5gO2bmrs4TuwEpoANOGDt5JGmbHBy8Zz1Sev9n+ITiojoYuJk2o0rxS2uZEZDTKxyP+biQmurQHQJFPdKmijYBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(39850400004)(396003)(451199021)(41300700001)(44832011)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(4744005)(5660300002)(2906002)(8936002)(8676002)(316002)(6666004)(6486002)(52116002)(6512007)(26005)(1076003)(6506007)(86362001)(186003)(83380400001)(36756003)(38350700002)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?67XNNJXxLZIk+cJ6gRbyNjApuixfbegz+cschRFtsFvrIM+1aDMZ8g8C0lGg?=
 =?us-ascii?Q?FTOcYf+pwZTgL9HgA10Z71IaezxKX8ZYfq10qS5iXCnhalGRoXTW6veM3Dil?=
 =?us-ascii?Q?PZRkhrufXT5Bku0dNe6JrqjFJwSlh8ZKMur5IK0SzkZC7vK8aFksGDgdTbNP?=
 =?us-ascii?Q?4QxQcHLJzy/JGrc/xMrQDgbKKhkKjj2fGNRtJPo+fF0eHmxyOrJlzBaxv27G?=
 =?us-ascii?Q?pS1jLxNcA4vcrBF2ak8mh3Vw1FkqyIK2tgk1T7NOtei8ukCziL1OQ88n8VMQ?=
 =?us-ascii?Q?v7OOfpAAvXfGTlFx9jNj5LR6/tpmHQxwb3jJYqGb3usIuoLS02pJEXgaNQ8+?=
 =?us-ascii?Q?HbyPg0jZ8kDzfd+AfRtB2ChG/mGjhjoIdeWrxHfTjO3KGF2DXfpB88dOihOr?=
 =?us-ascii?Q?WOm0In/ZFPaGBQPqD8H5DjBDN8Ka/vfMKGZECQ6VJR/A0tm6VKNaRfsI2RQ3?=
 =?us-ascii?Q?lV2DKZubfo7iXKlcoIzvkitMUnFv/LCHWII3PvmYi1xvjUVe03dfLEARSiyc?=
 =?us-ascii?Q?ZtKFCH3bDDwlz0I1deUqaYxyKjeuwonDfpbEKuUz+E2nhmxBkDw6M1SUXJog?=
 =?us-ascii?Q?i3EWnx8ANDQ9KPo0/KW0V3DIKxg5BrHewKCn/dSMOAdOn978t645fwD4Wrla?=
 =?us-ascii?Q?Y4ROVBXSF1krYJfpqgrZJm//BGn7MuYSL0Nt5ZxyazqI9twRGuuOhtZBvICW?=
 =?us-ascii?Q?2oucZEHILwQd/FSuJYfInfOgqJmKrkT8qcL8E+FL9nYIExew41qxcVBfk18W?=
 =?us-ascii?Q?/AkDjMS2QSfJ16Y+N0xBCv5+RKS6jIWV/QmqSadoM96Z6s5Np5wblUoCY6oD?=
 =?us-ascii?Q?GWdftEQbhNRDMAwLYhk1G72m20e4TGakEt2qnznfkcXI0v86wXDRR08Azamc?=
 =?us-ascii?Q?eD1Z3goBR6XhozZ2rncZCAGSWTvQlNxiu3D53Mg+/AJE1PHmqjLwLAFluvi6?=
 =?us-ascii?Q?/HJXTfD79gSyJZvF7AegotJHa4hODNCtrF9PsnMiFUpi7KdPiBiHSxWcWxY+?=
 =?us-ascii?Q?ijJYyOsiOn9PH+d2LZWvGMzP7nscdMJ03hSEeh2dyxcaGwRQWjX0xEqSxJsq?=
 =?us-ascii?Q?7yt3cmu0IdZEwVbBARwSxcVYI1umlLExCfJLIQGCJcoTrpz3wIbzFNFAqmOQ?=
 =?us-ascii?Q?IhY0tj1XZyqJ6+YF7zb1YVgTHq8plIixFpPgmN+Va62uW6eBN113W6InapxO?=
 =?us-ascii?Q?Hsh50Aaapf5UsxnQLLZaIPRIHCmod5qhBwYZTgQYPTQPNeRZm/uyPJKXrdZn?=
 =?us-ascii?Q?86hbBF8yOchcwspEw3u2LCYFfaP/6F+kOznRCNCsIuiaxw0gmqClkgUJ9OID?=
 =?us-ascii?Q?v+vVKItg1QphkDBtU0ClrQB20evQ4k/B/5sr59uLtcD7uo8dveOWpouKPDb1?=
 =?us-ascii?Q?581x3mALEt1xbFtEYhpWFTj6ykmUAfuJZP8v8nVYAJ6amYdhkJC4vWouBDoq?=
 =?us-ascii?Q?udGeEu6i48x3gf2VJqILqDNffEMIW/785djB3Lk6U8c2yOV3dPuFkTpVeeZI?=
 =?us-ascii?Q?K2U3QtV+dBbj0D8xeRNP+RmH36sjY0Dbm1m/lqGsU3tIOrfDQGPkhBwlGhHw?=
 =?us-ascii?Q?DDEXb07EM2d70hsvJcFCaIhCcD4rPlD7YBB3EubegCs5yZt3va7nw9nRDLRY?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ba3b6c-e6d2-4138-20ad-08db8476e7d0
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:30:43.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EkhEUY1qEKfG/Ue0pT1ymtl4b3n1Rmk9RTfDyXA83CMKbmzXYQovAz4Y44B2c5RYKTPxV7yccx+qymRgU4tJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6853
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: _5gi-iKkgSD6RB7LWu_0zOKGjZYVg003
X-Proofpoint-GUID: _5gi-iKkgSD6RB7LWu_0zOKGjZYVg003
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the Series AXE GPU node to the AM62 device tree.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index b3e4857bbbe4..ad13414acf18 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -892,4 +892,17 @@ mcasp2: audio-controller@2b20000 {
 		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
+
+        gpu: gpu@fd00000 {
+                compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
+                reg = <0 0x0fd00000 0 0x20000>;
+                power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+                clocks = <&k3_clks 187 0>;
+                clock-names = "core";
+                interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "gpu";
+                #cooling-cells = <2>;
+                #cooling-min-level = <0>;
+                #cooling-max-level = <3>;
+        };
 };
-- 
2.41.0

