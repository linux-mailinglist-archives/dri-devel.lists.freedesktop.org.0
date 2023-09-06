Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E8793913
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA01310E5CC;
	Wed,  6 Sep 2023 09:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C369610E5C9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:40 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866KYCP026978; Wed, 6 Sep 2023 10:56:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=XnYAicxIgdljRhTsKb8exOLwGLGMEwFmvdyJqg+9Ucg=; b=db8
 5n1tkugojQktiRXwyrCwesD/sR4J5Ye9R8UUuRccHNY4AvDcRhN60RjjWzKr+oPy
 zhSHuI4+wQO76Q20iSCn7wiEkR4a+UDeBdUkC3KE2qJbNL0jsmTbRESb7+HcCM5y
 d7Pr1PzacrD9wIijnOyL3u/q1dLiqnR4jZ4WRxf6gobaUmyYwPd/l3zH1PPlRpRH
 L+YUeqi/BIFRY4aQWn0gAFvydzO3W3Hm3n9fETFGSPrmPTseki49WQ/A/uoI81MV
 cILg4jcVimClTxfZ/mvatHWHJu5lTzTH/HqHRVjp9tgFp2dce8ePh2Zq53a7n+1R
 ytTsBvajEfMrWN5F+NQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3suwpqu26a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:23 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:22 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:22 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY3dXZ1pWQCSm1he3qjQEur2+a1VR7tV7EUjukIFLeqY5cN30ZOgG9QZ2Mq4bkJB/c86MkpD9ojbfJ7K9h2hI4y194UJtiYep2U0i6MwXBiPDht2P+86wvmkFQHrDMsXIvj8ShNvFQi2fCFldn/gm83JywgFQFry+IDcrFkgHcd6kaBK/f8zC9Z7Bc+5R8M58FUk9lW9Q7QYqSOMDylFZIT2+vvUp5OBM/mcC/+LpBGJIzrQipjXHVelgwp+LKsViVb0Aikjt9QVcm7tgx+ro5rKtMsFjWT94UKn82bK7VVPf8P4GC+v0YcUVAvKbIYn5bZw7PB2QcdaXhW8fp+XFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnYAicxIgdljRhTsKb8exOLwGLGMEwFmvdyJqg+9Ucg=;
 b=iQ1Nx0LGKHdbw/9wq3XQyFv45c0TDT3tIdfiKjt0kFKALXwtXEupC/oiTXQv3yCwaqZ6RzuIdLWwbUYdVRM/LOmHUzAP8FRt8AyLdGuDA64nCbQz/4uPQkcmmTkl7RhABDFT1epV3A6PGF9Vj1z5/oQOVuurATjmK+4YLs7tVG0qEiziLuiO+/A0dN9+ePrr2S/GoCaURgBZ9VUl6DTdwvt/bLbwi0OGNkWU4UETZBoYdkqtVDpFc/F6g2MEgeGdZvGzEBWM8XTxzCNfQQRW5UpTfSdA76GRbZwA0AQZxolY5MGY1OjfmD0TMa8MunrnoClqG6WNTXYk9PwbptQt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnYAicxIgdljRhTsKb8exOLwGLGMEwFmvdyJqg+9Ucg=;
 b=mJ8dIPwQrTOklRExAedtHoOY6tziqSjZoN0qbqQG/q24o5T21yKt3a6T/GgujEbLGDPf812ej9V1AjwK2VllEnAe8qcBW4jJnC7CJyQwCN9IsmZ0/Ahc1hjATvL9Y2Ncr84OF9OYV3eFTHDGA2uEp0bMqy/CJLw9C10Ue/dnQns=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:15 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:15 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 12/20] drm/imagination: Implement power management
Date: Wed,  6 Sep 2023 10:55:34 +0100
Message-Id: <20230906095542.3280699-13-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e867e43-db4d-4fa5-2d7a-08dbaebf8202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBZXupAPvGBCIkhSOPp65lf50IEdzLDV4QSWXGeKNJW/XWaZDW6y3A2Q8zmYIwUfTnRRCFD2vD8zEBkRZSttBkTPCLaFF2Fk7EBuKK3Qjq9BqDYCxEyrqvZzFA1VUe1XjYfQeekENT4SSnPPX5bxLVSVOvsvZ+uSFeQSVA0R3EKhQcbSL2x30fewk/VYJj7S+CXmwSpg84Hwjtmy3LnJSWr9Xem23buf35kwN5M8cYCv7jQ/2qP0Lwe0iQcZkFMWEvHF/TYZP7VDjJdLUxrlyjqQlrljLIUywGr+hyenN4EO+vUM6rsy0+E/lUrbWGIWj4yY0L6KpelQrCXQpG3uIHEMHAu5brmK5hXZoL8H7Pfvdm9Mw8K9Ap5ZHqIvxohqNW6+7Ksw58EF6ekFVCj2cQfUNUb/lQsxSrCaFzCRGuZ+or+FcG7+4Th46lfyfJEfFA3Yq4CI4jdoVaORiYfZdTQFqN0BQHxBIFNs7zwQ/W7QEm3SioMOXaJqzFWFZXoNk2ED2lA67Fpme8bfANc6yRzvl7YTYXGFqySIqx3/MQk7LCnpxz1m7Gm6Fyaomspwigh0D5IrZkzdRx3ki/1mbGpGsYq/17sUGXsl+0WRKLWBilGaTin5IcJaWfgZS6rR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(30864003)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNuIFfPknXDMs6EEfdi5A2JMU/V1K6Lpj50E2zngu2/QdViWsBdkJQcv/D/f?=
 =?us-ascii?Q?tNgVSOjrDLYK/QIe2WlKZDoygYDzTL1sA5HMOsuHz+3MEnLWXaNsXHBWPUcn?=
 =?us-ascii?Q?TmVUB9x6wwtF4lTUXDJg9Mv5W2wK5ziKMCfU0ZnlKF52KjEoQTt4UqGZlRjc?=
 =?us-ascii?Q?9xi9u+MWBFyu5EkfwAc2bGK8fEEYc0a+qVdfMazYvsaSXu1KT0JR4HcJg4ix?=
 =?us-ascii?Q?6yHgs7W1RhdrxAW0+6lUe2yHrdMV25/jyuTgv4Dqx9oF9X+LDWYG+Q0/7BJz?=
 =?us-ascii?Q?puTTFAkYyB5WWuzzzH8Nd8C657snYrFodPikS0W94lTsoQRYDUAjVtCTxu7i?=
 =?us-ascii?Q?RdvuLArXVFHGW6tPXDeBywdB/OtGNiRkh1M0piQ2q1+bUakQgDHLZjXseLih?=
 =?us-ascii?Q?qOWaGKwgVC4mAI504eqbnDnUh4RwiPuPGRmk2y72554k0FJnhbU8cj8YKMim?=
 =?us-ascii?Q?6yGhPtvxVramRe1NL49MnbuNmtALU8MPXQP2A5j14NzIGDcfaG0bPFVvnUjo?=
 =?us-ascii?Q?UYEU8y2lcw4zzQBj6rrc8XyG01qesU0cvsN6qiNVZhuKDFvNQq3+YVefGbIn?=
 =?us-ascii?Q?T3zVjvH9qoUNlsJgNybKbiUhe93LdtDiv4OaAwYmmhdzmv9iGPgViL5OBuLh?=
 =?us-ascii?Q?3yi28l52G84gZnVibHlefnX85QJLvAgf7nUca4EPpccGvQtQiPqdNJVm5zzI?=
 =?us-ascii?Q?JqZiKJFYhnwvLUbMOMvmLJBeAhU0jh1beYPMQcNEFnf0GbHe5AHplHD9izuN?=
 =?us-ascii?Q?v7nad4ZsaUR1tlUnVtajyoSK3cC9GfcQnYx98Mivk0/QMrSFSDkgs/STa6qU?=
 =?us-ascii?Q?GuFsJZW7ss8bVyeOEaqPwSeOlXqDTu7LIpjKfHEt1HRGHQ8n3WlfKmwJnU3R?=
 =?us-ascii?Q?eySd3XdM1FQr5NUjYADqE2bztdtEysYbVq+87TubacntPXUptO7yT/Vo5Gox?=
 =?us-ascii?Q?Uwzbj9UlYm5C2uvvLurfhP9wsyLhz7SOGwI22yh0FvtvWjam7QFvfNS+UWj2?=
 =?us-ascii?Q?7He8HZrSr9QK+306TAB9MlfRVWdqcbP6dVawAOG5VVRtlDq5g3iHng8eVUIp?=
 =?us-ascii?Q?fpAoKs6U8Us4s+bzsR9NqXDmlmlYx4IDS5KH9ELAKK3KkYwO2PivsGOUq8Wy?=
 =?us-ascii?Q?rFSxM5Z4fU8moNQsrNJrbHZ8FsbKy/aQQVWnMTBrqmZdlLUshXfN40GCQyhc?=
 =?us-ascii?Q?kKOHZfHcIigerqo58xs2ALn8oDRPZzRoKgXV6qdpJ0qqKDYT7tH8kyPqAxma?=
 =?us-ascii?Q?5jnfEJGQz7HJzfJjaWpV6MydHpXvTFu5yUeAPvc2rCvjJ8AHHiNprgljv/m1?=
 =?us-ascii?Q?ugsRt6qqI51/wDCyJIgrsIhDAgUZ45UThHYOQyI6ixHRziQgXSv7sCMUWAiz?=
 =?us-ascii?Q?ZQzV/x5VX5IgC4cesnevuvouApz75RSDyANn/r0ojvW6MKMo36fhya3/lpU0?=
 =?us-ascii?Q?xo9M7RhyLH3AWTdEdpPhGz38hnq51sg9QSqD189NJcu0az6ct/2FTklyCB5K?=
 =?us-ascii?Q?j4fO6UN3qFwsMMfviAv3w3h/t2JJsmBpykSrbXkStcRO9Os8vZ9CktQO9m3B?=
 =?us-ascii?Q?MD6Zw0Noapu7n7HrK5pIzK1OMf8YuA+1LGdQfb4wLvZwYbJZDk4UGdNQQYDL?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e867e43-db4d-4fa5-2d7a-08dbaebf8202
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:14.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgTJwLjH5kwrjz/YjM6JHEJWwz+4Burc7Jzl+mP0UP+3lypJ/gjInjY9hqRgVgVrZKGx9/H3/EP4ehqrY494cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: YNXsogxZSzj3XmxoPv8RduF3quR8tNBc
X-Proofpoint-GUID: YNXsogxZSzj3XmxoPv8RduF3quR8tNBc
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
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Changes since v5:
- Use RUNTIME_PM_OPS() to declare PM callbacks
- Add Kconfig dependency on CONFIG_PM

Changes since v4:
- Suspend runtime PM before unplugging device on rmmod

Changes since v3:
- Don't power device when calling pvr_device_gpu_fini()
- Documentation for pvr_dev->lost has been improved
- pvr_power_init() renamed to pvr_watchdog_init()
- Use drm_dev_{enter,exit}

Changes since v2:
- Use runtime PM
- Implement watchdog

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Kconfig      |   1 +
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  23 +-
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  20 +-
 drivers/gpu/drm/imagination/pvr_mmu.c    |   6 +-
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 8 files changed, 378 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index e9aaa5313485..47c294b431b6 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -5,6 +5,7 @@ config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
 	depends on ARM64
 	depends on DRM
+	depends on PM
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
 	select FW_LOADER
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 8fcabc1bea36..235e2d329e29 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -10,6 +10,7 @@ powervr-y := \
 	pvr_fw.o \
 	pvr_gem.o \
 	pvr_mmu.o \
+	pvr_power.o \
 	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index ef8f7a2ff1a9..5dbd05f21238 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -5,6 +5,7 @@
 #include "pvr_device_info.h"
 
 #include "pvr_fw.h"
+#include "pvr_power.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_vm.h"
 
@@ -357,6 +358,8 @@ pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 int
 pvr_device_init(struct pvr_device *pvr_dev)
 {
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct device *dev = drm_dev->dev;
 	int err;
 
 	/* Enable and initialize clocks required for the device to operate. */
@@ -364,13 +367,29 @@ pvr_device_init(struct pvr_device *pvr_dev)
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
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 350e894a2939..f7eb14942195 100644
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
index 4b0c52118735..cfd4cea5a69c 100644
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
@@ -1277,9 +1278,16 @@ pvr_probe(struct platform_device *plat_dev)
 
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
@@ -1290,6 +1298,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1299,8 +1310,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pm_runtime_suspend(drm_dev->dev);
 	drm_dev_unplug(drm_dev);
 	pvr_device_fini(pvr_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1311,11 +1324,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops pvr_pm_ops = {
+	RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
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
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 895e206fe555..34a290136f74 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -61,8 +61,10 @@
  * pvr_mmu_flush() - Request flush of all MMU caches.
  * @pvr_dev: Target PowerVR device.
  *
- * This function must be called following any possible change to the MMU page
- * tables.
+ * This function must be called following any possible change to the MMU page tables.
+ *
+ * As a failure to flush the MMU caches could risk memory corruption, if the flush fails (implying
+ * the firmware is not responding) then the GPU device is marked as lost.
  *
  * Returns:
  *  * 0 on success, or
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..a494fed92e81
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
index 000000000000..439f08d13655
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
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
2.42.0

