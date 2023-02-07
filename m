Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944F68E0ED
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 20:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D20310E1F1;
	Tue,  7 Feb 2023 19:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763B810E5AC;
 Tue,  7 Feb 2023 19:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675797061; x=1707333061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=scNG2b71pkBIZ2NLQxmrmkCtdh4MrUZoG07WLl6Ywvk=;
 b=TXHzVhXArAVUpf878ePqdyekPyIe1IUyWmsJEGZp1QHBNoFCUHeIsjIU
 uoB++nTr/nhqUknCX3kZLxPkZMZHQrQGZqGqwNTwdFoLxRk9FsqbGLaXx
 UFiY/ZnojLsneExsuSqn5TdwD30j7PEjQCWHH2LSq4GmR1pK7d6yR1PzA
 AF7dCt9qh7zbqu98vdViF5/WaiOkBpyyq+GSDck0/sNONqXkJHWgxTSvu
 xDfUMQhRntqVicy55Icu4SWBAWJw2pzvAT0J+dkcFRQ3160/8+fc2weRB
 bNlwRSs01h2KF9f10IpqLt0G47UEwKT4d315KR9hk/H5gHmPpN6pfaZCq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394193396"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="394193396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 11:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755732104"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="755732104"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2023 11:11:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 11:11:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 11:11:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 11:10:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKHGwRKiOK1hHEQvgyRi8LGVLsdoLjtUsSEQK/PaIX09FqIVuXwhHS0q3wGhOTWO9Mpsj6v1nxQaROEKnc7RHZ31OcnU0506Wn9mAH5P1FyMpH2WboIXpHM5ioRrSr+pv1oUYkrqw9b5XUyr7/6QbAzrnr0AzQFyQjXBLoAAmUF0xZclXygZHUCi3C2bA3VTNxZ683apP0JiVZH23SpSCUgvx2WZCe7qt4y9CKBLvcKFmbtrD7Raw5fH4f+qWt4zdMpBIiVpkQzqjS8vy1rVia97NXe/tvLI8Z0lu4V8s2zzY4l0kDAlvZ8RKCgKZYGVCQ56Ov2wJ5B8bR5vM84xBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKwpUix+UEEvUQfsKnVrMXpmm7QtanK0yMk0TRfTAVE=;
 b=UwY0sFBXAIQ8iPxtcckc39b15k/i4iuvTN2zIZouiU21aZrtqGqSFolkmldKl3B5YfoEJ7PPIAsN1oqUauwCJ9Gbfa70NYtW89B1fLfWE9xbqS28TDEMLZCNR85rctvXBZhPfYnh+1b4QyIMEu3YNg1iogOO6OcbJuF64rIIdO/Z35Hy93G6rDYlB8AHOtK0g4NjkamfI7yiwjIlTJOU5cx+xahODwODNux1Asho+EUouQN6MxcIzFUc3al72MU0e9xQ6XHPRfwbV+kGrjkCac7TvR5d+h8yZerXPJF5mSz4rvKNeVP7afgWYhJl0S6RwtwOnAp1fg1JcVaTbjB7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB6042.namprd11.prod.outlook.com (2603:10b6:8:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 19:10:58 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 19:10:58 +0000
Date: Tue, 7 Feb 2023 16:10:50 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/gen11:
 Wa_1408615072/Wa_1407596294 should be on GT list
Message-ID: <20230207191050.4b5wemwnrtkgb2lm@gjsousa-mobl2>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
 <20230201222831.608281-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201222831.608281-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: a523eb6e-677d-41af-ca53-08db093f0b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rc0CuzNXzQYdNLn1VqeDC3uNEsAmMKN1kPIXiMd0lydahgnhqC7UC26LfpcNpWyi2NzTugHYju5yVKzV5ITsJUTPixrxhNJn/BdGULgRcCkO7WyKyh0puqqDpp28CaGnSmp+C840HdVqlApJ2ZSJK/DJAyFsZGaa3lDdzhfv0R8VmVe4hvVCBtPXovcpE5N3IOlsXXYf5LsNou5M6ZgAB5oy91oQQ4lNFU57jEGBbqSUUXqC+DJQ+8IiieqhMhSaei0f52Tj7JGWyMyQnFhb4RwetCABC4Nn/6qkp9Q+p30Rj+xBox4jzKtdWwUPhBfO+N8MVZB3eDlY2zvrQIrV3I3cE5d7qMnB7rLEDXe/p0j5y1ohO5xgo37bsCqLJiSpIQ00VEVCFc6/HLQrPdm4Ro59cTfrH5BfIZyLtjd7dOf5MOjETVT9dTrgOQwWW3UlK2vzjLOKvEwp1rODFDCfwiCU665LqHI2ILIcOiNkY19RrBCFwX+ml8CBBtLCgdJHWlZE0RgUgrSvA68LKNpLdQ3LJAWGceIRJmZB+pklcD6G5fGLG7rHKM+Obea1bsIoNEHovQHsmU1JR6nBRZ0lAIKQkrB6rEwcEMygO3hpmYacySFMfJze5N8FkjFxNeVRH8jJHLd2l057Veio83K6Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199018)(44832011)(2906002)(5660300002)(41300700001)(8936002)(33716001)(8676002)(450100002)(4326008)(66556008)(66476007)(66946007)(316002)(6486002)(82960400001)(38100700002)(9686003)(186003)(6506007)(6512007)(1076003)(26005)(83380400001)(478600001)(6666004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4pkO3s96+HCUPzR5TibrmbRzI0006sNxXNi3YkC+kXmn/EaPsQrwRmNTaN5?=
 =?us-ascii?Q?o40BKd1y7ACPUpvVmq9cdjxwNn3T2ElGnWaicSiovO+mXaIt3Xja2a73NbTJ?=
 =?us-ascii?Q?E6IiMPmMUPZwxpPdQ/2x8ehPayaWG9UjIzidppOKNeQHZWnC4rgmasGVm5xO?=
 =?us-ascii?Q?sZviFX+JC73yQDYUGFbiTnIKIaPt+OfV913Bv861HYWYoBuDT6Kya+iTsomA?=
 =?us-ascii?Q?A1/hqbKdiK7uDbSp1ulRVrV7iHQ+MSb0zip+8r0eYbLqrBRrLbhzHBngwkXW?=
 =?us-ascii?Q?dyxt4b6R5tRgWGS6n1ZxjIvHbdb/GrHh3BP23UbEW6K3ohVbCDxwNT8F/uZS?=
 =?us-ascii?Q?q+koDlJRMWYvYa5KI06GHBzuG2EClTaF09jqoSzaW/GUk+UyzyyEZagbY9vL?=
 =?us-ascii?Q?n2WGvatSh1HPJ9/9SkVnjlufuqrcoSPMnjiii8Xz27idLST+gA8O9WGuBBtl?=
 =?us-ascii?Q?+anyciNae1ByCVBQxtm7l3el1+K8usN54HacWv4JjrpKZy/URTOQVTUrRlTR?=
 =?us-ascii?Q?B2OOAe0JTWvvyAy4kOCWe/IaARGKm9qMW9U2t0Kr1XF8zdW/DNi8vh/RnQF0?=
 =?us-ascii?Q?F7Xj4Ov/q/03GnmMQrtpUKx2w0SUcreLdBrwH+3F9YYptFE6TRj/OgG48gpW?=
 =?us-ascii?Q?E/BMTYqLzsZwtPmd/ev4D/zOp3urooyHL+a3mz7WiGj2ANqpaPGzVQGfFJAq?=
 =?us-ascii?Q?RwCWMk7vxviitH+06No2A5DbhVH4Z7zHu3dmvxNQHAhIjhm7gtC5DyBSZhZm?=
 =?us-ascii?Q?HvK19AYIlMhbv4gXc+0LfqP7bRAn9Q51ZxIIzeRy2Q14UBGFm335i2VnXxs9?=
 =?us-ascii?Q?FBGEmFADc3e6zWS3l8ubWdt23LZa+AoSnuHowxa5NDqMeFWpsMAmkS5k6YLK?=
 =?us-ascii?Q?39O1nYBvzr+m6pBIODXXTB694dsQx1+jua5usKwounlKOQVCrd+mEya6CZ4+?=
 =?us-ascii?Q?Y6U8gHQmk5EHGKSDGv3z5qK86TXTjV+Zsqd43JO7yWwI14YckkGXYJneCkpq?=
 =?us-ascii?Q?jY7WdL1kLqg0Pc5UNCZUMV902myNFh7Kzal/KJ7mNEXW/ZeeySP2KUSH0cqd?=
 =?us-ascii?Q?TKGwt14yCQ/3CJa7d4W5PjHZB/9P8D08C4hIcWpkQNH5/NZjaZCmuMv/falt?=
 =?us-ascii?Q?sRNOviMYCHx7q1RdalGNZqaJyJCdzOkfwE4UF1cNHnIcHzt5rKV5KB2/GjrS?=
 =?us-ascii?Q?62NSoc9n8M7grDNZnHv6Wovwutt8Y079uTwVWYrzwd5ECVkG1OmKDdIa4/su?=
 =?us-ascii?Q?ksO/NDzyfTVyEYlD5kNmi8L55XzeCQknHtKfLAkgmxUCNsEE63GTzhZacejy?=
 =?us-ascii?Q?kLRiNBHuunHt71B/7Y8F11eA/O8ZNMKgM4xf8wckU+YZKdzcvSd//4s6bNxt?=
 =?us-ascii?Q?LquehdqFFj0oGPn0DmIiaAaS08VxGNQ7RrEv0HBQ1KMbB37QwavW7ggmo/Ps?=
 =?us-ascii?Q?KjLZdXAjTrQ6M2FoRwg7oDjKrESuw8f3MG2/WxWSGO7gzDkonXpMEWZ2YYG6?=
 =?us-ascii?Q?uzKMd0ZH15IetGx6ChkFQg3nRp94sQ1YF1hul0iwgc/o5KyqqzMo7wea9baY?=
 =?us-ascii?Q?+vo43mnHAGpi/0DI2vkVFU+qH+/zadHWMvW2KVuofEZ2ZdStupYbV5PkhYZ/?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a523eb6e-677d-41af-ca53-08db093f0b0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 19:10:57.9809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnU89xs4k1MhdPpwEEG//t6DV8JcI+c/G0O1drku3mgZO0qlYLPBAr4Xo59X5g3Ty1jZY2wjWqPsK4pTxlMpIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6042
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 02:28:29PM -0800, Matt Roper wrote:
> The UNSLICE_UNIT_LEVEL_CLKGATE register programmed by this workaround
> has 'BUS' style reset, indicating that it does not lose its value on
> engine resets.  Furthermore, this register is part of the GT forcewake
> domain rather than the RENDER domain, so it should not be impacted by
> RCS engine resets.  As such, we should implement this on the GT
> workaround list rather than an engine list.
> 
> Bspec: 19219
> Fixes: 3551ff928744 ("drm/i915/gen11: Moving WAs to rcs_engine_wa_init()")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index f45ca3d4a07c..7e93ba6b3208 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1405,6 +1405,13 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		    GAMT_CHKN_BIT_REG,
>  		    GAMT_CHKN_DISABLE_L3_COH_PIPE);
>  
> +	/*
> +	 * Wa_1408615072:icl,ehl  (vsunit)
> +	 * Wa_1407596294:icl,ehl  (hsunit)
> +	 */
> +	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> +		    VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
> +
>  	/* Wa_1407352427:icl,ehl */
>  	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
>  		    PSDUNIT_CLKGATE_DIS);
> @@ -2536,13 +2543,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		wa_masked_en(wal, GEN9_CSFE_CHICKEN1_RCS,
>  			     GEN11_ENABLE_32_PLANE_MODE);
>  
> -		/*
> -		 * Wa_1408615072:icl,ehl  (vsunit)
> -		 * Wa_1407596294:icl,ehl  (hsunit)
> -		 */
> -		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> -			    VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
> -
>  		/*
>  		 * Wa_1408767742:icl[a2..forever],ehl[all]
>  		 * Wa_1605460711:icl[a0..c0]
> -- 
> 2.39.1
> 
