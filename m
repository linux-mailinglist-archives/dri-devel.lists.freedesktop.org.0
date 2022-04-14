Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2DF50126C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1E10FBDE;
	Thu, 14 Apr 2022 15:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10989EF7;
 Thu, 14 Apr 2022 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948900; x=1681484900;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TfT8uWhXugh590FD0S8C8weAFhSq+LbcB4q9UT+N2xc=;
 b=OGJdL37RJNNIFlnyfw6tiOURq9pJpGv5S0RyLHxFCCDD6RiWGaR1CgRQ
 DiYxmRwpwODUHqqgmptNdcZ3YHZ8nJ0GWNo53PKFxGOMIdGeJxJlwvSrA
 qBGEz4IDGccdexp4yOOQY0AYWL8iX+lb2bjALdmAsf3QIkcLgpEHyCB4b
 D6mM1YXCGIcmWRbgA+Kb/nX2vgq9VD3xl4szmXEOn8HphjZ5cVI8aX08d
 Bi1pYpWOSlvgOD9vH4szIPN+zkk+/2xeqezwHAn7OldyaM9JulcWZAotv
 iATRDQkFg8sGZMnJVE5dRtU4sHawozK0vKSQl62qTAtuPwaGQiremQz/e Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262394716"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262394716"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="855314206"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2022 08:08:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 08:08:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 08:08:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 08:08:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 08:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f01uLI5Zh3l2Mk3xKjc+J39/Nsmud4hVDyvYhEwpACYVuP7symiu549KJNf87pFxDod99m3QLxALMSGnaQv2KQ5t8rYcdrlptpovPD1lpXVoSSHK3eL3d2vfhyYmH9ul/gVq1IqaQEzFHkswwQ7RhIU/74DuXSB4Qx5BEAcJx91YS5XC2/uLaxUzMdbWb3E0oUl0u/feeDsPdDl9q40tR/HKBFS5oYdaYGwei2DRgPyp58Jo75/B/AH/vb6mzUjW3nng/fDvoDZFYFgJ7YvXtXZvcInjj1Nj4x3XP49ktu0mmqar9c7tP3Tt4SXgsnGH8ogYJJtTHq2LSdTInz8+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faHLUiLqSmlLGSJpbAXnD14lCMP/YO3BgVSMCb5Tp2Y=;
 b=iWDOiQmL6LrcdjbNOzdhEjPMgeZtR2LeTraTqNDat6J+9jY3C2Wfq++ZuF1DM9PNn+BE3+zT3k9Tu7QuTaroQK+5HuHTj5ocQBiXeYZWU1IUWmmhaTqEVuhgAcY2FQQEpMPiunopc2z+Bwx7k+KBb5hRaD02wTxu4VyoQXMzPtEPIkDilbSjJDv0tXp9ydjCTw/GNYqUek4BWpFNpbFqVTwXPgnLDaF2MPueqEWVYP2EDcXpLoXZ1SClNPxKsse6TPufFNb14NCVrPtSp5303rl4iOKJzJJPcJ4pV3IeL1jpbuOAgqEpGuGfYW0w6pB4IsTDc1Dbbrk793HjSeEqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SN6PR11MB2927.namprd11.prod.outlook.com (2603:10b6:805:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 15:08:11 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::a1ca:7908:ea2b:719d]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::a1ca:7908:ea2b:719d%7]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 15:08:11 +0000
Message-ID: <5853d85e-da43-5eb7-abda-a475283ff6e1@intel.com>
Date: Thu, 14 Apr 2022 08:08:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use i915_probe_error
 instead of drm_err
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>
References: <20220412224852.21501-1-vinay.belgaumkar@intel.com>
 <20220414064143.GE28908@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20220414064143.GE28908@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f47037b6-da60-4c50-da93-08da1e289752
X-MS-TrafficTypeDiagnostic: SN6PR11MB2927:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB2927E89F3D8AAB4324BBBF7785EF9@SN6PR11MB2927.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Abn2OjqitFIIZewz9DXeE61SVyxsrGsx9HRVvRGWmUaDCC4RfCRmib23PxYG/n7Jo3RFMM4wnuDfPB6q6HfydHH2iNDdHb7cASJtSWfgKmhN+u/thiHQly5Sh7WOY2KrwEbmlOXo8tsLyaRf+zQ4jdQ0BDdi5tU++Ev+9jo/btaKX73KU1hInohtj9yojXcoK9CugNy6JK5XbBwwBJLYZbYlpULcbAdUcsqIxdYQsDME+f+uDzYltPLxuk1nqEImqRQLw9yGvt17J/kSBxyakHXpKofagy9QvmDksaMKSq1AAN5x1W7YNT4sQ/TfopYrmS0nfZd7qCbE9ir7fvbwcxbDbf3jC1m1qWikAOR4fcDjQ+S0z3CjnMx+C5+FsC+jPgJ/g6vaHj/QuvtskkEEGV1ydLn3JkUTG0UfhOGYEI4fxeysV7xCzB2BBrMoX8WvbzkClRFT3Df6gikhFAk8VorptqXQBPBhZ18MzxvMlLSb2ae0azeXAYDGYvxfvDw5vwryDLuCHOcvzBKs0wK1Oxk/fjTBqeP12Do2MoCXnM34MJv7SXl+Lxs2/uxbmRn4Rr556wPQBRCmnpRwPzASipicBKiN95C9v4CZ3edkIOXy/cy0SWBegA5FzGz4RLd93LcjvjzYGAG82iCS0RpjTFumJ91HF9YJKG9gsA0HGL8bTNVsX8o68OrykyGz86C1uvwi0Inelv7SZ1hNqv4pjbYiqhPcNwzlfwSfk9LmXHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(6636002)(82960400001)(54906003)(5660300002)(66556008)(508600001)(6512007)(316002)(8936002)(2906002)(36756003)(66946007)(38100700002)(53546011)(2616005)(6506007)(37006003)(186003)(26005)(66476007)(6862004)(4326008)(450100002)(83380400001)(86362001)(8676002)(31696002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzlRNCtpby9uRFVwODF3NnNTTUs3RUNqSnh2L0lOeStIY01sMWZ5WERZSFdv?=
 =?utf-8?B?UzE5QVF1SkRLOHQ1RHM4T3ZoS0JqYUF4aGZ3MUhTUVdycURscjByTUpFSFBH?=
 =?utf-8?B?Y1ZjenFGRFJnZjFvUXlYM0s4SVFxaEUvM3htQ3k2TWZQYkFSMEdBTk9xalhi?=
 =?utf-8?B?bjlVbHFtYmQrOHFJQ0ZUNzhnYmhqc2xldEJ6dnY5UDl6ZGpDMzE1YW9WeGRS?=
 =?utf-8?B?UFVGSFJoWFRhNmRDQnFKRUxDRVB6WFFvWWRUWkwxczQyQ2lLSWtWaE1raER2?=
 =?utf-8?B?LzdoeGdHamdiTURLWGpjb0g1UnJYODZIMHVQSndLb0pQeklYRWlDa0MyWkd0?=
 =?utf-8?B?Y3RJbHpnODhKODVJREFwM1hsUVRyUmhkUDFWbEFORWZpMk56cEszZ3craHFH?=
 =?utf-8?B?TWNEaWxwcEJ3TXB3cUFUR3lBV2J2c3k4TjdGODBXNlJodlJzWFA0K3FpS3dm?=
 =?utf-8?B?U2pld29sL2lna0t5RDdBRW51cG5NL1JQeXVFTUw3SzFQazl3VzFYZDQ0RmlF?=
 =?utf-8?B?STM1a0NJOGFEVHB3ZkVMNFRCc2xBanNBclhEbDhyV3pteGU5a002KzlBS1Vp?=
 =?utf-8?B?UEl1S25Xa2ZuZjMxTlFrbDNTUStCc3gzTCt0MkZrenozWXV5bk9xY256Z1NS?=
 =?utf-8?B?alhYS1paTEpQdnpEU2xxcm1sL2l0SStFTWVOeWR4QzRCTWhEdkZ3N3RtdGRM?=
 =?utf-8?B?bSt4SitGVmlhV0U1ZTFJaFZkc01UcVFLeGNxTnIyQ0R4Rk9KODY3VytKMy9j?=
 =?utf-8?B?QTd4emNCZVhsTzlUNHROZ1ZrQmJjVUVjTkM0dVBVRjNIaVNRZWR4KzIwbUxP?=
 =?utf-8?B?TVhXY0MyanZERlhIWGhmdXBQZm9OL21IakpQNU1lNG5IUCs4andPWHhVd0VX?=
 =?utf-8?B?QkNXN3RsQlR6Ny8xa0dnaE5GRTJVdTltWEhRQnVBcWU5OWMwbUM4ZWdXVzJW?=
 =?utf-8?B?Mit2VVBXODlCdk54bk44bnQ0K0YzN2RzMVMvNmIvM25mODdhUGg4ZTlBSERV?=
 =?utf-8?B?NFhhQjM2bWtWNTZobEk5YUxKUnhHMGhDc25DR3pPbElHM0x5aFozL0g0ZDZi?=
 =?utf-8?B?Z1VzT3VCZ0lvU0V3Nkg4WG9kZ3FXZFE2a3FXYUFJRW4zbFY4QWxpNzQ5ZFZo?=
 =?utf-8?B?N1QzM2xiNnorWTcrYy9mN0NiN09QOTJFQU9SZU9JM09aWWhremc2ZEVaK2RU?=
 =?utf-8?B?Q3p5d211VSt5bkZHMFg0SysvMnVMYjA2UkczbnlWZVpKamcxN3RjVXl2a0h5?=
 =?utf-8?B?MkxDMGJINTl6TGpIcG9Hb3BFeGpHNU5YVENTMFJMSFhRWElGQXV3ZHdLb1FV?=
 =?utf-8?B?VitMV3BPRFRMNEU4NC95NGZ6U01La1dnNEtrVTNkcFdqYytFWGdoZWdtTzBO?=
 =?utf-8?B?ekM4T3BKWDhBK1AranlPMVRScGF4QTJNenBSNVMvNWgyTzBjd25ZMTdrWXRO?=
 =?utf-8?B?YW5NUHVOTmF1VlVTaThLbE9ySmVkM0xUN2x2MHNHNm9LdklzUHlJL2VYV29W?=
 =?utf-8?B?dEcyMmgwdWMxVktmL0NobHEwc1BZN1FvS1FCQlJTY1kyeXB0OFJIWXJ5VU9Q?=
 =?utf-8?B?SE5uNjl5aHdSVjN6Q0hEU3hlVlQxeVFRZnA5NkJ0SWowYnBueEpPMUo2U2JE?=
 =?utf-8?B?QkNGT0cvK1I1TEtTUmFSalpkQWpnZThBVm0yZlBhYlBGb3hrRW9GbGpabXBP?=
 =?utf-8?B?aGZFL0NGN0FNSUlERzhpQktLZnJPcm1KUERlOFpCZ25lTW1SdUhoS1BONUY1?=
 =?utf-8?B?Rm1mQnZMc0QzVmh6cVFnMkdkNE0wa25LSTc4aGxLQUJ3VU4wbTBWc3VkeHEr?=
 =?utf-8?B?dWI4cmFsUE44Ri9BWXhvS24yZW9tTUwyRGFaU3ZKL0dHRGx5UWdEdFlaTWVk?=
 =?utf-8?B?WmsyOUtvVDB3S2JyNWRKcGJNT0FiNzRVNmlYR2NQT0lpaWk2WGxZODVZek5H?=
 =?utf-8?B?L0ppbFJHbGk4ZjlKR2VyTktVbWcyZ1UrY3dLODRlakN5M3hjSi9DME42dW9w?=
 =?utf-8?B?cm9mN3BVVm1KVURveElUQ3U1LzRXR2hnTGl3ZWlSQW1LbXJKUkxOMHpKYjdE?=
 =?utf-8?B?blBvZVpMczVSRlNIWjZpWkVFTW9DQ3JCb1ZCK1psc21uQ1RkdGhxRkRIcmhX?=
 =?utf-8?B?WWhTRzA5ZTQwbkZqY0lKNnA2NEp4d21UQXloWXNBVzNWMEVWRlY4NWx1MGNi?=
 =?utf-8?B?TFFZQUxWV2RWVVFNN1VSSzR5TWRwQmNXRWhOQnUzWW9Jb2ZUcFp0UVpodHFn?=
 =?utf-8?B?Z29mVzNWVlYyRDNpa0dlZFFOcDE0d1FEVnp1Y0tSSDhvMmNGUDFrTlh3U1Fn?=
 =?utf-8?B?Vk9xNnE3ZE5tblVHeWd3TkN6RWtXRVVUZmlUNWF1Um9NK0YyY3Q3cWF4UURx?=
 =?utf-8?Q?wA/TaqmZnsvht2HQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f47037b6-da60-4c50-da93-08da1e289752
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 15:08:11.4223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTf4SRLJBRmGd9R91YkzNdL3ZcJnbW/aGoEAFV8EiRHpx6KD5pVrXIUayEIuQYSCvoS01iMu5dM13wsiiQtSPie3IJKiKM0bgDnk6vJ1YQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2927
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/13/2022 11:41 PM, Anshuman Gupta wrote:
> On 2022-04-13 at 04:18:52 +0530, Vinay Belgaumkar wrote:
>> This will ensure we don't have false positives when we run
>> error injection tests.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 42 ++++++++++-----------
>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index b170238aa15c..639de3c10545 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -152,8 +152,8 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   
>>   	ret = guc_action_slpc_query(guc, offset);
>>   	if (unlikely(ret))
> As commit logs describe, this code patch can hit, when we run error injection test.
> Do we need unlikely() here?
> Br,
> Anshuman Gupta.

I think we still need the unlikely(). Majority of the time, we still 
need the compiler optimization.

Only in the rare case of running the error injection test will it not be 
needed.

Thanks,

Vinay.

>> -		drm_err(&i915->drm, "Failed to query task state (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "Failed to query task state (%pe)\n",
>> +				 ERR_PTR(ret));
>>   
>>   	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>>   
>> @@ -170,8 +170,8 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   
>>   	ret = guc_action_slpc_set_param(guc, id, value);
>>   	if (ret)
>> -		drm_err(&i915->drm, "Failed to set param %d to %u (%pe)\n",
>> -			id, value, ERR_PTR(ret));
>> +		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
>> +				 id, value, ERR_PTR(ret));
>>   
>>   	return ret;
>>   }
>> @@ -211,8 +211,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>   				     freq);
>>   		if (ret)
>> -			drm_err(&i915->drm, "Unable to force min freq to %u: %d",
>> -				freq, ret);
>> +			i915_probe_error(i915, "Unable to force min freq to %u: %d",
>> +					 freq, ret);
>>   	}
>>   
>>   	return ret;
>> @@ -247,9 +247,9 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   
>>   	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>>   	if (unlikely(err)) {
>> -		drm_err(&i915->drm,
>> -			"Failed to allocate SLPC struct (err=%pe)\n",
>> -			ERR_PTR(err));
>> +		i915_probe_error(i915,
>> +				 "Failed to allocate SLPC struct (err=%pe)\n",
>> +				 ERR_PTR(err));
>>   		return err;
>>   	}
>>   
>> @@ -316,15 +316,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
>>   	ret = guc_action_slpc_reset(guc, offset);
>>   
>>   	if (unlikely(ret < 0)) {
>> -		drm_err(&i915->drm, "SLPC reset action failed (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
>> +				 ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>>   	if (!ret) {
>>   		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>> -			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>> -				slpc_get_state_string(slpc));
>> +			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
>> +					 slpc_get_state_string(slpc));
>>   			return -EIO;
>>   		}
>>   	}
>> @@ -616,8 +616,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	ret = slpc_reset(slpc);
>>   	if (unlikely(ret < 0)) {
>> -		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
>> +				 ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>> @@ -632,24 +632,24 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	/* Ignore efficient freq and set min to platform min */
>>   	ret = slpc_ignore_eff_freq(slpc, true);
>>   	if (unlikely(ret)) {
>> -		drm_err(&i915->drm, "Failed to set SLPC min to RPn (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
>> +				 ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>>   	/* Set SLPC max limit to RP0 */
>>   	ret = slpc_use_fused_rp0(slpc);
>>   	if (unlikely(ret)) {
>> -		drm_err(&i915->drm, "Failed to set SLPC max to RP0 (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
>> +				 ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>>   	/* Revert SLPC min/max to softlimits if necessary */
>>   	ret = slpc_set_softlimits(slpc);
>>   	if (unlikely(ret)) {
>> -		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
>> -			ERR_PTR(ret));
>> +		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
>> +				 ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>> -- 
>> 2.35.1
>>
