Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F77609CA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 07:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74810E2E2;
	Tue, 25 Jul 2023 05:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779710E2E2;
 Tue, 25 Jul 2023 05:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690264392; x=1721800392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBtNa8jgcNaSaCu0NyeWmOBb4jYXpG6lna9ARHuSjGs=;
 b=LjPEgZO08ZA603YzPxlaS8U8lPMNC8SToM/agDdiDK88bgvFoa5wvdkp
 02D2BQNIyPQ5S6BfFQQypUOi8VTsru9fWNSEd2Q6azzVznXFqPm5u6yzz
 IlTq2PPkktSy5hOgCPLZcPlf3D8RwW9fIQCKDLNgFqJnci2090hdfrSPr
 o3p+3qUBml0Mm5C+lduiQ6kS1YI1Sv2h0R/vA+h/dmAAi0WpWaVcMlSjR
 nhQOVAkcWNJDAkP8ixSB34oE9b9BRLS2zYom4LSfULgWkdCQ7gIUKi8Lo
 0KCUQU06SBa7cReVSlbAlEz7ESt1+JAUzgAUH4R1olP1qOhgvl0F55dPF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347231073"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="347231073"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 22:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="676094659"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="676094659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 24 Jul 2023 22:53:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 22:53:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr2I4c/bYLXI2fTZYnqEcW2qmOqk1VBXA8utwxAHMn8iAtk018v1T2nc5NrPIbkSQK2OrzkUF51pfZS6yypdijefm8BSi6lgCmWXIJ85QFB01UoT0ieYvSRxvrJB1mEJCiK7mxcHWCPytpVGONFX2vMLGjtx/o51711EmSgUFFNREg/cHEm796iD/kckE9QtR8I0Ih9Euml8kBYnjepjzyjh2bigzh8MXuvmvxtVwcVq8pU1TbfB04Em6uO8Ldb3tM7mHMSx0WiqDy3sdrwRy+F3naGxDNu1sswkFWtygpikj9xpO4mwym3kkUEjQFzI8kwBu5uD1eZ02fUdc3aIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp96Y/4J3H22MbRbjmKpNrm+2xDd8p8Sj0TbNE2Z2Ys=;
 b=b/M+QsJOxtoaTwKEegiZUzSi+k1/Sv12gVWjVDyg41KRBHB62sX4GGvTwVUGxr2lXVcgdtw/zcLvk6n2lYhelPuk8VUZMV1V4DpzbqAHEb5jD9UZkIoLhIt/eVd3Uzc/eTEGiZV3mmK8NWUz2SKczS7ntJxlMyb62llEmde+yzusR2Ncismrx8Iw+H2c4D0O5pGDqInconJaKKvzBOht6rQilvNVAZNLxt7eRthF9ugYyBd6LHvaGZVO/YxCoFOlKKP6ITspgul3FlDg/Ovtyb/IAhce3iJBPlwzF67V813Tv2nAu4pzyCycj5GVFowfUSgQ1c8368VbLk737K4M9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5561.namprd11.prod.outlook.com (2603:10b6:610:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 05:53:06 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 05:53:06 +0000
Message-ID: <b0af2b8b-9ad7-d598-b7d4-c9aa6dde56c5@intel.com>
Date: Tue, 25 Jul 2023 11:22:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/19] drm/i915/display: Account for DSC not split case
 while computing cdclk
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
 <ZLj7WIjcjdjCE5Ft@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZLj7WIjcjdjCE5Ft@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: c2beda0d-8d17-4c31-4ba5-08db8cd36a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+T3fUbaZfLIJz/LjkRYSeabXP0QgVAmzTqJcOZWjXtBia3YK+8lljIdVY+kCUAn+QtQUe70RXTseOx9VlZcfAjJ1cU3QVBKh2PRLvTdL9XbkSp1PrhLowYNTSWH3QfS2bz+IQLMeFA9zZqtvjOJcEXsaDrSDlYG7+34sZZdJdkVyfnsbEj+kPiHX+vy0pmxI2RsAsP10q3wJNUTEWcEKkrW8qLfletzws+qTVh6IZsmGrbyuRmoj3F5yxuKASSkfa55YVafHjtxFAiYc9mXVLpXxd9SXfdb4sce6N3fSwiImwxFwnPJmEDgKUByxmfIJF1fW8UTJIHiDVPb8JuyrktREtQFVCz+8T9Jj7OeTIUkbmyatqwQHt+lEzg3PPBAxhFYqUrOKzxaapEaSb52iQQlFhr36/0BhVld7ImLhJgMJjBMC0tSDbHMguEyOIFO45ISoHDYP0Oh5CdjyYGH630eXkoX1Dxc8k57Lcy89aDbTSvt0zIakDMrFn4orogXlq1b+a2NJDF+Q8/TGWUlZx525fZIzr4ALyO4K+qswroMnRcTB5zrB+lYqhzkI7dD85QOglj0KsfC9vZO64uM0ZpagOwJh0UJY/2IFOFLlev3cJSIt59x0hk0WZ0ayLFf6/EiaVpb7qDJIzbrn1RgSLs7QKqPZrmA4q7yWN5twWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(31686004)(15650500001)(6862004)(8936002)(8676002)(66899021)(5660300002)(41300700001)(316002)(4326008)(6636002)(2906002)(37006003)(66476007)(66556008)(66946007)(6512007)(6666004)(6486002)(26005)(55236004)(53546011)(478600001)(186003)(6506007)(82960400001)(31696002)(86362001)(36756003)(2616005)(83380400001)(38100700002)(17423001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThZTDNUR0swNWJKNXNRZytIdW9oK2VhUmZDMTl2QmFmalI4NVRRWVB2V2hx?=
 =?utf-8?B?RGdkMkNFekR4c1ZBclNVOHJEYldadXE3UkpCS1V5WUIxQ21kdXN6SExBSnE4?=
 =?utf-8?B?Zm9hOURrMS9SUFIrVXpzOENkc1hzOFQvU3NNbXVoYVEvaFRVc2VjcUlnQ3pG?=
 =?utf-8?B?THpaYkNuSE5hS3V6QVRhaVdnVWcrWXROb0VIbU1qNHplYjRicmVnMTd4Z3lh?=
 =?utf-8?B?aXVISlhycmNQUWthUldZdUZwWEZvTElmcW9ud3pGY1NmeGpQVnJHNXdGRi9n?=
 =?utf-8?B?alk1S2NtMUxwQjRkdXI5bkVDd0x5aGVBWVMxUVdHZ2ErSXFIRlFLOUl3bGxI?=
 =?utf-8?B?UTJrT0RhV05vVnc2YVpFTFA4bFBJWjNnL0tzcnJ3NzhJMnFzOEVMUjUwbC9O?=
 =?utf-8?B?TlNFR0NWOVZ2T2V1ZEgycW5rTmlkNDJoSGloU25FZUlTTjlJZ0JCUC91MTJj?=
 =?utf-8?B?Q0J5L2pELzBoYWNlVW1TU1UvRXNkVGEwbklEdytBUklPVkZSL2V6N2FkWldB?=
 =?utf-8?B?WjVZL3p3SHUrS0pjcjQzWUdqQnhHbkVtVXdzd1hlZ2l5R2FBSVd0c1NLOFlD?=
 =?utf-8?B?TU0rbVdGU1haRmRENVZ2YTFJcmJsVjFSWmRWVlhzSnN3TERRNENVMndOMVY0?=
 =?utf-8?B?YkFqZXNrMlViTHA5RXlOZEM1MjJkT0F1TkN0NHhzdGtUekpZMmlrVUF6TGpv?=
 =?utf-8?B?a2N1YkpDek9kMERyZEFLME1BSFptVzA2Z2FGM3VSWmkvNWxLTzZCakNGRS9l?=
 =?utf-8?B?QTRhSTF6YWdsWE9nZGVhc1dnN0hZNnJnbDZPR0JHdWVMMUhnYmE0ZElSVmJI?=
 =?utf-8?B?SFQ1eEk0RzJUR2lua2FubVlFL1EvOEhIZi9OS3RvdGRiQXY2S2JNb1hlNkRk?=
 =?utf-8?B?U1o1b3VZM1pOaWsyS1FlWGx5aUd0UDg2ZWpCcVNhZjRoa2ZBMHRrTXhMVUox?=
 =?utf-8?B?R0ZoTTUwdGNsSndCSitHT3BoRm1TQktIMlVtaUpZK1BpRUUxZFhFZDdLNHN2?=
 =?utf-8?B?MFhJSHIwWDZVZHNUc0laUmNFNW5Wc0ZTbjU0aFFlSjgrK2c3RnpNZWt2ZWhP?=
 =?utf-8?B?bHg5d2g0cVZ3Vm9yQ0dxUURTQVRRUU5JNEhtbzJHK3pBVWV2NHBzSEgvc3ZG?=
 =?utf-8?B?bmJ6bWdjL3dYd3pBVEZCSEMvcGk4NXR1UzQwV2hWQytnRmpzK20zSXpScWdo?=
 =?utf-8?B?bVZUbnVTYTlvUVkxMDROMmZUMk84ZWNEYTI4UkdXcVJCT0lIZjJMcmcwbmVv?=
 =?utf-8?B?RlJGUnNJb2loaUUrcVRZVUM4Vmh5NmtBaG0wamRSNVpMdGRab3J5WjZUQXpF?=
 =?utf-8?B?b0xpL0pmMkhQWGI1MmtzK0VZRmFLU2poNWkyT1NUVkFoSlBHcmQ2WkZDNkt3?=
 =?utf-8?B?MjVZclRseHZlRUVJU1UwMklTa3NDbnlXTytobXY4aTIrWE1xSkpSeHRlZWdz?=
 =?utf-8?B?dndib0c4ZTd4VlhoazRpR0wrMnMxeVNNVGg3cEk4ZGsrc0JxU2ttUHVDajVB?=
 =?utf-8?B?RHcvUk01bzQxOTNUZTJtcXpZQ2thZk9XSVp3VWlYWU40OXN4eDgyaStUeEhL?=
 =?utf-8?B?T2VSUzFIYVFRODhZbGszNDkxTE9VNWF6SDhlM2RzZXdOQTVublRoY3ZTYTlU?=
 =?utf-8?B?MzFUS3dVLzIwcDJ0OG5qVkR4S1JqKzcrR3RUWmk0RWRPaUIvRTdWQkU3S3lG?=
 =?utf-8?B?Uno1N3h1RWo2YTVONDB0dWYxQk9wcGlSaGt5VStRT0wxUk43MWkyajBYMThx?=
 =?utf-8?B?b1JYUHlqaHdiZ3F2Z1VaWmZ6dUo3WTlWQlk5bTh3ejJTdDVuSTYwQU9YTXB0?=
 =?utf-8?B?STRYRFF2R2RxNWwxNllKTDNaR2pYRGl4Y2IvM2FpMWgyWnFVTmhvOW1McXpL?=
 =?utf-8?B?VWhNN2p3ZG9YTUp2My8rRVdUamV6cUg5dEpsdmxMVWpwNHN2K1cyRWRoM0lo?=
 =?utf-8?B?ZGZtWURtS1Q5dTdxTXFLdWFkZ3RMNzJrTFNVVjdDRk1IYXI2YXMwTk44bEcx?=
 =?utf-8?B?T0dRR1BmNTdlenllR2w5d2FDK1AwYTlDQkx5ZWpjOW5TcStkaHpwQlRhVDgz?=
 =?utf-8?B?NU8yWGZMWlU0NHFERzJybE8rdlMxdWxrSWoyZkk4NEtGZkprckdpNFdUT0tm?=
 =?utf-8?B?QkF1WEg1Q3YwTkt3aHIyeWJ3MzE3d0xZQ2FteVhPVUpuUzdYMk43MjRrVWUr?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2beda0d-8d17-4c31-4ba5-08db8cd36a9d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 05:53:06.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9P4FRNi6gQNjXGO5GBIaiRW+y6ka09K1okz42sRfA0wUbC5tyLE+LW+nNCqQkM/iIAQhG6h325r9pAiKI8UFH5qfa9TWH5nISMW7rFPjdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5561
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/20/2023 2:46 PM, Lisovskiy, Stanislav wrote:
> On Thu, Jul 13, 2023 at 04:03:33PM +0530, Ankit Nautiyal wrote:
>> Currently we assume 2 Pixels Per Clock (PPC) while computing
>> plane cdclk and min_cdlck. In cases where DSC single engine
>> is used the throughput is 1 PPC.
>>
>> So account for the above case, while computing cdclk.
>>
>> v2: Use helper to get the adjusted pixel rate.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
>>   drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
>>   drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
>>   drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
>>   4 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>> index dcc1f6941b60..701909966545 100644
>> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>> @@ -2508,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
>>   	int pixel_rate = crtc_state->pixel_rate;
>>   
>>   	if (DISPLAY_VER(dev_priv) >= 10)
>> -		return DIV_ROUND_UP(pixel_rate, 2);
>> +		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
>>   	else if (DISPLAY_VER(dev_priv) == 9 ||
>>   		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
>>   		return pixel_rate;
>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> index 9d76c2756784..bbfdbf06da68 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> @@ -1038,3 +1038,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
>>   out:
>>   	intel_display_power_put(dev_priv, power_domain, wakeref);
>>   }
>> +
>> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate)
>> +{
>> +	/*
>> +	 * If single VDSC engine is used, it uses one pixel per clock
>> +	 * otherwise we use two pixels per clock.
>> +	 */
>> +	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
>> +		return pixel_rate;
>> +
>> +	return DIV_ROUND_UP(pixel_rate, 2);
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
>> index 2cc41ff08909..3bb4b1980b6b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.h
>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
>> @@ -28,4 +28,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
>>   void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
>>   			    const struct intel_crtc_state *crtc_state);
>>   
>> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate);
>> +
>>   #endif /* __INTEL_VDSC_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index 6b01a0b68b97..9eeb25ec4be9 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -17,6 +17,7 @@
>>   #include "intel_fb.h"
>>   #include "intel_fbc.h"
>>   #include "intel_psr.h"
>> +#include "intel_vdsc.h"
>>   #include "skl_scaler.h"
>>   #include "skl_universal_plane.h"
>>   #include "skl_watermark.h"
>> @@ -263,8 +264,7 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>>   {
>>   	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>>   
>> -	/* two pixels per clock */
>> -	return DIV_ROUND_UP(pixel_rate, 2);
>> +	return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
> Hi Ankit,
>
> I think the thing what you are taking of is already handled here in intel_cdclk.c:
>
> 	/*
>           * When we decide to use only one VDSC engine, since
>           * each VDSC operates with 1 ppc throughput, pixel clock
>           * cannot be higher than the VDSC clock (cdclk)
>           * If there 2 VDSC engines, then pixel clock can't be higher than
>           * VDSC clock(cdclk) * 2 and so on.
>           */
>          if (crtc_state->dsc.compression_enable) {
>                  int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
>
>                  min_cdclk = max_t(int, min_cdclk,
>                                    DIV_ROUND_UP(crtc_state->pixel_rate,
>                                                 num_vdsc_instances));
>          }

As far as I understand this condition is coming from the pixel clock 
limitation as an input to the splitter (Bspec: 49259):

Pipe BW check:

Pixel clock < PPC * CDCLK frequency * Number of pipes joined

PPC = 1 or 2 depending on number of DSC engines used within the pipe.

So it implies CDCLK frequency > Pixel clock / (PPC * Number of pipes joined)

num_vdsc_instances is actually giving us (PPC * number of pipes joined).


I completely agree that there will be no effect of the change on the 
min_cdclk that gets computed in any case, whether DSC, 1 engine, 2 
engine,  bigjoiner or no DSC.

Only thing is for the case where 1 DSC engine is used, what 
intel_pixel_rate_to_cdclk return will be different, and its due to the 
fact that pipe is driven with 1PPC.

But as I said, the min_cdclk computed will be same as without patch. So 
we can certainly do away with this change, and I can drop this from the 
patch.


But in case of icl_plane_min_cdclk, currently we are dividing the 
plane_pixel_rate by 2, citing that we use 2 pixel per clock, to get the 
plane_min_cdclk.

Should this not be 1 PPC in case where single DSC engine is used? In 
that case plane_min_cdclk will be double. Should we keep the change only 
for plane_min_cdclk then?


Regards,

Ankit


>
> Also even if something still have to be done here, I think we should preferrably
> deal with anything related to DSC in a single place, to prevent any kind of
> confusion(when those checks are scattered in different places, it is way more easy to forget/not notice something)
>
> I think intel_pixel_rate_to_cdclk isn't supposed to know anything about DSC or any other specifics like audio checks and etc - it is
> just dealing with the "default" uncompressed case.
> Any other additional limitations or checks we apply after those, as there are
> quite many anyway.
>
> Stan
>
>
>>   }
>>   
>>   static void
>> -- 
>> 2.40.1
>>
