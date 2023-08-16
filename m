Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C977DC1F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A510E2A1;
	Wed, 16 Aug 2023 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132410E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G702Uo029544; Wed, 16 Aug 2023 09:25:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=8tBXdB51QRhPsNsl5uClF
 AJbE1YEMjH8Z8KGyrivlG8=; b=N7BYqEBHRNulY7DGXI/U6eTSS85VKL7lmBo67
 q6pr/XkElfNkDdQG8K/HUxiuiI0fiL79jPkygHRm7ZyzKKkyYuLXZMyi8qjak7Pz
 KnmOLc2nFcMAh8AaxgCPchcE1slevU9Tr+8WCMbS88NSae7d59Xd62VXS8sXlNhD
 qBFzA5y3RzGOImSEKrJ2q28awcjqlY0t6eZagaL+WP/XW1jbp7bGKVUYYNmGwoI2
 FIa68HcmVcwvbFQB8GYVWzVA4Wx6Ovoktwydu2uGsAUmRFrFWiusmC52FRit8j1o
 2HGjP4skAYrcX6D9isvaCudEmXUacraDZvgkooSw0IjyMNNew==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brawkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:25:53 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:25:52 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.112)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:25:52 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2WHbCTgQ+QeO5hwP1IrfbaQYdemdduFIi77D5Xb8c+vtTxzehAlU+ie6T9ON3DtfD9bcfr9sF+kpGbjXUOBZfh/x+i4wmSqTBUIvGYOXlBGzJOzefPQTajwYEI3iSqE1w0jH+F7dhSZqcCQz+jGGF7DQf0FsX1Y7eNpkLGHL6d9tyblCjKcEUuvEpw6dTwethtSjq72cKBUhvzxLiLQJ6pRrx+4/wyI0AyaILl02DdP0mGxTZw+22Y6F5CltNupAPNjLZi7LWQUVJe/VouyR74j3GN9a0A+RpZhK5hyfRrja2ICsexnOqbfmvhd/tGirNBGyHQf8QYBB+m42pxqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tBXdB51QRhPsNsl5uClFAJbE1YEMjH8Z8KGyrivlG8=;
 b=QM6JCgqkGhhFOzXJBQH5fjoobMg6agsyslhN/cp5EC6mgvSghUjY76F0L26ir5VD46cZstZ/8WgqBfuUHeIhJac2R72vrqCwAp66CUZ49wpMZ9UiAn/UGnwmfUvXVvByQi2HoCd/H4aQ7HjcB22pIJyF2tDRHGAX8MeL6eNuz0RJb2/MpTqgY/sQcOra9eXjWdftYLOHWIKPxdLO2Os5hIrU7jfFh3grc7XsvAYkiO1hwfmZGriwWK1fqv4fmocghCmAtrldSUGbah4OgsVWPVNJXTMKa1ZoVYajOU2VE9MCdXpUsgD+rNrPf/owAzQvyPrAzISbQhf49mdid760pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tBXdB51QRhPsNsl5uClFAJbE1YEMjH8Z8KGyrivlG8=;
 b=RsQRipeUCEDL/rAt3lGI4+02obg1xFhnvAJ3uOQ0dgfgYn0zIKEIcNtFANzITXMZ01Xxys5YBZKX9+q0k4ibouB74ZZw9Ky+nkWSJ+eC8bUtXgaOkA8HOxwgrxXmoLRb6Xdftl3g00iDQxtT+aYjCm9h+7RKmZGxHjSjbmQe+hs=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2546.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:25:50 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:25:50 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 00/17] Imagination Technologies PowerVR DRM driver
Date: Wed, 16 Aug 2023 09:25:14 +0100
Message-Id: <20230816082531.164695-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2546:EE_
X-MS-Office365-Filtering-Correlation-Id: 5601d63e-6abe-4413-f350-08db9e32665a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+X5WTx/AvA1Qlp4TpNnKxIcDoPULqC7JUQN/pYl+Z8YtXbwIiizVTBW9BN7WQYKuQOViEOowoU9w/g4jkxQ/COsfefPb0DHJTjJzHz4o6PE29C9X9Tc/xAeSp7+CpRaDdiO0aAub4hlqgn11YenPG8hMXRuVMeoUWbC2BE2benkIy7pgzuY1m1cCA4++WUPFgyGkOzUvfoeVdPlZU3q1HhdJ7u/QcaDvc0cQGnSV7aWs2zyjSkJRBI+MKQhjjPdCb6N8wfFoJvs4DDyAWJQvPymBynK18VuFN9UsufJAuGqktAY7UoBgmWNSHJ/BHTAmJhtjQm6DfLm3Eh4H2pzCuZ4SuxLbhNgtMtsZ16Zv6CgaWBc/DJgI+fk8x+ptjNozWVluxc5FMny/bXnSDjj4I4Khsnh9OQp706sf46KaZmAkV2Z7hcQT1htgosysdsRbMcP+qNaUzjJBH7zHJPaaNnD76zUQyD7Y7AYIUjc8QFdBLrfaI3/7CoDg3xnsKAASmNBeBIiiHPeTNOJ14P/kpgy2LBFNlip85Tr5xr4yWkVPdHFxnTJdWZ2gbZr+Hc65b6qfrn0Hk8lQhVBm1rQb6Pc15OLnQ0HfwjWVAdQpA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(966005)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gimts/dFI/yiQzNRS69fCHCXLZz0XLO4r5aQzylUtypZuD2J4CdIZ3QGYkoK?=
 =?us-ascii?Q?EHr4kU2Tbd/R8+8nbdIC3VXChl1MC6ejvHhh9/6aFBHPgge0OuXuHBMFn0IF?=
 =?us-ascii?Q?Gqm7X6P3glKXGVYWmC5zXY6V28mnZcdXjTTLWnMtULmlOY1uewU3OI8DkIeq?=
 =?us-ascii?Q?nxwGBrv90jffkiY8K4mhlqoEoEF6KMhy/knKl988/vsRA02HskgQfoQcdpXK?=
 =?us-ascii?Q?3s7Er3It5jN3hF5XbZQZ0bQ3KiOPZaeq26XoT2DVnjeoMH6ZrLDiCYqce2vR?=
 =?us-ascii?Q?2iEvUF/gcwVwyOO34u+lwJLM7tfquD3QYzcRfWzJPY+hlz3yUOMQQwX94pVa?=
 =?us-ascii?Q?sgAfMPUKBiqq6pdscvlaUaFxcEd+Umr+aM5xTE+C4rQlmSGNq7TldBvf8LhT?=
 =?us-ascii?Q?jpZYYrcSRITnUGffbumQYkSOHjRBWOaEAmkdymx2pysMhmNg/S7lVtVdq2Im?=
 =?us-ascii?Q?soqUX8qAhaH002pdjlDxP+pFgmNm5cGUM+dYjXdzJKbITNr1mAeJ8eBIxHkx?=
 =?us-ascii?Q?V5xo+DVPZyvWuuMWwq0pjARF8kcMq0QUE5FgyTN/xlY3Y1vUgXNlY+Zml3tl?=
 =?us-ascii?Q?+QBKGqarI25fT12v3kxiuB7qujrwBvUgyZJY2XFcBamjjd/HlUT91n1uW89Z?=
 =?us-ascii?Q?1ZgF5BJFJovxC+pwk0Jnkn7Hlwzj6uHlgeYPT1iltdqnQL8+rD77UgsHU2FJ?=
 =?us-ascii?Q?3X7SnwFNSMFfvXLk7V/l9jQcTSn/OG6btS56xjKQnejxM7p2CQhVVhCLNj7C?=
 =?us-ascii?Q?6oHnbfbBjTaptQY/V6JdcNFN8u2e2amoLM8c6X3aR873L01elKCEXcLbgN+2?=
 =?us-ascii?Q?4kxhxcPRzulVASDZf66hYq/A0yH64VHM0QEcuYpACFA31pCqvWo6gMD6ymyj?=
 =?us-ascii?Q?hsS1v7VkAYk1iIm50fHbAad6D9MH99adQ2n1fHOZT223sSX6/8uxBKz9L7bG?=
 =?us-ascii?Q?+oGKKcBAwjDgKWdflo0F/SqbNmZZ/DpL+IkONldRDg8lLeGxsfzCfS3JnBTg?=
 =?us-ascii?Q?j5Vklx4eQNLp80HOrmouKryUHSxlwqUoCgWcLf2hLCr1oUDA+w79kbkg2Lua?=
 =?us-ascii?Q?H99UROCBs+A1RI560ZWMF4RHpRTsXkgrIX1JF81SjJjUh18SO0vSwCAJSr4I?=
 =?us-ascii?Q?O8CvsRo2HHWG5DPQhZZPFBwuwqzHapRU7ORN3USwgOsKSOMNNjVsq+pDgO0j?=
 =?us-ascii?Q?PTANr6XHAgZC9otJBbwpX6N4dkHoQftpZ2mlY4AonmgJeZHttS+RA+AMYNn4?=
 =?us-ascii?Q?eTDdRWGrB2bvxl5yeK0qd8E/ezX2RjJqmH7+uX5iVVjqoKF4Db43M15YlSCb?=
 =?us-ascii?Q?umu5pn1hjU3qlnwdzz3smqUpCsQN/9xavvNkFoaq4Q3O0BSrMTbtmcivk4Fu?=
 =?us-ascii?Q?uzmf8Hg9G4z4wYSZ81K0yPD+aubICQQRNLrlGzaGbPzAdoH71NqKrUu4bXfZ?=
 =?us-ascii?Q?bxs2PbMsZRfdRjlKatNNGjGbXFV8JsMU/nYpCKE1KslimVDvivoOdxutbcrd?=
 =?us-ascii?Q?3uCB7vSf07CoesyVdTZ3gLRf88iQFHKVmqJ2MeQITeivXZWdK5cM1/GAsICI?=
 =?us-ascii?Q?zQIC0jmeMlXL0ddC2fDZGkHN9qTi/jyXkeJq8CkKVlNajonCLn52+Pcq3goX?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5601d63e-6abe-4413-f350-08db9e32665a
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:25:50.7082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI0jEnbUE/8EX4AoylMh4tV8+fjgc6mhEDlgK245hQx/pk2KEHDyGvuhqdIBaYvDdh/rpzaHz8fiZm5gtFLesw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2546
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: v9A2MjcdLS-_wlz1RRu5V-IcIAkwQJxC
X-Proofpoint-GUID: v9A2MjcdLS-_wlz1RRu5V-IcIAkwQJxC
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

This patch series adds the initial DRM driver for Imagination Technologies PowerVR
GPUs, starting with those based on our Rogue architecture. It's worth pointing
out that this is a new driver, written from the ground up, rather than a
refactored version of our existing downstream driver (pvrsrvkm).

This new DRM driver supports:
- GEM shmem allocations
- dma-buf / PRIME
- Per-context userspace managed virtual address space
- DRM sync objects (binary and timeline)
- Power management suspend / resume
- GPU job submission (geometry, fragment, compute, transfer)
- META firmware processor
- MIPS firmware processor
- GPU hang detection and recovery

Currently our main focus is on the AXE-1-16M GPU. Testing so far has been done
using a TI SK-AM62 board (AXE-1-16M GPU). Firmware for the AXE-1-16M can be
found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

Job stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml

The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
are working towards passing conformance. The current combination of this kernel
driver with the Mesa Vulkan driver (powervr-mesa-next branch) achieves 88.3% conformance.

The code in this patch series, along with some of its history, can also be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

This patch series has dependencies on a number of patches not yet merged. They
are listed below :

drm/sched: Convert drm scheduler to use a work queue rather than kthread:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-2-matthew.brost@intel.com/
drm/sched: Move schedule policy to scheduler / entity:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-3-matthew.brost@intel.com/
drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-4-matthew.brost@intel.com/
drm/sched: Start run wq before TDR in drm_sched_start:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-6-matthew.brost@intel.com/
drm/sched: Submit job before starting TDR:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-7-matthew.brost@intel.com/
drm/sched: Add helper to set TDR timeout:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-8-matthew.brost@intel.com/

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

High level summary of changes:

v5:
* Retrieve GPU device information from firmware image header
* Address issues with DT binding and example DTS
* Update VM code for upstream GPU VA manager
* BOs are always zeroed on allocation
* Update copyright

v4:
* Implemented hang recovery via firmware hard reset
* Add support for partial render jobs
* Move to a threaded IRQ
* Remove unnecessary read/write and clock helpers
* Remove device tree elements not relevant to AXE-1-16M
* Clean up resource acquisition
* Remove unused DT binding attributes

v3:
* Use drm_sched for scheduling
* Use GPU VA manager
* Use runtime PM
* Use drm_gem_shmem
* GPU watchdog and device loss handling
* DT binding changes: remove unused attributes, add additionProperties:false

v2:
* Redesigned and simplified UAPI based on RFC feedback from XDC 2022
* Support for transfer and partial render jobs
* Support for timeline sync objects

RFC v1: https://lore.kernel.org/dri-devel/20220815165156.118212-1-sarah.walker@imgtec.com/

RFC v2: https://lore.kernel.org/dri-devel/20230413103419.293493-1-sarah.walker@imgtec.com/

v3: https://lore.kernel.org/dri-devel/20230613144800.52657-1-sarah.walker@imgtec.com/

v4: https://lore.kernel.org/dri-devel/20230714142355.111382-1-sarah.walker@imgtec.com/

Matt Coster (1):
  sizes.h: Add entries between 32G and 64T

Sarah Walker (16):
  dt-bindings: gpu: Add Imagination Technologies PowerVR GPU
  drm/imagination/uapi: Add PowerVR driver UAPI
  drm/imagination: Add skeleton PowerVR driver
  drm/imagination: Get GPU resources
  drm/imagination: Add GPU register and FWIF headers
  drm/imagination: Add GPU ID parsing and firmware loading
  drm/imagination: Add GEM and VM related code
  drm/imagination: Implement power management
  drm/imagination: Implement firmware infrastructure and META FW support
  drm/imagination: Implement MIPS firmware processor and MMU support
  drm/imagination: Implement free list and HWRT create and destroy
    ioctls
  drm/imagination: Implement context creation/destruction ioctls
  drm/imagination: Implement job submission and scheduling
  drm/imagination: Add firmware trace to debugfs
  drm/imagination: Add driver documentation
  arm64: dts: ti: k3-am62-main: Add GPU device node [DO NOT MERGE]

 .../devicetree/bindings/gpu/img,powervr.yaml  |   75 +
 Documentation/gpu/drivers.rst                 |    2 +
 Documentation/gpu/imagination/index.rst       |   14 +
 Documentation/gpu/imagination/uapi.rst        |  174 +
 .../gpu/imagination/virtual_memory.rst        |  462 ++
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |    9 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   16 +
 drivers/gpu/drm/imagination/Makefile          |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  641 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
 drivers/gpu/drm/imagination/pvr_context.c     |  460 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  651 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  704 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  253 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  185 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1515 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1470 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  508 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  250 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  301 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  515 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  396 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  184 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  770 ++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c         | 2523 +++++++
 drivers/gpu/drm/imagination/pvr_mmu.h         |  108 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  421 ++
 drivers/gpu/drm/imagination/pvr_power.h       |   39 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1455 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  179 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2208 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  371 +
 .../imagination/pvr_rogue_fwif_client_check.h |  133 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../drm/imagination/pvr_rogue_fwif_dev_info.h |  112 +
 .../pvr_rogue_fwif_resetframework.h           |   28 +
 .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   | 1648 +++++
 .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
 .../imagination/pvr_rogue_fwif_shared_check.h |  108 +
 .../drm/imagination/pvr_rogue_fwif_stream.h   |   78 +
 .../drm/imagination/pvr_rogue_heap_config.h   |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
 drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
 .../drm/imagination/pvr_rogue_mips_check.h    |   58 +
 .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c      |  285 +
 drivers/gpu/drm/imagination/pvr_stream.h      |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  351 +
 drivers/gpu/drm/imagination/pvr_stream_defs.h |   16 +
 drivers/gpu/drm/imagination/pvr_sync.c        |  287 +
 drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c          |  906 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   60 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  208 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1303 ++++
 83 files changed, 34567 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 Documentation/gpu/imagination/virtual_memory.rst
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframework.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 include/uapi/drm/pvr_drm.h

-- 
2.41.0

