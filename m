Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547E753D54
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB7610E8A6;
	Fri, 14 Jul 2023 14:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272810E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:28:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36ECMOn0024604; Fri, 14 Jul 2023 15:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=Gh5nry9G3EtL39fdloSbI
 lS3vR6MZHmLv+kzoON/g1o=; b=CAiLKb17ff+BGXUd0dIsXzAiihKoB0k+dw4Ja
 yqHcHDpQcfxTrdW7SNy2COtu59l8Yo/e73mX+Yaafycdd3bLXgT3o1KulSRb/Gko
 LUAzHOtxfthsSg7bq3RBXmV4Dtsq400S0mUlm694OC2gQ8JfbgEACbv1fHh7vSmN
 aN5140UZW6twzYfP8Sczt3OKkzX/TR6d6CyvSAxq8QyDmh2nk1EITMHiUMNFjwWf
 5kM8Tk7VbN20iSa3EovOfeWLyQ7XOnhzfRi6rAvxhdavymbo2zjuJvITqJXc0vi+
 1PkNxUJXkCARTQwvpYeATcAJrzqceJpzKLXkdEIil96+Kc9SA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu80m7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:28:23 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:28:22 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.48) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:28:22 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEqMc2wqdhivxuueKdYIWUXrPqnLnlMD7u18q3XbC6moVzNTkFKvYPXLSDdgpqsj8mKc0gZqKV1NLtzxY8ryt8hVj05Y1CC1Bt5422gZZtr+X6XjHBwiadLNo8/dGF8i4A5w2ARVVNKZA69U+vnhuRD+O6dlS9CZ04Qgfyaa/2zxqalsvd6ikxuUjw+CEJH+vQfh0N5rm2dFypacyuYSL5lb0lQklvpoDTIgXch2s6Uw+OGpGdrSvxGKxTc9jVJx9kMkmGiKxSzyfvQIKfBreviXGIbKwwNqX0dmEH+2cdFF2j5LxQOSZnJbAh9BdHsNIGoNBLqjPlyyEdtc9RBYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gh5nry9G3EtL39fdloSbIlS3vR6MZHmLv+kzoON/g1o=;
 b=hrcojXb9Yq9mygQN+VohN2pQ9rwtHuh68IOiD3PVOVNCp+lfJXuIlF2CqX3YdmFX7Qn2EZ2cirUhIv6kz1O23uRfyykxAVoQ90iK8MgS3TBl9yrONsOt4BBlPv/f7MyLOElsrzGYezGVTFVxkOcw1CfYeLqTdouq/xIewwQKoTKCMoJpVjuI5/QEO8x5z8U400l3kCxKL9bys6S7s7rHxz5zO1Vet2hp+x/VvaGneeS4EQDFANtodAaECbMyLVBUi7iQymfE457RM8Q94Qgdq60FqE774fNE13ffU2xoNRkiQLF4yK5hs+zQ6ywzf9hFS1irhtDwhy4taEuq7XjKCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh5nry9G3EtL39fdloSbIlS3vR6MZHmLv+kzoON/g1o=;
 b=AmimRgKCLvaorQ+bS/Nb1PwqzKqmbNUQmkke9boroA/WNqXwCAFNGCMz02pgZbyC6Ms6T4kGeLaii7L2mCm/4X6mz2E9FDISpqclCkv6BwLVTntHwxCCZnL2+k5B5aVPA+fLbaIdwHvAvDK8Q1MS2iazzuxvhBg5r/k/rklSwRM=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB5972.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:28:17 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:28:17 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 11/17] drm/imagination: Implement MIPS firmware processor
 and MMU support
Date: Fri, 14 Jul 2023 15:28:06 +0100
Message-Id: <20230714142806.112191-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0347.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::23) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 976b8ffb-26f6-4c0d-4fb5-08db847690c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIieH1knfaTLY4+M1Kpx8qRwo5I1uiAhOI3ABMU1PGNEpv1UgosF1WzkcR7pSjU6jNl1WtWG4QydLiaNM6JZ957qCCA7O+TMttiMRRA4dUDDYNg/HRfwzWuV4wyQdf8jmD56pphL4XqIJttmqqHChBeb/zwKzyOLoMk4G1ZLdjwqWkBWMBqGCz8uLzKXrBa3MMHLgJv0TxK6YaTn7WwS13iYiv+oNEh1MtP35F7lKPWxVTDgA9D8+o/dE6sx/yyu/NxO6vMcTNqz8JE9kOsyDUhBdIs+DIVF9CfDuiYVC/4IGcr3+gwcgkJazKndlyDFVBUbuX9ALMchS/4hzntPe1h9IIz/uNnjXeBwEk2MIiU2NyIGQsHDYRhnzihXJPKZTzR3jnS/Ud/gdBEU3Zmc2AdAAcXTy1lMwkJGhDaax19AGe2BGNoMVXkZJSlha656jo3AVBqvwvubyFMoR7fqyFcEvX0ysD80xD6MBiPU1TF21ojRwaRVbfaYRQD4umlXAD3FwIS2TrDKxGNffxcfV5UQHoYGVG50Ub5g6jqACtIvzF+1LY3N+s6F3Wh1QeoZJe/4f3LbLnSii3WRe4fDS8M5bW402YZArDXRpN33EhECevhFDaIDvmq8UUOmVbq5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199021)(86362001)(30864003)(2906002)(83380400001)(44832011)(8676002)(8936002)(316002)(2616005)(41300700001)(7416002)(5660300002)(38100700002)(38350700002)(6916009)(66476007)(36756003)(66556008)(4326008)(66946007)(186003)(26005)(6512007)(1076003)(6506007)(478600001)(6486002)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OASnKNgbB66yN7QrMpwPO0W4AQJ4S17hA8JenowHlamrkCO34YIe7pd5gc4j?=
 =?us-ascii?Q?zOjygLjn5OA3BX1X3VciJGEwgL2Gb142q6l5RDOECtWLMO5DztoOAKAzduVT?=
 =?us-ascii?Q?YpMLTBDJ/Q679lvunsatnF7NVaKME8ep4CxR//IHzIsL2P6nWW7iQWXdah79?=
 =?us-ascii?Q?C5/3+K2GM7JwZUBHRAX4bhgc0zJZRCCFb0hnR2JNFHLWXG9sdHsZoYfLQsZP?=
 =?us-ascii?Q?igLJi7Sk4uILm+u9e/QAnizRFbKU8iu8t6v7AVBFA9bF0EacEJQ+lP36xISa?=
 =?us-ascii?Q?B+kkGohs5ijx7BlJCbvclpv+ZbizLZU+EdN8bZbo6+GymE9FMmbcvnAdOg4T?=
 =?us-ascii?Q?H3upio90q2pRav1xHN0nPJ38HTHoGu3ocn2Ab+srnU3BWMMchLVhwgc5+CrE?=
 =?us-ascii?Q?cieGfIlWgKlt6+y+wHsswu5ufDc1ae8xhSZIDNYjFFqJ/yYHgtnJWOcBm1Id?=
 =?us-ascii?Q?WS36TCDf3TgGKxSezYoMfA5UgAhHh4AhfPE/mAEBSIPPSSgJJH7ZUEco/w+j?=
 =?us-ascii?Q?baOhvhYvhPLOI7HIi7BOWoyMC0Dg4KvRnGRmIAjtrW0HCNy7xTq+TxayoEMj?=
 =?us-ascii?Q?dY6maTRRGHCcfD0YxomKukDsYIacLwSKFwAgwnEXbPU1hYi3F+maxzrVLfd/?=
 =?us-ascii?Q?4rkKNQIVvEZwyf2OZesz0k2FLzGpCdkPra2KTHvJvhIKZoqnxmnxl2K7lpBl?=
 =?us-ascii?Q?qXROP874oFYUjUpCxxG9WlEpVZxaWsEAAor4HUmPw79x9qE6SFEWkiIkMKHG?=
 =?us-ascii?Q?2GltsiAwPmL/GOPYWEKYCazino5iPWDCsvKdLHkHynN9oTPI8ns929J32Y71?=
 =?us-ascii?Q?M6oLKQuKylfHQDKwoZTkPQL85NL/tySqPDNGNV/BT0ynfVoJYsJ52rx2LVka?=
 =?us-ascii?Q?W4rfY0QHA8/X1H/fPHe5/W+ZuCrgkMRTY4q535qqrohC/yLON73xomrKrmYc?=
 =?us-ascii?Q?DTHz/fUIDJCXwPicizyI2BAqssXjtb65p1Ds4Lwjpn2b5F3zfcnZdYr7QhJ6?=
 =?us-ascii?Q?+u+JNULBXRN/eL0ExHfUYkFwyD/pE9N4xd1ZtwRVw+kby92WAw/B3uo7Azdk?=
 =?us-ascii?Q?t383zeQiWbo5LnLfF2BREcJVcwdAEr5vRSD/XJeRjrxAsqrJHoQZbbSl4Sxl?=
 =?us-ascii?Q?hyAaEzxu1nzQ2yPD/8M3SX+rhL6IYWLHJeZHmzPwR9y9yWlqfhFRGuWdDFSu?=
 =?us-ascii?Q?1ZaaZ7+KfSRel8vE6XTlMcl67orBrU7Q4gtg+b61HUuFsJpo7EGTSxJ61CoM?=
 =?us-ascii?Q?01veHD9A5l4RbN3sjZy0JZ3ie5WZQtRbGldkghpqZmIjfxXuQsfJVQ8WNZ5q?=
 =?us-ascii?Q?qRy5913PQZXhHkDUdubgdf5tZkrEAXUlowDAaieSkiE5AncUpGJ105hWN+3q?=
 =?us-ascii?Q?oWTHVUetBDhkIvdv9VpuD3/Nb1oVlbQ8awLm92CnfX1H4g+G0wSARN5ec907?=
 =?us-ascii?Q?Zo9yrIRjnBSHvCJpXnLBTw63XvPzgP/e9e9SREh9tuRGfRuB12IVglvX/iMJ?=
 =?us-ascii?Q?qKO4sDtVReg0hfr5V56que+DQkNtcOtjuSVtIroz1mdZR3OcnzovDSdH+lvs?=
 =?us-ascii?Q?yTTBMXdB2cOOGyBzrOe69Ne4Cs8d02PSeoYe0Z12gAg39F7fcl/4O0IZyahj?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 976b8ffb-26f6-4c0d-4fb5-08db847690c7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:28:17.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwdo5raLt6qOhyh75BHoEY/wPlZ5fVm+W/R2XtQlBzBPIwhgTon90jVAqa9voyDAbudKC6B2j4UI7b7trHhZTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5972
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Qh8BOVnCBPqBfIKmZO4XgYG9a9UOiEnb
X-Proofpoint-GUID: Qh8BOVnCBPqBfIKmZO4XgYG9a9UOiEnb
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

Add support for the MIPS firmware processor, used in the Series AXE GPU.
The MIPS firmware processor uses a separate MMU to the rest of the GPU, so
this patch adds support for that as well.

Changes since v3:
- Get regs resource (removed from GPU resources commit)

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile      |   4 +-
 drivers/gpu/drm/imagination/pvr_device.c  |   5 +-
 drivers/gpu/drm/imagination/pvr_device.h  |   3 +
 drivers/gpu/drm/imagination/pvr_fw.c      |   2 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 261 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_mips.h |  38 ++++
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 209 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm_mips.h |  22 ++
 8 files changed, 542 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index f4e265ab0735..3172b65783b6 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,11 +10,13 @@ powervr-y := \
 	pvr_drv.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
+	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_mmu.o \
 	pvr_power.o \
-	pvr_vm.o
+	pvr_vm.o \
+	pvr_vm_mips.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 3736f95b86f1..16c64c7ecfff 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -50,16 +50,19 @@ pvr_device_reg_init(struct pvr_device *pvr_dev)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	struct resource *regs_resource;
 	void __iomem *regs;
 
+	pvr_dev->regs_resource = NULL;
 	pvr_dev->regs = NULL;
 
-	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
 	if (IS_ERR(regs))
 		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
 				     "failed to ioremap gpu registers\n");
 
 	pvr_dev->regs = regs;
+	pvr_dev->regs_resource = regs_resource;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 5521bd6e6550..6725df65cf54 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -93,6 +93,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @regs_resource: Resource representing device control registers. */
+	struct resource *regs_resource;
+
 	/**
 	 * @regs: Device control registers.
 	 *
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 3d8cd72ebc03..0f470fca3040 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -883,6 +883,8 @@ pvr_fw_init(struct pvr_device *pvr_dev)
 
 	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
 		fw_dev->defs = &pvr_fw_defs_meta;
+	else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS)
+		fw_dev->defs = &pvr_fw_defs_mips;
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
new file mode 100644
index 000000000000..7d26d47e493e
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm_mips.h"
+
+#include <linux/elf.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_MIPS_BASE 0xC0000000
+#define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
+#define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
+
+/**
+ * process_elf_command_stream() - Process ELF firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @layout_entries: Pointer to layout table.
+ * @num_layout_entries: Number of entries in layout table.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+static int
+process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw,
+			   const struct pvr_fw_layout_entry *layout_entries,
+			   u32 num_layout_entries, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			   u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(program_header->p_vaddr, program_header->p_memsz,
+					      layout_entries, num_layout_entries, fw_code_ptr,
+					      fw_data_ptr, fw_core_code_ptr, fw_core_data_ptr,
+					      &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			return err;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+}
+
+static int
+pvr_mips_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_MIPS_SHIFT, ROGUE_FW_HEAP_MIPS_RESERVED_SIZE);
+
+	return pvr_vm_mips_init(pvr_dev);
+}
+
+static void
+pvr_mips_fini(struct pvr_device *pvr_dev)
+{
+	pvr_vm_mips_fini(pvr_dev);
+}
+
+static int
+pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    const struct pvr_fw_layout_entry *layout_entries, u32 num_layout_entries,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	const struct pvr_fw_layout_entry *boot_code_entry;
+	const struct pvr_fw_layout_entry *boot_data_entry;
+	const struct pvr_fw_layout_entry *exception_code_entry;
+	const struct pvr_fw_layout_entry *stack_entry;
+	struct rogue_mipsfw_boot_data *boot_data;
+	dma_addr_t dma_addr;
+	u32 page_nr;
+	int err;
+
+	err = process_elf_command_stream(pvr_dev, fw, layout_entries, num_layout_entries,
+					 fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr);
+	if (err)
+		return err;
+
+	boot_code_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+						   MIPS_BOOT_CODE);
+	boot_data_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+						   MIPS_BOOT_DATA);
+	exception_code_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries,
+							MIPS_EXCEPTIONS_CODE);
+	if (!boot_code_entry || !boot_data_entry || !exception_code_entry)
+		return -EINVAL;
+
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem, boot_code_entry->alloc_offset,
+				     &mips_data->boot_code_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.data_obj->gem, boot_data_entry->alloc_offset,
+				     &mips_data->boot_data_dma_addr));
+	WARN_ON(pvr_gem_get_dma_addr(fw_dev->mem.code_obj->gem,
+				     exception_code_entry->alloc_offset,
+				     &mips_data->exception_code_dma_addr));
+
+	stack_entry = pvr_fw_find_layout_entry(layout_entries, num_layout_entries, MIPS_STACK);
+	if (!stack_entry)
+		return -EINVAL;
+
+	boot_data = (struct rogue_mipsfw_boot_data *)(fw_data_ptr + boot_data_entry->alloc_offset +
+						      ROGUE_MIPSFW_BOOTLDR_CONF_OFFSET);
+
+	WARN_ON(pvr_fw_object_get_dma_addr(fw_dev->mem.data_obj, stack_entry->alloc_offset,
+					   &dma_addr));
+	boot_data->stack_phys_addr = dma_addr;
+
+	boot_data->reg_base = pvr_dev->regs_resource->start;
+
+	for (page_nr = 0; page_nr < ARRAY_SIZE(boot_data->pt_phys_addr); page_nr++) {
+		WARN_ON(pvr_gem_get_dma_addr(mips_data->pt_obj,
+					     page_nr << ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K, &dma_addr));
+
+		boot_data->pt_phys_addr[page_nr] = dma_addr;
+	}
+
+	boot_data->pt_log2_page_size = ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	boot_data->pt_num_pages = ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES;
+	boot_data->reserved1 = 0;
+	boot_data->reserved2 = 0;
+
+	return 0;
+}
+
+static int
+pvr_mips_wrapper_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mips_data *mips_data = pvr_dev->fw_dev.processor_data.mips_data;
+	const u64 remap_settings = ROGUE_MIPSFW_BOOT_REMAP_LOG2_SEGMENT_SIZE;
+	u32 phys_bus_width;
+
+	int err = PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width);
+
+	if (WARN_ON(err))
+		return err;
+
+	/* Currently MIPS FW only supported with physical bus width > 32 bits. */
+	if (WARN_ON(phys_bus_width <= 32))
+		return -EINVAL;
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_WRAPPER_CONFIG,
+		       (ROGUE_MIPSFW_REGISTERS_VIRTUAL_BASE >>
+			ROGUE_MIPSFW_WRAPPER_CONFIG_REGBANK_ADDR_ALIGN) |
+		       ROGUE_CR_MIPS_WRAPPER_CONFIG_BOOT_ISA_MODE_MICROMIPS);
+
+	/* Configure remap for boot code, boot data and exceptions code areas. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1,
+		       ROGUE_MIPSFW_BOOT_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2,
+		       (mips_data->boot_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP1_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 63553)) {
+		/*
+		 * WA always required on 36 bit cores, to avoid continuous unmapped memory accesses
+		 * to address 0x0.
+		 */
+		WARN_ON(phys_bus_width != 36);
+
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1,
+			       ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG1_MODE_ENABLE_EN);
+		pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2,
+			       (mips_data->boot_code_dma_addr &
+				~ROGUE_CR_MIPS_ADDR_REMAP5_CONFIG2_ADDR_OUT_CLRMSK) |
+			       remap_settings);
+	}
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1,
+		       ROGUE_MIPSFW_DATA_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2,
+		       (mips_data->boot_data_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP2_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1,
+		       ROGUE_MIPSFW_CODE_REMAP_PHYS_ADDR_IN |
+		       ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG1_MODE_ENABLE_EN);
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2,
+		       (mips_data->exception_code_dma_addr &
+			~ROGUE_CR_MIPS_ADDR_REMAP3_CONFIG2_ADDR_OUT_CLRMSK) | remap_settings);
+
+	/* Garten IDLE bit controlled by MIPS. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG,
+		       ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META);
+
+	/* Turn on the EJTAG probe. */
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_DEBUG_CONFIG, 0);
+
+	return 0;
+}
+
+static u32
+pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+
+	/* MIPS cacheability is determined by page table. */
+	return ((fw_obj->fw_addr_offset + offset) & pvr_dev->fw_dev.fw_heap_info.offset_mask) |
+	       ROGUE_FW_HEAP_MIPS_BASE;
+}
+
+static bool
+pvr_mips_has_fixed_data_addr(void)
+{
+	return true;
+}
+
+const struct pvr_fw_defs pvr_fw_defs_mips = {
+	.init = pvr_mips_init,
+	.fini = pvr_mips_fini,
+	.fw_process = pvr_mips_fw_process,
+	.vm_map = pvr_vm_mips_map,
+	.vm_unmap = pvr_vm_mips_unmap,
+	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
+	.wrapper_init = pvr_mips_wrapper_init,
+	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
+	.irq = {
+		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
+		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
+		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
+		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
+		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
+	},
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.h b/drivers/gpu/drm/imagination/pvr_fw_mips.h
new file mode 100644
index 000000000000..6e54e603d481
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_MIPS_H
+#define PVR_FW_MIPS_H
+
+#include <linux/types.h>
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_gem_object;
+
+/**
+ * struct pvr_fw_mips_data - MIPS-specific data
+ */
+struct pvr_fw_mips_data {
+	/** @pt_obj: Object representing MIPS pagetable. */
+	struct pvr_gem_object *pt_obj;
+
+	/** @pt: Pointer to CPU mapping of MIPS pagetable. */
+	u32 *pt;
+
+	/** @boot_code_dma_addr: DMA address of MIPS boot code. */
+	dma_addr_t boot_code_dma_addr;
+
+	/** @boot_data_dma_addr: DMA address of MIPS boot data. */
+	dma_addr_t boot_data_dma_addr;
+
+	/** @exception_code_dma_addr: DMA address of MIPS exception code. */
+	dma_addr_t exception_code_dma_addr;
+
+	/** @cache_policy: Cache policy for this processor. */
+	u32 cache_policy;
+
+	/** @pfn_mask: PFN mask for MIPS pagetable. */
+	u32 pfn_mask;
+};
+
+#endif /* PVR_FW_MIPS_H */
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
new file mode 100644
index 000000000000..1bab16fb664d
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw_mips.h"
+#include "pvr_gem.h"
+#include "pvr_mmu.h"
+#include "pvr_rogue_mips.h"
+#include "pvr_vm.h"
+#include "pvr_vm_mips.h"
+
+#include <drm/drm_managed.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/**
+ * pvr_vm_mips_init() - Initialise MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL,
+ *  * Any error returned by pvr_gem_object_create(), or
+ *  * And error returned by pvr_gem_object_vmap().
+ */
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev)
+{
+	u32 pt_size = 1 << ROGUE_MIPSFW_LOG2_PAGETABLE_SIZE_4K(pvr_dev);
+	struct pvr_fw_mips_data *mips_data;
+	u32 phys_bus_width;
+	int err;
+
+	/* Page table size must be at most ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * 4k pages. */
+	if (pt_size > ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * SZ_4K)
+		return -EINVAL;
+
+	if (PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width))
+		return -EINVAL;
+
+	mips_data = drmm_kzalloc(from_pvr_device(pvr_dev), sizeof(*mips_data), GFP_KERNEL);
+	if (!mips_data)
+		return -ENOMEM;
+
+	mips_data->pt_obj = pvr_gem_object_create(pvr_dev, pt_size,
+						  DRM_PVR_BO_DEVICE_PM_FW_PROTECT |
+						  DRM_PVR_BO_CREATE_ZEROED);
+	if (IS_ERR(mips_data->pt_obj))
+		return PTR_ERR(mips_data->pt_obj);
+
+	mips_data->pt = pvr_gem_object_vmap(mips_data->pt_obj);
+	if (IS_ERR(mips_data->pt)) {
+		err = PTR_ERR(mips_data->pt);
+		goto err_put_obj;
+	}
+
+	mips_data->pfn_mask = (phys_bus_width > 32) ? ROGUE_MIPSFW_ENTRYLO_PFN_MASK_ABOVE_32BIT :
+						      ROGUE_MIPSFW_ENTRYLO_PFN_MASK;
+
+	mips_data->cache_policy = (phys_bus_width > 32) ? ROGUE_MIPSFW_CACHED_POLICY_ABOVE_32BIT :
+							  ROGUE_MIPSFW_CACHED_POLICY;
+
+	pvr_dev->fw_dev.processor_data.mips_data = mips_data;
+
+	return 0;
+
+err_put_obj:
+	pvr_gem_object_put(mips_data->pt_obj);
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_fini() - Release MIPS FW pagetable
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+
+	pvr_gem_object_vunmap(mips_data->pt_obj);
+	pvr_gem_object_put(mips_data->pt_obj);
+	fw_dev->processor_data.mips_data = NULL;
+}
+
+static u32
+get_mips_pte_flags(bool read, bool write, u32 cache_policy)
+{
+	u32 flags = 0;
+
+	if (read && write) /* Read/write. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_DIRTY_EN;
+	else if (write)    /* Write only. */
+		flags |= ROGUE_MIPSFW_ENTRYLO_READ_INHIBIT_EN;
+	else
+		WARN_ON(!read);
+
+	flags |= cache_policy << ROGUE_MIPSFW_ENTRYLO_CACHE_POLICY_SHIFT;
+
+	flags |= ROGUE_MIPSFW_ENTRYLO_VALID_EN | ROGUE_MIPSFW_ENTRYLO_GLOBAL_EN;
+
+	return flags;
+}
+
+/**
+ * pvr_vm_mips_map() - Map a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to map.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL if object does not reside within FW address space, or
+ *  * Any error returned by pvr_fw_object_get_dma_addr().
+ */
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end;
+	u32 cache_policy;
+	u32 pte_flags;
+	u32 start_pfn;
+	u32 end_pfn;
+	u32 pfn;
+	int err;
+
+	if (check_add_overflow(start, size - 1, &end))
+		return -EINVAL;
+
+	if (start < ROGUE_FW_HEAP_BASE ||
+	    start >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    end < ROGUE_FW_HEAP_BASE ||
+	    end >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
+	    (start & ROGUE_MIPSFW_PAGE_MASK_4K) ||
+	    ((end + 1) & ROGUE_MIPSFW_PAGE_MASK_4K))
+		return -EINVAL;
+
+	start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+
+	if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		cache_policy = ROGUE_MIPSFW_UNCACHED_CACHE_POLICY;
+	else
+		cache_policy = mips_data->cache_policy;
+
+	pte_flags = get_mips_pte_flags(true, true, cache_policy);
+
+	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
+		dma_addr_t dma_addr;
+		u32 pte;
+
+		err = pvr_fw_object_get_dma_addr(fw_obj,
+						 (pfn - start_pfn) <<
+						 ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K,
+						 &dma_addr);
+		if (err)
+			goto err_unmap_pages;
+
+		pte = ((dma_addr >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
+		       << ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT) & mips_data->pfn_mask;
+		pte |= pte_flags;
+
+		WRITE_ONCE(mips_data->pt[pfn], pte);
+	}
+
+	pvr_mmu_flush(pvr_dev);
+
+	return 0;
+
+err_unmap_pages:
+	for (; pfn >= start_pfn; pfn--)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_vm_mips_unmap() - Unmap a FW object into MIPS address space
+ * @pvr_dev: Target PowerVR device.
+ * @fw_obj: FW object to unmap.
+ */
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
+	u64 start = fw_obj->fw_mm_node.start;
+	u64 size = fw_obj->fw_mm_node.size;
+	u64 end = start + size;
+
+	u32 start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >>
+			ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
+	u32 pfn;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++)
+		WRITE_ONCE(mips_data->pt[pfn], 0);
+
+	pvr_mmu_flush(pvr_dev);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.h b/drivers/gpu/drm/imagination/pvr_vm_mips.h
new file mode 100644
index 000000000000..05bfb0565209
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_VM_MIPS_H
+#define PVR_VM_MIPS_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+int
+pvr_vm_mips_init(struct pvr_device *pvr_dev);
+void
+pvr_vm_mips_fini(struct pvr_device *pvr_dev);
+int
+pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+void
+pvr_vm_mips_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+#endif /* PVR_VM_MIPS_H */
-- 
2.41.0

