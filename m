Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E95FE913
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 08:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB23410EA8D;
	Fri, 14 Oct 2022 06:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483BD10E395;
 Fri, 14 Oct 2022 06:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665730124; x=1697266124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nuWm2rEXWW2Tmw8Cqv4X3CYbdwLSE5ttIk0BAE2BLY4=;
 b=DV2uj0tGymAQjm1LlWbCcnWCumKNqhGDPKSR0p1jz9v8gCfN1hISkMr6
 niITaIKw8vTOb+4bvZwA1KBzdeNYRXLh2tm2wAeqFNbqo8XFLF/N34y+4
 +P6Xm6C/y/BofglTnH+zsKldJmGquoi2nAMCoQohVb3oKKYctdFihc7oJ
 rxmg8ds4Mbtjp4v/pAmNMqGKaYvk8W2G42s3aDqFyYWUZ9hjZ2N6tLN2Q
 yQ6Cr6OO/O6rXPBrvz+SJ0BLdxzIVAD6xzuROD4kiBFavlrWfxiox3XZP
 vUPcT8L654RqK/PWXLsIvJvcpnAmsuTXwo5lzSolwosxZ10nFUnOIuYSv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="292655372"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="292655372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 23:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="658482282"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="658482282"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 13 Oct 2022 23:48:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 23:48:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 23:48:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 23:48:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 23:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGYIXPMI0gYzXilpNolcWywS0wmqdoURrlmbXM4pDRdoKFF4vmCDPVWPH3EgNJiB9crTmbgcztIAA9++4urQzDBNwd85vtRRpaCRcnCjLXTQzO3p38QHMJpbLNCIFoczzh+UdVjUvTs2PXi+YO7HtbWqoCOlEjDtl0qwkUYmdpqb8ODWS1oHGKvH3LdHX0MBlK32lPYRD2lF2gg8p+h2DXhHcrl6dirKrGoHO5Q29NyV22/3biveZ+6b72rjZjzts1V4IaTBamVQkiov01tuLCu/8kktSmiQGs6jRYRTjM+BP0F41q2jR5od3ymCKstpuZQ06CqeUx26Pw7dr5VMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUZ8FIBvYWBfGQE1h5ymlLt77Xdmz1DfZwA4gm08d6o=;
 b=At605n4qW9bdR6k77EsIJsk/ZhpTDqxrYlqP+Ueb2a9KlR+TJ4AG6O/amNjhWR0Xt48NyaOZb1mZUpO919QxvXXxnCr/+YhCJd2bmHVkwG9ub1lbujboKqlHCGU85wk5g3hp6YhH69WAzi9eKZanr7CFs3kk2oYXAx4wl7n+IDMcxm8Y08m+5mVMTEgplnLMEriB5Xm3s40h6v64pkuv833BlH3c2hS7ixwwLZWdCCPPgRd3ZQ/lqp72nj70Bnj1FZmBcrnnRT7NYVUzm1s/dFbAlpOXLhOIE87GVRlTi37GJTimGWAZPAbWw5PrxyPoEt/YTt+Ftv6RSpyUlXS6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 06:48:28 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 06:48:28 +0000
Date: Thu, 13 Oct 2022 23:48:19 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 09/17] drm/i915/vm_bind: Add out fence
 support
Message-ID: <Y0kGMzaVxlC7qQKd@nvishwa1-DESK>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010065826.32037-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e462b64-d59d-4a4d-4fd1-08daadb01965
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R23LxmpQuwbk1/GpJ9CW87g6msWoCnVWCo99qvbCpkh6dTmcWUm3UFlxjtIbQBae2hgeIjn0i2iF5BN3laaKQOfU6E1mGlAHUEJaH3zJ0lRQUmX/OkRyMZcPngxNIaEzDhS0uIHMpExkCzaCAoW0l0QlM3P+qP6+bJjwe5vlpTEdesT3oDTkiSIWXPeaXzUOWeh40RTAMYSYMwx3IYwD8KuR/hF97NkUDg73BLnf6hIBab1WWKipBMSWsptbbFtNtFPnmMHLH4oNZtbEoH0QvWOB8HryCP0wLvEdIUqxqbDnoDK8YMOVnZIWYP42K6eBD4dUmu2PCevIpieEDYM+8d0ctnnPDdPIrTGgy2KmfaiY/9Cbb5PKtPtyGtpbXmXm7tUH44lvKQuV33bB6n+neqqhbDJn2r6KLt59IO63h84cNwVryxMY3RUyNGU3OLFmkhsylPMVNmb6ESAj936UXoo3Ewg1BZ+c6LMgQ7hCgWyldqN71jR5jymjIrn56tFuJ2Ifh31pNq3dozUD2ISuvcfva/KISt9g9JI2Vs79Yh49pycW/WhEyvH/7vDTJkCj3mHTCdBHHnwXV0GbDRIhd2uwW13q2/sznp5cuby1NrA/jnQbAff7veXbujxMZl4Hr/xrS35t58hfbZ3iuEh/zbP1ItHdAuqU9F7VPlco9qQ6nhO7kxqOYODorZ/n8i2FwETaBQnZMIfr+d/lSIEEdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199015)(316002)(66946007)(4326008)(66476007)(66556008)(8676002)(6666004)(6486002)(478600001)(9686003)(6512007)(41300700001)(8936002)(6506007)(33716001)(44832011)(5660300002)(186003)(2906002)(83380400001)(26005)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dQSoWaaq2CWaeTWRn1zcgOQzAskt3GcwHu23Tr3gnTYob8tINRvAhKMlEloS?=
 =?us-ascii?Q?SbcKd6TuLifHSVlDI2DMiuewtD9wUU8P1WiP1h3Jw0pPqnBcDW+IwHxZUOHZ?=
 =?us-ascii?Q?EYuRfaLG7AirXVqH/dgzoxj65r+GPeIH3bB0t1njtwvefAlkJ4tuqZz9lDhC?=
 =?us-ascii?Q?1fYgYhkt4DdCmQP63kS66By5ulGPd66V4ffcdZfyD+O/IHBwdXznvt/TFS/i?=
 =?us-ascii?Q?rPzgprOJrWRqfFS6QvPpV7fG6AEdzVq5RNqak0BVuPmvUErp6IbAIZicmW1h?=
 =?us-ascii?Q?7u3Hhgi52Y8W0LjPbEhWvUUpNfkXyND+cfX5nNoFmECs6MeZB4/+7yRSCH1J?=
 =?us-ascii?Q?v0SZQVHg9ukGufm6GBNDFRymuoaysipBch/hTE2wPxsQslc0k31euAZe0BWW?=
 =?us-ascii?Q?yZjgPfcdyeLYcoO4fZLi8eJ2P3/claTFxGLbCOYQ9zs9EEX7Uy2AlLIgNm7M?=
 =?us-ascii?Q?sya5xpEgqvgglskCOY/L0cB+92pb028mTlIldCOYSHPBjRAZuHBqpBYO1Ow2?=
 =?us-ascii?Q?6tFyQBn+g88mbv4gd1JuTn4Ni9aoc0C3nWKqhtpgptcctBwui57uZ0VCHHdx?=
 =?us-ascii?Q?xXEpM1ZvBZNVqt74avY6TBvQCr4n1LeLtFvEAiVbkNM9VY1yZWM4Cm+b2UG4?=
 =?us-ascii?Q?NMb7diyhZpArScUzv64qoho+HCFuk5QJ4IV/aoRC2ygPjrSrDPRvCR/6bEYt?=
 =?us-ascii?Q?zg4v32c1/oK6H7AjGHDXuwgOBygZgZvoMsuckFt5c7s1/vYOm/xZ5FVsXfCY?=
 =?us-ascii?Q?kZcZzuQIuMaPHEwb3dECXt5X0T87rjdgasYET+kNz47ax4e/tvGs3uPfDaT9?=
 =?us-ascii?Q?TWprIdYyeHHZZI2jX8yRbKZAVxfJNF7WlmMwnhVzpqKbzRPRbBmy9bOMrGaK?=
 =?us-ascii?Q?T+HL8NDT15sE1tWMlVfP5bPtqIo9zPTsq99ElqGEryTqzXcZgw0HlmGr0wUZ?=
 =?us-ascii?Q?OKe/6Iw1YY9OzgXGmPQ2fcPMG/uY6pPynAP1kgnNFdrfJJUYPU4Aq6MrlKZ5?=
 =?us-ascii?Q?qTOUMfiz0MLQs5FQ2Xl1td3R7Yi0uGtBo7VKobareZnZMc9U7DBFKptTR9iX?=
 =?us-ascii?Q?EfPqmCM4w7L2xtoe7OiAU3j/IfA2jB242Y2hRvxSOhZDU053kuj9LdQELwdB?=
 =?us-ascii?Q?GmsoiaXLvN8pAUduy9xiFbP/v/uOuREy7Xs2ShZa5d4mR04TqTtTcil2T8Fw?=
 =?us-ascii?Q?Bh5vhfOlCNkTk+WWz0jLSC5VZA08umEHK+Si+GY9esKcs9gVmKNmDv273N8x?=
 =?us-ascii?Q?Uq4sH+vqS4LogoOh9oFx5QjiJgX9+/TSvADVP9sdY07qHNISGJNAUfAqWbjO?=
 =?us-ascii?Q?0GW0Xlq1i899qKV3QjuF3U+lgVO1dUoSam29ZkpnqmApPFVvaPCcwwhMtQA+?=
 =?us-ascii?Q?lF6l5nGGfLT5FSQIouRIMDHEaprD9k2w2TnYNos1CjHKlO9oo6tCs9D0mdEi?=
 =?us-ascii?Q?XbtVB3Plc12okPaEWy9Bu5Ay1qZi0o5IGc6K6lUwWwZOS9ZWAhugaRke/UJ0?=
 =?us-ascii?Q?9Z5s4BLZxzXlzfC1wUko45RD6LRDXFK31u5/84IWK1EfUE36z7jdjVeZ68iM?=
 =?us-ascii?Q?Y4P/e96ZAX/wBM2O9e2HfWMwp1v5330LiGoim+3f9PCUSy9mrpAorTNpni/5?=
 =?us-ascii?Q?miJn6KLMinGNArcR7Mc7bBI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e462b64-d59d-4a4d-4fd1-08daadb01965
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 06:48:27.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXAnRUvRECymjy5xN0jkW2JPzBsXU2rNaKwGAo8T42UmDBxDiWTPZtr7Ws7/MLumRSPKxK4izzLu3Fp50S/c4EBvJNAndcZrYQ2guMynG6QELcaIK3nlzeHTZOd2uw7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 09, 2022 at 11:58:18PM -0700, Niranjana Vishwanathapura wrote:
>Add support for handling out fence for vm_bind call.
>
>v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
>    of vm_bind call.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
> .../drm/i915/gem/i915_gem_vm_bind_object.c    | 82 +++++++++++++++++++
> drivers/gpu/drm/i915/i915_vma.c               |  7 +-
> drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
> include/uapi/drm/i915_drm.h                   | 63 +++++++++++++-
> 5 files changed, 158 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>index 36262a6357b5..b70e900e35ab 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>@@ -8,6 +8,7 @@
>
> #include <linux/types.h>
>
>+struct dma_fence;
> struct drm_device;
> struct drm_file;
> struct i915_address_space;
>@@ -23,4 +24,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>
> void i915_gem_vm_unbind_all(struct i915_address_space *vm);
>
>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>+			       struct dma_fence * const fence);
>+
> #endif /* __I915_GEM_VM_BIND_H */
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>index c435d49af2c8..526d3a6bf671 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>@@ -7,6 +7,8 @@
>
> #include <linux/interval_tree_generic.h>
>
>+#include <drm/drm_syncobj.h>
>+
> #include "gem/i915_gem_context.h"
> #include "gem/i915_gem_vm_bind.h"
>
>@@ -100,6 +102,76 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
> 		i915_gem_object_put(vma->obj);
> }
>
>+static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
>+				  u32 handle, u64 point)
>+{
>+	struct drm_syncobj *syncobj;
>+
>+	syncobj = drm_syncobj_find(file, handle);
>+	if (!syncobj) {
>+		DRM_DEBUG("Invalid syncobj handle provided\n");
>+		return -ENOENT;
>+	}
>+
>+	/*
>+	 * For timeline syncobjs we need to preallocate chains for
>+	 * later signaling.
>+	 */
>+	if (point) {
>+		vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
>+		if (!vma->vm_bind_fence.chain_fence) {
>+			drm_syncobj_put(syncobj);
>+			return -ENOMEM;
>+		}
>+	} else {
>+		vma->vm_bind_fence.chain_fence = NULL;
>+	}
>+	vma->vm_bind_fence.syncobj = syncobj;
>+	vma->vm_bind_fence.value = point;
>+
>+	return 0;
>+}
>+
>+static void i915_vm_bind_put_fence(struct i915_vma *vma)
>+{
>+	if (!vma->vm_bind_fence.syncobj)
>+		return;
>+
>+	drm_syncobj_put(vma->vm_bind_fence.syncobj);
>+	dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
>+	vma->vm_bind_fence.syncobj = NULL;
>+}
>+
>+/**
>+ * i915_vm_bind_signal_fence() - Add fence to vm_bind syncobj
>+ * @vma: vma mapping requiring signaling
>+ * @fence: fence to be added
>+ *
>+ * Associate specified @fence with the @vma's syncobj to be
>+ * signaled after the @fence work completes.
>+ */
>+void i915_vm_bind_signal_fence(struct i915_vma *vma,
>+			       struct dma_fence * const fence)
>+{
>+	struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
>+
>+	if (!syncobj)
>+		return;
>+
>+	if (vma->vm_bind_fence.chain_fence) {
>+		drm_syncobj_add_point(syncobj,
>+				      vma->vm_bind_fence.chain_fence,
>+				      fence, vma->vm_bind_fence.value);
>+		/*
>+		 * The chain's ownership is transferred to the
>+		 * timeline.
>+		 */
>+		vma->vm_bind_fence.chain_fence = NULL;
>+	} else {
>+		drm_syncobj_replace_fence(syncobj, fence);
>+	}
>+}
>+
> static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
> 				  struct drm_i915_gem_vm_unbind *va)
> {
>@@ -237,6 +309,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		goto unlock_vm;
> 	}
>
>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>+					     va->fence.value);
>+		if (ret)
>+			goto put_vma;
>+	}
>+
> 	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER | PIN_VALIDATE;
>
> 	for_i915_gem_ww(&ww, ret, true) {
>@@ -258,6 +337,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		i915_gem_object_get(vma->obj);
> 	}
>
>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
>+		i915_vm_bind_put_fence(vma);
>+put_vma:
> 	if (ret)
> 		i915_vma_destroy(vma);
> unlock_vm:
>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>index 88c09e885fec..cb8e718ec46e 100644
>--- a/drivers/gpu/drm/i915/i915_vma.c
>+++ b/drivers/gpu/drm/i915/i915_vma.c
>@@ -29,6 +29,7 @@
> #include "display/intel_frontbuffer.h"
> #include "gem/i915_gem_lmem.h"
> #include "gem/i915_gem_tiling.h"
>+#include "gem/i915_gem_vm_bind.h"
> #include "gt/intel_engine.h"
> #include "gt/intel_engine_heartbeat.h"
> #include "gt/intel_gt.h"
>@@ -1572,8 +1573,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> err_vma_res:
> 	i915_vma_resource_free(vma_res);
> err_fence:
>-	if (work)
>+	if (work) {
>+		if (i915_vma_is_persistent(vma))
>+			i915_vm_bind_signal_fence(vma, &work->base.dma);
>+
> 		dma_fence_work_commit_imm(&work->base);
>+	}
> err_rpm:
> 	if (wakeref)
> 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>index d32c72e8d242..2c740500ac1b 100644
>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>@@ -308,6 +308,13 @@ struct i915_vma {
> 	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
> 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>
>+	/** Timeline fence for vm_bind completion notification */
>+	struct {
>+		struct dma_fence_chain *chain_fence;
>+		struct drm_syncobj *syncobj;
>+		u64 value;
>+	} vm_bind_fence;
>+
> 	/** Interval tree structures for persistent vma */
>
> 	/** @rb: node for the interval tree of vm for persistent vmas */
>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>index 16b815875e4f..61b1500866f9 100644
>--- a/include/uapi/drm/i915_drm.h
>+++ b/include/uapi/drm/i915_drm.h
>@@ -1527,6 +1527,41 @@ struct drm_i915_gem_execbuffer2 {
> #define i915_execbuffer2_get_context_id(eb2) \
> 	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>
>+/**
>+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
>+ *
>+ * The operation will wait for input fence to signal.
>+ *
>+ * The returned output fence will be signaled after the completion of the
>+ * operation.
>+ */
>+struct drm_i915_gem_timeline_fence {
>+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>+	__u32 handle;
>+
>+	/**
>+	 * @flags: Supported flags are:
>+	 *
>+	 * I915_TIMELINE_FENCE_WAIT:
>+	 * Wait for the input fence before the operation.
>+	 *
>+	 * I915_TIMELINE_FENCE_SIGNAL:
>+	 * Return operation completion fence as output.
>+	 */
>+	__u32 flags;
>+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>+
>+	/**
>+	 * @value: A point in the timeline.
>+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>+	 * binary one.
>+	 */
>+	__u64 value;
>+};
>+
> struct drm_i915_gem_pin {
> 	/** Handle of the buffer to be pinned. */
> 	__u32 handle;
>@@ -3817,8 +3852,18 @@ struct drm_i915_gem_vm_bind {
> 	 */
> 	__u64 flags;
>
>-	/** @rsvd: Reserved, MBZ */
>-	__u64 rsvd[2];
>+	/**
>+	 * @fence: Timeline fence for bind completion signaling.
>+	 *
>+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>+	 *
>+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>+	 * is invalid, and an error will be returned.
>+	 *
>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>+	 * is not requested and binding is completed synchronously.
>+	 */
>+	struct drm_i915_gem_timeline_fence fence;
>
> 	/**
> 	 * @extensions: Zero-terminated chain of extensions.
>@@ -3865,8 +3910,18 @@ struct drm_i915_gem_vm_unbind {
> 	 */
> 	__u64 flags;
>
>-	/** @rsvd2: Reserved, MBZ */
>-	__u64 rsvd2[2];
>+	/**
>+	 * @fence: Timeline fence for unbind completion signaling.
>+	 *
>+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>+	 *
>+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>+	 * is invalid, and an error will be returned.
>+	 *
>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>+	 * is not requested and unbinding is completed synchronously.
>+	 */
>+	struct drm_i915_gem_timeline_fence fence;

Async unbind (hence out fence) is not yet supported for vm_unbind call.

Also, looking at i915_vma_unbind_async(), we can use that for async
vm_unbind support. The i915 driver also handles sequencing of other
operations behind the async unbind. Hence, probably we don't need to
return the out fence to user at all here.
i915_vma_unbind_async() works only for objects with ttm backend.
Perhaps for other objects (like userptr) and if async unbind returns
error, we can fallback to synchronous vma unbind (i915_vma_unbind()).

So, not sure whether we really need timeline out fence support here.
I will remove this udate here and keep the fields as reserved for now.
Any thoughts?

Thanks,
Niranjana

>
> 	/**
> 	 * @extensions: Zero-terminated chain of extensions.
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
