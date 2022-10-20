Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7A6065FB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F3410E413;
	Thu, 20 Oct 2022 16:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF84210E0B5;
 Thu, 20 Oct 2022 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666283988; x=1697819988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NH3Kk7pRb5h0AJxU3P2afRPxfsSVZYIjHpJza+AH9Pw=;
 b=EMToqmu/Qc72VMwIVYC2THgIKIiZZcUuoAVzUEZIbJTG7MlkneCcl0ZG
 AYcpvc3VlD/RqcLmJiA0W2RR+NJEE6wqOeR/bJSGQI1NkgMTiOT1PA9bt
 Uo0VMHbmbuc/LzwMtmVTPof0l2XyiLICqUOwR2ZLPyb9LFXMS4C049Ehw
 6PbUSMceVUpjYG9zOUBBcNEvqpKOJLpSv41HUgYb+QhZJvQRTLzUD3bgE
 L2n2CAzvIbzxrVtVMTVt4EAqUAayjPSYFKjjTy+Ef3ub/yxr2per07ABs
 2O406TUZeu6rpil3Z8nFTpXMiuPQ75VP/bScgV24RoR3IXxM7LVg92Pdr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305504528"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305504528"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="607781770"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="607781770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 20 Oct 2022 09:39:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 09:39:46 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 09:39:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 09:39:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 09:39:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GODjYQvLuOZ0IjVUeyfTUJDhVSkM6MPhDFKhneK2sDhjZWc6tFtck25l3B5a9HV1qrRF+B5SLn8rQYdA2HQFCPAbFnrkKbw9k338X3TqWD+PJQ5Jbkh0gDEn4oBE/demTqbWz/e4w1LNqKeIpOndXIPyAjfUJGho2nRZD7r8/btANz2PM/NrT/FRG1zPzinURXqB+ZlelfeBqKsexRy0p9BAWT6DTuf/fOCDLLjqhw5KK5l+TTjWmpCN8XwMd39hwBkkVP6Xe64fPlYt+Cl4E0/ySMT8peEw6vkhBk/SClQTuxTZNpm1t++mqDWiAkMvsLQspeZ5LxzTNC0hecvq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcFcfjytDHJk4XPDk2IR84J8eRUMCEawSuXOujLl4W8=;
 b=QXGymW/utyrmLilKtJgbJfMhcZx7thY1Mkh3qnc/FTyD9tGul801vlsMyzEA8lbtf2sdmSZtXiEQh36pEN5pBjbP5vy8z43OaGQWG9JHV6sMwLWn4faw237gr3rlSGljl8r6NzvgHLFlHJdZ0X8ftgNH4Kob1Ua9MAItLJidyhp5Md+Q6pT9/PnWgUpYiMQZ+R8tHZTJsSHuZ19fhWXPcIiz1Fy5fcb0QsVvIGb3Rq0mrJ700JSZvO3KvelgaakiiwVXDrv7j0LpI5Pay9AvwyyVX6HbBGGD10EDDFndNJt81uN80Jcv61ieRSCBejqgbh4PpfufpyEClz/1Gf0a0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 16:39:43 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 16:39:43 +0000
Date: Thu, 20 Oct 2022 09:39:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 16/17] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <Y1F5x94aIQDziIUE@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
 <d43ebcd0-724e-af24-1e4f-199b82414f38@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d43ebcd0-724e-af24-1e4f-199b82414f38@intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d2c6d7-80c5-4bea-7a08-08dab2b9b0e8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pL2UvY2ulvFIpwVxb2mt+lKpuZOsG2vE52cra36ChfMctj3kgndAkYriGS1sjAthnPXiG6FSN9A0y83UBVis6ZzdJKRfNyIZr8h94knsWYMiCEakjoouoOxQ1eEmhlEtXzZZiLnBmlw4RmBVnscUYRFtcLdK1gM9cNos/rIxiqPyjhpwrv+2CIZIDSQg3EvFsiCji2cG/H8B9cnW/Wp0Q7ic1WEONm+Upiy0pOr5+0e0cBxrnF5tr85lv8tTCiEtTjgZm3/QMhGeYe5E9YuUsv7Z1yU8HQrFHMY8Kxg5IaIW3vg1LiqPKfzt93kRldHaxTo4aneqgs78E6YE5WseXbi8rzO/9KVpO3b0GQFbObFTi8l7ybcFPwJNT9U0Lpm1ALCdDH4gM58KeKuHPRVcoNkxaFy89GMD8h7jfhE5h5F381m/wQ3J67uBPh1I34qpx8OGIbtXEtq3b4Hs3H0kbyKRQayXsqxi6M1ljMFqVJb1W88bStWNpCri0Rj9gvhIZjIifNZIbsD1dRruQVmDJmg6R7cNKHf5aQ6q+tzcZwTFp8hW/DLBdhGHA/iU/v6vhD0rlPkbx8iCJHcYqsWMjiGSZZufn3GoHvQ/28OtC8eFuP+joQXUkjvWvbv3JG1Xznbc6hRxJvGbxBs665trVBrg03x9o4QAnOvq2/uvPAEZeGLOdqff0I5L2SA9wBECbzYF5m5hN6iFyZsjEIEayQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(66476007)(316002)(6636002)(186003)(41300700001)(6506007)(2906002)(5660300002)(44832011)(6512007)(8936002)(6862004)(26005)(83380400001)(4326008)(9686003)(6666004)(66556008)(86362001)(66946007)(38100700002)(8676002)(82960400001)(33716001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ODWD0+QHZNltL3Uym/hTcHtN5Ur4udXN29bfFTmIB3PfBaPw3iRHLuQWakeo?=
 =?us-ascii?Q?ZCIhyDjU4xobsMCLr5BRH9nWSicBcYiCJV8WS2aFYfQcyPJvuI14+uZG1ymc?=
 =?us-ascii?Q?URhzEo2tNTLmC+rbe3TKx12SO6NGFGdANIsnFvBF0scDHrHYawaieOxAcOBK?=
 =?us-ascii?Q?z2x8BxgcH4goSdeDfIqgbWu/7YVYRUAj/eOooruLHyhO5nEu9L9GLP4NKFIi?=
 =?us-ascii?Q?piK3L0n+5HlXY/fDVYUu6neAeF2B/SIhdfPLPBeKajxpscZKW7XxFWI4ts1f?=
 =?us-ascii?Q?mOoVUNLTAf9Iz7EEciDnrzMmyyBYWQD3b99PA3Mc2+BAol8vrLaBY60CjTsR?=
 =?us-ascii?Q?7jGiOrTMEhycGkivKNieLDYjhHXIrKmswOlIXWP9ktrGKzeNyYWzSHzxTDcG?=
 =?us-ascii?Q?F2hHDA5MYydQjk5Vo6WRq6zTTSAJQ9mv2gPVPp0ejgfiMgIsf63rOprFVS/8?=
 =?us-ascii?Q?4UmDe2tVyxR1fbqQf6mE07YNkDfex3BhwDiJCjUcfkA7AuY9cv6XD++c2ZJX?=
 =?us-ascii?Q?uPfdw0AsmA7y/yjqK+DpGkQtBj8BbB1Obk7PCSSiTlmNt0B3yxwuzaGLEV8n?=
 =?us-ascii?Q?bZ+KsJK7TX0KvpZJmNpqKbINnrTmgKmLgV5xWhBhIRrGblJtZmNIsfgHObuk?=
 =?us-ascii?Q?brahYsrXgqdhhaKb+K9wCCWLvqcRoCiwfcJ13Ab/3K8gRUzyYbb3SuvliVhd?=
 =?us-ascii?Q?UtuJPfB8A1pjg3pHIvSu1iYXkb7f9y9zJmnRAtiHBfFZPONHXVE/0HAoKeg7?=
 =?us-ascii?Q?Q9cneyKKJnkkL79zqrs+gz9u3IFeaBoQoxTG6qhZ6YATziMFVgbHyDQ0MjVj?=
 =?us-ascii?Q?dlb0PSSyLhUP50ju/jBh7oX0s7POe9PmTXrWC7ykRYuK/0CySqehdDBpYLJj?=
 =?us-ascii?Q?gIQHiBeBgiGkEYukiUSdae3jZkJkPW3tjys95dKkam3Aenmz1FbaTIygC1uB?=
 =?us-ascii?Q?BCxd8RyAdwTrH62skqPrKspteH8TmiBUYhVUS8jJph3hliU2iBUgsnCetwiK?=
 =?us-ascii?Q?V+JDWjvWssjWe4o0EcVrQ4NjDIrsCARUbfKC627bhGAZJuq8V+cZSV9/yOhy?=
 =?us-ascii?Q?9gnBmHFNz26muiuZDqwiUe9g9yiBHKo0TqOl/z6mjsucPLpL68SkLdGExhSG?=
 =?us-ascii?Q?adV8YktFiliUo52AyKsN/neWSr6n+2hYt6SGWmwOJKWkxj/2EoUlDH+dei4M?=
 =?us-ascii?Q?QKSaRi59OXVupSXsueCz7HEghjiSAlNJywT+jap7K1pilfoGz84/tpx8nZGw?=
 =?us-ascii?Q?EoEzd6/ByOEFWOoFnAwoWT6DuJL8FpHHmWhlyFaKHySrXqtJ97Szgyp57XJa?=
 =?us-ascii?Q?FahqoTGsa/w3w4nUHK5Tg+ri+chiiQIL5+kvrqHjqvkOCy1znU5CzeuvB+FP?=
 =?us-ascii?Q?2APYsNgQkX9mSZmdGvsYuzdegS+Y6z1HQf+WMyyLn0g6BP2Ur0jYNgYXUrS1?=
 =?us-ascii?Q?phCjDva1Kv/z6MoBc+rR6etI8VUeJ8+ahC/vrY7AgKnAZGP0y11YclkZBiG+?=
 =?us-ascii?Q?vr2/BrMmyR5HalxxOr+uUQjz/BrPL8MqxU+LPaUbXmqXzM6F+zK3ldLYosEX?=
 =?us-ascii?Q?aD2/OSbApw9yR26+wpJwjRUswpRzEpyNuW4E6oY/5qoEyzdZRTlD3XWgmHnv?=
 =?us-ascii?Q?+P1Dr0RKxjCt/ozO0Y1ror8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d2c6d7-80c5-4bea-7a08-08dab2b9b0e8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 16:39:43.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hdvjtdRZtpLM0gzm+e/RFXOTuFS9dzqPOphT/sfrSvr+6sjnPASfW+6YBPq4xjY3AEBstEdcs+5nqd9l977hJdWVapm96QmcQmh+osrjawktiQU6T5pSc10m5/+nDfK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
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

On Thu, Oct 20, 2022 at 05:29:45PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>For persistent (vm_bind) vmas of userptr BOs, handle the user
>>page pinning by using the i915_gem_object_userptr_submit_init()
>>/done() functions
>>
>>v2: Do not double add vma to vm->userptr_invalidated_list
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 80 +++++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 19 +++++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 15 ++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>>  6 files changed, 122 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>index 8120e4c6b7da..3f1157dd7fc2 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -20,6 +20,7 @@
>>  #include "i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>+#define __EXEC3_USERPTR_USED		BIT_ULL(34)
>>  #define __EXEC3_HAS_PIN			BIT_ULL(33)
>>  #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>  #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>@@ -142,6 +143,21 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>  {
>>  	struct i915_vma *vma, *vn;
>>+#ifdef CONFIG_MMU_NOTIFIER
>>+	/**
>
>Not proper kernel-doc AFAIK.

Ok, will use single asterisk above.

>
>>+	 * Move all invalidated userptr vmas back into vm_bind_list so that
>>+	 * they are looked up and revalidated.
>>+	 */
>>+	spin_lock(&vm->userptr_invalidated_lock);
>>+	list_for_each_entry_safe(vma, vn, &vm->userptr_invalidated_list,
>>+				 userptr_invalidated_link) {
>>+		list_del_init(&vma->userptr_invalidated_link);
>>+		if (!list_empty(&vma->vm_bind_link))
>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
>>+	}
>>+	spin_unlock(&vm->userptr_invalidated_lock);
>>+#endif
>>+
>>  	/**
>>  	 * Move all unbound vmas back into vm_bind_list so that they are
>>  	 * revalidated.
>>@@ -155,10 +171,47 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>  	spin_unlock(&vm->vm_rebind_lock);
>>  }
>>+static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *last_vma = NULL;
>>+	struct i915_vma *vma;
>>+	int err;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+		if (!i915_gem_object_is_userptr(vma->obj))
>>+			continue;
>>+
>>+		err = i915_gem_object_userptr_submit_init(vma->obj);
>>+		if (err)
>>+			return err;
>>+
>>+		/**
>>+		 * The above submit_init() call does the object unbind and
>>+		 * hence adds vma into vm_rebind_list. Remove it from that
>>+		 * list as it is already scooped for revalidation.
>>+		 */
>
>Ditto.

ok

>
>>+		spin_lock(&vm->vm_rebind_lock);
>>+		if (!list_empty(&vma->vm_rebind_link))
>>+			list_del_init(&vma->vm_rebind_link);
>>+		spin_unlock(&vm->vm_rebind_lock);
>>+
>>+		last_vma = vma;
>>+	}
>>+
>>+	if (last_vma)
>>+		eb->args->flags |= __EXEC3_USERPTR_USED;
>>+
>>+	return 0;
>>+}
>>+
>>  static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  {
>>  	unsigned int i, current_batch = 0;
>>  	struct i915_vma *vma;
>>+	int err = 0;
>>  	for (i = 0; i < eb->num_batches; i++) {
>>  		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
>>@@ -171,6 +224,10 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  	eb_scoop_unbound_vma_all(eb->context->vm);
>>+	err = eb_lookup_persistent_userptr_vmas(eb);
>>+	if (err)
>>+		return err;
>>+
>>  	return 0;
>>  }
>>@@ -343,6 +400,29 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>  		}
>>  	}
>>+#ifdef CONFIG_MMU_NOTIFIER
>>+	/* Check for further userptr invalidations */
>>+	spin_lock(&vm->userptr_invalidated_lock);
>>+	if (!list_empty(&vm->userptr_invalidated_list))
>>+		err = -EAGAIN;
>>+	spin_unlock(&vm->userptr_invalidated_lock);
>
>After dropping the lock here, the invalidated_list might no longer be 
>empty? Is that not possible, or somehow not a concern?
>

It should be fine as we have already added the fence to dma-resv object above.
Any subsequent mmu invalidations will end up waiting for request to finish
(similar to case where mmu invalidation gets called after request is submitted).

>>+
>>+	if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
>>+		read_lock(&eb->i915->mm.notifier_lock);
>>+		list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+			if (!i915_gem_object_is_userptr(vma->obj))
>>+				continue;
>>+
>>+			err = i915_gem_object_userptr_submit_done(vma->obj);
>>+			if (err)
>>+				break;
>>+		}
>>+		read_unlock(&eb->i915->mm.notifier_lock);
>>+	}
>>+#endif
>>+	if (unlikely(err))
>>+		goto err_skip;
>>+
>>  	/* Unconditionally flush any chipset caches (for streaming writes). */
>>  	intel_gt_chipset_flush(eb->gt);
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>index b7e24476a0fd..3e88fd4d46b6 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>@@ -63,6 +63,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
>>  {
>>  	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
>>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>+	struct i915_vma *vma;
>>  	long r;
>>  	if (!mmu_notifier_range_blockable(range))
>>@@ -85,6 +86,24 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
>>  	if (current->flags & PF_EXITING)
>>  		return true;
>>+	/**
>>+	 * Add persistent vmas into userptr_invalidated list for relookup
>>+	 * and revalidation.
>>+	 */
>
>Ditto.

Ok

Thanks,
Niranjana

>
>>+	spin_lock(&obj->vma.lock);
>>+	list_for_each_entry(vma, &obj->vma.list, obj_link) {
>>+		if (!i915_vma_is_persistent(vma))
>>+			continue;
>>+
>>+		spin_lock(&vma->vm->userptr_invalidated_lock);
>>+		if (list_empty(&vma->userptr_invalidated_link) &&
>>+		    !i915_vma_is_purged(vma))
>>+			list_add_tail(&vma->userptr_invalidated_link,
>>+				      &vma->vm->userptr_invalidated_list);
>>+		spin_unlock(&vma->vm->userptr_invalidated_lock);
>>+	}
>>+	spin_unlock(&obj->vma.lock);
>>+
>>  	/* we will unbind on next submission, still have userptr pins */
>>  	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
>>  				  MAX_SCHEDULE_TIMEOUT);
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>index 63889ba00183..19071493355c 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>@@ -299,6 +299,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		goto put_obj;
>>  	}
>>+	if (i915_gem_object_is_userptr(obj)) {
>>+		ret = i915_gem_object_userptr_submit_init(obj);
>>+		if (ret)
>>+			goto put_obj;
>>+	}
>>+
>>  	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>>  	if (ret)
>>  		goto put_obj;
>>@@ -327,6 +333,15 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		if (ret)
>>  			continue;
>>+#ifdef CONFIG_MMU_NOTIFIER
>>+		if (i915_gem_object_is_userptr(obj)) {
>>+			read_lock(&vm->i915->mm.notifier_lock);
>>+			ret = i915_gem_object_userptr_submit_done(obj);
>>+			read_unlock(&vm->i915->mm.notifier_lock);
>>+			if (ret)
>>+				continue;
>>+		}
>>+#endif
>>  		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>  		i915_vm_bind_it_insert(vma, &vm->va);
>>  		if (!obj->priv_root)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index ebf8fc3a4603..50648ab9214a 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -292,6 +292,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>>  	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>>  	INIT_LIST_HEAD(&vm->vm_rebind_list);
>>  	spin_lock_init(&vm->vm_rebind_lock);
>>+	spin_lock_init(&vm->userptr_invalidated_lock);
>>+	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>  }
>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>index 384d1ee7c68d..1ade95b2a0fa 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>@@ -270,6 +270,10 @@ struct i915_address_space {
>>  	struct list_head vm_rebind_list;
>>  	/* @vm_rebind_lock: protects vm_rebound_list */
>>  	spinlock_t vm_rebind_lock;
>>+	/* @userptr_invalidated_list: list of invalidated userptr vmas */
>>+	struct list_head userptr_invalidated_list;
>>+	/* @userptr_invalidated_lock: protects userptr_invalidated_list */
>>+	spinlock_t userptr_invalidated_lock;
>>  	/* @va: tree of persistent vmas */
>>  	struct rb_root_cached va;
>>  	struct list_head non_priv_vm_bind_list;
>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>>index 2c740500ac1b..8e562e07d4a7 100644
>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>@@ -307,6 +307,8 @@ struct i915_vma {
>>  	struct list_head non_priv_vm_bind_link;
>>  	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>+	/*@userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>>+	struct list_head userptr_invalidated_link;
>>  	/** Timeline fence for vm_bind completion notification */
>>  	struct {
