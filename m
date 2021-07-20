Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988503D02A9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32816E170;
	Tue, 20 Jul 2021 20:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA986E170;
 Tue, 20 Jul 2021 20:29:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198594176"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="198594176"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="496342010"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2021 13:29:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 13:29:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 13:29:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 13:29:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 13:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTX58nZ4152FKNR5l27e2CaTvFKzc5yMOXTWnF1F66WJpyyxcm4DM9FcE53BLVuW4/Q9GNPE+TvzgvbPkPXAhxzzxpqHUJOwcFIdiX8Q6DSiaLSqR/uE9QdU3E4HBvX2SJyY/6KyLeG62Le+Tm2xWcWtfMu2vYopIguWsNkX8ReSI5IzRBj9THnhRwcCmTW3u1JdRarJo/bW7lgOVm8Czte92EOQJrRi0R3UZ7xLAUzut1Tv20FE5njNU6MUOR8pnr8yedw/Y5cdprKeELLgve5WeTnUwR2eIQN7mqsvgZo+U1PF93QuVDV0i9QDHW/7VHhRd5dQBOaoAUlsdiPpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3/B+6TPJICNK6I/hbWKwp2DHZQ74NISrCgJ3FiBkwM=;
 b=efO8TOltOC59Hgpw2YHkvym4jZY0WlLzklPiG8DAYapvYozyPgs0qbwORTm8RK/VB8MX3YyDNAn+WhK+dK9MjJx93BN6ERKATnKS9yNXCq2+wgYJmQrK2NgA9bawkAG3CJGa7bi7wujugC6XJUDA70woS1pIjb2suOGJIudhz3vh8NM9+/iZh9eB7V9l/WioIzevp28VHZqJoMbNolVm/Mw3wkIDSxzdEj6u1GDC7yEJtNBG9RpKm1c5JLjXLO1zuNE+hkaz5EvnT9ecJWdzPATlpRIFt6v5tEAqYQUdt3HkOGew0AYfgUzVi+Bu4xTHnEfEsWkRw0RxDB7uLM++Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3/B+6TPJICNK6I/hbWKwp2DHZQ74NISrCgJ3FiBkwM=;
 b=AgkhD8kicSpPQL6SnqlrdPjxrNzeV1sXtTCRgjwbr3LX/0wjplh1ni2/jcntUugmMF6trS/0MQaai5V3/yMClzctY5Gdjd1gIkkJqrKJEKdv3Lrlq/vM8iupXfI1ql6l/AJ2Ged0JTXittV+QBt3EcLkfeOWhXs7o+/e3JLI7vo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 20:29:29 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 20:29:28 +0000
Subject: Re: [PATCH 30/51] drm/i915/guc: Handle context reset notification
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-31-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <19438ac3-255f-78db-6ce3-ba919ea4e456@intel.com>
Date: Tue, 20 Jul 2021 13:29:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-31-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:301:4c::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR15CA0064.namprd15.prod.outlook.com (2603:10b6:301:4c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 20:29:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0c1ac3e-1a4a-439e-36df-08d94bbd12e9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB561164207DB05314ACB69CC9BDE29@PH0PR11MB5611.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdEObiqBkeHf7wR6Lh8ukPu83wmh5Rt3O/LBFw8CYdjeWmqIzDBmADdZAIjTmxnh+OGiMi+4tIyqcZZV8DrxyVSlQH68nSQQaXra0EhmM973lqC642wWAu1A+5/4Kt/GT/m6L2VrqX+eBkkJu5D1/M1tKqFvEK1gRvABzczIbkjx2WmFzN5p8HVexmMNtAnbgvcymCXU8JiaGHmorHUVH6b4WqUoBKSP9HwyibCh4ZpBwwU2/xI9sgifzJhiggzJlNA9kvZR7h0w0qZSwXtdV7t7Qt5qNxyjfn9AbLZYzKbeQ1VaXbUWI5Yt6hRrm7UwqX4onJpkFYTgEG7tC4aNpvkXwVvuFf2h4Qjrl9GkYS4tjQVvaU6ij4beKXp9bgM8rrY8WQ6C+FuC+4T1zgm2MhYMsXt71rWBwBCE2uPBRvTThDIdTAlQ+8sQO0szijbOW5PpJGaaCu5+gO6g2KvNhF5wlpvds/g6731ZVBTYhRKA2UiGhJFSSigufLZy0OH/8Rd5HNGj1mQzR+HmI3zjW49aKAzkhPsBQV3yjfEAW5W57sGhzpBfcO23J1aKXCi/jQlj3NaPAAX2PWe1rVS0r0oEAPJtwTVnPfWknquiRj6fYnCMLp2k22beBY2ggo81g7eFFKxMgpxfcDMhvSIondGIiFRzcqDX83DwpG9DKmcHZX0/60Lga2foqHH7/KOpHWGiYaAC7AttkZibIjgj3UVmmkV+Ls3n3ary71NJQBLD9sBX5vusfkW5nkMkm3YV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(26005)(36756003)(16576012)(186003)(956004)(86362001)(478600001)(31696002)(83380400001)(53546011)(2906002)(15650500001)(450100002)(38100700002)(107886003)(66476007)(31686004)(8676002)(66556008)(66946007)(5660300002)(316002)(8936002)(2616005)(4326008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTR3Z0g5NjlhcFNYQ1VvenBrTkdJU0x2S0crczVIUE9JbE1UNTVCSktrLzlw?=
 =?utf-8?B?VWZJdGZQdEg2K2hPVk5lMm5VMXZTL2NnWVhIRnlhK2Jaa1BrZ2h3WCtrZzZV?=
 =?utf-8?B?aDFiQzk2TDZIcjRHbEZCTDcwR3JubGVCTDBxRityVTg3Q0k3ak1GYS9mMC9a?=
 =?utf-8?B?SmNodXlIR2hUbDFxRXFzVXN4anhDdzkxZTIrc3JaRElNajJLdFdXY05BQkgz?=
 =?utf-8?B?MGVJamt2aG1HVkNuWGxObjliV0lHbjAxeUJlWFU1ME12aTdjWHArd1Q4OFFt?=
 =?utf-8?B?SGxEbENrZDFyWEhOMDJFMUI0bW1vWlJ3eTlwMEh3MmdISSsxMlgxd0dmRkR1?=
 =?utf-8?B?SzVlbEdUUnp3S0dSU0dOVVdoaGJuUlJFbCtoMk42V0tzaUtGTTJ6UXdZZnlI?=
 =?utf-8?B?MjZpeWxiN2NhM2pkZ2o0aS96MVZIOUtrZUxTQm1idnZrQ2N6bEE3ZnVPTEdH?=
 =?utf-8?B?em1sRm1rRHZZMEJhaWp5VkptZkdlVmd4TVBEZ3BLc1cxVTcxbXFBemMxU3Jl?=
 =?utf-8?B?UlBxVzFtTmNubk9OVHZSUDR6d3pYMTJMdEpidUx1MVZYWlNsUFhDSDd5dmJm?=
 =?utf-8?B?YXNhRHphbUl4U0cxZ3phdGdFQW1vazl4YU5Vc2R6MEo5RjcrZUJtajBLdjhD?=
 =?utf-8?B?WVJ4cU1nMk9jS0VRNnRXdG0xSXdNVDdhdVdCcUZFVHVTazVTL0xVNEJhbStz?=
 =?utf-8?B?dkhzRnIydlR0TmdDZEVXUmpJVm1PdEQwT0xYZGVyTk5BWGRlRzd5QnFadjhm?=
 =?utf-8?B?VW8zVm1UeHRBbnNlVllWL3c2Y0JIYVpmd3JsYlZUMlFNYUFBTmdvaWprZVVU?=
 =?utf-8?B?SDk1eExDYk1Yd1o2Mzh5WDY5NXNka3B4SkgvczRaMExJUmpLbGFjUG9uT3BH?=
 =?utf-8?B?d3lxRVMyM09WSEpOL3pRRXRtVzZTeEJDb2t2c1pTMFZ5UHo4VlhoQ2hGOGhh?=
 =?utf-8?B?bXNuYzNwaENVWm92WHlTaEFKdXZRSWQyazgvOU9rbDZkcjRJTnZLSkRxR0xo?=
 =?utf-8?B?b2ZVT1I4UnlKU2prWGN6dS9ESi96T0tDYmRzLzBXRE11ZkRvNjhFV3RxUFJL?=
 =?utf-8?B?MTFTUlZ6eWZndUdLeGQza2ppOGJXWnhxTmxGMExBSkNXM05QUVRsanQ1VkNj?=
 =?utf-8?B?UkdOQk9pOXlBaXJWWGtmYW80NzRGcGlXM3lXc1J6bjBEOWtHVFkwQSswWGsz?=
 =?utf-8?B?Mlp3RDY2YmlRTEVrVjJEdWN4YXZPYXFDdktMR0Nac1hyamRoRXVvNStXeGhQ?=
 =?utf-8?B?NDROS29reDgxTmJyT3hwV2lWcGVGdnR4QlhjQkxrblkxemM4RURVN25wd0JV?=
 =?utf-8?B?ZjN5MzZDMW5teE93aGNrcjIyZDM1ZUpSZGR6ZStUY3FIeVUyWVpjVTU5ajFo?=
 =?utf-8?B?WW12N05OM2U5dFNPZU1iWmc4ZnZZVDlJamxMYnVFSk1ybkFPZ3p1NHcvblZ3?=
 =?utf-8?B?SzRHSExscjJEbE9UaTBPSzQxVis2a3F1cmtBQkxRUk5Na0ZaMDdtQnRRdGl0?=
 =?utf-8?B?NWp4WVdvYTN5OW1UM1pGdEhQRFFQN3lzZjU5dUhwQWZqTTZqMDYraS8wS0E3?=
 =?utf-8?B?aVVMMDNHdDdJdHUzOWY1Rkp6UmI3VWFGMHBnLzZDMUdraXlkbTRhS01ybnNi?=
 =?utf-8?B?allzMkhZTEZaa09rQUc5OGp2QVQ3aHBBalB2Zkl3a2Q2ZnRVajY3ZGN3YXpP?=
 =?utf-8?B?dEswUVNsUkpDMktUWXdlS2ZYQ2cvTFh5VDhUelVBODBranRFMDhsdXpoUnZH?=
 =?utf-8?Q?1JhSjh9gD/YhdJgns4CK7pQvPdn/yZfXJsf77Ev?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c1ac3e-1a4a-439e-36df-08d94bbd12e9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 20:29:28.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1aID5i7NOwN+nnpzwrW5VF9ZMtOJrTREsWfGv7Gdh2jIkvxVjW08efRPtGgzQU7st9aGnUnCcPa40k2IqwB91S7Zm9mJ2hPPw/XOeP8Na4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
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

On 7/16/2021 13:17, Matthew Brost wrote:
> GuC will issue a reset on detecting an engine hang and will notify
> the driver via a G2H message. The driver will service the notification
> by resetting the guilty context to a simple state or banning it
> completely.
>
> v2:
>   (John Harrison)
>    - Move msg[0] lookup after length check
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++++
>   drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
>   4 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index b3cfc52fe0bc..f23a3a618550 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -262,6 +262,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  const u32 *msg, u32 len);
>   int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   				     const u32 *msg, u32 len);
> +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> +					const u32 *msg, u32 len);
>   
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc);
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 503a78517610..c4f9b44b9f86 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -981,6 +981,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>   		ret = intel_guc_sched_done_process_msg(guc, payload, len);
>   		break;
> +	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
> +		ret = intel_guc_context_reset_process_msg(guc, payload, len);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index fdb17279095c..feaf1ca61eaa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2196,6 +2196,42 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	return 0;
>   }
>   
> +static void guc_context_replay(struct intel_context *ce)
> +{
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +
> +	__guc_reset_context(ce, true);
> +	tasklet_hi_schedule(&sched_engine->tasklet);
> +}
> +
> +static void guc_handle_context_reset(struct intel_guc *guc,
> +				     struct intel_context *ce)
> +{
> +	trace_intel_context_reset(ce);
> +	guc_context_replay(ce);
> +}
> +
> +int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> +					const u32 *msg, u32 len)
> +{
> +	struct intel_context *ce;
> +	int desc_idx;
> +
> +	if (unlikely(len != 1)) {
> +		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
I think we decided that these should be drm_err rather than drm_dbg?

With that updated:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> +		return -EPROTO;
> +	}
> +
> +	desc_idx = msg[0];
> +	ce = g2h_context_lookup(guc, desc_idx);
> +	if (unlikely(!ce))
> +		return -EPROTO;
> +
> +	guc_handle_context_reset(guc, ce);
> +
> +	return 0;
> +}
> +
>   void intel_guc_submission_print_info(struct intel_guc *guc,
>   				     struct drm_printer *p)
>   {
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 97c2e83984ed..c095c4d39456 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -929,6 +929,11 @@ DECLARE_EVENT_CLASS(intel_context,
>   		      __entry->guc_sched_state_no_lock)
>   );
>   
> +DEFINE_EVENT(intel_context, intel_context_reset,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
>   DEFINE_EVENT(intel_context, intel_context_register,
>   	     TP_PROTO(struct intel_context *ce),
>   	     TP_ARGS(ce)
> @@ -1026,6 +1031,11 @@ trace_i915_request_out(struct i915_request *rq)
>   {
>   }
>   
> +static inline void
> +trace_intel_context_reset(struct intel_context *ce)
> +{
> +}
> +
>   static inline void
>   trace_intel_context_register(struct intel_context *ce)
>   {

