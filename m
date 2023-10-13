Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D47C893A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 17:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA75B10E1A0;
	Fri, 13 Oct 2023 15:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AE7882B5;
 Fri, 13 Oct 2023 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697212637; x=1728748637;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pVsOyThkZLCTJpiAC2i53MRD/BXz7rNEPPTT4RRL8S8=;
 b=cg+St53h4tZw0QzfP1X8LU7hmuybBKTOBf/fvsayPSgvP/uttf8aXynF
 PK1Ys61ME8j+CViZIKQZZnAdern2EQ5ggaW6d02hqyZB4ZBQOC3AQaozQ
 g5xapXltMnMy08h7XDqzzLRqFv31NqlW1gJZ7WuWrFPyqhG3W8UhX3AcE
 QocEKnfQqTwod/osTGr9eQRTBAVjE4JMk5+IlY02xpPpJwoxZ2iTfZzWC
 HP+ksVj0odL8mfZzoTO8xGZpet22QE41sGVV4jvP7Bkx6oLW8vG2ZyeRT
 e/lnDQy6OD7mWXbDN2wItflogFBZlgVrDqQJawNoTzOCmC497TjvIcKQd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416257338"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="416257338"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 08:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845524892"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="845524892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 08:57:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 08:57:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 08:57:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 08:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLEOQfqhSiEEOXrDVpUGs3c1kQ0EpMiKyWTRBklPkRI8sKf68WUHQtRMUVbhCDqycgpHgBuwXFbsDM78NoJope1z5L1hXKKAPfNDL+alAewjTiN5xByfBMTWCpcyWqV/piHisNONNsUxRkJQzEUsCCnor1DOzsXusip/S6BFZOhB+4X3GjQQo6lhbwYYEh3qIax/rDIca3385bHWMskUYcOlOgmf5irJJrtGKFGxuNPtai6fxkrZNvsjeiM2/x0oenJJWTqwD/6/aGGe+7MRvvrr8/HywN0T3DcsY4jQCgogd10OZeESn8RpDWtTlkJXoO+rm6OnQK2BPm56MHCTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QretZeu/8Q3etNMvBgI9iwN2qjorSB7NrZPdh+YmJp8=;
 b=Tf44kh5maCz4mLsgqfcgzY6PezAUyPpZOkn31baPAMQdVQ5LX/dCiTAK/8b0Yj0l/D8NGMfQdAD2Hro3RJXirwLdrDAYQHHbF6Y4jbnzaQzvAvpHD5vZekBpXvmfG6pb1R8FmInh/GBZt+DnnwkIPC+b6qaqfqmDDlN4vBSTCZzyfhQ3ZPSEPOquXduqxjKjkQwk4eG4NYyWlbIuxrhP2MT/B/fVUtoRoRg3M+QZAhtxJ8AligxZllXIw/Wl1AGbyJ+NyUZJSoaQkkfgq43HEsaQJFfORVCPVFNDOOslY2wuhWk9fsU0DNWICvkv7PxvySnh1J8Ymou4NIICcCSAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Fri, 13 Oct
 2023 15:57:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 15:57:11 +0000
Date: Fri, 13 Oct 2023 08:57:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <20231013155705.GO5757@mdroper-desk1.amr.corp.intel.com>
References: <20231013134439.13579-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013134439.13579-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 53dab29f-b371-427c-de4e-08dbcc050f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11yE3CaAimDqOwi7p1JYJRmX64a8nDywSCGtaJEkvX9m0rFys19jEDLfQJt62oA8gZQRl/FgZbL24RqO8wmyrHbL/Xd/IAeUMqLiRrdCgsjdR3ooslw3LDFRsVEuvmEMvO90Q5PpSwKzMTV3XSsyEqFSJnF1rvVb26glfga3Y2Sm6crs5tizoL0qZpJ5RRZtufc326ei26aIFxqyZA79dd18loEvcXSaKha4oslf6QYCvHR9TIA2hIu2C43oTet9rNM2nrfyv20/idpo76O6CUk3KzNvFPZvrWZs3INNRVicI5pFz9gYZaf+5bM9n74ajPTylF5yUmQKRVqGVlysfuY0vNemayc8yitXrt/thXBW0i0uMzLn65TJ3dc6+/p8Jz3aCC462yQF65yzdybiXvgikF+/ZEVR8bc/O2kMypjuyO0nv7DbqR0dt80l8ek/eTodS8pXs/r9gAMTTsHbfL1r+leauxoYyJ9OKcKmVLc4F9YuBD2N15sWb32pCyipQxsyZmjY0i03m0INIcxnqDasNcrrTJ2PABW0C6AR1dotjURD17MZ2UiLJsOX/3/G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(6506007)(66946007)(54906003)(6862004)(4326008)(8936002)(5660300002)(6636002)(8676002)(66476007)(26005)(6486002)(478600001)(6666004)(66556008)(2906002)(6512007)(1076003)(82960400001)(38100700002)(316002)(83380400001)(66574015)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kT0kF4+LZT/snNef6nq1ZTGB24snfKnsWBD3PjTyDFOFTXCHhGEM1FETnv?=
 =?iso-8859-1?Q?LXnQolDVLIyp9I3HEs3ONvY6kN7S3uUZf5CvO4DvXv9ovkteF6J7hwI+AJ?=
 =?iso-8859-1?Q?0AijaPuZd8ZNUEcZBkRQoaGl18vC9wvyZsNk/bZXuKQ/ty8gwER5CmpMJm?=
 =?iso-8859-1?Q?I+4gr38N7l2/S6oq3H6cjUGOSgDG7+jKtZ3yIG9/tc5LClow898DzSBZvH?=
 =?iso-8859-1?Q?1DtdMU8ezvBlXc0t4Xtpj4Wsj7/ZghxON5p4/MmtxELcRsyAbYotv+cRi+?=
 =?iso-8859-1?Q?vDr7uxaCbRmfDJkPZ8m4Cl1TG9ZYCj2mCikGSjEncEw2FsFJUq1BI6dF5e?=
 =?iso-8859-1?Q?Cb8RSxdkj0Tnq2BWD+DTXP2CjIsCt5os0mrvcp+guKZtBAAiUfjaGaHWjw?=
 =?iso-8859-1?Q?kC5WuxGMSgFAAqk3jMriAoeD1KXslsL1p3vpczPrj+YUCJuNJnl5NBM2od?=
 =?iso-8859-1?Q?ij+g2oH8FZsNTix0s3N/MljZGtFChwOambaiDDfVOEqBFbxghxu4D8kjCx?=
 =?iso-8859-1?Q?lSfgTTUIKYRRWyBlryfFAMp1X5vsoTfEU7fE5mAbHwHt8MmmyewMtHFP6H?=
 =?iso-8859-1?Q?kKKnSykVjG35vcu+xXlFLDSaecOEksZwHOrwPT7am7Y7xPwztb5s3Dguhz?=
 =?iso-8859-1?Q?t4zlgczmxi2xt9LNs8kDJ7tssEdbkS5J6BieWwsgy0Yd4eaXsZZ+/kJ+ZW?=
 =?iso-8859-1?Q?GLAUcWDyWA9Z/xe7D4iIrqsViAHQkfhigUPrUBPkf/o5THUqqyfPYNncwn?=
 =?iso-8859-1?Q?axQ0ouq2K6/fNcfprUQFmo0a2AgqJPwcSFw3YYk4TqhlyWgirhd+gJ4O6U?=
 =?iso-8859-1?Q?xNtVRt0H7r3e99x3iyN+VvWo4zaQgNUZcpZUTqtvhiVvwMRyMeSuMuTnwS?=
 =?iso-8859-1?Q?awrMUMwj+hBIbkyR2ANFUB1NkJR4BHEG4SSKii9pGwxnUjry3LHg6t2bk1?=
 =?iso-8859-1?Q?xota7v8y1PBTDLGZuDDgtFca9EMZYioO3B1yDou+MUlI2F+xauKV4bVkvE?=
 =?iso-8859-1?Q?6hlMhejR+4SMq7J7U8lJosaxmKLnTbzitdu3VMtBA+KYwY8EyRXWftnBFt?=
 =?iso-8859-1?Q?AWCXSeFw4mokAf+E10ydwq9YrtE+8Qv6x5x2QsV0vvRh8tvWNrIWDZzjxO?=
 =?iso-8859-1?Q?+RVWo7587L/8btFb0XNi6btJmhJgRckwebetYCu817sHH8sN9EBAYr6VBE?=
 =?iso-8859-1?Q?qtkx/l7GCQOjewWIWZYYSWSAgTLK0GiIWOWT7zKGsBI92C8phYl6i/ERx9?=
 =?iso-8859-1?Q?5VKd+JKWdbKqZoxmI7EwnumqwfbA/KJvj+BrqYs8UcAzwX+IB4Fb1iWY+X?=
 =?iso-8859-1?Q?huu0K5ooAcgb01iXnTC+OsQP+mWC5PPzlyLDpLHRAyzUGfhn2qmmQUXFcE?=
 =?iso-8859-1?Q?ez7TDqmzP7gIKYFAioh7vHWKMuWBjwl6gh4bIKPM9o+4MjE0hQ/44662wi?=
 =?iso-8859-1?Q?s0G4Z/zpExTRsHvd4x7Agr9wThdd9XbdhGXzbj5+h+DgLLl7gnVTR5mEr8?=
 =?iso-8859-1?Q?GwcyPlQsFCBdLUY/DZseFQbEz9a8NX4Czxs0BGdJk9B6GFzHt8eB5o/BjL?=
 =?iso-8859-1?Q?mVH0AFcs5//sdpPqUnL9LR/i0Zuht3xlL4OiFUTgLS9tetc8B3lNAUbPym?=
 =?iso-8859-1?Q?4rq0VSZ8vMWNpKHjDaqHocyfJ2H9cl/tTJ+P/TJaE9xXaUpoRh0q5q6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dab29f-b371-427c-de4e-08dbcc050f7e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 15:57:11.1396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmrZUEBA/5kPX/skTCyLgqJQzS8jPAxpU1krJ77TZKxLW2qYPL/NQyRklcoc51r48t4fP+LgXbcKGnhM/VO3Gwf7FGKfbt3gWyzXExYeyS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 03:44:39PM +0200, Nirmoy Das wrote:
> gen8_ggtt_invalidate() is only needed for limited set of platforms
> where GGTT is mapped as WC otherwise this can cause unwanted
> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
> valid.
> 
> v2: Add a func to detect wc ggtt detection (Ville)
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Interestingly, bspec 151 indicates that we probably shouldn't have been
using a CPU:WC mapping for the GGTT on gen9bc platforms either (i.e.,
the GTT part of the GTTMMADR has the same "64-bits or less" restriction
listed as later platforms).  But we've been using WC without issue for
the last 8 years, so I guess it's not worth changing it now.


Matt

> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 35 +++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 4d7d88b92632..401667f83f96 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -195,6 +195,21 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>  	spin_unlock_irq(&uncore->lock);
>  }
>  
> +static bool needs_wc_ggtt_mapping(struct drm_i915_private *i915)
> +{
> +	/*
> +	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
> +	 * will be dropped. For WC mappings in general we have 64 byte burst
> +	 * writes when the WC buffer is flushed, so we can't use it, but have to
> +	 * resort to an uncached mapping. The WC issue is easily caught by the
> +	 * readback check when writing GTT PTE entries.
> +	 */
> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> @@ -202,8 +217,12 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  	/*
>  	 * Note that as an uncached mmio write, this will flush the
>  	 * WCB of the writes into the GGTT before it triggers the invalidate.
> +	 *
> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
>  	 */
> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> +	if (needs_wc_ggtt_mapping(ggtt->vm.i915))
> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6,
> +				      GFX_FLSH_CNTL_EN);
>  }
>  
>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
> @@ -1126,17 +1145,11 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
>  	GEM_WARN_ON(pci_resource_len(pdev, GEN4_GTTMMADR_BAR) != gen6_gttmmadr_size(i915));
>  	phys_addr = pci_resource_start(pdev, GEN4_GTTMMADR_BAR) + gen6_gttadr_offset(i915);
>  
> -	/*
> -	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
> -	 * will be dropped. For WC mappings in general we have 64 byte burst
> -	 * writes when the WC buffer is flushed, so we can't use it, but have to
> -	 * resort to an uncached mapping. The WC issue is easily caught by the
> -	 * readback check when writing GTT PTE entries.
> -	 */
> -	if (IS_GEN9_LP(i915) || GRAPHICS_VER(i915) >= 11)
> -		ggtt->gsm = ioremap(phys_addr, size);
> -	else
> +	if (needs_wc_ggtt_mapping(i915))
>  		ggtt->gsm = ioremap_wc(phys_addr, size);
> +	else
> +		ggtt->gsm = ioremap(phys_addr, size);
> +
>  	if (!ggtt->gsm) {
>  		drm_err(&i915->drm, "Failed to map the ggtt page table\n");
>  		return -ENOMEM;
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
