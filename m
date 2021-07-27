Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A873D7F8C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEB56E093;
	Tue, 27 Jul 2021 20:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EC06E093;
 Tue, 27 Jul 2021 20:52:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="192122126"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="192122126"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 13:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="498615919"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2021 13:52:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 13:52:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 13:52:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 13:52:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 13:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQqXqL8x2tAdm6KJCn3nEyM8NMdjceO42+rrKrmRYusLG7YTCG5Oe5OejSjcQV1HrGCPcEGxaIfKW8WAjwD8h681dZPAC/yM3NiptJkUU1TYYAtfGbpwehUWtIczzp0JsXhQYwyVDXiZ2mvigCCDkpN6nwTAIk+qT5dCGdMfFcNU/dr5/j4gc3k1I89AkgvRfwxXHTyi+ehx/cXM4XGyx96mood/08VGzX6T97/gfdfmUtCnNMjLs7DZjZQmh8FHPrRMbDpNtbt05kmr0c/sb7lXZSzKJj1C3NWk8xtGkehI7L+2z21WAkpn123nZYpo/ncA4V9IRNq60QM+ruh0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uVq2YBP3SB9FC3Xo48LjedXTEXI2BKaV4vfC8tXKv4=;
 b=c6fq/GWUoFAWDfjFCTZtX0b5W2awwpSbOGBUMyuiOFhq+9XHSrZiGPSr68H6FFnS6kvC73hquEnC2cElxCK+h1M1fiDpbaZzZo/utO5o8CPg6c0vZm2e16zl8L4I2DQPtfV5Zqf7MS5jbs7Fd7h7mDcOYrI64pGUL3K6mGPtwQ+h7cwVw2hiYSXSpjWUOzGPmPVGUmw412N9EH05kfZGMr4kZHnyl4MB9Li5zlHMw+Y5+UJXcwlqNAxT0nsMncMQ86KlweN3iahNNSj6C7evXy11jPoC0TirN19xn0c4r3RMDi43DprBn+g6pETBiIqByBr6neEPu7b8EMhVIUHwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uVq2YBP3SB9FC3Xo48LjedXTEXI2BKaV4vfC8tXKv4=;
 b=iwQWUUP7rD35jaCtomhQACaNMIZxDri0ZtXJ11N5+r4gAtpseO/ia+TnPNHg/7LbGPYTtkMY8fy69Y4q4p+sEIuXqiMIkpf+Oe7tlt7dle5FKzFQVeC6kEEerRYp14Xnd8LNkS8fu0H2PfzkzsfAJrsAQ8wI0ACstdJ5vzLT4VU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 20:52:53 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 20:52:53 +0000
Subject: Re: [Intel-gfx] [PATCH 06/15] drm/i915/guc/slpc: Enable SLPC and add
 related H2G events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-7-vinay.belgaumkar@intel.com>
 <1e49627f-80a5-5283-eb6d-f06b0f024911@intel.com>
 <dd8d1976-4b3b-be9d-8b7d-e6487f2c06aa@intel.com>
 <3358d696-04c6-a22a-a956-bfd17f2f1bae@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <01d947a5-f9ce-a046-21b3-1651e4d6dbae@intel.com>
Date: Tue, 27 Jul 2021 13:52:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <3358d696-04c6-a22a-a956-bfd17f2f1bae@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:102:2::22) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 CO2PR05CA0054.namprd05.prod.outlook.com (2603:10b6:102:2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Tue, 27 Jul 2021 20:52:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a30a79b-97cd-42c3-bcad-08d9514080aa
X-MS-TrafficTypeDiagnostic: CO6PR11MB5587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5587666ADB265C2EC036985485E99@CO6PR11MB5587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eo2ovFyga69PTtbLHVjUrvPEDl9PY0N0vpAquucCug2W68cNUidc7v+wD1x0iW44dS+fcsHwcBQi6AppT4lZmLcannZKGMZPW5dTG45zcuP0YU4FrCIvabs5B8JQna55WhF2wEmBDLIdDKhJmyBi0Ag38HXFb7Ho4PLH2ZiXdrZNww+8E8Oot7+Idf7f+5hTf9R2EP/8pGHEUJ77gADptgaFg+9dUy3lpUXZtuR+5eurRdNieOZb+8ZRdUXmRqeLhwU5eUGHmfNqgK6Z94hb0GRgUq7yA1mVOBBhhRVQouUqq3ruZ0jBIoy+lBDtUtXAL+SulxGxg+U0jIV7cCB9CragTJUyYTLAApsfQ9u5EFO5TRqMCrYFrRDNjsFCX12NDKKwi4txy54Ut6fbpuQjDWifDCXVyeQLtL0195DANUPVuUfzlqa+4FWZSmoEIifwT7YYiup9MGfjQzgk1ps2uAYfoJ8OohRedBUGNk/emywKmkYsyYK2Keh+55aH6hRfHyVnpWsUizQR8T2HPi7QuXLaaq6x9V+I1AAbjC/3vqwszDOln9rXHTb/pDvWKvoqYQKGPM23j4AwEie2Y8tP/QTMFmOSLCdCZGZA8fFMpTvkDgaSwd9iAVcsyhj6lReMDk+3BsN8vwRHyXQuWNMIqYKiCUmEF30ZjYMJn/AVUBRjIbq6iaby/TH8k6yJ8ZtNG1p2DnIKqGaVp7n/oNRDSdtZbWEpMDNMQAoJmv+q7CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(66946007)(66556008)(478600001)(6486002)(31686004)(30864003)(2616005)(53546011)(86362001)(66476007)(956004)(5660300002)(31696002)(36756003)(450100002)(8676002)(83380400001)(26005)(316002)(2906002)(186003)(16576012)(8936002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdranFsTU9sTnM0U2RsMncwaS9pMFdBdVoyc0Y3TFN5WllwamtaZGlnL1lF?=
 =?utf-8?B?dERtcjhudFhpeFNPZ2x3VWxRWVNKR3A1QjFsSjVhNUxIcGo3TjFZcVdWN3JL?=
 =?utf-8?B?SFpqQjh4SVZEbVVlQkk3Qlp1TktvVmxLeE5ydE5oRTlkTlF2cE1zV3VIaHZp?=
 =?utf-8?B?OHhoTTdDSXV3cFJLZnhUalFLelhDbVpmSEZkSDdJa2p2L051ZmxuWHRBNy9Z?=
 =?utf-8?B?dkdqamJxRnA3eStvSGRreGlNeEFVUjFBQ2ZCdXY0a0xlMnZXZExVSzk5dmRV?=
 =?utf-8?B?UTdHREIzVEs0bGExQWFLY3Aza2hKWEdkdnl5aHZFYm8vcVNjV2Nld3JSeW1q?=
 =?utf-8?B?UTFIT05Fc3BwNDVkUzdScUVzWjB5Q0pZYjRTVWhmd1p0YTBIMFJTTkhOc0dl?=
 =?utf-8?B?Y0JhSUphR3FYaGVnVS9NZ3o5aWN4NXpEaDdwTllTNC9sZ3BzN2I0SFRDOUxu?=
 =?utf-8?B?T0pZbHZTQUlOZVRIMVhLbUMydXRmMDBpSmFLVkdGZEwrZnlSc20rNnh6K1N4?=
 =?utf-8?B?WGN0Q3M3bUE1MnJLcEFvUVJGZVJaeisxckp0ZGFNdWtYekhONktEbUl4d040?=
 =?utf-8?B?TDVjUnhRVG5hRzBlRHN0MVpaUzJBS0NvKzBxbTdVRFU2aHVzd2IwZTF6LzQ1?=
 =?utf-8?B?RzBnVlhOVFlKTVh0ZlJ6SEIwN2pDL3JweWI0S0JzdjZwajJrcjdzQkFWTkt3?=
 =?utf-8?B?N1BTV21Eb2Z1MHFQMlNZc3lTOGNkMkFJd09sUC9IazdyREpEWEhhaHhwVDVV?=
 =?utf-8?B?YTFpZ1FXbFozd3htRjdCUkxXaDVtVUc4VXFYN09Dc1pjZ3dlTUtxVThoZ3JQ?=
 =?utf-8?B?M2dCM1kzZjFyWkl2R0Y3RzBrdE5WUzdYcXdHQnUyUXhTTjNiVWhOVE44QnJO?=
 =?utf-8?B?YzJhdFZrNGovNFdvMllrZmdCODFsemdiRUtyZnJ4UzdteGdxeGdkL1ZLOTRQ?=
 =?utf-8?B?cFliU1lFUXQ5Y2M0KzQ3WTRENDVaVXY2MWc1bCtOZ2NVbUFpQ0MzcVFrNTY3?=
 =?utf-8?B?TDVZYmh6VmdOWWpvMG5udWxXY2V4L1NiN3QvRFhOVlNCSWd6MUZEVGNjNWRJ?=
 =?utf-8?B?N2U5Zi9TWXE0Y01SRC9pMmI4WVVydlBja1ljdjBITldLeWVreWRhbmZnR1Mv?=
 =?utf-8?B?TWh5ZG8xSTFmay9lSFJZY21JY2dzNEN3SkQzb3JBTHVWRXJvV1ZialJnSUNG?=
 =?utf-8?B?M2VDOGVIYlJlTE5UdEEyVlNlb0lSWHRmWU1aUGQrc1R2bG5yYWpFbUgyK3FO?=
 =?utf-8?B?RWdDSVo4SVNqem1wOVIyaEFUdWVSODBrMUhMNE5yRXFwNVlRcGpwS2RCb1Fw?=
 =?utf-8?B?Um1aR3JsdUdsc3ozMUdHRW5VRG9PYXlnalZGUUV1L1Z6NS96eENueUJxVGJF?=
 =?utf-8?B?cmdobjhIYXUvK2VRdWJwWUk2UmxtZnJZcFFwY1doMUphSGVJMWtaUU5TeHNR?=
 =?utf-8?B?OE9xcERMWll4U3ljQ3hvL21NUlVlUDNBNVNsSWV5TnBweGttdzhUOFN4TWNk?=
 =?utf-8?B?a1UrK2FJMWJxQklmRVU2OEppcGh0RENFZk1TOEVZUkpvbk1XK08yZ2pqb3FT?=
 =?utf-8?B?Q2FaL0lhdVZNSC83WUpRS0FHS2JwbWxNQWExbVJ0VHUzS3FycEIvMWt1NjFw?=
 =?utf-8?B?WmMzVldybHB4cVJUdzBTVSt3SlZYYWF4UWs1RUw1akZxQ29rVGFBSFZZL1dt?=
 =?utf-8?B?VytoVkVpaUlIZ0YvZFRqQ2lKVGxnb1lhOUxPQlFuSnlweHhvcFYrU1JVNXRX?=
 =?utf-8?Q?fIL7JCunMQ1HmWKwkDFTM8kbZ03XJBNm9aSaxfM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a30a79b-97cd-42c3-bcad-08d9514080aa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 20:52:52.9081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYuZq2DvIgRovMDmvdMMbgDeQIUvYmaivLPWz6eKw/ebe5Z4HAz1G3jJuYojesOAkMbG/I3ch1Y6dz2D079GqcZQ+3dLnb2p/GFqFUYz/EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
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



On 7/27/2021 1:19 PM, Michal Wajdeczko wrote:
> 
> 
> On 27.07.2021 22:00, Belgaumkar, Vinay wrote:
>>
>>
>> On 7/27/2021 8:12 AM, Michal Wajdeczko wrote:
>>>
>>>
>>> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>>>> Add methods for interacting with GuC for enabling SLPC. Enable
>>>> SLPC after GuC submission has been established. GuC load will
>>>> fail if SLPC cannot be successfully initialized. Add various
>>>> helper methods to set/unset the parameters for SLPC. They can
>>>> be set using H2G calls or directly setting bits in the shared
>>>> data structure.
>>>>
>>>> v2: Address several review comments, add new helpers for
>>>> decoding the SLPC min/max frequencies. Use masks instead of hardcoded
>>>> constants. (Michal W)
>>>>
>>>> v3: Split global_state_to_string function, and check for positive
>>>> non-zero return value from intel_guc_send() (Michal W)
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 237 ++++++++++++++++++
>>>>    .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
>>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +
>>>>    3 files changed, 247 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index bae4e33db0f8..f5808d2acbca 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -45,6 +45,40 @@ void intel_guc_slpc_init_early(struct
>>>> intel_guc_slpc *slpc)
>>>>        guc->slpc_selected = __guc_slpc_selected(guc);
>>>>    }
>>>>    +static void slpc_mem_set_param(struct slpc_shared_data *data,
>>>> +                u32 id, u32 value)
>>>> +{
>>>> +    GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>>>> +    /*
>>>> +     * When the flag bit is set, corresponding value will be read
>>>> +     * and applied by slpc.
>>>
>>> s/slpc/SLPC
>> ok.
>>
>>>
>>>> +     */
>>>> +    data->override_params.bits[id >> 5] |= (1 << (id % 32));
>>>> +    data->override_params.values[id] = value;
>>>> +}
>>>> +
>>>> +static void slpc_mem_set_enabled(struct slpc_shared_data *data,
>>>> +                u8 enable_id, u8 disable_id)
>>>> +{
>>>> +    /*
>>>> +     * Enabling a param involves setting the enable_id
>>>> +     * to 1 and disable_id to 0.
>>>> +     */
>>>> +    slpc_mem_set_param(data, enable_id, 1);
>>>> +    slpc_mem_set_param(data, disable_id, 0);
>>>> +}
>>>> +
>>>> +static void slpc_mem_set_disabled(struct slpc_shared_data *data,
>>>> +                u8 enable_id, u8 disable_id)
>>>> +{
>>>> +    /*
>>>> +     * Disabling a param involves setting the enable_id
>>>> +     * to 0 and disable_id to 1.
>>>> +     */
>>>> +    slpc_mem_set_param(data, disable_id, 1);
>>>> +    slpc_mem_set_param(data, enable_id, 0);
>>>> +}
>>>> +
>>>>    static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>>>    {
>>>>        struct intel_guc *guc = slpc_to_guc(slpc);
>>>> @@ -63,6 +97,129 @@ static int slpc_shared_data_init(struct
>>>> intel_guc_slpc *slpc)
>>>>        return err;
>>>>    }
>>>>    +static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct slpc_shared_data *data;
>>>> +
>>>> +    GEM_BUG_ON(!slpc->vma);
>>>> +
>>>> +    drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>>>> +    data = slpc->vaddr;
>>>> +
>>>> +    return data->header.global_state;
>>>> +}
>>>> +
>>>> +static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>>>
>>> extra ( ) not needed
>>
>> ok.
>>
>>>
>>>> +}
>>>> +
>>>> +static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>>>> +{
>>>> +    u32 request[] = {
>>>> +        INTEL_GUC_ACTION_SLPC_REQUEST,
>>>> +         SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>>>> +        offset,
>>>> +        0,
>>>> +    };
>>>> +    int ret;
>>>> +
>>>> +    ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>>>> +
>>>> +    return ret > 0 ? -EPROTO : ret;
>>>> +}
>>>> +
>>>> +static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> +    u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>>
>>> just "offset" ? or maybe pass directly in call below ?
>>
>> ok.
>>
>>>
>>>> +    int ret;
>>>> +
>>>> +    ret = guc_action_slpc_query(guc, shared_data_gtt_offset);
>>>> +    if (ret)
>>>> +        drm_err(&i915->drm, "Query task state data returned (%pe)\n",
>>>
>>> "Failed to query task state (%pe)\n" ?
>>
>> ok.
>>>
>>>> +                ERR_PTR(ret));
>>>> +
>>>> +    drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static const char *slpc_global_state_to_string(enum
>>>> slpc_global_state state)
>>>> +{
>>>> +    const char *str = NULL;
>>>> +
>>>> +    switch (state) {
>>>> +    case SLPC_GLOBAL_STATE_NOT_RUNNING:
>>>> +        str = "not running";
>>>> +        break;
>>>> +    case SLPC_GLOBAL_STATE_INITIALIZING:
>>>> +        str = "initializing";
>>>> +        break;
>>>> +    case SLPC_GLOBAL_STATE_RESETTING:
>>>> +        str = "resetting";
>>>> +        break;
>>>> +    case SLPC_GLOBAL_STATE_RUNNING:
>>>> +        str = "running";
>>>> +        break;
>>>> +    case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
>>>> +        str = "shutting down";
>>>> +        break;
>>>> +    case SLPC_GLOBAL_STATE_ERROR:
>>>> +        str = "error";
>>>> +        break;
>>>> +    default:
>>>> +        str = "unknown";
>>>
>>> nit: you can do early returns to simplify the code
>> ok.
>>
>>>
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return str;
>>>> +}
>>>> +
>>>> +static const char *slpc_get_state_string(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    return slpc_global_state_to_string(slpc_get_state(slpc));
>>>> +}
>>>> +
>>>> +static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>>>> +{
>>>> +    u32 request[] = {
>>>> +        INTEL_GUC_ACTION_SLPC_REQUEST,
>>>> +        SLPC_EVENT(SLPC_EVENT_RESET, 2),
>>>> +        offset,
>>>> +        0,
>>>> +    };
>>>> +    int ret;
>>>> +
>>>> +    ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>>>> +
>>>> +    return ret > 0 ? -EPROTO : ret;
>>>> +}
>>>> +
>>>> +static int slpc_reset(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>> +    u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>>> +    int ret;
>>>> +
>>>> +    ret = guc_action_slpc_reset(guc, offset);
>>>> +
>>>> +    if (unlikely(ret < 0))
>>>> +        return ret;
>>>
>>> no SLPC error here ?
>>
>> added.
>>
>>>
>>>> +
>>>> +    if (!ret) {
>>>> +        if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>>>> +            drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>>>> +                  slpc_get_state_string(slpc));
>>>> +            return -EIO;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>>    {
>>>>        GEM_BUG_ON(slpc->vma);
>>>> @@ -70,6 +227,86 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>>        return slpc_shared_data_init(slpc);
>>>>    }
>>>>    +static u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct slpc_shared_data *data = slpc->vaddr;
>>>> +
>>>> +    GEM_BUG_ON(!slpc->vma);
>>>> +
>>>> +    return    DIV_ROUND_CLOSEST(
>>>> +        REG_FIELD_GET(SLPC_MIN_UNSLICE_FREQ_MASK,
>>>> +            data->task_state_data.freq) *
>>>> +        GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>>> +}
>>>> +
>>>> +static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct slpc_shared_data *data = slpc->vaddr;
>>>> +
>>>> +    GEM_BUG_ON(!slpc->vma);
>>>> +
>>>> +    return    DIV_ROUND_CLOSEST(
>>>> +        REG_FIELD_GET(SLPC_MAX_UNSLICE_FREQ_MASK,
>>>> +            data->task_state_data.freq) *
>>>> +        GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>>> +}
>>>> +
>>>> +/*
>>>> + * intel_guc_slpc_enable() - Start SLPC
>>>> + * @slpc: pointer to intel_guc_slpc.
>>>> + *
>>>> + * SLPC is enabled by setting up the shared data structure and
>>>> + * sending reset event to GuC SLPC. Initial data is setup in
>>>> + * intel_guc_slpc_init. Here we send the reset event. We do
>>>> + * not currently need a slpc_disable since this is taken care
>>>> + * of automatically when a reset/suspend occurs and the GuC
>>>> + * CTB is destroyed.
>>>> + *
>>>> + * Return: 0 on success, non-zero error code on failure.
>>>> + */
>>>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>> +{
>>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>> +    struct slpc_shared_data *data;
>>>> +    int ret;
>>>> +
>>>> +    GEM_BUG_ON(!slpc->vma);
>>>> +
>>>> +    memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
>>>> +
>>>> +    data = slpc->vaddr;
>>>
>>> vaddr is "struct slpc_shared_data *"
>>> do you really need "data" local var?
>>>
>>>> +    data->header.size = sizeof(struct slpc_shared_data);
>>>> +
>>>> +    /* Enable only GTPERF task, disable others */
>>>> +    slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
>>>> +                SLPC_PARAM_TASK_DISABLE_GTPERF);
>>>> +
>>>> +    slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
>>>> +                SLPC_PARAM_TASK_DISABLE_BALANCER);
>>>> +
>>>> +    slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
>>>> +                SLPC_PARAM_TASK_DISABLE_DCC);
>>>
>>> btw, all this "data" related calls are good candidate for helper like
>>>
>>> static void slpc_shared_data_reset(struct slpc_shared_data *data)
>>> { ... }
>>
>> ok.
>>
>>>
>>>> +
>>>> +    ret = slpc_reset(slpc);
>>>> +    if (unlikely(ret < 0)) {
>>>> +        drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>>>> +                ERR_PTR(ret));
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    drm_info(&i915->drm, "GuC SLPC: enabled\n");
>>>> +
>>>> +    slpc_query_task_state(slpc);
>>>
>>> as this still may fail, maybe it should be before we claim success and
>>> "SLPC: enabled" ?
>>
>> ok. Added error check for this as well.
>>
>>>
>>>> +
>>>> +    /* min and max frequency limits being used by SLPC */
>>>> +    drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
>>>> +            slpc_decode_min_freq(slpc),
>>>> +            slpc_decode_max_freq(slpc));
>>>> +
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>>>    {
>>>>        if (!slpc->vma)
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> index edcf4c05bd9f..f14f81821a51 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>>> @@ -6,6 +6,8 @@
>>>>    #ifndef _INTEL_GUC_SLPC_TYPES_H_
>>>>    #define _INTEL_GUC_SLPC_TYPES_H_
>>>>    +#define SLPC_RESET_TIMEOUT_MS 5
>>>> +
>>>>    struct intel_guc_slpc {
>>>>        struct i915_vma *vma;
>>>>        struct slpc_shared_data *vaddr;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> index e6bd9406c7b2..b98c14f8c229 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> @@ -506,6 +506,12 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>             "submission",
>>>>             enableddisabled(intel_uc_uses_guc_submission(uc)));
>>>>    +    if (intel_uc_uses_guc_slpc(uc)) {
>>>> +        ret = intel_guc_slpc_enable(&guc->slpc);
>>>> +        if (ret)
>>>> +            goto err_submission;
>>>
>>> hmm, as this may fail, above success message
>>>      "GuC submission enabled"
>>> will be void
>>>
>>> what you likely need is to split "slpc_enable" with error messages only
>>> that is called before we start reporting successes, and then
>>> "slpc_status" part with all drm_info() that could be placed here.
>>
>> Why? It is totally possible that GuC submission works just fine, but
>> SLPC enable fails. In this case, even though we printed "submission
>> enabled", we can still fail later with slpc errors.
> 
> hmm, in the code above there is "goto err_submission" if SLPC enabling
> fails, and that will go to the "We've failed to load the firmware"
> section below that disables GuC submission ... no ?

It's the same with loading and submission, right?

Thanks,
Vinay.

> 
> Michal
> 
>>
>> Thanks,
>> Vinay.
>>>
>>> Michal
>>>
>>>> +    }
>>>> +
>>>>        if (intel_uc_uses_huc(uc)) {
>>>>            drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>>>                 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>>> @@ -520,6 +526,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>>        /*
>>>>         * We've failed to load the firmware :(
>>>>         */
>>>> +err_submission:
>>>> +    intel_guc_submission_disable(guc);
>>>>    err_log_capture:
>>>>        __uc_capture_load_err_log(uc);
>>>>    err_out:
>>>>
