Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35C5FF0D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710410EB0A;
	Fri, 14 Oct 2022 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDA410EB0A;
 Fri, 14 Oct 2022 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665760265; x=1697296265;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FSC9IHMeFgCuLT8+Bg+Lrr/L4oYg2L50hSSYA3fgt0A=;
 b=DS7s08rz8yD73RNAi3+9py5POSsjMvf8Bwk0O0gX1fXkzFWtDZ1R2goI
 sBD3exf83H/tM4HVKMOYyxQvRyxJr6yIIC1y8DbB7qA1j9+svWnq239zq
 zXFZOEPKchpXNIcfv/cYMwUmQWbZ5jlTpGThhYd/aJ45vEtBN8XXHuKmL
 wy3LmOp2Z2dZ+n9RdWb203QxXQafSh95YzxC/38q5RzD0oa5Feewb/0gN
 SiPDTSbRcw+SfVzkS0UKGRXLOJsW92nsH0kXdXExeT3N1qtw0kRr/RHWU
 r5daM5VbO2fkT80ypIJ2xxz9eJtqoc3IhwrnhUY8Mj0R8o0xKhsq8IxWk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="305386544"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="305386544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 08:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="658614107"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="658614107"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 14 Oct 2022 08:11:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 08:11:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 08:11:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 08:11:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 08:11:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRyk8r54J1ua3cWEx8DvViPntcdYwyjPQpn3DEwTDNdUY/XJqb4JAYEfBzOmxLD1TO7BQP7pm1sIr+uoP0LHAHqHJvMyq12s1Bm3CU1uuesllq9x9i20MBIDIhPEO7u35zUM5pvoxrbEt2tGVyTOZtRsIpZIrv03WnvlWwc9hrz0+uyxwamQoTntsYGERdqgLziWF+nOOpMofQ88WwwKPiUEvi8vUiGjPnVfIV/Z5fa8di40x0f5SagHoNi2pMArMoeKUr5rt+BSEndqPzKKfvfJGJljsoNdBDfucThnR64y+sIlE4N1/tLlob1hZs3OLdqcH87iKQJ4j0BhgIj26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tqfIT5x5vlfq0IMwdNMe3vNcgI6+Bb06ctClgj6PiM=;
 b=LbZN4F+ppqqFtRoBV7uUdLR8vO/rETuZL+KDLdK7aE+uJIJCW5HGTt8SKACfTqNGgSOjKRcGQf9UOmYAIgNVxBLXqBLEwjKHH4yEcnx5+ukMqFifB5ELM0JD/likEWx622nWppOC7eOn4I/PhuU1hQiwRmCPp/8fd93GZTapc+rimJZ4GyzBI9h6fIpF5xiP5CWtgsQrczq1weqkOchBOODvZdta2VgHn+r05prZqQXlRpy5yxrLMThbPyNE7T5CMv8nI/9Az8rIqXV23c3xBJhxIBGESKUoiBB6eOLYRPaWJyj22J7LAz13GTKaciQg0g5yqs+TyGLQYGWzMfzUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 15:11:02 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::2bec:f4e1:7a63:7a6f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::2bec:f4e1:7a63:7a6f%2]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 15:11:02 +0000
Message-ID: <b730a377-15aa-f6e0-b109-b47f7791f72c@intel.com>
Date: Fri, 14 Oct 2022 17:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/i915: Refactor ttm ghost obj detection
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221014131427.21102-1-nirmoy.das@intel.com>
 <f162c0b8-5b9b-1c43-3a66-bff56fc1046e@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <f162c0b8-5b9b-1c43-3a66-bff56fc1046e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f22a30-a77a-4d77-024c-08daadf64e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUcqyNAFVTQDa/t+MS4/FQtdPenuDUT4qGjcMOacu5Kuk7+Y07bbj6wupHE6cVSh6EPeK4RPr2c6D82wwSz1jhQEiUOsCIPTdfrQMw9pI/N4sbhdTPoK+8kzaEVqXC1B/Z97GtGhv1CrsITwz9Zt/dORtWtQ4FgzyZQP9lS1I+paXAYg0iHKDHgstYLfCkSuCpvdck+oFex9pxctscewHwbeo37xvKhjP31s3QwRbBCTXDjli30hcdVudWc1ysdNDzFAYoGVUKehm8QNRt2GWp5RdAm6+3+kpKxc9Ahbm9pZWnDWG0W1KtMbavGSKLkQ6zHXkOS/cxbasyMe4vc6OG2LNUM7NS6ZX43WAc1QuVcQdhVBYMXW2IYkmDAYKMe/E7FshcKY7ZdhidALxNxe+U/3V5gOWVNHV5wwalhSWY20CLDhC/PvqcHtIu9eHU0E6PJJm2da7Hr9I8MGIwrryZGcbWo71SnPbKXmHJ+UlfwmL9MeM5v+opSsI+J/q0cBupO89taetV/RYdNSBoI8XzcRDGQnM4YHVxGROHPC+C4T0/gSxxs403Sfis0xYeJ8HXEY5PF4e7NmTDr3UCdZuQzkQvhUIxEIYv8q6Fh7WKcpz1/GTqA9VYtwWzVwh3O7ZoYwReWejDCLAGnufoZY+SBKgF1yBxJvqPrZE0bzeaC6PeArSw/OF54jEjNUCtczbVCPsHhvxym2zH3sTJZ1E5k4I8qf61L3MyPKaJ8siZFafMFWB1KCKcbs+NfBJ8LtLBeWC/sRw9AOY0cl9KrCPjHZQ/2iYDG0a1XLiBT4+I0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199015)(2616005)(6666004)(66476007)(36756003)(66946007)(8676002)(86362001)(41300700001)(66556008)(82960400001)(4326008)(38100700002)(31696002)(316002)(5660300002)(6512007)(8936002)(186003)(6486002)(83380400001)(2906002)(478600001)(53546011)(26005)(31686004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFwY2JCK1Fyc3ZVQmErV255bTJCSVZxTnNoRjZKVDlPNmU2QkdRVG9JWTEz?=
 =?utf-8?B?ZU1xT3JITzluV1ZYUGQydStEUjV4SzVhZGE1SzhqNzlSNXIxY04xdzFEVXlu?=
 =?utf-8?B?bjFxYm12M29LdDVITFlwVFRqK2E4ditPMC9SRnRtbkNXai9xYzd5d1BuS3c3?=
 =?utf-8?B?d3U2U1lEWUN4L25pUEVZS1BIM01HVmcyTERJQU1GOVhWbDlJYzlLMXhCQzE2?=
 =?utf-8?B?WmVtbU1qejdUQXArSEpRQ1Y0QmVyWDBScEZhK0c5OUhzZFhjVzQ1elZGN3ZQ?=
 =?utf-8?B?T084OE9iNkNjdXJDOUFNUmtEVW01emRMSjFEWmZKWjFLY3dtNG5yZDBlQi95?=
 =?utf-8?B?L0hBNUE5YnIyeC84UmpWTWR2NnBBQzd5a1Rya1QxZmM3T2g2MXV0RFVaKzFM?=
 =?utf-8?B?dmJYQXY4V1g1WFdPTDJUWTJ0aVNMYjV4eDBXYzZPQWd4WXZpdzVlazgyZkUw?=
 =?utf-8?B?TjZ1UGxkam9ESm0vYVlHcTVaMVFUcStWUjB6bkpOUmZtUHNHSWN6cWwyRW9y?=
 =?utf-8?B?YSsybDFFTnhRdnFLNk9XaUdHRk5xVTJzUERwK1pabWFTaTVrNEkrRUkxWXUy?=
 =?utf-8?B?M2lTNmQ5eUxLanVwNHlEdUR4Y3hmM1dWb1B4VjBWcS9aNVUyVk04TFRJRERZ?=
 =?utf-8?B?dXFDdEZIdnFmdGtxMTdqTXljMU5OVzJiaXVMaEtIQVlYVWVOSmtIQkJ1Q01r?=
 =?utf-8?B?aHZQdDNVQ2hBdGp1ZU9DYUM4b0kyeWdCSDl3OG80dmtmQlAya1hLVUlNSG5a?=
 =?utf-8?B?eC8xc0hvY0JSQ0ZUbjdKUnpZc1ltbHo4QTIxamQ1eWNPTmdRTDM0UWhuM0ZS?=
 =?utf-8?B?NnBFZWcyZVRJKzBJYmQ3cW1Md1VxUDNkemxYUDFxTUZab2V0aGsweFJEbWpz?=
 =?utf-8?B?TzlzNDJYUkJESkR1Mm5DSlE3aUJBR0ZxcUNJR2hHVlMxajVaWTR0b3VydDcw?=
 =?utf-8?B?Z3lvTFZBeWM1dFRSVWgxK2tldzFCSWdxVzlZZEp1NmpuVm10TmZMT1hjMFBD?=
 =?utf-8?B?Wkg4ZTlqckdIQXZoNktZZXZLQnU0c2Z4Uy9oVEpyZXpwU3U4T1NiZkFQOEZ1?=
 =?utf-8?B?VHFWZnFUeDdMWVBtdXExOUo1R0s3LzB1b21ITExrd3NVd04ycExqT3Vtc2gw?=
 =?utf-8?B?RHhYWWk0dGJ0SjJZRzVTVm1YY3dTNFRzZlhIRmR6NEdGbzhpdTU4d0JmVFhn?=
 =?utf-8?B?dWlaRHI1OTNrelUvSFJsSVhwRGdoeGI1c2k0SjRRakNDOFB3blhJaDJOTDlU?=
 =?utf-8?B?aDJ3OUp6ZTAxa3VQWEtFd0xqWmxSN2ZwUDBFOWdyUDlHdTFVdi9nMzNUbHd4?=
 =?utf-8?B?RGFzckdHdTNwYThCMjJVeGh4RCtkN2NydWFxSmhocUFhc0EyNEExWWxjcG1a?=
 =?utf-8?B?bEZtUEpoUmk0cE92RXJhT1VNNk5waVJoMGNkb3EzSnd3UUV6dHRCdnRiUXRv?=
 =?utf-8?B?L2NnZ042dDFvWGVtM1JtZ2NHbDRkTFkzTkd0MXBkWUdwdit5MGZoRGlQTy9n?=
 =?utf-8?B?aHZyakNvUGhOV25mdXA2bmp4M0FZdlkyYnJRQkEzNkVydkp5VmZaN2dUZHM4?=
 =?utf-8?B?cmt6cDlBVXRoQ3JJYURGdHRlRW5BN1NCOVlTb3NNUUJUQkFtM2kzWTdyNjNM?=
 =?utf-8?B?alBHN1EwQWpmSDE1MS9HNDdKMnZVbFZ0YjRTN29LR3BSWVdPamw3YWZiaVlo?=
 =?utf-8?B?VkU3Wnh3SFZVVU9BblNieWZpMFFob1pJeXVwMGlPN0RSNWJKczZDb01ZZlkv?=
 =?utf-8?B?MEM0dmRmTzFJZzBnaE1ndnhhemlGcXB4SmRYTnVnT0dsYlZtb3F6dDZISnJi?=
 =?utf-8?B?TGJvK3o0OXU3UGRjcVlIOGJodmNHWkpVbWE2T2F0S2dSUjIrQ2RHYVhxakNC?=
 =?utf-8?B?QllVemtwUWp5SUlwTCtINlBhZTZiczdVeGpPM2tFUmJkMU5Mc0c3ZVlOK0pW?=
 =?utf-8?B?aU1nc0ZMbVR4QjhiVkFWSVEwNTdqK1FNM3NFN2lXQWpNc0Fxd3UyUVVUSXRM?=
 =?utf-8?B?RE12V1FBSjZwaVh4N1Z2VEw4ZzR2VnV1QVJuVnR0QlVlNXNzVEx2VWpOMHBK?=
 =?utf-8?B?TmwrRE4zZ3dzZ2Q3U04wOCtmbTg0cEx5bUtBUEo2OTRkbFdGS3gyTEtRQ3RR?=
 =?utf-8?Q?zt8tI5o/zKo/EjLisyOR9bbvs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f22a30-a77a-4d77-024c-08daadf64e76
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 15:11:01.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZaP2v3kEgz20yBGXzmvkIL0JfxW9Z4fjLQbEdhaY66DyV/F3qz+ccQsiJfzA3gTYkBOyUKb08T6PfRhpJ7t3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 jonathan.cavitt@intel.com, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/14/2022 4:58 PM, Matthew Auld wrote:
> On 14/10/2022 14:14, Nirmoy Das wrote:
>> Currently i915_ttm_to_gem() returns NULL for ttm ghost
>> object which makes it unclear when we should add a NULL
>> check for a caller of i915_ttm_to_gem() as ttm ghost
>> objects are expected behaviour for certain cases.
>>
>> Create a separate function to detect ttm ghost object and
>> use that in places where we expect a ghost obj from ttm.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 21 ++++++++++----------
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h      | 18 ++++++++++++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
>>   3 files changed, 24 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 6b60b99461e2..0a85651c654d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -279,7 +279,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>> ttm_buffer_object *bo,
>>       struct i915_ttm_tt *i915_tt;
>>       int ret;
>>   -    if (!obj)
>> +    if (i915_ttm_is_ghost_object(bo))
>>           return NULL;
>>         i915_tt = kzalloc(sizeof(*i915_tt), GFP_KERNEL);
>> @@ -362,7 +362,7 @@ static bool i915_ttm_eviction_valuable(struct 
>> ttm_buffer_object *bo,
>>   {
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>   -    if (!obj)
>> +    if (i915_ttm_is_ghost_object(bo))
>>           return false;
>>         /*
>> @@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct 
>> ttm_buffer_object *bo)
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>       intel_wakeref_t wakeref = 0;
>>   -    if (bo->resource && likely(obj)) {
>> +    if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
>>           /* ttm_bo_release() already has dma_resv_lock */
>>           if (i915_ttm_cpu_maps_iomem(bo->resource))
>>               wakeref = 
>> intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
>> @@ -624,7 +624,7 @@ static void i915_ttm_swap_notify(struct 
>> ttm_buffer_object *bo)
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>       int ret;
>>   -    if (!obj)
>> +    if (i915_ttm_is_ghost_object(bo))
>>           return;
>>         ret = i915_ttm_move_notify(bo);
>> @@ -657,7 +657,7 @@ static int i915_ttm_io_mem_reserve(struct 
>> ttm_device *bdev, struct ttm_resource
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(mem->bo);
>>       bool unknown_state;
>>   -    if (!obj)
>> +    if (i915_ttm_is_ghost_object(mem->bo))
>>           return -EINVAL;
>>         if (!kref_get_unless_zero(&obj->base.refcount))
>> @@ -690,7 +690,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct 
>> ttm_buffer_object *bo,
>>       unsigned long base;
>>       unsigned int ofs;
>>   -    GEM_BUG_ON(!obj);
>> +    GEM_BUG_ON(i915_ttm_is_ghost_object(bo));
>>       GEM_WARN_ON(bo->ttm);
>>         base = obj->mm.region->iomap.base - 
>> obj->mm.region->region.start;
>> @@ -1035,13 +1035,12 @@ static vm_fault_t vm_fault_ttm(struct 
>> vm_fault *vmf)
>>       struct vm_area_struct *area = vmf->vma;
>>       struct ttm_buffer_object *bo = area->vm_private_data;
>>       struct drm_device *dev = bo->base.dev;
>> -    struct drm_i915_gem_object *obj;
>> +    struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>       intel_wakeref_t wakeref = 0;
>>       vm_fault_t ret;
>>       int idx;
>>   -    obj = i915_ttm_to_gem(bo);
>> -    if (!obj)
>> +    if (i915_ttm_is_ghost_object(bo))
>>           return VM_FAULT_SIGBUS;
>
> I think this one can be dropped, maybe in a separate patch?


Yes, I can send a patch to fix that up.

>
> Otherwise looks good to me,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks,


Nirmoy

>
>>         /* Sanity check that we allow writing into this object */
>> @@ -1141,7 +1140,7 @@ static void ttm_vm_open(struct vm_area_struct 
>> *vma)
>>       struct drm_i915_gem_object *obj =
>>           i915_ttm_to_gem(vma->vm_private_data);
>>   -    GEM_BUG_ON(!obj);
>> + GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
>>       i915_gem_object_get(obj);
>>   }
>>   @@ -1150,7 +1149,7 @@ static void ttm_vm_close(struct 
>> vm_area_struct *vma)
>>       struct drm_i915_gem_object *obj =
>>           i915_ttm_to_gem(vma->vm_private_data);
>>   -    GEM_BUG_ON(!obj);
>> + GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
>>       i915_gem_object_put(obj);
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>> index e4842b4296fc..2a94a99ef76b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>> @@ -27,19 +27,27 @@ i915_gem_to_ttm(struct drm_i915_gem_object *obj)
>>    */
>>   void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
>>   +/**
>> + * i915_ttm_is_ghost_object - Check if the ttm bo is a ghost object.
>> + * @bo: Pointer to the ttm buffer object
>> + *
>> + * Return: True if the ttm bo is not a i915 object but a ghost ttm 
>> object,
>> + * False otherwise.
>> + */
>> +static inline bool i915_ttm_is_ghost_object(struct ttm_buffer_object 
>> *bo)
>> +{
>> +    return bo->destroy != i915_ttm_bo_destroy;
>> +}
>> +
>>   /**
>>    * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an 
>> embedding
>>    * struct drm_i915_gem_object.
>>    *
>> - * Return: Pointer to the embedding struct ttm_buffer_object, or NULL
>> - * if the object was not an i915 ttm object.
>> + * Return: Pointer to the embedding struct ttm_buffer_object.
>>    */
>>   static inline struct drm_i915_gem_object *
>>   i915_ttm_to_gem(struct ttm_buffer_object *bo)
>>   {
>> -    if (bo->destroy != i915_ttm_bo_destroy)
>> -        return NULL;
>> -
>>       return container_of(bo, struct drm_i915_gem_object, 
>> __do_not_access);
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index 9a7e50534b84..f59f812dc6d2 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
>> bool evict,
>>       bool clear;
>>       int ret;
>>   -    if (GEM_WARN_ON(!obj)) {
>> +    if (GEM_WARN_ON(i915_ttm_is_ghost_object(bo))) {
>>           ttm_bo_move_null(bo, dst_mem);
>>           return 0;
>>       }
