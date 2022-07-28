Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C87584579
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 20:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67DC113679;
	Thu, 28 Jul 2022 18:21:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E086610EEED;
 Thu, 28 Jul 2022 18:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659032485; x=1690568485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6zNN9K2WSswZX++gYjuTMm4Ctu4BPaw1jMEIjC0u+og=;
 b=RRzFj7UNPsZIpGh2r49iZBuuAzTauyrzeOkSMYKf16LedBhjTgsJ0OW0
 RzxKGA+apNTCUyn8szrhcEEei51EDXg1Iq/qkSIqDCCwcldCv8/xisgVV
 SZ1gIX3XeUTpkl9W3wLLJRiCnLcEs+BPY0kccUFENHRtpCyGrl3uSGA1f
 s/d84GvagZSbWmkURcjuV/dnek4hMllLbmq15i6dkRJui7MnpZVcuRfNB
 CbvzMGDuMuQjRqf5UEC2HTU29a4R4MOggHqfGXasM9HANFULhphRgg/Eo
 sGmktXGAQdzyd7q92K8v2SQ6sj+NHwzTOJPYGUzJBj4rv6LUOOl9WQ/Kv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="288597471"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288597471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 11:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="690429271"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2022 11:21:14 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 11:21:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 11:21:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 11:21:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 11:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F27pFcveD/OBVv0mbKaTUwC1ce72eXVZGNIlegFJdGx1JGYVxJu/fi6ZuhRxvL6S/DIgsbaqbublV2zymZp2yceHtLXBDcgL6YsLRhINSTs/TkYsINYR9cG8823sU2rsWXpiCABSWlk1onLYL3jlbxIP4w6MGB6j/xbesMp93lMynBTPkSV+xGKEQq8HY9rV+KV6Tj4WmV3kEWoZ2pQxLVndmy4CfrSUlp3y6qjdNIxyaYS+oAlqzUximkjNrd6tOCeZrF0z4ba+NkeXSYAaQiXb0VbYeIE5KghWwwyGvLHVTk1wIVlUiO0xW7+9MyyWdD4wE+YecM60MNR6WLJDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igmSyj8O4Cg1Mue83RGQwHPh13zJrt+yFp+vAvAyh8Y=;
 b=hNnlVu8+S6xGjRvOAXkj5D25Cu7zO7Z28NyADTbfg7bxQmmbLEKBEw87o93yt81iLp+megL/IWS0w82CJXfAm+moGFrFUgik6BHuIif0PMD+6h6SZRd7Psb6+PzsaCyZh+Uk/BASIrXypPYGIK3+0jh8hq1Dp0A+C7X4Rutkidwf9LusmYu/95RVWhFKZEEKjFlVCwrSrTyKx4ALdp156R2mw4IFErJW2PnH0HLAUzLMeL4B9t4ts4fDfB+qj/u3pCVDOZ3plPwSYemzoExrO5x66WwTDZka/fczqrQboafrXXRX7VDw8+IAGMSRELkovqy7DjtjuI9wSl9KPuH8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 18:21:11 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 18:21:11 +0000
Message-ID: <00c5f73d-271e-5413-21fc-3e28afba3178@intel.com>
Date: Thu, 28 Jul 2022 11:21:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] drm/i915/guc: Add selftest for a hung GuC
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-4-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220728024225.2363663-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aebf8da6-5afd-4895-e9fd-08da70c5f2a0
X-MS-TrafficTypeDiagnostic: BN9PR11MB5514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNaPciw46eQPG+xKzk8YIE2lg+B+GvUVXs161HI1YanKorasS1mxq1nk1//aXFZ/vofNX/e0Q5GQtpVs/2EF7p3dKGZUv/1ptGqbmDzge+VausgXuYLuU75EJRFruwqKHIgPamqkRrtsNCJDbLAq7DS2GXT46ojpGBCSkl0m7lSpP+sy1zy+5XbKHlNGSKDIvht9fRLbGiwtk+NfLFqS+4d08nFOTZQJAW8BtoTOztKzmSgcI7DohIuD7L0MrkG+UwabfmLtSyiEp2PJ4kIWorIMm9bSBP/jVtkIw8FVbutdFdCMorsSm2NSzHEVA5BI9RzlmBGgvrVI9WNQzI7X8qLVPJRXTaGijo+iRaBLSnIUUUn7RX8gIYredqUyFOX3fPBHNgkLd63oOFwpS42br5Djuwupk3p6wT3bcqzr68hJNUGLlPHVrt+EE5vMmLda4uTMHHWz9pZJGmK0lSLBifkh8tPIILas57PB7Utv02EMbv266BQJsnZ4hIVI8Qv393cXgntQwC0J+bvhEd08ubPglNKb6XguYmhMKqoyxNfYSmBSPYQGCxhO5gus2x5npGlX5J5o36pGY7sDQ3+5K4nsW52D01fNReOq2tBwpPvvE6v6vMMbSILtCOYBtkIhOcGMQ1vQD9Sp+cqImfqMcOuXK9ypQWdsDeKQpLv5yOirMZSXauKerOE0cCYUw2AC03bzUg22STsc69Yyhni/TIqxLMbTO+qRXXCCYuByK7olF+hoLa0WENm23t68cP/5vG38V4K1H3QfbJovczK9UwW0mEZWM6RSSF8dkaLA1cNxP7ildMzfgJxKCu6vPZMTLl7cwc3/9lbN1/iKNU/AOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(366004)(39860400002)(376002)(396003)(41300700001)(66556008)(4326008)(5660300002)(36756003)(8676002)(450100002)(66476007)(53546011)(31696002)(6506007)(6666004)(2616005)(478600001)(6916009)(6486002)(66946007)(107886003)(2906002)(86362001)(186003)(31686004)(8936002)(82960400001)(6512007)(38100700002)(83380400001)(316002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JwSHBwM3M1ZkM5Y29pWUdkVlI2Q1JYdGh6dEZIRG5NbDdPcldKeG11aFl4?=
 =?utf-8?B?dTFrcDYzeHVySVNINVJ4cEg5OVA3bXlwTkMrdDdDd0J5ZXJTbFlMa1VCYldt?=
 =?utf-8?B?VVQ4d3lsVFd0L0RkMU9WNnlmb0JPdWxSckNpcG44MldQWU83bzdXWTVhYWNo?=
 =?utf-8?B?OTlqSHZtUHZnQWt0b2R4dFlPVnFyalBDbTUwSjErLzdCSmpmNTVpbU95NVFs?=
 =?utf-8?B?TkZTUm5BZ054S0lhNERBL2ZPOXljZTgzN0lXazYydE16bGVOMWM2T3hTendj?=
 =?utf-8?B?Ly9nS2l5dnptNmViSjlJNVdwRXREZGltVkVkTVMyeG1QUk51OHNnWXhRNTBD?=
 =?utf-8?B?cWUxN3FKMTZSbW1lMUFTNkcyQWVnZGRjSDRXYWsyenpOYVYwamtLVktuUWJH?=
 =?utf-8?B?Z0F5eEVkZGx1b0hMS1FGQjljUUVFRmpIWmQ0Z01VNVUrRmRPd09GNG5VR2o5?=
 =?utf-8?B?bnY0OHMwUDh6OGJqank5QnNLbVlJNmtOYjF1ZTZQWFBzU29ESEdicGIyOXRI?=
 =?utf-8?B?OGtSbDhBanR0UWRCaFRhSUpQVUw4YTZuZXJ3VVhERytWK09oMDAxS3FiNXlv?=
 =?utf-8?B?eUhXQ0dIQW9NTEVoTHlhM040amVxRFVzSUNJTnhTOUcweGRyL09zbkdwWlVV?=
 =?utf-8?B?TVMra3prSkVqV1llR01NUERoRXE1bnlGQktqeDZjQkhqSjJBcVZ0TjNNZTVU?=
 =?utf-8?B?RnU3RTRRZmdTcXk1a09GbldkTGkwTFBuSERnUXU1ZElyaGNRTnF2MWs1UW9i?=
 =?utf-8?B?SnQ3S1NBS0k5bWkydkdZVTdNamV6RVlZWkxoZnpvTjlaaFVwT3hlNUZadGlF?=
 =?utf-8?B?K2xLbmtjQ2xLVnQ2dEVac013TFYycHlLdWU3dzFmK1Uvd2VOc0V5YWNHQlFw?=
 =?utf-8?B?NUZSZ08vQm5hU1k5RWJobDd5NTJydS9lY2JyVkpQU29zM2Y5anFmcCs1K0lF?=
 =?utf-8?B?VE1pcTNoOWgrdjJmTjkrWW9QU0dybzdiS1Jvb0Z5ZWlUSjJXS0U2NFFyazln?=
 =?utf-8?B?ZE1RSDcreHJBb1RTa1hUSlRWeUhieFFSd0Y1K21ZbVBMYWRUUGFLdGVCSWRX?=
 =?utf-8?B?TlgyNDR3MHlUREpCMFh3N1FtT0lYS3E5SWFJdkhjME1Ka1E1a3Z5VXVPVU9m?=
 =?utf-8?B?RTlXR0oyUFZIK1VxVGZwTm1qRzJiazVmaStkVVluTy9hMG81ZE5WTU9WZjJm?=
 =?utf-8?B?Zjh6ZDA5V05LSXFBbjFrak1IVk8vSUhyc1N3Z3ZUbmRLVk5HV3B6SHBzWkFV?=
 =?utf-8?B?MnFOd01USXdqVUlBQWpBMk5aV3VCVEthZW1yTjZkWkIwSjI4MHNMM2FocVUw?=
 =?utf-8?B?TVJZYVVENWlta2pJZ2RXVjQ3c2dINHlzeUN6dTAxaUV4M3RnaUxuT2hmWHdj?=
 =?utf-8?B?ajVGSlpuVVZaNUQwazBTLy9leHkyRWphT0UzUk4vRFFaeXRzYklyOWFaaEdl?=
 =?utf-8?B?bUN3WnZrTXRiN1BUWVhBZlpUQWtEelNZWGxpUThHbGIyRFdDNjdDSnB1SWI4?=
 =?utf-8?B?QjR0MHUycFF0OUUxRGc3RTBJQlloWWlxbUhuY3dla242N1ZFRjFFNWJzdFhO?=
 =?utf-8?B?bWhmb3pmMUNobm1ueGtQMFRWd204Y1lKaExIdHppejdzaktxN2ZFbDl2SVBJ?=
 =?utf-8?B?Z0wvMkV1RGUrdDZ1YkVDNitUblhUNG5jN01RNC9MRUF5dkcvOHJGeW9lc0tK?=
 =?utf-8?B?NGJJd0xObmt1T0dhd21iZndyN3VvRkpJR0pMdVljOTZoUVhRc0kzWWVPSTUz?=
 =?utf-8?B?c2JpMktsYVZ0NktYd1RucXkxOHlSVTZUVXR5K0NKUlUxVTlxblZTY2hSdGw5?=
 =?utf-8?B?RCs5b2oxakw5cFJtZHJlTGJCWUVwWmtJNmllZUdubnZXZkRiWDRIVjNqMERw?=
 =?utf-8?B?VnhxeFdFNjQ3U3Y2NUU3S1ZkNkNtSk5sWjhWWjRBbTY3UWxIK243cWoxNmJK?=
 =?utf-8?B?cWpyMUJqN1R3ME42azlXLzdKNVA5c3o1Vk5LRTQ1UzVMSm50VTlZc0tKRVpr?=
 =?utf-8?B?TUVDVHhOVG92d3UwNXpCL3Z2UnpVWDBzamNEVGRESS9ncXNUc21zYU13c28y?=
 =?utf-8?B?NTdBWHVraGg3K05zYXRFTFlXc1BSQjdBNzRTNzJWclc0OWY4RjVidFVCbDZp?=
 =?utf-8?B?QmdXc1QxamREbUlOWW96UVR5aUczOUN0ZHRLT0RCdS91eStaZldGaWlPVlNq?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aebf8da6-5afd-4895-e9fd-08da70c5f2a0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:10.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+ZKH1S6xQQ+ykgKssqRgYqc8TtbEB0C1pLJsgFIq9GIOK+LdHaDoR19IlGst4gx4WJ5xUdfm2BXLj6GdUAi+BtOrQitHow7E1y6l48xuzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5514
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
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2022 19:42, John.C.Harrison@Intel.com wrote:
> From: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
>
> Add a test to check that the hangcheck will recover from a submission
> hang in the GuC.
>
> Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   1 +
>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 159 ++++++++++++++++++
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>   3 files changed, 161 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0b8c6450fa344..ff205c4125857 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5177,4 +5177,5 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_guc.c"
>   #include "selftest_guc_multi_lrc.c"
> +#include "selftest_guc_hangcheck.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> new file mode 100644
> index 0000000000000..af913c4b09d37
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright �� 2019 Intel Corporation
Need to update the date.

> + */
> +
> +#include "selftests/igt_spinner.h"
> +#include "selftests/igt_reset.h"
> +#include "selftests/intel_scheduler_helpers.h"
> +#include "gt/intel_engine_heartbeat.h"
> +#include "gem/selftests/mock_context.h"
> +
> +#define BEAT_INTERVAL	100
> +
> +static struct i915_request *nop_request(struct intel_engine_cs *engine)
> +{
> +	struct i915_request *rq;
> +
> +	rq = intel_engine_create_kernel_request(engine);
> +	if (IS_ERR(rq))
> +		return rq;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +
> +	return rq;
> +}
> +
> +static int intel_hang_guc(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	int ret = 0;
> +	struct i915_gem_context *ctx;
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq;
> +	intel_wakeref_t wakeref;
> +	struct i915_gpu_error *global = &gt->i915->gpu_error;
> +	struct intel_engine_cs *engine;
> +	unsigned int reset_count;
> +	u32 guc_status;
> +	u32 old_beat;
> +
> +	ctx = kernel_context(gt->i915, NULL);
> +	if (IS_ERR(ctx)) {
> +		pr_err("Failed get kernel context: %ld\n", PTR_ERR(ctx));
Should not use pr_err when drm_err is available.

John.

> +		return PTR_ERR(ctx);
> +	}
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +
> +	ce = intel_context_create(gt->engine[BCS0]);
> +	if (IS_ERR(ce)) {
> +		ret = PTR_ERR(ce);
> +		pr_err("Failed to create spinner request: %d\n", ret);
> +		goto err;
> +	}
> +
> +	engine = ce->engine;
> +	reset_count = i915_reset_count(global);
> +
> +	old_beat = engine->props.heartbeat_interval_ms;
> +	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
> +	if (ret) {
> +		pr_err("Failed to boost heatbeat interval: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		pr_err("Failed to create spinner: %d\n", ret);
> +		goto err;
> +	}
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	intel_context_put(ce);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		pr_err("Failed to create spinner request: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	ret = request_add_spin(rq, &spin);
> +	if (ret) {
> +		i915_request_put(rq);
> +		pr_err("Failed to add Spinner request: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	ret = intel_reset_guc(gt);
> +	if (ret) {
> +		i915_request_put(rq);
> +		pr_err("Failed to reset GuC, ret = %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
> +	if (!(guc_status & GS_MIA_IN_RESET)) {
> +		i915_request_put(rq);
> +		pr_err("GuC failed to reset: status = 0x%08X\n", guc_status);
> +		ret = -EIO;
> +		goto err_spin;
> +	}
> +
> +	/* Wait for the heartbeat to cause a reset */
> +	ret = intel_selftest_wait_for_rq(rq);
> +	i915_request_put(rq);
> +	if (ret) {
> +		pr_err("Request failed to complete: %d\n", ret);
> +		goto err_spin;
> +	}
> +
> +	if (i915_reset_count(global) == reset_count) {
> +		pr_err("Failed to record a GPU reset\n");
> +		ret = -EINVAL;
> +		goto err_spin;
> +	}
> +
> +err_spin:
> +	igt_spinner_end(&spin);
> +	igt_spinner_fini(&spin);
> +	intel_engine_set_heartbeat(engine, old_beat);
> +
> +	if (ret == 0) {
> +		rq = nop_request(engine);
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			goto err;
> +		}
> +
> +		ret = intel_selftest_wait_for_rq(rq);
> +		i915_request_put(rq);
> +		if (ret) {
> +			pr_err("No-op failed to complete: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
> +err:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	kernel_context_close(ctx);
> +
> +	return ret;
> +}
> +
> +int intel_guc_hang_check(struct drm_i915_private *i915)
> +{
> +	static const struct i915_subtest tests[] = {
> +		SUBTEST(intel_hang_guc),
> +	};
> +	struct intel_gt *gt = to_gt(i915);
> +
> +	if (intel_gt_is_wedged(gt))
> +		return 0;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return 0;
> +
> +	return intel_gt_live_subtests(tests, gt);
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index bdd290f2bf3cd..aaf8a380e5c78 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -49,5 +49,6 @@ selftest(perf, i915_perf_live_selftests)
>   selftest(slpc, intel_slpc_live_selftests)
>   selftest(guc, intel_guc_live_selftests)
>   selftest(guc_multi_lrc, intel_guc_multi_lrc_live_selftests)
> +selftest(guc_hang, intel_guc_hang_check)
>   /* Here be dragons: keep last to run last! */
>   selftest(late_gt_pm, intel_gt_pm_late_selftests)

