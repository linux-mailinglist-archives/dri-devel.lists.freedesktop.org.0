Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F37466D3B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A346FD33;
	Thu,  2 Dec 2021 22:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A76FD31;
 Thu,  2 Dec 2021 22:47:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="260861980"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="260861980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 14:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="513405949"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 14:47:39 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 14:47:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 14:47:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 14:47:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZihu2nKMkLEUlHrs82gTnehx8+dNh8U7O+I5EYHoK8pMmS4O+zTQcwDAvvVSGQ5Qc12DR1doOokDDeGLQ0wvDYb3lM2G9UJFV46Qcw1lau0utaubdZSiZeJLd/72VVZECiyP35+4OcYRTxzDX6FsEBKOP3iBgC5746oYR4K7JHV9xPjTlFBIguRsgHemK6YTzWMsiTRSxcrzyleRWhkI4JgxposWuYmo4yOzjevzGpTDaLc5kdPFZUaTliyLL4ehuEVLbYvSMs+WdBJnANNGMwxvTuWo441FAYwvSw3nlcysRH98ozSQx6ItTSAnXNWyVGc/WhMuyXPVDUA9WFsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUypp/ZNh/NZbtYqXC69wk4OtHK8XXUvWCDch6Pzims=;
 b=TJiMh/Ypgx+FDCOhXmEOTOg+NHB9Pok0lMOGRMDWY6EVY9tBvwHw+n3NksS6Ubs3sFFyW5KJG0fB4wun+n7Gqe2Wb1+lcDZ2QRk4209JWL8zm2VwWgrCTcJgZbLw2AFjrcazwlXDnrq9tdnBpnSGMPC40Isx/+CSsC/J25UiH45igsDtd+LiIXdvUnStg7w3tOjmJvMtX5MspID9aeMofCqGF8xSBwgSSi9JY/GksVjd5eOwi15GgTKl21gZktxBJu73l49MDq0F+SOxOcn3RZVUjjko+ug+fSAS0QMJ2fEqs6u5Kn4pn8b0gt37TEq4xl3r4VyOSC8SFTD4N1+aCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUypp/ZNh/NZbtYqXC69wk4OtHK8XXUvWCDch6Pzims=;
 b=RaIsXEiLgrAwfZPa46PMuJrHE1f2OEZE5jZBCdE54z4eWTrI1NR6zGXu/+VKfVSiov6r9XZqp6RVY1Qmb3xvfgHA3g+JHHL/tnekWxNLwHT8rrH9OaBv6Kf3VZ8Nci8k1VkaLytPPW2VS2pXMl+RKGmymP4PLY/lls1yVqiT5Qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN7PR11MB2755.namprd11.prod.outlook.com (2603:10b6:406:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 22:47:37 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 22:47:37 +0000
Subject: Re: [Intel-gfx] [PATCH v3 2/5] drm/i915/dg2: Add Wa_14010547955
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-3-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <3592145d-a869-8ca1-c430-1d096b794838@intel.com>
Date: Thu, 2 Dec 2021 14:47:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211116174818.2128062-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.254.63.148] (192.55.52.200) by
 BYAPR11CA0048.namprd11.prod.outlook.com (2603:10b6:a03:80::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 2 Dec 2021 22:47:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5b6114-0ba4-41e9-7b73-08d9b5e5bcea
X-MS-TrafficTypeDiagnostic: BN7PR11MB2755:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB2755CDD5625645041A98C020CE699@BN7PR11MB2755.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QRilTOFEb47QEV/3VeHVVI/QeXGLn532AHe2dovk+1hbujeqkIV0ikcaTbQwzjegH9kubZt+20XssokvQjR9gN4vestIv7gDixQXLER4NdJqD3Hx4/RtPINuGO2BdVRUeXzVNNxhN4lmmd2ffegFePXzwVB+V7qNfP6Znd3expVj4u0rYKupwrB85O8HGyYdgkhHlhaSud61E7LlVfdA0ImgIQ4Gus99KyYyPXxF+KaVPO5x+yJkF5RArVXB6yLfQCbwPiLj6auzIercgpiywdKV3XQ+h4LRTFJz3PeFbHt03qSNtxwA9Cmwp0DnS7pPMIps+q1eqdqAV33iDVUcR03bo1AjUHEpQsE61JfPoy2tRHbUFUWi+cukIxu5rByUMRvrPirTC2SI84Bija/r/86eLfbQRbUkDh/Th4pXrnN9w5sRAkc6cVLY7oPyLanXotd9BrUui2GTQVhgub+0p3eh0GK4vmuBhJ5OMi9zWzwcwdcxYxyV8wuGnu9COTd3wZHHJFsDQA/TjQZyv+7uPyBtfvrPSpNswcjx5IXFqg9SNgqpFXpqw732QpHXT7iSCO7wTXoerpcZgYhO4tuvLjF/NhOHGmTNjiavA7vbiSoldxUdR9elMBTBSrBaUUZaaDGF3OgFz2o9gHIR/KccokbfTV5jOc53H+096rs6fQqX/eAcP5KjkV9SgjGkJWhIF9g41rrbiBYcRiDCbJRXfrnk3U7hyBfRbuIaMnbOiNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6486002)(26005)(2906002)(5660300002)(66556008)(31686004)(2616005)(6666004)(36756003)(83380400001)(38100700002)(66476007)(8936002)(31696002)(4326008)(8676002)(86362001)(956004)(186003)(450100002)(82960400001)(316002)(16576012)(508600001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFJK0wrSVpqQnpudU9vb1BXMFJiK3hQbWR5WE40WXJOVHNjR1dLQlcvSEkz?=
 =?utf-8?B?T1lxUlVOQmRIeUdWVWp3cDRTd1N2ZE1rR1RjVUhwSnBMWjQwc2lDQ1hyT3Q1?=
 =?utf-8?B?UldkVjBvU2ZqVVNoMUFBaGMxT2M2MTU5RVdsclVxdFpUQ2FBT0QyZ0dvN3VR?=
 =?utf-8?B?NWRlV3RnUHZxQlY3MDBPekxhVU0xb1l2dExnS3ZOa1lUZlBLY2Q2clBkYmc5?=
 =?utf-8?B?QVlGOENROHhXOU9IQzBEVG40c2FOYlZFL3F4bWl6QXFMSzZqYTVDY2czOUlP?=
 =?utf-8?B?NHpzdkZJYnFYV3BwOU5rZXlnYnppKzU3S3RiM2JMQU9Rb0JUZWNFOHZPYnlQ?=
 =?utf-8?B?Sm9nUWJRZnlSdTZjOHNuZTVrSTFrUmlRU2NPYjdTTndmVlNta2xOSXZ3T1Yy?=
 =?utf-8?B?ZnBYSzBuMTVrK0dlZ0EzbEgwbk91RzBWZUJSaDhDdStET0tsTm1XK2VBak9y?=
 =?utf-8?B?THdKQk9GemR1eHVpNHdyTHlhOGRrOExlcUhHa3FWd3BkUDFicmtZTWpVYnJj?=
 =?utf-8?B?TVVJYlR5Y0pscXo5bEMxMGpTNTY2djBmand1dStqSFg1ZUlkcTRJQlpmdVVh?=
 =?utf-8?B?MUdEVUttY0NxRWlhdEhuWnJabENoYW0wd0JFckJEV21OY0xaMnJhVjNET2hE?=
 =?utf-8?B?YkpSVXNJRUJZK05jcG1nQWJUT3dybjRtamtTQTR5OGhTTGUzYW5LenF6eHBH?=
 =?utf-8?B?UUoxb0docmcvUmFxRkdxLy9VUnZOZDNDME95Rm5scnlqVlFpL3EwV21yZkMw?=
 =?utf-8?B?Nm8vV0p4TWZZSHFlY09hY3JRMFl6ZHZDcWszeU8xWnYvTzl0bktwQ01TblVq?=
 =?utf-8?B?bEtSWGZjdTdMKzNEd3AxVll1S2JOQkpsam5mVkxscXJWaXNmajRDckpvTjF6?=
 =?utf-8?B?bHM0aThNakpvVXhHMUpMazdMY1RpckE5SU5PeWtEb3QrOGtSeWprTWREU1Fz?=
 =?utf-8?B?WTcwekRUUzZhKzVod1JzL0RuaEEyUUdTNGY4ejBxMTB3Lzd0RElhZklJNEha?=
 =?utf-8?B?eWtrcjBJN0V1eHhsR2ZBSGRjZlVlZUNWbG1JV0hZcVVYUjV0bk1IVlQvemg3?=
 =?utf-8?B?MmZHaE9CTDA2YmQ4QjJzU1JoeVhUMnUybkt6RHd0eTdLSmJPWmJVSnNtSzFE?=
 =?utf-8?B?eUhBZ1dQYUM4U3RKSzhaN3hXeDFKYzd4cGhSQzV6UTR1enRzNFFiVlBhYVlW?=
 =?utf-8?B?cng0SjdySzdjcXlDd3pySytKNTRtV0w4Y1ZFQ2dVSEVhWEhYMll0VkRTb0dH?=
 =?utf-8?B?dTVpTi9NcWJrVFhKQlU5ZHVTZ2cyN2p2QlRVZkI3eXhoVkxYK3lXK2R2OVVr?=
 =?utf-8?B?bEdQTE5Kd2RVMk03ZFZRYzlHd1M4amlWMGRiWEdHM09SMFdlMWZ4U1pYZk4y?=
 =?utf-8?B?NndaY2FEb090N3VvZnFJeGFOczB0cG8rZFBPbzVzNkp2dzdRTUthZzBqUWRv?=
 =?utf-8?B?U0FEWExhWFI3bk56M0UvR1pXSWZjR0QwQXprcWVZNGVCZTVRYTdSczhkVkFs?=
 =?utf-8?B?N2c2WHRoaUs4Y29Ud2J5cmROVXQ1cmlBd3VEUUxSc0tnZ29tTXZGcXVOZXUv?=
 =?utf-8?B?OS82S3kwVmlLZDFKRFc4YjFCSmZBZnIyNHVld1I4WlROTllINnFlYmxlc3p1?=
 =?utf-8?B?R2w0YjZ4WHdaRTBPRTVkRWtpYUU3M0JzeHk0QmlhZ2NzVXloL3p3L0lIRlJP?=
 =?utf-8?B?OVdnWVZzcWZhOWlnU0N2V1F5emxCeXFIUmJFbmw2ZmVmeGIyQ1FvYzJjUTdT?=
 =?utf-8?B?bVNBNGpOZFJpTllGWG1rUG5Balp6dDhzeTZ4Tk5Lckx6LzRqYnlMVTRjYVo1?=
 =?utf-8?B?RG1xUDZRd3djM0tHL0NIZ0hOK1R0OHlPMllVcHhXYjY4NkhrU0E2R0dsd2hw?=
 =?utf-8?B?L1ArcmZyeU1ROTJBa1ZLRlpGZ3ZtcktvWmhaTG81bFlncFRuYnd4YVczS3Br?=
 =?utf-8?B?ME50TTlleFVuVkw0U2taU0ErMkZDV3c1MlM1anFWTlFXVkxneEljdDhGcktE?=
 =?utf-8?B?R2NlTEd1WDE3YXJQSkJPTzRPNHMvdjMyN2J4cGxVdExCYkNJNUtjNVFYeE5Z?=
 =?utf-8?B?UEJPNEVMblJycjZRTGN6T1NjMTBEazE2MVdnTEd4aERycldHb0wvQURUT1Vh?=
 =?utf-8?B?dlBRM1lwOG1HNFI1OFY1T1lnUzFNc0hYeUdxWkFCWGNVNktKWTg5cFp3cDYw?=
 =?utf-8?B?djUydGVyUGUzUDg4N2lBSHlaaHN2TGtscklSNXhaRlExaWJBc0NBQjU2MDVW?=
 =?utf-8?B?eTk3a1hTeUJwM2JGNEpUcUlWWDdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b6114-0ba4-41e9-7b73-08d9b5e5bcea
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 22:47:37.2591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DGqpwAjz+sA0JDLfRpIdX/Ask5iKgi1OizRuhXkYIxt+xtiP/hwqXzypFL53yODEiKgG+JKQ2C10JwPQC7jz/HMls9HrplPFh3f+agIoP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2755
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

Looks correct.

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint


On 11/16/21 9:48 AM, Matt Roper wrote:
> This workaround is documented a bit strangely in the bspec; it's listed
> as an A0 workaround, but the description clarifies that the workaround
> is implicitly handled by the hardware and what the driver really needs
> to do is program a chicken bit to reenable some internal behavior.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
>   drivers/gpu/drm/i915/i915_reg.h              | 5 +++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0ceee8ac6671..1639bdbe2091 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -988,6 +988,10 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
>   	else if (DISPLAY_VER(dev_priv) >= 13)
>   		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
>   
> +	/* Wa_14010547955:dg2 */
> +	if (IS_DG2_DISPLAY_STEP(dev_priv, STEP_B0, STEP_FOREVER))
> +		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
> +
>   	intel_de_write(dev_priv, PIPE_CHICKEN(pipe), tmp);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index f15ffc53e858..c187ec122fdb 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8568,8 +8568,9 @@ enum {
>   							   _PIPEB_CHICKEN)
>   #define   UNDERRUN_RECOVERY_DISABLE_ADLP	REG_BIT(30)
>   #define   UNDERRUN_RECOVERY_ENABLE_DG2		REG_BIT(30)
> -#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
> -#define   PER_PIXEL_ALPHA_BYPASS_EN		(1 << 7)
> +#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU	REG_BIT(15)
> +#define   DG2_RENDER_CCSTAG_4_3_EN		REG_BIT(12)
> +#define   PER_PIXEL_ALPHA_BYPASS_EN		REG_BIT(7)
>   
>   #define VFLSKPD				_MMIO(0x62a8)
>   #define   DIS_OVER_FETCH_CACHE		REG_BIT(1)
