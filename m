Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1749C5BD79D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004C710E1A3;
	Mon, 19 Sep 2022 22:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4010E19A;
 Mon, 19 Sep 2022 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663627765; x=1695163765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5icG0kgwonadEFYzNE216REaozVgMr7m3DMWQRZUbQ=;
 b=R/GP3XLRPx3LWwLC4EuPBM43/I1I9OilXT7acPJzeDImdwq6eZsJAPX/
 FBtAOFH4JEKM0c3A3uXTjZCmM0TvPMKB5w+oukq4DtfkyH6IBtdMNIdfn
 Mf7MdUoIKpVrBx6XmB8GN62kzxXLLMraaxEoVPuCsjI51wdEpkGDfUkNE
 NVDYDOtGNIQKYc6ACejqL0UozPz/ol3NIcUXOeuXy2iSkpuJsEAPHbz2f
 fHRyuMkaGmW0rMA3lrvvfqf0b5y6dM83cyK9++Z63eh7tgQyXdjz/krJG
 6RE+lyXHw0LHrOwZeO9RtQ0SP+j7tFhtHCBsjyD23Y81SkZ9sv54lGUkk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="297132833"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="297132833"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="618675703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 19 Sep 2022 15:49:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:49:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:49:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 15:49:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 15:49:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B10tXyohEzC+EdwvzN4CW/VtQX2fDlt9WsfPemyfQyhfaFZtMkdMvY/XqbeOwom9EspbX1l+UpgO6Nxv8cwaAwzkYBHgs32q07G4iUKSZy0kA824CM9FI42UjrIr6KQ8OvIVYR3QvqiOOybPNHKhvd8UArn04U70zhDVJCh/ZCbeiaDPj2Rp69Fd6pY4zLakGk19nuBZWlqrRaPaU4IKU9GZ7ev6wPIkRPaJgx+cccSBTQzM3pCQNgfhw9NVVFcFzEn857q2ynPOIL0SuMOo8RZYFEYn1ghf2uDB23oE+XbScyc8rKe4OXxhPu5pYZZ/MLEOqJxOqZ29Bdm2BaYveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vuwjb0jYZj9Z3zCM6S+Bq7KkQcE0K0xy5NJ8G5EcsXs=;
 b=VQZgKNYK4CFyFMC7h2vu/l+2tF0DeDGkGpsztR1PCEojTj2wxLeXADpJ4asq+UyHST4zUzT36QZg+YyPnK1quXGelkDKKuHKZ19Jqwro2JcKH5ckNWRbNmxwIJSGi/gWBaSbU2XxKorW3fwEGsWrJ0Xd8NaSJl7dshO+RVxFVgFoUbQj0LeDJmLjQ+Vs1LAgmus+faLf6RmZdIlMZQyub6NvYckGThunJtUgig4Z2wwtwsqutaS8t//rx/Wru7pLRc5SHl+bb7zHXq03X4ttLMaf7DxFokNaBSBnP8CttLNCSI0JFWhPX556TLefEYv9mFnNE7i0Zyk8HeHO+4xnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 22:49:20 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5632.021; Mon, 19 Sep
 2022 22:49:19 +0000
Date: Mon, 19 Sep 2022 15:49:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/mtl: Modify CAGF functions for MTL
Message-ID: <Yyjx7Tgto5rpAM+B@mdroper-desk1.amr.corp.intel.com>
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
 <20220919115906.1264041-2-badal.nilawar@intel.com>
 <YyjxVHRRTOZAjQod@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YyjxVHRRTOZAjQod@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba98d2d-93bc-42ae-1e58-08da9a91303b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89D8t0a8VBSmY1MTRMQvUSJAI2dBML4imYWadz0jL4rndRvgzxry32tQPDcm4XipT087l3+YZ+0evhFz8vNEQvNmgoWsRoaGEn8uLuMHeA3XCNmbZ47PrXHNF3AXVj97YsFMI9UqmDX0f8VCXeM2oQ4dP9n2zSnbMzNAHdYkrZG3Fds32mLC6Rtuzz591M7VNxUiEEte/q9ayIn92vEEorqxyCbQql2MnCBD7P+w6u4BKLku7iwGai0chFugO2UBSQhDKyduDePm1JM59MrTthi3Lp2nH+isX1QwyEsZSJTEseasf/A92dPcbVkiv+dCWTdsiKqkHLvtu0GLSWzxgROCi79ZWGa+GcynXkZiCEPFCVysHuzJgRz+vuzh0k0CJlJfUGktWwVA3jGZZ9w+QLZ+p7CTosl3/kG+kmmG6eHEPu4f6joWZy4ltTb/ExjCFBGHihc60ZdKC9PR8HRx+o7TUnU3+frTRKsaXMjqLyVjddjCSgH4Dzc8Tsyxerfi5B64rjX6gfFrofVdazVnjwW+KSzy/GnQyAMaywG56/JwWXeHO5nm5F8sf8dXxF1tF8wyZ8lTS7ML2ncqKUxIUukqcy33qj1IIKmfK81+YmLC3Niwh8+RlvPojzQ1ywzRMoWbvV1rAb+aKE5GEVWjrSQItzHREpSf+ciNX8z9ulEmouX1tqMUNbGOGzli1hg4wFXByrErntRYgQet4+6bpfQsShzoiVNgi9sKO3ImOoPD+vzG7RnmTbzLLj6dm7JQjc+WjvhQatBVFcPvLLpq8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(2906002)(316002)(82960400001)(38100700002)(4326008)(8676002)(66556008)(5660300002)(6862004)(66476007)(66946007)(450100002)(86362001)(6636002)(8936002)(186003)(478600001)(6512007)(26005)(41300700001)(83380400001)(6486002)(6506007)(107886003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6LxjOFCHhRjZYOsWx2Hfxu54pjAICXjBbMzFblFaChzqUzThiFyUea3tIaC1?=
 =?us-ascii?Q?9hMwZCbY1/4CSUddyAjnH/YR7z+4wfgDY4DnXuOSagZv3VTk+bdVhEt91FHd?=
 =?us-ascii?Q?sP9qJXQyVJ6hIOjDm2qXVtAHrx5OXeqvdE9QZ5O5ysO6v2xcYooeMFgkGce5?=
 =?us-ascii?Q?wzImpjYldKEQyHNW8DoUHy2z+LjNuzZt7oToTjRPfIXczVA3vB8fDCvoNiqU?=
 =?us-ascii?Q?ikhU6fZiK/Ei1etlNdJUWdb2v9VUf1iJ7DstHjZWBd9HJURXXz5rBJqF4Tac?=
 =?us-ascii?Q?VX9W4rr73cFf7uX48u4k+pLzSzOAVOf3QwOmXZ300xzYIn0O8D+so7Ztlq7X?=
 =?us-ascii?Q?kDcun4HJJb98D7L/A8xLnROJcAXJsiTlg5AFr/o/NJlHm5KjYsWPRFUiXbLc?=
 =?us-ascii?Q?vHFuWwmG5IR8YOKGGEdOzTNH2vFNOHIlmZvBokzwJm60NRRZcb0xgx+B7w7U?=
 =?us-ascii?Q?dkieF7SrtGRCBWfuFWgu2RshrCq6UCri4rbz9jknThUWRahpAn1XlPakY7st?=
 =?us-ascii?Q?ztMuhouWM2Nnmc9r7nSN+idbrucYKxcZbHWBCcdwU/inJcsVjyyKqpzp0bS4?=
 =?us-ascii?Q?KFt8tIxMqdpmNnABJ7fyUnZ/TBxV4NE74zEyD6PoxaNTwW1+gjurqvfNUkkt?=
 =?us-ascii?Q?GCzmRwziliB5nbSqmXtTPfQBq2QEl/aZl+TrIhot5x5R2TH9eoSTfDtZlCEY?=
 =?us-ascii?Q?iLQrLX4cTlK4nve5Bp4Q4DWe5ddKjk2ve8d0nLhSzrCQawCXL0pNKaosH+Fg?=
 =?us-ascii?Q?h54+krlgz/NwZUW/UhEh9wbLn5hJB6AFTDEiitpVOb+b9c4KJQUR9o3np/Zl?=
 =?us-ascii?Q?lgaaoKqpj93R2RfjCxxg2XxUbnZAVaf0n91W+3Wsvoryj35jW7YMapdJa9GN?=
 =?us-ascii?Q?HuoVSrfkg/VMHvecjs5PkLSdlx/KrPsz2/hQJB1+bJioBh9Ea+e0/6TPMKx3?=
 =?us-ascii?Q?RUUN8nn6VGtHoYMKBflD472BG1FAN2LdMZ/tn6v23tJZFeURYfeg5UYlt0hX?=
 =?us-ascii?Q?iU56RVYZqpmTM3QOB72l8w+IfVYsyapXBrSy2PtidkIybtQu5lZyVKl5wbH0?=
 =?us-ascii?Q?SegPUGwv5wlmP8CTi1EWe4q6vx7cusTckeeBth2kCEe5uwfWds/QfZSTI43e?=
 =?us-ascii?Q?uoCB6Kly1uNhBKuyEMKNJh4kkVrDYmFvPaQbRNRqlVMAily9eyO2LMfgOBTB?=
 =?us-ascii?Q?iOQ5eEwl9cPeKy1uQtDg9/aa5oG7dtlO9TADTK7v7v5CXKVv61qRkPNPnqA7?=
 =?us-ascii?Q?GreWROEehcoOXHYqX/QCkqxQKpP8dU7cm3wN5IaTfp1FNlb7Ne1RRAhplubM?=
 =?us-ascii?Q?8BFJ2y+OKz0FaENCL5AzjFH56+zS63tYe3rOchUVHPV4KailVm2mCF4zHriu?=
 =?us-ascii?Q?yJJj1Id26TVc6n9KIJxQF2I7BpcdTD2XNDGAjx2QkfewYJxoJgPj+TwjM2NV?=
 =?us-ascii?Q?v0w6YHs7F3eWLFcKkOxXKCPsKRL1W7MNJnMJuL9s9H+chs408ucUlYd3IJi3?=
 =?us-ascii?Q?zx1QjOeLf9k78v8sfZb2R5joSDMUNWd49uYj78HBGU6zdUL0xQha921yCrrC?=
 =?us-ascii?Q?XJVV7da++mk4laKvoezOIPYIkdC9t/DAjsr88WUweTYnw+3xbgNiwF8CMHCb?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba98d2d-93bc-42ae-1e58-08da9a91303b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 22:49:19.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx1rGac8TkOYc8Y5wuJzlEWuooyKKosVGps5juoDvR+BYGZmOf87j5WpfGOVVW5J6qhrJayHKpgBpp1aSxS80Sbme7FaGpEeoCz87Y1YN/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5456
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
Cc: andi.shyti@intel.com, anshuman.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 03:46:47PM -0700, Matt Roper wrote:
> On Mon, Sep 19, 2022 at 05:29:05PM +0530, Badal Nilawar wrote:
> > Updated the CAGF functions to get actual resolved frequency of
> > 3D and SAMedia
> > 
> > Bspec: 66300
> > 
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 ++++++++
> >  drivers/gpu/drm/i915/gt/intel_rps.c     | 6 +++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 2275ee47da95..7819d32db956 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1510,6 +1510,14 @@
> >  #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
> >  #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
> >  
> > +/*
> > + * MTL: Workpoint reg to get Core C state and act freq of 3D, SAMedia/
> > + * 3D - 0x0C60 , SAMedia - 0x380C60
> > + * Intel uncore handler redirects transactions for SAMedia to MTL_MEDIA_GSI_BASE
> > + */

Also, this comment is unnecessary.  This is already how all GT registers
work so there's no reason to state this again on one one random
register.

> > +#define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
> > +#define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
> > +
> 
> This register is at the wrong place in the file (and is misformatted).
>  - Keep it sorted with respect to the other registers in the file.
>  - Write it as "0xc60" for consistency with all the other registers
>    (i.e., lower-case hex, no unnecessary 0 prefix).
>  - The whitespace between the name and the REG_GENMASK should be tabs,
>    not spaces, ensuring it's lined up with the other definitions.
> 
> i915_reg.h turned into a huge mess over time because it wasn't
> consistently organized or formatted so nobody knew what to do when
> adding new registers.  We're trying to do a better job of following
> consistent rules with the new register headers so that we don't wind up
> with the same confusion again.
> 
> >  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
> >  #define   GEN11_CSME				(31)
> >  #define   GEN11_GUNIT				(28)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index 17b40b625e31..c2349949ebae 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2075,6 +2075,8 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
> >  
> >  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> >  		cagf = (rpstat >> 8) & 0xff;
> > +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> > +		cagf = rpstat & MTL_CAGF_MASK;
> 
> Generally we try to put the newer platform at the top of if/else
> ladders.  So this new MTL code should come before the VLV/CHV branch.
> 
> >  	else if (GRAPHICS_VER(i915) >= 9)
> >  		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
> >  	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> > @@ -2098,7 +2100,9 @@ static u32 read_cagf(struct intel_rps *rps)
> >  		vlv_punit_get(i915);
> >  		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
> >  		vlv_punit_put(i915);
> > -	} else if (GRAPHICS_VER(i915) >= 6) {
> > +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> > +		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);
> 
> Same here.
> 
> 
> Matt
> 
> > +	else if (GRAPHICS_VER(i915) >= 6) {
> >  		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
> >  	} else {
> >  		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
