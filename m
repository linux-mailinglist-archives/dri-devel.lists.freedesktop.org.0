Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E792E77DC25
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63310E2F3;
	Wed, 16 Aug 2023 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8EA10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7djRc002497; Wed, 16 Aug 2023 09:26:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=19ixKAhNl7+WOPUD0wln6v/uvI4+uMfDHBK/ikFaX84=; b=LpI
 yvDEY3NBalSodgcotR40d/Sjg3wZ03V1bWgDTqK7GXw1+fbIBBB4fBZqPf5VbA/r
 ismQJa+OB0HgbAvAGq9TtpTIqJekSB235T4DtrSBhR3ouqEaEVFBj1vF0WYV9Zlj
 89cz3XWnIB/qDCo6hTLc7VFHGlggGrwtdN2twM575yBOz3rdGLjK5Q+rLWwHDAqp
 1O1x37pktuVFqBjaZuH+5GzCHFxsxAtf003cdZCO1lEmDeBX/4ShZVJ5HH7Pd0wT
 Me6tWwv8/GAEdFADs6xiMWZpUHqFkrPY4pX8Lxhb4Y5mWA+XLej8tnCUPaGgPqma
 IzPj/tLKUQfOfkgN6Cw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25ttutw-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:40 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:30 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.112)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:26:30 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFulrcLZuurmx/LB3ReyQP9oJ/QtdDK2wh9Aw5K4FhbFny9PIEtK3NrQ9ZR+i0ZegaY6oYFaj7GIwraQZkVBiRRFphd764XUG4z7Z1Ug+WYCSCt9iB4foDgGWZ1FCDJCITRn71sUT5BwAMhQoNp69oPnUIOWUiYwRWGThEJqhBBPhSyYK5l3E8b3J0mLnpXgvtP8b582SHGmJGyl0DxwK0sEXlpbxcecpVfZL3T+FsBc5dQFCqtamkUpOWduqKFwCCFuqU2ErOPHNDC4W56Wbo9PfcfsAlBDtzXHHrIi9K37ThWWFU++ZlhzipmbZfKlsVExSUqee5S5RTC/P6AB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19ixKAhNl7+WOPUD0wln6v/uvI4+uMfDHBK/ikFaX84=;
 b=Us60y22JE3NEBaxVORYNba+jUd5TG+jzu2GzLibjC4WenJRY15Al/9rTW6SGApkE3gl6Srg9Rw4vYzEQhWKicrCwAcSKmaxgzJfxOmPZnJwSzikbDtmTUwgFIcc4rKCQeBNVW7/tytKl2njsFg8XkfH2ZD1pvK3VwaX2m+pipf89I1nui35bV6vQ6oywJ+W1fbSL3qt6iiyqmcBt/p2f5NJ5/IqE7QxzSwrjRW0VPnl0bVfailsU17VJ3l5zuoSMqvsYqISjSo5KbW6fl19gHSzWTExFIe8G65+E3gNJQXnO95guZJtHTF/TpbFFQ+rNO3u8nuUzc10+AqzIMXA/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19ixKAhNl7+WOPUD0wln6v/uvI4+uMfDHBK/ikFaX84=;
 b=biYw29He0/vDS2MK+DT2HgDQKuLKnJ4NV8OKcqc1U4ZEyRlK1D8Czg3JaWOY9nyBg4mS9mvW4SCfil1MazJ8c8iTME36q+nGXaydO4zUm6IZMLIeywt5NCiOCN6+ta6tt26Ba4A8vSsVgsjcm7KN1EeVY56MLvW0aqJFi71MjPU=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:28 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:28 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 17/17] arm64: dts: ti: k3-am62-main: Add GPU device node
 [DO NOT MERGE]
Date: Wed, 16 Aug 2023 09:25:32 +0100
Message-Id: <20230816082531.164695-18-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: eda277a0-8a1f-49f1-42b4-08db9e327ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/bYRM+0Psu4V24+xIEKmInu2NR95hlwOReEuxNUDdaZs5qHvGC+Q2F9GtKKHrbMH6qKHeWsKOMbcwsxeY71c37BEnQMNUlgS9AGEGj7KJrk/DwcNTn0wygthLykduk9KH/slAG7JpJkujvksbCMZ+YvGUQhfnrxy0QacUe4drLYCh9GUkjwzFbEbZoRl2hsojvGsexsHZMcpDdgrWb9s2F93MUjfsqMkMZW5i1QLx9qbIyfbv8Flio78N9uUN1h6PGd+G/GpffYPdU9mPLWINxqPFX4sWzVafo6coCH88BCjSGkNuiRJo3/HWVbCwd+OKhRzgY69pq6E9WI8ttRkAAKDLjiYqn+UQTvGzEPZsRlGgjy5cEyl6mQYBV10DMG2I6G4sWPlguMWZL1fXbkV/Gx/nAYT+rv1T86ewY2wegLLyruvcym5Mv5Yo0vMolQppUjuBXm61GXkTGVNIpGl5aMFr/f25iED8xdTB9sOnwvQFLBqHGo6dleaO2gmIRbqRLm1SmAlm+fRPLguklMVrw9qrZ/63uZS0h1hXpO278cGFJJ2akMZyEfxo1V3X7/s/Zu/dbvx4IBbzsMwAsqNZXTTDv/bJcKIrtcXI4aIAYGUO+PlOT5JI3uxtGK03UF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(4744005)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G35JdvDxC1RqpErl4dK+QqW5JXhmUfbtxFgXGsuOMzaeoc8IqQtY51uaCmWB?=
 =?us-ascii?Q?KYRVpRmhbxDBm59rcmE0HpLWF1Sn8r5RHuszUiBtR6kFb2DEDT9exaN7QE/4?=
 =?us-ascii?Q?0uwQ2D1SNYOXWrLI5eKCtpN5TBmLPyswMxH5xn1RXfNUfVbefHhyW4APEG0p?=
 =?us-ascii?Q?YmwN/2HstvJamHURs5cTtj7Upbtomin2LRUNvnLW9hW8bd9BjwuG9E+SVXLM?=
 =?us-ascii?Q?8cErKu3RFvPhfI0YiNoGVqGuYP3DxdUVxXy8bWdHtwGoZYbbOQ8H9sMQqzzC?=
 =?us-ascii?Q?/J93b5vLR4Ncpw7Q1JxChYkN5X1qEdjGQdyF+U3W5I/QuKFbjoNQG8niiiqD?=
 =?us-ascii?Q?qP24KtNLeVMA3x+Nz+LFxXipIW30A7tBZjawYtAgsa4JPDQOUZYUDrg+rOkG?=
 =?us-ascii?Q?bh1/KmcVv0AUQyvf/XnDSB7VLF3rkwnfNsDSbWLXFgPwh6/NSRonSIxkZMqI?=
 =?us-ascii?Q?02IKQ7AWZ6NmQp2aVULwU3W4NwduVDqJFkZvbmK58ioe/cIoJQ/a5lElLyYs?=
 =?us-ascii?Q?F/8RC8p1vptYmA1g4AzW1AYl4z3XdUp26IrIud34+ntnViY7Ma0h0JzNSnGM?=
 =?us-ascii?Q?M0cK29f8iekXCr5AQUGcIfneuX1/Ol5DqioR87Ci5ybO8JA9/nlGHR0i4GPA?=
 =?us-ascii?Q?XoKRYkAjugdxL0e8pakgItvIcQwR+7LWznu8G6xppVez1a0yEN2Y7HxhpGXL?=
 =?us-ascii?Q?h65r7QxnpZr8yisUkzqBY/QNiUoJ/IB1wCaWfK31TwGfWFy2vTWtHfcPJ5FW?=
 =?us-ascii?Q?HcHU7vdtiUHGWhNM0Rf0EoXgtdd7WqL1G+eI5plESxGdaubhK+qMQf1T+51L?=
 =?us-ascii?Q?2whkhIvhn3MiL+mMdOsDlq2/hP4uzqWb+42+tWjM/nvyul2NGANZZA+IQ+h3?=
 =?us-ascii?Q?e/mYc9R9Yg2VkWOHqqXeM3FgXNnG1QiDf8TXGPodiG4V/oU1PS///xZDvYpN?=
 =?us-ascii?Q?LiDVtZ9hynAOzsAg1A6hD/ZSRMzqmfh+cAq9fKF8CYF3dh0yh1AZCBTnwq6t?=
 =?us-ascii?Q?77b2WdPTcCS5yWMb/41wbAhxXEN09sDkpC5uT6Nm/BMT2ysF8mv3YkOMp5Eh?=
 =?us-ascii?Q?wYS3yo8B9cUZW7yyWshHa7l64zCSywTpPlGhvaIginZp57HMOth+JB/eiOlC?=
 =?us-ascii?Q?jmPyzmJRE6qToZcyLT5QIL0hJyzIbjIpzBlfcRvZm7rJkZBwHPZtDRxk4yEA?=
 =?us-ascii?Q?P7NjpbV26eosGuhb+neDvmFMO/p2B87FiDLI0Ld70HGYmNf7bRO09/YjPBbp?=
 =?us-ascii?Q?Vq30ZFC1ELsXGGzD+RKuFvm+8LsS+JjhUx4+8e62vYDrnvXuZMzXW6z5lwj+?=
 =?us-ascii?Q?R8ZNXnIEbV1r+wzQUYVPgqUy3OjSl4oKzZ6U2ywpu5Esk13VoIJ7eEhI6YlA?=
 =?us-ascii?Q?4I31gR2oGmKMHsiu5+EmL4taITIBbOWReD1rg4lnVsnSAb/8tQeHaVpCBiz3?=
 =?us-ascii?Q?p9AVuiiRhTNxY1HR+lld43NTtOivDmZ/i/kwgALW6cID9bzY5Jp2ZYVVMsMK?=
 =?us-ascii?Q?SYcqF3ResvlRGQ9ciTdeT6LySHFFNGwnB5zbd99lBsLOeSxNcqxBQVed6vof?=
 =?us-ascii?Q?oDbwt0ogKiiPfLYZvIPkHBEZe+2rqBk27g7phlw3ss9Th4VLVEzsxkx6NSxS?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eda277a0-8a1f-49f1-42b4-08db9e327ca3
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:28.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJMmZndo07aegubgiwX9EYiAneSD9PlQbgtYgwEm3SDjrVdvZiAEKQCWlxB+l00rd/XfSS3/Lf0aWDlRP8CzmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 47LhXC64DeIFMvTxJuBGnEq0L8IqHiZy
X-Proofpoint-GUID: 47LhXC64DeIFMvTxJuBGnEq0L8IqHiZy
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

Changes since v4:
- Remove interrupt name
- Make property order consistent across dts and bindings doc
- Fixed formatting (replaced spaces with tabs)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 2488e3a537fe..b55bb3d0556e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -913,4 +913,13 @@ mcasp2: audio-controller@2b20000 {
 		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
+
+	gpu: gpu@fd00000 {
+		compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
+		reg = <0x00 0x0fd00000 0x00 0x20000>;
+		clocks = <&k3_clks 187 0>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+	};
 };
-- 
2.41.0

