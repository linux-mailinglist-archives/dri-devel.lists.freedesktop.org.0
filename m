Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F323F606642
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091EB10E7F7;
	Thu, 20 Oct 2022 16:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9310E7F7;
 Thu, 20 Oct 2022 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666284700; x=1697820700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7bKWZXiTv3/U6qbn/6AGOM/z0zE+bKnrdRmeZjdcP9A=;
 b=DGnI+hhJ1v79oa+pSvCAevYC+E7Qb466G8QqoapyY1YtZWEaqZy9x7HC
 iW+azFn9U3Slp7vXDxHgxUSgFAP1pYB4z5KUJWiQFwuXp5dlEZEobTFWc
 ltofWVQTh0RsrW0tlA59oLXUsuTVlUMXZlfJBwLMotRYBiZ7N9U6/RRad
 +Gv/Rom4bqP0MJ0sHsZKhrZ9CqpqXt8vaJ3UhyXlu8hNSbQ2laJHRIeQT
 vUQ/lsJV9G+48sF0dw7QP6n+154jVzmq47QfNb41/e28Ty4LFTLJ0wXyA
 TYwt8kT6YAWaTDmmG7/K46UZRlqRjVBa3sIC9LJCaXwT6ZrNRU7PVINIA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="393072577"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="393072577"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="607787542"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="607787542"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 20 Oct 2022 09:51:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 09:51:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 09:51:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 09:51:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 09:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI5kV5pJlJUNXcL/jSrl9HNyjr7tbSKdNp5FQxJtSJu62+CaiLYXE0F1cDsn6xGmW/o+t8mfA32sMXIWckRt/QSmm74BHvx5Gt1V37g8IuPB5xYxKhs+HLTJD7G8SqOXiE1PSyQsH1yxR2U2EDr4ir4m1VddRTH5VSufsOIbHH+6heMMM59F5Wbdhz3uRwG5TJdwg9opjwwL+9RnxM31Aj6d85J37vcGYUMnLvk8N3QMVhul447NJL27y8a5cr8r4VivCxYcphJXRirLF4BNplQafU2zMbtcpUkqEvlrlBpClHCQIwxM3iDi9TjHKKa/aVKMQLDda/upYYCRyy2mnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XVXinoQJvb4jpLpql3+av5Ynyi7FgT5sfn62xuOeq0=;
 b=aqKig0/a+/snhtCUj01Vo5VBAlDBgUsBWzFwgXd+XB/kFtXDFI9NCsOgBKlm2oXtAteDajXZysOxiD+BS0poOkT7OwdgwQ6TaWQA3CCtnZSzIxk+QqUITXXatf4otZ03lUdTchLo+GKTq3XmVVft2jpSr+HlDOKmCxaUwRhQOWbTyUvmpaDt2GdF37FBCgGTzXZqLr4Gny4rbuJMwKkgqMeantnn1uEVXiTQw2Tah5DhI/3xvadorzv9fvzd/BdhPCZFFnpWS9MymRxIy3fN+SgQeir0umHAeLKfoC72zPgVN3UeXkBYBnHn6mlB1anMAEdUUCekBM6XlY46ciBLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 16:51:35 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 16:51:35 +0000
Date: Thu, 20 Oct 2022 09:51:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 13/17] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Message-ID: <Y1F8jk5AlssGrl7U@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-14-niranjana.vishwanathapura@intel.com>
 <33e7d512-c78d-dfff-0bcd-0cdf94af384a@intel.com>
 <Y1BB5vMCMCKgi2Ar@nvishwa1-DESK>
 <f4c92d7f-8ac8-72df-85bb-a1b00f29cf92@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4c92d7f-8ac8-72df-85bb-a1b00f29cf92@intel.com>
X-ClientProxiedBy: BYAPR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:a03:80::39) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 7643a2fa-60a8-42f3-c1e5-08dab2bb5913
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V775Durx7483LsDTh+WnBAyaZEcUQVeROwjtxw073FnlFHcbIeOPeiRqJWx3XKjWOoWcKfvvskRB8Y22FFLVsEds85FywzC3QBHbDTLPgzBfyrT94rBnV8HGrenoShnlNu52Iqy0bgENI9If+N97uB/HK/X8V4WOMHT8POqRXhx0bxCDNaKahp7d2cmQfNzxbnLgWmQD0++rBpk4w589HjT33c8zCTfA2FYQAAoQyc0n73hVsZiNRlQxCsyB/inZucZR5vcHZT3kLiPj0Q0ryN5ario7mSflgAvyzLHNltYt5rQjeuy+cFN62DwIFRtC3GSX3UgJjtmG8M7U8NVlFPBhz14nWv+v1TYu4T8Zh/zQqZl7APAFuvKdxwVoJIkSPaXj3Ge8gFgdMzQcI5ndssHKteY8qSQxziVKx+YPx+5jSL/P8vmw5RPdiTwUupaA59jssFGgWKdoEfFKl66JYdqQ6yxiHT+FgtJCqoZwB5UD9k26WZLfaHQegPsoVfwi+fApqBKMY10o6KqkdDjvS6+GA3vKrUIbUt/wStWDjM/AZls90a/9aHjFksSkhcGlJCAao3CxALyVc/BrkJgKID5MvBonhYT8tojj3PcbMXBP3ubnDqiFUfdTSroCiKY3xgb1FHqmfZNXRVpVlXhV9AK3gPYv+J2oTgw4L0NKm7h0laGf3smE33UCk815gohfcrKj/0xuH6hpjIRUPwyc/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(186003)(2906002)(6506007)(6512007)(86362001)(316002)(5660300002)(38100700002)(26005)(6666004)(41300700001)(82960400001)(9686003)(66946007)(66476007)(8676002)(66556008)(83380400001)(6636002)(6862004)(4326008)(8936002)(33716001)(478600001)(44832011)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wSbVbI+H6esPS5CdFLrxKea95vWgDZm2LDpLSLrGlbdwNICIZUShmtjz5V?=
 =?iso-8859-1?Q?0skvvAMi2HYIEi4hxXs3xFuJd5eIxMe2NSIfDDvtzNqInkZwhdnmKDSz2U?=
 =?iso-8859-1?Q?A0m4ehX0XMvdl7hxiLpOD6PaAQkSVGXh3GD0aznRI53t8ZS3Pdtf4CS9CP?=
 =?iso-8859-1?Q?Qqsx4ysgMbS8EqFEJKdEiyZxZBTrNzMnLKs+0atH1g3ClmPFilbA04ZEmA?=
 =?iso-8859-1?Q?XR4L7MlTGz+CA8y10Y74a1SqPoqtju4hmFuAP2BOZXiY/Wzbusmii1p1Rq?=
 =?iso-8859-1?Q?KZ3VWx+Rh01idrqmEj7EIHqABEQb/d6sjhqD116utS3oZUXxzd6AauWmL1?=
 =?iso-8859-1?Q?xjV3mwqRLhBwBNVa0AYN1m61oZOQWXcTSrn5asa7NiXatLuYJpjPA40Idq?=
 =?iso-8859-1?Q?+GN8noN6++cnjSZT4x8Xk27veAtSX3l9LEtCoOOBDe8lli/waBgx4/J1Q4?=
 =?iso-8859-1?Q?A8P/ox32wcnvi2RF/ysg26ErdWAIIubxTOkBmDHrkjo8YjK0J8WiI6xpfQ?=
 =?iso-8859-1?Q?ZzGDh1YwbePU03FTOEacH2fAerxBSAifUDnipn5ETif/5cmV3Mw+UyA81w?=
 =?iso-8859-1?Q?tSDF5xjGQfNoQqpJBeb1RDjohHa+WMJEUGftFKSb+YrMAbg0ITeu6c4hdn?=
 =?iso-8859-1?Q?naJgB5oQ7xnGHmkxkbxc8p9gu8Xm8/ecVGrluhd1MS6fNAD97PJgpL/sa3?=
 =?iso-8859-1?Q?4TyQDujJJkHXkELIaFKQ0YKFFhbKX5BVkBvX1Y4aSDmXAzsX4VGJZ33O+m?=
 =?iso-8859-1?Q?VBIAYHrA87M4ZXUm+GW9gr5Dl5ChdUEq3RAt3GLCYKc7N+Jn+2iMl4Q0dL?=
 =?iso-8859-1?Q?/81NHRd6KlLI0upGsWqLMmYsVQG7LSchMonGz7f4EBKC1k7YczFshDOJi5?=
 =?iso-8859-1?Q?yNqobp60SRxh4Asx9NZm4/HwIwI7zVoodgqLcJDR6SLwdDKoOVLHOhDD98?=
 =?iso-8859-1?Q?Osdcg6E6KmzjNQbeWhPUt4dN2Z3KiOC+AD5lalIuiEtAGfSw7T32MTYH0K?=
 =?iso-8859-1?Q?gWWOnYStwFvjznm1jGyVw//A3BrGBcwaqH5ZWg5x1EpBYEPfFPkLPj0k+P?=
 =?iso-8859-1?Q?vUyFrR9V2MOh+dRC+HJjsBfFnozQ9G/JKEbkkO5HN5nPuhAfwwaT+XWEaB?=
 =?iso-8859-1?Q?ut+dgG/gc0/4CY8qxUiXex4IZuX82QsldatbJMlbi7W0e7MmaxyBfldkQL?=
 =?iso-8859-1?Q?LdHJ5P6UYpuFWXTGtKQJjS4H2GqUJBxS9Qfu8NRk/+V/UO/48V+blffi8+?=
 =?iso-8859-1?Q?yxkO61pA/2U+F5DfJrm0WI9ESMrljYWYDt+el2jLXb1sQm7e5IF6eThHHV?=
 =?iso-8859-1?Q?To4S0YIJqiz4GbWN17df7s8wUl2lMd0dlvtTgxlo25vxNzA1J8Z+Wzzq7/?=
 =?iso-8859-1?Q?9jWJgvFiytjNVWc7CZrdQFn4dwPD8UxwEsqyWi/0ozuZwozQyLqT0KvFV5?=
 =?iso-8859-1?Q?nNf+YD2LRkoQhwJ0nn58vw3PeFPzbF0rqiTKoWFWBx9IOqqkkg/Fgpynmh?=
 =?iso-8859-1?Q?US+FULghd3d6xbOwKaiNZyM/vglLQUywQLCkT1SWe1d7kxNcAW3owvPGxZ?=
 =?iso-8859-1?Q?/h1NCbPjcDroR57SPokITeRS2TAxM7evZLCpH5RlUyHHzvOdGhwsoBve5A?=
 =?iso-8859-1?Q?wzlx5kt3VG89o9qw1IWzVIYW4mGqq15r7magJa9YtOUQqU0e/514z3XiMV?=
 =?iso-8859-1?Q?SCHFHPuefuEF3kmTswE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7643a2fa-60a8-42f3-c1e5-08dab2bb5913
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 16:51:35.0536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36fQJ6pGX61TYlJJCJgFrSTYMMcOQvZrX/AlbLprds98nyCc4I7mbdbEs0GjdzGUnblRhWh2bJKDZveZFHv4hy5WSsfEuj8n6muTvnym4LNVRQxis8fLIhlPs/w6K777
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 10:16:06AM +0100, Matthew Auld wrote:
>On 19/10/2022 19:28, Niranjana Vishwanathapura wrote:
>>On Wed, Oct 19, 2022 at 05:07:31PM +0100, Matthew Auld wrote:
>>>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>>>Ensure i915_vma_verify_bind_complete() handles case where bind
>>>>is not initiated. Also make it non static, add documentation
>>>>and move it out of CONFIG_DRM_I915_DEBUG_GEM.
>>>>
>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>><niranjana.vishwanathapura@intel.com>
>>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>---
>>>> drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
>>>> drivers/gpu/drm/i915/i915_vma.h |  1 +
>>>> 2 files changed, 12 insertions(+), 5 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>index eaa13e9ba966..4975fc662c86 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>@@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
>>>>     return i915_vm_sync(vma->vm);
>>>> }
>>>>-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>>>-static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>>+/**
>>>>+ * i915_vma_verify_bind_complete() - Check for the bind 
>>>>completion of the vma
>>>>+ * @vma: vma to check for bind completion
>>>
>>>Maybe mention the locking since this is now more than just 
>>>DEBUG_GEM stuff. I assume we need the object lock or otherwise 
>>>some guarantee that the vma is pinned?
>>>
>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>
>>I think they are not needed. The fence reference is obtained under rcu
>>lock anyhow (will add this to documentation). Only thing required is
>>that vma is not released, but that caller must ensure for all i915_vma
>>apis anyhow.
>
>I was thinking more about how this potentially behaves with concurrent 
>bind/unbind, and what it might return in such cases. I'm assuming most 
>normal users will want to have an active pin and/or be holding the 
>object lock when calling this.
>

Unbind will anyway wait behind this fence. As it is just returning the
exclusive fence status, I think it should be fine even for concurrent
cases. Any specific sequence you are concerned with?
For vm_bind use case, we do have the object lock while calling it, but
I am not certain about the i915_vma_pin_iomap() use case. The permerge
CI result is clean though.

>>
>>Thanks,
>>Niranjana
>>
>>>>+ *
>>>>+ * Returns: 0 if the vma bind is completed. Error code otherwise.
>>>>+ */
>>>>+int i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>> {
>>>>     struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
>>>>     int err;
>>>>+    /* Ensure vma bind is initiated */
>>>>+    if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
>
>Just realised that this leaks the fence. I guess we have yet to hit 
>this in testing.

Ah...will move i915_active_fence_get() below.

Thanks,
Niranjana

>
>>>>+        return -EINVAL;
>>>>+
>>>>     if (!fence)
>>>>         return 0;
>>>>@@ -457,9 +466,6 @@ static int 
>>>>i915_vma_verify_bind_complete(struct i915_vma *vma)
>>>>     return err;
>>>> }
>>>>-#else
>>>>-#define i915_vma_verify_bind_complete(_vma) 0
>>>>-#endif
>>>> I915_SELFTEST_EXPORT void
>>>> i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>index 1cadbf8fdedf..04770f8ba815 100644
>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>@@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma *vma);
>>>> int i915_vma_wait_for_bind(struct i915_vma *vma);
>>>> int i915_vma_sync(struct i915_vma *vma);
>>>>+int i915_vma_verify_bind_complete(struct i915_vma *vma);
>>>> /**
>>>>  * i915_vma_get_current_resource - Get the current resource of the vma
