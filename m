Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445963FCD29
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 21:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D989913;
	Tue, 31 Aug 2021 19:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD81C89913;
 Tue, 31 Aug 2021 19:09:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="198787087"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="198787087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 12:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="687844450"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2021 12:09:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 31 Aug 2021 12:09:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 12:09:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 31 Aug 2021 12:09:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 12:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDtZxjJOdyVSd6XlMsoRDpvjjst8KDyf2DOFa+No2R0DsCSjYoyU7G/Ga+x/bW9dkTeDRrVGOFzFwmhliVIybGLZuD797hTbUS4DHSNWLwj9wCVu3lhuMv6eJSy7j0IQ1rMqGfZbf/vnpz8TI+1cvykSOzis2yFyY3D7apI9qdG7/XFSpq0Cq7+SYhfgRvAmWernBuVetorOknIMfFQbxLXxxit4mdJK74JZbOftyZNL6GTDc+ySIa34z8QL2EldN7i/g07bgQrfmdgl8LK6dk+Ask137dkugrqBHYcOb1fve3uEmxVj7YtQxwdw12gRsWiAmQakiHkARhq/L5LYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j4KDvL6cgTI/Db7/GFrRwRnCSs+wJPXgo/REPdVn30=;
 b=B78UiwOQBZnFKZ8JVzhekSUnMZHXZ3sr6mCuMI3ol/Pg2xua3k5uPXs+ZB1PyKC9yHnrZPoJ16kbOoL4gXAXL5/Ci50Se4VjzdR15CSPxta4GShpwCWREH48/o8xbmKe/sAV/kFJSKcm2205rSBpb6ihKvowRXXEVXRV9PD3KjSuhj4bUlB9r6wN6z46Y7jmycw7QUX5bu49sZQysgVWh0RLhcgf3RNToAuWmI10WCuBtnxE3+AABgwraHgRgWxNvB7kc/mdJafnsRD5YRW1AC5TKxOCyZRg3huTpaP0PcseB95o+RwyBQGgkTFR1QxJAG+RoalwL+9OL9hVEgaAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j4KDvL6cgTI/Db7/GFrRwRnCSs+wJPXgo/REPdVn30=;
 b=b2fJHNwnH/ANgx+9S/1/vJuDo7D+ybByywHpnZesUEakTun2mULm+OWozR3O14ZrVhPMyT7L/725ygP6awVsGbYVJj0Ofs7rEny1sjbYiy9HWJ6lncV7sRe/yvWDzzzbP3mdq3np7N7uY5Z56Bsldg1/pC7LpO0zO465smRERYY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5659.namprd11.prod.outlook.com (2603:10b6:510:ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 19:09:33 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 19:09:33 +0000
Subject: Re: [Intel-gfx] [PATCH 27/27] drm/i915/guc: Drop static inline
 functions intel_guc_submission.c
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-28-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f2152efb-f384-e391-1f45-608aad29b849@intel.com>
Date: Tue, 31 Aug 2021 12:09:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-28-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0020.namprd14.prod.outlook.com
 (2603:10b6:300:ae::30) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR14CA0020.namprd14.prod.outlook.com (2603:10b6:300:ae::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Tue, 31 Aug 2021 19:09:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 685672e9-09db-4c77-792c-08d96cb2ddee
X-MS-TrafficTypeDiagnostic: PH0PR11MB5659:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5659EB0339E2A128F5601B28BDCC9@PH0PR11MB5659.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wMwdp7wKiu+58zWmuPlVI66pxGJUFkIHxpXHlmn7yfGcQfog/Al7pqhqFJcngPJSuhPH4IhyG8RfRzVba5uxH8jJdnRHDBwgjT2pYdPfLIeG6kEx5uSyzylkuwPJdHf2/JRvz6jE1OcgasF/A+XKERjMkF54Ab2j2XJAjzbsDeA58ESoMHKaawi5if2ETzesGk7VIei/ulcxF/GRgXsxxcFq2tzExZ/CFgmrnCbmsFKGZI6PQ4dXUvpSlJtUwmitkEgB2S6fbQqjyJ9OljCaC3vO+NM3RmbKCb1PrVgbekS17FVMnkkGyH64NG1hPxcqfljnof3Q3r717+JoiIPBcdLl3WMdDDVbUzitwWm2/oU+VacxLqUKAI/1GaqsxN4YM0BapZaHBiXsarzPJowEzWehp8+z928O5OXFO4Kr9lBQeHJuW+gVY2XTkGOx6cw0zfVGBmOxbstTHpPwV3FvCxcFsJLMehUD/91XEpPnmRorp2FFrIxGii5DjV9XnpX+EP3rspHamFd23dIVkr0hyTaUT+ljBm+F6FGdPy8CgNlwY7YgzRLiC8KzcWFrAyd5B2jBwzWpbHgseExPkP/hWO08JR/qn163ZvJ76xBafTuHlaeUHotQTxeaO/9yENo6AcFOxyqwYAxswzn36niZfOHWGsv8d1rAdF1AeMmpJzQgsX0770TqyoaSemMQ6YfFYvixkfRhKqT/Grqehkbl3UDbgf/ueOLuzmVnYqj7T5cCF/aCx/QjkNlpiGOgiy9KyiqUwNQM8DABEgdp7Ab3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(2616005)(86362001)(16576012)(53546011)(66476007)(316002)(956004)(186003)(31696002)(36756003)(6486002)(83380400001)(26005)(5660300002)(4326008)(450100002)(2906002)(66946007)(8676002)(508600001)(38100700002)(30864003)(107886003)(8936002)(31686004)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ujl3dlJLT3BFVHRDYmU0ajFsUmdVTmdSNmEzeWt2MTIzREliU1lRMFp2a1dJ?=
 =?utf-8?B?bnpObWpUcHIzanNYYVdzSU80REdobGZLYWtJZEdPUVdkQXJZNm81bVdiZDBi?=
 =?utf-8?B?K3Q5T3BSVkdRcHFZbWlLQWkvQVJoTVJyM0hOSlBsNnpTV210RHVHMHlFSUIy?=
 =?utf-8?B?aEZERzI3cWhvdHBvakpZcDlnbTB1eFVZVGNOYjJIMU55NWVZVTNFcEZZeTBl?=
 =?utf-8?B?NGQrckc2VTdYcmxMTDlSMWhrZGF3UGFqam90Y2VrMDdIOFV1aTZKK1NORklL?=
 =?utf-8?B?Sk01L244cm5EN0lyTjcydTNEQjR2SzNlOEF6MTFtVUIyQnl4MFMwTG5XZVBF?=
 =?utf-8?B?L2JmbXY3WFc3K29LOWdxZXNnYXhiMHo4dnpvdDdmaXpORElWVzJtczRkZGV2?=
 =?utf-8?B?RHNleWR6UFNwdjZyalovMzJCYU1KVlRNTllrSFpWbjlhbTlWbUhTR1BUZ1BE?=
 =?utf-8?B?dlgwdDBUTTJpaFZHc3lrQjhzUEE0Ym91My9JM3BtLyttdWZKWktxczBKNWhL?=
 =?utf-8?B?SExkMVQwNDV0THdIdWtON1pwTkUreXpzb3o4bFcvVEFuUHhhOUF0dmdueUF6?=
 =?utf-8?B?dE5SSUoxbjdUY2NIQ1IxVTRhK3ZyanhyYXUrSjhrbTJEMXNWb2E5di9yU3dZ?=
 =?utf-8?B?VHM5RWExRi9mcEpYMG5LeGkwdTZoUkdGMXg3UlpJWlNKU1laZHc1aEhpRmw1?=
 =?utf-8?B?UE9oL2RFZ3d3cGNidml2T1crWWdudEVUajdnNUtCL1pCVWMyckhGckpWR0Ft?=
 =?utf-8?B?dU9UbWlKWWNlT2JOajhVNWl4b0JPaTEvQkMvOUdCY09hOHl2OVFIRW1UdnBU?=
 =?utf-8?B?aEtrTUVDM0xXL0FSRjllemxINmJVdUxJanNJUVdrVy9rRituN1hERGtHSko5?=
 =?utf-8?B?T0NhMUd2RUlpdWFGanFUc0Q5cDJlMTdrQXRodHJTdU5YTDkxMnQxdEZhQitY?=
 =?utf-8?B?ZU5zbHAzOUJhcnF4eXhUODByclEwYU5za0E3d3U1L3lKTHpEd09USDVUR3Bs?=
 =?utf-8?B?UStoci91M2pObmNkSnorQWp5WmNYUzd5eUNRR3pHck1pQ29ySlA2ZExURm9x?=
 =?utf-8?B?ZmFSYzE4WVd4UnZaeEwzbXl1T0VNd2ZEUjBFOThTS2YxdVoyS0JYS29PU2ZC?=
 =?utf-8?B?cjdlb2VGRUVSUHBPTXlTdXVuRDZBdjFWR0pJYVRQSzlZa251ZXJhbXVibXFW?=
 =?utf-8?B?OWdQbyszcEgrQUNpZllhODhLZzZVcFZLQ1BQQkdMZFpaZVpFbjRjZGRRYkFH?=
 =?utf-8?B?UU5hWmRnZVJRL1dWbVB5ZnhzRXJiSGtjbmRaNkk4V25xMzVLVVVMV0R3MGpu?=
 =?utf-8?B?czh1Q3V4bVFHbW5ZU2pwQ29md0x2YkY1aVVjR3doL05CaGtzdnpvNEFPQTVR?=
 =?utf-8?B?NU9GQzU3dHFHNGV3cGUxVVFhVW02YTE5NzNZWklRYmZJQTRTM2VwUjgzV1RN?=
 =?utf-8?B?MXg4Q1QxNzNYdTNJL1RBenQzd0pZcmMySFZIWFZKU0tlTnhGa0VXNkQvYkda?=
 =?utf-8?B?U2pJMG9GWVo1VUJ6TGtXeml1bVc5VDZUeXNBbFZ0d2Y0aXV3d0ZCTWFUZ1Iv?=
 =?utf-8?B?WTA0a0hqcStvcDlHWTloOU80WFF5aUxLRkRhQUpRTnhCSnZSR2dzUy9WalZF?=
 =?utf-8?B?RzdLUG5oTTlkSEFZNmpGTFBGMjNXdUNUd2d2bTVRZnlBcHc1R0Q2b1UvOVNh?=
 =?utf-8?B?MURoZ2pBejhsOUx2Zjg1ZEYrRmE3LytXMVp4R3ZrRUxFL0lOTmhWSURONW02?=
 =?utf-8?Q?OBH+YJfTyx6dK75Oe/KGlu+QqWbTxbSEIPI7JdB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 685672e9-09db-4c77-792c-08d96cb2ddee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 19:09:33.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+ew8oe/b+Jnuh8Bu9fSdsXMSkRjsiRf6xD3MF39Dj+ewfldrI3jl1OjCD1Ei+C9gJ0DlBhZHykd5q1S0FqibzSt7bzFW0P0aAoJbg/ocIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5659
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

Subject should be 'drop .. functions *from* intel...'.


On 8/25/2021 20:23, Matthew Brost wrote:
> s/static inline/static/g + fix function argument alignment to make
> checkpatch happy.
Why?

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 116 +++++++++---------
>   1 file changed, 57 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3fe45eca95ff..f921763eb7a4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -144,7 +144,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>   #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
>   #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>   
> -static inline void init_sched_state(struct intel_context *ce)
> +static void init_sched_state(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
> @@ -161,14 +161,14 @@ static bool sched_state_is_init(struct intel_context *ce)
>   		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>   }
>   
> -static inline bool
> +static bool
>   context_wait_for_deregister_to_register(struct intel_context *ce)
Could probably un-linewrap most of these split declarations and still 
stay under the line length limit.


>   {
>   	return ce->guc_state.sched_state &
>   		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
>   }
>   
> -static inline void
> +static void
>   set_context_wait_for_deregister_to_register(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
> @@ -176,7 +176,7 @@ set_context_wait_for_deregister_to_register(struct intel_context *ce)
>   		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
>   }
>   
> -static inline void
> +static void
>   clr_context_wait_for_deregister_to_register(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
> @@ -184,111 +184,111 @@ clr_context_wait_for_deregister_to_register(struct intel_context *ce)
>   		~SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
>   }
>   
> -static inline bool
> +static bool
>   context_destroyed(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_DESTROYED;
>   }
>   
> -static inline void
> +static void
>   set_context_destroyed(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
>   }
>   
> -static inline bool context_pending_disable(struct intel_context *ce)
> +static bool context_pending_disable(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
>   }
>   
> -static inline void set_context_pending_disable(struct intel_context *ce)
> +static void set_context_pending_disable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_PENDING_DISABLE;
>   }
>   
> -static inline void clr_context_pending_disable(struct intel_context *ce)
> +static void clr_context_pending_disable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
>   }
>   
> -static inline bool context_banned(struct intel_context *ce)
> +static bool context_banned(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
>   }
>   
> -static inline void set_context_banned(struct intel_context *ce)
> +static void set_context_banned(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
>   }
>   
> -static inline void clr_context_banned(struct intel_context *ce)
> +static void clr_context_banned(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
>   }
>   
> -static inline bool context_enabled(struct intel_context *ce)
> +static bool context_enabled(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_ENABLED;
>   }
>   
> -static inline void set_context_enabled(struct intel_context *ce)
> +static void set_context_enabled(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_ENABLED;
>   }
>   
> -static inline void clr_context_enabled(struct intel_context *ce)
> +static void clr_context_enabled(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= ~SCHED_STATE_ENABLED;
>   }
>   
> -static inline bool context_pending_enable(struct intel_context *ce)
> +static bool context_pending_enable(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_PENDING_ENABLE;
>   }
>   
> -static inline void set_context_pending_enable(struct intel_context *ce)
> +static void set_context_pending_enable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_PENDING_ENABLE;
>   }
>   
> -static inline void clr_context_pending_enable(struct intel_context *ce)
> +static void clr_context_pending_enable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_ENABLE;
>   }
>   
> -static inline bool context_registered(struct intel_context *ce)
> +static bool context_registered(struct intel_context *ce)
>   {
>   	return ce->guc_state.sched_state & SCHED_STATE_REGISTERED;
>   }
>   
> -static inline void set_context_registered(struct intel_context *ce)
> +static void set_context_registered(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state |= SCHED_STATE_REGISTERED;
>   }
>   
> -static inline void clr_context_registered(struct intel_context *ce)
> +static void clr_context_registered(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
>   }
>   
> -static inline u32 context_blocked(struct intel_context *ce)
> +static u32 context_blocked(struct intel_context *ce)
>   {
>   	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
>   		SCHED_STATE_BLOCKED_SHIFT;
>   }
>   
> -static inline void incr_context_blocked(struct intel_context *ce)
> +static void incr_context_blocked(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
> @@ -297,7 +297,7 @@ static inline void incr_context_blocked(struct intel_context *ce)
>   	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
>   }
>   
> -static inline void decr_context_blocked(struct intel_context *ce)
> +static void decr_context_blocked(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
> @@ -306,41 +306,41 @@ static inline void decr_context_blocked(struct intel_context *ce)
>   	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
>   }
>   
> -static inline bool context_has_committed_requests(struct intel_context *ce)
> +static bool context_has_committed_requests(struct intel_context *ce)
>   {
>   	return !!ce->guc_state.number_committed_requests;
>   }
>   
> -static inline void incr_context_committed_requests(struct intel_context *ce)
> +static void incr_context_committed_requests(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	++ce->guc_state.number_committed_requests;
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
>   }
>   
> -static inline void decr_context_committed_requests(struct intel_context *ce)
> +static void decr_context_committed_requests(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	--ce->guc_state.number_committed_requests;
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
>   }
>   
> -static inline bool context_guc_id_invalid(struct intel_context *ce)
> +static bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return ce->guc_id.id == GUC_INVALID_LRC_ID;
>   }
>   
> -static inline void set_context_guc_id_invalid(struct intel_context *ce)
> +static void set_context_guc_id_invalid(struct intel_context *ce)
>   {
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   }
>   
> -static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
> +static struct intel_guc *ce_to_guc(struct intel_context *ce)
>   {
>   	return &ce->engine->gt->uc.guc;
>   }
>   
> -static inline struct i915_priolist *to_priolist(struct rb_node *rb)
> +static struct i915_priolist *to_priolist(struct rb_node *rb)
>   {
>   	return rb_entry(rb, struct i915_priolist, node);
>   }
> @@ -354,7 +354,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   	return &base[index];
>   }
>   
> -static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> +static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   {
>   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
>   
> @@ -384,12 +384,12 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
>   	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
>   }
>   
> -static inline bool guc_submission_initialized(struct intel_guc *guc)
> +static bool guc_submission_initialized(struct intel_guc *guc)
>   {
>   	return !!guc->lrc_desc_pool_vaddr;
>   }
>   
> -static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> +static void reset_lrc_desc(struct intel_guc *guc, u32 id)
>   {
>   	if (likely(guc_submission_initialized(guc))) {
>   		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> @@ -407,13 +407,13 @@ static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
>   	}
>   }
>   
> -static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> +static bool lrc_desc_registered(struct intel_guc *guc, u32 id)
>   {
>   	return __get_context(guc, id);
>   }
>   
> -static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> -					   struct intel_context *ce)
> +static void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> +				    struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> @@ -576,13 +576,13 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	return err;
>   }
>   
> -static inline void guc_set_lrc_tail(struct i915_request *rq)
> +static void guc_set_lrc_tail(struct i915_request *rq)
>   {
>   	rq->context->lrc_reg_state[CTX_RING_TAIL] =
>   		intel_ring_set_tail(rq->ring, rq->tail);
>   }
>   
> -static inline int rq_prio(const struct i915_request *rq)
> +static int rq_prio(const struct i915_request *rq)
>   {
>   	return rq->sched.attr.priority;
>   }
> @@ -749,7 +749,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> -static inline bool
> +static bool
>   submission_disabled(struct intel_guc *guc)
>   {
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> @@ -830,7 +830,7 @@ guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
>   	return NULL;
>   }
>   
> -static inline struct intel_engine_cs *
> +static struct intel_engine_cs *
>   __context_to_physical_engine(struct intel_context *ce)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> @@ -1146,9 +1146,9 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	i915_sched_engine_put(guc->sched_engine);
>   }
>   
> -static inline void queue_request(struct i915_sched_engine *sched_engine,
> -				 struct i915_request *rq,
> -				 int prio)
> +static void queue_request(struct i915_sched_engine *sched_engine,
> +			  struct i915_request *rq,
> +			  int prio)
Could unwrap the prio field.

John.

>   {
>   	GEM_BUG_ON(!list_empty(&rq->sched.link));
>   	list_add_tail(&rq->sched.link,
> @@ -1838,7 +1838,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	intel_context_sched_disable_unpin(ce);
>   }
>   
> -static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +static void guc_lrc_desc_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> @@ -1978,7 +1978,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   	trace_intel_context_set_prio(ce);
>   }
>   
> -static inline u8 map_i915_prio_to_guc_prio(int prio)
> +static u8 map_i915_prio_to_guc_prio(int prio)
>   {
>   	if (prio == I915_PRIORITY_NORMAL)
>   		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
> @@ -1990,8 +1990,7 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
>   		return GUC_CLIENT_PRIORITY_KMD_HIGH;
>   }
>   
> -static inline void add_context_inflight_prio(struct intel_context *ce,
> -					     u8 guc_prio)
> +static void add_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
> @@ -2002,8 +2001,7 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
>   	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
>   }
>   
> -static inline void sub_context_inflight_prio(struct intel_context *ce,
> -					     u8 guc_prio)
> +static void sub_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
> @@ -2014,7 +2012,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
>   	--ce->guc_state.prio_count[guc_prio];
>   }
>   
> -static inline void update_context_prio(struct intel_context *ce)
> +static void update_context_prio(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = &ce->engine->gt->uc.guc;
>   	int i;
> @@ -2032,7 +2030,7 @@ static inline void update_context_prio(struct intel_context *ce)
>   	}
>   }
>   
> -static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
> +static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
>   {
>   	/* Lower value is higher priority */
>   	return new_guc_prio < old_guc_prio;
> @@ -2506,15 +2504,15 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   	engine->submit_request = guc_submit_request;
>   }
>   
> -static inline void guc_kernel_context_pin(struct intel_guc *guc,
> -					  struct intel_context *ce)
> +static void guc_kernel_context_pin(struct intel_guc *guc,
> +				   struct intel_context *ce)
>   {
>   	if (context_guc_id_invalid(ce))
>   		pin_guc_id(guc, ce);
>   	guc_lrc_desc_pin(ce, true);
>   }
>   
> -static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> +static void guc_init_lrc_mapping(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_engine_cs *engine;
> @@ -2617,7 +2615,7 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
>   	}
>   }
>   
> -static inline void guc_default_irqs(struct intel_engine_cs *engine)
> +static void guc_default_irqs(struct intel_engine_cs *engine)
>   {
>   	engine->irq_keep_mask = GT_RENDER_USER_INTERRUPT;
>   	intel_engine_set_irq_handler(engine, cs_irq_handler);
> @@ -2713,7 +2711,7 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
>   
> -static inline struct intel_context *
> +static struct intel_context *
>   g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   {
>   	struct intel_context *ce;
> @@ -3085,8 +3083,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   	drm_printf(p, "\n");
>   }
>   
> -static inline void guc_log_context_priority(struct drm_printer *p,
> -					    struct intel_context *ce)
> +static void guc_log_context_priority(struct drm_printer *p,
> +				     struct intel_context *ce)
>   {
>   	int i;
>   

