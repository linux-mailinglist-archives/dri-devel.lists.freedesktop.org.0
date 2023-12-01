Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57280027C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7510E7B5;
	Fri,  1 Dec 2023 04:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE5410E7AE;
 Fri,  1 Dec 2023 04:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404550; x=1732940550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GS+/7DsvU/AV2MzCCRQ7A9blEuT5+BlpwPKUYTVZUFw=;
 b=QLPaf1431RGMOWqmNmNgdnKgYheQN9A4ek7osTU6Bkwoa82wBcWwDHmc
 tTLGpzimdPLSrEPj3yNenmKxIVtPOpCDVL8xTJc3JT3n6dcag0zsFBDSl
 abHcUyFvpqTN0+znY7hsoQyegRj4p2VjoPpS57cLm8OHh9etw7JlWh+q1
 Fg/aFqYMBQOEHuKWKlhgYX0WcZ+o81H5RlvsD7tHFFEfF7FXjkaCVEV9A
 rAqbBis2kbUm6iX4ieycnE//GCqnCeG7YZAHIqWTDJ1/1kKDPjZu//U2J
 d49148JJoU+FL7w3XEpfVb3dYomGAtJHeb+Sv//kASzQ2YT3vCvgyvbiw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12145970"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="12145970"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860435359"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="860435359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:15 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nturgCTk8BMcZjIoJ929kkfZ2BT+7Gbg06qFmrwUl4YYrSSWtopDj/zan1PxbO5o1PIvyFGyaW2Y9AkeIIzjGndlPV9NQrTNEeW4VZizERTt+HEjFnjH0DC7pNPRhviSQ6KWTT1Z+3MuifrVJ7nCQzkmTxcDvkn3vYuaYgmTmUQ3q+RQj1NcL3J+RWLCkMETUYDp7EQxtAEltsg/PP47jFhCjXtXFCH+H/UHteg1iOmYqPmV7/oEaVBhjNa65E6h8/4RxEW544aiO+Q+koXAtAR3vhZs/0giovz1QVts4RYIK+CqDhO7Orv+pgfNGaLNvFz4i4plR5ndw1xHayFrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6ifDW8y+YdAHVn7Mp3B9LXXA3luNp0HBOdqOxVb2f0=;
 b=Dyt+zCscG3AS+sAFOYzlTRAEbFVPld6vPBPirfu9lpwjEca0S7bHXj//9ehnXlYQpfXM85txcchm1Q4CKBvvkNUDPLkIAQTUqPrP0n5ndWywtLz9GO2U0vzzWxnriYX1eXoqmS19X53LNhXA8h8uVysL95CcRgif2X9vtK4R9i6lg/es62tzOW9mz4fNf8LcRp8K3OjWXw3eV6EY2I1VyQc/m+GzCUebnHVnpxmkvq6nar04iFX8IwJxPGvdCWGbDm5CQ8i3IDPyv7ihI81z5nXnX3esRnN/fMMNlZ72pbJJW5zhYefP+N4qZSjzAM45M11ijrVUbpT7dY0DbN22KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 2/5] drm/doc/rfc: Mark drm_scheduler as completed
Date: Thu, 30 Nov 2023 23:21:52 -0500
Message-ID: <20231201042158.80009-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201042158.80009-1-rodrigo.vivi@intel.com>
References: <20231201042158.80009-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 813bb30c-cd7a-4613-d7f8-08dbf2251848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aPEOQMPJHGg2LwR8wmxRCL65bCARM1rpkHCZpJl5LCwWH8/gaK3619aRGiSxitSnxPorzvkMnOTk/EObynQYZLzSKkULnGrn3A7oA6590teFNx+o/6f/4aGeIcgM/UAh3WKXzTYY1ffAoQ6MaV2zttn13jFyL2+V6dqo5aZ7IGf8kwb0xx7xvOlPjd0stwfs/1d1JrUTVF3vJBrYDhwSIANsY6vekQrNGdv6jN2XLtE8lsd4fw1aXD0K5c/XUZAm+YjE4rbz5wd47xEuu5Qs+lVT4BuP0eDiWxupQdrVpjACmM8udQsqHUi7EzB/36aVJpuXeeFriaFkyGNOnMKxvlKrwR6vyGNm3bc7BBVKBaA0FHqvv2DDc69JPyeTu/9AEJ2GYudH1xrYZS/ZZ8gZLMfQkay9k2Yxz7aDoGz4v/6wIO3ekVStYFj3oO0FJC1fO315zVKPuOZNSqWdSbBKI2flqoq5ZdGRA42KzMFzebyzHjXt1aKL+WbMa3x4KxMXhQUVbF5hXRrHpwW3JfBeUwaMqXdGBIxrFZaS1dFt7hhzJKLiawHs+ro2NkwJu5I+F8twhg9/K2yguIi75ey/5BmNMOelLLFe7FChpCBZUbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(316002)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlhUGwrcDdwTC9iRnZaYytjWm5td0lHN2NiVU53VGVWUm9TcmxrWlV0QmFa?=
 =?utf-8?B?cVpTa04yRWFDMUMvRzFPcDY1d1cySVQzck95Yk04aUlxazdpdTlKYzE0TUw5?=
 =?utf-8?B?MFFGZll5bHY3Q2pHdDU3L2VTRFExMDFIQTFrZGY3S3UrLzR6K3BrMGN6d0ZF?=
 =?utf-8?B?U1lFVHB0RVJsV1IrbU5RQkFQc2JQZFVyTHdSbHVyaGQvRERKcTI5MU1zNVpN?=
 =?utf-8?B?SWZYRHJNTDEzZHhrZDJQdDNtV2VrWjI5ODZCY1QydnBGRWpNckoyQnBvQ2FF?=
 =?utf-8?B?bGloWENvWjNyY0M5MUR2SHE0Ni9TRUxOemc2c0FkcVJ3SUhGMHhJTFFRNGhZ?=
 =?utf-8?B?ZXJpOGJ0Q1Y5aXFETDY2RDFINlg5Z293ZThwa0NIN2NyNE9CT3FHQ3puRXEr?=
 =?utf-8?B?SzZQN0VLMnlJakpXdXJkL2o3ckFUWTl0UEFNNFhUR2t2VzVoVndBYW45a0F3?=
 =?utf-8?B?UWoxeVlSYUU4RHlWdVJvZXpUZFdMeDRFOENvNlFBVUlaY0lqMUNWS1ZhTWFV?=
 =?utf-8?B?QWZUb0VlaHJ1MjJrZnQzVFVpL2R4WjN1cXcrVENncVV0YVptSlV2bmJyMnVZ?=
 =?utf-8?B?TzFWeU9WaEZmOUVZWjVUN2NmcGY5SzhkdXVyK1g1TklUSHgyTXhJb1dITzFR?=
 =?utf-8?B?aFd2MHp1YWR6cFNmUWpBSU9WUFBlckJrUGtTZG9QT1N1SExwVmJaMnRRNXd3?=
 =?utf-8?B?cjhtU00yNmFhWmRxSmJPZ2c5dFpidnlZSkhWaitqTncva0IvblJxRTFjUG9t?=
 =?utf-8?B?L1ZYSFVUN05IRHp0Y3U2NXJENGtQRjkyeTA0dmxtMDVQL2JxNVlxYjFwZXlQ?=
 =?utf-8?B?QmNYVTErRTd2TUVFQ0tJTlJJUkcxZG1WZjRsb1FFUWxDaXg2Q3lFYm5ZeVdQ?=
 =?utf-8?B?SnlMUzh5MXJKZlBEcDFTeFM3bTFucTVCNE5yK043L0NGQUR5SXZNamwxTWZF?=
 =?utf-8?B?aHNCa2dRYnU0bFJqNkhjbzIrcGV3a1lIUHdoTkc2bHBRTXRoUjgyOWJZdCtz?=
 =?utf-8?B?QlRadDN1bFN2Zk9ocWU3QnVyQmlSdVV2S3ZraVJzWTZ3aW5zMGhjRWZwSm5o?=
 =?utf-8?B?MFAvYU0rTk5qSkdRNnRQeTJXYTAyem5UMGJjSTFvd1QyZUNQNXVnbUpNZnFa?=
 =?utf-8?B?Q0I4OUo1S2pEVVdMT0RuTUhIN0JIUWsyekNETHg4NjRHSkZMSWp2UHpPenZB?=
 =?utf-8?B?NDNrY1RoNjdFSHRveWxpbmtpYmVLOUxNUm8vWWVUcEJ0Z21BTFJmMmZGekZ4?=
 =?utf-8?B?VmlBWUIxclYwTllQUmF3QWptMXdyVVN4a1VvdFZKeVJ2Y0J4a01FVllLRWdN?=
 =?utf-8?B?NXM5TU4wZkZGcG0zZ2JPTUk4Y29mZWdITVRYeVdWVFkvLzZaMERuZ0hXb3NR?=
 =?utf-8?B?dFdtZlZIOEtxcDFTTzRmUXYyTTJRbVZxM0E2bW1HZThHZEVVY1dFNGVmaWpt?=
 =?utf-8?B?R1BtUFkxcUdlcnRzQithcUJsVXRYWnNpU3JjTks3MTdDMjBUVjdVZ1JndGgx?=
 =?utf-8?B?cmNEQkE0TVUrSURHR0NpMGVJZzF6Q0ZES3M1TGpoZDh1dGpUQWxoVFQ3bk1I?=
 =?utf-8?B?cTZ5OEhlWlJ1dUsyMFNHMUZzMTRSVDlIWWdJQkt2c2x6T0tSODRvbjJ4dCtP?=
 =?utf-8?B?ZmN6NEY5ZFVISlIxS3pkZXFJS21tYnRHOFJPSkdEcllWMnZKamxDenJDNFFP?=
 =?utf-8?B?bU1LVE9EUjhWZmswQ0ZCQjM3QytJYU9lTGpBY1Z5U0cybDlqdEdhK3RSVUZI?=
 =?utf-8?B?dmphN05wU3dYVFdXV0IwZDhnY2FZdDFSZVpjYUFIN1V0emk0ZmNyeDVlUDNn?=
 =?utf-8?B?OUJKZUk1b2tQTkRzdHRXSExGckdVUS9jMEFQWUxaZE41WW5NSVV4eUFOZ2ZN?=
 =?utf-8?B?WUphS2k4ODg2SGNBRWRWMU16QzdYckszcStJM1JWTDhXN1lBNStXdWRiWUJ2?=
 =?utf-8?B?Sm5UOVo0Vmd4cWIxUkl0bWFpTGpqbnJ5cXFmak1kcU1iWUZoVDlJWjZEQmJw?=
 =?utf-8?B?VzVRV0RjR3cyaTRXNVM0QVFLNnhRNk01cVoyZ0w5a0RPeFdFV1FwaVFUZUg1?=
 =?utf-8?B?emRNUS9FY3QxWE9vaS9yQW9GaVgwbHlPdXZNVkFzbGFyeDhrU2JrYVJZN1kz?=
 =?utf-8?B?ZDBEVFdUa1I0eWcvSjRQdk5YUjJjT0drWUsvS2U1K2ZaeUF3TVJzM0psaWdB?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 813bb30c-cd7a-4613-d7f8-08dbf2251848
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:13.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL2BVOSKUSJkxlK0KQ1M2f/iaAWZCvs61jG2Mxo1JPz81bUQmq0icLJqFt7M1GmSdhW7yErh95gi/b9qbYuYmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current drm-xe-next doesn't have any drm/scheduler patch that is not
already accepted in drm-misc-next. This completed this goal with
the consensus of how the drm/scheduler fits to the fw scheduling and
the relationship between drm_gpu_scheduler and drm_sched_entity.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2a5132327617..9f3afab6c06a 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -70,24 +70,6 @@ When the time comes for Xe, the protection will be lifted on Xe and kept in i915
 Xe – Pre-Merge Goals - Work-in-Progress
 =======================================
 
-Drm_scheduler
--------------
-Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
-drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
-resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
-not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
-drm_sched_entity.
-
-Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
-some consensus needs to be reached between Xe and other community drivers that
-could also benefit from this work, for coupling FW based/assisted submission such
-as the ARM’s new Mali GPU driver, and others.
-
-As a key measurable result, the patch series introducing Xe itself shall not
-depend on any other patch touching drm_scheduler itself that was not yet merged
-through drm-misc. This, by itself, already includes the reach of an agreement for
-uniform 1 to 1 relationship implementation / usage across drivers.
-
 ASYNC VM_BIND
 -------------
 Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
@@ -169,6 +151,24 @@ Xe – uAPI high level overview
 Xe – Pre-Merge Goals - Completed
 ================================
 
+Drm_scheduler
+-------------
+Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
+drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
+resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
+not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
+drm_sched_entity.
+
+Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
+some consensus needs to be reached between Xe and other community drivers that
+could also benefit from this work, for coupling FW based/assisted submission such
+as the ARM’s new Mali GPU driver, and others.
+
+As a key measurable result, the patch series introducing Xe itself shall not
+depend on any other patch touching drm_scheduler itself that was not yet merged
+through drm-misc. This, by itself, already includes the reach of an agreement for
+uniform 1 to 1 relationship implementation / usage across drivers.
+
 Long running compute: minimal data structure/scaffolding
 --------------------------------------------------------
 The generic scheduler code needs to include the handling of endless compute
-- 
2.43.0

