Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF56409F9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 00:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8389C09;
	Mon, 13 Sep 2021 22:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3BF89BF0;
 Mon, 13 Sep 2021 22:26:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="209037562"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="209037562"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="582574747"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 13 Sep 2021 15:26:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 15:26:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 15:26:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 15:26:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 15:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1AvO2stcgk5czsVHDKZXDRCc/gl1u6Q/IlAr1sSrEWBXFRpnMRUgxPzR3AeModlg7bvWHWe7BhFpiRzdvHsEHWgafBQZfnZck5+kf2/8cxWX3+fkVmIz/EPIBTkwNrmILXw3ndFNqmr7TRgX71hWG8r5m7DcLe5771de7KzMNCWq4dtBKbxRezeJJlBfUwm4k+E3yOWGC0xpy4ubgqlvndnAOCt6kBSgWMYMv6PYvGAEAySqZeX5JeqrRbHrzHH2Z92d4XFVmvZ12l76BlG7ZtvNbj9tYB7QUvVcq9ApMWf39Dq3hxaBHaGZhvlaTVC+JX0EyexI9on20xYUqCzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4TCO9ULWLbcvA023xwhfu4+W27jxwC/2nHG5lI3mE60=;
 b=nz66Sm73FrJPX/GmCzAg9Fc+xYmexwM6Io+7ddkaZc9Ly3fx4RpnOLsIz8+kqUC6+WpG/iQ6k6zOwweAeJsxuQhY8yu5/UEWwsW7bPeBr8WVf9Hx3oGzPnBmWKoDr13XcpF8ztN1NI3cydIv8CKkjqyBVgQ3SttTsxz+FQBR9mcywRqVqFxRH28Uc+KPm/LeGFHPKrmJHk3LhTj6JwSygPVDcwOmYnEzxeRJinyr9iMUI4/npGLjSwdkyR0259U/r7jIoICpmYxVmUJMvdQmB+L1Og1hdTMEc4FYbHsD/gQaEoIUsqFQMRkfDPW+x8k+rGhEbIBamYhY6vmfKQFKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TCO9ULWLbcvA023xwhfu4+W27jxwC/2nHG5lI3mE60=;
 b=RHkNRYreqIKoeqIeLjYSzVKTQebcRqStFTvC4jEMQT60g1kMJrEb0Icqv/lo3/IXYYF07D0STnMRUwwFFnq7NkERTmfhC4vqUN1ERmRgfn3eVVrWakfzyRtYaaYZI8ivbUXHkJVYfZhy786gkzdBbO4QTKNK01kPHzGvTBgb67Q=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 22:26:32 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 22:26:32 +0000
Subject: Re: [Intel-gfx] [PATCH 06/27] drm/i915/guc: Take engine PM when a
 context is pinned with GuC submission
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-7-matthew.brost@intel.com>
 <a741a93f-7a23-6188-1455-beff457d6189@intel.com>
 <20210910004142.GA36638@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <07d15bba-998c-bd03-e0e9-88394053b610@intel.com>
Date: Mon, 13 Sep 2021 15:26:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210910004142.GA36638@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR21CA0045.namprd21.prod.outlook.com
 (2603:10b6:300:129::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR21CA0045.namprd21.prod.outlook.com (2603:10b6:300:129::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.0 via Frontend
 Transport; Mon, 13 Sep 2021 22:26:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ff0631-fa5e-4aca-44b1-08d9770589be
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55956B76E3151A8B550632B4BDD99@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13pJEK1NIeGDagWsd9bh87M5S6P3J2JLFSXr820vol13KXhzo1UTKbGrRPt+AvTYM8gqsop8K10BRmQ2DW1VT5UgOUqQ9H1xk3oyv8Ul72RLuJ1aZ/AELoUO6bp01mj8GlebcXOuKNe+HSUZK0x0chj5Sz2TWEGGGNwKt2/ojYAQ67MRCkGsw8ByXLsVcXq1VYgluzLDOH7fqVIPo0fFpd3gPl2sL81A6m3sWr58k3JH6omOeqwfRZTgjbSsZU3k43QtFB9vHp1nsydYSjsO9alFwP0kYKgzyVaH5DmuMh7hozkMLk0KMmGbck4/rGq6ngUi+gWf7GE352Mh+t+FMv6c6zIddVSHiK40IGrr5Ic0ArzpaUgATtuLcLBVUn6Emf69NaeGf1SRFGAOTSqoF0gsDX1NSfxMx62YO/3vEOoKdMoIa0CSMqg5f6Fa7091ASZxI5yCEQcDOnzURQStqOm0sIWrHWLI4fl2LteSjZj+npL6SBZNaIFJzlgWyZPRkQ17MvN2Ul72gGg8n3i1UEj26n6tk0Rzk7IKNm81qswHAhduatfMLqcrtDguiy2S8sMo6gs2U6N4fNAs5UgR8dtvMUTbzh4YAVkvc9x6SwLEWH5lCJN6ZNVLboSaFWKQvlce9yQdXphgkM8LKdga2G6jhvvL/8uobCALwzeEuRW/L0GR/ZqINyZAfhECy+jUc3iVvDkKG6uPE6UdXZgh6ssF/TfvxwXVUJKjVz8/f5D/lzqDXD+OZzbf7di2phWS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(36756003)(8936002)(31686004)(5660300002)(478600001)(6486002)(316002)(6862004)(86362001)(37006003)(107886003)(6636002)(4326008)(8676002)(2906002)(956004)(2616005)(16576012)(26005)(66556008)(186003)(66476007)(53546011)(66946007)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtqRUJDdmtHUTgrTFFRNVJUNDVnbkpIVHl3TFVQSU9qcnEzcUhtWkJOU1VH?=
 =?utf-8?B?SWVQK2FiWjBmNnZod2E5ZWJIOTNrRHBQWWhVbnhheTBlNEJGMmRWaUZoUXJa?=
 =?utf-8?B?dkUxOXhqREhpSzNUeW96L1BKRzc2R3Mrb1JSQUdvYU90NEdCY3MrS3Z0MHA3?=
 =?utf-8?B?NTgxUEZyV2FFT2Uyd3QzOERvNXdMVGRsbUNrRU8xcGg3QlFtZ0VGOGNOSk9U?=
 =?utf-8?B?NGpnYThQS05KOWxvSjhhK29rR0VCT3IxSi9pdlJtaDNGNllUc2FmekJqSHFi?=
 =?utf-8?B?RTdxQW0wR0t5TkJzVFdSMXFhMi8vTkJCaXRhTHY4SDFxcm1mcml2S3ZNMS93?=
 =?utf-8?B?OEJHc1lSa2ZpMmNnbDVQbktjWEJqU0U3Z0ExZ29TU0tvZitNdnozK2lVUkF1?=
 =?utf-8?B?RC9XR1lrTGIrUVBwQ3RjYmNBTi95KysvS0dNNk9tQ0pGSHE2OCtYR01tN2Zz?=
 =?utf-8?B?YWNkeEZsUVFXdUZMTi8vaHpYT0NmVUUrU0xlc1hFQkdaVmg4OHFBb05tM3ZC?=
 =?utf-8?B?U04zcUpwcXkwZUh1VmJZalJDQTE1WVAwN0EzSEorZkxZNXN6MFl0bGVlY2tu?=
 =?utf-8?B?SDBJdnRZODZPazVQb0Q4QWhDZit4b2MxRDhINTJ0aFo2dWkycEV0YjF0K3h3?=
 =?utf-8?B?UVNFemNkVXA5dWFzN1ZjY0JFNkdIa3d3emNTeUlXVVV3ZlNnSnA2aituZEpz?=
 =?utf-8?B?THZnZnZCQ2ZiUDNjR3NTNVJ6dlMvSVdPYTE1SndJSGVkazRvSVhnWEZ6djNr?=
 =?utf-8?B?cDNwWXFVQ0VZc2lDb1NtbjkreHpGM3JidDJEOUFPMHRjREE2WU03elJlbkly?=
 =?utf-8?B?Nm5sdDBKMzVOdnNkYWdFODh2dXlua2txK21pOFFTV2xqWUFUREJSM1lnS082?=
 =?utf-8?B?THlNeGlYNE54VFFtdzRXM3VvMEpjMEtNb1dzM0ZBSG9EVDhKTkRaRVpJMEo2?=
 =?utf-8?B?MmZIQ0VydTUyb2hWVXBvcVN3MnAxUlRFOE5UU3RWeThsUWwzWHJCSW9adGlM?=
 =?utf-8?B?UWRCelB4aFZabUFlait6SXUwWFhiUzVmTC9qMndKNFV5UzVHRXNVcnlpTTNs?=
 =?utf-8?B?UThYaFQ2SnFpUTRvYWZ6UzdCNTk0REY0eUcyOXE2R0hsTTNQZm1XRXhDa0Zs?=
 =?utf-8?B?blAvMjdnb1Q3dW5pL3AwcHpWWEtSTDlHVTZwVlMwS1ZNNmxTcDN5dFJIQVY2?=
 =?utf-8?B?YzQwaXB0cjV4elVpcndrQTUxS210Y2phZkhpWFU3WmZUTHZoZG9JQ1JmNjRE?=
 =?utf-8?B?R1dVMWNDSzJ6Q2s3WlYxdStHbGx1UkFmU0dIeDlpUGxtSEV0bGYvUktuT2Np?=
 =?utf-8?B?eHRnbHlPUGNJcmxXTTJhS2dnSm5iVmJIM3UxWTZMcWlmRXM4aEh0OXMyVGx3?=
 =?utf-8?B?QUNXRG5Mc25aZk8yNmNVSzB4d3ZWSVJYNlM4Zy9HVGUzOGpScEsrbnBhNDdp?=
 =?utf-8?B?aWRHQWlxaXZVRyt1WThmNEZiTmoyS1V3WWFOU1VwZ29BZDVkSVgyN2YxZE5O?=
 =?utf-8?B?R2dkUENLemNrK3F1NEJFUFdLOHVUckxnNlFtazNNY2k1YVZlcVAybm11K2ly?=
 =?utf-8?B?WGdSL1hTVk41d2Nkb1k2TTJxejRlMFNFaTFsKyt5UjNUeFlXNjdaSzZWcGZC?=
 =?utf-8?B?M3JWYTdVb2tQbjl6cS9OWFd1djZ1d0lrYWJGcUlEVndLWklnemw2WnQ2N2ZR?=
 =?utf-8?B?OEFJd00yNEF1RGllYXUrQWIyOUcxOE9jSldGUHF3dkFXUndhNlBZMm5Ub2Np?=
 =?utf-8?Q?q/BdWJ0Ly5+UK/+37ioJFagOR+uQcPCaqSd9vnk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ff0631-fa5e-4aca-44b1-08d9770589be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 22:26:32.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AnXMD2QiB337G4w87gc/pGclKBz30z3ucBD0roD8m00/TOZFgc3w/wjIqa1gIJ1DBxdgfF7iJPSY3LlIbXwY3RQse5HLq0C7Tz3P4Pv0Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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

On 9/9/2021 17:41, Matthew Brost wrote:
> On Thu, Sep 09, 2021 at 03:46:43PM -0700, John Harrison wrote:
>> On 8/20/2021 15:44, Matthew Brost wrote:
>>> Taking a PM reference to prevent intel_gt_wait_for_idle from short
>>> circuiting while a scheduling of user context could be enabled.
>> As with earlier PM patch, needs more explanation of what the problem is and
>> why it is only now a problem.
>>
>>
> Same explaination, will add here.
>
>>> v2:
>>>    (Daniel Vetter)
>>>     - Add might_lock annotations to pin / unpin function
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
>>>    drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 15 ++++++++
>>>    drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
>>>    drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
>>>    5 files changed, 73 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>> index c8595da64ad8..508cfe5770c0 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>> @@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>>>    	if (err)
>>>    		goto err_post_unpin;
>>> +	intel_engine_pm_might_get(ce->engine);
>>> +
>>>    	if (unlikely(intel_context_is_closed(ce))) {
>>>    		err = -ENOENT;
>>>    		goto err_unlock;
>>> @@ -313,6 +315,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
>>>    		return;
>>>    	CE_TRACE(ce, "unpin\n");
>>> +	intel_engine_pm_might_put(ce->engine);
>>>    	ce->ops->unpin(ce);
>>>    	ce->ops->post_unpin(ce);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> index 17a5028ea177..3fe2ae1bcc26 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> @@ -9,6 +9,7 @@
>>>    #include "i915_request.h"
>>>    #include "intel_engine_types.h"
>>>    #include "intel_wakeref.h"
>>> +#include "intel_gt_pm.h"
>>>    static inline bool
>>>    intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
>>> @@ -31,6 +32,13 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
>>>    	return intel_wakeref_get_if_active(&engine->wakeref);
>>>    }
>>> +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
>>> +{
>>> +	if (!intel_engine_is_virtual(engine))
>>> +		intel_wakeref_might_get(&engine->wakeref);
>> Why doesn't this need to iterate through the physical engines of the virtual
>> engine?
>>
> Yea, technically it should. This is just an annotation though to check
> if we do something horribly wrong in our code. If we use any physical
> engine in our stack this annotation should pop and we can fix it. I just
> don't see what making this 100% correct for virtual engines buys us. If
> you want I can fix this but thinking the more complex we make this
> annotation the less likely it just gets compiled out with lockdep off
> which is what we are aiming for.
But if the annotation is missing a fundamental lock then it is surely 
not actually going to do any good? Not sure if you need to iterate over 
all child engines + parent but it seems like you should be calling 
might_lock() on at least one engine's mutex to feed the lockdep annotation.

John.

> Matt
>
>> John.
>>
>>> +	intel_gt_pm_might_get(engine->gt);
>>> +}
>>> +
>>>    static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
>>>    {
>>>    	intel_wakeref_put(&engine->wakeref);
>>> @@ -52,6 +60,13 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
>>>    	intel_wakeref_unlock_wait(&engine->wakeref);
>>>    }
>>> +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
>>> +{
>>> +	if (!intel_engine_is_virtual(engine))
>>> +		intel_wakeref_might_put(&engine->wakeref);
>>> +	intel_gt_pm_might_put(engine->gt);
>>> +}
>>> +
>>>    static inline struct i915_request *
>>>    intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>>>    {
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> index a17bf0d4592b..3c173033ce23 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> @@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
>>>    	return intel_wakeref_get_if_active(&gt->wakeref);
>>>    }
>>> +static inline void intel_gt_pm_might_get(struct intel_gt *gt)
>>> +{
>>> +	intel_wakeref_might_get(&gt->wakeref);
>>> +}
>>> +
>>>    static inline void intel_gt_pm_put(struct intel_gt *gt)
>>>    {
>>>    	intel_wakeref_put(&gt->wakeref);
>>> @@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>>>    	intel_wakeref_put_async(&gt->wakeref);
>>>    }
>>> +static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>>> +{
>>> +	intel_wakeref_might_put(&gt->wakeref);
>>> +}
>>> +
>>>    #define with_intel_gt_pm(gt, tmp) \
>>>    	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>>>    	     intel_gt_pm_put(gt), tmp = 0)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index dbf919801de2..e0eed70f9b92 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1550,7 +1550,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
>>>    static int guc_context_pin(struct intel_context *ce, void *vaddr)
>>>    {
>>> -	return __guc_context_pin(ce, ce->engine, vaddr);
>>> +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
>>> +
>>> +	if (likely(!ret && !intel_context_is_barrier(ce)))
>>> +		intel_engine_pm_get(ce->engine);
>>> +
>>> +	return ret;
>>>    }
>>>    static void guc_context_unpin(struct intel_context *ce)
>>> @@ -1559,6 +1564,9 @@ static void guc_context_unpin(struct intel_context *ce)
>>>    	unpin_guc_id(guc, ce);
>>>    	lrc_unpin(ce);
>>> +
>>> +	if (likely(!intel_context_is_barrier(ce)))
>>> +		intel_engine_pm_put_async(ce->engine);
>>>    }
>>>    static void guc_context_post_unpin(struct intel_context *ce)
>>> @@ -2328,8 +2336,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
>>>    static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
>>>    {
>>>    	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
>>> +	int ret = __guc_context_pin(ce, engine, vaddr);
>>> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
>>> +
>>> +	if (likely(!ret))
>>> +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
>>> +			intel_engine_pm_get(engine);
>>> -	return __guc_context_pin(ce, engine, vaddr);
>>> +	return ret;
>>> +}
>>> +
>>> +static void guc_virtual_context_unpin(struct intel_context *ce)
>>> +{
>>> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
>>> +	struct intel_engine_cs *engine;
>>> +	struct intel_guc *guc = ce_to_guc(ce);
>>> +
>>> +	GEM_BUG_ON(context_enabled(ce));
>>> +	GEM_BUG_ON(intel_context_is_barrier(ce));
>>> +
>>> +	unpin_guc_id(guc, ce);
>>> +	lrc_unpin(ce);
>>> +
>>> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
>>> +		intel_engine_pm_put_async(engine);
>>>    }
>>>    static void guc_virtual_context_enter(struct intel_context *ce)
>>> @@ -2366,7 +2396,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>>>    	.pre_pin = guc_virtual_context_pre_pin,
>>>    	.pin = guc_virtual_context_pin,
>>> -	.unpin = guc_context_unpin,
>>> +	.unpin = guc_virtual_context_unpin,
>>>    	.post_unpin = guc_context_post_unpin,
>>>    	.ban = guc_context_ban,
>>> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
>>> index ef7e6a698e8a..dd530ae028e0 100644
>>> --- a/drivers/gpu/drm/i915/intel_wakeref.h
>>> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
>>> @@ -124,6 +124,12 @@ enum {
>>>    	__INTEL_WAKEREF_PUT_LAST_BIT__
>>>    };
>>> +static inline void
>>> +intel_wakeref_might_get(struct intel_wakeref *wf)
>>> +{
>>> +	might_lock(&wf->mutex);
>>> +}
>>> +
>>>    /**
>>>     * intel_wakeref_put_flags: Release the wakeref
>>>     * @wf: the wakeref
>>> @@ -171,6 +177,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
>>>    			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
>>>    }
>>> +static inline void
>>> +intel_wakeref_might_put(struct intel_wakeref *wf)
>>> +{
>>> +	might_lock(&wf->mutex);
>>> +}
>>> +
>>>    /**
>>>     * intel_wakeref_lock: Lock the wakeref (mutex)
>>>     * @wf: the wakeref

