Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2E158AC6E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 16:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA345A03CF;
	Fri,  5 Aug 2022 14:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4CB6562;
 Fri,  5 Aug 2022 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659710395; x=1691246395;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4DwhClVX29iiu53TFjQxXVv0fn87dHBtmIqr3IBfbE0=;
 b=b6IgkAF4x5ymsXN4/+OfgxE+59q2Ec+VTaoOw6jP60oC4dXC3sQ/Nup/
 7JURdlJ3vFRyoXzw6Jv3mBaFgYfk1ARkny7y524MN1CVh42ErtaTV7mpe
 5gE7H0+SYuYtZlq4oKawcvVdRqNZnUN6IArEu2ECXy/0Ua694quv2WFh2
 YyPIQoFMs6HREjQKC6WAyOzvxjfnm7NMiEbnI77uBd73Np37K1fyP+qgB
 tLdswFY171IJCfTZu/1mVn8SPaMc5F3dTp34TcZgYljsY8v02JqosNWva
 6kpomzD8FDwEh/ydIrSDG+ZltXx1jIaimSMXyizOAQZCtvYHO4rgZb5Es w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="273258699"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="273258699"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 07:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="663006054"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 05 Aug 2022 07:39:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 07:39:52 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 07:39:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 07:39:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 07:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWlX6VIOms576ZkRfpiKQ9dtSm5UjUir0/fsjy0fIUlbTxcJmH5EZQ5pX6BAaptSKkekMMAtadmk4KKlcGMpaH0E0hHYnxOb9H54d0/3fgVj5nyLgUoX5a/o+ZqKgElJTxIg1+vDyOKLrFYrmYQ4NkfqtBPlZ7SCbbFYzp0FdSQjxTadjY+hxVJ6TGkmpE4iQA1SozXgtZzXKCPjEL8GJZv0ZAYZLqgbTiwVetBLkfjEOJ81ZNn8vddYHsQNMNq8uqzi69Ei4WMJPgY/68vAlC9cRRiCT2kES/VTKL2ygFVlCNFI2TMtZPPUvLSxZtclxGnn2jdANKr4qcirLA+kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY8VTwxkhMaK9nfcW9S9A7W/EIilhSCnN3JgGiVLNGw=;
 b=aeCirX4f9yM/jAilFNvgKOsBGaUxjdcfAZnH4x/rzwM2BjZ5qcesZI1BjpbVmxwkFWrDI0oS4aaSVsTxlRPaBs68sCBoEzGOw9+VnuHowQvqbUtNGgghnp9FaoVYJAZdqjMnHhQWmj0TCVjcxYgvaZaCw9sHeoAnlhRpf/KQKtCUaVjabaupnvhqaZh+/n4lzhSXouLilVLpplXyTxlm+lXfHYLGAvfDtGbaMrbaCzMR1NzUO3iefsbyycpCKbJL0wXsInE5JOaXZm2Wxdzx8LYmLbjR3Bchpm5HfBWtmLp5/kr+zp6I9vN8kf/1zqCLvCH8lIlZT41GUsgR7jMhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH2PR11MB4360.namprd11.prod.outlook.com (2603:10b6:610:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 14:39:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 14:39:49 +0000
Date: Fri, 5 Aug 2022 10:39:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next-fixes
Message-ID: <Yu0rsGnxcFmvzSPi@intel.com>
References: <YuwC0s6khQsun32+@intel.com>
 <20220805104642.0f0e1410@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220805104642.0f0e1410@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cacb530-51f5-40b5-7ee7-08da76f0593c
X-MS-TrafficTypeDiagnostic: CH2PR11MB4360:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hK5XXFruNrdad3OIHHzr7PrF4/erCdlEBsWGFu/C9E8NSaDm6jDdsvAv8F+aQ5GvTESoqK74jq1wUtMny1ym1unKlf0pjBfMkNLDdCXDz3Nf+Ys1i3t5Bxdf10eK5824hjyH8/QHXeImXnzltEJgR+DnAm0or5R87QEgFaRUXuOXVKVmsDvLB3jUSqRFzrj80fqWbPe1mJBsDagXLIWWkUTFMwDwi1vnwGKji03TB/4ocCt/O0MLFl5f3uz0uUFQd4bHYesbjH5SkrVSUF9gDH1v90pCy8p8XALZopruMBJqQLv/5mF7M3tdkwG4zRk8iOtKccEthWetJlYEGuXbr3brN8hUBYXrZ/tve0ePbgM7kcLfXA9/DVhLHvy9nFHdTH6aYisenWw+b1AhelzzLMrVRT4lPVGlfdcbVrv/WjTS4F7ewrCNFZFRZTflnsh2oxaTNlLblIv5oW6aBFq4HmDLjkahsbJury7UmDbUEr8s+KuLxcWA5mtSYlvRGuzX60ic3DyEX7UgHcgTSTe7cNm443eF1TR/6mA5u9R4mnnVWSCBzY0ri7MZnnyAHSKhjG+h56A8Hz74S5y/kRNQLHI6WX4cLuNnNdz1MpBf6UrFLzXeOr3Ea3J1gDQezT5V31kN0L2oQ7RnS0r/YMvPcIAcdsR0vxFTwL/4wm5T/+YbLIvad86H2GA4Nj+6rEB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(39860400002)(136003)(396003)(376002)(83380400001)(6666004)(44832011)(66946007)(66556008)(8936002)(966005)(4326008)(186003)(26005)(2616005)(8676002)(66476007)(5660300002)(6512007)(6486002)(86362001)(478600001)(82960400001)(54906003)(6916009)(38100700002)(316002)(6506007)(2906002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xpFdYSaBPtXEBIStM7xdFEHmwpJKI4W9CJvDZ5F8IyKpv8G/nAXq8MZQIpyV?=
 =?us-ascii?Q?c3pdtRwnKdNL5I88ruFNQUMOPzV+qaYvIpn74dy7CTUBRcW+cB7Eb4xusrrg?=
 =?us-ascii?Q?UHl7VlbJvSfY6i0IsbrK+5I76aHZlOP4ManoD84g5LyzpDAy14HXiAjKxjY6?=
 =?us-ascii?Q?oZ6zipq2AQDM5Q1vIdxw8vJNvC6y0Ii8paf0YtCt9zBU0fYq1VhdAIU+o8/u?=
 =?us-ascii?Q?Kg1SjXjHsmCi03HT8sy3iO77/rlYHpm7iIqEgiGHWo/u1gMC6g5vosI9sduY?=
 =?us-ascii?Q?T7FJDIFd1gi/7xGERSjmJRut3hVaMrmlZFE8FQp5VDH3dbgolntjW9HZ13sH?=
 =?us-ascii?Q?H03QMibC1VAPf8GuMoZzCySbItSRYhHGHX6lK11xcKP9sJOKS9PcnkLhmVIN?=
 =?us-ascii?Q?8lODSD53iD1N3ReXeoIQzGc5EUrO8qwsMUI8iRFS6shnxveVLulYG1xc9wKw?=
 =?us-ascii?Q?iDnKuX7PjGlN3K8BLIFVre5pkCkuAIIwXlXUpARc3DvRQseWK76N0A8oHOsJ?=
 =?us-ascii?Q?dkD8JO4sWJYQZPHUmKQ7uxiULkj6Jlau+Un7kNoa1AaOcqSK1zRXm6nc91VQ?=
 =?us-ascii?Q?tTAlFgPqCejFiMGeVhtrr7AtNx6udpO7IzqbateZiAz18Zl+NjDiizKJgMsj?=
 =?us-ascii?Q?aQHDdIVDsfEhYXyqDpOPIkiIqBNz+aTf7EI5Xb+XDpqNSyOlVqpEOMVcPLbI?=
 =?us-ascii?Q?dY1xdwobSEcMFsT/k5l+nzMADoemv69yzaRp5b802bKuczESVY4ieaclrf/E?=
 =?us-ascii?Q?tdMrXQJ1mzmcDBvBlp5f0qx0xvWl9GtG8bjOzHdTT3f8sIjlixaeAxjFNFSy?=
 =?us-ascii?Q?0TceJwrZ6PMhns345OpHnu9CokRkRimIfYJw51Fp9w40yZ3ihF94vKFvUzyR?=
 =?us-ascii?Q?cBbtp/5J4XGEYCbCtU3sTAfKkeYvdkoEc9TNaLFrzApJOk2MhVzAA8Jsp6Xx?=
 =?us-ascii?Q?ahqBjHwYxuh8M1T6jPqEkSwO5rhIY1tLFTdduvssdXG7AsF0BIOq1NWFdWiT?=
 =?us-ascii?Q?gZTFTFtGKPASZhPC7AE6O8W+GcHQc/kOxkGKaSy/UOhIaHUz3gLUDJRJ9cIe?=
 =?us-ascii?Q?aM5UGL2gi7o4E0xd1fZpxZ+qXIWXI0Ie/kOX1xg/p8F82/2vdjCTCVrGipdj?=
 =?us-ascii?Q?dDHdJ2rg5c3sHij5a5wMFAL3rjim1nT/QCu8ObE+YMwdk+6hlM1I1INORKfN?=
 =?us-ascii?Q?qf2n4tuniiGEr1h8XLCZHWeR8PAi80RsNWPgu02HUac+ss0dlLAUYpa8Xr3C?=
 =?us-ascii?Q?Izw6huKCbYEVfBTt5eYBhgwyBTJYLxQY2pGFnBEoZWX6lGxpa7zHvJx0GTyh?=
 =?us-ascii?Q?RHJ0TP69ABJatRaLy6Ff2V7sfAkL6wdJEPKFyGE3NAMmFYMBnsGGKj8c3cvD?=
 =?us-ascii?Q?PjWBnswKV3xMM/JUXlvk06KfacbUo0LP5nCZbt5jCYaiikH2rdjQzPyd0nWZ?=
 =?us-ascii?Q?yuoL3IJ8JptYT3AubLyAIOBL1LnFbY+luNG4YPNBrWjl+7iQvlNb3F+uAQFx?=
 =?us-ascii?Q?auSh1NK34FoJxhr2Pugo58eIwuvCEroQxpxXX2777vOld0Yu7YFvg471fPCG?=
 =?us-ascii?Q?sic+yWnWe6U/eCkv8mwINvPlSNTeMvJ3BHzhjyjLFlKvGa+5roZVmY5Ccnoe?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cacb530-51f5-40b5-7ee7-08da76f0593c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 14:39:49.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWUP9KnzgPWbzwdrDp5pKbDeXq3T2LpAtBGTp1ZywMoRmVzBlX+aLU/jyH2U5ZlbCkfUcKJM8rN2C6k3qETtoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4360
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 10:46:57AM +0200, Mauro Carvalho Chehab wrote:
> Hi Rodrigo,
> 
> On Thu, 4 Aug 2022 13:33:06 -0400
> Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> 
> > Hi Dave and Daniel,
> > 
> > Here goes drm-intel-next-fixes-2022-08-04:
> > 
> > - disable pci resize on 32-bit systems (Nirmoy)
> > - don't leak the ccs state (Matt)
> > - TLB invalidation fixes (Chris)
> > 
> > Thanks,
> > Rodrigo.
> > 
> > The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:
> > 
> >   Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)
> > 
> > are available in the Git repository at:
> > 
> >   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-04
> > 
> > for you to fetch changes up to e57b9369e0c6f60155027e120fafd4b57e385b71:
> > 
> >   drm/i915/gt: Batch TLB invalidations (2022-08-01 09:48:06 -0400)
> > 
> > ----------------------------------------------------------------
> > - disable pci resize on 32-bit systems (Nirmoy)
> > - don't leak the ccs state (Matt)
> > - TLB invalidation fixes (Chris)
> > 
> > ----------------------------------------------------------------
> > Chris Wilson (4):
> >       drm/i915/gt: Ignore TLB invalidations on idle engines
> >       drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
> >       drm/i915/gt: Skip TLB invalidations once wedged
> 
> >       drm/i915/gt: Batch TLB invalidations
> This patch actually adds a regression due to a silly mistake. 
> The fix is here:
> 
> 	https://patchwork.freedesktop.org/patch/496249/?series=106805&rev=4
>

Thank you for the heads up.

Since that patch is not merged yet, what are your recommendations here?
Should I remove this from drm-intel-next-fixes now? Which regression is worst?

Also dim has trouble with fixes for fixes in the same round.
Please ping me when you get that patch merged so I can pull that.

Thanks,
Rodrigo.

> Regards,
> Mauro
