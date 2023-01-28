Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403E67F38C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4010E2DC;
	Sat, 28 Jan 2023 01:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFCF10E1BF;
 Sat, 28 Jan 2023 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674868282; x=1706404282;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zDGr7GQE4rH5UNT5hYDzsHbO8SzN3sP/gmf527YCGyw=;
 b=DDNb60ZDm7/vWQ3j7yGJ3mwS3B0zSWOIXQd/N/JsgByUBtIcxC/SAXO4
 z9FLF2gF6DzG3BlwtrX+Wu+gHHluVKTNd7kXTIrBCVPl9dtIDkewSQbdk
 XB6+sGiWM0/sbThQxdqyYkDDXIgcWDQd8y1Nm48U6/t9vY/IdXAwFJ8Sc
 9t37PmEGqtAUedn5ZLr0zjJwquBOl7Y5XChEXNJkZMZ61QSBDv8sG4gJX
 go9gU/O5+kfE/PMYvBP9kiqF22k7k365CWeDVylkfk2nsH04/7FrImGbi
 w3OCFjGS4BC9jQtmPIQh18j+bS+4SJnaPRfx5mPMM75ayIe7Jzdds4qLG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="307585246"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="307585246"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="695721387"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="695721387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 27 Jan 2023 17:11:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:11:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:11:21 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjZQqbg3LxdJji0TFDz1JqJNj8G6xC3WhfiUhaWd/b3mAqlGya1XLDsbcdVEiBBiWuKkMGSr8hHsRqvwH6aAlbqm+SK6nmcWAhsXgqp67strTJFdaHrDTWdt7+TLU6lqMOlbwQMuQItzV2uw/PmoD1UMOCOdit0zf1CI540n2cMRcNO5bxugeAKNvvfoPpOzTUze+wvBh0oBZD5hbIm2renaFmWpzdUaLsivqb3DE7Hs5zHQPzKfH/sTXiFT9R2/Mw8CzFBHEcZWTWCldValHIgm6sgvZ3cZkpccyyY5eJ5Ej7vejM6ZCwiugXGm+Ex9q4lodwk6sN12YZiRyAM3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l57afwh9pDFBrVteX2HNZiwvM+x57BsuxV5Zdb0Qoas=;
 b=Mj9cy3arNNUGRbSmhSi349Bf7EnDVwiNVrPpMAQoREuc5EqxufAFSo3v95yqMwK83pSycyxhm7MGb5y422xCnT1ePD/L+wcE5SYt5UlziG5yAnZ0iOmuk+QAr2AW0Bm9QF+wDuk9cuuvgBB6+LHkEXHC4JHzyDabbPqV+UViR3la1rEz6AX+2CWblATMQFvBksSZU3BNfHF3vJNfEC4Vhcz4D80nJoIh+O8NgK0lxB6LzLUQYcqGDhLiCyeQHeXR7v/XlaDLcz3HoSp6wWT1GIjUEj/eKSFmUSRSqMqYMrchmop738HA2Lu53Xb1YZErVnL1fGs4t5JDAFpGITE9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Sat, 28 Jan
 2023 01:11:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:11:18 +0000
Message-ID: <b4fbe442-850d-ba8f-1726-df327c941d28@intel.com>
Date: Fri, 27 Jan 2023 17:11:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 2/8] drm/i915/guc: Update GuC messages in
 intel_guc.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-3-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6138f3-069f-4bb6-79c6-08db00cc8f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgTKvPHGdy6i1grfdAQUYBkxmqwhxPPU1dD/y8t/08kTYGnATFk2NhBRaqHiUtv/prPbiKuWBXwx59zmtvkEIF7I2ZfZytkHtdbXAU+KmXQoxxJiR52Px3jnVbJtFkjKE0yYVJbhd+ZHvpb8gcGYbnHYYrsTXR6ldLRvrvy7Eq6dQFY2Eqi8WINn50qdnfaBbVPS7RWMVhyOmQD/tIbX8gnWG3xmhCo23HgKQ/YjHYTOhzVTxgKncpxmlewN8vCqDl4tyPse5zScy8fMA1Xauxq7312WqlblAn7B4sZwXCsda4v309P9ueqtj9lpbbs+rOz3Z5JahLeJr1b7B7ilIaGzXqUzClqgXbejKog1P2bJs1aoGL1iX+3g3Ev6lVs9Uo+HEwFyckdlgU+qGmOQqSc0AYpJz1Fo8fPboGm+yozJU2+YzsZF+opAHSVWbuxYEEQcwzLqeFde7zgjnlPxaCZVwLc5anYXZQeweiEoE7lwErvbBqscdRyXyp48aRsk/U2LUWxEvjPt4HIEHN2svD6U9oK3yJWfDu0rnjJy4qkLtbzmx2lu0VT6hJrEmHeQuFmS0DaaW/cwgPxi5O3/DnYuf3LCeJHwU+CvJJUX7J3z4Oi8bu903nEbVh+Io1pgQdvKkUeeZ0QjiuRsFgWbaAl77MqzndFiLGHXoBcBOxZFeY5ZLF0+rVbfaRUUKkEBdR+6PwvKiVcYASz9KVgbkNRgi0vno3ezt5HB9JrfSOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199018)(8936002)(41300700001)(5660300002)(38100700002)(82960400001)(316002)(36756003)(86362001)(31696002)(66946007)(66556008)(66476007)(6512007)(26005)(8676002)(6506007)(450100002)(186003)(478600001)(83380400001)(6486002)(2616005)(6666004)(53546011)(4326008)(31686004)(2906002)(15650500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjVEOUVYbE9OYXRUNXRXaXphUkJGcEUxMFdEenExY2pETjI4MDBTZXlvTWN3?=
 =?utf-8?B?ZVAzSmVkcEdqdlVLR0RNWWgzQmFHdDVYSm8vMGpEMFhrWlpHdEZpcFdKZ2ta?=
 =?utf-8?B?WVVKdm1WK0dTTFZZV004UDV0bHVWZEhqaWVhNmU0WG0vdFNBeTR2R2U4S0dn?=
 =?utf-8?B?MW10V2RTWkRqSzhWNkdnMDVaQVI4VmM1UXlKb05XdFNjNmZJcS9oY1VxRWV6?=
 =?utf-8?B?ejdKc0l5UHBBUmhlbXh5d1FOeFpyQ01WVVpNYnpkQTNKb20vdnBCanhyYThy?=
 =?utf-8?B?RDMxWDdjVEFpS0M3YUFIUVFYSGFTclorWkNWSHhPWUgxWGZ2a1M4eTA1ZGpy?=
 =?utf-8?B?U2QzVmxhQUdkc01pRFZEeVpyNE9JdDhrbFllQkNQZ0N1Zmx1UUxRR1o1ZDY0?=
 =?utf-8?B?WHFwTjJiaEhRb1B3OC9JYnlwOTd3OEh4N25GOFVSN3BwRVh0RS9YdDl3RE9s?=
 =?utf-8?B?ODF1QlFtak5oamYyRTJpMlNtbUhmMkk0QTQ4NEhRa01tVmFKcjJRUUJGNDkw?=
 =?utf-8?B?TVVsTS8yNmtBbHpHMWdLUEpiQ2lKRGpuY2pjL3YyOUR4YXRGSVVLRkF1UFhS?=
 =?utf-8?B?Z1EwMmJEaHlsR0VmaE9CN0VLRXZ4MHlHTHUyTGNSVWMrSWdWenp0c1hjU1Vt?=
 =?utf-8?B?UGlqMlZ4SE1ubFBvTGdrTEIxdFRFOXVCZHNSSXFCU3crRitGbC9qSXdZQUp4?=
 =?utf-8?B?RkVEQ3VjaFZqT0hYZmxqclpwa1NDTjU3ZEFreDNoa3ZyMFZuVjRRY1FyVnA3?=
 =?utf-8?B?cHZReWhwTCsrR25KbDFodTd3bVdhdkF2eDdtSmRrRE9rWG5hdHpjWHJDY21O?=
 =?utf-8?B?WUZRdStjTTRBdVdNRHU1TjN0QThoT2VCU1luNTQ3Z0YxSFBrUnlnNEFaVVND?=
 =?utf-8?B?WXNlbDg5SVIxK0ZBVHJTdHJJdWtxZmZrcUlReFpoL29CU1hJbVBGMnFQOFBS?=
 =?utf-8?B?MmRsakJTL2RVY2JNWjAwaXViaFpKOVZXS2NnOXFKd1JhMURBRTcyL2tyeUI5?=
 =?utf-8?B?WHBzZTZ1S0J5YW0xS1V3YVQvMjJvVHlMSTRuQjM4RnloRUNTMHY0amhzdjc2?=
 =?utf-8?B?UDgwMjNQVXcwUDlJeHF5YUptaUI2dXFZbUhtYUIzemdUQmhHOHdnbldTZ0kz?=
 =?utf-8?B?bWEzbjFWMHVMZVFkc1NobEhNSlM4QTZHM2VyTjN1amgvbGJzRUgySVEwWTZp?=
 =?utf-8?B?Q1ErbmJjcVkyNTJKM1BjNmpyMFhzQ3RYWG5VbWRyQ0NRY0VKNWxXZjErQUdh?=
 =?utf-8?B?QWFCdEpQRzE3bE1vNlkwdHZvU2p2QmNPdTlzZllvTi9WOGRZcllPVlNEOTE5?=
 =?utf-8?B?MTkrbHU4YTYwRzQyaGkrMzRBWHY1Tjdob1BXVDFVKzdKVmNsM3AvVlJ5OGd6?=
 =?utf-8?B?ZVJFUUFyQzBWL09Db1dIVERKemJEUWdvQVZkWEFWM25qd0JqbE9RTzBCVE5Y?=
 =?utf-8?B?VmlQSEJTZkhReEd4SWQ5SHI0MFVUakEwQ1p4Y3Y1ajRGOHhBRlNGMkpEbnhO?=
 =?utf-8?B?d2FHOFJqdEtJUWViL0kyMkIwZXh2UjRVWDJOOG9tbFFwMG5DWTdGMDBEUjVX?=
 =?utf-8?B?Z1FHYXJpaUZUNjFBMzVRSzVqbWppRnBWaklnODJyYjB6Y1FGbERjTFRIckRk?=
 =?utf-8?B?bXNxUjMwODNrTVpaNUZzSmxiZ0FLYTN0K2h1V0VOdlpERlY2UCtTTXQvVnha?=
 =?utf-8?B?WUJmcmE1T0l2MWs0OCtlbGJNenc0VjZwakJyVVZ4TFZScUM0WG5mNUNxaWhN?=
 =?utf-8?B?d1VCWkkyOFJIZGNzNVh2M3NFSGVmTVI2Sk4vNHE2MU5vQ29JamhSWC9jZk01?=
 =?utf-8?B?NXBScVdHSEpIeWxERmhaakNIZGxmd0NMcmZhalh6aWgwQnp6ZnF3RGlmb1pY?=
 =?utf-8?B?NThxdkFvYjdoejdTQWIvaG50MFY4L0lmYnNJRys1emhmZ3FHRVlIMWFOUzQx?=
 =?utf-8?B?T3oxNGtJKzM1dUFQSXdieUwzaDNvM0d3R0Z6WXk1RVEwb3hxdnA2RWRZNkx4?=
 =?utf-8?B?SlZvMU1RN1ZhUjJBcTFuQmkyMUp3QXA1TFJ4YWJ2ZW9zZDFpSUdENkVHR05Y?=
 =?utf-8?B?NmRFVGRBS3d6UUxNdktINGNRL1VZWU1VVmJXWnpYT01mM2FadXEvRytjTHI4?=
 =?utf-8?B?cmgwUGtHN2hhajg5TFVwTjUvTUkvU25qaDlHOXlrZDZhWnJGNWJMVVl6TUla?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6138f3-069f-4bb6-79c6-08db00cc8f9b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:11:18.6810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnv/dHFFEU+S76hmf6Z/UFv2RVk0cPWXgnkLiBA/hRTXvUjlkz8Girz0BwQyNFiCe1aY4PZ2PxOwwZMP7W7SbJ54lD3Iyp/13vqYRbu0I/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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
> v2: drop now redundant "GuC" word from the message
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 31 +++++++++++++-------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 1bccc175f9e6..d76508fa3af7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -11,6 +11,7 @@
>   #include "intel_guc.h"
>   #include "intel_guc_ads.h"
>   #include "intel_guc_capture.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_slpc.h"
>   #include "intel_guc_submission.h"
>   #include "i915_drv.h"
> @@ -94,8 +95,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
>   	spin_lock_irq(gt->irq_lock);
> -	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> -		     gt->pm_guc_events);
> +	guc_WARN_ON_ONCE(guc, intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> +			 gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(gt->irq_lock);
>   
> @@ -342,7 +343,7 @@ static void guc_init_params(struct intel_guc *guc)
>   	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
>   
>   	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> -		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
> +		guc_dbg(guc, "param[%2d] = %#x\n", i, params[i]);
>   }
>   
>   /*
> @@ -389,7 +390,6 @@ void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
>   
>   int intel_guc_init(struct intel_guc *guc)
>   {
> -	struct intel_gt *gt = guc_to_gt(guc);
>   	int ret;
>   
>   	ret = intel_uc_fw_init(&guc->fw);
> @@ -451,7 +451,7 @@ int intel_guc_init(struct intel_guc *guc)
>   	intel_uc_fw_fini(&guc->fw);
>   out:
>   	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
> -	i915_probe_error(gt->i915, "failed with %d\n", ret);
> +	guc_probe_error(guc, "failed with %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   
> @@ -480,7 +480,6 @@ void intel_guc_fini(struct intel_guc *guc)
>   int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   			u32 *response_buf, u32 response_buf_size)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
>   	u32 header;
>   	int i;
> @@ -515,7 +514,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   					   10, 10, &header);
>   	if (unlikely(ret)) {
>   timeout:
> -		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
> +		guc_err(guc, "mmio request %#x: no reply %x\n",
>   			request[0], header);
>   		goto out;
>   	}
> @@ -537,7 +536,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>   
> -		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
> +		guc_dbg(guc, "mmio request %#x: retrying, reason %u\n",
>   			request[0], reason);
>   		goto retry;
>   	}
> @@ -546,7 +545,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>   		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>   
> -		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
> +		guc_err(guc, "mmio request %#x: failure %x/%u\n",
>   			request[0], error, hint);
>   		ret = -ENXIO;
>   		goto out;
> @@ -554,7 +553,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>   
>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>   proto:
> -		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
> +		guc_err(guc, "mmio request %#x: unexpected reply %#x\n",
>   			request[0], header);
>   		ret = -EPROTO;
>   		goto out;
> @@ -597,9 +596,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>   	msg = payload[0] & guc->msg_enabled_mask;
>   
>   	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
> +		guc_err(guc, "Received early crash dump notification!\n");
>   	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
> +		guc_err(guc, "Received early exception notification!\n");
>   
>   	return 0;
>   }
> @@ -653,7 +652,8 @@ int intel_guc_suspend(struct intel_guc *guc)
>   		 */
>   		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>   		if (ret)
> -			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
> +			guc_err(guc, "suspend: RESET_CLIENT action failed with %pe\n",
> +				ERR_PTR(ret));
>   	}
>   
>   	/* Signal that the GuC isn't running. */
> @@ -828,12 +828,11 @@ static int __guc_action_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 va
>   
>   static int __guc_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 value)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	int err = __guc_action_self_cfg(guc, key, len, value);
>   
>   	if (unlikely(err))
> -		i915_probe_error(i915, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
> -				 ERR_PTR(err), key, value);
> +		guc_probe_error(guc, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
> +				ERR_PTR(err), key, value);
>   	return err;
>   }
>   

