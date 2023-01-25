Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E767A7E3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815F10E285;
	Wed, 25 Jan 2023 00:39:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389E510E09E;
 Wed, 25 Jan 2023 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674607183; x=1706143183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VENBKU1XRf5z6HUmXv0sbvvjc7rn4RsrwtmUOtG8Mqw=;
 b=Lk2OkX4DZ4d/7wQAohcLZFsIsgPWs/xT8aYuUI11ASQ/sVAtV2e9/GvF
 zlp+ow1IgAmdIDxAsogfVne3Rb9ZZTKnuc4nQi9y0Th3bVNcQmVBPNe7F
 uXyFGMDFQg2VC9+AIvu22Jw+M7q6kL7axNTNBCMT7OS2km4t3KTHsFvLc
 ZW/OUw7OsnZbjXaGk8KjTftQz21ILRHy7QsgvCwfkY9ieb+dRe6Jr2SHF
 bx4uUkhYeeTdcQVxI5IjG+7lV9cJ6n9fwFR/hKr0Hd3kTvy48qZYH4HJ4
 0pyDqy4N8biqh3ZRWt2x0r0V8Kvj/v5FXfQ+xbDgcPJwZsCgfEJxylmh3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="353730517"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="353730517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692775586"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="692775586"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 16:39:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:39:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:39:41 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:39:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp6j/TRLMdp0JtkILPU2dVRUtIeWHDLV8g+tNTLi3l3+x4JJCyKyaDDIGzqisOLs2hIO8uB1MAV9tEjZGFyg7zCXj7Glul69TJwNcu6FMBxbpZHVQZsbkwx3Ldk832A4nzo8/00+68mm/umIpP6nxROB0DI6fFZvPRg1GSbwn6FV+B40mwd4C4B7bK5C4cEQ5PL9yf20GGaZJYEqTpm4NYZtay2IQwtdIf/jFAt1GlgRszA5HKJjO4YMIBzzBHxOIfjOu1YNibiW2nE8BQvEEy44Gse/eGiVdb3k99KUHLJVo/lL+6JOGbM8ob65H9ze//8dvgOgyPHJmxqBATMpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT5nkSoVuM7kWIThnqpJwWq54eVGUkTn8VlhQFLOidw=;
 b=E7g0bqdSmM2t+ulz3AzMhkgavhnbot/mAIizOntV6NrnlxzaexpAteU7MSbSnEBOLJMyt0+uSys0syIEPBr9USqiwmJf2LeZQTrr0iF273cQ744Oln0INdgXb9UlpvT4tKSkNQZ2WmYhvsaUZojfKHllMC7b2eKYOGfvrboMwdnqQ6ydsz5oh1d2iQ0wcmAlOJuinvgj8cUuuvBxhsKB/qyr+dUdS5r/5uXRfTxtdp4XxOHHWOWPtzl+hPz6W4Q7kq40j8CpZXzwhFy2E9aKDnufbfOTadFLIQEzF4QObdaIgzdgkcgLK/tQcGElk0xxagayoJwvXeEfTYp2e5tfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 00:39:40 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%8]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:39:40 +0000
Message-ID: <ce45ea35-2ccc-4bdd-7684-da53efce3f21@intel.com>
Date: Tue, 24 Jan 2023 16:39:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 3/7] drm/i915: Allow error capture without
 a request
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230120232831.28177-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5405a144-f5e6-487a-700f-08dafe6ca482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuYPN1NjnjWOUhe6kSWypmkQ4hx8q6brbKY0HmrV1Cew3jTyx4v7ZcOP4WISsydXxErXY+iZTui6/UwYsEl8KKt0hbX9p8BVnWoNjJseXeBPOUoLAwkP941XlG2mL65rriG1q8Mr2a12qlLyWezHlLdJaIMZ/k47MguOvv7ImpbfSfzAagzZNukJ5OWa/Ep5O/JUsEBfAXCGVhwydPgBPVNkYtVupsc5Feye3/oOt3dkNU0CcHeYMkY63k/Gm+yd3RHOin8viINvMwV99JtpDxw4lwLW586TDDCcxOtF2Bse8iY+ukov2yrokhepqgWpneoKtJF79ygzMgwKEqugqZWTRDqMmcTEs/YjRbKGo3CW0bCsTJRIbN3hsraS7bNhGdzDQbO1lPs/4fZ111nBMRzu4T+U4CmhfrfHcMgXORdQUaFjNQ8nfsXu/HG7LEvmZrCTjKXCDhKVNjjbJczlou5AjXIiiU7Qgki1x15+uMWtkbJq/ujc9CnS6qMkp/9YHIMZZW0bprp6+WlKXABobLLj/loY3ImKeDay5CE/XLis8IolQijb5ERZmAU33J7T2QJgkyvuRcMJo0z1MRAzMEf2XfVbRFNjBDLrwQ+3jOcp3dQ7sPkisY+biXpIKgXpr4OLtUTWK5zRXEjrB0lb5abPuex5DR34QEepNy/8AGAoAKM/O8WIxATIMM+xV8RKjMl1nBtUQ3oR+Dbd3RCBkLJ/HCal4OcHIcxiZX+BO/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199018)(38100700002)(86362001)(31696002)(36756003)(82960400001)(316002)(2906002)(31686004)(41300700001)(4326008)(66476007)(66556008)(66946007)(8676002)(450100002)(8936002)(5660300002)(6512007)(53546011)(6506007)(186003)(26005)(83380400001)(2616005)(478600001)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmpVTEMwdURZMkwvaXNrWU55Z3ZFODk0dVczZFpuWnN5UUpPeUpYeGorR1Na?=
 =?utf-8?B?VW83b2NpM016cjNKWm5IZjFIY3Uzc1UwdTVYREhhQUdtU2FGR05kejh6djBL?=
 =?utf-8?B?MVBoOWIzdFRQRjlJdnFiZjYrbmp5MW0zZ2wwcXA1bkxDTDR2Uis0ZmpFd09o?=
 =?utf-8?B?R2dPMUZiL1pJaklmUmJGVW5WdmhwMExyTWZpUnZiTDlaeS9SbFlrOW02UHdJ?=
 =?utf-8?B?cU84Z1BPVURyVGFBMS9vRVU2MkZZdyt2N1libnZRSVAxZFFudnpsbU81Zy9X?=
 =?utf-8?B?ZTYzNWkxc1crdmh2ejVKblEzTzZndVRrMVJmcEVqTER1UXdPQnBYM2kxWmJN?=
 =?utf-8?B?c1lFWHZHU3JtbVl0eE1ZcEgyRkNrZ0dDcStPNXpPRTdtRVhiRk94dUVXdXZl?=
 =?utf-8?B?M01SdTg2TVMxTkxCSG5UcmViZTlSb3NKYi85RGpWRStFZHVDeXY2empETFpw?=
 =?utf-8?B?WkZaZEwxSk1XMTh3a085eTZLMGYzQ0RSbjFhSlhieWVnTTltbXA3NVljckRJ?=
 =?utf-8?B?MTQ0VmUxbHVnRThMSFRkQys4K1JhTzhiZE1FMUZieGtZK1lFZ1dkYVRwOUkw?=
 =?utf-8?B?UDl5S085TmhZT3gyYytyUGdCcXpETEVvLzdhN21acHVYWXppZkZ3bFdXK1dH?=
 =?utf-8?B?czFiQWMxdldzU1JER2U4cHNLTDdxcWpGN1kvNW56Vy9ac2JTV05Za01IMDN1?=
 =?utf-8?B?cFo1eXNhR0IzLzl1L2xQVWEyVDQzeGx4U1ZLL0ljN3ZKY1ZQSFBXa1ZNVjgx?=
 =?utf-8?B?THJoRG9VVWFteGgvRUhBaytFRzArSFp1clI3MlhZZUFFKzgzRENlK1pXQ2h2?=
 =?utf-8?B?MmVKbFJtZUFPR0oyS1p3RWVseDlMZmRqZTFYUGF3b2RURDB2Ti80dE1ZQ0Z3?=
 =?utf-8?B?TTV3K3FNM2cveGJoanVzTXlWSkJjR2hacG5qY0czejRMYW05MkltZWZ6V3Q3?=
 =?utf-8?B?WEcxdmY5NS9WV2Z1WlM5NEhiTWZGbDB2dFg0QVQ4ZS93bDB3MHlPZFN4cjNJ?=
 =?utf-8?B?aFRYM0VLd3dPT3ExNzZocXZQRU9BYjcycFlkK2U4ZjBoUC9YTVI0NDduaXVS?=
 =?utf-8?B?cW5seHVpN3BTb3c0RkhleDhmNU5RQ21NZ0VIbmphNC83QkM2OGhUMXZLM1hV?=
 =?utf-8?B?SmlZMjREbllvaUJTTk94ZzNhZ0gwajBLRGhmdlNTM2pHUjlUVXVma3d3ZnY1?=
 =?utf-8?B?UGtSQXZhSU12Vi9kVE5CNlZ6VVlZS2VzZHRvSENGZGRHUGJ3dmVBbEFqcSs5?=
 =?utf-8?B?UmRiYkJVVFZtSWRaTnhMYjNJNVd4K09QcnRaajdnYVRLR1RTOVJNcmVId1pn?=
 =?utf-8?B?QjBGTncwazdJbERpMWdzNEdrc1dGbFMxZFZ1OFRrS3lMNjFGM2ZySndSM0FS?=
 =?utf-8?B?NCt2QUp1Z29YSVNnbkJLa3U0dEt3RUhTQUplaThEd2UwV2pjQloxM2VuTlgr?=
 =?utf-8?B?eWdjK0gwOWRocWE4Wkl2NFRra0Q0cGd0SVhPZUhhQ01HYlFPV3FFb3Y3emxT?=
 =?utf-8?B?dnZLS0wvejdibDd2bkFFV2lWR1IwTkpweUhOdGlibUNRZUR0ZFBNTjdkdFQ3?=
 =?utf-8?B?MkRhVUpBVVFLYUxIdmJ0V2FxekFWM3Y3TFExM1dHMTU4YW9xMkdOUER0SDE4?=
 =?utf-8?B?MVlrQjhuNFF3Vldmc0VPaWxvUG1reHcyWnhWNFNaUnJleGlzUnBMV0N3M0ow?=
 =?utf-8?B?Z1FvREVxOHpCbldoWWZVcmJCb3pNOVlBSFdiVytTOFlycWJxTUdSSnBuZ1Jz?=
 =?utf-8?B?Q2lJNmxhMWw5V1IwUVhJdGtvRUJYUUJpWGRETzA4TUdMZEFGSHRDT09jTExF?=
 =?utf-8?B?aFBUUUpwaWhFWFg5SENEL3M1MWoyclRHK1BBYTJ5T1dpTW5mVDdsQ3ZoV3d1?=
 =?utf-8?B?QTFTU2poSkt6bk1remcrbW8wRzRpbXJiTDFUWi9TdHJ4SDRvd3pOT1dSN09G?=
 =?utf-8?B?Vk85RThkT21ldFhmdUJreXRuVm1FMHRvaEUvV08xRTl4UDlEalRvUG1OeXZz?=
 =?utf-8?B?bm1SQURacktSOE1Ya1pLM29YV1NaQU5qWUx0bnZoeEVMNE5seWdNYjRJMHN2?=
 =?utf-8?B?VkI4U3V1a1puQUxBdGhqSWE0d3JyRXFhSm82R3JTTk8vSlZyVllTelMrZEMw?=
 =?utf-8?B?UHUwcXdDZVBBV3lNWDlWRExFNDNFQy9aMSszR3k5Tk9lRXBDR0pwekRGM2Vm?=
 =?utf-8?Q?lnrElGEqDPRDJKjalqdchdc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5405a144-f5e6-487a-700f-08dafe6ca482
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:39:39.9249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qeg+4sGVs1hOd7mUj46QwZ3graGX7J8z0ukJVlJA9sa+Wk0Khftv0ChMeNYuSm6kp7fAxnwBpOZGurpXY1LfGCKpOWSKR68Rl+rmxP2yWsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/20/2023 3:28 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There was a report of error captures occurring without any hung
> context being indicated despite the capture being initiated by a 'hung
> context notification' from GuC. The problem was not reproducible.
> However, it is possible to happen if the context in question has no
> active requests. For example, if the hang was in the context switch
> itself then the breadcrumb write would have occurred and the KMD would
> see an idle context.
>
> In the interests of attempting to provide as much information as
> possible about a hang, it seems wise to include the engine info
> regardless of whether a request was found or not. As opposed to just
> prentending there was no hang at all.
>
> So update the error capture code to always record engine information
> if a context is given. Which means updating record_context() to take a
> context instead of a request (which it only ever used to find the
> context anyway). And split the request agnostic parts of
> intel_engine_coredump_add_request() out into a seaprate function.
>
> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
> pointer.
> v3: Tidy up request locking code flow (Tvrtko)
> v4: Pull in improved info message from next patch and fix up potential
> leak of GuC register state (Daniele)

In the very unlikely case that the capture fails, we're leaving the data 
inside the GuC buffer. This is not new with this patch and not a bug 
(that buffer is a ring and the stale data will be overwritten if it gets 
full), but maybe something that can be improved as a follow-up.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 74 ++++++++++++++++++---------
>   1 file changed, 50 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index b20bd6365615b..225f1b11a6b93 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct intel_engine_coredump *ee)
>   }
>   
>   static bool record_context(struct i915_gem_context_coredump *e,
> -			   const struct i915_request *rq)
> +			   struct intel_context *ce)
>   {
>   	struct i915_gem_context *ctx;
>   	struct task_struct *task;
>   	bool simulated;
>   
>   	rcu_read_lock();
> -	ctx = rcu_dereference(rq->context->gem_context);
> +	ctx = rcu_dereference(ce->gem_context);
>   	if (ctx && !kref_get_unless_zero(&ctx->ref))
>   		ctx = NULL;
>   	rcu_read_unlock();
> @@ -1396,8 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
>   	e->guilty = atomic_read(&ctx->guilty_count);
>   	e->active = atomic_read(&ctx->active_count);
>   
> -	e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
> -	e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
> +	e->total_runtime = intel_context_get_total_runtime_ns(ce);
> +	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>   
>   	simulated = i915_gem_context_no_error_capture(ctx);
>   
> @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_
>   	return ee;
>   }
>   
> +static struct intel_engine_capture_vma *
> +engine_coredump_add_context(struct intel_engine_coredump *ee,
> +			    struct intel_context *ce,
> +			    gfp_t gfp)
> +{
> +	struct intel_engine_capture_vma *vma = NULL;
> +
> +	ee->simulated |= record_context(&ee->context, ce);
> +	if (ee->simulated)
> +		return NULL;
> +
> +	/*
> +	 * We need to copy these to an anonymous buffer
> +	 * as the simplest method to avoid being overwritten
> +	 * by userspace.
> +	 */
> +	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
> +	vma = capture_vma(vma, ce->state, "HW context", gfp);
> +
> +	return vma;
> +}
> +
>   struct intel_engine_capture_vma *
>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   				  struct i915_request *rq,
>   				  gfp_t gfp)
>   {
> -	struct intel_engine_capture_vma *vma = NULL;
> +	struct intel_engine_capture_vma *vma;
>   
> -	ee->simulated |= record_context(&ee->context, rq);
> -	if (ee->simulated)
> +	vma = engine_coredump_add_context(ee, rq->context, gfp);
> +	if (!vma)
>   		return NULL;
>   
>   	/*
> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   	 */
>   	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>   	vma = capture_user(vma, rq, gfp);
> -	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
> -	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>   
>   	ee->rq_head = rq->head;
>   	ee->rq_post = rq->postfix;
> @@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
>   		return NULL;
>   
>   	intel_engine_get_hung_entity(engine, &ce, &rq);
> -	if (!rq || !i915_request_started(rq))
> -		goto no_request_capture;
> +	if (rq && !i915_request_started(rq)) {
> +		drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
> +			 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
> +		i915_request_put(rq);
> +		rq = NULL;
> +	}
>   
> -	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> -	if (!capture)
> -		goto no_request_capture;
> -	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
> -		intel_guc_capture_get_matching_node(engine->gt, ee, ce);
> +	if (rq) {
> +		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> +		i915_request_put(rq);
> +	} else if (ce) {
> +		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
> +	}
>   
> -	intel_engine_coredump_add_vma(ee, capture, compress);
> -	i915_request_put(rq);
> +	if (capture) {
> +		intel_engine_coredump_add_vma(ee, capture, compress);
>   
> -	return ee;
> +		if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
> +			intel_guc_capture_get_matching_node(engine->gt, ee, ce);
> +	} else {
> +		kfree(ee);
> +		ee = NULL;
> +	}
>   
> -no_request_capture:
> -	if (rq)
> -		i915_request_put(rq);
> -	kfree(ee);
> -	return NULL;
> +	return ee;
>   }
>   
>   static void

