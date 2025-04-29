Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E51AA1800
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 19:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F7010E431;
	Tue, 29 Apr 2025 17:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ebe7jp+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8342E10E431;
 Tue, 29 Apr 2025 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745949251; x=1777485251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WiQ4Bu5B00/LYmXlVtkCaIxwMUsswB9d1w6nD/T05D0=;
 b=Ebe7jp+ut6TbmW8DCN1NeKurdfstbCilNvTt+dqBSYOpIHmY+/po4jfx
 Y+zWzLJ67okYAMAoaCfNLfFcLOaGR+JzhJEUTNOpF9aBvFkdee1M8B6Ah
 im8Tgwid+jGSPI2eYZ7wWl58Z2IQBAurMhHMsKVvkUKN3aW3wikeloEXf
 F3A7xVQkE0FvGBAyRFnoCliG0kFk91lj0hY7Ds1rbPKlQFyeQXTooNhxn
 1cUQlCztOPDgN/dGhsFtEvlUfCZZt0gi4oq3ds5Pw8P2gWKAHwvbv4cAw
 iC6gFXo220Vh9s1xTQL/ZGKFxlbiSiYZIQOoTIjPhbvB21K2PPcKatXQH Q==;
X-CSE-ConnectionGUID: p6jAGD9kRheS6li0TwvNEQ==
X-CSE-MsgGUID: TM6faeAfQYWXvFYMmaUO2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58963010"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="58963010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:54:01 -0700
X-CSE-ConnectionGUID: ayGFwf5+SXWVmKvF2U5z+Q==
X-CSE-MsgGUID: gic0XR+pTTCeuixhLmMneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="157109979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:53:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 10:53:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 10:53:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 10:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9Ck6+E+PTuaTIpxEa27tSj+c5Ptlz3qCorIoRY21GnNeNUKFpw8o67qxiRva2/K7xTHjoQr3SB3tqM+8Z4Lpmc8VvL6QnuqqVC8J7fmHjut10wNiGlXi/RPD/N0toU465k9zcZUJRDC09XpZz/R2dBjdUGS4pyN8r7ma8iz/EQIMbZ5CSL91qSkivx/qBqnCMUFYKihS7Ybh3IgIFaxw15Rq3gKwkZKGjvCisa3bymBpidzhbn+Q7C9wG6lhafVrleer0e+fi3zY4O/U+txEbTnK1AVYm5gkyNzW1dxy8rc/DRu6o4YCCmNiikqxd8HcwBm0xt74p61CRjMYv4fuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GamddYSQ/QrIt7pnaO94Xh1bpVxtnuJ9wVeC8maP/cI=;
 b=Xoyman91dtsOCeVnfffYTt3Z6X6hfSHREHRkX66eKMvUFkTLD/26WcONFzW37u9uGhKiBm4B18s8feOh2HJ4rxy6ZnTPPNGHp5URYJ4etLZ4k46KfoP+YOrnaKti0yT00sRLQZGvW1L9JRbSiz/vl7XTtMT0YnfM0mQR0tzAfxRADLl/EGYnq2XIv0mNagmnd7+MaEeWxIAHwlscikvebycaFYG3l91Ymp3x50pUGhtE00wEZ00JPDbZ5ZWB/DWZ7kumR3iDQjUIxUzAdXKnhFFHEXtQOYjkBYTcxJDFV9WUAnkUA+fpdXt6gTsfflVhY82h2IVeqJMGH5mhESD0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 17:53:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:53:41 +0000
Date: Tue, 29 Apr 2025 10:55:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jonathan Cavitt <jonathan.cavitt@intel.com>, Arnd Bergmann
 <arnd@arndb.de>, John Harrison <John.C.Harrison@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Message-ID: <aBESdxYMh4lrdasm@lstrano-desk.jf.intel.com>
References: <20250429073407.3505712-1-arnd@kernel.org>
 <aBERlisb42uGjZ8j@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBERlisb42uGjZ8j@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0356.namprd04.prod.outlook.com
 (2603:10b6:303:8a::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5b6748-f1b0-4501-0b17-08dd8746c714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KM8kCXfBxvqz6h+1hZnHIzjOA+PqpgxILgYi49p7TBkeJ8O+sH4f83F6Wo9j?=
 =?us-ascii?Q?hXV/jYVki47bdpPydzVLZ+pKRGqcu9375At+UKXMQ81opfMW3nJwHqOIeHaQ?=
 =?us-ascii?Q?ydcrDCcAoY+fOUnrHIHO6QLaV+Gy0gs028iyh+N+Q+8s93zRj9m1HEqgYY+Z?=
 =?us-ascii?Q?16wA0JnphRZPWOGvNF+CuS0WnyvouzU0OGRMifleFxtUO0/0Ikt6m9TOpamL?=
 =?us-ascii?Q?QrqrqSnAg35grs0k4kCji56Xc/Tf9s5CdhpEm3+nlT5+QDK5Cie3zbg9NxI6?=
 =?us-ascii?Q?Fi6h/ZTbja9tLL36lQa1ZNqCsg2FhxPBSVvL5Al1Dfb5VG38gdbVQ4SKRCfm?=
 =?us-ascii?Q?oSIaR7LllzWXP+WRSK58MCb945CLWXV5U3+BhxmjagIFAkqiOUeHy/4h7iiT?=
 =?us-ascii?Q?mK8jSvBfjwd3oETPB5c7PKd9FPLnZLDz9qLcTWlWDuSyi1ufvVR2IsCnf3i7?=
 =?us-ascii?Q?T0iNjdfjIn+D9xl2jjAZRYqgeABVG84gzSe9EXoBsddpcU8aMSK9YNlP9N5U?=
 =?us-ascii?Q?1oPxTCiuIRGlCz7YTg5wbMNRpbzoAV8Z45u32A2rwyp7aN9JVcCr4OJVpmfX?=
 =?us-ascii?Q?dtK21finurlpXSVo0wpXNhmBssEYYEgxT5+tuzTXG4sjlifvtqwnnQeWXNXq?=
 =?us-ascii?Q?uZRnpXmhB8yZCOwdjRUT0oBPaijYJWoDWlxSfw7i7YSPAfx4qdAvZ1+Mcgfi?=
 =?us-ascii?Q?DiqdLvW39p41wb/2FUNnfohOwo+ntbR7VZ9ygwBVObTBwcEAoV7sDEpeNWKm?=
 =?us-ascii?Q?tbpiDxVWK2iuyLzWbAS7iWSmtpXjSpdNrRdvgwnyuHPiTwCgmw+qXI4EUcWl?=
 =?us-ascii?Q?0twSCR2Pv8tHwW0ty0tNiHbIIt0ANJ2YkLbwwDydn1IMlIpxGev5XsWR4RG/?=
 =?us-ascii?Q?xlX/ttzV4+Dt9TeK0OPpKhGedi3t8jb5leRr6NkOCk4IEO1uF6qvvpbpLF+U?=
 =?us-ascii?Q?lTkOSZs/vne95lS0Wuhb8NY3lFiWjiLIpPibMICR+81fJAOniRH80w+9eubV?=
 =?us-ascii?Q?LtU81471qjw0/UeiviFpKcXLKi0rZA3myjjtxaDzvvAAc/Zfl6KoO1ykJfQK?=
 =?us-ascii?Q?uMXyttbZy5DS8J1wS+pPYHjR/KmM+AUgcwIi68MJUWFT4KN52MI8gFEAvdYK?=
 =?us-ascii?Q?zqQd0aL1cXlBcCgMwjqnTFXVI3srnNCiIwAoI5lTY3IA/3bRpGpaF/PvY8Kp?=
 =?us-ascii?Q?wgtHHcm/EqCZvXIiCnYW/JzSUihIlGwpEieu4lAEKgPq7p2ngRDUQNwA8vGp?=
 =?us-ascii?Q?F0C/lAV6VemXK2ch9VdLc38B2FZQr0UNCvGZ3dAQX44yxMzyi6FoikKP+eYL?=
 =?us-ascii?Q?8iYcYrNk8+yF5UndIct8vqi6gFoPfICSRPF/MebvB1Pehd1252gPqDxcjn4z?=
 =?us-ascii?Q?dJ3dH1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ekuzizhVOIrI1ogLOjXkMe05eIPwhf3001gP8L7dHwWUWyC6oVxACJdWIXo?=
 =?us-ascii?Q?u8/qDE5gqGqhhO5f20g5dAOcj0yc/u7UVNRj/AoyHTHM75ksFAxioLeH/AGl?=
 =?us-ascii?Q?1ZXRBfSqnp+VGjB+CyUskiyiETeny6NhG1tjHUmbwv2J0tlvIJCyq65St4mZ?=
 =?us-ascii?Q?OTfRMiV/6g7DqVeGvlFAQMNQHesLTqg1yY3xX8tqtvczzAge6AhMKJQfBux0?=
 =?us-ascii?Q?p6Cxy0yQECGByHsdVHtp/UAcQpBM5yBDzlYrNtmMXIwXURFG/m9q5dMDI4V/?=
 =?us-ascii?Q?xjc6naXJiB9aHdwnpmPAJ9ryK5eaSOcrprpWyEANsDtpeLcaGexrmPpimbFF?=
 =?us-ascii?Q?6iWTkVDGrz1yhcWENVmIFG6annS/2J19UvOfk+sdqu1mhN4j6DlGzbrnSYZ+?=
 =?us-ascii?Q?fYMcKbSkNDx9EkpiC4b5ox53R64fpLL66y6kE/nPsFwlm43PDFgJV9YCG/i/?=
 =?us-ascii?Q?HberoQ0PhaGlaNBkEIdjmBokp5ir2HjIY0lbJmlfzVDULn8dBkq2ShmNKHfM?=
 =?us-ascii?Q?AnzhDStYT9JK1xp4JOythpwEb9CbBfTN+wt6Y7+7K6QqrxNi5PyV3mS7K47F?=
 =?us-ascii?Q?0xfBbDuDJpBek567lG53a97tI7t9vWWARY+y+gy+qwy8fJMCRgZJoj7gLttx?=
 =?us-ascii?Q?MokdmeyqhD4ajobLjeKiLkKZXHMD+r0jo+3ItumFRPKgjr7BB7QnQsRhi7lK?=
 =?us-ascii?Q?K9KbiMWJ9dsoLfaoH1vLebk88SoV6YToRI+yK6ozZKJbMcSAXXr4jXDkYJ6H?=
 =?us-ascii?Q?ktmXzdnIGjyyk54IsXasinw1d+YnQ6cn4XSWzHB5KEHXdQ4qaQxNCG/8i/Xj?=
 =?us-ascii?Q?CfklF3WPU59O0wuIt/7FAXzorDPlsaIgt6EfqK2aG/5QeLybcKrnkNodM4o0?=
 =?us-ascii?Q?OYYLnjbPOPmHZJ7xavmsc0m0bwypbmsx/lmZ6e3YZM5yCMOgwOL/AtAybA/q?=
 =?us-ascii?Q?YnOHjai6CnxR1HMswztVY/KU8eqKj0p8krvXRJ5HHy+Qd8OgJqVX8v47Vq85?=
 =?us-ascii?Q?MtE6wWS4euhthdf06HPSEF9+5grxam+zC4NJk7XTqGGHZCi8fIxoQqu+rYI0?=
 =?us-ascii?Q?dw6UdW2DOPFqzRKwG3YjWoY2HFx8k62Dx9+iwfsQ9akm8Hjb1Yi1C8m8QMmX?=
 =?us-ascii?Q?7vV7rpaf3p44ruRFnSVn2Yhm+KvJjbUg/aNFrMxGTHhulI8LjTqQFq+JMJOa?=
 =?us-ascii?Q?Hza9AWuJQ7dGdC3ZKXyifPgKtDqDq8PqB4WtwY9LvO4lWMcvyR9qUkJbE6ls?=
 =?us-ascii?Q?fsohHhu+GIp6SyVVyf1XWZTzrogf5gZWPWFlxXY17naKXz9mB4GoqAg8uDD6?=
 =?us-ascii?Q?u1rzOyxUzJNveCTO4GuJvphk/L5+8GD5AkdFzJ4DtDpm0+XMinox8vsiIQPE?=
 =?us-ascii?Q?cAT48tLkuYpWjzzcl3LAGU7+/YcFPZSZYyfi/22+VMdQJv835gz9LoKOk2gO?=
 =?us-ascii?Q?7WG0uqeTGJUDVyBBESclw2PXxp5y0Gl7vFHla81/o18vcXk8yonKmP7U+Tmj?=
 =?us-ascii?Q?UHXs15hkNn7lQ1O6C3MZniYt+rSQK8zMmjfnznmUER7SWyakTsIA46KDjpYm?=
 =?us-ascii?Q?U7kq1mlNFWJwj5ToBeUcR6HShqOBrFHoUDrJ5NPvSBg+DXJBqgyCw/11HjJl?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5b6748-f1b0-4501-0b17-08dd8746c714
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:53:41.5535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fm2mriX4C38FQK8qAIU0HEyrsg/Sl/PSgRRqzQPEw9JULQ0ZhXnzk76SFJ/uzTPc0ZpoSlqZIKvKIcPbVtcOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
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

On Tue, Apr 29, 2025 at 10:51:18AM -0700, Matthew Brost wrote:
> On Tue, Apr 29, 2025 at 09:34:00AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The device core dumps are copied in 1.5GB chunks, which leads to a
> > link-time error on 32-bit builds because of the 64-bit division not
> > getting trivially turned into mask and shift operations:
> > 
> > ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> > 
> > On top of this, I noticed that the ALIGN_DOWN() usage here cannot
> > work because that is only defined for power-of-two alignments.
> > Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
> > link error and hopefully produces the right results.
> > 
> > Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
> > this will clearly fail on any 32-bit platform and is also likely
> > to run out of memory on 64-bit systems under memory pressure, so
> > using a much smaller power-of-two chunk size might be a good idea
> > instead.
> > 
> > Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks for the fix, I had similar one [1] but I missed issue with
> ALIGN_DOWN.
> 
> [1] https://patchwork.freedesktop.org/series/148301/
> 
> > ---
> > Please test this with multi-gigabyte buffers, the original code
> > was clearly not right, but I don't trust my version either.
> 
> This was tested on 64-bit only. I do see an issue with this version
> though. Inline below.
> 

Oh, yea wrt the ALIGN_DOWN we'd be reading the wrong data. We have WIP
to replay hangs on the GPU and this would break the tool. Good catch.

Matt 

> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index a9e618abf8ac..4eb70e2d9f68 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -177,6 +177,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  	struct xe_devcoredump *coredump = data;
> >  	struct xe_devcoredump_snapshot *ss;
> >  	ssize_t byte_copied;
> > +	u32 chunk_offset;
> >  
> >  	if (!coredump)
> >  		return -ENODEV;
> > @@ -203,8 +204,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  
> >  	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> >  	    offset < ss->read.chunk_position) {
> > -		ss->read.chunk_position =
> > -			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > +		ss->read.chunk_position = div_u64_rem(offset,
> > +			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
> > +			* XE_DEVCOREDUMP_CHUNK_MAX;
> >  
> >  		__xe_devcoredump_read(ss->read.buffer,
> >  				      XE_DEVCOREDUMP_CHUNK_MAX,
> > @@ -213,8 +215,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  
> >  	byte_copied = count < ss->read.size - offset ? count :
> >  		ss->read.size - offset;
> > -	memcpy(buffer, ss->read.buffer +
> > -	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> > +	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
> 
> chunk_offset is unset unless a new devcoredump is read which is every
> 1.5 GB. You will need always call div_u64_rem outside of the above if
> statement.
> 
> Matt
> 
> >  
> >  	mutex_unlock(&coredump->lock);
> >  
> > -- 
> > 2.39.5
> > 
