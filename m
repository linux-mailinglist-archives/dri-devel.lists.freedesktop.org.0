Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00036EFC05
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFF210E46F;
	Wed, 26 Apr 2023 20:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067D10E1FD;
 Wed, 26 Apr 2023 20:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542648; x=1714078648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=imHsePnRTl+nBAtx+gOpXfmdF93lZvDXhITIpAKZrAk=;
 b=KXzOyGb98wdJTBf5D2BeEOJ1uRT7yG5ZDctNe9HCSe/qIC4w+lwGEDM9
 24Dvv5HDhd2j6/GyV0H3se6djzO5FnEtHcMp78H/qFaTzescyiUIfON12
 V4E0iTMF6+cvgVnSyX0ceipW5q34GB2SV2upp+8dDFSn0Jx8OW+bktPIJ
 0LYqDasrp6Mw3lWrxmZu1JCL175yEZxRKjpWJxB2FEUXaHJ9MJ9chA3vf
 5S8Z3DwenyQgf30MdtJr8fHUyyiSpZG4MSj+/u3dinZQMjkqyqCWsxEq0
 oMkIzY3kwYPmL7wFThUGLZUe3hbINMxi/oTndJJI4YuoAn5thaHlrMp/O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410249426"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="410249426"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868435018"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="868435018"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 13:57:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYlJ0rvnNVE3CAkf0bsReUNhhYkA0l8139X0uV95mdproXjeEvTblEVVixrZvmzfZ1JaduezJUxg3rGSr+kQWGda8njpDK/xn90G+QdrFjBJVO0fLATQGszjeidMYcqscSRp88ewasHcLDLY62xfWiRMUIxad9Dg9bAAUykB881l7MJAL0Uk735ANSQDMd8V4KjH7NjWTcAnAEqAmWobFRsay0Pw8VN7oBIjUXtD09BuRd9rmm+mBpSXageOMH9Kx57YYjBsKmI0RZz8oCdXUqoXzYJlZnQSSZzQzxaurJU9+32BgP+GpfP8tYEEF9YMTFwnoFn2O+pEYuK4zIr4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjqgEAtxqihVyRFAztKkzORumPoy2b/tnNaKOokbwv8=;
 b=fGSpgwhYqEII2+x4OaF8H+I1j6e8SlISjiFl5fbGkLVHP4ykWwCE1NIlYKwPPzoaY/5FI6XNOkOt6+PNwuM/jvjpA32XKnXoas5uiU8Os8TYz5UT0fchHQMafTasxOI08tPXEyyoanigWoSwsgzeMjCp2LaQFYwDxyG/Nv9eKoDQOgzxlSyiFvmeKfZhTTab9f08+tSIxAqRXMgqvJgc+ez+UUYAfIPpgjrWLUGkZNA5kqmT/bNL+nldnx7j42OaM2jEt4HVoJfG/yS8putaXY4dh276NohnAuFYBNqpWvxbnm3CDzQbyIPdY2zlmJyMp6jc4O8VgSsKk24DmptzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:57:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 02/14] drm/xe: Introduce the dev_coredump infrastructure.
Date: Wed, 26 Apr 2023 16:57:01 -0400
Message-ID: <20230426205713.512695-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: cb019fa6-b609-4c63-b72d-08db4698d71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBbfMpIDMPRR00X8OupqoTYVEegX5PwgNhaK7ggBiBQFPnNDRR8pzrSBDEGpao7uttUSzc4sKckTh2cW4jF8QPAPm5agDU0KcrE6ofO0QVW6FfZGG9yJAb+dA8c/OYlRF0PbdwcLIqbNN+9Ljeu9Fuj+QwXLFIm+aBoUpCmnnA2ndzMXuBrRd8g/X6r7I1M5mHKqfYntUOEYzYcmNOJidd/+hwa5547aSq50beVJc3b0iKPM3Mp1AQX9eterEQzcsAeCSFLOHBbvKWE7CcQ+ec/8qIBF5SGYFEfmIBY50R4Hs5OrHvpa9Nav45zHBhOPb6S0ieJlM3YTfNLofyDbXa+N0crTgpdP6BAFFyd7n2UKcG7O05LWedm0Y2MjkqBQ/hdyopzD25N2BSDaOBqqO/M+qo/QvJGSZuXhUmo57TRbQL1s9tlkn15P1TU69HEp3ItPklOlvpaEauFf8hqihnR55YYVbU62mRnxBMN3kE22/Nt0GrLrvFyiUIKsvqhwkaktymEIg/kIu7IFSJVTVJM4EKuXgmapT29c8PgMUiPZcHnJeVWFVQ7+1l8VMXzL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(38100700002)(82960400001)(66556008)(66946007)(2906002)(30864003)(44832011)(41300700001)(478600001)(54906003)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHJ5SEZubjhPVFlGNFFjZ3EvdnpuTUw2VmxlV0I2VFdkTU1UMEtXOWNMcXFY?=
 =?utf-8?B?OGVaVWNIY2pnQU9Td3V4cWEzWlEzd0hleFFZWER4elF4b2N3UVkxRFF6K2Ry?=
 =?utf-8?B?Q0JGaDM4aVlka3MzYytaazlIZ2p6aXFoa0dlampmMzZZcFkyQ2Uwa1VObVJC?=
 =?utf-8?B?ZXhoaklLcVpmcHRPRmJ3NDBEM1BBK0llaVRjL2tsUUYzOXcycGt1WVd1K29w?=
 =?utf-8?B?d00vS3FzdEovZDlVczNZTkdLVjVjR0tGK2lLeHYwRnA1WWJ4UFhxS3htNURH?=
 =?utf-8?B?NlpxNGdhcGtNemZKYUF4TW5aYWRkWHFOU2M3a0o0U1ZVSzUvbTBmUzhEaHEw?=
 =?utf-8?B?ditaT2FZMFhZM2hma0I3eHQwZyt5SVpDZ0hLSVVLZ2VaNExOcDl0YnA3N3NX?=
 =?utf-8?B?bmJaNElaNGhBTDlkdlFtblozOSt1NWpBSlhVOVdqblFXaHlYUXFSVGNMNmF3?=
 =?utf-8?B?Vm43dlFqU2JYOEhJNU8wdnlsSStOZFUrZkVCdWh6bjQ3RERYWDdGakwxdmI0?=
 =?utf-8?B?bGdxd3hVbDhUVDRWNWZEUUFDNkJtSXJkdzRzK29iYkxQbHh6d2haMnREM2pi?=
 =?utf-8?B?UWI5RGRZUGp1SEhwbTdZNVFiL0JMQ1BBNFBuY1U5ZVJuNkFZdUJNOHZvZHRj?=
 =?utf-8?B?czQzM0pWK09Ma0pTdDdvYm1rSHp1MURld0RkUFozU21GZUxBa3I4dGFuQ3Zv?=
 =?utf-8?B?d3BmaXo1Zzlab0VWSkVTRWlCQ0M2Vk93cTh1OEFiTExFNG9FaVptbmhmb2NT?=
 =?utf-8?B?YkFEajJ4L0NKVVVNTDhzbi9KYXpSZDQyaEVJNjdGNUhwRXZLYmNWZmNKVVNs?=
 =?utf-8?B?TFJ0SE1yV29rY2VxU0Q3MjhaaXZWM2pMeHpnVVQvVDZsTHFlWVhJMmRaam40?=
 =?utf-8?B?TFhxVjNRZHU2aHo3c2hVUjQ0VGpLQk56cTNFS0FoWmNyd2tYN3ZRcEtkZjdz?=
 =?utf-8?B?c2NPaFdOU2dvbUJ2amFydFhKSjIzemlBb2dBVkNHMjdURmVhUk1QMzBuSnh6?=
 =?utf-8?B?YUhXb3RIbVlqN0xjY2NidmNCKzhMQlRzV01ZZEUwZE5XcTBLSHAyWUU3T0sr?=
 =?utf-8?B?UGdWb3BVVUZCdWRESU5hNFl2S1RybndSdVljRitpS3ZBc0ZrM251NnEwdjZ4?=
 =?utf-8?B?SXRZc0NnK3pjZGI5Z1RWS3dQTHQ0VVJuSWFvNHREcEZwTkVvcWgyU041ODcw?=
 =?utf-8?B?bTg4MEptb1l3Z3MyM0dJOExxcHkycmtTZjJCcG1HQzZDL0YyTXJ4TTcrbEFw?=
 =?utf-8?B?R0w1SkVJQm5jSzFZdi9kM0IwWm9nZDlNR3VsZ2xGMEVuYTc1STJWbmpTaDh4?=
 =?utf-8?B?MkF0UHRBbm1pZ3lqbngvaWorU3ZGanFkVXRVNDlnVUcyZFVzbjM1TzRlUldL?=
 =?utf-8?B?S1RxczhDNGlhaXlWYms5VFBaTDdWMDZCa09jeEplVEV1ZEtDbndsWDd4bFdF?=
 =?utf-8?B?eWN5V2RJaHRFRk9XR21rRUlCWkhRVElaNUs3VHRpekN2cHBRWUJ2V0kxRENx?=
 =?utf-8?B?RlhYSlBKTEJZRHh3NklLRzlmNk5hblVHNlhkclQwU01IMGYrVDBHbFdLbWl0?=
 =?utf-8?B?TWJ2TDZGcEplRjlYWVgzVnp2TjRSb1dkNDlDRC9qcEJjRUV6WWx2Nks5dGd5?=
 =?utf-8?B?Tml2UENRNzZ1V1RZSnZ5Mk9aa1dxQ3ZUWXFlY1R1Szl1T3ZzNVM0R254MHhu?=
 =?utf-8?B?MjJVbnk2bGxLOHBHazRHczhPQ0cwNnJVc3h5WWxuV2ViYVlpcHRJTWdPbnNG?=
 =?utf-8?B?RHZHTHltT04wZzRYRkRPME5qaVZCSngrRzRVM05CSjI0ZEljTGx6ZDM3blhX?=
 =?utf-8?B?MEg4LzJEWXVFbkh4bFdkVkxGa21iTzluZTZ5RmhFcExEWFEyTFU5ZHl6alU0?=
 =?utf-8?B?VVdOdEcxRUVHMUpDZ1lkRnpYSWp1NzlWTVdBeUM0REFDMmM0ME5rR1dDdGRI?=
 =?utf-8?B?ZWxFaWEzeGh6WUMxdGhtc09LU2NaYXJCMlZ2UlFYb0hSY3lETk0zdW9oZ1ov?=
 =?utf-8?B?ZzR2TVFnaTB1cC84bzVoODkxd2ZjaEV4WklqdWFZQ2o1UHAyRnpxWGxQUVBQ?=
 =?utf-8?B?a0hFdnkxVko2NTVYSmJNZzJiTWU2MDI3TkNwWWlCZENGaFlvZlMyUDJ1YUha?=
 =?utf-8?B?M3hnbFp1S0FKWFBveTJwOVZzQlFLMEovYTJTczVNNXFUQXlyOE5FYTVOTVFI?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb019fa6-b609-4c63-b72d-08db4698d71f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:26.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSBp3PkIxOqCn5XPd3tIQ2UY7xI6wHCmMEFixAvGTDahMJFVZwngqIUrGKJXap3AT/jezdfPcuaxJ0HZzlh4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-OriginatorOrg: intel.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal is to use devcoredump infrastructure to report error states
captured at the crash time.

The error state will contain useful information for GPU hang debug, such
as INSTDONE registers and the current buffers getting executed, as well
as any other information that helps user space and allow later replays of
the error.

The proposal here is to avoid a Xe only error_state like i915 and use
a standard dev_coredump infrastructure to expose the error state.

For our own case, the data is only useful if it is a snapshot of the
time when the GPU crash has happened, since we reset the GPU immediately
after and the registers might have changed. So the proposal here is to
have an internal snapshot to be printed out later.

Also, usually a subsequent GPU hang can be only a cause of the initial
one. So we only save the 'first' hang. The dev_coredump has a delayed
work queue where it remove the coredump and free all the data withing a
few moments of the error. When that happens we also reset our capture
state and allow further snapshots.

Right now this infra only print out the time of the hang. More information
will be migrated here on subsequent work. Also, in order to organize the
dump better, the goal is to propose dev_coredump changes itself to allow
multiple files and different controls. But for now we start Xe usage of
it without any dependency on dev_coredump core changes.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 144 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 8 files changed, 223 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f6f3b491d162..d44794f99338 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -35,6 +35,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_SCHED
 	select MMU_NOTIFIER
+	select WANT_DEV_COREDUMP
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee4a95beec20..9d675f7c77aa 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -34,6 +34,7 @@ xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_debugfs.o \
+	xe_devcoredump.o \
 	xe_device.o \
 	xe_dma_buf.o \
 	xe_engine.o \
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
new file mode 100644
index 000000000000..d9531183f03a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_devcoredump.h"
+#include "xe_devcoredump_types.h"
+
+#include <linux/devcoredump.h>
+#include <generated/utsrelease.h>
+
+#include "xe_engine.h"
+#include "xe_gt.h"
+
+/**
+ * DOC: Xe device coredump
+ *
+ * Devices overview:
+ * Xe uses dev_coredump infrastructure for exposing the crash errors in a
+ * standardized way.
+ * devcoredump exposes a temporary device under /sys/class/devcoredump/
+ * which is linked with our card device directly.
+ * The core dump can be accessed either from
+ * /sys/class/drm/card<n>/device/devcoredump/ or from
+ * /sys/class/devcoredump/devcd<m> where
+ * /sys/class/devcoredump/devcd<m>/failing_device is a link to
+ * /sys/class/drm/card<n>/device/.
+ *
+ * Snapshot at hang:
+ * The 'data' file is printed with a drm_printer pointer at devcoredump read
+ * time. For this reason, we need to take snapshots from when the hang has
+ * happened, and not only when the user is reading the file. Otherwise the
+ * information is outdated since the resets might have happened in between.
+ *
+ * 'First' failure snapshot:
+ * In general, the first hang is the most critical one since the following hangs
+ * can be a consequence of the initial hang. For this reason we only take the
+ * snapshot of the 'first' failure and ignore subsequent calls of this function,
+ * at least while the coredump device is alive. Dev_coredump has a delayed work
+ * queue that will eventually delete the device and free all the dump
+ * information. At this time we also clear the faulty_engine and allow the next
+ * hang capture.
+ */
+
+static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
+				   size_t count, void *data, size_t datalen)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_devcoredump_snapshot *ss;
+	struct drm_printer p;
+	struct drm_print_iterator iter;
+	struct timespec64 ts;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	mutex_lock(&coredump->lock);
+
+	ss = &coredump->snapshot;
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "**** Xe Device Coredump ****\n");
+	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+
+	ts = ktime_to_timespec64(ss->snapshot_time);
+	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ss->boot_time);
+	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
+	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+
+	mutex_unlock(&coredump->lock);
+
+	return count - iter.remain;
+}
+
+static void xe_devcoredump_free(void *data)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = container_of(coredump, struct xe_device,
+					    devcoredump);
+	mutex_lock(&coredump->lock);
+
+	coredump->faulty_engine = NULL;
+	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+
+	mutex_unlock(&coredump->lock);
+}
+
+static void devcoredump_snapshot(struct xe_devcoredump *coredump)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+
+	lockdep_assert_held(&coredump->lock);
+	ss->snapshot_time = ktime_get_real();
+	ss->boot_time = ktime_get_boottime();
+}
+
+/**
+ * xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @e: The faulty xe_engine, where the issue was detected.
+ *
+ * This function should be called at the crash time. It is skipped if we still
+ * have the core dump device available with the information of the 'first'
+ * snapshot.
+ */
+void xe_devcoredump(struct xe_engine *e)
+{
+	struct xe_device *xe = gt_to_xe(e->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+
+	mutex_lock(&coredump->lock);
+	if (coredump->faulty_engine) {
+		drm_dbg(&xe->drm, "Multiple hangs are occuring, but only the first snapshot was taken\n");
+		mutex_unlock(&coredump->lock);
+		return;
+	}
+	coredump->faulty_engine = e;
+	devcoredump_snapshot(coredump);
+	mutex_unlock(&coredump->lock);
+
+	drm_info(&xe->drm, "Xe device coredump has been created\n");
+	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");
+
+	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+		      xe_devcoredump_read, xe_devcoredump_free);
+}
+
+/**
+ * xe_devcoredump_init - Initialize xe_devcoredump.
+ * @xe: Xe device.
+ *
+ * This function should be called at the probe so the mutex lock can be
+ * initialized.
+ */
+void xe_devcoredump_init(struct xe_device *xe)
+{
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+
+	mutex_init(&coredump->lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
new file mode 100644
index 000000000000..30941d2e554b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_H_
+#define _XE_DEVCOREDUMP_H_
+
+struct xe_device;
+struct xe_engine;
+
+void xe_devcoredump_init(struct xe_device *xe);
+
+#ifdef CONFIG_DEV_COREDUMP
+void xe_devcoredump(struct xe_engine *e);
+#else
+static inline void xe_devcoredump(struct xe_engine *e)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
new file mode 100644
index 000000000000..3f395fa9104e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_TYPES_H_
+#define _XE_DEVCOREDUMP_TYPES_H_
+
+#include <linux/ktime.h>
+#include <linux/mutex.h>
+
+struct xe_device;
+
+/**
+ * struct xe_devcoredump_snapshot - Crash snapshot
+ *
+ * This struct contains all the useful information quickly captured at the time
+ * of the crash. So, any subsequent reads of the coredump points to a data that
+ * shows the state of the GPU of when the issue has happened.
+ */
+struct xe_devcoredump_snapshot {
+	/** @snapshot_time:  Time of this capture. */
+	ktime_t snapshot_time;
+	/** @boot_time:  Relative boot time so the uptime can be calculated. */
+	ktime_t boot_time;
+};
+
+/**
+ * struct xe_devcoredump - Xe devcoredump main structure
+ *
+ * This struct represents the live and active dev_coredump node.
+ * It is created/populated at the time of a crash/error. Then it
+ * is read later when user access the device coredump data file
+ * for reading the information.
+ */
+struct xe_devcoredump {
+	/** @xe: Xe device. */
+	struct xe_device *xe;
+	/** @falty_engine: Engine where the crash/error happened. */
+	struct xe_engine *faulty_engine;
+	/** @lock: Protects data from races between capture and read out. */
+	struct mutex lock;
+	/** @snapshot: Snapshot is captured at time of the first crash */
+	struct xe_devcoredump_snapshot snapshot;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1cb404e48aaa..2a0995824692 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
@@ -55,6 +56,9 @@ struct xe_device {
 	/** @drm: drm device */
 	struct drm_device drm;
 
+	/** @devcoredump: device coredump */
+	struct xe_devcoredump devcoredump;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @graphics_name: graphics IP name */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..231fb4145297 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -14,6 +14,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_lrc_layout.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
@@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
 		simple_error_capture(e);
+		xe_devcoredump(e);
 	} else {
 		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e512e8b69831..1d496210b580 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -16,6 +16,7 @@
 
 #include "regs/xe_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -657,6 +658,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
+	xe_devcoredump_init(xe);
 	xe_pm_runtime_init(xe);
 
 	return 0;
-- 
2.39.2

