Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3347DC6B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4F410E22C;
	Thu, 23 Dec 2021 00:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E510E22C;
 Thu, 23 Dec 2021 00:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640220883; x=1671756883;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iaV5ljbavX2FGc1fKOUrr3jFvLZ9O2fRltLHKGUYl3E=;
 b=Wwbjeiau47Uf/lJWzeiYVrm2IcoLdj8efj7wDGtem2Ls0EXwvY7P3ucF
 2YQ5io/UkwlWJ6l/LPEWYrQAEP7TaRkqE3UHtLG8ZPgFYkj3+903Xl7XI
 LkfwTPfiyltKaof49LI5ql1HwsKwNvRgFfYI6zNAscsrlNFLnKDQ+o2Fp
 mTph+nyd0QEggMgtiddBBktCORB1yG9zPcIrb0WRKy0Hzgq+L/UchP8ri
 4UiXM35NYI7rUEENjxki+yHpmWj8sxn7ucm2byETEP6KaTAUaQKk5w7dv
 onjTa2v1nJpyPxCk8BnajMGu2lWagB+CIAk7sHO9zqJSldK19GCtpMXE0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="220741901"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="220741901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 16:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="607590577"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2021 16:54:43 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 16:54:42 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 16:54:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 22 Dec 2021 16:54:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 22 Dec 2021 16:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGoGUlT/9ipw4lUYngkxurDhZuaqD+jONqrCq3YfNp9oWgc95D2z5wLgT2rTrgX5ahYeSw0GJQwFF31b04xNHsJfNpDxxI44e7deGOJbsg+j2XcsXQjk1FDDqxaJtOO6P/goIWhE3lBBQj54qpSh210RO0+kdvEoAuGyQRMufDGXFkILhS7GFtn8jKswCTgHtR7Rt+FgOze+CLmpO+mdL4sVG8lG2pn9Yf/f6EmSoHVQ1czDs3QSBPZrFzZNMTosuVJewi9kvmrnOEv30m2LS/Xo8TkGQsMnKhFdnbEoUiyJ3l8Cwp9/gBgDJbUkHzg1VN5B8A4ht04GZLX/zzC40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7eE0hKJA87USpMWldpwf327g9XVOqyv5P1B7i57H0M=;
 b=i8yL1/T8PMFx3wUyJ9wudV1EWLkvO65Yz7BZ/g7XtQaYEkSesPSNpZagCjBu++NmTpRsx7+gGJmFj0ylEzy+d0IjoDlpmOkTJ5a4QelK7OlFewsYNrA/eB3ejv/iPgRbaOjpGbu67QeK73WHq19PFdXQ4vCA/P8iGpm1b3UHFguQY35Gtxgg1QUTEORpOxP69DmP+KbvaR2mHcnJVOpZX5GItyLSRtfD0We9v7RBpBIC52jfUnHlpDdxweP+/wgJ5E9I7NCkHvRdBpxHYtUgmqgVgeZjjNHTX0zSzsDUM6KW6qekLbAPgz4SrfjKScpSUTFbRZoEKsowzIN6Jm24/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB2534.namprd11.prod.outlook.com (2603:10b6:a02:c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Thu, 23 Dec
 2021 00:54:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 00:54:40 +0000
Message-ID: <d97e4f76-34f8-7c14-3e6b-41800bda06f6@intel.com>
Date: Wed, 22 Dec 2021 16:54:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211222223532.28698-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211222223532.28698-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR21CA0047.namprd21.prod.outlook.com
 (2603:10b6:300:129::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a64a70fb-4b75-4b19-b9a2-08d9c5aecc80
X-MS-TrafficTypeDiagnostic: BYAPR11MB2534:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB253444CC8610E5BEF75A0307BD7E9@BYAPR11MB2534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAsVNWUJQzlRVRiQu1+X2LcDNKN5Za+m9sz4pAtZxlygPJya4vY+AdTouJ6TFXhoNpUrDQaHfZEnhUgjrCbqaYTDtF0YpPDnkVp8k0NPhkmGYgKlnpyQMr0x7ednuEDaQbgVMWKLN6AQtrw8sWmqgj2jTgCQMDSxQD5C2wbEk9Wf5QUnRrBz+Ck74orKCxQx8emT1RdbhjdB7oRTNjh2xpCvZOsugItBx/hMoxrB6O+1Kw1XwwEtnq5Z8FIX9utPJM4VyNUH35Q9qel1hdaQtSyiqaHrABvviLtA2CzFf00o0lEAUWRY6lu95VcSsKxr1HN14L700y/Atg1uml8tgY52lqnimTGmQb1kFLrhVkAZAGWIgYNHpAy9hPcI/JfY4mcSct/2O53LRc4A2Jdq0sddAkUioO7x10HEfIVrvacA7kk4ICoVG51VhdwKhPD1MmYEkaG+LjD6ycYi4xEf+pG/SHplCrPAnWobWi0kjWfFts4As3ZKip142xFKmNoMDoAUDgt05BXvFXl0ypbaobd7oAliE8I4z+gOREoxp1fS7yPLnEFuO5nXDVVZqe1zeQgcodovZ5nOAaB5cqEBYJzTmDe2cjI/FghS3gLHcs03SEINtrs/XaSExEB7rkmiAsPptViGT9hARVgB5z14JPw0KrYUZduLiXSUt2DkyIumou8Dr80HI0rnrjeA2YyrfWkfe0htIouYKLeFfEVxNGDKMYklTdA5aZyGEoR9XELOGWRSjB/6Cil3ohDvnCBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(186003)(8936002)(450100002)(5660300002)(26005)(6666004)(38100700002)(8676002)(2616005)(66476007)(316002)(83380400001)(82960400001)(66556008)(86362001)(6512007)(36756003)(66946007)(508600001)(2906002)(31696002)(6506007)(31686004)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFSTmpjTGN1YSsrRjR5aVFReVhwaEFlUlptZjEzL0pRblNEWjNtbE9rSUx6?=
 =?utf-8?B?OVZPa293M3pjRnZ1S3N2ZnRQdFFaMTR3eTJNNzBFcHkvcTRSaFNNY3lWeEJ6?=
 =?utf-8?B?RXg1TlVnRERkVjd0bzU3cDZhV3BPOVIvSWYydGIwUHpUVHFxNjJjNTF3K1RF?=
 =?utf-8?B?cTB1dmlteDlITFk0RTBWNDcvTnNBK1NOQW44TE1wM2FTVlNJaHdwc3g4K1NN?=
 =?utf-8?B?TDZiMnpQd1RQOUNUQUxTSWFXcmlab3RpNEdWUlFrcVR4bWVnVjhsU3hLZTZC?=
 =?utf-8?B?NW5NVVRaaytmSGwvcjBWeXkxYUZEUjl6aXF1WStNeXZWcUJNcEVaQm8vMWtY?=
 =?utf-8?B?N0lRbTBtMG0xdzBMTTlrdUJqSUNNQjVzRDk5MkFoRlFUeXJwUmxEWGVHTWp0?=
 =?utf-8?B?RW5PQzZQZzlNalYvL1JCZXo1OVNsaEljc25aenJ5c0dNOTZqSjFsaVhwVVVt?=
 =?utf-8?B?MmFnY3NrdVJzdW9MMkRGZWc1a29UZktyUTNQYnA3ZWNuUUtlL0NsNExwcU9z?=
 =?utf-8?B?N1Z0czJnUzF2WGxicTdCV3JHejZMQU5TVWtIclpwTll0aGZUbm9mSHByMmhz?=
 =?utf-8?B?WXVCdG45WUpDSDhsQ0VCbFYvRlNvK21iL2swbGlqWW54c0ttelJCdFBWdkVq?=
 =?utf-8?B?b2ZLSWN1Rm9pbnZlcEFOUlNkQVFDWVAvcmp2c2s2SkFrZ1F0OGl6amR2YzFv?=
 =?utf-8?B?djRpVitJdGdnQXBRM2NuM0pxVk80UWFlVmx2d1BTOWhZUGh4UkRPUW54ZVdJ?=
 =?utf-8?B?YTFSOEdRVkxSZEtDMWEyOWJjR3ZUL0RuUU1JLytnK3VjSkcvT1h2S0RmN2xy?=
 =?utf-8?B?Rk1yM21FRTR4S2VCY2NlTFdTZTB5QU1tR1NXODV1VDNKbWhnQmpsZy94MHdN?=
 =?utf-8?B?OTFNT1NaNTFMeWJkZnZIV2p5UGZBbFVIWWNSQ0p1Y2hTZEh2aFZmRFZ1Q01G?=
 =?utf-8?B?Q3pQVjZPNklVeTBDZGdDKytIWmxvV1ZTbENxZmpCdmh3ampTM1didzhVM1V5?=
 =?utf-8?B?WE96WmRseE12eTJtMS9ZdVBOK1ByZE5VMlpNN2pCQmxxN3JDeGxOVnpuY2dy?=
 =?utf-8?B?aHlBbnFlc05hbjlRZ3YraEVIbStsRnNSTUZaTHlWdDJzVkI1T3Q1RzBkQk5F?=
 =?utf-8?B?MXd3bU9sbFpVTXNvUHVTNVgvaER5RTNkcjAwSnVMSm9xdFhudHFrSTN1c0Fh?=
 =?utf-8?B?Nm80dS9wZVN2RzJRR1BzLzRMd2dwTlFqZXgvQnA4MFVMV1BvTno3bFAwTlcx?=
 =?utf-8?B?NW8zeWtXRisyRDg0Rm1xQmszT1d3d3JndlRySWdkYWJzUHF1UWtkc282Mk93?=
 =?utf-8?B?bEN0OTVpaktoSVg3NDVFaGVzOXJUZ0VNU09kcElLS21TcVlFZTNvQUMxandO?=
 =?utf-8?B?eVlyVmdWUjhkYklna2hDL1VROTJEZGx6ZXkyekRFN0NEbllQbEovWFBrWS82?=
 =?utf-8?B?S0Y1YWp2RTRSWkFZblpoUDhMS1o0YUlmQXJSbldZVTZseUxEeXZBQ2l3dXFY?=
 =?utf-8?B?QS95ZUlmWDkyYTNNcVdiTDh3UzlKTHlhc0l4K1hydXV5QU9rdUd2RlNnWjF6?=
 =?utf-8?B?ZHU4RmUrZ1huWEk1TUJpWlhVWGs3VVdCMDVzVFVPM2QyWUc2dndqcVV2Wk1m?=
 =?utf-8?B?RGFmSFBnNU0wMzJRMlNFb05OWXhiMHhwVkZPSjhQK29hZFFuOTRCMnhvYXps?=
 =?utf-8?B?VVlEdlFZYlc0MXI2ZEFYZGd4VVZBMy92SitTMUZUaVhCZHloVnk4RjNMdzla?=
 =?utf-8?B?NUdnMVVoT3FPOEtuT1hpMVRZSUgvY3dFcWNNVGxIaE5Db01LVEROQWIvdTdi?=
 =?utf-8?B?OTFHczY1Q2RSV1JZY2phaHdsY2FrV1Qwa1pLL281Nit6MlJQdjhGLzhCcGlm?=
 =?utf-8?B?N0lHTmMvbGJtVEhQamtQSnAvQ1MrTmNEVTZ5Tm9DRDVUelFJRGVBaXhyaFJY?=
 =?utf-8?B?a2x4N05ueWg2cDRGK0VnNW54dVlFbXZCRDlWTk9oUjV6d0VjandPUU5BbUtQ?=
 =?utf-8?B?YVJzVitjSVp1eFlqSy9ycWR4WDJEaDB3dVpiVnEyVmcwQXFwMk5Gbis3QTl3?=
 =?utf-8?B?VVZqUUZlMS9WQ2NyVzkwV3lTSVBmU3ZkVU1Jak5JMmhqZHg1WTZubHZiRHdF?=
 =?utf-8?B?UU0ybExzSFNqZm80YjhYVStTUm9WZnBnUFpSTVdoMmpuWE9LNkJLclBncC9J?=
 =?utf-8?B?WG95U0o2TE5VbkRLVkhGMGhKTE14VjRRTFJrYzBqdkxrUjQ2T3VTeFFyZDJJ?=
 =?utf-8?Q?3yQ9pnLVN3crbE1XLmBQ97pEwD3xjdyXs//Oip9hfQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a70fb-4b75-4b19-b9a2-08d9c5aecc80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:54:39.7324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytheKnZ5gAWLvMxB/XKdrQ2Fbr+JzRZtoyl/jb4Vt+viY4aEqRh6ePHaqXf2ultZLeKV6vYlCao7hwgZN1NidXHU7pp6GHDWF+2C+RZwOHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2534
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/2021 14:35, Matthew Brost wrote:
> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
> execlists. Doing as little as possible to support this interface for
> execlists - basically just passing submit fences between each request
> generated and virtual engines are not allowed. This is on par with what
> is there for the existing (hopefully soon deprecated) bonding interface.
>
> We perma-pin these execlists contexts to align with GuC implementation.
>
> v2:
>   (John Harrison)
>    - Drop siblings array as num_siblings must be 1
> v3:
>   (John Harrison)
>    - Drop single submission
> v4:
>   (John Harrison)
>    - Actually drop single submission
>    - Use IS_ERR check on return value from intel_context_create
>    - Set last request to NULL on unpin
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 11 ++++--
>   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>   .../drm/i915/gt/intel_execlists_submission.c  | 38 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>   5 files changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index cad3f0b2be9e..b0d2d81fc3b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	struct intel_engine_cs **siblings = NULL;
>   	intel_engine_mask_t prev_mask;
>   
> -	/* FIXME: This is NIY for execlists */
> -	if (!(intel_uc_uses_guc_submission(&to_gt(i915)->uc)))
> -		return -ENODEV;
> -
>   	if (get_user(slot, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -583,6 +579,13 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	if (get_user(num_siblings, &ext->num_siblings))
>   		return -EFAULT;
>   
> +	if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc) &&
> +	    num_siblings != 1) {
> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
>   	if (slot >= set->num_engines) {
>   		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>   			slot, set->num_engines);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index ba083d800a08..5d0ec7c49b6a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
>   
>   	__i915_active_acquire(&ce->active);
>   
> -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
> +	    intel_context_is_parallel(ce))
>   		return 0;
>   
>   	/* Preallocate tracking nodes */
> @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	 * Callers responsibility to validate that this function is used
>   	 * correctly but we use GEM_BUG_ON here ensure that they do.
>   	 */
> -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
>   	GEM_BUG_ON(intel_context_is_pinned(parent));
>   	GEM_BUG_ON(intel_context_is_child(parent));
>   	GEM_BUG_ON(intel_context_is_pinned(child));
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index a69df5e9e77a..be56d0b41892 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2599,6 +2599,43 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>   				      current->comm);
>   }
>   
> +static struct intel_context *
> +execlists_create_parallel(struct intel_engine_cs **engines,
> +			  unsigned int num_siblings,
> +			  unsigned int width)
> +{
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i;
> +
> +	GEM_BUG_ON(num_siblings != 1);
> +
> +	for (i = 0; i < width; ++i) {
> +		ce = intel_context_create(engines[i]);
> +		if (IS_ERR(ce)) {
> +			err = ce;
Could get rid of 'err' and just say 'return ce;' at the end of 'unwind:'.

Either way:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> +			goto unwind;
> +		}
> +
> +		if (i == 0)
> +			parent = ce;
> +		else
> +			intel_context_bind_parent_child(parent, ce);
> +	}
> +
> +	parent->parallel.fence_context = dma_fence_context_alloc(1);
> +
> +	intel_context_set_nopreempt(parent);
> +	for_each_child(parent, ce)
> +		intel_context_set_nopreempt(ce);
> +
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	return err;
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -2617,6 +2654,7 @@ static const struct intel_context_ops execlists_context_ops = {
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
>   
> +	.create_parallel = execlists_create_parallel,
>   	.create_virtual = execlists_create_virtual,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index b3489599e4de..84456ffeb4cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1065,6 +1065,10 @@ lrc_pin(struct intel_context *ce,
>   
>   void lrc_unpin(struct intel_context *ce)
>   {
> +	if (unlikely(ce->parallel.last_rq)) {
> +		i915_request_put(ce->parallel.last_rq);
> +		ce->parallel.last_rq = NULL;
> +	}
>   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
>   		      ce->engine);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e7517206af82..0a03a30e4c6d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3248,8 +3248,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>   
> -	if (ce->parallel.last_rq)
> -		i915_request_put(ce->parallel.last_rq);
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
>   }

