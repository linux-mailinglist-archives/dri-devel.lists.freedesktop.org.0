Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95106617364
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 01:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BDE10E551;
	Thu,  3 Nov 2022 00:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4B910E551;
 Thu,  3 Nov 2022 00:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667435679; x=1698971679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xKF06oi2CWwKYVl2OcXXBb1Y12MvHCmdMPF4ZgmAIO0=;
 b=GC2PKvolh86Y7GZaaxHyctMKR+0PVn1rsLv7v6EgnaICCA0sXy7Vciuy
 1vdE4zNHxSlc1d1ThnMuqm10O6JlZRYf12Q37zqkUDspCVUVTrotmso/X
 V8i4u9ECEq/Uu0upIJT6xCN7xfJDFVuxQ6TzRMMc9hDLy/K45DIi4EuCT
 VrkqReunCHqBJuq+m38PkwzNruOrARky2wCN0eS0jsjbxmrU9wJfQsCxP
 T01Sp/MzBDrokYNmHtZ0nATrvBOYGF0E7z0xL2vJ2KC/ZlIi5jeRtqNFA
 cSivkRrhEmC2iIKkoRHIoU57XppKoS+P5Ym+OeqJxmpZtQKoN1nA1FMz2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="292871694"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="292871694"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 17:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="612446860"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="612446860"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 17:34:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 17:34:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 17:34:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 17:34:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 17:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciTn/RopJ2cdRetR1ucoYn0bPvjuhIak1L2JnjGRtR92bFjEBvg+YxjYWDPz5UrC7nw/a8WkdMp6MlQQbNKdVX2bI2AJk5otilQNjjg+Gt44xdobAiNez3gWgVkFx32GNIrT8ybR92ttC5sU1Bij16pp+x1j2BCGZdtAhqIFbuQT5R1GmWQ+AqAlMZZ3QQc59RYnt/Nx5iZRTQlC3/TnTVOnwMG4XIgSo7+tyEHFY1pAAFnmCnyij1XhK16Kr0P7qo2NBl7524fZ1j4QNClAN2igecYRmLp0zgN6iOvpa8EFDMUI+bA515xC/jK8ZGaw2uCR+FFpDOcYXUvFlOY7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLktrpTj5tlVdxpuLyyGi+WdhyU93+TghcPiSbzzF8I=;
 b=e1gbTQ6sKp+kIPuRdpPCO9Uh7TmkkDWdqDeGOOcI5hullw1tWbqbeIWGYrlRc9MXnPuqBPqJakmozMhp3r/WwufCRcfqETGXJf1VTC+IjHKJKHtE7E7CY24SYI9mh/f5bjf6D9cZbMHjxipxphmJnnq44VS5oBJsqY8hzMnV4x1QH2fLMwMgxkeaGcT3Qh9b4lo+5am5MJYwNVbyim2vwLqA8Z9xhjE+3PA18EZW7BNpazqzSGJNsbK3mKAuA3YGN11WAfjom0kiu/bnGNcdzu8+JlpyT77vFdTddNw/wP2TWQGLVrbP1WPHacqTo13wgiQzWO9leQyqmxqMcjWg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 00:34:35 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 00:34:35 +0000
Message-ID: <089c8a55-16f8-cdf2-c301-17310d4f01a4@intel.com>
Date: Wed, 2 Nov 2022 17:34:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/i915/guc: don't hardcode BCS0 in guc_hang selftest
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221102214310.2829310-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221102214310.2829310-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 270cda7e-79cd-4b09-864f-08dabd332e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86Crvn8GJDRF9c+o0o7e+2lRF1J7Och+wWITSKTMhLExfa7D6fgMprZOaBPDRg+wHBs4K7JxVs3QJwd4gO13vg7pGAnV4U4CGqHF41EckfcVIOzbooxLVSfQEaXKGkxxPnGMQSk+ueWkdmsB4u+voINh8XPc8tMQ3L87h4kvcaMY1fwmzQk3yjHJ/Y60F0nbZebKS3bBeCzBeMTVcEbOdFLvw2RYXiJH+5D/84PJ0ayKXVUxFn/DOM7KhBP9v7JvGsnLCBNoaYuztQ4PEq0evQtKqgEkanbGgaYXnbzuvyQGjvo6Ieb5iWjCcu1Z3JErt6Vv9bybsQcC44SQaPqotTL0xFU2j1xLdjrUqX+J8qjp1cmDp2IrXQqasCgkMbBIHWDEFAyUxHkuI4x7II+a6HS0l8SqRgcQa++qnnC0b72XC8RSKTE3YLXePB+W3LPYGwnDaF4MiFWJmcZnVW60oRrsqBtHNsh16d1eHGYr+cIY8cP1YyoRdjvsfJtSf+cpezMNh8vwmvHW4x6ALyUpeTeXlxenrZoQQkmB6aMKIe22y9qL5PFlNj5DHQrBjNdAXDOG8ACNuVOb1hByCLmgcjSHzjQ846P2hSKDo9pitmdX9VPRpVYI5jwJHegZSaewCsKONZtawlydSR683kPuxkkhdDKZ6m+WcTqKVy+SDsgkpM+neFJCFtsnVJiW28DxW+TpMu9Kna1u9bwiLIKnlT/R5CSQ0L8fj3U5wq3aUQQJjaf2g/gHD2QIuROy8zuSH1CUZcKMlExqdIZVa9uz4alwQrdGjhdD8GYa2g/pMno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(41300700001)(6512007)(26005)(66476007)(6506007)(450100002)(66556008)(8676002)(53546011)(4326008)(6666004)(36756003)(66946007)(83380400001)(38100700002)(82960400001)(8936002)(31696002)(316002)(86362001)(2616005)(5660300002)(2906002)(186003)(6486002)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU90Z1F4T3k3K0xWeW42YlpVTjN4djMzdE9nWE1yelhmaThTTVNnY2w1TjRD?=
 =?utf-8?B?UzRSV3NyNDhXZnN6TW5mUEIxcXJhSXQ2ZDE2RkF0L1dCZGJzKzV3eXljcDZF?=
 =?utf-8?B?VmxpM3oyWlBiNGloSFQ1eDNuT3BwYkVmZHhtbWRWVEc4QUZtdm44Q0lDdi81?=
 =?utf-8?B?anVzV3pzS2JQY2F6OU11a09JSFVmaXpDbjFzYXlXbWhZb0VNa3I0SXRYQ3h4?=
 =?utf-8?B?aTFmSy9qOWFIYjdQMDVGdjhUU1RUaHBKdjJ2R1I5Z1VSTlpjZVZoVHg5ZERl?=
 =?utf-8?B?R3pYZEw3M2t4SkJRZ2dFMlBNaFJ3UmZieDdlUmZBQ1o3UWJBTmcvQ2doOTFq?=
 =?utf-8?B?Um5zTDdPOXZQOStqNzdUTzRURURDamtwZDYxcldNVTBXZGZpdWVGUjdNU0hw?=
 =?utf-8?B?QlB3WStnTHIwczA0WHh4aFpNSlZhY21QK0JQc1p6a2Vrd0ZiN0MyM2lkazRr?=
 =?utf-8?B?T25CMXc2U2lnS095VFk1azFCZ0pHcmJIVFRiZ3pFUDRwM0dJVytBMzYrTkRm?=
 =?utf-8?B?Z3d4ZDBEQzBtVitVbWtZdVoyOEdtTFF6N0kzTlJIek9SVmVQUytGa2ZIY1hU?=
 =?utf-8?B?bExKNG1tc1hLeTgrdXI0dlJyMXdWZzhQOXRQdHIxaGs2ZzNMRDBMSFRhM1R0?=
 =?utf-8?B?TkdnenZCYUIxM28wRzhMRXlULzFYNmdtRjdJWDNEdDJpRFRuK3krdEJXUGdQ?=
 =?utf-8?B?ZjJYajJEWXdyaDU5OG5RS3YyN29PK0lUYkhKMUlWaFNwVkYxQ0dhWURvMk9W?=
 =?utf-8?B?WmNod3AvOEdJL0V5Zis0Q0didzV1Vis4M1RERXAwLzNkdGFJSlBDa3lFTkVD?=
 =?utf-8?B?WlVoNTI5NG1uYnFBZFg4WVBiZmhyR1RPdFd1UDRmY1ZBSG1renJLbkxQWDZu?=
 =?utf-8?B?ZEpYb1huTEJSTTlGNnlBOVA0V2QwdnRFTnZBSDZmN1dtdW1xVm9IcHFnUnlo?=
 =?utf-8?B?MjFTcGNIVy9YOWFnNzJBcWNMUi8wb1E0RGhuNXh2bWVCMWNWeDdobC9jbXNT?=
 =?utf-8?B?eUpwYzQ4RlVSRlhZMTJ3V0pONE1hRjRLTndGdGFYd0xZeXZiZlpCWWpUVUZj?=
 =?utf-8?B?ZUZ6dERPRzB6empTTC9nSDc0WGFFMktacDJuVU1ham1zaHZBbThsNU1PcGdh?=
 =?utf-8?B?K3d1UlNNcEpac3dRYXFHM3ZyQTBQWXl6QithSVEvMEdFN3YrMm9HdzNaUVpF?=
 =?utf-8?B?QU1VM0dMemV4clc4Q0lSY1FYeU4vUTlhcTRYNEtnYVhqc2Nqam1kWUE2UnJN?=
 =?utf-8?B?aHo3ZzF3dmQxM1ptTnRjcHZncnQ4V0luZXgzYmJVTXozY3dSL1RHNDJ0WlMz?=
 =?utf-8?B?ZzVROHJUcXpWMTN3RlZWTm9HdXlDQVNrN1MzZ09iVzBOZit3WlNpQWNGSGpC?=
 =?utf-8?B?dXlTMkExWHNMeTZWM25Oc0xsaGtoWWxTemVGTmVPLzFkcThuM1I5YlptRHBl?=
 =?utf-8?B?ZG5iSWN4N3BIWURqSXdCV2orRTNYUTZ5UFdTRlFhZlRIajZQeHZ3SHB0Q2xY?=
 =?utf-8?B?Q0lDN1JRVDAyclZ4S3loYWZSd1hGaVF1Z3VXYkx4cGttZ05jaG5JU1dvNUV1?=
 =?utf-8?B?dWF0akZIZSt2SzkwVkxXaGJFZmVBN2tzWG92ajdKUWN2d2NheDBpWHNMLzFD?=
 =?utf-8?B?TVNsR2Q4YWdQYnFLOEwyMjlwUDJRWkp4UEJjY1dnWTMrY1RIaDdYVW1rMXNY?=
 =?utf-8?B?UzRBRHpXQ3ZtMDZqUFBjMUNMNHpRY2h0cXdlMkFLcW5yL0NodWROVFNBVldJ?=
 =?utf-8?B?a0poNWs5MlZlVk43WTI2a1ZYMERzTndDaUphZTFGMEFqOEhUUThvTGxLYmll?=
 =?utf-8?B?QlhlWVB2Qnh5SzY1MTcyVTdFcHkzci9IdzdRSGRzVHJMZ3M0VmtWMm5uN1gz?=
 =?utf-8?B?L1FmMi9jbGJNMnNwdEtCYjhUNjVlU1VUMjNiY1c3N1JldGFnTU1xeWF0LzJT?=
 =?utf-8?B?ZGY5U1pqTXYvUDgzVGlPOXcyMEFuOHR2dmlpV3dLZVJOSnI1S3FwOGwwU3Fh?=
 =?utf-8?B?alR2ZlphTGFaWHlmRnhRVDZTZm0yYlV3NjdXQUJ1TDdxcXZBWU14cHpDdDBq?=
 =?utf-8?B?WkpPY3dyS1Job0k2MHFIS0dRV0ZVdTB5ZUd4VzZwYy9pTjEzZzY1Y1A1aHIz?=
 =?utf-8?B?Q0RjZ1Vjb1RabXphR3ZadThpMWlwK0VkenFnSVhDa2hCN1krQTlzeTY5Tlg4?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 270cda7e-79cd-4b09-864f-08dabd332e40
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 00:34:35.6589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUw51tgtQoydBMSTYBI3d55aoZttTjHcUEUEwRfVIIG30zqRZqugIdBpYYdtniJZ5xaHeJYSHnTwQiuS0SGJhvrfDGgib0Bb4BpbwNf8d/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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

On 11/2/2022 14:43, Daniele Ceraolo Spurio wrote:
> On MTL there are no BCS engines on the media GT, so we can't always use
> BCS0 in the test. There is no actual reason to use a BCS engine over an
> engine of a different class, so switch to using any available engine.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> index 01f8cd3c3134..d91b58f70403 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -35,11 +35,14 @@ static int intel_hang_guc(void *arg)
>   	struct i915_request *rq;
>   	intel_wakeref_t wakeref;
>   	struct i915_gpu_error *global = &gt->i915->gpu_error;
> -	struct intel_engine_cs *engine;
> +	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
>   	unsigned int reset_count;
>   	u32 guc_status;
>   	u32 old_beat;
>   
> +	if (!engine)
> +		return 0;
> +
>   	ctx = kernel_context(gt->i915, NULL);
>   	if (IS_ERR(ctx)) {
>   		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
> @@ -48,14 +51,13 @@ static int intel_hang_guc(void *arg)
>   
>   	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
>   
> -	ce = intel_context_create(gt->engine[BCS0]);
> +	ce = intel_context_create(engine);
>   	if (IS_ERR(ce)) {
>   		ret = PTR_ERR(ce);
>   		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>   		goto err;
>   	}
>   
> -	engine = ce->engine;
>   	reset_count = i915_reset_count(global);
>   
>   	old_beat = engine->props.heartbeat_interval_ms;

