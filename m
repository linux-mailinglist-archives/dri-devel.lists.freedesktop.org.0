Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B57056E6
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 21:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D84510E365;
	Tue, 16 May 2023 19:17:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D968A10E360;
 Tue, 16 May 2023 19:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684264634; x=1715800634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P0tJtkwLnnOKajTiJ9DHV6d55H46QJZlooPi3Sj7Wck=;
 b=eZ4fQR9kSP18WnMesLBAre1pTobCu34zyNVk3iCJ/EdIb1lm2G0S+YyN
 LM35nERGPI61NmYmk9oRA8K4lzS+4sVDrIvXzHYflkwOUWFHdNH2yKY/v
 Zlpf1/C3uvTfoBW1kUa6bUH6bNx9vURST6zXrE77/i76aCFCHWTT5wcOr
 ymKIQX6gqQ9RIi5JU+TTB3U0/FqeMfg4VpO3TpjqAeTkg0HfwFDk6bgH4
 Zebok6hrDUBhV7D029caPPaJSPIP4Ewmg0VUBfsiMuHkeBb4F9lECCM/I
 +3m+eHiEHA665rigxle0334Nt1fcZYypXcunpMzYH6vodhaXn3GcaHp0x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="336115169"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="336115169"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 12:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766469122"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="766469122"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 16 May 2023 12:17:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 12:17:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 12:17:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 12:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ0Yhe9jOZczfDJ2rdYyw8lyis2otp4s1jE/Kz2j5kL3FgOC9daXq6DtTdf8hJLg1FHVdbzTTl8pxZGS8Bu9gsdajAQtbJhM+h2Py+lWiIMccZAqFfVOzSVCBb2IJca+LgTSzqASGdheQAqaN8C1DJFTYXENfUin9UKdkIzr+i7yGuzHOFMJIhqLoUTrI/qWkeTG0KC4J1eWEolU4KD/Ii934jRp8Nd6tqy6IpAnSHKS5UUaBpFSNUACoka7RT0F0nNVRGwtBgTpfHr5UgPVTCXVPgtxaN+CbAs/1ioXeaON5hgDq6IP4ZklB+JbuzNn5R26t/d1C2NT1D6AlQ9U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFzE07yEOA4+hdauy8svOmGiRhE1y1WaKzWd5/t+uEk=;
 b=RRvL84r977+O+RKqyYNn0Xc0wXYAk30TwcKAnRLUeCDyPCo1h9x3425E1ggbkHnUnEF3mAgfzriSJdr+GYa7nQDnhNL0BFSF8eTOS05D/W2Wm1pDaKmv8djzNRioivZPrRv4rHYVunnRNxah4AOOc+XGG7Wvst0xf19filY9C7nqZVBltn756qvN4cz+jEEBThzIuYSDAwTOczkdMLLaSgYEz40bJ1rPTHwFFcueYWD+S23Xtnx8IkiBX+VXTO1d5eGAJUbSgI41V4sZmJGlPQScxAquaDHtrTBpGnRtR072TMhMahM/DwNZHLFp71CF3IHqvQ2QJN2Zb/346ae3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 19:17:11 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 19:17:11 +0000
Message-ID: <696ba7f2-4353-e154-af0b-83604dda2546@intel.com>
Date: Tue, 16 May 2023 12:17:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Dump error capture to kernel
 log
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
 <20230418181744.3251240-2-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230418181744.3251240-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 95517c62-e478-46ae-3b3f-08db5642260f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6aw0GzNtFIhGQv4sBXBVEm6qMKpTKn68rXfLZ+q7Ogdf7x+ZKJpBNgDsSw8ZLJHqNVwdFhe+jMGY1Yt/v0+gE3drtc/XalmCYwqT1ZSMSFF3CSMDIQVNbHiqkVAhGpI9qD6N16dA/MY68ML5YVIMwSsg6g00qCnRhCHFen/PLjdnmU6DTceM5qipvvkYqc8ZAQ0SUHpmtVqtwM2G+bYOnlYvLwCXC2VPwfDPcyMvF4wIzuLAwRuvssS8yKf2Q0xReMHNWZ2+5b8PXCV4SJlueg86BLqOqEs9RlCIRswnnTR4GPdL/N4YwIftRGZ4ycxPnDz4RBoSI6RTiuOc3GtxOAYN2cgEXy0sjDXpDlGbN1bWPr5/7nFs6+cx7jBIMkCFBBS15Astij29G3dotdMfojUBmavMtpBAPuXEIMXPgp8mf46a0ZuRQ1cJOMmdbdrR9UcVwRIWuieXgcBc9ca31ruljfzycahnDenVyKf50xecDkUJnynlj+TUK+WmRb4o5aFBy9ERlC4c1wx6eVUFONfu3XTOVk0B5IUpeLr7uEWZfQvcBwL0KQ9rmofzO47QcO0Oxf/LKnUNEqwHJxeGmfujxD44eI1JKsaAA2zSRB9Oqo8fAabW3p4YI/9CDyIoho4XohhYp4PWTDCZMEXLoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(36756003)(6486002)(6666004)(83380400001)(6506007)(6512007)(26005)(186003)(53546011)(2616005)(5660300002)(82960400001)(86362001)(41300700001)(31696002)(450100002)(31686004)(316002)(38100700002)(66476007)(66946007)(8936002)(8676002)(66556008)(478600001)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFYTlRKMENjNk5wZW1Jb0tpYWxxMTlTOEdMOWxVc0o1cldQY2hKS1JsSUlH?=
 =?utf-8?B?V01qYmhNV21wY0xleUg0RU1oSTlnekVUQjNYSXZIV3RiMmQrWkhIV003MEEw?=
 =?utf-8?B?TWtDcTlqUityNjdOdzdMalB3OGpUNWpQdm5HNlJ1OGxSdzdiRWZIamxhbjdG?=
 =?utf-8?B?ZC9SejJHR0tFUytOT3o1V1VyWGVlbmtlT1pWaGEwNTBaVzRwYmtYaEo0aVgw?=
 =?utf-8?B?dUlrR3VvZG03ZUc1SnJUQllyWXQyOUxVZFNTTVJEQ2JzNk5Tayt3K1VBUjhx?=
 =?utf-8?B?NVZOVFNaMnBLT3Y1OFFTV0lmdk9jVzZTbzZKVFZIdE5ISHZRa2RYYmVlTHZl?=
 =?utf-8?B?ZlRNQXMyNnBGcG9FQzF4ZUlPemlBMzFTdnpSMkU3OXQ4Zys0MlEvSnlwNS8y?=
 =?utf-8?B?ZmtiS2xRTWRDY3FuSk1uR09Rck1jRG1FbU1SYW83U0c2TytrWmtuWm14a0VH?=
 =?utf-8?B?WDRCMzZtQTR6VVcyNkFadGkxbTh6NXBaanZqRUErbVZ2NWl3SkFOcWhsTU9j?=
 =?utf-8?B?Q0padlZMbmhtKzVwY2Era1VubXJadTFZNjdwdUZ5cWNTMXdlc2trbGNBdHZz?=
 =?utf-8?B?YXk2OEZ2dm43Q3NJQytGVjcrZ1IraGF1RVNMd2QzOFBRMzk1aDNWVk1KL2xG?=
 =?utf-8?B?QW1ONnJaVDZGd2E5OGxMRzQ5S3ZMSG81ekJ1cnhKb3daREV5bXZWeXh6ZXEx?=
 =?utf-8?B?c0ZSZlR0V2dXY3VrR2FTeHd5WEdMTlRPWEs0WXkzeDd1T2p1VjBaVmlUTHBk?=
 =?utf-8?B?ajhJR2lpNEREVm1la2tmcThEQWRnTklYT0xXZnlzUVJqOEVyUnZaT1F5MkJY?=
 =?utf-8?B?Z29GWUdZYUJWSFF5SlFZMEdIR0paNG94ZjJkTXpkNXRGZUNrZlYwMENYeHlv?=
 =?utf-8?B?aGE3bnF5NTFiYTBLaTdTcTZHZ1Q3Nk1USENSRU9hdUhJa3R2Zzd0S2Q1Y0dM?=
 =?utf-8?B?Ykh0RDVyM1gwQkw5MCtYNlcwVFlnZWIxSWtrUjI5MHlSeXRiU3J6YXUxOVFi?=
 =?utf-8?B?N1RKTWFXNkoyODh6NFFGSW9ibmYxYjRDRFhWcTlWNEQ1T1NrZ1JVeUsweVpw?=
 =?utf-8?B?SitMamJaK28zYXpDWFlCWHZnbjdzUTNpek1nd0tsbkJUWGM2UGFXS3VnL0VZ?=
 =?utf-8?B?SDFTbGdBcnRRbVloUDBOM3RxeGNBRGV2YnNaM1o4cFhYWFpaaTRZUkNKZkhh?=
 =?utf-8?B?QSs1ZTQwNmpuck9FV2NTOUlmNzliS3RBU1ptL2RXaGRSTWw2WUJ3Nm1uOHBO?=
 =?utf-8?B?bmJWdkVLR3c5MzRCVmJJcHBiVkNnV3pLT2ZtRjE3T3BjLzRvWG1MTVd3cDJV?=
 =?utf-8?B?dWJUbUVhMzh6aTNaMmdML1lYNGJwNFhwRmN4WVhJdk5XWWMvMVpCSUVIdTB4?=
 =?utf-8?B?M3dhRVBtODlIYUcwcFk2RXY1Zzd3dDEzMU9TYVFOWjJHdXdkYjFlbzg2TjhS?=
 =?utf-8?B?anduUFlyOEhPa2ZRamMwcHNUb1lFNzlwcmZSUmRrVGh2SGdvTGZjZVdHUkgw?=
 =?utf-8?B?MFhUaFM2cWdYNTgwUUNWSC90MDFrclRyMFRVT2U0a3k4T0M0RjNBVnhWenNr?=
 =?utf-8?B?MVRJejFITVRMWCtib3VjZm1jRlIrOVE1bjVmL0dmdWFKMVNJVjJPcUtMZXZr?=
 =?utf-8?B?a3RDcSttcDZWOWhYSzUyY0thb3Q5MkVQQTVhLzMvSVAvN0xNNnk4NmN4a0Zz?=
 =?utf-8?B?ZVUzelFSUHZsNXFGN1piL3R4QWY0Mzd1MlNaS1Zab21POTdTVCtkV252QTFl?=
 =?utf-8?B?ajRmT1hGMklWN2hHSjd4bHBXUUd1UzVaeHV6bCt5amdvcHp0Z2hCT25GbW9Y?=
 =?utf-8?B?RjRJclZNTld2WW1GeXJtemNJdGdSQlNFVW1GbGlxRExjNjUxanhuN0pqVzVa?=
 =?utf-8?B?K2NHUTlVYmVhekM4Z2xsekRGTVNXTmFsTndFVVAreFk5SWR2QWxXenZQMmY4?=
 =?utf-8?B?bkV2Q3NnRzRqZ0F3bVJZV2dOR01oeGcxVkYwNEtSWjdCejMwUmlXMm9vWE5m?=
 =?utf-8?B?QjY1UUtzVnpZRllqbVFnd0lwRXNtSnpPL1lqcG5Ga3RKZWdJY3dBM0tzNjFQ?=
 =?utf-8?B?Mk5FTTFVRm1Yb1dEQTlySDlPK3U0OXhzMU5wL3h2LzJ5UHBpZTZKTU9td1Uw?=
 =?utf-8?B?eVlYRXlkeHBYMFhreGpWYkZmalFKVmZRUVBYZ1NJL0pDem5IQlY5QkUzYWRp?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95517c62-e478-46ae-3b3f-08db5642260f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 19:17:11.1321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/J0xXRZimqUx9kgjtJNNFao9C4aLH3oJaUlEDZyVYOh83fjNzZ5A12HXfCknwQKRZFUBLw3Jez8LLFuVzmASSDVfgjjhz1ovh/ghIMvqvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/18/2023 11:17 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> This is useful for getting debug information out in certain
> situations, such as failing kernel selftests and CI runs that don't
> log error captures. It is especially useful for things like retrieving
> GuC logs as GuC operation can't be tracked by adding printk or ftrace
> entries.
>
> v2: Add CONFIG_DRM_I915_DEBUG_GEM wrapper (review feedback by Rodrigo).

Do the CI sparse warnings hold water? With that looked at,

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 132 ++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_gpu_error.h |  10 ++
>   2 files changed, 142 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f020c0086fbcd..03d62c250c465 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -2219,3 +2219,135 @@ void i915_disable_error_state(struct drm_i915_private *i915, int err)
>   		i915->gpu_error.first_error = ERR_PTR(err);
>   	spin_unlock_irq(&i915->gpu_error.lock);
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +void intel_klog_error_capture(struct intel_gt *gt,
> +			      intel_engine_mask_t engine_mask)
> +{
> +	static int g_count;
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct i915_gpu_coredump *error;
> +	intel_wakeref_t wakeref;
> +	size_t buf_size = PAGE_SIZE * 128;
> +	size_t pos_err;
> +	char *buf, *ptr, *next;
> +	int l_count = g_count++;
> +	int line = 0;
> +
> +	/* Can't allocate memory during a reset */
> +	if (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
> +		drm_err(&gt->i915->drm, "[Capture/%d.%d] Inside GT reset, skipping error capture :(\n",
> +			l_count, line++);
> +		return;
> +	}
> +
> +	error = READ_ONCE(i915->gpu_error.first_error);
> +	if (error) {
> +		drm_err(&i915->drm, "[Capture/%d.%d] Clearing existing error capture first...\n",
> +			l_count, line++);
> +		i915_reset_error_state(i915);
> +	}
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		error = i915_gpu_coredump(gt, engine_mask, CORE_DUMP_FLAG_NONE);
> +
> +	if (IS_ERR(error)) {
> +		drm_err(&i915->drm, "[Capture/%d.%d] Failed to capture error capture: %ld!\n",
> +			l_count, line++, PTR_ERR(error));
> +		return;
> +	}
> +
> +	buf = kvmalloc(buf_size, GFP_KERNEL);
> +	if (!buf) {
> +		drm_err(&i915->drm, "[Capture/%d.%d] Failed to allocate buffer for error capture!\n",
> +			l_count, line++);
> +		i915_gpu_coredump_put(error);
> +		return;
> +	}
> +
> +	drm_info(&i915->drm, "[Capture/%d.%d] Dumping i915 error capture for %ps...\n",
> +		 l_count, line++, __builtin_return_address(0));
> +
> +	/* Largest string length safe to print via dmesg */
> +#	define MAX_CHUNK	800
> +
> +	pos_err = 0;
> +	while (1) {
> +		ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf, pos_err, buf_size - 1);
> +
> +		if (got <= 0)
> +			break;
> +
> +		buf[got] = 0;
> +		pos_err += got;
> +
> +		ptr = buf;
> +		while (got > 0) {
> +			size_t count;
> +			char tag[2];
> +
> +			next = strnchr(ptr, got, '\n');
> +			if (next) {
> +				count = next - ptr;
> +				*next = 0;
> +				tag[0] = '>';
> +				tag[1] = '<';
> +			} else {
> +				count = got;
> +				tag[0] = '}';
> +				tag[1] = '{';
> +			}
> +
> +			if (count > MAX_CHUNK) {
> +				size_t pos;
> +				char *ptr2 = ptr;
> +
> +				for (pos = MAX_CHUNK; pos < count; pos += MAX_CHUNK) {
> +					char chr = ptr[pos];
> +
> +					ptr[pos] = 0;
> +					drm_info(&i915->drm, "[Capture/%d.%d] }%s{\n",
> +						 l_count, line++, ptr2);
> +					ptr[pos] = chr;
> +					ptr2 = ptr + pos;
> +
> +					/*
> +					 * If spewing large amounts of data via a serial console,
> +					 * this can be a very slow process. So be friendly and try
> +					 * not to cause 'softlockup on CPU' problems.
> +					 */
> +					cond_resched();
> +				}
> +
> +				if (ptr2 < (ptr + count))
> +					drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
> +						 l_count, line++, tag[0], ptr2, tag[1]);
> +				else if (tag[0] == '>')
> +					drm_info(&i915->drm, "[Capture/%d.%d] ><\n",
> +						 l_count, line++);
> +			} else {
> +				drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
> +					 l_count, line++, tag[0], ptr, tag[1]);
> +			}
> +
> +			ptr = next;
> +			got -= count;
> +			if (next) {
> +				ptr++;
> +				got--;
> +			}
> +
> +			/* As above. */
> +			cond_resched();
> +		}
> +
> +		if (got)
> +			drm_info(&i915->drm, "[Capture/%d.%d] Got %zd bytes remaining!\n",
> +				 l_count, line++, got);
> +	}
> +
> +	kvfree(buf);
> +
> +	drm_info(&i915->drm, "[Capture/%d.%d] Dumped %zd bytes\n", l_count, line++, pos_err);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index a91932cc65317..a78c061ce26fb 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -258,6 +258,16 @@ static inline u32 i915_reset_engine_count(struct i915_gpu_error *error,
>   #define CORE_DUMP_FLAG_NONE           0x0
>   #define CORE_DUMP_FLAG_IS_GUC_CAPTURE BIT(0)
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) && IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> +void intel_klog_error_capture(struct intel_gt *gt,
> +			      intel_engine_mask_t engine_mask);
> +#else
> +static inline void intel_klog_error_capture(struct intel_gt *gt,
> +					    intel_engine_mask_t engine_mask)
> +{
> +}
> +#endif
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>   
>   __printf(2, 3)
