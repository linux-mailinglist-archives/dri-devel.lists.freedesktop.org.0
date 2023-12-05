Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4B804CF0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA7610E46C;
	Tue,  5 Dec 2023 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D439B10E46C;
 Tue,  5 Dec 2023 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701766267; x=1733302267;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2z11bziZsoQJRbnuuZHhCOtbpgbfW0k4mtpoucs0yOU=;
 b=DsWpPrrU+nE1+rf/qJaFUoIj89op0xnU5V1IXdQCo6XjgxWcAz1bWIVl
 VjKaBUh0AJcX8O1JnADOoDOYuuuM+LcadAOpvQFOwxfNGLRy+3s07HckZ
 7ESlwXrtERzDoyQYrQKUAl2TMccbRnx6XoHg7fvwwWafa20yNPktZOA/u
 EynWx+OtctRyKrXBiM+1bYXNvRB30QwzJuXTckq9VMdidtuIW6tMOTU/c
 TAV4zTlpOdNLiEBdbaBAm9GYl0u2gQlh933Ynonwm8QMzerJ8qxzN44kF
 28zQj+3t2S7lygwFEottR6LcKKLHU2BnFlr7VHSrBDlPKBwfcbz3ByWYm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746266"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="746266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 00:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="18891929"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 00:51:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 00:51:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 00:51:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 00:51:04 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 00:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iabiKyC2FAIbOBIsKgJ2UGWx5PdoKJsQ+YFWmJKOP/I2sVTwMKXbsCnP59IG+uqXLjpui0O1hFy9pBTizQ6i9Y/Akv8W9T3ge//UiC1Uu0zTHS7dV/A5wyopdFz/11qa8XyGAd74y68lAsSi03ii4M153g1w+4jWQ+TVaEwcONYkF1q+jvDE6LGyqgLNeqxY4FBTYCoTjtljxikDy1AzGqISIFYDnSJlxuTe968vRORMAZD4hNxc0pGRUdygwbxaoMOBK78/i6WjVjPoZdCDSZCGMPnXQNt61SEYHxhhP7Ny2S1Fong2dUiUOElkWjZqXb88X7tKVS5UCQZ7XYQcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78YuYb6EsD2vNs56oRNvEzaxfraaVW/wlu6JeI+FyV0=;
 b=HE+AmeaEwvLqbuTtrm5sRa1qAxPJ7K41jyWi1+KWmM/e1pUNziircVBb5K+A623nBmVYu9Cixv2fCbLXPLA1Z5Ch03JVIhRhdEhcCd2uHwkI4l/+5f0/Ic5vpqCusa+jFOfOKUuw1GBe9TF6K7dHIXnOF4/eldWNLyPjRUnv5qA3aT+dymu7Q1mzsTztxuYDcb6fCRMLTdccB6sUiCv0Hd4KcqgiX+v9vrWpRY5w5tKbQCVb9ZsMUpzFq9gPJWUYH8yTXqSGRH/+N55zuAM88rWX9/GhA4shhNuapNJb35Ljiaju/oZ4Z5odPf9XiqUyuQqERwR3wff6r55tCEsZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2976.namprd11.prod.outlook.com (2603:10b6:805:d5::22)
 by SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 08:51:03 +0000
Received: from SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::d82d:dd82:4504:75d7]) by SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::d82d:dd82:4504:75d7%3]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 08:51:03 +0000
Message-ID: <d50cc22d-670a-49e3-92c7-361fdac66fc6@intel.com>
Date: Tue, 5 Dec 2023 09:50:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Reduce log severity on reset
 prepare.
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20231201154443.16660-1-nirmoy.das@intel.com>
 <cff13a24-2f7f-4d44-8fd4-a45cbfa1c76e@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <cff13a24-2f7f-4d44-8fd4-a45cbfa1c76e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0011.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::16) To DM6PR11MB2971.namprd11.prod.outlook.com
 (2603:10b6:5:72::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2976:EE_|SJ0PR11MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf448d2-6137-43de-6a59-08dbf56f4ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: az3x20IGMPXPpvpQaa/drjPEg1wCKskSMQocQXkdxTBv5bomDQMVLrqk4u+4HRJGNk6c1459MGOl4w2oL5V5KlcLvnWhVu2jcHuJVMzlc8XBlW6SVGuNydPVWCgxBs2gyy+Mp1M3ARDgODiMxo9FIgdSws7GmTkRB3Arf47zexIYCPoAyLjiCy7Q+6pvBLm+XPtvIypj523wi8AhQ7ilO4tQHUGJgb1g0DkqEwY2N2dwnV7CLZxWc7OH3v4I5xch5k7cZSe1vTEqMkhXTqT9JMJYdWfXc5Czk5fDegcdTPFP+MLViYihHjkgCcQBBXwqrJ/N6XhS/Y+qkrONDtUj/iXZkicBRqxNGKWRCfck+ENYr+8uQ62Le8w/Vup5ZtrFV20IWWpy8Fk8ejVsZFebL1kRw/uHwtnndcloBBArYcCnmMs3RvV+6FyU146uY3mjUbMeK554CAeHTCeOZvqwRqyYxHhNQZLpSUX0VZhqNucIaBupDhw1qfhyF8ppPcVCEXNv1N5+sd+aGZ+hZfIvnDv5md5QYzAvvqGcB6JTFpvOpZgo3D5n3tZuATSq09EDGbygQ29hGpB9LXqZLMGupePHK5/6btFvEpWKOoQamj6asUSNRWyGpdiiGuwTcs5I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2976.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(5660300002)(2906002)(31696002)(8676002)(8936002)(4326008)(316002)(66476007)(66946007)(54906003)(66556008)(86362001)(44832011)(36756003)(478600001)(966005)(6486002)(2616005)(6512007)(53546011)(6506007)(6666004)(26005)(82960400001)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFdjMTZYQkcrN25ZRThOeUoxdlFPajUrLzkvNVNqTUhPUU1abnVZRUZGRWNl?=
 =?utf-8?B?eDBWL1I4d2N0a29xc0tDbUNpVXY4WXRDNkxpejh1SVBXWWhPUE9qaXBBU0wz?=
 =?utf-8?B?VXF3alJ4QUUxSk92Mk1FeFNlTGplaVhiY0RYU3NReFo4alFjM3FGYlIwRTJS?=
 =?utf-8?B?RTlkZnNZTHlMQmhaaWZNSzNvaEhGdEFTd2czTmNtQThxLzF0SXhWRDNZQXJ0?=
 =?utf-8?B?V2J2YmdaSVVCN1VPMkcvWjA0UElqSWlFSkhmZlJ5WkdTaWFFakdXZjFwaFM0?=
 =?utf-8?B?eGYwcmR6b2VXRHcwWGxnSjcvN3BycGQvOXNJaDV1ZVpyZXpRZ05SbGlyajZM?=
 =?utf-8?B?NVlmTnJSYWhJZ0VlalRFSHRnUVFqTGp6N2tWY3dNVDB1T0ZYbDhDZisrOTMr?=
 =?utf-8?B?dlg4SkVicU5rZkM3eUt2RGxrQWNMdm01a0pSWDZuYUJvUWRQb25abzlZVlk4?=
 =?utf-8?B?WTJ6VHhSK01Oaldqei9PT0d6bUR4S2I3ZEtzNEZkNWZFNlQyaEdDZ0lJWXlx?=
 =?utf-8?B?NzR6ZXllWjFybU84UXBBb21DSzcwOXZPUDlIQm1WWHBEMUowczN3NTdkcXVF?=
 =?utf-8?B?QjlxSHZvUkJkaTA2K3I1NE9vQnJYclpSckROUGp5dmNjelRBTkxjemJ3L2Ur?=
 =?utf-8?B?NzRrZDFWQU1Qb3JNOElWSDg4V25hck9CNTJrditxY0I1dGFuNUtxNzVkNmRK?=
 =?utf-8?B?ZFJuWlpWWE91elMrVllSNElra01LVXl0NGx5RWNiVTVGRVRFTGFvYUtyaVdM?=
 =?utf-8?B?eTl6Tm11aUlQSWFMS3lyQnltWDJTcmU4WmYvN1NGRWdJOE1TbHBMS3RPSE5n?=
 =?utf-8?B?dU4wWjdyTlFtUGl3Z1JsZGo4enpmaVk5WGVBbXNhSy9jdFNWTitobGdmYXpD?=
 =?utf-8?B?ejF2MVhiZDFOU1I1VWIzZzNJd2h1KzBCZnRUUCticGt6Mm9wS0dsNXJORFRk?=
 =?utf-8?B?Q3ZRZDhPeDd2WkFsZm43emV2THBQK293VUtzdnBaSlJXVTdWcHpUQ0ttNnd4?=
 =?utf-8?B?ZFlJZm5QV3cwNno1S1M4aml0YmpFdkp0aU0vd3pOR3NucGd2OGlYZzJwYVhv?=
 =?utf-8?B?K3hpNXc4NE56VFVWUnVkR29vcitvUERtTWNhcHNsWEFYbytUWjF2aTQ4QkNM?=
 =?utf-8?B?V2k2aFlFalVEZ25GaHNxNThkZVJLZU9DV29uZXd5Vm1iQjhEZGY5M3d5K2xz?=
 =?utf-8?B?OXB4VXNIbFI2eDVZQlZuYndtVFVwZnRLMUVjaG42dEN4Wk54WmppK0RzZXZV?=
 =?utf-8?B?c3FON2IxOHR1aXZLdnQ5UWNmMVNmNHFVMzRiVDU4SDRkR0RiRVJSYTBoYTVD?=
 =?utf-8?B?WWF0SVBIYkwyQWtWcHpjdllkdmRiZDJsMGh2V2Y3aEFGRXZEbFNEOGhUdUFE?=
 =?utf-8?B?Q3NKdFREREkrK0l5Q1dTdzBMKy9VK0RkYkJoM1Q1bFhEeXh5NjI1OG9ZMUdW?=
 =?utf-8?B?ejd4RjlFNDd0WUdaZXJtQ1lWOUtkcUNHV2RQTmZ5SmI2eTVHaUQxbnpwUU8v?=
 =?utf-8?B?bHhPT1FYSXhwYlBmQ29zaUlpNUFlL2RzVXovdVhFemwvdExtaUJURVdFV21j?=
 =?utf-8?B?dy81RnBBWW11ckxOMlo4ZjhOVExWOWJPbVhpVVl5VTFUNFlVOFdlL0loVExO?=
 =?utf-8?B?bCtJbU9DQytlcDc3Vjdmc1VieUh0VWpvRXJpV0NwR2g0TUdNNW5mZk5Gb1c5?=
 =?utf-8?B?RjZQSHFMMklBOXZGVFpyejZRYVJLMVFHNXY1OWY3QSt5dHkwZ2ZrWlBuSmNh?=
 =?utf-8?B?ZlFlSEFhejB2dTJBRGJjUGJHZVZnVytpYkF4NWVLbHR2ci9TUGNuSW5UYTVx?=
 =?utf-8?B?eUVSSW1SZlZuVkJNUjJIVnM0dkc3c3NBNWpDdU9WcUdqQ05EZkVJYUNRRTlt?=
 =?utf-8?B?QnJqd2ZNaWN3L0QwdTZhQXBDZEkzdTRlQWsxYnRlYTNLWFA2S2JtWHFiSHB2?=
 =?utf-8?B?Ly9KQktQWWg2dkltdkhUKzhkV0FLWEJnTUJEbGNpeXZTTFNwVnVRbVlOWnBn?=
 =?utf-8?B?UjA2V3lGeER0RGZJSFdFejNyUGRjK0R1U3l2blRnSmV5VldWSHBoY2RvRUVY?=
 =?utf-8?B?eUd6Q3JwbU8vdWRGMTlUeldYMnNEeGttQ2M4WXNySStoVTRUUUhXWTU1VVRV?=
 =?utf-8?Q?2WrYuyO0g6Ze1bKWe1vqc7Te7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf448d2-6137-43de-6a59-08dbf56f4ee3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 08:51:02.8857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDURfLK79BUhHJpsLrniO1mPVnstuRLOjjHtx3NNkstns5u6pVb7bOw+KXcBvpSQAUxre2yfUm/H6bJb4t4+YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5613
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
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On 12/5/2023 9:34 AM, Tvrtko Ursulin wrote:
>
> On 01/12/2023 15:44, Nirmoy Das wrote:
>> gen8_engine_reset_prepare() can fail when HW fails to set
>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>> error as driver will retry.
>>
>> Let the caller of gen8_engine_reset_prepare() decide if a
>> failure in gen8_engine_reset_prepare is an error or not.
>
> No complaints per se but I don't see the caller deciding and it is not 
> really reducing log level but converting to trace. So commit message 
> and patch do not align for me which I think should be improved.


I meant the return value is checked by the caller, gen8_reset_engines(). 
I will resend with a improved commit message.

Thanks,

Nirmoy

>
> Regards,
>
> Tvrtko
>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index d5ed904f355d..e6fbc6202c80 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>> intel_engine_cs *engine)
>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>                          700, 0, NULL);
>>       if (ret)
>> -        gt_err(engine->gt,
>> -               "%s reset request timed out: {request: %08x, 
>> RESET_CTL: %08x}\n",
>> -               engine->name, request,
>> -               intel_uncore_read_fw(uncore, reg));
>> +        GT_TRACE(engine->gt,
>> +             "%s reset request timed out: {request: %08x, RESET_CTL: 
>> %08x}\n",
>> +             engine->name, request,
>> +             intel_uncore_read_fw(uncore, reg));
>>         return ret;
>>   }
