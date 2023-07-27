Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD99765FDA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D8C10E62B;
	Thu, 27 Jul 2023 22:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2591610E62B;
 Thu, 27 Jul 2023 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690497891; x=1722033891;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9hZTar7jPwJeWM9bIRJmDcNh7qpWq2/XDiM7xbgCc/s=;
 b=PcPrjs32lK/sq08BN+Uys7TmmY9Q6HWSQLfR5cjlAquHvn3ykFoQPeOW
 j7mLvNR9/01a173mfuH8T02r3hFoVADhcmflbZqoz9zZRlzFaEzeSN7BZ
 warPjunYeWpWPyle672pi0ksgza1N5GY0OS18mzXMzFpmx6ETnCD1VJ3j
 qN1XxI/8qEHHxM69XS/eNQBP0skiZBww8Dv+ozTml/cXW8ihlkNIuyAQ6
 CGp78BmKqlJdpcDRd+zIMS9OS2IXNUROH37csCKzgpC61C81DgONssuiv
 zqlbyWcHVEXX4UyhDhwV7wSeHeNTe+bFn+TsCX++eWZuLs2jis9EfYEy4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434736484"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="434736484"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 15:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792657887"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="792657887"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2023 15:44:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:44:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:44:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 15:44:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 15:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHQjZLKRyHrd4TXzece2zteRpYDZVdcTcNFtIAYYY0FgdBjYo2LKGClEt33NMmOGlsdqLWGn0KXO6X/gIAkoOjSb4SBOCOJttJ+MRyqkZ3jg8GLbG7/x2dusR84FDtYO5ZDU176wNx5/4wT5hGtmMm+SHDSd8hJU2CaGRds3QkTVpe5siqhIhJlISL7mX78RnUilhwJ6m1troNE5fnFxYYuUok6njrsONF5uEMuGBTB3bUFNvYHufRWVDBh67h8Y8KURgYEmjUQEx/RmpmPPP+W0D2Sd1BeIuR+g0UoYEpQin9slONsNQ9lS/TX1gXaK8DYVipvqTbYYc2LB1Epc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUQCMycQ2feRe8GHa2eqoAHn0xTWcXw/Y8fIUPFnvjs=;
 b=hygNjKOcfZGIz/A5FnZn7a1xGrfEpaysqLPvsxO8LsRsjXhwjbqB7BHdAa4T7iTBdLIAYoD5jP0xXwBRZMQIVnJWQmYHi5AjDGRT4JQojdgLyzuzsvvfaBlZ//3/jCbIyocGMfxYUe1FixbuPl9HI5OdUfrgt163EgqCg2L+xI/XfeF7CS/04pe+ybzwRdhoBd847BLJb6SunnCq2tr1LRZLjc4byjJiwd6Hy0OAJG7oUzIBmQJ1sV1vAzot/M24BcgMNHkTmsQx/OaeDixJuZKNpvS7RbRbyHtk1f/CQ/re7Mg2lz927RspE9X736EgvJJRV0orex28xqKEYFQm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 22:44:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 22:44:36 +0000
Date: Thu, 27 Jul 2023 15:44:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 3/8] drm/i915: Cache PAT index used by the driver
Message-ID: <20230727224433.GC138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-4-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230727145504.1919316-4-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa9ee4f-0911-4554-0151-08db8ef30dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUTg0qHqdLxGaL30xJJ/q2Xcx6EhLcrNg+AjUsJqK+Ln+JzlnonqVxFU0iGcL5DBmmlZqz4VkkEa/V1iAC/Ixb/R592r9E1TEtE5zPJoEzBNcSPIh5o0TAMc9qKAspXTcQlYs7DJxjfvurRqKXW007ugdbZUoQxlTj4HEcXkiGnSGgL3e/IoNCywji1jfFWb76FA2HHWweja6lH2HVhh6ZFghygOmdRiDIuDHg/DKpfxX7uP/k3hSSxq1FPTxKi6GQmEuJ+TLfJUox2vw+BG5ghu034nkH83dMwFMmvmETwHobieC7iNbIBUymvopt8zGiEPdQbzW+NVjx4ghcny2ZaPEFYM/CybfOl0tyYOSAsmPsyk7RKYPz0PLiDWHniGHyj70lvlUqbdzd7No2gz81AENYhzJzptgQgT77TOQl9LYGLV4LCHsJdD6qyFKPE/R1PanCC+SWBdSFi/nSW+inHyQbI5dEB7bnJbXe7EAsko0NtFOHtdr4GJ+Hf5jCabf5js7gEH7VYhlwmkIkd2ZtHdI8ZB+k4GJQsI6tdRp1SCdpklM/pv6A7Ogvdea3GM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(186003)(6512007)(54906003)(6486002)(6666004)(478600001)(83380400001)(86362001)(33656002)(66556008)(2906002)(30864003)(66476007)(6506007)(1076003)(26005)(6916009)(38100700002)(66946007)(82960400001)(4326008)(316002)(8936002)(41300700001)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CQ17PfWKYFaof/3H0YXoUokXZFBQP1TQ9U7JCcTTZYlY3SsLfaYOWh6RPI?=
 =?iso-8859-1?Q?z2GdQa9HNj7fEwMYqcl/SOA6bnddXaf9DHgHyUgcFZ0++cwIkNFjRfSb+B?=
 =?iso-8859-1?Q?wmAbzlXNMYqBkuXZkCbXq6X+RgOR9q2wozewk8VD+RGuhXfJuP5pQbYNVo?=
 =?iso-8859-1?Q?TZOUmMu58L28joem5bIAg2qSd/a4sE+V+JG/Eohq1ZH0/c/nVRoWlAcBmU?=
 =?iso-8859-1?Q?zi4Jl5wJxAqg+VmzzBdmiSXg1nBV5qUSVo3rHTa6QRgPWvmO4wsaWs7bFS?=
 =?iso-8859-1?Q?r+ku5yvqnR7lCqWTGZ1XViCx7xjsyMjEwDdRtgxbfi7ebjUwhAmMhjIDEM?=
 =?iso-8859-1?Q?e+PMafKu5y2C6z7qRv8nboshwsCZufR9Na5b1FhozkX4RFYZq0iMHijQxv?=
 =?iso-8859-1?Q?3emP7GZkhCtQRsvzxcJCTkCVIp3p28fc00OIq42axK5GdbBYffiILxB87U?=
 =?iso-8859-1?Q?gXd07DyOp4UxWa25XAuQ3i2Riz9upa/jXGuCu8vJCh8WOatmRiqO6rvxDe?=
 =?iso-8859-1?Q?0sqxkzSQ+qps3rVhbKd01vuHM1x71HfPfbJ8ANJlhdzpa8bOVX1Bn1lq1d?=
 =?iso-8859-1?Q?w/o9dfpjPb/2N8pJeP1fLFA9MWn2ckhw2Ys37HxxNy7E4AuTKyItif8Vn8?=
 =?iso-8859-1?Q?RIuOcEG0wMUgkJxXk5BrhwbmT/E5XMTuLCtgGSZGAqk6S+F5g4PYXZNd80?=
 =?iso-8859-1?Q?drP7wW+LHzfBF31iNgP92taskcEFF55w5gCmklKCia/Y9BGZPMr5/1eKwQ?=
 =?iso-8859-1?Q?U/h6VLLKX1GNh65XvYDpjW/hFEDdlz8U1em9p4CCa1xuZULLEFBk4NPk5Q?=
 =?iso-8859-1?Q?09g/L6pgbLjkJsqDKQNcQFhDTHBvWp+fy0zIp1zZmuj8ioSDkieD3oJ7q7?=
 =?iso-8859-1?Q?6E62RjVPzyFlsfHE4YS+30fFLb0iw5OtLyImOKpEtuSoRTy5Oq9IGVUkCf?=
 =?iso-8859-1?Q?nN7EP9iM7UTt5P9mNHDriENuXNoNQeKbd8md7zS0H6+RXyfKWYjEpdSjGt?=
 =?iso-8859-1?Q?Awmr8vo6moj5P5Y4Bpl4OB+8AEfQ4ojoZmB7xYM9N4rSyIVyMq6CzsfmKY?=
 =?iso-8859-1?Q?YyK+NO2KUJtWIw+TDrtOVl9rHm7ux+UGcw4GCtHAzICfbSNxM002Mk/xJ0?=
 =?iso-8859-1?Q?zUbexEVVFFxm9HzGFTNrqZcI+qYu0G20gDmNQMHvJIOc55bVQM1q/MAe/Y?=
 =?iso-8859-1?Q?cZrUUY0HETVj5upF/EwglrE2z328GRkNh++uhOWq1bAoZ69vdPUl8hYuBd?=
 =?iso-8859-1?Q?Hy28FpUjbV6rmaAcDw4xI0ZpIRXRzsAfwjno8Nb7lzA9OFJ9nsgPR37MMw?=
 =?iso-8859-1?Q?iEphMgeBDTII9iifzUxndUPPPq2bVDRvQy6RqWMwO/KWpIyC2W4t32i/AC?=
 =?iso-8859-1?Q?U51d9XSIFexTUPic4+R2+PyokVOM2+QwBPxud0/8rFzE1Mnzq+938iKnzC?=
 =?iso-8859-1?Q?WHpOiPn2BSRcA+ag4hXXaEyOtcMiTCxl+uSOcHKcWB+gHiFTLYDmMSXczJ?=
 =?iso-8859-1?Q?4XMumCOWGpRc/I9rZSJFVAIS/UpBxigdSSJsFRbRP9172iprUwen9niluf?=
 =?iso-8859-1?Q?lPNHeXkVGq7B3Yc4DwZ4oGD8iLOyLXc/OPEVqrVEq7nlOwrKBchrOqbcKX?=
 =?iso-8859-1?Q?In902KZ0RsuZUxsQUOA8N3G4TR+czsdzQtqCLGJX6W6t5nhxT67TR4oQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa9ee4f-0911-4554-0151-08db8ef30dfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 22:44:36.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4zz4kwy7ZvrKmQsmCxymuVUbC4/JKGUaU5H6zVmUe5v8zVKorTfkjWBbY7Fs9YZGa4yW3gpIZG8SKIGzLQm6d6MR79X0KTbbcje/4Ip9P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:54:59PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Eliminate a bunch of runtime calls to i915_gem_get_pat_index() by caching
> the interesting PAT indices in struct drm_i915_private. They are static
> per platfrom so no need to consult a function every time.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  7 ++---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 26 ++++++++++++-------
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  4 +--
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  4 +--
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  8 ++----
>  drivers/gpu/drm/i915/gt/intel_migrate.c       | 11 +++-----
>  drivers/gpu/drm/i915/gt/selftest_migrate.c    |  9 +++----
>  drivers/gpu/drm/i915/gt/selftest_reset.c      | 14 +++-------
>  drivers/gpu/drm/i915/gt/selftest_tlb.c        |  5 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  8 ++----
>  drivers/gpu/drm/i915/i915_cache.c             | 18 +++++++++++++
>  drivers/gpu/drm/i915/i915_cache.h             | 13 ++++++++++
>  drivers/gpu/drm/i915/i915_driver.c            |  3 +++
>  drivers/gpu/drm/i915/i915_drv.h               |  2 ++
>  drivers/gpu/drm/i915/i915_gem.c               |  8 ++----
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  8 ++----
>  drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +---
>  .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +--
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 11 +++-----
>  .../drm/i915/selftests/intel_memory_region.c  |  4 +--
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  2 ++
>  24 files changed, 89 insertions(+), 91 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/i915_cache.c
>  create mode 100644 drivers/gpu/drm/i915/i915_cache.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c5fc91cd58e7..905a51a16588 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -35,6 +35,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
>  # core driver code
>  i915-y += i915_driver.o \
>  	  i915_drm_client.o \
> +	  i915_cache.o \
>  	  i915_config.o \
>  	  i915_getparam.o \
>  	  i915_ioctl.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 5a687a3686bd..0a1d40220020 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1330,8 +1330,7 @@ static void *reloc_iomap(struct i915_vma *batch,
>  		ggtt->vm.insert_page(&ggtt->vm,
>  				     i915_gem_object_get_dma_address(obj, page),
>  				     offset,
> -				     i915_gem_get_pat_index(ggtt->vm.i915,
> -							    I915_CACHE_NONE),
> +				     eb->i915->pat_uc,
>  				     0);
>  	} else {
>  		offset += page << PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 5b0a5cf9a98a..1c8eb806b7d3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -563,11 +563,8 @@ static void dbg_poison(struct i915_ggtt *ggtt,
>  	while (size) {
>  		void __iomem *s;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, addr,
> -				     ggtt->error_capture.start,
> -				     i915_gem_get_pat_index(ggtt->vm.i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		ggtt->vm.insert_page(&ggtt->vm, addr, ggtt->error_capture.start,
> +				     ggtt->vm.i915->pat_uc, 0);
>  		mb();
>  
>  		s = io_mapping_map_wc(&ggtt->iomap,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 7078af2f8f79..6bd6c239f4ac 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -58,6 +58,16 @@ i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
>  		I915_CACHE_NONE;
>  }
>  
> +static unsigned int
> +i915_ttm_cache_pat(struct drm_i915_private *i915, struct ttm_resource *res,
> +		   struct ttm_tt *ttm)
> +{
> +	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
> +		!i915_ttm_gtt_binds_lmem(res) &&

This matches the existing logic of i915_ttm_cache_level(), but do you
know why LMEM buffers are always set to uncached?  I don't understand
that part.

> +		ttm->caching == ttm_cached) ? i915->pat_wb :
> +		i915->pat_uc;
> +}
> +
>  static struct intel_memory_region *
>  i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
>  {
> @@ -196,7 +206,7 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>  	struct i915_request *rq;
>  	struct ttm_tt *src_ttm = bo->ttm;
> -	enum i915_cache_level src_level, dst_level;
> +	unsigned int src_pat, dst_pat;
>  	int ret;
>  
>  	if (!to_gt(i915)->migrate.context || intel_gt_is_wedged(to_gt(i915)))
> @@ -206,16 +216,15 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  	if (I915_SELFTEST_ONLY(fail_gpu_migration))
>  		clear = true;
>  
> -	dst_level = i915_ttm_cache_level(i915, dst_mem, dst_ttm);
> +	dst_pat = i915_ttm_cache_pat(i915, dst_mem, dst_ttm);
>  	if (clear) {
>  		if (bo->type == ttm_bo_type_kernel &&
>  		    !I915_SELFTEST_ONLY(fail_gpu_migration))
>  			return ERR_PTR(-EINVAL);
>  
>  		intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
> -		ret = intel_context_migrate_clear(to_gt(i915)->migrate.context, deps,
> -						  dst_st->sgl,
> -						  i915_gem_get_pat_index(i915, dst_level),
> +		ret = intel_context_migrate_clear(to_gt(i915)->migrate.context,
> +						  deps, dst_st->sgl, dst_pat,
>  						  i915_ttm_gtt_binds_lmem(dst_mem),
>  						  0, &rq);
>  	} else {
> @@ -225,14 +234,13 @@ static struct dma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,
>  		if (IS_ERR(src_rsgt))
>  			return ERR_CAST(src_rsgt);
>  
> -		src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
> +		src_pat = i915_ttm_cache_pat(i915, bo->resource, src_ttm);
>  		intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
>  		ret = intel_context_migrate_copy(to_gt(i915)->migrate.context,
>  						 deps, src_rsgt->table.sgl,
> -						 i915_gem_get_pat_index(i915, src_level),
> +						 src_pat,
>  						 i915_ttm_gtt_binds_lmem(bo->resource),
> -						 dst_st->sgl,
> -						 i915_gem_get_pat_index(i915, dst_level),
> +						 dst_st->sgl, dst_pat,
>  						 i915_ttm_gtt_binds_lmem(dst_mem),
>  						 &rq);
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index 6b9f6cf50bf6..6bddd733d796 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -354,7 +354,7 @@ fake_huge_pages_object(struct drm_i915_private *i915, u64 size, bool single)
>  
>  	obj->write_domain = I915_GEM_DOMAIN_CPU;
>  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> -	obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
> +	obj->pat_index = i915->pat_uc;
>  
>  	return obj;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index c2bdc133c89a..fb69f667652a 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -226,9 +226,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)
>  		return ret;
>  
>  	vm->scratch[0]->encode =
> -		vm->pte_encode(px_dma(vm->scratch[0]),
> -			       i915_gem_get_pat_index(vm->i915,
> -						      I915_CACHE_NONE),
> +		vm->pte_encode(px_dma(vm->scratch[0]), vm->i915->pat_uc,
>  			       PTE_READ_ONLY);
>  
>  	vm->scratch[1] = vm->alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 862ac1d2de25..675f71f06e89 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -874,9 +874,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
>  		pte_flags |= PTE_LM;
>  
>  	vm->scratch[0]->encode =
> -		vm->pte_encode(px_dma(vm->scratch[0]),
> -			       i915_gem_get_pat_index(vm->i915,
> -						      I915_CACHE_NONE),
> +		vm->pte_encode(px_dma(vm->scratch[0]), vm->i915->pat_uc,
>  			       pte_flags);
>  
>  	for (i = 1; i <= vm->top; i++) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index dd0ed941441a..fca61ddca8ad 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -921,9 +921,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
>  		pte_flags |= PTE_LM;
>  
>  	ggtt->vm.scratch[0]->encode =
> -		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
> -				    i915_gem_get_pat_index(i915,
> -							   I915_CACHE_NONE),
> +		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]), i915->pat_uc,
>  				    pte_flags);
>  
>  	return 0;
> @@ -1298,9 +1296,7 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>  		 */
>  		vma->resource->bound_flags = 0;
>  		vma->ops->bind_vma(vm, NULL, vma->resource,
> -				   obj ? obj->pat_index :
> -					 i915_gem_get_pat_index(vm->i915,
> -								I915_CACHE_NONE),
> +				   obj ? obj->pat_index : vm->i915->pat_uc,
>  				   was_bound);
>  
>  		if (obj) { /* only used during resume => exclusive access */
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 576e5ef0289b..b7a61b02f64c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -45,9 +45,7 @@ static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
>  	 * Insert a dummy PTE into every PT that will map to LMEM to ensure
>  	 * we have a correctly setup PDE structure for later use.
>  	 */
> -	vm->insert_page(vm, 0, d->offset,
> -			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
> -			PTE_LM);
> +	vm->insert_page(vm, 0, d->offset, vm->i915->pat_uc, PTE_LM);
>  	GEM_BUG_ON(!pt->is_compact);
>  	d->offset += SZ_2M;
>  }
> @@ -65,9 +63,7 @@ static void xehpsdv_insert_pte(struct i915_address_space *vm,
>  	 * alignment is 64K underneath for the pt, and we are careful
>  	 * not to access the space in the void.
>  	 */
> -	vm->insert_page(vm, px_dma(pt), d->offset,
> -			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
> -			PTE_LM);
> +	vm->insert_page(vm, px_dma(pt), d->offset, vm->i915->pat_uc, PTE_LM);
>  	d->offset += SZ_64K;
>  }
>  
> @@ -77,8 +73,7 @@ static void insert_pte(struct i915_address_space *vm,
>  {
>  	struct insert_pte_data *d = data;
>  
> -	vm->insert_page(vm, px_dma(pt), d->offset,
> -			i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
> +	vm->insert_page(vm, px_dma(pt), d->offset, vm->i915->pat_uc,
>  			i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
>  	d->offset += PAGE_SIZE;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index 3def5ca72dec..a67ede65d816 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -904,8 +904,7 @@ static int perf_clear_blt(void *arg)
>  
>  		err = __perf_clear_blt(gt->migrate.context,
>  				       dst->mm.pages->sgl,
> -				       i915_gem_get_pat_index(gt->i915,
> -							      I915_CACHE_NONE),
> +				       gt->i915->pat_uc,
>  				       i915_gem_object_is_lmem(dst),
>  				       sizes[i]);
>  
> @@ -995,12 +994,10 @@ static int perf_copy_blt(void *arg)
>  
>  		err = __perf_copy_blt(gt->migrate.context,
>  				      src->mm.pages->sgl,
> -				      i915_gem_get_pat_index(gt->i915,
> -							     I915_CACHE_NONE),
> +				      gt->i915->pat_uc,
>  				      i915_gem_object_is_lmem(src),
>  				      dst->mm.pages->sgl,
> -				      i915_gem_get_pat_index(gt->i915,
> -							     I915_CACHE_NONE),
> +				      gt->i915->pat_uc,
>  				      i915_gem_object_is_lmem(dst),
>  				      sz);
>  
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 79aa6ac66ad2..327dc9294e0f 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -84,11 +84,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		void __iomem *s;
>  		void *in;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, dma,
> -				     ggtt->error_capture.start,
> -				     i915_gem_get_pat_index(gt->i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		ggtt->vm.insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
> +				     gt->i915->pat_uc, 0);
>  		mb();
>  
>  		s = io_mapping_map_wc(&ggtt->iomap,
> @@ -127,11 +124,8 @@ __igt_reset_stolen(struct intel_gt *gt,
>  		void *in;
>  		u32 x;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, dma,
> -				     ggtt->error_capture.start,
> -				     i915_gem_get_pat_index(gt->i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		ggtt->vm.insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
> +				     gt->i915->pat_uc, 0);
>  		mb();
>  
>  		s = io_mapping_map_wc(&ggtt->iomap,
> diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c b/drivers/gpu/drm/i915/gt/selftest_tlb.c
> index 3bd6b540257b..6049f01be219 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
> @@ -36,8 +36,6 @@ pte_tlbinv(struct intel_context *ce,
>  	   u64 length,
>  	   struct rnd_state *prng)
>  {
> -	const unsigned int pat_index =
> -		i915_gem_get_pat_index(ce->vm->i915, I915_CACHE_NONE);
>  	struct drm_i915_gem_object *batch;
>  	struct drm_mm_node vb_node;
>  	struct i915_request *rq;
> @@ -157,7 +155,8 @@ pte_tlbinv(struct intel_context *ce,
>  		/* Flip the PTE between A and B */
>  		if (i915_gem_object_is_lmem(vb->obj))
>  			pte_flags |= PTE_LM;
> -		ce->vm->insert_entries(ce->vm, &vb_res, pat_index, pte_flags);
> +		ce->vm->insert_entries(ce->vm, &vb_res, ce->vm->i915->pat_uc,
> +				       pte_flags);
>  
>  		/* Flush the PTE update to concurrent HW */
>  		tlbinv(ce->vm, addr & -length, length);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 7aadad5639c3..8b7aa8c5a99d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -1053,14 +1053,10 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>  
>  	if (ggtt->vm.raw_insert_entries)
>  		ggtt->vm.raw_insert_entries(&ggtt->vm, vma_res,
> -					    i915_gem_get_pat_index(ggtt->vm.i915,
> -								   I915_CACHE_NONE),
> -					    pte_flags);
> +					    ggtt->vm.i915->pat_uc, pte_flags);
>  	else
>  		ggtt->vm.insert_entries(&ggtt->vm, vma_res,
> -					i915_gem_get_pat_index(ggtt->vm.i915,
> -							       I915_CACHE_NONE),
> -					pte_flags);
> +					ggtt->vm.i915->pat_uc, pte_flags);
>  }
>  
>  static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> diff --git a/drivers/gpu/drm/i915/i915_cache.c b/drivers/gpu/drm/i915/i915_cache.c
> new file mode 100644
> index 000000000000..06eb5933c719
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_cache.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "i915_cache.h"
> +#include "i915_drv.h"
> +
> +void i915_cache_init(struct drm_i915_private *i915)
> +{
> +	i915->pat_uc = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
> +	drm_info(&i915->drm, "Using PAT index %u for uncached access\n",
> +		 i915->pat_uc);
> +
> +	i915->pat_wb = i915_gem_get_pat_index(i915, I915_CACHE_LLC);
> +	drm_info(&i915->drm, "Using PAT index %u for write-back access\n",
> +		 i915->pat_wb);
> +}
> diff --git a/drivers/gpu/drm/i915/i915_cache.h b/drivers/gpu/drm/i915/i915_cache.h
> new file mode 100644
> index 000000000000..cb68936fb8a2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_cache.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __I915_CACHE_H__
> +#define __I915_CACHE_H__
> +
> +struct drm_i915_private;
> +
> +void i915_cache_init(struct drm_i915_private *i915);
> +
> +#endif /* __I915_CACHE_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 294b022de22b..bb2223cc3470 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -80,6 +80,7 @@
>  #include "soc/intel_dram.h"
>  #include "soc/intel_gmch.h"
>  
> +#include "i915_cache.h"
>  #include "i915_debugfs.h"
>  #include "i915_driver.h"
>  #include "i915_drm_client.h"
> @@ -240,6 +241,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  	i915_memcpy_init_early(dev_priv);
>  	intel_runtime_pm_init_early(&dev_priv->runtime_pm);
>  
> +	i915_cache_init(dev_priv);
> +
>  	ret = i915_workqueues_init(dev_priv);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 682ef2b5c7d5..f5c591a762df 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -250,6 +250,8 @@ struct drm_i915_private {
>  	unsigned int hpll_freq;
>  	unsigned int czclk_freq;
>  
> +	unsigned int pat_uc, pat_wb;
> +
>  	/**
>  	 * wq - Driver workqueue for GEM.
>  	 *
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 1f65bb33dd21..896aa48ed089 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -422,9 +422,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>  			ggtt->vm.insert_page(&ggtt->vm,
>  					     i915_gem_object_get_dma_address(obj,
>  									     offset >> PAGE_SHIFT),
> -					     node.start,
> -					     i915_gem_get_pat_index(i915,
> -								    I915_CACHE_NONE), 0);
> +					     node.start, i915->pat_uc, 0);
>  		} else {
>  			page_base += offset & PAGE_MASK;
>  		}
> @@ -603,9 +601,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
>  			ggtt->vm.insert_page(&ggtt->vm,
>  					     i915_gem_object_get_dma_address(obj,
>  									     offset >> PAGE_SHIFT),
> -					     node.start,
> -					     i915_gem_get_pat_index(i915,
> -								    I915_CACHE_NONE), 0);
> +					     node.start, i915->pat_uc, 0);
>  			wmb(); /* flush modifications to the GGTT (insert_page) */
>  		} else {
>  			page_base += offset & PAGE_MASK;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 4008bb09fdb5..31975a79730c 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1124,14 +1124,10 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  			mutex_lock(&ggtt->error_mutex);
>  			if (ggtt->vm.raw_insert_page)
>  				ggtt->vm.raw_insert_page(&ggtt->vm, dma, slot,
> -							 i915_gem_get_pat_index(gt->i915,
> -										I915_CACHE_NONE),
> -							 0);
> +							 gt->i915->pat_uc, 0);
>  			else
>  				ggtt->vm.insert_page(&ggtt->vm, dma, slot,
> -						     i915_gem_get_pat_index(gt->i915,
> -									    I915_CACHE_NONE),
> -						     0);
> +						     gt->i915->pat_uc, 0);
>  			mb();
>  
>  			s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 61da4ed9d521..e620f73793a5 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -57,10 +57,7 @@ static void trash_stolen(struct drm_i915_private *i915)
>  		u32 __iomem *s;
>  		int x;
>  
> -		ggtt->vm.insert_page(&ggtt->vm, dma, slot,
> -				     i915_gem_get_pat_index(i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +		ggtt->vm.insert_page(&ggtt->vm, dma, slot, i915->pat_uc, 0);
>  
>  		s = io_mapping_map_atomic_wc(&ggtt->iomap, slot);
>  		for (x = 0; x < PAGE_SIZE / sizeof(u32); x++) {
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index f8fe3681c3dc..f910ec9b6d2b 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -246,7 +246,7 @@ static int igt_evict_for_cache_color(void *arg)
>  	struct drm_mm_node target = {
>  		.start = I915_GTT_PAGE_SIZE * 2,
>  		.size = I915_GTT_PAGE_SIZE,
> -		.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_LLC),
> +		.color = gt->i915->pat_wb,
>  	};
>  	struct drm_i915_gem_object *obj;
>  	struct i915_vma *vma;
> @@ -309,7 +309,7 @@ static int igt_evict_for_cache_color(void *arg)
>  	/* Attempt to remove the first *pinned* vma, by removing the (empty)
>  	 * neighbour -- this should fail.
>  	 */
> -	target.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LLC);
> +	target.color = gt->i915->pat_uc;

This one doesn't look correct.  On most platforms I915_CACHE_L3_LLC maps
to the same wb PAT as I915_CACHE_LLC.  Only on legacy platforms does it
differ, and it maps to something different than either pat_uc or pat_wb
there.


Matt

>  
>  	mutex_lock(&ggtt->vm.mutex);
>  	err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5c397a2df70e..c96b7f7d7853 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -135,7 +135,7 @@ fake_dma_object(struct drm_i915_private *i915, u64 size)
>  
>  	obj->write_domain = I915_GEM_DOMAIN_CPU;
>  	obj->read_domains = I915_GEM_DOMAIN_CPU;
> -	obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
> +	obj->pat_index = i915->pat_uc;
>  
>  	/* Preallocate the "backing storage" */
>  	if (i915_gem_object_pin_pages_unlocked(obj))
> @@ -358,9 +358,7 @@ static int lowlevel_hole(struct i915_address_space *vm,
>  			mock_vma_res->start = addr;
>  
>  			with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
> -			  vm->insert_entries(vm, mock_vma_res,
> -					     i915_gem_get_pat_index(vm->i915,
> -								    I915_CACHE_NONE),
> +			  vm->insert_entries(vm, mock_vma_res, vm->i915->pat_uc,
>  					     0);
>  		}
>  		count = n;
> @@ -1379,10 +1377,7 @@ static int igt_ggtt_page(void *arg)
>  
>  		ggtt->vm.insert_page(&ggtt->vm,
>  				     i915_gem_object_get_dma_address(obj, 0),
> -				     offset,
> -				     i915_gem_get_pat_index(i915,
> -							    I915_CACHE_NONE),
> -				     0);
> +				     offset, i915->pat_uc, 0);
>  	}
>  
>  	order = i915_random_order(count, &prng);
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index d985d9bae2e8..b82fe0ef8cd7 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -1070,9 +1070,7 @@ static int igt_lmem_write_cpu(void *arg)
>  	/* Put the pages into a known state -- from the gpu for added fun */
>  	intel_engine_pm_get(engine);
>  	err = intel_context_migrate_clear(engine->gt->migrate.context, NULL,
> -					  obj->mm.pages->sgl,
> -					  i915_gem_get_pat_index(i915,
> -								 I915_CACHE_NONE),
> +					  obj->mm.pages->sgl, i915->pat_uc,
>  					  true, 0xdeadbeaf, &rq);
>  	if (rq) {
>  		dma_resv_add_fence(obj->base.resv, &rq->fence,
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index da0b269606c5..1d1a457e2aee 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -181,6 +181,8 @@ struct drm_i915_private *mock_gem_device(void)
>  	/* Set up device info and initial runtime info. */
>  	intel_device_info_driver_create(i915, pdev->device, &mock_info);
>  
> +	i915_cache_init(i915);
> +
>  	dev_pm_domain_set(&pdev->dev, &pm_domain);
>  	pm_runtime_enable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
