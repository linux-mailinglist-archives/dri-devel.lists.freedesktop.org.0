Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732266E80AF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A42510EA44;
	Wed, 19 Apr 2023 17:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E79D10E1D2;
 Wed, 19 Apr 2023 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681927037; x=1713463037;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=f8/nfVdvP4ClyT/k1TwiLHXxVJFhZZaXS4mH/ZZ68U8=;
 b=HfORQcoihyAr1RkG/4LfTCZsb2KcDZd7NsnwxfrPXmCeR+NrdIy3Zhtm
 54irHHkYrJ7XtDiSaxvYVC3dSXEgpJnPrSFyuR8zohncy2eu3h7Gl0bp4
 ndke9cFSSvqI4e28TPUw+PoAP8SssYHep/Vljr1l0pcecAnhknLEUUSGS
 7bcfsb1NDiKWftBKZby5/0z1DoQSTXY5y0q4DKTU9GkLK1xqyJe51Copm
 ej+bEY1ifu5+bZ+ejerVk9QnI3QylAtINN+iNuY1D2mwwn8eY67sORBBF
 pCUXTjpQH4AFmh59/eeS4DCbojwg9ctMMSfYTlw34aUXxlBpX67k7tQ1n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345519858"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="345519858"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="756192632"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="756192632"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2023 10:57:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:57:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoNaXZIpsxbW2B07CxADPHAvjcDbp6DvUVAzVlTe483YkPmnBYJxWg4mKw+ZndURNuUVAFMPSNkYf9tb9pOAGSSgLZPsrxi2PIJTUNegCJGE6PW6GCVagcha1z0uMPQlOA9y63mNJtvcXU4/xlskNPEGBrWlevL0YXmLPP2iPNPIRU5hltnHAupI1zOXzrpBRd/R0fyVvL3lZfuoq8Zcq77jYRxbwns2F3NuuMEJta81HrDjzazVXvswbJZ4QCJ2lTJlyvGlAkHj6iWkIPYoplsqnqpvUqh14TU2jkO/UgjCvzWBtocwKu/2yh4DmRPjw9usbO/mi+RyQgJilDU0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIfRB8C7nexqOBgHPddZNEUlOAavYZotyg17KsdxhBA=;
 b=ADPhvaNsVdI3T60AtYIzo0BeXC4Arrrp7T1bU5gXfa19UKtyChpYNQHNjTlDu1DqAFU06yTaC6edu7RvwjU/iNyHLbALnzKDPjX8tDG6MOFZngPpEFGZe2vUg4glDyS67+e3zVt0Icgn2+3uBQmBisa7jFroWcVxFppJdlkgyZH1EpENbHSD+esYuLnxMuiWRIn/o9d6xdDgK9YkHvyzQUONa/F4j7zU+bIfYrtjJNTgXWPLbJRHBCV9jHInFQoRq4r24m7vfLLgVV6I5W6RfqrR+wUpwCFLa3l4/wstTFsqh3S18RJcr5CcuzmdVpYO2xbLWJa+wh/V+thbAEdulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 17:57:11 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 17:57:11 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 0/3] drm/xe: switch to using drm_exec
Date: Wed, 19 Apr 2023 19:56:47 +0200
Message-ID: <20230419175650.3259121-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: bc61d57c-4890-440c-bd59-08db40ff7fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufpzyGI1koBV6hPFrxic/DoWXPExYCveEor3nNRri1+Cs7GQSGjYUsDmZysB7tDh255Gku5hnfg0j1sXtgWB8hvRYrRUc1BXX7QS6+BEfHABDjwwvHH5vLWUKAzXTuhhQ+E5TsWWDFN9L7B1GFwQShj2eyN7gpC4Bt/z6tNh8IUNWXzlNNPfwE7Mw7zkrB9L1p1pQmWb1N9AHXOhoZTwv7ou+t6H1rJ+aXLMxhdmGEd3kd2Oq2QNsozSQTgtEzmbXRH1GkDGfNXPMjzaXU3PhfNoWqfofSfoofFZaS90yX/FvGDqemfG7ybWE+YzhN9r4ftKyN+SNY0K1cUwBOtGKzPRoGjrTakByUoCr9JGdZreYk9AkxTWlCwLJ0zMLgkR9YMy0ox9QhRUOjVZ8wTPo7l1bu/MFROsVxevZOYhe3ytmHwyzydLH0pKQIqaPdMvjct7cTZOJF9VunuSNuIOVaTpCnfCjPeT0xkA0jj7u8cwyMc9n2aUsMiICt6AU5V03mMRM3Bp10G7/JLB3CB+ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(36756003)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(966005)(6486002)(41300700001)(6666004)(478600001)(5660300002)(8676002)(8936002)(2906002)(44832011)(86362001)(38100700002)(2616005)(107886003)(6506007)(1076003)(26005)(66574015)(83380400001)(82960400001)(186003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThUaU9nMkpOSU5aejU2STJWRDFyaVR1QURFaDhrbHZQRmR6MElXeWpISEFr?=
 =?utf-8?B?M2x4TVBSbFk0V0tRSlRVQkNpK3RGS255OWtOcEYzekFvb3BpQ015bjJ5MUVs?=
 =?utf-8?B?WWxjVzVBWXdXZG9BL2djc1plRDdkNzBiaFZManNpMjlEaXhBK3lSZ0ZoMmpG?=
 =?utf-8?B?Z2piY2JUYXBLcVNzLzc1eVcvbUdDQnVQWHY0S2lBcGhkZkV1RWNucFMvM2c4?=
 =?utf-8?B?TEIrbGpSQXQ0Zm9QTmpoZGo0dFg3SXBjcTdDa2hzRWtRaUFnS211VnVHS25Q?=
 =?utf-8?B?M0xhK2haK1orK25UZkROMmc1a2JhQnBNMkhXYmwzb2hSeXp5UzJ5MUFXNmY3?=
 =?utf-8?B?Nko2RnlJeXJmRkhZSlZmVEpnYXJBYUNuQVpVS1FlbnhZWjBqbklBTFI0RTFB?=
 =?utf-8?B?cmkxSHo5VW00L1hrazkxZ2VqT1I4L0hQdmtNM1pWUUNJSUhCcUNDMjAwVkdQ?=
 =?utf-8?B?VUw1RXZEc2pPdGJVT2RIemE2cTkxaVpidWF2MGVCbDVtUitidDVleGttbGhj?=
 =?utf-8?B?NEt5V3FydWFlSk5ONU5pTW96N0t0VFVGa01IdFhQaU9aZEhjeVRYZ3RFTGtS?=
 =?utf-8?B?aEFBSFUzSzQyblRmVWN1VmViejZLcHZxWTFrZk0rdWIvMEdXeVpoNi9zUkJE?=
 =?utf-8?B?OExXdDdZSDdsWnk0K01RM3NTUHZHMnBQZU5QS1Q1U0svdUFsOE9sRkcrdnlO?=
 =?utf-8?B?aldPNVBKbUZ5OWRLUFFxWGFrN3VLVE90cFcrc2F2cHZ6K3g1bnlRY2lHc2dG?=
 =?utf-8?B?d1h2TU9EdE9RY29TMnUwbnd3QVFWQnExZ3pvTHJjL3lCMVlZOW85REdHMVU3?=
 =?utf-8?B?OUJRM1lNNjdEKytiZFdTWTFWTjhON3M0bmVPdm9NTGpDUWF4Zkdnb1RNQ0JN?=
 =?utf-8?B?ODNFcFdsbm9XZHEydTV5dmJqenYrbnFJZDJlaVdpVHUzR1pBUFNWaCsyVlR4?=
 =?utf-8?B?WGRHZ08zOHJJcVRaVEhOZ0hLTmNQUy9WWFk5SlMrRkorTlhWaE4wa1Rtd3M3?=
 =?utf-8?B?WlJJeEx1a2c5NFJuTk9ibmorZ0FzeC82bUsrNkc3TTlUVWpIa1lZZjFmOWkr?=
 =?utf-8?B?UHRvbHZLTk1tdHlRYVVBVjl1bmdYUEhHaUgvZ1ZEV2FuR0NpVTBDR3M2a3N6?=
 =?utf-8?B?MzZvVFY1VVhJQUJFVU5PVEdOcmxhQW1iTUNMdGMwMjh6ejc2Vm41eVNkVHl3?=
 =?utf-8?B?RERHUHFmWTNMS292YTFBRXZHQklneklLeXd6N0RVOGQzZzV2Z3BrdFlWdjRB?=
 =?utf-8?B?eTZScUR3dWFtNk1EWnFQQTZ6RG50UWc3Ty9JNUtmRTBDSEUzaTUzQzZHUmFZ?=
 =?utf-8?B?akFhYjhpY1J1K0VkNStmSjhxUWVGZkxXbmZKKzNlLzZkTVdvOTVHc2Ziam84?=
 =?utf-8?B?UDd2bXJqUGJOeTBWTUlTR3BLS1FpSlBkYlRKNEk0cVdva2F3ZWtvTkpFUVZN?=
 =?utf-8?B?VTM0cjNaVXdvaEdvZnYzM2RId00yN0hxYXpsQUl2bElQRFhMa242eW0venEv?=
 =?utf-8?B?NUFLMFJML3h6ZzlSWGpYK3NMWHJRSkp4cnM5RmhsRExUVlZoYnlUWjNUelpI?=
 =?utf-8?B?b3F6elF1QWZ1OThPV2hLMFptSHNPdlRGczZnWm1uaFhVVHRJNjdUby9uQnBu?=
 =?utf-8?B?SnVRNFA2SjNrQ2ZhVEFCVDNQS0lTcWN0Q2g5VmlsemlSdkUrbktWSW1sWWVi?=
 =?utf-8?B?U3JzeTl6RlVSaE1UY2xaZ3pxaVgyMTVVcXJSRjVsaU03Zko1ZzY1OVVlQlNB?=
 =?utf-8?B?R3NFWEd5SUZpZFhXV21XTnVsRTRpM1pZMDZSZitvZmNwL3k0UWZacmZwdHZl?=
 =?utf-8?B?RmVIZmhuZVd5dDg1VWFnRXhEZ1Nyazg0Rk1hL25vNUNNTmlKNjBEbXRWTEoz?=
 =?utf-8?B?VHVZdm94aXBTVzVmRXp0KzA1ZVkzS053MldNNDIvYXpITzg3dndLNjZaR0tU?=
 =?utf-8?B?OE5JdVNZUmRxYTNpOFB5Mit6cnVIck1aUHZGZmhPeThRRWpuaGhTMXNXUVZK?=
 =?utf-8?B?YVpFTXlwWmtsNkVQOFNBQmxlZXp6VjZJaGhMNnVoSkVTRlBQVTFyZTBDWUpp?=
 =?utf-8?B?TEdNSEozRDN4bXZiNktHbDNDc0dJbHBLV0pxQ3d6RWh1VTIwdVBoVlpXNnFl?=
 =?utf-8?B?VmFlanJrUHdzazI4VnhXZHZydFV3K2syS3ljYWN2ck1iOUZsQU1lc3hlUjF6?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc61d57c-4890-440c-bd59-08db40ff7fe6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:57:11.1873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFW6NR6pFxVEZK8sEuB6uUoQk1fmWj+0PqGgWnc1V74nvnk+jBt6VKVC0kCxYFHBcQw3AN7IWp2fSQnnXhTGXjXOOZZFt8X4qiod27QgWRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
Cc: matthew.brost@intel.com, Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, dakr@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes Xe use the new drm_exec helpers provided by this series,
which is not merged yet:
https://patchwork.freedesktop.org/series/114464/

with this fix:
https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4

v3 includes code shared by Matthew Brost.

v2: add a first patch with squashed dependencies (Lucas De Marchi)
v3:
  - remove "RFC"
  - add dependencies as original patches
  - move drm_exec calls to xe_vm_lock_dma_resv/xe_vm_unlock_dma_resv,
    use new helper functions xe_vm_bo_lock/xe_vm_bo_unlock, fixes in
    drm_exec calls (Matthew Brost)

Christian König (1):
  drm: execution context for GEM buffers v3

Danilo Krummrich (1):
  drm_exec: fix double dma_resv unlock

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 Documentation/gpu/drm-mm.rst         |  12 ++
 drivers/gpu/drm/Kconfig              |   6 +
 drivers/gpu/drm/Makefile             |   2 +
 drivers/gpu/drm/drm_exec.c           | 248 +++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |  17 +-
 drivers/gpu/drm/xe/xe_bo.c           |  29 +--
 drivers/gpu/drm/xe/xe_bo.h           |   6 +-
 drivers/gpu/drm/xe/xe_bo_evict.c     |  24 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  30 +--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  56 +-----
 drivers/gpu/drm/xe/xe_vm.c           | 287 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h           |  29 +--
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  36 ++--
 include/drm/drm_exec.h               | 115 +++++++++++
 16 files changed, 615 insertions(+), 284 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

-- 
2.25.1

