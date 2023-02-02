Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E3688B1C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 00:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9810E68B;
	Thu,  2 Feb 2023 23:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFA510E68B;
 Thu,  2 Feb 2023 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675381702; x=1706917702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vvYTPYS8GdUQGwjmk3c3bOXBT5HaV41Jkpg0a9W+S48=;
 b=BIzdbVsDAaLpHUNAvcnNHnatkf5s/1nqQtyZWaVbnL/7ilR88yV9bGXk
 kBLMaHE+f8tnjOoqHZo+NKRJERCE9zX5M1BQUjP57hH/acJwdODJXe9k/
 Z+o768/WgE0OtfgZdGB17GbCEedmplIxVEfkBxtdntsrhMRiTYUn66ybN
 lnj8BGr+1kI4vL4lrNdvkdGFbVveli6fHlp1Eai13wPQqrvQ28FEqUhcu
 r6Ow/TM9whmXMAjuBNkJCx68rEMgZLZBbeslw3kNpUAWNrtgHbeXMCMZr
 p3rE26NKuVxIWPFWmQLA/cGEbp+CiQJ8M/QhWoNbRA3gzfWdT8q/WdG4h g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="327250982"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="327250982"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 15:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665509216"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="665509216"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 15:48:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 15:48:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 15:48:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 15:48:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 15:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxDjbuStGYKuek4nQ0s+6bD0oSqzU3Sf4D9uS0hlMa90uNF2jAO31VLiDMEIqpehMMtocpwVH/H0f9Br5XMdFje7Juq++OHBDdmnY+EKiZfTCh3ra0uFmUz3TUKENdJaTeWwAQN0Q5BpU0CqiGPKwaHtl16w45md+s2nbDShjcnJEjMxcFpMOUCbPm1K3UqUCxsWDrnEbCqnDSARD9vCH30GnR/j5iAFPVuIE5Wkrre/PEGXsoSNmT9dCEo8si5eqp0YOFejRAmphDfu+g2yyX/kFdUUS60TJRQODnjdW3Ya0uhlRtjP5PmfTSCQUD4Kl0IGQXGk3QTPyhv6NpFgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pyn8DdyAG9/3IFSi9NUCmaEIxD0ivmDUXySR1DtglY=;
 b=J0X1V8GoGscsOhHQbHvcNYYz0zNZGzx3zqVuYfA4FJB/dnD0ooyP9pOBE23Lj+dmHP+CrMkTpiiPCzCydpNK3hV9JAJ6bTNHYD9lCIpPd66Sg/HD1XX1AqA+VYMThAKw2Ks0BRXBkclabH9Ju3alScQIRc7VEGNbkNb9oG6nocv9n8u79qhp+QiLAdgwL3kEJFl4LLYsNzWhZyOJsupoa/XR/5jHYabIndAYc/a7SR9L4WP2mTaDq/zNVtW7VRwmhkzMHYefaSenhAQJFBX6hIJvVcyGTo8wXf8Lwlwmao7+DHhYmeLGzFW0yn3e47DXD3X3I3O5CXj5pR+VpRefNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.25; Thu, 2 Feb 2023 23:48:17 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6064.024; Thu, 2 Feb 2023
 23:48:17 +0000
Message-ID: <77eb3a1b-8fe8-9476-3aa5-400fe0de36d3@intel.com>
Date: Thu, 2 Feb 2023 15:48:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/huc: Add and use HuC oriented print macros
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230131222837.1921-1-michal.wajdeczko@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230131222837.1921-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9e010e-902e-4e27-76f2-08db0577f4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uheCuM/mbPB25Q3vFHKBAYAJvqwdQ7rjkgELXxwxC0/ZAq7B6hlfvo6CbOWGGAs1y64Qk3SoKuNCVtAYch4J8Y25/zMCElhB1HY222loClvCUhdP+ry/MWrDwvfBE2zS2brlmC9/iYI4paCbFP3QtJvRRPwjTKl8uctpV3YCiC9yx3ytlVWPQtDi9o1ityr0/EkgVSldeiA5HxoHMJhyF5fGjSl99NTRmq1HvEh2c7ZHQt8HDZD9JIEobJkO9zrunDrLaD+gXWH7hK7itXYuUft1DHFRHT/GFJ/gM8na4VtgVqgFxZQY9elJoWe6BcP9jiiMkPzKCxy77/19lSJ2xqY1qz3rMx8/Lo+Q90ROlrNNQNMpebsPGj58pR6iG3VJ/sKIsakfp5u+jv5U7SlJUQRKE0CSCIXZYHdx6a6z+wxEeV3WqtYDohu5Yuo01UDlILj1WskwaxO8qJmUV8+ye9sTh4XVGIbOrbSoecIdbyKx4vacZbtGsHVaE9aIqJBCqh+LKOMFBcFaYH7y7h8aHVUahRJOMKXYs0J/OPHQfmowwsp52ZW0Cblfecw4QyN+T+kXrp39rXSqjMhLme7i9g9cS0kN9+70NGjO33uWjd6GuR/i7rbQ/tJt6zv5aGAxYSUkOQegYMT4C8Kmo3raBo1Z1UFy7zbAD3hiK77ZkxKog5vutBE194FhxZxy7T5PBzzptFLMkDGr2EFSgl840gygfuKVig/6Nx70IanmlLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199018)(8936002)(2616005)(5660300002)(4326008)(316002)(2906002)(8676002)(41300700001)(66556008)(6512007)(66476007)(6486002)(26005)(6666004)(66946007)(478600001)(186003)(6506007)(53546011)(83380400001)(38100700002)(450100002)(31686004)(31696002)(86362001)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVQUVBZcTR0RFdLc2FSVDRiZnprM2YrQXhwZVZGZlF4U2ROSExmRUMrMERz?=
 =?utf-8?B?Uy8yMVQ4STB0TG95UHFEN0VOT0xNaHFHVUYrNlhQVS8zYUZmUWkyd1kzc2Jt?=
 =?utf-8?B?aTZTcDFJdWloYUl3MEFHRmZwcEpVODZadUtXZHFxV0Y5bTZKd2d0dGdPTlV5?=
 =?utf-8?B?c1R6UDdOaHdUdlVEbW1DL1pNM09KK1p3Q2RsV0ZVemJvcTg4QUV6RmZWVjlS?=
 =?utf-8?B?UTVIdE9kbmVzVVNOK3BkUXJtQkpydG5VZHhzQmhlRHVJMUJjZFZhT2Vta051?=
 =?utf-8?B?eVBJMGlwZHU3bVE1ZHdMS3BsL2tBSldSNjhLNGJWYUtwdUlGVHRYRWxCZVRE?=
 =?utf-8?B?eEMwZ3NlL3FHL1JWdjVleEpOQms2bElQN1hSc0xlNStFRGxUOWl6WHdQMzNL?=
 =?utf-8?B?WXh1QTh3ak8rQ0VWMjBWVVlCaWJjRWcwUkg0T2FHVHZsYmZqczNNN1JpcS9U?=
 =?utf-8?B?RzZTVkRMd3RMSTBqbFpVMGVVNzNORnBReGd5SmtTdWNydEl1ck9TU1NCMFhH?=
 =?utf-8?B?dHZwY2wzSzVCUDZJZEh0Z2QrQnRiUDIyRUZVMzVYb2VGbnNmcDhGSERhT0FB?=
 =?utf-8?B?WEZlWVFudDRpZ0EzcXY3ejYxNG9UbVo0Tk5Na21iZmZVTVU1d2M1TVJMNnFF?=
 =?utf-8?B?eG5wL0g2NWZqSitoblpqdTUrMDVaVmJoaG5lM05hWXVPN0hnNkxSSFZ4ZjJZ?=
 =?utf-8?B?Q2cxbytVNjdJODVYUDV6UzFadHZ1ZUNibUQ5UHA0MTRpd0ZscU0vaWFBN3o1?=
 =?utf-8?B?aFQ5Y3NTakpubFNMTTFjczFudm8xeTEzWi9uN2h0NldiSDRKUWhmNmlFOHJ0?=
 =?utf-8?B?VlhWVkJRQ3Q5QnBIaTlKeGM1SVFiOTR1UEV2c09oKzY1dFhva2tITlM1aVhv?=
 =?utf-8?B?MzdVRWVGVjNnYUZEQUp2c3Z6Kzl6SG1NNkxKSEszeXAxcEsvajRLUVVmRHYx?=
 =?utf-8?B?bnN1NlZBdGppMGxIZTJHc0h3WjRDcXY4anVWNnlRWklGTGtQdHRyZ1VEZ1Nj?=
 =?utf-8?B?dnlBUmlCQTRCcmhkNmM1czBpYmM3TjhJMDFnMElHRUQ3VkJ0TWwxcVdwb094?=
 =?utf-8?B?L0diK3JlK2F3azBtcU5KMExNSTZwUi9jd1N6elN6dm55YlYrTUE3eTBNQlVv?=
 =?utf-8?B?ZVB2aGc3VFVBRmV5VjBBcmV5eU51NlVyV3lTc0pDdGxKZXBZWC9PbWRYYUZS?=
 =?utf-8?B?eEF1QkdkSjBSR2R3RGhzcjFXdlBwTSt5NGRHWVR5REJTL21hejBxUmhFY3Y3?=
 =?utf-8?B?YXJveDF6aGNxMnN2L1JpZ2laT3NUOXhUL2dkWXNYYkJvbUMvRUVabDI1RGZH?=
 =?utf-8?B?L242Vjc0L1Y5cmh2RjNCcm9ub0FJbkdDYVlDdTFCRmR4UDlqeWl1OVFsbnF4?=
 =?utf-8?B?cnZoOGlHR2h6Zkw3K1dxckxZblJ3TUJVRWQwM3VhdVMrQ0syM3BsbEpiZVF1?=
 =?utf-8?B?ZzVuVzFRRVB2V1RQeVp1VXNXaFk4TTFqRTdseHplcjBTWmx6NjBlWGdSdFVz?=
 =?utf-8?B?WVU2LzJnTENZaTBCdkJOejdBSmx4RDFBSDhTeTlVZzZGb3RobW9FZktEclFO?=
 =?utf-8?B?ell3Q1ZQQjFzdUlaNTlxZG9RRk9qVkpVR0MybkwxTkppczJ1SG00RjBVdWVo?=
 =?utf-8?B?Wjl5bEd2YlI3cnNOdUtiazVTekVJWTFPcWlPb0IxOHJlOWxHcGVJTDRvd3ZW?=
 =?utf-8?B?RW4vOW1xR3ZLaUdpV1RHRHREU0NBN2swaFhkdEZrL3VXZGZZVVJpSGtOTVls?=
 =?utf-8?B?cUlGS0RldVJuYW1ZSlUyS2NDWVNLamV1Q1J4eW5wUUcrRkozOFhWOFVLN29o?=
 =?utf-8?B?Nmo1cW1YSTdtVFZmaEdzVWQyeWJWQ20wZHRwQnEraEEyajhIVzdYUVNLQTgx?=
 =?utf-8?B?NVFOSkdGb2d5Tmdsb0FEKzBjMlJPcGczNVVIYytnR0F1Zjc2WGY5M2FuM3BT?=
 =?utf-8?B?ek9JTlREQ2xUNm1lSVY0NGlvS1FFTFpmS0puZktNek5aNERmeEN5amphOXcx?=
 =?utf-8?B?TUpIN3BCVzVJQlo5ZEVia3BCeHIra1JEcUQvdTZKUEJZNjJ0NFZWZ1g3V1or?=
 =?utf-8?B?M1dBZ3lMamsrNTJZRXlrekpIcFBDaEZzeTkzWUorVnk5QlkxRWI5UU9jblJj?=
 =?utf-8?B?TXdsemYwVU5VdmkxSE5JQ0JQY0gxQzF6NTJ6NVAzOGlKRlNGcWx3dXdLMFJF?=
 =?utf-8?Q?mDqEctvHxzGdnVhe2Nk7hZY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9e010e-902e-4e27-76f2-08db0577f4eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 23:48:17.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hsw+TRD8pNpK5ltjRXEala+yDGyNDLtSR9iuyaT6i/AHk0u6SKMDPqX1q8hXXu4M5EKAIfWzWWLr76GfrvHwnflyc0uuF8G5qD9cDLNxObY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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
Cc: dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/31/2023 2:28 PM, Michal Wajdeczko wrote:
> Like we did it for GuC, introduce some helper print macros for
> HuC to have unified format of messages that also include GT#.
>
> While around improve some messages and use %pe if possible.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 44 ++++++++++++++------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 410905da8e97..834e3b5b8f4b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,6 +6,7 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
>   #include "i915_drv.h"
> @@ -13,6 +14,15 @@
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
>   
> +#define huc_printk(_huc, _level, _fmt, ...) \
> +	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> +#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> +#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> +#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> +#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> +#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> +
>   /**
>    * DOC: HuC
>    *
> @@ -107,11 +117,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   
>   	if (!intel_huc_is_authenticated(huc)) {
>   		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI GSC init to load HuC\n");
> +			huc_notice(huc, "load timed out waiting for MEI GSC\n");

I think this rewording makes the error message less clear. We didn't 
time out loading HuC, we timed out waiting for the required components 
to be ready before we even started the load process. Same for the one below.
Apart from this the patch LGTM.

Daniele

>   		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI PXP init to load HuC\n");
> +			huc_notice(huc, "load timed out waiting for MEI PXP\n");
>   		else
>   			MISSING_CASE(huc->delayed_load.status);
>   
> @@ -174,8 +182,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
>   
>   	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
>   	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
> -		drm_info(&huc_to_gt(huc)->i915->drm,
> -			 "mei driver not bound, disabling HuC load\n");
> +		huc_info(huc, "MEI driver not bound, disabling load\n");
>   		gsc_init_error(huc);
>   		break;
>   	}
> @@ -193,8 +200,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
>   	huc->delayed_load.nb.notifier_call = gsc_notifier;
>   	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
>   	if (ret) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"failed to register GSC notifier\n");
> +		huc_err(huc, "failed to register GSC notifier %pe\n", ERR_PTR(ret));
>   		huc->delayed_load.nb.notifier_call = NULL;
>   		gsc_init_error(huc);
>   	}
> @@ -306,29 +312,25 @@ static int check_huc_loading_mode(struct intel_huc *huc)
>   			      GSC_LOADS_HUC;
>   
>   	if (fw_needs_gsc != hw_uses_gsc) {
> -		drm_err(&gt->i915->drm,
> -			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc),
> -			HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> +			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
>   		return -ENOEXEC;
>   	}
>   
>   	/* make sure we can access the GSC via the mei driver if we need it */
>   	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>   	    fw_needs_gsc) {
> -		drm_info(&gt->i915->drm,
> -			 "Can't load HuC due to missing MEI modules\n");
> +		huc_info(huc, "can't load due to missing MEI modules\n");
>   		return -EIO;
>   	}
>   
> -	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
>   
>   	return 0;
>   }
>   
>   int intel_huc_init(struct intel_huc *huc)
>   {
> -	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>   	int err;
>   
>   	err = check_huc_loading_mode(huc);
> @@ -345,7 +347,7 @@ int intel_huc_init(struct intel_huc *huc)
>   
>   out:
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
> -	drm_info(&i915->drm, "HuC init failed with %d\n", err);
> +	huc_info(huc, "initialization failed %pe\n", ERR_PTR(err));
>   	return err;
>   }
>   
> @@ -389,13 +391,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>   	delayed_huc_load_complete(huc);
>   
>   	if (ret) {
> -		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
> +		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>   		return ret;
>   	}
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	drm_info(&gt->i915->drm, "HuC authenticated\n");
> +	huc_info(huc, "authenticated!\n");
>   	return 0;
>   }
>   
> @@ -430,7 +432,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   
>   	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
>   	if (ret) {
> -		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
> +		huc_err(huc, "authentication by GuC failed %pe\n", ERR_PTR(ret));
>   		goto fail;
>   	}
>   
> @@ -442,7 +444,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	return 0;
>   
>   fail:
> -	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
> +	huc_probe_error(huc, "authentication failed %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
>   

