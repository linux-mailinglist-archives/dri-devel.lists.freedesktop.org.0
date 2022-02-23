Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BF4C1CB8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE47F10E390;
	Wed, 23 Feb 2022 20:00:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EA10E390;
 Wed, 23 Feb 2022 20:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645646409; x=1677182409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pccRi4gnMLKdau7k7TYaNOCaiMB86+gWc/G6nr8NRtI=;
 b=ZoG3c8bPZNuwSxv6g9ebGz3xANebktYFqBlM0o1bS1Hxs4piJacjvT36
 ZBqxmN2WWyUpQnCe8Eb0EKA2TWtN725PSyIMOr4tJgkIZH0OnCtR+mUSf
 /81uvuHEBAYd6sf7uHnXiP1dhmNnbvNGIwjWyNnk6C0AZ1jurR3yO0Sn4
 ouKcrMBnAazjz9NfVOmx/9fRDkngckEXalRSPH7WwCGDOZ2du0gt4kxM+
 O4zEhRkZjQ2/AYE5yzItsyGN5FDgc7EXgDSbzXY9SB0Vj0nD/lS1H6I6U
 k3eNzehmfekZKCRnD1C5xVwfrW8t97jovjRcGgfbpd18qmTrDWnwWA1vt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="315295374"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="315295374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 12:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="508578699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 23 Feb 2022 12:00:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 12:00:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 23 Feb 2022 12:00:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 12:00:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 12:00:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijt5Ki9wPugg98VagXk9W32/Ny8h+oEbrIdw4ZEhELtReJfz1M9V01pLCCRKLLWOtwoy8TPlJqSdxrgzhcKQQNd67pValveIe0CrfVnVnKDreUwsswE+H9Qep++iS+cQUO4kOBFddTmmt5bY6UWoDrtH+DvfSg2phqVLeu25wGm76aGQUJ0032zdDT4MGcgVJ5Nd8jScuNYoQVk71IlFjN6LIIRBz+6a3wtO9UXgSOFZsTCGG018eY9L7eGo1NuYLlsUp/anqMk1eqbNwqnFI/hsYqOiveO3gY1WgwQEkaE2HnHqFklFHtjjMSsqA+pn2hjdKmcUr+skdpaXhqJzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoB9u1GYkicjWs6D6FrPKRZvOvomLOIqsrrwr7aERW4=;
 b=Wiv5I0yFoDekWLXCpaaEfbwLmracFUmp9efL51u1nWnzqtQ9tqL9tjUYX+w5/lMkl/elpyBttxhenawxsmrC6rGIZQoBOvItjeEja/jM6wU+qf5G4ADD4loLijNx38hQh9rD/faFM0fezqz+nE/5/dLdsAuHSx0JjD9258sKpqNVG9m0dU/Qh6dTN+hJ157D79d5zOsZGHWgGBDbfHp7uAYR/tyt90q+rejg+MPPyok7RQopxKWyzuec1B4eKSIajlpnOjv3KI05Ja8rRQEd6o2qo8/dKWMiUjAQdLjnb6q3NZVoXMoDGZtrd97JeMoZ+yqMnvjDDBQsxO3MshFaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1454.namprd11.prod.outlook.com (2603:10b6:301:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 20:00:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 20:00:05 +0000
Message-ID: <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
Date: Wed, 23 Feb 2022 12:00:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR1701CA0012.namprd17.prod.outlook.com
 (2603:10b6:301:14::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0b93d1-16e2-4655-f5ee-08d9f70715b3
X-MS-TrafficTypeDiagnostic: MWHPR11MB1454:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB145454D3710E07E286B18EC2BD3C9@MWHPR11MB1454.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjZ/De0dDsu+TaECKQillbY4QtnTQjfkRRmB72KBJgeq3WZXjtcEYbanZkxoNTfdZ9qIqyvDtixS5dzUw86/qlKZtbGSAZX1YeBUUVddbKjDgDzSWnuJNWMdQWKin2QVOjMeIYoisivudj1JnwnDkphX22u4E5Wag08YeCPqTdPbOGCyT3fDJEmqRkdQhMUT8jzmCkz6fAC8fBpWaJyjyR1zhtOXW7eWrQa/DTomJI+xielKNy5ThCscLE8AyIb/UY/+RFHm5zPoMRZAlCWRFdNyCXgZ1XFp6N143GNIfzZHcxvbSTp5h3Cd2XSLh9m+BC5sexwj3IncYMIllpdpkIERicwGepbBc/7CBYQjlEFJloB3fiA1/d17uIBgYrsj7YBZBYnw2ptedOzJ7XraEBi0GmW9h/AilzcMLvncg/CdkYm1QzxoNjKLiOTn6ll+XqHHIByrMJ6+YuriRaLVSZ5PoxvwxEzkcsAFxdpupYTCHOrCwyYBDyx3Cix08+n/ldePwCwBTAqsL9y7K64MiShbNg5tX38FHDs8NlOHpd9cjkA1wJzExuXt/FyymyCgXcGMDN/P5NcvHW/iWx34Bn2tzvg/eqOEhEMsJ42HUUnS6Sa/ciY8ELuDg+472qtFG1fGvBIbKMyN6wIwaU15/sz1ZdtzEIsu52eLoidah3VahY5IVXqLB92Kp5gCX0/UTxCXeFBh9f63MRwHEdTKmu/Lb+00J1mOwXxYg+kYLQHThi2IeuSxhdQmZVYs1uz2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(38100700002)(36756003)(31686004)(83380400001)(82960400001)(53546011)(6512007)(6666004)(6506007)(26005)(186003)(2616005)(66476007)(316002)(66556008)(4326008)(66946007)(508600001)(8676002)(6486002)(2906002)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTUxZ05ScU12dVI3TWNIWFlKeTdhV2ZSd00wc0lzRDNTQmxsK0g2b3ErWE43?=
 =?utf-8?B?eTJEdXU5QVFrRUR3anlYcno2L05CRloraGl5dGFzQi96Ujk5eWNpa1VScExE?=
 =?utf-8?B?MkovTHlQbFlKcklsaU1OZlJDVUwyS3pyZVdhdkpyelgyNGhGamllSzBUTUto?=
 =?utf-8?B?ME9CdEQ2bVRQUjJvZjJRakVoK0MzeUEwK3E0c1ZURERmZ2F4ZDRXNGdlRHBC?=
 =?utf-8?B?YWN5YVhoZ3ZRdXFTM1VYVG0rbWxwWC9RMmNhSUg1L1NmYitRTXI4cC9tWHdT?=
 =?utf-8?B?dkdjN2xRc0loN2ltYWhQb1JPVFlyUEJsdWkyMjlCc3J2RTYvR3hZa1VqNERF?=
 =?utf-8?B?ZUI3Q0tRVlJsK0VVUFVxc1F5YndGeFdiakd3OHV1MUszOHlsTFV6RWNaNUg2?=
 =?utf-8?B?azJ5TTVrNXBZYVB2a1ZVS3RQK1BqN0c5Z1JTZVo3QkxKRlBWWnVFeGV0c0RY?=
 =?utf-8?B?VGgzNXE1SElEMi8rZHE1SW1qejNSc2JHZWwrTktZY1hJSDdQOWc4Uy95ZzIw?=
 =?utf-8?B?dU1WSXNhM2M3dHVkRjlpc3l6RzN2cU90bUl2a1JBOTdqWTRHUlNWMVVMaC94?=
 =?utf-8?B?ZjIrUG1mOVdmMUY5emE1RUpSeElJaUQweGpXcmtGK2szejNSTVljd3FiOUVR?=
 =?utf-8?B?d1JrMnVWTlB3ZDZzbjl2dlYyNWFYK2pjVnJMTzNONVVrTXJZcGZuYmRFZ1N5?=
 =?utf-8?B?b21UdVNjRFBZYnROVWJmOHBkNnNMeC80bmhhMHpvc1JuUTZFazdBLzUxSWNz?=
 =?utf-8?B?UTN6YWRYSWRDbEN0cWxzTWYwY2o4SnFVZkJpcmd3YnNCNmtHOU1Fa0Vna3JM?=
 =?utf-8?B?NndIN3ZSSFFFSFBwZ081TmJ3Qk52aGZwUVIrazhvR2paMExOOE9BaGxPM2R4?=
 =?utf-8?B?Y2pFUEZ4RCtoZm05ZVFqbGhqUE5GQXBTNlo4M1oxSkN1d3NUNWJOY1Z1UnAz?=
 =?utf-8?B?NWlYOC9BU2lCaElubW5GbEZYR01rQ3NiMG9ueGhacnhSSE1xU1BjWnJybnhM?=
 =?utf-8?B?eDNFL0JlUm9OME1LdmZiQzVzWG1sNE5GTEN0MTdleGF6ejIvclM4emFEYTc5?=
 =?utf-8?B?eDRvUmJzOVNSZlozbkFWL1NrZ0IxUjdiazMyMzZRakk1ek1WbjNJckxJdmxr?=
 =?utf-8?B?U3JGbUNiUjRGMUZmWXVzTHlFWVhXdGpudTVIenhLVlpuMC8rUlduL3AvcVJH?=
 =?utf-8?B?R1BJZFlEVXI2R3NXVTlWQTFkYzk5ZW16Uk1ncHFDa09YdWsrbkFHcWpNamoy?=
 =?utf-8?B?VVFoc3pCT3ZyZ1dWSkFuUXI5VWpMdW92bUNpNjV4cmhaU3MzSm5TZ0daQmor?=
 =?utf-8?B?Nm5kYndGWUtzeTlXL1U2d2VoVVE4d3R3c1RIM05qVWdRVHlDT25xcDhSeHJD?=
 =?utf-8?B?bmllWmJSTnZxem5vQ2ZYeVZhbXV5VFN6RWUzWWpIOWdGZy8zRVBQdWRLNlVD?=
 =?utf-8?B?aGt5YjRtQWNPclllNDVtc3ltOVZXSktqRVQzcmozVHpVZGdaNGoyeVU4NkVr?=
 =?utf-8?B?RG9LdG10MnhHVURhTkxoeTM5L3dtUGo0U2xka2lJeEs1REp5Y0ppcEVhcTg5?=
 =?utf-8?B?Q0VOZEJDNVNCSTdleVYxY1pNekxaRTlZZmFWcGJZMUpUYXFrSUFXbi9zSWFu?=
 =?utf-8?B?WVdnam5VcTBabDVsdXVKdmJnL2JQN2tXZ2JMdXJGaXhmRUxrc05IN1Z1M3dR?=
 =?utf-8?B?RmxsZlU3cDJOekxMdXBIQ3ZPYXdNU2Y0ZjBweVhFRk13dUR5elpPakxyQ2lv?=
 =?utf-8?B?NHFaMVA0ZWxnRGtBajRFTjI4bXBSSUY5U0RnTG93QU5BODY1empBNlNWU0c0?=
 =?utf-8?B?VTNJRThPRDFXMDdTdldjNW1uaTh3bkhYTmNtbEdaV3Z6RU1pcHFFdnVDK2xu?=
 =?utf-8?B?Y3VGUTh1UG92WkR0TzZ2K3VINmpyQnZ0bUhkNUZqMEtiZlFYQ0RHWWs4YlVU?=
 =?utf-8?B?ZGZDSkNZNEFJZE5EWjNuSHBZYjk3aGhTWW5vRFlpM1FRNlVDZUM5djFwaU5n?=
 =?utf-8?B?N0txalNjakJvNFJPVWIzRDZzTUxHdnBTeE5yM0NRdGtaZitaTjFJaUozOFBl?=
 =?utf-8?B?cGROc3lmRTV6VlJaTFUvR0VTV2pqSTZ0bDF5bXJnRWkyQXRNZG9lVkYrMWVr?=
 =?utf-8?B?c2RrdTlOYWduTjdUMUI1RXo0eFNwaDNTcGdpUzNZRjR2bDF3MXFYZmtuRVk0?=
 =?utf-8?B?N1JNZkR2ODFXZS9xSHp0bDcyWlFZM010RUtKdExCNW9UOVBBNW5NRnBWbllu?=
 =?utf-8?Q?e+wRZj3QJ7TLv/t9RXX3AoxcnCpQhH640eozQYtEeU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0b93d1-16e2-4655-f5ee-08d9f70715b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 20:00:05.2926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dTLb6/2ZoAetoC+aOufxAEc4ibtgMmMUf4rS6CH6WU9rYkVYx99NTWXwVMk6Q6MNMmgNZpETyybypBVzRftg+DtwPoKkqID5qLJUqBWQTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1454
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

On 2/23/2022 05:58, Tvrtko Ursulin wrote:
> On 23/02/2022 02:45, John Harrison wrote:
>> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Compute workloads are inherantly not pre-emptible for long periods on
>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>> for compute capable engines was disabled. This is undesirable with GuC
>>>> submission as it prevents per engine reset of hung contexts. Hence the
>>>> next patch will re-enable the timeout but bumped up by an order of
>>>> magnititude.
>>>
>>> (Some typos above.)
>> I'm spotting 'inherently' but not anything else.
>
> Magnititude! O;)
Doh!

[snip]

>> Whereas, bumping all heartbeat periods to be greater than the 
>> pre-emption timeout is wasteful and unnecessary. That leads to a 
>> total heartbeat time of about a minute. Which is a very long time to 
>> wait for a hang to be detected and recovered. Especially when the 
>> official limit on a context responding to an 'are you dead' query is 
>> only 7.5 seconds.
>
> Not sure how did you get one minute?
7.5 * 2 (to be safe) = 15. 15 * 5 (number of heartbeat periods) = 75 => 
1 minute 15 seconds

Even ignoring any safety factor and just going with 7.5 * 5 still gets 
you to 37.5 seconds which is over a half a minute and likely to race.

>
> Regardless, crux of argument was to avoid GuC engine reset and 
> heartbeat reset racing with each other, and to do that by considering 
> the preempt timeout with the heartbeat interval. I was thinking about 
> this scenario in this series:
>
> [Please use fixed width font and no line wrap to view.]
>
> A)
>
> tP = preempt timeout
> tH = hearbeat interval
>
> tP = 3 * tH
>
> 1) Background load = I915_PRIORITY_DISPLAY
>
> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * 
> tH] ----> FULL RESET
>                                                        |
>                                                        \- preemption 
> triggered, tP = 3 * tH ------\
> \-> preempt timeout would hit here
>
> Here we have collateral damage due full reset, since we can't tell GuC 
> to reset just one engine and we fudged tP just to "account" for 
> heartbeats.
You are missing the whole point of the patch series which is that the 
last heartbeat period is '2 * tP' not '2 * tH'.
+        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;

By making the last period double the pre-emption timeout, it is 
guaranteed that the FULL RESET stage cannot be hit before the hardware 
has attempted and timed-out on at least one pre-emption.

[snip]


> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * 
> tH] ----> full reset would be here
>                |
>                \- preemption triggered, tP = 3 * tH ----------------\
> \-> Preempt timeout reset
>
> Here is is kind of least worse, but question is why we fudged tP when 
> it gives us nothing good in this case.
>
The point of fudging tP(RCS) is to give compute workloads longer to 
reach a pre-emptible point (given that EU walkers are basically not 
pre-emptible). The reason for doing the fudge is not connected to the 
heartbeat at all. The fact that it causes problems for the heartbeat is 
an undesired side effect.

Note that the use of 'tP(RCS) = tH * 3' was just an arbitrary 
calculation that gave us something that all interested parties were 
vaguely happy with. It could just as easily be a fixed, hard coded value 
of 7.5s but having it based on something configurable seemed more 
sensible. The other option was 'tP(RCS) = tP * 12' but that felt more 
arbitrary than basing it on the average heartbeat timeout. As in, three 
heartbeat periods is about what a normal prio task gets before it gets 
pre-empted by the heartbeat. So using that for general purpose 
pre-emptions (e.g. time slicing between multiple user apps) seems 
reasonable.


> B)
>
> Instead, my idea to account for preempt timeout when calculating when 
> to schedule next hearbeat would look like this:
>
> First of all tP can be left at a large value unrelated to tH. Lets say 
> tP = 640ms. tH stays 2.5s.
640ms is not 'large'. The requirement is either zero (disabled) or 
region of 7.5s. The 640ms figure is the default for non-compute engines. 
Anything that can run EUs needs to be 'huge'.


>
> 1) Background load = I915_PRIORITY_DISPLAY
>
> <-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> 
> Pulse3 <-- [tH + tP] --> full reset would be here
Sure, this works but each period is now 2.5 + 7.5 = 10s. The full five 
periods is therefore 50s, which is practically a minute.

[snip]

> Am I missing some requirement or you see another problem with this idea?
>
>>> On a related topic, if GuC engine resets stop working when preempt 
>>> timeout is set to zero - I think we need to somehow let the user 
>>> know if they try to tweak it via sysfs. Perhaps go as far as -EINVAL 
>>> in GuC mode, if i915.reset has not explicitly disabled engine resets.
>> Define 'stops working'. The definition of the sysfs interface is that 
>> a value of zero disables pre-emption. If you don't have pre-emption 
>> and your hang detection mechanism relies on pre-emption then you 
>> don't have a hang detection mechanism either. If the user really 
>> wants to allow 
>
> By stops working I meant that it stops working. :)
>
> With execlist one can disable preempt timeout and "stopped heartbeat" 
> can still reset the stuck engine and so avoid collateral damage. With 
> GuC it appears this is not possible. So I was thinking this is 
> something worthy a log notice.
>
>> their context to run forever and never be pre-empted then that means 
>> they also don't want it to be reset arbitrarily. Which means they 
>> would also be disabling the heartbeat timer as well. Indeed, this is 
>> what we 
>
> I don't think so. Preempt timeout is disabled already on TGL/RCS 
> upstream but hearbeat is not and so hangcheck still works.
The pre-emption disable in upstream is not a valid solution for compute 
customers. It is a worst-of-all-worlds hack for general usage. As noted 
already, any actual compute specific customer is advised to disable all 
forms of reset and do their hang detection manually. A slightly less 
worse hack for customers that are not actually running long compute 
workloads (i.e. the vast majority of end users) is to just use a long 
pre-emption timeout.

>
>> advise compute customers to do. It is then up to the user themselves 
>> to spot a hang and to manually kill (Ctrl+C, kill ###, etc.) their 
>> task. Killing the CPU task will automatically clear up any GPU 
>> resources allocated to that task (excepting context persistence, 
>> which is a) broken and b) something we also tell compute customers to 
>> disable).
>
> What is broken with context persistence? I noticed one patch claiming 
> to be fixing something in that area which looked suspect. Has it been 
> established no userspace relies on it?
One major issue is that it has hooks into the execlist scheduler 
backend. I forget the exact details right now. The implementation as a 
whole is incredibly complex and convoluted :(. But there's stuff about 
what happens when you disable the heartbeat after having closed a 
persistence context's handle (and thus made it persisting). There's also 
things like it sends a super high priority heartbeat pulse at the point 
of becoming persisting. That plays havoc for platforms with dependent 
engines and/or compute workloads. A context becomes persisting on RCS 
and results in your unrealted CCS work being reset. It's a mess.

The comment from Daniel Vetter is that persistence should have no 
connection to the heartbeat at all. All of that dynamic behaviour and 
complexity should just be removed.

Persistence itself can stay. There are valid UMD use cases. It is just 
massively over complicated and doesn't work in all corner cases when not 
using execlist submission or on newer platforms. The simplification that 
is planned is to allow contexts to persist until the associated DRM 
master handle is closed. At that point, all contexts associated with 
that DRM handle are killed. That is what AMD and others apparently 
implement.

John.

>
> Regards,
>
> Tvrtko

