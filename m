Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD010AFD925
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4356510E1CF;
	Tue,  8 Jul 2025 21:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub3S9sgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86F710E05F;
 Tue,  8 Jul 2025 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752008762; x=1783544762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WadI+ToaLzajkFXZSK41itEX+5qJ0ms3wahTUHORrNE=;
 b=Ub3S9sgYa5O2naW4gGW3rB4ZRrte84NhnwrZVnDlFG28kqQ54Vq6nWVM
 +z+mn/X8RoMrRl6C40Mrxt7ZaZ7IzxHP/fjsji52wSohue1csIKAIMI7b
 u+GxnHube9MzmXhQqxOawAqznHE7k/i33op+G4wpcwD+3C2ECIXY4OGwC
 n6fZdMW26FWTrBfVYA6PLUjgyDU5hg4kxbPwgmMivVcRczAV+yinEkCQm
 n/xsRtGAn4CwgffCfjAxTt5lJczQ72QE1BDgj1Dn6I0DVNKCjHjQVO8F3
 NEoHluKL7qk04w0OSWbr5Nwn3ArNTFS1P4KhiALLHEBzFDBSA/i7NmsBW w==;
X-CSE-ConnectionGUID: BJ/ABHiUSiG1F3P9x/ivvQ==
X-CSE-MsgGUID: psgAe1RIQYyIGpRHlG7JBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54144467"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54144467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:06:01 -0700
X-CSE-ConnectionGUID: xVKqmEi5SFOjZsKmDvCWxg==
X-CSE-MsgGUID: sE3ajsk0T1+S5BoyQ4J2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159861182"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:06:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:05:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 14:05:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:05:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfUFxz8zHSJvdvEJFUmSARJx0vb+nL31cs4vH3QKsYt4hxUZrHsOJoYuw8WD7EBbSb6ujK152kWKfkjNBu09lVVJ33BP+Lwcdy3yJ0tcgMrxRsYSGeofrSt82okcikIjjZEnIb0OqVC0KMNyzm4Qtuu3KrqyFJj5dKPhn1ODyY29JaXtpV3wXJH84UZ5pZmuG9LZbL6JWJstoWW9yGx08hp6xS6BX1WXDJ18S0CYuCZEyv0+yrCsRjyb56Gtz14tZwpcrbXTlfFHP88A1QlM9XC4Aw00wMG1wkMptao8H6gswVEFh9mKeQodC3yeScBTtVih0GHyIwDUQNL24Hxc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl8Zo5t2Dk4gqftPoxDt3eJbAy3kRXSbj65bhWNVNEA=;
 b=uOM+u+2ORm0844hjYdGTaFnKm+He55ntX2vuaDlLknXYrWTuOBmvzGiR9oPz4DBSGz7u+Vcau/gYs6evTat6qc5oODHurg9dCB6b1FmdPVtg5C4kPg4X5Bxa4/Zu7ryfs+2T/G1WIAUviZe1V7S4dvNs0N6OgXjJbbOSCvAyg7eGPp4Zr5X/1RJIJU5Qpnag3Gu5PEGgZA0f13M2wE57c96Q0sV3TMAsLNJMpebeGFbnbFhWzBzVOA1CPQ1n2jiURiOd5eKToZkv6NfEaEZHXA+DrAAqohVac9j9Z1ZqPdQVVbJNvcqYVVesfAA6ZmeMrPag7FJaASwY9A2c5Pyseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8534.namprd11.prod.outlook.com (2603:10b6:408:1f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 8 Jul
 2025 21:05:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 21:05:57 +0000
Date: Tue, 8 Jul 2025 17:05:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
Message-ID: <aG2IL07UtZ4YICMn@intel.com>
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250704192007.526044-1-wse@tuxedocomputers.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: deb160e9-9819-479c-20c1-08ddbe633c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UxuyBUkKAlp+28mC3lAwyBhc/wVQFytIbpC27nC9c+uHUnIf7Qbmo+izu9xM?=
 =?us-ascii?Q?uYIDeNK8BCICk1B/MomQc6H54wziBgOTDCK2abYUe7Mpf7FZbRhFiWCPYT8i?=
 =?us-ascii?Q?4pu1gfhekdVPGO1nsE/yN2dlej5kJ9Zg9RI+g1YEnlJTb7r02drFUZxq/Fh/?=
 =?us-ascii?Q?jqXMPFWQgxH+8PnBbLvsBVK7RLf2FgoxvNHduEZeHZ5KnnNLipCSeYX15cJp?=
 =?us-ascii?Q?jZ8/gLidFq/91AYOkyO7AfUhy02MQAOc8vLKZCs+n8Err/LVHTrNUXzll5Aj?=
 =?us-ascii?Q?hlDk/32SFZNyA1mUQSZdOxwzwFD+80oVq6Wihw6xwVOGfp5MQmDgURmq+VkX?=
 =?us-ascii?Q?kiqlEkgzj5kt41v65ur+vFG4uLs8dRlH+XMEPkrZYY9VqztesSyfA0Xul1Em?=
 =?us-ascii?Q?k/h5tbdZcjigt0kyP+z92w5M3296bLFGzHGwMGD2exsle5fWzk7tltKBvrbE?=
 =?us-ascii?Q?VY94OateHhn9R+oO95iIoCJQSIQkP2H8d1D/z3OPzsKm9yyAu7HdklW4arva?=
 =?us-ascii?Q?Gn+wR0+b3mbsfv7p3ss1mN9T+FhHX1C86ksUcHGAWHG2nIYCAc4hoPt7nPaT?=
 =?us-ascii?Q?SQd22yW2MqxzhFYQYp9RBnQSRcWwqrH4zpCPccuaRBZ1xShgK8RyG6lq+Iij?=
 =?us-ascii?Q?vRuQN4y5y0qF+SQmQ70jidd6Wi6swU0Kr3KfgQ3e1cuFcKnoPTBjSgvH3Dkh?=
 =?us-ascii?Q?FD0kDhKW1VIxNi2v6z/jUfa4JjaxUL+2vunU1/B2dxXtGkIhAWwQySQEJjyq?=
 =?us-ascii?Q?kGjRUnSxSepNntmpEqBD/odE9L3Md0Z3SC4OfZMmQYV2nmaL2bgj1N8tE+1Z?=
 =?us-ascii?Q?rZcs5ZE8pgiwn0yPj6xPtuUFE/VAikD3aHCfV4zKPkfnXLa3r+FgIF8jHUvI?=
 =?us-ascii?Q?PvBCPColWPTcclPgqCLH7igHG80y6FssSOJTy06xGIUFVXjMC2Darao5684e?=
 =?us-ascii?Q?CB0fCYGjIcEzsPOqPQfvkH2L+JB4kEhQy36iHaUZOHw1KRuVk5KTWv7rsMtq?=
 =?us-ascii?Q?ElIF9H/mNW3F4GSqGZ7GtTYlhmunGOoSmcM0vXZobtMT5VpuaOObPvVwHSPI?=
 =?us-ascii?Q?YEptGueqS74mGaAaNJn+VaxwLhqN5M2RXnEKcdnWddRivFSY66EeR5kX/TlZ?=
 =?us-ascii?Q?ev2FNRvB3UMqhibovF+c0hn1XgQeFLGcEYqFVelgkL+MOsAnk/gR3NjrX+43?=
 =?us-ascii?Q?PpvMtnD4PmRdLU8RyOcv0ldFdwuWdtA9HFH4uLqDS3v8dztLG+9qZpW3fNde?=
 =?us-ascii?Q?7OH3h8g5SuZbyxfpDKrs18mra6oB1qEq3Cg0QQy/6OTITSWPMSf9xh0otb/l?=
 =?us-ascii?Q?o4oEziNZ3DEu8RXtGDtavSCUDpxTAAiubldGbqb31C7hVccQjSu+LTqhtBGL?=
 =?us-ascii?Q?WTW5q98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2IIbH4BT/AHiHiCnodpvtPizxA66m7+tgAsXtuLazXKyc9SNDVJEolu2iFX?=
 =?us-ascii?Q?TFv7kFOjEtXsmKJ/W4dX76jPopHqfk4eTumLrPbvBuO0qiZvfvnjLy0tG1Le?=
 =?us-ascii?Q?277HntiPLjQhDiXEbg1xB2hmUs1Ix+NMRMZr0rzrNZmqYavjiQkvxWfAzDZx?=
 =?us-ascii?Q?F0QU4CLdRYDHVKfGCc//VGEkcQOhksJLqO+WLcRmtGpqRwrfMaVt/bA92mXk?=
 =?us-ascii?Q?JrNMODrCLD2fQ0dZgGglA9BOq/nB86TLswP7IzwjqrODm6x65YCqmcUvAVGG?=
 =?us-ascii?Q?cVu1hMrRx/3E0pHnNHjSZZcpeiIcRm8Xg9hUVBYm5EvRK8D8cwLy6KyhJsEe?=
 =?us-ascii?Q?gdj+Xa4RrIa9XGgWIk2KjiGh/9ow0+2z5En7r5otHLYy5rItRip5PFsVnr0Z?=
 =?us-ascii?Q?qHPdadnwu+Jy71o5Ce85miig7ZgxwBFrrhLLUZgbTuOvoYukfZhyZRlOvT9f?=
 =?us-ascii?Q?rlnbnE++KLU3lGTxW3BY5FjE2yLx5hBDs1n2C0+juiw5YiROAvCB6WT5GMDN?=
 =?us-ascii?Q?vOicr7dmDhtoJnMZg521cFnxwJjeTqYLOpQXwmk/Au9K6p5n+szaduNyo3uM?=
 =?us-ascii?Q?odCwS/FKxZpswMZzQBk5XBYdlQ8y3XZEbT6PRgaXriJdypqEAWTFGV3FA+lS?=
 =?us-ascii?Q?1HxW090szrlJpTmCSLkyPbakEKW1XXo2/r1UO76XYLDMs7uejNpYO9d4Nq+Y?=
 =?us-ascii?Q?Yk0dolUZEaab4jfWXJj5KRABSIl3deLZGpLvlYLjCe3z+/TUOTiqwhOZYKlh?=
 =?us-ascii?Q?hVuUVKbJoOLHwJkvzDDuY8D2RdWvXxvgf2P/GapiuUCN7o7svL3m9LMpkgwH?=
 =?us-ascii?Q?1RlTOcryN4Qmt3gAdYhDF13SfCCSSPef6U2rQUrJ2RkRFs+y/e4YF980BLku?=
 =?us-ascii?Q?5eRXkDvDLMa5VLuxd5/wYZJSX2FszzDSWUy075olXhnEjAPIz0OJLzZdqyst?=
 =?us-ascii?Q?jVq8yjaxuFXq1q2eQaQDFy2Y0ljRpWvldY0A4ozDmUmqWxw93Ssf1CgJSqTZ?=
 =?us-ascii?Q?6YqAwfKKEkGRExQOipLod+eDoaMKHtCcBHmi/J3bZi3mk/v8Qh92yNWeup2p?=
 =?us-ascii?Q?08R0ViLY8Z5eGPjiW/lXtFky/wJXCi2gBALPmE/HoiE2Vhc4izoz+VPPTlBC?=
 =?us-ascii?Q?JhLEeO7gm04KIc64Ispq19Zu+R4YHb8P6q/VSLVUDDqAJYi4FqI5xyoOaVzV?=
 =?us-ascii?Q?8gJJ/4JWcLAyv/Gij2Em5t+PnzQ/+vPaEEvXh4WIX1Bd3+ZSy7TlZL9Hau18?=
 =?us-ascii?Q?5jFDIOYOJzqR1BT+8rZ/q7l/beKnNb4zlMwSlw1iCx91TDZwpsThHuVIGfXp?=
 =?us-ascii?Q?8xM3M7ovuIGn0jnodcykU+0/MNouhxzEXFXK/P2BtLQBv45PPni5i7Ebq3oN?=
 =?us-ascii?Q?KB/u9aeWc3BHsOschIcaxmZsVuR9tEt/3gPyN2+sgiORO137JtIFd1jTod9h?=
 =?us-ascii?Q?X4cJrh64isb9YBGcXDpyxGBA1+UvXMMG0pdYwgC7xDS2FBurCaFBucyGXZv0?=
 =?us-ascii?Q?mRNc8EjTDsK9V1ArVH4udltpQWhkoZ51qVVNNXDJY/PuQfYoWFkXbV6jDLc2?=
 =?us-ascii?Q?6RptblOWZaOI/pv/mEl5orqEPKoMhmmU816yiU/rVvAKxXz5sX3D/hAt6R9Q?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb160e9-9819-479c-20c1-08ddbe633c1d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:05:57.8780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3x0fwBDhqNSNI3OJTm++FH/mzirogwbKCzDK7gj0voRf1fnagdTQjkzjFCjKKaimgui9zbeZNLq8L5VKDgzPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8534
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

On Fri, Jul 04, 2025 at 09:03:45PM +0200, Werner Sembach wrote:
> RFC because I'm not sure if this is the right approach.

Could you please file a gitlab issue for us so we can get someone from our
display team to take a look and see if there's anything else that could be done
before we take the quirk route?

https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Thanks for the investigation and the quirk,
Rodrigo.

> 
> The flicker manifests ever few seconds 1-3 black frames in quick
> succession.
> 
> On windows 300Hz can not be selected for the iGPU, but the panel advertises
> it.
> 
> A cleaner solution would probably to go over the pixel clock, but for this
> device there is only one 300Hz mode in the panels edid and that is at the
> nativ resolution. Chroma subsampling was not tested as linux afaik offers
> no way to easily enforce it for intel gpus.
> 
> Tim Guttzeit (1):
>   drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
>     device
> 
>  drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>  drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>  3 files changed, 36 insertions(+)
> 
> -- 
> 2.43.0
> 
