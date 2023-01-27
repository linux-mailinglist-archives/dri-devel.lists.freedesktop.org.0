Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C3F67DAB7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1F10E07E;
	Fri, 27 Jan 2023 00:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3286F10E07E;
 Fri, 27 Jan 2023 00:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779069; x=1706315069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3zvtwYkF4x7JR7GfQTB42xEiRF1GORKuIqha6xtK7kI=;
 b=F64kj5XHu24bpT7+cb5LaYVLvJ/WG8qlp3vSkC0Ih9+QOsMDBonPDOYS
 wCYtji87CjOnMF6qnWz4f11pWnFXF4gX0d5DKCsDnCjWLMNBhmSMmFUY8
 E+aUx/E+kfosV+fTI+3MrxWso1RiY4At9ZEVqg0+R+AmliOi7zaplvHGp
 aCtYErD7PA7RCGMYbkCjMJPBpONIMePZKRaY9FQHwEL0iGvRoHXXmtnZu
 PfjPZ4AyB4r6Kuijnux2HUMlg6J+M0mz0/QVjwkAFRc56Q0BQrKf4zxJf
 oUE0k/B/QBlKx8KTNxSint/etyVSaCJ+Ww7blEEmpLdLcnpEV/O6Ll9yT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327014019"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="327014019"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="836946653"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="836946653"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 26 Jan 2023 16:24:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 16:24:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 16:24:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 16:24:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAjAswiuoMZJ3wEB5ZeaiTPa0/W6WtZXZspyjZNuV79pekIcF2UKgjIGltp9mH9uLmBdAqLlWRDUplhqB4oX8fkJvMM04yK5ampyxy/bpLl06f0aOh/FxxXC22MRLjfPqkehrKL13JlGI9VfIvFyn2hnp5RGuuoRepQyO2Hcj0z0IqbpHmhc2zHLB/7CWPd2XYhzoi9vXCszKqmEFZQNgOs/6pzrr9VfFrOkckwQshR3YSCO5L3PoRdywHXgv3LJKuamvQMMKO8ivFTdAooSfoM0ChG3jRnlAEmokUHlYVEjxLkkfN+HFMCYR7F0UvM695ne3qVYDIPcA+sK26AkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PteN60NkqZbaSuuc3uIbPxASLYzRmaC00Avw5HErIPE=;
 b=hCMfcDd7Vnsu/+6wZviQUc55n+QkEK0AJUMSsWv6X5pxm7hKYy/T0Y69D4QeZpCw3mswxCp72WHKAj3aQsmzbD9kCSw9InFvs3NV21EwkT2Nz9AhDA+fvLDjBQlXhRKNkwPN7FZV4gOJ2comyKxP69OYEAaTcuKzndg4D0kPpo+guyOVt+CMt4NT0YFSY9sfaJgGekwPv2goSglOiebJ7/xS+uC1PXPy8xOfKopSnuecTJ+x6czlnYajz9hrfPj4leB2+Anesnn+ve2wLnon2Rl0cLV6rCMET2WvdIbCOd7mGOP8mSCRDnWSi2bmYjDOi1OlY7mlBY1C6uGwCi1+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 00:24:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 00:24:26 +0000
Date: Fri, 27 Jan 2023 00:24:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <Y9MZp2Uu2xwVBO2d@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230118061256.2689-4-dakr@redhat.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: e50b4d91-34d2-486b-17ff-08dafffcd8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGiuipUQNQ86KXDn7aJtr2eFkHFQpjUkkDkM7rYHP0qKcNOlYm4e7OUBzfNODGfU4h4gsrWf8Rw0cyVELQ6hCUePh416C++pbQf4pRRZtOZZ6XtYtgIMUFOJI6zhxxc9UITfZ3DUTsM7Cd51oCLMpy6RkUUb3kgdFPBGzCy20u/Kg+bVL96L5l6n8CdODfW6pqW4N82tX8uZ6UjX9D8NiLOKbyB5YANUOG71M7Ix7pRUxh3g5JNl7nj9ox/seCnA8l8ZPVJw/wXS9jN571b2bcS+n269olun4fSo9bHhz1K7fUodArUDYx2wAJ950/JADlYuGLsuvH1MYXq0mNDbbpP20IoQkJIqDV2nM37cfunpxPfMhvA9IDr+BvDESr0kGR3C5tbkc0QrEwEj8Ikf8EjFdzqK1JrwbRC3r6uIkdHk0euqTlCjMKFPw6noUoRbTn+JJZU/qIG5Y05ucH98ACxiEiJhv0cpf8dDExFppf6m2kkxonpjhN858gjI+ZHON3SBQSbjga+frLDK5z91dax85GDiVoBkDhAD87ySS1EkTSj4raVf3+evl2dOVNape2x4ET52lx90I8ia5fAbvYkbXwz8cQt3xhrUAXoDjzRNBYzYG7Fhg7lKW5cDiZgcdgevX8LXr1mAoNyQ/8VFHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(6512007)(26005)(186003)(83380400001)(38100700002)(82960400001)(66946007)(66476007)(66556008)(86362001)(4326008)(316002)(6916009)(6666004)(8676002)(44832011)(41300700001)(7416002)(8936002)(5660300002)(2906002)(478600001)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E11jKHbZFSqLEuYSu7einEMcE5dZarm4mWv6eC2IksHXB0C1rMeJcH4EVgv2?=
 =?us-ascii?Q?2wZiRxGBAJwrN/jjJ+NrRdGr/qMrLHMRl76+RyU2mWatwtWD2R4OFuOhXc2b?=
 =?us-ascii?Q?I9cUkk2SgounC95oHt27bf0XOYGL48Oa7HkFFU85hBfdbE02anlmLuxU9oYP?=
 =?us-ascii?Q?UZS3I/q1hC2TVODZWVDKZ8C95w4wTn9YHUmtCrRg/lQxCT390mQoQdSbf/sf?=
 =?us-ascii?Q?d2+UQUu9kJ3LOUV0VfPND/GdQv6eBbcEiaaWj5Rsk/+YslHyekFx0fhXjpX3?=
 =?us-ascii?Q?SEbajXZ5FWFcPDnEABpwnQPkY8pLCIfW1gjHSaENxqd6JLFOtCmF5fVIQKbq?=
 =?us-ascii?Q?iu3b3nbt4QybD/6L7oPFYyfUoududndQyhLW0As4cKSd7B4aLiJACv9hy55y?=
 =?us-ascii?Q?b78DouA4M/1p7tmAPdW6gzBaR+qR4+JyzkHIJmY9IlfyJ7BhVu7BTFRIAFAh?=
 =?us-ascii?Q?TpXI4YOnclLlqTEDS1aTW9v6gO5zwlSdpF2p5j1/EjBLM9dUz3MTmbwSJnz9?=
 =?us-ascii?Q?A2zNqBfJZalrNU7ZLqHAy7DDXoPU9bjTZMPDvybs2BeSnHNYunK3bfXbhuIu?=
 =?us-ascii?Q?5w25+jDBFqL0QVHTaiJZiTnw89TG4ujnnNWEcY8nTETahxq1cT2uOwwno99z?=
 =?us-ascii?Q?xpPMyog6hXcWHiHTGMxB8OARPCoQQmcqja7LmXxGS/Nk7Htx6UAVo5N1LEgM?=
 =?us-ascii?Q?DU3QRMQ6+LcSQg2XfQf+CumhU/4DtRXdWsSaMnA3Ll4Kig3nmF6cGzaVcPIw?=
 =?us-ascii?Q?W8F6nTE6PvTXchziDQo6pyfw+y0oSXMBM3Y2p+FQaP+05lI+vMfImKeR6VNb?=
 =?us-ascii?Q?3qQV3CG06iuhc3EXfKBw8ebiBSFxSaCFC/FmJxeIRvWYvcrlmdca/rzwkOzu?=
 =?us-ascii?Q?0Y+9oti5zI6b1jc7xHM72D6le3bz2t+Ntdc6jFNoOnqCZVL7GRGEXQU5EYLW?=
 =?us-ascii?Q?bp8IabudLK6NrIZROX8o+hvLaUYh7sKSBz91aKR5ktyyBXTgP3fxe7ZV7aye?=
 =?us-ascii?Q?gfCbw5FrZIO8WXPZTKchQflFrZhTXaBlzGhr0ONQdka9aqS+psqyNXATR+tw?=
 =?us-ascii?Q?rQPG9MAsE+104zgP3Mo6gjy/dbKZhdL4TG+UUpQDIFsEuzUc0liyvv3WKaRt?=
 =?us-ascii?Q?j14srGFJ4ha407b4BX+dJg7F7v+YPR2+o8CMZVfOvgDcsMRMoInpgxBtC/Tv?=
 =?us-ascii?Q?SGMQ1AkkivKRhJBMU4nl7HVjS6MdWYDVm4ayP4wkdsKwmXpRrsakifZFUwcR?=
 =?us-ascii?Q?2jQ7fqJG36wnB0aww/AeaVRw4MXyVEU8cGEyS1Cx2BeQ3DEdXGcTEuVn7bxm?=
 =?us-ascii?Q?n17VsS+5281t1Jp4AEOP8CCbbQIwEgN+cKEkEkfBiPgm6xbzZthQRLOEj8rt?=
 =?us-ascii?Q?oP7ii5MkDEFkQNfUW5L8/DOQhtV09b93XLMq5PI6hILuRrHq6VW9GlRSJCp9?=
 =?us-ascii?Q?thPXfLxhkUrxnz04H10RTsrDX/wCDnyHfYAsgp3uehG6Ai15K2o0Wr3OaEj+?=
 =?us-ascii?Q?L/hsJ09tB1pkOfsu08B2VWBqn6706zTsoRGJR+PVEy1oSBjDPkERjNoZhgBy?=
 =?us-ascii?Q?jNpg4TtJfqOEQYkst8g0AYZIVJSC5AlJjIsSaUpscMI5jx2Rmxfx3Xiu1ulj?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e50b4d91-34d2-486b-17ff-08dafffcd8bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 00:24:26.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8LykEEOevq5DqXOr+UngHl75gvY5DB2a2MJzPvCF+p8rzfp8812zpVxSgwQfAokD7v5r/LqFC6A5KrMkbCyKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
> This adds the infrastructure for a manager implementation to keep track
> of GPU virtual address (VA) mappings.
> 
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
> 
> 1) Provide a dedicated range allocator to track GPU VA allocations and
>    mappings, making use of the drm_mm range allocator.
> 
> 2) Generically connect GPU VA mappings to their backing buffers, in
>    particular DRM GEM objects.
> 
> 3) Provide a common implementation to perform more complex mapping
>    operations on the GPU VA space. In particular splitting and merging
>    of GPU VA mappings, e.g. for intersecting mapping requests or partial
>    unmap requests.
> 
> Idea-suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

<snip>

> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c

<snip>

> +struct drm_gpuva *
> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> +	       u64 addr, u64 range)
> +{
> +	struct drm_gpuva *va;
> +
> +	drm_gpuva_for_each_va_in_range(va, mgr, addr, range) {

Last argument should be: range + addr, right?

> +		if (va->node.start == addr &&
> +		    va->node.size == range)
> +			return va;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find);
> +
> +/**
> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @start: the given GPU VA's start address
> + *
> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> +{
> +	struct drm_mm_node *node;
> +
> +	if (start <= mgr->mm_start ||
> +	    start > (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +
> +	node = __drm_mm_interval_first(&mgr->va_mm, start - 1, start);
> +	if (node == &mgr->va_mm.head_node)
> +		return NULL;
> +
> +	return (struct drm_gpuva *)node;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_prev);
> +
> +/**
> + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @end: the given GPU VA's end address
> + *
> + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> +{
> +	struct drm_mm_node *node;
> +
> +	if (end < mgr->mm_start ||
> +	    end >= (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +
> +	node = __drm_mm_interval_first(&mgr->va_mm, end, end + 1);
> +	if (node == &mgr->va_mm.head_node)
> +		return NULL;
> +
> +	return (struct drm_gpuva *)node;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_next);
> +
> +/**
> + * drm_gpuva_region_insert - insert a &drm_gpuva_region
> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> + * @reg: the &drm_gpuva_region to insert
> + * @addr: the start address of the GPU VA
> + * @range: the range of the GPU VA
> + *
> + * Insert a &drm_gpuva_region with a given address and range into a
> + * &drm_gpuva_manager.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> +			struct drm_gpuva_region *reg,
> +			u64 addr, u64 range)
> +{
> +	int ret;
> +
> +	ret = drm_mm_insert_node_in_range(&mgr->region_mm, &reg->node,
> +					  range, 0,
> +					  0, addr,
> +					  addr + range,
> +					  DRM_MM_INSERT_LOW|
> +					  DRM_MM_INSERT_ONCE);
> +	if (ret)
> +		return ret;
> +
> +	reg->mgr = mgr;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_insert);
> +
> +/**
> + * drm_gpuva_region_destroy - destroy a &drm_gpuva_region
> + * @mgr: the &drm_gpuva_manager holding the region
> + * @reg: the &drm_gpuva to destroy
> + *
> + * This removes the given &reg from the underlaying range allocator.
> + */
> +void
> +drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
> +			 struct drm_gpuva_region *reg)
> +{
> +	struct drm_gpuva *va;
> +
> +	drm_gpuva_for_each_va_in_range(va, mgr,
> +				       reg->node.start,
> +				       reg->node.size) {

Last argument should be: reg->node.start + reg->node.size, right?

Matt

> +		WARN(1, "GPU VA region must be empty on destroy.\n");
> +		return;
> +	}
> +
> +	if (&reg->node == &mgr->kernel_alloc_node) {
> +		WARN(1, "Can't destroy kernel reserved region.\n");
> +		return;
> +	}
> +
> +	drm_mm_remove_node(&reg->node);
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_destroy);
