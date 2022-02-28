Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03CF4C77DB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE41910E53A;
	Mon, 28 Feb 2022 18:33:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E758C10E538;
 Mon, 28 Feb 2022 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646073187; x=1677609187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S2Wm2q4jLKC6TXfxlBtmvoAQJjqw2zY4u49YUtmEyyE=;
 b=jIVVA9IIboQGL+M3ovDIbOF+DUgBE+oJDfw6lYG6R8VihunGvFrbqbo6
 DYlYZhwEJ9vfQd1XNJvyNgqCu6ieN7op11ym+4Xl3c+CnWZKdIAYo0TIc
 EzZtY+CwWbGBN4zVPKqg2aOR7eMATFyZxrzDCC6KxMRZoNJ7CRwxxLtqn
 p+6AHEJnLqthKUyotzCv13v3/QQ/RDoY6h0I8kHQVW38zXG2nsW6S6Nvl
 uob5JW9Jkp8sE3f1iseoGoUDyL73s4yChK1I4YfwqkG7y4BnGrGC4Qbvx
 jybo/KsFkTT2nm6c2Bg59+tcTB8w+yjE6cga1Z0K3Zlfm715UN2A0iGyY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253146631"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="253146631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="593317951"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 10:33:06 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 10:33:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 10:33:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 10:33:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIziMAf+1xbQiEzYlWq6X6ORzC8u5SUqmEI1IjnFxfaFkOOlOFuTD2jvK60SX76iRIlSo03TXzdnUteLViywYb5qtpZz0fuIqVgH+TF0zv/zvmRLON8a4xc/hs0Umey3W9IdPxC2xS7g07rb8A95HeRa8C6Kon/OKjeb94+JS2Ht2HCVW3a16qMVN+c82PX+MHCvFx9Dn/HhvucJqRK4+E+3pvjW/0Lrr8kdy0HU7cl63tCY+8MGhGfy4ZrSsWlvsETfiKM4vmtyq99B3bZuAR6CEIKOuapPjtkbOEbernE5hT8j3aK6swYVCENHMABKZ03K0tAz5050fnA6Q8VEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7jd3HQwoq7f8PMtMOya1XyM8F8ErTiDXaIdPFjR1HM=;
 b=JJCAE0Gbjn/auYpYY+xdNnG7faElyPHGpCDrv/m2P7Pt8niBnGEMR+X3O8CzOzI5N6OrELxa2eY2vZPOcHgqUYZ3nPWYnzUTahZfFiNR0uCEAc7qMjSdOnbXZ7+B8MhqwZf89SXvJowvfpW3h5BSsKJH+DgDbgh2DjiGUq5hNOlLRezVJdbn6tDV6CqtwSqCDt5Y3t2gALhc3c2BhfxAUcfeU0NwWzIYZqgZoINpl++B5h6E3SiAcNhDObnihTUrGZNCHDxokdXICQZFavi/vD0iesFkW8HC/AsArBCtZeD+swl5wrsZ7gOga+/BNe0wVk+YzA7VbF0jJYV8HdCC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN8PR11MB3745.namprd11.prod.outlook.com (2603:10b6:408:88::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 18:33:02 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 18:33:02 +0000
Message-ID: <fc96ce57-37f7-9962-6d15-1741de9fcd89@intel.com>
Date: Mon, 28 Feb 2022 10:32:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
 <74d30fd4-cb72-113e-fc09-12602b3cf06d@linux.intel.com>
 <986dae97-6c68-34cc-d972-22edaddf7261@intel.com>
 <4e8888d0-f0da-12f3-4010-159b4ff2bdb3@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <4e8888d0-f0da-12f3-4010-159b4ff2bdb3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:303:6b::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4a81da-1a6d-4c1e-64a1-08d9fae8c0a4
X-MS-TrafficTypeDiagnostic: BN8PR11MB3745:EE_
X-Microsoft-Antispam-PRVS: <BN8PR11MB3745EE9B149C9E7BAD4E3246BD019@BN8PR11MB3745.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iu5Ty82FKRuA/qIYs9ATHxiL//djSOzNG6/Et3CSAlBaR4+InlF4PoEAYsNySIsNlswX6/AmwUvUwl3r3LcAeytLm9py4LitCnjuRy+uBYpakdpH+X/dTUrSxXUer4/9j0igz6uxzMX9sYWY/awgdGqGc/kMI7Hsx185HGxAUcMXTPackpuoaTdRHmk52FJ083vlifkzMEUA6R9qzsxgyGxIirC0bEGhcba9chOlOHylEFatp3gdAKFkuDBKwJEV3DKWwP5J8MREUZ79jhGaQHn5VFDLnBVevQ2nRHAlMlE58bC+gVV8Iu/BLXxAn9uIyMcoganCV7LMD+vZNNd2vRrJEO8xOVTNg3xj3rX8noLhd58WrL3nii4fUm/2kq3FdDxli3pJG40eTu7Fz6OEUIJB3k5Bqqu70+8b9VoID1dfh/XOEMYC7ccNNv9oQUDHbA81ZfRzBVgNMbYpWejOjw4FCtoTkAT9WZ1Jyt3DjSQBhq6URuiYgXs8EqRh5/1KXZnCQUO3x+0zGfQT3fEZE5dDCIGxT+7OyXIneieiboOw3uGMI4P7WnDNib0jKT+jE7OwsetkQtOJTfLTnNcKMfRn2HAdx6MYoW1S3jEC2ZwSApjcq0qw1a51lpdxRnlfFM4qQqVsuwJO6N0VnnvCIbYK+S+IGfU/tsOrrnGjOYF5WlEwOGWgPp4YtggCS2IKjFVYQXJnFtueKhh5aD9WuelgW21ttFAfK0I7yKevLI/r5WhBolDzlWluFkR8PjkQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(66556008)(8936002)(5660300002)(66476007)(4326008)(66946007)(8676002)(30864003)(6486002)(316002)(2906002)(36756003)(508600001)(6666004)(53546011)(6506007)(2616005)(26005)(186003)(31696002)(83380400001)(6512007)(38100700002)(86362001)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzR1Y3JoZWcwQkljZi9wZjMxYVV2QmhucjdTYTRaVnpuRnpPSFB2N2FkejVz?=
 =?utf-8?B?R0lrQ2xLZC9KbjNkL1JhUy82VUtXd1FVOEphZEgxK3NFTDVJQ05RMkxJZklL?=
 =?utf-8?B?V3VURlBDdTdHWUVWQ0huYWtXUE53Z21LeHpsQ3NxRzA0YnBXRnBzV011V3ph?=
 =?utf-8?B?Ym96WUNnbU1wMmkyNERHNjZVcEpaOE9BZlNSNXBESGhlS1NvRnFDeXkxV3Jt?=
 =?utf-8?B?NlVFNVp4VVVIUFVJUHdvTVdsWUx0ZHRWemZFbEU3NlJycnkyelVqLzlDN1g5?=
 =?utf-8?B?WjBocUJ4YzB1VDZzSXJiV2dSaU84Q2wxdEsxOGs0akRsYTN4WXlQUm9IOGZu?=
 =?utf-8?B?TDRFQXJvcUl6VVUrU3E3TVBlbVk2YVBhRkZIekhaSUtjMndUVkg4MEZhajJU?=
 =?utf-8?B?bWtwdXlRMnhoUFFyMEZmMnpPQUo2dHdjVDFISDJHQS9JVFNsSDRsN3BVd0tJ?=
 =?utf-8?B?YW5LWUpjSUg5VTVhNGF0UVh6bnRzaENZbmR2YWluUU91SW5RbTIvUDhMN3Fy?=
 =?utf-8?B?V3NRVGJuTWU4WWprS3FHNm9tQmlLVnorUHFVQUVCTnpZZVp0YXhtc3Q3dEVM?=
 =?utf-8?B?RWtqUHB2WDBGcG8ydUtHNnJYczQrVWNiWFRFN2UvQU0zY3IwbkN5bW5YNVAw?=
 =?utf-8?B?bTVXRDFGb1ZOOSs4bVVjbytrY1BRNTVJdzFPdFdpWjhoOHlCbTRSdHNBTUVV?=
 =?utf-8?B?QTVLWXVieWM5RzFTZ2NqOGpyNS9LSGgzWFJhamdmNnV5VEt2YVJ1NHZmSXFV?=
 =?utf-8?B?VHFVYkdaSTBQbWsxeVNNMms4cnR5RXl3Nm5yeWhUNmZWZXJ6R1hqZlBjY0hB?=
 =?utf-8?B?R1JlZHgzeGNPOE1hcERrbWlaanY3MDdqc09kYTJaTG8xTndTQU5yY3VsNnNq?=
 =?utf-8?B?aGl0YTg4UmMwZWJIZ2FUTFpZbncwalhrSllWN1hGU3VMa2tZK2lzcjA0MkZq?=
 =?utf-8?B?NnFlazVNV2RZZTd0aHkvK051SThtMkw5R3lNd1NxeDBMVzdmRzZvNHV4UEVr?=
 =?utf-8?B?ZXVPZDJmRUhUbDJXRUFjYkQ1K2lGdzI0WEFJR2JMdzE2OTVOM3hKUVFFUEN6?=
 =?utf-8?B?Z1ZWbTJ4ckFnZXFSR0ZIVUdFSERkZ0pJRW5VeWc2Q2lHVit5VUZxc2pOVHFn?=
 =?utf-8?B?OVNtL1V4SG1vT3JpZmZKRTQwRmIyVi9aK0lwU0U0WGJQTTdRSkxnWURiOWZG?=
 =?utf-8?B?TFYyTmU4UUdib3JqQUgrNit5QklTQXdIWSt5bXBzbVZrSEY3bk5ac1Jrait6?=
 =?utf-8?B?ZUVBWHR2cFpMMGZuSzJTU0ltbzZFaElyWHNhQ0RZZTFTeGY3TStPRkc3YmxO?=
 =?utf-8?B?RzRpVTJxdE1XYTFXY09ITGRSdGlNdUNNMVFNUzMrcnRrNjA3THFqejhhYnQ3?=
 =?utf-8?B?NHRLbzVyb2NFNTdMZU9PamdZOVV0Tkpkek1RRXZqV0xOUnRSKzR4N3hVMkNw?=
 =?utf-8?B?c1dHTzU0RkEyU0JKVWcyOG5XaWtiUVVYYmdpV3FxQ2M2L0hiTktLcTQrWWlO?=
 =?utf-8?B?WjR4NU5lcjN5RnJ2RDMwTTNTWldnRkd6ZWtBcXFVVVB2dWVCb3NzZnhCZUpC?=
 =?utf-8?B?dGdRRkJ0a1VqYmZHNjlIMDZPbVpRbGlERFprRVB0Rk9ES2pkOWM2S2xLQTJJ?=
 =?utf-8?B?NmlUUy9qeHB1VDNNZ2dqTm51VDVHMUhIN0N2WGFqTkRsb1B1Z0l3ZzhkdG5D?=
 =?utf-8?B?Y2I5Ryt1QUZKbE93L1BaWkJDU2JnaFhYTUZXNHBOMDN2VW01YjVjSHpqWXF3?=
 =?utf-8?B?cEdzcGFJTjZvNTdqc0dJWlpLZUtHVmFFQjZMNzVSQ2JvOXVCTDVOcm9WOXp4?=
 =?utf-8?B?TTVaSGdZTlFjbFI0amd1T0FkRUJ5djlZZC83cDNmamtIZVpNUnEzbVVrcCtJ?=
 =?utf-8?B?TzJqVkFEaVN2YkJlVjkzMzhNWmluUUdJV252bmdmbkZNQVdnOW5MRFFSQVVJ?=
 =?utf-8?B?eG1yUFU3Kzh5b1JEWUM2MEE5V2NlNzVHTE8wdkdKSXc3anJPeU9Md1RRNHFD?=
 =?utf-8?B?blJudVQyOFYwS1JaN2hEVzR0eEI1ZEEyanBCUnFzdXRjQVplZnFkWngvREVL?=
 =?utf-8?B?Sm1MZjlpdTFscHNFSE5nb3NRVVpyN1lzRUVkWjZ0U0pWZVFGVVlhMWRGbGJW?=
 =?utf-8?B?MkJsOTZDVEtwSjA2MjJmMHlqVGhjTlpuSytQeVRGYjF1THB6ZmlMajZ2UEtV?=
 =?utf-8?B?aVlhR3Boa01sS2xqcWZhMEo0cm54MFJ3MEZicktobGFqMFVRUjUrS1hqRGdy?=
 =?utf-8?Q?h8Z2V4c6ZaR3l4Iho4r81HQW8ZZJ06cq4tf5SWXtik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4a81da-1a6d-4c1e-64a1-08d9fae8c0a4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 18:33:02.2554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08w5s95lL66/xbxCL0kX/gz1O1GkkkG7eSivdb7b/CBUr3dYpUYQ4aQzoD2h31WKvBYTw+2O+vU34jUR5VdILJMmobVwjSb+HBpu6hlBeYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3745
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/2022 08:11, Tvrtko Ursulin wrote:
> On 25/02/2022 17:39, John Harrison wrote:
>> On 2/25/2022 09:06, Tvrtko Ursulin wrote:
>>>
>>> On 24/02/2022 19:19, John Harrison wrote:
>>>
>>> [snip]
>>>
>>>>>>>>> ./gt/uc/intel_guc_fwif.h: u32 execution_quantum;
>>>>>>>>>
>>>>>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>>>>>
>>>>>>>>> ./gt/intel_engine_types.h:              unsigned long 
>>>>>>>>> timeslice_duration_ms;
>>>>>>>>>
>>>>>>>>> timeslice_store/preempt_timeout_store:
>>>>>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>>>>>
>>>>>>>>> So both kconfig and sysfs can already overflow GuC, not only 
>>>>>>>>> because of tick conversion internally but because at backend 
>>>>>>>>> level nothing was done for assigning 64-bit into 32-bit. Or I 
>>>>>>>>> failed to find where it is handled.
>>>>>>>> That's why I'm adding this range check to make sure we don't 
>>>>>>>> allow overflows.
>>>>>>>
>>>>>>> Yes and no, this fixes it, but the first bug was not only due 
>>>>>>> GuC internal tick conversion. It was present ever since the u64 
>>>>>>> from i915 was shoved into u32 sent to GuC. So even if GuC used 
>>>>>>> the value without additional multiplication, bug was be there. 
>>>>>>> My point being when GuC backend was added timeout_ms values 
>>>>>>> should have been limited/clamped to U32_MAX. The tick discovery 
>>>>>>> is additional limit on top.
>>>>>> I'm not disagreeing. I'm just saying that the truncation wasn't 
>>>>>> noticed until I actually tried using very long timeouts to debug 
>>>>>> a particular problem. Now that it is noticed, we need some method 
>>>>>> of range checking and this simple clamp solves all the truncation 
>>>>>> problems.
>>>>>
>>>>> Agreed in principle, just please mention in the commit message all 
>>>>> aspects of the problem.
>>>>>
>>>>> I think we can get away without a Fixes: tag since it requires 
>>>>> user fiddling to break things in unexpected ways.
>>>>>
>>>>> I would though put in a code a clamping which expresses both, 
>>>>> something like min(u32, ..GUC LIMIT..). So the full story is 
>>>>> documented forever. Or "if > u32 || > ..GUC LIMIT..) return 
>>>>> -EINVAL". Just in case GuC limit one day changes but u32 stays. 
>>>>> Perhaps internal ticks go away or anything and we are left with 
>>>>> plain 1:1 millisecond relationship.
>>>> Can certainly add a comment along the lines of "GuC API only takes 
>>>> a 32bit field but that is further reduced to GUC_LIMIT due to 
>>>> internal calculations which would otherwise overflow".
>>>>
>>>> But if the GuC limit is > u32 then, by definition, that means the 
>>>> GuC API has changed to take a u64 instead of a u32. So there will 
>>>> no u32 truncation any more. So I'm not seeing a need to explicitly 
>>>> test the integer size when the value check covers that.
>>>
>>> Hmm I was thinking if the internal conversion in the GuC fw changes 
>>> so that GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS goes above u32, then to be 
>>> extra safe by documenting in code there is the additional limit of 
>>> the data structure field. Say the field was changed to take some 
>>> unit larger than a millisecond. Then the check against the GuC MAX 
>>> limit define would not be enough, unless that would account both for 
>>> internal implementation and u32 in the protocol. Maybe that is 
>>> overdefensive but I don't see that it harms. 50-50, but it's do it 
>>> once and forget so I'd do it.
>> Huh?
>>
>> How can the limit be greater than a u32 if the interface only takes a 
>> u32? By definition the limit would be clamped to u32 size.
>>
>> If you mean that the GuC policy is in different units and those units 
>> might not overflow but ms units do, then actually that is already the 
>> case. The GuC works in us not ms. That's part of why the wrap around 
>> is so low, we have to multiply by 1000 before sending to GuC. 
>> However, that is actually irrelevant because the comparison is being 
>> done on the i915 side in i915's units. We have to scale the GuC limit 
>> to match what i915 is using. And the i915 side is u64 so if the 
>> scaling to i915 numbers overflows a u32 then who cares because that 
>> comparison can be done at 64 bits wide.
>>
>> If the units change then that is a backwards breaking API change that 
>> will require a manual driver code update. You can't just recompile 
>> with a new header and magically get an ms to us or ms to s conversion 
>> in your a = b assignment. The code will need to be changed to do the 
>> new unit conversion (note we already convert from ms to us, the GuC 
>> API is all expressed in us). And that code change will mean having to 
>> revisit any and all scaling, type conversions, etc. I.e. any 
>> pre-existing checks will not necessarily be valid and will need to be 
>> re-visted anyway. But as above, any scaling to GuC units has to be 
>> incorporated into the limit already because otherwise the limit would 
>> not fit in the GuC's own API.
>
> Yes I get that, I was just worried that u32 field in the protocol and 
> GUC_POLICY_MAX_EXEC_QUANTUM_MS defines are separate in the source code 
> and then how to protect against forgetting to update both in sync.
>
> Like if the protocol was changed to take nanoseconds, and firmware 
> implementation changed to support the full range, but define 
> left/forgotten at 100s. That would then overflow u32.
Huh? If the API was updated to 'support the full range' then how can you 
get overflow by forgetting to update the limit? You could get 
unnecessary clamping, which hopefully would be noticed by whoever is 
testing the new API and/or whoever requested the change. But you can't 
get u32 overflow errors if all the code has been updated to u64.

John.

>
> Regards,
>
> Tvrtko
>
>> John.
>>
>>>
>>>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 
>>>>>>>>>> +++++++++++++++
>>>>>>>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 
>>>>>>>>>> ++++++++++++++
>>>>>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 9 +++++++++
>>>>>>>>>>   3 files changed, 38 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct 
>>>>>>>>>> intel_gt *gt, enum intel_engine_id id,
>>>>>>>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == 
>>>>>>>>>> RENDER_CLASS)
>>>>>>>>>>           engine->props.preempt_timeout_ms = 0;
>>>>>>>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>>>>>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>>>>>>>> +        if (engine->props.timeslice_duration_ms > 
>>>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>>>>>>
>>>>>>>>> Hm "wanted".. There's been too much back and forth on the GuC 
>>>>>>>>> load options over the years to keep track.. 
>>>>>>>>> intel_engine_uses_guc work sounds like would work and read nicer.
>>>>>>>> I'm not adding a new feature check here. I'm just using the 
>>>>>>>> existing one. If we want to rename it yet again then that would 
>>>>>>>> be a different patch set.
>>>>>>>
>>>>>>> $ grep intel_engine_uses_guc . -rl
>>>>>>> ./i915_perf.c
>>>>>>> ./i915_request.c
>>>>>>> ./selftests/intel_scheduler_helpers.c
>>>>>>> ./gem/i915_gem_context.c
>>>>>>> ./gt/intel_context.c
>>>>>>> ./gt/intel_engine.h
>>>>>>> ./gt/intel_engine_cs.c
>>>>>>> ./gt/intel_engine_heartbeat.c
>>>>>>> ./gt/intel_engine_pm.c
>>>>>>> ./gt/intel_reset.c
>>>>>>> ./gt/intel_lrc.c
>>>>>>> ./gt/selftest_context.c
>>>>>>> ./gt/selftest_engine_pm.c
>>>>>>> ./gt/selftest_hangcheck.c
>>>>>>> ./gt/selftest_mocs.c
>>>>>>> ./gt/selftest_workarounds.c
>>>>>>>
>>>>>>> Sounds better to me than intel_guc_submission_is_wanted. What 
>>>>>>> does the reader know whether "is wanted" translates to "is 
>>>>>>> actually used". Shrug on "is wanted".
>>>>>> Yes, but isn't '_uses' the one that hits a BUG_ON if you call it 
>>>>>> too early in the boot up sequence? I never understood why that 
>>>>>> was necessary or why we need so many different ways to ask the 
>>>>>> same question. But this version already exists and definitely 
>>>>>> works without hitting any explosions.
>>>>>
>>>>> No idea if it causes a bug on, doesn't in the helper itself so 
>>>>> maybe you are saying it is called too early? Might be.. I think 
>>>>> over time the nice idea we had that "setup" and "init" phases of 
>>>>> engine setup clearly separated got destroyed a bit. There would 
>>>>> always be an option to move this clamping in a later phase, once 
>>>>> the submission method is known. One could argue that if the 
>>>>> submission method is not yet known at this point, it is even wrong 
>>>>> to clamp based on something which will only be decided later. 
>>>>> Because:
>>>>>
>>>>> int intel_engines_init(struct intel_gt *gt)
>>>>> {
>>>>>     int (*setup)(struct intel_engine_cs *engine);
>>>>>     struct intel_engine_cs *engine;
>>>>>     enum intel_engine_id id;
>>>>>     int err;
>>>>>
>>>>>     if (intel_uc_uses_guc_submission(&gt->uc)) {
>>>>>         gt->submission_method = INTEL_SUBMISSION_GUC;
>>>>>
>>>>> So this uses "uses", not "wanted". Presumably the point for having 
>>>>> "wanted" and "uses" is that they can disagree, in which case if 
>>>>> you clamp early based on "wanted" that suggests it could be wrong.
>>>>
>>>> Okay, looks like I was getting confused with intel_guc_is_used(). 
>>>> That one blows up if called too early.
>>>>
>>>> I'll change it to _uses_ and repost, then.
>>>
>>> Check that it isn't called too early, before gt->submission_setup is 
>>> set.
>> Obviously it is because it blew up. But I am not re-writing the 
>> driver start up sequence just to use the word 'use' instead of 'want'.
>>
>>>
>>>>
>>>>>
>>>>>>>>> And limit to class instead of applying to all engines looks 
>>>>>>>>> like a miss.
>>>>>>>> As per follow up email, the class limit is not applied here.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>>>>>>> duration to %d to prevent possibly overflow\n",
>>>>>>>>>> + GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>>>>>>>> + engine->props.timeslice_duration_ms = 
>>>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>>>>>>
>>>>>>>>> I am not sure logging such message during driver load is 
>>>>>>>>> useful. Sounds more like a confused driver which starts with 
>>>>>>>>> one value and then overrides itself. I'd just silently set the 
>>>>>>>>> value appropriate for the active backend. Preemption timeout 
>>>>>>>>> kconfig text already documents the fact timeouts can get 
>>>>>>>>> overriden at runtime depending on platform+engine. So maybe 
>>>>>>>>> just add same text to timeslice kconfig.
>>>>>>>> The point is to make people aware if they compile with 
>>>>>>>> unsupported config options. As far as I know, there is no way 
>>>>>>>> to apply range checking or other limits to config defines. 
>>>>>>>> Which means that a user would silently get unwanted behaviour. 
>>>>>>>> That seems like a bad thing to me. If the driver is confused 
>>>>>>>> because the user built it in a confused manner then we should 
>>>>>>>> let them know.
>>>>>>>
>>>>>>> Okay, but I think make it notice low level.
>>>>>>>
>>>>>>> Also consider in patch 3/3 when you triple it, and then clamp 
>>>>>>> back down here. That's even more confused state since tripling 
>>>>>>> gets nerfed. I think that's also an argument to always account 
>>>>>>> preempt timeout in heartbeat interval calculation. Haven't got 
>>>>>>> to your reply on 2/3 yet though..
>>>>>> That sounds like even more reason to make sure the warning gets 
>>>>>> seen. The more complex the system and the more chances there are 
>>>>>> to get it wrong, the more important it is to have a nice easy to 
>>>>>> see and understand notification that it did go wrong.
>>>>>
>>>>> I did not disagree, just said make it notice, one level higher 
>>>>> than info! :)
>>>> But then it won't appear unless you have explicitly said an 
>>>> elevated debug level. Whereas info appears in dmesg by default (but 
>>>> is still not classed as an error by CI and such).
>>>
>>> Notice is higher than info! :) If info appears by default so does 
>>> notice, warning, err, etc...
>> Doh! I could have sworn those were the other way around.
>>
>> Okay. Will update to use notice :).
>>
>>>
>>> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
>>> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken 
>>> immediately */
>>> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
>>> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>>> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>>> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant 
>>> condition */
>>> #define KERN_INFO       KERN_SOH "6"    /* informational */
>>> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>>>
>>>>> But also think how, if we agree to go with tripling, that you'd 
>>>>> have to consider that in the sysfs store when hearbeat timeout is 
>>>>> written, to consider whether or not to triple and error out if 
>>>>> preemption timeout is over limit.
>>>> I see this as just setting the default values. If an end user is 
>>>> explicitly overriding the defaults then we should obey what they 
>>>> have requested. If they are changing the heartbeat interval then 
>>>> they can also change the pre-emption timeout appropriately.
>>>
>>> Question is can they unknowingly and without any feedback configure 
>>> a much worse state than they expect? Like when they set heartbeats 
>>> up to some value, everything is configured as you intended - but if 
>>> you go over a certain hidden limit the overall scheme degrades in 
>>> some way. What is the failure mode here if you silently let them do 
>>> that?
>> You can always configure things to be worse than expected. If you 
>> don't understand what you are doing then any control can make things 
>> worse instead of better. The assumption is that if a user is savvy 
>> enough to be writing to sysfs overrides of kernel parameters then 
>> they know what those parameters are and what their implications are. 
>> If they want to set a very short heartbeat with a very long 
>> pre-emption timeout then its their problem if they hit frequent TDRs. 
>> Conversely, if they want to set a very long heartbeat with a very 
>> short pre-emption timeout then its still their problem if they hit 
>> frequent TDRs.
>>
>> But if the user explicitly requests a heartbeat period of 3s and a 
>> pre-emption timeout of 2s and the i915 arbitrarily splats their 2s 
>> and makes it 9s then that is wrong.
>>
>> We should give the driver defaults that work for the majority of 
>> users and then let the minority specify exactly what they need.
>>
>> And there is no silent or hidden limit. If the user specifies a value 
>> too large then they will get -EINVAL. Nothing hidden or silent about 
>> that. Any other values are legal and the behaviour will be whatever 
>> has been requested.
>>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

