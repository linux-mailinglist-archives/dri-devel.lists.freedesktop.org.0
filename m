Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59E6EA569
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88710EDB8;
	Fri, 21 Apr 2023 07:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526A810EDB8;
 Fri, 21 Apr 2023 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682063856; x=1713599856;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RFH+Dr/Icr37I0OSmSz1VMwUI2us9ttITpS466wzo9M=;
 b=Oxy/vzKx3BWlyMJZihDZL3pUMZCOSlSrk2XCfzugZ7i55jMVElbYA5Gr
 fIqkGy9+cHBBxa1OdGN4Vybg54SveoI2pPjCpTpJHdlqBSzjWpg+zxSpQ
 /PiaX6n0l/CRGO2fawUEOj9fA7lqCxHDyP0r35uNGkV3oYBzFoCXF7/IN
 26M+L4j4r+Fv27v4t2wpddjpyPK0YwIq6Qrpn87ioUh3YJjZb5JC/51EA
 kHxGEs6HZlVYKWwaA7bxYDLwqBAKPehnYS4qAAho2Vus+U1FCPvlXR1Re
 5PmKp4nsnYLGyA2nGiAD0l4JqFH1+90EHC4y+8YAZjVr24GrPiAEKEjFf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373863500"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="373863500"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="866620283"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="866620283"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 21 Apr 2023 00:57:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 00:57:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 00:57:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 00:57:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 00:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1loIqseNENy+wcGGvskEdDPfUKv2f5I3VPI9lOYZ2M2NdJmNM3CM5SDuc5j9mvGOh4ApGNNGUuStUVCuBQTXURBKbTH493Da475gV+1yqiDSPIaUktYn/w8OHysRXqxQtggCWTCnAKt5ZQ+7fZeCUAL5tNxyYp4i8HeQ9QfSIzpMpzKqM3BnN7WIZTVq97ztYmAevdTmxB8Yy1+2NCkWEE5Dwn831QIpqi8P5pAay4rjKjdMiTR9eZ6AYNpCfHFv+cXTn7Kbghj7B0hsrv2HmB9fv0GyoKWxy53mg0b8iKe2igYI8aFlkGQ8cT0zEOB8r2OwKCINq27gBCGposBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpilS4R9NkvwPowu5qH+9L4gnwVSaJQ09vJ285aBt8A=;
 b=KOw/2gJ+tyK6hjsOl7zZLCwYHM3+qnF5Nq0rN9o+5icHkoAIJ83haa0vOic6e4yO5U/WJnM2KGcjYaJN6mo29hmNf44rn3USrcH1nVx6hJy53QjZ21zCP6exGG87TYbYKM1PyNJlnAV3g4Q5vCXeUwltfG6Zt4Or/E5K0TF4Sbt/En6iMqow/sw1MnzfI47TtV8d9gkFidIpG66uTpQCUPgtY2HwE5y/nJps4cRnn9RTeK/I8/SS3Vij5sJiS4b4TzBtHJpU7iwygYI0jgYdNqJk12w9U5+QZLn2nwgzzFEu5Q/NBSFkcAow2bZ2Z4oV4C9WEXDOk8ZWiPk00OMZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 07:57:31 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::fb75:ab6b:697:f2c8]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::fb75:ab6b:697:f2c8%4]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 07:57:30 +0000
Message-ID: <125ebe7d-6411-c1be-4e3e-ba87dd08660a@intel.com>
Date: Fri, 21 Apr 2023 09:57:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: workaround coherency issue for
 Media
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230420113859.30965-1-nirmoy.das@intel.com>
 <20230420213052.GE4085390@mdroper-desk1.amr.corp.intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20230420213052.GE4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|DM8PR11MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 36129868-e669-4f00-0a3f-08db423e0e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hoakPbY4h3LvdemtGf1a/wuwoiIHEhL+y5PInhBsASTqUiBEeJ3WhbIHagWVYNmq5zPzPdvzn4m9lsO1LiYOo8C4zrmyPYsua0/ZnraRYSIazYH+liAPWH2Ifx/GiBOjofV9/VP+9uBACpyj9QhwFgtLEFJahRgW40Kz+rNhus272CuW+FtiePJvCLHngSq6c7ksoXaYdnUA3I8aO7FDVYMIs/MJemmncg6WWW1DiGAjCsOUYT083OW+1qIU6Le0nGrTxfq/i9hp/YPCUG3lKtN5xjYBDDms7aXZCqtnfH7hHekzFN0cDn0OxhzVA8lEgzU5N0lrlkplHRbmUfkeLroj0g4yXt8QYEwucZQEX67qR29TZFQslUsRwYH5IhKS0cCuxZoZjdr1RtKcvEb+OVjQJIvyXpD+OPvjRdJ3z5zxWz9jUvLflNh110bGH7jc7x6vgwjigVputKtA62BRjvcPXp+Vy9zMpLjhc7FLxHLLhRxbYxtAYpQrs86ARZCxWVI2szFMoRAlGJ5NhHDtJnGNp9d2rai+fUXrCCDqoieQyhJ2qBAkT9eoMi/tDJt2x1gnmuf3AIOJRUMtGshxg8QG5vCvhgW6Yxl+f+GkL0mJhRQlxX6GFTr8gRL/pVUgmyhGL3KD2vzojOUd93LM+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(2906002)(8936002)(38100700002)(6862004)(8676002)(5660300002)(36756003)(86362001)(6506007)(31696002)(6486002)(6666004)(6512007)(26005)(966005)(6636002)(478600001)(2616005)(31686004)(83380400001)(4326008)(53546011)(186003)(316002)(37006003)(82960400001)(66556008)(450100002)(66476007)(66946007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnE3YUwvTXpHM3ZNYXVtdGQzNllPQjNDU1pJZHBIWVVVY3V5MmZFYmNJSFQ3?=
 =?utf-8?B?ck41WjlpYWZDVTJhQjMvR3pBb0FBZGh1YnRwVFBENE5QcHJxbGpNaXJ4SFhi?=
 =?utf-8?B?QWlJelpyTTZKUFluTVJlak1UbW1yYWdHZ3hpNFRsdFQ4a3E2Y291YmpkSUdq?=
 =?utf-8?B?MlhneGFXSVdHVStJTFQ4ZG12dG9mVUhYWXZyOUV1WEtBOXFtU090TVJDUFN4?=
 =?utf-8?B?c0Y1TVd5NC9ObWtxMjR1b1VqY25jZG03alJyOUtDakhtcXBOSUJBblU0N25t?=
 =?utf-8?B?RnZmNTE1WVQxTXlWU3RWWDNIbjkyeFV3UnBuZm4vaUcyRkdyeHRpYmVweUo0?=
 =?utf-8?B?MjhmUllBVnp1clJmTHRBaWRPOTJYb0NKd2liNTVXSWFvRkljZjAzeXh6OUN4?=
 =?utf-8?B?UW1lR0VjMldiY1V5dnVyT3F5K0NscmMzaFRSZlBCSUt2QTc3TFREeVpCRzdm?=
 =?utf-8?B?NTdua0pzaWhnQWxXVi9lYzJMWFVXNVhQU1NYbnloakFkam1OUDBPN0QxcWlO?=
 =?utf-8?B?dnJNbzYxWmRwTms2aDREM1p6ZFVLQXl1R3pmZnIydHBhR2ttenBIMHdKTEpM?=
 =?utf-8?B?RzdTc3pORVE0TEZCU0xaV0ZwVFN1Y24wN0pWOWdhcUg0S1F3RXFiWnBBOHZH?=
 =?utf-8?B?blk3R3V4dVlIcHp0OGRRRkZGL0J6M2FDWDBDSjVqSUdTME1kYStGWk1PcUZI?=
 =?utf-8?B?VkdwNlJ2N3g4UURNbDkzOW1xbit5dU9tZ2cyb2NFZ05rd1pjM0dIVmVkSFBU?=
 =?utf-8?B?RGxOcTZLdm55a0xpNTFMR1FQc1BRdEUvTTFVZmIxdW1RZEkwc1gvOGl6cUpq?=
 =?utf-8?B?eXFweFMxVzM4RFpZL1U3c1lHdWxGU3ZzYmVWVDVCbUlrNUlicWpPcThOa0lZ?=
 =?utf-8?B?aFk1YU1Bc3NkV0lqVktyc0czZUFReGhkVVBDcHVTRUpoaWJHbTZkWFNGcUtl?=
 =?utf-8?B?amdQcGdSeTNvbG4wak5YMTZ3VzJkTVlnellodXIxTjNTcHZjRGdibjRnakxk?=
 =?utf-8?B?Znhpd0kxSXN6SWpuUkRGNmRGTW5FaUQrZ0lBQ0xkWUY0ZWNyZXF4ZHZra2lM?=
 =?utf-8?B?UlI1N1JPQ0tKODYwWmZTRkx6LzBnVWF0VlY2bEQ1Vjlkckd6K0tRU1I5cUFr?=
 =?utf-8?B?K25laTFvU280aUF6b2t2UnNHTm9rOXJycWdtUU1Oc2F5OHFRUVBkY0RXajRS?=
 =?utf-8?B?SXh2VFZPOXlpYzZOck1xWWFSY3NXdXVac0hrZ1VBNkJSaTFaMmx4K3Y3cHBR?=
 =?utf-8?B?SUFuRFUrTkcxdXk0WHdDZ2REY0FoNW4xd1JGTUZ0QncyVnpnOTJobXErVFNm?=
 =?utf-8?B?Y3pNdWxtNDBzZWN2dGdFcUdaKzgyL1psdHhkY0NDLzVnYWZtOWpRM0p5KzVO?=
 =?utf-8?B?QTVOaGpNd0lxN1NyK2Rab2xUb0t3NDlZT0loQmxMUm5TMzRZSThhNG04YkZD?=
 =?utf-8?B?YVNCcGNISlpVSUY2cTJna1RLQ1FhYThGdXJDWGcwYmk4RFZEWFAzQytzNFox?=
 =?utf-8?B?M3FCWkpiMlYyYXRLWldCNWprbmU2eVlEWG1uaWNJL08xN1UzbVJmdGU3M3BB?=
 =?utf-8?B?c2o1bVRIWW4xalRIb0d4cytzaWk2MlhBOU9sMHc1d0RodmVIelhZak9vNjJV?=
 =?utf-8?B?Um9jWU4ybnJSV1RXalQ5QkxxeHZNNzIwQWJBbG5VUkEyMi9GdW9aSTdRM1hy?=
 =?utf-8?B?R2RtZk5UM0l6Y01EUGlJMzUrWXZ3aEY4dnJUdlJQMjRDK1lPUXJaWDg2SnZy?=
 =?utf-8?B?QnpQU1YvbDVwM1VPYkV4VTJ1bnZSd2R4bVQrK1ZYcEZaSy9laThrSzVVVHhu?=
 =?utf-8?B?VFdPTE9oY0JVdHQyYmwrVnN4OEFGTno0RnpzSFVsWTBDUE1ZUTJLVTJtbksz?=
 =?utf-8?B?WFRaTmo5OU9wekRybExWSHhwV2pQME82djNZeDhqWWN2QlJhUGFtVm1JeDRY?=
 =?utf-8?B?bWhuNjZtUS9UODhhcHFrdHV6a2xSSWI1UFNTOFdvdDhyMCtiRm1XZHlwdzlQ?=
 =?utf-8?B?TmhYVkIwd3FOdzdGejVFQUR2MkpzbUZPODlCbVBZdklHUElzZ1ZhbTQwL201?=
 =?utf-8?B?ZVEyMjdMS0F6enJTSTBMaUFpUGFXbXg5R3dzcVR0cUZrTTFqaEFXT0tkM0lQ?=
 =?utf-8?Q?dUY5udypCxaMCcKOLyHYpn+WD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36129868-e669-4f00-0a3f-08db423e0e78
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 07:57:30.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNHRk2jY+mcjaTUKz8DvTTmirNCyvCGQUNHjMdeKFdSoCyU3TibFsK/NYNUorEJGJ/LHdUQVBH/Yjk60DdP8eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2023 11:30 PM, Matt Roper wrote:
> On Thu, Apr 20, 2023 at 01:38:59PM +0200, Nirmoy Das wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> This patch implements Wa_22016122933.
>>
>> In MTL, memory writes initiated by Media tile update the whole
>> cache line even for partial writes. This creates a coherency
>> problem for cacheable memory if both CPU and GPU are writing data
>> to different locations within a single cache line. CTB communication
>> is impacted by this issue because the head and tail pointers are
>> adjacent words within a cache line (see struct guc_ct_buffer_desc),
>> where one is written by GuC and the other by the host.
>> This patch circumvents the issue by making CPU/GPU shared memory
>> uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
>> CTB which is being updated by both CPU and GuC, mfence instruction
>> is added to make sure the CPU writes are visible to GPU right away
>> (flush the write combining buffer).
> I posted a note about the commit message here on the original series
> about an hour ago:
>
> https://lore.kernel.org/intel-gfx/20230420205238.GA4085390@mdroper-desk1.amr.corp.intel.com/
>
> Patch itself looks fine, I just think the last sentence above should be
> simplified to avoid inaccuracy.

Thanks for your review, Matt. I will resend with that fixed.


Nirmoy

>
> Matt
>
>> While fixing the CTB issue, we noticed some random GSC firmware
>> loading failure because the share buffers are cacheable (WB) on CPU
>> side but uncached on GPU side. To fix these issues we need to map
>> such shared buffers as WC on CPU side. Since such allocations are
>> not all done through GuC allocator, to avoid too many code changes,
>> the i915_coherent_map_type() is now hard coded to return WC for MTL.
>>
>> BSpec: 45101
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 ++++++
>>   4 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index ecd86130b74f..89fc8ea6bcfc 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -469,7 +469,10 @@ enum i915_map_type i915_coherent_map_type(struct drm_i915_private *i915,
>>   					  struct drm_i915_gem_object *obj,
>>   					  bool always_coherent)
>>   {
>> -	if (i915_gem_object_is_lmem(obj))
>> +	/*
>> +	 * Wa_22016122933: always return I915_MAP_WC for MTL
>> +	 */
>> +	if (i915_gem_object_is_lmem(obj) || IS_METEORLAKE(i915))
>>   		return I915_MAP_WC;
>>   	if (HAS_LLC(i915) || always_coherent)
>>   		return I915_MAP_WB;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> index 1d9fdfb11268..236673c02f9a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> @@ -110,6 +110,13 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>>   	if (obj->base.size < gsc->fw.size)
>>   		return -ENOSPC;
>>   
>> +	/*
>> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
>> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
>> +	 */
>> +	if (IS_METEORLAKE(i915))
>> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>> +
>>   	dst = i915_gem_object_pin_map_unlocked(obj,
>>   					       i915_coherent_map_type(i915, obj, true));
>>   	if (IS_ERR(dst))
>> @@ -125,6 +132,12 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>>   	memset(dst, 0, obj->base.size);
>>   	memcpy(dst, src, gsc->fw.size);
>>   
>> +	/*
>> +	 * Wa_22016122933: Making sure the data in dst is
>> +	 * visible to GSC right away
>> +	 */
>> +	intel_guc_write_barrier(&gt->uc.guc);
>> +
>>   	i915_gem_object_unpin_map(gsc->fw.obj);
>>   	i915_gem_object_unpin_map(obj);
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index e89f16ecf1ae..c9f20385f6a0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -744,6 +744,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>>   	if (IS_ERR(obj))
>>   		return ERR_CAST(obj);
>>   
>> +	/*
>> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
>> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
>> +	 */
>> +	if (IS_METEORLAKE(gt->i915))
>> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>> +
>>   	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>   	if (IS_ERR(vma))
>>   		goto err;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index 1803a633ed64..99a0a89091e7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -902,6 +902,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>>   	/* now update descriptor */
>>   	WRITE_ONCE(desc->head, head);
>>   
>> +	/*
>> +	 * Wa_22016122933: Making sure the head update is
>> +	 * visible to GuC right away
>> +	 */
>> +	intel_guc_write_barrier(ct_to_guc(ct));
>> +
>>   	return available - len;
>>   
>>   corrupted:
>> -- 
>> 2.39.0
>>
