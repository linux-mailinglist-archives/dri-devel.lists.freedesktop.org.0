Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30266726A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B355A10E1FA;
	Wed, 18 Jan 2023 18:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996B010E207;
 Wed, 18 Jan 2023 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674065964; x=1705601964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=40MqZu77p543OLRB20/1JFr8xGUZG+LKBzEHbLBrfO0=;
 b=dsSvlSuGt2Fq8Ut6Lbh+sG8cqYL5SHZRFLuV94ng60tb4bDw8KCbCdCt
 vvaabvPDA95q1MjJiSjQrVLuQG20qZUEfk+O2YbhaGggd0r5Y58Mt1ap1
 kgZky5dKnqMqZ/rNSXisEyYWFvOWt0DagDM9sOwM02MjgshSh+guUuC4z
 OcrvCmNm4T1SONARnIJVsmTuojewZFDxR4jCEfAUniOu1uXvmZxxR2g+K
 gVHGcj/oyFZkUummm0fAZyq3Hvp7Cjbh6wOcb/+U0/gclChDuZggoOg7W
 tGGrL5YJsZV/IOhk9gYTSOVjxJ3YSprK4MdXnG0DZcZdzP525r/QOan0w Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389556185"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="389556185"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661820355"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="661820355"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 10:19:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 10:19:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 10:19:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 10:19:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzQjvw6L5e1HhwMmqR8RsSuiiyO+r0s9hS5VegMoeDPvjKid2xZMgQgIy1ftskfERPVc2BNTSwtrp+ArQ7Cohu6tUFyJX6HMbMq9EQiQE6gSxXg0WuVDCzsBPu6fFbFIpJ4orr5uCaH/Axger7wCStSG/YOnMld1JRrYUcUB5eW4qyLJdTJjinGK7ErBfvx4fObicqCye9O7OXWDN24cxpZ+QfCK4xslTZJS3Fm5K+Deu0I2JqENxTT3SmPiX04GML3n10p0IIw0OJCPlDmcJO1uhIhKZ4j0KKc4xb+KHP5fpjTS7Tg0Nmhbirr0XGHDADRwESureX088omiJAftbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4m20ykR1RKQK3JificJgFlk1+b8JJn9Kpk/HnR/jdHE=;
 b=YvFJYrSITEv9vykbm88kJn2DVB4slMoigAH1stCXZ7VZbx7uV7BW78PCoaWYNM+4QgYpkODbbzAp2gRoUrEKwFyKqFl8JmfEJAK1IAg+6d9m46Fk6CY96k/vLmkYKVRPMIaVCx5VgAt+5HiTRULmf4JuySKOX2ZR3v1BS2+y6W4T6PEQ0A+qUONhJuK0G5d38EFEvMPOcbaVm00FKYtEjkUAv+KZ4SdOipVgrfo2+dAUeBlIeMU6MuvGsTho5haDFxiJp5QG5fxrMlCFj3arz2NkUBMrjOnSyqDq/C9qGA9Fk4CObqiK+FOIJSsWBg2KWhjLQoHglGoCAHRQkTT8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 18:19:20 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%9]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 18:19:20 +0000
Date: Wed, 18 Jan 2023 10:19:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v10 23/23] drm/i915/vm_bind: Support capture of
 persistent mappings
Message-ID: <Y8g4JNx6q816ow4V@nvishwa1-DESK>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-24-niranjana.vishwanathapura@intel.com>
 <43b4d3b9-0c50-83e9-7c92-5389337db24b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <43b4d3b9-0c50-83e9-7c92-5389337db24b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b0b4d4-e5b0-4bf7-879e-08daf980845c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnE/yG8Y+ruDLv3qWIWa2IEUNLqVyb9iecgQVKYcJL7F2N257x50GVLCuSqu/AIqFSErGyMSap7Nb+bHNfeBEx9f+pkuuFgV9iMyF6Lpsoh+5zJrshDrx6FOv7A8zYzi5UsQYSgoIZC8/aOBoURcV1ftMOGn7D6q0pIMWoSbT3JW/eRYtrvqXS+Ru4QD0RR6t+zIFt3E6Yu3YFZ4eA1Il35wHNbOrTmBeZXQs3QmaXa1bOEP4KRNxlOaZEGszcgjrGE5fsNCnkzgu8HDanUG5iQrTuCCogrtTKaO8QR5N3aBt/gR7suQREnVgi+L3W3yKBzqRoaOvkYC5dbKXqntD0CNe7Mh6ETJ4rgCMYfTTiNbDtUx9Vvz0BIOgmfv0tNanBV8DiIg8kqzfPdYRkLzno5UTBOmGNV28x+vR59nFjMmCLNXawEE+y0hUcXrJcVSFYd+fAugLfjFne5oUdn4rRdf/d2zPPhcU5bRnA5FKtkk33GJGLQbTFwprocJuVi9u2WHuc02dKE8agkePNP1VbfTk6xzJ0PcL9CIFLRba+38Frt0evQ67G7R/1yFZ6nzBJfIEjQAjJ3eQdrQ4f2AZNhciefKXBgpEJ6qKExkYFmst/J1GfBVxay5jL6cX/uD5HUhcLsZCkWjAbSV2rDonQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(86362001)(82960400001)(38100700002)(44832011)(41300700001)(30864003)(5660300002)(33716001)(2906002)(8936002)(6862004)(83380400001)(66476007)(8676002)(66556008)(6636002)(66946007)(6506007)(6666004)(186003)(9686003)(4326008)(316002)(478600001)(6486002)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQvFckQPs39kPJx1IZhBBbmPxybhhK4oSFkEaxPv5mGyrzVKRRDn+BkhlMPh?=
 =?us-ascii?Q?NIueXT48lYXJBfdIYGmL9G+R65ylpf2m3pn12JNMRnui8g4fK+H2E7YYsbeQ?=
 =?us-ascii?Q?QugFWVDESKEthDANSE+3wZt7x1nGTG0sHzoKBQH1WLAPFh+9qamAq3BlrBUv?=
 =?us-ascii?Q?C7Ap2gsTsRITuJbrRYJDm+v0r0/EUyquVPj8N5pFe6I+Y5sHQI/17j+VE2Ae?=
 =?us-ascii?Q?8S5X/x0YV+wQcfR40BpvytMk4z1+UwoxILFBCAj9tlcySDV9168GXMr+uoZl?=
 =?us-ascii?Q?cjQvxEVWah9+Ayj6OsWfeDZTz7Ybnno9C5jRm+eFU9JR5X3NSgwjXXe6xOzn?=
 =?us-ascii?Q?E8Q9s58TFg2QxvPoN3Sq8FmXVy+STZwtyGfsbpkoDhI6nJO+ycbcjWLlGDEo?=
 =?us-ascii?Q?4ioUxCd68EPmJxOmDozHc0ZMEIJts2ozz3dCYmG9r7+Rt2+rVSarDMddmXwN?=
 =?us-ascii?Q?Ovcvu4HCfJrCXPaQkmzoWXiVs13FP5zLavMh6rCPnoFhHBj8ycBBWMOWAWtM?=
 =?us-ascii?Q?aH39VyZs/rWM4fxJ2WaFDSlfXnBrgQGb9zmKThgR3XfhNS3jcdJmd2VDFRcJ?=
 =?us-ascii?Q?qwd1JS4yCkVS18rkJyIbD4Vj4EMCUfZk0kGo46GP24JOzEXUlYHYkX8q0ywp?=
 =?us-ascii?Q?NW/V7cjQAXLZHPgomoAhQNQv0e/wLjgrR9m6ahyYj23baIS8AttO5ORtuDVl?=
 =?us-ascii?Q?y8dS177YVjDRv3l0Ou7XARGUmWy/8ypSgfxzZFrRNC5N1OgC8/t6MIExa+TF?=
 =?us-ascii?Q?ExBgjf+UqhPAEHBd4xv/GBFgWNPBDcHfEiJB6dPnQQ8lCn1m1rKDUn0TIg13?=
 =?us-ascii?Q?pZhlIU5erdvHxY0XvmplBSxemwWoV32cHJMja5IIKoGysQVdNvkuUcztYQwB?=
 =?us-ascii?Q?CJhedwngjJU/zc4Rn7R/UmPNhU6BzTrrN6Q1KtgAMftPRcpJAdFGxC33f9JV?=
 =?us-ascii?Q?SwmetydfWKUpjqIVX36PyK5mCxoKvbhgDG1xjtlgnonBZTQ2u/CZwegRg4V0?=
 =?us-ascii?Q?8lB/bud/DzV8UhrG2sPHbupc/MZJVVZDaKrtcUn+OkKpTw7Gwr9qS2fmROr9?=
 =?us-ascii?Q?K0Xth7Pi6kiZHQhrU7CjlLsGU+jj70dVEnF1pLwkLQtywQ/Eo24Huvh2zRRU?=
 =?us-ascii?Q?5a1xzecJiJWwrANdeuPIIt/n5HuQviH/wyqPIFNO4QAZixvyra8/QtLNKua9?=
 =?us-ascii?Q?dAacOvARBvX2+T/+kSpWKrVC4F6z2aYntrY7ud/CB4B9W7H8lNnGTkF33wPQ?=
 =?us-ascii?Q?upcyES3RQczx/xgJB9GD8hJ7S+g5pnxSs+Ij6zHzxjVzJ+hDEhSFaCYKpc0D?=
 =?us-ascii?Q?coZyYaArQBGFlsj3ufZp1/7H8UlCq6uEWOYEY8FiTjwrXCyA+PuybiEQD6VH?=
 =?us-ascii?Q?TN4gq2oWHaAoczEm48IT6jVnb88jvPcEAEzn5Udll/Je1IwzYTP8vZ5n36Dl?=
 =?us-ascii?Q?2cvvbsjeriMD1A99quf+pEkmO8/41z8YyG/2AYxHTTqqtpq48Q6utmwzzhiT?=
 =?us-ascii?Q?AD4PXyFZlTuFO8bYh7K0Dqg5FlwTgyxZBgm55jfqj9p/Q1YS7YSoG0bTowhT?=
 =?us-ascii?Q?Dr8CYD5VB9pyan+1h4sUuWm2Hg3Qjj5UhNHgaqW96qKuEZE77oJf+9RmcMVh?=
 =?us-ascii?Q?YPEAet6AoLXT8eUf45yvBdc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b0b4d4-e5b0-4bf7-879e-08daf980845c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 18:19:20.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GouSXtl7FskB19kRDggjl2CQeCrZHrygcIEwiIo6MpJdckuLVTwhFZogp01V1antHjc3+lw4jRzua2qyYHicdn6euMCS4drP3ICrh7znZWWNsBZWQ9JNkyZNSRKJTqcc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
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

On Wed, Jan 18, 2023 at 12:45:08PM +0000, Matthew Auld wrote:
>On 18/01/2023 07:16, Niranjana Vishwanathapura wrote:
>>Support dump capture of persistent mappings upon user request.
>>
>>Capture of a mapping is requested with the VM_BIND ioctl and
>>processed during the GPU error handling. They are synchronously
>>unbound during eviction so that no additional vma resource
>>reference taking is required in the submission path. Thus, a
>>list of persistent vmas requiring capture is maintained instead
>>of a list of vma resources.
>>
>>v2: enable with CONFIG_DRM_I915_CAPTURE_ERROR, remove gfp
>>     overwrite, add kernel-doc and expand commit message
>>v3: Ensure vma->resource is valid during capture
>>
>>Signed-off-by: Brian Welty <brian.welty@intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 13 +++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  5 ++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  7 +++
>>  drivers/gpu/drm/i915/i915_gem.c               | 14 ++++-
>>  drivers/gpu/drm/i915/i915_gpu_error.c         | 52 ++++++++++++++++++-
>>  drivers/gpu/drm/i915/i915_vma.c               |  4 ++
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  4 ++
>>  include/uapi/drm/i915_drm.h                   |  9 +++-
>>  8 files changed, 104 insertions(+), 4 deletions(-)
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
>>diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>>index 969581e7106f..d97822f203fc 100644
>>--- a/drivers/gpu/drm/i915/i915_gem.c
>>+++ b/drivers/gpu/drm/i915/i915_gem.c
>>@@ -143,6 +143,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
>>  	while (!ret && (vma = list_first_entry_or_null(&obj->vma.list,
>>  						       struct i915_vma,
>>  						       obj_link))) {
>>+		bool sync_unbind = true;
>>+
>>  		list_move_tail(&vma->obj_link, &still_in_list);
>>  		if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
>>  			continue;
>>@@ -171,8 +173,18 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
>>  		 * and destroy the vma from under us.
>>  		 */
>>+		/*
>>+		 * Synchronously unbind persistent mappings with capture
>>+		 * request so that vma->resource is valid in the error capture
>>+		 * path without needing extra reference taking in execbuf path.
>>+		 */
>>+		if (!mutex_lock_interruptible(&vma->vm->vm_capture_lock)) {
>>+			sync_unbind = !list_empty(&vma->vm_capture_link);
>>+			mutex_unlock(&vma->vm->vm_capture_lock);
>>+		}
>
>This stuff only exists on CONFIG_DRM_I915_CAPTURE_ERROR it seems?
>

Yah, will move it under CONFIG_DRM_I915_CAPTURE_ERROR.

>>+
>>  		ret = -EBUSY;
>>-		if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
>>+		if (!sync_unbind && (flags & I915_GEM_OBJECT_UNBIND_ASYNC)) {
>>  			assert_object_held(vma->obj);
>>  			ret = i915_vma_unbind_async(vma, vm_trylock);
>>  		}
>>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>index 9d5d5a397b64..5ccd1eaea2a5 100644
>>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>@@ -1460,6 +1460,49 @@ capture_vma(struct intel_engine_capture_vma *next,
>>  	return next;
>>  }
>>+static struct intel_engine_capture_vma *
>>+capture_user_vm(struct intel_engine_capture_vma *capture,
>>+		struct i915_address_space *vm, gfp_t gfp)
>>+{
>>+	struct list_head vm_capture_list;
>>+	struct i915_vma *vma, *vn;
>>+	int err;
>>+
>>+	INIT_LIST_HEAD(&vm_capture_list);
>>+
>>+	err = mutex_lock_interruptible(&vm->vm_capture_lock);
>>+	if (err)
>>+		return capture;
>
>Same here, and a few other places.
>

We don't need CONFIG_DRM_I915_CAPTURE_ERROR check here as
this whole file is only compiled if this config is set.

>>+
>>+	/* vma->resource should be checked with vm->mutex held */
>>+	err = mutex_lock_interruptible(&vm->mutex);
>>+	if (err)
>>+		goto skip_user_vm_capture;
>>+
>>+	list_for_each_entry_safe(vma, vn, &vm->vm_capture_list,
>>+				 vm_capture_link) {
>>+		if (drm_WARN_ONCE(&vm->i915->drm, !vma->resource,
>>+				  "vma->resource expected!\n"))
>>+			continue;
>>+
>>+		i915_vma_resource_get(vma->resource);
>>+		list_move_tail(&vma->vm_capture_link, &vm_capture_list);
>
>Now that stuff can be added to the capture_list outside of the exec, 
>can't someone do an exec, followed by a bunch of vm_binds requesting 
>capture for each one? With the idea of tricking the capture code into 
>dumping the pages of non-cleared memory? (The GPU clear job has been 
>created, but not actually completed yet).
>
>Say we have an IGT which creates a spinner or something on the vm, 
>then creates a bunch of vm_binds, each asking for capture. What 
>ensures that all the binds we are capturing here are valid when the 
>spinner or whatever triggers a GPU hang i.e everything in capture_list 
>has at least been cleared? With eb2 everything was tied to the rq, and 
>if the rq has been submitted then all required async clears/moves must 
>have already completed.

Ok, I think we can skip the capture here if i915_vma_verify_bind_complete()
returns false.

Thanks,
Niranjana

>
>>+	}
>>+	mutex_unlock(&vm->mutex);
>>+
>>+	list_for_each_entry(vma, &vm_capture_list, vm_capture_link) {
>>+		capture = capture_vma_snapshot(capture, vma->resource,
>>+					       gfp, "user");
>>+		i915_vma_resource_put(vma->resource);
>>+	}
>>+	list_splice_tail(&vm_capture_list, &vm->vm_capture_list);
>>+
>>+skip_user_vm_capture:
>>+	mutex_unlock(&vm->vm_capture_lock);
>>+
>>+	return capture;
>>+}
>>+
>>  static struct intel_engine_capture_vma *
>>  capture_user(struct intel_engine_capture_vma *capture,
>>  	     const struct i915_request *rq,
>>@@ -1467,6 +1510,8 @@ capture_user(struct intel_engine_capture_vma *capture,
>>  {
>>  	struct i915_capture_list *c;
>>+	capture = capture_user_vm(capture, rq->context->vm, gfp);
>>+
>>  	for (c = rq->capture_list; c; c = c->next)
>>  		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>  					       "user");
>>@@ -1548,8 +1593,13 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>  	 * as the simplest method to avoid being overwritten
>>  	 * by userspace.
>>  	 */
>>-	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>+
>>+	/*
>>+	 * Ensure capture_user_vm which takes vm->mutex gets called first
>>+	 * as snapshoting the first vma starts dma fence critical section.
>>+	 */
>>  	vma = capture_user(vma, rq, gfp);
>>+	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>  	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>>  	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 2f0994f0ed42..b47715fa773f 100644
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
