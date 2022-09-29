Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B95EFA4C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788F10E60C;
	Thu, 29 Sep 2022 16:22:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0310E60B;
 Thu, 29 Sep 2022 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664468523; x=1696004523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RBoKnNMK2XK/V+upw99j1Jlaox0/ogydbgAD8ABMmfk=;
 b=QWF1IuRv3GAMrb30kSjpYnnruQdTfac1+2/4TQlJ6piPNSuMmQ/wPzlR
 w1fAat/F+Lac5i7EGQRtRvnfbPMUqCYc2Xip5Fb1D2rTJE8fVNPwKSPnG
 0N5Oo+qe+AkdThdNRTOqEI51wAvo6liP3OegPwTTjQt+FmsB4M5+pXZ9a
 VdhDL7AfzJIvHvoRhnEqRtnGqgPcdU2UVeSGk4f+JeszIhEilxEl+uqbA
 RffWPWvG3MYSwssjl5l9/v987YxRsXJBFcOZ75grPzKvo9q898Z90VA3n
 7s3TtGSjH9f2PEIDiDDVZ+bhuE5wSoGiH/3xa/JOEbhU00J/Q3zzvFGoW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="328323182"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="328323182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 09:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="617661682"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="617661682"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 29 Sep 2022 09:22:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 09:22:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 09:22:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 09:22:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 09:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EybiuEboHTjPFHp6acu3OFW2GBya8D7em8jrS/qfZdykzi9+JhyqZ36xAIary1eVVvb39Oo4DUdQAgROtWuE9E+lTyPtzh7Vg+fIp8kD6dVYZFmjk99OsG6dm20LjUaOY6e26Xr1HPEHPBfgCwaU9Yd7prcoyHzhFWQ1YbYPN6EEi45XNdCvailc05dE7dhO7ipeAAz23+ik50cumQcf5K8puLUdV0XVcLVC0vssLTlPVeHDuV5VSqXk47U0bTtBgLpCY+OWpvHZvtfnMrCPQULVEj6fsZqM2qxrqSIlYoSeLaNQL/6P/LULw2ufTZ7ep2ThqBrgnj7XC6A7HhqOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrC9cZ45MBXsxlSMQTcSgxFpp1Mnnni6pRDn76c/74Y=;
 b=O0COMDDLc/ikNi2GAhswEZ7cG0lBLt0LMHB7q+K2uUvHQd5eTCr614/w6EHe83tqGG8cUDBFvpFVK3FCUKMS9GFrQdRnN7XNgEhvONQvK/4JRLrclOWowLU3t1OeKqosJQFgV9aWDdSKFA0XppVbCPgaWJWwT7LqIDSSclpgKhFUWov45GUePtqPE8TiycJ9lJ+7YRe0v0l4YVKIVczop2SjyixXNMltLKVoeYoE+jPPfK+Cgy3itbGfW81VjsYZMoE4MJz2LRbt8CnUD0UEFYswknZbTyYhUOHw3J9R1hEM6g2zR0MexHEE/oU8VAitakqptOEftQlp7ibIn+/osA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 16:21:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 16:21:59 +0000
Message-ID: <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
Date: Thu, 29 Sep 2022 09:21:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 29dbe620-a22b-421a-a5fb-08daa236bbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Za6w77D2meNASV2x8Gqxahkr4fV679dhOArxFDyhysiL4rAEyByvqAoGFpSsno2LCynx6hOqCfukpPj902+eOLyzkfoNZoiRbiWvTBG9r+USzpPJnw5Q+hM/fy24oLjzEt8CnGkVBScsgNvZwJWjAQx5aTD8010W5RyOWQvO+QVzNIZikOBxIgNyCDvrhB6aGhTQAEIZS9JSjbJFL+yrDJptUyoxkj6KZZTCctEZrH9na992qxxU/q3ojhvbq2KNtc2r8hkKqcGi8Vk7F+s3nehjsZUJ5kuzOmbBT48oazYHGdrK6WXNN218lYCSPI4/mzRLB7E8ziASJyq7iy6Vp6iWI6pNTqCSkmWKVkE+vu/Og1u5SLluQBIUs5sTgDuzyDNAllrKijswg80PGF3/I913KbL+5QjMjvuRBm/ytDN7QIPcddI5pm5oOING9dQpV7fD/uy50NpIKCfs/+fZPpp3Udp2/oGhzSQlKt2og1ZUnU8NasEh6Oz/krclLFQ3G+De4LXzxID7Wa0nYoz/PspwYyNgArAUrEK5VZHhnr/TVLonhAbY4MIst0P7vbk2LvE9+oCCe7Mbvz/iB0CSgr23RO1fKOZcBhEk/Xa9PXVOUvxvzRvsAI3qYkP2jYi2a11UrUGaM1/FvnyOw7E1ZpatVeryJzaebDVLntEowl0o/RoGGA2J9vCvTaG23RvLmE9gbtu6OIfez9bE+GDo0/YNdFaDRR0hnMkKlBUT7CrgHW1ftlBflfOcjGKt/enWpKrD3Jly4BU5r9QboMa3C+bBIGL0Q4gSnzs5DvKmfRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199015)(36756003)(31686004)(38100700002)(82960400001)(186003)(83380400001)(2616005)(31696002)(86362001)(6506007)(6666004)(53546011)(478600001)(8676002)(6512007)(26005)(316002)(4326008)(41300700001)(8936002)(5660300002)(66946007)(66556008)(66476007)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEN4OEJIRjMxenNiL0pydElscVdQRGlhM2hSK1lyY3EzZFhQS0ZjYjUweHFo?=
 =?utf-8?B?WWdDZlM3dG13TnhMUzZYQ2ZVYXQ4bys5UG41WGgzdlN6L0Y1UU1ZZEtWUXBN?=
 =?utf-8?B?WWo0SG4xMUxORExVblBjV202SVpNY2hFY04rRktPaVh0cW1wWkwrYW5HUzFs?=
 =?utf-8?B?OTU3VE9KZHg2ck5oZkcrRHFkb1I5cm0rOHZaOHY5WUhzRTZmTEZ6NTNjSlpR?=
 =?utf-8?B?azBVdUwzcjFFTmkvSTJoWkFQd3ZDakJNVC9HekZFNkJrN0FNNEsxVGZmaUlG?=
 =?utf-8?B?bUEvSnJMTnJIQXRZdGhuK1Z5K3JPVkZRZzdvUCtMUXFtMGVBRlBmTGNBOVJp?=
 =?utf-8?B?N2toUUhmYlNjUWRUVmYzYmNXR01iQ1hEUFRuVGsyOURhMnBuakZJQ3ZrUUV4?=
 =?utf-8?B?bkZaZEFJZ1NuYStYVXdjZUZqM0o4M3JIMVJNMi93aUdrMmlQMllkdjFyZ2NW?=
 =?utf-8?B?bGY0cXd4K1c1ODZsemUzYVJ0Sk1SaUQ0NWpyTWduUWMzN1ZOekpjVzd2aW14?=
 =?utf-8?B?azRWZzErTDRubTA3dUFuSFQzdTFsNW1BMHRaQUVBNmJpaG1uZ0t1SXJYVVFJ?=
 =?utf-8?B?S0N4ZE9lVHVhb2N4cmVYTmhnclhuWHFrRi9rTTh4dHphRzY0eElTK0NsOUd6?=
 =?utf-8?B?ODdxQnJXRE1ra0EyUjA0WnE3QjNaMnBxb0pvb1JSTVhFN1hvTkRQY3ZlUzdy?=
 =?utf-8?B?SGxReW5BWE5TYWI1Mk4vaXFCZ0UxR045aTFJb0pZQkpEZ3ZqSXZtaFFNdU1C?=
 =?utf-8?B?YlVFVWcrTmxEQURndExsVWZxWHdiZkFlZWRlajNuRDJ1OXNJVXh4Vk94amUw?=
 =?utf-8?B?SVZVZWttdk1taTJteHFxR0NaQXBVSnZ3ZWh2TW4yYTdhb0g5ZDJ2eGdjRDhZ?=
 =?utf-8?B?NUpGUElDR1p6elJGRWFRa1RhQzZZSHVGeXhtS3pUVXljSVlOZnF5a1UrRkcr?=
 =?utf-8?B?SUlKUE9ZSTdJS2pWSXkvNlZaQzJOL0RtUDd1dkt3ZGhvSG5RSmpJTmluY0Nq?=
 =?utf-8?B?OVNVVzRSR1A0ZUN5THhxcjdzaTZnUjdoSkUrN1lvR1RuSVNXVEdWR3U3SUVI?=
 =?utf-8?B?MkVSVEdyMkUwNDlEV2YwQm00MHA1elNMWTBES1J3blgwYXZoQUxrVTROZFlP?=
 =?utf-8?B?SHZYbFBmakRCaVRnNllURGt5UjJORzRpblFKblJlaG5iTWx1SUFOS1dnc2ZX?=
 =?utf-8?B?aGswT2p0WC9uYnNiUVZKVkdsbUgvd3dMTlM5Zm1zZVdqdTdzQWxNKzZiTy9w?=
 =?utf-8?B?cVNxQk9jajk4U2NUN2VVbVVBSEhhMXRxVEJtQWFmT1JRNXl5QmpzYllsRlV6?=
 =?utf-8?B?ZGs4WnlyRW5pRURnYmlaL1plTENhUHV1OE9rMkxWWjFFUEROQlAzNlIva01i?=
 =?utf-8?B?NDgwenc3NHJYa1ZMWk9FU2JOT2JnYVRFaWdXN3FYVy9HOTRkZEpTMldyVE9Q?=
 =?utf-8?B?K09ydkt3RGFhclQzMEZRM3NyaVR5MXErUmVIczlISFVjZ0ZZTTZMWU93QVNG?=
 =?utf-8?B?dXlaN3FjdXFaWXp5YW5mNVFJNjdyREt3MGE3MjFDT1MvL2F6Q1Vlc3V2V3gr?=
 =?utf-8?B?dWwyTFN1V3dUMHo0V2c4T21IcXpYc2pYT2hoU0ExY0ZXZkxTdlVkYUhaTnFk?=
 =?utf-8?B?eFRoY3ByNjI1c1Q4dmQxbzZaS2hlNEFnWHpOanNuVG56WC9FRTQ0TXlrbW91?=
 =?utf-8?B?MWxrRE9lcTRES3FkVktVK2FZUDFreFV0Y1ZRUFJ0d0YzbEVwMUFzUkVPTXRS?=
 =?utf-8?B?SWF1L0RmTmk2ZXRscmF6YnFhTEM2U1JkSmYrRTMydy9VVGZJUTA5TWFsQkRM?=
 =?utf-8?B?Wm5uRGMyaGw0dHhzd2hpYktjdVRNdm1HK3pDK2I2U0g2dzJMR2dubWJOUUpw?=
 =?utf-8?B?SjRTUUZMTk9CS2p1M2YzYUZ1MnozNkNwV3JnOTZKekx2ZFBtbkJpekRtbVVp?=
 =?utf-8?B?a1V0emlPT2dYTVhndUZPcVoyQWlqVTlxdmtnUmQwRGI5RW0vWTJ6dWtWRFpM?=
 =?utf-8?B?cGpUekg0S0ZMQmhCRk5wc2lCZlNzdEFxaktwNlFyNDNuZTRBM1E5VTFzTTlV?=
 =?utf-8?B?dnVwK01mY0oySityMjcxRk0yL2JZdFpkQm96UDdZWFppdnR6RnVqK01vU0sr?=
 =?utf-8?B?OWNQUkxyWEgwTnhpRG9vdDBNTzBPQTFmUmNDalRySWR1ek1TemxZcUNwTlBD?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dbe620-a22b-421a-a5fb-08daa236bbcd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 16:21:59.1284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilpFosFTbgaf/En9TYfeyQodx+fcwFWRFqRH0201MN2Tsx7mXY0yqzn8jXmaJ4EPJwG7i0uxuOuYAruQ1RRjRKlU561QUXGc/LI5bSRJLeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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

On 9/29/2022 00:42, Tvrtko Ursulin wrote:
> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Compute workloads are inherently not pre-emptible for long periods on
>> current hardware. As a workaround for this, the pre-emption timeout
>> for compute capable engines was disabled. This is undesirable with GuC
>> submission as it prevents per engine reset of hung contexts. Hence the
>> next patch will re-enable the timeout but bumped up by an order of
>> magnitude.
>>
>> However, the heartbeat might not respect that. Depending upon current
>> activity, a pre-emption to the heartbeat pulse might not even be
>> attempted until the last heartbeat period. Which means that only one
>> period is granted for the pre-emption to occur. With the aforesaid
>> bump, the pre-emption timeout could be significantly larger than this
>> heartbeat period.
>>
>> So adjust the heartbeat code to take the pre-emption timeout into
>> account. When it reaches the final (high priority) period, it now
>> ensures the delay before hitting reset is bigger than the pre-emption
>> timeout.
>>
>> v2: Fix for selftests which adjust the heartbeat period manually.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index a3698f611f457..823a790a0e2ae 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -22,9 +22,28 @@
>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>   {
>> +    struct i915_request *rq;
>>       long delay;
>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>> +
>> +    rq = engine->heartbeat.systole;
>> +
>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>> +        delay == engine->defaults.heartbeat_interval_ms) {
>
> Maybe I forgot but what is the reason for the check against the 
> default heartbeat interval?
That's the 'v2: fix for selftests that manually adjust the heartbeat'. 
If something (or someone) has explicitly set an override of the 
heartbeat then it has to be assumed that they know what they are doing, 
and if things don't work any more that's their problem. But if we don't 
respect their override then they won't get the timings they expect and 
the selftest will fail.

John.

>
> Regards,
>
> Tvrtko
>
>> +        long longer;
>> +
>> +        /*
>> +         * The final try is at the highest priority possible. Up 
>> until now
>> +         * a pre-emption might not even have been attempted. So make 
>> sure
>> +         * this last attempt allows enough time for a pre-emption to 
>> occur.
>> +         */
>> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
>> +        longer = intel_clamp_heartbeat_interval_ms(engine, longer);
>> +        if (longer > delay)
>> +            delay = longer;
>> +    }
>> +
>>       if (!delay)
>>           return false;

