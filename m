Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B2B9AF290
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 21:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDF810E995;
	Thu, 24 Oct 2024 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieftXACI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7270710E992;
 Thu, 24 Oct 2024 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729797754; x=1761333754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TGZ7Sw102Po8J/zwm24tWHJlexHg9bzGrLfZcvroqAs=;
 b=ieftXACItd0AFYSP9gToqPso643DOQs/TQ9vc0ITuQ0LssR2pFhxSj8H
 jYThpNEbZLsFvx6wPlDPX+rFtSDUp/GNj+Ist9kzMd1gE7A/EB6TaeG0Y
 sjTcP17M+PC624/I+AgpdYVsOUcZVlx7I99VsbiO4zpb4quxpplVwFFdC
 Oz7TT3BEPnHlmLmFwQEb12LCxcOkDgGhuUASp/2ATt1Al7+NjOUooJNTl
 mMla+/tIgZu1/8gDXS+aOEDYnukeSPh/1zXRsKZdB5V3PK0nGqhi1WkzR
 E/NOc3JfzfaAJ2Ah5C344SxmNwdDkHJWL+bQUUaXuvs+tXjKPFEzCK/on w==;
X-CSE-ConnectionGUID: qlh1I7QDQgqM0FVxcExBTw==
X-CSE-MsgGUID: TveoSP78Q/utz74LG5gTMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40824926"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="40824926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 12:22:34 -0700
X-CSE-ConnectionGUID: HhWxduahToeMlpT5H4sz6A==
X-CSE-MsgGUID: Rw2f5rADTpiDI/Gv1BzOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85482517"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 12:22:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 12:22:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 12:22:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 12:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFHKgeGvuqqkPG50nlPuIMdqzX0rVNZQxuSEF2gYxeaN2Ggv6Lr1t3kJdNyzf1Map5U6Rtrinwb/8y8YxzjZ3hrqg989SLrCCifnRr1f9ndC5pnBsz1Oy/fL6HVr4Q9QaG0TDv9HeoxkHsJdEhw2zEi68iWF4BoniAsR82BCrcO3CAdRr8namd4Zicdujl3QEsjWHPmuuJwRWDYEVK3oB82DPNKvwSv8cZg1S+rU8cum12JsZgx6Rrv8V4G6R8rWcdaCDl3aJld/NfeP4CCT3emAXqsNz9YWSMcvv747DGeIWUctt3fVaPNQLs5cVqQtRoYE7jLj9AYyZNGklbnafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GshT4PpKz/Xh/0SBJD7enVwnNzTyQ/fCihz0AzCuUkA=;
 b=UD6V+3YsIfZUquMYIjXlBTJLwZCie4HFV62cxNL2TKuzlOC5+At3JX70zytZinOd0vyEVD8RYFp4PpZLa5dCTmHaE+vv5szC24UQujt6jj4+aUBRp54wzQzt12vjZZ0eKM9BmTNCchBknqUAFK7DgjocTMp+vcYi0t7Cl4954g5wNlenPhEghcpH/VD1i3NmIwfeat/nBM1L5hyR9M5is9KANsUjLO2dmGAH3M60p3la7sTKZOq7Uc4x8eyIvUrEvcStfpraNMkRedKZXgf09GuFRLeN3lB2nRBRo6cu/j2FuBLtu5V6/33DH4KTFav0TxyBL3Zf9BIt+U3zZiMi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 19:22:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 19:22:29 +0000
Date: Thu, 24 Oct 2024 19:22:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
CC: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next
Message-ID: <ZxqeXxbcdVt8lN4k@DUT025-TGLU.fm.intel.com>
References: <ZxqJS8bCWc9ZgIav@fedora>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZxqJS8bCWc9ZgIav@fedora>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b07ef2-6216-43c2-93a0-08dcf4613395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uDLGR8JW5hGCgGRacQ9fPKEXF1V5pCEGxoWtdhgTiatggtJUJ0AwwkS1KHi4?=
 =?us-ascii?Q?ciuboKdN3Ci6cQy5Glfsehvle1UdmmAmSE834XlaCM+KsoOKl8XMCdWHoFij?=
 =?us-ascii?Q?WpBbui8qTNqywMh7hHdiCDAnrvaEZI92Yv8zs3G4Z35+hPBREADHE5i8tFSH?=
 =?us-ascii?Q?eOh2/LdWWn+kqaBupwvuhc1saU9Qqp+DHcOTNdeH7ycP7fxCK6hRLEPhOgIr?=
 =?us-ascii?Q?qbyRz3rWWmqG+edkWLYxSQ5cXf3rDec+WUMebK05dhSBKurwP0OAbyO+//S4?=
 =?us-ascii?Q?UxqltPjYUWdNlDHDtC/wjcJMmKgFyELlVD38D6kKlrU34qBLAQD6D/MyYEqo?=
 =?us-ascii?Q?nH/KUZ6cqFO8+31dNSsjO9eMRYS19JPTTkKUu1OG2h8e2ZP2EvjG718QKm6P?=
 =?us-ascii?Q?tRFKsruhGwzAK/Oc11ZaBZsti0+PC7FM5rO9ZjR4ezN1p3F6okv+sPHmL2bO?=
 =?us-ascii?Q?ewvXhJnB/ShrKI+d5rjhS4ppvKlOT2MSCySAwClvbQUHVO6IsLLnhq2Az4Us?=
 =?us-ascii?Q?otXKi2gGFTEUL5KqX/tuVI5jnI+LCZgF7Wofz7/OC3mSATorqfY/W6SdNcG7?=
 =?us-ascii?Q?rjwwEVxtybiE2DfxsxeCn9b+vc0djtVSSyVOjhJxB6Q+MwcROOeSobXhnqAB?=
 =?us-ascii?Q?S/YAS6c2zqI3d0BWk7M06tLFJB8poqCeMvGCfqohTJrZo3KnxwfiJlTQ0Uck?=
 =?us-ascii?Q?cUhBEExZBJmG7pei4XEkqT3zqG0aeV8F1sonYdVXsblkRvtdUHGKKvuNiiNz?=
 =?us-ascii?Q?jxfY+YhotgawwrZhaU5t/Ag6pGdhllTisTDzjYl4ktG5KS1Vq3JW8VsB/duo?=
 =?us-ascii?Q?xKFxPazlpwJtxjmM5PeYf5jzuzDKfZOHVF5AGSEpaeQgbYJXzXkTGzXs5hap?=
 =?us-ascii?Q?EcM6mN2KBtHEixhyDkXGGwYx8bmm0Zeyp+jcr/FppMpjW1Uzdzc+qEPaANmY?=
 =?us-ascii?Q?F6/Y2SsD8x01ZsgfOmxPIhWkoGhR3aYBHjYPP6Da/8JGps9T0pi7Y0JfSmGB?=
 =?us-ascii?Q?UaRtY4Ogovmn0Phpv6hSFIikxOrodQblh9XnamIjNzCaCHNEEJV9pXUsNju/?=
 =?us-ascii?Q?F/GXQKThhkF8pCgNBOY1OMi3m76k6/9GLWAWCbhjfrqauPxkSpogSsIJkix0?=
 =?us-ascii?Q?o9g4YdEL9xm1JVR0Yz5VdHa87e8+V7QRnge1XYWuWUIMpSMAqr8PQlWTZ/Pr?=
 =?us-ascii?Q?ssi/n57pfNzbhvElEOhQe6J4Nt+zFqsdG8f0BHfuN7rXgEgH2WFMtDgAFmac?=
 =?us-ascii?Q?kdo9+I1n9Br5wvR2XTsSenULgueNxsi/1GmwKquLAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOcDzZvFyRZ+bYXv4b8WMkKGmGsydes4GWQJgU9KnEgNd+jc801X2IMlyGD3?=
 =?us-ascii?Q?4FI/ORU8FB4YF8kKIC7WSeBUK6fZPQm47CPVlpU+ZScasl8j1atixzpqw2Td?=
 =?us-ascii?Q?X8XpNNR9SPDTuSQ4RgU+gFOKl8JyOSpGL2H0F5C+dB4EQECZifTPL72kZ5w8?=
 =?us-ascii?Q?bSEnpUqbxbaLo/Fyhirj5VeX5TNxhNU71qXXGBvHBadCFtq/+pX65TL4WQz4?=
 =?us-ascii?Q?BqqUJBC9/rdYO27BeID+zkZbWu914yCqqiXczh7siavnCiohyonYNRarhwZm?=
 =?us-ascii?Q?X0Q059ZEz5hPBHIp0jNTBZHZzIPhMoRo+4VeFUT1rMkZ9YeETM5IqMvxvzHd?=
 =?us-ascii?Q?4mkcDW3+/FEilI4HPlNEiUsVuS80UQJ5piMTvtu4wThcO18qcQPYI1eFxG52?=
 =?us-ascii?Q?kP/JegcSnv9EjYiFPy90BwZrqFIj675pdW0L0ugY4lx3QPuWmgJNFI8ChCbD?=
 =?us-ascii?Q?bsJoYbOnJSRqpOvSuAC8guiKj8RGB58lEB06FS1f04CUwTTG06j2TkTX89F3?=
 =?us-ascii?Q?TuX/0diKJjLsQpOmLfWwTbv5WrzG4pSES2o9NZWMKYzOrXkNNfLC2I3fpLMW?=
 =?us-ascii?Q?coxHLWNrMHM6jGwKmFGwy0NEySxoPP2e6iT5ELb2ZrJiHAbbHdMA9SpAxwZ3?=
 =?us-ascii?Q?xMEd+AQhpBxNT1bbOtgHFl3P1UHSjni9I08szCqLWoiejYoAXcLF0bzWeX32?=
 =?us-ascii?Q?L4EOH04FBBu/MiZlOv1lWH+HqO9P/JF+HOS3ExAiCa6lcgwce/cb762JMyG9?=
 =?us-ascii?Q?+1SAhnpyDnHHxDh6/q7mHxdcgCkoR6hIvrYeiBbPoYxPsDCLomiZsWN7eg1J?=
 =?us-ascii?Q?9v4yiJzbCbSqnvyL091cxwtf6SyIVa6+XkQy3XLJJR7NS8A2dchE/s5BTLXd?=
 =?us-ascii?Q?kd0KxKg8xqx5kR5/0+hXsQBdYW0wrlbaUEAQ7nj0Z8p79ErEbm+tIO9ph/+n?=
 =?us-ascii?Q?jDtyIhGgPmFoFgU/sj0MCF0Kt7I2Ta03wdbWOCBFPvhtZG+0T9ovPQxao3Pa?=
 =?us-ascii?Q?1URfDlUNurPn4tUJHoJvUhOPvkmqU8fUJbxGA4iCaZTOKAaQgD1zlyX2sc/a?=
 =?us-ascii?Q?Juh/e78J+BCSzTSF9BJDn18AQVX5z7J2zmzDsqAelWY240iYtSJGIu+7IH8H?=
 =?us-ascii?Q?aEHSJbE1uQnN+CwwoIT6Kuqzs6b5bB2i95uyDHsuDvBVUvmz3QChbp6t1vqb?=
 =?us-ascii?Q?E88UYp4W6x/C+dlefz5pqMYN/cc4dreoHCf+SBUyhJ19CrqM8AhrPFnsUgmh?=
 =?us-ascii?Q?26rKTxwFOf0vMtunJMDuItQSRY+5tDgdtskMT/FyoRdA9USQCc0xl4B/1tMq?=
 =?us-ascii?Q?XBCnIgd/fwido+Mw/3dLcJ7bYCn27BhnVC9Ys3NLfQjwe1QJxJPioYPGDKAE?=
 =?us-ascii?Q?Cp0+nSH3m4RcT+3q3IK2SZhXbBxY2nieN3GqKadbU4vymFd/0RYU08iWl3ns?=
 =?us-ascii?Q?xo2hpw+nPCRXnKEmVqHzA8lul610S4sIDk8o+c0WOk/Ng/WzK16U49i6uxqK?=
 =?us-ascii?Q?dcGFGKcFfahrkp0GpN6M7siw9Zdu9U/42PM+KRglGEutPEwfrQdFe+KgIN04?=
 =?us-ascii?Q?DY520/qWypnDWN5vBVVE/xcIjMsmw9ILtT/U20jGmP+tnvp4qTtb78wpOn6L?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b07ef2-6216-43c2-93a0-08dcf4613395
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 19:22:29.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYnw3X68Hq8p3BKh4mZym0erm9xOCwQF2bjMo54wFTV5HY2/rySBYOlbd3CPpKxvqlOdqQsiB84yTXicheDTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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

On Thu, Oct 24, 2024 at 07:52:11PM +0200, Thomas Hellstrom wrote:
> Hi, Dave & Simona,
> 
> This week's drm-xe-next PR
> 
> Thanks,
> Thomas
> 
> 
> drm-xe-next-2024-10-24:
> UAPI Changes:
> - Define and parse OA sync properties (Ashutosh)
> 
> Driver Changes:
> - Add caller info to xe_gt_reset_async (Nirmoy)
> - A large forcewake rework / cleanup (Himal)
> - A g2h response timeout fix (Badal)
> - A PTL workaround (Vinay)
> - Handle unreliable MMIO reads during forcewake (Shuicheng)
> - Ufence user-space access fixes (Nirmoy)
> - Annotate flexible arrays (Matthew Brost)
> - Enable GuC lite restore (Fei)
> - Prevent GuC register capture on VF (Zhanjun)
> - Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
> - Parallel queues fix on GT reset (Nirmoy)
> - Move reference grabbing to a job's dma-fence (Matt Brost)
> - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)

This breaks CI [1] - my mistake. Maybe omit these in this weeks PR.

We need [2] merged to fix this. Waiting on an RB but I'd like to get all of this in 6.12.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
[2] https://patchwork.freedesktop.org/series/140406/

> - OA synchronization support (Ashutosh)
> 
> The following changes since commit 2eb460ab9f4bc5b575f52568d17936da0af681d8:
> 
>   drm/xe: Enlarge the invalidation timeout from 150 to 500 (2024-10-16 16:11:10 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-10-24
> 
> for you to fetch changes up to 85d3f9e84e0628c412b69aa99b63654dfa08ad68:
> 
>   drm/xe/oa: Allow only certain property changes from config (2024-10-23 12:42:20 -0700)
> 
> ----------------------------------------------------------------
> UAPI Changes:
> - Define and parse OA sync properties (Ashutosh)
> 
> Driver Changes:
> - Add caller info to xe_gt_reset_async (Nirmoy)
> - A large forcewake rework / cleanup (Himal)
> - A g2h response timeout fix (Badal)
> - A PTL workaround (Vinay)
> - Handle unreliable MMIO reads during forcewake (Shuicheng)
> - Ufence user-space access fixes (Nirmoy)
> - Annotate flexible arrays (Matthew Brost)
> - Enable GuC lite restore (Fei)
> - Prevent GuC register capture on VF (Zhanjun)
> - Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
> - Parallel queues fix on GT reset (Nirmoy)
> - Move reference grabbing to a job's dma-fence (Matt Brost)
> - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
> - OA synchronization support (Ashutosh)
> 
> ----------------------------------------------------------------
> Ashutosh Dixit (7):
>       drm/xe/oa: Separate batch submission from waiting for completion
>       drm/xe/oa/uapi: Define and parse OA sync properties
>       drm/xe/oa: Add input fence dependencies
>       drm/xe/oa: Signal output fences
>       drm/xe/oa: Move functions up so they can be reused for config ioctl
>       drm/xe/oa: Add syncs support to OA config ioctl
>       drm/xe/oa: Allow only certain property changes from config
> 
> Badal Nilawar (1):
>       drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout
> 
> Fei Yang (1):
>       drm/xe: enable lite restore
> 
> Himal Prasad Ghimiray (26):
>       drm/xe: Add member initialized_domains to xe_force_wake()
>       drm/xe/forcewake: Change awake_domain datatype
>       drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
>       drm/xe: Error handling in xe_force_wake_get()
>       drm/xe: Modify xe_force_wake_put to handle _get returned mask
>       drm/xe/device: Update handling of xe_force_wake_get return
>       drm/xe/hdcp: Update handling of xe_force_wake_get return
>       drm/xe/gsc: Update handling of xe_force_wake_get return
>       drm/xe/gt: Update handling of xe_force_wake_get return
>       drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
>       drm/xe/devcoredump: Update handling of xe_force_wake_get return
>       drm/xe/tests/mocs: Update xe_force_wake_get() return handling
>       drm/xe/mocs: Update handling of xe_force_wake_get return
>       drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
>       drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
>       drm/xe/guc: Update handling of xe_force_wake_get return
>       drm/xe/huc: Update handling of xe_force_wake_get return
>       drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
>       drm/xe/pat: Update handling of xe_force_wake_get return
>       drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
>       drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
>       drm/xe/query: Update handling of xe_force_wake_get return
>       drm/xe/vram: Update handling of xe_force_wake_get return
>       drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
>       drm/xe: Ensure __must_check for xe_force_wake_get() return
>       drm/xe: Change return type to void for xe_force_wake_put
> 
> Matthew Brost (5):
>       drm/xe: Use __counted_by for flexible arrays
>       drm/xe: Take ref to job's fence in arm
>       drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
>       drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
>       drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
> 
> Michal Wajdeczko (1):
>       drm/xe/pf: Show VFs LMEM provisioning summary over debugfs
> 
> Nirmoy Das (4):
>       drm/xe: Add caller info to xe_gt_reset_async
>       drm/xe/ufence: Prefetch ufence addr to catch bogus address
>       drm/xe/ufence: Warn if mmget_not_zero() fails
>       drm/xe: Don't restart parallel queues multiple times on GT reset
> 
> Shuicheng Lin (1):
>       drm/xe: Handle unreliable MMIO reads during forcewake
> 
> Vinay Belgaumkar (1):
>       drm/xe/ptl: Apply Wa_14022866841
> 
> Zhanjun Dong (1):
>       drm/xe/guc: Prevent GuC register capture running on VF
> 
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |   1 +
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   6 +-
>  drivers/gpu/drm/xe/tests/xe_mocs.c          |  18 +-
>  drivers/gpu/drm/xe/xe_debugfs.c             |  27 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c         |  14 +-
>  drivers/gpu/drm/xe/xe_device.c              |  25 +-
>  drivers/gpu/drm/xe/xe_drm_client.c          |   8 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +-
>  drivers/gpu/drm/xe/xe_execlist.c            |   2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c          | 134 ++++--
>  drivers/gpu/drm/xe/xe_force_wake.h          |  23 +-
>  drivers/gpu/drm/xe/xe_force_wake_types.h    |   6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                |   2 +-
>  drivers/gpu/drm/xe/xe_gsc.c                 |  23 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c           |   9 +-
>  drivers/gpu/drm/xe/xe_gt.c                  | 110 +++--
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  13 +-
>  drivers/gpu/drm/xe/xe_gt_idle.c             |  26 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  35 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |   5 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   5 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |  15 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c             |   5 +
>  drivers/gpu/drm/xe/xe_guc_capture.c         |   8 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  20 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
>  drivers/gpu/drm/xe/xe_guc_log.c             |   9 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  50 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  29 +-
>  drivers/gpu/drm/xe/xe_huc.c                 |   8 +-
>  drivers/gpu/drm/xe/xe_mocs.c                |  14 +-
>  drivers/gpu/drm/xe/xe_oa.c                  | 678 +++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_oa_types.h            |  12 +
>  drivers/gpu/drm/xe/xe_pat.c                 |  65 ++-
>  drivers/gpu/drm/xe/xe_query.c               |  10 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c              |  24 +-
>  drivers/gpu/drm/xe/xe_sched_job.c           |   2 +-
>  drivers/gpu/drm/xe/xe_sched_job_types.h     |   3 +-
>  drivers/gpu/drm/xe/xe_sync.c                |   5 +-
>  drivers/gpu/drm/xe/xe_vram.c                |  12 +-
>  drivers/gpu/drm/xe/xe_wa_oob.rules          |   2 +
>  include/uapi/drm/xe_drm.h                   |  17 +
>  43 files changed, 997 insertions(+), 487 deletions(-)
