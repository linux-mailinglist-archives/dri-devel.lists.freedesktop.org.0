Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E815EAC7A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EBB10E716;
	Mon, 26 Sep 2022 16:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A9110E713;
 Mon, 26 Sep 2022 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664209699; x=1695745699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pmJ9k5Ivo3y8cNQQ7CbGbs3gQua587eTXl7vHHITj9o=;
 b=CGAWC/2JLT+/tbodoIe29pdhyLVcas1XeMYYJnD//0yDxg5wV8yWFKYg
 6qAzhExeJpWHftC1jjxoQvsPbKFD5Vr/F7IX69oCCl/soeXOzf6L2ZKdj
 Wh1NDYFRg7P2m70Ql0aWHiypXMHaVHLb9KNly7jJzK+UyhZwp1BIGsYHM
 Wn1ftJznSjNrsSEEk3zcAwf9Hwl+uLsJ9Qtzf8vN/IRkHKVndCjQtIzrM
 yV9fbEyHEveKLBVekYyBUGnELKDRIECW9KB7E7sOYehiwCnnBqglKE2L/
 ENewBMdzK/4nGdNU62rKX+jw4CBX1JszWmsUVSqk0qR9qLzW43zp31vqJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327427631"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="327427631"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="621117770"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="621117770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 26 Sep 2022 09:28:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 09:28:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 09:28:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 09:28:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 09:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuS7ZQtf8oMU5ahMBCNaCceePN8fb2VkZn/xYSuLdYuTxQ9aOjzc4t0dSDlOMqq125lnj+JpG8vYtkhj69PVRNjhGHBM1RqEm4Ls5XKr1zFLsu64aT34UHAIcfHzG+cOkTYhcomrjIdpIL98bahNhJ6S/P2U+fmoB10BxAaJuTZuLFgNN+S47+gzfWD6IjipGQZYlfis1yHN8XonGPTusL3HLHLUZaJ2eVjYnjXRA43ykAWiawpZ+v9uroUtqE5PAJCQ40rTXwpDVs8rd8frD+sEgVIagx4+pSzkUlLTD9Xw3iO4oCtH2DnTxgnOyVMPvoroqXfC6SnAjamTc/JqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAyWw/qAIZfTwzKc802ORghLgueKr1WrBMf36gaI/OU=;
 b=mnfmufOkNel08Re9C2WJcrMXi1ntP6Ty90AvO1eU/PKGPefFyajBSvw4ym+5P57RT3yX/jOViyBpQLOtELMSL+bOnZjgpIAGwQElcqrXBydY1N6Agq8EzihxAtQZ9lzEM5FO2gd8ic9bgZ9iX0oajXut+OTldErl70D+cEJAZzbhHjnnPgoWO/ebJOPFXKXg367yLSRxNujxyVVO+IgJb8NNlsxyXxd7E68bsGqdA49eJI+iqZm6/4273jR7Xd6DHV2wdqxFlD7wAq62yxc53SL/pkiabuDlL8eMMaqTyEQkbN5xFS4w89OFVoDAKYwP150YLhayU4O9HONO0n/G0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5362.namprd11.prod.outlook.com (2603:10b6:610:b9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Mon, 26 Sep 2022 16:28:14 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%3]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 16:28:14 +0000
Message-ID: <f34b3aab-bf01-bac5-208d-fe807006c6b9@intel.com>
Date: Mon, 26 Sep 2022 09:28:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/huc: only load HuC on GTs that
 have VCS engines
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
 <b6d78e11-f0f7-de86-e5c3-e2a12fe55203@linux.intel.com>
 <f0a77865-265c-6d65-df34-d2d76960d64e@intel.com>
 <37c12259-2190-5299-8d4e-f9ec9fe8a2f5@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <37c12259-2190-5299-8d4e-f9ec9fe8a2f5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH0PR11MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: 933518da-b0f2-4d83-4c4c-08da9fdc1c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bChyGqadBzvTI0/B6GyixBrF19l1fkLjWpDggVfavGA4CsF5qKmNQ39vIKW5rUVh3874POS3NFW4ralMLrtgMrv+8u46CyXjecc8qOrZZKmqVdPT+lcLAbP++srWe/6q/zvIsF+At8jMnzPd6VvtU7dU8UV0lYizwPOXR8Sp04QXhaBC/DopjPkIY7Jkz/GsyU090jdHr8yoP0T7PHjAAfZn/i5mFQYK6lawR3chFUJwFJQ6rqMRALol06Sp/gRelCywZYAQWysMC0ckz8gqFTyVANkc/AsKcpjDeWTfk6/tzWew/d9Z9wT9x6izCmKHrG1I9uEnVkZ/kLhuKT1rttigiuycsAOEM12ya/5NOoGvSWySIcuO3v2G6ZRIdfKFJBx654K04w1x4pgICxfKkxisRyKmtXPd7lXDD3KxO8XvvpaAAYXZNGzANFt9gJ56tUAQ1y9iXiHIaGZNbz2hKuqvlFMBuioY0WZPxJqXjoGUVcM2Ctq5dyarOhXKbmGuuIUWMbDTm/e9oxfEqPtJH495TNHPzQH4tzqCziU9qEypRmlJdQeWAYR0y70nQh1T/bAVfXjaKVpDlPa9pMyYwBHG9eV9xr4Q8QycrJlhefPUxc4kVS1z5Dwec8dW1rgBotqQlbdaeu8pNu822JLavygIbC1Q30nsg3HS1XVP68UvxGMdPr4YQgWOZrpadTDGd1jSwfkP9I4ESl8jhaVdKVpEdluU6GTS++mWkt1LYMNUjUPL7twNQfeEVdEZDTfKlIgLVhj+rb3Doi0u7mcWRKJEu5K7KILO1b2ElWCOyRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(6666004)(41300700001)(5660300002)(8936002)(6506007)(36756003)(6512007)(26005)(83380400001)(53546011)(38100700002)(2906002)(186003)(82960400001)(2616005)(478600001)(316002)(31686004)(6486002)(31696002)(8676002)(66946007)(66556008)(66476007)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFrVDhxY2xmUnAwVFlsZk1RbTFHVmhrZVVZdmt0Z0FQNFFvZkhxZms2RWpy?=
 =?utf-8?B?Nldhb0dJcVhtMzBmL0ZIRSsxbXVQTkFkQ0kwYUY5a3Ywc1gzMWVDa0oyNFdq?=
 =?utf-8?B?QVpOS25mWGNWcGNZeDdMWjRaNlVvaWpVeGkzeExZbzBQZVNzS2s4eEE2b3Rx?=
 =?utf-8?B?cDdhMXhCaER3Mzk3NEQrNkxFYUNwblNyQkdMMXV6L1JpdEtzZXNzN2tJUEM4?=
 =?utf-8?B?OWJWRFFaWE9RRThGNjc1ajFTQUE5TEo1ekxOWWtjc1RCc0FmZWpIVUFYV0xT?=
 =?utf-8?B?SWpQYmpPZkIrdm5XMXBiNVdhMkQ5amFVQWJ0cUxheEJBOFMrQkhRN3phZTlS?=
 =?utf-8?B?YVU3MmJvNXJzNkhSWk9pbHEwNkJqczZRcS82MEhyaFV5dnF0YXFJMDhNaTZM?=
 =?utf-8?B?bSs3KzY2ay85b3ZReVBiN3ltdEUzTTYrZGpZYThOOEUwWnhxMDlGSHNybHk4?=
 =?utf-8?B?RXJUWmlhamVtZ051NjB4Rk9tSXBycmVnYlp5RFRBWFpRS0tGZ1pSWEhpMlFC?=
 =?utf-8?B?TWNSQ3JySGd2cjdPZG5FbkxXRmwzWmF1ZkQyeG5BenZ5Z3djWCtaekowcnJP?=
 =?utf-8?B?dmFncmNkTnM4Qi9MUDU3a1dYcVJ6clB0YzB4UmZyMks3WExKdElJZmlLZkNv?=
 =?utf-8?B?YzdzS0JsMXNGTUdSTGQ2RzdYaVlmTEc3UUNYZjRYR0JZeHJpV010Y3ZYNXgv?=
 =?utf-8?B?UXJMSi85TmVEVndnMnJORjFzMXpKSmZHbkM1SjlBeVA5N1prS1VCYWorQTY1?=
 =?utf-8?B?ckJ5TnR2VEc3dHdFMWZadFJoWmwyNUdvQjROUHM0WVYwb3AwbDJQQVg2SXRZ?=
 =?utf-8?B?TVJ4REZFTy8xOE52WkFmOHJRQzJtVWx0L2lHWWtJMFNLRTVIczdYYlpJVVZJ?=
 =?utf-8?B?bExRSGJXMis5OGZSNmlVY2IyM1U1UUZUYjNMK3ZYWUJMVEY4K2RxRTYrb0tE?=
 =?utf-8?B?SmNyWFJxK3BvU3NYWVg4d0J4UElJYisyZFQ1TDhQWWt4YXJEalF2dzRmWHVT?=
 =?utf-8?B?eEw3bmJzQVRPT0FMY05Ra3lOOTFsdlRGdG82Ukkzck9qdVJJKzVnbHpVaUhE?=
 =?utf-8?B?cGFjb21mVEI1UWpaWm5GeHlFR0NueDI2ZUhFUkZHdHJIMkN5VUIwR091b084?=
 =?utf-8?B?ak9wVnp3L2h4OEg3ZVE0VEFUNzdGSkk1Zi9ySTd1Y0xYeGtWVThZUDBWQnQ5?=
 =?utf-8?B?aklKYTZlU3VOd2d3Vi9zclJ3R3BvaHFaaUQxWjU4V3dYU3FuSEVvaE5FSlpF?=
 =?utf-8?B?NkJKWWUyd2FZaTBkOEx3eVNpeG5xS1UydmhsbUZGU0lvMGxTdzJpU1RnYXZs?=
 =?utf-8?B?ZnpSdStTRld5T09JZGVHZVRjNStjam11Q3o4UExud093L2lJUTc3c2FCUUM3?=
 =?utf-8?B?Q2piaE5IbzRmOWppYUtnQjMyR1BPNlpWOE5IUjlNd01EaFZHaTlnMXlNbEhx?=
 =?utf-8?B?aXNJSEFFcnRFNVRRUlppTndrMWQ5YkFDVXN5MzNVcHJKWnNMaUF3Wk1FaVFC?=
 =?utf-8?B?TWpWUldLSmR5OHUrUk9XMXdGSXdtSnJmQzUzK2ZHSXgyc3AzODlUM21VS1Mr?=
 =?utf-8?B?MkF5eXN1TklJTXpGSFZBT2VHVHh2QXhiNnBNVmI1bE1VdFlBVVVUMG5xdDVZ?=
 =?utf-8?B?MkdhTko5ZUJBSklOcWszK1VrUW1sZGVLMVF6LytVWFhQSnpyWk0xWlRUcytI?=
 =?utf-8?B?RU44c3oydHZnWWw3Z0p4Q1J6cWhWRDFPTUxLdWRyTzVEUzBXL3R1SUhiNnR2?=
 =?utf-8?B?b1VHdWZrVGdpbmxmMzZlL2RBTkVHYi9WLzl6ZjAxQ09PNEhCTHVydnNhNDgz?=
 =?utf-8?B?NktlTW5qNDJBdVFQQWVOSlM0bGd3UHczNG8wOWh1YVpOL2FwNzFtOHpWT2Zl?=
 =?utf-8?B?ejdlRXJTN3UxOVZPeHFqUXNNdllZR0JaZ1BSMUpubE44dTlzMkRMTUZTanpn?=
 =?utf-8?B?eWFHWjJ0M2NVVzVDSGpCVjVaVkwrc3NTK2pZbGExbWpjRWdRNUo5NjVhTXg0?=
 =?utf-8?B?WHk0Mk9FUU5vLy85TWFDTk1mY0l3MzN3NU96RVRFWnZ0ZzZIM2NDSE5kWnhR?=
 =?utf-8?B?WWhoa0FJc3FvQmt6b2J5VHdCNG1qWFhHQmM1bUo4K09UbjVDNU9Md1FpRWg5?=
 =?utf-8?B?OVdzRGRaQkdJWmpvblJRM2NpT08xQll4eEhtY0pJT2NtRzlOV01HR2tSOWp1?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 933518da-b0f2-4d83-4c4c-08da9fdc1c41
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 16:28:14.3415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3MjyiSqVznNQasQ8MdpUFa16JmazmrkynUd9+0oPUFa8JYy+eBTJE/0c6J02EJCaOvk1wZxl067fr6xSaPr0ZGYFwZ4LKZ/Qy8mP/nBETY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5362
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/26/2022 9:15 AM, Tvrtko Ursulin wrote:
>
> On 23/09/2022 16:41, Ceraolo Spurio, Daniele wrote:
>> On 9/23/2022 3:53 AM, Tvrtko Ursulin wrote:
>>>
>>> On 22/09/2022 23:11, Daniele Ceraolo Spurio wrote:
>>>> On MTL the primary GT doesn't have any media capabilities, so no video
>>>> engines and no HuC. We must therefore skip the HuC fetch and load on
>>>> that specific case. Given that other multi-GT platforms might have HuC
>>>> on the primary GT, we can't just check for that and it is easier to
>>>> instead check for the lack of VCS engines.
>>>>
>>>> Based on code from Aravind Iddamsetty
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: John Harrison <john.c.harrison@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
>>>>   drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
>>>>   2 files changed, 27 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> index 3bb8838e325a..d4e2b252f16c 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>> @@ -42,12 +42,33 @@
>>>>    * HuC-specific commands.
>>>>    */
>>>>   +static bool vcs_supported(struct intel_gt *gt)
>>>> +{
>>>> +    intel_engine_mask_t mask = gt->info.engine_mask;
>>>> +
>>>> +    /*
>>>> +     * we can reach here from i915_driver_early_probe for primary
>>>> +     * GT with it being not fully setup hence fall back to the 
>>>> device info's
>>>> +     * engine mask
>>>> +     */
>>>> +    if (!mask && gt_is_root(gt))
>>>> +        mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
>>>
>>> Is it possible for all instances to be fused off? Wondering if the 
>>> function shouldn't just use platform_engine_mask.
>>
>> The spec says that there is always going to be at least 1 VCS (bspec 
>> 55417 in case you want to double-check). I don't see that changing in 
>> the future, because what's the point of having a media GT if you 
>> don't have any enabled VCS engines on it?
>
> That was my gut feeling as well, however..
>
>> Also, platform_engine_mask only contains the entries of the primary 
>> GT, for the other GTs we'd have to navigate the array in the device 
>> info structure and I don't think we want to do that from here when 
>> we've already copied the mask inside gt->info.engine_mask.
>
> ... this is very annoying. Because function is now a bit dodgy, no? 
> Maybe gets the caller a real answer for a _specific_ gt, or maybe gets 
> a fake-ish answer for a root gt. Or if not a root gt and called too 
> early maybe it returns a false zero?
>
> Hm would GEM_BUG_ON(!mask && !gt_is_root(gt)) be correct?
>
> And not even bother to implement is as fallback?
>
> if (gt_is_root)
>     return platform_mask;
> else
>     return gt_mask;
>
> Would that be clearer? Coupled with the comment from the patch, maybe 
> expanded with the statement that if there are some vcs engines, at 
> least one must remain post fusing?

This works for me. I'll wait a bit to see if there are comments on the 
other patches and then send an update.

Thanks,
Daniele

>
> Regards,
>
> Tvrtko
>
>>>> +
>>>> +    return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
>>>> +}
>>>> +
>>>>   void intel_huc_init_early(struct intel_huc *huc)
>>>>   {
>>>>       struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>>>> +    struct intel_gt *gt = huc_to_gt(huc);
>>>>         intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>>>>   +    if (!vcs_supported(gt)) {
>>>> +        intel_uc_fw_change_status(&huc->fw, 
>>>> INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>>>> +        return;
>>>> +    }
>>>> +
>>>>       if (GRAPHICS_VER(i915) >= 11) {
>>>>           huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>>>>           huc->status.mask = HUC_LOAD_SUCCESSFUL;
>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>> index 134fc1621821..8ca575202e5d 100644
>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>> @@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private 
>>>> *i915,
>>>>   #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>>>>   #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>>>>   -#define ENGINE_INSTANCES_MASK(gt, first, count) ({ \
>>>> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({            \
>>>>       unsigned int first__ = (first);                    \
>>>>       unsigned int count__ = (count);                    \
>>>> -    ((gt)->info.engine_mask & \
>>>> -     GENMASK(first__ + count__ - 1, first__)) >> first__;        \
>>>> +    ((mask) & GENMASK(first__ + count__ - 1, first__)) >> 
>>>> first__;    \
>>>>   })
>>>> +
>>>> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
>>>> +    __ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
>>>> +
>>>>   #define RCS_MASK(gt) \
>>>>       ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>>>>   #define BCS_MASK(gt) \
>>

