Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E916567F399
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EF410E2DE;
	Sat, 28 Jan 2023 01:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C6210E2DE;
 Sat, 28 Jan 2023 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674868409; x=1706404409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=05AvkRmLSiQUN7GZVjj4NOvINId6oCrNAkFgvgvgmTc=;
 b=BDw/mdQ/ydQDhQaa8o5oeW2DcuhM65/7t6QerXDLrWu06mRW6k/XkXnS
 i+8NLpH7SwjSlHjgrR630bQpbaFfsR9Qr+b47DKljXLLV9abhS3BVxRHC
 QoCQ/U6N7RG/nAMm2bHGxe/5PLm2lcqjMcwyj9fbK7BkFyBbenOzFs2uJ
 8FAX9yDm0zWU1//Oc9biwzog/J++BHl9tK+rAjIzVakIhDodIa8n+KjSK
 tpliwnlT3BqYI/ac9Dsxrz875iENm6PHy+oJjaRr26xaP5ZPGYohCQeGk
 ZSjqwV6752SVQ+G2oJ6woB5RrK4aEwtqjI+Z2oYPJyLUSzq5/KxWbO/wi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315197279"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="315197279"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="663468937"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="663468937"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Jan 2023 17:13:28 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:13:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:13:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:13:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wrx/CTn72Tt15GyTngOtGX0Rhk2hNBkUKXs/V8UWivjRm7QpuBv62ESnSnSuxoE4vSOgY1iJC3yPNm7Xvd4fKqYU17W3mYJIwrwebqsbKLtL1wdMQb0Ybc1fqIWyZyFkojH4RhiS6QSG8GOxo7I2oCUPl7Qnh3ynKiuq+AL76XRyihYkDFgbywGxm8/+0DkPkirdJXkpyWvOmFrlEgJ9l/Rd4WUIGRrTutxKNvSC2tpgnidlrhYgzHqY7R8R0RY3I5b2Hg2XhNCy4K3HwVi3c7PMbemrnHqfqsjSDdbHSnIu06+dalabs6Rwc25z5cMkUJqqoWwSyurGcl7+oZRYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2Zsft1xpmUfEOQwAaZ99aPk0FEjPPojTMBHWHXe61I=;
 b=ir2BoskCh9q+gXQsHpuhkwmPsQTDtPCDoR0MoibOsL2CvxIbODIW/Xusrn0hWeuOf+nvkIpZVowwebSjHZ0WaV7M0jLgUamDzUYAsCfY5GdSG/vRsvRsKLlKcbJUloGLsYJFzPi9S/IDOZgk1raHP9IUVBRxB+0wlOvcgZ7/Y+5AJqo4Xhgv2GXKfS1cS7Z7PGtwWVE1cBK1jWT+PGD1MS1F5qLM8Mq88SBa7C4nyI3wbX5z/I9r7gKSue/6UNzAUUre/amDX+0HR9pxVCaFl+PV3eeyY4RIJJpsIltJ5bYlDz0q2PhrXru0pvZDkzTBs1U44OXNnKNScjaXRisZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Sat, 28 Jan
 2023 01:13:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:13:00 +0000
Message-ID: <ec66dd98-b51b-105c-3424-7bbc33d598b7@intel.com>
Date: Fri, 27 Jan 2023 17:12:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/8] drm/i915/guc: Update GuC messages in
 intel_guc_ct.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-5-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM6PR11MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b6f822-34f8-4489-c3ed-08db00cccbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OX1HdQ4YmRHpFt8VrcRiopRXDhPP5XglsefwhlAG/6KQjvnXZ0oRVxyRpScXZ7Sophd1CDqQ8SVCSt16dsgbxAHmv45Ip1vbWIOx3eofA1PEEBn+meWJpyayAuFm/QeHOmNR2iAxlNDLwT15Bp+k3mowQxI0PYV+TMSibQ08g/ZN1PLLmxIiOFaLS3VD15JklCIqGhaEQwo7+ncGefvlWKuGT2x8GoMclpya3Z3+HbszbLk9CGe4QIeFVmIaG8dqEgFffNNfE4NujiCHDuPcIsciS2OxA0gVrz/EtLultm+BrLEEs4POXxD8RIS4GLOIbHWIX5j/SgaoXbrsKBeaMgrxyqFZb8ACrisjJ9+KaHWT9j4clWa6gqxoKaPGf+y82J4o6ZUm1r7/YRCASyxw6sMSI9VhkIds4IZ5HB6mfm6+5Oi76bjRHt5hhJrdqpEldUtHpHZZoOKYqOmvF9hnF7/0uQj3uIJsAwPHedzjWw4os3HBnSyZXj4mMyR2dxwNergoZU8MjOkxnNltIC+1BNLT9outfRtseCax8QUp6igc+Px50C7f1quio4dzNVclj6MRUdvKVcqxEe+/AG8DVdW5TTDiryuf2h+sk1K84lrXPvvrNcY0GU/5ARJsIuUIu47Gauc9s+EeWjAKGfpmNZXfqRg5FFOySMx2BCJn9mS8Rk2zCVB23ZbAbLpdkiSKQL4/vHhX1fK9E6rjxFTtvDXW3oQiaCpPGv4yBWl7wdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(6486002)(478600001)(31686004)(6512007)(186003)(26005)(2616005)(83380400001)(450100002)(41300700001)(8676002)(53546011)(38100700002)(6666004)(82960400001)(316002)(6506007)(66556008)(36756003)(8936002)(31696002)(86362001)(66476007)(4326008)(66946007)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhnTTc4ZlErOFF2ZXBITnZqVUFjczk5cjlNcXUzRkVnZTVJWExMb0kyQWxx?=
 =?utf-8?B?c2wvbk4xb2JOd3lVTlJmTXJxb2F6YS9WUHdTK1NRWE44cHFDdWJ5c1E4cXlo?=
 =?utf-8?B?UnArZFVucjl1RS8rM09xZXJuYTlJRitPRkJmVW42L3dhazl5NWZPOWEwTUxq?=
 =?utf-8?B?UWM2dlQ4aXlMd2wzTWMwS2hvb0JrOVRNZ25jSnFPVXhHUm9BM1BmNVY0dkYv?=
 =?utf-8?B?aVRiQ2U3cWRjTFh1WGxaQmZ4Y1FQTDIvV1ZzWm41RXo0NkJ2YWE0WFdOa2dQ?=
 =?utf-8?B?QzV6dGVHODlQdWhuNk9ycjBNUTdKNkhXa25reW05OEh4aFMxSFZmUE8vMUxJ?=
 =?utf-8?B?UmdITWdMTW8vMmZsMHQ1cXdDNUdHbFBWZ3luYW1Ga21HTlZyL1g2WjVUTk1x?=
 =?utf-8?B?SGorYkhWZU9BWXNSMUIrbm1qd0poSXdkSWd1K09tVnJtMCtUcnUxYU94Yy9x?=
 =?utf-8?B?S2QzNG5uaHY4WUdXRVVvanJ5UUxGM2EwRFFsbGhJUVNnWmhMcjFITVNIeDNB?=
 =?utf-8?B?a2FjdGlIYjNVaVpDdXFDRTBRb1NlQURlMXZSMDdHUy9BeVJwS3pJUVZ1QmFB?=
 =?utf-8?B?MklQRjJNYWlyMTBnUWpLRUErZzUzYUh1Z2RxL3BkTXBNMlFUK1FueVpCeUpY?=
 =?utf-8?B?Z2ZKck10MEJTTG9sZnNabUQ5a0dhVkNQNXNSalM0UlZ6UXNRK29BUFlFU2RQ?=
 =?utf-8?B?Tlp4SnFzUUorbGhmWkRXZFpaeUhWQmc3dDM2TXBENTBRL1ZBTXhNUDgvLzVX?=
 =?utf-8?B?Wk4wM2prZTdsaVRoNUpMd1RVV0VGYWdIM0dZU24wRUhNWDhKTjlvcnE4d2dv?=
 =?utf-8?B?WjI2VDVRTmFpOWxmU2Rhd0NiZzQzM3ZxMlJUZXV1UG1hTTA3aFNib1h3N2lX?=
 =?utf-8?B?QVhDendlSysyNisyRHpKVEVuL0R0UmtxWDdGN2VaOGEra2YwazVpVWY5RURG?=
 =?utf-8?B?QVlWbUhuMmJUWDhuM0xFWVl5RlJISFI4TFRlNHE4Zk9FT1c4RFRNK3luQ3dr?=
 =?utf-8?B?ZENHbVlyd2tyQkJXYVlMa3BQUVVlWXpGQ0tHSWpJMjlQZ2d6cVRCT3hFd2d2?=
 =?utf-8?B?ck5PUG9JUUtOU1UydUhyVjRIdzVwZ2dPQlJZVWlqM09vSXdNbVd5aFJVV0Qw?=
 =?utf-8?B?SEJMOHdDMFRwNlNoWHdPSnQ4NncyMGN5eUZsdEtmL0t1Rk5iRFk5clVrTUZl?=
 =?utf-8?B?TitQZTZFdExmV0ZMRjBTTGJJQjdQY0lsMTlGY25saWUydnVaZmY2NUlJVmFN?=
 =?utf-8?B?QU16Z2VZNzFNR3dDRnVIOHRjNnVUOTdqZExCRk5vTVBZcXNLQ0NEYVdDd1VP?=
 =?utf-8?B?MlpXMHROdnoxWVlIcnVlS3gwNEE4T2xPTHM5UnpGb0ZTN25tcmlJTDQwM3lM?=
 =?utf-8?B?MklPSUpNejk4bGdqWlpQWVhTUnpaOHIvaGxOWWZQVXN3VS83RWNaWnlNMEF1?=
 =?utf-8?B?UG9xL3F0S0hObW5UNjIzSFFMbFh0eU0wUU1nUmt4UlNVTkJqelk0bTJHOHlQ?=
 =?utf-8?B?NW1XWGV5bVZMYlBZQVhaU1c3Q0xXL05NcmdEV1RLdXRjdEpITmhDWGN5ZkZV?=
 =?utf-8?B?MTVMbGpzVjJYNXhqQWUycDVZM3FZSTZONnl5dUZUa1JWanBRNmN1bCszZlJ0?=
 =?utf-8?B?aWNJTk10Ylh3Q1dhcjdnR0M4aXRkc2duSGtqd1VXeS9rQlJNWDJPNkRkWEwz?=
 =?utf-8?B?TUNPZlBmbGxNQ1pKK2QwbmxHZDdMVGVSSWRXTmg3NVFibGtDbFdWcWtwTGVO?=
 =?utf-8?B?MEdXaDIwVzRKVGdBMmVrTDdzMjF4N1lzdDhURjlJRDNHTE9tT0o3dENjZWk0?=
 =?utf-8?B?ZS92azE4cG1KSlhEOTA4TW9idWpiY3pQNXlrbVBteTE4NEJ5cnRjOVZrU1NI?=
 =?utf-8?B?R0NveXVISEZyV1BMK1Ftd2VtemgxU2pEUWkzNnVmcFNqOVRhZ3QwSjdKTmpJ?=
 =?utf-8?B?MFBOcDVwOWJWeE5HMjVJdks1MEVXYTJLT2lUeFBVUlhRMDlSS0h3RHBaWUZ2?=
 =?utf-8?B?bDJ0bUIweXYxR042WDNyU3pDazNxaFFYMFFKWXJlWGM2THkwVEtWWWhqcFNz?=
 =?utf-8?B?dlBTTnF1a3JUZ2M4U2FaMXpqdUdVeVRIWVZ6UlR1STRWOUEzbkgweHBXMWdi?=
 =?utf-8?B?a0hIbHNxeHdHVHBiR3didWJzMmRqNmVIeWdBU29vNmM0MlhKSHplajFjR1M1?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b6f822-34f8-4489-c3ed-08db00cccbf1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:12:59.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXXjFUZFztKkhKeQOPJOoOUSj/MMrOtroUBePhIwCaT1RiZ3uIyNnAwG1Xp1JD4WdPszpKwByXqF8GdgcyUjPs15hn/v76+4KsMx5RjfK9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
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
> v2: drop unused helpers
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 23 ++++-------------------
>   1 file changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 2b22065e87bf..1803a633ed64 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -11,38 +11,23 @@
>   
>   #include "i915_drv.h"
>   #include "intel_guc_ct.h"
> -#include "gt/intel_gt.h"
> +#include "intel_guc_print.h"
>   
>   static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
>   {
>   	return container_of(ct, struct intel_guc, ct);
>   }
>   
> -static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
> -{
> -	return guc_to_gt(ct_to_guc(ct));
> -}
> -
> -static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
> -{
> -	return ct_to_gt(ct)->i915;
> -}
> -
> -static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> -{
> -	return &ct_to_i915(ct)->drm;
> -}
> -
>   #define CT_ERROR(_ct, _fmt, ...) \
> -	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_err(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   #define CT_DEBUG(_ct, _fmt, ...) \
> -	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_dbg(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
>   #else
>   #define CT_DEBUG(...)	do { } while (0)
>   #endif
>   #define CT_PROBE_ERROR(_ct, _fmt, ...) \
> -	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
> +	guc_probe_error(ct_to_guc(ct), "CT: " _fmt, ##__VA_ARGS__)
>   
>   /**
>    * DOC: CTB Blob

