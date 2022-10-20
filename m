Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052786066B5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 19:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7768B10E51B;
	Thu, 20 Oct 2022 17:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C65510E40A;
 Thu, 20 Oct 2022 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666285635; x=1697821635;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x/DiBIfG5RmVJ7d4ao0Zm5J4ef7IwX8Ht+EK5p7y0RU=;
 b=Snm4o4UACf1ONFY+/lF+fFTvXwScssim7MrgfNbz3k9JybpRSNQc5WQr
 R+g0W9b8MwWpBUB1vqiBtEuvr92/IhGiHuSQa7wx7ENllJxZIKUEK/xwx
 5kroCUNhOo+Rg2t5jsHEVOQIJ7G5ujwLcC4//YGoNpX2dmptSDn14PS8T
 wSdZ5bw6i2l7LEV/FPPWHxIcjzQyimTxLPaBuzt+N7kGHFy+wjLmVf4Fv
 h8Np8BIWSG5yeo5csOg7W9N6rpsGi2EdYIRb0Kh3gN2tnE89CV6fMJ7y9
 ormt4hYbCgowfzTvoItfgk3eVrpHRPXs0+ggwFhNVBG0SUhXInM7qBma5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="308456973"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="308456973"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="624810957"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="624810957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 20 Oct 2022 10:06:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 10:06:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 10:06:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 10:06:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 10:06:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvM27rNu9LctPiaN7IVHeXp2z6Vpdx8b58MpLrY7QtbzPkwxXiQRQJv2xg20Pw4Bwjy394MioOq10Uhqywt8RVNm+SGUrzpX2q9SOm6jcu6w9o6sFsGC4C+Zt2+rtbaWvrqozRwPFndlFCXjrUJNcDLT2Ebl9zOIfVpPsRhr+hZLnAhJBqFUbL9VOUwr6iMLIwEYHhnEseLi93Xt/0K+lvwI/brLGp1VarYFFTDm2hf2zL/zqG94/ePIrRLXsi9BrMdpxAaJr+Q/Esihn3n7MCPW57z/rxjbXcxEGRBDgv6dEWIaaO2QSF4Qi1r5lJph9IvtkEd5hGj78NXvc1I2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4vMcrO2uooL2zzfkLXV88LxhbAkm8hJdMm+ZeizbTY=;
 b=PpoSOsF3CdFXYfJUuV7m0YX/pUZsUk/qqhLA7A/26nmi2zoFFP5D3dOd286hXctom541R87t6kzbB7HyRWf/Eqxf1qCO2ifRdE9pVnW3MA4si29nOidfhGtskO/GEKJX37lFyDXG2Tk125vLjsDRWpfMjZ1WI1r1z1McHNVLiJO3ACUg8ArbReV3EYMpwdwpz1NqGxn/PoZZFb3PPh05/0vY6Y6rdbd51XQEaDDYhyo2wEt+EDepvFcYZyvKh0/tKA4/MszQdjiw8uNmxFR9YMQ1pixxn0iNjOC2rZ+LzAuFFLITJjXQJap/GwUm9IaBcR+UX9lM8yNpGkokNnrtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 17:06:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 17:06:47 +0000
Date: Thu, 20 Oct 2022 10:06:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 15/17] drm/i915/vm_bind: Handle persistent vmas in
 execbuf3
Message-ID: <Y1GAHnhXrIRD2iYD@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-16-niranjana.vishwanathapura@intel.com>
 <da4141d6-33be-79b9-8c3b-fa8239e95fc7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da4141d6-33be-79b9-8c3b-fa8239e95fc7@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da26204-4793-4491-4f68-08dab2bd78e6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0t+MNpBMwH3/Mzij6LDnkv3nvxahDDmg9PwAyJJc3jb9v0BTeZKlxIAZ0yTKCFNNtQfPkiwxcieEICWAcFAD5zJWafJM6NRG72+NfXtxtgQ0aFtrh15EjHTuwfxuwh4APPyGYnS82Mgde7LjaFyAZeCwjFO846dfDpRU0tCuaEzrhATcua1j9bknpI6RV76wkq/wvgmrIm2pCfVP9dDJy49uxGpkstbmb8XqXDF5pgRMEMGQw9ydBr9oxGfpt+PLJCjUNDi5L6SOlEFCIHQ74y4kAPT8pJcx35NASeMiLoEXt2n+3EAOl/6j7I9dVVe8BZwSvHwujzl44zTdyeSErSKiShAQNtrPoLLRznyOJc+1Pjo5gisui3Uh6DkdvZbOO0oe1xe6KcrYjMqUcTTjvSkLGPGiDs78aoJXPtq2ypmc39a2M3//RCAlLUgpsVEZGd9Arf57ZC0ndjq64eLlKFs79HR4bbKOAFm7HDUrS+AUpYWX7oEt2bcOcZwrJpcCVti9rPwvJGPnGoipp6KMX23WfGEITUPTODlJJ9DaEBQPgL4ECM1qyb757dlSkPREFOQtdLvDRUpniGHY8C3UjHWcpLJlGR/AjpdTo15VsAh+uP3i3jK+DBoCR7Fec5oHkxN5ahwE2OFkHJIzqkyqVG2g/x9cCp/ULQuYLs2guLoTvFHYGnTCG3UqP6JcpDfnSjPAPp7i3xs8/STR1cMQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(86362001)(478600001)(33716001)(6486002)(186003)(44832011)(8936002)(6512007)(26005)(6506007)(6862004)(9686003)(316002)(6636002)(6666004)(66946007)(38100700002)(83380400001)(66556008)(82960400001)(4326008)(2906002)(41300700001)(66476007)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8/0ZGoqc3Sduj5s4MdEO47KzS7jHWdie6jF11yqrMNKHwB01/lbdM5mlUU?=
 =?iso-8859-1?Q?QVQys23oZZJAWk2XhTSLSdCeiZuXXs8Fl4zfBm4qiYtd0GrHsCd4sxvCbp?=
 =?iso-8859-1?Q?0OnBM/2qRYbbohO0kaCmW9G7KMKA3noYpF8LkPBgaIubemW7OgBo4FArTl?=
 =?iso-8859-1?Q?A3goShuYOffSrcESh53Q0KaNE6S0n5EeV2qoTirJhReJ1Vk8ie//KS59ZB?=
 =?iso-8859-1?Q?pNcORLnma1CMzN9DcXrY2CtP3CcRfrGU/9IpnakcxrrLzIf41c9hst32JZ?=
 =?iso-8859-1?Q?W4Xy+VntXykxt8lqzU4Bxbb0TBkIGUcamhbPziPm9ZI/A19FJYP9shFebf?=
 =?iso-8859-1?Q?RYcOl5t4D/c/mv/Kva+gV1FYcefFVUV8AhVLbHld0sh+iE3p5JNGtVdwng?=
 =?iso-8859-1?Q?aQfEdUMFVY+olaGEj6SR29huL2YuOSuu4Kn8BgjX0GmNVRSqh1/162hzid?=
 =?iso-8859-1?Q?XiX0MI+vSjFJGSJ9WC06tmtepGWHkLabMvp4ssuhmVlW7MxuM3T5kGeZIA?=
 =?iso-8859-1?Q?ZoVxdpz9zTCqZRDozrktKrYkrvIeBn79wKNSjJ/JiNt7dRi20S9Hj8pkJw?=
 =?iso-8859-1?Q?z2drgb+4+GgqC4AopPpI3Rg2TmR1R0ocB7TWKC1f7J2vzZgJ7f2hd3TJXN?=
 =?iso-8859-1?Q?tw0eV8xzXd3rGjKxMcfZc8+hcV+2jBLHzEb4U8hTrInbshQ5xdmSpj8ZTZ?=
 =?iso-8859-1?Q?W73R7yd4ga27sW4elED6/owk+mtneWx3h0g3+Xh0OdwOVLxOZyfIICtguR?=
 =?iso-8859-1?Q?0xC8QLBz6IDnEie3k5S1fh61WbKPCO7H+/MqoKK3vn28p1PRJX7jEOOz/m?=
 =?iso-8859-1?Q?aG1CFBKD/e33UHsrL/5aPDN5pfaAGNRpzs3CDWrpl6Qta4lwIR5M6VQA+C?=
 =?iso-8859-1?Q?e6OCb3SQWSG3FqrgzwzJYRFz0Ur13xJsNup1oWIQGa1F05fKobjFSr6Tjj?=
 =?iso-8859-1?Q?qqGqbXLRzvj3qbFGoA6vsVbOOz34RmormQ2Qf2pgtaDMQJUx7VOiaX74Tm?=
 =?iso-8859-1?Q?9CJjy5yHJnqvut50gPoidz+OQGTYC7vqiLWU7nvqV4xzuIKFO3QQNBjFA0?=
 =?iso-8859-1?Q?CuPUPDO6QwtmzruJFrd2laBz+GtNPv1QJUh8nzImJmXJek9k4kf7EsGsJm?=
 =?iso-8859-1?Q?Rmg2PQ+G/SEbGwyTgZQv1oukgSSg0kCwGe5pvkFrLLwl2HIv6bhzOnQeRn?=
 =?iso-8859-1?Q?LyoIn3eIPj+ngURhDiMGS3GAYRlaZhLsRUY89UU8h1fuZ6xbZVBDYjdKso?=
 =?iso-8859-1?Q?Ua3svHrGuOK9aJUgE93/wZAE6B9hwBYuhNJb9kOi5DK2cGt7OS/EtbjJZB?=
 =?iso-8859-1?Q?Lxv7obOFgWVT//nB/yNcKHs5d3zHdaxpAitUK9h1t/SBhwFDvg1QYztPwM?=
 =?iso-8859-1?Q?IEXGOtOM8Dziz06YHsryEspBPbq/CZK33XKPuc78xVjWTGKPMH7k28yz1r?=
 =?iso-8859-1?Q?+RpN3NMhq5d6GBwEebhISJYgc1FmyS69HC9NHj2PJwL8rVbvBcVmlczpsC?=
 =?iso-8859-1?Q?D0uJqkNF/uda9oDv/WTztFl/mRg5oBLS+aI8b2I2nuycbtCh8HmeUMReF3?=
 =?iso-8859-1?Q?qR5wQo5Dd89vmuIK3VCe6/VOpLaKJD9GjKE0qBijWQ+hVsDfZ5QQOFRRFa?=
 =?iso-8859-1?Q?HCrLiOixn1ZiJpzaRnjHfRVO+qduPSdPto3XcKtFMh6VwaKkclbO6JiBH5?=
 =?iso-8859-1?Q?ZiaoxC3cgV2iAOOVYcM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da26204-4793-4491-4f68-08dab2bd78e6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 17:06:47.4518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owcFJzSzMhvhdWLtOeiA+EyAGD0zjjzRBR6Maj9r3akRGLlX3NBrAr2H9TtMfP+COyDjMpftV6WjlYCx/QJ2xekx5bicxDEYsUewmxJ6sURYZO1vZeWtVo00g4STl4lJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Thu, Oct 20, 2022 at 05:39:46PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Handle persistent (VM_BIND) mappings during the request submission
>>in the execbuf3 path.
>>
>>v2: Ensure requests wait for bindings to complete.
>>v3: Remove short term pinning with PIN_VALIDATE flag.
>>     Individualize fences before adding to dma_resv obj.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 208 +++++++++++++++++-
>>  1 file changed, 207 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>index a9b4cc44bf66..8120e4c6b7da 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -3,6 +3,7 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>+#include <linux/dma-fence-array.h>
>>  #include <linux/dma-resv.h>
>>  #include <linux/uaccess.h>
>>@@ -19,6 +20,7 @@
>>  #include "i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>+#define __EXEC3_HAS_PIN			BIT_ULL(33)
>>  #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>  #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>@@ -42,7 +44,9 @@
>>   * execlist. Hence, no support for implicit sync.
>>   *
>>   * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
>>- * works with execbuf3 ioctl for submission.
>>+ * works with execbuf3 ioctl for submission. All BOs mapped on that VM (through
>>+ * VM_BIND call) at the time of execbuf3 call are deemed required for that
>>+ * submission.
>>   *
>>   * The execbuf3 ioctl directly specifies the batch addresses instead of as
>>   * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>@@ -58,6 +62,13 @@
>>   * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
>>   * vma lookup table, implicit sync, vma active reference tracking etc., are not
>>   * applicable for execbuf3 ioctl.
>>+ *
>>+ * During each execbuf submission, request fence is added to all VM_BIND mapped
>>+ * objects with DMA_RESV_USAGE_BOOKKEEP. The DMA_RESV_USAGE_BOOKKEEP usage will
>>+ * prevent over sync (See enum dma_resv_usage). Note that DRM_I915_GEM_WAIT and
>>+ * DRM_I915_GEM_BUSY ioctls do not check for DMA_RESV_USAGE_BOOKKEEP usage and
>>+ * hence should not be used for end of batch check. Instead, the execbuf3
>>+ * timeline out fence should be used for end of batch check.
>>   */
>>  /**
>>@@ -127,6 +138,23 @@ eb_find_vma(struct i915_address_space *vm, u64 addr)
>>  	return i915_gem_vm_bind_lookup_vma(vm, va);
>>  }
>>+static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>+{
>>+	struct i915_vma *vma, *vn;
>>+
>>+	/**
>>+	 * Move all unbound vmas back into vm_bind_list so that they are
>>+	 * revalidated.
>>+	 */
>>+	spin_lock(&vm->vm_rebind_lock);
>>+	list_for_each_entry_safe(vma, vn, &vm->vm_rebind_list, vm_rebind_link) {
>>+		list_del_init(&vma->vm_rebind_link);
>>+		if (!list_empty(&vma->vm_bind_link))
>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
>>+	}
>>+	spin_unlock(&vm->vm_rebind_lock);
>>+}
>>+
>>  static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  {
>>  	unsigned int i, current_batch = 0;
>>@@ -141,14 +169,108 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  		++current_batch;
>>  	}
>>+	eb_scoop_unbound_vma_all(eb->context->vm);
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_lock_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int err;
>>+
>>+	err = i915_gem_object_lock(eb->context->vm->root_obj, &eb->ww);
>>+	if (err)
>>+		return err;
>>+
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link) {
>>+		err = i915_gem_object_lock(vma->obj, &eb->ww);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>  	return 0;
>>  }
>>+static void eb_release_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma, *vn;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	if (!(eb->args->flags & __EXEC3_HAS_PIN))
>>+		return;
>>+
>>+	assert_object_held(vm->root_obj);
>>+
>>+	list_for_each_entry_safe(vma, vn, &vm->vm_bind_list, vm_bind_link)
>>+		if (i915_vma_verify_bind_complete(vma))
>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>+
>>+	eb->args->flags &= ~__EXEC3_HAS_PIN;
>>+}
>>+
>>  static void eb_release_vma_all(struct i915_execbuffer *eb)
>>  {
>>+	eb_release_persistent_vma_all(eb);
>>  	eb_unpin_engine(eb);
>>  }
>>+static int eb_reserve_fence_for_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	u64 num_fences = 1;
>>+	struct i915_vma *vma;
>>+	int ret;
>>+
>>+	/* Reserve enough slots to accommodate composite fences */
>>+	if (intel_context_is_parallel(eb->context))
>>+		num_fences = eb->num_batches;
>>+
>>+	ret = dma_resv_reserve_fences(vm->root_obj->base.resv, num_fences);
>>+	if (ret)
>>+		return ret;
>>+
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link) {
>>+		ret = dma_resv_reserve_fences(vma->obj->base.resv, num_fences);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int ret = 0;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+	assert_object_held(vm->root_obj);
>>+
>>+	ret = eb_reserve_fence_for_persistent_vma_all(eb);
>>+	if (ret)
>>+		return ret;
>>+
>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+		u64 pin_flags = vma->start | PIN_OFFSET_FIXED |
>>+				PIN_USER | PIN_VALIDATE;
>
>Should we also add NOEVICT here and in vm_bind? Or is eviction somehow 
>still desired in vm_bind world?

Yah, we only check above if there is mapping at vma->start, but not
the whole range. Will add NOEVICT here and in execbuffer3.c

Niranjana

>
>>+
>>+		ret = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
>>+		if (ret)
>>+			break;
>>+
>>+		eb->args->flags |= __EXEC3_HAS_PIN;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>  /*
>>   * Using two helper loops for the order of which requests / batches are created
>>   * and added the to backend. Requests are created in order from the parent to
>>@@ -160,13 +282,80 @@ static void eb_release_vma_all(struct i915_execbuffer *eb)
>>   */
>>  #define for_each_batch_create_order(_eb) \
>>  	for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>+#define for_each_batch_add_order(_eb) \
>>+	for (int i = (_eb)->num_batches - 1; i >= 0; --i)
>>+
>>+static void __eb_persistent_add_shared_fence(struct drm_i915_gem_object *obj,
>>+					     struct dma_fence *fence)
>>+{
>>+	struct dma_fence *curr;
>>+	int idx;
>>+
>>+	dma_fence_array_for_each(curr, idx, fence)
>>+		dma_resv_add_fence(obj->base.resv, curr,
>>+				   DMA_RESV_USAGE_BOOKKEEP);
>>+
>>+	obj->write_domain = 0;
>>+	obj->read_domains |= I915_GEM_GPU_DOMAINS;
>>+	obj->mm.dirty = true;
>>+}
>>+
>>+static void eb_persistent_add_shared_fence(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct dma_fence *fence;
>>+	struct i915_vma *vma;
>>+
>>+	fence = eb->composite_fence ? eb->composite_fence :
>>+		&eb->requests[0]->fence;
>>+
>>+	__eb_persistent_add_shared_fence(vm->root_obj, fence);
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link)
>>+		__eb_persistent_add_shared_fence(vma->obj, fence);
>>+}
>>+
>>+static void eb_move_all_persistent_vma_to_active(struct i915_execbuffer *eb)
>>+{
>>+	/* Add fence to BOs dma-resv fence list */
>>+	eb_persistent_add_shared_fence(eb);
>>+}
>>  static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>  {
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int err = 0;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+	assert_object_held(vm->root_obj);
>>+
>>+	eb_move_all_persistent_vma_to_active(eb);
>>+
>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+		for_each_batch_add_order(eb) {
>>+			if (!eb->requests[i])
>>+				continue;
>>+
>>+			err = i915_request_await_bind(eb->requests[i], vma);
>>+			if (err)
>>+				goto err_skip;
>>+		}
>>+	}
>>+
>>  	/* Unconditionally flush any chipset caches (for streaming writes). */
>>  	intel_gt_chipset_flush(eb->gt);
>>  	return 0;
>>+
>>+err_skip:
>>+	for_each_batch_create_order(eb) {
>>+		if (!eb->requests[i])
>>+			break;
>>+
>>+		i915_request_set_error_once(eb->requests[i], err);
>>+	}
>>+	return err;
>>  }
>>  static int eb_request_submit(struct i915_execbuffer *eb,
>>@@ -483,6 +672,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>  	mutex_lock(&eb.context->vm->vm_bind_lock);
>>+lookup_vmas:
>>  	err = eb_lookup_vma_all(&eb);
>>  	if (err) {
>>  		eb_release_vma_all(&eb);
>>@@ -499,6 +689,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>  	/* only throttle once, even if we didn't need to throttle */
>>  	throttle = false;
>>+	err = eb_lock_vma_all(&eb);
>>+	if (err)
>>+		goto err_validate;
>>+
>>+	/**
>>+	 * No object unbinds possible once the objects are locked. So,
>>+	 * check for any unbinds here, which needs to be scooped up.
>>+	 */
>>+	if (!list_empty(&eb.context->vm->vm_rebind_list)) {
>>+		eb_release_vma_all(&eb);
>>+		i915_gem_ww_ctx_fini(&eb.ww);
>>+		goto lookup_vmas;
>>+	}
>>+
>>+	err = eb_validate_persistent_vma_all(&eb);
>>+
>>  err_validate:
>>  	if (err == -EDEADLK) {
>>  		eb_release_vma_all(&eb);
