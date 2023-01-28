Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B467F3B3
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB3A10E2E8;
	Sat, 28 Jan 2023 01:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C839810E2E2;
 Sat, 28 Jan 2023 01:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674869203; x=1706405203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2mHSGeZoJ/82PcmAA3qwr/5Rm9Ks0dhlaIfdnhJ0vdc=;
 b=CdwMx6GMXRxZxpuE8QhIK0JnK+6wJdzvg8c1S/D7FWof+l3xF9ciOC3p
 oSR2d3Re0fe2uvcW+HydFzPuTv6GcfTdUTo0rIr5YmmJLY2ouWP0G6T2m
 DKMDYg6iEMyx9gjZsNv2NAyaivnjz6SbylC+kphwd9u5PVFf8S0yFO+nd
 QO5FIcycWmyXnwWFqZtsQQNN5FjnMU74GUZmsQKVC/yDlHuZcg2P1vJYk
 d0u5T5ydvuEXMHeGlfpR/kgyIcH0Yb15Xf9GBi4kV7pfPWtewAFSH0bP7
 V88sLbnZZrnblvz8SsnX5zehdJhRUtFurCPznDdIDx9++MCtivR9UmUH7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="327261022"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="327261022"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="613392132"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="613392132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 27 Jan 2023 17:26:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:26:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:26:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:26:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:26:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvNpXPqJcaHL44LxKCroRXz3K5Bnr73EEb4whdGE4k1AwsLC53bE3F8ZhWDMRjdmgl0OkixaBqGhMKHSVIXhvq45LwNyRQC+dXrgvbax1ATso7TpUBGLC0M9ab73mG8O+ogCaWGgZuWEpcXi6G+AhDnOR15g4MR2JrbgZM2Ygxw4yyS1kRU45x91Kh8GBATaEk2aL6Fu7zqJvDnGW1c8nL78d2vkzCSZJLRj8lZnyDaepC1ZnSZ03o+o0jMa8kmqP+GF4Fkl5smbTHqHLm1sm5uvsNkhzVgIYwSgJkSXdqH8eX3lRW0XF/PpmC97tJtpPZSKdTlQzaimotwXaNSeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBr8bL4uuMCZXytHZkHMEXPPmhKqQNTeAYbpPJUS4AE=;
 b=T9blwg4jvpDMpjjBz/cU3/zLeWrNpqwdsbB7C0iQeushG7NJ/k6O6vhZicqNhH4ZM/sns0JiJdmx/lEjti51aYaJ1BW1hOBb0TCbyp5CXorAdFRUGuE+0vvq0rLlFmidl6n7ZPQy19oTQEtxKlDx+VZ6cQqzdE58QRoe6ypKQskXY2zjZ2sgS6vKj7EgeXkPCqnGIpb9P/Nwuml5VeziELlFBdGugM9pewLiPTgkY6PWNA66K9SpYpo9gHASjY0nM2wW1dUEUbF9CXbHS5mOKItYT1k+T/s4izlw74z7JcQAaKfrFArrMHWLzKU1qx4eU4fE5wpSZL94Q6dk69glWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Sat, 28 Jan
 2023 01:26:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:26:40 +0000
Message-ID: <32d4e1df-8784-bf05-8cbe-817d2fcbdb11@intel.com>
Date: Fri, 27 Jan 2023 17:26:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 8/8] drm/i915/guc: Update GT/GuC messages
 in intel_uc.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-9-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS0PR11MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed6313d-fb98-4887-650e-08db00ceb490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAK0+TCZvFhCd0hDFCzksXgjBLMpfKAD3DGeK8rMxCpKL+YzB4VI1XMH5/xCzA25lAngsm9Zng/f2SknWsFky04o1SHKHJMPK0yg5HAPmBemPYI+a7RVX6p3wXjkxj3IOKijmk9Y+gm0oRr7QBM0owyHnnh/aHTE8VZ/Ayenljag2pEIRTpk5qEMlVYlk4fkzWxGukEifBQ3QEl6txDxJftN58rb+1AhMZngR6SuVOjwJBvUr6gzzSOfOrOKqhglIpVw3vm8PL1y0f99RQ5pmtLxvlZSFWbENyhGxHG3PfaujXPnbp6HxKo4WVf5HRUgKIZCatCWQMvjSHxrYtT6zzuR0iT9/vezSYcq3vYTRjq5Rw0AYse0pgBYK1zn0R0OwxRM1rr3MoJg/9TQlyKJ+fDPnoKBFmbKn/2sTbB9+cTQq6as1n0t9zBqsyX8bkAZ1PvF6wAynUL5zf8AWaX480C4c2NjgZhtx+LS3dgzRaT+8+dXZHWjdXaLhQdEpfHGRDss9mCWRo0VqYqm4MPnDsHhSCtVmbHDZLDOYzJEK4sbcLoe1fl0mYGmLNyRuhO6hYaHOna4x6zNseck7ZLrkSNOvSilingDb82ZZmXNg1zjHflu7nA3kX3zA0YhsYcs279Hdv7ZNHyokeK4X7NvlWKVXILvR1UtDufz/NHTDTTK+PX46ieClWQEMVxZ3rjaWUV7rp+dAWwfT7VQQ/W06VnV1ySeGz0O0O2qu0BCmXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199018)(5660300002)(15650500001)(6512007)(66476007)(2906002)(186003)(66556008)(66946007)(4326008)(8936002)(41300700001)(31686004)(450100002)(8676002)(83380400001)(478600001)(6666004)(53546011)(6506007)(2616005)(26005)(6486002)(316002)(38100700002)(31696002)(82960400001)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExLT2tReDNBbjg4endYdWFrSVdNNFFCVEhQRklqWXpOVWR5dTlWVkF0RlE2?=
 =?utf-8?B?NzFEZG1UR2duMUREYlRueE9id3hHL2tUb3lYb2tieVJzNGZWTll3NzJGZGpM?=
 =?utf-8?B?NGlnbTByN1o1L2lSclVaTFFrWlpKMDZRYXRxTEh2MnRBT01RcHVqZWVmV1Nt?=
 =?utf-8?B?M3dJVlg1MTBTRkhjMW5WNDNLc1FUNGVRVGg4cTVSemFGd05SVWdkMUYzTlE0?=
 =?utf-8?B?VHZLR2dIRy9EeUIyWnJHdkV0bzI0Qm0vZG56aUhuaUo0T21CNy8xeEpTdkxX?=
 =?utf-8?B?elo3VHhpYnY1RU9hejFodzRqNlNXbDIyeUtBYkZpY3k5YTFzalBTaTRiOWlj?=
 =?utf-8?B?WVAyOWFiY1pFNW5VcmFkcHlITGYzcDVOejNCaHpha1VPcm9yUG1yL2FnWmhz?=
 =?utf-8?B?VFVZSUlFMkhsaWFHajRyalR4clNHN3Q1dko0VStRd2FHcFhqN0VzQlZxNzhK?=
 =?utf-8?B?Y2toTi9wTzVGWkZ1OGZVV0dhK085WFQ4ZEhhOFZoeHQrOVpZSFRDUTRFWCth?=
 =?utf-8?B?M0VoTzJ3ZUVrU0pWNXVpckZ3QzlzMC9vVTcwWTNaQTUyK05LUnJhbjBiSE4w?=
 =?utf-8?B?U2Q4ODdkOFRmcXdxeEx3Wmg3cnlkVnlnbDR2T1R3UFJOTzVsaFpaeTV4T1pM?=
 =?utf-8?B?U212NnN1TkxOeVp6b3MrcFMrV25rK1BCbCt3WHRPZmI0NjV5SkMrd2o1SHRL?=
 =?utf-8?B?OWZFVCtyQTdVV2s3azhzeUR1TGlRSWxtbWJWcTNWdmdGVWdDVDcxMVdHM1BM?=
 =?utf-8?B?aU5GeENvY0dRazlOa0crKy9DYmsxQTkrZmZuNkp4Z3owbytOYmp2RDJxZmNy?=
 =?utf-8?B?QktzQnpOMGpWVTNTcXllZ0Y0dGxZcGkxb05oSW1iL0grdkt2QmpoTEo4TmJG?=
 =?utf-8?B?cWFqelF5dnR4aytud1dDOXQ0SmFXbTJoQjR4Nmw2WXR6d1JySnRYdXQvekJo?=
 =?utf-8?B?dFhWOVdQWXpYTlA4R25LVDg3ZXI3bnMvdHl6MDFsbVZ4ZVpVWk9XY0FYZWE1?=
 =?utf-8?B?WFdRbWdLZXk2ODdJS3AxSlNoNTlHUzVuUlBBZ0djaERLcUg4alRSN0hXckJT?=
 =?utf-8?B?MkNTQThiZG5PYktmWXZFNDRNdjF3RjBoQUswNzV3Mk9MeVp0ZmdqSEhxdkJI?=
 =?utf-8?B?eWxpZ01yaldXVkZXbXF3YW9aaDNrZG9NOEdlRzJpRmdYSEpFY2hkTG1CQ09t?=
 =?utf-8?B?aTN5MERyUnJoM2pJdUM4V1FRNCtOVnpHK2EweTB5VTY5d2RhMysxT2pHTnFQ?=
 =?utf-8?B?MzE1a1labkhOcDBFNTBqQnZWNmZyR3BWMjBHUVFYN2hnbW0yMEZWNUdydHJK?=
 =?utf-8?B?TnczTWtoSXVNZmhOV3I5eGtXNUw0Rng0QTZNeGdqRDY0K3NITFRqTUIzSUdQ?=
 =?utf-8?B?alNUeHhEdFVkTjg5TDVzTkhyY1lVeW1iRmFvWktZd2RsSmRjaFhsQmtxZzE1?=
 =?utf-8?B?TlpOQy9ZZ2gveXJlaTJ2VlA5UU5hbHBZeWZvSGVCYXlNSTFHdVdOOUUwTytW?=
 =?utf-8?B?OGsrMXdteXFlTUY4V2JZbi81ekR2eFhwMzRDQTE4NjBnQU5FK3hEV2w1M2Nw?=
 =?utf-8?B?R3gwREpOVjdJOHhvTThFcEoyUjFxRjkwZ0lOZEdobUI4b3NBeEw5TCsrN1hD?=
 =?utf-8?B?SnVaYnJqczU1eWRXakRub213OTVYUll5YzBlZjF4MmR1WGw5bHBCK2ZFZ1BJ?=
 =?utf-8?B?WHQzamxEYXJVUWdCdmd6VGd2OThxODF4Vm5oUElGTWJQV0RuY0IybVhmRmY5?=
 =?utf-8?B?SDBkMG9uNEROLzdkdkd1dURPcitOVDF3eTFtcG0weEhKSmM4QzJJZHB5c0VB?=
 =?utf-8?B?RWtJZUdTOUNQeUx0QUZlUFQyeVQ1OEFHRnFHZ1ZQVmltUC9YNEJTRDFRSVlz?=
 =?utf-8?B?L2srSDR0NlQrRTFLMDZVWXlkaWhrTHF2eEVtWTVnNlFEd0pWWmFwU01LclVo?=
 =?utf-8?B?RFo5UGFXdnNFSkJyQ0ZXMEZnUVUyL0Q2NC90SG5QUWhxc2pMN3JCVTRWblRC?=
 =?utf-8?B?ZHd5elBqN2dDQTh5eEQ5VUJiV092VHNBanVKak0xczY5VlZDeWxzdDFqdWxK?=
 =?utf-8?B?YTZhZEloZUdYUytzMi92RFEvMHJ2eWFNVEZ4d3ZST21jd3IxZFJCU0d3UVgy?=
 =?utf-8?B?emxQY2ZrY3VWeVZGT2JhMCtYTWJvSVFnN3IrY3VXcFc5UzNpZVU5ajJYeU00?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed6313d-fb98-4887-650e-08db00ceb490
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:26:39.9119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMAxoxaJE8Dj0Tq4Ttb8kCYcjkfcaAhZBOsHdWy9RvdOOalCsyNaZj3XblLYhMdk62hazoyD6/KVDhXlS3CAcRt8Lw+IpAXOKaEs/6flqxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2023 09:05, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> v2: pass gt to print_fw_ver
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 80 +++++++++++++--------------
>   1 file changed, 39 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 9a8a1abf71d7..a750966ddcab 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -6,11 +6,13 @@
>   #include <linux/string_helpers.h>
>   
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>   #include "gt/intel_reset.h"
>   #include "intel_gsc_fw.h"
>   #include "intel_gsc_uc.h"
>   #include "intel_guc.h"
>   #include "intel_guc_ads.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_submission.h"
>   #include "gt/intel_rps.h"
>   #include "intel_uc.h"
> @@ -67,14 +69,14 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
>   
>   	ret = intel_reset_guc(gt);
>   	if (ret) {
> -		DRM_ERROR("Failed to reset GuC, ret = %d\n", ret);
> +		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
>   		return ret;
>   	}
>   
>   	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
> -	WARN(!(guc_status & GS_MIA_IN_RESET),
> -	     "GuC status: 0x%x, MIA core expected to be in reset\n",
> -	     guc_status);
> +	gt_WARN(gt, !(guc_status & GS_MIA_IN_RESET),
> +		"GuC status: 0x%x, MIA core expected to be in reset\n",
> +		guc_status);
>   
>   	return ret;
>   }
> @@ -252,15 +254,13 @@ static int guc_enable_communication(struct intel_guc *guc)
>   	intel_guc_ct_event_handler(&guc->ct);
>   	spin_unlock_irq(gt->irq_lock);
>   
> -	drm_dbg(&i915->drm, "GuC communication enabled\n");
> +	guc_dbg(guc, "communication enabled\n");
>   
>   	return 0;
>   }
>   
>   static void guc_disable_communication(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> -
>   	/*
>   	 * Events generated during or after CT disable are logged by guc in
>   	 * via mmio. Make sure the register is clear before disabling CT since
> @@ -280,11 +280,12 @@ static void guc_disable_communication(struct intel_guc *guc)
>   	 */
>   	guc_get_mmio_msg(guc);
>   
> -	drm_dbg(&i915->drm, "GuC communication disabled\n");
> +	guc_dbg(guc, "communication disabled\n");
>   }
>   
>   static void __uc_fetch_firmwares(struct intel_uc *uc)
>   {
> +	struct intel_gt *gt = uc_to_gt(uc);
>   	int err;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> @@ -293,15 +294,13 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
>   	if (err) {
>   		/* Make sure we transition out of transient "SELECTED" state */
>   		if (intel_uc_wants_huc(uc)) {
> -			drm_dbg(&uc_to_gt(uc)->i915->drm,
> -				"Failed to fetch GuC: %d disabling HuC\n", err);
> +			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling HuC\n", ERR_PTR(err));
>   			intel_uc_fw_change_status(&uc->huc.fw,
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
>   
>   		if (intel_uc_wants_gsc_uc(uc)) {
> -			drm_dbg(&uc_to_gt(uc)->i915->drm,
> -				"Failed to fetch GuC: %d disabling GSC\n", err);
> +			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling GSC\n", ERR_PTR(err));
>   			intel_uc_fw_change_status(&uc->gsc.fw,
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
> @@ -382,7 +381,7 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   	int err;
>   
>   	if (unlikely(!base || !size)) {
> -		i915_probe_error(gt->i915, "Unsuccessful WOPCM partitioning\n");
> +		gt_probe_error(gt, "Unsuccessful WOPCM partitioning\n");
>   		return -E2BIG;
>   	}
>   
> @@ -413,13 +412,13 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   	return 0;
>   
>   err_out:
> -	i915_probe_error(gt->i915, "Failed to init uC WOPCM registers!\n");
> -	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> -			 i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
> -			 intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
> -	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> -			 i915_mmio_reg_offset(GUC_WOPCM_SIZE),
> -			 intel_uncore_read(uncore, GUC_WOPCM_SIZE));
> +	gt_probe_error(gt, "Failed to init uC WOPCM registers!\n");
> +	gt_probe_error(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> +		       i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
> +		       intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
> +	gt_probe_error(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> +		       i915_mmio_reg_offset(GUC_WOPCM_SIZE),
> +		       intel_uncore_read(uncore, GUC_WOPCM_SIZE));
>   
>   	return err;
>   }
> @@ -449,20 +448,19 @@ static int __uc_check_hw(struct intel_uc *uc)
>   	return 0;
>   }
>   
> -static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
> +static void print_fw_ver(struct intel_gt *gt, struct intel_uc_fw *fw)
>   {
> -	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> -
> -	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
> -		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> -		 fw->file_selected.ver.major,
> -		 fw->file_selected.ver.minor,
> -		 fw->file_selected.ver.patch);
> +	gt_info(gt, "%s firmware %s version %u.%u.%u\n",
> +		intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> +		fw->file_selected.ver.major,
> +		fw->file_selected.ver.minor,
> +		fw->file_selected.ver.patch);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
>   {
> -	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> +	struct intel_gt *gt = uc_to_gt(uc);
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_guc *guc = &uc->guc;
>   	struct intel_huc *huc = &uc->huc;
>   	int ret, attempts;
> @@ -470,10 +468,10 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	GEM_BUG_ON(!intel_uc_supports_guc(uc));
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>   
> -	print_fw_ver(uc, &guc->fw);
> +	print_fw_ver(gt, &guc->fw);
>   
>   	if (intel_uc_uses_huc(uc))
> -		print_fw_ver(uc, &huc->fw);
> +		print_fw_ver(gt, &huc->fw);
>   
>   	if (!intel_uc_fw_is_loadable(&guc->fw)) {
>   		ret = __uc_check_hw(uc) ||
> @@ -514,8 +512,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   		if (ret == 0)
>   			break;
>   
> -		DRM_DEBUG_DRIVER("GuC fw load failed: %d; will reset and "
> -				 "retry %d more time(s)\n", ret, attempts);
> +		gt_dbg(gt, "GuC fw load failed (%pe) will reset and retry %d more time(s)\n",
> +		       ERR_PTR(ret), attempts);
>   	}
>   
>   	/* Did we succeded or run out of retries? */
> @@ -551,10 +549,10 @@ static int __uc_init_hw(struct intel_uc *uc)
>   
>   	intel_gsc_uc_load_start(&uc->gsc);
>   
> -	drm_info(&i915->drm, "GuC submission %s\n",
> -		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> -	drm_info(&i915->drm, "GuC SLPC %s\n",
> -		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
> +	gt_info(gt, "GuC submission %s\n",
> +		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> +	gt_info(gt, "GuC SLPC %s\n",
> +		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>   
>   	return 0;
>   
> @@ -572,12 +570,12 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	__uc_sanitize(uc);
>   
>   	if (!ret) {
> -		drm_notice(&i915->drm, "GuC is uninitialized\n");
> +		gt_notice(gt, "GuC is uninitialized\n");
>   		/* We want to run without GuC submission */
>   		return 0;
>   	}
>   
> -	i915_probe_error(i915, "GuC initialization failed %d\n", ret);
> +	gt_probe_error(gt, "GuC initialization failed %pe\n", ERR_PTR(ret));
>   
>   	/* We want to keep KMS alive */
>   	return -EIO;
> @@ -690,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>   		err = intel_guc_suspend(guc);
>   		if (err)
> -			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
> +			gt_dbg(uc_to_gt(uc), "Failed to suspend GuC, %pe", ERR_PTR(err));
>   	}
>   }
>   
> @@ -718,7 +716,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   
>   	err = intel_guc_resume(guc);
>   	if (err) {
> -		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
> +		gt_dbg(gt, "Failed to resume GuC, %pe", ERR_PTR(err));
Why not change this to guc_dbg?

John.

>   		return err;
>   	}
>   

