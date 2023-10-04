Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08C7B84C7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 18:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1A10E38B;
	Wed,  4 Oct 2023 16:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424410E38B;
 Wed,  4 Oct 2023 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436266; x=1727972266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6TbLWLjD/60ITkzbEgs4Iu7+Sh+rvxdK5wL7pMst7yU=;
 b=EpwXUy4OlGnXr5tq4+QyAEPcDUZzCpjahyKuq0AKNUpCzXcQolHgnNFg
 SJYygwL7vIJxKPHZvZP1C8dIlJN8bCR2G5TI+JVnHECORkJqbwGLdYELH
 v9fyTZWm/nT5+VExQV1pbOgidQbsoMfpPWZN81URdAIasGccOQbL+ANp2
 W59ghD1ies7Ltu83Df0eg4BsaPOM9ip9cJLzmS8kmi0tmwxm5jHCKp4fc
 IpKabDzfmHZhCWMIM25zs+1kz+fdXyv2/BD+pGJdiJztlE2hehxx2S8m/
 8ugwXkH00eWZvsrYRcEts70efqXzbuLOnqtuMD4HCIpxEgBUb20URV8eW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447397055"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="447397055"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841941921"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="841941921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:17:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:17:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:17:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZMCNFy1ZX2gsYT4eMrPd/QUiaf8GkDpQJvQXQAM/rcnuS+aCxRsTkqhXlf2Zd7e+cMj9JvysZd9DJ3LqpFC1AgL4KO+b+Cf71XW6wWp619qmoUK1V/7NJPtyiSmWBomkcvvnl5m7h6I1tPcW3W+2wL12fw+meYSkQuHP9gO3btNsS1IgA2vvJ8hoKJ5TDZ7y+XZjKFZcvNeRSHPwGG5NtbWC5vvOr1luEOWGd4XDbhaHxXLWzSazACSW6W7c7fwQL8Eso2IOZp05w986RZct72K+jV1WRhr6AuMEKH+Q/vvgcDsvx7pelQ2f/JmXXiiVpOitEJ3Gv2A2AMElg2MQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NJ0xou0EmbC4Biuf8Jrg1cR+ufBer2I1SdOyqdTWR4=;
 b=nekEJgMdjloFn+x0emARDNdNpqB/I8zbbyQQhxEU7cFOaEFpMGMpDCxu3qQk9fdevQQ+WhOTSvxzZx/tAEVmgSvMlWt9ey45PVxkPPnkQ9EyakADou4iw8nwen1RJS0jvzYxK9ILSwE/ZAP8zXnw3i5inJ3dp9sHwSjmsA2uUE1jCNMJFrO7HeTSm3RxIPG3v1kKYx3ASDCNtHC17d5en8Tf43FVDxNwBzT29DqJexxzXYWSmvMXtRr+t7MNt+aHPWPcd5G1zbS6PDWxzwbbU1tvVGO5ItA3UnZjMjOdfz3tafPRQ8wcqTRKX/gliO2AvTwJlJ2WWzr3KlxkYyvnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2976.namprd11.prod.outlook.com (2603:10b6:805:d5::22)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 16:17:21 +0000
Received: from SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::25de:7285:e0b7:a042]) by SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::25de:7285:e0b7:a042%7]) with mapi id 15.20.6813.027; Wed, 4 Oct 2023
 16:17:20 +0000
Message-ID: <09e517e8-c02e-4cbc-e40b-4e1ef2e1c573@intel.com>
Date: Wed, 4 Oct 2023 18:17:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Reduce MCR lock surface
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
References: <20231004120407.12251-1-nirmoy.das@intel.com>
 <ZR1eOHqOFK57OURn@intel.com>
 <e01e301b-80a8-bf5c-b14c-695ab086d571@linux.intel.com>
 <ZR14qGUlWRRIlREX@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZR14qGUlWRRIlREX@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0236.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::8) To SN6PR11MB2976.namprd11.prod.outlook.com
 (2603:10b6:805:d5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2976:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e0eac3-4966-4fad-c81c-08dbc4f5626e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HImlcN+zJeOsmWM7hctQ7sD7/D03tTt7xbDfZTA++wUDfoo9c/uIvWXeEEHErjK3Bfdo+QyJ8TPck6xVLgmab0Y/6MT2ztSt0SiCn9S8MAVXtqH8puXtHEVbPI8c3xM4O91l0qgVsleLjGZ6cB1jvTcWlKiI3HvaoDSPYR9LWKfXdiSKlK9XjlZNorTjgwqm6LlbSkLz0s8q5XNlQKSgRz+qFpifSsj+xzSTu1Ksy3jWEKr98QLqWfaKJwJK8/q6BN/4paApjUes0inLXIu6qzYXqPY2XxrkTAoeDyGSGQ0ZZ2BHqmRiunzYaWqyL+Cz5jVPFqcDe9t9QnmQs8KNlSEwDQWY21vkgPEwJF4kBz6lYyyxo5re+biK9n0mL5n+o4iOaUTWXJFARsARtl3lXBq9vfQ6dTD8jsY4Z4uhuIaXOGTpd0b0lo+6IKriqDK6Bz3raAoDYFfqFxak5TYNl1YUCpzZ/CequLeBrDlJz2Lvvc8WvLjGCyJ9Yk94L/MZGIZCbmOKSdGvl6XtCOFwYRNMzRVardF2SGufirBMIieZu/GzJC/drdoPNHmOlptDN3/M+JMyMPHCTjpTTq2MD5XNYmJ5RmmQDrN08rdgjxOeQ3x0tZs+b/aGpFT3uNTe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2976.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(26005)(31686004)(8676002)(110136005)(8936002)(4326008)(5660300002)(66946007)(44832011)(41300700001)(66556008)(66476007)(966005)(6486002)(6512007)(478600001)(6506007)(53546011)(6666004)(316002)(2616005)(83380400001)(38100700002)(82960400001)(36756003)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFFXcVBkOWlvTHQ3NERWTnpyNzJOb0JDeDlaZDFOT2hyNHFDU2pGRVFNMUdT?=
 =?utf-8?B?a3pvaGkzeVFRbUhCVzFTZEpnSXQvR0hCcEdkK3BJVlpOR05kREhTUjNYVFVF?=
 =?utf-8?B?Z0JhNFVVa3doVHpsNU84RWN2bjVYa2NiaWd4bXdveEFmL1hhRHpyMUxzQy9L?=
 =?utf-8?B?bU5NTWliaEQ0RXhPK3BxM3UrVXhnUFczRHNRY3NibUdQQ2FFYXhNbCs5L2dU?=
 =?utf-8?B?a3c2TThYd2lCb0xTSHI3ZDB0eE5yOU4raEhzbU9UMk5xMEg1V2w0bFNWclhs?=
 =?utf-8?B?RkNGUFpBUkJ5MlJyU3lrY2ZWMW1laVNkYU1QemswQ3dRWkZtSCt5aGh5eDg3?=
 =?utf-8?B?YkJzWDk1ZjBmNTNoR3BOY2p5WXBqUkxqTUZldVZPTDhSSS9DZC84YWJNcHpy?=
 =?utf-8?B?Rlp6eStqQjVvUnJkSjRZc0FiSnRXNXluOVlMalhMTGRQS0crYWRxbnJEc1Jv?=
 =?utf-8?B?L2cyNWltRWN5Z0RXNXFRamZwWEVMcGJ1b3o2TjBQQmg3eDZ3c3pFdmZzODd0?=
 =?utf-8?B?c2JoNlNIeHY2TEZob05TWnVzVm9WZUM5S3BXeVVQUDNjclBUMEMrL040WWdF?=
 =?utf-8?B?d0R6K0JlczJ1WGR2M2owTXk2ZnhBVEZJZXJ2NDF1UjRQZ3k3Yk1MWUFtdDBM?=
 =?utf-8?B?WmZja0dBMFd1eG9NcmlWM2lqdWdVYitlSW9XdENmSlQ0Q2ZQR1d0d2RUZFdq?=
 =?utf-8?B?aDUzVm1VWXFlVGEzSmt5cTZEdWt0V2RzcmFwZkF5cEg1dXRpQ1ZnaC9UOUtj?=
 =?utf-8?B?ZEx3bGJNT3VkeHBZaCtRb2NqM1VZSFdDWnpSZ3dMbkJRZUFXYXdRcFJEQU1z?=
 =?utf-8?B?UlB2SFJvMUJnS3BGSWF3b2pQZm9UZFppWVB2MU1TQjJJZy8wQ1RiN1owUXVO?=
 =?utf-8?B?QXQ1bzlOdStXRmllQ1BTUTNoSEtOUFRIU2VOd2ZSSW9RKzBZRjdmdEN5Y1FX?=
 =?utf-8?B?N1pIdzVkTzBVK1Q3UWd6eDkvNXBpZEJYY3l2S1FpbmNkU1dmZHF3M0crL0d6?=
 =?utf-8?B?QldkR0VOY213QXJsR1N5MFpNdWYybVNpS1ZjMlZLWm5IclhnQS83eEpOSGpx?=
 =?utf-8?B?ZTBJNWJOOG9DcVYyZ1dZSzNQRmNFVnNtTkx2eExiOG1nSXQ3Z3o4eTJ1clVL?=
 =?utf-8?B?UWlLMWl2N0dFME43YTJVaDlnU2JWUXl5MlB5RjRHbkFwaTk0c293bE5nRFhJ?=
 =?utf-8?B?U0dJWVZjdFUyNGppOVhXTlFpb2hYLzdLam85VkNUSXUrbzE2TTQvNUxWMjhL?=
 =?utf-8?B?aDNhRWh4YW5JY0hOV0FkbVd3N3A0Q1owaWtZeTRNV2thR3BiOXRycjVJVCtR?=
 =?utf-8?B?V1hSWCtjZGtueHhDc2wzd3NsNzdKOE5WOXlzeHBWMk5IZ0xpdkJPUE9xeTJZ?=
 =?utf-8?B?c2ZPajhOdERzRHZDWmlnNmVDRThreFVZOGJoTFNHZDN0Yi8yWTRLVEhyLzN0?=
 =?utf-8?B?WU1sdFpvWXhyK1NCcUMrZ3dxVG4zNzFNM0xpVU5tWm5VZ2hsYzMxcFlmcjMz?=
 =?utf-8?B?Qk96dVVnVWdlZ1NUT0tZOHpHWW1UTEtxd2hFbjdmSkU3MGVMamtKbHJKbXZn?=
 =?utf-8?B?cjNRcWpOZFpTVGVkMXFYVTZtS1YzZ1hRMHJKM0NGcTExQUUzRzhMcmZGS2RS?=
 =?utf-8?B?c2o0YjFkRFo2cEpTSXE1cnFvbkVrLytiMC9wOGpZSkpUTGhPdytyRzMvbmlM?=
 =?utf-8?B?UTRiT2ZtVnE5cnRZTVcrUU0zQnhlV3ZyZXpaVlZaR1Q3ekpveWlxZWE2b1Jy?=
 =?utf-8?B?a1Z0UExURTdLakdHbHJoMzEwQStVNktRNnh5UGszSHZxYW5oaEgrcHpoaXYy?=
 =?utf-8?B?dWVEamNHSDlBQTloOEhWT3hucEVDS0h3bi90UElQSFE2MjgyNlFwL0IyM1hk?=
 =?utf-8?B?U2FvaFcrbHJTVU40NlhyTE13cjdpQVI4d042T2ZDQkRyTmNMZjkreWdxSTNw?=
 =?utf-8?B?Z3BKcDZlTUJ4bG1Jc1JjR29mbkZ6WkMzY2IrWjBpYk1NalFVN245cWkxWEtF?=
 =?utf-8?B?Mzgwd0Z5SVhZeTBJZjhKbWNGYkE2aHF5elRaS29IWm84aElQcENWZnV2bGhY?=
 =?utf-8?B?ZU8rTEwxclZId1NSamNab1NHaXUrc3ZJenluUXFNK1MrNm5KMy9aNkpmdUEv?=
 =?utf-8?Q?oXYM48vDuK4Qz7GVq/dMoaj3Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e0eac3-4966-4fad-c81c-08dbc4f5626e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:17:20.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8lZpOCOXOgS0JQQNuSX5037qkeESvqqF0+3AQmlJVWaH60KGcKcSovCNAFb6PQIflTooWcs2IOhH5CHcsZcsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 10/4/2023 4:37 PM, Rodrigo Vivi wrote:
> On Wed, Oct 04, 2023 at 03:54:59PM +0200, Nirmoy Das wrote:
>> Hi Rodrigo,
>>
>> On 10/4/2023 2:44 PM, Rodrigo Vivi wrote:
>>> On Wed, Oct 04, 2023 at 02:04:07PM +0200, Nirmoy Das wrote:
>>>> Take the mcr lock only when driver needs to write into a mcr based
>>>> tlb based registers.
>>>>
>>>> To prevent GT reset interference, employ gt->reset.mutex instead, since
>>>> intel_gt_mcr_multicast_write relies on gt->uncore->lock not being held.
>>> This looks a lot like protecting code and not protecting data [1]
>>>
>>> But to be really honest I'm afraid we were already doing this before
>>> this patch but with 2 other locks instead.
>> I haven't thought about that but yes, the issue was there already.
>>
>>
>>> [1] - https://blog.ffwll.ch/2022/07/locking-engineering.html
>>>
>>>> v2: remove unused var, flags.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_tlb.c | 13 +++++--------
>>>>    1 file changed, 5 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
>>>> index 139608c30d97..0ad905df4a98 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
>>>> @@ -52,15 +52,13 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>>>    	struct intel_engine_cs *engine;
>>>>    	intel_engine_mask_t awake, tmp;
>>>>    	enum intel_engine_id id;
>>>> -	unsigned long flags;
>>>>    	if (GRAPHICS_VER(i915) < 8)
>>>>    		return;
>>>>    	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>>> -	intel_gt_mcr_lock(gt, &flags);
>>>> -	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
>>>> +	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */
>>> I'm still looking at this and the commit message above and trying to understand
>>> why we are doing this and changing the previous 2 by this other one. why?
>>
>> We need the MCR lock only for intel_gt_mcr_multicast_*() so I am not
>> replacing the two locks here but moving the mcr lock down
>>
>> where we were doing intel_gt_mcr_multicast_write_fw()
>>
>>
>> why s/spin_lock(&uncore->lock)/mutex_lock(&gt->reset.mutex):
>>
>> intel_gt_mcr_multicast_*() expects gt->uncore->lock to be not held
> is there any lockdep assert or primitive that we could/should do
> that to avoid this same issue in the future?

We have locdep asserts for those mcr functions.


> anyway, this is also another thing that it is important for the
> commit message.
>
> and why is that? what I have in mind goes along with the comment
> above intel_de_read_fw():
> """
> Access to registers should
>   * therefore generally be serialised, by either the dev_priv->uncore.lock or
> """

Yes, the commit message should've been more clear.


Anyways, please ignore this patch. I need to find a better way and it 
also didn't fix the issue completely that I was working on.


Thanks,

Nirmoy

>
>> and to
>> achieve this, I could do something like:
>>
>> if (engine->tlb_inv.mcr) {
>>
>>       spin_unlock(&uncore->lock);
>>
>>       intel_gt_mcr_lock(gt, &flags);
>>
>>       intel_gt_mcr_multicast_write_fw
>>
>>       intel_gt_mcr_unlock(gt, flags);
>>
>>      spin_lock(&uncore->lock);
>>
>> }
>>
>> Or take gt->reset.mutex instead which should block any concurrent gt reset.
>>
>> If this is not acceptable then I can pick the above 1st option but I am not
>> sure how safe is it do release uncore->lock and then take it back again.
> hmm... probably the gt_reset one is better than releasing and grabbing it
> again.
>
>>>>    	awake = 0;
>>>>    	for_each_engine(engine, gt, id) {
>>>> @@ -68,9 +66,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>>>    			continue;
>>>>    		if (engine->tlb_inv.mcr)
>>>> -			intel_gt_mcr_multicast_write_fw(gt,
>>>> -							engine->tlb_inv.reg.mcr_reg,
>>>> -							engine->tlb_inv.request);
>>>> +			intel_gt_mcr_multicast_write(gt,
>>>> +						     engine->tlb_inv.reg.mcr_reg,
>>>> +						     engine->tlb_inv.request);
>>> you are already taking the forcewake_all domain above, so you wouldn't
>>> need to convert this to the variant that grabs the forcewake underneath.
>>>
>>> Also this is not mentioned in the commit message above.
>> intel_gt_mcr_multicast_write() takes the mcr lock for us, helps replacing multiple lines into one.
>> Will there be any side-effects for that ?
> hmm... I can't forsee side-effects here... but I'm asking myself why on the non
> MCR ones we are using the global forcewake_all and the _fw to start with.
> Maybe there was a reason for that? Because in general we should prefer the non _fw
> variants to start with. Maybe we should dig into the history there to understand
> why the line below started with the intel_uncore_write_fw below?
>
>> I should've added that the commit message.
> I'm even wondering if this should be 2 separated patches?!
>
>> Regards,
>> Nirmoy
>>
>>
>>>>    		else
>>>>    			intel_uncore_write_fw(uncore,
>>>>    					      engine->tlb_inv.reg.reg,
>>>> @@ -90,8 +88,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>>>>    	     IS_ALDERLAKE_P(i915)))
>>>>    		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>>>> -	spin_unlock(&uncore->lock);
>>>> -	intel_gt_mcr_unlock(gt, flags);
>>>> +	mutex_unlock(&gt->reset.mutex);
>>>>    	for_each_engine_masked(engine, gt, awake, tmp) {
>>>>    		if (wait_for_invalidate(engine))
>>>> -- 
>>>> 2.41.0
>>>>
