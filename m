Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96848DCFD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 18:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0E10E233;
	Thu, 13 Jan 2022 17:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5010E12F;
 Thu, 13 Jan 2022 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642095366; x=1673631366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kVgkhCHcjFuaexUlRdz83MVne3sA3MoxsTYCwHkveDQ=;
 b=UxJmuubkNsjdAi2f1w9FNQTtl2KFQ4S9ezyE7nUC6JPlabvPKQFudcFc
 uxj75ik6XXQOy/wL3JWqCR/VvlhW9Cw1cWl3ibon+nUX3465SaUbg0OSy
 qLtrdUMy+jaMcJCBBdk+44tzIMT7q0b6XHQzL3APXC6EJrJURrGBSvXlH
 oUc4oGfP8n62H8vUNl2unIUAD3CvNTVst/A7bJgImhZZ+lDz6efyB6brH
 MyzjI63GPmgCxoAxXZBsnTJyXosg6zQTAJ8zj/tHuqcBmilLK0sppYhKd
 hIVY7OT7TLIW9l+x1rdbfqGpC2ukYR1S/I0M3prJ1jh9w12c9jr1i7MrR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="224052004"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="224052004"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="593413619"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2022 09:35:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 09:35:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 13 Jan 2022 09:35:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 13 Jan 2022 09:35:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk3M2i2/9fVnlWFL2nrPJunkEHO3Y6TPz36kIBBvbxJK7A3Wb88RgwSim1e30UAkZgfXqzwzLpUd3TLEMYVxLKoQI/43uOmoBwYBkGlThb0vtM8pQgHwacSy29gcXnvAW/chG+5XR9B+5W9qvz+CfFCgTZ13FGMFU1YSub3qEFRXG3RQNglq5FqC31SPfeCSdM2paFPywp1M7UrFTR6BO9xsF4LRj9cLImaxFDwUV8SjUpQ5nvXmCyYOKrrQ8vDp9VE5uEnJI6sunBelJEZV91f4XGyiIWReeUWf55R569EkYQE7qVxiWtbZJjVbOFrNMOEJkdZPXgifd27d3ZnqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FZdlJxNbEwyo528bbNgPiuNdXaBackU8wbCUpNxgWA=;
 b=hYUdLypC/WsUpkKUYrKJDg77W9Cf7xoCsFFXtybY93ouKORUzBgaQUmmskab6YXmvAGJbz8F2XNUViwSZkqhw3H+wu4XGDNJKh8ce1eDHuRnQGQXat4e20euRaOd25UWQElskptKWHUc246l4K+ffows0H/uhJCeiqVklEf5O08CEHIAD/0ftHm4KF5wgv/L4IWZjqYFVOb/6PV07IfvAlmbykzKibMiUsJiX0jqit7iScgFu1T7XMQwipgfP5OmCPZj/QBAjdgwS/qNGfGYWSU7fDhzgFGU4xgE2YujmRB0/6WxczTj3ojBB3SBkL9ysd4rTNHj5IfOzk2vkPa8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5077.namprd11.prod.outlook.com (2603:10b6:510:3b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 17:35:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:35:34 +0000
Message-ID: <2a60cead-c11f-64b3-de34-49a7abd81b29@intel.com>
Date: Thu, 13 Jan 2022 09:35:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 2/2] drm/i915/guc: Remove hacks for reset and schedule
 disable G2H being received out of order
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220111231109.23244-1-matthew.brost@intel.com>
 <20220111231109.23244-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220111231109.23244-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR2201CA0050.namprd22.prod.outlook.com
 (2603:10b6:301:16::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8d98189-b550-4132-2796-08d9d6bb1ab8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5077:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5077C09712D906AA406624E8BD539@PH0PR11MB5077.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKNNLUeMX2ujaPD9tJjJ189jdJztGv8YqVJBhdKgQBZALef1e+Dzf1M6QVyLO2n7qsYic7oyBlbMDve43NvoKq98fJyMSqmSPejLK0Bse8Z67LSdl+dFMS90ppnSNQSJZ0GYnxVr3Gq5SR841rDs9WAwX2iXgmOCSDcp7pB6McaBD/rIezBGrzkzCmi7Dm+FcyZZfWVYY/SD73Gxlgjyk2zFZ4nsP7zTOnybyNy9FxIGGahQEibRHv/XrJSTcuAh+suxqS7zaIK4kOgv1cVtpmNx/jqOPWTZPMIZBBVpaJ4NKtStMf+6r9l35noJIUV7zY3T+GrEVzotVw1FUXKPg9MehJvb9a+dsAjOT6punhg0CkbubyZDtVkVh7r3AX60INhOUTk3RVp44Cd15nwShGtufu+bMw4C6t+5hIpFIB8joaSWxNMj5+9TF67/jmITkRxrlBskLTAePPU+y8cyZM/Ucqr9keiD2XwUCeZJu4nF7asqBXIFL+Q4yDNkcYaCDIMmvs2IcUFuQ0wl7Bep9HmjD/kpWvk/PhT+FJ5AmBfB+C1zV1uv4CB6ghOH9TuGHB4eqVwZFa8tM93+x0/El8DHu5LZzZxG803CSZ6sBgTxoD3reDQsgQShaTvQBc+KU7Dh1CYY5SjR7NdpzPHMTQqdKRCVlXPi1ee8PvL5NFYERkaaL6sNA4LIxoYMsicB5QgUoyfTr/fiuHVk8kuX3VXpgB+45CMDlooxLobxxLMB8C/st4gZCkOvhFuFZ5HNelgRhNAnXHKALGtp8X55Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(31686004)(508600001)(107886003)(31696002)(4326008)(6512007)(450100002)(66946007)(66476007)(66556008)(36756003)(2616005)(6666004)(6486002)(186003)(26005)(83380400001)(2906002)(38100700002)(8936002)(8676002)(82960400001)(86362001)(6506007)(53546011)(316002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhudklZTnNxT2xHMUxUZVF0SEl6cHg1T0Z4V3R6KzhSaGRodmFiSHQ5ZElW?=
 =?utf-8?B?eFFQanoyN1dJTmgrakl6bVNjeE00ZC9WaTVQQ01heGxiWk5INmhlbnMwd2V1?=
 =?utf-8?B?WTN0UFhObHFiUDNpRzIycUtEeG4vVUpGZHJPQTBHQ2pJVnNDS2pNRkVOVEd4?=
 =?utf-8?B?VjVjdjdHQTFCU0x1K1BEay84V2RkektoVlJtVEp2SHdMTEdkdFA1SG9IK1ds?=
 =?utf-8?B?U0FPSkZrUXRMRXpDSnh6MFBhd0lsQUE1WUoxZG8wUHVlVnJBa2x0Y2x5a0Fa?=
 =?utf-8?B?c2xTOE1TVUthZ2hyRVZTYjNFQWRhK2U1YlY2WC9GRnU2cGhXbUVXQk0zd2ph?=
 =?utf-8?B?cmJtTk1aUklvRkI5UVBUSnZxNUdmKytJM0hSejAxL1QrM2crVDdDNE51VEVN?=
 =?utf-8?B?MUN2NEV2OVQzU1lTUzhwSS9kYTdqdUN1UTE2NjIwamd5UkdMRHpyY2hPdlk1?=
 =?utf-8?B?STUyclBlNVo5RVN2NFF4NzlRNi9RSjdRd1Y1eEhNTWV5T2ZqaVhOUVUxNUQ4?=
 =?utf-8?B?V1NOcFBIQ29EZnBHdWx2VzVESTBCcUlJcHlVWGYxeFIrVXZiVkNYb1A5Qi95?=
 =?utf-8?B?TUdaNllzejJxM3dLU1YrUHhqMWNzTGlabGJqMldDdkMvMUgwNENwS25YNFN5?=
 =?utf-8?B?WmNyVnVpOEZWMW05b0hmVTdvaGsvZEhab3lZWlJXZ2MvUzJETU1UaVdkQXpR?=
 =?utf-8?B?Qms1ZHFncWl3aXVjOXRHTEZWRDFnUGxOYmZQVzRPN2wxSXAvTlduQjh2MUVa?=
 =?utf-8?B?Y1VwTkFGZjA3cXNoaHQ4UUhsQXo4OUx1TTNSOVZMdkNJbWRXUmZPU1UvWE9p?=
 =?utf-8?B?a0g2NU5hYUtiS2RLRGlhYmNDQmkvd1lUWGE4RkJ0OVJFSlRvZFJnT0VOZG1W?=
 =?utf-8?B?ZlVtRlNSSlpxYmRSbEZJUFVIWGk4WG5RYkc0UVFQT1RiZ2dNbGg0UGxKRWUv?=
 =?utf-8?B?MCtNeDl3SmNzN1Z3MWc5cFErckNvbFBzejhkYVNCbmtpMUlpNXR0MENSMGxL?=
 =?utf-8?B?d2RCZCt2bldhNnJEWFhwRENXOURaREl2MzlPVHRwYWRmWllOd1psbCtWa2pp?=
 =?utf-8?B?MzN3bVo0VmFWOXQwODNlSFRRUEtueCt6SkhXUytKQ0hWT01iRnRTeWx1TVZz?=
 =?utf-8?B?bjI0blJuMVpxRS8yYjlpL213Z1NTK3lKUkNDcDMreFhkUzlPY2RGR1FzMzM2?=
 =?utf-8?B?SXlWNUVPQVpoUzNKQ1Z6bW53c2NRQmszVmRsVkNsdDJUUlhhTVNXdXhMeU9K?=
 =?utf-8?B?KzF2SURRV0wxWnRlRG40OE4yUzdIeVVHdFdHNkN5VVBDVEtwMC85TTJaOEdX?=
 =?utf-8?B?WGJjZHo5R0xlT0MrQ1JGcjVJaWVPTDV1M0NpOXY0QWx2SU1jNyt4QnRER3Av?=
 =?utf-8?B?UVRtVDFqQ1AwZXBSMjhnUTk3YkR3eWFUdWlJdHdrTzNKN0dlRU0yVkNtVzZZ?=
 =?utf-8?B?d1JQMksxeTZFdHdEWlRVeUtRNTJkL1YxTkVjMFV6ZGQxcXJIR1MvRlF5WEhF?=
 =?utf-8?B?Qnd4VUZWb0xnUXk3RUs3S0VLZWdqM2xlUThnUWFGMHRBSGdsa2hhVyt4UUQ2?=
 =?utf-8?B?ZkdqUVlXdkNJMFFEWnZsSi9samE0WVJLYjJ6RmMxckxEc1hSZjEwZ0J1Vmd6?=
 =?utf-8?B?Sk8zbCtXbGdrREw1bndDaFNCYSs2WVE1V2MvdjArUjM3ZE1PK1Vuajk1b0Nw?=
 =?utf-8?B?M0ZMbUp3SkR2Wis2NktieWFMU1lGaFEyVVhmWno3RVF5bDdCMzdvdEdkSitW?=
 =?utf-8?B?VjR4SlI5SW9lT2tmYkV6eFg0Uzg1UUJkUW53QXY4MWIvMVdIZWNBNXRjTngx?=
 =?utf-8?B?NVZhQWlYMGdWSXRxRC9odkVNZEVxMVRDYjVjaWVYeEZRWmIwUk82UXI3ZWJm?=
 =?utf-8?B?d01hUnFpVDkzNjFUdnczZE5qMU5WdzVDQ3dia0V1bG1HYVVVaXlTQmd4ZTlJ?=
 =?utf-8?B?M3dvRU5JNDl0YU0wUXByekpKeGtranhoK3FMckoyUFFXMWtiYnhjU3V0TFZ3?=
 =?utf-8?B?bW5jUWtjVWpoTTFmeEtrWnVJaHBFajRzSE1qOS9jYlFhaWJJUWhpNHpwOElk?=
 =?utf-8?B?cDRzYnhla0NRb29EdzNkRXdMNUwyYk5FOENQb1ozSnlDeFUzQkY1cE1wZm10?=
 =?utf-8?B?aGpRRlV5TzlUSnN2bC91em4zcHc2UVJ4WmtxSHZibHFNZzUxb0FYTW02M2dD?=
 =?utf-8?B?TzNSS2tjN2Nza3g3MzVreGcrUnNWc2xCUVZZOFFtY3RndnRLaVRhRklrSHVV?=
 =?utf-8?Q?eqEYIUAJNxf9TiyB0S95pw6HxVTnBmkLXJ/xd24F8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d98189-b550-4132-2796-08d9d6bb1ab8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 17:35:34.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0UpJAZwkPE/TPXdIqVCvIpmUcXDQTV4Mn+nH5/v0IZaswH7MLpGsuy473X/yy5qwUs0vvWrqclZ0sEW2FQkjBeZODNvlfkL2b3ictcMIJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5077
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

On 1/11/2022 15:11, Matthew Brost wrote:
> In the i915 there are several hacks in place to make request cancelation
> work with an old version of the GuC which delivered the G2H indicating
> schedule disable is done before G2H indicating a context reset. Version
> 69 fixes this, so we can remove these hacks.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 30 ++-----------------
>   1 file changed, 2 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 23a40f10d376d..3918f1be114fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1533,7 +1533,6 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	unsigned long flags;
>   	u32 head;
>   	int i, number_children = ce->parallel.number_children;
> -	bool skip = false;
>   	struct intel_context *parent = ce;
>   
>   	GEM_BUG_ON(intel_context_is_child(ce));
> @@ -1544,23 +1543,10 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	 * GuC will implicitly mark the context as non-schedulable when it sends
>   	 * the reset notification. Make sure our state reflects this change. The
>   	 * context will be marked enabled on resubmission.
> -	 *
> -	 * XXX: If the context is reset as a result of the request cancellation
> -	 * this G2H is received after the schedule disable complete G2H which is
> -	 * wrong as this creates a race between the request cancellation code
> -	 * re-submitting the context and this G2H handler. This is a bug in the
> -	 * GuC but can be worked around in the meantime but converting this to a
> -	 * NOP if a pending enable is in flight as this indicates that a request
> -	 * cancellation has occurred.
>   	 */
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	if (likely(!context_pending_enable(ce)))
> -		clr_context_enabled(ce);
> -	else
> -		skip = true;
> +	clr_context_enabled(ce);
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -	if (unlikely(skip))
> -		goto out_put;
>   
>   	/*
>   	 * For each context in the relationship find the hanging request
> @@ -1592,7 +1578,6 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	}
>   
>   	__unwind_incomplete_requests(parent);
> -out_put:
>   	intel_context_put(parent);
>   }
>   
> @@ -2531,12 +2516,6 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   					true);
>   		}
>   
> -		/*
> -		 * XXX: Racey if context is reset, see comment in
> -		 * __guc_reset_context().
> -		 */
> -		flush_work(&ce_to_guc(ce)->ct.requests.worker);
> -
>   		guc_context_unblock(block_context);
>   		intel_context_put(ce);
>   	}
> @@ -3971,12 +3950,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   {
>   	trace_intel_context_reset(ce);
>   
> -	/*
> -	 * XXX: Racey if request cancellation has occurred, see comment in
> -	 * __guc_reset_context().
> -	 */
> -	if (likely(!intel_context_is_banned(ce) &&
> -		   !context_blocked(ce))) {
> +	if (likely(!intel_context_is_banned(ce))) {
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {

