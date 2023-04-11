Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C166DE4F7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 21:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E4810E617;
	Tue, 11 Apr 2023 19:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F8510E125;
 Tue, 11 Apr 2023 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681241333; x=1712777333;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=deAB8RXlYLAXo3NLxTd9rkPiuV/vvOFaVaL1Fll4Dsw=;
 b=QugVZdUbnSufXraC0nQekheiRrLzjgQzsqr1phlDWV5L1XY2WjtSnC71
 Z5gbjpipfqUdLsaWlYx7jSr063URrzLrMD0KMOiPrxW5FO3oHYHPFRXs3
 5rqXo9tyi5qwro95RIKYfpagybOZuYL7v2Y74qbn8lh3hC4dggBO149qV
 dWE7Qbh947F/JR2f3rUjs6gSMSwXFtek528olXU+8hddDJWOMokliKcEA
 kw6OpqP9bYExWS+mBWafm6+dMwk5C5jdqC6stjUwE/EdwOsgk8/UXmUE6
 U/VJ4bMXYhtC16WV8honi8X5CJ8joI41uMLaBTyBDjpVgdL40LmdWU38B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341204645"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="341204645"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 12:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753251924"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="753251924"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 12:28:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:28:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:28:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 12:28:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 12:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBuGLDrYuyDljyWMSM8jcFKV4U5i6WyzU3UM3nV3LdPLcPKhgYCdBLqLaYnqR+BqFQy/e3eHqVFJUj4RLvYIRsWAmqYWlA6spc+1z+gspSf5obf2SGQ2IpBtc1IvSDFRDgyn3Nnt3tAMw2ju9yweAtcTJmwNMhtqZ8buWZSlxRxT4eoqRbXWVDby+Jo7YJSq5MUePIW/LnXiBqMFoE6uR5E0XoWUSBJeWqr1L+6nIH25UaaYxtxLpgE8eFvj81PStwAJn50FjHvnmvUfEZFgKCe2+rSgvBW22ruP4Li8wkNE+V3z0FlLbuTjo5hV0TYDGfyVE48ZUqVO9Lp5PgSrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpQ6Y1sKRaoywNcbmc0/88mCJnTLqcdQNBL8KgDFYTc=;
 b=kY0gsBzmS86Qq3XB9uVI+O5iRv2tSN3m01YjeQtBYviM/kQeFrTxHyd0hfedcoQABmVbxIbjqfaCEaSoJDSleY2mkrpnBCyWQTjOzTdkhfHibP2Uojz2q41HJ/jF7EPt4+uL9PQxM+NlNx6taiTpC94S+2RemS+xVZKEs1zvCFwrl0Yc5rxSFVapO2MQpH5j102zjB2Gn7aX1d5XgHfWFfhmCChvdZn47R8ExPMRrznaibqr3chJN+ZLs4l6fSILvzzFSE1Ze+vs0p65DjQpy4uWEe9p5mun+P+6o43g471stRFVmZib7wqOMM9xi8wP2MRP0vrgZIZmk08ucPhM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB7709.namprd11.prod.outlook.com (2603:10b6:510:296::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Tue, 11 Apr 2023 19:28:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 19:28:51 +0000
Date: Tue, 11 Apr 2023 12:28:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <20230411192847.GY4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
 <20230407071236.1960642-2-fei.yang@intel.com>
 <20230410163434.GU4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d29c6d6-5e5b-4d6d-79cb-08db3ac2faae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ylx+fP0gzROUITXyPN0Mm4TcsDjZkZ1jf2zRNjTmrmXBgUneqDdKWY/FcISycxwfdWHTO0Wcp+8vT5dMQhnTpQ/CbZVc9khvKYCtJ6sMkybJSsqpqhhjtnlWPsK8m0aeAPuAYGvzgEAq8xLS4cU8qUSZDfyECvf605nBfbPK3NHDqi+KxnEW3NzrDudYhbp/vTtIV1dKUQ7EpUrhngFc6cbv978HRdvttnH1GBg3mOE7aam4PuBh8Fj2g0BIBNvQzpb2TEr/lUhUZ9dCpq1Mbh1JetkxZUMwoDJ4AGewzPskWUjKwmUz9LzK9zo/OUjFaMBFHwsaWauEyxNtvC6t3FHij4nHH3jrYVrnjo/ksNulN59DCkt8tnTH2uTevPwYkphk8ZtTGv9lde4bPzMv7LW6b6Tjv9a+0IWWc0EJt0xK3Z5J0wofFmEOALt+lIJ5G5fFh615T4YnYk6j6etRHX8zjyB+8jiak+DEf60mum6ncc6Em/0WJCTrK/FknLu+am6CCWsbGtOwLnYtqGb4VvbK0hFkKV0/3JOBHDjv+D1quVMzIp1Mlnf4Kfo8wSxg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(478600001)(6506007)(316002)(1076003)(6512007)(26005)(54906003)(186003)(6636002)(5660300002)(6486002)(450100002)(2906002)(66556008)(66946007)(4326008)(41300700001)(6862004)(6666004)(8676002)(8936002)(66476007)(38100700002)(33656002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TWMHdJoEDdGjO+09JU/Bl4tc8FyuwbPp3VgBHb+CyAKIFJTRTZzTQGn5MP?=
 =?iso-8859-1?Q?ykJC2T7RzfeMujbbRwIsiRIpbKdYPWF785uv3z4jP1qZPPsS9v6qs+2hs4?=
 =?iso-8859-1?Q?um99ss/O7+rlFYEn8avKwbZX2c/smnLpfs5bF72MMXlwrwb2WdTEZuhC1E?=
 =?iso-8859-1?Q?1mggzr2phjzKe1qel913oZS9j+XND3G4+WCwU84imNg9y92Xk5LHtriYem?=
 =?iso-8859-1?Q?z0qgwebRYHa3hY3H8VJmXrjxqnPsSFAdDOvcES6Y96Zrh06mxrm1SIzMLI?=
 =?iso-8859-1?Q?U9ePsz6l0YMY6yk1BrrU7acgMjF0BqITmlZs362fGStTgYaZslEIvW+HbU?=
 =?iso-8859-1?Q?KSrsRYSPPlCznZUrDQfRxzP+voLEKRStiS9qOk8zfTC2+vN/buie2k+791?=
 =?iso-8859-1?Q?FTXHviUwfAwx3B1Be3nby3y4J62sxxElJmDMeuCWx3n1Ub43FAOVsuXb2X?=
 =?iso-8859-1?Q?P4bGIufq/37X2wtZHEAPJWWpWDyiTPSxgBD69un1eL4UH8MfF8ic9vVHg2?=
 =?iso-8859-1?Q?HfzVEbPCRE91yEXJKQlR2Y3yty0HIGpTeTqaJZH4zvuOhhLMw3kSsZtuZR?=
 =?iso-8859-1?Q?4Kut7LKxDZ9y2qqMw8AB2VrTXgqpTIKsFSMuPvN9TdZoNR/W2fttg6Q252?=
 =?iso-8859-1?Q?EKzt/zLCxXsQ7Ak8qqaRcY0lrRZHGFNhQCScGGbhPhRG7FWEwErNFDIblH?=
 =?iso-8859-1?Q?mu2I//Q6MZwV9Ai6QTxDhfCFUgfaNPreDinL8m9ULCAT5G2zPlONLbEFsK?=
 =?iso-8859-1?Q?yWXiEdSxIXUFXNQdcryPiaiq4ms7oGtQG6Ej0rF7783Jjc1uPx2fpgdjIc?=
 =?iso-8859-1?Q?vOeamd/vYG2JFG8O1uZ6M++ga3xb0/U0YwoS2GDh11LBb5gjRxUgBFnvxY?=
 =?iso-8859-1?Q?8vt8WX3p3y1eXRonqkwSVmuItyMtefzlRXApvIuEH2mSLGmkXcw7dEYy8j?=
 =?iso-8859-1?Q?VkCzycxbckanU4ikxls+Z4nAvWEF4xgZKEWNtyFY6rdxF+6cuj4nPBsSXf?=
 =?iso-8859-1?Q?rnTQwa8VvyrXtFCvUkU5Q/g04ImjRAZ4XUVPYLX/Mc79/O6wzn4bY+t8LN?=
 =?iso-8859-1?Q?pklqXS5fgtKyuWv0J09vluA6h+3gSjkjR5aqyTAN1dOCLE7d7ObAkpaXKr?=
 =?iso-8859-1?Q?CEWeDGWbWVfA/nMUkAr6n0kYdIBoUcrsxnN/d7ErHNp7EatEENN6LWtx0y?=
 =?iso-8859-1?Q?kvbWadjgu2+zdsvM3+SuPU+37dflGtZNYAp5yQJYhW4tspM0U0xxjViVdd?=
 =?iso-8859-1?Q?R7AGG5y1qnGJT5Be+pXpOabDuamnJjirQ0z8gYRCj/jt/d21X6HtTF4kNR?=
 =?iso-8859-1?Q?CyXLUaQEzCbT2eChsDqgbhbbqWpBGpzF3U8LGBAZV512WvepLQwGR68DLT?=
 =?iso-8859-1?Q?qTPoYjNEvd95hycg6xT88vcZo49qTDRDGRlnKps/VzAYl/tWGr3pAh2OVX?=
 =?iso-8859-1?Q?j4Z6lx2hq29WulGqRqfbn6+DELfBJ0Ide4w0ry6YxDlVqqWWCX+Tkqk/VC?=
 =?iso-8859-1?Q?7EDFOCJaBkBfgmfuPHVhIV4OWdHjgukm4/4b43N3DQGQ64HD3jBFQ0bHCP?=
 =?iso-8859-1?Q?WJ1w9A3V5Xa7n8vl7Y04DDkuyDICIrXMRUvpWm8EXLedC5lpXBz1do9Nyz?=
 =?iso-8859-1?Q?EZVOrt6EmmxdyMpPvVd7EdaopAS/IJ7xhBIodwmqPb5gT5cTLVVHtO6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d29c6d6-5e5b-4d6d-79cb-08db3ac2faae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:28:50.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wEuw4nE8n9xRDPQQyAlnICZiOaFAiziZD1rGCothgWZ/3l7Hbp0Yo5HV8jHcOnGcgZm16j4qrt7/vRefnZeFOEmGO+a5LwHmWVcOFq7JTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7709
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 08:55:16PM -0700, Yang, Fei wrote:
...
>    >> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> 
>    >> b/drivers/gpu/drm/i915/gt/intel_gtt.h
> 
>    >> index 69ce55f517f5..b632167eaf2e 100644
> 
>    >> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> 
>    >> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> 
>    >> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
> 
>    >>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES             REG_BIT(2)
> 
>    >>  #define BYT_PTE_WRITEABLE                            REG_BIT(1)
> 
>    >> 
> 
>    >> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
> 
>    >>  #define GEN12_PPGTT_PTE_LM          BIT_ULL(11)
> 
>    >> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
> 
>    >> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
> 
>    >> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
> 
>    >> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
> 
>    > 
> 
>    > Which bspec page is this from?  The PPGTT descriptions in
> 
>    > the bspec are kind of hard to track down.
> 
>     
> 
>    [9]https://gfxspecs.intel.com/Predator/Home/Index/53521

The bspec tagging is a bit bizarre in this area, but I don't believe
this page is intended to apply to MTL.  Note that this page is inside a
section specifically listed as "57b VA Support" --- i.e., this general
section is for platforms like PVC rather than MTL.  MTL only has 48b
virtual address space (bspec 55416), so I think one of the pages in the
48b sections is what we should be referencing instead.

If they screwed up and put MTL-specific details only on a PVC-specific
page of the bspec, we should probably file a bspec issue about that to
get it fixed.

> 
>    PAT_Index[2:0] = {PAT, PCD, PWT} = BIT(7, 4, 3)
> 
>    PAT_Index[3] = BIT(62)
> 
>    PAT_Index[4] = BIT(61)
> 
>     
> 
>    > But if these only apply to MTL, why are they labelled as "GEN12?"
> 
>     
> 
>    These apply to GEN12plus.

That's not what your patch is doing; you're using them in a function
that only gets called on MTL.  So the question is whether these
definitions truly applied to older platforms like TGL/RKL/ADL/etc too
(and we need to go back and fix that code), or whether they're
Xe_LPG-specific, in which case the "GEN12_" prefix is incorrect.

Also, handling the MTL-specific PTE encoding later in the series, after
the transition from cache_level to PAT index, might be best since then
you can just implement it correctly at the time the code is introduced;
no need to add the cache_level implementation first (which can't even
use all the bits) just to come back a few patches later and replace it
all with PAT code.

> 
>     
> 
>    >> 
> 
>    >> -#define GEN12_GGTT_PTE_LM           BIT_ULL(1)
> 
>    >> +#define GEN12_GGTT_PTE_LM                         BIT_ULL(1)
> 
>    >> +#define MTL_GGTT_PTE_PAT0                          BIT_ULL(52)
> 
>    >> +#define MTL_GGTT_PTE_PAT1                          BIT_ULL(53)
> 
>    >> +#define GEN12_GGTT_PTE_ADDR_MASK       GENMASK_ULL(45, 12)
> 
>    >> +#define MTL_GGTT_PTE_PAT_MASK                              
>    GENMASK_ULL(53, 52)
> 
>    >> 
> 
>    >>  #define GEN12_PDE_64K BIT(6)
> 
>    >>  #define GEN12_PTE_PS64 BIT(8)
> 
>    >> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;  #define GEN8_PDE_IPS_64K
> 
>    >> BIT(11)
> 
>    >>  #define GEN8_PDE_PS_2M   BIT(7)
> 
>    >> 
> 
>    >> +#define MTL_PPAT_L4_CACHE_POLICY_MASK             REG_GENMASK(3, 2)
> 
>    >> +#define MTL_PAT_INDEX_COH_MODE_MASK              REG_GENMASK(1, 0)
> 
>    >> +#define MTL_PPAT_L4_3_UC              
>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> 
>    >> +#define MTL_PPAT_L4_1_WT              
>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> 
>    >> +#define MTL_PPAT_L4_0_WB              
>    REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> 
>    >> +#define MTL_3_COH_2W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,
>    3)
> 
>    >> +#define MTL_2_COH_1W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK,
>    2)
> 
>    >> +#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> 
>    > 
> 
>    >The values for these definitions don't seem to be aligned.
> 
>     
> 
>    These are aligned with
>    [10]https://gfxspecs.intel.com/Predator/Home/Index/45101

I mean spacing aligned.  If your tabstops are set to 8, then the values
don't line up visually.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
