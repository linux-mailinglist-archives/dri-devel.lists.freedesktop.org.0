Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E87F4C7C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8F310E682;
	Wed, 22 Nov 2023 16:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B6310E682
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:35:24 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AMBfR9n019789; Wed, 22 Nov 2023 16:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=NjV17WxtqupB7FqbB6UFj
 XtkJpfdHJiuLo5WkG4qo9E=; b=T2b5CwawoNUJeTn2hvGQoLD7ItO+kluap251c
 PPCW/bkI1G1O7n7QJtxdeXqcldNcccaIOawxbrwU0f/D32HPoOyr8xz4UOfBr7Zh
 eef2XkjgGiV1L1DTR/PqWLb2UDmIYkn8iHltHcGLyVnPzn4AJBerePlgtpOUDuT8
 I3X98VJk6lyxhr4GpN7Jv1Pj1GrnSplcgUMe3XiMlwUcGvbVrgR+RxqSv0jYv2+9
 ha8AQUuzZqFwanLPxu29VK4+4oUxMrSl3Vpco+vmvu1ppU/TxKqkVPcJ2WH+4iZ1
 vqVetL06DmT/o3zBB27S/Wx4oDj0cBlGMcfXmGOPeiBOZrV3w==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99g9m1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:34:53 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:34:51 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW3HvARZsPgDwdHfHEusGjJq3Lt1SXjrrWf5460BGZ4ocXozpuSrxvr2wnSExsdj6ujQKLWU3VvYY3sitHeQOSFGVNOM7YMsZV8XK/+mh3Xs4L81MtXwm9ZCR3KdDA1BS+bRXfKf+d0Oqtt6PEH9qO6u9PhNNTfmO7rMgZ5C4SNUOn9dYV2d981MR2xaPTYhl2Y5eJb/b7KMsx0RLHC8iaKfXXZCoTwlK0aqqrrN4XV9qbbxIAFsG0DPeSJ6U2lFE6lfskQEqCq9DTUvbG7MX9/qmHQNIZ6BM2MtFSJjKjyvBZVOPcx9hWUPNi61O2BPiY+oUItD4ManvOfv0eoZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjV17WxtqupB7FqbB6UFjXtkJpfdHJiuLo5WkG4qo9E=;
 b=TRCUgwLc2sdQ0WjCU0jUoLBhcDOsgFQF53N4/YdkQqK8SmA3Z6DdwuoSh31qGc5WgqE6kR3Pw9h2AB8eM3jc7l3EreEPf8mZipUVGkZnv8akxpVUtV1egLVKH5eIiaW2ttdj0EW3yR8HyJ8DE9ZEtmsiPjlLl7nP1nOTOPvX0JcjRokdwnFDz8M/biC7nrKReqq/GXSTBh+XKSNTXQPD6+fIU2bXe1TOWSM7JB9sW3WVA3f/vHbLxgoah1S0ji37O5h0qsggMF2y6tRPrKxbSMtOaxewBJt+FnUjyFWV8oDGMJsLkVpkL9XoekHHT+URN+3jduX2+yl9WIaQ4xgNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjV17WxtqupB7FqbB6UFjXtkJpfdHJiuLo5WkG4qo9E=;
 b=U284uLBdkL7wxjRMn4EFzlch++lq8Bz1TCin32AyhNKgCixxlg393hSA0+QwWYGrQMXkAynRtb+Wd6wRrSHy+f5J3lwY1mR58oJglbUCzqMGN5TN93RdfzyrywkLlgQyxiJ/8CLi9IqhCzPHhgKVgQzpoK/EAFwRe7APShJDZn0=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO0P265MB6179.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:34:50 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:34:49 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 00/20] Imagination Technologies PowerVR DRM driver
Date: Wed, 22 Nov 2023 16:34:21 +0000
Message-Id: <cover.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO0P265MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0f0341-cd8d-4b2f-ebca-08dbeb78f24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hyn2nUBZf32GIBndBVG9LK3fwqmlpiUeJw0J+psUsXJmT3cSK6m9C/U1ETFJF70yAzgcCRdPOCJ2QNFtTo+aP86G8+agDh8WsVXxlbI94/cXVtVnsQIe6hfux9LsLQ9S2COYKw2z83aAnhtFn6Xrzjj42uZWcbtTdevG6CDFotBZ52CBjpuAXUf2vkDZ0yBJv6Zi4tZNDKcOUb/4WD2+lNee+76VSY0oSYxpWrUjnut1NnSU/3u1Ffh2uJ12ubVHslt6Y9HDDW9zL78uoJ59r0j8RAY8LNExRhgshOQGRAzxLIVoCFho6pa+1YsI1P3yyiSYN39BqNuIYj0Cz7rBZGCfPWx+Nq5Pbce8tzTefUNebGzJNSZwIpo3pF/DND5PvyEJoOiPtYssz1G3SJGzhmA2qbO+3SO/twU6HPt8eh1cn9U6LY5RIrMBgFnivFhCarhHGAcBDCRwcB5/ieL3tbR4cntLUDs0CiDbwEVf6JQ5r61K1Zeg6YZ6SCc0vNmnq0jlVPTAKRt/03d3gQ4wd+ySWU5hOGekjKXgKDeqHCTzlk8yhWmv0pZ79BP+WKRh6mHarKA9F8kexBdqGqGNRJAfw0vbrghuE7mDZqRcFUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(366004)(396003)(376002)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(2906002)(5660300002)(7416002)(30864003)(4326008)(8676002)(8936002)(44832011)(316002)(66946007)(66556008)(66476007)(6916009)(38350700005)(2616005)(26005)(478600001)(6486002)(966005)(6506007)(6512007)(52116002)(6666004)(38100700002)(83380400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6e6AA8BvOUjr05MAoiq+qcVe0zIj/e95hrmb90daAAKCDKq5O6Ju/GysARG?=
 =?us-ascii?Q?Kl1D6rAsg/llLAxLqcwn+Y0tN9X4y5/raD+CoFUr4DzwZroXYaFDuSEg6l8B?=
 =?us-ascii?Q?E/qY48lSm9dMrbKbKLgFgnY5PM6t6P+/HoEUZ93VfLIxWrDEoIkNgz3M6Xbs?=
 =?us-ascii?Q?eFRoD5ee9G7bv9ge4oSc0fHlZn4vG79eLL2SGQqpsl89AEFKHdgR3C7mn3Ix?=
 =?us-ascii?Q?FcG4VJ80qc5Hf4LDFLxgiLUmRX5cfJAvyjQNvjbGa10m9CrXERp8qzf9zqS0?=
 =?us-ascii?Q?w9lA4e1qZwTf6EzIbSoA76bdZAd25BK66g4hmla54wiVQ+TfrOmyvPMXV6hQ?=
 =?us-ascii?Q?NzKTMghCRD6Z5rk4kz1jIp8bQ7rg5wxhWD0YwWkqOL3R+aAr2P03hJ6lNpcj?=
 =?us-ascii?Q?lKwxqyytOGhAD9xn25PH2hxQshICevHbX+N48LTzsnYPcwxh8UlVGP9663ro?=
 =?us-ascii?Q?TzZqw4v2Rp2wz9ZQESexz2xpyIuXxu3BlGQhyWKhbQYmC4OZgZV8MBI2ijU6?=
 =?us-ascii?Q?jTxE11YvTzALR9ijadOvDRN/1RrETxnYZnB++Jfnt4q/GgpmJzDGsqivQwOg?=
 =?us-ascii?Q?+NywQOXFjFN6QgNmuZOv7pfQka2aJfMyoM+Sl7t0+P20E3xG/OS4Xh26uunz?=
 =?us-ascii?Q?WceRaYHPANvRn2Ovsu0+b9/pyMiYOcUPvEvHWElmYS5wrR0RaSvRxZMn+nqV?=
 =?us-ascii?Q?wF1N7ucuplxHv0wX5PAd16zorThpRmzBTwj+rma95ZOwFE3dBRcfxmRYO8nD?=
 =?us-ascii?Q?891OS+VNLwmaUcrFqN0AitnLvtjrxEiZd2I67XBhLpdBDl89ubXG+yiR8vFd?=
 =?us-ascii?Q?2erbVWQlozZygIAdQiTh9leKsAQCHypEx/EO06wttwIxoGxKVzpTCXxFLLPP?=
 =?us-ascii?Q?Vg7KkSwt0ovk7uT1byunkK20qOXSGjeE2F1h+yF8Sll/f3FUESk615wdDCs4?=
 =?us-ascii?Q?/Vw5yKlroBbicSxfDEG0L7mkCtYRTlJMY6H9rcdq5IaT09xwAO+xfI+Xgcsk?=
 =?us-ascii?Q?l4YD6EQQsLAYSkMxmxbNRuHk1S27ShSb+asZiPsmkrWYCYbdb0kDDVgka+TD?=
 =?us-ascii?Q?4fzgLiCRsS1h7I+ppTw9t9Hij79uH0vECV3fHgTkT58IMnDLwdmA/ur8fPbr?=
 =?us-ascii?Q?OhnIX7N7NG7GCrf5p0Do7nZLac3cOU3gHNmagIFxdCA1DTK7oEcoFnHa9AUZ?=
 =?us-ascii?Q?I9XqJZlJR4RTONFw/SSAhcU0Np7iArKOvdodRN3nRowt2PU2pBJyTycp0vvJ?=
 =?us-ascii?Q?pVgTx1paDrN8q6XLK9i2HHgxZbmvCUER5w1dEm3mnU/TvmKwKPqXNT9yJ+0K?=
 =?us-ascii?Q?rTCmCYZr3ItZCNrAmDesY8vHdMfCMAnZzZal4cAhu4444nQbWeHrEFgnIYr7?=
 =?us-ascii?Q?q8aSxzp55dNL45uDHbYoG7u0A9rb0mFIuViKUN6uJ4rFrh6m6XUQKkwf6uWP?=
 =?us-ascii?Q?Eo/VOqPFT5q9LINlW7qbyRJrySSq/Z9MaV5myKuJerEQcmRrjgDLFE4Kg9hX?=
 =?us-ascii?Q?ulxa6LI8NHqcFjevIO5H+jd6EXRdb12RynfWwSj9JqqJg7O7kXCyWzrdJRVO?=
 =?us-ascii?Q?TsUPl42Uv2uZ+neMgpVk1c2fYZZQQek9REDgy1Ifd+VJNdD8vmM6iZOs6Hr2?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0f0341-cd8d-4b2f-ebca-08dbeb78f24d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:34:49.8169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAOGU4x+Q9gNXkzZibUrMaAVkQ4JWmglqSz7kSCZZhCKawdYITPGLyPq/LK7gZDzZvh+q2A6VQtXH2hQyI5RRH40jthq/v7HfxbyWVLYie0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6179
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ElpFxvmf-Cix4Oas_3WtswVkLROZX4fj
X-Proofpoint-GUID: ElpFxvmf-Cix4Oas_3WtswVkLROZX4fj
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
 conor+dt@kernel.org, mripard@kernel.org, matt.coster@imgtec.com,
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
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
using a TI SK-AM62 board (AXE-1-16M GPU). The driver has also been confirmed to
work on the BeaglePlay board. Firmware for the AXE-1-16M can be found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

Vulkan driver links referred to above:
[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

Job stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml

The Vulkan driver is progressing towards Vulkan 1.0. The current combination of this
kernel driver with the Mesa Vulkan driver (powervr-mesa-next branch) successfully
completes Vulkan CTS 1.3.4.1 in our local runs. The driver is expected to pass the
Khronos Conformance Process once the submission is made.

The code in this patch series, along with the needed dts changes can be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/dev/v9_dts
The full development history can be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

High level summary of changes:
v9:
* Bug fixes related to rebasing on latest drm_sched changes
* Updated for recent changes to drm_gpuvm
* Switch to dma_resv locking in pvr_vm
* Corrected license identifiers 

v8:
* Documentation clarifications/fixes for UAPI
* CREATE_BO ioctl now returns an error if provided size isn't page aligned
* Optimisations to MMU flush operations
* FWIF change to support CPU cached FW allocations/mappings

v7:
* Fix fence handling in pvr_sync_signal_array_add()
* Add a minimum retry count to pvr_kccb_reserve_slot_sync()
* Don't initialise kernel_vm_ctx when using MIPS firmware processor
* Remove unused gpu label from dt bindings example
* Improve UAPI BYPASS_CACHE documentation
* Add DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE flag to UAPI
* Rename gpuva_manager usage to gpuvm
* Sync GEM objects to device on creation
* Fix out-of-bounds shift bug
* Fix integer overflow in MIPS MMU map error path
* Add missing commit messages

v6:
* Fix a number of error paths
* Attempt to recover GPU on MMU flush command failure
* Defer freeing/releasing page table backing pages until after TLB flush
* Add memory barriers and use WRITE_ONCE() when writing to page tables
* Add Kconfig dependency on CONFIG_PM
* Fix a few issues with GPU VA manager usage
* Split up header commit due to size
* Update compatible string and driver description to match marketing name
* Use alloc_page() to allocate MIPS pagetable
* Remove obsolete documentation

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

v5: https://lore.kernel.org/dri-devel/20230816082531.164695-1-sarah.walker@imgtec.com/

v6: https://lore.kernel.org/dri-devel/20230906095542.3280699-1-sarah.walker@imgtec.com/

v7: https://lore.kernel.org/dri-devel/20231010133738.35274-1-sarah.walker@imgtec.com/

v8: https://lore.kernel.org/dri-devel/20231031151257.90350-1-sarah.walker@imgtec.com/

Donald Robson (1):
  drm/gpuvm: Helper to get range of unmap from a remap op.

Matt Coster (1):
  sizes.h: Add entries between SZ_32G and SZ_64T

Sarah Walker (18):
  dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
  drm/imagination/uapi: Add PowerVR driver UAPI
  drm/imagination: Add skeleton PowerVR driver
  drm/imagination: Get GPU resources
  drm/imagination: Add GPU register headers
  drm/imagination: Add firmware and MMU related headers
  drm/imagination: Add FWIF headers
  drm/imagination: Add GPU ID parsing and firmware loading
  drm/imagination: Add GEM and VM related code
  drm/imagination: Implement power management
  drm/imagination: Implement firmware infrastructure and META FW support
  drm/imagination: Implement MIPS firmware processor and MMU support
  drm/imagination: Implement free list and HWRT create and destroy
    ioctls
  drm/imagination: Implement context creation/destruction ioctls
  drm/imagination: Implement job submission and scheduling
  drm/imagination: Add firmware trace header
  drm/imagination: Add firmware trace to debugfs
  drm/imagination: Add driver documentation

 .../devicetree/bindings/gpu/img,powervr.yaml  |   73 +
 Documentation/gpu/drivers.rst                 |    2 +
 Documentation/gpu/imagination/index.rst       |   13 +
 Documentation/gpu/imagination/uapi.rst        |  174 +
 MAINTAINERS                                   |   10 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   18 +
 drivers/gpu/drm/imagination/Makefile          |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  645 ++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  109 +
 drivers/gpu/drm/imagination/pvr_context.c     |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  658 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  710 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  254 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1501 ++++
 drivers/gpu/drm/imagination/pvr_drv.h         |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1489 ++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  508 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   48 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  306 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  515 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         |  414 ++
 drivers/gpu/drm/imagination/pvr_gem.h         |  170 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         |  788 +++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c         | 2637 +++++++
 drivers/gpu/drm/imagination/pvr_mmu.h         |  109 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h       |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1432 ++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  169 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2188 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  493 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  373 +
 .../imagination/pvr_rogue_fwif_client_check.h |  133 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../drm/imagination/pvr_rogue_fwif_dev_info.h |  113 +
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
 drivers/gpu/drm/imagination/pvr_sync.c        |  289 +
 drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c          | 1107 +++
 drivers/gpu/drm/imagination/pvr_vm.h          |   65 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  238 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 include/drm/drm_gpuvm.h                       |   28 +
 include/linux/sizes.h                         |    9 +
 include/uapi/drm/pvr_drm.h                    | 1297 ++++
 82 files changed, 34503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
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
2.25.1

