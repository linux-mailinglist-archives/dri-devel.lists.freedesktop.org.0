Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA067CC17
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7E210E8F0;
	Thu, 26 Jan 2023 13:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153D10E8FC;
 Thu, 26 Jan 2023 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674739683; x=1706275683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mi0LhlCR3xGiPj1VD02YMRRXnASKMqFvDmJoucYsskQ=;
 b=QNdj+nSMIqbRFPTKAWLos6ucu/OQcnVKPp2BNyvurUpuPck8PWG7v6Im
 866bXiHZ1uD6m60oTTKx6XX6NmOxZRHA6IN9tSf+mnfM2+EZAO4BxRBEP
 9awBK51VRG6QqmUkKeEkf6ncXsGc2IZmS2Y0F2alqe6PyDbiAU7b5PNGs
 KbrnmFFPH6BaN9jtUuA01mM7iOSsCw4DDHV/Ur8UJZ+j+F3AFlWbyQUJL
 PruTvFUMnj7/age1+RDe6NU6+eRIBGRU8/kXPtWCQolxBuwC7OdYEBxqg
 V9e8IohlqkZmurEsUNy9gQI+1NvFpHiQYzB8Cq+0V53AdzsLfqo2Thwvy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="328058825"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="328058825"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 05:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="731402245"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="731402245"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2023 05:28:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 05:28:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 05:28:02 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 05:28:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVJPmD5c2gztFJ8XPKldLbebtKCcbWPZGgEhp8k0R7MbJi2HxWvXwoZKgVjyv3awY+17ni8ykUeV2ZsEH7Y+xrfxqrI7a+QdQdHgm4xMDpe2NMo87Z/yhvvu2S9lkY99fw/ua4WjUXzhXOcOnP6Xk2tIWvy5rQlz22kuc+IXLDL5ugNIuIP+tXC3kv5XCwqRL9fJZ//TIYGbiZJWfFoyzPerolXGMbl83tgcVmyaToIQaaW0jsaa8M5bJchx7v4SL+mBcO7YK5pC2pKOAamF29qSFJvM1/FnoDZSosqXge143E17zzCCt87BXk9pWmwC/PJ48E6SnIja/W93lCSSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjB0yIOhLqPgjw4Nzprl5IE/1+K7c7Kl6sMve64xchk=;
 b=XtTXXpg4oTC3DxGYr4CCIspKWJuhGk4mEIFtEAoB1/t6TpcQpXquIaM1wh3puTUHFdODek718KWy8j5oYtpjFXKnILLMm+siMPNybU5iSaaKcJoteN7EpKP9TtYZdyGCcY5orLXzn1JETecZLk7CC89KtfHkROyeDsOI1jDe6sEWc4K6eETjbFvydjyXMMMaHQBPUDRpz8vYb8cQX861E0UZHhV8f//s07lHqFPpE3oHiVsVxoCf2lylThLLcjmeX+ml2/j4F1ft1XKYBzm1ddRYDv0C54e+FB+UrO8PI3Faf2nvfJeiQwnmu0F2tvLH2OmXrHbWUl/ZMXoLBhF0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:28:00 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 13:28:00 +0000
Date: Thu, 26 Jan 2023 10:27:54 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/i915/mtl: Correct implementation of
 Wa_18018781329
Message-ID: <20230126132754.km5kqzlfb23kvyqi@gjsousa-mobl2>
References: <20230125234159.3015385-1-matthew.d.roper@intel.com>
 <20230125234159.3015385-2-matthew.d.roper@intel.com>
 <Y9G+nlNmglzExuPt@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9G+nlNmglzExuPt@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: b506a1f6-7811-452e-89b1-08daffa124dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EBzOPNbIrH75rTk1rxgXHH129E/sk1LCjfJWcOhzNP9OjkS4oPnNuZNxHzW1oaUWXg+Pkto3cU8JyiIVs5w5gcZx/A2hnU9jxyBzl/6iS9oE9nNCYHm11XgVG7/ioJj4QjKa/nD5aMBfJUypC+hkkC45PeOsWeaZ28BfiOE1T851FGJCdThRPVvkzLAKil3zKesSQIL1M3bdF2Rlf5U4g/2remZqw2mueQZS7s4y0MAFIYgZny7G8RnMvu4hNhkWWu5ak4ORMfrU70Se++RMAHU9yrHmVsoELw/FV5nl9d/WKm6UoCDW20JcUlC/tm9SCLW/ssaBFTtCs6wk51jG9fquzMnA7x2ynC42HsfaEGFAb/VZj2e+2GBDFo94c+XaJe4kmXXHQvRgmX5Ajxe084nqHYaqLhBeLluy53i4zHzMF0bwFGJ8xP6wkTZNhTHElUlqnIHnQSERvezWA64OYwP1ILT6jbHhXmAseDTLSBUZ9JE18ycZyLbvwpc1MauEzxCenWQgBxQyiUABJuQBfU2idcl/41AUpjaHZDNjNX0Ftkoox0aJeQBHaNvDUNGvOJ7vFBjec4vPBNkTkixbhirvTDt4oWKg5VECLIGPVLpFmkLkanPiXa0wq2S1fxwLecF86n3V0b6woo2AJVbVOqBGktMhf6P1EPt93ockmXk/6zZvs8P8IgIE2uuBuT6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199018)(33716001)(1076003)(38100700002)(2906002)(44832011)(316002)(478600001)(6486002)(8936002)(41300700001)(66899018)(86362001)(83380400001)(6512007)(186003)(26005)(6666004)(9686003)(6506007)(450100002)(82960400001)(4326008)(5660300002)(8676002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIXQVbpIcMXTZl5AS0OFhlRdOtWW5jiNaA7ezadGELvDsJ1vMq1iUnPmD3n6?=
 =?us-ascii?Q?VjVAfrD9azQTDXfpXlVFX9T5AeUrT7kuKCpjFHBlRaQn4kAhpJy4HsH5flbU?=
 =?us-ascii?Q?OhWxLjPEVcUDPz0xzN8BgiQXHjKHC60/8c3noRZUdbKpje4jyoi2Ce1qdBTc?=
 =?us-ascii?Q?FqroRko+0+xXfpczrJzgg0yELgjrms1goNmAbBr475f/Y8dNqhtSjZTWJ7dP?=
 =?us-ascii?Q?QFN0ac2YAwE6Jg9XnwzFU/iKJUUXklOJKpg6KM27Hn1rEqOzKIopPUaHUJWd?=
 =?us-ascii?Q?lI0zMZ3Yh9+Zz9TnyQWomI8+3O5tLNKpioFrxzBUVd8+v7hJrz5sGUBE8bsb?=
 =?us-ascii?Q?BZ+/XD5UGi4s8gnpQFdEpTkC7ZxQofyOXYxvGMQ8crM0VAiLrtRvPQAC1ozi?=
 =?us-ascii?Q?Ad2Z0qcHY1JCScq66tt2xtOKbe16Jt5/fk5oT6oOaVyUgP8b+1qtbCbrcnxg?=
 =?us-ascii?Q?oReclwFhnKt4aemZQKOmSSgI+/flL9VFBD21BSAZmgbjNqaVVL2tbU1Nbfmu?=
 =?us-ascii?Q?gvitd1373fF1NvXTnhQzFEZb1F0sY3pcN8BjiZhNrRDL05aZCSCL8l4gg6yi?=
 =?us-ascii?Q?fhkFCjiL2fsgYXiXX0BNaAy7AW02sJ/gXKjozc91+GEvel+zN1yaRK/e7TNI?=
 =?us-ascii?Q?UyvbeizGIzJKP7csXHQNkO7LpKGiZkk54FYKIxD3HVSXNZl9keSPU+DNAGYT?=
 =?us-ascii?Q?m4c4avZLONxCejZ+WNyEKQsrAIvFG7qUd0C5Mue25Qv+fu603BaEUEsSB8m2?=
 =?us-ascii?Q?gWmvbdUkhZ04W3Id1eilc1HQqB1EEYtmz5eizSe+Ro5wBwRTaDitKDNA2cwO?=
 =?us-ascii?Q?X1szVchQ3TpJM9HEnHsfKWYADoXLg2JtWIu4d4poAjC7HTgdue73eIdHejQ1?=
 =?us-ascii?Q?vPooVhPBsx/6Ti+VjszT8wAT6ZyWCMkcTJ+quH0lLJ5l3fKQBi4vJB3D7GR/?=
 =?us-ascii?Q?4cFf9epBroloC82zXd+gppF74bbACL9+10r2L8MHxnIjVzOqpnzwp4IvINfK?=
 =?us-ascii?Q?yjClSj3RAPAS7tsSY9+CV2qB7UtBUeTeg5/+xyLpcOAVxcHoyykyCcmEeJkw?=
 =?us-ascii?Q?wKSaKr37OiHrRkCl0mU5W2wZDBkHRwobnSXy7jtFBOAiyTX24xeDqBOGNXjd?=
 =?us-ascii?Q?twrmNPn2MeCi5Kj3LX0uS1sHw4+LesFZbk3zjzyHEN0vTcU5koDuNdbbuz0U?=
 =?us-ascii?Q?Igtz+Ud0msYn0tTLj87dogGlJ6DZXE1UJn8IHMKL6V+XEBALgSUmnx2+CPYo?=
 =?us-ascii?Q?Xb6ADY0qmjXsaS5AyuWS7kphkQTtysBMRoSkX6jIw3kl8PcXt2m2OU0kKNNB?=
 =?us-ascii?Q?QR/TFNxGpbK4iKn8A4V2XwM5DAR5cgri9Eg2Eco7uXEYMH7nRVvVEn1oRcwZ?=
 =?us-ascii?Q?xvewAa/OINPVCrVELnHnYOPQu8iRwWNFpHvpZdrp16/W7BrfzPrEhkC4AziE?=
 =?us-ascii?Q?sGb4Xt7llbgRh0S6rBn1iKZ6Y1WsdMU+RAlXwhAWEr/iW4EeFxqUdbKi2BO0?=
 =?us-ascii?Q?cw/NQYp0WM7Ph7Wppc+gDY+VC/Ee3+R32ccGLH9r5k1lTuRnHhs4BdJ3FmCH?=
 =?us-ascii?Q?P52WSxQLo0CJ7PLkFi5QIUPdJo0M0GIoULzKgoBzzzsmCo3iuMn1xwsFMHJN?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b506a1f6-7811-452e-89b1-08daffa124dd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 13:28:00.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HAvwNALrIbHE03HspPaI43AdcOR5naBOjZj7r9CG1UOHr57T7Naq8qpOlaPqcZU8cWaOSK2EqJV8mIfmPEgsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
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

On Wed, Jan 25, 2023 at 03:43:26PM -0800, Matt Roper wrote:
> On Wed, Jan 25, 2023 at 03:41:58PM -0800, Matt Roper wrote:
> > Workaround Wa_18018781329 has applied to several recent Xe_HP-based
> > platforms.  However there are some extra gotchas to implementing this
> > properly for MTL that we need to take into account:
> > 
> >  * Due to the separation of media and render/compute into separate GTs,
> >    this workaround needs to be implemented on each GT, not just the
> >    primary GT.  Since each class of register only exists on one of the
> >    two GTs, we should program the appropriate registers on each GT.
> > 
> >  * As with past Xe_HP platforms, the registers on the primary GT (Xe_LPG
> >    IP) are multicast/replicated registers and should be handled with the
> >    MCR-aware functions.  However the registers on the media GT (Xe_LPM+
> >    IP) are regular singleton registers and should _not_ use MCR
> >    handling.  We need to create separate register definitions for the
> >    Xe_HP multicast form and the Xe_LPM+ singleton form and use each in
> >    the appropriate place.
> > 
> >  * Starting with MTL, workarounds documented by the hardware teams are
> >    technically associated with IP versions/steppings rather than
> >    top-level platforms.  That means we should take care to check the
> >    media IP version rather than the graphics IP version when deciding
> >    whether the workaround is needed on the Xe_LPM+ media GT (in this
> >    case the workaround applies to both IPs and the stepping bounds are
> >    identical, but we should still write the code appropriately to set a
> >    proper precedent for future workaround implementations).
> > 
> >  * It's worth noting that the GSC register and the CCS register are
> >    defined with the same MMIO offset (0xCF30).  Since the CCS is only
> >    relevant to the primary GT and the GSC is only relevant to the media
> >    GT there isn't actually a clash here (the media GT automatically adds
> >    the additional 0x380000 GSI offset).  However there's currently a
> >    glitch in the bspec where the CCS register doesn't show up at all and
> >    the GSC register is listed as existing on both GTs.  That's a known
> >    documentation problem for several registers with shared GSC/CCS
> >    offsets; rest assured that the CCS register really does still exist.
> > 
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Forgot to add:
> 
> Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
> 

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  7 +++++--
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 22 ++++++++++++++-------
> >  drivers/gpu/drm/i915/i915_drv.h             |  4 ++++
> >  3 files changed, 24 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 2727645864db..310bdde049ab 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1100,8 +1100,11 @@
> >  #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
> >  #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> >  #define COMP_MOD_CTRL				MCR_REG(0xcf30)
> > -#define VDBX_MOD_CTRL				MCR_REG(0xcf34)
> > -#define VEBX_MOD_CTRL				MCR_REG(0xcf38)
> > +#define XELPMP_GSC_MOD_CTRL			_MMIO(0xcf30)	/* media GT only */
> > +#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
> > +#define XELPMP_VDBX_MOD_CTRL			_MMIO(0xcf34)
> > +#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
> > +#define XELPMP_VEBX_MOD_CTRL			_MMIO(0xcf38)
> >  #define   FORCE_MISS_FTLB			REG_BIT(3)
> >  
> >  #define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 9db60078460a..4c978abf3e2a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -1681,8 +1681,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  	/* Wa_18018781329 */
> >  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> >  	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > -	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > -	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> >  
> >  	/* Wa_1509235366:dg2 */
> >  	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> > @@ -1700,8 +1700,8 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  	/* Wa_18018781329 */
> >  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> >  	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > -	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > -	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> >  }
> >  
> >  static void
> > @@ -1715,8 +1715,6 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  		/* Wa_18018781329 */
> >  		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> >  		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> > -		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > -		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> >  	}
> >  
> >  	/*
> > @@ -1729,7 +1727,17 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  static void
> >  xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  {
> > -	/* FIXME: Actual workarounds will be added in future patch(es) */
> > +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
> > +		/*
> > +		 * Wa_18018781329
> > +		 *
> > +		 * Note that although these registers are MCR on the primary
> > +		 * GT, the media GT's versions are regular singleton registers.
> > +		 */
> > +		wa_write_or(wal, XELPMP_GSC_MOD_CTRL, FORCE_MISS_FTLB);
> > +		wa_write_or(wal, XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +		wa_write_or(wal, XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> > +	}
> >  
> >  	debug_dump_steering(gt);
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 48c838b4ea62..4295306487c7 100644
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
> > 2.39.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
