Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5B45AAC9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444F6E3CE;
	Tue, 23 Nov 2021 18:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0F16E24E;
 Tue, 23 Nov 2021 18:06:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="298493693"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="298493693"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 09:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="674562606"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2021 09:37:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 09:37:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 09:37:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 09:37:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URdKhIBnBMJfXLZo4fnWmbkxSFjmdo0KMRw7sV+RQu8YdpQDq3aZQ5ZJRE5pj3LAaKk27qRBR21pm9RzZsdB3acpjFCv7KHJ4cAXRfIsnWULx6kyrgCRJF2WXxgQ7jyqXZm5gWegeRYvtbetUoFZzNTZwz8Bz95om8sHJKtdUZD+UPmzbd3xjsB2lEs4BWP5QL8Tz6nVt8sabC+W5Io1f2VWY4ChQqzJkaeAOtjkRkp3EkLsaMeYJmSf1yPtv+5BENQ4+jtXZvdhXKRK8cKJL3QacOehgoismlNEUv7fMtCVtyqYzAVUlqpnCeIMdlnqbQnqbas1pSFb8i0NjAdXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMOuxc/YeRBBpBbmG7bWgWIHmy1QAb0Jv3JEpfwGURg=;
 b=ghKHGQhLXU1pAs4/OpjQXYzAEREFsfMRHP+Dmu5nQn6eCBW5EQq+y4jncl2/4Ae0Y0P5kWwtUi5ZSZYc2s7CnFIsJZj1rnw/tVIdFM3NQclFRUTB/1zGI6ttc1zATipTeqYhYD6OR3JPbrDxI/fWZCjzYMvp9AF6yQLZ9giBZoaDHkXvVHUFvRr1eWz7zlyrUqnBhwXXNUHUKwUJUUsF+jEC7RQBaNbHTdnOK9Pluieb7m1pyMvMWQ4EW0TSmWUCaE7zHygg7NHYAurRl0/XUcNGj9WJs6FPBDi+iyvvUhzlkevr8wJdJTcToZHVMUNQRH2ERUvUI/u1Z1I3geMMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMOuxc/YeRBBpBbmG7bWgWIHmy1QAb0Jv3JEpfwGURg=;
 b=tcbj62AI+iR8JjBmjpldYrssLzv8hKPiQKr+58zm+13t3I4uMdPhf35SQdANwmSygQ17HJRG1Jn6lgrAxPtB/7k2uba1iQkXTIp88q3Mtx5Fx0lA9/gehUKZuHExF1gSeglLCCnwzubHfuYLQ9ywcXL/gI6hy5628ESNbajYRAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5570.namprd11.prod.outlook.com (2603:10b6:303:138::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Tue, 23 Nov
 2021 17:37:27 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::c996:6b95:8421:8c33]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::c996:6b95:8421:8c33%4]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 17:37:27 +0000
Message-ID: <f8b04c02-f9dc-944f-17af-3033285ccbb6@intel.com>
Date: Tue, 23 Nov 2021 09:37:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low frequencies
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-4-vinay.belgaumkar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20211117224955.28999-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 SJ0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:33b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Tue, 23 Nov 2021 17:37:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36b83671-b854-4c35-1280-08d9aea7eaa1
X-MS-TrafficTypeDiagnostic: CO6PR11MB5570:
X-Microsoft-Antispam-PRVS: <CO6PR11MB5570CD83D1E9481DBE0BDD4585609@CO6PR11MB5570.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sj6Eop8gBLAOWq2j6RSj+5/jDREKYQh9sBb2sWDfNw50HvlieiFmdFXmtr2s9Nisen2t3HUngbMbBtMUBHk8Row9G5nG70e6ZHWM/dR32YtiA/T8gdpNi74HixiM5up9POErVNhlFWX4yCkeM1DkCjhbFFR7gJTgC8Majg2fijjRx/mhQOvB+N8egSeQkDYJ0Ha8C7NmDJU/FFMRlhCaUKhJH1AAKPV/g3O7Vfvbx5srMsB/uL7iES78kp37zY3BgVV1pHcVZGrTsIcnCud9Vmy399E93z63EobLdUaRYUmK1i603Bi4wRC8GAZt4ipaN3c/xLnV7Ooe0VRAX3eaq7zupgLOdsPxcLybKluL7DsWqNZYwd2ap6IWTfUR41SVjGd3dk0J++Cij6mj4jd5+urAaC7umw9ljd0qe42wxy9Lzz3jBW6vW6hs9Xu8XffaipJBumNnpKrDBiNeN4vboZvqGMzzrnJvmnR1SAPK6/EwxHF3+brE9UaZlbAKG52r1PC1hZpxcw8YXXZQrE9PYZs8qLYi592ZFB14SXMWe+fMobpRu2dFdNb5CvaPYXhUc5lenk61NhjAIQqT8C4nrgIn2zaACd3z7Mizw4UiiEuTmG40lcUT20Z8AOc0vvEVQSuLTqh08Pe3qQgzYtrUnMCvGm/c/zgcw4Qs45DPLzHRD0J+2tjDHbNBZFggGlnJouYdH+KcsGDWLMR3f21Xy9VL0DN/yzBHTJlZv0UxzXFyB5qYQho5NGco2iH6D9af
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(36756003)(26005)(5660300002)(66476007)(86362001)(82960400001)(83380400001)(66946007)(2616005)(31686004)(316002)(956004)(38100700002)(8936002)(6486002)(8676002)(186003)(31696002)(2906002)(4326008)(53546011)(508600001)(54906003)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVXVmMzWk1XSjMwVm90cmcrK2RNRzFPc0QxVjlvaXorQUpjK1FWdWtNTnY5?=
 =?utf-8?B?K3dQM1hTNHFNV1RQZmNXZWpVTzdUdlllRTZOMGhmVEMydmFZZ1VZUktpL2N5?=
 =?utf-8?B?QW14dU0rM29wSjc4QXN6S2dNdkdtNmVKV0JiNDJ1NnM1QTA5elhCSlRYd3RK?=
 =?utf-8?B?VDM2YzNYalI0V2FsTm9wMHBFT2hvbU1abW9VbTZtak1rLzE4UFhWdm1mWHg1?=
 =?utf-8?B?cC9odE5wZlBXcTRNY0FUMk5GZUFuTFY0TmRWV2wxQ1ptdWdFaVNVZHd1RzYv?=
 =?utf-8?B?SFR2eWNPaW5OUFJ4SktQVURhS1I1NmRNMnV3T3FNaEJpaWxEdU5lZ0M5cTZF?=
 =?utf-8?B?dThHNnptYWF4bStHTGEreHlucUtRQVI2dkJVOWpOc0lVVFFVNU5hQTF5NStr?=
 =?utf-8?B?TTdDOXJqeGNucnBtVk5aUHFWSlM2dUcyUlVnaTR4WTJzYW8zd1BvVUpCb21E?=
 =?utf-8?B?K0VncFNKUTIxUE13elAwR1BNSkZ5QVIybnBzM2hJcHNPV1NOcStSZmJJWnNV?=
 =?utf-8?B?K2l5THVicFl1eExiMnVwaGxYWjJ5alpEV1hNN0FJMEhjZVNwOVdQOVZqc2w2?=
 =?utf-8?B?ZHhLTkxlR1UzZEN2a3NDWnpEZkRTR3YvMklZV1lKdERSSktvUUttY09iZnJH?=
 =?utf-8?B?WFlZd21aZ0Uxemcrb3lhMi9ieUgvZjdDeUd2U1FmRC9hazBlS2hiWWFSVjU3?=
 =?utf-8?B?S1hsd2ZzR2VCRGcyVCtPcit4ZXc0enl6NWsxYnN5b3FhVjh0aktqSnJFUWVv?=
 =?utf-8?B?Q2YxZE9IWWxrZnpJc1ZpVUo5UzJrYmRQaGV1clVndlFmNGQxZ2p3bVRhL25V?=
 =?utf-8?B?cndCZFNHandQWXFXVzY2ajFFWEpYK2NVeWIyazd3aXQyWXFIbGdwTWpmbkVF?=
 =?utf-8?B?RUlDaVF0NjJ4M01KMURPOE9PeWZDYzAzVExGV2YxdWY5QkxtV3N5ZVgzQWpK?=
 =?utf-8?B?VkFidHJtUzFHVTE2NmtiVGlGYzFtYU11cEQzWVBGRkd2TmRneFJnaGhwaHJv?=
 =?utf-8?B?TFd3V1p1bkZvZ2FUQVRQYmEzcmZQSU9SNnJJb1VNTysyR2JrallSbnp0YS9s?=
 =?utf-8?B?Zk5mSUN2UzVjWml2TTMzZWdndldiMnE1M3h0VXoxcisycU5McTgrRlppSmJI?=
 =?utf-8?B?VjRSM2Z4SzFIa1Ezd3ZWM1F0SGlqUXFTU1V5UXcrc09oc2tWOEFzSmdhT0NJ?=
 =?utf-8?B?citNSWlrTWNSMVdBMHZ2TW95UTA1ZEd3VHUxMGxhOWtqcWhBSlVKcGdleS95?=
 =?utf-8?B?VDJUbGJWYktsRG9xTC9HN3M5QmFvaWhoWU9oamJ1aGl0dTlhZEZjbEpNZCsr?=
 =?utf-8?B?UHFzMDBUSllDYTJjWlQvdUNBdDEyT2gxdFhIVE4wdWxUdmhmR0dHNXR4bFpG?=
 =?utf-8?B?bTcvcXBzaXRTN2FRdEFEWFhHOC9DblIyRXk3VEJtVENnTTNJT2M1YU9MYm5F?=
 =?utf-8?B?OURsejZSam5nU3ZiN25Ub0hKdjhtdUlNYlZtbWlDRTJvKzdnSnh0T0hQelg2?=
 =?utf-8?B?YmRzVDkzNjQ2TERYMDJsRjdvQWx0aTVPbkVUYU5CSkw5S2oyRUdRTW5NU21h?=
 =?utf-8?B?UW5rRWlkMVp3OHFRU05ob0FMaDhWY2pRcm9vclRMelgvVFY0cWdYckErYTQ0?=
 =?utf-8?B?NWhubmd2YWxoQ0QxTkJuNnoxeHBOeDk1blZsTENkMDlDQWwwUFhZZDQ2Zmts?=
 =?utf-8?B?ZUJKRTVFMHNjd0FyVmFLbzAwWDM4M1JyeDV0eThKdnlGL0NYaGd2UHVTMG9W?=
 =?utf-8?B?dUk0RXcxWkdLZjlvOXo4STR1Y1lhRUYrTHMvT3JpWENkZ3dRQ254RTlpQ2Rr?=
 =?utf-8?B?bzJkRWEzQStEZHVwQXZkTHNreStlZVEwam56a2VKbVZCSThMNVNzc0ptdlhr?=
 =?utf-8?B?dWMvOHRtWjBNODJrcFFrYmJrZXNOQmRUak1meU1IOVJtTzB1eVhmRTFTZ1o3?=
 =?utf-8?B?NlZ4aHhWdFBnbU9IRkwvZEUyR0QwYmUxajJOVFByVll3bCs1MUlTeHgvcnFx?=
 =?utf-8?B?V1B5cUhrZmFvWFRoTE0yU3NUZjJNa3V5V3k2aGExbVNqelRhYllQN0l5U2VU?=
 =?utf-8?B?bmU0b2FFNVlWWW9sQllLYVRIcTJUNzIzVDBWZGdlSHN4My95UlZKRjUvQWtF?=
 =?utf-8?B?b011L3FKN2I2R0NKcmdwNlJpbWU5VDl5cnJ5QjROREwyVXM5Nk5sUmFRNzZD?=
 =?utf-8?B?c2xzcWs1WnJVMzY0amNVaHpFSnRzWW9NQVBua2tZdjNNUEtaVDB2Y2YrK2Q5?=
 =?utf-8?Q?Yfqx/nNVDnReYAW5ZjkrmmJxXhLXIObUA9KAZLx1uE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b83671-b854-4c35-1280-08d9aea7eaa1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 17:37:27.0743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSvVb04pX1X+mTxhWIfFGDySEuUnXrECPFoCqMfmIhVyDsJE3Ctt5G+jBRJ/N7lXOJSxqjPMfELPoKUfpdFaYytLwbtblTiB3ZymyeIkRWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5570
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/17/2021 2:49 PM, Vinay Belgaumkar wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> While the power consumption is proportional to the frequency, there is
> also a static draw for active gates. The longer we are able to powergate
> (rc6), the lower the static draw. Thus there is a sweetspot in the
> frequency/power curve where we run at higher frequency in order to sleep
> longer, aka race-to-idle. This is more evident at lower frequencies, so
> let's look to bump the frequency if we think we will benefit by sleeping
> longer at the higher frequency and so conserving power.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Data collected does show some power savings.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 31 ++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 3675ac93ded0..6af3231982af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -63,6 +63,22 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
>   	intel_uncore_write_fw(uncore, reg, val);
>   }
>   
> +static bool race_to_idle(struct intel_rps *rps, u64 busy, u64 dt)
> +{
> +	unsigned int this = rps->cur_freq;
> +	unsigned int next = rps->cur_freq + 1;
> +	u64 next_dt = next * max(busy, dt);
> +
> +	/*
> +	 * Compare estimated time spent in rc6 at the next power bin. If
> +	 * we expect to sleep longer than the estimated increased power
> +	 * cost of running at a higher frequency, it will be reduced power
> +	 * consumption overall.
> +	 */
> +	return (((next_dt - this * busy) >> 10) * this * this >
> +		((next_dt - next * busy) >> 10) * next * next);
> +}
> +
>   static void rps_timer(struct timer_list *t)
>   {
>   	struct intel_rps *rps = from_timer(rps, t, timer);
> @@ -133,7 +149,7 @@ static void rps_timer(struct timer_list *t)
>   			if (!max_busy[i])
>   				break;
>   
> -			busy += div_u64(max_busy[i], 1 << i);
> +			busy += max_busy[i] >> i;
>   		}
>   		GT_TRACE(rps_to_gt(rps),
>   			 "busy:%lld [%d%%], max:[%lld, %lld, %lld], interval:%d\n",
> @@ -141,13 +157,18 @@ static void rps_timer(struct timer_list *t)
>   			 max_busy[0], max_busy[1], max_busy[2],
>   			 rps->pm_interval);
>   
> -		if (100 * busy > rps->power.up_threshold * dt &&
> -		    rps->cur_freq < rps->max_freq_softlimit) {
> +		if (rps->cur_freq < rps->max_freq_softlimit &&
> +		    race_to_idle(rps, max_busy[0], dt)) {
> +			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
> +			rps->pm_interval = 1;
> +			schedule_work(&rps->work);
> +		} else if (rps->cur_freq < rps->max_freq_softlimit &&
> +			   100 * busy > rps->power.up_threshold * dt) {
>   			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
>   			rps->pm_interval = 1;
>   			schedule_work(&rps->work);
> -		} else if (100 * busy < rps->power.down_threshold * dt &&
> -			   rps->cur_freq > rps->min_freq_softlimit) {
> +		} else if (rps->cur_freq > rps->min_freq_softlimit &&
> +			   100 * busy < rps->power.down_threshold * dt) {
>   			rps->pm_iir |= GEN6_PM_RP_DOWN_THRESHOLD;
>   			rps->pm_interval = 1;
>   			schedule_work(&rps->work);
> 
