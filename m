Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7EA753D50
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862FD10E89D;
	Fri, 14 Jul 2023 14:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5416E10E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:28:14 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBJNfs020760; Fri, 14 Jul 2023 15:27:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=mtd1eaJ//ebLTLhkZm3pt
 leFtIuN3Y6++UHVyaFtNwA=; b=n3l2479OEyCGB4ZtV2RHOadOJ4XgXZCmXM8kj
 9jaOq79hjMRQZRToG+iQz8l811H2+7HoBL6VheklPLrSxI+gwoYiytweFGyjpQYu
 O+x3ZuRKKAFNRHL5+1t/h+L39Ch08LCiQ/57xbmmstHM0b4UUBeD8OYn3juNvkWv
 fyLNVxqnBD8lHWfjrCKBnZYGmVidbblqcasKyrzupiRpLLJZuTOQwpDY1OBgCQw/
 MyGBgx5JeOM3IqtCxKkAq1ZOW41Sq0nQObgpdKzzhlSiTUmllDU74i01CvqDHZSk
 uIuwDLViF4RCZGpDNbghtCkHQAOVGKeBhm4kpZfxmZlOTgapA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gmd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:27:45 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:27:45 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:27:44 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2vbXR+pF0dYY2aqh/IPUndSmkta8WQC9osqr7JGbJXOvchhsrMvoOFDJJyY5gL627tg9CWJXPcZU9mQrEDqriSmSMgqRijtJr0J9dHL5Io54Y0FwAvTte68rQYpmv7rO22e9bORVv+pSmFKjWMzhKfFRHPrF2GT9fXMFjjRBDWDCNy0m74Sn2FgeBj2SkEcHnOSEJjXIQ9jBQEI1HLoemJfGsgpBaDM3m/qiXxPFeSxz3dAm7b2EatH5ReWcNIMnPmtUln3n9N3agT4BPMobh7zZiME3pD2ZbwXE/sj8b8OD4xG6jiGUtYgjIPH8EVDemBAvEhGDAhkodc5x6Ofqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtd1eaJ//ebLTLhkZm3ptleFtIuN3Y6++UHVyaFtNwA=;
 b=FDn+Qqr8Htw4fzA+FBz7MuXwfzAsjAC4pQwOleQI0Idjk0JBUzVNwJmF4TVkPwtCFr9+1fO19mXEt1PIoqeYMXzMeGALSIxy6BUADI9sY3xOUt83fej/doYPAQGg06sE6zIk08onureqnaTglAdc8IXKtdgcpCp7Sheo4SNevNgUBMwy8iPbQ9bLgV6hW+oSE6Q3gfILbpgjHyxG8l4zGrM1+Kqltj0GOC1XUwHZmf7DEOwF08YAQnIga519aZllc3gjDttREPYPTKJ88DMhleoKBoOe98jHbaGcdmDwglpCMLGth67S0Oz7lV5FN5LwdggCYyIQRXiCe+59dDLkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtd1eaJ//ebLTLhkZm3ptleFtIuN3Y6++UHVyaFtNwA=;
 b=qwMkZ8cZXFIml0MZvPe0xiIgrHzLVBSIOlBKqc5gMcv8O+TO2iqmwlMMFBdg8pWC4Awc/bxDI96ymQXeEeo4zJPnigJOyVF1m2A8aU/lOwf2lCmzObITV+cKr3c488ifkdPPhacvBp3qRGl1KsuCYTvW+8jCD6NFkWtpXkafjHw=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB5972.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:27:43 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:27:43 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 09/17] drm/imagination: Implement power management
Date: Fri, 14 Jul 2023 15:27:34 +0100
Message-Id: <20230714142734.112014-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c4e537-2579-49b5-aa74-08db84767ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7T/D4qXX7o0BNd3qaf3NKm7jZVgZ0xpgfT/M/AO0rZwPlP96iAId2M13gyfh7g1gK4L/h/Sfdkt5N+jOwIyu55LjWE/lBrlKKyY4iu6NT9MfLM+rVIDf5fDhPO0PHTSR/+qlGV+ecwB53tiz9+in8fCLmKNCbKGQ3ovq+mP94UBQN/7BsNvV52eowrMTJzizYgbDlVaj1XdzlvPykKCsk9U4pq17CEf0ZKepaqptv7X31+PChtbg9UwyjCV/u5tMuSGVNFJgIC4wkUtW1/L41q0paVduzI0ylymEGS3KKZNI67PhYn9a+DMsSXPq4SFN1qW2OwOyje8U/v9QYulgbg2HXjwBtkvoqr2lyRo21lutwA8oCQFUu9k0eafYJZihKr5Am4ZAQi97liFv4/aIoBpGDZMuSr54qyVlFQoQYrLsN6AxqnRa/UI13u/68pkRdhG5Xza9GzN/KWyjcXz5LJutagcW9m1rbMHLPffjNiNbMLFLQHBc2rkAk3CnVkv5/DX6hb66d8/11X4wcLE06kV6a5gmtxerpdCWNrBANnmuV3ISpdPInZiF+axcB+AXCsItAHg74eEwn+5PfjGvDzZrFe4WONGrKR8SuEsxFX1CtZ6AoLFBTI0egz+QtVg+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199021)(86362001)(30864003)(2906002)(83380400001)(44832011)(8676002)(8936002)(316002)(2616005)(41300700001)(7416002)(5660300002)(38100700002)(38350700002)(6916009)(66476007)(36756003)(66556008)(4326008)(66946007)(186003)(26005)(6512007)(1076003)(6506007)(478600001)(6486002)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O2+qDYKiKBGLznSfSNqYOCP6psxF5DIzBb9UlQ4FBjA3OCofpUcwOaZUI742?=
 =?us-ascii?Q?z9ojiVXGfHQ9V8ef1fuOYiD7tcV5qZh5dHOWzC5tYXnpFHLOfhOpUiq9mY/i?=
 =?us-ascii?Q?AeGyra9/cwtAYyA3Bn9Koygyjgc0fK9P5Z0YLp5GVLrKVGooQHiSUux/4Bwz?=
 =?us-ascii?Q?27ft+3BkKod3QuBg3gRNjaAwM6z0nk/Tu7S3GueqSu9MJDWjlPmFUVCM/pYM?=
 =?us-ascii?Q?PvcBbgtp2FJjRfsN/VUINlDhA0n9vDPoY43TpjiPzphAe1u/XJa/bnmx2ER4?=
 =?us-ascii?Q?oePmXofM0MgrxzSj73SivFGKN9Z5Y5djyXW7XsA5Ooq4gfmauldKkb52Ubr/?=
 =?us-ascii?Q?ETop3F2kMt+BoC43OYWF8DjfvDa5lltEN3BclOpJh0taI1EActjsFimCUveh?=
 =?us-ascii?Q?IpEyBqAfcSSDaLwu9VIfmOKtXAeBr8nNKUBq4Wm6kTlTvqBePBrl4YO4hkOS?=
 =?us-ascii?Q?wzpwbZFnLloQUQOHxrlvK0ReASaoFRLQxLwiuG2Dnw4KZbn/559/g3B1mKqn?=
 =?us-ascii?Q?A20gUIWHV1rlPjEanpfTETk++++COWnsPE8LnGotXn2pbmPg7Rztu/kXv2MU?=
 =?us-ascii?Q?EGG+pYQRrqyAHRQLqlv+USPP8rJQrucJGPiftcHcohKNnOBNzc9hbWN9dR2T?=
 =?us-ascii?Q?hY38Htr9pMvR6pFKZGVzHmN1HtjoTiyMvgV931Fh9+ELjBwWq/U+lVyW1j1D?=
 =?us-ascii?Q?7d/SdBBInkjXjL+yfoCWdeYfjaERdPK/A+qONQoP4e+6lC1nAGf2x8Yns8mA?=
 =?us-ascii?Q?R08q8aEJTqbkLMb8pxJ0M+qz1MQUHDbgIhvnXYHoFD6drPX3jQ4PQRkkZlcL?=
 =?us-ascii?Q?7fa8++RLO5uvmAkW3WFi8NMLfFaiZPdGWen8dYSVhKwKTRPk3aSoDuhci6AC?=
 =?us-ascii?Q?QJRTEWEpbLHPCbi5pylsxR1/NU+oekTAM1DAgfo8yFNqi1/6ptIW1maGqxKT?=
 =?us-ascii?Q?uOdoaN3dVDgarCxxd9ZNwpOxYT7/SZRWyVi2BAEIHQ5U19pEr/tBEkW86HjK?=
 =?us-ascii?Q?SiN5F0I7w0ub2zHpkSuVRPqeVA99OA8qxaB68XKGAsKB0rg8/waB+hDRjUfD?=
 =?us-ascii?Q?zNufDIbHGt3kVgh8HHpWAp1WDjIhYo0btH+Bmfg06BZd/nw7Ez91ky5S02YE?=
 =?us-ascii?Q?Xt70/yitA7v4GajwK25gH8XRRtmPGa8KBvYq79di3MsnvngKXXM/7efsKDlb?=
 =?us-ascii?Q?naZerRtVC9XnxvV5I87wEeMy9ZKPy8yB78lAVL/3yzMR3rnmc79br6kIIQno?=
 =?us-ascii?Q?fFYPW6itiMNbz5WNCssD7+UwD52KeyHaEjjxaO819HBOdx9S0cAvK799I2ir?=
 =?us-ascii?Q?psd4zKTbcr1EnELPCZZtDpiR/R3QiLewDpbmL6VbA2f3CGZc7h8r2b/hAJzN?=
 =?us-ascii?Q?43z5pqhe8wycESdhHupdwLe4PHghRSQsTebW16p0NN9EewMKJA3cySDhCtqS?=
 =?us-ascii?Q?SE3lCcJv0wku0rQHGwv1jRi2lEmgYvVBR+Zp1bSov49M5JkPTkLkOXYvj+u8?=
 =?us-ascii?Q?OA1uHJts7eT0E4f1wCaYpK39Ix0xaW6UESkJo1PxOkEOP2DliDe0wBCJauLR?=
 =?us-ascii?Q?sjy77iAh6OpHahZTkKPsHpC/LEmjP7Do9uEnlTAW181HLagOaN57oj4Rg7Xe?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c4e537-2579-49b5-aa74-08db84767ca5
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:27:43.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiAiqICq6nfGQ5/TGnoGI9AyAjHj8R6I8qsPyuVDAzwblPG3fSaJkYaKuURybXQ+lWtTF13m/gZ6hc8V+fh8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5972
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 7MKBSQ3py3K84kHwraB_SY96pjZJWITf
X-Proofpoint-ORIG-GUID: 7MKBSQ3py3K84kHwraB_SY96pjZJWITf
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

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Changes since v3:
- Don't power device when calling pvr_device_gpu_fini()
- Documentation for pvr_dev->lost has been improved
- pvr_power_init() renamed to pvr_watchdog_init()
- Use drm_dev_{enter,exit}

Changes since v2:
- Use runtime PM
- Implement watchdog

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  27 ++-
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  19 +-
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 6 files changed, 376 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 56a3d3104a05..534bffd59273 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -9,6 +9,7 @@ powervr-y := \
 	pvr_drv.o \
 	pvr_gem.o \
 	pvr_mmu.o \
+	pvr_power.o \
 	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 2dd0d8f93c4f..190e5982cfdb 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_vm.h"
 
@@ -361,6 +362,8 @@ pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 int
 pvr_device_init(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 	int err;
 
 	/* Enable and initialize clocks required for the device to operate. */
@@ -368,13 +371,29 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
+	err = pm_runtime_resume_and_get(dev);
+	if (err)
+		return err;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_pm_runtime_put;
 
 	/* Perform GPU-specific initialization steps. */
-	return pvr_device_gpu_init(pvr_dev);
+	err = pvr_device_gpu_init(pvr_dev);
+	if (err)
+		goto err_pm_runtime_put;
+
+	pm_runtime_put(dev);
+
+	return 0;
+
+err_pm_runtime_put:
+	pm_runtime_put_sync_suspend(dev);
+
+	return err;
 }
 
 /**
@@ -384,11 +403,15 @@ pvr_device_init(struct pvr_device *pvr_dev)
 void
 pvr_device_fini(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
+
 	/*
 	 * Deinitialization stages are performed in reverse order compared to
 	 * the initialization stages in pvr_device_init().
 	 */
 	pvr_device_gpu_fini(pvr_dev);
+	pm_runtime_suspend(dev);
 }
 
 bool
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index a20fc8e22790..31b14b6afb61 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -135,6 +135,28 @@ struct pvr_device {
 
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
+
+	struct {
+		/** @work: Work item for watchdog callback. */
+		struct delayed_work work;
+
+		/** @old_kccb_cmds_executed: KCCB command execution count at last watchdog poll. */
+		u32 old_kccb_cmds_executed;
+
+		/** @kccb_stall_count: Number of watchdog polls KCCB has been stalled for. */
+		u32 kccb_stall_count;
+	} watchdog;
+
+	/**
+	 * @lost: %true if the device has been lost.
+	 *
+	 * This variable is set if the device has become irretrievably unavailable, e.g. if the
+	 * firmware processor has stopped responding and can not be revived via a hard reset.
+	 */
+	bool lost;
+
+	/** @sched_wq: Workqueue for schedulers. */
+	struct workqueue_struct *sched_wq;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 44a189d7baf3..f44a1f9abf8d 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_gem.h"
+#include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
@@ -1291,9 +1292,16 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
+	devm_pm_runtime_enable(&plat_dev->dev);
+	pm_runtime_mark_last_busy(&plat_dev->dev);
+
+	pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
+	pm_runtime_use_autosuspend(&plat_dev->dev);
+	pvr_watchdog_init(pvr_dev);
+
 	err = pvr_device_init(pvr_dev);
 	if (err)
-		return err;
+		goto err_watchdog_fini;
 
 	err = drm_dev_register(drm_dev, 0);
 	if (err)
@@ -1304,6 +1312,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1315,6 +1326,7 @@ pvr_remove(struct platform_device *plat_dev)
 
 	drm_dev_unplug(drm_dev);
 	pvr_device_fini(pvr_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1325,11 +1337,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops pvr_pm_ops = {
+	SET_RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
+};
+
 static struct platform_driver pvr_driver = {
 	.probe = pvr_probe,
 	.remove = pvr_remove,
 	.driver = {
 		.name = PVR_DRIVER_NAME,
+		.pm = &pvr_pm_ops,
 		.of_match_table = dt_match,
 	},
 };
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..6f418e4197dc
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define POWER_SYNC_TIMEOUT_US (1000000) /* 1s */
+
+#define WATCHDOG_TIME_MS (500)
+
+static int
+pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
+{
+	/* TODO: implement */
+	return -ENODEV;
+}
+
+static int
+pvr_power_request_idle(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send FORCED_IDLE request to FW. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_FORCED_IDLE_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.pow_request_type = ROGUE_FWIF_POWER_FORCE_IDLE;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+static int
+pvr_power_request_pwr_off(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_kccb_cmd pow_cmd;
+
+	/* Send POW_OFF request to firmware. */
+	pow_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_POW;
+	pow_cmd.cmd_data.pow_data.pow_type = ROGUE_FWIF_POW_OFF_REQ;
+	pow_cmd.cmd_data.pow_data.power_req_data.forced = true;
+
+	return pvr_power_send_command(pvr_dev, &pow_cmd);
+}
+
+static int
+pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	if (!hard_reset) {
+		int err;
+
+		cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+
+		err = pvr_power_request_idle(pvr_dev);
+		if (err)
+			return err;
+
+		err = pvr_power_request_pwr_off(pvr_dev);
+		if (err)
+			return err;
+	}
+
+	/* TODO: stop firmware */
+	return -ENODEV;
+}
+
+static int
+pvr_power_fw_enable(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* TODO: start firmware */
+	err = -ENODEV;
+	if (err)
+		return err;
+
+	queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+			   msecs_to_jiffies(WATCHDOG_TIME_MS));
+
+	return 0;
+}
+
+bool
+pvr_power_is_idle(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return true;
+}
+
+static bool
+pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+	return false;
+}
+
+static void
+pvr_watchdog_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of(work, struct pvr_device,
+						  watchdog.work.work);
+	bool stalled;
+
+	if (pvr_dev->lost)
+		return;
+
+	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
+		goto out_requeue;
+
+	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
+
+	if (stalled) {
+		drm_err(from_pvr_device(pvr_dev), "FW stalled, trying hard reset");
+
+		pvr_power_reset(pvr_dev, true);
+		/* Device may be lost at this point. */
+	}
+
+	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
+
+out_requeue:
+	if (!pvr_dev->lost) {
+		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+				   msecs_to_jiffies(WATCHDOG_TIME_MS));
+	}
+}
+
+/**
+ * pvr_watchdog_init() - Initialise watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ENOMEM on out of memory.
+ */
+int
+pvr_watchdog_init(struct pvr_device *pvr_dev)
+{
+	INIT_DELAYED_WORK(&pvr_dev->watchdog.work, pvr_watchdog_worker);
+
+	return 0;
+}
+
+int
+pvr_power_device_suspend(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int idx;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	clk_disable_unprepare(pvr_dev->mem_clk);
+	clk_disable_unprepare(pvr_dev->sys_clk);
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	drm_dev_exit(idx);
+
+	return 0;
+}
+
+int
+pvr_power_device_resume(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	err = clk_prepare_enable(pvr_dev->core_clk);
+	if (err)
+		goto err_drm_dev_exit;
+
+	err = clk_prepare_enable(pvr_dev->sys_clk);
+	if (err)
+		goto err_core_clk_disable;
+
+	err = clk_prepare_enable(pvr_dev->mem_clk);
+	if (err)
+		goto err_sys_clk_disable;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_sys_clk_disable:
+	clk_disable_unprepare(pvr_dev->sys_clk);
+
+err_core_clk_disable:
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
+}
+
+int
+pvr_power_device_idle(struct device *dev)
+{
+	struct platform_device *plat_dev = to_platform_device(dev);
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+
+	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
+}
+
+/**
+ * pvr_power_reset() - Reset the GPU
+ * @pvr_dev: Device pointer
+ * @hard_reset: %true for hard reset, %false for soft reset
+ *
+ * If @hard_reset is %false and the FW processor fails to respond during the reset process, this
+ * function will attempt a hard reset.
+ *
+ * If a hard reset fails then the GPU device is reported as lost.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_power_get, pvr_power_fw_disable or pvr_power_fw_enable().
+ */
+int
+pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
+{
+	/* TODO: Implement hard reset. */
+	int err;
+
+	/*
+	 * Take a power reference during the reset. This should prevent any interference with the
+	 * power state during reset.
+	 */
+	WARN_ON(pvr_power_get(pvr_dev));
+
+	err = pvr_power_fw_disable(pvr_dev, false);
+	if (err)
+		goto err_power_put;
+
+	err = pvr_power_fw_enable(pvr_dev);
+
+err_power_put:
+	pvr_power_put(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_watchdog_fini() - Shutdown watchdog for device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_watchdog_fini(struct pvr_device *pvr_dev)
+{
+	cancel_delayed_work_sync(&pvr_dev->watchdog.work);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
new file mode 100644
index 000000000000..4f7b518f88fc
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_POWER_H
+#define PVR_POWER_H
+
+#include "pvr_device.h"
+
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+
+int pvr_watchdog_init(struct pvr_device *pvr_dev);
+void pvr_watchdog_fini(struct pvr_device *pvr_dev);
+
+bool pvr_power_is_idle(struct pvr_device *pvr_dev);
+
+int pvr_power_device_suspend(struct device *dev);
+int pvr_power_device_resume(struct device *dev);
+int pvr_power_device_idle(struct device *dev);
+
+int pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset);
+
+static __always_inline int
+pvr_power_get(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_resume_and_get(drm_dev->dev);
+}
+
+static __always_inline int
+pvr_power_put(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	return pm_runtime_put(drm_dev->dev);
+}
+
+#endif /* PVR_POWER_H */
-- 
2.41.0

