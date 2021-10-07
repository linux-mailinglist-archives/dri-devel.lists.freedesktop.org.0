Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB1424C47
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 05:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33D6E827;
	Thu,  7 Oct 2021 03:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DB66E81D;
 Thu,  7 Oct 2021 03:49:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="213288373"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="213288373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 20:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="657221691"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 06 Oct 2021 20:49:10 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:49:10 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:49:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 20:49:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 20:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoIz5M1GqwlL5EVvxBE5CZGzyjGRozMSlLy/uWBCHUZkz1+yOkVQLOKga08p/n0ragxx0cLzQlP4zrOCGdPGios9BKZOa0wNGyNn6d5wBPGMoP0bhCnU5cM/dgwaCEkwQvg2gH8sqj7s8sJxdSE+7tf04nomUKu6G638bswrTK4OlSyRpMk9G0iUaGPmqroLNHjo3VqRrNocETJoR7VduTa1mGOeMUH185nVKGvvJlV2nyqX5wdv5JslM/mTkfcPVQl97sTo5ino2MxgJgOphBjgf4DvS9QwM5RpBHGlFMMsCX5UfGdlli3pBwk7FYm7ETKOiDsSroOFK1vTMMchoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPmeEGBwg5M1tT7QslFgsEssr8nRgviSbHV+dhf+vxc=;
 b=Siov+xobXDhlusCUqUnjY4XVZ7wLS4Ri23ngDsqhBx7x4luwzN8a2Z+69Oy+63tQmTfedBsdDkft4Gv0tT4TUep5/BKpOgFLu2Gtr7NB35Xz1o8WWsBCtf4A7ODN2DhSnw/BI40ktareBRwugiRiFf9wKtaBi8qyWHYtfW7IDeGDBIjr6/6fVsNE+BhAHh9+acBfAB9wD4Tm6UebNTS/4T35bIo9SoW4yA/tRYJVs4CrHn7EjQl2mpTSZxgELjPk/18SSlfak8d8czfEGf7mdasC5xYP6X8OQ5CHXuTpufLfVM2V+54HOTIzf1PYeWc2svxAgthPJIyYY91p/ScI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPmeEGBwg5M1tT7QslFgsEssr8nRgviSbHV+dhf+vxc=;
 b=R8Oa7s5WB8Zd0M8cA8nJQvffr7Y6H0RSyXkeFpMSe4d82dAr/pO731EO+1UL/OF48auPqdBfFrEJ1eFe3EXn/F6fsIzMkNXEwAstNvrUAu4BOrz5iCcGpyMPwplDkzlG185pANQ4n9arL/janbIvIPSYk6lZuMpiHWYRn4oGH98=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 7 Oct
 2021 03:49:08 +0000
Received: from CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4]) by CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 03:49:08 +0000
Subject: Re: [PATCH 04/26] drm/i915/guc: Don't call switch_to_kernel_context
 with GuC submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a5d678f8-fddd-2b2a-f2f1-f84b4056ea8e@intel.com>
Date: Wed, 6 Oct 2021 20:49:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To CO6PR11MB5633.namprd11.prod.outlook.com
 (2603:10b6:303:13c::16)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.22 via Frontend Transport; Thu, 7 Oct 2021 03:49:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb8cbe9-4814-4e86-ac5d-08d989456a94
X-MS-TrafficTypeDiagnostic: CO6PR11MB5587:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5587D4739AA1710E698C8C99BDB19@CO6PR11MB5587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Bdw7Sgbh8prL5bFmH/jG7D+3kGHoZZ0MXqICIgOsMjLDZ36C9x5Bn4onvg/z3XAkaQUtq1uZLF7r8Q2I7V/fVPEsryUk7cwvkh4COfwj6Y1I87WXjAml2baBneb/+8WQWs5omRcf7+2PJLHxZGQNFfavMnz7EHIjPTXLprlXQ7UMN1BrvY0I7CysmOOQph8Fv9mVTSUXeb/87yruO4+yrad9/hDTGaa3x6RF0nInQNdWOB37tVxeBv4J/8B0xSw99HBvKsMq1FckB8fni8ytrZml4zlJs9dcQ6BlGXMK5fJcxjDEvWnwdyvj1dTLon/D24ZK9ImuiXl2pBejzqmUAm6h+NEOpB2RVHfnQWqXOTqrsALY6FwlKfOlfIZR075fu29wAwVjx+fXQpJ/1+4GNSgWui12j29MSI44QIr1h37tNjF8PwGwbMmfph9NLcDkfjyg1vShPOdIcQ7FQHDliz3iLNAwIkZBKpmlxw8mECYB6mw1WtUBbgfDW9Tx9oASi4D0HUmuVMjUjZY70K0manSZEmpkTuPoJRR5u8+/ovoCob7ldYNlj+tFGg/Xudo1jxLQ377ZWO2N7D4+mwKg0WUOLCh+mcCqhTI0Vj/oXgEAlj6Xmv2zsMVsklqkH3kBTtF/wK/qinr1mDHMyFQG7zOLOukGrmD8/231GnWniY07h+d+tmipxdyghTNt3Xwe+3+IBHKIbVTdbSUQ1lKXe23wwAV5yUDmkOjfCTI48Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(316002)(66946007)(16576012)(31696002)(508600001)(2906002)(4326008)(53546011)(86362001)(6666004)(83380400001)(5660300002)(8676002)(31686004)(38100700002)(107886003)(450100002)(36756003)(956004)(2616005)(186003)(26005)(66476007)(66556008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFGSmhubDl4dGZqY21FaTNQeFdjU1g0M2JHc1BvVXhpaUFJOTRsVU5KWjg1?=
 =?utf-8?B?bTJUV21sejRwN0hNM1I1aFNPY1pxc05HTWI0NXYzWkNRZHgwOW5ZMTYvSTR0?=
 =?utf-8?B?OVVOcGtDV2xJY25ydVRqY0lvK2ZPcDBRRzBDYlEyVDVTV3gwamFSQ2ZqRnZR?=
 =?utf-8?B?ZjNOZkJSQ0hQTzhYSE9MVWoyMktqMGxqYk81OWd3T3VscEJTVUpGNkVrSTZ5?=
 =?utf-8?B?emtvTzhJNFE0UDRyME1LT3NVY3VLQ2w4ZVNNK3RYRXliVGlOVExPRVBLaFc0?=
 =?utf-8?B?Ri83VWJtREhuekw5QkVwd2pDMjh4UWYyVGFoQTAvTjRocldjNGdxZERtRHFU?=
 =?utf-8?B?MXV0T1VBZi90K1J3QWhKaTNDWnZvZkYwOWlMeUVCZlgxK3pRaWNDQmlBNDJj?=
 =?utf-8?B?d2RsT1YxWTJyblBmQmtQQXREdXpVSlVoN0pLbFBjS1JnMWNXcGxZOG9KWUVB?=
 =?utf-8?B?emJHM3k5ekQ4UDJGTlNXNHFHNlYrcjhQeFpSTXVSK29xd0M3ZFplRTBPU0Fi?=
 =?utf-8?B?RjVMQzh0VTR2UmlQaFpIL1VOaTNIQzlKcjFwbGltOE9RU1M1Tkc1N3lNSisw?=
 =?utf-8?B?UmdraDZxcEZDbzlhS0RieC91YVRFV2IrQnJ0ZnRrWHYwU0RHclozdzVMVTMw?=
 =?utf-8?B?T2FuRHZrZmc2NEY4MTVRRzk3NWN6VUhsSWMwVHZ6aEllT1dBVEV2dGR6aEpQ?=
 =?utf-8?B?VWpRb2w2NFU1bmlhcXBhcHMrMUl3SlNuY2pZYWNHVU5Yd1JvMHd2ZXRtL3FK?=
 =?utf-8?B?Z1RHZjYyOGRPOFVGVzFvU2FnTXVlOGtKd1BJb1RoMzkweFUycC84TmtwWmZU?=
 =?utf-8?B?a1RXcXR0dlVXemliaWd0MDkvZVV5UmJVVjZHWFN1K0FVLzd6eHFCbTBDQVBH?=
 =?utf-8?B?aHM2eXB5bTN3SE5WQlNIME5COUwvU01UQmNSTDgydE5Yc0F1YlpBcTliUGVH?=
 =?utf-8?B?dDF2QnFIMFNsMTNabU1oa1MzREIzUHVNMGV0NHg5OXA0RjJ2YWtGODFxRWpi?=
 =?utf-8?B?T3RNUTJEbVhQdlVaSEtKeVZMb0dncUk3aXV5OERDZFh5VDk2cmxBZm81VXF1?=
 =?utf-8?B?L0FWYVVpSTBLcmdTYzBicjVqSWJpT2xLMENTU2ZNMytoVENiNHA4VmhrQ0R0?=
 =?utf-8?B?MTh2YURmd0pkcGhIcGRNZmorb3hFVk9FcEJtdmdOL0JwVmhMK1dhNnFCcFgz?=
 =?utf-8?B?Zm8wZ2MxQ01nWXc0bGd2d2p2NUNZSEU1UExrbUk0bnRpOE5Tc2ppTmQ0VWh6?=
 =?utf-8?B?U0t1UnFkOEQ0YkxTQllENUpUek1yNlB6K1BxaGUvUWxEU0ZQUVRQY3haeTFD?=
 =?utf-8?B?cXBSeFJGN1lDV04xYjZLU0o2SEdVcmhDWUYwc2ExV3praU1xaGdiWUJyNU5K?=
 =?utf-8?B?aEN6NEFpV2xUaHd3aUlGTlV5UURiekxURHRTdXNOdzJpOUxIaUNibXVJREpp?=
 =?utf-8?B?UmNnV2Y2bjM4R2RQUjA4VTBJOG94V0tDdDI3UVJGdmNmd0xlYmx5UGRZM2Q5?=
 =?utf-8?B?b1R4MVVjbnMvVkJTcjJOekdHalBabWN6RUE3M0QxdFJVREZzdDdIeGVBd2Qy?=
 =?utf-8?B?cENSV0JoWTQ5SmdyVmNYMi9GTElveWhYK2YvTmgySXNheDFEcTcxV0gyOEZR?=
 =?utf-8?B?ZDVhdlZZbVBaY2dqenBhayt5SnR6cE1pZXRWOStaeDc5dmhtTk1RQUlrUDVi?=
 =?utf-8?B?YWRsMmdNUGR4bWZSWldhNjcwOVJPSE41dUlPQ0JoMkJtQ0hReUxPZkd0RVZQ?=
 =?utf-8?Q?IKhR+bCJqLih/60XCtddGFR/KDzKjKb2ZnFyFKA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb8cbe9-4814-4e86-ac5d-08d989456a94
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 03:49:08.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1PStzWDYfKpDwxEgcdOR2V2rWkiqp2MjomkvHsK5gG1o9clJ+/XcWjuJt52xUmTd4zRjgyMpEwLL7rwfP2bPf47lWKm0KtdPBA2sJni+o0=
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Calling switch_to_kernel_context isn't needed if the engine PM reference
> is taken while all user contexts are pinned as if don't have PM ref that
> guarantees that all user contexts scheduling is disabled. By not calling
> switch_to_kernel_context we save on issuing a request to the engine.
>
> v2:
>   (Daniel Vetter)
>    - Add FIXME comment about pushing switch_to_kernel_context to backend
> v3:
>   (John Harrison)
>    - Update commit message
>    - Fix workding comment
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index dacd62773735..a1334b48dde7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -162,6 +162,19 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>   	unsigned long flags;
>   	bool result = true;
>   
> +	/*
> +	 * This is execlist specific behaviour intended to ensure the GPU is
> +	 * idle by switching to a known 'safe' context. With GuC submission, the
> +	 * same idle guarantee is achieved by other means (disabling
> +	 * scheduling). Further, switching to a 'safe' context has no effect
> +	 * with GuC submission as the scheduler can just switch back again.
> +	 *
> +	 * FIXME: Move this backend scheduler specific behaviour into the
> +	 * scheduler backend.
> +	 */
> +	if (intel_engine_uses_guc(engine))
> +		return true;
> +
>   	/* GPU is pointing to the void, as good as in the kernel context. */
>   	if (intel_gt_is_wedged(engine->gt))
>   		return true;

