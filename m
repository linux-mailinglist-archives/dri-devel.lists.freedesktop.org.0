Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF4786DF3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C710E531;
	Thu, 24 Aug 2023 11:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7810E52C;
 Thu, 24 Aug 2023 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692876859; x=1724412859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=imA8Avu4zxTSlIpnrQUvMtaf1OJocX/O7Pbo2Q8GFW4=;
 b=gm4SCv6Z80lwnqRwS6q+AxEDVxBwlrysuODEwbrmnu6gJGphYos8P+Rr
 enqFDRudPyI/FOAsO/FxOgy8isHfVLpbyytXmnQq4HF96FAb6vLnB8L/0
 1B5G8aBoUexlwMrKduO21ZqC+xGHNbLHCC/Yb/BDZJIACmCXzABYjo6MT
 Q0CjGCpyjL5uXZv3uyUTpJ7tjV3xG3P5rTHGla1EauI9vwjC+zMNkfo5y
 FIn6cfzmzgZoS9xppIlMmrt8nKFguqFX8ZvnFbEjoxp9xiReL2+XOJhQa
 9+utB6j+TvnLFbzTVIKPzhM2YUDPbPEv4B9kdzzz3fzir6+OyPJU51dFx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405419851"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="405419851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860669700"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="860669700"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 04:34:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:34:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 04:34:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 04:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8eGU9HuFQ7OcOS9EQOxX38HKHrYBeCMVNraM4WA+rkZbW4Swn3woFsYBGINVvHaEy156hrAJ7wsFsQppWoD92szGwkneySYrGKZTQllNMTEGLTVeAai4lhyqcFPg57Ep7j1HgaUBC6OJXsthVIBfHhUrk2IQLwyDOJ9iKkkeNbti0aY6+t0ZUlIFVIa6nFDOnVA9a7v9mOyCONnO9pcwOJgEA3uWtBk0qbs5B7U42DJvGHjCanv20G+xs4ZE7YCC5gotdgcjxswPaJ2X72pFQ9v/RFwD6gLASfL8bGDohzYL9lDvj3Kgukvl787dzvKdJXK4NCsyD9tB5leZ/KuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxpkLM6hBrZBXJDe9KAQ0AKzTB4G8WzFmRxoBpMEdiM=;
 b=RdaUWl438/LbGPO0r7Tozi6KEXpeIYbA2raNQWXSsZOOyVG3MysdTdn9v9H4MI/2Fsi1sRfDZoSNYtCKFGVR7ZZgn3FcwimhlSCxcus6VPUQTpWIq5RhsygYiLQlUPRuuDJ1kX2499APB/GWFzus3SF9LKektiH7LZzZ/QhO5Tp0beJhFGDmwqeriKTDW1W/JiFN3GcvVz+wsAQ1FVTeOQrbUXub5qNrF50ooNlulntYyeoviC6l/beSGH+solXh5FXc0WKeAKAWGzMEkCmRCNAbVCtQP7mRy70A0XBd4Vwmy+9lOJCqtJVeUTVLLFvrfqHSRxWpdE1eZpWSw4g3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:34:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:34:14 +0000
Message-ID: <e228dd25-3c52-ccd2-f72f-b77b6c8470fb@intel.com>
Date: Thu, 24 Aug 2023 17:04:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp
 while computing DSC max input bpp
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
 <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
 <ZOcjDCx3r3TARJNX@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZOcjDCx3r3TARJNX@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e7e404-d460-4276-0b61-08dba4960b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OL+BcAvWs2tjb7CqLYpf4NAYH8j3VV2KtzI7aUnLkKzBsR8EfmDbQPHSSznTCe0dLSKs7pvAJUfMJcvKE750VrXR+PB0UXwHkWth83v8CC3APGif1eTW/QOKGKecxrTTbTDCEDRiyPqkXVhT5pzMZiPqbgcFBnAiX0q4bBFu9LD0IuIXdZ3kleOIAk3vHIio7eXTdblodQSbGFTOS5h/Af/aEZThH56gReH4NQLhtwxb1XM1zrVbCbeb8vFJvIsV6e8LXlnlKzQA7JuKkud4AI2d5ky/Y2oGPHqhTT50MyiNe4h3IrTgNaXgdQKTOMk+pZwOKmO0m7NPLG68upprRooY5+Zim8f7ggDxW/BQxVVMPRwsLiI1DxnF22pZx7Ej2V6PCr6tHWsZHyrjxkBcVG9Q7CfBin2QQEhggu6Q20xxH+iNpS9XXkg8u12+Z2xTH3k7ehE6DPaPlhNwI3VWzt3yfkU2GYkkSNnO28+9DBpQH1d9IUj+CeIs7ONPX7FHsyxa3z1tpXzvryBjRlBxnrxJ+Zy4QuhVtEX7k84EtYMUC+19PAqHnU636jnfSdZfXfh/qWLr90YcSjQh4AXC5ck5EZKjEV3pWU4V1MeeEhmTOlF+Wg57bQD6NA/bT71CRjKFvYZ+7aJDMKEHLMHiAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(1800799009)(186009)(451199024)(2616005)(83380400001)(4326008)(6862004)(8676002)(8936002)(450100002)(5660300002)(36756003)(26005)(6666004)(38100700002)(82960400001)(37006003)(66946007)(66556008)(66476007)(6636002)(316002)(478600001)(31686004)(41300700001)(6512007)(2906002)(6486002)(55236004)(6506007)(31696002)(53546011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1uRjkzM1VjUk4wQWFLNjVoeWhMc0xRM1J3Nmw2MUpvdlZGcmZ5K1VpbWQ1?=
 =?utf-8?B?cW5ubXF1RldPRElpcnJscGVhOUF0c1JsV0Jwcm5QMDNaaHJtRE1DVFZLTXYw?=
 =?utf-8?B?OFVmd2RVeUJmSVBsQ2tGakZjU1ZaUEV4aFZYSzVTdDJCZmhVWTA0NzVWOUpz?=
 =?utf-8?B?cE9jSytLL29OWTFRT2d6NzB5eGJYV3RuYzE1OXhhNENYTTlUL25ad3gzcXlv?=
 =?utf-8?B?azc1cVdtSnFDa0dad2RjQmUvTHdLV3ZrUFdqT3NrWmJnV05ZWmd2bFBvNzFl?=
 =?utf-8?B?ZTR5YkdYVW01MDIxNXJsbmplam8wQkdoRjMwTk5ZMWtValhPTHFQa3l3eVNG?=
 =?utf-8?B?M1N6dk1VUXEwVlF6MHo2TjdHY1dKS20rSk1LTHV2Sm1mbm5zR0FSY0Jqa3Uz?=
 =?utf-8?B?NXFYSnJLZVVaOGtYUytPWHB1dVNKWmhQbUlPYVFmMXhaYTFFRUdnVjgxTTk2?=
 =?utf-8?B?cnlPKzJtb09IYldaeXhEeFlqOGtrWDg0Y3hkTEcya3htbWNobFF6SHJPVVBa?=
 =?utf-8?B?UWlpTHZFNFpoWlhya01VZnpHSUlwMTA4TWFOVG1nd1F1T2laQ0t5YVFoTGwx?=
 =?utf-8?B?TlFHaE84Y21XdXE4S1Y4VFcxMjFZelNzRnlHMHhNa2ZYMUp6ZTJRUCtnTTJq?=
 =?utf-8?B?Ymo3VjVmRGhmc1BGT080a3VYTmJkUlBnQng0RnFEUGxEMjlmcW5RcGg2RURs?=
 =?utf-8?B?QXRJZktaWHV6SDJUQnc5a2ZYTmh4anRWZUswL0p6aWZYL090Yi95WnBmWlRT?=
 =?utf-8?B?dHNMTUxUU1V1cW8zWUdHSWk0L0Y0MmhkSkdWMXF6S3I1NWo1ajRtdkZOUi9F?=
 =?utf-8?B?RWJNdi9SWk9yUEdWNEJOYUpxT0dHcWtVK3hob0pPQS9yQld2RUJSQkI1S3hJ?=
 =?utf-8?B?WStYWEFyajg0aHZMaGVRdiszSVNtOHhvL1E0R1preHVzTVJJSkJmSVRIOFhN?=
 =?utf-8?B?a0VpdXZpaCs0bm9sUUJ4TXVSTW1xVFhjTEZRM0Fucm8zVTF6VXM5RUNad3Fz?=
 =?utf-8?B?d3Z1YlUwKzNxcW02eEFBNFJzVUVGTW9kMS9vNi9Ia3V0bkRteHN6YnZxd2dh?=
 =?utf-8?B?dU5FYnM0S1ZqVjBNM0VCazB4TlRGVkk3ZFpFWmpiODcyd3JBUUNOWUJTWWVl?=
 =?utf-8?B?QlNKS2k4djlPSFFqeUgyWXhBajhHLzYyYllQZTh0SlFWMkRMRXNQRnFLSWVR?=
 =?utf-8?B?QWF3cXBOMHNSNUlWMWZ0QW9ZQWhYYjBwUTdEd0xkRVV0T2ZKZ2FiWDJNR2gv?=
 =?utf-8?B?ZGRnQ1d5YllRODN2M2dQL0FadmhzWW8reUNmWXFDTjJFMEVMQ1JlLzlVTGho?=
 =?utf-8?B?RXlUL25CVzFXazdkVHlJMlU5emlpcHpUc2xvakJzbVhQWmVJZ1o1TUFuYlIr?=
 =?utf-8?B?RzhPRUlpZ1orSGdHM2hCb2xHdWZvQjZpTmtFU2xaSGNyU2ora1VFTDZaWE54?=
 =?utf-8?B?RVd6VHkzQU1pR2lwckEwZElNQjdLRGh3ZWJSTTlIUGJjMzR6dkFEaFVkV2Mz?=
 =?utf-8?B?MW1jMjgxeHBGQ0ZxUWpLSnE3Uk5OR2ZCWkxwMnpCcllGcmRpd1RTL2wvNEgr?=
 =?utf-8?B?TlVrSElsSituR3k1RmVuUklSaEZBVVdSODByYTUydWpyTDdUYnlaT0pOQnJi?=
 =?utf-8?B?b1dKWE4yemhweGdwV1BXSHpaYS8vMVI2dnNzZzdwMnFYbnZkUm9PZHJzQzJD?=
 =?utf-8?B?aXBtNE1KNHFqdUh0WTRlcUZKeXZHbW41Q1BGc0hYN1NFWnRjdUppMXZoWDJs?=
 =?utf-8?B?VTlEVGRuVVpiM1duenA1WFR3Y09NUGNRekJMZEtzK0pPb0dnVkxyVjBteW14?=
 =?utf-8?B?bXdWa29QYkJMNk03SlRodk1pd1hJdXRSVUpPeUZmYUpNYXgxUWV3aFZHWlFH?=
 =?utf-8?B?QlRtdU0rL3pQYzFHc3FmMHNLbnJKUmlRUWl1R2hQbDBwTXhtMmpqa2krWnVM?=
 =?utf-8?B?Y3JwbHl1ckYxNFlQWDB0aXBMd2tkT1pZbVoyREo5ZGducjFoc3RPN3BKbS9x?=
 =?utf-8?B?Mlg2eXhSK0FjR25HbmNUaU9TKzdWS09Kem1DUTlNZEJWTVNhSEs0dHcvaFZW?=
 =?utf-8?B?dERWejVNZEFrNytRTzIrN082VFFhdW9DUjYzZzRtVzRjSUZBTmg1eFpZQlZ5?=
 =?utf-8?B?a2U2UzB1a09TSTRvbm00QnV5ZlJYbEJTbXF3c01VOTBwUDBpQk5XS2sxT1Bp?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e7e404-d460-4276-0b61-08dba4960b58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:34:14.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4lxyazNkpJCR1OdUDIhDxsGcB+PA3J0FYawyK3oWY78sfKm8CcXD8peLlYVqYR3Ht3NavaTKC3hTS3p3Fpi8DAvwgiX1/cAQ28aZLXet2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Stan for the review.

Regards,

Ankit

On 8/24/2023 2:59 PM, Lisovskiy, Stanislav wrote:
> On Wed, Aug 23, 2023 at 05:24:25PM +0530, Ankit Nautiyal wrote:
>> Edid specific BPC constraints are stored in limits->max_bpp. Honor these
>> limits while computing the input bpp for DSC.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
> That is kind of funny, I can see this patch in my mails but can't
> see the other one you had "Default 8 bpc support when DSC is supported",
> which is visible from patchwork.
> Anyways I give r-b for that one as well.
>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 5b48bfe09d0e..2a7f6cfe2832 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -2061,9 +2061,11 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>>   	if (forced_bpp) {
>>   		pipe_bpp = forced_bpp;
>>   	} else {
>> +		u8 max_bpc = limits->max_bpp / 3;
>> +
>>   		/* For eDP use max bpp that can be supported with DSC. */
>>   		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
>> -							conn_state->max_requested_bpc);
>> +							min(max_bpc, conn_state->max_requested_bpc));
>>   		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>>   			drm_dbg_kms(&i915->drm,
>>   				    "Computed BPC is not in DSC BPC limits\n");
>> -- 
>> 2.40.1
>>
