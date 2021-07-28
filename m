Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3313D8550
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325356EC1D;
	Wed, 28 Jul 2021 01:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6676EC1D;
 Wed, 28 Jul 2021 01:28:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="199739678"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="199739678"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 18:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="437547973"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2021 18:27:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 18:27:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 18:27:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 18:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJRg7uUatH1FBY789VtqMk4wSGhDH8JztvyXrZfc/LmxuBkLbt+uX0DCClOWGNZaTC3Og/H4He5GQRMXQseu2HMlJwAo2iMvl/xd9FrTzYfyhhafBsxzh+SXKaISzyNBPoxPyesZVy/Ze3QQqrWhUAn037xrJS56IvfSQqPYf6VP6I34Jqcn/8dylTUOKWTjKOuMNNsX4IhDacI0QgckNP7UrL+Z0y9lI9diejPwehavD6TGXQQITMI8Ixqx9iTndxDbYrgz5eB1obbS2N79Dpqx646L8RkgOpDja/Cxeb2X7ayqg4C0oEBc2YSzshmquQi7Uig6Z/VFKlriQ6F1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mWHRmjdnTsjJm/dpXqObRbhNxB6azrp3aESHPL9piU=;
 b=HZjp15eMNxm7K4WpMLQVq1et/zEIQGMAKt9o/BzBHvz/QIVedxy+7uo+XhJZIo0hiG8usYH0LgAAuZA/IQ1KWh/SiK6Y+AkUFRQxIvRg1XT1z5eLcvjB4K7LxnPRYZVSUqIJMAAi0mtPSjgG5sqRk6RDVKb54r3qgRpYrzOdaXq72lQ9PFOhP104c9SKy5zCBHphH11S2hEDXoMUOwJbYlQ/0VRs5qKce5UdIdvhETA6XJ+EFIfh5t5hrnmbAZzKoZvjUQoI2K6+K9Vr+R+q/4o/2Jt3D61U+CWBnz/Vv9uI/SqORTMZhZXd9y8e8MIG6u+s4zwM50LuIcjt69Ax7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mWHRmjdnTsjJm/dpXqObRbhNxB6azrp3aESHPL9piU=;
 b=iAe7FKpHRnZAsh+TnTYIRWT2DWd48Plafk3SUpdbP4uha36AA7iOskBNHq4jPXiXtpAT+sppjSJ1Wm8ifDkd3zTbDkuk9zs+IPkAzCbivz3JFHypr5D8r1BWIGqtI2dDdKFEoPAaCAMR0VaF6P/INc2i9ZD41kmyGpZInG7zow8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5649.namprd11.prod.outlook.com (2603:10b6:5:35b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 01:27:46 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 01:27:46 +0000
Subject: Re: [PATCH 12/15] drm/i915/guc/slpc: Cache platform frequency limits
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-13-vinay.belgaumkar@intel.com>
 <416134fd-d688-1feb-cae3-98bcd287e04c@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <af4f0a42-913d-50c6-4359-9792c61652c9@intel.com>
Date: Tue, 27 Jul 2021 18:27:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <416134fd-d688-1feb-cae3-98bcd287e04c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::28) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 01:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a862c9c6-bd71-4d0a-e908-08d95166e76c
X-MS-TrafficTypeDiagnostic: CO6PR11MB5649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB564970B93681F3863A7C2A3685EA9@CO6PR11MB5649.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0S9Zw9t+b03Mx5FZj7VrTJvbTzhdXdlUgbHswAAsOLHt1cDxgtm7ozfDmo8MRsqQgdyQ41HUH9c1TTbvFYfdRb3O+sl7JcgmvtfeUF73dwmckDkxXoInpPw7thrWlvXO5ZS7Cs+wbLo7gHFG3o5bl+m7fkuCGJMM57renoGfYpX5Zkuopbp/9zbCZ+Soc1vf0ICOyDcal2/KAR1qN3dhCHz1oDZ5HDDBpbMQiJ7pKfynIpOQaav2X56jTN/kfeWtOnZEmrGTzcW7YhrWWHgIu6pco64rZKwpbr/fZ5ZZnNqn19umQ5rg6RhxBTunTo65aLbyM0GWPQl2HYJhBdBbqVCfugyjbq1uieHSmcapUfN+W+2ch59ZzUSe4wTbi2bOVoiKvdY6Ay7YHVamCoyX1GboUAmGMhDYWMGD187bli/TDD1CYY1ujarKTiEwLrXGD9ZeHU7V3MH3NZ82K9ApISLbC0XOVeqnw3MPA87WTNVSNBjvT3e8lvyesX+hzXthw7KefLzqd5l+YeFlhYoFjpvNnIhWCV1YOC98pZy5sZnoMR5MxEnRDbKgbSS84bHwsCfKRx8ePni9bGb96353gK/TGWwvBpG7r0PNY2DLv9qsF4sg2A/ZrXjljLLMMMUIAhyuPFY+v9KuHOJAzRnFdUXX/+6qsoDgagf7Jn1plagXaeArtwD1Ri8GUB4MiLdqq2Cf1gszTdTR3wMn5qKNEcAOMHqqYtEvS/TZjo5qRoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(16576012)(5660300002)(956004)(86362001)(38100700002)(66476007)(31686004)(186003)(316002)(26005)(66556008)(83380400001)(8676002)(36756003)(31696002)(6486002)(450100002)(66946007)(2906002)(53546011)(2616005)(478600001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlWTmpvVlhITzVxZXdEcTFxT2FQKy9icHhpd2N4RTgrZWc0S0FLUkM3enVE?=
 =?utf-8?B?R2tDYk9wM0dWSktuKzRCTERuT0xDV1loOUQyMlNhdnZUY2tkc2tvWkp1YWt5?=
 =?utf-8?B?MUhzekFOK1MxMEJXK3c1dzBCdnhCTkp0R0hZSlQ4V0VGcFQ0K3YwM0FwNm5n?=
 =?utf-8?B?YjNtZFNSTTlJME10NFloeFRsM2RFdHFkWk8zc2lqZFNpVW1Ma25vQzNSbWJV?=
 =?utf-8?B?QlZRTXpzSlZrRS9jMnNzVlo2OEt2TVVLRjJ6L0tnalZteCtTZC81Y3ZjaldE?=
 =?utf-8?B?THF1WWl3NGYwNENFZzY2ZzJ0NWJ3UTIrVVN4elpvWUx6d2FGdTNkNEx3THZG?=
 =?utf-8?B?dzk0YUl0Tk9MU2YrNDUvSEN6ZEZJRkt0akdCYmM1YnEzOGhmSjhLTTlJZlVD?=
 =?utf-8?B?OHpjTkt1Ni9nN0xhVkppeExEY0dBdzZrTFdhWWU4UkFFMWJUeGV2SFp6SlRL?=
 =?utf-8?B?UElvV2djb1I1K1BOUmRMR3dLV3VMN3lHRkZGdHdqOGhzeDdhMnczT1ZHMlBq?=
 =?utf-8?B?ZktRWVpNcWYxOUJZZUp3OEV1YXZ0OFlCSXN6Y3Rzb0lIUklsZmFaZ1dZZ1NN?=
 =?utf-8?B?ZG04cEJ2Q3ZVVm5TenVjNzlsOEJZcCtxWUVRRGZLTjNNNWhRK3JnNzBMWTNx?=
 =?utf-8?B?WFRuV2lNYnlzV3E0R3o3Y2d1bEJCRFJtYzRBbUUzeW80K21VWFQ3VTVNSWp2?=
 =?utf-8?B?bzEweElWWUdOY0JPNFhOaHF3UmczVmJYUFlXVXFvRlJHaU5kdWNRUnR2dURp?=
 =?utf-8?B?MnluMlN0N1k2ZzY1dWlrUnFjTVVkSkt4M290eEdmVGhEODBXY3FIdFM4VkE2?=
 =?utf-8?B?UVlwRmtTbHV3Tm1pNXlGOTlOUHF6L0FTdDhFOVhxbVJSRHVhTnM5ZmV5WDE2?=
 =?utf-8?B?ZTJwZGN5N052VzA3OEt0c3FtN0p6QXFCYkcybjVyem1uZzlaR0dPM3dpL1pJ?=
 =?utf-8?B?cFNieUN2U3lrTHc2NmcyWHJ6Mm5LMVBmanEvTFg4Wnp2SkdXVDJzcmpPMSta?=
 =?utf-8?B?S2RRRzFycDBlTS9iSk9JVk9OaWNpWGZOQlp4NWtrTUVjYzdSWW43MWRDWW9R?=
 =?utf-8?B?RDR1d3FFU0hxTnBVNExrVENlQ1J6NmZKak16R0kzWTFPL3JKcGhMVUJLeGJK?=
 =?utf-8?B?R2lJYThWME9xN2JjeGJyVkJic2dQVVFqanpsVzZqdkUwcllqRWNXNkxSbVgz?=
 =?utf-8?B?dGFVQklzc0lET2FZUE9zSTZpUHI4QU53V3hzZ21HN2ZVVlFScWEvT2NPT282?=
 =?utf-8?B?UzVXY0hzckRZYzZ3QVRWOVNNMWRscmppMXFSMlVXaUlxUnJUYlFBaDFsYlh2?=
 =?utf-8?B?eGhEZmR1RW9sQmRZK0RTTGorYks2cWZJMkxsZzVxYmJrQXdrNzIxR25saDE3?=
 =?utf-8?B?SUZ6MjVTMm5TcTJLS3hMZVZTVFFZeWEyNDN3a0hEdHJRMEZVc3pGYS91dnhj?=
 =?utf-8?B?WGdWYlZETTB5VWg5VDcxOUs5RldLSFRsMVFGdHRFRi9KVjJ0SkM4VUpVTFdI?=
 =?utf-8?B?UFdESDJWQnVCbzdoejlhY2pmemNVY3NMcTY5diszVDBPTFNnQU0vbmlZRmRI?=
 =?utf-8?B?UGkyaG9FZWt1TjZaQUVXRWxRcGNLUFBtSUFxVm5FZmNVbEpvRVg0SDFLRFp2?=
 =?utf-8?B?TUJlOHBYMyt6OTZhUUFXVmJpdXZHZWlsK0lUVHp6bitPUGN5azdleGx3N1RE?=
 =?utf-8?B?R1lBUVBodHJsUktxQjg2REJXQ3pzRHZCRHhad3Z0K3RPS2FRd0k2NW5NeFcy?=
 =?utf-8?Q?RuYpmHxI3zBAd2nZ4JsjTpJbF1vfBA9+aRYzj57?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a862c9c6-bd71-4d0a-e908-08d95166e76c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 01:27:46.1481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYla3R6v/eapIkWfjyEktwk5Nbc1Yndgid3QMHRj2D3WBG1GhFuW0hDE8m5AS4xp9cPloQ9Ape9pm0hwEQtEclfzP0Za9eag3VJJaAX7s1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5649
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



On 7/27/2021 9:00 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Cache rp0, rp1 and rpn platform limits into SLPC structure
>> for range checking while setting min/max frequencies.
>>
>> Also add "soft" limits which keep track of frequency changes
>> made from userland. These are initially set to platform min
>> and max.
>>
>> v2: Address review comments (Michal W)
>> v3: Formatting (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 97 +++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 11 +++
>>   drivers/gpu/drm/i915/i915_reg.h               |  3 +
>>   3 files changed, 111 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index c79dba60b2e6..a98cbf274862 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -94,6 +94,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   		return err;
>>   	}
>>   
>> +	slpc->max_freq_softlimit = 0;
>> +	slpc->min_freq_softlimit = 0;
>> +
>>   	return err;
>>   }
>>   
>> @@ -124,6 +127,18 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> +static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>> +		id,
>> +	};
>> +
>> +	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +}
>> +
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> @@ -170,6 +185,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   	return guc_action_slpc_set_param(guc, id, value);
>>   }
>>   
>> +static int slpc_unset_param(struct intel_guc_slpc *slpc,
>> +				u8 id)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_unset_param(guc, id);
>> +}
>> +
>>   static const char *slpc_global_state_to_string(enum slpc_global_state state)
>>   {
>>   	const char *str = NULL;
>> @@ -406,6 +431,55 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>   			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>>   }
>>   
>> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
> 
> nit: "intel_" prefix not needed for static function

ok.

> 
>> +{
>> +	int ret = 0;
>> +
>> +	/* Softlimits are initially equivalent to platform limits
>> +	 * unless they have deviated from defaults, in which case,
>> +	 * we retain the values and set min/max accordingly.
>> +	 */
> 
> fix style for multi-line comment

done.

> 
>> +	if (!slpc->max_freq_softlimit)
>> +		slpc->max_freq_softlimit = slpc->rp0_freq;
>> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
>> +		ret = intel_guc_slpc_set_max_freq(slpc,
>> +					slpc->max_freq_softlimit);
>> +
>> +	if (!slpc->min_freq_softlimit)
>> +		slpc->min_freq_softlimit = slpc->min_freq;
>> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
>> +		ret = intel_guc_slpc_set_min_freq(slpc,
>> +					slpc->min_freq_softlimit);
>> +
>> +	return ret;
>> +}
>> +
>> +static void intel_guc_slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
>> +{
>> +	if (ignore) {
>> +		/* A failure here does not affect the algorithm in a fatal way */
> 
> is this comment just for "ignore" case or whole function ? (as you don't
> check for errors in "else" case anyway)

moved it above.
> 
>> +		slpc_set_param(slpc,
>> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +		   ignore);
>> +		slpc_set_param(slpc,
>> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +		   slpc->min_freq);
>> +	} else {
>> +		slpc_unset_param(slpc,
>> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
>> +		slpc_unset_param(slpc,
>> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
>> +	}
>> +}
>> +
>> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>> +{
>> +	/* Force slpc to used platform rp0 */
> 
> s/slpc/SLPC
ok.
> 
>> +	slpc_set_param(slpc,
>> +	   SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +	   slpc->rp0_freq);
> 
> hmm, likely indent is wrong, did you run checkpatch.pl ?

Fixed.
> 
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -423,6 +497,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   {
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	struct slpc_shared_data *data;
>> +	u32 rp_state_cap;
>>   	int ret;
>>   
>>   	GEM_BUG_ON(!slpc->vma);
>> @@ -460,6 +535,28 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   			slpc_decode_min_freq(slpc),
>>   			slpc_decode_max_freq(slpc));
>>   
>> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
> 
> shouldn't this be slpc_to_gt()->uncore ?

yup.
> 
>> +
>> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
> 
> maybe worth to move "rp" read/parse to small helper function ?

ok, done.
> 
>> +
>> +	/* Ignore efficient freq and set min/max to platform min/max */
>> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
>> +	intel_guc_slpc_use_fused_rp0(slpc);
>> +
>> +	ret = intel_guc_slpc_set_softlimits(slpc);
>> +	if (ret)
>> +		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
>> +					ERR_PTR(ret));
>> +
>> +	drm_info(&i915->drm,
>> +		 "Platform fused frequency values - min: %u Mhz, max: %u Mhz\n",
>> +		 slpc->min_freq,
>> +		 slpc->rp0_freq);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index f14f81821a51..16dec703db43 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -6,11 +6,22 @@
>>   #ifndef _INTEL_GUC_SLPC_TYPES_H_
>>   #define _INTEL_GUC_SLPC_TYPES_H_
>>   
>> +#include <linux/types.h>
>> +
>>   #define SLPC_RESET_TIMEOUT_MS 5
>>   
>>   struct intel_guc_slpc {
>>   	struct i915_vma *vma;
>>   	struct slpc_shared_data *vaddr;
>> +
>> +	/* platform frequency limits */
>> +	u32 min_freq;
>> +	u32 rp0_freq;
>> +	u32 rp1_freq;
>> +
>> +	/* frequency softlimits */
>> +	u32 min_freq_softlimit;
>> +	u32 max_freq_softlimit;
> all frequencies are from 0Hz to 4GHz ?
> or different units/range ?

yes, all of them are in the same MHz units.

Thanks,
Vinay.
> 
> Thanks,
> Michal
> 
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 5603377e06ca..f3a445f79a36 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -4109,6 +4109,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>>   #define BXT_GT_PERF_STATUS      _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x7070)
>>   #define GEN6_RP_STATE_LIMITS	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>>   #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
>> +#define   RP0_CAP_MASK		REG_GENMASK(7, 0)
>> +#define   RP1_CAP_MASK		REG_GENMASK(15, 8)
>> +#define   RPN_CAP_MASK		REG_GENMASK(23, 16)
>>   #define BXT_RP_STATE_CAP        _MMIO(0x138170)
>>   #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>>   
>>
