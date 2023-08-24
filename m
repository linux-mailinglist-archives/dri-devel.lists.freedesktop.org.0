Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A0786E17
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DC710E52E;
	Thu, 24 Aug 2023 11:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3C010E52A;
 Thu, 24 Aug 2023 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692877075; x=1724413075;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lNUTNe43XLQSfosNl4xL3p4NiWZMtZnW9RnqBL6U1Ok=;
 b=fMOlO7CDPmPqQ4gY2nW8jCmAohBci9ygNyc5zaM8p3PIAgkq/Oc6kfYD
 8ZsuoG1lTRR23PTsAZGPFMbcu6Ctm1iuNqL6qBhpjmfLuqvGCeBgcoJYL
 qFHmN7lp5pmJ8UT+1GUN1m4x4yusxu5XjOJxsYwZbQRH49IozRvvQYZt4
 nTLd5NjUgj3cGDAk7ueAaDN/FGalZpE6k5YRiUaYb/xIpaFcFwFxI7j6Y
 9sXWUtKT2diLsKQZ1/KiVLH0JfcB5yH/x3jJgSqqppouovoSD6y1m/yI5
 nJdrXREcUvyoj+yjcdkgjdEt4acwW/k9Lo9LXWYSGwAL8cT+7mNIpgDFB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405420603"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="405420603"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860670151"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="860670151"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 04:37:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:37:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:37:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 04:37:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 04:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuOakTt5ANb7UNlN0myjZ5zQ71O2dpgQyH5fzC2jUKtSMu5i3KtHjLphu0b4qUYQlxzThWsezDjGUHjSptLma6q3lk6WSAfS3XOtLYCO1Gv4Igz9ADCVOGMt+amlvzMiPlxivIv0/nMjXb89OALXGrCzOBt1OPqZQrvkKhrwzGwfiD+2J17KeHMYJ9nuojfD2U+NaH8PgbcGJPJDIFHeTh0JexZscp95Au1vgg3YKmMX7xbsoW96VB1JKGl/zM/mNh2S0VLS8G+k3FGoLg0Am3Xb0ot60XA56IFMfPgk9RRV7mpg/eM4JrOMFUiXbwh03Vt1wf/xV+KPVLR+KXglmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ0yd0HlXGG9wo8q4+2OgRbjq6wudkC39f8GGphAF0U=;
 b=ZH2MGD4Y9OABUbp9oPuozkROh0jeftx7LmpXSF4q+P2UBtqnAiLqOE+f4w4O1H3i1qVZwoQ8CHyvSJec7BVAZhE3JRA02tzXZbw220Mfu98hFFLte27L+FGYG/VR4srGdF1wZTD8c6UTIgBR3DQKXBYIHtJZAAGvb+1mGa0fDybyJDfKaFh3+nvPKgqOoSen19bCrsnXLmuzIXfdqAKrN0939ucOXAQXh0YwWxaXZnucAAhk5G9tp4jzpl+ViGycDxEb6sbBY5/LR3Rijw7ny92P8b0NGhohrpr25iflMCJljr1ixLayK8hf+JRAOjHMN9EBxCTJO7IVaHEKorVfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:37:45 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:37:45 +0000
Message-ID: <b13122a0-fe04-bf99-b70e-d4272fc4e6ef@intel.com>
Date: Thu, 24 Aug 2023 17:07:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp
 while computing DSC max input bpp
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
 <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
 <87o7iw4vxb.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87o7iw4vxb.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 892ca704-9ba1-4019-e2fa-08dba4968890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euIJlvjjwFp08RL5lweohuR8ybQ684jwJaD/GwlEjA92Xw0y53afdyt0SSQBhZn5he9i3sWETAUrsYC6G00ECZLr86aJ30M5s2AtTW1uA+NdfFFhBsBpxvfDSpn/YgCNVeQMw4zmoysCROV/RRxy4kLApnjAx7ufkiXcTzohNUXPSFm0cyXvHyUTR7nilTXXUbE4EFBUe73c9Ljh/lqMVrmhtIyGpKLEzJBodY1cHd+Pk7yQNZ9yoNoeocOAfYfaOh3n3s4fIVvp9EH4YgQTN3AiRHTDcVmu7vM8OHgnUlQT52rTVCOvK8Ajb1xPni5X+n9KRbNV+ZNXSBcyqP1oVe6DpZFiusViq9abiT2B87swnDse18VHdlJEJnNIlQIaTzRXM+2VLBMyTXpzMIGlyWNhi3t7jeWt0vyWpRUdE5bnOyuCkzfmmv0Ovbplurte0qe/lgBbDAMZwd3oKX/5KLiFs67F0ydz9F0gs7a5g5Gst0rTIkgL8u0/s3FXCKm1uyAr5QIKoNYbDVduSDsehCC6o8IEmqkY0A5clZLNjBq2xbh07kwE4WJGZD0ULkRV3rWLDG3eB/D/4sTKZ1tE6HAgRdmnfoBt3kgBKsvVc1uOhO+90xt+2LnVtxCj+h/2y9EC650WFVKDDvgS8FLtFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(316002)(82960400001)(478600001)(26005)(6666004)(38100700002)(41300700001)(53546011)(55236004)(86362001)(6486002)(31696002)(6512007)(2906002)(6506007)(31686004)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZ4Y3VUNEJOQ1cwYmhDemxTeEdOZW1ZSExjVzlGSmJScWFMYmhGdllzZXFN?=
 =?utf-8?B?eFVoOWhyTDhqZXhtdmptWlBpZ0xjQ05OYzkxSzNLeHJRb0hSWFEzc1A4VDVH?=
 =?utf-8?B?Mi9YNVgvVWFFYXpiaVZIdmFFRTVjN012UnBlazJCc2d2UFlNcVU2T0QxTGx5?=
 =?utf-8?B?L0lMRXMvb2x1WEs4RXVGRnNYcnJ6Q0NGWlRNZm95cTlDQTBnekpsRThLWDBs?=
 =?utf-8?B?ejlQc0ZoQmtDb1RDdEU1UG1sbU1CQmtrWU9XNEpQZG1Kek5SMDJndUxoUnc1?=
 =?utf-8?B?RmEwMG82MjBIMTZDajRpY1hCTWZWRDZMRUxCSnhMM2o5M1NaUDUwSkM1ODg0?=
 =?utf-8?B?RHhRalplSkowODd5VWFhc1RwSXIzRHRBeElraCs0aW5waUpremFtd1hRMExU?=
 =?utf-8?B?d1cwWWZqOGllb3ZCSzczbzZkMk9uWlI1YW0yZjdHaldRRnRYZ0pEWkVyMlVH?=
 =?utf-8?B?bFJXemxtQW1lK2pyNHZBM0ZPQmdxNXVYQmtPZTJPbzMyM0JwWXRoQ2NnVzcw?=
 =?utf-8?B?aFVvdnNVMHZhMWZBajZCSW04K0tXUmYxODJ2dGdXUnNJTStRRFJ2NFRkbmRt?=
 =?utf-8?B?ekJTSmI5YkZPdGNYeEZuUjdkT2phbmVyQ0Q4dWFablRzUUcxVDBIa1cwdlpW?=
 =?utf-8?B?MUZjaHoyRUR1endJYkxldi94K3hKc3owR2tDTFQxcDJQeERldnhZSEJOTmJw?=
 =?utf-8?B?aHo3TGxVcGppV0VPOStYUDExamhlZ09jVFJESEQweUpNK0ZCRjh4YUE0THhK?=
 =?utf-8?B?SkxpcnFlMi8yd1dkSkx0TkR6dHZhdGJDSUpEOXhRRytaTnQyeHZSNjF5SDdW?=
 =?utf-8?B?N0FxTEg0UUVCRkI3enhxdW1QUTNndys2M1Rvc21LNnZUc2xsY1RncVNHbGNP?=
 =?utf-8?B?ejhRNTkweHNUZ09oOCsraUNtNkVWZUI3NnJIUWRibTdKZU9VSTUzNDE0cm50?=
 =?utf-8?B?RWt3cDNib1E1QVNkTTBrTWRiSEMrNXl0MXlkdmlPalhPTzBPNERiMVlmMGFy?=
 =?utf-8?B?Q2xxcEJaU082NnZmc0R2RFU0dFRvNENlTTd6WCtyVlpzS0N0MWMxMGI5L2dj?=
 =?utf-8?B?WGYyMEpiczJwbkdUTStlYWdHb3oxdGZjOHlPbmZIOEtoRU9hM3ZoK3JVQTlW?=
 =?utf-8?B?d0c5c2c5ekJHbUd1ZFBWN01jSXQvajBiUDl1ZWZxektRQWJLZFRIdGtBZ3l2?=
 =?utf-8?B?SHFubGdubmRFTFVORnpZdlI2K3BPVk5UeHhNdzIvSml6eHVlWXNOc1BDK3Rl?=
 =?utf-8?B?c1hJRTFiTUQzdytZUEhMRkg3dnlWcHBYNHV1OFEzMmdhaHNkSFFXZG15Z2gv?=
 =?utf-8?B?clkyUTFMcldEaEp6YitFTlBxSzNkTStyMmNIeDEzRjdoaW81Z2p4bzh0aHhE?=
 =?utf-8?B?TU1odjRaOTJxY0g1c00xVmFXdFIrL3h3MzltVUxtMFgvRkVmWVdxQzNIN0Fk?=
 =?utf-8?B?eDlZSEFzaFMwQzhoZ2svTzlRTWMybVN4WUhXdDdaVHpKcG9yVjlLbk94OFVt?=
 =?utf-8?B?bEYzOUFTOEFJYkZRODBLUmMvTlJLVkNmWFhWR0FtOFhGYkZQUVFuL29qL0M1?=
 =?utf-8?B?Y1NRa2RDTk14QW9pc3dBOWVKTFo5T1E5RmpaV0U5TUdUMnpZeU04anF1aDYw?=
 =?utf-8?B?ZWN0clZ0SGc5eUg4b0lhZkM0U2I2WGU3VG9wdlptcDNXbXRSdVNtbCtsbTlO?=
 =?utf-8?B?aHduc2hZaStXd3l5eUFMejVGczNLdytMZ2J5eGRQRVY2c2pNSmFKSVZJUHlD?=
 =?utf-8?B?NjIzV3EvaXFOTy90a1ljcWJkcExKblpkakhKSWRWKzVVVG9kSVljTVRZby9Y?=
 =?utf-8?B?ZjNiZ2JtSHB6ekpCUi9vQnhBSWs0dHpubFR1SVl0RlIzL2RaZzkrbGJiSEhi?=
 =?utf-8?B?eUxHblQzdE1jajh6TENjQXBNRDY4QXB1OGtRdGpBbk5MK0xlbkR3OVhMQkhr?=
 =?utf-8?B?NngvcEM1L0E0azFLVmNjUjUvQzUwWFFYa1FzSUd1dmp2WDJGcXNxQlY0eTg5?=
 =?utf-8?B?Ukl1TlVLbTVMYTFUQ0xXc1J4Vk51b2hmRENGOWwrZUg1aCtRcDNvYnBIS1dC?=
 =?utf-8?B?WDJZc0t2QkNuay9ob093OWpoSnVKVFB2azJoeDVWdUJOUkdTTlFxZ3BscU1Z?=
 =?utf-8?B?MTJJemYyMHB3SzlwSlJEaVNkaS8rSXprZnA3TmVRRmMvS0hEQXR1RTNPOWtR?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 892ca704-9ba1-4019-e2fa-08dba4968890
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:37:45.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7FC2lly7ifbZrYBMPADTlJqnfbLhmR8+YCVUd5Jj2KdzbeFkTnmOSoQDBV68qb+qOSWa3Vn9GoHLLva3VDiQse1xDErepqdRe5WsR/K4P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/24/2023 3:14 PM, Jani Nikula wrote:
> On Wed, 23 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Edid specific BPC constraints are stored in limits->max_bpp. Honor these
>> limits while computing the input bpp for DSC.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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
> 		int max_bpc = min_t(int, limits->max_bpp / 3, conn_state->max_requested_bpc);
>
>>   		/* For eDP use max bpp that can be supported with DSC. */
>>   		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, max_bbc);
> Nitpick, IMO looks cleaner this way, as well as uses int instead of u8
> for computations.
>
> BR,
> Jani.

Thanks Jani for the comments, it does makes sense. Will fix in next 
version shortly.

Regards,

Ankit

>>   		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>>   			drm_dbg_kms(&i915->drm,
>>   				    "Computed BPC is not in DSC BPC limits\n");
