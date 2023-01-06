Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9065FE9E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5E10E85A;
	Fri,  6 Jan 2023 10:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE2410E863;
 Fri,  6 Jan 2023 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673000229; x=1704536229;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gd4HwFUU25NJHtunyI8OVMfW80jq9BxQgGzpDMX3jw4=;
 b=f4kifuowh3SFKDYis1kyCQE1h5oIAWdM6+S5K3/RmiXH+AnsAAvbYpJF
 vql8um6W8ddSihcx9t21qeMqFl+WHDl4fJCXnJKS92lXw2LepAnRwRNdW
 ad6qdi+tJI12qy2Q+WvjNygDdXwBWzU9bwhlLQdl2IbOoaWkOU34Iq3iG
 JIla25ejsuFLaONi0FDn1rR7WLeHLXogrN7XtqkPolGDxFDk0gylyy5r4
 G5fMr2v8vkJiAr8owojjI1ZOiO20AE+K+TxMVyfnkpJdnvUcJD0joQd+W
 XmJSqMke3Q4tyym4Rb2CLepYdx+RQpi9QlAJr8AbnoMES4/F9CWzLgSI0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="321154994"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="321154994"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 02:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="744586471"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="744586471"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2023 02:17:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 02:17:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 02:17:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 02:17:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 02:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7UA2cjRje/QUARjJcTWUiyXg5h0OFjf+31rjhfSNxM7hWYdndbumoiBu6pwyJQxiaTs+2TuqJXJ0cV+OF1SaYGaAw52AhBfbh+3MbsF7N6FG5Ez825w1mKFTHkpuGd79LMLWPJ3DXEJQECP+ju/aOxcq0FK+XWdeMd8QV47RrPJHLGJBaZvPpwLIjg6ZxZqSsRmO/7W6Sv3EgKz5V9DtBt4lR+qO0huEm8075EJBQgF05jCEESgE1yGLNiqbhYBXHUEXq/r8nFQpjZWkxCn9sKFw9+iti0H0mwFfjG2Rlb8WC4US3qHfdA7gJKbXrFrRLn5PEwfPs4kd1maSS60QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOKDF+/L2ms6RLE7ykfO5wd6kImqBP38P55i+D/ekCs=;
 b=i0SgijZ/SP24KnngIk1BEMWNG39yy8hPzYcTA8++b9p8VyJMgCm8XZhgozU9wFKw01c7ZWLNmTFSf4HPRltffO5GOkK0mdS38DJi/wCWGF8ULVVaxJBy1wQrdxWxgyXCg+dQO39a9jMOhsbHlQYhyQZpI9/dAKiE/Va9vPS5Sxzd3YXpkoLZPik5pMHaOfJXZNa53M7/JskZBGmu01orGpRmG4k0/tfKfCEYkmQbXoremONwI8/X0u8mukppB58RUPUiTitqQPXpjxcPoUt6qo1DnJnmTyyafm2S+H1QVXHgmv3d1/cnOSfgw87NSrCAzSyqEi5MTo5CnLxMG7LurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 10:17:05 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::1e74:3442:77ce:6ef]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::1e74:3442:77ce:6ef%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 10:17:04 +0000
Message-ID: <7bd1bcb7-02c4-e828-7392-85a6e3fb8530@intel.com>
Date: Fri, 6 Jan 2023 15:46:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/hwmon: Display clamped PL1 limit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221215191727.2468770-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20221215191727.2468770-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::20) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f84e29-9438-4189-2db8-08daefcf28a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjyY8s5Cq7MkfaUnZPBpECE+JVRTxGDGbVOeWVHQXoZKXYjmbHCPgmRBPIWOl8QqihDdt9G/pP+BjAxFgA3Ep3MPsDP8XlJ0XwQ6cgJqfXwfBGOLlaQKTBsyKeguyu9+/rXSOPiDRTVs1C3QDaNtD6MD8usFYJtWc4qdz6E1RxG76VInnWmx+65zwWC+dMRlbEv2sUrfdl8JarBlp/1R03uNXQqSkbn7Gos1wM/UFJXWdeUghrH+pMqVeT4nDbxHa5lP7EqOAX6U5wxV2FfW7UUD6TO/mnMo4pFtnJwsfnQirrxLMfYpc9O1MoAvP2fKcimGuAvjUq4/PXQt71pqYBwb95aXzgIi8xC2PJDd0Lhw52ZD6twEMwfvmjPGzQdl24mJ14rGIoJ33DoLEVV9vOKX5KpmPdd4mQXYm+bnt9WduBc3mh0rxAH6LO1dKeIgK/YY3dJBOZvJQl7lV/wEMMhB9c6MnLeqOkt7VJYWYlt3qhstuRKQuC4v8r+Ln6Oz5o3JHz0vGDevjx637ibsAXek/JRl6EalnWqsyOOpJGRXxnccn1XdBxySJlsp0b6kbUiwLsacvUE6OPQitdhC1FCDiU7pm2mB0fM0TGpWM5hJGNucB5sALabLyTBKYS5A0IPe8WnVEtb5IzAhcuEKSI3ln+IjqhPefY82mApSXKJq2C+t2e4FgQK06F/qFhyH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(5660300002)(8936002)(83380400001)(8676002)(66946007)(66476007)(4326008)(66556008)(316002)(41300700001)(2616005)(36756003)(82960400001)(38100700002)(86362001)(31696002)(2906002)(55236004)(6486002)(966005)(478600001)(53546011)(186003)(6512007)(26005)(6666004)(31686004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVhOenNXV2JUeDcyckpkYmNZanQ3dEg5OGhObE1XUXlzK1B0ME1pdG90ZWYw?=
 =?utf-8?B?QUlnRmZMVCtEaEQyUVhEZjVvek9IalhNTDNnZmg5YnhQQmVYWnd6dFBTWS9Q?=
 =?utf-8?B?bjlGNDZXVkU3RUZGOEwzWDAyWkVCa090a1FtNWFTVFNjT3U0dytiQWp6Mnc0?=
 =?utf-8?B?Y1UrcFY2V0VoejRwUitJd3M4WDA2d2hJSUtNaVRZMHk4Z08ya3loakh5WjAz?=
 =?utf-8?B?ZWNTbDl0VEV6REpJc0h0cnJVbkJXWGpZbE92bDZJMnN2ZXhIcjFuRXRhUW1X?=
 =?utf-8?B?YnE2RWdhUUM5RWp2bkJScSsreWxTdXVMS2U4OEFrckZNNnBhb3Y4UzFTVGVG?=
 =?utf-8?B?SDJtSktFYUlNYjFPamlvVkM3WVlKVGl4RnpVeTJVQm1NdzRwRm9icHNnVGdG?=
 =?utf-8?B?U3BrcHl6KzRDY0NmSU9kbTZXNlI2Vm9RYS9PTW1hTmppdUNBdVdaQlNVbHVQ?=
 =?utf-8?B?Qis4NUxPbk4rQU55S2xrdmNOWXFjM1dhNXowdy9Xc2FRVVRUTjNmS2NuazM2?=
 =?utf-8?B?dDh1L1djNmNRZUU1bm10anpxckpPc3c0ckpGTm55YjVxZUJiMTcvL1pLTExE?=
 =?utf-8?B?VnNxVFQzOUVyTC9TK1FJbXlDY3BDWmt4WCtwUVc0bWgvdWd1YXpRYi9kUk01?=
 =?utf-8?B?dDJpb1F3aElFVnh4TGRVOHcya2FXV0VRRVBjV3FKUmpSWGNzNVI3cnplaVBU?=
 =?utf-8?B?OUI0aWdIQm9MWHBYbnZHRDJUa3lTTkVsZFZCWUVxakVqc1dNUkZvZTRyRjUy?=
 =?utf-8?B?L1B2UFhwdVJoU3RLaWN6ZHRiOHdwNjhINlBCZGZ5NWlZdFNwOFNLOUx6R0dJ?=
 =?utf-8?B?cFdtUGxIb3VjTi9aQ2NyZHlwUmw2c3lFV3FCMk1iZmRZUzd6dTR5WHFGcTkx?=
 =?utf-8?B?ZDRsUm10RkZDd2tzVkVDejRHTmJ6aTJSc0QxOFNJL1Rid3NyOG9DSVdzVEk0?=
 =?utf-8?B?Zi8zWXNsZXFwbnh2MGhnNGNsYzcvTGNKN2JMbVdWVXY3ZmRRMkk4YzlhdzNl?=
 =?utf-8?B?TzF5cElxREs1Nnl3eHNVUmpCaVhENEhMSWxzaHdSd2U5cmc4dXFpemIvU25W?=
 =?utf-8?B?Zm9XL1FPMHpRQnl4UitZRzlEVVRLNkRKQUpSUFR5M005SldZOEJWK1M4anZK?=
 =?utf-8?B?WmVzbkZHbmJXLytTQzFkc28xTmRJUDQ3QWlzMHAwbk1xTUZObGtvVEovbncy?=
 =?utf-8?B?OTdHNnF1RzFSMmxNZk1Ra01INWhsVWpaZ0hJejZBU1ZNNFdacTU2bllQbmNO?=
 =?utf-8?B?ZEh0bmp0QUl6SGtpOUJGM2RaQkRQT09zcDFCbjA1NGIxN2JQZDhMZjVRa1RS?=
 =?utf-8?B?dTBzS1lEMWZQemNoMmFNY2xxVUxjVHg4blAwM1UySDBwOS9acjd3T08ycU4w?=
 =?utf-8?B?VnJPdEdLZGVkUGV1a2IrSURGZFB1U2U3K3FIaWFUZ1lYL1h5NHEwN29ZeVRH?=
 =?utf-8?B?MGZyMkNkN1c4cnZvMDVJZzd4VkVsT3I1T2Q3RWZQdE1ONHgxTFMvRGdLa1U4?=
 =?utf-8?B?bVBycUM3WGlLbUZBWTBucythbWwrQytxcVZVc1ZsRVdqcElpT3BoVGFZT3BU?=
 =?utf-8?B?eWcwU0xkaHV4ZkpnTms5R1pNY1pCL3hBYWNPcEZsTURXeDVtZkNPaFRaT1hn?=
 =?utf-8?B?QVRWWCtqK040d3NQd2EwRFRoQmFSYm03M2cwMThHdFBWSzZxK0dZS2F0Tnl3?=
 =?utf-8?B?SFA1TDB1ZWVCRTJOTXRjdUZKVHFnRlNCS205MDF2Y3FyazBQb3BPdHc1RDhZ?=
 =?utf-8?B?bkNSQzl4WXdDa3JEcFJBV2w5OXJrTjBsa1plNWEySmlMT3djOVZCZ1FPU0ho?=
 =?utf-8?B?ZFh6dnZUMUcycTVOVy9ZSmpkdlZ6SW9ubVAva1kvK3JSZTRFTTY5TUY0b01L?=
 =?utf-8?B?dWFpbkZGWmxwYS8zVXRQbnhiMXgvYTdoYTVHTW41NWRvMjAxVGlhUU9SSFJW?=
 =?utf-8?B?TGMrZjJsWDVHVDFNRnVtQis0WEkwU0k0ci9mWlBvRVY5M1RJWVZCYXlKbkRn?=
 =?utf-8?B?YTNMQjgxZWFEcjEvTjNkamdicEluNnR3ZlA0QklidERGcEdyT2pZSUgvTUV1?=
 =?utf-8?B?enVJNlFuMzNvMVdNZjN4T2hMUTZYS0RuNXNpalJ1R0xqQ1I3bGxuTHl1WDZv?=
 =?utf-8?B?UlZvMGxYUk1YbHJRcnB1ay9FcXA3eFJtejlEd3d0cjFsWG9SYVhZdDl3aWJp?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f84e29-9438-4189-2db8-08daefcf28a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 10:17:04.9167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKGYs94ybd2fpDGkYB/M6Uuwr4bSYqi6JuzCVUCBaPYBJutOkGLY2gZb3ZfdB2aIpV7nl/3smEsfVVM2UCm0IwWabc4kuO9P0UWdDR/PXco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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



On 12/16/2022 12:47 AM, Ashutosh Dixit wrote:
> HW allows arbitrary PL1 limits to be set but silently clamps these values
> to "typical but not guaranteed" min/max values in pkg_power_sku
> register. Follow the same pattern for sysfs, allow arbitrary PL1 limits to
> be set but display clamped values when read, so that users see PL1 limits
> HW is likely using. Otherwise users think HW is using arbitrarily high/low
> PL1 limits they might have set. The previous write/read I1 power1_crit
> limit also follows the same clamping pattern.
> 
> v2: Explain "why" in commit message and include bug link (Jani Nikula)
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7704
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c        | 39 ++++++++++++++++++++----
>   drivers/gpu/drm/i915/intel_mchbar_regs.h |  2 ++
>   2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index cca7a4350ec8f..1225bc432f0d5 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -359,6 +359,38 @@ hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>   	}
>   }
>   
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read. Write/read I1 also follows the same pattern.
> + */
> +static int
> +hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u64 r, min, max;
> +
> +	*val = hwm_field_read_and_scale(ddat,
> +					hwmon->rg.pkg_rapl_limit,
> +					PKG_PWR_LIM_1,
> +					hwmon->scl_shift_power,
> +					SF_POWER);
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*val = clamp_t(u64, *val, min, max);
> +
> +	return 0;
> +}
> +
>   static int
>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   {
> @@ -368,12 +400,7 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> -		*val = hwm_field_read_and_scale(ddat,
> -						hwmon->rg.pkg_rapl_limit,
> -						PKG_PWR_LIM_1,
> -						hwmon->scl_shift_power,
> -						SF_POWER);
> -		return 0;
> +		return hwm_power_max_read(ddat, val);
>   	case hwmon_power_rated_max:
>   		*val = hwm_field_read_and_scale(ddat,
>   						hwmon->rg.pkg_power_sku,
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index f93e9af43ac35..73900c098d591 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -194,6 +194,8 @@
>    */
>   #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>   #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
>   #define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
>   #define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
>   #define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
