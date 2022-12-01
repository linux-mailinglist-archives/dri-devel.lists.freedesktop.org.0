Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B363F3CB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1E710E61A;
	Thu,  1 Dec 2022 15:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC210E602;
 Thu,  1 Dec 2022 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669908468; x=1701444468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W8Oo7WumUghW0EqVBunWKEqLR1cy3eVTcYqKdQfxQoI=;
 b=gFKZHhiUzvbIbjGeUZkyoqQeaoANFHMbahWwQ8VZZksd7Jj3yK4bWYnS
 JyJpIV5/iRDuPOPYog867c8O7DqHhY+Rn6qJyC2byhMthuMWpn+Cq60Zk
 aCzUfNPvTafIQGeDWVfoPzy/G7IN0RCRqn3ONGUfj2vfUs2XMKRdAuCAu
 Rga5oIUgkZlWOtjbGVoJpUd5mTseNEkWCuOBkEqIHWrlsKftlkDopq4Co
 9u3JvGu1iQSbTI8q6QkrXD7jfhJPvf+c/1G74JDoGk6a72CCreOoVm9Mn
 cz5S9IHB8PX5hyQQYnfpjQpu+wlYSRxCwAowbxNZi0EbiGIwFRLMIzUHK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295405150"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="295405150"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 07:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="638422488"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="638422488"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 01 Dec 2022 07:27:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 07:27:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 07:27:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 07:27:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADw4zwsTES+wOMpvs0UfzN9rejrkpA9Ky4EGEoljPoStYmAM2Hs9SD3BJFYK+kvB3ppj5vuEzenT48cLbPBNoHZqq+AMNwSwTg1qd80M2Ck9m6+d1gHhnU5lFUklTnx3/avu1WsXhocQRjPgHZzSm0j0+pWJ7ScXfuoqh0vQn5siO+2rG2uvwe0w8ZoSGAQF0CBEP2XtGf8ozx6zjk987O4Rhgn/z+ZHIkXfFpofSHQnfhNVlveaUUyMLJl48T3TOtnzo53Ad0l1hjHTobFI8SLc7yn8/ARP93JkbYAITk5jcv5yN40QFi7GrfXIucmenSqc9BAV16sx6MZmPzAzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq0DfdcJnEfz5aVgYZ9HvcCYlK9+0Ut+6edG9Bh8+Ko=;
 b=P6zs9rAAHFkeSFUP6pag0I1FYkBEj3GNFXl1xj9x9bJJdFjkY6628O4qE78Cc7nXEuA7qILxtYbf9VNsQ6cMX3kJyC3J2uDxVSrEtvsHSogv3XQbgXkB5O3BtKDUir/eBId5KXxlR/Xbc/ki2Vs6nbBdWBeVLBepJ0lAX3xJBM0e3GP0LgUY2pWgNNtg3s8jDdkWNkTtrUBEiincysXWlfg3Y0yvX9WhA1zA2giSaFeZN50YlOZB0+bYWfXEsI0UWwnCDcBTNHTVWV0XZoscok4sspa59Mm56NZtEZ0tara+Y2NESkaBdB8C2a90l91G0pz8sUsktFzFDXtpepXJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 15:27:42 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:27:42 +0000
Date: Thu, 1 Dec 2022 07:27:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 22/22] drm/i915/vm_bind: Support capture of persistent
 mappings
Message-ID: <Y4jH4297KUGrYTr6@nvishwa1-DESK>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-23-niranjana.vishwanathapura@intel.com>
 <dbbd19e4-4354-bd11-a68d-435f59150fc8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <dbbd19e4-4354-bd11-a68d-435f59150fc8@intel.com>
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd05bae-d97e-4e97-482c-08dad3b096ec
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZI85tsuKtag9WwGafA+dU2DdO7Jjit/vaE7dTnIXYi+xNlIwoxXdnG0baySDFPUgTSmrRXEqmapKjgA4Hn37+QvKFHMT11C4/7SBIPX2kSBdNyNNdpE+MDN2sBUleDg8TrBjG0keS+XhKFu93lWhYCefr8V43Gput3X+BXpOALQugqrYVo9A1Ad5naanhr8+MKD7qfJsAKhtldFctBCwyvs+5YTrzYPmQniintU4wTs9mkY4KUNz79k62Jq1mBXfiY9apcEcTptC4z4sr8clZ5hpYZ9zQd3MiUfGkzHuRZF8Ciw4CrLT9gY405R+YKkqlju9AmZHMtt3CLvkzqyGGshsvRsHLgi+9xNIRNdrH2gwohdVqCZKqK7OPfYYcIo6TRRT0ZZLDoa4WXuoGLdFaTX3ky7kUqPYWBniRlHVntRTfsUQPACnEcDnjQFxyowcxwm7CS0wPMC1CtwFuYwcpvSDQ3IKOU/QDhNAIjSrOpo83b2G3cEPlDyVPNRF2CLavIS8yk74+j8RnREgPqdRhicnL2dSpDFjMpO7enOBbhYc3lKvabsOxbsoLpqJ2YwOmIM4YACf3+i5g8Z5wdb8YwrmIuOVRHw24pUInex/vv0rLVLBlleRy9IYUnFpFpAUGS8Kh9xreKCtzMm1OL+NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199015)(83380400001)(4326008)(8676002)(66476007)(6636002)(316002)(66556008)(86362001)(66946007)(6486002)(33716001)(6862004)(38100700002)(5660300002)(82960400001)(44832011)(8936002)(41300700001)(2906002)(186003)(6506007)(6512007)(9686003)(26005)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctrCmbU0fTixw39EPBe5DZwNZlOvj7lfss9vmCI/nXePaeFKQiJK4o3qk8fC?=
 =?us-ascii?Q?bHwR0VswUlXK3F6KNguwmdVJT1lNNnI+9jj2CxekfbpIL2LA2tBlDsJJJswM?=
 =?us-ascii?Q?YTPeskfRT0ELXPR8crJgI0wT1+yi2Z7oMPAMN+ER99C/1OohS0Ox2W1Qaejx?=
 =?us-ascii?Q?a/av2Www+xKhYrwDQAuu66Z3cQ3u0onUrE7NTqzIM3d0ppngtE/ltFruR7kw?=
 =?us-ascii?Q?xwh+jgP7D86xVXKzaITQs6z35hf4q/L+Kyx41lkhRyeZ1Z//GjBjYeTOKfIS?=
 =?us-ascii?Q?VFgjeFcxVTJYNaVBFBCcr9O0CtIJp4+ZxHKKg/lBKgP4zCJWfOJqSwiUWdSq?=
 =?us-ascii?Q?KHT6xq99isWf7nxbnSlEQpYhdxnrfgCUmqOgHTbkKb0krp4k51lNUR22/0QM?=
 =?us-ascii?Q?Zc9R7GmzcFiM1jrfNSPWyUfVBBHnqDrqbb5f5Tn1WrNfRsb9ubJGh6nL9gsO?=
 =?us-ascii?Q?ssUA3rjRRygqqU53bJXr5aUzCNtzi7SI7ngeAfhm/9NTyHKuRjWNePpE8AMF?=
 =?us-ascii?Q?mSgr0t7Hb0ghRIC1jf3MVh+QYs652Ar4Jq2l/5jcIrlfvGV1q0GK1M3sEMHU?=
 =?us-ascii?Q?31SIyNSKhsnBouikucrFiZVBuQWx+qGzBXhn5JVMlAZx8GwFO73uWWeTeS6r?=
 =?us-ascii?Q?dHXOYboTrxEwdEsrJfECLEjn/Dd7Dt4D6nompb+nWy4zR9pCuPz0Iy+/6wnn?=
 =?us-ascii?Q?C83jitZ2yKfxjZIzLKKuQgQi1Ivhx3NeGTAswCyjHGu0UpSzIqR4fwQs4Oz+?=
 =?us-ascii?Q?HQQNsy+CNk62l09b+QUBtoJwDKs5+6rj8R66+YUC168wy+tQYCkONL0BhLrB?=
 =?us-ascii?Q?hPijW01Og1qoLvWYWbHd9X7irzsY0pz7Hqga80feQXUi9fz9e1J2tfJPNdOP?=
 =?us-ascii?Q?GxvvC8qoFvkQLRUbqN75e4BKv1Gluxm7J5QyCE9WFLbK+LaPuZ7ApbmVNR0p?=
 =?us-ascii?Q?ZuwfKCMhcS45B0pIZRduw+kIIVcy88CWWNBNDe1A0OHLZ74NcDjEb2TjNPjw?=
 =?us-ascii?Q?faWdMPhYd10N7mgwTIIxQVPDyZzna4n3KGoK5efplEuXP2cMx3hG6S6369ZR?=
 =?us-ascii?Q?z31YCXqGLqTP0v31ewusSm71JebcPT4RunpjCxuPgup3LoWVmX2Tn3xOCQXF?=
 =?us-ascii?Q?7CeZimYdKtHez33r9xSRezGyvkAhhIKymh1lU6RfSbHh53SqSl6VnHRP4OHa?=
 =?us-ascii?Q?TdzzCc0zSl1uvkANdax9HPjbEF/WswwuopeVIjZhq7sLHh2uWMkEo6Lghx0r?=
 =?us-ascii?Q?G1QXGT4nWM3UiHgqPrB3B8R36LHKCZA+hvT7Eg+/9IWuUxJq1lmv4c2nWqL7?=
 =?us-ascii?Q?7uz1ybhd3CF+IjuQfy3SuhdiLEeo7SEjVmWJ+uAQdagczDzj3b7Hb07O5a+l?=
 =?us-ascii?Q?5xYcqx0lalobHlU4qBA6AiXNZg0PWZ1WLm1SGvO3Iv7CsPJMk9DNEPYkJ0Ba?=
 =?us-ascii?Q?eDMVNizI7vdGnJGAfv2ZE/Jdqw6eruQfFXb2fxA79JvFznWk6SVxiVNnvBaj?=
 =?us-ascii?Q?YmgCkh0D8cuUo76+DkZxPh6BgMuAr3X37HCeJl8LAS7SxlZUBCEbVcVzsTxS?=
 =?us-ascii?Q?EI3SSWENtEv/amHyTHS7HR65TUB6GzEfF4wHUVUyjqWnRMguy9MIvc442YQU?=
 =?us-ascii?Q?tkkjR66PbS2+M+wotq9DWOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd05bae-d97e-4e97-482c-08dad3b096ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 15:27:42.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5D+8ClwIOV4xe9QFJQO+8QeNvVVhTjXhcViXQ/NGigo61uPUBsLenxELQg0F02Q1a3nFywory7vgMXCheqel9wSjV/F1w7QNj5UTdYUTR32uCMbi00cZu6tRptjgS+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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

On Thu, Dec 01, 2022 at 10:49:15AM +0000, Matthew Auld wrote:
>On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
>>Support dump capture of persistent mappings upon user request.
>>
>>Signed-off-by: Brian Welty <brian.welty@intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 11 +++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 +++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  5 +++++
>>  drivers/gpu/drm/i915/i915_gpu_error.c         | 19 +++++++++++++++++++
>>  drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  2 ++
>>  include/uapi/drm/i915_drm.h                   |  3 ++-
>>  7 files changed, 43 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>index 78e7c0642c5f..50969613daf6 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -88,6 +88,11 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>  {
>>  	lockdep_assert_held(&vma->vm->vm_bind_lock);
>>+	spin_lock(&vma->vm->vm_capture_lock);
>>+	if (!list_empty(&vma->vm_capture_link))
>>+		list_del_init(&vma->vm_capture_link);
>>+	spin_unlock(&vma->vm->vm_capture_lock);
>>+
>>  	spin_lock(&vma->vm->vm_rebind_lock);
>>  	if (!list_empty(&vma->vm_rebind_link))
>>  		list_del_init(&vma->vm_rebind_link);
>>@@ -357,6 +362,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  				continue;
>>  		}
>>+		if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
>>+			spin_lock(&vm->vm_capture_lock);
>>+			list_add_tail(&vma->vm_capture_link, &vm->vm_capture_list);
>>+			spin_unlock(&vm->vm_capture_lock);
>>+		}
>>+
>>  		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>  		i915_vm_bind_it_insert(vma, &vm->va);
>>  		if (!obj->priv_root)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index ebf6830574a0..bdabe13fc30e 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -297,6 +297,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>  	spin_lock_init(&vm->vm_rebind_lock);
>>  	spin_lock_init(&vm->userptr_invalidated_lock);
>>  	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>+
>>+	INIT_LIST_HEAD(&vm->vm_capture_list);
>>+	spin_lock_init(&vm->vm_capture_lock);
>>  }
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>index 87e5b6568a00..8e4ddd073348 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>@@ -281,6 +281,11 @@ struct i915_address_space {
>>  	/** @root_obj: root object for dma-resv sharing by private objects */
>>  	struct drm_i915_gem_object *root_obj;
>>+	/* @vm_capture_list: list of vm captures */
>>+	struct list_head vm_capture_list;
>>+	/* @vm_capture_lock: protects vm_capture_list */
>>+	spinlock_t vm_capture_lock;
>>+
>>  	/* Global GTT */
>>  	bool is_ggtt:1;
>>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>index 9d5d5a397b64..3b2b12a739f7 100644
>>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>@@ -1460,6 +1460,22 @@ capture_vma(struct intel_engine_capture_vma *next,
>>  	return next;
>>  }
>>+static struct intel_engine_capture_vma *
>>+capture_user_vm(struct intel_engine_capture_vma *capture,
>>+		struct i915_address_space *vm, gfp_t gfp)
>>+{
>>+	struct i915_vma *vma;
>>+
>>+	spin_lock(&vm->vm_capture_lock);
>
>Does it make sense to move this into the eb3 submission stage, like we 
>do for eb2? IIRC the gfp flags here are quite limiting due to 
>potentially being in a fence critical section. If we can use 
>rq->capture_list for eb3, we shouldn't need to change much here?
>

But that will add latency on submission path as we will have to iterate
over capture_list in each submission. Besides, unlike eb2 case, we can't
just transfer the list to rq->capture_list as we will have to do this
for each submission. It was discussed long time back and decided not to
bother the fast path (submision) scenario with this error capture which
is only required upon gpu hang (slow path).

>Also there is the existing CONFIG_DRM_I915_CAPTURE_ERROR. Should we 
>take that into account?
>

Ok, will fix.

>>+	/* vma->resource must be valid here as persistent vmas are bound */
>>+	list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
>>+		capture = capture_vma_snapshot(capture, vma->resource,
>>+					       gfp, "user");
>>+	spin_unlock(&vm->vm_capture_lock);
>>+
>>+	return capture;
>>+}
>>+
>>  static struct intel_engine_capture_vma *
>>  capture_user(struct intel_engine_capture_vma *capture,
>>  	     const struct i915_request *rq,
>>@@ -1471,6 +1487,9 @@ capture_user(struct intel_engine_capture_vma *capture,
>>  		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>  					       "user");
>>+	capture = capture_user_vm(capture, rq->context->vm,
>>+				  GFP_NOWAIT | __GFP_NOWARN);
>
>And this should maybe use the passed in gfp?
>

Ok, will fix

>>+
>>  	return capture;
>>  }
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 68a9ac77b4f2..0244864e94f7 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -248,6 +248,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>  	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>  	INIT_LIST_HEAD(&vma->vm_rebind_link);
>>  	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
>>+	INIT_LIST_HEAD(&vma->vm_capture_link);
>>  	return vma;
>>  err_unlock:
>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>index 90471dc0b235..10ae9f739d57 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -309,6 +309,8 @@ struct i915_vma {
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>  	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>>  	struct list_head userptr_invalidated_link;
>>+	/* @vm_capture_link: link to the captureable VMA list */
>>+	struct list_head vm_capture_link;
>>  	/** Timeline fence for vm_bind completion notification */
>>  	struct {
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index b9167f950327..0744651ad5b0 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -3930,7 +3930,8 @@ struct drm_i915_gem_vm_bind {
>>  	 * Note that @fence carries its own flags.
>>  	 */
>>  	__u64 flags;
>>-#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>+#define I915_GEM_VM_BIND_CAPTURE           (1 << 0)
>
>1ull << 0
>
>Worried about what the value of UNKNOWN_FLAGS might be otherwise? Also 
>needs some kernel-doc.
>

Ok, will fix and add kernel-doc.

Thanks,
Niranjana

>>+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   (-(I915_GEM_VM_BIND_CAPTURE << 1))
>>  	/** @rsvd: Reserved, MBZ */
>>  	__u64 rsvd[2];
