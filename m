Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF65933D7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB66CEA55;
	Mon, 15 Aug 2022 17:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 929 seconds by postgrey-1.36 at gabe;
 Mon, 15 Aug 2022 17:07:46 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC61B9885
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 17:07:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FGLljK015096
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 17:52:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=dk201812; bh=tMraddjkjyfzT1igHFRwG6bveBcF/PHi7vg69QiNa/k=;
 b=M9UmayOCJT7GhNClbbFoWvLuAnDPeuaA7wuJG7F9IQ6eNx1RhaUvcqxAE+y4Jm43WPZk
 XcCBqf5noBNwukm5HLDrmFxkOXjXCA5XfzGyCaDGDpuH+BRPsFhOjBuAIYM2vz/RFIQR
 zOuVtg1QU99m14ihDP8Bkdaipfdl+JZpbZLHsrszM7ZiJtITYONdTuIQuK41XKXx6CIS
 PdHnUBDlDg6aVQSx9lXoT3qBnH0CrzMOXz6MEtrhjr7YkZ2OvXA49jYmsEn+HStMHR+r
 vknYEHcTBdPTEGWUbAaljr2HovsSbKuPmy3Y2pHb8sJFEjEkpGHvEmSdp+EUtf7Klaly JA== 
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3hx4201jgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 17:52:15 +0100
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Mon, 15 Aug 2022 17:52:14 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9 via Frontend
 Transport; Mon, 15 Aug 2022 17:52:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xiz8/JFZFO6INgApqiHdOjR3ZqPkOW8rQBFxdwJbD1KvvtFaZ9Nt5jZIYLeGqlXMrCLjY7dJPdTEz7+ACz/zhRCJuIqMSWg8Fu8RCZ7tVebxE+2iLCWFIDz/bvSM1Lf563fmc8j/WlDnzklfgs8Dd+xtHWQzkJnk7/rVMaFrJMH6d6T3rdKw8mipPJ1VqTLeade9jEpeNuUbnN/itwpBlI4iFMq+iKVHJBqhTBernXecKWDh7DCysNaoiC00q2XXkfDgusrA4kINDlyvIpsoMujSKqlQlGAx+lOX/UvfIifGEU3wVujgLrgiz+yffPakMGIlEj8A0rnxj3o1IIctyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMraddjkjyfzT1igHFRwG6bveBcF/PHi7vg69QiNa/k=;
 b=JZ4Pc2284UPP8ZsIismLK3Btt+7JOJc6XIA17nqDVxZxOLauX/OwgIi+6R+/fUrFWsZLMocFyTm/M4OBx5XkTmPJOt8IPYRkBbx/WIoSvL3hvNax10vHymNsXeOsGLP9sEKZKWw35i6rlmIKICUr5Kinbp4nQEsNGbXXp/QbMOUHB+a5PayCyrVfhO5vWMKHlGGOHAsv9kceK8SEQfSvLYBxLqu4L1AsRyrAjM0Umyq1++Z7h3QFvrzSyeClu/JpTsWpb6tOuF+bGO1ECxbAfQGd4pLsvaDm3fKAiP6aliCzFnqgTUgBie7kxWzCh4oL9J73JpOBq/438AlM54lZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMraddjkjyfzT1igHFRwG6bveBcF/PHi7vg69QiNa/k=;
 b=hLlv8iMm5cwPJmDQVToLFl4wT83ALVMcMCJd7HCXzfpyLWmLbcopx/NPl8W/N59R4mXWrJE9dcYeK3NfAvAqw8mqHTkUJqvWWHe562WdhwF8mp/Or4DHilPrjCANnz3w19/2YnGhH0tgZxQlerki5FSmU845X9rJCbMMgwV6JpA=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO6P265MB6297.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 16:52:12 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::681e:cb44:64e8:f0e2]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::681e:cb44:64e8:f0e2%3]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:52:12 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH RFC 0/1] Imagination Technologies PowerVR DRM driver
Date: Mon, 15 Aug 2022 17:51:55 +0100
Message-Id: <20220815165156.118212-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf59ff48-9f18-4b5c-0bf3-08da7ede8021
X-MS-TrafficTypeDiagnostic: LO6P265MB6297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrBAKMwEufAl/C+KkN6xWUUOJ8BFsrL7mdt3UU+M+Uq0+4EO1M4qceQZf4qoEInZBwECfsU3bxDNQLd9VmAHTP15gtVifiTCBRPe+muXs9KMX4cTiA1lCYGe/+bOmURoDJJQ53oS/eAjIkq8gsjavnzt2jT8NZ+zOEmb62KNRzmN12/5avO+N3gtmhpM6S0x7lfo7crDUQrTaKi7PPl28fxgxONPVNGytuz9Wge8elD+OoSIfhG0MUZi9UKVyAI/N/WhA/AoXBJRXjF13oX3kN1+UgwLYxp6Yb2lqnVLy4td1Xw59EXcL8XzE3gTEb+2w5o95NfsRcJRF/JPtPy3S4X2PLNKtbzfzxiCh32xKYT2xclrpnIp2n6kYI16Dlamz6ZOaZ675D6UEJaMidxFdkeUMjyj2OnUJbQ8rYqTTO5PNZa2RAq0wZU16YMO7wpT8xzBVgN7FP4FOcSfenPYgtZ7ztkIsHSOSqnTLfOwxcVzqmwvVFlkx/PsuG1A7trD3oamwdCyMlTYoEEXMrQpBiWVSwLsZ6lGmNId4bx2heI27smIpy+DN3qx8uCVwGL85vmLUxrPR/byD3kxBJ+SiXO8u2qV8UO/Wg9I6fOFjmKCRksCf/CY3dUaCh+sZJwN821TwO3JFZQClUU/YXe7zSdr2wyGwi/7IyPhp1MMoP0CyNuIC3PMUPqpU6LulvPEGChPIw5xJjMA2Gp9JotC8ZVMs2H7KYJ1XnOCEBXao/IZYO5yXGY24GiH/znPI+pl+MrhLp9hcn6XARGOtC6cp/ZHx3umqWo+s0hpS+Qg3aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(376002)(396003)(136003)(366004)(346002)(83380400001)(316002)(966005)(478600001)(41300700001)(6486002)(66946007)(66476007)(6916009)(30864003)(8936002)(8676002)(4326008)(5660300002)(66556008)(44832011)(2906002)(38100700002)(36756003)(186003)(38350700002)(107886003)(26005)(2616005)(86362001)(1076003)(52116002)(6666004)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5jC8cFv++hNQgy3uKsxLxHLnHd1bQltEV/6iXR+JjoqmIAj7TlIKJZ9QrRva?=
 =?us-ascii?Q?/UiWjW8mh5G3e6xh9dUewBqhmZEcikxDdXajTPInUK7YKqFIa/a+wNkIYauE?=
 =?us-ascii?Q?EvWmxjuFZKpO7y5IzprhmSJBuI03XyL5SbncO/+CIdmpjW6pSLgdKj5XIGND?=
 =?us-ascii?Q?pYNOXD73oAJImzg9/HWk3oN7a/Gk1rRtsylYVWRRQZuP9bt4ZQWMLu/gvGZv?=
 =?us-ascii?Q?zlNLxug3CtBQvknd4WiRH2+KjXgCBJOHbxRO18RFNy19RJ04zIn0pgoxgChe?=
 =?us-ascii?Q?SEZQlNHwC9j6Nd1MTfNYKa1fP+ABKS3a+S6QGZlyz5Iha6A0zXka/uszEdIC?=
 =?us-ascii?Q?AKL/5MWKhQ03UGbRUKIONgx4vSX2Wxs4OPiqup2YSYjy93cT++RKrScNQbhb?=
 =?us-ascii?Q?wZlsKqnPPssdW1uaaAU5G9OynpBwhVWcFbaktVfXtXD2DEDMzokDgGg6yKN9?=
 =?us-ascii?Q?WbiBJTWHA7Q1828eFqqWR1uPv9pQG+29bfa3mbitv59r8yAnV1EZ93DSuDuB?=
 =?us-ascii?Q?dcq20HQH1Eo26xu9sDUiyeoUeg6hLME2kCUkMiwD7YUNcAEdoMfTCSJbw78R?=
 =?us-ascii?Q?RIrUMgVdnMGqNx/EsEt+kHKLrt1+IA3FXcl4AmE4coKf3/kAcxuAsLY8jZsQ?=
 =?us-ascii?Q?7xnK0MAiJXHyrqMCzZtyjJA2dEctPvZHLtF+jns1CvBNcyaBZ8kacw9dcpLK?=
 =?us-ascii?Q?0OUyQzHFzGbNduwlpXhAz80zH960Hry/usw9CqOQoys/ArUrOuiEUkzYUoy0?=
 =?us-ascii?Q?Hh4cKWAvMsQZGwhclEFSbDD+q5Hzts9vNcjT5CHeE97dEf3OU31+CwK+1tFY?=
 =?us-ascii?Q?S6kL/mwcC9sgZcBPIGvgcPxaWFaw21APGmlRtcoK6l+rwdqvksmnE1NgB6h+?=
 =?us-ascii?Q?hi6kElAqdkZVYN92QJaFb7Dg+lkqarO1y0PLbNyZmyZd15XHb74mmdziuqum?=
 =?us-ascii?Q?QVrfn+cIerAOpJr54M1c1zSA49uP89df/qgwBxMGP3yLkTb1sCMctfnEefxm?=
 =?us-ascii?Q?44bDue6GywZw7IKAcjVQJOG98fF8B2Ky5s60kLKxr162dQbKpjYdC6z3cV+Y?=
 =?us-ascii?Q?qYYbnHoXmEAo6/FCEJkzDeqSNyAsj9qbTBJIWXR8Yzr3jr/wNqTWlzDvvmiN?=
 =?us-ascii?Q?0CUpbfaJkdtsor0KcKt3N9RHZGWcMwR5JRM7odAJg4US72/7T6Z2VgKyGw8F?=
 =?us-ascii?Q?2YTqgwWhFPzFRsKWN49kTgnDgTQWwdoUvYY8Wpcs0BTNoaUsCgWMFFePMqxL?=
 =?us-ascii?Q?cTaf2S5lqPDDyjHmvmYkofmkqVg/M8k6pzfoeDSZyfqUpdty7/7JsGcgLLWI?=
 =?us-ascii?Q?AuS6UZk2nEmDaBwpzlx9Z/mAxMeDP4zMeG2iHX2twJ6XDcLl9NGZBGeIvI/A?=
 =?us-ascii?Q?aYnTeTdMy98lVV7D1UQ88jFC5SbUbbVqh+/AKTczJNXYpEvKRUhY6OJenWU+?=
 =?us-ascii?Q?j1Eq8Ex4N0dOHaVk9anQB+BtxWANoLTFbT4Q/IV77KRfbya+Cx1JRw/mc9wv?=
 =?us-ascii?Q?TkLG0beNfaBhkCQh/wQ+2b9E9aLQzCVJVUsqzcmc5ULmy2nHoNrKr2Pif8qY?=
 =?us-ascii?Q?n2jtaXSSAveHgR99GtSHHk6KHAhX7Gf+lYzEaqFTjjE2kPLiLnAI39aot48D?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf59ff48-9f18-4b5c-0bf3-08da7ede8021
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:52:12.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3BKfod1QHqsv0BcJNr5ouH5rLJZ7j1Qw5b+Z0Hk+3lyZgMB0+fTbJixCxLJMHDvENxV3ZlVY6+ED1erxHLJSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6297
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: k9aysmpvF72FeBjfv-aK5MMoFUPfZlSb
X-Proofpoint-GUID: k9aysmpvF72FeBjfv-aK5MMoFUPfZlSb
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
Cc: matt.coster@imgtec.com, simon.perretta@imgtec.com,
 rajnesh.kanwal@imgtec.com, karmjit.mahil@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the initial DRM driver for Imagination Technologies PowerVR
GPUs, starting with those based on our Rogue architecture. It's worth pointing
out that this is a new driver, written from the ground up, rather than a
refactored version of our existing downstream driver (pvrsrvkm).

This new DRM driver supports:
- GEM shmem allocations
- dma-buf / PRIME
- Per-context (device node open) userspace managed virtual address space
- Implicit sync / reservation objects
- DRM sync objects
- Power management suspend / resume
- Render job submission
- Compute job submission
- META firmware processor
- MIPS firmware processor
- Basic GPU hang recovery

Still to do:
- Transfer job submission (needed for Vulkan)
- No-op job submission (needed for Vulkan)
- Support RISC-V firmware processor
- GPU hang detection
- Handling for running out of parameter buffer space
- DVFS

Currently our main focus is on our GX6250, AXE-1-16M and BXS-4-64 GPUs. Testing
so far has been done using an Acer Chromebook R13 (GX6250 GPU) and a TI SK-AM62
board (AXE-1-16M GPU). Firmware for the GX6250 and AXE-1-16M can be found here:
https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

A Vulkan driver that works with our downstream kernel driver has already been
merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
a draft merge request [3], with the branch located here:
https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys

The Vulkan driver is progressing towards Vulkan 1.0. We've got several APIs left
to implement and a bunch that are queued up. We've mainly been running the
Sascha Willems 'triangle' example to verify that we've not regressed anything,
along with the 'pipelines' example and a simple compute example. We've not yet
done a full conformance run, so I don't have any numbers to share just yet.

The code in this patch, along with some of its history, can also be found here:
https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

Sending this out now as it felt like a good point to get some feedback.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
[2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507

Sarah Walker (1):
  drm/imagination: Add initial Imagination Technologies PowerVR driver

 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/imagination/Kconfig           |   11 +
 drivers/gpu/drm/imagination/Makefile          |   37 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  348 +
 drivers/gpu/drm/imagination/pvr_ccb.h         |   50 +
 drivers/gpu/drm/imagination/pvr_cccb.c        |  326 +
 drivers/gpu/drm/imagination/pvr_cccb.h        |  103 +
 drivers/gpu/drm/imagination/pvr_context.c     |  607 ++
 drivers/gpu/drm/imagination/pvr_context.h     |  176 +
 drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
 drivers/gpu/drm/imagination/pvr_device.c      |  759 ++
 drivers/gpu/drm/imagination/pvr_device.h      |  721 ++
 drivers/gpu/drm/imagination/pvr_device_info.c |  207 +
 drivers/gpu/drm/imagination/pvr_device_info.h |  125 +
 drivers/gpu/drm/imagination/pvr_drv.c         | 1118 +++
 drivers/gpu/drm/imagination/pvr_drv.h         |   19 +
 drivers/gpu/drm/imagination/pvr_fence.c       |  446 ++
 drivers/gpu/drm/imagination/pvr_fence.h       |  168 +
 drivers/gpu/drm/imagination/pvr_free_list.c   |  407 ++
 drivers/gpu/drm/imagination/pvr_free_list.h   |  142 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1028 +++
 drivers/gpu/drm/imagination/pvr_fw.h          |  329 +
 drivers/gpu/drm/imagination/pvr_fw_info.h     |  106 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  597 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c     |  276 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  279 +
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  505 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c         | 1082 +++
 drivers/gpu/drm/imagination/pvr_gem.h         |  374 +
 drivers/gpu/drm/imagination/pvr_hwrt.c        |  548 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h        |  165 +
 drivers/gpu/drm/imagination/pvr_job.c         | 1208 ++++
 drivers/gpu/drm/imagination/pvr_job.h         |   34 +
 drivers/gpu/drm/imagination/pvr_object.c      |  221 +
 drivers/gpu/drm/imagination/pvr_object.h      |   60 +
 drivers/gpu/drm/imagination/pvr_params.c      |  147 +
 drivers/gpu/drm/imagination/pvr_params.h      |   72 +
 drivers/gpu/drm/imagination/pvr_power.c       |  196 +
 drivers/gpu/drm/imagination/pvr_power.h       |   37 +
 .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
 .../imagination/pvr_rogue_cr_defs_client.h    |  160 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2271 ++++++
 .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
 .../drm/imagination/pvr_rogue_fwif_client.h   |  243 +
 .../imagination/pvr_rogue_fwif_client_check.h |  104 +
 .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
 .../pvr_rogue_fwif_resetframework.h           |   29 +
 .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   |  890 +++
 .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
 .../imagination/pvr_rogue_fwif_shared_check.h |  107 +
 .../drm/imagination/pvr_rogue_fwif_stream.h   |   69 +
 .../drm/imagination/pvr_rogue_heap_config.h   |  108 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
 drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
 .../drm/imagination/pvr_rogue_mips_check.h    |   56 +
 .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c      |  303 +
 drivers/gpu/drm/imagination/pvr_stream.h      |   72 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  231 +
 drivers/gpu/drm/imagination/pvr_stream_defs.h |   13 +
 drivers/gpu/drm/imagination/pvr_vendor.h      |   77 +
 drivers/gpu/drm/imagination/pvr_vm.c          | 4155 +++++++++++
 drivers/gpu/drm/imagination/pvr_vm.h          |  130 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c     |  223 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
 .../gpu/drm/imagination/vendor/pvr_mt8173.c   |  121 +
 include/uapi/drm/pvr_drm.h                    | 1172 ++++
 74 files changed, 31826 insertions(+)
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_fence.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fence.h
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_object.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_object.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
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
 create mode 100644 drivers/gpu/drm/imagination/pvr_vendor.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 drivers/gpu/drm/imagination/vendor/pvr_mt8173.c
 create mode 100644 include/uapi/drm/pvr_drm.h

-- 
2.25.1

