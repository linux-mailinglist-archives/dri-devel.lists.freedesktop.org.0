Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF6A06735
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5474310E1DF;
	Wed,  8 Jan 2025 21:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfwRjlIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F610E1DF;
 Wed,  8 Jan 2025 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736371963; x=1767907963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r5+m1vEW4PKMH35RWEPkRmIzMI+qU13radM2pgYHDmM=;
 b=BfwRjlIk8eHs9COBrgJptp8+FkXYdzpCMmW65MmP1J7t0V/bHadGv/9G
 8dT1chrSCnDiU3XWJKFFHINbfSkWyxwwMYcM2C0AOsu/2VuUj+fjrzOAP
 RIs48WNeS1VpkTE4PCjLFt3Jf985TFSyf3rE8gu8gFod1Fwnz7vvvfFiT
 T6+aDW/Ex0zgOiRQaX89qZJjBlOwpjnJLmvPAYhsOIOARgz4dJK9MN9IU
 fAKUV9aEMb4DBKH28QRQbRq7gcM30NQJ7gHYYBwEdNzEecimWkHcVOQtB
 MYGnSFJYS3sThBcbpbNSyortITY970vRHmieC1gDvj5ZTJEtHztZX8kcg Q==;
X-CSE-ConnectionGUID: ipZntKEsQDCGggSB5p6d1w==
X-CSE-MsgGUID: y3INjxxmSXSI+62O70Hr3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36838741"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="36838741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 13:32:43 -0800
X-CSE-ConnectionGUID: KAlUbJp+Sjy7GsPsPAT5QQ==
X-CSE-MsgGUID: USlC/lmeSuW3GUndzlnGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107258715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 13:32:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 13:32:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 13:32:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 13:32:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBZkDGiiU1RzAL0Axr1i6c1+yAnWxC6E1FudWB3rzVumQwCsmxHDsd62Jh2hlSYiBEAT4vKKAYOqEv2x/gVMB5GlNCYCzRxIaalOQzQrjzwc9dUuSX8Sz6OxBUK3rVpv0OsqoH1PIp5apHgtzg2opeJIucoS5z16gFjMk2hOaUrXHx5zQmnUEsr7dnDIUcfsYAIgG19pNX9hIhMhYQ10jmllNosAo2bsThtzqUK3bVkKpRvIMS4TkJTJOAYwaNPacL1OeNu0/dkg4o9VPvrRm+UWdppRoV87qjRw0+FmqrUZXGvuUNuTieRCbGXd0WGwFKVi3MVGwO6c4rExjbQG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdssjuEdF+xI8mRB+bQHcUuUJgimN9mvj0+UxXHnofQ=;
 b=nQRwGQkDCUE40Bw/deDFNCHjOhN+woZhsKzBFHQoe3leWnw0RrjOZ4BfA+15dobV1QKx7IabznAfEmdtpQ4sj2ddj/UQQ0iWnQls0hZLjqlrXczunlUXSsQFRtYw1TixBfJyBxM6W9zJgDwur33C6VPt6NI3a7Gzo1OYwwOePU1fGryAvyzD0vHEf/manV+pJB3dtnAGv1bGsR1/Mf4SqiV1I0PdbW8s0SAv47rb5+HEv8hSZICSujHiJOG5uj7xPorrONSykWVuS7GQdwze47Dri/t49jxvEs6LShmDRpyxogulEgif1cqdrbz6/gY7vWUKlnlHQUaYixokCWUCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 21:32:37 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 21:32:37 +0000
Date: Wed, 8 Jan 2025 16:32:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, <dri-devel@lists.freedesktop.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the mm tree
Message-ID: <Z37u8PjNcMwN_LOw@intel.com>
References: <20250106130348.73a5fae6@canb.auug.org.au>
 <20250108121650.09a8e828@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108121650.09a8e828@canb.auug.org.au>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e88184-62d0-4df8-6f6f-08dd302bf8a3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+xvIgBFU1fYpqum0mXaNyv2RPqWAl4+cn+7RZK83s6UrQWi2/vs3E2jzQhjl?=
 =?us-ascii?Q?ld2Cpn6pUA2N0J01O33IhipQ2JEWs7cATAObbij/IzwzzLyQ92X2oOm2RjgP?=
 =?us-ascii?Q?GSF3PQ1aF94jrV4Vhw/aZdojihS+0twqE7G2dWhu891KOadd4Eaciug/Er5b?=
 =?us-ascii?Q?5zmmkSbV8osYTkv665+nzgg92JDUFJh6/A/MYC0fOp6f+fLKlqKi/gLPiSOR?=
 =?us-ascii?Q?sGzLhMcoWCbh4rv1mgnCW79RTeQUuAcKu23uAcchAPsVdWh7LQJoeG+gN748?=
 =?us-ascii?Q?BwLkl9cqc3/dzHYVWVBTnfhzPe2Om9fhZNKD/sL1ZoXYusuki82h1NPJ9I5l?=
 =?us-ascii?Q?6oP8s/+RTFDudo8C7x5t7uY7PvJKkCo3t95dP3RwV4hra35P3YtJC8vk/Ued?=
 =?us-ascii?Q?Q/fp86+rT+JdWDr+093ST0LgA+FAEEUHFuIxmF8EbndPjwEm6dyEKNc83FKS?=
 =?us-ascii?Q?GrD8Y1KhJNekYgCE2KWhzTTwDEvavG4oWJPuSksi83dhdDy163aiz/LO5Q5l?=
 =?us-ascii?Q?ecKl/GoFby+ynt+mLgVbcrgbc/MhZT7QAmYBnxHCMU8FbuJQJ5vq2DoTV/GD?=
 =?us-ascii?Q?rkHAn6DYwtM+LDTa/MYIXKRG5h8C4XR8OcI/e8G60w1aRkssOlethdvfQlW+?=
 =?us-ascii?Q?Sx55JM5IKDjV5jpEm5lrRNdE69sokKlxqYb88E08bgToOjy6PQi+Z2LonlOf?=
 =?us-ascii?Q?rvrbkLnvm814rqV+ULop9J8NaleVLW0SAHqlhfXzwKdpe++mfyQqT+ZTlZsN?=
 =?us-ascii?Q?FRm/DlO8lK5J05ubGwGa8UHdre6aEW4I49GvVIm/LbwUnzkVm5z48FHhsVsD?=
 =?us-ascii?Q?XOlg37Tj7S9LXJNaJ672CqKs7WazX2nUq1lUN8XDk2YLsFaWk50DugbTPGyE?=
 =?us-ascii?Q?9bxUdYaKCQKfezPyc/UkOekBLSnRaqx+ehwPQQh3yt+YQviF3cvdxDf0HERB?=
 =?us-ascii?Q?ILZJazu1Xk0qsmo62V00b/rVbMU4i1zN11JBP+aCs+ljEPmmvE0XyFS1Linr?=
 =?us-ascii?Q?W5q49sjHqM6NRNa0KfhVwWgzny2n3pp/LdbNW6l5wA+n++cQ/eoEBK88ZeK+?=
 =?us-ascii?Q?zgzpkvx+SePZ1Nmh+e1kf4UT5xcLGE3DnEI6fTBhuL3HMP7xnCTlYBIv3Zs7?=
 =?us-ascii?Q?rgw0kTunPdeEkrTNSf/kG8+o6qxdADt14NVOof0HDK9B/pjY+odxo4gaCYdj?=
 =?us-ascii?Q?XwSSwYwTgdUergJSHDmuKtdQQ2u5WJMekiDJgeQE2hsoWfb3PtO8V0EUwYZE?=
 =?us-ascii?Q?tdT9GIfq9wXlbH8Qjm3EP3+tjfdoHWSjwKxCNoGc4DuBd3FIQV9tgcieuks5?=
 =?us-ascii?Q?DIpssaU4Bs5KJuMhbeyH74/Y88ILCToXxpNP6y1Te5LKvEz9ImDCRvzR6HKV?=
 =?us-ascii?Q?jihrXutRNkoLPLUn8E87S3T7Em3y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LAXlDq5/uBkU9YlH66zyRtf6/4b/l/5RN2J8E66zGtzQ16JnUjuloCjaBC2X?=
 =?us-ascii?Q?w39n8iJ038CpS+613pg1nJDmWNO92DTCXFKGfT+oT8bOHjS+wvYuf1Q68xxj?=
 =?us-ascii?Q?ZOcZHz9jhx1UIioVDccsPRluWwu2DqRrgz6Rjke5PLOhNMw/jjlX3+NEjQ5H?=
 =?us-ascii?Q?xbiUeupoDzHTGKqK/o2XyKyEUznQhVs5YLWDz3aaQwubfjbBqQvFXlcKnW1Y?=
 =?us-ascii?Q?2ARPoNNDzDOskY858egTdZTCpkdpznD905/UJKjOklV8ettSPW2X2XiXHJYU?=
 =?us-ascii?Q?a2DxByqlZm7A+oWatLkvXWQEv1x3SYGX8G8J3OLLtJT11SSkqnL5c+ScfByQ?=
 =?us-ascii?Q?So3rHhYZQNw/OgQdVRq60V62AL+UJAcY+q4V0lLRYdoZXgPpbP403Gq4undz?=
 =?us-ascii?Q?U8xuQ0qhHWv2rLmdolG4H1QW07BtZEftJiLmkZobrJrv1xq8Qz22jN2EikLf?=
 =?us-ascii?Q?tbWgysrolWYBse6AKY0FMSaA8XN6pHKRYf99/LLgYIkxzyTssPb0ab+esOqp?=
 =?us-ascii?Q?8IbMGkddNXygNbL4Rbh/boI2qC6udLHkpwFi8uYeRKoc3naFKA/p8ujIFBpa?=
 =?us-ascii?Q?ETEXw6pCkbdx+p/52po+vuORcs0rTQIWeXgg6AMlPrmwO9r1Oa0Guk2CETA0?=
 =?us-ascii?Q?1MEhQg5dkagQgfRTT1JqD12sqWIuuw2x8bbhl4QYqfWFBiNMV1/oIMA51KO2?=
 =?us-ascii?Q?zmnzLobvaJr+aJEyAMgSZYUpOT6Wi2XGwDMmb6DKwxj+E8bFADtUwm2C8iL7?=
 =?us-ascii?Q?Xv/mMKBjPGDY4x9J/fXako6bdzP243wTEuaVxgpM3FSZuzL0xbHVpCIzTR4o?=
 =?us-ascii?Q?8Y/3bnco/GykT97TPO+2KjHf+StSItNu51CL5iD150mWEC7ihANwOW41Awzg?=
 =?us-ascii?Q?RE9riXZi+vqVG/zFEAT9LEtfRVCdo4Oxi6R2GfY3sFqk/fQ8yLGRQkV1bzc9?=
 =?us-ascii?Q?hYSiWeVOwceVMU/rj7AxScRV0nLGYjF1fYE6ZzSVE+TERvBe1aDYJ/clIWQG?=
 =?us-ascii?Q?CFUqegCrbyJCOLM0nfBXCSoYim4ZseCAIHVrOfg0U7/XvGG+PFwYwYyz0fep?=
 =?us-ascii?Q?Ns3+4rAQi4SzO9lJ5hkHHLCTYBxwKahew9gh4niaFP7rQKCcJyto7pswmUvI?=
 =?us-ascii?Q?/fwxHFHwtjq64dgx85A45Z4cYiap/CpxmRrXXZIP+njrZvDPJj0NIsGYuoC/?=
 =?us-ascii?Q?X4PGkLFNebik3fZd0swMrA7P3PJo9VJs1phuqcZCWL4nUEZ8RuGqWCv+eagQ?=
 =?us-ascii?Q?eNc5xgHY0Sy5Z63pzu93/IBno7ZL5PDuILw+FVKM1fhq1PwmB7IZAVcogGqD?=
 =?us-ascii?Q?gLk0iF4MHAd/VPHGWBt0kktKIN6aAgpj8aIc4PRMbHP1fmQTm5RULcD7mkmW?=
 =?us-ascii?Q?RLVc8ZeydLRImfs+j5bKY5JiVdtS4+/IdIHIR3OwP43tSTGsDSN30g41Cyqf?=
 =?us-ascii?Q?u06DKQzFMjwC0FuFAg6exySTkD3GljCWXzqf1UsPYQH/3hscuQXVjI1PY1qV?=
 =?us-ascii?Q?0LsFegRKcdV8fmC2m1A83nnr3tzS+8EamU6znaZtQjPxNcezkiJhY3qqIDDw?=
 =?us-ascii?Q?6byO69SC/T+juDfuenReIkRvvxtgdQ++M5x7vOXlXwCReTIcuxMy9FZhoI3I?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e88184-62d0-4df8-6f6f-08dd302bf8a3
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 21:32:37.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaIwLiz63DOGKTrTFlXMCBZcXtQPOAZRNB7JjKEXbOwGoGqNrNNxelKbCsK3x3gBpCJaUgEtd/XKoXIoiFC2bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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

On Wed, Jan 08, 2025 at 12:16:50PM +1100, Stephen Rothwell wrote:
> Hi All,
> 
> On Mon, 6 Jan 2025 13:03:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> > 
> >   drivers/gpu/drm/i915/display/intel_display_driver.c
> > 
> > between commit:
> > 
> >   4fc0cee83590 ("drivers: remove get_task_comm() and print task comm directly")

I don't believe this patch was acked by us, next time it would be good to get
different patches for different drivers with the proper acks for visibility on
these kind of conflicts.

But if the conflicts are easy to handle right now, let it be...

> > 
> > from the mm-nonmm-unstable branch of the mm tree and commit:
> > 
> >   f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to struct intel_display")
> > 
> > from the drm-intel tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
> > index 62596424a9aa,497b4a1f045f..000000000000
> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> > @@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
> >    * Returns %true if the current thread has display HW access, %false
> >    * otherwise.
> >    */
> > - bool intel_display_driver_check_access(struct drm_i915_private *i915)
> > + bool intel_display_driver_check_access(struct intel_display *display)
> >   {
> >  -	char comm[TASK_COMM_LEN];
> >   	char current_task[TASK_COMM_LEN + 16];
> >   	char allowed_task[TASK_COMM_LEN + 16] = "none";
> >   
> > @@@ -399,14 -408,15 +407,14 @@@
> >   		return true;
> >   
> >   	snprintf(current_task, sizeof(current_task), "%s[%d]",
> >  -		 get_task_comm(comm, current),
> >  -		 task_pid_vnr(current));
> >  +		 current->comm, task_pid_vnr(current));
> >   
> > - 	if (i915->display.access.allowed_task)
> > + 	if (display->access.allowed_task)
> >   		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
> > - 			 i915->display.access.allowed_task->comm,
> > - 			 task_pid_vnr(i915->display.access.allowed_task));
> >  -			 get_task_comm(comm, display->access.allowed_task),
> > ++			 display->access.allowed_task->comm,
> > + 			 task_pid_vnr(display->access.allowed_task));
> >   
> > - 	drm_dbg_kms(&i915->drm,
> > + 	drm_dbg_kms(display->drm,
> >   		    "Reject display access from task %s (allowed to %s)\n",
> >   		    current_task, allowed_task);
> >   
> 
> This is now a conflict between the drm tree and the mm-nonmm-unstable
> branch of the mm tree.
> 
> -- 
> Cheers,
> Stephen Rothwell


