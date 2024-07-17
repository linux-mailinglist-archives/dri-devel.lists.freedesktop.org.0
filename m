Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5E693426A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 20:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E449210E342;
	Wed, 17 Jul 2024 18:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNIXMtDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135CE10E342
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721242260; x=1752778260;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rbqRhOgbs+XDdrYvfh5QbE07slklY0PJoSccyVjm57k=;
 b=iNIXMtDFcIATmMaf7MqCMumc+VdlS5XiOBOgNIvLGLC0xcrg5WWAAu9l
 QUmw6xnDnWncNxeCCOEjIp3oWhhmh5eyUlQySRUtA2s1qj6nGTur7vxnK
 GPPxFhdZuKe5fkRDYXFkmjwiFy+7agDkjIdWSDMHpQWTBbdwnnx/r6NkD
 Db1eXpbawLgW0MCsnux4MZXLireg4iAI2qRhT7OqbwyZOO3sVFASyCKh0
 jQIMStyiI3QjXUZY1YwOvSbbhkxjfy/qn4MzHni/Sy80yscGzuyrGEz96
 JPHBkvtmmQutxSOGK/+8PxzhZYoY54UVW7EFRGRG+Kn77xLd0yMGN7KFT g==;
X-CSE-ConnectionGUID: Vdqk/iOwRsy69QpsiqzfAw==
X-CSE-MsgGUID: jgaxpPQTS+uy6d4qE/M57A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30177021"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="30177021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 11:50:59 -0700
X-CSE-ConnectionGUID: Y+Shwi9BT6+SqQKJiFJThA==
X-CSE-MsgGUID: GljURLTfROGfZ2u/2pZWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55630322"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 11:50:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:50:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 11:50:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 11:50:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRDLiS2vIqAOQL7bS4KNtpGndD7h3ji+tDNE0iNG21duLYkn7VNWhb96BZqMc6IbEclAsz8fygEfKthxCFVawav1Pj3w0bQoP4Ny+DOeRVhUzcxa0b9NGJ1egX5+6Dwr/f7+iqdOMXGqbpzk0ttZywF8ZyUCZ29REgmij1RvPj1G1NN0H34VFNOzZHUTm55kxXBYYvq+jnCCjB2a3kEG4spcQTuO5o0SikDLWVCfYR7L6FN529fhSHfJNOO/lFagI3jLMFOvVOx+3R+uFOCNVRialMcLEwtPsdTbbI7KIaRQMp+B618/Buefp5CtIDFeBCJRwR62WtAj1t1qkt5t6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo0htB9zVYCH0BA1EqQMQFb14wbprp45JbyInZpEfAU=;
 b=N7H8HMNPrm5+JJdLeccPJhN5AX1v/TB3UDPfTtIUuOY3slCOa7T++GTP9oiRN4YmcjQy66WLTFWlOrveY1bSPe3cq35AR4CGQtVc9pdys/7fm3r2YRxhuGkBx/iIxmdnVN4kzAPrwWgR64ym6xRD5o0Tp20WqwiFh9qc4kuTXd2ArWdRbVBiLuxu4/xsiNRK8bL3JTkR65+/uuKDQ/TUz3qvmASVluWK01VsKxTccjdKpJH0bC/qYkfVX0G92p0RCCNa505+OKTFFIDM/JWwZMx5JJS70TrHJ0+aDrVYKhQ14FmaxZzJ7JyBF/mfXrOV5pkp/QwfvDWt4v6O7GCWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 18:50:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 18:50:56 +0000
Date: Wed, 17 Jul 2024 18:50:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/ttm: use GEM references for VM mappings
Message-ID: <ZpgSXf2yqZChSE+9@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-9-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716123519.1884-9-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ddd228-2d6c-42f6-4a1c-08dca6916453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h57GIHzcIVboNs5G5xDKWJuI6SqGrqJPAoufg38PlVggMsWyPgoAFlPh9W?=
 =?iso-8859-1?Q?4v6VsZP+zHpcCmmllcGCHMfxirMKmFYsdOcOEAZ3F73IFJSk+mLG/GJMEW?=
 =?iso-8859-1?Q?FlVvxXfxz7BqzQXo0MT/aLF6TpJuv+ks61ySSfMbWvSjrnybmvnVzIQ1XG?=
 =?iso-8859-1?Q?Zb9rRmiI6K0zIWQwvcky7zN/wGjFacGsrSD473MkniXmW6j7tB8lzebOe/?=
 =?iso-8859-1?Q?GhslqTEgzJ+Ect3UCf4aE4GRwaWhgWPsirvi+qp/pgPN98ipkGGNKjsXu9?=
 =?iso-8859-1?Q?CFRL+1hZxK+pkG5acI5gnhNlJFmyt9ppGI94YnYANhdKadkKQfuCBsMC4/?=
 =?iso-8859-1?Q?3U7xwu3u/zizOGElv0/sCZsgw5epUY0/1rDDEBOvtCmtuR+uQ07zhdYqbQ?=
 =?iso-8859-1?Q?OjEjZUUbdhGulq+NTnc0KHp7CjUErfLIrEVud80j06oBEIcsaEP7uP5CaK?=
 =?iso-8859-1?Q?PRQoqwL1nVTahI0/HBAQXEXAXWiAUgKgCXWk3jp53ce7KsM3SdcfXtOmG/?=
 =?iso-8859-1?Q?z56JbMV4z2rgGAGvaqq/c51lLCPXDpAGwlv/vZB8FzrRwwFrLiDVEFsCkg?=
 =?iso-8859-1?Q?zwLqHHZiLKZwX6KuITHlYavIZ7JiIF4dy/ikf+pe1v5NqwW6rsb/P4KTv+?=
 =?iso-8859-1?Q?Z2vBpSCzqQhrTEva4J6S82gYUuP9mqBFtj0EKOVz71Bvtkd4G8zlXCSCZm?=
 =?iso-8859-1?Q?aQ5NIDw0G3WGB3xooZ4aKKFyqmRbm4Itn/L4Pg6Ldk4ZtiwnDLyj35+cmj?=
 =?iso-8859-1?Q?VqqT3rvfS9+RYfR+TbkYu1l1d1R3inV31xZwmK1Qsl21miMGqJu4IdRF/g?=
 =?iso-8859-1?Q?zqQUtLjP+XoAP3CqixbfuwHXRxAaKGMBqOlezVKrbFfkxgVvSMGoLGkbKR?=
 =?iso-8859-1?Q?Y/dGpUPEEoYilDWU/+g8PJ84Hwesy9uEKSbwUCaXsWRL6V/vecOGXJJp8h?=
 =?iso-8859-1?Q?XIyNwFUJlM/j1Y9ALKS/9N3FM8ByEWRNucrB1TnOfBi5tRG3+62/9fzP7X?=
 =?iso-8859-1?Q?Z6k7bQeFKlzQp443SPRFJT3gHSu5pnCmLD5BXzZv8YDn8Jufq75vsuay4Y?=
 =?iso-8859-1?Q?TuXoqZ6yxSWHykEBiYRZUtW+9NoU7oiyWLGudlPqPI8pvLbrbvZDu4q2Aj?=
 =?iso-8859-1?Q?rt9zXX+LGthhP0XymqvvJtqNAVqL5LZFe8kkEV1ZNfIkX4K9E4W+LR4m42?=
 =?iso-8859-1?Q?/f1n0CmxLrMaBeaKYpthBSHyqIAYFib4Y33EfsR/sS8b5bm2DOwxTYT1r/?=
 =?iso-8859-1?Q?2r14bXusMy7LH7hhAi4HOhE4bpgVaY0cGGY83P5xrHDizS1aXb+gafq2f/?=
 =?iso-8859-1?Q?ZNYSH3+DViyvFLKzIzu06XBFr4dasRLlcH/tInsSffqfRFVaj/JpBU6xR1?=
 =?iso-8859-1?Q?scfSQ4TMvboyEV9w/MhY2Y5z8iDBTAcQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UpCcN0O+NP6tL0wjqJ0untvBhc47e02dxkw6CJdPuwU5JiNlisZ9YKOVcY?=
 =?iso-8859-1?Q?ERICZQTFcEcBdn/Bpv4em9K2EGerU+OVL/QrmGOF9/OrWXhcX1Cvi/ka2e?=
 =?iso-8859-1?Q?ivciTQ7QwC2WyLVI3RjexBdakRygP4PqFDuZmmh4gFj2kYWR9JOykhkTkW?=
 =?iso-8859-1?Q?ACHRikgmx4TG5WUaksFw4+TYPIH02dUhA0WKKSZi0nDEisB4eyMGlgOuP3?=
 =?iso-8859-1?Q?jPtuatbj5G9/FwXYH6ZcSl1f9nUKnRGnJWpoLyuRep7FMQdBlVSmULQAkR?=
 =?iso-8859-1?Q?TbdXsnHuwuX5K6YnRSkoBMjsY5A8WEJJ9EvQqnA3Ip0mjYllrESb/Kq51g?=
 =?iso-8859-1?Q?5vA2QI9WCkGu+S1K4+UA1GIzBHN5sPHTjxin8G4IID7kW1DReSyUQ55FaI?=
 =?iso-8859-1?Q?oyZR5XfRE2CiLqWUwz5dVPRkI5CVehG/XrsWtlj9cL8ICxbMURbhJb+GBy?=
 =?iso-8859-1?Q?V9wKxoPvkkxSQorr3gZnRXJAFNN+J0Zh/+10IKOt0ZIQNk3dhFzyPO4VzI?=
 =?iso-8859-1?Q?BHGamzf4ULRjy46LXHLbpc+pQorp/53UYwxjS4Q3YZ2Kmh2Jg/xSJJvxQq?=
 =?iso-8859-1?Q?rL3hgu5V/V51L9WIsKMYC7NHaGi/U+mUwI7Xb2ME9HbqegJeqweGrnU9ME?=
 =?iso-8859-1?Q?bxhCxi6JZNwsUiuPkShd3LHEpb1N5j60X7BMxv4CJMU+elSKqA5QVOuHFJ?=
 =?iso-8859-1?Q?F9U1fulRPaXYyOExskNzIj9qbnVPVfPtUcXrhDDaDtR1ZhRBl1Q5WyJxCQ?=
 =?iso-8859-1?Q?maD43SmfJI14q6SXtEtMUJP4bwIOzNxfmdhLhfFpyki4bUji0nNdKE0Aqh?=
 =?iso-8859-1?Q?q+v43mRYQ8xrIrlZV9NM6n/q5ixskii4y9i5uGEdOetvyr9Eg6YeQdkTWE?=
 =?iso-8859-1?Q?SReAushhdne6D44E+5KpjKSG78viy7i2IoFn+uyPuLnLuIKLg8Li/u00Av?=
 =?iso-8859-1?Q?iT1e82QxKnT7VmXmD38/+osrJD638nT/KXxYuPJiojU9N60qbbKlf8hg2+?=
 =?iso-8859-1?Q?iCV62zRDfZcHd0933PzrUQ4gsFcNryYy+CJCPVkUs2oxEb0SxlrSpvnEXY?=
 =?iso-8859-1?Q?7yDPTpIh1H0K1yig2vYkYu1yl6XNXw5iWcVGc4AokwUUAIqMwYSOcRVU5U?=
 =?iso-8859-1?Q?CCsd3qCJelNnsbf5kZheU6fYxnpIgI25++5PnrJRiUXXbKfTW6b12Fve6L?=
 =?iso-8859-1?Q?9qriPnFUJae/wfatAEFcJQt15FrSsrDzAh66yp4fCZeS59OANx6iEHgVVw?=
 =?iso-8859-1?Q?sUkOhR7/GnrzPdtLoa5SZUDw4GxF7pDJmRVEr04B6zx9pU7faN03XsfIQr?=
 =?iso-8859-1?Q?j4Kz7bwFJmRd7WRYybiEH7NUb6nlI95dFpEKFhXA4ceMhBdOzgv/K1k0G3?=
 =?iso-8859-1?Q?mYYqbuJIetHPlK+iW+wHSxsEk205Xs8NPa3Aw+VaUklRh46ggXCyLDjwWa?=
 =?iso-8859-1?Q?KO8cvpQoiXwiE1c1JfKlR1RpZCwDiCK4exBCstf1PzAZp8cQZP/iKk8eep?=
 =?iso-8859-1?Q?q/0gVF/Ab2+xeu4vfjfdKAZvAcc6RGtvy44l1vR2gsYQK7zAdPsEd75pMC?=
 =?iso-8859-1?Q?0U9QbywdF7cb8VKzyL332WzXMBkXRSJIzFqrPvDaKwzX1+wl1NN9Wkv8qJ?=
 =?iso-8859-1?Q?YekH7TXeET3vh6DJjlgTaM1E2qlvJzGGIn+jPy+OJCLqpnwYKmpAkGkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ddd228-2d6c-42f6-4a1c-08dca6916453
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:50:56.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFdYwve+5AhLQABLtg8zmfF4SgKORF2ciwoboYG/0DWSRmesXBTAoGc+UvwmvZ6VJPAO4bcTzNX2DhciQAGm2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 16, 2024 at 02:35:18PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary for a
> VM mapping.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 4212b8c91dd4..3f283b3433f8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -58,13 +58,13 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
>  		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
>  			return VM_FAULT_RETRY;
>  
> -		ttm_bo_get(bo);
> +		drm_gem_object_get(&bo->base);
>  		mmap_read_unlock(vmf->vma->vm_mm);
>  		(void)dma_resv_wait_timeout(bo->base.resv,
>  					    DMA_RESV_USAGE_KERNEL, true,
>  					    MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(bo->base.resv);
> -		ttm_bo_put(bo);
> +		drm_gem_object_put(&bo->base);
>  		return VM_FAULT_RETRY;
>  	}
>  
> @@ -130,12 +130,12 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  		 */
>  		if (fault_flag_allow_retry_first(vmf->flags)) {
>  			if (!(vmf->flags & FAULT_FLAG_RETRY_NOWAIT)) {
> -				ttm_bo_get(bo);
> +				drm_gem_object_get(&bo->base);
>  				mmap_read_unlock(vmf->vma->vm_mm);
>  				if (!dma_resv_lock_interruptible(bo->base.resv,
>  								 NULL))
>  					dma_resv_unlock(bo->base.resv);
> -				ttm_bo_put(bo);
> +				drm_gem_object_put(&bo->base);
>  			}
>  
>  			return VM_FAULT_RETRY;
> @@ -353,7 +353,7 @@ void ttm_bo_vm_open(struct vm_area_struct *vma)
>  
>  	WARN_ON(bo->bdev->dev_mapping != vma->vm_file->f_mapping);
>  
> -	ttm_bo_get(bo);
> +	drm_gem_object_get(&bo->base);
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_open);
>  
> @@ -361,7 +361,7 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>  {
>  	struct ttm_buffer_object *bo = vma->vm_private_data;
>  
> -	ttm_bo_put(bo);
> +	drm_gem_object_put(&bo->base);
>  	vma->vm_private_data = NULL;
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_close);
> @@ -462,7 +462,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>  	if (is_cow_mapping(vma->vm_flags))
>  		return -EINVAL;
>  
> -	ttm_bo_get(bo);
> +	drm_gem_object_get(&bo->base);
>  
>  	/*
>  	 * Drivers may want to override the vm_ops field. Otherwise we
> -- 
> 2.34.1
> 
