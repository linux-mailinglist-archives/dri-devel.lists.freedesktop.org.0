Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA207F4C84
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B01810E690;
	Wed, 22 Nov 2023 16:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D5610E696
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:35:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AM7nIFd030359; Wed, 22 Nov 2023 16:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=nb3bB0GBBq2k+t711y9wbdFIHseSOdel5Z5NkhEN6bg=; b=vJv
 gX8XLBLWWcrFkUexFBabFMNNjzF75H4HasnIZwmL0d7DXGi5G+iGi+okSiwUpOKh
 sjDzVhrH0MC3MbWsmUfFJsJWwWwG7qqgT8A2aUKBY89zU7lp0lP7qC0X+pPwOsWU
 NRhrOYspJsjatSK4B/qDAHwbC4mttBG2KTH/NYdBqHfIREfSwgCbR2F6geibfnlO
 0ka8NCrhwAmZz8uK6IpZzxSPqMvpohK0Sy8sNDceesMqg3FA+Bci+0PbBWb91aur
 vCsEqaBLQVTV47HEWaBDpunbKyceU082kPEgvn0pQbMn87BJAaJclH+tzK45vCDN
 adacA6u557qwTnFzULg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99g9m29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:28 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:27 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARH1ErKeRfVdBZK7mnRaIFm2amJ8yfwLA2MhWJ65LTm/L72vMJc9iS+4SNjvaLfXHejprvu+/fEfAX1AZSCj9sBXqDKnkizbm2vlRa5I/5liSq2sqFn9Pihcma1VXmEitgNk5CkkPlCvxgdlpml7J8yVo5WjArP/i4rPA8aTCUsnc/hIyjowGYEIWXGbo5hpme4TfG9JBOZDQKVnMdNEUjmIHX15EjSH2qAGiCEHi+YYzuDgPd+6Fghv4xyqRf8HM7NXTnCpbCYU+qbJYpJE6CSNJOysA19XMBb7TRkWACg+/EylhoZJqLJmnKg6A3hDG86ZF95ptrsYqaLNXf6QGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nb3bB0GBBq2k+t711y9wbdFIHseSOdel5Z5NkhEN6bg=;
 b=EJ0SDN7Gk8gHjWtl/+tdeAOrqbLKq9GMQNCWvuQUv+U2dWiXKZTpREJ0FGOQVrZL5YKUrpaJAxHMtcvVxZdL07L5XgYBzvAo60kl+h5esXZPCfC7fFWuK6NFD+X87eIiROmV30rlmo5y1by0mQEKuhaDU1yA7k40MYcs+iHnr6+JX3m0sFSYSl7kjiPeSmdW3bHue833tykR8Ym5Nt942z26Qz/ra7IUZ6x5j5se81FnVCfW+FyZEtfWZ9D/ps51Hxj26/njZ+VEFF7M+sd5k4Ew0PiuRuRU2ZMwxOy1tX6sP0Vb4ovNfyVdwABq2+DOYqzQsGnV8qsJSHgaFEw/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb3bB0GBBq2k+t711y9wbdFIHseSOdel5Z5NkhEN6bg=;
 b=FOOIHI77JlFqdOvzA/dbj0GyXxvjb+l7T+hA6lD/Nqpom0ZQJFmYotZvv+lK48syWX7Wi41dRUVi27AEHPXGrOlqGJPSgL+lY/RWEVk8SaRWbatygq6oS/UXs6q5v9PyQoHf35en4rawh9NKbyzkD98Q7Ez3WNr1ukRYdrBsXbQ=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB6459.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 16:35:21 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:21 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 12/20] drm/imagination: Implement power management
Date: Wed, 22 Nov 2023 16:34:33 +0000
Message-Id: <e09af4ef1ff514e1d6d7f97c7c5032c643c56f9c.1700668843.git.donald.robson@imgtec.com>
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
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 254bb5aa-3cf4-4211-a50f-08dbeb7904fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUzSGJde2Az2qR8qq84JfEFYPtH1sXqrvFwzDvm+efGX5w6ry3l2iY5CE7mXUDgWNUSJaYRB3IyzU9gFCTMaCz5yo3vvMcnKlBmlqPSRnzJIzvXVraWCOIUYKHZU95QGWCeol1/dNFGbt+ugJNtzJkITRCwdd6RVUQ9zOzPHaiYJAvhQgXX6UjGeYYfZJKXxgsUCVRkBYlr3MPpY+Vgjj5BmH2r4u+ysOHRtyCAt5DUykYpGp7ZU1VROYD+sOxKOmoJZalyTOeUq8fyICGM1YRDR3WtzDPL8qufmTtL4W93RqpGRert9DUwFWfew1b3US/1r8cdKkuEnAdPe/FYooebR2Tl1IZOEYu78hXAmIKDa9FNrdQUv4g5bnKUlws8PesOXUAItoReBB9/OxuXf/qaaGC7xkf/OoQyXFV3zi0HWiGJTYowirRo5ycGQVEItVM8eIn3I9Dmgf8Rgebym3bovD3yJHH9S0Mpa8Zpr4MkC5Cw7xD2hxGjDHXBYt1KXxKew9JGxi94rdBntEMpQnb+XCFFCFKNjvRJorpf+G9ZWgfFCfW7jFCN4N6/RgOnceHa14f+9dNHUlzNTvT03lv+n+dDyVNS1u5R4piD9Gg8/02jFtD5GFeXlUGocMOQq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(30864003)(36756003)(7416002)(41300700001)(5660300002)(2906002)(86362001)(38350700005)(26005)(6666004)(478600001)(6506007)(2616005)(6486002)(107886003)(6512007)(52116002)(8936002)(8676002)(4326008)(44832011)(66946007)(316002)(6916009)(66556008)(66476007)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+LxNMyJ/LdgnaapV/GpnvmyvrodBtP8NnLwF2DB7H2x6LQw0xxXKi9nfON2?=
 =?us-ascii?Q?1Zpl9lHF7Ud4e4h8lRlU/lB27eyMDvE1OxBsZgterERDH3w0dGcWzIDuDBTk?=
 =?us-ascii?Q?5zYzcW9WK5bjRrmWbWoROPFhc1JtxpcohzAtYB4XG22rKejwxOdGzq5pXTp9?=
 =?us-ascii?Q?JG2/e44raN7OTUJb5W34zCQ4BF35v7tTQ58V3GCsKoXAd2rGqDGzN1glpDRX?=
 =?us-ascii?Q?kZA9C6WfV9DSSpnHxZRvz7trBs7RtOLF8yoa/uBPIvs9S4plM//Qi6NPTEfE?=
 =?us-ascii?Q?R5nYgEb/e+i9hBt86JpWy7KDBsxE4pE4C4KezKaOlgnwp9IkS0mLbmFuVjcd?=
 =?us-ascii?Q?NTJEUjaNDeG+Qzx6KCe0tizcZQ2779nX+3aAG7JnXduYjdKrKj/kH39NFlTR?=
 =?us-ascii?Q?Ugtf/43O8BsC26jFvnRr/BInCLXI1Q7O5OTzWqlV+j82nibGZevYtuerKEnD?=
 =?us-ascii?Q?sp8Aw4LIcbxapHLvU0KzMPnjInsp2ZZmT4YT9Y1slar4O71iLCvXws2Hdxtz?=
 =?us-ascii?Q?+BwqDRAPKc4O0b1dK8/LIv7WcToAG3okIUaJfnj7IPHuGnPhJwvn85Gl+2yB?=
 =?us-ascii?Q?WNrg4ogbtlPGkwOlprnXv37fUJkqLKXxER4o9F40q+ce4xyPH8fvYdRHM30r?=
 =?us-ascii?Q?RRjWUpAfKUQ5gDULnnLgV7WScKyLkb0/Lb4d4QoQBQ8WB9zTin+zSg0rj52Y?=
 =?us-ascii?Q?O7Ef+cMmarwsnCmrXSVmREP9rXpEUy1/jYX1qdLcFMHDE7hKjBq7LOw7XwqO?=
 =?us-ascii?Q?pQyQwjVkIaWrhkUhRPPtNzz4v2SGLD1Yw/8hl3EekFuPmgS6uMtLZ1wU1Hw1?=
 =?us-ascii?Q?eZXtllw1Y1mM1SREm2CZsDkT6rCuF0OcoFoVmI3YPBJlyQraNb8XgEsLG40k?=
 =?us-ascii?Q?wFOWVXF7fkCZH+hz4yQYVCslq205rMFt5obeXf9AhRw0apaVCQvECReFp262?=
 =?us-ascii?Q?iazXQwJCcoWxyEojemW1PGM0GjLazZ4rnaKSXZgIJZQR5eAIe8Vknd4UIoEt?=
 =?us-ascii?Q?heA8XSwOyneLO4/yEi17x+IOys5aQdHfohQOX/bIY4tz0jjEYP6hvGqfKBfp?=
 =?us-ascii?Q?ME6SRw2Iyzxnr3eq31M4beyG8SazX0u/q4Xqg4+m1baI56MOdPqPFK/ewlk1?=
 =?us-ascii?Q?kxYFVgt0PLwSRBAaDpeN2fDEL/kxxUOc/EGqSUOmzUIKfogvzg3N2P5S46q0?=
 =?us-ascii?Q?jHaA9ncO9VSmjrK/5OeBANboRHhFJ8Qb2teunVJE61HVYKvHuOVsIHlmNOiF?=
 =?us-ascii?Q?kKcPFCifJHv/PVsUqFsOscMZYgZw1GQlO07DWg0l6c0MPneEDkdTDIDeDi4B?=
 =?us-ascii?Q?4zJhTt4MwYBv/5rX17mYLck8LnKWOGT4Q1N9iSZOrjK9xJmLuRj2ETSy2F+B?=
 =?us-ascii?Q?QGEq6loIROOa59i3GZi8GMrNq0LOWsoRIL9ydHVyMD0j/ZEcHI+OZVlpaW5X?=
 =?us-ascii?Q?rLDMHpYCRr76+3MOPitsX4/CTHSt/OXBju1XGUNuU2tfhnmyEwzTD2vFcqFq?=
 =?us-ascii?Q?D+iDIV4Deojy7oF8xHpdkMM7h09jQkcziSqiP+G6k32ldzwan0Ak+McltJlF?=
 =?us-ascii?Q?rKNv2J099myL9R7Wa8n6I6189XZ6mTk3UZ4CLEyl98GTy4zHJoxTPoQBi53Q?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 254bb5aa-3cf4-4211-a50f-08dbeb7904fc
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:21.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZnUXmnR6Mi4Dt+u+oUtGDOviOcRFDMXy55I8VOgPA9v23Jh5rsaSCj/sY0/WAvHGm0mMZktOO4LheiH/AVSw4ghME8yg7x2qLGlZUceHLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6459
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: eeWb9vj-U3KAmQQ85izXVAo9-t7LEifx
X-Proofpoint-GUID: eeWb9vj-U3KAmQQ85izXVAo9-t7LEifx
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

Add power management to the driver, using runtime pm. The power off
sequence depends on firmware commands which are not implemented in this
patch.

Changes since v8:
- Corrected license identifiers

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
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/imagination/Kconfig      |   1 +
 drivers/gpu/drm/imagination/Makefile     |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  23 +-
 drivers/gpu/drm/imagination/pvr_device.h |  22 ++
 drivers/gpu/drm/imagination/pvr_drv.c    |  20 +-
 drivers/gpu/drm/imagination/pvr_power.c  | 271 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_power.h  |  39 ++++
 7 files changed, 374 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 6f82edf89144..0abd1b9bf3be 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -5,6 +5,7 @@ config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
 	depends on ARM64
 	depends on DRM
+	depends on PM
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
 	select DRM_GPUVM
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 678c3dbb4326..d9e00a0db6b2 100644
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
index 201ae780494f..e16282325178 100644
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
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index bfc853ffd58f..771ba879f02d 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -141,6 +141,28 @@ struct pvr_device {
 	 * before submitting the next job.
 	 */
 	atomic_t mmu_flush_cache_flags;
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
index 6d3bc886e1c3..12e136217c45 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -5,6 +5,7 @@
 #include "pvr_drv.h"
 #include "pvr_gem.h"
 #include "pvr_mmu.h"
+#include "pvr_power.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
@@ -1265,9 +1266,16 @@ pvr_probe(struct platform_device *plat_dev)
 
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
@@ -1278,6 +1286,9 @@ pvr_probe(struct platform_device *plat_dev)
 err_device_fini:
 	pvr_device_fini(pvr_dev);
 
+err_watchdog_fini:
+	pvr_watchdog_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1287,8 +1298,10 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	pm_runtime_suspend(drm_dev->dev);
 	pvr_device_fini(pvr_dev);
 	drm_dev_unplug(drm_dev);
+	pvr_watchdog_fini(pvr_dev);
 
 	return 0;
 }
@@ -1299,11 +1312,16 @@ static const struct of_device_id dt_match[] = {
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
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
new file mode 100644
index 000000000000..88f14a4d31ab
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
index 000000000000..360980f454d7
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
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
2.25.1

