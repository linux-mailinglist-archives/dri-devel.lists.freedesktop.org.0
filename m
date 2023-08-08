Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27063774DEB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEB710E108;
	Tue,  8 Aug 2023 22:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66910E104;
 Tue,  8 Aug 2023 22:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691532219; x=1723068219;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4vgmDzRJjIi7/xBggizijsYKqBp3hdQfD2GNl/OvEjg=;
 b=HY5kN9prgmJVMfZ5+fiZeBeFm+4ObWrNVrihhZWUNhk55IAJ17VzwgPd
 umiGjUQdZXA7KaJHAGFq47/2koP5ucyDJzg1TTRppIGAZ/1gRyrIC8Ha3
 BjULFEqqj7yp7BVdJ+O5a99VG00Hki0YOk4TIkqCtKhQ3HTKQgTd8iTDv
 Jf7ZY6sYgg/Q4Bvd3hAqcmpn00546h0LpBd5gotVgDneFjDsVJ70XdU0z
 vXoCMydSObbXrlBESQhhL7zY0SvYc9DS6qqE0pymj8k5JOKmAn1Vsy3ws
 EjVfYAgg2uhxgcPA47tbPWj9ZTQeT60N/CNz2Ds42uANFBfVpeJLoO3S6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361086221"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="361086221"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 15:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855271846"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="855271846"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2023 15:03:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:03:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 15:03:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 15:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBHCMTyKRbarxi01Tu5E0QY4sSYNXakMOC+87UjzfQ4IMIPU2PO+a2gIRqP9Bsi9j21thAqP1QomCapLqtMzCYhK4LZzM59zMsBMn0VybblHTaGuRS58/2XsV7Dp1US76fKbigLPmD6nZm4pRl4FN1LwP130GtP3IxsqkuGPb+rWCH7zPHx+04AV4pbhynSpIbzQXdGiLM7i65ZqH0GUp85W5ZeEjV8B6O8N8yTm0sk4zahYMilK1o0ZyUmafaUFVEogpvd0tR6UdF3ePaF7YXxyr93IPyHfkfvSJv/kf87Spb31KutfDhWgkZx4+CWdd9gd1LxKAhSZqjQ2ynP+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFz2q7gzI48287YkN6t073Y1TcTDx/4x893nKgEM4kY=;
 b=mFccb/SAW10SE6zdc0exuZOTM3MnS8rSiCIrmDrWEPxs4vs1cDdGQAfHdGng4xxVQUMPokKXe5Rbc06ezy23xD1pa2mQG9WCWn9TKM1DEDR8l/t5P9sTjmE6LzmlvFIFV4i+Sh+u0T3Kk+OF1zKxZujV0eUNAfxRiLl5S/SAF9QUt5cacBndWXXLw+HVNxCsKs+i/nYWf6W9VgPhQEI2AgZDhaYLCfS+z3kkzD/vUkoRVc6XZ0TDldsCBp5oxFEKtzH//uQp41s5N0Ojh8oUKJGs9Ff3NIJobiuiAMkG0MDnWMKAGxogyKBV+1Pf/UgMS3myLAyrc++GF9UBYhyUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 22:03:34 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 22:03:34 +0000
Message-ID: <9e4c9ea2-f556-d4f1-3667-fd0200e8fc7c@intel.com>
Date: Tue, 8 Aug 2023 18:03:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH v4] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230727201323.62637-1-zhanjun.dong@intel.com>
 <ZMufS2mRhHhm+yNd@ashyti-mobl2.lan>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ZMufS2mRhHhm+yNd@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To SN6PR11MB2622.namprd11.prod.outlook.com
 (2603:10b6:805:57::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2622:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef6a9b3-836d-41c4-8596-08db985b4f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzVZe/zPQRBINapyFSa39wPtjFpxee2IrbVQYDzKf871i+mx4j7MOY1jvwsEIBQTjwL/ShOEMiev5eihXkHVERADEmzhlwgwBY04W0xaC3uyeabzBV0Xqgl+3wEQRuLudfhOLVOX5h++vm0Lmwwz6KZqFLYxUBRT/UntHaZK97Pelh/AE7bZvUBILgf6d6IeswW8QVxm3jjHcBR3G5uWe14PGr0xJpWDSvPQmUCyzeh4QRUi5HMaiGsISkWCwIBAucMcDcXCnMmpjFYZMYvSZXXN0N/Q2kXwg9CcnwOio7A/RMlD79VJzEb+rbQ+nQkIy/t6W7txcQzUnGuKUROyXV1+P/AUf3TsWZpI48BVWfOCoJi8H+rfbsmMn7peE6lhlVxsJIzgUgrs0g2CWs6HRbPJP06FUlS3Q8tArbUMoIv/ALf5LRtSmqa8OkXXwy8t8AORWsYDmPeBC1V+Bynhc1lBcHcp7mfU/UB1cd52xKZVdQIn3C8FszWx90BNFKmzUqFleUzVotiZAtAArwGmJKpz1V8mq5UFe2uyCustPcAg53O+x7GW5MknPWYxpbTRiJArdCT0g6dzE8eFNKavLOaNhnzzaLt7wq833GoRd1aPOATWgAcg9uYy93eiOeGi528U/+iGcgBfhzLkpc8q/TDXwDmYXldzjy5Jogn2eHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(1800799003)(186006)(451199021)(966005)(31686004)(478600001)(6512007)(82960400001)(86362001)(6486002)(26005)(66946007)(6916009)(66476007)(6506007)(53546011)(66556008)(4326008)(38100700002)(6666004)(316002)(2616005)(41300700001)(2906002)(83380400001)(31696002)(36756003)(5660300002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdtNVlqSEZDeVpyTFlPNzNhNGwvOThlbmhBKzg0ZVJGaW5pZ2tXMUc5R3FI?=
 =?utf-8?B?UjZLeXJtN0llN09iN0krNVVKQTAxSTFyQUhnbnEvN1o2c0VCVjkxR2xKNmpT?=
 =?utf-8?B?NFBRajdsRkpkTXF1THhySFF0eWhzZ1dDeUFtbzFxbkUxL1dWMnRiNUpMb1JF?=
 =?utf-8?B?MnBKY3hTUUtTRXRsL0xuRlNqRy9GRk9GRUdRU1RtRXo3emJUR3lYQ05BMTlq?=
 =?utf-8?B?cnJVM3h3UmJ1VXZHWkdFUFNPSXFaekp3djc5K0FKQmlLSzhZY1M5Vmt2WHRl?=
 =?utf-8?B?bVBBTm51TWhvS1NlTjNOK0xONEk5QlRYT0NyZ0FHVTlnMkxyOFVlQUhwNmpZ?=
 =?utf-8?B?SnJxK1VtM2dNdEdPU3ZyZTRLQjFsd1B0bTlNMDZ3Mk9TZXo4eHJUMGY1RURH?=
 =?utf-8?B?UG1aeGhweXdwOENBZnE2Ky9wN0dEcFQ0bkdxZlhheXB1QlN4b0ZNNU9XdjlI?=
 =?utf-8?B?UXBGT0dJUHg3dTNKbElnRnBGK1JoelNyWG80clc1NGFXa3Y1dTBrTExBWG55?=
 =?utf-8?B?WG5xck9nRjNWS2J4QWhFcWlQaDdjMG5NV0EraE9ndWR1QjI4d2FYVXlYLzBk?=
 =?utf-8?B?S1h1OWlCRXE2M1JGUmlFVzFyOXBvVkRkZFREaFBqUGt6aVB6SkU2eTh2M3Ax?=
 =?utf-8?B?OUZ5Q3BCS3UydVJKOEhIRW1MdlFwYUJZdkxCUGlVcUtaOStWZEhCTUQ0MzVw?=
 =?utf-8?B?NGQyWnBxZjFHVWs5Yk93TzU2QlhVcjlDaVlFd0dtN09kc2hhaXZMOTUwRWVI?=
 =?utf-8?B?R0hpQlZ0Mm42MGJrTHNQMnhCNWN1dDZCYitMUWs0MjZBTUVDVUNUWDZ5bjEy?=
 =?utf-8?B?OXQ5MXJ4ZnQwR0MwdTY1dzdtOHY5eXlUZDZPVjJLcFFOZXdZSlB6MXZDbzNS?=
 =?utf-8?B?OC95T3EzZFhhUDV6RC9pK0Z4MzgxQWFONnd6RTJNNnhEdzZ4Znd6OUFBU2N0?=
 =?utf-8?B?Um9YT0tQU1JMbmFselcveGhsdElYZ2J3M0dJTW82Q2tIamhaY3kyK0w0bjlD?=
 =?utf-8?B?MG1OVEt0Z1BHd0l0K1htQ0gxUEc4MDdLbGYzdzNOdlZsNW1nVSt6Z2FHb1Zj?=
 =?utf-8?B?VS9UcXV3TnMrWGR1RmRTcnE0TFB3WjNIZEVMOElWT3A3VGRSVHd4L0hHL0VM?=
 =?utf-8?B?VElqWVVYeTZtSDJhcXdVZmEyR2hldlJWZjBmeGZnRzBDK1lLZTdoZ3FIVHAy?=
 =?utf-8?B?T002UFhYaFZpaWJxcWpBdGwxMmVVc2x1VWlRRENuMmU3NWRmR1FwT3FPNFdG?=
 =?utf-8?B?ckU2UXlZN0R2bjVXeGRMZ1JJY0VQTEZaNDlMMnkzS3RmRzlvN2RrM0tDM1RT?=
 =?utf-8?B?RE12RFI5Y3BpaHkzL3BKL2xTK2lmMWJGUmtJYjVhYXBONUYydU9ZaG1PS1dB?=
 =?utf-8?B?YzlxNk53L21IaEl0ZTNYb3AyRFhiMG1tYmhuUkh1em1Bd0lkSXoxWXQrWWxx?=
 =?utf-8?B?U2JYVThZTGs4alo2dDM3Qi83MitDbDFHWVQwRjhoU1N0enMxTFJzcitaTEpP?=
 =?utf-8?B?N1lZZ3JMaGxPN3B2TmdHZzJlcitXNXp4NlFJZk5aMTVHL0E3ZG5lSkVpRzNT?=
 =?utf-8?B?VDBPQmpONFBURkZBUDlyTkpXSTV0bkF2d2VCWjlrMUIxU1ROcjE5eFdTbXAw?=
 =?utf-8?B?MjI3NWVrY2hpRk5tT1MyQWRWVXhMaGJndTQvR3p6WWFMb1hnNi9VdHBRR3Iy?=
 =?utf-8?B?d0luY0l0NlRDaVcvTWgzOXBZckVlKzNvaDNVQUJwUW1ld0FNNVpCWjdhOXRm?=
 =?utf-8?B?dWM3VkkzVVY1TnF4Nk1VbTVXTURHcWpBSFRkdlNPUmxvaDV5WDJRYjhlenor?=
 =?utf-8?B?ajdWVXBVeDVyNHRlRkExem5tK21xT2Z5VUd1RDI4RXRqL1lRVmZobXZ6NGlJ?=
 =?utf-8?B?WmloTXIvaFhYbXJwbFVibHZGTmFtMHppWVRLdTg2TkVKUzNGWFgvUm1Objhw?=
 =?utf-8?B?Um9xc2RQeW5wTG1jaHh6elZ1cUhSMXRzTzVxTDNmdzJmTXJ2aWdVZnZGZEVz?=
 =?utf-8?B?OUVKY2VSeW0xNTdjbEN0VStYanN0WkY4M3Vwb0dJNy9BZUsvcWVCLzRvVkxF?=
 =?utf-8?B?Y3B3TXRJODV0dVFENkJlYzFFY3pkWXRlZ0xZbEtlZ2JEa2JsVGtrYXJMY0JW?=
 =?utf-8?Q?Q8xxFYUYvTwaKKlrHFE6qNWgx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef6a9b3-836d-41c4-8596-08db985b4f49
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:03:34.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOVRMkrWne/f+UmtFD5kJuLznrDTQAIw51ZE5UF7mEO5BGcCGaO7OcalmEmJ5Ap8e1xC+iRPQjDYRvifxkXHgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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
Cc: intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,


On 2023-08-03 8:36 a.m., Andi Shyti wrote:
> Hi Zhanjun,
> 
> On Thu, Jul 27, 2023 at 01:13:23PM -0700, Zhanjun Dong wrote:
>> This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
>> Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.
> 
> Next time, please wrap the sentences to 65 characters (standing
> to the e-mail netiquette, RFC1855[1]) or 70-75 characters
> (standing to the kernel guidelines[2]).
> 
> [1] https://www.ietf.org/rfc/rfc1855.txt
>      chapter "2.1.1 For mail", page 3
> [2] https://docs.kernel.org/process/submitting-patches.html
>      chapter "The canonical patch format"
> 

Thanks, will be fixed in next revision.

>> WARNING: possible circular locking dependency detected
>> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
>> ------------------------------------------------------
>> kms_pipe_crc_ba/6415 is trying to acquire lock:
>> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
>>
>> but task is already holding lock:
>> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>>          lock_acquire+0xd8/0x2d0
>>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>>          intel_gt_init_reset+0x65/0x80 [i915]
>>          intel_gt_common_init_early+0xe1/0x170 [i915]
>>          intel_root_gt_init_early+0x48/0x60 [i915]
>>          i915_driver_probe+0x671/0xcb0 [i915]
>>          i915_pci_probe+0xdc/0x210 [i915]
>>          pci_device_probe+0x95/0x120
>>          really_probe+0x164/0x3c0
>>          __driver_probe_device+0x73/0x160
>>          driver_probe_device+0x19/0xa0
>>          __driver_attach+0xb6/0x180
>>          bus_for_each_dev+0x77/0xd0
>>          bus_add_driver+0x114/0x210
>>          driver_register+0x5b/0x110
>>          __pfx_vgem_open+0x3/0x10 [vgem]
>>          do_one_initcall+0x57/0x270
>>          do_init_module+0x5f/0x220
>>          load_module+0x1ca4/0x1f00
>>          __do_sys_finit_module+0xb4/0x130
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> -> #2 (fs_reclaim){+.+.}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          fs_reclaim_acquire+0xac/0xe0
>>          kmem_cache_alloc+0x32/0x260
>>          i915_vma_instance+0xb2/0xc60 [i915]
>>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>>          vm_fault_gtt+0x22d/0xf60 [i915]
>>          __do_fault+0x2f/0x1d0
>>          do_pte_missing+0x4a/0xd20
>>          __handle_mm_fault+0x5b0/0x790
>>          handle_mm_fault+0xa2/0x230
>>          do_user_addr_fault+0x3ea/0xa10
>>          exc_page_fault+0x68/0x1a0
>>          asm_exc_page_fault+0x26/0x30
>>
>> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          _intel_gt_reset_lock+0x57/0x330 [i915]
>>          guc_timestamp_ping+0x35/0x130 [i915]
>>          process_one_work+0x250/0x510
>>          worker_thread+0x4f/0x3a0
>>          kthread+0xff/0x130
>>          ret_from_fork+0x29/0x50
>>
>> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>>          check_prev_add+0x90/0xc60
>>          __lock_acquire+0x1998/0x2590
>>          lock_acquire+0xd8/0x2d0
>>          __flush_work+0x74/0x530
>>          __cancel_work_timer+0x14f/0x1f0
>>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>>          reset_prepare+0x21/0x60 [i915]
>>          intel_gt_reset+0x1dd/0x470 [i915]
>>          intel_gt_reset_global+0xfb/0x170 [i915]
>>          intel_gt_handle_error+0x368/0x420 [i915]
>>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>>          i915_wedged_set+0x29/0x40 [i915]
>>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>>          full_proxy_write+0x52/0x80
>>          vfs_write+0xc5/0x4f0
>>          ksys_write+0x64/0xe0
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> other info that might help us debug this:
>>   Chain exists of:
>>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>>    Possible unsafe locking scenario:
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(&gt->reset.mutex);
>>                                  lock(fs_reclaim);
>>                                  lock(&gt->reset.mutex);
>>     lock((work_completion)(&(&guc->timestamp.work)->work));
>>
>>   *** DEADLOCK ***
>>   3 locks held by kms_pipe_crc_ba/6415:
>>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> v2: Add sync flag to guc_cancel_busyness_worker to ensure reset path calls asynchronous cancel.
>> v3: Add sync flag to intel_guc_submission_disable to ensure reset path calls asynchronous cancel.
>> v4: Set to always sync from __uc_fini_hw path.
> 
> Thanks for taking care of this, there was a period we could see
> this splatter everywhere :)
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h   |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c           |  4 ++--
>>   3 files changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index a0e3ef1c65d2..ef4300246ce1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1357,9 +1357,12 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>>   	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
>>   }
>>   
>> -static void guc_cancel_busyness_worker(struct intel_guc *guc)
>> +static void guc_cancel_busyness_worker(struct intel_guc *guc, bool sync)
>>   {
>> -	cancel_delayed_work_sync(&guc->timestamp.work);
>> +	if (sync)
>> +		cancel_delayed_work_sync(&guc->timestamp.work);
>> +	else
>> +		cancel_delayed_work(&guc->timestamp.work);
> 
> The guc_cancel_busyness_worker() wrapper is made to make life
> simpler, in oder not to force the caller to find
> guc->timestamp.work. But if we add a true/false value, then we
> make it again difficult because we need to go and check what they
> mean, so that we decrease readability.
> 
> I would rather prefer something like:
> 
> 	static void guc_cancel_busyness_worker_sync(struct intel_guc *guc)
> 	{
> 		cancel_delayed_work_sync(&guc->timestamp.work);
> 	}
> 
> 	static void guc_cancel_busyness_worker(struct intel_guc *guc)
> 	{
> 		cancel_delayed_work(&guc->timestamp.work);
> 	}
> 
> We could perhaps improve this with defines or inlines, but I like
> this way more.
> 
> What do you think?
> 
> Andi

I like this idea, will change it that way in next revision.

Regards,
Zhanjun
> 
>>   }
>>   
>>   static void __reset_guc_busyness_stats(struct intel_guc *guc)
>> @@ -1370,7 +1373,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
>>   	unsigned long flags;
>>   	ktime_t unused;
>>   
>> -	guc_cancel_busyness_worker(guc);
>> +	guc_cancel_busyness_worker(guc, false);
>>   
>>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>>   
>> @@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
>>   
>>   static void guc_fini_engine_stats(struct intel_guc *guc)
>>   {
>> -	guc_cancel_busyness_worker(guc);
>> +	guc_cancel_busyness_worker(guc, true);
>>   }
>>   
>>   void intel_guc_busyness_park(struct intel_gt *gt)
>> @@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>>   	 * and causes an unclaimed register access warning. Cancel the worker
>>   	 * synchronously here.
>>   	 */
>> -	guc_cancel_busyness_worker(guc);
>> +	guc_cancel_busyness_worker(guc, true);
>>   
>>   	/*
>>   	 * Before parking, we should sample engine busyness stats if we need to.
>> @@ -4501,9 +4504,9 @@ int intel_guc_submission_enable(struct intel_guc *guc)
>>   }
>>   
>>   /* Note: By the time we're here, GuC may have already been reset */
>> -void intel_guc_submission_disable(struct intel_guc *guc)
>> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync)
>>   {
>> -	guc_cancel_busyness_worker(guc);
>> +	guc_cancel_busyness_worker(guc, sync);
>>   
>>   	/* Semaphore interrupt disable and route to host */
>>   	guc_route_semaphores(guc, false);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> index c57b29cdb1a6..a77de0d6ed58 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> @@ -16,7 +16,7 @@ struct intel_engine_cs;
>>   void intel_guc_submission_init_early(struct intel_guc *guc);
>>   int intel_guc_submission_init(struct intel_guc *guc);
>>   int intel_guc_submission_enable(struct intel_guc *guc);
>> -void intel_guc_submission_disable(struct intel_guc *guc);
>> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync);
>>   void intel_guc_submission_fini(struct intel_guc *guc);
>>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>>   void intel_guc_preempt_work_destroy(struct intel_guc *guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 18250fb64bd8..5b76f0d4d2a6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -566,7 +566,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   	 * We've failed to load the firmware :(
>>   	 */
>>   err_submission:
>> -	intel_guc_submission_disable(guc);
>> +	intel_guc_submission_disable(guc, true);
>>   err_log_capture:
>>   	__uc_capture_load_err_log(uc);
>>   err_rps:
>> @@ -597,7 +597,7 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>   		return;
>>   
>>   	if (intel_uc_uses_guc_submission(uc))
>> -		intel_guc_submission_disable(guc);
>> +		intel_guc_submission_disable(guc, true);
>>   
>>   	__uc_sanitize(uc);
>>   }
>> -- 
>> 2.34.1
