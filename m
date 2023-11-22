Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289487F4D8D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FD910E0C8;
	Wed, 22 Nov 2023 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C7810E68A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AMDkLtU020325; Wed, 22 Nov 2023 16:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=DiX/EB6ywS+jdCDv7ngNPrXTWQBclFOriiTcDYGkLSE=; b=Jzk
 zf2HlowqctBBXU4P7SzC6BCzdPz6f4NoQEl4sQ1TwI7sGbDc/o/zx+noNXRw3wMw
 AWaohWC9gk8BR76mx5NgYmoXpiCriKrASplKhzbV+ldZ983Mp34wLdOnYEQ/nJGD
 MjPdNRJpB+KqTbenscb2Xr84NzGlEZrTXZ6qzICgDtneCB0uA1/Ryymqt3ewrTew
 bCH5tBnfpoGu4z4j45F5hRJLkxedM1VhRdZj46I/G17GYo3Eg52sMEO79obPnnMl
 3bn6VXni1BLYEKw+fcVZcE7GWJocKqurvmQ75PeZFZ1IS7vjnLi+mDg/BG+SrKtT
 +wEDfbhOiQmvdS3DV/w==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gsf32-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:13 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:13 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0+gTebC6lsCALFib4xbN5r6vcsXHJGMKX2cNdX0mgAAt5ous1ObXME+2ZRUmJLT3Gu00RtgqRTAuPein6VTVmdpi8BcNUZok8m4XrXUHe8Qz6wEtMFPqfx5aNA7KGjcJTtYo9Xyzi77SJ3rpVngmPJrJRUlAGd+o1skooRmiOG1GX8WrNBGJdIe1fvdn3ck0YXzdtu4bztL2LXxYgcF6tabtu+CUJQiz+bcbsWhxm1xdH20z2zmwaQXy1qsJ4596JFWOjdkPOAFEerQMcxAwlhRSfTMLyuuNVAeb/af1Y07NxyllgC9O2URPFLh/rxa4eGCB/nxS4QAb2VKaUNdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiX/EB6ywS+jdCDv7ngNPrXTWQBclFOriiTcDYGkLSE=;
 b=emXgG/cWBVijYXUCsNTpVjqqzy1bW/Y9rfN0+Uu+zR7fbd3UzJ/irmn25s0Pm7jBjAnBptmuARA9VHAp4WlH3vD+MxMdjIKldgYdjtjJRGh9ZYTcyiJlwwNWSxGB48xHquYQzqVRiJ+S4egiyxVm8xwdBCwLm1OSfR5MdHsE5TfHoa2tzKS0IvJ2AN9Te55e/DHFXS466SySkBMGp419Nr6l2Eue94CP/ohfhTlZkrGvuLM8ohC+/ND8z5gN3XeqY8rovRXrBY3aM65X/2Gml6buRSaKuHro9ITzG3ziq3DHl4MI8p7MFyf/Y2QlGF1bhn+n1jMKsh8jaCpPfA0Qww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiX/EB6ywS+jdCDv7ngNPrXTWQBclFOriiTcDYGkLSE=;
 b=m8W2+gMEx+aUgGiGL1FhY2acCrznDkf9a0ZoCL/NZLp9uaXIPWBP2oBjIBGrNlbhP2ipa1zDVKJeVMyO8Fv4rfkJay+iGO6RO9xj2iXymGOtP91jPaABop0D4YtyzhNlnnjXvC0GA4vEHVEU0LyyI6RcDmLBPq9tTHQXH0hDMgc=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5329.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:11 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:11 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 06/20] drm/imagination: Get GPU resources
Date: Wed, 22 Nov 2023 16:34:27 +0000
Message-Id: <579027bd5be4eb3218c9784050ded2326ecbc352.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 07321763-3471-475d-485b-08dbeb78ff2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eVWgxxma28ArgKyR/Mur8PLv7a44JYab+W7Obq0LepJvZDBiMRlxQX67UMPi0ruTfJWQG9q8bJKCmd+g20TGtYPVTtN3W1256JBdKX1Vzxx05+JtpKCcPfrPY3phVKTMVmMkhyG3nmoweGujoNKalS142Uime5Xd4V0mGHdZfCth0MaYg3dBWJWQfRNQ+EHeqOzn/ubXSiQM2d8Ti8Ra5jvzhCy7zjX4Fc/kPV+wbLRK27JbgBh+ci0e3SbcUiKyxNpA1dffOtJOGN3DLUEogFo2W+pFUiSX3v/k6e3b6OdziIwrCHhTdMxe7o2KkDO1SqGErRQ9CNJSFFJQgqHed57gkzuXXaYfBtNOv1Bw4w4mA4CKkIN5t1t7fsiq/GDDlacu5ZRMsxuowGy3xYF04jrSQKuYw2t/KtRBAaRa/t//gekQLdax35QWrVkHQH37YHiuAwrCIvyCRgrw+AgnZFCNdnEVKW/v6H0BtPf90eZ49hL4EdYnCm8msjM6vU9IYwyb0qUeSsf1EqXLAtQSsdq7nqV/e/AYEmqYf6jeugqoaMWpzUsQ8ptHeMMJZpthAObmbikqYe81NLaMFTImirWX9/W7OqZbvJSrt7q++SWNfRMA3OzVj+FyXvIXsXpzLeL0M+pYSyRHaEkO3HtHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(52116002)(6506007)(6666004)(107886003)(2616005)(6512007)(6486002)(44832011)(5660300002)(4326008)(8676002)(41300700001)(8936002)(7416002)(2906002)(30864003)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(86362001)(38100700002)(36756003)(38350700005)(134885004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82z5lobJKkvtdPel7q7yZxI/n/EJEsJE4EMWnJSboFM1XDibiK894wz92bFN?=
 =?us-ascii?Q?jGJfwxH3RTEBmqXx+i1gSFmtVW6UTRQaze5wL+b41qoCFNp8psf+1040c+87?=
 =?us-ascii?Q?v9tmLCuFJIagFNPEZ/BhP5h7FAW5ukfXqptzt4pRDsjxzZw88e7lvE+Bxclm?=
 =?us-ascii?Q?alUCH0o7eNEhC0D/VxiWqGtG4hx0+oE5AOQHf2JHbGDYjhLrGI783bTwLL7t?=
 =?us-ascii?Q?qiRyIOJoOu63NiwPcTR/U18Y+KVrkx+aWhY6JyF3q7s4qM6I0ztedAcLF6Cf?=
 =?us-ascii?Q?UgXwMRiy+XnPpSsf6yJslQo6EDtZW9Jb/QOrBwBG8zSjF2mq/t1UmFLo+oJY?=
 =?us-ascii?Q?LZTiOrZvAygzdiRUpO09xcFZWrihAkQ2/tFGehJwg9zR0B3QHQQ7blbzspkw?=
 =?us-ascii?Q?QjtRqrNg0E7t1PpTJc3j3TZ8iqpzW0cDCsZ+vVT6I3pLwtjXyERDMnFMXCtW?=
 =?us-ascii?Q?fqx4a/Jvd49RQ+F7sP6BxcQXscwF5j30NOij3ndAd//fczzCigxEvk3DRa87?=
 =?us-ascii?Q?KKyqaoiNbK11k27o3Dj3r89Os9lVVe34ETQb52qs3UdKpbA5b3TpKCAwrhz7?=
 =?us-ascii?Q?ux0QuaJwzPcm9UpDefbrqqLMVFtkmApAYDj2/egIIo6caGgWwpIj9fQ9+aHM?=
 =?us-ascii?Q?EAjCzSoyd5ow1WnnwG89Lbn65lvkSbRSoDFqgBWOFEypZHWNEJTthJz7tIhF?=
 =?us-ascii?Q?kt9GJSxC8NqynAS98LP5K4cQI/hpdW2Eq7gZtepXp1OwRFATISEhtOlJIgI1?=
 =?us-ascii?Q?Owsyr/C9YM+wqVv6liyb8yiU2BB/thMseLIPISzuJtsEgj9kevQQC33nhtMP?=
 =?us-ascii?Q?3xHWwcwAxalx/WshiIkncJYfHvh0jmdSBokgGY4/vqsrmlgQVepbzGI4YNhA?=
 =?us-ascii?Q?a5Pn0PyXnUjdbGKwxeVW3eVRqTAOUM0dZThcah8nRc0wlHjw/OeSSVl1m8x+?=
 =?us-ascii?Q?JMIEyJk+T6G66pKIRDxEuusYwKOzBX4sKcI1c0GpgSNewanSx+jjVMF5jD/C?=
 =?us-ascii?Q?YrVNxy/W0JrF5hKhY/txWn4fb9/ZHcpu087p2cvpHx8dnUsGdskp7wcl2Uwl?=
 =?us-ascii?Q?tiOtsrXS0Fw3NjxAm/y3UpRzrb98a6y1lVPEikDsKE3N/IKnb4OK2IxmgZnp?=
 =?us-ascii?Q?VSS8NeIUQx65zHn1yeR8PGrl3dYDULQQNaFNmOz4o6OG+QeRuPuyclOG0UiL?=
 =?us-ascii?Q?LAq9e4moZq7VwEn/Ui7qnj4gbTv1UejJBg9nTuIV0nvMlvfK9sroW+Mu3uv/?=
 =?us-ascii?Q?+hWY+RPHqnRiBQz3XHvl4YCI7lqFWvdT3jV/b2BZ13uN6bFabxQHtEQfkl71?=
 =?us-ascii?Q?Jna0asmYESJ/S87ihNtI3DGI2+qejMY6EnsZFVCxZXy1TIDmiShp8Uorl3OA?=
 =?us-ascii?Q?tZjQiNDua90rViSVsg7OVlbScDrvoc4XHTgYNZVVve0xdNiAGPuDX1vqj/HF?=
 =?us-ascii?Q?hLpKWfcZlaAN6+rhGDth9uYYdweGTf2Ps4ai+m4T1QO1+2OiN+xAYVxwl7Xp?=
 =?us-ascii?Q?OAiILX5XQVIAJ1xO7z4/nPZksE/0PNpg8odvf89X8AQpwaMxKDo86u7eCsie?=
 =?us-ascii?Q?734cbY2ffig7QG+EGRR97+EgFuZ+k218HrEvqQkIibHmDUOVMCOYVmY9vvGi?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07321763-3471-475d-485b-08dbeb78ff2f
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:11.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVbw78zdNA2P1U/rNk1Tyq3nH+I8laDz9msGEtq1QHz5KdcgOrtXR23bfHeZj1hO68SBYpB/M93eHDRcK8DlFkM1PQr/TbJcXi9NYKTmyPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5329
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: dYQxZjJm2Pc-G7NK0EomfDRmyl_ekpTb
X-Proofpoint-ORIG-GUID: dYQxZjJm2Pc-G7NK0EomfDRmyl_ekpTb
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sarah Walker <sarah.walker@imgtec.com>

Acquire clock and register resources, and enable/map as appropriate.

Changes since v8:
- Corrected license identifiers

Changes since v3:
- Remove regulator resource (not used on supported platform)
- Use devm helpers
- Use devm_clk_get_optional() for optional clocks
- Don't prepare clocks on resource acquisition
- Drop pvr_device_clk_core_get_freq() helper
- Drop pvr_device_reg_fini()
- Drop NULLing of clocks in pvr_device_clk_init()
- Use dev_err_probe() on clock acquisition failure
- Remove PVR_CR_READ/WRITE helper macros
- Improve documentation for GPU clocks
- Remove regs resource (not used in this commit)

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h | 152 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  18 ++-
 4 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index f12a06ada9ec..d36007f2825c 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -4,6 +4,7 @@
 subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
+	pvr_device.o \
 	pvr_drv.o \
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
new file mode 100644
index 000000000000..abcdf733f57b
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+
+#include <drm/drm_print.h>
+
+#include <linux/clk.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+/**
+ * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
+ * control registers.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->regs.
+ *
+ * This method of mapping the device control registers into memory ensures that
+ * they are unmapped when the driver is detached (i.e. no explicit cleanup is
+ * required).
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by devm_platform_ioremap_resource().
+ */
+static int
+pvr_device_reg_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	void __iomem *regs;
+
+	pvr_dev->regs = NULL;
+
+	regs = devm_platform_ioremap_resource(plat_dev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(regs),
+				     "failed to ioremap gpu registers\n");
+
+	pvr_dev->regs = regs;
+
+	return 0;
+}
+
+/**
+ * pvr_device_clk_init() - Initialize clocks required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets struct pvr_device->core_clk, struct pvr_device->sys_clk and
+ * struct pvr_device->mem_clk.
+ *
+ * Three clocks are required by the PowerVR device: core, sys and mem. On
+ * return, this function guarantees that the clocks are in one of the following
+ * states:
+ *
+ *  * All successfully initialized,
+ *  * Core errored, sys and mem uninitialized,
+ *  * Core deinitialized, sys errored, mem uninitialized, or
+ *  * Core and sys deinitialized, mem errored.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by devm_clk_get(), or
+ *  * Any error returned by devm_clk_get_optional().
+ */
+static int pvr_device_clk_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct clk *core_clk;
+	struct clk *sys_clk;
+	struct clk *mem_clk;
+
+	core_clk = devm_clk_get(drm_dev->dev, "core");
+	if (IS_ERR(core_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get core clock\n");
+
+	sys_clk = devm_clk_get_optional(drm_dev->dev, "sys");
+	if (IS_ERR(sys_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get sys clock\n");
+
+	mem_clk = devm_clk_get_optional(drm_dev->dev, "mem");
+	if (IS_ERR(mem_clk))
+		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+				     "failed to get mem clock\n");
+
+	pvr_dev->core_clk = core_clk;
+	pvr_dev->sys_clk = sys_clk;
+	pvr_dev->mem_clk = mem_clk;
+
+	return 0;
+}
+
+/**
+ * pvr_device_init() - Initialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * If this function returns successfully, the device will have been fully
+ * initialized. Otherwise, any parts of the device initialized before an error
+ * occurs will be de-initialized before returning.
+ *
+ * NOTE: The initialization steps currently taken are the bare minimum required
+ *       to read from the control registers. The device is unlikely to function
+ *       until further initialization steps are added. [This note should be
+ *       removed when that happens.]
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_device_reg_init(),
+ *  * Any error returned by pvr_device_clk_init(), or
+ *  * Any error returned by pvr_device_gpu_init().
+ */
+int
+pvr_device_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	/* Enable and initialize clocks required for the device to operate. */
+	err = pvr_device_clk_init(pvr_dev);
+	if (err)
+		return err;
+
+	/* Map the control registers into memory. */
+	return pvr_device_reg_init(pvr_dev);
+}
+
+/**
+ * pvr_device_fini() - Deinitialize a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+void
+pvr_device_fini(struct pvr_device *pvr_dev)
+{
+	/*
+	 * Deinitialization stages are performed in reverse order compared to
+	 * the initialization stages in pvr_device_init().
+	 */
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d3629164a629..d9d2804f4454 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -11,9 +11,22 @@
 #include <linux/bits.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/xarray.h>
+
+/* Forward declaration from <linux/clk.h>. */
+struct clk;
+
+/* Forward declaration from <linux/firmware.h>. */
+struct firmware;
 
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
@@ -26,6 +39,37 @@ struct pvr_device {
 	 * from_pvr_device().
 	 */
 	struct drm_device base;
+
+	/**
+	 * @regs: Device control registers.
+	 *
+	 * These are mapped into memory when the device is initialized; that
+	 * location is where this pointer points.
+	 */
+	void __iomem *regs;
+
+	/**
+	 * @core_clk: General core clock.
+	 *
+	 * This is the primary clock used by the entire GPU core.
+	 */
+	struct clk *core_clk;
+
+	/**
+	 * @sys_clk: Optional system bus clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the SoC Interface
+	 * (SOCIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *sys_clk;
+
+	/**
+	 * @mem_clk: Optional memory clock.
+	 *
+	 * This may be used on some platforms to provide an independent clock to the Memory
+	 * Interface (MEMIF). If present, this needs to be enabled/disabled together with @core_clk.
+	 */
+	struct clk *mem_clk;
 };
 
 /**
@@ -56,6 +100,114 @@ struct pvr_file {
 
 #define to_pvr_file(file) ((file)->driver_priv)
 
+int pvr_device_init(struct pvr_device *pvr_dev);
+void pvr_device_fini(struct pvr_device *pvr_dev);
+
+/**
+ * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
+ * @val: Value of the target register.
+ * @field: Field specifier, as defined in "pvr_rogue_cr_defs.h".
+ *
+ * Return: The extracted field.
+ */
+#define PVR_CR_FIELD_GET(val, field) FIELD_GET(~ROGUE_CR_##field##_CLRMSK, val)
+
+/**
+ * pvr_cr_read32() - Read a 32-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u32
+pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread32(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_read64() - Read a 64-bit register from a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ *
+ * Return: The value of the requested register.
+ */
+static __always_inline u64
+pvr_cr_read64(struct pvr_device *pvr_dev, u32 reg)
+{
+	return ioread64(pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write32() - Write to a 32-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write32(struct pvr_device *pvr_dev, u32 reg, u32 val)
+{
+	iowrite32(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_write64() - Write to a 64-bit register in a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ * @reg: Target register.
+ * @val: Value to write.
+ */
+static __always_inline void
+pvr_cr_write64(struct pvr_device *pvr_dev, u32 reg, u64 val)
+{
+	iowrite64(val, pvr_dev->regs + reg);
+}
+
+/**
+ * pvr_cr_poll_reg32() - Wait for a 32-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg32(struct pvr_device *pvr_dev, u32 reg_addr, u32 reg_value,
+		  u32 reg_mask, u64 timeout_usec)
+{
+	u32 value;
+
+	return readl_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
+/**
+ * pvr_cr_poll_reg64() - Wait for a 64-bit register to match a given value by
+ *                       polling
+ * @pvr_dev: Target PowerVR device.
+ * @reg_addr: Address of register.
+ * @reg_value: Expected register value (after masking).
+ * @reg_mask: Mask of bits valid for comparison with @reg_value.
+ * @timeout_usec: Timeout length, in us.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT on timeout.
+ */
+static __always_inline int
+pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 reg_addr, u64 reg_value,
+		  u64 reg_mask, u64 timeout_usec)
+{
+	u64 value;
+
+	return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
+		(value & reg_mask) == reg_value, 0, timeout_usec);
+}
+
 /**
  * DOC: IOCTL validation helpers
  *
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 3d4f2ba2c015..597188b31f96 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -464,6 +464,7 @@ pvr_probe(struct platform_device *plat_dev)
 {
 	struct pvr_device *pvr_dev;
 	struct drm_device *drm_dev;
+	int err;
 
 	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
 				     struct pvr_device, base);
@@ -474,14 +475,29 @@ pvr_probe(struct platform_device *plat_dev)
 
 	platform_set_drvdata(plat_dev, drm_dev);
 
-	return drm_dev_register(drm_dev, 0);
+	err = pvr_device_init(pvr_dev);
+	if (err)
+		return err;
+
+	err = drm_dev_register(drm_dev, 0);
+	if (err)
+		goto err_device_fini;
+
+	return 0;
+
+err_device_fini:
+	pvr_device_fini(pvr_dev);
+
+	return err;
 }
 
 static int
 pvr_remove(struct platform_device *plat_dev)
 {
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pvr_device_fini(pvr_dev);
 	drm_dev_unplug(drm_dev);
 
 	return 0;
-- 
2.25.1

