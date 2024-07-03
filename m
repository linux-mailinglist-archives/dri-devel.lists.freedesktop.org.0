Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7120E926923
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 21:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F810E990;
	Wed,  3 Jul 2024 19:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFafa7WZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD7B10E8E8;
 Wed,  3 Jul 2024 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720036126; x=1751572126;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g5COzU93rAH4b9D/vSRUDNg4NSb8DNzp8wjkfPtT9aY=;
 b=OFafa7WZSdBCPgg9tWCC3jbJjuthbGstyKbZtzlbDbJYaAMJGzFPBb5N
 a20mCcwADhFXE9lZYnRPD7+YUEtg9uoH2SbrzwslBciWKm1z3BuCsTWVW
 fl6x9v0R5DZitLQIWrnX0F+o+D6Zdb7BsSDV1aJnLjPib3ix5hMaOvRVa
 1U8AO20OK0wvc5PfmMdtRBkqc9GQIvT+bn4sEJbPhga8fnJopcDpDvSH+
 Pi2KkrHRvXTRnfKV9TL1I/SI6FIf6xPHcJyfFjxyxMg513ME/O7LRmRI9
 bZnsW8o9ZOmSDY9JChrj5QuwbZrq2OmvOJHB3qxvtWRcK95+pB4jKg5Jm Q==;
X-CSE-ConnectionGUID: i9ujmneUS5+M0hTKlBIGmg==
X-CSE-MsgGUID: FMS8khxeTyK7U33OE6Dbqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17424868"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17424868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 12:48:46 -0700
X-CSE-ConnectionGUID: O+pc3o12RQWz4ylCj+w2ew==
X-CSE-MsgGUID: hXTFoD7wRvGSsXDOIoapKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="50676263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 12:48:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 12:48:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 12:48:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 12:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2GyWtak4fza+3FYKcnvkzV1CyJ3Uhks4NLvQDoe9HBCElecJJ7uvDR/zX2eeseYeo+ZW03N7Doe0uA/BSOaQHpINKgyJ/eTFCWAGiVrc7mqouFlFNBwSepUJryqrCV5tv333eGjGbi8Sx9+Vg5LknvFOkDQ0YrT0Nf61cFVKKnWooMsSIm2zRnQ/23yfn7yjZR7y3m2utpdJi/sBSFpV5ZlG1TE/klWa2PeJfH+En/WgzDzV2tmR35tba5vn8YM75rRIJZ/bSAWUR9/3mm8eIsFEZf0Lz54upIFxMB2XOuBhXFu8hhQKGbhESvDbn0wsIXLCHDbneAtKPSLJ6f0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FwVl7VtAkOfgUVP5RoLVKtOMFFjByrFIrzMWE0sNHY=;
 b=NXGe9QkdSbpXY5xyzOHMWIIPC7c9XcEKBoeLL1971TyhbLJDd8H+5UBEuH5u6VgdL3HuNzdyHCsGSZJA5eJkOfe14qesRzh/GWMa6N+oKCPtSjqAYXMDRuXqhtS78C/YjNNHxdr/v8RdLXUf5CD+IcuCtPV9DxkULx0DJOUe97agxDHCrFXAUcDHkqT71QH2cfnT+DmGLpsNDhN4/xzMHYRzt2JkxgQ+bWAGRwMI6/X0bUtC9cS/oT8xbMiZjE3bRbWZPlQWTG6mA/rqYIxbsstaL6fuAUjtBhq3bI89FmB8cfi61F65BWrR+SnzwBUpXe+C3umrLXeBhd2TObM7zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 19:48:36 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 19:48:36 +0000
Date: Wed, 3 Jul 2024 19:47:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <ZoWq6bQPF8WguMFT@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-9-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1d09b4-319d-442a-33ad-08dc9b9920a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?j/Tvqw+nzUGvDW3sFZerRo5xMhs8FgkwTb81Qch25u5OlVw/mlEkVNPTCC?=
 =?iso-8859-1?Q?7fBZ/hvSGCij3fEDdxezGG+qQQwNclcAe6AcQ7/FJCJBvNjWdALJVp0WZK?=
 =?iso-8859-1?Q?3BorVILF+B9KAYnJKArtF/OLM+22IYfNqHKwKB9a6JMBeyfOUeTDp32NtB?=
 =?iso-8859-1?Q?aZkmL63xb8JRrOg/4ZiBjRhcQREAmHFJH44gnYt/cHI6+RRJkxw4B42tX5?=
 =?iso-8859-1?Q?hB7Vua3fGYJ3RwBbRZGc+yXf9ebFKmpGhQDbbelBZKO/J4QwGNsIgoJqzw?=
 =?iso-8859-1?Q?I+D2oKV5lA1B2dwv3HPNVRQF4Kac13ARcWxE7X5KTRS7EcOL48SeKqw3sy?=
 =?iso-8859-1?Q?M5j+7f0kZXKAvxL+CVQLaeA6NLGbrwxSuMGDKLEOwXSlYlMy619Q5s4LcY?=
 =?iso-8859-1?Q?R+fmBZxgDn6hN3L+r6iKuOmgQqkq/y2Q1SnBO8I9pFzjwS7TNASrzwrW+I?=
 =?iso-8859-1?Q?CIVjqCO1vBOUbZ8JJcabJlkZnoXBpu9VNDfEV+Ee4/rHhYdBGwY20xT2zh?=
 =?iso-8859-1?Q?vU1qraWep1juK/uePvtFuL5bJR2GfMH/sh8oTIXDyX5IPEOJEkl3FWQDBo?=
 =?iso-8859-1?Q?zCm3+QPxaVycG54riHFjaRSlib5YDSXce0wiS7pEfyQJnY1orwFu5fJ8XF?=
 =?iso-8859-1?Q?lEJoQQLcIRymvjfgmtebMaokKMvC1L/r8es5pq2Uy2I8AUD/ugEpktBwqv?=
 =?iso-8859-1?Q?dks/ww4hdrkn2x1JLN6ucf9+DbzYySOLlOV8SMezjcJZpVUsX0+HYIg6QZ?=
 =?iso-8859-1?Q?1BiSRcURAV0x2G7tJtgfvIHtYpu4uUOOdI6GhhuO0CVQDGYyVAF+Dq9cWH?=
 =?iso-8859-1?Q?Y3BaIaRsxgPRXscHFFve3Mz1KbfpbppanJGKg8KCEHMfUbt23JGQ78DMfZ?=
 =?iso-8859-1?Q?E652WuUr7P/El+y9u096km7tPG8MsRGJdecutM4imVPTFXal5nsv214vgL?=
 =?iso-8859-1?Q?Vh0SGvi9774PoNxFGEnUk115XSmPyDXxTKMyyubze1C3qU1ChxzHBB9kHL?=
 =?iso-8859-1?Q?s13UDoJ8+6rhNmiWBmGlc/tZ+AL2hdG00PRaq613rp+H1ey6GX0JoLjcZy?=
 =?iso-8859-1?Q?0VN4Bm5D40L8kXktCJYiYY3rOJDMz8J8pkhf9oA4DmeWWMIaSQ1uK2kPn0?=
 =?iso-8859-1?Q?ZeevtrXHR68fF5ZHYYEsufrnKT3R3kuAUzplQe1KGxse0+227Fa0y1g+Tq?=
 =?iso-8859-1?Q?JonfDb5CzpiM+3I78lxZ2jshlaYfI/ryjc+TsdU5mAZ10oEgI8r5AO3X9j?=
 =?iso-8859-1?Q?v4+JtutS0HniEd2mq97fOAAWbjYh7tcxAxzArqlogEZDiGO1YmGmozeyGq?=
 =?iso-8859-1?Q?wCXwRac8q8e3j5WqhfQjv2DLK+e1TwgMXfgAaIi0MJha3y5nbmv9OtZnHq?=
 =?iso-8859-1?Q?uea90gA7E5IUaI8fkGzyHti2e6XbWnzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D6r/IvMswUq6nSKBYIv92Ch8dsG1SMn0VO+Q4JMzANCfbt8/RJh2NJQc2K?=
 =?iso-8859-1?Q?+7X0bsa8nl7oBNoOLagGTHmzCUsjp8eeCJcRbeNZhb+5un2X8cVo6MTq33?=
 =?iso-8859-1?Q?Cl9Obu6N7AkU59SCTprxh05jQLvNXAqV8KhJd83o3N+6zQZpRITl1NXgIs?=
 =?iso-8859-1?Q?dUoYmLtgpHOh8bLCXA3sJzefWxwKJurah+Da/B20iZxWOIzPgTZLiRp/+4?=
 =?iso-8859-1?Q?WOYINesQv3hQzk1qrBGJlEGOJMb58ErY+otyN0ZseDXWEb1oBQdfh2rV1j?=
 =?iso-8859-1?Q?OMEP7XvanrgY2LYoapocRhaEzAU1IbKr0H6n+KYD6QUeAxha1Su+Jiqg8R?=
 =?iso-8859-1?Q?vyT+ArjqH2PFcbHwJ7vFK/wbSOtATM6nkl9DAh1wrdQCD1u88dApYb+0RY?=
 =?iso-8859-1?Q?YqPrHqdIGbQ2AZc7QSGc9m/rBZTjYQ4DuEjotkowoWN2kbAAydwkpohKKP?=
 =?iso-8859-1?Q?XQW3/mNVU6F7JZOhegNlrUK+GjfxqBve+N6kDfW4HhYu2wxtuozNhABjmx?=
 =?iso-8859-1?Q?mkTDY1+Ss6J/zXX4z8VuCEsvchhipybOwaNWSyq3Iv46/9ljrxMTj1HbBT?=
 =?iso-8859-1?Q?CexYZMg8C32uF9CtfEOhvZtXcTAaoU45HS+j2A1XCR9jwmmUTsc/YCPr3s?=
 =?iso-8859-1?Q?w0C8JTxdyHHcXaEBV9wpa2z8vEx9emuydE7roAzLiLyDHkmoPM8QfS2vd4?=
 =?iso-8859-1?Q?dPK2522NiryvsHr2TEVfF/1z5wCwoNii45yw8MMdma5BWztR2fAd1AJmuz?=
 =?iso-8859-1?Q?4RttVP+IfEHId3MOIBwaR7FsXs9j6RMZPMwc/a9Z1iG0HzRFDjEzEFUt0O?=
 =?iso-8859-1?Q?XojzfUfaB7F2ztAm/sozU3mufP68c7Qf0u9Psv0PoCZfU5sI2YODTkRYeA?=
 =?iso-8859-1?Q?aIJKDkPUSv0pbt0cpQm7FIo+u5+2Lz5MAFnhcGJkDMN/cVaSzgXc1sWFPi?=
 =?iso-8859-1?Q?/7fKE7NarcweSGOr+ucmo2VuFXKNhzzeTzI5B+y0lxctg+GVGCvctRyJ/J?=
 =?iso-8859-1?Q?KtjJHkG9JaxzK6dPjZRZfoord7/msPdiRC41rgNyskhczMI2pjtn6nEBbl?=
 =?iso-8859-1?Q?gPEp+C8YiEoagzA/+qpRjPJ8AtA2fS9X+fNhURC5Z7FpBFenE3cB1azJIH?=
 =?iso-8859-1?Q?NTerFlENnnPhk/Q6yfzS9235UPPKQG7DPlF3yOhctbQsALQPPReV66k+S3?=
 =?iso-8859-1?Q?8D7L005X0+Guf1hqtEr1/nQ0SmrYGl/LE0eIxlea+Iwpva7ZZKRZVF53tI?=
 =?iso-8859-1?Q?gTVzrgBYETHu8AnviuUJJT8is1SjgujHg2+JXme2+Nkp6XfANz7ujqZvUk?=
 =?iso-8859-1?Q?1wgx6MK3kUOu+rR1v2zRBprw3/RIYgba3T4vimK+W8BQ8urZN3lN2iN31O?=
 =?iso-8859-1?Q?ECsHm6ghXYpNErsZyDqBH6OYM2ohNLwGXMYbzEuJOKZ0RaWM1Vrr9rGpFD?=
 =?iso-8859-1?Q?Wrc8NkJ8x8LQ3s+okznKouTud7tLJcDMaAWgVHOX7Si7FNGHJjPwll3cGD?=
 =?iso-8859-1?Q?CgR/4vY6N95PYkSRVxX0i9aKmHTGRrOgfyKMQbjqfoTqu00gVJWg9b6NG0?=
 =?iso-8859-1?Q?N0tjguTL4W33Be2ZIlvrXclOKeFWY9I89rSMPMGP2+xnV/QmNX0z+KUaqh?=
 =?iso-8859-1?Q?/SEoRNIA6w4f9o/shQK39HLHKjbxqJDrsd8Eh5e5rC67dR6raOYoESVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1d09b4-319d-442a-33ad-08dc9b9920a7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 19:48:36.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkAdmAtZuGK5DSKW8yPLnVkJNST+IWK14Zt77y/g/nJHzSHJirM7KbSXyA38yyznsekm61bg1LhkFbFpk13mMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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

On Wed, Jul 03, 2024 at 05:38:09PM +0200, Thomas Hellström wrote:
> Initially intended for experimenting with different backup
> solutions (shmem vs direct swap cache insertion), abstract
> the backup destination using a virtual base class.
> 
> Also provide a sample implementation for shmem.
> 
> While when settling on a preferred backup solution, one could
> perhaps skip the abstraction, this functionality may actually
> come in handy for configurable dedicated graphics memory
> backup to fast nvme files or similar, whithout affecting
> swap-space. Could indeed be useful for VRAM backup on S4 and
> other cases.
> 
> v5:
> - Fix a UAF. (kernel test robot, Dan Carptenter)
> v6:
> - Rename ttm_backup_shmem_copy_page() function argument
>   (Matthew Brost)
> - Add some missing documentation
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/Makefile           |   2 +-
>  drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 +++++++++++++++++++++++++
>  include/drm/ttm/ttm_backup.h           | 137 ++++++++++++++++++++++++
>  3 files changed, 277 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>  create mode 100644 include/drm/ttm/ttm_backup.h
> 
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..5e980dd90e41 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -4,7 +4,7 @@
>  
>  ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>  	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
>  ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>  
>  obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> new file mode 100644
> index 000000000000..3d23a34d9f34
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <linux/page-flags.h>
> +
> +/**
> + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> + * @backup: The base struct ttm_backup
> + * @filp: The associated shmem object
> + */
> +struct ttm_backup_shmem {
> +	struct ttm_backup backup;
> +	struct file *filp;
> +};
> +
> +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
> +{
> +	return container_of(backup, struct ttm_backup_shmem, backup);
> +}
> +
> +static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
> +{
> +	handle -= 1;
> +	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
> +			     handle + 1);
> +}
> +
> +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
> +				      unsigned long handle, bool intr)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	struct folio *from_folio;
> +
> +	handle -= 1;
> +	from_folio = shmem_read_folio(mapping, handle);
> +	if (IS_ERR(from_folio))
> +		return PTR_ERR(from_folio);
> +
> +	/* Note: Use drm_memcpy_from_wc? */
> +	copy_highpage(dst, folio_file_page(from_folio, handle));
> +	folio_put(from_folio);
> +
> +	return 0;
> +}
> +
> +static unsigned long
> +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
> +			     bool writeback, pgoff_t i, gfp_t page_gfp,
> +			     gfp_t alloc_gfp)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	unsigned long handle = 0;
> +	struct folio *to_folio;
> +	int ret;
> +
> +	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
> +	if (IS_ERR(to_folio))
> +		return handle;
> +
> +	folio_mark_accessed(to_folio);
> +	folio_lock(to_folio);
> +	folio_mark_dirty(to_folio);
> +	copy_highpage(folio_file_page(to_folio, i), page);
> +	handle = i + 1;
> +
> +	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
> +		struct writeback_control wbc = {
> +			.sync_mode = WB_SYNC_NONE,
> +			.nr_to_write = SWAP_CLUSTER_MAX,
> +			.range_start = 0,
> +			.range_end = LLONG_MAX,
> +			.for_reclaim = 1,
> +		};
> +		folio_set_reclaim(to_folio);
> +		ret = mapping->a_ops->writepage(folio_page(to_folio, 0), &wbc);
> +		if (!folio_test_writeback(to_folio))
> +			folio_clear_reclaim(to_folio);
> +		/* If writepage succeeds, it unlocks the folio */
> +		if (ret)
> +			folio_unlock(to_folio);
> +	} else {
> +		folio_unlock(to_folio);
> +	}
> +
> +	folio_put(to_folio);
> +
> +	return handle;
> +}
> +
> +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
> +{
> +	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
> +
> +	fput(sbackup->filp);
> +	kfree(sbackup);
> +}
> +
> +static const struct ttm_backup_ops ttm_backup_shmem_ops = {
> +	.drop = ttm_backup_shmem_drop,
> +	.copy_backed_up_page = ttm_backup_shmem_copy_page,
> +	.backup_page = ttm_backup_shmem_backup_page,
> +	.fini = ttm_backup_shmem_fini,
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +{
> +	struct ttm_backup_shmem *sbackup =
> +		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
> +	struct file *filp;
> +
> +	if (!sbackup)
> +		return ERR_PTR(-ENOMEM);
> +
> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
> +	if (IS_ERR(filp)) {
> +		kfree(sbackup);
> +		return ERR_CAST(filp);
> +	}
> +
> +	sbackup->filp = filp;
> +	sbackup->backup.ops = &ttm_backup_shmem_ops;
> +
> +	return &sbackup->backup;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> new file mode 100644
> index 000000000000..5f8c7d3069ef
> --- /dev/null
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TTM_BACKUP_H_
> +#define _TTM_BACKUP_H_
> +
> +#include <linux/mm_types.h>
> +#include <linux/shmem_fs.h>
> +
> +struct ttm_backup;
> +
> +/**
> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
> + * @handle: The handle to convert.
> + *
> + * Converts an opaque handle received from the
> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * struct page pointer suitable for a struct page array.
> + *
> + * Return: An (invalid) struct page pointer.
> + */
> +static inline struct page *
> +ttm_backup_handle_to_page_ptr(unsigned long handle)
> +{
> +	return (struct page *)(handle << 1 | 1);
> +}
> +
> +/**
> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
> + * @page: The struct page pointer to check.
> + *
> + * Return: true if the struct page pointer is a handld returned from
> + * ttm_backup_handle_to_page_ptr(). False otherwise.
> + */
> +static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
> +{
> +	return (unsigned long)page & 1;
> +}
> +
> +/**
> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
> + * @page: The struct page pointer to convert
> + *
> + * Return: The handle that was previously used in
> + * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> + * for use as argument in the struct ttm_backup_ops drop() or
> + * copy_backed_up_page() functions.
> + */
> +static inline unsigned long
> +ttm_backup_page_ptr_to_handle(const struct page *page)
> +{
> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> +	return (unsigned long)page >> 1;
> +}
> +
> +/** struct ttm_backup_ops - A struct ttm_backup backend operations */
> +struct ttm_backup_ops {
> +	/**
> +	 * drop - release memory associated with a handle
> +	 * @backup: The struct backup pointer used to obtain the handle
> +	 * @handle: The handle obtained from the @backup_page function.
> +	 */
> +	void (*drop)(struct ttm_backup *backup, unsigned long handle);
> +
> +	/**
> +	 * copy_backed_up_page - Copy the contents of a previously backed
> +	 * up page
> +	 * @backup: The struct backup pointer used to back up the page.
> +	 * @dst: The struct page to copy into.
> +	 * @handle: The handle returned when the page was backed up.
> +	 * @intr: Try to perform waits interruptable or at least killable.
> +	 *
> +	 * Return: 0 on success, Negative error code on failure, notably
> +	 * -EINTR if @intr was set to true and a signal is pending.
> +	 */
> +	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
> +				   unsigned long handle, bool intr);
> +
> +	/**
> +	 * backup_page - Backup a page
> +	 * @backup: The struct backup pointer to use.
> +	 * @page: The page to back up.
> +	 * @writeback: Whether to perform immediate writeback of the page.
> +	 * This may have performance implications.
> +	 * @i: A unique integer for each page and each struct backup.
> +	 * This is a hint allowing the backup backend to avoid managing
> +	 * its address space separately.
> +	 * @page_gfp: The gfp value used when the page was allocated.
> +	 * This is used for accounting purposes.
> +	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
> +	 * memory.
> +	 *
> +	 * Return: A handle on success. 0 on failure.
> +	 * (This is following the swp_entry_t convention).
> +	 *
> +	 * Note: This function could be extended to back up a folio and
> +	 * backends would then split the folio internally if needed.
> +	 * Drawback is that the caller would then have to keep track of
> +	 * the folio size- and usage.
> +	 */
> +	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
> +				     bool writeback, pgoff_t i, gfp_t page_gfp,
> +				     gfp_t alloc_gfp);
> +	/**
> +	 * fini - Free the struct backup resources after last use.
> +	 * @backup: Pointer to the struct backup whose resources to free.
> +	 *
> +	 * After a call to @fini, it's illegal to use the @backup pointer.
> +	 */
> +	void (*fini)(struct ttm_backup *backup);
> +};
> +
> +/**
> + * struct ttm_backup - Abstract a backup backend.
> + * @ops: The operations as described above.
> + *
> + * The struct ttm_backup is intended to be subclassed by the
> + * backend implementation.
> + */
> +struct ttm_backup {
> +	const struct ttm_backup_ops *ops;
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +
> +#endif
> -- 
> 2.44.0
> 
