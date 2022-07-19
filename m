Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBF578EB1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63814113858;
	Tue, 19 Jul 2022 00:05:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC74A113841;
 Tue, 19 Jul 2022 00:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658189125; x=1689725125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2igsJRncqUdKtadKUmPMYLSwjN5yRTqSF23xTz4ajLk=;
 b=dkwlF5TZMux8BZU4uFhQe9QqhLbgo+Br+RDvgOSeTsqahIW/0bGtbv5a
 kshFIFMBfQ3qhWZ/K/37iDXmn4Iss77iJSJVbr2hoVi6CcdvyTyCmmvpj
 Aw/zK62fJYcMWbS4z5JIyAFguWgKClcaex8+2F7XBr07fsqCpDhoWDz0J
 8ESrJtYe5PfYVotq/cvHDodpfXyHHCtY5+5xcdnOWbdXrIOkdekEk2SrA
 ts7CUWXMZkPFuLMRjl/duEyH83OQLC9VilKLoA4g7c6vqubKWMUDNaFe7
 UZGLNL459Hwsus+TgbRYfxIKkDbxyYjCmuNn/6DO99ieMar1Xqt92EAhl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287497313"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="287497313"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 17:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="601388360"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2022 17:05:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 17:05:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 17:05:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 17:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFCflmxHhLumnh756NhwaOJYZHt8844/paFRXBmJpbwDMQzFQVCsVt4aGOZNA9p/6g4F3aNICrod6QZy6C/UPcT7EoVarEyMk/tFBMdbkD+wycpNwroT30OXrd4O4tRmb/BCOPof0NAKWaUn66X7tKjMGMf1WDALWnAilIsFyBR66mYp89wRp7ZtGk8zClwy0/YPeDMKeWdsGjhrZ0uufh3KR0jqD0F9iLnDMM1xw7Up/rs4pu4bJseDnZpKeOzPzSllHtx232S3+IxEmonB5yQfIiVVlwhtRQSiYcba97rafdG4KEzUq4cBNTieyAj0W86ke/vnn4Og12ornUkQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3szMEyJATYxdpK0nn3YAVCKGidLJB3RdBM+9EP9Yv9I=;
 b=PBmkyW50xiXCsTvyVQNDxZndVvIAAa4r1BvSjIAR85hkPymKJtuDHK/HxHqtJJcOplkICod3QMtt+wAummOSdxcHkfLIyRARUf41LbM7rSIdGOwsolnjNBL9SPFUVMwX5/RdLA6byVPxlR5ix1biVfDeIPHirvHCq/uX4SRGVuvmyMTzicDhJ4+i+HHbb3kvn9L919KL3tf1fjHU8qq6U1Nq5BgHXGlFc5GUDT+vqnPo61yB4pVQJCb7CxvWMdDQF7rldACQ+ZEVmSoCr2ZNyY6GrYqpOBHWt8+AuGJdm9WKHz9uUMDU/4p2i+XeVj4XCSr07dDUV1URh7Aha+7o4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 00:05:21 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 00:05:21 +0000
Message-ID: <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
Date: Mon, 18 Jul 2022 17:05:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
 <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b272a80b-ff9b-455b-4a5c-08da691a5f1d
X-MS-TrafficTypeDiagnostic: CY5PR11MB6413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxgAVb/tJo810OUktK7NCi9oDLny0mz7NUM7IfQRSixPZZUmU7MeS0ga5P6/cvMn7l3QI9cwgb3IeOjqa2M/7+xPsJRx4NbDoNfiMpdUpK17Uvi3KqJtyCzCgKKtKWp600LV9bYeK3+Z3gqGvPhsAM8A3smt8DM0QSsZVE590p1Y0NOJLrDXj0vf13qR1zY9K5U2lctQtlMVB03AI8mrkHjawAxPh4/GWuTe/q7r8luzVorUpXof0US3LTljQBe/wKe5cWZOwZhT3fAmMTdfOes/7MT83CDISH4ZCbvfV45gjM+ucuQBkVnBaPwren4LRG66b+2sooFwfLmTpvYaIm62VzR0nM9C5ilHd/NY43ERlDR16HyuVGecubS60tS1/A1knpe4FLWkZQfDvZ0g2Vixp4MLGWT047KTCLZRsTaDwNyeXrFhCgS+PhyALvVIoJf7/MM5qTdXTzO7XEx5ryxYj+bG6/UFun6Gvz/2zoCOVlF2e4lOXhDquGTBngrXozNKBhqwbB0aPgGaoNxbe4ikRg+zxwI7ZiOKtwKJgnHd6gyZvIjEL3wC2uyqlt35L9uzzH7RrlUV16hzFnI3Xll8HIuBIGcJMHpyxVdN5VCPutuCqBgredUcXK8nhjm67psWs4Of0e7RGgt714M+1gCkKHI82PFAvhlnqSb4k+NEl2P5i3jX/udvOxwdC81s9GwyoL97u7m0ZNkgtmvupzcgxEF3izSt1hx5ymsl4QJYLD2g2zL5FmGoloQxIoRNjp1IseuAsWN7eHnIdu4TtDyZNRakjge0pMkHZJxDlr+NIGsm03x24NpmKPHMO2nkOonQeYJBb62qbyRu3SdjVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(2616005)(6666004)(186003)(41300700001)(31686004)(26005)(6512007)(83380400001)(6486002)(5660300002)(2906002)(86362001)(478600001)(36756003)(66476007)(8676002)(31696002)(4326008)(66946007)(66556008)(38100700002)(8936002)(82960400001)(53546011)(316002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFxZ3lCTkFSYVhOZjdvWE1YZ1ZyNmR3R21YNWxvTERnN1BJdTdFQzk1OTZ0?=
 =?utf-8?B?SjVWRDZqTXVQNWxIWlAwbVh0WFE4S1NhNGJLZGtxZ2pnV2dKcEpWWG50UmNq?=
 =?utf-8?B?YTJ1RG5YYUVxSWxtQXNLUDRGMUVZQWZtRDNna1JDbU85Y0xBdWl5cmhETDhP?=
 =?utf-8?B?L1FEV2VIU0lyQlNvVVNGWlU4aFF1Tm4vRW1nZk5yTm4vTjhBZHdUZkpma2ph?=
 =?utf-8?B?SzhreHk3WlRFeWNPdjZuZW90dDBqcVlqRU9jWEVzVTdpelR5SFJzOXA2dVZs?=
 =?utf-8?B?UG5CTm1LOWl4dTd0OWZnb284N3ZZcFFQZVdXRG5MN3R2QkRLMHFyMnZGNmJz?=
 =?utf-8?B?NnkwRFZPT3Rmb2cyM1ROMHlpSC9ONnpPeGxQMDJTMlZnekVVbENVdEhQZVJU?=
 =?utf-8?B?K3ZzWmNSWjE0QTd0SHZkTGhHMVhHTEUreTRIdllvSVg3dGtmaG93SWkvY2NB?=
 =?utf-8?B?NlBEWUhYWHRaYk54a2R5NlF1c3AzQW53aFF6eGZ2bnYxQTR4TzdkMGE1L1c0?=
 =?utf-8?B?VTJJaGJHZjZLTXNYUXF0bXEvMDZhdG9GckV0Rk1PbzcrTEF6YWRuMkRrYzJO?=
 =?utf-8?B?MmdiMHdRbGFSY2JiM0QxcTkzdHhTZWVkajFMRzcxcVplSnJIMXRQNEFza2Ro?=
 =?utf-8?B?Tjhkd01NKzEzbzlMZWtTY211T0JRL1dTYkZoejUrQzZKTGNnWHVBWW9WZE1B?=
 =?utf-8?B?TlU4T3gyVXNIWGJNYnVERVIwZnVRcksxL3N3RUxjQXdNZ0F3OCtBakxoVSt3?=
 =?utf-8?B?bEpXNUw0UHJQZ0NqaDBqenhQa0NLU09TTTUzZi9xN3BQaVNvanFDK3cvaXM2?=
 =?utf-8?B?am1qeTFxTWdWU2NHYkhPcmc4V2loQndNT1Q4eTM3eE9qZXVLU1phZEJPRi9k?=
 =?utf-8?B?MzJDSCtXc2FjcXNERWcwZE9PUitsSWdUNmV3bzVjd1Z2ckFpMzg1MlF4RWtj?=
 =?utf-8?B?blZ5elV3VTJKT25CNW9xV1hUbk9tN3UwUFBEMnJFT2FSaDRRR2tFTDdtRXp3?=
 =?utf-8?B?UnVYQ3J0YkpNS1VnZDNKemIyQy9weTQ1c1owUk9aZVl4YXd2Qkc4eUlkU3A2?=
 =?utf-8?B?Z2Z0ek04bVFoUm5QVFZTSjF6U1BKMUtaVUd1NHFvdlRSbEpFL2JNOXJZV1c2?=
 =?utf-8?B?SU5iSlJGMVFhK1MvcWhFeGsxdHJoQnZxS1N5eUt1TlR4ait0VWNBL3JvbzBM?=
 =?utf-8?B?YUNVN2J3MnROMmVWak5qeUJjY1VaZzZ6R0laUDQ1ZU01cnhHWXhGbEF4NEla?=
 =?utf-8?B?TzRoWHYzZDEyYS9qZXJBWXVUNDg0UnVwYnJOcmtrelJNNjNNR1NWcjZLK3Zz?=
 =?utf-8?B?QjR4QjJRMXZ5eFk0aVcvRzNWRHFWZEtwUjloYURUY0RSK3BGWG9sTGNtRDBn?=
 =?utf-8?B?WEg0QWl6YVg5cVFLSmJER0lXOGVuZjhSeUhrQkxQZTRseUdlNlA3SDIrMjVo?=
 =?utf-8?B?a1krT09rRHEzWTh2TzJUaUROeDhyOHZRNU9YRVd0RkZra0Q5RUVVTG9zTXA4?=
 =?utf-8?B?N1hJOVdLS0lnODArdWpXMXN3QUZNM0dtcldDTytRbS9RWlR6WlZuQ0lOWHd1?=
 =?utf-8?B?KyttbXVWMUZlYzJVeXJSb056TC9jMjhRWWNTTWFrSDN4b29xbnQ3eUdienBR?=
 =?utf-8?B?UC9iVlUwN2xzeFllZnpwUkRSRGZpMGJiYmJIcVRPWGZyemZOeEF4TFFqNEZa?=
 =?utf-8?B?bXF6d2pxcnJiSjlCVnJ1TXFIWGszaUFlYm0zUnkyMmkyTXhCb3EwUVJVTUZ1?=
 =?utf-8?B?QThBTDQ5UFBKWll3VG0yWlArSkZKLzhYME5Xc00rMDdXdFg2VHJlbThOdFU3?=
 =?utf-8?B?TnZKcTFKM0k2Wk5SUnpxNVFqNXVzditHaTU0YUdSSE9LNUM1Y044aWJLN1ZL?=
 =?utf-8?B?OG5xaTlLS1A0bkh1OHZnalBQM0RIcUZPb2k2QXVmekFza0NpN0piTVE0UFU4?=
 =?utf-8?B?T2RiMjNxaCtQcWd3WkRkUGZCQjlNcXRBZHdvRThmZlJYWXZlN1F2TGhiVXl1?=
 =?utf-8?B?YXUxeTBhVm1TL2ZWS0s0RUpHVk5RSjZzTTJDejdzYUQxOC9RSGdJTmlzMG1B?=
 =?utf-8?B?Mms5SWd4aE9OY1RvZHpBb0J1UW5XTWNZZ1A4M3QyTGJiOU5YWE4wWGtublU1?=
 =?utf-8?B?QVpsUWVUeFpxS3dNaW5EektiMTZ4QUN3REpROG95d0JEWktGUFJPekR0YnBO?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b272a80b-ff9b-455b-4a5c-08da691a5f1d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 00:05:21.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZMas+Oq+W1y3QHNifyPO0E7Aqt9Xksy8zkhgoyj0kAtRd0xEvO8+mbiHinZPVhP4rj3A9sgzgzpX/2e3Rrj1aTRbppi7JPOFe1Nvx03lsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On 7/18/2022 05:15, Tvrtko Ursulin wrote:
>
> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> Remove bogus GEM_BUG_ON which compared kernel context timeline seqno to
>> seqno in memory on engine PM unpark. If a GT reset occurred these values
>> might not match as a kernel context could be skipped. This bug was
>> hidden by always switching to a kernel context on park (execlists
>> requirement).
>
> Reset of the kernel context? Under which circumstances does that happen?
As per description, the issue is with full GT reset.

>
> It is unclear if the claim is this to be a general problem or the 
> assert is only invalid with the GuC. Lack of a CI reported issue 
> suggests it is not a generic problem?
Currently it is not an issue because we always switch to the kernel 
context because that's how execlists works and the entire driver is 
fundamentally based on execlist operation. When we stop using the kernel 
context as a (non-functional) barrier when using GuC submission, then 
you would see an issue without this fix.

John.


>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>>                ce->timeline->seqno,
>>                READ_ONCE(*ce->timeline->hwsp_seqno),
>>                ce->ring->emit);
>> -        GEM_BUG_ON(ce->timeline->seqno !=
>> -               READ_ONCE(*ce->timeline->hwsp_seqno));
>>       }
>>         if (engine->unpark)

