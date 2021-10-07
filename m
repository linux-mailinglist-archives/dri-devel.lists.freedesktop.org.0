Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2505142618D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 03:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150036E05A;
	Fri,  8 Oct 2021 01:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8FBD6E05A;
 Fri,  8 Oct 2021 01:06:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249647585"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="249647585"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 11:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="657486386"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 07 Oct 2021 11:15:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 11:15:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 11:15:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 11:15:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 11:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grzoUDnXguAsdfCThxp6PuDGNXzj0jg1GMOV8+UzvfIqlc5jKdKS2BlNdVS6p7enCUbBl2o0ipkCwDqzW3UjahLZFrVChT1XR7WIacw2JztbRo5TUcAG2NzZ8hoz23Kg+IFOcFicP4vFLtL86o68/YXctK1hd14UOiw25/KWBQZN/ea71PRr2NGKNBIj9IyxRkkrpZ0QrHjG3BnrKwkyfoLU5D/F0tkmb+PCdeJVsC+bSh2uxpWNMLDZGDwezsmP/m398boRH+gcZs+olsHMfLpOtiUcy0qaRyWE8/UhzlY25bd9QhL1usztWr+iyzlREidQ9KHSQ7ugOvxwefFTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGZOA0huCX6HWXETXrQgjLI86ED1CCHS4UBVeMoSl3Y=;
 b=iPKfOq4IJxlB68zg2QiW7Ti94+04rnD7i6JnRqgAdwhh7Tc8KkvGE+jDxSJJPElehoLlQdZh6FuJD9D/flZ5TcfcpUvpebb64HtPGw0N9q48NfLTVcuMTAoPuSIR8T2HIo5JJCWIj/7WYPaI2/6JH1K4HIdiTibD7khClDflEjJ/rw+kuuPKoRn5EdiaK/JK0SNf2fKAFAmM3BJiSpGmbyUXmaCrmJE/3FHH6pS5XcuxErF0Luht9ckLBkmIo6t/qjXKnn73j721o6FnFBwGukCX5P3Irh1v0qZT93dRRitPVjYGpkjLc1OSzJ+aj9ui+8UHMiABFIBZmFnw3i029g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGZOA0huCX6HWXETXrQgjLI86ED1CCHS4UBVeMoSl3Y=;
 b=qx8XqlqlthWGVX9UW5aQ7JOvZMwXSuBv2jIWm8y1KrbQQ7/iXppVp5WheuiowBYWDI7u4ZC7pjFeDXml5k4kAL27VDLjnNsmB8am8SYckJHX632RkBx4qFLbEaDcT3qkybrqmhuHoH+9Ja+3h7+hL0KYLVXrQprC7QKzfXlFk88=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5673.namprd11.prod.outlook.com (2603:10b6:510:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 18:15:54 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 18:15:54 +0000
Subject: Re: [PATCH 03/26] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-4-matthew.brost@intel.com>
 <a2d5377a-ec8e-40ec-d0cf-c91aa51bba48@intel.com>
 <20211007151947.GA27846@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <6b47737d-9708-1055-197a-de9609ca5481@intel.com>
Date: Thu, 7 Oct 2021 11:15:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211007151947.GA27846@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 SJ0PR13CA0079.namprd13.prod.outlook.com (2603:10b6:a03:2c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Thu, 7 Oct 2021 18:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a79ca8c-c3ef-4e05-e1f1-08d989be808f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5673:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56738C8C959BE22F21FAE395BDB19@PH0PR11MB5673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQaXye1gdCwAfn8zaonS00TJ6CSj1hbwqMDyBPlBMdY2qGc82nIjyXzOpg9WktcA2lEJbAbuJFwH4K+i2Pgqc5aN5Sm7jXuhBhx0Pz9ZChFGPXGcu33tiHs1Bjv+k3J+lDnhgBKJTLcN6gwZtK+VvlJfHG2pw0g4MIIYK+9rLMcyNL1/BEJBB1FFUFyUk5Nax3+4TqnXCbYsLQUTimOPDLr5u+awmrWB+fTuAguMYbwITxBO6kKIMcX3jMzFAlB7gzv/G7qp0pEyC8xpoQnOTQ1BVAXh4ND/abF88DN53RrQbyBxQxyMMTPf4Sf+nunBLyHnjO+1FKoV13C1+cS3iNaRc6aC12W2kUFOrGiqgiFyfUgFPR4Q9cBngoIAyU5FLpMgepNz7i98lcEGBQpmCEzfT6dgCBh40Sb+P9XN9Ilq0GSng82JAhd0ik2siFdndHlKAU0TwOjlauDlhbRIZgTMifp8E/0Cfq1nKBWqA9QHB9z86lEjo5a/Ya6mCh8uZdU0E0vuBeHIDACViNXGT2tFf606zs2s5XfjmK/UE/91lvarbPgShoicBBUMvpwF5vy/pox0+7Mbfhm7KMtUG6hzomXbXnMv+mRtMpUcdRgwvVqaLpdpEPBNFUrWrSL9sPLgUQrqVIPeIZPDCC/UyYp6F2rIfGNFDQlSWdx6E1Fn4CPDTgLiGmb5Vn36C0O/7NLPN0IUrd5ytgg5jtpVbpOpocwwmLMOdziGAhGOksvggPiQyp6X0o3EoUWcPTz1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(450100002)(8676002)(31686004)(107886003)(66556008)(66476007)(26005)(66946007)(186003)(6486002)(6862004)(8936002)(86362001)(6666004)(31696002)(2906002)(83380400001)(956004)(508600001)(37006003)(16576012)(316002)(36756003)(5660300002)(38100700002)(53546011)(6636002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZrREM1UTdpUUREL2RPL1FFSWNhd3FTcGhwaEtVQnRCYmNYUUJwS3g1aW9o?=
 =?utf-8?B?NFV4cGRsbll6SStNZ2E2Q3ZnbVBDcjJqV3NXcG1vbFU2OTRLTFk1bkxFNEo3?=
 =?utf-8?B?Tkt4dVY2bHdta0xPRE1TbTR1YkJueGl4RjhNWS9zdWlzNG42OU42cHlvZlEr?=
 =?utf-8?B?cUdubU94T0ZEWWxtYzZYSUFVWmVrSEovK1hCbmNxSFE4U1FRYVdlSTdRR3NE?=
 =?utf-8?B?NVozVEVMR3Yzai9YRGJuSjVsNmxWeUdmaGdBTFRIanBDYXZkemw1L3RJMWkx?=
 =?utf-8?B?TEJOY0V3SzBGZFI1N2RQTTFZUDk5WEZqMS8rL2FMOVZGVUZub2ZReks4L2R0?=
 =?utf-8?B?OXpxWTZhdnRXbDFvN1VWQ3J4ZlRKaTllZ2pCS3hMa2MweUZqN2dBVHlNMnVk?=
 =?utf-8?B?WDY1cWVYMCtua2dpM3pBOHljYkEwODZ0RmZlc2p5ZStGdlo4T1A4WHhkZCtO?=
 =?utf-8?B?V25LRlRQNSs5b1lyRE9OQkZORUZranoxS3VrOVpZQjE1VTlmUGdqQ2Z5d3J0?=
 =?utf-8?B?UnU2SFBieDVWNTllWTF4eWhPRGVGWTY3a0lua2FLS2dDdE00ZmNYZDJNUGtU?=
 =?utf-8?B?bnF0S0JFNGphNERRY01PQkJnM1AyeitFaFZwR3lNQTFTM01QV04yUU9yM0ZZ?=
 =?utf-8?B?eHZReFVtRjVtckVlS09FTlRvRWNDUFZXK2lia2hmVjd6M1QzNWM4Uy9zaDBB?=
 =?utf-8?B?T3ZIejlxd2xLOEI5elA5RmJTbGo1WHlQMDNuZmVaUjJnQTUxTWFQemcrN0hn?=
 =?utf-8?B?QVpVSVpsNjZiT1hjc1VXZHZJZVc5OFRycXVpOHVqWUptNHdpU3FxaGtoOG9i?=
 =?utf-8?B?ODRsbW4vTld2U3ZoRXlhUnJZTUxhWEszQ1J2SGhQdWxrL0Q5dnFKSFJITzZs?=
 =?utf-8?B?ZWZkbDZEdk5sUk10c052WHh6Ykd4bzFQT1NmYU4vVmR3R1VHK3ZkYjhOY0Qx?=
 =?utf-8?B?MytsUS9DWXQrakRvUjJvZ09jT0tlRUpCWU9KQzRrdHk1MTNrb3k4Znk1Umx4?=
 =?utf-8?B?T1ZQMktHdzhET1k0T3RseUxlRjVvUmZaUHhZY0drRU9id3IrYmZWK0x2eXdE?=
 =?utf-8?B?RCsvM1pocmlGWHBUaC9UR05IRGhjTDlkdTdaMmkrb0c1NDZWcXdzaFRkOVJm?=
 =?utf-8?B?T2dVc1NVUVVxS2g5NDJ5VmNPVElGb1BIcFpndUpnZktMOXJVNHE2MlBjVVVz?=
 =?utf-8?B?YW8rTmYxZXBuS3g3YWpNbUloc2NzSkNHUmVDTWZicFBUL283WXgvU3JGRE4x?=
 =?utf-8?B?RnUvcy94dHczcUswbWZlQWVBdjZ6NVM1dGV4cGQ2dzhjRW1nVU4zR0s1V21C?=
 =?utf-8?B?UkpVK2FpOWF5MXhuTUtIeHVLRE1sKzY4QWxpNTJXbHQwQUI2dG5WUEtCSmNk?=
 =?utf-8?B?YkpSVlhSTWREYy8zMVhFRHA3V2VOWGVWaisyNitzWFB2UkJWSm8vRCtDVkxa?=
 =?utf-8?B?SGw1NFBhdWc3SGhZT3ZtWDdXblIzcVowYk5hZm50V2t5cVRXZ25jL0lLOUhX?=
 =?utf-8?B?YTZvNmZPVklqS21UeExoRWZ5TjV2RHpLcmQzelVzcUZRdDd6aWFtbWlBdTRL?=
 =?utf-8?B?Z3hZaDJvZ3dKczdhU2dqaEQvN2VMWTBqa2xSc3hoSnY4TU9rNzdNTk9mY2ZM?=
 =?utf-8?B?K1dhUXdDaTRLWlJJd1FKNnlYaWNsN1BLTEhZN3Z0cWxNYStJTDh3dGNWVjRi?=
 =?utf-8?B?c3ZIWFZITTVHekxNYW1EWUxVOW9XZlJvenloWmRiUFFjT1djQ0loOFY3V1Qx?=
 =?utf-8?Q?kXOweRFtxadNAfHKrx/SGQPLvE1k3Xc5nJtUsV8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a79ca8c-c3ef-4e05-e1f1-08d989be808f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 18:15:54.4425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMck6snzHFcbTv1clT2IZQKNxdhZ8qYZmhjfkBXvi8l6Q/UoVanDVCsWi95P0UNQcln2NMpYYb0ILRgR92z7tFK2geJm4M0sOg64ouVDB0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5673
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

On 10/7/2021 08:19, Matthew Brost wrote:
> On Wed, Oct 06, 2021 at 08:45:42PM -0700, John Harrison wrote:
>> On 10/4/2021 15:06, Matthew Brost wrote:
>>> Taking a PM reference to prevent intel_gt_wait_for_idle from short
>>> circuiting while a scheduling of user context could be enabled.
>> I'm not sure what 'while a scheduling of user context could be enabled'
>> means.
>>
> Not really sure how this isn't clear.
>
> It means if a user context has scheduling enabled this function cannot
> short circuit returning idle.
>
> Matt
Okay. The 'a scheduling' was throwing me off. And I was reading 'could 
be enabled' as saying something that might happen in the future. English 
is great at being ambiguous ;). Maybe 'while any user context has 
scheduling enabled' would be simpler?

John.

>   
>> John.
>>
>>> Returning GT idle when it is not can cause all sorts of issues
>>> throughout the stack.
>>>
>>> v2:
>>>    (Daniel Vetter)
>>>     - Add might_lock annotations to pin / unpin function
>>> v3:
>>>    (CI)
>>>     - Drop intel_engine_pm_might_put from unpin path as an async put is
>>>       used
>>> v4:
>>>    (John Harrison)
>>>     - Make intel_engine_pm_might_get/put work with GuC virtual engines
>>>     - Update commit message
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
>>>    drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 32 +++++++++++++++++
>>>    drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
>>>    drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
>>>    5 files changed, 89 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>> index 1076066f41e0..f601323b939f 100644
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
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> index 6fdeae668e6e..d68675925b79 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>>> @@ -6,9 +6,11 @@
>>>    #ifndef INTEL_ENGINE_PM_H
>>>    #define INTEL_ENGINE_PM_H
>>> +#include "i915_drv.h"
>>>    #include "i915_request.h"
>>>    #include "intel_engine_types.h"
>>>    #include "intel_wakeref.h"
>>> +#include "intel_gt_pm.h"
>>>    static inline bool
>>>    intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
>>> @@ -31,6 +33,21 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
>>>    	return intel_wakeref_get_if_active(&engine->wakeref);
>>>    }
>>> +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
>>> +{
>>> +	if (!intel_engine_is_virtual(engine)) {
>>> +		intel_wakeref_might_get(&engine->wakeref);
>>> +	} else {
>>> +		struct intel_gt *gt = engine->gt;
>>> +		struct intel_engine_cs *tengine;
>>> +		intel_engine_mask_t tmp, mask = engine->mask;
>>> +
>>> +		for_each_engine_masked(tengine, gt, mask, tmp)
>>> +			intel_wakeref_might_get(&tengine->wakeref);
>>> +	}
>>> +	intel_gt_pm_might_get(engine->gt);
>>> +}
>>> +
>>>    static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
>>>    {
>>>    	intel_wakeref_put(&engine->wakeref);
>>> @@ -52,6 +69,21 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
>>>    	intel_wakeref_unlock_wait(&engine->wakeref);
>>>    }
>>> +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
>>> +{
>>> +	if (!intel_engine_is_virtual(engine)) {
>>> +		intel_wakeref_might_put(&engine->wakeref);
>>> +	} else {
>>> +		struct intel_gt *gt = engine->gt;
>>> +		struct intel_engine_cs *tengine;
>>> +		intel_engine_mask_t tmp, mask = engine->mask;
>>> +
>>> +		for_each_engine_masked(tengine, gt, mask, tmp)
>>> +			intel_wakeref_might_put(&tengine->wakeref);
>>> +	}
>>> +	intel_gt_pm_might_put(engine->gt);
>>> +}
>>> +
>>>    static inline struct i915_request *
>>>    intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>>>    {
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
>>> index 05de6c1af25b..bc898df7a48c 100644
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
>>> index 17da2fea1bff..8b82da50c2bc 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1571,7 +1571,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
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
>>> @@ -1580,6 +1585,9 @@ static void guc_context_unpin(struct intel_context *ce)
>>>    	unpin_guc_id(guc, ce);
>>>    	lrc_unpin(ce);
>>> +
>>> +	if (likely(!intel_context_is_barrier(ce)))
>>> +		intel_engine_pm_put_async(ce->engine);
>>>    }
>>>    static void guc_context_post_unpin(struct intel_context *ce)
>>> @@ -2341,8 +2349,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
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
>>> @@ -2379,7 +2409,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>>>    	.pre_pin = guc_virtual_context_pre_pin,
>>>    	.pin = guc_virtual_context_pin,
>>> -	.unpin = guc_context_unpin,
>>> +	.unpin = guc_virtual_context_unpin,
>>>    	.post_unpin = guc_context_post_unpin,
>>>    	.ban = guc_context_ban,
>>> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
>>> index 545c8f277c46..4f4c2e15e736 100644
>>> --- a/drivers/gpu/drm/i915/intel_wakeref.h
>>> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
>>> @@ -123,6 +123,12 @@ enum {
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
>>> @@ -170,6 +176,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
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

