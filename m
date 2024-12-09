Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0279E9C3C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4C10E4E4;
	Mon,  9 Dec 2024 16:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtwzGvEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1810E7CB;
 Mon,  9 Dec 2024 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733763483; x=1765299483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sNaviYQ0ZgQWptGlXurA9cGSEC1oIPDpklWqV2XxjaI=;
 b=GtwzGvEmDD/oahOlQ5I+nW8fUbH5JYFpe2iwaZlPTTnA8WskbMCeEx+d
 vaiYm5xS4Z311ie30/ekREa24V4557YSqeF2uVXgDk2gxhGLJoUezEYDM
 4GBW3L5oAMGCpgpUxNuMHQaeRYBzlJnOzjZXr0xooKUeXSxPDc/QzSmz6
 2aPeLu+RRhH+i01emDrpajo83dsrTxPXGcTwzVcLlgN+y1x5tPxNdS7hG
 G/IOOd/TMA43faKdSM4Jr3ml/lA0H1vbRBzLwNOw1JFgZ0BnTR9XU3nB0
 NZipErMnH5a6ptbBPoOLe7WnA/c9nGlKPw5ItL8q8qGzfr8Idszt8mbc8 w==;
X-CSE-ConnectionGUID: DGSyZFrJS6+b/+awK1ZB+Q==
X-CSE-MsgGUID: pi5COpiwT66sucyYv3CZIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44543070"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="44543070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:58:02 -0800
X-CSE-ConnectionGUID: RUEsQ/jvQCquBdAZa18RkA==
X-CSE-MsgGUID: y8sQEyggR6Gp3WM6efOTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="94992824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 08:58:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 08:58:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 08:58:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 08:58:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J49vNNrskYsBr7hEH1LGn31V81800ieLAmsjoh0TdBQtZA4TTRkLwMK2YFhbGlPEIC0OITAExNojx1A6t8QBJv/waIU6aTXlVTTEfvJVMwVYUXUGLHORTGYZ5w3NSOrgUDR/WgTbRhuixhUg03dN+DI/4dwrXKHSGPfEq7yYXFHwHfa6Ew6znxQZxvPS8Q0Oa4inSZRBtlNHrXAwwjslehiVviyeQ2ThUmWEGUDb981TpiI0ueschATVg7+adPLCeNxRgljwkv7Z3HCe5I8ZQgUbkkdCO9R8qE1px8LgDC3Dykju8U+k9TYlOjZkVdOgL5vXsYdDGJJZ2nCReZZsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCDnqM6Mf2JPY6FV7OmMO2SP6z5OmXHmlg5MMHPEHZo=;
 b=eww0YF0GW/Hexg7m8RQbQrc8JaNKfU/aeMzfgpe1dwgc8bhhiwEJ/dX8qGWiWzb2gkFwfmouprNjOtocyAtiSQ8vBNeXPeP74Da9ypMZl294fz5uem3ZM1XX7++3fXcYV0w0314PmreQ2Hq9gMcJ/RpAb3OFzCriQrjqscHzILD9cJu+Fh0hz42XAA1Z+Jo8mpx5b16cYlP/9MJ4xYoY0NF1BEjNdo6A5VpAT8MS9RrjIjLytlfZ9ErxoOdTc+lHrK3kCkfnMApv+ad1WT49PEkgM0kpC0fqqLAqaaHWQl1mcH45eeVemTvptsLT0+pGipm56hG1+jlWs3ZhPi5vfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB8782.namprd11.prod.outlook.com (2603:10b6:8:253::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 16:57:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 16:57:58 +0000
Date: Mon, 9 Dec 2024 08:57:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCHv10 00/10] Display Global Histogram
Message-ID: <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: d87a84c3-9f18-411e-a4b1-08dd1872a253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mnzAG9Hkw1QeEi606cT7O3/lvH8WioYoeRLqgX9mGacwiLaUKQx8S8C4vbuc?=
 =?us-ascii?Q?4lbVLshyynJBbi7GVp+pD+/SZbEExoGIB6L+i1f5o5B+YazkpXuG7kjiTwQd?=
 =?us-ascii?Q?Bs4OEC+gUoGhMKQkGYl4SZ1uv2GF1QzYgOcTGcyHmTEEQ63aKALj5bmK1hUm?=
 =?us-ascii?Q?v30Gg02UsTGNd3ibLeYMOhnKagaDaZjt9+YtdDOSf1wPU2Hv3KQRkjfiBhe6?=
 =?us-ascii?Q?ZzsxndyhBjkDYsb/dn9d3MARNwQ06knAH4DYbkFA6bfh/IIil6x5oro42Rjg?=
 =?us-ascii?Q?CHLGNFB2qrM05CBY3K0wU5T1VPwj/A8qv22P7nMvqV2Uk1NN0qECErafBJsA?=
 =?us-ascii?Q?FbUTVWECOvMEqd5J8NKF9k3z9ea+o6KrLwFEwoPTH5kYP71dOx7wDaMDefe9?=
 =?us-ascii?Q?P0ev5RfywwxiQ1UGE0OejYA48MfMQ22wYwYlJFPuUQqTytIjnNoVe5MuF/SA?=
 =?us-ascii?Q?xpMCs/GJ1bA1R6sK/XLUE+O851EeLZ9w2n4ooXkx9uokp9rSymqmTJWe0Q8N?=
 =?us-ascii?Q?l9/Vrgs9TCCLpFC4zSUqr3eOOP8ihO55nWCspTMKOWJq6Jxo2RcN9dl2WAxe?=
 =?us-ascii?Q?V7fYQ7wuff2hnY/x3sBlkCbpZa6QGknjMKM+lZwOERFgLcWptp0Y7clL3AIE?=
 =?us-ascii?Q?TfIE74UQpwnQSEp0e/n3rKyoHLZK8K32i/KSvWY5FGF5MpP87D1hxdj3GG6i?=
 =?us-ascii?Q?pavOSdsfub/EyvADtKWpLDtJPal00Zs//hvEKepAAKNMOsLYXgsAR6ALyOc2?=
 =?us-ascii?Q?C+sSDX/ce5sR+rXjGpuVG96j0ikWFRkRDQZler/acsFkkg8Eoe+RlOg6dzIV?=
 =?us-ascii?Q?WS2SOoTF/mBd5BqXGAlu/U48M1JJXC2pQsRLoyYR9VieL7qYYilVRx/67XKQ?=
 =?us-ascii?Q?GjuzxMb1+ORb+r4hY+jsnXDwezVq9zVvg5gmjYUX+Tb52yvoQ1HCVhesebxR?=
 =?us-ascii?Q?EQi2apEowmcNu5iw3MEjygYsU5LOSXVc6DSJQYZqpsuAy8gSrLwlopNBj/Gd?=
 =?us-ascii?Q?cPUIZXmMPVd1dk/4OubaZvLmqzFIC1qvm3oJMdzGWOLyY5ozXKDMXdgY99yu?=
 =?us-ascii?Q?b4S4OfxXSRm3Ap5l9NqnXq11hxtfnOwEmmQBOZqBV7SGi1yvaqXQakfxBGBq?=
 =?us-ascii?Q?v+sSYjQeSAoIc1C9Pc19q8XOWVrncGSKHnL0df99F/+FYBhN1mYiW6tABTcU?=
 =?us-ascii?Q?bvP0KRRTPKNoDGL9Zs0BZQuqa8PnoBnQ53L2fx19BYM1F8odCuT1K430Cn4P?=
 =?us-ascii?Q?xdPCKL7MnkN663Ui/GlDdrdCjiGqaUSLwHaLyi/LvlXgHUDqtTZeEeTQhqO/?=
 =?us-ascii?Q?9P0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3Xs9Aq150jwMkU7leedfMHF12DJuCAmRj22ZuxWYn3+J7KDKJMsmyA5f3ps?=
 =?us-ascii?Q?SmURpAbRH5156zqZKytJutTTPNc7coewrSatk7t+JrR/FFMAa3cjKZcIIVfN?=
 =?us-ascii?Q?jjBAWbC+LWY/l1OP0CXETglSkOW87KJ14WKyw4SkWoxoBdoaTFSfoi+bGf6B?=
 =?us-ascii?Q?jTuVf4rZbpjj8eTNnrd8bvhRKF3l26sOO2qBelXmy+wg1ss+P94Ghdpcq+wY?=
 =?us-ascii?Q?UfkPmVuTEy9y8knEOgS7kDM+7tX3e94BnN4CqrTVPW4iT/8hhT0Pv9Wjq2T1?=
 =?us-ascii?Q?ogHyed3P/BPP+o0pZPMYPauQ+tAAnD9uCbm9b0NQnfWfGpdYQ0M0ChMUls5O?=
 =?us-ascii?Q?qmKBz9IY9kgJZyCtnwIbqTkx1Y/CfZuFaEuC2uelDQms3JcCvMKSuaSjPkeH?=
 =?us-ascii?Q?cCOmfMgdjSRRh2TE9rRuk0HGqwHiOGuSQq9uabdCUGmJua8td9FLErbgPdkS?=
 =?us-ascii?Q?p6xQgj8h8i3ughgMOWHI1fsCdJ5oNsWnU07PwOvFPnu7lM6QUIhoCQ3Y/r+m?=
 =?us-ascii?Q?ze7gUDoFniNqZyunQ1bbcPx1UxyAV/IdQdnDVVe9ZB9iQawsFgGqdQ9C7dFH?=
 =?us-ascii?Q?BPjV9D3dyDe74DqZnVBxcHyBvt3Ja8XJN7R1l0U8QXLavhV+zLkd7Fu8I8lK?=
 =?us-ascii?Q?mqZaLHZj4Iq0/lGoRkVmxYVF+r8PyIciHLWIxVYf5d/jegCkHQafZy7gpQWW?=
 =?us-ascii?Q?kUs7eXNNoGzXsCVfO/IjtE2GzucbSMC4s1sn9FVTkE1Aw2BoENoKifwIduRG?=
 =?us-ascii?Q?v0nPJnlcayhYAvtW5S3Q9SWBMloBF5GIPqcZcRLF2ZocqQfSRyBYGMmMgdu6?=
 =?us-ascii?Q?APa7JeRsSojKP6Db3T2xYS4+4mn0/aKKnxnLY6pchscQ3c42EO1TKo/mdpyl?=
 =?us-ascii?Q?8Dj2mXhJfMLh+75L1l7Y11tDcaGPir2KWPJhYhelpOSrHZL9Ie+7oGC5ga85?=
 =?us-ascii?Q?WZd0ZCWcjkJIkKifgPIhap5bNF5eXdHU9sjt7D1wTX4QJEHA3CP/NDkU1Vua?=
 =?us-ascii?Q?mx8FBCIj1iNCQri9VTY6t+x+bA/0+7GoJZhd3D/W15RK+9RV/p2ELlowgyKM?=
 =?us-ascii?Q?G5cQyNLmYS4X5H+RD8/bswjzPkW4mcrb210OqcGSV7S3+s0vMpH/rikrv0pR?=
 =?us-ascii?Q?Y8l76wTiv4wPzkeg56Is/QzyBbaGd1fDaUz1l+ZnRLzMVY4Ib/IttkqwBqVy?=
 =?us-ascii?Q?FpipvW7r6QcmV49hSO1Qx1ikPMkBrmKC3IU7GLLKObuVaZaf14DStckwa6Js?=
 =?us-ascii?Q?6k/5iHIYD1BtIweX2sYBGgX9zxaduFNHrotIqKfRxbj1HVh5pigjS3wPTd24?=
 =?us-ascii?Q?nJmiH3kFzgSEmhrq05jlMR9hG8loqJ9rVYgMSRLbVHm2r8vcjZj9cyQb0SQ+?=
 =?us-ascii?Q?nSWcu+QyCl7Cf0YP9wYW9nL4EcMpemJ1fdwV7OBbrTr3OvYu8XVAm0Rp3jK6?=
 =?us-ascii?Q?qxbZDHZF1KbUfdVVrFgrDVXk+piIvT50kwzFgfdcp5locrLPjKeD7zVZVo0q?=
 =?us-ascii?Q?pFSPjN99Ae3XhGtFYZnD0+BXQAz9rhUxSmf9JH6Y9IoH72NrKx0tbUwvDx5G?=
 =?us-ascii?Q?W4dXQfgA/4sMDoz1fUprUN74+YWcsYtV0cmYZA9oTxcWAwu2WRIZE/08421W?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d87a84c3-9f18-411e-a4b1-08dd1872a253
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:57:58.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gM9YtV0Lcuo61zngf3ByjI02Ghr/VSXKUZHXLmMBxLe/3XINHxrmA4RKNHQuKj5dm6D9hgSeGW67b9vjJCQGQMi2JIFmnnbXexNxIujFztc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8782
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

On Mon, Dec 09, 2024 at 09:54:54PM +0530, Arun R Murthy wrote:
> Display histogram is a hardware functionality where a statistics for 'x'
> number of frames is generated to form a histogram data. This is notified
> to the user via histogram event. Compositor will then upon sensing the
> histogram event will read the histogram data from KMD via crtc property.
> A library can be developed to take this generated histogram as an
> input and apply some algorithm to generate an Image EnhancemenT(IET).
> This is further fed back to the KMD via crtc property. KMD will use this
> IET as a multiplicand factor to multiply with the incoming pixels at the
> end of the pipe which is then pushed onto the display.
> 
> One such library Global Histogram Enhancement(GHE) will take the histogram
> as input and applied the algorithm to enhance the density and then
> return the enhanced factor. This library can be located @
> https://github.com/intel/ghe
> 
> The corresponding mutter changes to enable/disable histogram, read the
> histogram data, communicate with the library and write the enhanced data
> back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
> The IGT changes for validating the histogram event and reading the
> histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/

I think other people have already asked this on previous postings of
these patches, but please don't try to manually hack the version numbers
within a series.  What you just posted has "PATCHv10" on the cover
letter, "PATCHv2" on one patch, "PATCHv3" on three patches, and the rest
are unversioned "PATCH."  The general expectation these days is that
versioning in the subject applies to the series as a whole, not the
individual patches, so this causes a lot of confusion.  Posting like you
did here also wrecks havoc on a lot of the tools people use to manage
and compare series like the "b4" tool.

When generating and sending a new series, you should just do something
like "git format-patch -v10 ..." so that the proper "v10" numbering is
automatically applied to all the patches and we don't wind up with this
strange jumble.


Matt

> 
> Test-with: 20240705091333.328322-1-mohammed.thasleem@intel.com
> 
> Arun R Murthy (10):
>   drm/crtc: Add histogram properties
>   drm/crtc: Expose API to create drm crtc property for histogram
>   drm/i915/histogram: Define registers for histogram
>   drm/i915/histogram: Add support for histogram
>   drm/xe: Add histogram support to Xe builds
>   drm/i915/histogram: histogram interrupt handling
>   drm/i915/display: handle drm-crtc histogram property updates
>   drm/i915/histogram: histogram delay counter doesnt reset
>   drm/i915/histogram: Histogram changes for Display 20+
>   drm/i915/histogram: Enable pipe dithering
> 
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   6 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  17 +
>  drivers/gpu/drm/drm_crtc.c                    |  30 ++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  17 +
>  .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
>  .../drm/i915/display/intel_display_types.h    |   4 +
>  .../gpu/drm/i915/display/intel_histogram.c    | 380 ++++++++++++++++++
>  .../gpu/drm/i915/display/intel_histogram.h    |  40 ++
>  .../drm/i915/display/intel_histogram_regs.h   |  75 ++++
>  drivers/gpu/drm/i915/i915_reg.h               |   5 +-
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_crtc.h                        |  49 +++
>  include/uapi/drm/drm_mode.h                   |  11 +
>  16 files changed, 647 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h
> 
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
