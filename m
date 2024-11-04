Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879E9BC0DE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 23:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6A10E0D7;
	Mon,  4 Nov 2024 22:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1Q7EPWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D969510E0D7;
 Mon,  4 Nov 2024 22:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730759223; x=1762295223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d+X2uehcHeJKDzfblGXQabkmUgWVNxSohVBa/Ec8uRg=;
 b=X1Q7EPWHHJgQRm39E6NlUyi4ppmE2CW0cwo3QPCxoZ2eoRMP6JYy31rg
 YpU8jFROmZZEZ9gNoVO7LxDOMVqB+sBsUlU2SoS2TjMS2Ifgv8RipUojD
 dJGWyG8U4SLXSmHLMWedQbqaFVldWcXBDQliehvPdxiurnWVuH8ZMDouU
 eHwP6S4DRiQMDbzowAI+WkMMNgreWzp/lWRsJLvQwWwux3OOlQqU5UM++
 i8F4hK3+quqFwTMqLHLDNLaf676E5XmFVO8GUw3aaRK4yHeIPyQgcHsCi
 UwKAGvkbz99C629cK6gWnAtAbmMrbIMXi0Ck5Y88a6KPx6fPlfmxgEGKI w==;
X-CSE-ConnectionGUID: TjVrFRtjR2GcgwppeEUlNQ==
X-CSE-MsgGUID: qHh81qs9SE+QMevU2JtcsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30657430"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30657430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 14:27:02 -0800
X-CSE-ConnectionGUID: QL6d4CbVR/uqdGvk3xJmRg==
X-CSE-MsgGUID: C0uUEiuKTI2NnW12XcVxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88305527"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 14:27:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 14:27:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 14:27:00 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 14:27:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdxPP0YLJSUXX7MvA59NM0fbUA5Xcv5TfuNf91l5xnbfTtS+5vrE6/OGHCcHOztFR9rzs6B+Fsi3JvxxzbmXpsWA++4GX0jziKXn8ss9/7Fk6HOQY0crF8cHTPl8VCHfDlYjJmlcYY4qol3Xv5lYr7X3tJ3kGKBf4r8oDcp0B9WDs/VwpyBLxviSwHxep/m/gI2HqxtGPHNUDbvzT7tiPhg90IDMFqBsb5hVbYuMRJIFb3k+T+/8Leo49zJsA9HzFR5EdOWii4WH90y7VAV9jCerqGLCbwQcNk8hYW24Mk4H0oiA7OXhlTkkWkWGyfkR65lpiapyOhyIC8GIoKLTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi67d6LWjeQX8vzLQAPWER/2WBvGri/GnCS3sGKuatY=;
 b=tR9C0IAYl3+jobpJZ/RHA3J69a94T2I0yE25nGsv+Dn7yB6M1ujfSczyGmotO5hl2E6npbfC/1GwVJN3l2+aCtxnGz+sgA9hfqqWCkd0oIneHV7ZlON5KLjxLvq8l9FjqqLXy4mNwNdagtIs9CFbT+kkfQTG1vf5gdtjE2Jnkxk6waSUtuZT+mERY9ElsOPdvYMZGG9qnwyM0ETGks0a3XLMaMgncX1YBneSHprxQzKG0AcJPMWPig2uYeRUsjcMTmr6KlL/09VTL09VQKlWi5oa69ZqfxDcgHrVkVg8DUx0BrOjgjJIfEjwv504ELDMmhNNBI6mc+OclCpMBaTUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 22:26:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 22:26:50 +0000
Date: Mon, 4 Nov 2024 17:26:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZylKJPasP7TunukC@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <eb0b672c-3300-4501-96c4-bc310b80f63e@gmail.com>
 <Zyk9AUmjSimlG4OL@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zyk9AUmjSimlG4OL@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:303:b5::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: e39ed17d-4bb7-4346-95cf-08dcfd1fc586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5wbuYISNdbJQPY6OUeDkrrr7D1mjnKfA0h3WN+Dp1jnSa7MdDgayE2pQrR?=
 =?iso-8859-1?Q?GSVrRy28AMXHtqdqHShgrsVEovYAX4nFKrlYDoJtT7geR0kZEQQtWvi8YK?=
 =?iso-8859-1?Q?0WGRD2Z6KN4d+nAHcvSEUXznGCcgjC+2fyK9VxqxjNgU3YsNWnkZGuDwE9?=
 =?iso-8859-1?Q?UD7zRtc/HPgeUmAfvPoLI9EV2JO6YE186d89jjybW6VQREabaD5ndWCpm7?=
 =?iso-8859-1?Q?QX/LrD80R2RDmHMsJ9Z0CEVjGeUs05wvdNIDu6iGLwAvqIuiGeiDDxHV81?=
 =?iso-8859-1?Q?qhwTDFrk4o+JVNmsS+p9/c8Rl6iM1LpHfTF/yQf0s7w1M7v69G27UtfAZz?=
 =?iso-8859-1?Q?g+h53VwHtck1yyYBLOoG4Fyhf/QhVr78GCL+GwAMR+kM6zMjHvhHQSoX5N?=
 =?iso-8859-1?Q?d/wE6gX3VQhtxyiY4AZ38seutzPy9RNUi1WCA5vMRTdW+TMYSqDklwd7q8?=
 =?iso-8859-1?Q?b+AoCTYM0cOIVVUhUcaFHCW99lKNY7PnBqeWgVOmju8Hk5bVePoEunY6mc?=
 =?iso-8859-1?Q?u/eroBPJ7aUYSKbFtEWvDYoFPMUSmqJlZFkJhhw93Qr/c1wgYyXB6J1b+y?=
 =?iso-8859-1?Q?W9iMm9l8M4JyrUmFvzgxv+WHUXgR9c7/blwJGX/KndXc7UQbGtssS/bIX1?=
 =?iso-8859-1?Q?SXxlfxALz28QlupZQ4ZN3MyR0BP8Avp4UmZr6jSUBrZig2lkRVXdea8s+K?=
 =?iso-8859-1?Q?/qgwugqKEUy1MjxD8DN1kbI7t+RSuDrylrFyX073AAPZ56Xj/YUzBVsRcd?=
 =?iso-8859-1?Q?OFNAA5mopQkJsIF3Sk61XsoyOsouYHtAQjhQzffJW3ehw86ezKjvrQfgIz?=
 =?iso-8859-1?Q?YOmB/Obt7WaDFiAyzmEzAyliETgBWeBp8FLuBcgCkHhPCTaIumJYQk9Mj5?=
 =?iso-8859-1?Q?tzd87qTNa3FWiCuZteteaEpIKfGGWitCxWV2bgJZX92imjNSLN42LNsjl+?=
 =?iso-8859-1?Q?+oOzgA09kuAAwWM3Es8JkZQ/FCQkI1PhpCl5vLd3HN7gPIVRLrjjFYEjP1?=
 =?iso-8859-1?Q?xd9E4I5A3X3WhJa2cNy9IjT3caBliU13cUQXC4TDyzKOyRDvrhazfXw8+0?=
 =?iso-8859-1?Q?UjAl9kvp4iyYO8Mdq5tULI5O3NK0p/5hSNtTHqEzeH5OTvaMLGCLjoN9yn?=
 =?iso-8859-1?Q?ZuOY2QEEyRblShY/FIQcJ2gdyb1FmW0w0gVZoZsvMC2ULit9SZfgz0x9J7?=
 =?iso-8859-1?Q?LilDwiAK0QLSeeNIIjBscJ4WmpyiVNWMvt3R9/xhR7cxN64o7zAAcmG0qd?=
 =?iso-8859-1?Q?/DHxMGed67BMzo5ff+hVAcTc81w1ELD+TV8/B5qSvqBgVV1jG1+KRa87+x?=
 =?iso-8859-1?Q?hRv50iUZqSIzG/AEPzDJKNXudI4pOYnaEoc7ebhmrOCvBNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pMBcRCSzZuH4A7D2QnC4S52c3tdgJnWgCs8qLxSiQIOdIn82JYVZMhlwkN?=
 =?iso-8859-1?Q?M8e0bsv71Pya+kyEOakxFUIgIkI0MKLsiZQ6yGfSihcaCX+8kUUfzhTeVV?=
 =?iso-8859-1?Q?ssHVAIpUDAGp1f/SX9JvGJbcvs4yfjbnCf+KoU99GDMZTIEp4JinuamCLJ?=
 =?iso-8859-1?Q?uJAPeblADQf6DR4A0y8iYwcLslKueZuraKxPnD1ypTeNfZsz40LceXDugo?=
 =?iso-8859-1?Q?rAnubihqHnbU26TSQygq42KTra30JJJMV/MMZlszSj9XXOlhNxiCSkNOqn?=
 =?iso-8859-1?Q?lgRdgFuYKg2XdwsXVY5yPLfYS4MoonCWI44kU5tb1mVDiEhDq9UdHwlA2t?=
 =?iso-8859-1?Q?l94MPG+tibJ3yJ3+g4HTr4ZzUoMjKKu4SYvLJReH6EAItnWtaHZf8Hgqlb?=
 =?iso-8859-1?Q?i3jFVhwzJeJ5VUvzNLtvZU/PxrELwTtQVv0+//gSVLi/BgGNb3zps7HUOt?=
 =?iso-8859-1?Q?5+cZ8m8UUKcDkTTK1GIUh+gSZKc8RZJ1ONTyCEFXrxwcODlXJKxjVBxtkQ?=
 =?iso-8859-1?Q?ft1LBs8pHzZAkRoy2kPeToPN/gsOYsQzc49gtxjvI4WAognKjS7vRzgfZP?=
 =?iso-8859-1?Q?Afs5EkFY/AUSjTGEc2QAzpCouzuTXAlWEiJCnQ9UwoZazSuhc1unJxXtNW?=
 =?iso-8859-1?Q?Ijxg/mMSvKa+6CIBBm1GzcwNA8vKpNpWi000TPePl17AZZuMcg73HvBHcI?=
 =?iso-8859-1?Q?zBQ/lmJaEnYxjUTTeg/qKsOBPFtI+QCD/EkgT/c91nWoU9NwgqH9RsKKr/?=
 =?iso-8859-1?Q?4Bueo6w2OZXwH+DrZUkSGATLahyAaLPTzfxQb0/xqWTkxi444xNRSitCqk?=
 =?iso-8859-1?Q?NUPEszRFHAVlql+myCMaNNzKwzcmi5uhbqpikGuQNilM+NoVk5FCkjlaSa?=
 =?iso-8859-1?Q?RgP0k31HQEOXgSQVzJja0SQNkLpWoL8eGoYpz0zx+gMXcWH7lwzVihFq/M?=
 =?iso-8859-1?Q?vnuz89zkvXi5pbwDZJxHDGrzVUlrhX9nVfLVZf8S0TOXgqz22KtE806w3f?=
 =?iso-8859-1?Q?uThiRtqMPJz+Q520ihB6TBwzSvBMz+c1ftW1+lxQ04EmBS2tniyNDmrAeU?=
 =?iso-8859-1?Q?WdRr7mxH0cVocAoBWuJ3RlDSrX4eknFm6ch2x6N7gm8t5jVNaR6z/B8qam?=
 =?iso-8859-1?Q?Rk8LKJTaK51PJ/iZU7t00iw+Cl6ZxC4lkAdONjiVPJ3jKvE/sUHUE0MpQg?=
 =?iso-8859-1?Q?d8AAGuueHCo3RJEa8Jqh4aAAEDNH60RZgN0LS2qY3hfYckwG3kzSh0Q+9p?=
 =?iso-8859-1?Q?AMzqUckPkc0gbj0KOfZUU6FmoWQl8YHT+JPMePD/Wsun2WhKZVmBNJIqmh?=
 =?iso-8859-1?Q?L2WNTVSjuzgS8grYERndZ4L0lmoITlknEHI5SWFGRqOBfmfYV7f8Ubdrgq?=
 =?iso-8859-1?Q?WPsPj3VNYeOBVeWjLigbyoT5D0HONQzdpKRuWkRCma7SFvekMYCz2gRGqB?=
 =?iso-8859-1?Q?tZe2qI3MbalBtg42JA2sWA7mzd/4HjsRIe6eQ6QJivZD0MgcvEy94ZsE5g?=
 =?iso-8859-1?Q?G2O+4BgqNF4jkLFVesLHWcZZm6lFwp2JB8K9FGv91+hXzAaVHWLhEqy0a8?=
 =?iso-8859-1?Q?rUhSTrCtvgG5vaOxbu1u4U4r0krS48BYOuCZYc81XASOjr2nVYeFx8MzEk?=
 =?iso-8859-1?Q?RAQkTnMVgGRodjlYHG2HHhsnzBkB0SPA45mRZG9Qd/F1exRTmgbIOv7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e39ed17d-4bb7-4346-95cf-08dcfd1fc586
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 22:26:50.1351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+1JLjwdlYGWulKDQC/YEFS9Bc/n3PgW3maLPggHvbeZG0H/UMgSpenkktd4P0LrqDLJ0/X2Q5g626Buneuivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
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

On Mon, Nov 04, 2024 at 01:30:41PM -0800, Matthew Brost wrote:
> On Mon, Nov 04, 2024 at 08:47:01PM +0100, Christian König wrote:
> > Am 01.11.24 um 00:43 schrieb Matthew Brost:
> > > On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> > > > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > > > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > > > ttm_bo_vm_access, to access such memory.
> > > > 
> > > > v4:
> > > >   - Fix checkpatch warnings (CI)
> > > > v5:
> > > >   - Fix checkpatch warnings (CI)
> > > > v6:
> > > >   - Fix kernel doc (Auld)
> > > > 
> > > Christian - Do you mind if I merge patch along with the rest of the
> > > series to drm-xe-next?
> > 
> > I don't see the original patch anywhere in my inbox, please make sure to CC
> > me while sending things out.
> > 
> 
> I think I had you on an earlier revision but used the wrong alias to send out
> this latest one. I will be sure to include you on future patches.
> 
> Would you like to continue the discussion here, or should I send out a fresh
> revision with you included and an updated commit message?

please send over a refreshed version with updated commit message and also
cc'ing dri-devel

> 
> > Apart from that I absolutely don't see any justification for this patch. You
> > move stuff into ttm_bo_util.c which not even remotely belongs in there.
> > 
> 
> The justification is that EuDebugger requires essentially the same functionality
> as ptrace -> vm_access. This patch simply adds a helper to achieve this. There
> is no functional change to the existing code.
> 
> Regarding the statement about ttm_bo_util.c, that seems quite aggressive. It is
> a TTM BO helper function, so it could logically belong in either ttm_bo.c or
> ttm_bo_util.c. A BO helper definitely shouldn't call into ttm_bo_vm.c, nor
> should it reside there. Perhaps I chose the wrong ttm_bo* file? I apologize for
> that. It would be helpful to know why you think this is the wrong place so I can
> better understand your expectations for TTM.

I also believe that the ttm_bo_util seems a good place for that, but
perhaps someone else has some other better ideas or suggestions there

> 
> Matt
> 
> > Regards,
> > Christian.
> > 
> > > 
> > > Matt
> > > 
> > > > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > > >   include/drm/ttm/ttm_bo.h          |  2 +
> > > >   3 files changed, 89 insertions(+), 64 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > index d939925efa81..77e760ea7193 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > >   	return progress;
> > > >   }
> > > > +
> > > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > > +			      unsigned long offset,
> > > > +			      void *buf, int len, int write)
> > > > +{
> > > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > > +	unsigned long bytes_left = len;
> > > > +	int ret;
> > > > +
> > > > +	/* Copy a page at a time, that way no extra virtual address
> > > > +	 * mapping is needed
> > > > +	 */
> > > > +	offset -= page << PAGE_SHIFT;
> > > > +	do {
> > > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > +		struct ttm_bo_kmap_obj map;
> > > > +		void *ptr;
> > > > +		bool is_iomem;
> > > > +
> > > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > +		WARN_ON_ONCE(is_iomem);
> > > > +		if (write)
> > > > +			memcpy(ptr, buf, bytes);
> > > > +		else
> > > > +			memcpy(buf, ptr, bytes);
> > > > +		ttm_bo_kunmap(&map);
> > > > +
> > > > +		page++;
> > > > +		buf += bytes;
> > > > +		bytes_left -= bytes;
> > > > +		offset = 0;
> > > > +	} while (bytes_left);
> > > > +
> > > > +	return len;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ttm_bo_access - Helper to access a buffer object
> > > > + *
> > > > + * @bo: ttm buffer object
> > > > + * @offset: access offset into buffer object
> > > > + * @buf: pointer to caller memory to read into or write from
> > > > + * @len: length of access
> > > > + * @write: write access
> > > > + *
> > > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > > + *
> > > > + * Returns:
> > > > + * @len if successful, negative error code on failure.
> > > > + */
> > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > +		  void *buf, int len, int write)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > > +		return -EIO;
> > > > +
> > > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	switch (bo->resource->mem_type) {
> > > > +	case TTM_PL_SYSTEM:
> > > > +		fallthrough;
> > > > +	case TTM_PL_TT:
> > > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > > +		break;
> > > > +	default:
> > > > +		if (bo->bdev->funcs->access_memory)
> > > > +			ret = bo->bdev->funcs->access_memory
> > > > +				(bo, offset, buf, len, write);
> > > > +		else
> > > > +			ret = -EIO;
> > > > +	}
> > > > +
> > > > +	ttm_bo_unreserve(bo);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(ttm_bo_access);
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > index 2c699ed1963a..20b1e5f78684 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > > >   }
> > > >   EXPORT_SYMBOL(ttm_bo_vm_close);
> > > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > > -				 unsigned long offset,
> > > > -				 uint8_t *buf, int len, int write)
> > > > -{
> > > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > > -	unsigned long bytes_left = len;
> > > > -	int ret;
> > > > -
> > > > -	/* Copy a page at a time, that way no extra virtual address
> > > > -	 * mapping is needed
> > > > -	 */
> > > > -	offset -= page << PAGE_SHIFT;
> > > > -	do {
> > > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > -		struct ttm_bo_kmap_obj map;
> > > > -		void *ptr;
> > > > -		bool is_iomem;
> > > > -
> > > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > -		if (ret)
> > > > -			return ret;
> > > > -
> > > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > -		WARN_ON_ONCE(is_iomem);
> > > > -		if (write)
> > > > -			memcpy(ptr, buf, bytes);
> > > > -		else
> > > > -			memcpy(buf, ptr, bytes);
> > > > -		ttm_bo_kunmap(&map);
> > > > -
> > > > -		page++;
> > > > -		buf += bytes;
> > > > -		bytes_left -= bytes;
> > > > -		offset = 0;
> > > > -	} while (bytes_left);
> > > > -
> > > > -	return len;
> > > > -}
> > > > -
> > > >   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > >   		     void *buf, int len, int write)
> > > >   {
> > > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > >   	unsigned long offset = (addr) - vma->vm_start +
> > > >   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > > >   		 << PAGE_SHIFT);
> > > > -	int ret;
> > > > -
> > > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > > -		return -EIO;
> > > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > > -	switch (bo->resource->mem_type) {
> > > > -	case TTM_PL_SYSTEM:
> > > > -		fallthrough;
> > > > -	case TTM_PL_TT:
> > > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > > -		break;
> > > > -	default:
> > > > -		if (bo->bdev->funcs->access_memory)
> > > > -			ret = bo->bdev->funcs->access_memory(
> > > > -				bo, offset, buf, len, write);
> > > > -		else
> > > > -			ret = -EIO;
> > > > -	}
> > > > -
> > > > -	ttm_bo_unreserve(bo);
> > > > -
> > > > -	return ret;
> > > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > > >   }
> > > >   EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > > index 5804408815be..8ea11cd8df39 100644
> > > > --- a/include/drm/ttm/ttm_bo.h
> > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > > >   int ttm_bo_evict_first(struct ttm_device *bdev,
> > > >   		       struct ttm_resource_manager *man,
> > > >   		       struct ttm_operation_ctx *ctx);
> > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > +		  void *buf, int len, int write);
> > > >   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > > >   			     struct vm_fault *vmf);
> > > >   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
