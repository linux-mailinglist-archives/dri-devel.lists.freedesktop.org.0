Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C703D8664
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 06:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7A86EB83;
	Wed, 28 Jul 2021 04:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3646EB83;
 Wed, 28 Jul 2021 04:03:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="212565468"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="212565468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 21:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="517262713"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2021 21:03:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 27 Jul 2021 21:03:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 21:03:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 21:03:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 21:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgWoDsQ8gkW4DXfgvKjFBN9j7ai2tXGUAFB8E7uLQ52NJeSLrWe5zdmtQ8CLaVmGiIIuS1qSU5cg9J/+El66RaLvLOhSV7dOWSnoCNwSxzqbmqZgu0bpLF5qKuPWT2BhyP16uyLJEpi08dsfTMrXMo4u5Z87TiGsnWYsT1C7ikpbcB6zZWfyMHn4nE1H4kDahJSWEtARpW7HlLEwy9lsth7+T6E1BjwM+5UkSj9Uc6ugl3ecIejk4ZpUeMmqJyI99m/BGejlFdANzTK0PmaPQoyn4D1D3FhpbA4aNYt3H/EbnhMSSNHjidEYtcNpLuQKE+PmPTFdo2Sxf+OlsMoeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15qQCWK/sJ7JJM3Nh9YJhNkqeKCWvoHY6u+YI8jzS6k=;
 b=Pw6fTfCznXDsVes5U9IH89rIPrz1TAN+99volo6N0NmIlJ/HP8TIiBBo+s0woj73vQb3dLH5zsuCf8pzgTq1XOiQCd+KK5wOVBti9AeOeX+LjNz3e3fzSYCJKxSgl4xdRySBRhysOfx7cUASLIM1WFTQ+aHAvqiqzMsOHv+fZL62v26A0I8EPFRfHEu2fI5jXuCIpHP0Het33+5W1TAqob5tthyfbW+cdqs1m/inyHBI57vDP2sMa12w5gv1Ht0ChSq+9HaOOW/US41Ntl/UBjN3hQGvDt7evIzRZzE0JcwwVb4dCZmXD8HVBth9yBnQcg9EOPUIMB0Qdzhwm8vJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15qQCWK/sJ7JJM3Nh9YJhNkqeKCWvoHY6u+YI8jzS6k=;
 b=mnTJTCHlRXM+wj4x29hmgcqpMabeXRj0YnSAAKGW1xm+0er0sdTt+qJv+fnsYjPP3lNp/puYoc7wyczf+5P0z9F0xyRs/5MTiPHj05cYOjZ85arQy7uOkBymWTNnKXxLvUeRUY3d4lXr+fpDwZjUKMo3Kx6fdtzdZryHTanpeD8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 04:03:27 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 04:03:27 +0000
Subject: Re: [Intel-gfx] [PATCH 08/15] drm/i915/guc/slpc: Add methods to set
 min/max frequency
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-9-vinay.belgaumkar@intel.com>
 <d1440d67-4eb1-ae41-b55e-97a2288a8564@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <33b1124d-0db0-0ef9-ed8a-2d5cadeca044@intel.com>
Date: Tue, 27 Jul 2021 21:03:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <d1440d67-4eb1-ae41-b55e-97a2288a8564@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR03CA0170.namprd03.prod.outlook.com (2603:10b6:a03:338::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 04:03:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338c12c7-42e4-4ec9-4ecd-08d9517ca76e
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56020C291170D04AAD00F43D85EA9@CO6PR11MB5602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Z9Qj+LkFYCENnUFOTkKo+MtcgFGFDeC1mpUD5cnjV/qp7HCVvLRHmlZxGUecIANjebfYXFDh9PNkyiYPx62cOYddtjCXuqXVcqU6W0fzAIYwiIdmy8RqHIqxGNYdjkebnod1cO7Qtm7qCCbsu2Gmn3jnXof0jHTfHnfRlEtZE7RMZV3QSr6ReEEqjy3mVVhFz+TWlkuVtvyh+gnM+ExQUkRiTQ08cYwjijHeH2MGgoLHuEdJ6+F7rWoc3yRAIVuN8ZIU67W3KNVpXPzNwndr5qYEQAANVdffhzuyazwTvOVmwBQoDdf/CdveAk6ukjaaX1sQW8FA7S6PdvP3r51joYqVukIKcAC2UTP7Eyix66wBzvQfSJP+xda+5p4SRvI7Iu+rDEzgSwaBNuh+p0wv813GaoVeIczNfIsndkcIe5rbDZ5IjSH3nA9tO2a7kORBLft9OgKnoT4ZvZIqauvoObhwuwUG/wDCFh9xNgxuKmbqUAY/Ln6q15oP7dsPBf0VI6oeS6x754KgtPbkqiXXLeQiJdP6cKWFGTkLtKK7m8529VcLP+JTEHK+4E4pA8QYzZzzpyiKkwQHfRgApaMZ1P8NyPT7jBlo7VBkM8eeiwV74II1iiP3G57H8UJncxXBMWZVDsVRGLHjJUu8QHMHNXw2YKFrxFPYOyOCZYw++r5VGG+JR1QBdt0e73iZ5CP6qksHwaUoxZHC/4D30F+BLK/nsu9xADCN5WwLstSBy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(478600001)(5660300002)(38100700002)(186003)(6486002)(8676002)(956004)(2616005)(86362001)(66946007)(53546011)(316002)(31696002)(66556008)(66476007)(31686004)(36756003)(16576012)(450100002)(2906002)(83380400001)(8936002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9KTkxGQ2pReTRibFk3UHpXSHllMlZDdVVFSDBGWkhaZFdZZ2hTbVN2dktJ?=
 =?utf-8?B?MVR0ZE1xUGMzTHAwdms0T296by9vTmN4d0JqWUl5ZjFGQzZJUzZ2aWpIVVg1?=
 =?utf-8?B?MVJpR21MWE9pRm5aTHptWWpoWEdZNzZBS3ZzdkJsUStDSnBaM280UFhKMzNO?=
 =?utf-8?B?K3VnTUJMWjFLQ2ZwV0VBMG05dW11c0c5U1VOWFZGWTVCSWhTNG9kUGtwOUl6?=
 =?utf-8?B?Vkp2ZTJnc0RqZ3R0Q1lKKzFXYWhRMCtGdGVKQmd2ZTdrTFcvS0dRdGRvYmNq?=
 =?utf-8?B?WmZCdVVPUGdtQm1waVhwejdEZG1wbENQcHo0cWEzZ05yV1hqcnlPUngwM1A5?=
 =?utf-8?B?ZkdsYzVabUEvanhHN0Vrc25ic3kyTDNvOTJiUG4wTERHamNVVGZpVy8wSTZV?=
 =?utf-8?B?R1VYWU0wcklnRmFQV1VZTmVBM2ZoNURIenRHZjNtZm9Jd1h5d1RtSWZzL256?=
 =?utf-8?B?M2N6V3Z3TzhseFZnZG43TVRFUXRZam9venNTTHAxZUI3aFE0WEdOdXV5b1lD?=
 =?utf-8?B?M0dtWUw5eFdCTkYwNTlDOEVvbmdNcDJXL1UvOXJmaVpPODJ2TGpaMW5RbXdB?=
 =?utf-8?B?K0xnMkJMWTlLZlVtRk5nQnlUSlAxNUJoUkV3UitkQ21GNEJna3Bxbnp0T1M2?=
 =?utf-8?B?VTZnVWhtTlExSWxNdWFZU3M1d0dNeXVoNVg3VHhtWXBtQzZOVFUwcFVUcVA0?=
 =?utf-8?B?djR5enFER3R2eWNiTmFFbzlFNjRhbWVvQXJRdEkxT05tOThuOHhRZFk0a1lN?=
 =?utf-8?B?a3RmZHR4Z1IrNEJTSTJGY0FaWUdxVWJoNWkxd1ZoL0xqeGdMaWdueEQycyta?=
 =?utf-8?B?TERxbU0zWEFHWEVRTlVqS2oxTlZWNFREOVowWTYzYTZXZnNpbiswRFlNUlhV?=
 =?utf-8?B?amhUMzRRM1RFcitOS2VsSE43eUVVM0tabUV2L3F1N2pJaEJmWnYzb3dsNlJL?=
 =?utf-8?B?SUdkaHptRHNzUXhrM3JFcjN1anRsdFNnMm5LSDBXendTSXZuTmJKN0JEaDhO?=
 =?utf-8?B?WmVncEROLyt1bE0wb05EdWNwWW5Wb0ZsRDcwQzVOZEpyN3ZENTdFRStSWm42?=
 =?utf-8?B?MURhdkErTThTL3FyZnpZeCtpVHN1MmJNKzRlN3d2YnVvNEdXNVhLTUxKamsy?=
 =?utf-8?B?aGdUYzJaZEN4NFp3TjJvb2ZrK3NEMVZGczNHNW85SG93SFErcmQ1M3Q5L3lz?=
 =?utf-8?B?MjdDQ2JYZCtmeTVwSlZuZUcwUFczNkJDcGs0Nm14ZGxpbXdwYmJQczJoR2ly?=
 =?utf-8?B?enlSemJwRkJJWEdCTW1WanhOR01IMG9Rek9GcWdtNHRhT01adXJvV09idkRB?=
 =?utf-8?B?T1dDazVpYm5rK3lOOEFTMEYwRE9Ya2JCbWliR3BnSXdXeEYvMmVMdjIxZU5E?=
 =?utf-8?B?RlNTNUpXVzhUVUJoL0V3dWFGK253L1Y4WkVNMURXRjUzTVd3VXFQT05lUlVU?=
 =?utf-8?B?MkxLQ0tPOUJFWE13bTFTdDVBY0hUYjZhbmhtQnhxT2pUYzQxS0N4OStMRHM2?=
 =?utf-8?B?N2ZEYjZBcWwxZWdnUGFEZGF0NE9vdVdCcDRwWDBkSnVDaWZuNVF6dzducERo?=
 =?utf-8?B?NmpwbXpWVDRGYVlTYjhkUTBtSFloUXVMb1VXL0VpU25OZWRmR0pnY1dqK041?=
 =?utf-8?B?VVVtRVo3cmRFdEMxaGpaSXlYSDFKdTRjdXBsbGJ2alFoVEtrUG1FTEcwby94?=
 =?utf-8?B?YUduenpENi9mcUdONXI1eGd1MmNkTzlQTWVja0NQQmNBUGZnYVdZS2ErWHdB?=
 =?utf-8?Q?TWowcIFQzWIbR/3+hLjWijqlvxeXcX/d9/1bezj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338c12c7-42e4-4ec9-4ecd-08d9517ca76e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 04:03:27.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVIAFIJWMgJnp7N3wTQjO/VDj18sqQo8ZGb504qzJUP+Nu/r+bQG7bVDO64h5V8pLmzhQ+qkcME3Sv9mauq+N57gLLZlFPW/zB5JQVaYyFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
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



On 7/27/2021 8:24 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Add param set h2g helpers to set the min and max frequencies
> 
> s/h2g/H2G
> 
>> for use by SLPC.
>>
>> v2: Address review comments (Michal W)
>> v3: Check for positive error code (Michal W)
>>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 89 ++++++++++++++++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index f5808d2acbca..63656640189c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -109,6 +109,21 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>   	return data->header.global_state;
>>   }
>>   
>> +static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> @@ -118,7 +133,7 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>>   {
>>   	u32 request[] = {
>>   		INTEL_GUC_ACTION_SLPC_REQUEST,
>> - 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>> +		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
> 
> this should be fixed in original patch
> 
>>   		offset,
>>   		0,
>>   	};
>> @@ -146,6 +161,15 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   	return ret;
>>   }
>>   
>> +static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_set_param(guc, id, value);
>> +}
>> +
>>   static const char *slpc_global_state_to_string(enum slpc_global_state state)
>>   {
>>   	const char *str = NULL;
>> @@ -251,6 +275,69 @@ static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>>   		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to update the max frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +			       val);
>> +		if (ret) {
>> +			drm_err(&i915->drm,
>> +				"Set max frequency unslice returned (%pe)\n", ERR_PTR(ret));
> 
> maybe generic error reporting could be moved to slpc_set_param() ?
> 
>> +			/* Return standardized err code for sysfs */
>> +			ret = -EIO;
> 
> at this point we don't know if this function is for sysfs only
> I would sanitize error in "store" hook if really needed
> 
> ssize_t slpc_max_freq_store(... const char *buf, size_t count)
> {
> 	...
> 	err = intel_guc_slpc_set_max_freq(slpc, val);
> 	return err ? -EIO : count;

that's the problem, sysfs wrapper will need to check for -EIO and 
-EINVAL, we want the ability to return either.

Thanks,
Vinay.
> }
> 
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to update the min unslice
>> + * frequency.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	int ret;
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>> +	intel_wakeref_t wakeref;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +			       val);
>> +		if (ret) {
>> +			drm_err(&i915->drm,
>> +				"Set min frequency for unslice returned (%pe)\n", ERR_PTR(ret));
>> +			/* Return standardized err code for sysfs */
>> +			ret = -EIO;
>> +		}
>> +	}
> 
> same here
> 
> Michal
> 
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index c3b0ad7f0f93..e594510497ec 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -29,5 +29,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   
>>   #endif
>>
