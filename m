Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F6726763
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 19:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E67610E531;
	Wed,  7 Jun 2023 17:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57D10E528;
 Wed,  7 Jun 2023 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686159059; x=1717695059;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rxuYTvmozKDW3+g/QzInA2LaCFbmD/goJlE8lzpBwNA=;
 b=FX5P7RDJ0xlo/H+nedM1PnjTvYrBB5byfLrx91016kHMXlKiytMy8Ydu
 j1GUQPIVA7a7+GDaCXgVG1Wj7pVC+qo3YQr+VKs+JoR+Yp77rQ3vZKW0e
 naLDiL+YvTM+2YGl4VwcLkKhwmvNgHEYmGMgmtr9GM05oPG72isFwpYZC
 O2Q6MUq8tJqSQD6WIX65HLf1il41ctSL0qJYYOmTXJJE3jQaIK3a75SEj
 wc25jUSPt77G9n0sSz84e8k3qnn7ZMSg/7IaI1MQMub9iNkN+7B0/IMad
 k+pXl8eF5XYt55PX6iSRE/+Zsica4s+x1hERDFPc/0QbvjRZa1r8Wjh7t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443422650"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="443422650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="833817135"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="833817135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 07 Jun 2023 10:30:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 10:30:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 10:30:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 10:30:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 10:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBH5CUkr2wHQQFH+vZRm9p5Cfqw3IuKqUDnmBZ06tc69TMvaE0o5VG3sCtD0fRABNv2G8mZ17xKI+cgCCGp+xCh6qrgLTIjmHk4Eki6mvuTHhy6sx72My5ZYkUz+JQ3oHI1+idP2AI8RmxK8AImgHLFvqgtqbIc1tM5IZBUDKN8CpZQH7++rGdiSwLWFN1uH/fSEbYekQ/Hap+zkDxW8yFepfs/aUeZH6eeRNiyzZ+kGvNmt7+VDHGwjX7C3/fCbhmVmhQ2YaamqmmtqZcOLkjnKo1e5rszwySplL7hOaY/CzCcm5/KlmEhnXyOo2SezJSL2tzZWinJInWnvijs8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE+S56Vi8cGskzsI2c6HGymMBkpGizAbpreDDsai4Mw=;
 b=MnHxiXPeJQFQdq6mwdmGEwWeRg5SE4dxB2tpeKROVIiDhi5c30j2iOkJ90KcyljHkVVal5aEle0O1/NyWBPYPW84AlhdgrmlMgW7CMKU5WIunesrgH6gY2wlp5Xr6WnuovK0+9HfUM/XEG+WHnme4yhUzZ2Uc+EfFJ5SbZD2jHlwFSrQCAyYu+5aEJ8IIlTyaTQVR6HrFgm7lqVaTWu24DMYxLPCk7aZ4kYEI1DGIBnXjlcXV7mS5t78MC2zu4BLBwGqTNU+koQ1IZeBThu3rRunko0tmxcA/z8ozjwxJhpZDt8QtTegiSNXVECfZZzRaB9DBFGFAtxCxjSNGN9Naw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 17:30:35 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 17:30:35 +0000
Message-ID: <5d35b0f3-3e04-ea9e-1f1f-f3b1b7d1137a@intel.com>
Date: Wed, 7 Jun 2023 10:30:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20230606030037.196558-1-zhanjun.dong@intel.com>
 <acae2008-d499-2bd2-c6c5-4d595a19444d@intel.com>
In-Reply-To: <acae2008-d499-2bd2-c6c5-4d595a19444d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0defee-865f-408a-90af-08db677ce723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wModHZEINm9a5NE/R1puHkHz5Y5IQrb1UO8reL3LYClXKK2ylS1+IsV021ObpdWNlMvLq1WhfH+Q3S6MPm/G+GCzsO0DdN//r42ANPRvXAwvUfaE3xjrtm7zG0uXMCxUd7eAX86CgfZJNihHOUu723GV75npF3yOnxxVkFzlwTmSiBRu8ZtBVK1DQQfo4t3zV8e65g/o6ZqseDx7k5z7aIEKm4cNsiu8uKSxxpuqOHU7BfXNAGgCBzhe9ff+MtgfA9/TnNSkrHeYC+jlNnqLH6Cws+jSMHjgD/HdxtslhEgmflKv58mjLCgl5na/DMrRQksM0RFQtFzu510m8K2d2/IX620wXV2+Us+ZXwO4AYKv9F0eNRBfPuIcUXP1gxGWR/o3bJ6n3hzcxe0//r2A1+Lz60Q/UxGgfNcULXrKDhnqjAy4TJofG9ip5FuVAet8uCbVv/7+E3bEy8C607mPq+zjp6mdGQShQUxvMIQ5ezXb+0LSeJXQcuCvlTiBsk95LgoJat1Dn548DBX/d4YMzU9GcsioNu/kno74Ja+JQa/Ci4I5VOCt0//zWJWxS8hYnEjkrZzlBKuBX4rGbye3kPqrRFpqEhItN8inLzlqYZxLY4fT7iZ3VIEe8Z+E04gcI3FhesyyHpE/xqKr8VtyJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(31696002)(83380400001)(82960400001)(450100002)(66946007)(66476007)(38100700002)(6486002)(66556008)(478600001)(186003)(2906002)(36756003)(2616005)(8676002)(41300700001)(8936002)(5660300002)(316002)(86362001)(31686004)(6512007)(26005)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djFTUWs2Zkh2M0FQSHpyRmc1NG54dFp5Y0V2QWU3cWxBUWt5bHRuS2lKZzln?=
 =?utf-8?B?eXBwVFQrNDlWMVNlSUpKWVhlc3AyQnNJZU5WcnhwNHZrOTliWVhFV2pNY1FG?=
 =?utf-8?B?VEtaS2dhQlVxVDZvVmZwRnBYeStwNjFrRElzajZFYXJmcEYza0h4NkQ1UG5z?=
 =?utf-8?B?eEZvekQ0MjlwN3ZKdmVONW5KelhBamw1QVloNjQxbWtMejZpZlpRMDkvcDdV?=
 =?utf-8?B?Y0ZRdmVLSEp3OTc1VGF6TG9KUUpJUFk1SDcwZHpwenVCdjJLdnNFREpwYkxU?=
 =?utf-8?B?WEhnWUZEUFpGOXhqZUlGS3I1SmVTbXRqTStmL2U4cjNPUnBMUnJZcGZYMS9L?=
 =?utf-8?B?ZGF2TWJKbHJaNDF2UXd1NFNJTm1uTkpEZUxZNzcrb3kzT2krZ2JZT2U5QUpL?=
 =?utf-8?B?bWxsMGFBOFI1Z2pWTXgzbEZlL0V0Um92Q05oeVlLditWb2RQQU5TS0J4UjJP?=
 =?utf-8?B?VXY1VnBFNTFpa2lHazF0QlQreHpIUTlnRlhqS0FrSVVUNGVwMDBvVE5yRUJL?=
 =?utf-8?B?SVcxck5IS3gwQnpwZUlNVGgzdlVNTU12TS9OcHExSDZqdjZDVDdqMi8wYnNR?=
 =?utf-8?B?MExNMFI0TFdTV2JqWSs1ZW95SW5RMElPS3M5TFI1NWM5MWlEWFdxU2w3VVdv?=
 =?utf-8?B?MFBRdGFuS1NmcC9pNEprdFRzOHBVYTdrYmkrMStiTmgwa2FIOVc3TkJ2b1hX?=
 =?utf-8?B?SHg0anhSRUtIeWhIaUY2M015M3BxMGUzcDVNeXY1QWNwdDFTSTkwNVYrcVl0?=
 =?utf-8?B?NDFaOUQrSWw5cU9HcWJQcWdGT1J6Y3Yyb2w5L3dsSDVOM2djMS9xeldxdGxP?=
 =?utf-8?B?WStwZS9KR2RPNDk1S2V3VTkycndvWmx4MXcybE80c1pXcWdIK3JGd2ZYQ2xq?=
 =?utf-8?B?c25PczZNWHB2VSs2dUdsNmJEOW5jVzNOY0JyM1pHSHZnSTVpK0VKM3YxRHlH?=
 =?utf-8?B?eFdrYURFcWhnWHVDaGc2bzNwdnFxYURPNnYxU09zYk16Uy8ySHpyeERtY1Bz?=
 =?utf-8?B?d0R5WjFOSm1vOSt5ZDYrbWVqS21xWmZaRG9TcnJncmVISWJIcW5McW1zZG82?=
 =?utf-8?B?OVZyYW4yYUZzSG1FWXBNSUM2KzFuSVZqUjh0MHRuUDhmZVZwYis3aG5INWJh?=
 =?utf-8?B?d2ljb05rZUU1bk56Z3VZWHdNd1lnQzkxRi9kSDlhMnJ6RTlTQ2hZVDl5NU1o?=
 =?utf-8?B?RG11SlpJdkREczNkdG5mYWhWYnZHZzdSMk9FRmZlaDdRL21wVE5zZ05LNXZJ?=
 =?utf-8?B?bHA5eDdacUM4UWZhSzV6RWQvclBiU2RUZCtXZjlxV2UycTUvaHU0NnVKRHZq?=
 =?utf-8?B?byt0OURUeDNoY2gzZk1nUWY0bHhMZSs4R2llcnlxQjZjTVExSHZ2bE5Mc24v?=
 =?utf-8?B?TWVBbSsyai9DM2xhaVV5OUZCN0NsYzVndkc1emc4VERPRVpmWTVuTm0yOG1I?=
 =?utf-8?B?c0VpbFozbWd1OU9WSmJtUnVyYmIrUXFNR2d0dzZzL0t0WUkzRG80WTRxU0hD?=
 =?utf-8?B?ZUx1OStzZHpsOGJoOS92STJzMTdZbDhlVWM5TFA1UFhOOUlXME5UR1JxL0I5?=
 =?utf-8?B?S3Y5ZURqOFUvV1VOWVBWVGY3OTkzVU50REUwTnhJajhHWktFUzlzUFhibHpJ?=
 =?utf-8?B?YXNxUGpsSnJEeG5NWGhvL2ZLWmIwTlJSc1JlYlFoTGY3S3kwSlMrVXNDM1d0?=
 =?utf-8?B?WUJXYi9iNFFnVXhzcWpuTWFseWl4SDhmNGhJU0QyRHAxWVlsZnAyR1cxWEdv?=
 =?utf-8?B?V2VZL24wMFNZOHRDTm5rUlczY3pqSDMyeW8ydDZiOVlwbjVtcUJZem1ZdFU1?=
 =?utf-8?B?NkRNaGRLYzVSYjN2aWVicXc1dktQWmlLcWF6Mjh3Q2lITTBvKzRUcFpRZUQ0?=
 =?utf-8?B?M2VTVDM5M3dlc1Z1ek9oT242NmhCRDRKdGtBb2dIcFk3UzFMdjhsZEM2Y1JP?=
 =?utf-8?B?ZkVVWVczclQvYkZTTmRiYlpjMVk5UHRWcktKNkM4bnAxcUNRRjBUWXNWRGtm?=
 =?utf-8?B?ZFBZelpoQ3RQN0ZMWUdDQXZIU0p4aUJGUVlTSVBMM1Ewb1BuYWVOYUZEOTUy?=
 =?utf-8?B?dEpuclYxTi9DYlE5NW1YcmExc1IxWDFON092eHFlcERwSVZkN1owTHBtb3N6?=
 =?utf-8?B?UlNIbzhXOGt6Q0pGVmUzS0Q5ZW83dXR5ZktyVDZ4d3hZR2p6blUveTgwaGJJ?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0defee-865f-408a-90af-08db677ce723
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 17:30:35.6696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX18531e0oBJXf9tQuZZa5zvN7K7LzyZ7F6tsCHgI26iTMxOw1J/ZJsVghvc/OI6Aj4tSBodtSTJ8R4x2BBX/Dp6vl01B/l0o24kj0AACF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/6/2023 10:53, John Harrison wrote:
> On 6/5/2023 20:00, Zhanjun Dong wrote:
>> This attemps to avoid circular locing dependency between flush 
>> delayed work and intel_gt_reset.
> locing -> locking
>
>
>>
>> WARNING: possible circular locking dependency detected
>> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
>> ------------------------------------------------------
>> kms_pipe_crc_ba/6415 is trying to acquire lock:
>> ffff88813e6cc640 
>> ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: 
>> __flush_work+0x42/0x530
>>
>> but task is already holding lock:
>> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: 
>> intel_gt_reset+0x19e/0x470 [i915]
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>>          lock_acquire+0xd8/0x2d0
>>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>>          intel_gt_init_reset+0x65/0x80 [i915]
>>          intel_gt_common_init_early+0xe1/0x170 [i915]
>>          intel_root_gt_init_early+0x48/0x60 [i915]
>>          i915_driver_probe+0x671/0xcb0 [i915]
>>          i915_pci_probe+0xdc/0x210 [i915]
>>          pci_device_probe+0x95/0x120
>>          really_probe+0x164/0x3c0
>>          __driver_probe_device+0x73/0x160
>>          driver_probe_device+0x19/0xa0
>>          __driver_attach+0xb6/0x180
>>          bus_for_each_dev+0x77/0xd0
>>          bus_add_driver+0x114/0x210
>>          driver_register+0x5b/0x110
>>          __pfx_vgem_open+0x3/0x10 [vgem]
>>          do_one_initcall+0x57/0x270
>>          do_init_module+0x5f/0x220
>>          load_module+0x1ca4/0x1f00
>>          __do_sys_finit_module+0xb4/0x130
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> -> #2 (fs_reclaim){+.+.}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          fs_reclaim_acquire+0xac/0xe0
>>          kmem_cache_alloc+0x32/0x260
>>          i915_vma_instance+0xb2/0xc60 [i915]
>>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>>          vm_fault_gtt+0x22d/0xf60 [i915]
>>          __do_fault+0x2f/0x1d0
>>          do_pte_missing+0x4a/0xd20
>>          __handle_mm_fault+0x5b0/0x790
>>          handle_mm_fault+0xa2/0x230
>>          do_user_addr_fault+0x3ea/0xa10
>>          exc_page_fault+0x68/0x1a0
>>          asm_exc_page_fault+0x26/0x30
>>
>> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          _intel_gt_reset_lock+0x57/0x330 [i915]
>>          guc_timestamp_ping+0x35/0x130 [i915]
>>          process_one_work+0x250/0x510
>>          worker_thread+0x4f/0x3a0
>>          kthread+0xff/0x130
>>          ret_from_fork+0x29/0x50
>>
>> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>>          check_prev_add+0x90/0xc60
>>          __lock_acquire+0x1998/0x2590
>>          lock_acquire+0xd8/0x2d0
>>          __flush_work+0x74/0x530
>>          __cancel_work_timer+0x14f/0x1f0
>>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>>          reset_prepare+0x21/0x60 [i915]
>>          intel_gt_reset+0x1dd/0x470 [i915]
>>          intel_gt_reset_global+0xfb/0x170 [i915]
>>          intel_gt_handle_error+0x368/0x420 [i915]
>>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>>          i915_wedged_set+0x29/0x40 [i915]
>>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>>          full_proxy_write+0x52/0x80
>>          vfs_write+0xc5/0x4f0
>>          ksys_write+0x64/0xe0
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> other info that might help us debug this:
>>   Chain exists of:
>> (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> 
>> &gt->reset.mutex
>>    Possible unsafe locking scenario:
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(&gt->reset.mutex);
>>                                  lock(fs_reclaim);
>>                                  lock(&gt->reset.mutex);
>> lock((work_completion)(&(&guc->timestamp.work)->work));
>>
>>   *** DEADLOCK ***
>>   3 locks held by kms_pipe_crc_ba/6415:
>>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: 
>> ksys_write+0x64/0xe0
>>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: 
>> simple_attr_write_xsigned.constprop.0+0x47/0x110
>>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: 
>> intel_gt_reset+0x19e/0x470 [i915]
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index a0e3ef1c65d2..22390704542e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1359,7 +1359,7 @@ static void guc_enable_busyness_worker(struct 
>> intel_guc *guc)
>>     static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>   {
>> -    cancel_delayed_work_sync(&guc->timestamp.work);
>> +    cancel_delayed_work(&guc->timestamp.work);
> I think it is worth adding a comment here to explain that it is safe 
> to call the non _sync variant (because of the trylock code in the 
> worker itself) and that the _sync variant hits circular mutex lock 
> issues.
>
To record the notes from direct discussion... This function needs to 
take a 'bool sync' flag. The park/fini code paths still need to do a 
synchronous flush to ensure that the worker is not still running during 
suspend or shutdown. Only the reset path should do the asynchronous cancel.

John.

> John.
>
>
>>   }
>>     static void __reset_guc_busyness_stats(struct intel_guc *guc)
>

