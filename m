Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB606724AAA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184610E393;
	Tue,  6 Jun 2023 17:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0C410E244;
 Tue,  6 Jun 2023 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686074041; x=1717610041;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b/jxZJT06V0cfJYWaB6FK/+H8aPIdov5pscM4AINLUk=;
 b=YlwnkYpvWHGLZA6A5wO9OksdW1x+fdn3L5DbffUBTkQSQOUjW1E92Xh0
 vq+/qXFqlqsiwU9L684/X65DAx2R8Ug/9FbR4WdJmlHpFmZjp0mSjwOo7
 NI6tS28O5PgfB5enQcaUo8OUbDCkAhcraBG7GgN5OcczOXjjIDITGVzeE
 TFKr2hlmH+XxDw8vXRii6mqcnLUL0IiFAgFJUsya67qnQPzaiAWmtE80/
 fcw2oXiKuwDEzC/kk2tcQxKgck6T5NAxSjLM+ax3zjlaqCvNPpGu6bbo2
 Cse+x4goPi+0jwXF4wt9fncNEwbg0m3liOrPUSnvJZrq35Pu2XBrc8WQz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336382626"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="336382626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 10:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833331294"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="833331294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 10:53:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 10:53:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 10:53:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 10:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7Ai4c6XZ8vRAYJy/KOmczmg1ghYfhG1yA5ZJM69dKlBFcGfOJyKqAz/4haKp5frt9pHhT742zyepjUhfpTzn3cQ6rgJ/OAFw/O7ym3oFfdly2vDNCp/qZ2m6fWT8mTp2OHrg5ylsMaBGa9nhM4KX7ndS+taDiUJm9Bu1M2a50By8IxVFJUSNe2xE9YNBAviVT6TX3euaSH7nSmS4HRM5B8+q6WiNPRUZnxyFao7RdTNLWYeZHiayzSGI5aT2i84xOJNOpFclpuYvjrHQhXBZ7ak0mtFgC5FeWfd6VAKKf3HZbelLmHFI2P5n4MjxbrAkm4qG7JybuFMwjopr1VLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NvRhE1gTmD4JgDmd/shc9dmvargW8ASuyDcvNFpteY=;
 b=O2CkghAdzB+sf3V/KPG9i0TRzJq8Kq2xSh7be0ZSv4zQ3nn8tXMHpYHY9GMywN07OAmkzhiuaaGEJbtD960TBrK7Hn12r79ZY2czWIvHEfqGROFRXQHoWlnYTrTsHms183Z35RVIpx3P0YXYvkQzJLP9tL4OGycNgaz6I052cQQg+/EVQcoY+KdoM1KArUmLj0yAfab/edkH7xpqAJCh1HeqIHPOzv7tKq5eIQ8qFfQYoVaOlaw5FUSdVhenlVN/DgcmcMRceJ0ETMbzw+fuA/zvFXrjeAZJLA24lZoGkEqTcrn2QBh+vLFFucRa0ZkoLAU2Cd7gKfFdgF2/BrgFZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 17:53:53 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 17:53:53 +0000
Message-ID: <acae2008-d499-2bd2-c6c5-4d595a19444d@intel.com>
Date: Tue, 6 Jun 2023 10:53:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
Content-Language: en-GB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20230606030037.196558-1-zhanjun.dong@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230606030037.196558-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fcd234-a8d3-444b-b4bc-08db66b6fde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/HQctxP6gWvwf7qyufsZniIXbVVUGY5DtU+RZtO+3y1nBTpn0hvB6aiYGweT+jcInfNjGK09BRzSOi8PFezis59m26XtdYRsiHWV8HkNld+eHtU39DRGGAQt+Rq9JHTJ1na9//H8tXDRgHvW+5jQUdkIwmcFLp8ttFtHwTpAiC7oFHhig8ISXXZxqnvl7sIngzwMorYMV8IX6yRebznJqPCPvSqEglB+MQTyQIGYQ5hcfVb0djXp3MreH9drK8LF5m0FebTf1kVpuyvGtcKgOdnUQlam7LS6pebw1PV3L6kU4jKY0zP0tIL+QvW5wwVv3p8tiCG7JzyCMqy7prBXk3m6nv4fO4Y6QdLfXpsoT2zIT2dsDuRVmYPBBrZRUuyRPwKvvHZGhPj3d6XBRMoecvBIBTHdfHa5EQZC8s+QAV2NT6TTp8LnKUi9fehWjmsQtpvNhH8jkSNZWLS+tP4TZmv7UK8I2Tapklwt7V9IIBZlT4tvLDNp8C1g3HGJh00kyiP9zIe50hynl2xJDJB+26NK5wDD+W1Xj5ZCiVETcebJawiO7mqHCHCLhNTTSiMXsiw9dpdjuC+GTpaJZUrtGlb+dz3giadkSD8wEJQElNcntxJuaTSOywgSoRlLOqvq42D34gBwqAqKpUdFYbXxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(6512007)(53546011)(26005)(6506007)(36756003)(83380400001)(31696002)(86362001)(38100700002)(82960400001)(186003)(2616005)(41300700001)(2906002)(478600001)(450100002)(66946007)(66476007)(8936002)(8676002)(316002)(31686004)(5660300002)(6486002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlp2bFJKalpEaFlPaVdyQktoMnNlanZlUUtuaTMvcUZjTmRSYVRrZ0E4N25m?=
 =?utf-8?B?bW1lU2J0UVdScEVLb1hvTmI4cTZSVlM0eUR3c2lBZXRRbWJFS1REY2xReFY0?=
 =?utf-8?B?dklrR3VIVGovQmpyMkxJU0hMTllSeGtEWWt1cUpUNERDWFAvb3RESFNTSlNo?=
 =?utf-8?B?bjlaQnlyTDJ5VnBKN201MUN3ZVYyNVBmNUk3d2gvOURUblZvTlJSOFFhSjA4?=
 =?utf-8?B?ck5IdnZQSDBZanAyck53NXhjSllFa0VwNk9TMDVYcHVMUURGME82ZEFvUEh4?=
 =?utf-8?B?N0hPZzYrczIwdS8rUlRkSHhaTUlTN05LWnRtZ0gvVkIxTE40UzREZHhuV3FU?=
 =?utf-8?B?RzlvejBkcnhpaXlFT09LKzN4Q295WGkvK2NiRlZ2QTRxUHVYVmFveDVoeGNR?=
 =?utf-8?B?dFRkbW9JTHZWei91QzNMUkRiZWt2QzVsbWE5N3Z1czNmS01CMEJGVXVyNU5Q?=
 =?utf-8?B?c2UyMWdvOGtQT016c2tPRktGbCthQS8vVFlxNkdkUy96RnpNSUVxQzRya0U3?=
 =?utf-8?B?czRkSjJ0M3dSL0R6b3J3UjlVaFJndStMVjlrUkYwVGU5ZEF2UGxVVXR0czBv?=
 =?utf-8?B?YThTcEFIWkdab3EzRFFpKzVmeXdJRFQrRmg4cUgyTHR2WjlTVVBBd21lVG5k?=
 =?utf-8?B?bmtIQ1VKZU81V0xTaVA5QWtkOFV2S0RZY0t1empISUs5VjhkWTVSd2VXUUtu?=
 =?utf-8?B?c1htNk9QWjAyWVpPQWNmYnFwM0xGQitpTFp6VDJpTFdpOFlnM2t2WENqWllK?=
 =?utf-8?B?Zit3T3djVzA0SGRBcmVqcm9ScFZPS241TG9sTVMzTUhITisxQ0poMEIxenhU?=
 =?utf-8?B?VnF6K041ZHNBNWpoZlVGNVl1OUNlRUxVY09NRnFCM3hNaDllQTBObUVrV1kz?=
 =?utf-8?B?Ymk5UlR3eXZCSG5VMytheUlUMTBtd0ZLNFJ3cGhLN2dwcmpJSXM3RTB4NWQz?=
 =?utf-8?B?ODd6b0JoT2hQdC81clVyQTF2SUxPSXVlSU5vVWlFNE9ZTExDYVdZOXBNbERx?=
 =?utf-8?B?eEE4aEM3blNkME5iNjZMQ0pVYkZEWkE5K2IrQ2xVWG9iKzZWS2psU1RIdDJ5?=
 =?utf-8?B?eElzWVp0OCs4WXNJZUxObHlDaE9xTERDbTkrRC9adVcyeldXR2c3WEpUREF6?=
 =?utf-8?B?OWsyRC90dEJzUUQwak85bGVOanJ6ZlhPUSt3aTl6eTdHRGNkanM1WnV0eTdI?=
 =?utf-8?B?T2xEVURvMnhPaVZoUXZmT3B1S1MzYWhjR3c5L0dHemEwUkduSkN2ek1ISjJJ?=
 =?utf-8?B?TTZOMzB6ekpobytDMHY4aHRSekROd1JHSDUvMHhDd0MrSnF4SlkyNTlCWU5P?=
 =?utf-8?B?RjFpRWdHcG82bGd3dHN4VUJjRStCWTd2YTRwZWpHMnB4YWdMOUdnbUczRkxr?=
 =?utf-8?B?bFd6c0tIWFdDZDMvR2RGOVJNak5lbHpVNEtSdnE1Tkd6QUpuZHNDM04zcEUr?=
 =?utf-8?B?N1pWZmdEZTZZUG5IQVQrY1ltTjFyMitrMjB1NkdHOHhMWmsrSzFqenN6Smps?=
 =?utf-8?B?STBmMnI4WkdqWk44c3J3RVpWcEt0M0krcFlXRDJvWkVrMno0NVpkZm9LSUwx?=
 =?utf-8?B?Q1FGV3hrVEhmVHBWNk5IdlZxYnFUWmszZm8vRCs2T3FTSkhRUUd1dVBZcVNs?=
 =?utf-8?B?eWl2Y1ZuTXF2MHl0OGJ2Sno1SWZmNmlJVzdNYWk3SGFBdHZMYzFQSnZjQkhV?=
 =?utf-8?B?ZzhUU0xSMjhEcGpvRWM3a0NteG1wVnRpNjJwUUtDUlV5OHBoZFlyUGlFYUhq?=
 =?utf-8?B?cUxDVDc3eXNSRGJscVVIYWx6bzNDeGlIVnh1TGpQd2p5bE5oOGtiSXJqS25I?=
 =?utf-8?B?VXVaVHRaZ3RsV0pFU3E3SkFueUs4djUrNTVJWmlvNEhSZmgyTnV0WUdnRi9S?=
 =?utf-8?B?cCs4V2hSMjU1cGl5QzVRaU42WEJybFdpWlFhQmsxdnBBeEI3NmthM1FVbkhG?=
 =?utf-8?B?Ry8ydnN0UndEb0VvS3ZnVzQvZnFpRzBZUGt1c3BZZjlGS25vczhDSS9seHd4?=
 =?utf-8?B?Nk9LVW85aXVlb3BHSHpsQWZuSDYwOCthRFc3OTN1WXBqK2h5MFJyRGV1ZVkw?=
 =?utf-8?B?eHZCS2NSNHp4a2RRL0NNMitnM0cyZGc5a3FvWGtIaUpuaXI5Zmx2ay9HdGtk?=
 =?utf-8?B?anJFUG5MWGgwMXZaRDV3dHI3Y2dYb0lGeXV1ZngvTFg1QW5kZjRHcGJ1WXhC?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fcd234-a8d3-444b-b4bc-08db66b6fde4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 17:53:53.4151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByDLbgJ8OlewegHBIMt6/I4SACHZF8s0fPsjn/Wm/36W4foB9SxU56Q75fY1iZs/YmcxoHwMWnmC8cHd8vZhaq85JsqXuHw9Rz24J0jvayg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
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

On 6/5/2023 20:00, Zhanjun Dong wrote:
> This attemps to avoid circular locing dependency between flush delayed work and intel_gt_reset.
locing -> locking


>
> WARNING: possible circular locking dependency detected
> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
> ------------------------------------------------------
> kms_pipe_crc_ba/6415 is trying to acquire lock:
> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
>
> but task is already holding lock:
> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>
> which lock already depends on the new lock.
>
> the existing dependency chain (in reverse order) is:
>
> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>          lock_acquire+0xd8/0x2d0
>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>          intel_gt_init_reset+0x65/0x80 [i915]
>          intel_gt_common_init_early+0xe1/0x170 [i915]
>          intel_root_gt_init_early+0x48/0x60 [i915]
>          i915_driver_probe+0x671/0xcb0 [i915]
>          i915_pci_probe+0xdc/0x210 [i915]
>          pci_device_probe+0x95/0x120
>          really_probe+0x164/0x3c0
>          __driver_probe_device+0x73/0x160
>          driver_probe_device+0x19/0xa0
>          __driver_attach+0xb6/0x180
>          bus_for_each_dev+0x77/0xd0
>          bus_add_driver+0x114/0x210
>          driver_register+0x5b/0x110
>          __pfx_vgem_open+0x3/0x10 [vgem]
>          do_one_initcall+0x57/0x270
>          do_init_module+0x5f/0x220
>          load_module+0x1ca4/0x1f00
>          __do_sys_finit_module+0xb4/0x130
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> -> #2 (fs_reclaim){+.+.}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          fs_reclaim_acquire+0xac/0xe0
>          kmem_cache_alloc+0x32/0x260
>          i915_vma_instance+0xb2/0xc60 [i915]
>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>          vm_fault_gtt+0x22d/0xf60 [i915]
>          __do_fault+0x2f/0x1d0
>          do_pte_missing+0x4a/0xd20
>          __handle_mm_fault+0x5b0/0x790
>          handle_mm_fault+0xa2/0x230
>          do_user_addr_fault+0x3ea/0xa10
>          exc_page_fault+0x68/0x1a0
>          asm_exc_page_fault+0x26/0x30
>
> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          _intel_gt_reset_lock+0x57/0x330 [i915]
>          guc_timestamp_ping+0x35/0x130 [i915]
>          process_one_work+0x250/0x510
>          worker_thread+0x4f/0x3a0
>          kthread+0xff/0x130
>          ret_from_fork+0x29/0x50
>
> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>          check_prev_add+0x90/0xc60
>          __lock_acquire+0x1998/0x2590
>          lock_acquire+0xd8/0x2d0
>          __flush_work+0x74/0x530
>          __cancel_work_timer+0x14f/0x1f0
>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>          reset_prepare+0x21/0x60 [i915]
>          intel_gt_reset+0x1dd/0x470 [i915]
>          intel_gt_reset_global+0xfb/0x170 [i915]
>          intel_gt_handle_error+0x368/0x420 [i915]
>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>          i915_wedged_set+0x29/0x40 [i915]
>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>          full_proxy_write+0x52/0x80
>          vfs_write+0xc5/0x4f0
>          ksys_write+0x64/0xe0
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> other info that might help us debug this:
>   Chain exists of:
>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>    Possible unsafe locking scenario:
>          CPU0                    CPU1
>          ----                    ----
>     lock(&gt->reset.mutex);
>                                  lock(fs_reclaim);
>                                  lock(&gt->reset.mutex);
>     lock((work_completion)(&(&guc->timestamp.work)->work));
>
>   *** DEADLOCK ***
>   3 locks held by kms_pipe_crc_ba/6415:
>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..22390704542e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1359,7 +1359,7 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>   
>   static void guc_cancel_busyness_worker(struct intel_guc *guc)
>   {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	cancel_delayed_work(&guc->timestamp.work);
I think it is worth adding a comment here to explain that it is safe to 
call the non _sync variant (because of the trylock code in the worker 
itself) and that the _sync variant hits circular mutex lock issues.

John.


>   }
>   
>   static void __reset_guc_busyness_stats(struct intel_guc *guc)

