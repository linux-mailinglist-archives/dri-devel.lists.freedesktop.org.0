Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38B42CF69
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792176EBD0;
	Thu, 14 Oct 2021 00:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C16EBD0;
 Thu, 14 Oct 2021 00:06:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="225017447"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="225017447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="441857423"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga006.jf.intel.com with ESMTP; 13 Oct 2021 17:06:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:06:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:06:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:06:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu99T+A756webk6F2jRz8A/+arAahZoULguSB2cIAI0GG05NXU1dumcUBCXOKyb+dqehPoJ0uVmx6a0cH7X9po8c/HiLgyqPf6OX+7VFwj3vAuXcXAuCxSdOGB9EMTASKJbas8A9/5YBKACFxkGQbPoIi8fQhLPzJDel4RMY6H0YkcYbpjSju8hawuZK2Y2MeeZzU6nwkBKd7HiSWzjq688FOVwN6RA6UvNz8t/grIQtorb6jVKB2lQSDRua8eszxwGDbyuTNsSwArxxfNuL1K/ZkGvqlksEbVPgGqV96Ql/QQ42+7yqI9dkyzzp7kO61urtZ6oRWMVBHicm0zPL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7FpHl+pnSdRHKEW5IwMYVF3ldtVOM5NoMRazcT2piU=;
 b=LZrI/cliY9fnv+gpHEIXAaGMYUfSvuAvNmp+raaNodkzB5JSnuWrQgkQgTffR4ZzlLZLPbWVPDzvpgvJxhpSftRgjf0KuULq6BZKyVvYm8P4hL/R6f/B7DBGH0iF5bVs3d72sz63tafg/V4CnKHg0O8mzZLv4TqTsKG7yOf3daDuOtK5iTUbSELGNpkt8TVcu2Iz6ZbDNN5F7RxeosTHw7pbjO4t2U4DDa/fw0euSgKZcnwBiKOoOJbas58xI7m99j5zmOamuZtkuVv4fULvMUiTqZi2JBuOXhRvkEjfbpzApNi/a4LnwzfY+s7/Q8QMGvn/4MQu6AQDH1LDSCZP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7FpHl+pnSdRHKEW5IwMYVF3ldtVOM5NoMRazcT2piU=;
 b=Hsyqxv3hQu4U0sJ+aqky+um6Fhe6Yb1OhIRg95HqkgVNqqdwjIEkbvIsxigGfJQjyF9NaDG57uZv01ni8Q8g4ZuEZ19m28Uq6k3M9bVtIZRXkTpRTTGfX2xvC6VdUUEauIKYLU6Fcejz2G2B4Mv4G3XxfJNrFEjZd92PMohxtKU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5594.namprd11.prod.outlook.com (2603:10b6:510:e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 00:05:38 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:05:38 +0000
Subject: Re: [PATCH 03/25] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <70870182-bf8b-9f94-e6eb-42de3243d035@intel.com>
Date: Wed, 13 Oct 2021 17:05:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0026.namprd03.prod.outlook.com (2603:10b6:303:8f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.26 via Frontend Transport; Thu, 14 Oct 2021 00:05:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e8bd84-6816-49c4-fb4c-08d98ea65a3f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5594:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55940F759F8C942F4AB414AFBDB89@PH0PR11MB5594.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iS01jT38hiyHhHE1M71GH0IjBOlJTE1desAVrnLTY7coF0p7T5lVOPA0e9R0XRFvC9QG4KzSneNO4VA/PBxD/wXeGn4Rrx71Sn2PKQfjmdcwtrl3B6qGEW2q16xTR3kf/8s3bMI7sm0CcwD5dNHtdcxc5W3MPq8xHOBVEJw9OtjPPFyHAZGBNUt9a3wTAjCItMH3QPIBRiz8Jn+bpY8FP6GofNZ1nClbOmtTimioqz8TnCIj+Iso1cjsPrDV1NDTzd6945fWfWCs8t/kcP8cl1w/2Zwj1JTKDSmIVWcHR5HlUohJ14db3CBIX6wk4pya6A1bD37HStVBWW3B0ChvGfGWr3yyJ8CPvcdic/2UK2Z4TSMgalGKb0ZgCDREIdrS+zzIjljLha+wCx9BhTcniemzdmKka90iBwsm3HRrjUrtLy/59qywqkUP8svilPZATL6HgFEuWBOPf+qIxc4De2atNzVU/GYgXTi1mWLyX8pVGTg6kW72K/Cl7x8xJhT+kKAsg8A9/YBeH225BEECg7P8j7jsSnjtw+fBIM0gxzXJvDTzlzRVBoPOMv/ilokosvIzPkD6A3ycmY3lUVl1kqeSbovqelsNMeiMUoVXKzorwy+Kq/GOnveJ/WjVYNsvf6rLefqf71cvbcMZXfOHoCl96OH/RwboOV7tJQJ7yp7wI4D579MkOtsXlHbVSaOg8bfjlobttLFICq3yln7YmC6UBZ7uVXR2TdE+pEvRR/0RjkPNaQ2Td+ycEXQhGqmi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(16576012)(8936002)(316002)(83380400001)(38100700002)(36756003)(508600001)(26005)(66476007)(66556008)(66946007)(53546011)(5660300002)(8676002)(186003)(86362001)(450100002)(6486002)(31686004)(956004)(2616005)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azFic1c5US9kMFVsdFRubDk3T08zdUljZy81alFBbzFmVHNCcGx2ZzZ5YlJG?=
 =?utf-8?B?VGJTeWdEK2JrSkN0Z3BZVWFhUlA4NjYrdnczV2NsME0raHBBeWk1MXArK0Fx?=
 =?utf-8?B?TXp4ZG5HZ1QrM3dmcDNmNHp5VVZnWkRNZDQwWE1ybGR2NVZabnZxVHZibmpx?=
 =?utf-8?B?UzdVSnovc0I5L1NjRHRnWlc2Q3lpSTRCYjEvS3BhTCtvVUF1eWtLaVI0UFpW?=
 =?utf-8?B?Z1hkbkt0WVc5N2VjNTdna2RvNTNUbWdSeEp3RitWNXNOOEt1VFp6SUt1VS9y?=
 =?utf-8?B?cjFTTkFML1I0V3d1NjlVZXdWOHAxekc0VDhnYUM4Mkc4aTJRQVJndkdSRGN2?=
 =?utf-8?B?RUVYSEpBRkV2SElzd0ZHRGxURHJYaTc1NlFaa0ljNVJXSURZSW5jRWFOclhx?=
 =?utf-8?B?ZzhUalpTSHJiWnFvWkRZU3czYUtUYXpXMnJFeGN4TEFla0xhaElGY3ZIMkhO?=
 =?utf-8?B?TW4yd1RWazF3VUFNdkdrUnVEd1FPZGtVVDd5dHJyZVB4dXYxQVI2Z0NuYkk0?=
 =?utf-8?B?Nks0QWFUSzVJQk9TTlRKdlNFUnZaTndtRnVHS01id2lTekVaSmF5MnhvVzRE?=
 =?utf-8?B?Wk43c3VidWhaOEJzN1I4WVBDT3J3a3o1cTUxT01aRFhCYWV5QnR2TDVzMTZP?=
 =?utf-8?B?L1J6bGZGMXI3ZVR1TCs0V2JSblh3SGJsRThsUjJjZ0R1L2M1MWhuZ2NjczFh?=
 =?utf-8?B?SFZyRHd2M1piM01oRFZBN0ZNTllabXNUSk9XcXJ5WTNKL1h1QWQ1T3NyZGRH?=
 =?utf-8?B?MHlJNTFUUzFDdUwyWWJjUllVelhNM1BFWUZqVGJMdjFoa292NnFRMWw3SVNq?=
 =?utf-8?B?QWpvaE5KZElkcTdlcnZWa1RBKzZya3ZQcC9waGlneGFkMU9hMDhhc1pObDJ1?=
 =?utf-8?B?UlNBNzBJdGlpR2IxalQ0MlJ5cmlnMHNpRUFnQW9VMkMzOFhtSkJUVGRTOGty?=
 =?utf-8?B?UnpNYlcyR0M1cWkra3REN2VVMnN1bWxSVlA3YW5BYVQ4MVVLMC9mWWErTVQ0?=
 =?utf-8?B?R25KUTdncFE1MlJhQkNOcVdjWWpaZWpPUXlIVXN6WnBkYVBWQUsyQllFZkVn?=
 =?utf-8?B?dnFvZTFKTnBEYWc3M2h6MXVpVFBuR0hRK2cxTDNMVTJWdnJPeExQR29rVGRJ?=
 =?utf-8?B?YytsQTVXN2NleWdnV2ZLUzVCWG5GQXF2ZU1jT0lMbUtWSVVjV21oNkRaSG93?=
 =?utf-8?B?YWd0Y2lYcVJIL3lXZS9HaldqK1ZCRHR4VWhKM01ySFFtN0VtaGZtN2lxV0Mx?=
 =?utf-8?B?czFaZC9KVTFYNjB1eE9OTHEyT21JVk9GSUdteWh3dFNnR3VzME5YakdpdGlN?=
 =?utf-8?B?dk1JZURjQ3Fya1YzQjNKaDR2bDhxcUpHTDlJbWRpZ1VvR25rS014Z05vc29N?=
 =?utf-8?B?eTlzNzdzckJLTHovTUlDRmM5RFA3K2o4bmRWZmhsbE5PQmkzMG0yOWVUcGVS?=
 =?utf-8?B?NVRaMnlpMXNXWWJBLzlZWXVSVGRhRWR0SVpQajhKOFQ4Wk5xbTRVb2p2QXdh?=
 =?utf-8?B?N1dXZ3hIcEJ0N2FZaVNKTjlKWFYybXZXWld3ckFONllGUmNwNzFKZ2tRSnkw?=
 =?utf-8?B?amZjeTBhKzdXM0xOZ281SDVUOTEyNkJIZ2pLWGtJTks0ekVzdEZCM2RUbGQv?=
 =?utf-8?B?THgvN2cwTGhCS2s5dzlSSFV6cTIyNFJpbFZucEh2UEp1dlFNbDRoVWNKU0xo?=
 =?utf-8?B?Zi82ZHhQcTA0Z0lyZjFSMDhFQ0NVRG5VODk0alZic0hIcTY1Smd1T3lZUkxJ?=
 =?utf-8?Q?6oU6B6ljjTomLmsqR1jO/ceTq2unZ4JTATjsC9n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8bd84-6816-49c4-fb4c-08d98ea65a3f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:05:38.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY0Em4n7jI4cdMsIToGOqz/EK1bPHZVs/J84Y/0WwtsMTA4TB8Bmyt+gMh9PxtS5dzf91XJ+6VXINytIJ/tqILfsanaRiQaKVsCq4uC/ahs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5594
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Taking a PM reference to prevent intel_gt_wait_for_idle from short
> circuiting while any user context has scheduling enabled. Returning GT
> idle when it is not can cause all sorts of issues throughout the stack.
>
> v2:
>   (Daniel Vetter)
>    - Add might_lock annotations to pin / unpin function
> v3:
>   (CI)
>    - Drop intel_engine_pm_might_put from unpin path as an async put is
>      used
> v4:
>   (John Harrison)
>    - Make intel_engine_pm_might_get/put work with GuC virtual engines
>    - Update commit message
> v5:
>    - Update commit message again
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 32 +++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
>   drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
>   5 files changed, 89 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index d008ef8623ce..f98c9f470ba1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   	if (err)
>   		goto err_post_unpin;
>   
> +	intel_engine_pm_might_get(ce->engine);
> +
>   	if (unlikely(intel_context_is_closed(ce))) {
>   		err = -ENOENT;
>   		goto err_unlock;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 6fdeae668e6e..d68675925b79 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -6,9 +6,11 @@
>   #ifndef INTEL_ENGINE_PM_H
>   #define INTEL_ENGINE_PM_H
>   
> +#include "i915_drv.h"
>   #include "i915_request.h"
>   #include "intel_engine_types.h"
>   #include "intel_wakeref.h"
> +#include "intel_gt_pm.h"
>   
>   static inline bool
>   intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
> @@ -31,6 +33,21 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
>   	return intel_wakeref_get_if_active(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine)) {
> +		intel_wakeref_might_get(&engine->wakeref);
> +	} else {
> +		struct intel_gt *gt = engine->gt;
> +		struct intel_engine_cs *tengine;
> +		intel_engine_mask_t tmp, mask = engine->mask;
> +
> +		for_each_engine_masked(tengine, gt, mask, tmp)
> +			intel_wakeref_might_get(&tengine->wakeref);
> +	}
> +	intel_gt_pm_might_get(engine->gt);
> +}
> +
>   static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_put(&engine->wakeref);
> @@ -52,6 +69,21 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
>   	intel_wakeref_unlock_wait(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine)) {
> +		intel_wakeref_might_put(&engine->wakeref);
> +	} else {
> +		struct intel_gt *gt = engine->gt;
> +		struct intel_engine_cs *tengine;
> +		intel_engine_mask_t tmp, mask = engine->mask;
> +
> +		for_each_engine_masked(tengine, gt, mask, tmp)
> +			intel_wakeref_might_put(&tengine->wakeref);
> +	}
> +	intel_gt_pm_might_put(engine->gt);
> +}
> +
>   static inline struct i915_request *
>   intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 05de6c1af25b..bc898df7a48c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
>   	return intel_wakeref_get_if_active(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_get(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_get(&gt->wakeref);
> +}
> +
>   static inline void intel_gt_pm_put(struct intel_gt *gt)
>   {
>   	intel_wakeref_put(&gt->wakeref);
> @@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_put(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_put(&gt->wakeref);
> +}
> +
>   #define with_intel_gt_pm(gt, tmp) \
>   	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>   	     intel_gt_pm_put(gt), tmp = 0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d2ce47b5541e..51d3963cebbf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1571,7 +1571,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
>   
>   static int guc_context_pin(struct intel_context *ce, void *vaddr)
>   {
> -	return __guc_context_pin(ce, ce->engine, vaddr);
> +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
> +
> +	if (likely(!ret && !intel_context_is_barrier(ce)))
> +		intel_engine_pm_get(ce->engine);
> +
> +	return ret;
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1580,6 +1585,9 @@ static void guc_context_unpin(struct intel_context *ce)
>   
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
> +
> +	if (likely(!intel_context_is_barrier(ce)))
> +		intel_engine_pm_put_async(ce->engine);
>   }
>   
>   static void guc_context_post_unpin(struct intel_context *ce)
> @@ -2341,8 +2349,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
>   static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +	int ret = __guc_context_pin(ce, engine, vaddr);
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +
> +	if (likely(!ret))
> +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +			intel_engine_pm_get(engine);
>   
> -	return __guc_context_pin(ce, engine, vaddr);
> +	return ret;
> +}
> +
> +static void guc_virtual_context_unpin(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_barrier(ce));
> +
> +	unpin_guc_id(guc, ce);
> +	lrc_unpin(ce);
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put_async(engine);
>   }
>   
>   static void guc_virtual_context_enter(struct intel_context *ce)
> @@ -2379,7 +2409,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.pre_pin = guc_virtual_context_pre_pin,
>   	.pin = guc_virtual_context_pin,
> -	.unpin = guc_context_unpin,
> +	.unpin = guc_virtual_context_unpin,
>   	.post_unpin = guc_context_post_unpin,
>   
>   	.ban = guc_context_ban,
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index 545c8f277c46..4f4c2e15e736 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -123,6 +123,12 @@ enum {
>   	__INTEL_WAKEREF_PUT_LAST_BIT__
>   };
>   
> +static inline void
> +intel_wakeref_might_get(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_put_flags: Release the wakeref
>    * @wf: the wakeref
> @@ -170,6 +176,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
>   			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
>   }
>   
> +static inline void
> +intel_wakeref_might_put(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_lock: Lock the wakeref (mutex)
>    * @wf: the wakeref

