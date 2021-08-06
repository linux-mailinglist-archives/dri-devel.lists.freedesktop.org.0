Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239573E2F36
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2CE6EBC4;
	Fri,  6 Aug 2021 18:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CCC6EBC4;
 Fri,  6 Aug 2021 18:23:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="211319701"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="211319701"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="637818573"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 06 Aug 2021 11:23:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:23:29 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:23:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 11:23:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz8H5q3q3hFku6uymdg/fuUlD90bLnJiUai18W4p0YobtpeJtE8/wk0iLTyqIdAWsVsJ01Hn/9/yRIekypkm0B0qwrhxG1Lg/SUGsVTPvYV7E8ol9Q+veP3uavSbTzLmEmtU2XliJ0zGK2tHwweUEKipYAep2JvgVVz/yUpcp7294mZDdUMqSyGadh3aCa+UoApGJZty+JuKIIk3OoDzBsOCUcH6kqvCF4uVCpFA4fxBP0X5zBGCtddXQm/GzZw6GWBVREGikY5WGQugmBdatIV7utMSq5L4l5aL0wYjJeEBYWWPhZDJS7R9w5vVjITX1GZvoa3TVJMhE9be9Bi+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSB9LTWRbWn9ERWDua/lMLvbA+YXuH/GXCt+KXHDdDg=;
 b=Iv/9b+sf15EriNTv/g/uNJfvWeL6qGLTy8SRQB4DgZ+DfMPblbxJYkH37MkSlJDwjkXnnamIL8BqxXoszQ2Gc4EXXDe2PWQtffSrUywoEf2b65NMs1wT0AbVPzy2FWASYHYcqP4pB/RlT3AOto1awEj2QV8v5B9Dm+H+7dDAeTJAArFCZnvZHX7Rhvde6IB/DVvChjyRxnONv27TjS3Z8JHeORbJNbOtV61Lf2F8Ig+vF7pi33ysEZdjF4ql/wzvvVJ22AwqHNL47K9qFkuxwwj9i8uto/Ho/C0jGwA3C2vAQEZQb3n1y8+hh0ApRFFioo+AuGdPOrHMfkgn0FNMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSB9LTWRbWn9ERWDua/lMLvbA+YXuH/GXCt+KXHDdDg=;
 b=W2Zh885Four4SlbVJX6Wrx7D0TOEOQZQw+KKJxs/Sf3PNkS6wX2n2oWMOWbV2N6bbisQWSI8Th1AEs9bgJ/0O40IcJ6B5Czwfh0yojTYFed8Bv6dFxbWRFMvGzGXgH2Spc3pvbNm0aLyI8XNr9GciYG6soKb9ryhXnEiaYTE14U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 18:23:09 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:23:09 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix syncmap memory leak
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210730195342.110234-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <de37e95c-b3e1-0479-db7e-e820077beaa3@intel.com>
Date: Fri, 6 Aug 2021 11:23:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210730195342.110234-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:a03:2ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 18:23:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0219d492-9de5-46b6-1920-08d959073ded
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5609ADA6AB4CCC85F3B8FC86BDF39@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkA9dtNmj0/rg437b27IJ7tGV2Hohi60QwuJMue3Oe1DU16iW3Xr3SYIpmib6X7tNZFAAh/IXotqgwV+kDiKjZ0w8qZV+7n9lWkIaoxAXQvD2BCLfW76VYJSim9F+oYc8vyc4LMCzWaRFi+FujkGwAG6YbMDCxtluXBUQ3gbqKiH9L14DyViZg3nHZHazzMfa/y4I0dSMZjfPpLvYRZiLyILK3t5mYwUrCMf/sORkMAJ/P3IMa4HJcAFF+jIQSSkj6CKlI9BZ4v9NPhxjc1CQUtmZzGV4DRw6as5sYZmQZyIW2nIPbci1lKZH01VpZeiWRUDgUg0D2C8P4RJmNBmib83JjnJXOY4u1WcFkmAgDXSwZUNsNvd833VZzaHrRPPUktdag8ac65KGvBxXOgWBChwjT1gCkTQTNXvNzsyCbva6RaVfZgPJhwb3EHYkJVYsZrk5GmNhNou/fjTD67xnHYHO34cu9wSaJwkBz+Awzy8Q8S69ZBKBrEcM+OUBHQThina7Gn6Qfi5yWhtzg4kOzp/9k857MPwA7aVLLZDnMHTHosaW8gKPPiwFhCqW9ppDdLpP6+9kGUZiXs2FWhFhxhR/oYWzSIMbSxdwy7YsZybUxYazvk2NYyaKu/m6V6IWWLWFTVc8X1iaz1SruzJu/6gsndW0rC6LGpx+xh3ouh48gPAJJ8k4eRDd9XYjKXbGKW01MnpcCLpSoJhdFqVeHbE/Gn8/2Ju1FG9uxpzbRLFgli21SsN6Qy/fcUpYTgx9ALHvgfmVPHb03PmJZc0xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(31686004)(83380400001)(8936002)(186003)(2616005)(16576012)(31696002)(66476007)(66556008)(956004)(66946007)(450100002)(6486002)(2906002)(53546011)(36756003)(8676002)(316002)(508600001)(5660300002)(86362001)(38100700002)(45980500001)(43740500002)(505234006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjRpTDlmNHQvY2RwVW50NVMvYlhudXZrUVJCWnpPWXAvNTY5dnBDMEVJQWNS?=
 =?utf-8?B?cGJFa2NrWnhqM0UwSU9iUVc4VWFndHpvaUtkNUhFc0JkRkdZQ3F3MS9OY0dm?=
 =?utf-8?B?MFlsL0dkcUdoSktTajR6U05HT0Z4RW5VbkhxQTVUVWttUnJNYlpVU2M5UFkx?=
 =?utf-8?B?SDBDOXZTellaNVVKR3c1L2gxQ004Z05LVVI5K3BLSzV1d01KUXY5NVZXL2pt?=
 =?utf-8?B?N3dueGRWOTFRSE9kQmNaVGlRODY4RlVEcmpJMXpnVnFOQVNHZ2M4NnRFbW9s?=
 =?utf-8?B?NXhWTjhqaGZnVTBTRkR6YjlLdGw4bmZoTkVqMUpyTUh0Y2pmRGZrdnZjWFlP?=
 =?utf-8?B?WHloaEtwK3Jod1p0ZHE0Um9Zc2s1Q2pWQXhHRUF3eFE2Z2tVUHpub216VW9M?=
 =?utf-8?B?bENJdEFZTmd2R0VjaUNsNW1QcENaQzhGRVZjWVhiWTk4cWF3S0ZpUWEzSTlO?=
 =?utf-8?B?T1ROMGd4TjdFZnlaS05FNnV4WmVGcjFKVWR5QnVnVzdMaitJbGw1aVRYczRJ?=
 =?utf-8?B?Qzd2RTRoWFJMNmFUaVlHa1BxYTI1cGw2UUZoMmhZb3hoaUI5cDFHaG1JSXdI?=
 =?utf-8?B?R1FWSWlGRWViWXh0Vm5hK2czOXVZU0pacGJUMTlWZnpZbmZzYzhkbXNGVDBp?=
 =?utf-8?B?SXZTb1RkNS9HaTRaM2FvaTNBaXBVaGRQaUErTTBUYzlFbEFnbWZMYm4yTnB5?=
 =?utf-8?B?VGVaekpYZmpXd1JLellEcm5jc25jNW51c2dTMTRRV1o5a3VCOTNvb0Z3QWtG?=
 =?utf-8?B?QXM4SlBqaC91cmxScWpjNm1ZZDBYSzd0cFNoRDFOSGs0NHRjdmRkeE1BYit2?=
 =?utf-8?B?Wmx1cWh5aW5iTWVEVEdzWFJoVmpNSTU4RzVnUWxQVlh2RkdjU0tJVFVmcmJx?=
 =?utf-8?B?bGh5Z0dHQzNBUGxLQmdqVitXbUhqM2lMYXpFWklhczVKbWl0OE45ZzlXOGds?=
 =?utf-8?B?SmxUcFA2VTNzckNZTFFUKytoYkM3Rk44SW94TUg2eXFLMmFrTkFVZGNXRGJK?=
 =?utf-8?B?VHFvdXV5eTJacDdjenFGUDI1MmZEODZxZTc1MjVwYmZQdWt6TzllNzNjSnRY?=
 =?utf-8?B?cEQ4R2lSbVFtanMrRXo4SWFjdHMrNGxiR3h2SkpxNTFjM3dEemJPWC9WcDUv?=
 =?utf-8?B?M1Q2VmhFKzBBVUlVZ1lvaC81UUo2RDdXcW41RWpvRWdrVzFteTRjVVM1UXpt?=
 =?utf-8?B?SkZ4Y0M1Tm1jQVN6MWNFeHplN0pnTzlWWjFYL0laZnl0czA4bXBKODFNcTY0?=
 =?utf-8?B?bzJjNGRMbFJFZDU3Vzhhd2c4RldSYUdqR2lFY0dSa21HRms4WjlINFF4Qm1i?=
 =?utf-8?B?UCtISy9yeUZBY2o5b1F4Zzl0YlkxR0FkRjM5V3NrQ0pFRmRiUWluUG1nNm9Z?=
 =?utf-8?B?Sm14R1p3WitCZWcxcmVITHoxUXN0NlpZWG9ISkVXRUIwZlllVmRwK2h0ZzA4?=
 =?utf-8?B?am5FQUdLRDlFOFpsak5KNFZFVHZRbFFqeGFpNmo3SU5pcnRtMlZUdDRiNlh2?=
 =?utf-8?B?YzV5Y29TMHRmd2FCY3VySWwxdXZOQjVtaVphTCt3VFVua3VlYm5nK0pJaHpk?=
 =?utf-8?B?NzJFYktlbmRrc0RNRXEzZFJyY2hDUUprZ3RkYXN3YVpVWEFwRlNrOVFaN0cz?=
 =?utf-8?B?WUN5VGU3LzZIdDlwamhhb2wrZzhjei9sb0d0ZFJ0WVVLa1hUWWp1UlRDb0lw?=
 =?utf-8?B?WTJUWDdOWDFpMXFwdVlHYnJuVGVGTnA0Zmo0dkJoNFRqTVJLZ2w4OEt3NHNE?=
 =?utf-8?Q?JnjBIK6BvyZV9NrazB6eXRA/+qy/kg3CijcWWRw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0219d492-9de5-46b6-1920-08d959073ded
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:23:09.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDxxI/L/MDh/GGcpNTsnT7pvEabPUGii9BZESWw6PgvjiganpIxmfvYf31ttVnA8G/9dOI/ndrhyIEDUvLhmHexrlb7HS/AtEUsgvHWkdvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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

On 7/30/2021 12:53, Matthew Brost wrote:
> A small race exists between intel_gt_retire_requests_timeout and
> intel_timeline_exit which could result in the syncmap not getting
> free'd. Rather than work to hard to seal this race, simply cleanup the
free'd -> freed

> syncmap on fini.
>
> unreferenced object 0xffff88813bc53b18 (size 96):
>    comm "gem_close_race", pid 5410, jiffies 4294917818 (age 1105.600s)
>    hex dump (first 32 bytes):
>      01 00 00 00 00 00 00 00 00 00 00 00 0a 00 00 00  ................
>      00 00 00 00 00 00 00 00 6b 6b 6b 6b 06 00 00 00  ........kkkk....
>    backtrace:
>      [<00000000120b863a>] __sync_alloc_leaf+0x1e/0x40 [i915]
>      [<00000000042f6959>] __sync_set+0x1bb/0x240 [i915]
>      [<0000000090f0e90f>] i915_request_await_dma_fence+0x1c7/0x400 [i915]
>      [<0000000056a48219>] i915_request_await_object+0x222/0x360 [i915]
>      [<00000000aaac4ee3>] i915_gem_do_execbuffer+0x1bd0/0x2250 [i915]
>      [<000000003c9d830f>] i915_gem_execbuffer2_ioctl+0x405/0xce0 [i915]
>      [<00000000fd7a8e68>] drm_ioctl_kernel+0xb0/0xf0 [drm]
>      [<00000000e721ee87>] drm_ioctl+0x305/0x3c0 [drm]
>      [<000000008b0d8986>] __x64_sys_ioctl+0x71/0xb0
>      [<0000000076c362a4>] do_syscall_64+0x33/0x80
>      [<00000000eb7a4831>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Fixes: 531958f6f357 ("drm/i915/gt: Track timeline activeness in enter/exit")
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/intel_timeline.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index c4a126c8caef..1257f4f11e66 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -127,6 +127,15 @@ static void intel_timeline_fini(struct rcu_head *rcu)
>   
>   	i915_vma_put(timeline->hwsp_ggtt);
>   	i915_active_fini(&timeline->active);
> +
> +	/*
> +	 * A small race exists between intel_gt_retire_requests_timeout and
> +	 * intel_timeline_exit which could result in the syncmap not getting
> +	 * free'd. Rather than work to hard to seal this race, simply cleanup
> +	 * the syncmap on fini.
What is the race? I'm going round in circles just trying to work out how 
intel_gt_retire_requests_timeout is supposed to get to 
intel_timeline_exit in the first place.

Also, free'd -> freed.

John.


> +	 */
> +	i915_syncmap_free(&timeline->sync);
> +
>   	kfree(timeline);
>   }
>   

