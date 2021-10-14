Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11842E188
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB2289948;
	Thu, 14 Oct 2021 18:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058F89948;
 Thu, 14 Oct 2021 18:42:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227720587"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="227720587"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 11:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="487558742"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2021 11:42:46 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 11:42:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 11:42:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 11:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci0vV6X8cozbzjNgAYtYieP9JFqTEV5ntt1caqGeIcA1wgbIZ85wNSNNWIv9KplPMUFmjN88wIZ/PN7gX0KXP+5GDGBMt01tmFC2zhxDvp2yt2jhRcEPxhPVQDNxBHCV7rOvUEgkEVHdL0suMN+D6oTshJXb+I/FNRfXLqcw2xf6vwbRe0tDUGO9VF/peFo72825f0NACcCllL9uD3upbkvn28S7tRUiwgnFVXYjBlXiWC99Qut1iHHqNfTw/ZfRNMIoCZcAP6aD2s1vjYAOvp175+JWBh3dHKlCtQjl1pg/SscQOSl9T2b9ijrHPSDyjC5Xemi3ER4fzjhvj6r4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfyqffqSKwrmU0YRY5HCfytvn2N1aYXbl5C3u+EcEv0=;
 b=HpHmGhJjUVy+M7R9pyFDoBI3JOXDazeiHDZipCGrAs0VyfK0pMRxcrHBIGsCN336NF/RFK5jUme05MDcGvjXxlXVAvBr28miqIQosHRIEmNNqQ7lv7WvQy3Yz7sn7h+yWNb3/IdrFjBd0lERyHvuQb9NAmuBreZqbRC9GHCmoJti48hnij7hjANIaj7bcYVjDovVPPlgqDBcuLk92SGYVoDosQRjYG5EzCBXJDSpHIMsqkI99xLl/6KLriGsbXAwu/vhngnOUbXKph4CSuIDB1uhX1k4PmVZ5Ts1qgn8bOXK0TiKFChOv11058kExQSXY/CRRFKGei3YN1OLndI0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfyqffqSKwrmU0YRY5HCfytvn2N1aYXbl5C3u+EcEv0=;
 b=isPifSonQ056mc64+b5zjPcHwl+FPYYhvy1bedAvw0s3TlczcJzTw6gwvOLjE8q5jHx3os/+/zaRlzPhpallDmUjgr25UZlaQekbk9m/SIov3QAeXVdB3qOwTNcMvGf9vmaDVPGx/2MCSw7eXJvR/n1HIcrUdFgAsXP1wu0GSD0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 14 Oct
 2021 18:42:43 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 18:42:43 +0000
Subject: Re: [PATCH 25/25] drm/i915/execlists: Weak parallel submission
 support for execlists
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211014172005.27155-1-matthew.brost@intel.com>
 <20211014172005.27155-26-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <aaeff236-b06f-6b43-8adc-45f8531e5433@intel.com>
Date: Thu, 14 Oct 2021 11:42:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014172005.27155-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR1701CA0013.namprd17.prod.outlook.com
 (2603:10b6:301:14::23) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR1701CA0013.namprd17.prod.outlook.com (2603:10b6:301:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 18:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf5c638-1897-4b37-2ad7-08d98f426889
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55806418CF4627751F7A2950BDB89@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pN0OPzHMq1PEGFj9vL+o//fvrTNCoAaNTaYOa3fKquj/S5jbcFBTQkERaNudq1In3kNLoq2SRdPazQOgO0mO+ZNYSDyRsK2QruJ6/QEYQKH77reRPXnhLp02tvjqc4bCBlp5kmn0x+evzXZt2e/XyyDJq0SsA+PzGddvDtReEE6vrF5+tR2YcR/xls+TAnfIOAteK667CI5CJHcai4YUHoh7m1il9S9GtDwny73qQQDXF25ocBIYpfkYdt4AjKRdmUbBADLc7DFHLA4XisNKIZduas9qVeNXiHy2nDsrOYUc3Abe3lLG0rhk0qGOqhDSe72/NbtDmXhAbS3JZ+FItb/J/kYvnJVH+p4mTo0Yk+S/fmUXCF9KuX+zl3nybTQ+ZrYABXgLS8H4+fxJmQ3311jLv1fIcc6QuQyFjm5z+xsRn9ZLoHJfLpzJCq7BPcNok0lMbo1B6CtYAa+nT6OOXcH2stb3usOEfEHagd9N6gEDCfYag+ytaasbpcLmYYAYFpbLkL8hg/qtRW+FHdTbEMpQZh71u56S1SZ4hftHUCZNkW7sRGQkAKh9giaPQeD7pQmSjGhYouTXQcNmH0uToKwnw4YCnvuxIL5jZwEiLN2G8Md37v3Rc5Trx2gxb3gg8VOs3052sEP5xHElwmjcF1F9eKHB32Lk+hlVoWXt6zq51B/KucLf1jfRg6CgB6gV9ILdB+2TCFACPm4BNkaVNwcPe7Hy47Grnhkn4AcFpa3CgnhT4yK2FCY6XiXTNOZy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(83380400001)(508600001)(450100002)(16576012)(82960400001)(186003)(316002)(8676002)(5660300002)(31686004)(26005)(6486002)(53546011)(8936002)(86362001)(66556008)(956004)(66476007)(38100700002)(66946007)(2616005)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em1JRmJEVTR0ajA1NG9tSE5KcWpKODQ2V3hTYW45N0l5M1NFMEFQTzZHVG1x?=
 =?utf-8?B?ZmEvbnV5QURVWmhwRWtwRDZFcVNWQ2Z4ZUV3SElybGVpcHdZcFlJbnZwYmVR?=
 =?utf-8?B?dFU5ZlA3cVVnaEFGbjMvTXVmZFZkNXZidU5tSUsxVUprUFVWZzZtVXVBU1hu?=
 =?utf-8?B?eWNlWmhrN0lHaGFYVkNzZ0kvczQ4TFlDNmwvT1lOUHpIYmFJMm9HaUVHZlhU?=
 =?utf-8?B?SnQyanNuYWdZdmFwcGs4bUhPQ1dIRlhzQUVrbE5xcEpoSkJMOFFzWE5YSlc0?=
 =?utf-8?B?MDFnWGpFaWtwRS9LZnFJdGJqRXphaFBXSkY0MUJ3bWFuUXRGQmEvZDU1SEEw?=
 =?utf-8?B?aVpyOUEydVArWUU5UlIxTms4ZDZ2S0lPbitYVFBzbUY3b0V0cTJmK0VTRVlD?=
 =?utf-8?B?Vy9UOEZXL1E0MXZnVENJNG5PN3RYb1dTaVNEWDBWYmZkTFhLNmVOK0tHNXpa?=
 =?utf-8?B?a2svQ1FzREcwL2dEM2cxUTcwVVF6R3BzNjJnWlFWcGtxa0N3dStNNldoN3Zy?=
 =?utf-8?B?THZYY00wVllENlJZeGl0WU8vdTk1ZTQ2SXhETFhOL2IyUWtpUlNCcWc2WFhY?=
 =?utf-8?B?ekJVTzdFcDEyeGQ2VTh2bWl0U0lhRW94d0hkWE5ERENNd0J3WjkrdWV5YjJj?=
 =?utf-8?B?SmxnVTRFZEFINVE1ejBEcmlSWWRvVFk1RXJHazRTWXJFS2IzVUdMaWhYdG9P?=
 =?utf-8?B?cGd6S21rTUNJRVFzVDVZM1lUVjlHN3oyaEFZZ1ovVEsvUVVqVit0NHBkTWJN?=
 =?utf-8?B?RElRdjErVWlXOW5xbGhFYzBtSWNTNmVqaU5sTGs4YUpjR0tMTjVOZ2lycVcz?=
 =?utf-8?B?RFVqNHdEMjhkWFdUd3VFWTVHenFpWHRDQTNtckI5NGFxbTdFOTNVS1N5RU0y?=
 =?utf-8?B?ajBsMWx2S1RKaThtWW9IdlRJcTB0Vmx0RWlLWFZjQTBaNXRIeTl2MkU2ZUdD?=
 =?utf-8?B?ZkZtU3I2L0tzeWZVcG55Tzc0WnlVd1ZvWFhkbzNPQVp6cEQvUXFKSkhkVlZJ?=
 =?utf-8?B?RjhhTGRPVG4wM2d0MTAwbjVXMU4wMEgzQ1BTeVhMR3JlMzByaXpKVWx1dEpD?=
 =?utf-8?B?emh4NWlnUzluQjdsSjJHRkRWVHVjQXhOZVppVkJOaGxEc2ljS2VOUjZiNWZv?=
 =?utf-8?B?a0IvQ2g2Tk1ERzBSWlR1eFNiTGo2SUxNWlZXNi9Zb0paNkJaYmtJc2x3ckph?=
 =?utf-8?B?Lyt3RWROYzRmbWtQNm5oak1KYkJFanBNdGNLS2g0blBHOTViMzJzZUllRmll?=
 =?utf-8?B?V3lVUU9waGZTOFFqVS9WZXZNemtJMzZ1YXg0ZzlkbTQ3NERUTjc0TGhsN2M5?=
 =?utf-8?B?a1dYMWZHQ3U3QlBHYjUzaHZ6Z2NrS0UzTVFrcVVTUGRONVIrRVNONjhlSDF5?=
 =?utf-8?B?SU5adW1naVVMWDhTSkJ2M296SEhmUS9hYW5XRXgxS2dyN0NZek8vZzRiUUpD?=
 =?utf-8?B?TC9YQWNEVFZBTko3ZFVhd0RrVWRpdUlCNzJnZkRIcG84OWt3ekVraGlYdXM4?=
 =?utf-8?B?Uk5uck8zY1NPNnZGQ3dtYXZpdTJyWll1WE5UdnlVbUlWeVJrVmRFL1lVam44?=
 =?utf-8?B?SnU2SXlkeHZ1S3RYZEEzQ0pCNnhPMkg3NHFOMlpyaWNCd2VTQWJJdGNidGVw?=
 =?utf-8?B?aGFUV1NuL1FtVnpkclpKc2lML2xTU04rL2NnU3daZFhpZG91ZDM2VVBwUGt3?=
 =?utf-8?B?TEZBamg5VVd5cnVPaExPTEtOSFdESmc4NnAyKzh4SWJ6SFg3cjFwSXB6YXZr?=
 =?utf-8?Q?lNpAPuT9WDInKxy2rnRxYQBqIUQA++CItmZOibs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf5c638-1897-4b37-2ad7-08d98f426889
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:42:43.5403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS9Dt3Uwxb94nhSZEVMSYtRIOBaG0H/0uKMuoqiEZHk7fYDjHJty+4qVwT90Bo2u2IeKuW+Z99YS0DEe19qCQYDGWAcWFBVlpgOAF7fbQn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 10/14/2021 10:20, Matthew Brost wrote:
> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
> execlists. Doing as little as possible to support this interface for
> execlists - basically just passing submit fences between each request
> generated and virtual engines are not allowed. This is on par with what
> is there for the existing (hopefully soon deprecated) bonding interface.
>
> We perma-pin these execlists contexts to align with GuC implementation.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 ++--
>   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>   .../drm/i915/gt/intel_execlists_submission.c  | 56 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>   5 files changed, 64 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fb33d0322960..35e87a7d0ea9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	struct intel_engine_cs **siblings = NULL;
>   	intel_engine_mask_t prev_mask;
>   
> -	/* FIXME: This is NIY for execlists */
> -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> -		return -ENODEV;
> -
>   	if (get_user(slot, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	if (get_user(num_siblings, &ext->num_siblings))
>   		return -EFAULT;
>   
> +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
> +			num_siblings);
> +		return -EINVAL;
> +	}
> +
>   	if (slot >= set->num_engines) {
>   		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>   			slot, set->num_engines);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc..1bec92e1d8e6 100644
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
> index bedb80057046..8cd986bdf26c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
>   
>   static bool ctx_single_port_submission(const struct intel_context *ce)
>   {
> -	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
> -		intel_context_force_single_submission(ce));
> +	return intel_context_force_single_submission(ce);
Does this change not affect all execlist operation rather than just 
parallel submission?

>   }
>   
>   static bool can_merge_ctx(const struct intel_context *prev,
> @@ -2598,6 +2597,58 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>   				      current->comm);
>   }
>   
> +static struct intel_context *
> +execlists_create_parallel(struct intel_engine_cs **engines,
> +			  unsigned int num_siblings,
> +			  unsigned int width)
> +{
> +	struct intel_engine_cs **siblings = NULL;
> +	struct intel_context *parent = NULL, *ce, *err;
> +	int i, j;
> +
> +	GEM_BUG_ON(num_siblings != 1);
> +
> +	siblings = kmalloc_array(num_siblings,
> +				 sizeof(*siblings),
> +				 GFP_KERNEL);
> +	if (!siblings)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < width; ++i) {
> +		for (j = 0; j < num_siblings; ++j)
> +			siblings[j] = engines[i * num_siblings + j];
What is the purpose of this array? The only usage that I can see is 
siblings[0] on the line below. The rest of the entries never seem to be 
used. So you could just replace that with 'engines[i * num_siblings]' 
and drop the siblings array itself completely?

John.


> +
> +		ce = intel_context_create(siblings[0]);
> +		if (!ce) {
> +			err = ERR_PTR(-ENOMEM);
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
> +	intel_context_set_single_submission(parent);
> +	for_each_child(parent, ce) {
> +		intel_context_set_nopreempt(ce);
> +		intel_context_set_single_submission(ce);
> +	}
> +
> +	kfree(siblings);
> +	return parent;
> +
> +unwind:
> +	if (parent)
> +		intel_context_put(parent);
> +	kfree(siblings);
> +	return err;
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -2616,6 +2667,7 @@ static const struct intel_context_ops execlists_context_ops = {
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
>   
> +	.create_parallel = execlists_create_parallel,
>   	.create_virtual = execlists_create_virtual,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 56156cf18c41..70f4b309522d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
>   
>   void lrc_unpin(struct intel_context *ce)
>   {
> +	if (unlikely(ce->parallel.last_rq))
> +		i915_request_put(ce->parallel.last_rq);
>   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
>   		      ce->engine);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d7710debcd47..145ffe265305 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2960,8 +2960,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>   
> -	if (ce->parallel.last_rq)
> -		i915_request_put(ce->parallel.last_rq);
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
>   }

