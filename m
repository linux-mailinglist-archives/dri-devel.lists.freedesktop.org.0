Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BB7614E0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE8B10E3D2;
	Tue, 25 Jul 2023 11:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69510E0CE;
 Tue, 25 Jul 2023 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690284204; x=1721820204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Gu+Np/8jTbNfqoi5gVkou+DbUUvL5VxOy7G3y/C81o=;
 b=JbFV72A8h5YTRUjH/lQ7GTMoVfMyJ4uI3UR84ANbhSKZHKKvGcSUZsZe
 eJ578NxyBZ/8DFENKjVrb/TvCdpiqm4gLhavaUoBrC1ohNHJFmUXJhjAd
 BSIOO8dPGA4X5DPopsMT1PM8u9OtRtT+xjRhEPA0dNl+BusM/NgKLVLBh
 /Dyx0XASVZbjZ4wl+PwgW9DeaSegmA7FjCStw+TkUJnwLJ0Vl2kWHoPYL
 BtSXfv9cgIdbNYrqe+1XxcdJROE++1BEvuyLWGs1S1lcRhr4PRajbU0zS
 MaGdIHajX0wMbIZtis9Q6QxurzM0Vrggq+ZN2SIE0hsHGE/w0VVsFVsW5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398604815"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398604815"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="676203083"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="676203083"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 04:23:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:23:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 04:23:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 04:23:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeJXGQw5NCgSyo+8SUrUHed1moNO0KITKPQufecxFYZydWztmOt3kNwaLqx6JIzQ4vXVFyXEbhLhnFzuMzumRHj1EoGzgohAfHHQjc98SFY+SBvihGjkbAY2rIvFiZQg12DHI7DzgpCQfGg0sLv3GqXn5Tv0kK5gj79jRZbKxZpULyuMp1uZFof/vflgn36rQixfEKlJ8XcRsbx0jElOXsBmEKI43im6dZAafIKgD2jAMuayIiu7u7QQEgtkpaYZE8m/VaUfeg85Yoh2oKFCm8yWjH7bf0lisQP5oRTO/Nh3+aNWqyOo22NHg7iEWyYeIfULerMGqu+vUppRB/9rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N29qEKppA6YEnH5kUpRD9xwwHvMvR87pW2KJfXunrnQ=;
 b=LkWI1TiLrJtvtalXAHqmDc/T4KaJaCWHXiqmSTB3uMw+IKZvVsfNds6T1OfOik6sxCMzSKGVJFlMn6O1yOlZGxVUk1I49cCSTghGQnpvV2N/EzQ6AuuMQS5Uv9euREkTBZTsVz6MmuIFwN3aNRHqvB7tVSI3h7wEu1G7Q7fv3hDJLm8SkrieQ27WOqj29mnrGlFPg+y5WSsaid7wGk4Bm5KUxtj7/5oooYgtzDTmfV4B8T5+wTcne68y8KDC3HU/ENV+fxhRgmZJxLD6SdWMDkA1tmpphEDaX1IT0RNVgSoijongxchbHusDS1cETkXIyz7Ef2mF25m0eoLE9XAURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5691.namprd11.prod.outlook.com (2603:10b6:610:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 11:23:08 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 11:23:08 +0000
Message-ID: <7745e8f6-801a-b0ed-8683-20fe04f00e8a@intel.com>
Date: Tue, 25 Jul 2023 16:52:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/19] drm/i915/display: Account for DSC not split case
 while computing cdclk
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
 <ZLj7WIjcjdjCE5Ft@intel.com> <b0af2b8b-9ad7-d598-b7d4-c9aa6dde56c5@intel.com>
 <ZL+fcPALvPpotftH@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZL+fcPALvPpotftH@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ee3c27-055d-4503-50e7-08db8d01859d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eV7y7jX0/bO5uxGSrwXV/fJD6THyEsC3q/KKd/pt4KW7HsbqGEn8CMpkA4yGvzm2FDj/Zai9vfMKY82D+r94e2AAUo+7XrJh4eM90+cv/DZ3QDHQkRf1NsU7dw5QesiHiCJKlOeRgu70nfNKS2DnR9f8ThidJJg9bVnVSF0bD40PE+ZLkZn95MZwZVgNmggf8sc5jkTZNjNwccV7fTUoXN65NwXIASuozM0LhRPu2I8PxZMAfgoPmShdB3qDeUags9Bt/a/5McDbncy0a3aLE7tGNZiJVFf2x75b+59XfHPvcZpKIJDHQ8KL0S8OUqKV8ObOubstK1Dc+X/dIIGzbSC5TLMaTYomyHr/IK8VYA99c0deVZ8+T9QEn5Y7ylwgX3SDAAOn6AHzJBtIuEt6cqvSnU+HOnayTrv5OHDLm4jEfb/5qqn3uPps5yRV3yoeiar/A9I4JOetJQPUi+yR+Zmvf0lo7TZ2rl7a031VmEfaKJBBvQH3qRZD2QJUaBSrvx9ZGLlvJxE6mOUpDd7sfmoAzqWPmzhHFHzY7BXGlGTDU25lsXd+VMf65x6ds1qVoT9TL10nen+DJj228o9ysQrLS5qqsSyYx0SogNVdpdvnW5bsQ1HVVuk7vupBnbAlyRdHl9ZoXHb0YKDFDs7rvxE4wNRF4atjmOr4VA/rkXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(38100700002)(4326008)(66476007)(66899021)(53546011)(55236004)(2616005)(36756003)(83380400001)(5660300002)(8676002)(8936002)(37006003)(478600001)(6862004)(66556008)(66946007)(6636002)(41300700001)(6506007)(186003)(26005)(316002)(6486002)(6512007)(6666004)(15650500001)(2906002)(31696002)(31686004)(86362001)(82960400001)(17423001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXFEN3preVVTbkFDdENUN0VBVXB3RWZkU2s1ODNrb0Y5Z2VRY2xDQm9ERGJw?=
 =?utf-8?B?Ym1KK21TMnI0ZkpJc05RTzlTeGpSVWVYam80WXl3U2NDampTaXN1K2tLNENp?=
 =?utf-8?B?a0JGRE5DTmxWaGUxWjBnN3lZTmdrZHlHNXlQdVQ3cllyTkpxZFgwSUdQdS9l?=
 =?utf-8?B?MG1HbTZpRVc1SE41ZDZzYW9qWjhDcUtRcDlRRER6dGpycGRZSDNtamxKZXFC?=
 =?utf-8?B?T29IQ1VHekZnTko0QmovMllmS3RLQytnZ1ZhTFo1ODU0RkFubGFpN0RpNi9w?=
 =?utf-8?B?TFhua2ZEY2JmcjNWU1BtTzFzbEorbWlNRHpPMEhzUEo4RWVDbTJxM0xQOFBo?=
 =?utf-8?B?QmpzaTlyd24xNmJVRUVKdUh1dE9CdnVVZm10Q3UrRjliUlBWTHlUTWhsN2Jq?=
 =?utf-8?B?OTBCRFlzWkJnU0tyaiszanF0WkQ4SnNTbkFZUHhSUWtZSTlYRnEyWnFtQzVy?=
 =?utf-8?B?RlJ3N2JaWmdmSnV3blpNNHUzemxRd29xank4cDd3Q3MvaEk1VmtMck5USGwz?=
 =?utf-8?B?c1RGQzdEWTVxZDBSVEhmSmdsNGFCTWNKU1FzUit4aDFXenRoNVpvczU1bG84?=
 =?utf-8?B?V29lQ09yblYwMUppZlhiSUlmdEhkdEJ4eHMzQXRSNDh3Mk1EZmhnM3Q0ZGJ1?=
 =?utf-8?B?Wk5ZdkZRMlZZNUIyQjRNMTJ4UGdicWhxNXhaVVp1NVkxeXdmK3Y4c1FKTFVQ?=
 =?utf-8?B?MTErTzRlVEJhaTZ4UGdXemkrVmFBQ1I0N1FiUFFtNGJNcHdhQTZqM0VxdUlE?=
 =?utf-8?B?NGxkaURxcEFjakxwdmpNZjVxZ0VsdHlWZmVORTdpYk01RGhmdGs5TllmUjdy?=
 =?utf-8?B?eU1VVVNyc1g5aXV6TE9mT0VrNFZwTGNOMEx1ODFTcGJsaTBmdi80VmgzazAr?=
 =?utf-8?B?ZGE0U0wwYlRvcnVJSG1yQ1NPZGpvUkpEWXROTmRIK2ZyNDhJa0dVZTI5bnVM?=
 =?utf-8?B?NEl3bGg5NmFSOE9GczRMaGlrTm44dkRRRkdSZVY3TDZkMjlUZXB5QXhqWWRz?=
 =?utf-8?B?T3JBTWw1eFJ0OHFWMndEY2ZwWmNoaFNGUFZFNWQxUHJMd2ZwVUNHNW9tb2FM?=
 =?utf-8?B?TDNBbjBxcE52eE9RRU1nRzhlSEJyQlBFNENCRDFmVTdKZWRwejR4QUF5dGNL?=
 =?utf-8?B?RzlZLzVDL2NVRnpKNVV3cGRvdTArUzdWTHE2YmlUS1F3R29SV0hNMXhtb2Z0?=
 =?utf-8?B?QXRlekFSM2drbzhnYXdNeHM3eitSMjhZK2U2U2JTS1pSVFlVYWZMOHNUTHZL?=
 =?utf-8?B?a3E1UDhFN20rTzdGWUpPa1Q3bVA5RDdLUlV1Zk9uNDJVVEpVejYxaTRneXR0?=
 =?utf-8?B?enpvV1JsemttMXdEcUpRVlNGUmZkbGVQNlpsQzJjdUloRm10RElUaW1SdEl1?=
 =?utf-8?B?RXBJb1k2WnVlbGxvaTlOMms2OVFvandsemdoYys5RWVWSG1obGFmek5EaWJC?=
 =?utf-8?B?UVN2aDNpMDl5bGZRMkdaL1BnMzZsdmRFb1dLZk1QU0p1aXFxeTg0Q0xUeHA1?=
 =?utf-8?B?OEEvOUV3SzhZYVorcGE4aW9HVFRvTzFsUkhwUnpEQkJhNVpVcmFod1RNek9Q?=
 =?utf-8?B?bWY4bkw3YnROQXI0a2g4RTBrWU5kdlp3OStvTnd2aTdnR1VoNEpjSWp4OUZI?=
 =?utf-8?B?S2xCQ0xJc1pxVEtpeGZLWFU4K2tEUUM1alYvblAyZndIUnBIS0djKytndmZC?=
 =?utf-8?B?VEZGeXFwWUp4U2tRbVhKS0NDeTlCWTE1QU94TTBiK2Y4UjZFS21vazlyTVI3?=
 =?utf-8?B?WjVSRHM1bGFjSHVaaTgwbkRySDBaR0puaHNXOGUvalNIVkRyQ0Y1TVMrUjB1?=
 =?utf-8?B?Q09DWi9lcHJyYmlOR1p0UDdoeWZia2RPNitlcHdWU2hTbFQ4L1VVWW9TTXNW?=
 =?utf-8?B?aWNlL0hVa281RGFGQTRRRlNTM1Vud3N5RXBBS21RSmRrMzllTkF5UkJlK1BM?=
 =?utf-8?B?cHpwZ1BBSDNZamhFUHRXNy94YlZvaExqa3dUZHJsek44bnhDREYrdzBJOE03?=
 =?utf-8?B?b0JCelRpblVLVnpoVldTOXNTRXJBMFQ5Vi9GS2E1Nnp5aUhEZHAyU1hKS3pO?=
 =?utf-8?B?OHk4K2pFdlRQVkpKOWorTXFicjBhVnNGUU5CdEpweWFBek1tYWVSdHNwajBi?=
 =?utf-8?B?NHZYNS9DNUphWjZuZ3FrZGl3Zjkrd3BYUnFIL1lUWXFGUWpJMXlkN1BlMkkx?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ee3c27-055d-4503-50e7-08db8d01859d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 11:23:08.0385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ublgY7KAAKycRHPlxkJ5s7V9qHOeLC6K6seDSUvrUHHBwu3BZvMDYSNvam9DsXh59d+SCiWRpMN/W179mqI57a0wf5CqTxy/2/NG/lolWvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5691
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


On 7/25/2023 3:40 PM, Lisovskiy, Stanislav wrote:
> On Tue, Jul 25, 2023 at 11:22:52AM +0530, Nautiyal, Ankit K wrote:
>> On 7/20/2023 2:46 PM, Lisovskiy, Stanislav wrote:
>>> On Thu, Jul 13, 2023 at 04:03:33PM +0530, Ankit Nautiyal wrote:
>>>> Currently we assume 2 Pixels Per Clock (PPC) while computing
>>>> plane cdclk and min_cdlck. In cases where DSC single engine
>>>> is used the throughput is 1 PPC.
>>>>
>>>> So account for the above case, while computing cdclk.
>>>>
>>>> v2: Use helper to get the adjusted pixel rate.
>>>>
>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
>>>>    drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
>>>>    drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
>>>>    drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
>>>>    4 files changed, 17 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>>> index dcc1f6941b60..701909966545 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
>>>> @@ -2508,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
>>>>    	int pixel_rate = crtc_state->pixel_rate;
>>>>    	if (DISPLAY_VER(dev_priv) >= 10)
>>>> -		return DIV_ROUND_UP(pixel_rate, 2);
>>>> +		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
>>>>    	else if (DISPLAY_VER(dev_priv) == 9 ||
>>>>    		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
>>>>    		return pixel_rate;
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> index 9d76c2756784..bbfdbf06da68 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> @@ -1038,3 +1038,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
>>>>    out:
>>>>    	intel_display_power_put(dev_priv, power_domain, wakeref);
>>>>    }
>>>> +
>>>> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate)
>>>> +{
>>>> +	/*
>>>> +	 * If single VDSC engine is used, it uses one pixel per clock
>>>> +	 * otherwise we use two pixels per clock.
>>>> +	 */
>>>> +	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
>>>> +		return pixel_rate;
>>>> +
>>>> +	return DIV_ROUND_UP(pixel_rate, 2);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
>>>> index 2cc41ff08909..3bb4b1980b6b 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.h
>>>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
>>>> @@ -28,4 +28,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
>>>>    void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
>>>>    			    const struct intel_crtc_state *crtc_state);
>>>> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate);
>>>> +
>>>>    #endif /* __INTEL_VDSC_H__ */
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index 6b01a0b68b97..9eeb25ec4be9 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> @@ -17,6 +17,7 @@
>>>>    #include "intel_fb.h"
>>>>    #include "intel_fbc.h"
>>>>    #include "intel_psr.h"
>>>> +#include "intel_vdsc.h"
>>>>    #include "skl_scaler.h"
>>>>    #include "skl_universal_plane.h"
>>>>    #include "skl_watermark.h"
>>>> @@ -263,8 +264,7 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>>>>    {
>>>>    	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>>>> -	/* two pixels per clock */
>>>> -	return DIV_ROUND_UP(pixel_rate, 2);
>>>> +	return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
>>> Hi Ankit,
>>>
>>> I think the thing what you are taking of is already handled here in intel_cdclk.c:
>>>
>>> 	/*
>>>            * When we decide to use only one VDSC engine, since
>>>            * each VDSC operates with 1 ppc throughput, pixel clock
>>>            * cannot be higher than the VDSC clock (cdclk)
>>>            * If there 2 VDSC engines, then pixel clock can't be higher than
>>>            * VDSC clock(cdclk) * 2 and so on.
>>>            */
>>>           if (crtc_state->dsc.compression_enable) {
>>>                   int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
>>>
>>>                   min_cdclk = max_t(int, min_cdclk,
>>>                                     DIV_ROUND_UP(crtc_state->pixel_rate,
>>>                                                  num_vdsc_instances));
>>>           }
>> As far as I understand this condition is coming from the pixel clock
>> limitation as an input to the splitter (Bspec: 49259):
>>
>> Pipe BW check:
>>
>> Pixel clock < PPC * CDCLK frequency * Number of pipes joined
>>
>> PPC = 1 or 2 depending on number of DSC engines used within the pipe.
>>
>> So it implies CDCLK frequency > Pixel clock / (PPC * Number of pipes joined)
>>
>> num_vdsc_instances is actually giving us (PPC * number of pipes joined).
>>
>>
>> I completely agree that there will be no effect of the change on the
>> min_cdclk that gets computed in any case, whether DSC, 1 engine, 2 engine,
>> bigjoiner or no DSC.
>>
>> Only thing is for the case where 1 DSC engine is used, what
>> intel_pixel_rate_to_cdclk return will be different, and its due to the fact
>> that pipe is driven with 1PPC.
>>
>> But as I said, the min_cdclk computed will be same as without patch. So we
>> can certainly do away with this change, and I can drop this from the patch.
>>
>>
>> But in case of icl_plane_min_cdclk, currently we are dividing the
>> plane_pixel_rate by 2, citing that we use 2 pixel per clock, to get the
>> plane_min_cdclk.
>>
>> Should this not be 1 PPC in case where single DSC engine is used? In that
>> case plane_min_cdclk will be double. Should we keep the change only for
>> plane_min_cdclk then?
> Those are different cases:
>
>
> 1) When we are not using DSC, we are always processing
> 2 pixels per CDCLK, starting from gen 10. It is reflected in both intel_pixel_rate_to_cdclk
> and icl_plane_min_cdclk(which is a bit of a tautology I agree, but anyways we always take
> all limitations and use max(worst case) of them)
>
> 2) When we are using DSC. In that case we could use 1 or VDSC engines, which would set PPC to
> 1 or 2 correspondently. So whenever we happen to use DSC that condition will take max of
> the CDCLK obtained by other requirements and that formula.
> However in non-compressed case when there is no DSC, we should even be insterested in querying
> how many VDSC instances we have, amount of pixels processed per CDCLK isn't related to this in
> that case.
>
> Stan

Alright then I'll drop this change. The existing checks seem sufficient 
to take care of the cdclk for DSC case.

Regards,

Ankit

>>
>> Regards,
>>
>> Ankit
>>
>>
>>> Also even if something still have to be done here, I think we should preferrably
>>> deal with anything related to DSC in a single place, to prevent any kind of
>>> confusion(when those checks are scattered in different places, it is way more easy to forget/not notice something)
>>>
>>> I think intel_pixel_rate_to_cdclk isn't supposed to know anything about DSC or any other specifics like audio checks and etc - it is
>>> just dealing with the "default" uncompressed case.
>>> Any other additional limitations or checks we apply after those, as there are
>>> quite many anyway.
>>>
>>> Stan
>>>
>>>
>>>>    }
>>>>    static void
>>>> -- 
>>>> 2.40.1
>>>>
