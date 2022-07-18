Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B85787BA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 18:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8F790F99;
	Mon, 18 Jul 2022 16:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1590E1D;
 Mon, 18 Jul 2022 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658162943; x=1689698943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L7At2UdoklSX77f5Lpm1GPMREvY9X+j/n7FQMmyf2nU=;
 b=S3xgU1tIR5r5cnP7u0Hh3gsMR2zxH8LfFI+v76QEC1PNAuNXl1wAo9kC
 AgDA3NmE4rNr3u45tbSoOB5QY2fd0DuBy6Yfem0fUwV5MIgxyWN6egyIM
 tYRVEOPIR/BElEohJfYRhw4uH2K40otdc/a0D/4ptvTY+xFwXt/rYMrSe
 RdZNbYAL5I4WivJNo7OT6MYPSfSXd/dXg3H8TSlV5WXXSBZr+5Hpj2cnx
 zdmDSPrp7J6a9vgHQJm5UuiHkoxCHaLqQd4ZrCndqosIIKoE5Qwmu8Kl/
 kbu3ZxHwEHMOcrfoVwiERpLD5bcng2Iycst+qhINH2Hxig0Tsh1s9yKi5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287416908"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="287416908"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="686804368"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2022 09:48:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 09:48:44 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 09:48:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Jul 2022 09:48:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 09:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy/qv2i+WD+exH4sCHNqDXamgeyv+O9MQrB+SB4Z8DbqDC4ma3AMU8tKOqrqPQ+7vdI82MVnyPZiCXeBtOiUftG/n9Bda7FPKbx5jwaXjt9hpH+E+ZW7dhluyL1EQXXNT1uQIe8SUsaWD/chsQiDfND4Ca0zJ8RyvfxcEuHKveVEJP+fDJffNzuZlrCjkx8kU7hLMIUR+A9a1WkDmsogvsGtHhi3fhQbV8Yp9lDglpFcX0K4oH3ud05RUQ1Dcy6deP3HWMBFcofz7S6HcS7Ficxbm0XQKKneTpOyrl/vBXI17Ojtp089bYxerIeZ26+arsybtBlmm8eugWL0NRnzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raHMmVjNQU6yR/vNq4b+5/jd2siU1ojBtt5G8uYM91w=;
 b=cZP8smHejml/KC3VxJFbm4PGqMcw/exhsImpkkYZougt1TiW0TdVvcqIlzVWod0Dpav52pRNOwdEk5IIJoYVH1Wn6zUHThinfcGoeAdeOOA6Zgm727odZFnzzuRNiBPn6n3gC8132KHvbGkbusG2U+3gFXBr2G5fhUEu0VYNUnIR/0ZK2fJo+jFdtYkfBEPqYLdZrdpO7yy6jWdLAETUFqldpgFHINVbZGoc0T6tST0x+jjHHFPaGXKh+FPio4XQBYg797SCenaRs6ieJLYTOKy84L6eguIWs12gqgxUsHwNvRrQouY6wpKq2/SAtY//wBhBM0085hhCmUNiebmo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 16:48:42 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8a1:cb8a:5124:2848]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8a1:cb8a:5124:2848%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:48:42 +0000
Message-ID: <ad9d42a8-a41f-3543-519d-6695ac4fffe3@intel.com>
Date: Mon, 18 Jul 2022 09:48:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC] drm/i915/huc: better define HuC status getparam possible
 return values.
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220708234841.941229-1-daniele.ceraolospurio@intel.com>
 <cfdf9bd6-c921-1c48-b615-95346ac14999@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <cfdf9bd6-c921-1c48-b615-95346ac14999@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed729cc-6689-44a3-bf56-08da68dd5f42
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4880:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUo0DSLUHSK2n+v4ymEFs1inn+aNOlMr0onrT1nEX5z1omQE1ygW15OdMx/f6i2N9sil0KE99+SJDhcd+NtOepzNmLC84eOMImLl8CZ2nS3WV2s1q42qIBidIUoEIwjssqAYi6LIIKGw42SZpqwRFbL4bGwWFlXhgER9orgb5EDNXRoJuKtYao3Jh42fi9a5dbPaE1IJoMfnLbH93OZqONu9+MlThL4BHF9BOP0OY/ZygNa3dWeiZP6lhKHVRpQaCuu47dgDMnehxrSiR2iNInrnAZKtEll2LROH7nhtNFihbjaWS2Tn+m3Fb4Z15Tw8QVl+w5f56//YubEkfFdY7IpicBjZf2sfDa4XvTg0NbzvTlnTTTBtGGDVclaISGBJBjic2gS6bhsDkKUihcNkuMB+hqsh8vMP0OS/LmKNtv5ztrLvtpVcBsnI7f/DomaIQnUars/725nm5x+5xZnvccF59+x87Mlqgk90N329ZId2UWvdMY8i7jJFur33piMFuGZ5UpB/08kOj8ng5KjPtOvfL4DG0Ts8ZK35V9CuNPqqJs5biBBaN3FaH4/bcOtMTRe7y+49xXsD75Zc3qUv6jxVERspGQew8mgROUOmrPP/Aq96o6l25NT1e5bYo4T11ySi/CUoe39c1ZtxtrHt9ulFoDh26OIAzr2RxsudpBTZssJyOQnYArvBY3YjADYjuvyJdAtDgTpxIC87lov+KKqyHLG8qh3nA556+LcLAbLCAq21AT4nmkysCH0+wYzWr3vQJs03FR5m+KIp8v7U0Wm3QsUuM4HQAxeyDmqxCb8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(5660300002)(8936002)(36756003)(31686004)(2906002)(31696002)(316002)(4326008)(86362001)(66556008)(8676002)(66476007)(966005)(478600001)(6512007)(26005)(6506007)(83380400001)(38100700002)(6486002)(2616005)(186003)(53546011)(82960400001)(66946007)(41300700001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1dkeS9xcGs1citxZVV6K2kzNWliYnBFMkNmWHIrcytqQnY2TTZyVFNPWUo4?=
 =?utf-8?B?KzA0ejErK1lTbWlJY0c0aGxzVzlndHU5VHZKZ0UwL1k3UWlSTnRjTkFBdWR1?=
 =?utf-8?B?dlgrNmlWd0kwQ1ZGL294N2NTV1NLYVF6NUh6cGdmWWVzY0RnTEsrZVAzaFdx?=
 =?utf-8?B?b3Z4K3RVYXJTVXlBMCtBQ0JteWIrd0t2YWg5aGJvUnBvMW1BdSttZEdsMEZP?=
 =?utf-8?B?LzdOZGg5REQreThnUE1qdEp4WGdCYlI4NE9oWFJMRHRaVU9uQ2pPZ0lFbzd1?=
 =?utf-8?B?cG91bURqTElFekFCdGU3UjVjci93QkJpZDIvUWVxckxraFhHWThESUR6NWhh?=
 =?utf-8?B?TTRXNWY3YmVGMC9ZcTNBbnlIUlE1MEc1K2ZZNDZBYUlVWE1IOWNTbjhrNVU1?=
 =?utf-8?B?YlQramRDL2RlYkNxcDZvVDlyZnVQWXltMHRaNlRlcmhmOHc3NXVnNHAwMG9C?=
 =?utf-8?B?bVlTYVdTUy9QWWJwZmlzOStPZlVpVU9NOWVXd216MjdzZUt6MlZWN2ZFZEN6?=
 =?utf-8?B?c1N6NTdNSURmVENpVUFlSmVuNld4bGdxd0U4dUpkLzdvSFdVNWFiMnRIOHZr?=
 =?utf-8?B?QWZDSHcrc0U1S2x1MlNJWi9SZmxLbXJQcnRaeGRzM2RVSUZiaXBpdE9OQTJR?=
 =?utf-8?B?S25nMmdHMXNORXEranF5SkYwMkZQL2dGbi9ybmhiSnIvTUZuWGRMeDYzTUxM?=
 =?utf-8?B?dFlseXVzVkZWRUxyenJvNWpNaUJHcDYydGpsOWVEc0ZrWlFiM1Z1Tm4rRXBw?=
 =?utf-8?B?VkQ2ajZpRlc4Q0ZMMVl3K2JaNmpESnM4YmhkK0tBRHViVXkwenF2RXdidVVm?=
 =?utf-8?B?aUtHU0RGSG1sN3Q1b0hlaFZKYkhibWlCMWFqQWZxb1doTDlzYlpxOFR0dXlR?=
 =?utf-8?B?Kzh6YjJwb0VJUTBxdVVzd05EK21aSkVGU1RsZUJ0WnRjaGprVzIrVzNwd0lw?=
 =?utf-8?B?dUp5VkVlWnRkaFpzcGxuVWdKT09HL3dIZUlheWJLVGg3YXQzTFlsZzg1Y1VV?=
 =?utf-8?B?SUtXeVQvUXFwRGJMZ2lkWFFrN1lkSXlVWnN6WDUvRnpCL3Yyd0ZxcExKem5F?=
 =?utf-8?B?YnNSZFlPdlB2MXB1YWR0bEJVeFBzUisrdlk5UlJYSDdWZklNVFc1aFJra25J?=
 =?utf-8?B?SlZ1VHBNclFmbERjbGVlVjQzRlRKOXYwMlEveVUwSndLU2JYMUh5VjlOakJ0?=
 =?utf-8?B?aFpobDVsV0d6TVZWdWl5NGdNSnFBdWl5bEZDMmN6cGs5REhKSUlJNVlXN3h3?=
 =?utf-8?B?Zy9hczJSUEE2YlNoQ1pGd0xQaFI2ekZ0My9Dd0RiandUNlV4YWxFei9SVmha?=
 =?utf-8?B?Y0I4RTBleGFJOFdBWUlpSG5kdnYyYmdhdU8zWENtSmd3aWhaVHBEUmJiRXEr?=
 =?utf-8?B?NjNTSTAzaWx5R1Y3UVpRVXZ4WnNoZXFFaDNWaVQyalFERWxSOE1ndG9kMzJn?=
 =?utf-8?B?SlNaYmRYbjJEdGhsWmFpN1hTWkF5bE9Bb0dUZWxwQytmVmxsdGUxRDIxTkd5?=
 =?utf-8?B?SmVqV2JPUXZzZ0dJaEJuK3RIOWl2Rk5wakl4ODdxSVg3Q1M1Y3NmTktLK21o?=
 =?utf-8?B?ejQ2VmpMMzFxUHRmSmVRQldQUHNBQ2dlRExobUlPQm5GelplWm5paDVwRU5j?=
 =?utf-8?B?eGM5WVRlMFAraHBMdDNpSFJVTXI4RTNNSUJ6QUpqdUwyVVdrdGZCNUQ4cXEv?=
 =?utf-8?B?c2FDK09CZEdvUkppaVFQWXRzMFZmZ0x0N040K2VxSkNrTmdXSWtaekdGS21O?=
 =?utf-8?B?N0pEMTZBZG1rc1ZrN3lRWFQxZy9MUElaQVo0SFRHM1Y5S1dRbnNhK2xyYzF6?=
 =?utf-8?B?Z2pSUEhRQXlvdEx5NUFKUm5XQXNFeHYrYTY0dW11Skt5WkpTVmdUQ1N0d0d3?=
 =?utf-8?B?a2pMMmlIQ3RUeWEreUtyL285dGR4cjdnU0JwSmJLZ3NFRUFUTGZFNzY0TzA3?=
 =?utf-8?B?cXJaa3pCVTJFM1VXSHBVQ0pxcWNtYjdsVWNQOTdOc0h3QmNTUnBQZXlidlVx?=
 =?utf-8?B?OS9Fb2Q4eDJBRDNabEhtZEo3bG9XM1R4Smx4K01VSDlNM1ZvRXlZYmhpZ25H?=
 =?utf-8?B?YXFDajYzcDFDTFRMM2x2ekszMlluV2RBYStFQVFoTU9zdzNoWmpLekp1TXVS?=
 =?utf-8?B?NVk0M2xveGFLNXlwYjRDci8zQTNSZGpxQXJYb1JMeExCRWJwTENaRWZoMXk5?=
 =?utf-8?Q?2IUILLhqIUIxUXK/m3MGv2U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed729cc-6689-44a3-bf56-08da68dd5f42
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 16:48:42.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYZBTqxjNn0loujEtdyejsMiUKwFDG7J7LiMc4gWw0uFO4v3hO0QRRJ7WuUn6DmrK7MBT+9vbTEzCHCzFYw56wd89x8Sj6yyIMH/+QO6Vi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
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
Cc: Tony Ye <tony.ye@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/18/2022 4:26 AM, Tvrtko Ursulin wrote:
>
> On 09/07/2022 00:48, Daniele Ceraolo Spurio wrote:
>> The current HuC status getparam return values are a bit confusing in
>> regards to what happens in some scenarios. In particular, most of the
>> error cases cause the ioctl to return an error, but a couple of them,
>> INIT_FAIL and LOAD_FAIL, are not explicitly handled and neither is
>> their expected return value documented; these 2 error cases therefore
>> end up into the catch-all umbrella of the "HuC not loaded" case, with
>> this case therefore including both some error scenarios and the load
>> in progress one.
>>
>> The updates included in this patch change the handling so that all
>> error cases behave the same way, i.e. return an errno code, and so
>> that the HuC load in progress case is unambiguous.
>>
>> The patch also includes a small change to the FW init path to make sure
>> we always transition to an error state if something goes wrong.
>>
>> This is an RFC because this is a minor change in behavior for an ioctl.
>> I'm arguing that this is not an API breakage because the expected return
>> for the cases I've changed was not well defined, but I want to make sure
>> no one is in opposition to this. From comments from media driver devs
>> on a different patch [1], it sounds like the media driver already
>> expected an errno value for all errors cases and is therefore already
>> compatible with the proposed changes.
>
> I also think this is fine - just more error cases. And I don't see 
> that it could break something. So from me:
>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> And most importantly, with this change are you able to omit the patch 
> I did not like, the one which was returning a fake status while the 
> load was in progress? I can't remember if it was faking running while 
> loading or what exactly.

Yes, I'll replace the one you didn't like (returning 1 when load is in 
progress) with this one.

Daniele

>
> Regards,
>
> Tvrtko
>
>>
>> [1] 
>> https://lists.freedesktop.org/archives/intel-gfx/2022-July/300990.html
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Tony Ye <tony.ye@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c   |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c   | 14 +++++++-------
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  1 -
>>   include/uapi/drm/i915_drm.h              | 16 ++++++++++++++++
>>   4 files changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 2706a8c65090..42cb244587f1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -455,6 +455,7 @@ int intel_guc_init(struct intel_guc *guc)
>>   err_fw:
>>       intel_uc_fw_fini(&guc->fw);
>>   out:
>> +    intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>>       i915_probe_error(gt->i915, "failed with %d\n", ret);
>>       return ret;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 3bb8838e325a..bddcd3242ad0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -113,6 +113,7 @@ int intel_huc_init(struct intel_huc *huc)
>>       return 0;
>>     out:
>> +    intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>>       drm_info(&i915->drm, "HuC init failed with %d\n", err);
>>       return err;
>>   }
>> @@ -200,13 +201,8 @@ static bool huc_is_authenticated(struct 
>> intel_huc *huc)
>>    * This function reads status register to verify if HuC
>>    * firmware was successfully loaded.
>>    *
>> - * Returns:
>> - *  * -ENODEV if HuC is not present on this platform,
>> - *  * -EOPNOTSUPP if HuC firmware is disabled,
>> - *  * -ENOPKG if HuC firmware was not installed,
>> - *  * -ENOEXEC if HuC firmware is invalid or mismatched,
>> - *  * 0 if HuC firmware is not running,
>> - *  * 1 if HuC firmware is authenticated and running.
>> + * The return values match what is expected for the 
>> I915_PARAM_HUC_STATUS
>> + * getparam.
>>    */
>>   int intel_huc_check_status(struct intel_huc *huc)
>>   {
>> @@ -219,6 +215,10 @@ int intel_huc_check_status(struct intel_huc *huc)
>>           return -ENOPKG;
>>       case INTEL_UC_FIRMWARE_ERROR:
>>           return -ENOEXEC;
>> +    case INTEL_UC_FIRMWARE_INIT_FAIL:
>> +        return -ENOMEM;
>> +    case INTEL_UC_FIRMWARE_LOAD_FAIL:
>> +        return -EIO;
>>       default:
>>           break;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 27363091e1af..007401397935 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -707,7 +707,6 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>>   out_unpin:
>>       i915_gem_object_unpin_pages(uc_fw->obj);
>>   out:
>> -    intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>>       return err;
>>   }
>>   diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 094f6e377793..0950ef0d598c 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -645,6 +645,22 @@ typedef struct drm_i915_irq_wait {
>>    */
>>   #define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP    (1ul << 5)
>>   +/*
>> + * Query the status of HuC load.
>> + *
>> + * The query can fail in the following scenarios with the listed 
>> error codes:
>> + *  -ENODEV if HuC is not present on this platform,
>> + *  -EOPNOTSUPP if HuC firmware usage is disabled,
>> + *  -ENOPKG if HuC firmware fetch failed,
>> + *  -ENOEXEC if HuC firmware is invalid or mismatched,
>> + *  -ENOMEM if i915 failed to prepare the FW objects for transfer to 
>> the uC,
>> + *  -EIO if the FW transfer or the FW authentication failed.
>> + *
>> + * If the IOCTL is successful, the returned parameter will be set to 
>> one of the
>> + * following values:
>> + *  * 0 if HuC firmware load is not complete,
>> + *  * 1 if HuC firmware is authenticated and running.
>> + */
>>   #define I915_PARAM_HUC_STATUS         42
>>     /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to 
>> opt-out of

