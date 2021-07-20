Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68B3CF0D3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9989956;
	Tue, 20 Jul 2021 00:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16189919;
 Tue, 20 Jul 2021 00:34:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="209250589"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="209250589"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 17:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="660969009"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2021 17:34:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 17:34:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 17:34:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 17:34:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 17:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT7OsIexO5Cgywl9/VKxzZFaRYlTl3OekYNWkH6q38uBW1kGasFDkrKpv00tVCkBnJ7K9lofjT1yU0b7t9uWfxn7y1kO70665fbaAKHAIA3IUnLTyV1n98eGiSaCmESUYlor2y17UMae6sNHyOL4Q5aq7ZT6NMjnJ9GZJxWXcvXrqmi51dqAKS3n6dRq7HQSCQo0y4qs3p3fHd8EGS9UV2tQQpO8abvXNpvSbuQMRi6IZvjqAAeZMmhLweiNQegDe10SLXMDw7PqL2Unj8J9QweSk/Si6edryp8kP+Diu9lolcWKFPHORWKvderGEdTi2Tz0T2OyFU08RikEk/T9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfGu/ddpsVAmU+kHQxE2S1qBDp5rPkvumRr3uflwxRk=;
 b=cfdqYlg7W3Fu8NR/vfP1WV1u2QpKmTBokyfyLoR1KbjHUlSx+CAyZPB9hInBsLOJEUoXu4X9a75AafYzrrRZy71PUH5PDEiTjmlBttonv56gNCF9k+TFx6SamWnwo1m6k6unEStgAlIb69jyaVdJ+jxE2Wn8XQlAZE4hGScHdgFMn2WfAChzEB61yR9nEWpIocpo9OiD/uKc/g3fVPYgFqEmAKJu7Jq7xuS1ggaVC+1lAVYG/bDxDiOj/R7h+GXGI0/HgUnYyDcx9hluNZDkUkJs4QmUMpEQm39kYjB7GDDV/QbKOfhUPN8waSGINMJ9ga3Pi1cXuQ/kiOolusFezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfGu/ddpsVAmU+kHQxE2S1qBDp5rPkvumRr3uflwxRk=;
 b=SF/NiF7O0qkEzP19dHWeYBbBULnt97VRPlXifi4MC3LGOYBA8tJy8iFkRR6MHdvUU5Yai1DeCx2BlB0SIyX5G1xhV3Bfn2TUAvs4M2fyiIGApbl/9jUg3DFJIA3uTSjtO09WCpiYNzSjRvHCfH0MGcDcRxqgXlivdzz1o2ncqyw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 00:34:02 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 00:34:02 +0000
Subject: Re: [PATCH 13/51] drm/i915/guc: Disable semaphores when using GuC
 scheduling
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-14-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <d82cc976-e1aa-73de-8df8-15d2cbe03220@intel.com>
Date: Mon, 19 Jul 2021 17:33:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR15CA0028.namprd15.prod.outlook.com
 (2603:10b6:300:ad::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR15CA0028.namprd15.prod.outlook.com (2603:10b6:300:ad::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:34:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05785540-c39d-4750-2b46-08d94b161297
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5577A1CAEC43DCF4953FFD7DBDE29@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyNBkfi0Uf7FNnQgo2gk1G60INOYsiyum4IkATsFsn/AOd2uoArA0r2lWfoWzJGEOMbrlCoSABZMuCOMx+QehWrv0wknxMwTneTgFuYpF8NxB0WiHQNGGOFhY0Q6vkcRktjrXuG73w5UtTtCv1JfKm3Dz2ItJ0P4+mCKHi67ZGTcyL1SnnwpeEjIJnRjndGn69XVW0PfrLNigV509PB6okYbsTHYZDK3oGNHcjQXg3/D5qcQIyYxbcMsbWYkKiMFHVTwwPaLjX4l97BVTHQmE2iuYLiRWPa3CokmkoaJTylULzcuQfuDqCFZ4/aoV+Dyhrif1GdpGZxVqcBFwpw/h8BVT5uuD5MDqXJHrW9KWlJ5J135RMTfT1oRZunkITQ24vD4HmXYrhsmQaRrfK2XcP0c1zKxn6xn024vKxgqN8imnTEfX8/eN7EErq7TeeLFGRoyKJz1e2ZEFcB9zQdcu26OJKKeKB/tFztm1/RCvbiyMqE9nOGZy2nRAgSpGOyfT+lG+JULArUVoaU6B3KPgXepkiTwhJDOPY0039Yw6HRkYutKDbXjCGEF5rC3O21jB67j6mP3OhXCDGFQ6VF0IczAtavmGAopKXKAzaAipe+Yvy/he7PJVt/BDWaSkH8m+n5d4m/QHgEyxLehSrjLJVGE/ozKuL5uib6of/nmL3PauronK3DMrBQjs5tPMRk6zuwnxY8pM8QZiX8bAPoAapp1J2UYdWncNfJtra9gCDS8TvXu0oR8CuC9nMocVnAa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(36756003)(66946007)(450100002)(26005)(83380400001)(186003)(31686004)(478600001)(107886003)(66476007)(66556008)(956004)(5660300002)(2616005)(4326008)(8936002)(86362001)(2906002)(53546011)(38100700002)(31696002)(316002)(16576012)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFh2SUFKb2pMTm9YRm5OTWFCV0QvRlZMT3Q3ZEM2Kzcxc3BqV2tEc3dLOHgz?=
 =?utf-8?B?MzVZYW5QZ0lRaHV0eFFneXFzN0Y3cXNUYzRCYVMrZ2JPZ3VSbksrV3VnbE5S?=
 =?utf-8?B?TjVmYnZSbklzNEJSMHhoNGVpNkx2ZzhkRlg3bHdld3l6MDN5QlllNnErd0Iy?=
 =?utf-8?B?SVRPMlo5OWJzaFdWV2hhN0RGOWtRRWc4V3dXZDFyK29kQ2hkSDZ6YWtxMEg1?=
 =?utf-8?B?bEdVSllEbVJQWFlGL2k2WnhFVmNlamRMaDhkY214Tk52ZzRmN0ZxdVBZbW5o?=
 =?utf-8?B?R2ZLRGNjLzY1T1hYcHd3azE0ZmJVSFJmb09nUGVMamczZmRBOFk1SGVrb2Rj?=
 =?utf-8?B?bG1aVDlwaG9qZEE4TjY3MGZydVd2YnRBMXFUSEdRTXI5RkFlclFDRWJYNkZl?=
 =?utf-8?B?cEpUcFFYdG1OcW4wVDA1VFhpY2VkMG80RFVvamxBb3FsNUlpYTlEamZ6czRZ?=
 =?utf-8?B?ZWl4Qmc0bG8zOUpXWUJiNU1QeC9FYnlFTVpaWnhxMGgrMnhjWkFNcTRPUVBh?=
 =?utf-8?B?UzlrdWRIUWNlQWJQN2NzT1hwVmFPR2Z0SXBYTnRXZHFzczFrcDB6UmpxdXZT?=
 =?utf-8?B?eG9hTHlyYnJ5ZmhYZEkwQ3JWdWpHZ0MxY0FaWFBLbkZrM0IvdGFYZ3dyUk5n?=
 =?utf-8?B?ai9VYkZqWW82OFU1aXhneGQ4cTVZaTdXekp3dkIwTGxMajhac2FRNENBQnk3?=
 =?utf-8?B?VlRWSE94c1BIWlJXZ2xmQkJCU1N3S2NRWDFDVVZNOVpDRXg5SmhDSlR1Z1NX?=
 =?utf-8?B?L3F4UUhkdzUwWlRUMlA0S016UnN4RzVWQ0xiQlkyeFVTamVqSGMrY1dDbTE3?=
 =?utf-8?B?SUhEZCtUd2VHUjEwVEVrMEVUNnQreUJxR3J6YjRMMll4QXRLQnlyNjVNZ1hh?=
 =?utf-8?B?Qms1ZXgxUXI1WURYbzNZUDY1L0tEWUs5ZTdocUswVkl2RU9nb2labmdxaFFC?=
 =?utf-8?B?MEkvTlhOQ2RNZGtwV3JXVnBSK01vWXpFMUI0TjVJbCtZV25STG16UU5DeXBK?=
 =?utf-8?B?czJQVmtyOGdQZk1WSXUxb1RFenp0b0tVbXpJMElDTmlydlF4Y1NGMVQwZHUw?=
 =?utf-8?B?VGc3Qm96YngvTzNaRUlvV1phWVVRdU5QQXBFV3hOdHpiR1ZhSGRUV1lzOXhy?=
 =?utf-8?B?RkJaOGpGbXM5N0pLRGxFVHY2L1V6ak5nSDh0Sk9zekRvWndVVm1McDNlZ1Jt?=
 =?utf-8?B?MFRkQVBuZ3ZIOWJPdU5UdklMOC9EdTNiUU1RSnhGQW9NYWZDdjVDbStEMWJi?=
 =?utf-8?B?a3IvbkVLZy9oZGRoMkYwWkJuc3ZRNnVRdW9GWHZWazF2alRnY3pYalJMak9S?=
 =?utf-8?B?ODgvNnE0QzhUOVh0MXo1TExVclF6bmV5YjhVc2k0NVNVVXg5aVRFNXpPV3VQ?=
 =?utf-8?B?SnV6QjA1TjUzS2MyU3kvMmRQOUtadDh4MG9zc2NrUUxqenBhTFQwekVSamFE?=
 =?utf-8?B?NGM2RGtUdldLTUJnK3B2a2dEZ0ZNOXdYMkdnWlp5TU5ubUlYSUMzNkJkbUh4?=
 =?utf-8?B?UFRBczEwUmZsR2JIS2tScURQZGRxaFp3UXBnQlc0SXFxTE85UWYvVk9ObXYy?=
 =?utf-8?B?VEk1VW5EWlJrU2Z2bGk5OHJaWlZ0KzlrWnNTOEZjQUlVUXFoU25OL0xYcnNx?=
 =?utf-8?B?ckdqR0VocURISmNISzNja0R1NktmY2NHUnhscE0wbnJLaVVUWkswU1VJUENy?=
 =?utf-8?B?R0RBTUxiNHVpcHFvY0VjaUwzdDlHOVZMZGdrTnFNTXREVkVTbUhBVmx5aXY4?=
 =?utf-8?Q?CW6RxNSmExnUaHyQSS1vLXUfhYglDXjJ7IQTVEG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05785540-c39d-4750-2b46-08d94b161297
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:34:02.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVZ8im7STnxMpy3yxpEEy+Rb54M39QQwE7aHjVFnuIB/apSqTmTUEWGjum3rfN2gWwkuHDi9K2HKLnIUWkECvkDawmcr3y0BXJSZCvUc8KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Semaphores are an optimization and not required for basic GuC submission
> to work properly. Disable until we have time to do the implementation to
> enable semaphores and tune them for performance. Also long direction is
> just to delete semaphores from the i915 so another reason to not enable
> these for GuC submission.
>
> This patch fixes an existing bug where I915_ENGINE_HAS_SEMAPHORES was
> not honored correctly.
Bugs plural. Otherwise:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
> v2: Reword commit message
> v3:
>   (John H)
>    - Add text to commit indicating this also fixing an existing bug
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7d6f52d8a801..64659802d4df 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -799,7 +799,8 @@ static int intel_context_set_gem(struct intel_context *ce,
>   	}
>   
>   	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> -	    intel_engine_has_timeslices(ce->engine))
> +	    intel_engine_has_timeslices(ce->engine) &&
> +	    intel_engine_has_semaphores(ce->engine))
>   		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>   
>   	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> @@ -1778,7 +1779,8 @@ static void __apply_priority(struct intel_context *ce, void *arg)
>   	if (!intel_engine_has_timeslices(ce->engine))
>   		return;
>   
> -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
> +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
> +	    intel_engine_has_semaphores(ce->engine))
>   		intel_context_set_use_semaphores(ce);
>   	else
>   		intel_context_clear_use_semaphores(ce);

