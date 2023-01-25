Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3B67BE38
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE54510E8BE;
	Wed, 25 Jan 2023 21:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4100010E8B6;
 Wed, 25 Jan 2023 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674681873; x=1706217873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qLdvv9rlIT1pauYStDzIYQ9YGN3w9T0ZEjMVhP5jZMk=;
 b=byVptlSEgY2pnys39ovsbb4N8sk6sAkQJFvpyxaak7vbeXBVD7XPffsb
 L8npR12Bqch4io7Qxu2pNEhHnMGfR3Lcqdh/z3ESHU5tssAFQyiM+LQeq
 DFuP2HsC8p/X8tDV5WxJa8R9tAEuASBCUrWANsadsI7UdCenmyxl0AtDd
 Cn3pzHbU2XE1BP9gkYci5fo1Z5aJ3BZH7tVqDQ8wroM0M9Rn4iWbuEIok
 oQRQUJCQyNxdJFauyfIUOsHlpHL61HuoWzuq7INwZ5+W4dnaP2L2jpO/l
 KULbA7ySa4ZJUFlLJiT2LKadFyfp7/7kwoXEhAg0JTNnCTAb7Z4CJ+yUp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="310260996"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="310260996"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 13:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="731189336"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="731189336"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2023 13:24:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 13:24:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 13:24:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 13:24:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 13:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdyanGam4egNArVBPWS3TaBXv2Yy2Vzejm2CsSuyOMQisnhdyTpmFxSkfM614Il7hKiNJtwd+t0NAL0CHJ4EsXUlD9+6LKrtTtlhAAsJF7u7tfr1bZ6mG0RusL5Dw4dRdAal8gbz9yTD3NUAD3nBvVQlNvd3o+cKVAakBXBp72zbFIZIEpmrk98utErH9urDaVZcO9WP4zmYn23iFa3/3YBPSEnVmUvVIL99F+caM9W2JCVbuor0bJVF3Q+kvoRvjHNEZn3ieWzZSOT3DXETVe7KabfkneumvdNztOdSRIdvVcbDMn3QhxZQrZMiWbs44zeNHACBRVbmWh6aXgKN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdWvfG/LlvFZYqLTqii3AKse4IoR5PCPZU30BHjEou4=;
 b=C+md91Gi15q6RV/xa/1kAYvCq2hl0B/JHkHa86Y1HfduGxwSV/geP6J+CfTSosFyLAi/mKhYM+G0krp9/Cri2Wpn8MJWx8PI0SbeVcRvKUx8Ae+8++S4A3hha2lJo1AGOJp3HXgAghcC+cOMn3Rwkl7JyK5mQi/YofvzRc7VACLKQIPXmN3t9QbpzfeHkSqh3dTtq3c/toVxm3uy8VLO71hH+NX1jzMZcXWLgYSVTLTS+eONynZgu5Im4IUWaVvjGFreXF/CrZ962/ALed/AsmMZonWoc1ZaqSiQLcF6HlAx/ciXrYEbJEStGoNQO5y1GT6XhVxG4YkRm5CP17WD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 21:24:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%9]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 21:24:29 +0000
Date: Wed, 25 Jan 2023 13:24:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/xehp: GAM registers don't need to be
 re-applied on engine resets
Message-ID: <Y9GeCaW+V6xVNzZ9@mdroper-desk1.amr.corp.intel.com>
References: <20230125011407.2821808-1-matthew.d.roper@intel.com>
 <20230125194329.ekbjjywhtlt573op@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125194329.ekbjjywhtlt573op@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8aa1b7-12bb-4aba-e3ef-08daff1a8a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWL6OfF537rXF2UetVYOl9qd8x9h+jrPecTa5EytFpAikvLxspRnb7WndEI4Q4n4ZlU0wkq3c/JSxSSBnza1ACfjF9eLmT2O5KXbN9raWFrEoznQ6u4DOEGxNlUUW58DOdmKDWDwemzrH1jjpGt44QzCSHTfYB1er3NyoOhk/SL90fZ5/tFX3aaxw+8PhDeihen6BDF4thMvkh6cD7JFhvNSqQVTD0put7bLZyi/e2pnd+rbB80RM3sZ450qHqjBnpIhp/ofq1DliSbgkqqm+5+p7+Edi+iwVBBE8Kw2bmVG2F5uUMoR1wmeftlqsC08eu7iyTvP3iDgKXebEC7XFwEbSsQZiv8YdAXj/HJ6G+JVl3Vji/M8zxbSsZG867nRx2ll4+bZprqulqRR+rmr7h7EEM8ecR/4DxjN1yJQ4YQLumFIBr2VSGKkn10t1twujaQcdKLFPh2SwFUtW9uj5Ns3xMwKDrUDMRhjOQMZ0H81Wh308uPYYUy/mYTybGlslcigiFgCKWyzMqLTgL9S0FAK09kEhtBn50KcS+jj+f415u1Vf1dzTXEpULoi0dDyc12aYfR/4RRWKEKgwbPWGOmmjhEOEcJH/xc9yRUCa0Cmv69GcKIgZb3Std8RAevYVuGW3bJvTihdAHLbKkXJb5Rrzz3l6oUSn/2PkYlbyYSSng3WvGzncOIhnxPQj+E/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(41300700001)(66574015)(8936002)(6862004)(38100700002)(5660300002)(2906002)(30864003)(82960400001)(83380400001)(6506007)(6486002)(86362001)(186003)(6512007)(26005)(478600001)(6666004)(450100002)(66946007)(66476007)(66556008)(4326008)(8676002)(316002)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ltGlNdCF93CXc5eVfeNCvbTH9A/b0oGO5/t/ECEyQZFsxHATeEh12OOT1imo?=
 =?us-ascii?Q?05lMfWxEh+T0k0KadqN2HwcadZ2SyBiDgQI3JczIAbt54fpDMvyAXh+6c7Ui?=
 =?us-ascii?Q?maMFZZB/eu3BUbc/+dDz4ccH80ymocqneX1ks+7IWxuUXbD36uJNVYUH/LBp?=
 =?us-ascii?Q?oQPtUdH2Hqyh8h/Z3nAlz9yYhv/GZTsT8giuuraSes62SKEm5sSva7eOUYoh?=
 =?us-ascii?Q?9/35gFXfi9iubd/IUfXiznds085vkUBNusPbQGUYWfU3MB86er+0cKFu0Nwd?=
 =?us-ascii?Q?oUQ8TNE8NsaxLxHAiOOEGVplk3NBudDhClWYtGShQy90qIfbFEYAB+pNPr69?=
 =?us-ascii?Q?S+W4lLttLor+Zux3+pHXJ2eK6dCghk+0R1QRJjS9ipyrLRclv9BHxow8WLvg?=
 =?us-ascii?Q?A3+qaEvqw/Sa8kUoKy5A8lXUVsfr9A87agKbkkNeN+SlOCnUS3JO2NXBSXPJ?=
 =?us-ascii?Q?Bn8Pv8WWUGkrPSImaPoDh2aNqUNJPuW1x+19NZ8Me0yQ39eNJZwpOvObRLN5?=
 =?us-ascii?Q?gRSbWr24/O84Wk4x95nZ4tcL5guFz+5AsZgfOpi8s49IspoPNnZFttaqZod+?=
 =?us-ascii?Q?erCBXgRwf7GSaeG8QewT2a1yKbmnRAb4U4+j7PLUmJ0QnbQ4qAULVXk0U1ZS?=
 =?us-ascii?Q?Yu18xGAIWQPxyl+UGwwn4Pl5eZLsS30ft7pPTqLJqXQtwF3XbOuoMLRmJ4hn?=
 =?us-ascii?Q?bACksWgO8oxPPhoZ9tINNkmiwrG9TvjkhD+4+yI3SX2gmfFKOhMc0mX054Mz?=
 =?us-ascii?Q?R+Y82rpX3+R16iJ9kTXLsY+3LsM4KgsPMtn3EpamDR9C8dTFQehoOYMYIoPY?=
 =?us-ascii?Q?KDf75bFcYZ+lbIah9RiP4Zo9TWqtiTF0LyIuY//GPQiLA8fs+aC4MJvhN4tY?=
 =?us-ascii?Q?1fN6VF2hckcR5vw0IsVdDutcOdCu3ejQLFltib8q/J5Hj7he37dnheoAWdFe?=
 =?us-ascii?Q?CXF0HyDoOSzxe3BaeV2uCBNw4hUHydrmzOXXHqa01MNlxaedIKUztIkxMU6i?=
 =?us-ascii?Q?ZRkPFZlmT+DEttAKup4HGhrFWS7bLOf9n2t+elPWA3plzaTlaJiQf5xEjXqi?=
 =?us-ascii?Q?L2Vj2dyQvuTLCMR4FCbV65gDaSkdBvGAD/Q1fpx3rOehisH7AT/OkHWXmz6h?=
 =?us-ascii?Q?NSfh9qWqcl69+/iab0KyNpWdpU8Va0xJd3v1O2UP4Rmxr6YkYcogmp6ek8Wd?=
 =?us-ascii?Q?F4XCNh4i/4BybXmmGAZS9yLWd3Y6mGM+0jLYmZXufnXjoJfq6pestELgoZJ4?=
 =?us-ascii?Q?8HWFDrlDA9I4kLeFkLTsTcSIgjteaU882EDhDFL/RRw8RhZ1vOPPsZ1CPVe1?=
 =?us-ascii?Q?rdrzojK4t2MxzDRdvVKPqVHla8r3xp2buZSfm+PTxN7Sp13bDrCWFgqz5s7z?=
 =?us-ascii?Q?LpmFBZUbbpDN+XO2gZI+e+OHlVHbCZd7xyIICixYH8TdQ1BSlWBizikf0mkd?=
 =?us-ascii?Q?ZfUB+FGxvuptsfP2y8fG+xwhSdA7YBv0AorEjTVDS6NKd5DRaZwPQwyLpaSN?=
 =?us-ascii?Q?AGZ4rf0B9xm4J2P1WBbVHbEFUhmzvJrjvwv9/PYMJsT4S9oNvoa2zTzEp2GD?=
 =?us-ascii?Q?skQY1lutpxg5BwEDKnWehXvzI4JM9Vzf5Gqabjh2i2bVGy041NjRKspJvHb4?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8aa1b7-12bb-4aba-e3ef-08daff1a8a98
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 21:24:28.8198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOW8nx17spfJ8oQlLMAZ8azVDjNjCCZIbb4DT1KOLWZumtxjukjpFhxbRjfxgc+8CPGk5SHJxbshqeFuGxdmCLWu/P+GA7kyErTj4CV78ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 04:43:29PM -0300, Gustavo Sousa wrote:
> On Tue, Jan 24, 2023 at 05:14:06PM -0800, Matt Roper wrote:
> > Register reset characteristics (i.e., whether the register maintains or
> > loses its value on engine reset) is an important factor that determines
> > which wa_list we want to add workarounds to.  We recently found out that
> > the bspec documentation for the Xe_HP's "GAM" registers in the 0xC800 -
> > 0xCFFF range was misleading; these registers do not actually lose their
> > value on engine resets as the documentation implied.  This means there's
> > no need to re-apply workarounds touching these registers after a reset,
> > and the corresponding workarounds should be moved from the 'engine'
> > lists back to the 'gt' list.
> > 
> > While moving these GAM-related workarounds to the various platforms' GT
> > workaround functions, we should also take care to handle Wa_18018781329
> > properly for MTL's two GTs --- the render/compute setting should be set
> > on the primary GT where those engines reside, and the vd/ve/gsc setting
> > should be set on the media GT.  Previously the VD/VE/GSC setting was not
> > being properly applied.
> > 
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Fixes: edf176f48d87 ("drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list")
> > Fixes: b2006061ae28 ("drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds")
> > Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 88 +++++++++++++--------
> >  drivers/gpu/drm/i915/i915_drv.h             |  4 +
> >  3 files changed, 59 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 2727645864db..4a37d048b512 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1100,6 +1100,7 @@
> >  #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
> >  #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> >  #define COMP_MOD_CTRL				MCR_REG(0xcf30)
> > +#define GSC_MOD_CTRL				MCR_REG(0xcf30)	/* media GT only */
> >  #define VDBX_MOD_CTRL				MCR_REG(0xcf34)
> >  #define VEBX_MOD_CTRL				MCR_REG(0xcf38)
> >  #define   FORCE_MISS_FTLB			REG_BIT(3)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 4efc1a532982..0e7f64bb2860 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -1559,6 +1559,19 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  
> >  	/* Wa_14011060649:xehpsdv */
> >  	wa_14011060649(gt, wal);
> > +
> > +	/* Wa_18018781329 */
> > +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> 
> Maybe worth mentioning in the commit message that Wa_18018781329 is being
> extended to XEHPSDV in this patch? This could also be on its own patch.

Yeah, it's probably better to just drop it from this patch.  We could
potentially add it to xehpsdv as a separate patch down the line if
necessary.

> 
> > +
> > +	/* Wa_14012362059:xehpsdv */
> > +	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> > +
> > +	/* Wa_14014368820:xehpsdv */
> > +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> > +		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
> >  }
> >  
> >  static void
> > @@ -1599,6 +1612,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  				DSS_ROUTER_CLKGATE_DIS);
> >  	}
> >  
> > +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0) ||
> > +	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0)) {
> > +		/* Wa_14012362059:dg2 */
> > +		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> > +	}
> > +
> >  	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
> >  		/* Wa_14010948348:dg2_g10 */
> >  		wa_write_or(wal, UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS);
> > @@ -1644,6 +1663,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  
> >  		/* Wa_14011028019:dg2_g10 */
> >  		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
> > +
> > +		/* Wa_14010680813:dg2_g10 */
> > +		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
> > +			    CONTROL_BLOCK_CLKGATE_DIS |
> > +			    EGRESS_BLOCK_CLKGATE_DIS |
> > +			    TAG_BLOCK_CLKGATE_DIS);
> >  	}
> >  
> >  	/* Wa_14014830051:dg2 */
> > @@ -1658,6 +1683,16 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  
> >  	/* Wa_14015795083 */
> >  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > +
> > +	/* Wa_18018781329 */
> > +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +
> > +	/* Wa_1509235366:dg2 */
> > +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> > +		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
> >  }
> >  
> >  static void
> > @@ -1667,16 +1702,27 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  
> >  	/* Wa_14015795083 */
> >  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > +
> > +	/* Wa_18018781329 */
> > +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> >  }
> >  
> >  static void
> >  xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  {
> > -	/* Wa_14014830051 */
> >  	if (IS_MTL_GRAPHICS_STEP(gt->i915, M, STEP_A0, STEP_B0) ||
> > -	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0))
> > +	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0)) {
> > +		/* Wa_14014830051 */
> >  		wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
> >  
> > +		/* Wa_18018781329 */
> > +		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > +		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > +	}
> > +
> >  	/*
> >  	 * Unlike older platforms, we no longer setup implicit steering here;
> >  	 * all MCR accesses are explicitly steered.
> > @@ -1687,7 +1733,12 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  static void
> >  xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  {
> > -	/* FIXME: Actual workarounds will be added in future patch(es) */
> > +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
> > +		/* Wa_18018781329 */
> > +		wa_mcr_write_or(wal, GSC_MOD_CTRL, FORCE_MISS_FTLB);
> > +		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> 
> By looking at the spec, I under the assumption that GAM registers in MTL Media
> are not multicast. Am I wrong?

Hmm, good point.  And surprising too...hopefully that's legitimate and
not a bspec oversight.  I'll send an update to reflect this.


Matt

> 
> > +	}
> >  
> >  	debug_dump_steering(gt);
> >  }
> > @@ -2351,12 +2402,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> >  				 GEN12_DISABLE_READ_SUPPRESSION);
> >  	}
> >  
> > -	if (IS_DG2(i915)) {
> > -		/* Wa_1509235366:dg2 */
> > -		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> > -			    GLOBAL_INVALIDATION_MODE);
> > -	}
> > -
> >  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
> >  		/* Wa_14013392000:dg2_g11 */
> >  		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> > @@ -2416,18 +2461,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> >  		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> >  				 DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
> >  
> > -	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> > -		/* Wa_14010680813:dg2_g10 */
> > -		wa_write_or(wal, GEN12_GAMSTLB_CTRL, CONTROL_BLOCK_CLKGATE_DIS |
> > -			    EGRESS_BLOCK_CLKGATE_DIS | TAG_BLOCK_CLKGATE_DIS);
> > -	}
> > -
> > -	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
> > -	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> > -		/* Wa_14012362059:dg2 */
> > -		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> > -	}
> > -
> >  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
> >  	    IS_DG2_G10(i915)) {
> >  		/* Wa_22014600077:dg2 */
> > @@ -2990,12 +3023,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
> >  	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0) ||
> >  	    IS_PONTEVECCHIO(i915) ||
> >  	    IS_DG2(i915)) {
> > -		/* Wa_18018781329 */
> > -		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > -		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > -		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > -		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> > -
> >  		/* Wa_22014226127 */
> >  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
> >  	}
> > @@ -3062,13 +3089,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
> >  			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> >  			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> >  		}
> > -
> > -		/* Wa_14012362059:xehpsdv */
> > -		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> > -
> > -		/* Wa_14014368820:xehpsdv */
> > -		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> > -				GLOBAL_INVALIDATION_MODE);
> >  	}
> >  
> >  	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 2a6e212f8824..e90baa28a308 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -696,6 +696,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >  	(IS_METEORLAKE(__i915) && \
> >  	 IS_DISPLAY_STEP(__i915, since, until))
> >  
> > +#define IS_MTL_MEDIA_STEP(__i915, since, until) \
> > +	(IS_METEORLAKE(__i915) && \
> > +	 IS_MEDIA_STEP(__i915, since, until))
> > +
> >  /*
> >   * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
> >   * create three variants (G10, G11, and G12) which each have distinct
> > -- 
> > 2.39.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
