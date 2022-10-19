Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1960382F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F2F10EA46;
	Wed, 19 Oct 2022 02:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380F110E542;
 Wed, 19 Oct 2022 02:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666147416; x=1697683416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gCegAGh1leCcFpVmFWzZcAmQ4kpq2x+bxVXTtG5GyFY=;
 b=fX/fxaxC70rEUCrsrDmmUB1+8x5DzEU88jNaiS5YEe62iY8k/57YphQd
 xyjDS6EIuEIVJ+FMN6WmTXMRC34Q6tYUfzDV4GeCBLYmdQREFyn/xAWwv
 jIRnDCdWAxq1sDfBzq8d0Xxrun+buGpAeC9PXGwScP0jiHduAJnjGMRhT
 WkolXNWzPzUgQmBKzbxQPPK6tmqEVbVxYS69pmBaXDn9isUVuvXXIb0y9
 3il8lsktFdZz7d0ht+4qM2znIg70cMighiuk8dpOuF8rz10g0nv/Njpd7
 c7MG8HVQXsQbVPdHEoQCUkZK2ADy+I9nzcoJDX9ULMWTb/5+LrfO4Ygpp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286006112"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="286006112"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 19:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="631434157"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="631434157"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2022 19:43:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 19:43:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 19:43:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 19:43:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 19:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gm1K2wuKznBqZf+LvimgmtBFXVMPUYVQqUrHG/sq2Evrt+M9/JSeFKzGOWqjLzTq2wx1M3nCOCFPBJuExphBwm1SpH/DohYruA1tRBt/5HOgwYFLf2I4z3Gmwv1GrwqtmIUR5itdhuRRGUna+ErNO8w1yWragixWJO+Bnq1tgRQkMuQovFPVyjLO4DaiHTuzhM6nSZDYm7PmL1229sdUdM87zx0RZ0LsxmX1TnNfoATbsWi5bSYAMHFw3wWevuREd8U1AT9O2VPKtqhaUK8I146Ms79/Qf/kouyNtKp71A7S+OD0L6AhEUVW5v3jruRyV5p3m4cyv5a0FKIr24ERFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqHnb8f2M9i5FqXmTCEzJcyRg4Uq3YCo4xvD7BduYrw=;
 b=ZSLGwN5cZ0iJZkZ4aWCrOklQQaFD/Anyb31w/Qu5lyS3/ae+sRE9JalEmxCg1u2U3kpTCxmvOi/g8Z2cZH2Ruuc9dQTwYbKErLif1KQHneudj/TLovzaZ4P/wdl+AzrJkqKj00WPsCv2p0npRGLWMp3Q1IefBtwzgd/HeKnnfx7tl+0wzlFr+XSb541KBh2WmPmsrjuCoaTJesrKnDdCrlLv7fLQ7bFMAredv8QoVXOxlKPfCQzngC5IEUjl8xvRwObFQCt2RgVOuv5/OxxGELw5mt2J+McxhOlaHwcELR1D5tykOnNMKfJisqrPp7nTZ1K+aPkb1wySDAnlJNTOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 02:43:24 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:43:24 +0000
Date: Tue, 18 Oct 2022 19:43:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 09/17] drm/i915/vm_bind: Add out fence support
Message-ID: <Y09kRaE/6wQuMVPz@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-10-niranjana.vishwanathapura@intel.com>
 <998cab0e-e199-e7d7-b372-880b9f7d2672@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <998cab0e-e199-e7d7-b372-880b9f7d2672@intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f188b3f-b9f0-4df5-ee81-08dab17bb196
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IS93nghUy9RUJJRc2FqrKJyDbgZ/FeR4ZjcznhfGmdgCvXQwAIPz3G3pdtvc3pq0WSLfeihJbihYEfv925iBzJA7gc1xH425cZegwDGRsdFlu90nqOJw3iQtq8oyUyxJ1gt/oQUYMDRzKStq9MWBBe7Y8gvU03S2RtOjKBurX1Wup/MoTD4MoI8lOQgRzNNrDgM2EDlGRogNyGEUxNkUfsSjzCGlsjsTU4OwAwbbVtCAZgb+zkZIN2oOjv17dkm9SOP+Vg7HDBWh4a6ALhXhEayVbVCIaTpNSiKGtDoK+ScVnvZ3J3AqcCVScUsaACXdLeLwNGu44/yBoMW+Lr4NjYXEnsAvrnlJ46V8i+MtEvpLK5QQ+6OD9CIC61CrWADHDeaiky29Viz+yx8AW7Ha/7VnpQtPcGJd5pRRrA77K3h+DSh5JTvDSQuuo9VuxhoNIa6bP9jVbkhv1TtaJa89Ojdk8nJ+SJPvS3yYlofPRxb2+7YZPyYjhbAAGYTSOao+s+47sYaRdNNB6JQB37u+s6D4Id52U6WfHKuznMOmbvCtSriyM2OpMw11NfAFU8IaPGH20SLgKu4BJ3VvXCiuuwgryeEvvgOwfXgQqY5hcc8xdRj3c/f60UAnM3RTk4nwlgF5c44F2dlbqfUMOxwOkonQ1WeXWAJ5pd2kXPIhYOVj7Nk2Lk78CywDO6kdKSTlX4agbFR6nMjNcrV9AJNGWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(6512007)(9686003)(6666004)(6506007)(478600001)(26005)(83380400001)(186003)(5660300002)(44832011)(6636002)(316002)(6486002)(4326008)(41300700001)(8936002)(66946007)(66556008)(66476007)(33716001)(6862004)(8676002)(86362001)(82960400001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Q/5cLn2WTlPZ9/+W8IkbtnoTnTjuow4v30E8hpD6qZVuVgLzFuzQY1HGpPw?=
 =?us-ascii?Q?xb0IDv5xrBB7pWk2nz1H1S1ZkYAyh/Msa2RBW2XZtt5sj/hxfIKePalGsUjA?=
 =?us-ascii?Q?kTU+FeZixnGFZJZIQL81LW/z+Iy0NIRmSOmgMRlQAA+vc+y5AqpzZygIahor?=
 =?us-ascii?Q?RhW5Eou5DusZpn0I+K+H3DW0BS7Hz6r2jYmFLYDkre1IAE6WTM7TrO4E587v?=
 =?us-ascii?Q?MKZ5MwEyQdtSzcbAkgTxb884Jl2zWaLjKFl1XO77FNYkKYiaupxMa8YOioiV?=
 =?us-ascii?Q?R8ftPsUCXvXDRbtX9kYrzKckfOhqQZBD0znLOhwBd1ZOhg3xgsDw1AvUCH1I?=
 =?us-ascii?Q?li3F1V1sVe/INPahQWAP+0BQFHzvfalTm/Ry42TjCqfoKOl0EYyCf0necLOH?=
 =?us-ascii?Q?JuFNUN4dMtscN12YCZFCCNMhNoZ+k6izbWkZvRZfEkRvBIo0LbHuyFd95dVQ?=
 =?us-ascii?Q?fUuEbMzoE+UOtKLInSSn2w/dQMU8xOL6ShtjLHkCXBT7+ICgVRwwzDEWDbrS?=
 =?us-ascii?Q?QQp0Z8wi216+8hRQq8+43H4Tm51CapsMiw0ywZ7uyuWbbzXh/srXWB5R8PMr?=
 =?us-ascii?Q?2r7yu/5koxOzp/YxMWCcxHGC2gVOk+TUMT8leuB9bSkXQ0EfaPN5k9n/K4Wm?=
 =?us-ascii?Q?S/fSXT2i93xrnSi4djb5ZgKRsFnIdC/cczeJOln6WcigeOlS1hJWtkMSekM+?=
 =?us-ascii?Q?zcYN5F0VgqqsJJ6NOMx3yeFv2iE7GcccaPrGWzkBuR2YLGCTIlBuIjGblKEq?=
 =?us-ascii?Q?28jb0ZdzSTw9WRUCNY7vk1jHebQqZfsrjCXlVKESycd8Bdpezhg4s1RgTvXX?=
 =?us-ascii?Q?kt+3GLzrfj7x2J1wg94Tram+efrJip+FkmnLfWCUgCmFJnxwfsQEtu4rVpiz?=
 =?us-ascii?Q?cDOTDEsOVSFCfm7rFD4Ku/bOe4x5tZqLGk36EdH93uocfsJUrcXek/O10nnD?=
 =?us-ascii?Q?pDj+m4Goog2bmvwXCweIFdBtgS0gQmSujn6EplOXrtg6mqg29Fxd1GM97Rxr?=
 =?us-ascii?Q?yLZAZqxrZwRMp202g25swz+irMqk97mMMZdoiAy7KQmsthnveB/LjVXqnqLQ?=
 =?us-ascii?Q?/XMRQ3erZslE3zizUgpgbJY8MV9Tj5URrUY3omU5APaNklgBVpkuXKyEstXT?=
 =?us-ascii?Q?5804ItZg+a5oehLLIww9T4D3gtePnoJJP3mi31wM9RF1uO6xQIPpXTcyc+bv?=
 =?us-ascii?Q?qJFWynOSA/azT0dulNzfTy8YEFmdD3Wq91WTkUWDqPRM9Gv48hcG9f0SyEkl?=
 =?us-ascii?Q?P39ugiUVmbKKic3pvPHLbG67pq7yOBpmQ/Cvhu6IjLhN7J8aSZWXYiciMLwy?=
 =?us-ascii?Q?moVrC+y165efq62U1aPn3oGzFwVxftAJvL+s/ULMN4ykIO9eilXG9wxPppvP?=
 =?us-ascii?Q?LHWtsHvMKV5Nm3yW9odfLUiyyjpb/iuu9dHEcarALgMMjHuYrOd5+bt1iBOA?=
 =?us-ascii?Q?vlJ/GCEW4uWItjV/sWtZPkrA8696+m18g9dukYbn9VypNRNSR+QBL6kIJ/S9?=
 =?us-ascii?Q?2RWsezmanMzoiF/I48OghS8DMUTYqtvlE/pgvBjiJTViYJJGgqMkAk2vdKr8?=
 =?us-ascii?Q?raqCV5rHgiRzjuZIYAIMyG59HmKltyto1Q2HEnxWN5tybTDMdCodASUrbm+Z?=
 =?us-ascii?Q?05Y8dP2ryksQSeECHreNp10=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f188b3f-b9f0-4df5-ee81-08dab17bb196
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:43:24.6149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABpRkvAbOcgfu6YGCc12NFuD0O6fGm2Kv/H4JUkkM2oURNjSNbeiFls0sEXS6CTLsYvMGffa9i82K8ynFGb5hhu1ZdCD+Jmerz3U4snrOs2vgSoDvD/IRZ0vXn6/RwC5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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

On Tue, Oct 18, 2022 at 04:28:07PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Add support for handling out fence for vm_bind call.
>>
>>v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
>>     of vm_bind call.
>>v3: Remove vm_unbind out fence uapi which is not supported yet.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 82 +++++++++++++++++++
>>  drivers/gpu/drm/i915/i915_vma.c               |  7 +-
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
>>  include/uapi/drm/i915_drm.h                   | 49 ++++++++++-
>>  5 files changed, 146 insertions(+), 3 deletions(-)
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
>>index 3ea3cb3ed97e..63889ba00183 100644
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
>>@@ -237,6 +309,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		goto unlock_vm;
>>  	}
>>+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>>+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>>+					     va->fence.value);
>>+		if (ret)
>>+			goto put_vma;
>>+	}
>>+
>>  	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER | PIN_VALIDATE;
>>  	for_i915_gem_ww(&ww, ret, true) {
>>@@ -258,6 +337,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
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
>>index d32c72e8d242..2c740500ac1b 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -308,6 +308,13 @@ struct i915_vma {
>>  	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
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
>
>So this is the out-fence for bind completion, which then gets fed into 
>execbuf? Is the idea here to always get an out fence, and feed that 
>into execbuf to correctly order the bind(s) vs submit? i.e that's left 
>to userspace. IIRC we now do await_bind() in execbuf3 which I guess 
>forces the synchronisation, so just wondering if we need that, or 
>what's the story here with the out-fence for vm_bind?
>

Yah, vm_bind and execbuf3 are independent paths and user has to
resolve any dependencies.
I will be adding support for synchronous bind if vm_bind out fence is
not requested (more below).
Execbuf3 path will only await_bind() for those mappings which it
started the binding for (the evicted/invalidated mappings which it
scooped up). It won't await_bind() for mappings bound through vm_bind
ioctl call.

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
>
>Where we do reject that? Maybe I'm blind...
>

No you are not :)...will add the check in vm_bind call.

>>+	 *
>>+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>>+	 * is not requested and binding is completed synchronously.
>
>"completed synchronously", where do we do that currently?
>

Hmm...looks like are are not. Will add the wait call in vm_bind path.

Niranjana

>>+	 */
>>+	struct drm_i915_gem_timeline_fence fence;
>>  	/**
>>  	 * @extensions: Zero-terminated chain of extensions.
