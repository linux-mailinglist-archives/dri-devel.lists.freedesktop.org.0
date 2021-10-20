Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF294354A4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 22:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78AA89C2C;
	Wed, 20 Oct 2021 20:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6431689C2C;
 Wed, 20 Oct 2021 20:34:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228825789"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="228825789"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 13:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="551919378"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2021 13:34:15 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 13:34:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 20 Oct 2021 13:34:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 20 Oct 2021 13:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+0BkXIdM8RuXEIBpcvkNJ3336cZeQaUWA7jpLNGHK3Kc1iceSp0ADSk9AL7LHlN6rOX8NTqcm8voFypWzSjtEPk3v5L8cr0lEDZUus0bY6lBOAdT7G+L9J/ffeI+5DLgjfcQS2Zlc+UKBSs4KwsBebOYikBbgom5eoarsSfCyEZ+WhLKsFP0AMQ/YnUWCDOVtdONuVFgTQnawH47csFHxK9CHVVVylLTaLjMNcXwvVSYAKupM8VYiDNVM/G21XTgCWKUiiOp6DU7bp8G3536+xOspcya2gERJ4eyywqOvVMAO8ox7SpDW6eH9E5mBW6YPFRXuLHY92fU0cWANS2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrCBhzv4zlpWsPa80RboxqgBqN86F0p+EYqkhTRyuQQ=;
 b=TS3SasmsyY0SGaoBb3rrglE7kkynjWKu2lLGgGjfrGSzysXwbEmdzQKKsg1uhZepmERR0HAWGpP82QUBtGLs9hVl4hQrrY9xqXmBUT36GqG6r+euZZXRHbZeTzCBTtSFAE3MdFKeD7Zxyvo6QqScfsC04uiaPrrHNI3Wf7MyZaFbMnazYfpSKTRjTRIArWHPxylK6+dsJvMvIEfbm1VxQLRyXkji5oh8vFBl/iJqPzVn6LcT8oQqvqoCGoSmbs0jPF8c6DBKZvafC1S9ybk0lFcqWDJbMsEq8mZ3dlBWff4rYp9n3H6GZQ5e3wbP8P8TVT0QCGcUgJlGyJhKTOwmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrCBhzv4zlpWsPa80RboxqgBqN86F0p+EYqkhTRyuQQ=;
 b=S71JOv5CRe8kKVyFKQQ+EYK+mY/maCViUfqm96io5HGdS3mFJcz4wAZxtHvvqfXpi1xemQBTQYZjSEQdnUzGtq2hUZrYiWdmHCyWG40+eDuHNFYwJWis6Us0iGNAIaUBARxb6VrE7Ofp5CcPrZTO53lRbtUALX35NBkyn8UqgQw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 20:34:13 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 20:34:13 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Increase timeout in
 requests perf selftest
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20211011175704.28509-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bd22680e-1a4e-7a14-1ec9-d8301b6ab073@intel.com>
Date: Wed, 20 Oct 2021 13:34:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211011175704.28509-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:104:3::24) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO2PR06CA0066.namprd06.prod.outlook.com (2603:10b6:104:3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 20:34:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d55c9d76-a2e5-432b-ede8-08d99408fa27
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5675FAB577D2BA529FE49A24BDBE9@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwNLzy+i1VJ4GEYTDBY7gPnw+rRoRstMCj4p9hZndsGhyNsaJEwGIm/4Z0DpFY6LhFsDcUp9fldwLSxAXTBD8oCVuo+Cpz7UFl5g9FmW09VI0ox5qL0ws0NlMf3LVorrr5Hx3TbGmg/YeGiD0V7qIlHS3fQilq/5LTe9zByf6L7VCPOqe4rHeoOY/JJciijP61mawZ29NcvPuqEm/VW4k6oKacTymuTNnG99jNXlwgT9Fu9UlASwAlXBuCOPhCgkiMHMXjC1IC5OQl13Vw1FLIYugRkK/GfV3XpcKev39fN443rs2R9hw5R6AqEn4Uz3PbAwN/Gi1ZAmXGDe4T0D2WMHRi7tiDXmbK8R3m4+rBKJsvyYWLoBYU6s1oDnhKEMAmf5xVQJbURbbGPGixNn/6ipPwU6/P7ic3fRazpvop//iPaWmxlpFAWhyU+PG9rUaGIjz74C80zOEI/Pl+lxfTS6aREQsY+Bd6Cle6NG8dY92Ga1rVhOOGSvBLOO6Cri5LwpKqrGm7gAex1MGoVbdfCwRPVPWjZ/UaqT5wQd7ZH+nEVwo83xB6gCrGtir9O9o4KmU36cUm2K4Qewyoi4pmL8K21k7uxtbAAxU8Ax9p7owV83op6yDMTpUIIfm2h+oz8M1afA3sWBcvy/L6LEaeoaA7+rRekDr/a1T1N4+rY/KJ4GwiqGKPtPdVJjZ1un4ZFDhhtxFyCZGJEqCxH+iXCSI5bXBBUQQ+hbpRR96Hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(26005)(83380400001)(31696002)(2616005)(66556008)(186003)(86362001)(5660300002)(36756003)(4326008)(6486002)(316002)(38100700002)(16576012)(31686004)(8936002)(82960400001)(8676002)(956004)(53546011)(2906002)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBnUjcyWEFkamZpNUxqM3JLUTl4UjROb3M5RGdqSDU5UzY1OVFDaGh6ZGxS?=
 =?utf-8?B?MmJxQnBUViszYTR5c1QxcDVydHlYdVBVMmswQnA3MENjS09CKy9qN2tBY0xx?=
 =?utf-8?B?bmFISWFrdTRZdVZxNEdPVXNQU0J5VGNhckFzVThzSlhsRjZ2V0tyYWIvN25p?=
 =?utf-8?B?T2Fma2l4cEQrQWRmdXF0Y1d2MDBaWGwvMHZJaGdhaU85WElnbGRaQ0FrYlRa?=
 =?utf-8?B?Z3crNm04ZmErTkxXKytXeEIwWG9jRHlPWk84U0ZTTk9WMUFhb1ErakkyZlJy?=
 =?utf-8?B?Q2tDMDZsRGhkMmI0NlhFN2phbE1TOUwzQUxNRGcvSXk4NGFLWGx6VHdlbHlj?=
 =?utf-8?B?SW8ra2pFYTFZZURpSUZPdVYzWDNHZEhzaGZHN0FQcEtRTWdPaGxwSDRhajRv?=
 =?utf-8?B?bnFzWE5Lam5ZclI5aHZNUHFIZHdxR0ptZ3IwdFFhbyt3NnAwZE1oeTA1M2Nk?=
 =?utf-8?B?dzJUWDROL2t6NlhvdGZONEFxcjBndnFEVUJZZlFKd3VEV1p1NjRKVmRkbmhl?=
 =?utf-8?B?UUJsOWJlTzdwY1FXWWdCc203RUpJQ1hubWkwWTlxaitiNWFaSXFId3daVTZh?=
 =?utf-8?B?UmxKd0Y5cllkdk5ZcFZ5NmdHQUJmOCtCUFVIY3ZjM2xkMGNLcEhqYVBzaXFG?=
 =?utf-8?B?UjdES0ZrUmhaUzdKc3prb2ZpeEt1Sjg4V1d1MWROTjY4bVNUSXY5L0xIYTJP?=
 =?utf-8?B?Rm1sZDVWSzBnTDFpMTJoQVprTGN6T2IxRXdTWVpKMW1OQmxvV2hObXRqTU9I?=
 =?utf-8?B?Umk5OTcwZHRGb2kwMnJYWTE4c2dnQXNxU1RYMFBaUVFGZUFWZ2RBUmltUmox?=
 =?utf-8?B?RU1xanFPNC9yUStmNGFhMFVWdGZ3UVlEeEJ6djBnQnJKWGRjaWl5Y04xV1BL?=
 =?utf-8?B?RXgvRTlBelpOUG55K0V3WVczenh1R3BoSFdXZFF4Mkt4Vnh2UDRsQm5zbVFZ?=
 =?utf-8?B?bHh5TWx4UDZRbjA0V2hxTUdBbTZUNEw4SnVubDI0YXdJSTFITmJyTmxFTE82?=
 =?utf-8?B?aU8zYUZrNm1uSFJqSGhTWWJkOXNaOURydUwxM2c1MGpKYmcxZTNnVUhtdGtl?=
 =?utf-8?B?a2o3TjN6V0xvMzlDdHF4RDlBS1QxV1lYNzlHQzkrL0tQS1BGSkZ6RksyWUdR?=
 =?utf-8?B?Y0lsT3BIK2hRRG13WUcydi84aFVGMGR0a1k3cm91TkZjWnVVdDhkS2Y0WDlW?=
 =?utf-8?B?cHhsUExZUXMwOHp6aG0yZDlCU3EvNEFIOVNLK0dadExhUVpWbElwWWdPS1Zo?=
 =?utf-8?B?bXJ3QXlLNzdMRUpxMlVCVXQvWHFtY3QyK1VOb3kra0Y1R0h3MzFRWWZPRm4z?=
 =?utf-8?B?MmNBMy8xTGZSWnB2UkIzaDlUNFpKZ3RBWGZqU2oySVpqc2NzQTk4U3RaZ0Jp?=
 =?utf-8?B?TWlZcm56MW10MTBRQlNuZUdrZCtuVEE3SkN3SEVaZkMwSVpoUS9LOWc4ajhu?=
 =?utf-8?B?SWFuVkpHL3VlV3FHaVV0MyswanpMZFUzTGNYZVVIM2gxeXFISS9GbFJGa2FB?=
 =?utf-8?B?UVpETXhnK1hHSXlJdXBFaGxmc09qZXdnM0ZDdUo0bm5MRWpaaDdsRE5FZS90?=
 =?utf-8?B?djdabW10SGU3L3VYOFlra1ZySU9XQlpCNGgwRVluK3BLMjA2T1MrdklyZWxO?=
 =?utf-8?B?dFlhUm5EaGViK3M0RkRsUVVobE1EdWtkU09IbkFCeVlPY29qNER4bDBEcUty?=
 =?utf-8?B?UURZZndhRFltMWhlWUZ0cjFnbTM5Nk5ISGJJbWpiOEpLTDNOOGFRcDl6dXZD?=
 =?utf-8?Q?3xfpoHd2+9yyhbjov0kuriGHD+kOZLbWQ/2oOPO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d55c9d76-a2e5-432b-ede8-08d99408fa27
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 20:34:13.0929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: john.c.harrison@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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

On 10/11/2021 10:57, Matthew Brost wrote:
> perf_parallel_engines is micro benchmark to test i915 request
> scheduling. The test creates a thread per physical engine and submits
> NOP requests and waits the requests to complete in a loop. In execlists
> mode this works perfectly fine as powerful CPU has enough cores to feed
> each engine and process the CSBs. With GuC submission the uC gets
> overwhelmed as all threads feed into a single CTB channel and the GuC
> gets bombarded with CSBs as contexts are immediately switched in and out
> on the engines due to the zero runtime of the requests. When the GuC is
> overwhelmed scheduling of contexts is unfair due to the nature of the
> GuC scheduling algorithm. This behavior is understood and deemed
> acceptable as this micro benchmark isn't close to real world use case.
> Increasing the timeout of wait period for requests to complete. This
> makes the test understand that is ok for contexts to get starved in this
> scenario.
>
> A future patch / cleanup may just delete these micro benchmark tests as
> they basically mean nothing. We care about real workloads not made up
> ones.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index d67710d10615..6496671a113c 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -2805,7 +2805,7 @@ static int p_sync0(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +		if (i915_request_wait(rq, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(rq);
>   		if (err)
> @@ -2876,7 +2876,7 @@ static int p_sync1(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (prev && i915_request_wait(prev, 0, HZ / 5) < 0)
> +		if (prev && i915_request_wait(prev, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(prev);
>   		prev = rq;

