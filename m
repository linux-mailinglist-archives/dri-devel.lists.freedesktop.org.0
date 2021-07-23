Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6B3D42D8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 00:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F016FD12;
	Fri, 23 Jul 2021 22:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C5F6FD0B;
 Fri, 23 Jul 2021 22:25:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="211966725"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="211966725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 15:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="463290066"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 23 Jul 2021 15:25:39 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 15:25:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 15:25:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 15:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em5+LWU2FVWjm93brt2wLr6W67cz9CBUzpxHx28fjZCsC3K6+Cv3CJD50rCJF7ihDDK036UyuQQVAUgxmRB38kMl7NAU25j6q+vWX85+B9JA53pPp6LXtuumHnSjc1cXaoJyHFi8zoOMl04Ohf98Re7jZAB6iPXfJous2BjWNAkQGskzwYxbeMu7ZFeOXGu+Srq7KHDCKdBh0cGT7ZkdICZ+ya+v25gwkgm0Sc3o+Eb6loY7X3Yp/QP8VlMQs5HWF6YmdXK/92eq2PZzEuXTZ/DkLGUBmzz9XC80SQ6eSNFFbbLsPomk+5lavZdmhLc3QNkODgGcc6d3oRbo24D7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQ0kIAfCpqeg5lnNpzkIiCd83iEiKobVdB0Q3tbPFPw=;
 b=ZBgcuylvRYkVSj/KjBBwXfIM+aK4cDyMEWoncfgmwnsvEUnu/ZR6YibDlFLOpiWKnzIRJ6JDSm+HlH/iFaLFiaklgbdRr5jiY1/HKPdDCHdinilEftKoHtkI0j/UMkwWzUWVCPqKLV9FwHKDgLG1hdfX9GofFY0UFYEbifhEziFC7QbO1Geffjo6EIWzprP/7GhKvbg355FsrBZn5khbn22/AH6zN0lLvvSy4GQJ+Up7sS+wkI2N1tV/zTQNkPmzcs/vOv9H0vcyxg4nW0ATENGU3P9royyTNkCwRQbhmhCJCgEa4+UWT26g87HSA+IsqKGHb+X9YqMekagjUNKvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQ0kIAfCpqeg5lnNpzkIiCd83iEiKobVdB0Q3tbPFPw=;
 b=jjTCgXe5cob0aJazTAEv1nFFh/Q2h2NowvUSA+GNPddI1BbpmW4Bh3JLx8VCtnYQ+qk/yl/EyB4AZRXzDnV41jNQmaVlqrL4tIM9Ma0Gy6TRYjMsSgqlpTrrexymwt0UvPCrIyrcLpzVzOnTD9pnajCfCf+9UV8CkFcfKAkUzxE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 22:25:37 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:25:37 +0000
Subject: Re: [PATCH 11/14] drm/i915/guc/slpc: Cache platform frequency limits
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-12-vinay.belgaumkar@intel.com>
 <ea6a0786-c21b-f916-a44a-8139b41da954@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <12dff3af-cb7e-773d-1216-99de9188ca4d@intel.com>
Date: Fri, 23 Jul 2021 15:25:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <ea6a0786-c21b-f916-a44a-8139b41da954@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR07CA0089.namprd07.prod.outlook.com (2603:10b6:a03:12b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Fri, 23 Jul 2021 22:25:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78184848-6117-4e70-3312-08d94e28cb78
X-MS-TrafficTypeDiagnostic: CO6PR11MB5652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5652E3B2748713599D6F0D2785E59@CO6PR11MB5652.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7oUTEoaB40hw5ekF+2gA7COVAwnyvME7smVv73ITvGeV3PEQnLoFKeHWDyjLnLvzwdCNTab1C4tLAo6BwkyRZsGp1bN3cGyn59yY3F1iW+/VMtqb+OX5g0jdlFg1wSwuvXspHNtI3QjEnxj5Hm/IA4Ky0dD5KH+eThmpUIaR3NSw4NC8TjUwBHrOt+nMn4DzXktrUzdvJsaDGUuX57NA7MyakYUxpkLiahCiU0N5rG/Lnf52qwLvrDE/1aES6d7RgwVNVilQ7Aj9koE1kRBRVfS+S+wBqIIRjh35KvWuLvuL6t2pd2vZ8VsUmcwoHP/fq7Uz59zqBFsqGJZHsPb/kyUlfLAg5YsBKrxKhjWPlJFiqET4ecQUuGnBcN6nJRdHiT7kzsDzKlZspXGo8M+833tPocYF7KFQdsR/pH7jB8pXbY+is5wHvCyv/TIAklMgmowmexFXGKem0GmKjvsDZOGUCs3h5DHFwW5mAoDw7Z/WDES+CNF5f/2HPx82HCaGVjKts7j081CJTykO++tyQqvbYyTNK8AiRtw6kpQaU5qe51TZNaEjVABIMgboXxPM2Z5XmTv0wWMJRccKLB/Sj/F7Fb6thOksOHS/oZjYGDvxUU4nHIUf5CcI9erMrVSey6M4PjU+ZX+nexLNqWFFQ1u5cO1KA/d8KKJ+XBZC8ZIhIEqsHdT+MgLqIQgO84I3flSe+PfcrIengo2KccDqcTW8LvMGPTB7NNmPfPbVCcD2w+lBdV+6QF/fcpYc6X2/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(26005)(186003)(53546011)(16576012)(5660300002)(450100002)(2616005)(316002)(2906002)(66556008)(6486002)(956004)(66946007)(478600001)(8936002)(8676002)(66476007)(38100700002)(36756003)(31696002)(31686004)(83380400001)(86362001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJzNVk4a0pyZTIzb3YrRHBVY28rQVROWS9XUDlBUGJ2NHc0QkcwYnF5TnlM?=
 =?utf-8?B?QUZKZ2xVYXkvOERiOUJqYXRyMmVERHkvaU1LQ0xWdWRHV25uaFIzd2NkdzJZ?=
 =?utf-8?B?dDZFVE5udGRUWUtiUGNLSS8rRzBuRGdUQ21ZdTF3WDhwbEE5TUpFK1pVQmpH?=
 =?utf-8?B?T25RWGwrRklxV283Y2hyM3VZSTUzcTVWWmVmdVRoUDFaRFl5azNxdXllODFE?=
 =?utf-8?B?bWZMTG00Y09IdGEwTm9QZjRyaFB1cDJoYzNFa0ZRVU94ODk3SmlORy9ISG5X?=
 =?utf-8?B?bU4xSnFza2EvK00wcmRLczM1dnkrM3NJOXFic1hacGFld1UxZUdzUzF2WDNP?=
 =?utf-8?B?UzlBY0xyWVdRTm9RQm5tNTltcVpCNmg1NkpCcVVzdThFcGVyVjVIemxQdElL?=
 =?utf-8?B?ZFhIaGFXS0Y4V2ZkUkZDdDI5RnM1S2RpcmJNTGRYM2dFbklLZlk5WnJQVnNY?=
 =?utf-8?B?dDlzYWNnV2p2ZGFoUXN1WlNXd2xUaEZPa0psM1BQR2hXUkkwaTZQZFQwY2Jm?=
 =?utf-8?B?ck1OTWNlaUpwRDJzM1hqNjhYblNZc21WVnlOUjRSdjJ5K2xydnJOWDRRTUE2?=
 =?utf-8?B?OGxFSlpOM3NmWmxoejdNSWx6b3ZpTDRZQjVOUVN6eVA3QjhpN2VMZDdnZFIy?=
 =?utf-8?B?bXZjZ1cxYTh2NWhOTnF1K1kxc3J2WVhiU2Jjc1ROb0lYOGluc09uUVpVYk4x?=
 =?utf-8?B?Z2RlQnF2MGNZYklidnYyV09HM0hPVDlzRjd4WGR4S3ZaOGpTSm8rYy9QV1Fi?=
 =?utf-8?B?UzVzVTJJWTVMeXVBeUVKSS9OK0xhdW9HY1o1SjJqdjY2bzM5bXhDZk5LbjFC?=
 =?utf-8?B?ZnBSeFFoR0E4QzY1NWFpckpkUXdzaWY4ekliL2xVemRWa0FIM2hlaGUyTGY0?=
 =?utf-8?B?ZjFDbmw1Nm9ZWlJCc2M0aWM0dHd1L2RILzhESm1VR2czZUF2Y1ZuU04xRGFK?=
 =?utf-8?B?UVdwYldXRm9McEk2SmRRejVBelJYL0hBY0dkVDNYblFWQ0pNd2ZNVFZKazFQ?=
 =?utf-8?B?QkZnMlBkdGlaZnRRVU9XbVhmVk5pejVTQS8zZ0RRVGhpNHVPS2tvSm5CQ0RN?=
 =?utf-8?B?NEwyYmZsS2VtTXFRM2VITkVYNnNEdmExUjlMNzNTVzgyanEya3NTMVk3VW5T?=
 =?utf-8?B?cGhzUjljN0lXUkdodmhMWXdDMnBKVVlaUHhuc3BxVXZLYnFndm1vUi8vT2RL?=
 =?utf-8?B?NlV3MzlCTmZtZnFnaDhvdWtWbDBOMGlUV1ZBT0hRQWhQbVNjNHFyeDhDdUVx?=
 =?utf-8?B?eGtKYStDWXFsWFl1cm8wSFZYRkRiUFZEanlVMmRVNnRFZW9sVStmZmlMRUI5?=
 =?utf-8?B?aktaSXFyNnJaOFVMTlhSOVBoZUhmazFCaGhFSVExeWNtSnU3U0Jqd0QzTzla?=
 =?utf-8?B?c056YXRwZkxHanducjlnaWR2eDMxN0syWGRHR0xwK3R6ak84eDYwK1BBTTJI?=
 =?utf-8?B?SlZQYy9NV0xCWEFkZFY3RUZMOWpsK1paWnh3SFgwd05hOE1pamJvMm5URS9E?=
 =?utf-8?B?SU5RUUttMTFrN3BIcjl5UnJHYzdwaXg4WXFBbVJSTDJHWVdPM213eUt5SWdP?=
 =?utf-8?B?SlQ1WDIzYTVFalBIVXp3OVI4VUJiRFhWYmhZbjJpdFpuaGJrTHJkMGFScjVZ?=
 =?utf-8?B?SkNCcXhIS05xUXp5bkYxQlZXTTI4VnNjbUg3TVdyYW44ODZyaTdGb2JSczhE?=
 =?utf-8?B?M2VkUTJUS1ZwNUZ5Yk8yNkJiMFQvUnI3TGRUQjdBVTkxN2VxWDU3TFV4aHhW?=
 =?utf-8?Q?4kZw64edcLix+kaIoV3PXgGg58G6AVuMUzZ+wZQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78184848-6117-4e70-3312-08d94e28cb78
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 22:25:37.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcsyZlzPgMbVfdKQTybQnVH4bKNPXsK+agxXaZ3ybN/0buRht5Q6kNqabWj2hzTvII61UZYZ88+p3G6Fn32G4zU0sGt0t8LTpXcA5ZLZFfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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



On 7/21/2021 11:09 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Cache rp0, rp1 and rpn platform limits into SLPC structure
>> for range checking while setting min/max frequencies.
>>
>> Also add "soft" limits which keep track of frequency changes
>> made from userland. These are initially set to platform min
>> and max.
>>
>> v2: Address review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 98 +++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  9 ++
>>   drivers/gpu/drm/i915/i915_reg.h               |  3 +
>>   3 files changed, 110 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 8796a8929d89..134c57ca10b7 100644
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
>> @@ -121,6 +124,19 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>    	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>>   }
>>   
>> +static int guc_action_slpc_unset_param(struct intel_guc *guc,
>> +					u8 id)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> + 		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>> +		id,
>> +	};
>> +
>> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +}
>> +
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> @@ -164,6 +180,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   	return guc_action_slpc_set_param(guc, id, value);
>>   }
>>   
>> +static int slpc_unset_param(struct intel_guc_slpc *slpc,
>> +				u8 id)
> 
> likely can fit into one line

done.

> 
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_unset_param(guc, id);
>> +}
>> +
>>   static const char *slpc_state_string(struct intel_guc_slpc *slpc)
>>   {
>>   	const char *str = NULL;
>> @@ -388,6 +414,55 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>   			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>>   }
>>   
>> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> +{
>> +	int ret = 0;
>> +
>> +	/* Softlimits are initially equivalent to platform limits
>> +	 * unless they have deviated from defaults, in which case,
>> +	 * we retain the values and set min/max accordingly.
>> +	 */
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
> 
> hard to tell from mail client, but likely misalignment
> did you run checkpatch.pl ?

Yup, ran it this time.

> 
>> +	}
>> +}
>> +
>> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>> +{
>> +	/* Force slpc to used platform rp0 */
>> +	slpc_set_param(slpc,
>> +	   SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +	   slpc->rp0_freq);
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -405,6 +480,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   {
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	struct slpc_shared_data *data;
>> +	u32 rp_state_cap;
>>   	int ret;
>>   
>>   	GEM_BUG_ON(!slpc->vma);
>> @@ -442,6 +518,28 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   			slpc_decode_min_freq(slpc),
>>   			slpc_decode_max_freq(slpc));
>>   
>> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
>> +
>> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +
>> +	/* Ignore efficient freq and set min/max to platform min/max */
>> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
>> +	intel_guc_slpc_use_fused_rp0(slpc);
>> +
>> +	ret = intel_guc_slpc_set_softlimits(slpc);
>> +	if (ret)
>> +		drm_err(&i915->drm, "Set softlimits returned (%pe)\n",
> 
> "Failed to set SLPC softlimits (%pe)\n"
> 
>> +					ERR_PTR(ret));
> 
> should we continue after error ?

This is not a fatal error, does not leave the system in a bad state or 
anything.

Thanks,
Vinay.

> 
> Michal
> 
>> +
>> +	drm_info(&i915->drm,
>> +		 "Platform fused frequency values - min: %u Mhz, max: %u Mhz\n",
>> +		 slpc->min_freq,
>> +		 slpc->rp0_freq);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index c417992b1346..8c42562a28fc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -15,6 +15,15 @@ struct intel_guc_slpc {
>>   
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
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index aa433ae8f5de..92392c1da0e6 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -4086,6 +4086,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
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
