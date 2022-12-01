Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA463F7AE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 19:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17C10E61D;
	Thu,  1 Dec 2022 18:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2D10E12F;
 Thu,  1 Dec 2022 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669920211; x=1701456211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DqVSo8kyGrFCyEK9VKRm2PQzPyWC4aWGTYzOW2oLJZc=;
 b=hg/YCm4CBMfvpWMqYccg7SY1vTPqAICa58yceVKj25HK7hoReb35qNAx
 /56d5lVDQWfF6S2nqjtQUGuoq6I6iQL5SFPA8Q6dEZkgK0cC7JsTE4UNU
 LXAML+y7IzSuwX5B6ryDDZipT0vMRyNBxRoDKz8UtaJolO88026GVtdGn
 HN8zwk7E5P8Ynd+UTwpVNONZhA0ngDFFBxJSjQnUij5rY6jmZHegnIYtl
 yM2IufpQBhXJO/0b+IHSIAL0sqeomT/6OOmn/q8enrPirU68qUlwGWqRD
 gUbYvfS2H0Brhnqqr9o0cyR7CrlTyKAg5tdKPZ4M842VKWp0UVMTTZbQw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="303372639"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="303372639"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 10:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675546322"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="675546322"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2022 10:43:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 10:43:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 10:43:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 10:43:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 10:43:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKuGEpr1InUjYNfOisEPDwxHOymuCoNzgmYSf+Fk5UBBpHcwLYOJnyy0uApjQNPyvvFmeHG+cE7Ec0RnFH7b3rV00NC/pSDjQPS13uLMsiUhjlyymQhcf6tpMAnzS0mBCoRtQj7TnHWuhLZ+xKpTPCEhSdtlHRgWLmEiDQY2TqJb+7JWiYExFlvi9a2ncAy+pVuMgNsFf13ARqAPjfl5dfMLHSmltWvonYJbTiBh0GDwxvVtL2zo798teUDJCaByuLd+Y23AoAoX1oRfTA0s6JI0Krltv+GvqrgV9QkO8G04wCRZUZjtR+hp4xdgQegiSxgLTuZ/HZxBUay/Hsiwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bl0Il9S8z5XpefbV2mqj9QIASihhJya24pmtT5AekTM=;
 b=OQsTNF4dY5G4yjhgBnrWD88xpu6wlqVfMhRieXB2dgb03x2jNFPA8S6VCLY3YcehR/sdIN9nxkTfwPuiNXMfBGRdXUCRPKXG6oCGlXKBTXL413jmYiUGd6mXKRLp8whZbfHUd+HU5APSGA1O2jzOAFA9H7o+i2gQS0F/OEs8ZYojjHk2g89lPrK1xmdU5JrdVqTJPW0E80GrNPjzmN9NRXg1fydy0e7ZHBpehjIvR9Ey+GRZZGCQtOJjO0H26+A+4pS/0GocozteXlC7oFdQ/xTgZ1jT8XBt/3Ii17lY2VH1ei7l1XjuvsTgwZya1X3y+nXINrJIm96MZohklGLpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5464.namprd11.prod.outlook.com (2603:10b6:208:319::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 18:43:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 18:43:23 +0000
Date: Thu, 1 Dec 2022 10:43:15 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 22/22] drm/i915/vm_bind: Support capture
 of persistent mappings
Message-ID: <Y4j1w8KoN9ASjJxu@nvishwa1-DESK>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-23-niranjana.vishwanathapura@intel.com>
 <dbbd19e4-4354-bd11-a68d-435f59150fc8@intel.com>
 <Y4jH4297KUGrYTr6@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y4jH4297KUGrYTr6@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: 15504a6f-1b05-4231-9076-08dad3cbecc0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Se0OkRvkhNZA/HNm1SIRQ0sdPr1raDrDL2RoJh+Y/0f4SWvlig1t42TM5J58fKjJSQBvFda00vJs3QOU9B1sAK3AHc1PNupezsnGcy7fHEP/e4GM+YUi+LYn9Fq3aEm3mmBUgXuoy4T4R5ayjWHjL9Z6rZTYcDqjBjIt2QnwDlzlpOLoioyK7nHi4lkANK49udC9OaMABZV2mvXC0gLDPus5WbjEpxPVjSiKer1sMcFLlM2G6X/p3jG4R0ojpux8ryCns8f2irGltFB6DvJ4jdjap2B9Awxe4vSLUuzaa+GBbCKsDAh3cpYR6ZCubmHJ+afx/w807hqVkM7tZXA92exuwN3LKxAqND4rqUvbD9NqAl+B5KSjCgyJ4yLVmn8OeN1zPrDQWzM50xzYWr/OlKxsR6GT8tkf/VaCLG3sikJfgVTS0NanqP8KqJID1MT5o9bRfYRqJHYH2nlY+9WIMvPDTr3ECEkCYKFD+Wtj3o2K+jXTMwO/sirVRUsYH1hU/+234RD2WVBlFH+t11R7i6ncm8qtzC7+QmeXhlEJv5GzTFxiIUB1/EODrf2lAR/Q9tupIwrZTQ4j02Z5XklOOklfwbYU2GR0Xb8K/C781uw3lW2ODHQ9spc2ju+ePzoxpl4z7xQMcM7RHV2fDQycNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(86362001)(41300700001)(186003)(66946007)(66556008)(66476007)(4326008)(8676002)(44832011)(6862004)(8936002)(5660300002)(6666004)(6506007)(6486002)(478600001)(316002)(6636002)(9686003)(26005)(6512007)(82960400001)(38100700002)(33716001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?deP3m67JeWdKicodkbn69yq1YNbGhg/XxBtT0Z0ndcFyE5QPIviPoZScg7jT?=
 =?us-ascii?Q?N6HaZ1NkTcc2eVZJDt1xBStf3rE7Mb04fsuT4A3Z6vY2wc1JhObhLbuUQ9DA?=
 =?us-ascii?Q?8daB3dFhd0wVTm7JJxeOW8IwE0PjrXRZb7CsMYHLyxLucirlWnKmuZX/CQcM?=
 =?us-ascii?Q?WBKo8j/nWAqQsdKO1pLBAIN3+8pqVFnhBPa1H0VXQaLA/ghcWgyLtdkQNW99?=
 =?us-ascii?Q?8oSlx59PQd2+o9lLE3qsPx3i2FKlejqYtBn53WIG+gT8KyFKkM0vbr4I3/4X?=
 =?us-ascii?Q?CgDEtQzeW+LWnHtcoW1ZbbJyy6rOP07l+w40f8gvpvpJEo2N1kR+sUPYxm7U?=
 =?us-ascii?Q?HFU07hSgoshHBme7Rv+FfpJ0tFEnbnMztEnCY4mru8Psrka/YYctmbbTWawp?=
 =?us-ascii?Q?0Z8qU08itIfUA/haUFfF/a05QhmxpDflWiCmN0y0Hpalx0bdQ29umni2MRNe?=
 =?us-ascii?Q?E7GSA8cMg1pbWMxuvNTUmvsUsywzZO0ISLCVjG2XbUc3pxoJl/oNY1YcR/eM?=
 =?us-ascii?Q?hhvh9mRXUMQkcoJFKKmggMNNuStZ6G/HBI8lDuSzZv6SSVL4bNhS/RKpPYVW?=
 =?us-ascii?Q?oR1uKyjUeqyVfExvzty1g2eX2gPNJF3o7UTHOy8yaJqbAfmCQvhy1WaTnRlG?=
 =?us-ascii?Q?D9EiOOlLToIHz17xvc+7TIYqOKNRhssOyh4q52XblR507O2E+I4qzq2WCVgT?=
 =?us-ascii?Q?0dVvqERtxRdv7Gwww8bvBvM96wq39VMcRHauH0ystasmw63+iz9pHllOduF8?=
 =?us-ascii?Q?QOmJwSxYIeG/J6StHrdyu+BESMGPLrX4aOxSGQxjQ7NbL8t/xIa7llQtrbCs?=
 =?us-ascii?Q?J1phnh3QAAD+H/cLmju40EnKcYZr6gYreB7ge9RBEN0UJfiD+ihK1Zl5jsl3?=
 =?us-ascii?Q?TOJXHG2YjvJxpirhcfdTEE3FcyRRmL3cbZrIndX08w1QU82TEE7n7V8o83B0?=
 =?us-ascii?Q?+3eIZm8WdxqnZtdz30ZNfr5E4iOi1PiYZaqJoaZVKgAoVJrxf0jFU97G0YvN?=
 =?us-ascii?Q?CxxPcLu07xudf6TdBiSlJDBvQS7bLk3FYlXtjguZYByYM+OKTOKV9wwhgXgK?=
 =?us-ascii?Q?wSt7AL7DXgZmGdxQP8Kwd1MNfs75sXnQuGT5JVGS4TJbmsM7+E7Cz1SxOXyJ?=
 =?us-ascii?Q?xConvLEslrloTIIe7h5aOgQ1aIW8VXhrucaDYTUnUgBXl+b6XhCZBqJEuZUJ?=
 =?us-ascii?Q?FcsFSm4y4PmJZghIkIDpG34uJgqZR1lEItrZYHl9jTwTzlmcD61J08miz0Er?=
 =?us-ascii?Q?9PSlv/B1U2d++zci0nh1p7983yBZcIb+wkklQRhYdbNBh2qWB9HoNYU6sWbL?=
 =?us-ascii?Q?PiH7C1Fic3pGmuGpplA7LM5UjdxjSp3Slue05xXBK7sE3MLBtTdRwj+kxWAE?=
 =?us-ascii?Q?tVX56w5IevbOc6Q01KLBPWGN0e0VWLC9DxswTavpN7k0B5lXNmV2egYTIH42?=
 =?us-ascii?Q?VHT//NHePQwWIXKiBM8hhYRTcafmx3M/FF2HmyAyGeLgzWN3a1JHFmKSoCGw?=
 =?us-ascii?Q?eBvd0NsL7OVgpEGvPhQgtr6F65wvZzDZKw4Guvj1hCbQFkL2YVZMlsvuXHV5?=
 =?us-ascii?Q?jpv1RqvYu4+nzKxic4IzN4K9snYh1rTNGvzFHFwS2j4BKb8Zv+vdKtgY/UNS?=
 =?us-ascii?Q?Nbdq2j8uItHP1eONIDaUKg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15504a6f-1b05-4231-9076-08dad3cbecc0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 18:43:23.1616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EzBGbJw27PXiORn0JwO2lP084mPJQ508nCql8xu+DIord2cAsGxQf2+w4Nzmo8olYRfUOjG+H/oZnqPMbzS0sLmaDIoiR5bOmb01qECCCG/FZpk2Oyem1jFPH8YFvaI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5464
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 07:27:31AM -0800, Niranjana Vishwanathapura wrote:
>On Thu, Dec 01, 2022 at 10:49:15AM +0000, Matthew Auld wrote:
>>On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
>>>Support dump capture of persistent mappings upon user request.
>>>
>>>Signed-off-by: Brian Welty <brian.welty@intel.com>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>---
>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 11 +++++++++++
>>> drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 +++
>>> drivers/gpu/drm/i915/gt/intel_gtt.h           |  5 +++++
>>> drivers/gpu/drm/i915/i915_gpu_error.c         | 19 +++++++++++++++++++
>>> drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>> drivers/gpu/drm/i915/i915_vma_types.h         |  2 ++
>>> include/uapi/drm/i915_drm.h                   |  3 ++-
>>> 7 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>index 78e7c0642c5f..50969613daf6 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>@@ -88,6 +88,11 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>> {
>>> 	lockdep_assert_held(&vma->vm->vm_bind_lock);
>>>+	spin_lock(&vma->vm->vm_capture_lock);
>>>+	if (!list_empty(&vma->vm_capture_link))
>>>+		list_del_init(&vma->vm_capture_link);
>>>+	spin_unlock(&vma->vm->vm_capture_lock);
>>>+
>>> 	spin_lock(&vma->vm->vm_rebind_lock);
>>> 	if (!list_empty(&vma->vm_rebind_link))
>>> 		list_del_init(&vma->vm_rebind_link);
>>>@@ -357,6 +362,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>> 				continue;
>>> 		}
>>>+		if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
>>>+			spin_lock(&vm->vm_capture_lock);
>>>+			list_add_tail(&vma->vm_capture_link, &vm->vm_capture_list);
>>>+			spin_unlock(&vm->vm_capture_lock);
>>>+		}
>>>+
>>> 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>> 		i915_vm_bind_it_insert(vma, &vm->va);
>>> 		if (!obj->priv_root)
>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>index ebf6830574a0..bdabe13fc30e 100644
>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>@@ -297,6 +297,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>> 	spin_lock_init(&vm->vm_rebind_lock);
>>> 	spin_lock_init(&vm->userptr_invalidated_lock);
>>> 	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>>+
>>>+	INIT_LIST_HEAD(&vm->vm_capture_list);
>>>+	spin_lock_init(&vm->vm_capture_lock);
>>> }
>>> void *__px_vaddr(struct drm_i915_gem_object *p)
>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>index 87e5b6568a00..8e4ddd073348 100644
>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>@@ -281,6 +281,11 @@ struct i915_address_space {
>>> 	/** @root_obj: root object for dma-resv sharing by private objects */
>>> 	struct drm_i915_gem_object *root_obj;
>>>+	/* @vm_capture_list: list of vm captures */
>>>+	struct list_head vm_capture_list;
>>>+	/* @vm_capture_lock: protects vm_capture_list */
>>>+	spinlock_t vm_capture_lock;
>>>+
>>> 	/* Global GTT */
>>> 	bool is_ggtt:1;
>>>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>index 9d5d5a397b64..3b2b12a739f7 100644
>>>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>@@ -1460,6 +1460,22 @@ capture_vma(struct intel_engine_capture_vma *next,
>>> 	return next;
>>> }
>>>+static struct intel_engine_capture_vma *
>>>+capture_user_vm(struct intel_engine_capture_vma *capture,
>>>+		struct i915_address_space *vm, gfp_t gfp)
>>>+{
>>>+	struct i915_vma *vma;
>>>+
>>>+	spin_lock(&vm->vm_capture_lock);
>>
>>Does it make sense to move this into the eb3 submission stage, like 
>>we do for eb2? IIRC the gfp flags here are quite limiting due to 
>>potentially being in a fence critical section. If we can use 
>>rq->capture_list for eb3, we shouldn't need to change much here?
>>
>
>But that will add latency on submission path as we will have to iterate
>over capture_list in each submission. Besides, unlike eb2 case, we can't
>just transfer the list to rq->capture_list as we will have to do this
>for each submission. It was discussed long time back and decided not to
>bother the fast path (submision) scenario with this error capture which
>is only required upon gpu hang (slow path).
>
>>Also there is the existing CONFIG_DRM_I915_CAPTURE_ERROR. Should we 
>>take that into account?
>>
>
>Ok, will fix.
>
>>>+	/* vma->resource must be valid here as persistent vmas are bound */
>>>+	list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
>>>+		capture = capture_vma_snapshot(capture, vma->resource,
>>>+					       gfp, "user");
>>>+	spin_unlock(&vm->vm_capture_lock);
>>>+
>>>+	return capture;
>>>+}
>>>+
>>> static struct intel_engine_capture_vma *
>>> capture_user(struct intel_engine_capture_vma *capture,
>>> 	     const struct i915_request *rq,
>>>@@ -1471,6 +1487,9 @@ capture_user(struct intel_engine_capture_vma *capture,
>>> 		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>> 					       "user");
>>>+	capture = capture_user_vm(capture, rq->context->vm,
>>>+				  GFP_NOWAIT | __GFP_NOWARN);
>>
>>And this should maybe use the passed in gfp?
>>
>
>Ok, will fix
>

Acutally in one path (capture_engine), it is called with non-blocking gfp,
in other path (execlists_capture_work), it is called with blocking gfp.
I chose to override it here as we use spinlock (vm_capture_lock) and we
are using MAYFAIL version in somepaths anyhow.I can add documentation
for this override here. We can switch to a mutex here (instead of spinlock)
for vm_capture_lock, but not sure it is worth it or if in anyway we endup
here with atomic context. What do you think?

Thanks,
Niranjana

>>>+
>>> 	return capture;
>>> }
>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>index 68a9ac77b4f2..0244864e94f7 100644
>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>@@ -248,6 +248,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>> 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>> 	INIT_LIST_HEAD(&vma->vm_rebind_link);
>>> 	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
>>>+	INIT_LIST_HEAD(&vma->vm_capture_link);
>>> 	return vma;
>>> err_unlock:
>>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>>index 90471dc0b235..10ae9f739d57 100644
>>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>>@@ -309,6 +309,8 @@ struct i915_vma {
>>> 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>> 	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>>> 	struct list_head userptr_invalidated_link;
>>>+	/* @vm_capture_link: link to the captureable VMA list */
>>>+	struct list_head vm_capture_link;
>>> 	/** Timeline fence for vm_bind completion notification */
>>> 	struct {
>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>index b9167f950327..0744651ad5b0 100644
>>>--- a/include/uapi/drm/i915_drm.h
>>>+++ b/include/uapi/drm/i915_drm.h
>>>@@ -3930,7 +3930,8 @@ struct drm_i915_gem_vm_bind {
>>> 	 * Note that @fence carries its own flags.
>>> 	 */
>>> 	__u64 flags;
>>>-#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>>+#define I915_GEM_VM_BIND_CAPTURE           (1 << 0)
>>
>>1ull << 0
>>
>>Worried about what the value of UNKNOWN_FLAGS might be otherwise? 
>>Also needs some kernel-doc.
>>
>
>Ok, will fix and add kernel-doc.
>
>Thanks,
>Niranjana
>
>>>+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   (-(I915_GEM_VM_BIND_CAPTURE << 1))
>>> 	/** @rsvd: Reserved, MBZ */
>>> 	__u64 rsvd[2];
