Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEC6817E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 18:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A09710E02A;
	Mon, 30 Jan 2023 17:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4BE10E02A;
 Mon, 30 Jan 2023 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675100718; x=1706636718;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RipFhhHqbF2COwXIVJwykwR3QhNRlvZbLrPwnLanblI=;
 b=JBB360PEyD0Vp9vyVJu0NPQq4kzPA46dtrONwGBXJs37rzk7PZfb9yL4
 MsUIkYg44xzcl9EfbyWoObh4SUli+ZGcIZC8lVp0DTrYhLcWbW5F6ctV/
 JKCkIUyPVqyS8TT/k+yb1BxJ/1OShgOj/8Nb+rRsdPTCjAnRE/WCYAcyH
 kNnONznGzyxss8oLlllUGebIACL//uDJCsVbZbGCyHjzXBWBNEetIOIl4
 Ad92rMRpqhHt30130c+LhZ45pyju4yIdAMmR6fbp8vwgPvIUxv/RIok9T
 mQXYjvjNmfAV57+OlWm006iEyowkjza/a78VvGYLXb5+cfKUkWbFbRyzS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392172785"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="392172785"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 09:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641631541"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="641631541"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 09:45:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:45:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:45:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 09:45:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 09:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoXbXzp63FJ8KBUK6WJPTvaKN1SlR26SYt0qiInU6O2xxLHIu9porjQ1+UKBbmV9mKH3BnezqwBs35Lp7FVIrqpfitnVjLbZ1GInen3IAmH70nixhLzPh9S6alb7Cw+3jlfXrunJyKtn6zdkwMpahRDmKrclFRoHammJTwZUjVmWE9BIQCPZimhKziQqMlNg4+6U+j8gWAKIb7CmxdTJkbeSsbOgRhBFtTgMxHIF+CZXZKRUQWirdi0xRMe0pPwpXXrfUdl+TfzqTYwRResXt6RWuGeb1LP5wzpryGjoFYVa9xx0eTx1z/rrONjr6tWDgduUarH5haoe0JAASHTkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9yCT6kYZ6TM5LMF1p4hl4nAa7cYo4hmvFjZa1EjMA8=;
 b=acFH13thXIWrBMSIk94u2b+bmn0Wd9qotjz5HmuX1jALR7zsqLwiCAijk/tXmD3GgLDfvFshQpCMx8IA87NQ/eYLyO1SUe2A1feYiAC/VO+e+yNtn06jgp+2akn7lpaBtVvgY0laLOG7AVSWlVzcjdMM5KhGdTKQaEJgmIV7+JC72YZoT82W2ol2EKEUTC8U7OzWjY006M8uBL4Lmj2162Y0NJSea3DWhjJQ9HIgtC4uox7iyL7ZFY98ZRMxNbJkyeB4MJErvguB6EugUJgrgRSaLNdhwYAjveR9YJY5HMMYNrwjhcMt4SbuVNsgKvxhRNreFPKqPmgjvqpl4oop7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 17:45:14 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 17:45:14 +0000
Message-ID: <ec8211d8-2a27-d40a-0e77-3656f8e2bd52@intel.com>
Date: Mon, 30 Jan 2023 09:45:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 8/8] drm/i915/guc: Update GT/GuC messages in intel_uc.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
 <20230128195907.1837-9-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230128195907.1837-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcd989b-1162-4739-cf5f-08db02e9be22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLv2PvqLHOiLEZCDoJ1MY7I0xgcFM5UpDRzdIZR1n60uU153gqYAn8ntEzttKCAkedK74zeeK+hrI2W10QO++Cg9F11Mwbj6ylSW82R3hXYEWIZ/r5ywnE2d2ZFjSbgRy5NNKczSCNllctrebSzDecsf5M4AGdhKpQoBaBG6sBWWbAKGxvzO9UTfMlAlapE2OYz0f7ZG1Qhm2FnLa+OdyOW9Me15BkgsZ0/pbIVhcLY8TNiNQQuyeLK0FQoLyc9A2O2iClAlCR88iYdf1CsbVV/9JGImQdBpYj6Wa27Zaz4WJMayyuvODKC1YoX3665fSwngxbmuRqMaNUQBP4l4j+YX4HNDnHqAPVEqmMS6CzVFIm+5zpHpLcL8OPoU+6VEXKvpouI1sfTMzAZRDBIJ9KFhX5IkdNOZIfDUQu+AhVm0hXnVqt8WL5oyuhXnQClhilHs0nnUHEgcWqA7JxG30ed2SLbd5lovMHVp9B3F362Olr/p5NWfpUvxLGEDIP/RL2HYCPO4Zdb/6Vgd88U+gLeibVF7Wp7tALQLeRfGFwAM9LSkLAFzehB9S4HP3gelECrykNsOba+05R+pGjCZKQmfXqTV59LovebLDNZnihe+jhiNwN9yDFgTP4GKqKb+kkduO5i4Um2QQTdvCfk4CGj1ZQ7BWG8KN2ohpJzJeKqecfVDORN4F/YddEeIA5XlrrrwLU8ZQFzuq0/hyFshENL9Y7qQoQDj1Y2ai2mGqzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(186003)(6506007)(53546011)(31696002)(82960400001)(86362001)(2616005)(36756003)(38100700002)(83380400001)(26005)(8936002)(31686004)(2906002)(15650500001)(5660300002)(6512007)(41300700001)(6486002)(478600001)(4326008)(450100002)(316002)(8676002)(66556008)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFXd21pcURDZUV1TDd1Zmo1enQ0SXpuV2tpTWorNzZsT3RNRzZhVTBwZGtp?=
 =?utf-8?B?NzQxMU91SkI3YzVWSVBySEFva0NUTE5SR0doQmQrMVNEY0FRaVI1bWxXVUtX?=
 =?utf-8?B?VVJ4N3U2YjI5RHIyT0puRGdhVEdBaWFPMEFLT2x0NURsN2lnOXR5ZkxNTU9n?=
 =?utf-8?B?RVJ0eEUxQzlmWW94Nit3NGRpQlJRcEQ0VGxoTmhVS05yVFA4TDJQRnVVMmJp?=
 =?utf-8?B?V0c3QTllbmR2aFRpUldzWHYwMUFZYVVEcW1nVDhwMUxXZDVXdzBldE9GdXdi?=
 =?utf-8?B?S3kyYkwvVVY0MmlhbFdXcitSRXJpN0tNeWtHVHFPcFZLL0FGb2xBR0E1WjBq?=
 =?utf-8?B?MWk0NUlBQXZ6MGZ3NDMwVFJZY3UzcHlCenpNNXJ3L1RNNE1DQUtmZHlJRXFt?=
 =?utf-8?B?K0U3QlExbFlDSkIvdXNiS2c3Y1h4MGlFSHUyWDNRSTRTTGU4bCtUeXY1Nnhz?=
 =?utf-8?B?SmRETzArV1NUVnJta3J2TTRFUEVKbHFYNHB4TjdaOG1VNzVWOCsyZ2NTQWd3?=
 =?utf-8?B?dkVvRGx1SnliZW93VSs5VXYybnpjZisxU2M3Um5DZWJCb21Uck5qUnVvbFQy?=
 =?utf-8?B?SlE1bmhFM2djTkNxSDFUekNxUU8vWEdrMDV5UTdDWkx4RTV4NElDaElpcHo4?=
 =?utf-8?B?NWNoWnVpNHA3WGVsNUFQS1JBRGVmRlNtN3hBZzJQRlNKNjA0NVNtWll4WHlq?=
 =?utf-8?B?bndOeHltdXUzb0tLTWh4SGNtQm1TSjY2MG96dElSZnJBQjFVQTBNa1ZRcm1n?=
 =?utf-8?B?UElVZTFMOGZPUnZkR2RUd2RmTXM1MUJVY0VEbk00NzNyb0FYLzdJSXB4cEQ3?=
 =?utf-8?B?NmhzSlhWbEExK2NYVGlINjRIZWZmMnE1WTZUcE9POHBoWTVVdjVnd0ZCTnFJ?=
 =?utf-8?B?UzFCbDFoT01VdmJKYlErTEVVem0zcUkxejZacURPaXg1eFQzSUtHVEpFTTMw?=
 =?utf-8?B?R0xMVldUVGc5Q0pxSGlRNS91NVYwc2xzbGVTR0V2S050RVJBRTg1bXEzTHlE?=
 =?utf-8?B?emhSbXdHV0cvMk5ZOE1kVVRzL3NHbzVYZkZTbmdsUDRFYXlVYi9KWXB5emVP?=
 =?utf-8?B?NEZPV1hndWlreVNMYlplL1VNczBhbVJ1UE5yQjVCUVN5bUNFMU5RKzAzZlhL?=
 =?utf-8?B?aFl3U0xzN3RGRHBIT3Z4QXZoL2tUTmRVSUN0ODl0STVHbU04b3lQV3U1Mmdw?=
 =?utf-8?B?V293T1VycFJyYklXL3dmazRTdlJKNzREVnZIQS9FRXRUUk01STRxRVZOMEFJ?=
 =?utf-8?B?ZnA5VGtWamZleHhKQTJ6ODMvaGY0QzBkRkE3bHdjbGYvKytZQ0VCVitGMzNn?=
 =?utf-8?B?V2pwdUhOKzJRWWR1OEp1dUFlNjZrQVR5UXZWY2J6NnpkaHJINVJVYUIvdXJT?=
 =?utf-8?B?WlcrREx2UHpqR1dLK21LUm5BRXdwZVZyeVQ5QWVPTC9KZjFvOVR3UG9QSEhT?=
 =?utf-8?B?SkR1bTFnL3NnTlRpNzdlaGhRc2YwR0RXTWxjb0FlUmJGcDk4QkZ0bXRlazdU?=
 =?utf-8?B?NU1EL2RUblpjcWxIZnBzeFlMdjlZNVI3eFRXb3F0L0VsUERZWnRwb1NWNWlq?=
 =?utf-8?B?WGNhS1RsOUFORUZzemdFUmVPNVo0cUtQNXBmYU1sbW9naGVhcXE0REtRNWJO?=
 =?utf-8?B?UWIvL0hOSkRSMC8vMzgvVytjYitZY0xXL1JmTHRHd3BzOVM1VkpmOVRLTnQ4?=
 =?utf-8?B?b1B6ZEpMM1ArWXg4V0JhREZJNnV1L2lWdEhURHhndnZvOWZja3hMUDFENkdC?=
 =?utf-8?B?elJQNXVPOFYxZk1Ud3JtS1FSOTRGdnkrcFNCUTNrSzZRN25FNzNIN3c1ZkE0?=
 =?utf-8?B?UlFrek96bmNkdnZySGhaL0MwWHBieUxqNVIyWkJzL2VKSjJSN1k1QUQ0WVZM?=
 =?utf-8?B?YURIZkJkSkFSeXFlR0FXRFlpQkZnOGt5WHlwR2lxTTFkOGplSUdOVFBPaW5z?=
 =?utf-8?B?UkNKNGw3ZUlXcE1UWTI5ZDlkNnJYZDhHcEJlTTRQR3c2RlVyQzk4NldIbVdJ?=
 =?utf-8?B?bndNQldtVlNIU1djcnBiYkk5b3h2UkY4QWJSOHFOaHA0bm81VGRpS1U2QWZY?=
 =?utf-8?B?RFJaajVHelNmU0xzVTFibWdpbzlYYmsxMVlWbnNCMyt2UzVLc0JQTGtWdFFJ?=
 =?utf-8?B?RmxUd3E1UmFnbFFuY0U5bHBha1k2bC82V0YrTTcwa1FTNDB6VVRFanY0ZU1x?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcd989b-1162-4739-cf5f-08db02e9be22
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 17:45:14.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZGifGcxWBgxIrVkDCJ/YMygdkeExEuNAcjzT72Z/K8wv2TTgh9iLMY3ZeuBy5/XJ6rnHUNwG6xjyjAWSTbbqo3CXhnVDMnyViuwKAV2M4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
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

On 1/28/2023 11:59, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> v2: pass gt to print_fw_ver
> v3: prefer guc_dbg in suspend/resume logs
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 80 +++++++++++++--------------
>   1 file changed, 39 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 9a8a1abf71d7..de7f987cf611 100644
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
> +			guc_dbg(guc, "Failed to suspend, %pe", ERR_PTR(err));
>   	}
>   }
>   
> @@ -718,7 +716,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   
>   	err = intel_guc_resume(guc);
>   	if (err) {
> -		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
> +		guc_dbg(guc, "Failed to resume, %pe", ERR_PTR(err));
>   		return err;
>   	}
>   

