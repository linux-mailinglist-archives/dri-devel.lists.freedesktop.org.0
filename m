Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D968A238
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E8C10E0A0;
	Fri,  3 Feb 2023 18:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08DF10E0A0;
 Fri,  3 Feb 2023 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675450097; x=1706986097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QZo/d46zLqN8q/IPbA+PKyuRhTKyeNh1RLdgXcRQqfc=;
 b=Zt2Z+Z0Qe66cohku2fu50vUc6MKCnJ6M5hyz+aae36t7wWxBC5PmteVn
 b6eND47/eulW8xXW1VsvWrYzjuQzbnofN2t4p22sKgiP+VwLc//6MKAcM
 qe5r9tuIskQGKDllAlBjYWhSx85++thpKEVQfOVZXIcqkcAPXKWauKhgr
 BEB6bZvFZyqi8b4iByT7AqeYf3VGv4Of8lvknEZX6Zrgj7iSGwb4q1LG6
 Gbc1HLmkgm2G/052H4OMhNVrHv22OYwPEUToNSX66pO7sQtrHoyfJLQHo
 iYCBRJykKMMJkA1Hr032kbP9tS+0WBirTb8ys4FRrndQD6OZ9S2ozLDgR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330950315"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330950315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 10:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="615804040"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="615804040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 03 Feb 2023 10:48:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:48:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:48:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 10:48:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 10:47:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm+0DlQ76kcUjJUnzo7IuC6R09AIEDO9xVEAnhqwZFwi/dOTYBXPQc6rmXB/qnzubWYNBWHAIae6xea1QEQOH8Wy095t8LDiBR621OuCk821gRqdzoDC5RHQrgWYECv1soMb59Ez7DSdri41rWiKEw48Apzrqq7HnFdABeS7drXsRDF+vXB9T5a936fRw+knRg9STY/4M9KWibYKYGzntdIGMGwqcFXDo2T1fbaYvcXmOMA8Zq3BbW6xS12WB9Z77Z6iiKPWFXOFfHCrXJmK3YuMy+aKlUXbDJRoR2j64XwV7/FT8ijzy8EURl2NWQNTbSfb2fLe3nusKoExiTQLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcLiYkGSRMHwkJCn100UHDCWnrl0dDUR0nhqCZZdypE=;
 b=I2uwSdfHk5Tps4ZWrbSGqPr3rSHTYDCwcz3/lfQDc68wOtuSzesqMHWRDlSEtVxLkDf5xUR05G0S6mxIvJyK4gQwXTCZe+Zj/KLyK/J//kYiJAbiL5ZSZHp+oikyI6sj6C+IlUs3M1IfV6qqGdDTeP1JC6XQj0BzTMjaUn+FoaexBtLM1SZyWmmMXJ918Mps8YTpJPo+3pe7az33k0cBeAWmVJESZaS6y2xBlg6P9lTCayDgGfx95rQ+2xX5b42M8I3krMXToY7SU1M386qs/7dwiLnSRm9bP23JQC9nE27+5wBqoTpUs6/2g04Rc0PfFlEPkTs87MPDbLA3UPn0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27; Fri, 3 Feb 2023 18:47:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%6]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 18:47:57 +0000
Date: Fri, 3 Feb 2023 10:47:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Fix GEN8_MISCCPCTL
Message-ID: <Y91W2cPplkWxjKt2@mdroper-desk1.amr.corp.intel.com>
References: <20230203005709.2612633-1-lucas.demarchi@intel.com>
 <Y9xfahu4Mf+fAank@mdroper-desk1.amr.corp.intel.com>
 <20230203180349.zseq4za55goqq4ih@ldmartin-desk2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203180349.zseq4za55goqq4ih@ldmartin-desk2>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3aa482-5dd4-48aa-75de-08db06172a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzFcmTK2jZf3qn+2LhuPXW3+iPhT53ceS7m04oVeZZbaTCpABzwgenj5A8HOFSuJq4yQDGXGp3Inl13zYSlkDIh06YiwB0JVy1mfwOZD3T5SUqSXRZ+QehycehThnmwEU6hh9v1neKBe46pviFkW1AQoT9NdYDjyhqbTFZFZ7GPsD7GECBR1dJAQXbppEoIYqUCD0kNgOghz/joi9hhUvd1+iVGyXGo1c47vxaZkd8TbAtwqEYPnjdJ1kDzKtGrmHLO3wxBgtXwB7nD6xJQCe88him8VeNCLJumSEcsmeJ3eMHaGAlskF4wwyfVBDnEf33kJgHueiNGrQ/Qenj13aiELOPtzr/L0k2S+ISO5Uqm7kH7nxqztuhgDa3SDwqbsoPrFrkYqIAddvIqNwv66zJ2afZrey2PgpJafNRVCAUpU7/t17FXTp+s/CZZN0QA520ga2WO6JLAqudk9C71wESYQvUQGDPixmSBexoE4ELJb12hVmyW9mieWdun2beJgnywzEmtPndeSrPK5Tx1rgmDuBzbfn2xQZwyNpArkIPUbRFoRXD9P8rb05BJNYxc3yypPtCAAkGMklWBsNC3yXcY4MXzGa/5vK6YExcq/ZEN4fN4xEqArhtgviHD31tr2on+hQrCIPsPSIxOEj5to4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(82960400001)(38100700002)(66946007)(6512007)(26005)(83380400001)(6666004)(186003)(478600001)(66476007)(66556008)(6506007)(54906003)(450100002)(4326008)(316002)(6636002)(2906002)(8676002)(6486002)(6862004)(5660300002)(86362001)(107886003)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hhQZ7meR4qk+ry7z+FBOVhMpGzRjbQorkhdYlAyW62iqLl8OW0TbW7uIh/S?=
 =?us-ascii?Q?Rac8xaT0kYv22liRpes9QXMYrpS5m6dpPyrOqrP7VxqueSYQfX2WkEGxb/XJ?=
 =?us-ascii?Q?KK97NNy4oXwSu2vKwMC549sp1HH/AGHDmLSq4vYYuWMwlqtZl+HPFtd6sR6N?=
 =?us-ascii?Q?jUbMn16EUgHZXQRkt8BgWpfuNn7QecqR5nGtRkqssi0LjYxzWfRzgeSEULnz?=
 =?us-ascii?Q?SEktgQQNXpNwayHS1UU6ESCNjR+SbEFYScicfQWq9wOcOS4NbidJo+L+Rce4?=
 =?us-ascii?Q?kL2EG9ii7CIhHU5Y9g6qKdrUhkokXEepcZqunMOHlKfeCCz88QXUC0qTWkbU?=
 =?us-ascii?Q?KwGVzUck9X/ARmH08P8vnoukEuNazwI+vHWMjKbwUtqQ0LKzSrdyusKmGYGt?=
 =?us-ascii?Q?Y4j4r7tY+TuLzgWbGyX8ZRkXWobmbABP+UycECMthpdTa3qi8cjbGim6/HHl?=
 =?us-ascii?Q?vcChHIvCkpilX5mvlkwmNF+l73u2tkZ9OZHfZPZwPmwGW9SeuKvrIWyJxY28?=
 =?us-ascii?Q?4BVCThK9c2KL+Z8VVUwy6kLJNo2jG386B7vgEGJ4EBtCc9miZFNa1mOEr7kE?=
 =?us-ascii?Q?huaJs/QfOpZfLuhJGGNMgd2nHEB3pTjjn+xdrJ3zefvNUA4t6I53aHENoJmk?=
 =?us-ascii?Q?gL2uI+tE03hFDLZAXf7GdZ2vv+X+UEPeC8d9JxJzpFsia8HS9Ebc/NsPRykA?=
 =?us-ascii?Q?81u7PLUpCMg72kMzMeT13aMSl6nb/38E/p7iLRnjGaQEojny4bMaMvfDHCbt?=
 =?us-ascii?Q?4TXV2dehlV1Fk7eN/h1+/WDTRoRBBAqIbVU2mbNAOCD1wzDUK2g9ZmKIKlV1?=
 =?us-ascii?Q?QVy+nAJNL2kUWMIay+4go1plk8zIJVcM1iH97YWGV7RL+xMbxWvUeKKJUF1k?=
 =?us-ascii?Q?5MV7SlQm9W3+ILA+ZLZ92SPCUdquGtkpd1WOUWmRYmL9AcHe5zBNeymK1tw3?=
 =?us-ascii?Q?OGwu1Fo9vwX+pcLBhn4RXz+c10oZKkSHNRu2Y999kYQo6bgLUxf05HBKhqyZ?=
 =?us-ascii?Q?6gRqSaq2Kbp1XymaMDYqp1zuHZemWq72VcHxflpMjrqFuXjKSEzOJjNUOAZV?=
 =?us-ascii?Q?q/BsqqvelER7gGy7vj0KHSm+fQhL4ZurJGnJgizOW2XlbZgez1EF8z2emDmE?=
 =?us-ascii?Q?KfLPFlE2uL/nLp2zVVCxTFB/AaZMWbl40ZARnwxltw6E6jnm6Lt7pwkSlfux?=
 =?us-ascii?Q?jzSjgxhKjEmHViEmkzN7FtILqHW3qmiC9yqAFvCPwi8SAJ0RjQUqcQ9HKids?=
 =?us-ascii?Q?tyi5eq3hQ+ZzHfS52j/yb/khTZ9C4YV3QG4zELS6+l+ystUvLAfJgHXuY60q?=
 =?us-ascii?Q?EJ7yBKzONnRitfPrks22D0qAQukJIHRAPs8XcxVstAkhFhdwMY4Dw/CRKIAX?=
 =?us-ascii?Q?6XMsihodXRLB6hBhotAMPzV0Bf23SQwaH0xNPE83S+qPncBIOUwxQH9oniv1?=
 =?us-ascii?Q?tD/w2wS5xUP71qUzAyOI/TaufOWM7dOKZWWzqr1uoC13MSAaAnH2p6Tvu0OF?=
 =?us-ascii?Q?gaA8lcJwgrE938kqKqhqFfwXAvCmidQqIbyy/GrN5TKSX5R+LUkITg3m8fYc?=
 =?us-ascii?Q?DYKP1d5hpSNhUSdxY36ZhOy5wHwAekNQjNXlv2q1c8oRQcAb+w6LYBxMZ6Z+?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3aa482-5dd4-48aa-75de-08db06172a23
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:47:56.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXcjywhEmFFPUV0B2vHowazATEr7Rk8/9SscEFEesh9bpqbIbrSept6AODIKCF7OV0XjcGKFHl5V9JUi0fnP0vrIU66EtPmHBHMpYDvTv+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 dri-devel@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 10:03:49AM -0800, Lucas De Marchi wrote:
> On Thu, Feb 02, 2023 at 05:12:10PM -0800, Matt Roper wrote:
> > On Thu, Feb 02, 2023 at 04:57:08PM -0800, Lucas De Marchi wrote:
> > > Register 0x9424 is not replicated on any platform, so it shouldn't be
> > > declared with REG_MCR(). Declaring it with _MMIO() is basically
> > > duplicate of the GEN7 version, so just remove the GEN8 and change all
> > > the callers to use the right functions.
> > 
> > According to an old copy of bspec page 13991, 0x9400-0x97FF was an MCR
> > range on gen8 platforms.  Newer copies of that bspec page forgot to even
> > include the register range table, so it's not obvious unless you dig
> > through the history and look at a version from before Aug 2020.
> > 
> > However bspec page 66673 indicates that this range went back to being a
> > singleton range in gen9 (and the other forcewake pages for newer
> > platforms indicate it stayed that way), so that means BDW and CHV are
> > the _only_ platforms that should treat it as MCR.  Usage for other
> > platforms should either add a new "GEN9" definition, or just go back to
> > using the GEN7 definition.
> 
> sounds like more a spec mistake. This range was listed as
> "slice common". I'm not sure we'd really have to set any steering for
> specific slice. Another thing is that we didn't set any steering for a
> long time in this register and it was working. Even now there is no
> table for gen8/gen9 in drivers/gpu/drm/i915/gt/intel_gt_mcr.c, so any
> call to intel_gt_mcr_* will simply fallback to "no steering required".
> 
> For me, any MCR_REG() should correspond to registers in these
> tables.  I don't think there's much point in annotating the register as
> MCR in its definition and then do nothing with it.  Btw, this is how I
> started getting warning wrt this register: as you knowm, in xe driver
> you added a warning for registers missing from the mcr tables,
> which I think is indeed the right thing to do for the recent platforms.

I guess that's fair.  Even though gen8 had multicast registers, I
believe the two types of steering (subslice and l3bank) could always be
reconciled with a single steering value; since the IFWI took care of
initializing this in a sane way, i915 never actually needed to touch it
(except when doing unicast reads for an errorstate dump or something).

I'm not sure the same is always true for gen9 though.  We should
probably add tables for those just to be safe, but that's future work
rather than something that we need to worry about for this patch.
Likewise, we should also finally kill off mcr_ranges_*[] in the
workaround file at some point; now that we have is_mcr in the workaround
itself, those range tables are redundant.  But that's also work for a
future series.

> 
> For gen8, this change here should not change any behavior.  It
> changes for gen11+ to the correct behavior. So I don't think we need to
> care much about double checking if gen8 had a unique behavior no other
> platforms have.  I think just amending the commit message with more
> information like this would be ok.

Yeah, sounds good.  With a slightly updated commit message

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Also use intel_uncore_rmw() rather than a read + write where possible.
> > > 
> > > Fixes: a9e69428b1b4 ("drm/i915: Define MCR registers explicitly")
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > > Cc: Matt Atwood <matthew.s.atwood@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 +----
> > >  drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++--
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c   |  5 ++---
> > >  drivers/gpu/drm/i915/intel_pm.c             | 10 +++++-----
> > >  4 files changed, 10 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > index 7fa18a3b3957..cc1539c7a6b6 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > @@ -686,10 +686,7 @@
> > >  #define GEN6_RSTCTL				_MMIO(0x9420)
> > > 
> > >  #define GEN7_MISCCPCTL				_MMIO(0x9424)
> > > -#define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> > > -
> > > -#define GEN8_MISCCPCTL				MCR_REG(0x9424)
> > > -#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
> > > +#define   GEN7_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
> > >  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
> > >  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
> > >  #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > index 29718d0595f4..cfc122c17e28 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > @@ -1645,7 +1645,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> > >  	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
> > > 
> > >  	/* Wa_14015795083 */
> > > -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > > +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > > 
> > >  	/* Wa_18018781329 */
> > >  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > > @@ -1664,7 +1664,7 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> > >  	pvc_init_mcr(gt, wal);
> > > 
> > >  	/* Wa_14015795083 */
> > > -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > > +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> > > 
> > >  	/* Wa_18018781329 */
> > >  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> > > index 3d2249bda368..69133420c78b 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> > > @@ -39,9 +39,8 @@ static void guc_prepare_xfer(struct intel_gt *gt)
> > > 
> > >  	if (GRAPHICS_VER(uncore->i915) == 9) {
> > >  		/* DOP Clock Gating Enable for GuC clocks */
> > > -		intel_gt_mcr_multicast_write(gt, GEN8_MISCCPCTL,
> > > -					     GEN8_DOP_CLOCK_GATE_GUC_ENABLE |
> > > -					     intel_gt_mcr_read_any(gt, GEN8_MISCCPCTL));
> > > +		intel_uncore_rmw(uncore, GEN7_MISCCPCTL, 0,
> > > +				 GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
> > > 
> > >  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
> > >  		intel_uncore_write(uncore, GUC_ARAT_C6DIS, 0x1FF);
> > > diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> > > index e0364c4141b8..798607959458 100644
> > > --- a/drivers/gpu/drm/i915/intel_pm.c
> > > +++ b/drivers/gpu/drm/i915/intel_pm.c
> > > @@ -4300,8 +4300,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
> > >  	u32 val;
> > > 
> > >  	/* WaTempDisableDOPClkGating:bdw */
> > > -	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> > > -					       GEN8_DOP_CLOCK_GATE_ENABLE, 0);
> > > +	misccpctl = intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
> > > +				     GEN7_DOP_CLOCK_GATE_ENABLE, 0);
> > > 
> > >  	val = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
> > >  	val &= ~L3_PRIO_CREDITS_MASK;
> > > @@ -4315,7 +4315,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
> > >  	 */
> > >  	intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
> > >  	udelay(1);
> > > -	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL, misccpctl);
> > > +	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
> > >  }
> > > 
> > >  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> > > @@ -4453,8 +4453,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
> > >  	gen9_init_clock_gating(dev_priv);
> > > 
> > >  	/* WaDisableDopClockGating:skl */
> > > -	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> > > -				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
> > > +	intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
> > > +			 GEN7_DOP_CLOCK_GATE_ENABLE, 0);
> > > 
> > >  	/* WAC6entrylatency:skl */
> > >  	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
> > > --
> > > 2.39.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
