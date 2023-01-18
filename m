Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD516713EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E4110E6A8;
	Wed, 18 Jan 2023 06:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761E910E1D8;
 Wed, 18 Jan 2023 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674023104; x=1705559104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FwJX85mDCMzHT2Q5qLyhX/dc4pcC+hfObwE7W48SqlQ=;
 b=Ju7VpYkV7+woAbIK2p9eBGR+MEYfRdlWjfmCj3cEZN0LwT08a3i6inp/
 +dOTtoh1dVdxXGhFNiEPvyr+/gHyddS3WpXauXye2c/AhDnAHkdEajql7
 WZEdFEhp7iz+Ts2dO1E6J5henpXOL57XeUT/LOjy12I83Rph41JbK6Xfy
 hOHV4vetimb6AcI7tawWWAwMn74WGK36gvWASrlCLFp4g20ljSwV7bc2W
 ErjGjcrxgOopzbsIndU62G+Qo/H2//8ECqOc5KxmXPkqytZpX2yNcRGzW
 nsaNpiylhGzkP/qkabtr/fpC+SEO92UAbMg2pYETCrEhIfxgT1HyZ56U+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326984082"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326984082"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 22:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="637144143"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="637144143"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 17 Jan 2023 22:25:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 22:25:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 22:25:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 22:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjgFak470I7h+GRoItvPBKm8pMpowoUAijEWF9sFBjG/oGHzRKLwcCtoe/18iSQmP9liCopJIuyUbnorTSbxGtlEsx7bzO9ddXgUrQH56kC42dRMNMP9mvn/L2Xrb1EpHpl/rlFluZUrrlV4gwc3CGI5tVnvNfZxxuEYv24p+CkXprGydDfArFYSm2ZmkfnryAY8VWo3UkYS/dYnRIbeAVHKglt/YnZXXJDGEziw+kOKSb8J1NzQ03aBWNBTKXcLCF+EBRvzFA7Tfh8G53U2Ssc/w26sDm8rAyVDxvjBYRgbT7YCs4LF/A0dlpbXEhZ1/bZuRSPIl5qW1dW4yqdfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cQFJYKdTK/UfBfVNuh5DAC0XEhI/6LMEVq87cNQhcU=;
 b=O8fbcYzm0ywmVruWZ6+yQlI3Hrw2NS9OpuBzY8JaAJGMO4jw2tCMeTxqU8UoupGkjWu6y5fwguj+c8ReGhNkj7aeeSY9Q1p5O9wJOhciZ79tea7EpEGmHSGNCXywuuoMPkjH8Qic//kGg4tszu6OiSL0ms/agaZsiwViu1FkWvgb0HC2LkwaiO/MxlYIaWbod6kmtxascyZUY9gPL3OcyokTJplSbP5n7Qz56KmixacHkGCRH2XanSc/7+/i4nNOSNeBaNXog0K8UaJSIlMlAcTmGMWI8hOlFmpI2KkwuOI/5sS90lNES7Fjq4NWnOXWF/M78C3kQrLkZFckBPdkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 06:24:57 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%9]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 06:24:57 +0000
Date: Tue, 17 Jan 2023 22:24:54 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v9 23/23] drm/i915/vm_bind: Support capture of persistent
 mappings
Message-ID: <Y8eQtuZh2oCucmjt@nvishwa1-DESK>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
 <20221212231527.2384-24-niranjana.vishwanathapura@intel.com>
 <f684e366-417e-e087-764f-390f65ebd0f9@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f684e366-417e-e087-764f-390f65ebd0f9@intel.com>
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ade1edd-6167-4414-46b7-08daf91cb83e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRD3flF+2OyJEJgC4pfb+RRCOu2G1N85k8PaFekdILATVV/f90nY2hQat5aOOX2IHR0ej++djaI1N70L115v+MVSm2bZcG7qHdmAi8FyG1igusbcR/hkToOlKJ2L+p6Sfo1YjyKLTCvLGQcKpos1hHom2tD1oUDgzGpzNNzit2QPAOuyn6Oojph+P5Cy/iEX0DjEpiCLL2QGwyJnrkwn1Kmj5VzHBpF9oLAchTU2p6ErSmMVdYnIkXphXGqOwmuohuJIVoQCrEhFsunCrzJe6QeIveMM4R+Izm5sme88diutrKC8WZkxxWYvDY3gn1SMdXKntYYpqPrOPuoStgqa5L4xllm7BpxU9umycmqlpD8PhUqQL/8n40t8h2XCK/tgfW5615ZPR37WI4VFZxKhIpWax0kiDNd6sRRn1TMaaF3oEZVIjFte1GASeRcCO7QyyKg/0nz0jPLJzNqftXuiN1QvvFWkhpDrjRLFzkCZ1/nnX/eBRC1pMPCgDaYHV5ULmYz/v/NDcA+d79VaWVT9ee6kgpCSRJfuEriYZMfvO8ISFmxhOcqkd8QsHOff9zcS/AYrokGMvQtmOhmdvS8my+5GpuSzJMsiPF2MWhxX7hJOVeYxzkpov1TMouhBS32J5casnTx1rdPHKQwWuali2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(8936002)(8676002)(86362001)(6862004)(44832011)(66556008)(66946007)(478600001)(5660300002)(2906002)(4326008)(83380400001)(38100700002)(82960400001)(66476007)(6666004)(316002)(6486002)(6636002)(33716001)(41300700001)(9686003)(6512007)(26005)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VA+Wb/XSInOr3i6bzVuZAscq090If/YD2Js/yLZe8DaZk6LI5l8pl+/HZcHA?=
 =?us-ascii?Q?cwZCRdc78TFR20zQqqIbYWRA9EuECJVNUj8/2DJ6KMQyMgbzVKJD2+giJsq0?=
 =?us-ascii?Q?wYyghj9d0O2AbWTyLwqFvJ6m6QBprXwk0y0FozkoParbf9BeY+n7exfHpwB+?=
 =?us-ascii?Q?AMW9Z2GrYsLL9KSRWKYuQaUY1fvwguUJ9g5mVy6wLzUT2u4SPDhaJO+pv+x/?=
 =?us-ascii?Q?xW5A0xuBlE8H/uECP4fgatFQBpN9qMlUrnd0rtq/HorIlcBlbrdSXjMUonbW?=
 =?us-ascii?Q?aLgRZi1s1LSkIukyZlkCL3G4bR3H0QtJhJ1wtazyeU7m9bcOozAVGHIgPi6F?=
 =?us-ascii?Q?gbBddojxREMQE/vN9jFUgpB2ad3h8ouJXpZ8MKkKBSg/oRgjmrdWUbrlHEc0?=
 =?us-ascii?Q?UTyi6IwpL6P6bMDeg4bTUz2VTeoLuBj2mlISCLHD9Fzju5c6bJdx1g8wxjrN?=
 =?us-ascii?Q?LqtugY1qPecV/NO4ekzVldmBatoXgMb/iHjrY8h9Yc66RLcz4FEYVbGU6tBk?=
 =?us-ascii?Q?B+85JUgx/iT5aXxNQ+30FQYKt2spxxrheMOJ16201fqB15DhjMF6Zspgu8aq?=
 =?us-ascii?Q?BV5uioTbZuHsY1x7e0SEQIokacnnJAxBey2cw3SKlo/kKOgw5PoKdao7uZgJ?=
 =?us-ascii?Q?0vMwOyCREa7fOhaqD5sbtXVbsHwb5HqgMbjDWNf3Dl6/ihewDSy30bz9rVot?=
 =?us-ascii?Q?nvHomo+NKZG85f6CvY5btGSI+jeZe1C85+IcGI83LiTEheZ+0x3G7tChYPSV?=
 =?us-ascii?Q?pSGDHcMkRdN1c0qAnJBdRWArU//ghNkeP05Lp5DKIedgyl5d4UDj8QZ+Fq+f?=
 =?us-ascii?Q?HiKfcOvIFKOD3gKicNywxIyZPPJM7JJRGJm5Kh/iz9EAyfDEFt3TDLrGXk2g?=
 =?us-ascii?Q?sbfQERHFKIkW7ouGBGAs9pFzjB8xwgsh8YJatkXw/PHWBf0/fc7J8I3AXIAE?=
 =?us-ascii?Q?zOIVepikY8gmXoZO2j+n7y2RXTpwZ2DQPKV9HAj+txE2gU+pJUViWXLW5n/u?=
 =?us-ascii?Q?nIk8o1kK8YlMzQlzBesgYlqp42z5rlWC3TiDy8W3MiP4IGSRtd3+P/rTc8mA?=
 =?us-ascii?Q?a1G8/0QTibEyhI5k0BOMkrKW7Ir99kHVpUllA8trGKYtjGxuaCYO6kURvEqE?=
 =?us-ascii?Q?8/IhG1ENlXMzHbAYt7jgH+BEItqe17IP8nO/R6OGcAGo7RQPPYVY8nd+h/OY?=
 =?us-ascii?Q?NW7prFDZO7p41EKJAHzRh8pcd+pBBLrP5O9j5B/dbjnmF1WbbAPS+qHhUg4+?=
 =?us-ascii?Q?4ZPN7LUz7yoCN6BYOY4vNpIFehBpJm2fMbsDlOQjCLj/wVSLuUSniXV3Fk6B?=
 =?us-ascii?Q?Xr393wdBdf7QMbRSQbiMwKYFwyoNJw40QP5aEmxIzI3OUp3ZdWC9zrwwZpIJ?=
 =?us-ascii?Q?CZPJ/hu0dbJ7r8H1pm1NtSAFe+596SdQS/WMUFA21Jszr/c23+R3WajFiwW8?=
 =?us-ascii?Q?funW9VJhYhA9sgR55G8abWZjGRY9riCYII42RtX8D8xRLLW5sOSERNABFRh+?=
 =?us-ascii?Q?Enql5OHy2ZMS9dKWi8la27hobLFYGHY05ujvw0Z/StUS3CoaCc33PrZpD13X?=
 =?us-ascii?Q?MNz48TXbQMKY+cuM57IpVR+mbczk715PGI4+qSNX9+XhX9DQdOWuMaZ+Qix3?=
 =?us-ascii?Q?Q4ZfNHO5Wmo1FKH6iGdujw0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ade1edd-6167-4414-46b7-08daf91cb83e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 06:24:57.4178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0pGdC+3LkvoK3jEnKPne40AKjCk+aet3e87c6iw6dty7rZrM12FjY2fGwKYO52fWWUWc4mPQHDAxMR7OxYRzu32XvagHzqkxFE6QdEjsqRcxeRN2F2ee/I6WwTV3Tny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

On Tue, Dec 13, 2022 at 12:03:07PM +0000, Matthew Auld wrote:
>On 12/12/2022 23:15, Niranjana Vishwanathapura wrote:
>>Support dump capture of persistent mappings upon user request.
>>
>>Capture of a mapping is requested with the VM_BIND ioctl and
>>processed during the GPU error handling, thus not adding any
>>additional latency to the submission path.
>>
>>A list of persistent vmas requiring capture is maintained
>>instead of a list of vma resources. This allows for no
>>additional handling around eviction.
>>
>>v2: enable with CONFIG_DRM_I915_CAPTURE_ERROR, remove gfp
>>     overwrite, add kernel-doc and expand commit message
>>
>>Signed-off-by: Brian Welty <brian.welty@intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  .../gpu/drm/i915/gem/i915_gem_vm_bind_object.c | 13 +++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c            |  5 +++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h            |  7 +++++++
>>  drivers/gpu/drm/i915/i915_gpu_error.c          | 18 +++++++++++++++++-
>>  drivers/gpu/drm/i915/i915_vma.c                |  4 ++++
>>  drivers/gpu/drm/i915/i915_vma_types.h          |  4 ++++
>>  include/uapi/drm/i915_drm.h                    |  9 +++++++--
>>  7 files changed, 57 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>index 78e7c0642c5f..562a67a988f2 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -88,6 +88,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>  {
>>  	lockdep_assert_held(&vma->vm->vm_bind_lock);
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+	mutex_lock(&vma->vm->vm_capture_lock);
>>+	if (!list_empty(&vma->vm_capture_link))
>>+		list_del_init(&vma->vm_capture_link);
>>+	mutex_unlock(&vma->vm->vm_capture_lock);
>>+#endif
>>  	spin_lock(&vma->vm->vm_rebind_lock);
>>  	if (!list_empty(&vma->vm_rebind_link))
>>  		list_del_init(&vma->vm_rebind_link);
>>@@ -357,6 +363,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  				continue;
>>  		}
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+		if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
>>+			mutex_lock(&vm->vm_capture_lock);
>>+			list_add_tail(&vma->vm_capture_link, &vm->vm_capture_list);
>>+			mutex_unlock(&vm->vm_capture_lock);
>>+		}
>>+#endif
>>  		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>  		i915_vm_bind_it_insert(vma, &vm->va);
>>  		if (!obj->priv_root)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index 2e4c9fabf3b8..103ca55222be 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -297,6 +297,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>  	spin_lock_init(&vm->vm_rebind_lock);
>>  	spin_lock_init(&vm->userptr_invalidated_lock);
>>  	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>+
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+	INIT_LIST_HEAD(&vm->vm_capture_list);
>>+	mutex_init(&vm->vm_capture_lock);
>>+#endif
>>  }
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>index 620b4e020a9f..7f69e1d4fb5e 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>@@ -281,6 +281,13 @@ struct i915_address_space {
>>  	/** @root_obj: root object for dma-resv sharing by private objects */
>>  	struct drm_i915_gem_object *root_obj;
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+	/* @vm_capture_list: list of vm captures */
>>+	struct list_head vm_capture_list;
>>+	/* @vm_capture_lock: protects vm_capture_list */
>>+	struct mutex vm_capture_lock;
>>+#endif
>>+
>>  	/* Global GTT */
>>  	bool is_ggtt:1;
>>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>index 9d5d5a397b64..76b2834ce958 100644
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
>>+	mutex_lock(&vm->vm_capture_lock);
>>+	/* vma->resource must be valid here as persistent vmas are bound */
>>+	list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
>>+		capture = capture_vma_snapshot(capture, vma->resource,
>
>Thinking some more on this, I don't think we can actually do this. The 
>vma->resource at this stage could be complete nonsense (could even be 
>NULL?), if you consider piplelined migrations. For example if we async 
>evict something, the object state can be freely updated (maybe even 
>more than once), even though the dma-resv is still active with fences. 
>This is allowed since the actual move(s) will be pipelined and should 
>respect those fences. In eb2 this is solved by holding the object lock 
>and taking a snaphot of the vma at submit time, which should ensure we 
>are capturing the correct vma->resource and sg_table. Maybe I'm 
>missing something.
>

Thanks Matt.
I discussed it offline with Thomas. He suggested that probably we can
do synchronous unbind for mappings with capture request so that the
vma->resource won't be removed under the hood while a request is active.
I will update the series with the fix.

Thanks,
Niranjana

>>+					       gfp, "user");
>>+	mutex_unlock(&vm->vm_capture_lock);
>>+
>>+	return capture;
>>+}
>>+
>>  static struct intel_engine_capture_vma *
>>  capture_user(struct intel_engine_capture_vma *capture,
>>  	     const struct i915_request *rq,
>>@@ -1471,7 +1487,7 @@ capture_user(struct intel_engine_capture_vma *capture,
>>  		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>  					       "user");
>>-	return capture;
>>+	return capture_user_vm(capture, rq->context->vm, gfp);
>>  }
>>  static void add_vma(struct intel_engine_coredump *ee,
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index d092a86123ae..9be8aa448874 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -248,6 +248,10 @@ vma_create(struct drm_i915_gem_object *obj,
>>  	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>  	INIT_LIST_HEAD(&vma->vm_rebind_link);
>>  	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
>>+
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+	INIT_LIST_HEAD(&vma->vm_capture_link);
>>+#endif
>>  	return vma;
>>  err_unlock:
>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>index 89f9854a6f69..c4fd61d51ce6 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -310,6 +310,10 @@ struct i915_vma {
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>  	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>>  	struct list_head userptr_invalidated_link;
>>+#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>+	/* @vm_capture_link: link to the captureable VMA list */
>>+	struct list_head vm_capture_link;
>>+#endif
>>  	/** Timeline fence for vm_bind completion notification */
>>  	struct {
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index b9167f950327..5fde6020e339 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -3925,12 +3925,17 @@ struct drm_i915_gem_vm_bind {
>>  	__u64 length;
>>  	/**
>>-	 * @flags: Currently reserved, MBZ.
>>+	 * @flags: Supported flags are:
>>+	 *
>>+	 * I915_GEM_VM_BIND_CAPTURE:
>>+	 * Capture this mapping in the dump upon GPU error.
>>+	 * CONFIG_DRM_I915_CAPTURE_ERROR should be enabled for valid capture.
>>  	 *
>>  	 * Note that @fence carries its own flags.
>>  	 */
>>  	__u64 flags;
>>-#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>+#define I915_GEM_VM_BIND_CAPTURE           (1ull << 0)
>>+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   (-(I915_GEM_VM_BIND_CAPTURE << 1))
>>  	/** @rsvd: Reserved, MBZ */
>>  	__u64 rsvd[2];
