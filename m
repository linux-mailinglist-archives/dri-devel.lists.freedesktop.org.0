Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8221372E6F8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6E10E3A4;
	Tue, 13 Jun 2023 15:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4710E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35DCfIAc029541; Tue, 13 Jun 2023 15:48:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=cE092r7ON5Efl9bLQus9nQ7b1UcIMLtiaLRIvAncOvI=; b=kNP
 hLM6Fjs7/2vy0DjbHIxEPOmz5UA4dkJmC8kLre5vdWn80csjQ0PABPm6gsqwDdDW
 3s7Xz+eVvnaTBVcIleen7BaV1Epkk6niyCSYftvqWLZnqRg4BLG1ZEwI8wVeZz0I
 I65yPlN54bJWjwbI9mOhR41hy8bSXQ5clF2knpGPgQQDdeBamoXBN42V7uDzDdAV
 aNtoj6hKC1jih7lKzkUODDkIIgMCsYuMtEZni/jXkoDQcTDE7+D5rS0fIm4ZJZd1
 20XDQjwNsKCVegUVG0LaqYCDxj1j63jBOql8ENjyzCuyTVAtFW/NY6stZhZ3sy/g
 IwpuiBhN0E+y9nyWzXw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0kd-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:26 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:23 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:23 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu30JNl+UWJaUauvR8FVuyidJv08orOpEUzd+bd6sPCwCr0BUqrdqTClG8tvyvYA3GFE33hqWHg4tk3b/MbZyQxoem9iDqzX6ridLlbFuYWVGLuVUmrdBSYEjw1hvWWfwotd2ZqCV9IfNOgCeXlIYVUxfpwye66rK4/IqCkAFj1mmeo4V+WsdhM/gpYaQ0ItSOLCaebO3U9iiIcFjSDSH3Zdfvot+yS0xCLJQfYMHwkfiy9TR5RBJ9zp9jGP6s2GtPcbeEvr0JdHYyhbpR2bGZDCjZvAy3J/P/ZtPxV3V4soP+NiY9/JaUOi2TViOuKC6ob1RLL15/tav8IYcBCb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE092r7ON5Efl9bLQus9nQ7b1UcIMLtiaLRIvAncOvI=;
 b=IG8x1SoVLEluo5XkRwf32GCy3YqrzMBCM7QO8j96bENFq6WGfVJaKHmq+zcaW79uIhChiupAIjD+EMNGSEAVlhCZJHWGBW0aPgOc5MjoBtq72NTkPV/bvXaDYJZYx1rDO2lTQ25Qlt5mnH4X4dkUYsIWPOhE+mP+wBrUZbF4CN5y1VFS1Xrflg3SkwnaMTnPbVQBoEaTWxCAZi+HBcJdvPc99uuq18WIEfKPX3M6Nk84U/RfpbyoYJ4enosbhg7ToAoiaeUr3Cosix9lT0GUCm/2ekuWWOShBwyD9fwr1+T9gXRpCtPB8dVHQORRbQuqRHtQV2VP0SwZ5X554427Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE092r7ON5Efl9bLQus9nQ7b1UcIMLtiaLRIvAncOvI=;
 b=i59EDIC9zgYPUHe5jf2L7KUC7fXX/wRaZI6Nj6cnjV7cMmYKWnwPe2oDB/xRiAesjcTLjeid+5O/CZDg29TlKR/lpVVu6uSOu/5RemFjn0SGnDhLNiBYu5+uk706MWdU8rv2ZuA+ZjxqSMCuItLu+I49TcSXtOzlaSh5cHeztJo=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO0P265MB6470.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:23 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:23 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 17/17] arm64: dts: ti: k3-am62-main: Add GPU device node
 [DO NOT MERGE]
Date: Tue, 13 Jun 2023 15:48:00 +0100
Message-Id: <20230613144800.52657-18-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO0P265MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: e704be60-d271-4323-d68a-08db6c1d3bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGTvHnX8/NPyNVyji3jlPGCffsJwqfi1GVtFBzGMbRQqaQaLurlo9CUqs9608XZ0eXbzSllQn/oVrmxycqfLaLUstSYOreuUfTzeMiGnH64fHKynczl452wREFBsVABxupX0ohB1cKI2NJgygNRrnugAr6iG2Tx9v97ASgSAEECmM/3Yw9k51PFwr0OGB3hRM1tWOgLDao1K+rOADfyF/BdDvhGbPQwFrm9gJLHyRKu3sJpiGFJdFMz3DLZA9IZ+2854YfkE8ZjWJsVH/3iumxT0WlDR2BeQLoV8caXe5bpvb0Pz2CYu3YaOOvMVj7VohsPlbsl5AGINuVvOC3qPHhOZF3ySxCIRLIF00zmnLv8dDNG/cRxYPJtHWXeD27tJFPEEbuKuIjlU5ojjL8LEPjk5PVK8VC3GBhc9P9fv/2AUlBlDKeUiNIwyM4YgkMFdVMZyzjorTBpWrpOpJI1MFfAQi9kkNnONbfwV8Uy6olz4TusWLPEO8F9NZ+82P5VDCFDkltuSOSp7OGWcC69kFvhBPVsfUdpIbxPyNcnWU6NKaoOn+oYuJB2ueO5max4py8cc+drnaeJ1ATQj7z0HYZiM9occBFqOR5aAsgGZp4CUiAVS8Fsr3kvQV6vGf0MG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(366004)(136003)(376002)(396003)(346002)(451199021)(66476007)(66556008)(66946007)(8936002)(8676002)(5660300002)(36756003)(6666004)(478600001)(6916009)(4326008)(52116002)(41300700001)(6486002)(316002)(38100700002)(38350700002)(186003)(1076003)(6506007)(6512007)(7416002)(2906002)(44832011)(4744005)(86362001)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jK8QMykTCIkQcK0xLSOGaa9PtCj9DhAXoJFHGdVmyM4aPPujf7MI2Ggd3frd?=
 =?us-ascii?Q?Pw4YcmmBc89VZ1xJ7eNk2CUTRBsV0eEvtICZjUk/OSslFo9mgina7aeQDV3e?=
 =?us-ascii?Q?ZJfbTuVNFESPguF7tYDs4VV7aORSeyNYgiQtOJaUy6GH1Ta2S1YFe4uileID?=
 =?us-ascii?Q?qA+r+d1Qw0qXFGUkQEMM/hQfTyRsqzb3cyfxS5aFnXiR96VRAOE30aoSp9yF?=
 =?us-ascii?Q?BqICYCXXN9q0eM2PD8XXssfyPACQpHLxq09HrYKLFMdblUajjNI5ki2txgKL?=
 =?us-ascii?Q?5yVzvJAygt81Ndzf5iFuXSwUMQZHd23KBjfh//xvtJPWVtcGEpL/wkae+T01?=
 =?us-ascii?Q?Ak3bV76T5I0iBM7ITB1kSKYFxTCsJGPiM+/gaURCp+Jb6a6SoVKgZjIgjVnX?=
 =?us-ascii?Q?ZFt9i9oZnLkcp7INgvbGaASYHKUp8h57wsuKRbWH6eF8/2GjrAZePFX7oGBe?=
 =?us-ascii?Q?j5VeGyTMJHJzswi8WkEtDYHx0/JEUYTJG9NXsdN+Nu+IwuTxc+rmNEI5xo53?=
 =?us-ascii?Q?xqh2Qf2KeXBylOl6Y2K3URH+/LIgi7Qo1huBNt3reXxa6faGvf89xNQJgn/o?=
 =?us-ascii?Q?WP92VAnRkE6Z6b+Vgco65dHfDxYhW0dYdtsJOMR+sgHLl5eQkPCnELJkodnD?=
 =?us-ascii?Q?41bs8m/lYg+z0Lk/DS9O5Y7xhElJ57tgye8nvJQQY0z1hkNcJd8aVwc1zUJW?=
 =?us-ascii?Q?5pBaS2lelTQG6+VIykMisVD4zes3yUnJRHWjaDNJSOFuKF9RcSzC+SgDR454?=
 =?us-ascii?Q?AQR5HhZErA3s14Hr9XLlmySqy8sKzOIpnP3NbZ78jCbvvIE5wAV1+HVx9w6I?=
 =?us-ascii?Q?1nNfb0QdztxSnBDiBl4OLFFozaHcP3xAX7MOgueU8IQpNKuYI7DiFovw/zn7?=
 =?us-ascii?Q?KyFz4JJxqaISyd0LTPbpgi+XVfJhl73/cPDi68gAy200WoAQgdjWXw7WToZO?=
 =?us-ascii?Q?J9wKaQ05/xBvdeL73s3BqKsqKNfYfzJQta2mOkTt6EdyvxcMJMOHCRA/vgoq?=
 =?us-ascii?Q?u6n+4qchA6QI2q1n46xGVeE0KZ/mJ81A46wOZDHEasiWhG8OZ1dzyW+yvImJ?=
 =?us-ascii?Q?NaQL4X3NvDJ+t022wBTqQKdG4R9EmjP9LThCpUex7VTWorKaQlUNaMxIcms4?=
 =?us-ascii?Q?QE2Xr/6p/f0QOc7lHxXTN8O669fgzvxb6bkOaF5tpesUhHaXlLbJIN++z61o?=
 =?us-ascii?Q?nNTUXL/ISkZ2HMKFR69oIu2lQtn1YZlKKQNi0jFLPwWzvzTGFVn2f7sTq0GQ?=
 =?us-ascii?Q?74Uq4pCVCKKeysbjh3NEXZLAl9H8QUr3aL46vjipwrnfvW38Zamqp12xJLB9?=
 =?us-ascii?Q?hBauG1XxEBsVvLw5EHeLDpLKlgdnus56Rt3lf3TE5qo5RThwWrz4MF5GilzG?=
 =?us-ascii?Q?/Se97D9liuhHwaGN8/u1D9RqPL4PJHLMpHb+/XFroN97/AFeRg32BaE+k0M8?=
 =?us-ascii?Q?rHnta1xyAtsvktzM/9WRqwIdmInYJay7bFgeFdf6R9EU5roHEj1Kqmijuodn?=
 =?us-ascii?Q?4kDoyc/E5XuWhwHxZUlfXNpgbmIDc3lCGBnr7qA8DtVvE6ha+SSMBaBAVdMz?=
 =?us-ascii?Q?rTFh8kZOtWwupNvz10A7P0m3Rk+h3/gEY08iSh0OlCH5hIAJS/N3F3kdt0vB?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e704be60-d271-4323-d68a-08db6c1d3bd4
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:21.8053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4S9mOB8HUiJ82dkl4b/TPBcGEVi069lC2t6s4YKncMZnd+EtrJkIsmuld/ayLxGMFjNNbx7G/YDbgvxBtpxcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6470
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: U4gZroN3w7PbNzOSEnGiXdHidMBbD4SE
X-Proofpoint-GUID: U4gZroN3w7PbNzOSEnGiXdHidMBbD4SE
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
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
2.40.1

