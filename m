Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D343F396
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 01:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA25B6E0E6;
	Thu, 28 Oct 2021 23:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC1E6E0BA;
 Thu, 28 Oct 2021 23:48:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="294009029"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="294009029"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 16:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="574049935"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2021 16:48:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 16:48:34 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 16:48:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 16:48:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 16:48:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed/HY8LAiQC/I2VEbQW//7oP89a5fX8d+A5z7wwTQHPbWnHr5VbI99JXDMkTw67sZY+M9jjD6yoaDg7OTyHZXOPkKrOKSpzmZYRMQTVPtHjP25+VZzi9JVvTWyQAipkOZ+jOvLcH3JnHBwhXxY/MvQAuEFQeYqGR4KLLx1qZeyZBWRXkyVnVnQh45cwQLMHRmBp20MQQdVOzhcmcXP4RY2xIV8yBjQ11E6LC6+eePBBUk+YGfqy+/IZVO8zELdlXiFfuuvuvnbvL6YiDxDudMRA51dgV9GRXPLW02yfd5wzRTJKyd9Gt4cjQ+IFBWOglvubT0waHYPQXpcoHFJAFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn7FbFykwbBLRKTFyNxvRVawJcLdwblYcJGZsl0Tgus=;
 b=VXm8CUHOz6jBTkbttWSRli3y6A/v8IrnRkGNeBuUasJ/k4sXQo6G+VZQxyM99T7TtW+OOSZgv/7NID3cMf1+9aDAOegoXVc9kunW3yl1eJdoM85x4j2Gz9ObUEhMfOpqViLx4NdStCb/jsxcbA64kWQQj/P663FfGhzXbUDG1/3D4FtcKQyBqADsyVmuknqd7xRl0ZncrjhFzt9kQ6EPnVamh6XO7gSDWeEt0Okntbp/PSW/gf94o2sorAGIhigyenA2ETws8lq7lB2rKHwTATJGqLsR+QW7S3fGuGTA/mA8SSepn6GUVxHF2DX9zEwRAMtC516tUg72omOYfBg8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn7FbFykwbBLRKTFyNxvRVawJcLdwblYcJGZsl0Tgus=;
 b=PrTmhhNO8+blhpMpjn1m4NB6RIt9jT/iSU8OfD/BDvcph0lbB7Vj6rCf66rCVmpsyuTK9/llWWaBuDNu2fUV3AJJWMpatcDigKeoXILDTxnwDtTBd/6wibygm2NZFZKSxjeKCIgIkEqcjPUOceiqlmhU0oQH20gWp36lvCvHrKc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 23:48:30 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::ad26:6540:dce1:9f81%3]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 23:48:30 +0000
Message-ID: <483d43ad-9092-e255-0d1b-9a3636584385@intel.com>
Date: Thu, 28 Oct 2021 16:48:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/resets: Don't set / test for per-engine reset
 bits with GuC submission
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20211028224224.32693-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211028224224.32693-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:104:1::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO2PR05CA0091.namprd05.prod.outlook.com (2603:10b6:104:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Thu, 28 Oct 2021 23:48:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a32aad2-08e9-45c7-82fe-08d99a6d70e7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56281829161012104B1FE527BD869@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EybZR+IMkkJRE8M97ax8sTfCpFqknjgCYcM+QALJYOi2lS/4r+SDQkQfLsJ+jaXY00jyNmgXbHCmqtC4TM3yWxBla5n6iusiANvWJ6HbSO0r2Tx6d0yyVnb3rTVSiDjERmutKI54dOFuYeKKR3KtzS7fhkipRAFoUmMRdilMInoTcJAou56tiymdijGAVdicKMYmTkSjS5lNOXR3NOUMGgtV8UIS9nB2eXqUB3E3CsNnIFxXZhzKVp/fa3XaLAo5LSsPb254+BgVD+2O4NYX0D3hTs/HQ6Qsxrgpo4e/f2zrt0jB54Eorv9yYs7niTMrmlSPywU14CB8YeJF3QQvqmFlEoZeTYjIx9dYQ8rFSbUswNMHkayX+4SyqDt8nynAERcJP//NCa0jPAeFyfhLp9Mn0xGs3PDEkkkGp1i3imUoHTT/QZaeDl4az8W22f6BBlK/hVe6XlRUDYyR3fz0s4hUyA+Qv+cCCDNgdbFH4U2TALJTmp9VdUUKD6vYbKRYstgYKw5OkbPfGu6+JkL7hwgVLH57kX9LUBJlqwsL98qkgx4iIvFky3qd9E5eLsaOZNuAfa0QCgXemnlgLZHf1SqDhUBIeAWKiRJD1CtZIMzCeeK8INEBplEMqe171B3QX1XTeStR8QNnpxIw+pW3qEDUC7J78ZezsinkzvxcGzrVA7MBj9G25IQzDkl5wjuYR6cGkFT1wZ5AzhIG58F3JViofatJqE/HVoh5gwZb4XSB4IoTFGUG66vgOr8yzW7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(36756003)(2616005)(26005)(186003)(66556008)(83380400001)(508600001)(38100700002)(66946007)(956004)(82960400001)(66476007)(6486002)(316002)(8676002)(8936002)(53546011)(86362001)(31686004)(4326008)(16576012)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEwwT0M4OXEySy9KUFR2Ykh5b08xVUh3eFRKeVlrWjlQY2dZaFBjQ3RUU2xX?=
 =?utf-8?B?Z3VncFg4QVp3eUwrVE9od05xU1pEV3o0MVVZWW1pRWV6SVdLcDZZM091dmpI?=
 =?utf-8?B?UjR6VEE4L2tZeHpLKzBtcW1WQVExVUwwNFhsRVVVMVlTQUxFVXlkaHk3TGRj?=
 =?utf-8?B?U3FRWCtSZ3IyUlhRN2xmOU02K1JhWDd2SUNwV29taGp4SStDckpmUVhGYzRD?=
 =?utf-8?B?T1o2N3p3SnF5S2kvTkdVd1BDa3d5REc5M3FqRzFMSmVJVUtQR1pnNkw0aEZG?=
 =?utf-8?B?VUswbnRsSmsweXZBeDVxbGswaHZYRWhUVWZOYmtKNStKNXNic3JaOVFwc1JS?=
 =?utf-8?B?YUFNekJhODZqYU5mczF0R0wvZHdOQ3I4Y25OcSt1OGdzRFZubUJJV2ZaOUF0?=
 =?utf-8?B?cW5EaTZnOTlFYUJDNlkwN0RSQUVMSGs1WTU5U1JrdkVNZG1FdzNYS3RlWEpr?=
 =?utf-8?B?VjdoZEtob0duWFhCR2gvWE96a2gvMzdYRnRFaTVySjExYkNQWUhZK1dmdDQ1?=
 =?utf-8?B?djlFYXhCcWVscXQwK3ZaanZtdXhGZ0hqWTZ1c1E2TVZCQ0x1UUg4cTdxUEUz?=
 =?utf-8?B?TUNPZjFLMkZIYUZmc0VobDFLU1NMN1hncm9xVFFpNHJvSTVSVXRhMElpSVpV?=
 =?utf-8?B?Mzg1SGdtUkQ5Z1d1QWtxelRDRm5mS0RacGdMVEJIYldQTms4ek1JY2crcnB1?=
 =?utf-8?B?NHhrS3RBb2RpQTM2cGdwWGRFWFZxNER3YlczVDNNLzI0WkJOZklXSEVvREJz?=
 =?utf-8?B?bTVsSkpGVytFRjR2Zm9SYWlXSk83a2ZtT2hmWlYwYStUQjdyTk94UlpYN2lw?=
 =?utf-8?B?R3h6SFZOSmRiSklyVXZ2aStxL2dZTDMwU2pLNXdFTW1YWFBBRGlCOFI2SFFr?=
 =?utf-8?B?TDBySHNKeTh0WS9uaXp2ekY4aWZoT1F1SDhibW9mOUdIeWh0STNWZWpraVhs?=
 =?utf-8?B?Yk5rR2dSNk8rMWpWN2o0VzBQdnVhZlFTVTlvYzBPeFJMcE5vKzU3SmoxekFI?=
 =?utf-8?B?NS8wUGdnYU5RQlNYMWRrcWxRZHFyTVR5VWd5NjZlcERkMkJ3aVVCeWEvZnBt?=
 =?utf-8?B?T3FjSGo0bUgyWTVzZlBSd0ZZR2dJTERQMExZczdlcHhWYUJCQmM1RW5Cb2wx?=
 =?utf-8?B?a3Iwdk01NkVTbmpQQUhpTC9MVkluZlJIS0c4Tko1a0lzNkhPOU1lVVRzS0Vo?=
 =?utf-8?B?Z1dWRnY0T2JkTW1yTlRLVW8rbUxuTGJrUFVyK0dTWEFIOFhmKytYaWdwU0ww?=
 =?utf-8?B?RHNkYkpLN1FEOFVsTEJNQ0pKdXd3bnFSc1kvaE16SkFQZFZYenBDWnpBTzky?=
 =?utf-8?B?QXVjekJOSnhSaVd0RzFSSmR0UzFCY1FlK3g0RWJ4NmZDWmlrZ0pJWjFOekx3?=
 =?utf-8?B?aDU0WUZpTDBLV0ZlNUxxSXpDS1J3MVlHWU9qQUZtZ3QzWlpBWXppSTdvWHor?=
 =?utf-8?B?OEFnQ1ZQWUxJa1R0Rm5nTHpuT3JvcUpwNHVnN0xEbW0zbWN4YkRGL056WU52?=
 =?utf-8?B?NmpJN1psTmZTcC9SQUdSaGdWdnJNeEZQYXA0Yi85ZUxYMGFDQm9EUVJ3Y3VV?=
 =?utf-8?B?eTltY2VNbEVLdjJHS1V6dHVOeXBtN3ltN0pJR1M2WVptN0VRSjJHeU9MTWQ5?=
 =?utf-8?B?Y2NLbERqTjkzMlJSZEpRQmRYWUdyaXMvTEJxWjVVY2ZyZ0dnZ1QvVk5MKzk1?=
 =?utf-8?B?MHVyYU00WEw5NFhjUnlobUY4VzIwOGtkTTRwSFVlM3B4bnY0Q3NrSU5KVU1X?=
 =?utf-8?B?VlVFdVBuQlJ4akhHYXFEUUsvOUtDSVJzcHJCMkhDUmczSG5RUmdrVnhObkxv?=
 =?utf-8?B?WVp5MjI3ZkE4MWhqeklSN29PZkhIa1ZVMWZrWGw1VUdCK1ZnZSt6elN1VTFW?=
 =?utf-8?B?M2JLOHdQOWNBZ3JpNVZ3YVJZdjdEaFRHV1dVT21nRXRiMDg1b2JqeUUzMnFI?=
 =?utf-8?B?WmlJSjZ4U3BWdlZtMlpNcUUrTDMxN3lSYkxnaC9ETE1mSFQ3Q0Z4Y1ZuUnpm?=
 =?utf-8?B?OUptQk03UDYrRHMvMDErZm9UV09XMEZwVzByWXdpTkxFZFAyUlBwUm1IdmlD?=
 =?utf-8?B?czcvR3RsUlRiU21yWFNYZVJXc0dRTjVMejBqL0dJcDFWOXZYZGlpaU45RFNp?=
 =?utf-8?B?UTRwWUpOV0RIZG44SFhqQnhmcStBUEVxcitBcG42eTJZdndkMlhCdmVJU2tt?=
 =?utf-8?B?cUdXWXJoOWwzc3dLM1FBRDErd1c2N3NoOUxQeXR3RGt5dWNrR0p6ckpVOVgv?=
 =?utf-8?Q?mw0tJKf8uONlXk5zItADcxT2zyXXlOP4jDeQWBVANc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a32aad2-08e9-45c7-82fe-08d99a6d70e7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 23:48:29.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpjqoSaCsnwKh33UbJ9LrH4mODiZY192143gISZuExQ8Sg9YESIsUN7Zypcik58u9Xfzs41qMmURd8CsPWuDrPoWrNqPugvhNR4tag9+POo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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

On 10/28/2021 15:42, Matthew Brost wrote:
> Don't set, test for, or clear per-engine reset bits with GuC submission
> as the GuC owns the per engine resets not the i915. Setting, testing
> for, and clearing these bits is causing issues with the hangcheck
> selftest. Rather than change to test to not use these bits, rip the use
> of these bits out from the reset code.
To be clear, there are other tests poking these bits in addition to 
hangcheck. Not sure if they would suffer from the same problems but I 
don't see why they wouldn't.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 91200c43951f..51b56b8e5003 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1367,20 +1367,27 @@ void intel_gt_handle_error(struct intel_gt *gt,
>   	/* Make sure i915_reset_trylock() sees the I915_RESET_BACKOFF */
>   	synchronize_rcu_expedited();
>   
> -	/* Prevent any other reset-engine attempt. */
> -	for_each_engine(engine, gt, tmp) {
> -		while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
> -					&gt->reset.flags))
> -			wait_on_bit(&gt->reset.flags,
> -				    I915_RESET_ENGINE + engine->id,
> -				    TASK_UNINTERRUPTIBLE);
> +	/*
> +	 * Prevent any other reset-engine attempt. We don't do this for GuC
> +	 * submission the GuC owns the per-engine reset, not the i915.
> +	 */
> +	if (!intel_uc_uses_guc_submission(&gt->uc)) {
> +		for_each_engine(engine, gt, tmp) {
> +			while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
> +						&gt->reset.flags))
> +				wait_on_bit(&gt->reset.flags,
> +					    I915_RESET_ENGINE + engine->id,
> +					    TASK_UNINTERRUPTIBLE);
> +		}
>   	}
>   
>   	intel_gt_reset_global(gt, engine_mask, msg);
>   
> -	for_each_engine(engine, gt, tmp)
> -		clear_bit_unlock(I915_RESET_ENGINE + engine->id,
> -				 &gt->reset.flags);
> +	if (!intel_uc_uses_guc_submission(&gt->uc)) {
> +		for_each_engine(engine, gt, tmp)
> +			clear_bit_unlock(I915_RESET_ENGINE + engine->id,
> +					 &gt->reset.flags);
> +	}
>   	clear_bit_unlock(I915_RESET_BACKOFF, &gt->reset.flags);
>   	smp_mb__after_atomic();
>   	wake_up_all(&gt->reset.queue);

