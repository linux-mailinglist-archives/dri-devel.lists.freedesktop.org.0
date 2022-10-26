Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0460E7DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 21:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4143010E72E;
	Wed, 26 Oct 2022 19:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F7310E5E2;
 Wed, 26 Oct 2022 19:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666810803; x=1698346803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2tBfm0OFKmZjlqkcGeRJ3O+1eBRXjcG8qnkDtOwDZ5A=;
 b=HKS/A0JzfAbYPPjmYENDQmcvjFV0+7LLpdiVFJq+dlLGNMYjhLqFzZhs
 GRNP8TqFavPepx+CkZKEiiOJICBe7yDhSKG77pKeZ9jlClfcEB9yB8tub
 kYURgie2B+pW6uDyN1og9dXQRspu47n5WdTNjUYQeq2v7/Mwbj+oHD9XT
 poZLpWkwp4BZo7wK9nRO/p//N/H85GzIjqqmqP1sdwooSOGxL0ER/dWgO
 ERgFsYTyLeqHqmGFlrWsSfEv4GznsLvRsUCbawa6bqg5o17H59M8OZO32
 9BgP6GUgMpZdMBba6Wdsmt4aaMJWANdDyFKycuF5EIrxp/njB1Xl3iq5I A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309127348"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="309127348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 12:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="737364377"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="737364377"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2022 12:00:02 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 26 Oct 2022 12:00:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 26 Oct 2022 12:00:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 26 Oct 2022 12:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ska6nYSFnK+C9dEsWqBYOp1OSDsUknRPfHQbqBrHj2Rw6s2p5CKKhSYd8vY3SiybZQRfXsxck6kqyRCbUZV+c02Dx1v8N2namTCdZDlHRVld5R7GSDlx6wDLlC4vKTMK+YiDE25nJjjtXTxkjv8bFwhsWgaHdr/3bEXeSff93tduPQU4xoUs1TkCWNaz+ICaAyWh8jQMh/Xix/HTpf3OO1bxS6HSaTpuoiPlen2fTCbTBYw0FfNBdYXVur0YlX4JCRtH1SHgOgr8Br5J7qsszrEsk01JaJn/hDT5cze73n3e9iQsnTa0xXuIJWdX1vnE91Li27n5U/mpQDLdM9csKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcmTFFyRhf13CsCeCNWLdpnWte9Xgqt+wwXhLi0SyPA=;
 b=AtrASOQ8/vfMZboD5Tjc9/8QNXDj3Y6GDYRovZqzwiGojnjWib+lvm5LZ8Pran4Fk2Atwu1pF3qJbmfa2N562uhGxJ/vC3Y2EhgYf5iDhP2Ka4By7US2NT4pGwIN/8dRIhJtOlFSYgBgO03Gi9SJxn75NbepqVQsfIqgIpQRHzGBvhDYhEqCMkYCPDyl36wZ9Ioo5p+zjiZnC++m1gEcphT/ZVYEPjEVDanaQtnPQNaIJia5ytEcPlcIdMEN/Ea364JWqYriwKsZosA6bx++bQY3Ru3Vyqv1SFVvnCg41qmCAQQVNCnxc9fq04+gXLPmk9JeJ66fkMry+m+tbc9peA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 18:59:58 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e083:2e6b:a798:f842]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e083:2e6b:a798:f842%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 18:59:58 +0000
Date: Wed, 26 Oct 2022 11:59:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 09/19] drm/i915/vm_bind: Add out fence support
Message-ID: <Y1mDpaWLTEOPxow2@nvishwa1-DESK>
References: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
 <20221025065905.13325-10-niranjana.vishwanathapura@intel.com>
 <fa3dfb7a-e69e-6f8d-bcf8-bb5471321f00@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <fa3dfb7a-e69e-6f8d-bcf8-bb5471321f00@intel.com>
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fb15d8-0156-4440-1727-08dab7844760
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHS+CNiV4iLjjMN+XZPfc+Prgfh2XXE6qMyHEJsUvt6GeDop3fPcaPl6x2SRmXoVDqWhY60XOik0yYsWJKQOdjfbndD56d64JIUUNVeO+WaTVzPPNgTa+zOF6V+HW0Za3ilU6dsarKcwnx3vHRyiWRs3gU++qAZczjynolDw8Oj19vlfDnAFK45JEieLVrsZLOo/aKjrHo39O4vBfnigF8MTkft3yISRqDK8g7aSSpqK9Cys7DzFh+m/eiQ/nONItWH+IL90ssWsTtyTzwe8MBUCnKGc2OjNKo3jrGNpeYsBUqA82LpnNfkqoPY6YjsmvGZI3ek21T/M7v7KFH2Ff0LG1qRZ0fe2MtCrVqDJQRd9WsO+SlmzlZFpvY6iNVzgL0FyScxse60tlGPFapB9jtHdeDJ0JeoOBRspiZ6LnVJD9YKeK6Xumvj1LxD9RSzOt2pGs1u0goY/CWyGsUtJPUI3kH61wmLUmkIeqfTlxwiWOv86hHV1wzTzojLbjOK1Jo4BzWBsvl/7phNF0tvQKnMW4Uvoy7oSfq5Uc03kkRiQaQPv/+VFoLsqdGuKERZf3gZPMVy3aM7AHc5wUYKbFLog2Mo7mjAFw0akYJSzaTO9baHZdT7OFI+ZEbFecKlyUBsZ6Dkq201i1/HsvJm07c2WZmb98Tya4xfjyLDuyD7flKez/yMLyYH40ebduRjFfYZSJ93lRt9AU0GmNaduFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(82960400001)(44832011)(86362001)(4326008)(5660300002)(6486002)(8676002)(6512007)(186003)(9686003)(83380400001)(26005)(478600001)(38100700002)(41300700001)(6636002)(2906002)(8936002)(316002)(66476007)(6666004)(33716001)(6506007)(6862004)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oCfvFrxh+cqBYY1XKC6rlTtZXQ49te4JwGhgKxtzSt/eiXI83iK3mhMp89mk?=
 =?us-ascii?Q?5zuB8F4Y8Ci+5Rm6aCdseY6+wLDDTo0TpsK3S9r0vwr8DAYmQ+jk2t8jS/sS?=
 =?us-ascii?Q?gGGL3lH0UigOpJNHBTb5P7iKDRPhXXOdBMTqblLbpNXycaK/nYOjJn+Twk5A?=
 =?us-ascii?Q?Lu5kP83kQA0zzjjuEo3z2NQW51GIC6YO7bU4g4leQRq0PamSIHL6YBk5BRd1?=
 =?us-ascii?Q?ZM9svePBdmBFfOCdI2ClLM9ovuXQyiVeLGaUIOSfgJaOKpu05tzxPpxmn2ad?=
 =?us-ascii?Q?UkYeh4TA0K3rxK969fuO891nsv2ZsCO3T08e7toI91juhLeNmm8CGxbQtOBc?=
 =?us-ascii?Q?jDLY6/gDYBMLXq/iseZMCIe/1sVE+6e6IcOwWeZZZ/WB/e+qc5+Pd26Q0963?=
 =?us-ascii?Q?pG+KQZqtHi5ay9h/1/M5f0p3Rwag+lBFlrKHrDH481hc7qeGjwn2cRYnXp8d?=
 =?us-ascii?Q?RTTJypMw+yQYVPT1PzPJExTiSobPYgw06xBNUpRs12/B6/71pqEWcNd8V8yz?=
 =?us-ascii?Q?HiszaD9LdhyDJU3tGjjeZygnuhAe9QnTVSwpqpFc7gGTWVYKUVUQ+UF9ewwM?=
 =?us-ascii?Q?+l93jhTaBrn+hbYRwIft9XEDDLzTsC1xGZ1HiWhmAnUs8zKhEHnbGoNPX7Th?=
 =?us-ascii?Q?u5xraTheZsrfjPV8IK3DpDGv6E/+OnpYTzkPhG9leTWKtW37U1VOIuj0XYyK?=
 =?us-ascii?Q?9xvDaG0vBdkjf8AjxmkUBRVovqjDF458p0n9evUKcYrA/+Z7zhsqZ595n1qn?=
 =?us-ascii?Q?QriU1Aw6oFtTNbbIJIwAbosBkTDgsm/60JxiowHaAoVECN3HhEGwWZYttHYI?=
 =?us-ascii?Q?F4UZ6NTDD/3UPNJtncI2aKI+3i7b/Zeg8CeOJgDy6zOEQGqei/kD1sSkyqHK?=
 =?us-ascii?Q?Dug8PhYjwjBfag+MJdDoGGpG5PNi1tm1UUR8ivayba+M/6zjleZPDVWuYsos?=
 =?us-ascii?Q?w6obYwMZmdkC+E2U+JrZjBA6jdPRQNhIkXx44Gf7pGBApT6o7pCNf+8NkSep?=
 =?us-ascii?Q?+Jp/Wqc5+VHvPo0QxSbe/U48YepnsHoHZWExzZ4S/Cw9EIt+P3IhasVtFumf?=
 =?us-ascii?Q?mLrRWMu9qSmo2ZG9Sx8fLRy03Q9qcWssWIp0EkqyKppna60fAXUkayuZbXbV?=
 =?us-ascii?Q?HM7LTDiSsh4tVFD6Oal5hy8m6+1fH0GlrE9MJdOvA4Tx7MSph+khJF/co0uS?=
 =?us-ascii?Q?hI5Zhfcgyc3ZMTHu4eDU/Ht5Upo0ePEeOtq9MW9XqaPVHddhCmJ0er9R9OIO?=
 =?us-ascii?Q?3qBu8J93/4HeuXoXAk+SNdCKJa+BAWBWe6Q32/TrS5RIypQloYH9WZ16rYhw?=
 =?us-ascii?Q?gzn1Fy8QPCYGD8bYM5Ci3M5d9YWMdBYlSSx1cnVyhXoe6E8jg7cygk2xbS7k?=
 =?us-ascii?Q?2GiDvkZdArgzxyG6298mr8rgOCCJt34qegusTFOipdosAPH+PhMJ94THIafy?=
 =?us-ascii?Q?qjuFigwL3/Mt6laM8xEs2Y1NLq9jq9e7Mu6tqVono9MyBdzDEflV9sVKOXFC?=
 =?us-ascii?Q?Rqj7vthFKXEU/Uf9DS+KBFldsA5CU0psAgwi+Q1aSO2vfNVIB2QPI/k4WckN?=
 =?us-ascii?Q?sqPC5vKEsjgG/Ze6amzoMLS4+AB2VFEqiGYQYG+RnG4OFL0zU/9DJSFMULrO?=
 =?us-ascii?Q?d7cIB7NCSJQ0s0jvKpO4VLQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fb15d8-0156-4440-1727-08dab7844760
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 18:59:58.8329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWP2E7XCT7AIG7yfH36FsU5jBC7PrVKLiOu1rmn+hD7qJGUlclizGf/KDq2KXYQNG5rxqjAPLXJrPkte8YoFpyfadI/24toTkOvXVcfahrWthzbUp/gDyO3VnGCr8NMq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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

On Wed, Oct 26, 2022 at 06:15:09PM +0100, Matthew Auld wrote:
>On 25/10/2022 07:58, Niranjana Vishwanathapura wrote:
>>Add support for handling out fence for vm_bind call.
>>
>>v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
>>     of vm_bind call.
>>v3: Remove vm_unbind out fence uapi which is not supported yet.
>>v4: Return error if I915_TIMELINE_FENCE_WAIT fence flag is set.
>>     Wait for bind to complete iff I915_TIMELINE_FENCE_SIGNAL is
>>     not specified.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 93 +++++++++++++++++++
>>  drivers/gpu/drm/i915/i915_vma.c               |  7 +-
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
>>  include/uapi/drm/i915_drm.h                   | 49 +++++++++-
>>  5 files changed, 157 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>index 36262a6357b5..b70e900e35ab 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>@@ -8,6 +8,7 @@
>>  #include <linux/types.h>
>>+struct dma_fence;
>>  struct drm_device;
>>  struct drm_file;
>>  struct i915_address_space;
>>@@ -23,4 +24,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>  void i915_gem_vm_unbind_all(struct i915_address_space *vm);
>>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>>+			       struct dma_fence * const fence);
>>+
>>  #endif /* __I915_GEM_VM_BIND_H */
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>index 863bd17c9253..fca6d6eb9ef8 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -7,6 +7,8 @@
>>  #include <linux/interval_tree_generic.h>
>>+#include <drm/drm_syncobj.h>
>>+
>>  #include "gem/i915_gem_context.h"
>>  #include "gem/i915_gem_vm_bind.h"
>>@@ -100,6 +102,76 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>  		i915_gem_object_put(vma->obj);
>>  }
>>+static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
>>+				  u32 handle, u64 point)
>>+{
>>+	struct drm_syncobj *syncobj;
>>+
>>+	syncobj = drm_syncobj_find(file, handle);
>>+	if (!syncobj) {
>>+		DRM_DEBUG("Invalid syncobj handle provided\n");
>
>AFAIK drm_dbg() is preferred, if possible.

ok, will fix.

>
>>+		return -ENOENT;
>>+	}
>>+
>>+	/*
>>+	 * For timeline syncobjs we need to preallocate chains for
>>+	 * later signaling.
>>+	 */
>>+	if (point) {
>>+		vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
>>+		if (!vma->vm_bind_fence.chain_fence) {
>>+			drm_syncobj_put(syncobj);
>>+			return -ENOMEM;
>>+		}
>>+	} else {
>>+		vma->vm_bind_fence.chain_fence = NULL;
>>+	}
>>+	vma->vm_bind_fence.syncobj = syncobj;
>>+	vma->vm_bind_fence.value = point;
>>+
>>+	return 0;
>>+}
>>+
>>+static void i915_vm_bind_put_fence(struct i915_vma *vma)
>>+{
>>+	if (!vma->vm_bind_fence.syncobj)
>>+		return;
>>+
>>+	drm_syncobj_put(vma->vm_bind_fence.syncobj);
>>+	dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
>>+	vma->vm_bind_fence.syncobj = NULL;
>>+}
>>+
>>+/**
>>+ * i915_vm_bind_signal_fence() - Add fence to vm_bind syncobj
>>+ * @vma: vma mapping requiring signaling
>>+ * @fence: fence to be added
>>+ *
>>+ * Associate specified @fence with the @vma's syncobj to be
>>+ * signaled after the @fence work completes.
>>+ */
>>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>>+			       struct dma_fence * const fence)
>>+{
>>+	struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
>>+
>>+	if (!syncobj)
>>+		return;
>>+
>>+	if (vma->vm_bind_fence.chain_fence) {
>>+		drm_syncobj_add_point(syncobj,
>>+				      vma->vm_bind_fence.chain_fence,
>>+				      fence, vma->vm_bind_fence.value);
>>+		/*
>>+		 * The chain's ownership is transferred to the
>>+		 * timeline.
>>+		 */
>>+		vma->vm_bind_fence.chain_fence = NULL;
>>+	} else {
>>+		drm_syncobj_replace_fence(syncobj, fence);
>>+	}
>>+}
>>+
>>  static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>  				  struct drm_i915_gem_vm_unbind *va)
>>  {
>>@@ -205,6 +277,10 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  	if (!va->length || !IS_ALIGNED(va->start, I915_GTT_PAGE_SIZE))
>>  		ret = -EINVAL;
>>+	/* In fences are not supported */
>>+	if (va->fence.flags & I915_TIMELINE_FENCE_WAIT)
>>+		ret = -EINVAL;
>
>I guess also:
>
>if (flags & __I915_TIMELINE_FENCE_UNKNOWN_FLAGS)
>

ok, will add

>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks,
Niranjana

>>+
>>  	obj = i915_gem_object_lookup(file, va->handle);
>>  	if (!obj)
>>  		return -ENOENT;
>>@@ -237,6 +313,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		goto unlock_vm;
>>  	}
>>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>>+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>>+					     va->fence.value);
>>+		if (ret)
>>+			goto put_vma;
>>+	}
>>+
>>  	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER |
>>  		    PIN_VALIDATE | PIN_NOEVICT;
>>@@ -249,6 +332,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		if (ret)
>>  			continue;
>>+		/* If out fence is not requested, wait for bind to complete */
>>+		if (!(va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
>>+			ret = i915_vma_wait_for_bind(vma);
>>+			if (ret)
>>+				continue;
>>+		}
>>+
>>  		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>  		i915_vm_bind_it_insert(vma, &vm->va);
>>  		if (!obj->priv_root)
>>@@ -259,6 +349,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		i915_gem_object_get(vma->obj);
>>  	}
>>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
>>+		i915_vm_bind_put_fence(vma);
>>+put_vma:
>>  	if (ret)
>>  		i915_vma_destroy(vma);
>>  unlock_vm:
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 04abdb92c2b2..eaa13e9ba966 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -29,6 +29,7 @@
>>  #include "display/intel_frontbuffer.h"
>>  #include "gem/i915_gem_lmem.h"
>>  #include "gem/i915_gem_tiling.h"
>>+#include "gem/i915_gem_vm_bind.h"
>>  #include "gt/intel_engine.h"
>>  #include "gt/intel_engine_heartbeat.h"
>>  #include "gt/intel_gt.h"
>>@@ -1567,8 +1568,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  err_vma_res:
>>  	i915_vma_resource_free(vma_res);
>>  err_fence:
>>-	if (work)
>>+	if (work) {
>>+		if (i915_vma_is_persistent(vma))
>>+			i915_vm_bind_signal_fence(vma, &work->base.dma);
>>+
>>  		dma_fence_work_commit_imm(&work->base);
>>+	}
>>  err_rpm:
>>  	if (wakeref)
>>  		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>index 61d0ec1a4e18..7c8c293ddfcb 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -308,6 +308,13 @@ struct i915_vma {
>>  	/** @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>+	/** Timeline fence for vm_bind completion notification */
>>+	struct {
>>+		struct dma_fence_chain *chain_fence;
>>+		struct drm_syncobj *syncobj;
>>+		u64 value;
>>+	} vm_bind_fence;
>>+
>>  	/** Interval tree structures for persistent vma */
>>  	/** @rb: node for the interval tree of vm for persistent vmas */
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index 4383ed85f10a..87f5c2a470f5 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -1527,6 +1527,41 @@ struct drm_i915_gem_execbuffer2 {
>>  #define i915_execbuffer2_get_context_id(eb2) \
>>  	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>>+/**
>>+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
>>+ *
>>+ * The operation will wait for input fence to signal.
>>+ *
>>+ * The returned output fence will be signaled after the completion of the
>>+ * operation.
>>+ */
>>+struct drm_i915_gem_timeline_fence {
>>+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>>+	__u32 handle;
>>+
>>+	/**
>>+	 * @flags: Supported flags are:
>>+	 *
>>+	 * I915_TIMELINE_FENCE_WAIT:
>>+	 * Wait for the input fence before the operation.
>>+	 *
>>+	 * I915_TIMELINE_FENCE_SIGNAL:
>>+	 * Return operation completion fence as output.
>>+	 */
>>+	__u32 flags;
>>+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>>+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>>+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>>+
>>+	/**
>>+	 * @value: A point in the timeline.
>>+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>>+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>>+	 * binary one.
>>+	 */
>>+	__u64 value;
>>+};
>>+
>>  struct drm_i915_gem_pin {
>>  	/** Handle of the buffer to be pinned. */
>>  	__u32 handle;
>>@@ -3826,8 +3861,18 @@ struct drm_i915_gem_vm_bind {
>>  	 */
>>  	__u64 flags;
>>-	/** @rsvd: Reserved, MBZ */
>>-	__u64 rsvd[2];
>>+	/**
>>+	 * @fence: Timeline fence for bind completion signaling.
>>+	 *
>>+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>>+	 *
>>+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>>+	 * is invalid, and an error will be returned.
>>+	 *
>>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>>+	 * is not requested and binding is completed synchronously.
>>+	 */
>>+	struct drm_i915_gem_timeline_fence fence;
>>  	/**
>>  	 * @extensions: Zero-terminated chain of extensions.
