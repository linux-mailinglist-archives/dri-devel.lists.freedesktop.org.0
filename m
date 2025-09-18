Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A665B869D5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 21:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C546910E8EA;
	Thu, 18 Sep 2025 19:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXWv63TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B394810E8E9;
 Thu, 18 Sep 2025 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758222348; x=1789758348;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=NQaLgf8BfIIurWYVtGJSVtxdh66yBtC1QMFi9Zvi2zA=;
 b=MXWv63TEFtCbwTTXl8KNTaH8m+Un6n9Se6Qxx9XeQwePVXr5KHU4DDOl
 q9xGA35Cd6q0ZbHhLAT4DgGYM4DxrHZFo6NtGDUqdta3qK3wHLQuScANJ
 WnT7WZRq52RWPOeLj5TuGVb7rqppHVmoNOZc4uXDZEuYForW4gyf/STDF
 a/2weS4djFVHhX4aFdTsTY1YuMr4/4A16QzCy3VejzJTnGEb8AQtpHKNa
 VgqVEqbZ4x76WMBOWhLodC9vYX+jG8ia93gzCBGaNPpWsEZXBFyvqcxYH
 s2f0xvulYwhddCfa7TI9Ymz1koehwcmsu98wHm+560Tc1EM9GK9ieUeot g==;
X-CSE-ConnectionGUID: 2rB4nvwsQKm9UBSnn4CpFQ==
X-CSE-MsgGUID: vidg+7m8Sw+wC5ya6iquYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71939008"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71939008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 12:05:47 -0700
X-CSE-ConnectionGUID: P+glQQmiSd++OtDAkiZbtQ==
X-CSE-MsgGUID: gG/bc9oiS2a+xgbjomoozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175240738"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 12:05:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 12:05:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 12:05:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 12:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/WMM9eisJgol8hbD+iACh/VvbEbKe3BpWJ8aQ9EmMM/lseiRA+dB2v4dbnGIWFlCDNXi8DDbP5UgE7J3rhCoZ04nj6SaLzoSUvAKL6NpL8fL9Ny1/kV9O9VoObbBPXetCjVB+71u/4pyQiwMG9z3qZgql7Opt1TPQ1q4ruwohLy/DGzLuxjyJ0DTaD8w+Yc/c0sdphdrE+So0qp2OUEXxgzZ3Yj1AhXy581hPp/IqAQ3FY9v1ifENy/DOQRebjh++I3HaWOaHMLBXYH8v/ATnaPCSS0F2539i/PY2ob2/gfxTaD+iTgx0jsZxeXG8zXj8tLtdnKEelF+4CEDDewQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ9h27tbIhklpouI/nlZ2CHY2b7rCIt/E8bZkaNn4SU=;
 b=P1JhOI1pSnOGUg6/LBjisr5/87bfAc4SvgRBfyoCmJFWZdOzY1nNWrx98U8Wt6UZGNnPo0tdMEpHcJ5FJTwcJzeV36i8o+GbCAVSJhMBvnkg2mWTbMuQEn1vN2kiv4aERqp3fOUn/C7qG7XJ4jM13LbQl2f/dK+Hvc+gKHEVll4s/7Ay++Nq+7NlBl9hS9Vi8mdxU28d8+QeiP0V9+9MAiN78a+bEd9S5jkxecNJXDFTGqH5AE05RimyOmiU2YyiEj3UCwlK0ZvV5X+cIdHkYvqjx7Q472Yuh5Fdh9DoikRrSojofEPDa0PFB7NcnWk85HHArWTHKaYHvBHLAkZOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 19:05:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:05:40 +0000
Date: Thu, 18 Sep 2025 15:05:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next v2 of drm-intel-next-2025-09-12
Message-ID: <aMxX_lBxm7wd5wmi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: e761a1b0-9ee3-4229-b25e-08ddf6e65bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Yye2ttjS8LEnk7fD7MoLlN5CMeh9QQ4H67/y4VtmS8TONPz9tYHTqlCyEd?=
 =?iso-8859-1?Q?I8z5Xpv7itOVTeDve3fgDoodeCfy/U3GP1kUJxEfQPZgD/1HfRuqV6Vw/A?=
 =?iso-8859-1?Q?72AQozKtow33fadXsqF7bMIo1PB51QcVX/iQ36t/bz//PShjJogE9rIXk7?=
 =?iso-8859-1?Q?KnBCyjz+c9S45Dndya736PNkuo8Ujidh5gkAQR9nR3aW9Yk5NeoOp0aub4?=
 =?iso-8859-1?Q?et9ikB0LknvLDABXpJsnM8k34N3jCg8s+1V4nulHJSBx3tTnFgYXyzH8GF?=
 =?iso-8859-1?Q?9PabHMmDfCABNMs/rmUEakHAGrblp8WJUVCcPt6l28WJa8DrgaZOpFjng/?=
 =?iso-8859-1?Q?NtDXPscSrWNBGFWuP0o7rXBM/0Ij8lt9DWzadTMFUKplukZg9w+7GYLF61?=
 =?iso-8859-1?Q?cUitjeYV+06CaND4v2cgQBXFBBehN+3Mkx7GfwmNDvnt/hT7IEOsfOiYz/?=
 =?iso-8859-1?Q?Sp2dj6ZrDIU0Zz+PGGkIinXAp9cuhJCBgRg8EvvU+m7El+01ZO/OW6QbXK?=
 =?iso-8859-1?Q?3KRFo2/DZW+1J+o2SaOMt2NNgOU032Ja/7sV9g4SO8nvLncdByKHgCG/qo?=
 =?iso-8859-1?Q?JnslVA9Y1yGmHMY8xsY8R9GVklvq9e/Lz83vQBy/hb5BOqo5rRU2owE2FN?=
 =?iso-8859-1?Q?euCaJdcNbwsQd9NCZmcNGhK++RDlaRQFAIkdKmFv6b2T+x36NqumajQw2g?=
 =?iso-8859-1?Q?gfJQBq6tpZvHNXKzvwB4A5f2Ln+IQ/1YzV1o7QVa0Qs8A7JDXTAxmqId3y?=
 =?iso-8859-1?Q?vPzhNdizAN9MsoTyX2oZhlI/SUUoviarhI8GXL2OLK7PNABXv1H9UIpFKd?=
 =?iso-8859-1?Q?ZD9eodeKmfoXg4jNII1FFinwIrKs5IUjAhxgbWLroRmDDg0TXkfRSm+apC?=
 =?iso-8859-1?Q?mzclvo5e1KhMa+Y2Kpf8a98CirTMDrZzyyoRi8utXmBPTpjASBA/4kaHrD?=
 =?iso-8859-1?Q?iL3MGccF3uhcLJVrMNaK2/xw8E2pNIzzq3T9pDTLV6/RFwDJ14o6DQgo4t?=
 =?iso-8859-1?Q?ZsdBLkF5pVhX7uPPY22XeOtopKsn0w391HjlFmG2uiMCKj5X3INaxjtj/Q?=
 =?iso-8859-1?Q?ikb512IMBvxgc3mOLIG/yWW45kuRb9KNFtBugx4fn37F6FsDBCb+yY1cfD?=
 =?iso-8859-1?Q?mWWFRoptgK59sMZN/8ww0kiOy6S8t5yPIua7feNrtIzGzUy3kAaz8WOGK1?=
 =?iso-8859-1?Q?AEMFdwsiQrU4ra9stRFoRF0msHhwqhG+bCl4sm7qM75nuNd/LcuA9uZ9Ow?=
 =?iso-8859-1?Q?yh+lCMlTSCZtgzXhDLpnB+Vx1c8j+0tf16Qp7GR62CCWCReKo9mjK4tBSX?=
 =?iso-8859-1?Q?Qc/pgLHmxuiaO6QCv9pNXeTdjEh+e+7KBzC1g8FdPVhj4bXNz+boHeqAgo?=
 =?iso-8859-1?Q?IVVHjAsAtv5tT6vE20/ATu+P6PwYHzZQEXuRvVVfH66/OWqiP1EKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R4DbfXFXedTgH4bSxOluBshhlRdHw+Fvppu+n7jfPnDOk03WGAXOBocoki?=
 =?iso-8859-1?Q?u/OHuVqC50FVzYYtyJcSEBQvu5n/9CWhB59Y5jOdpGo9MpIaGbRcZMBYjB?=
 =?iso-8859-1?Q?HOQ0vw+O9m68g5SwCy4Xj5w28G62kEJCLU3htY2TWTAB6pX8I7GOme6yhD?=
 =?iso-8859-1?Q?iNhmxJmJd3JmzPihc9vs9lTrL6bPWvtag0vyXvRgBRNDqW7DQWWkUypxqG?=
 =?iso-8859-1?Q?mQ2EBc69fYZBB6Yeb3WVm+t29hNP8dEwPLRTo77GuBA7Zkri0tDAyQhI/V?=
 =?iso-8859-1?Q?6+9YeNJu3G9/3Zzhq6ECfeahJWcUxbqu5tL9qzMelOnED2R5RYfNOYlGJy?=
 =?iso-8859-1?Q?drthytAf38WB+kKx28r45mjVRnh1UVhjGUc8pMpjIz/fNs/aBxws3m2f0H?=
 =?iso-8859-1?Q?LoQQec5Jmg6a+K/f9eBASyD8HqCT8+6OZJO9GhtCoUDtHr8rvdznwsYDlh?=
 =?iso-8859-1?Q?GKhD85ViXb+NzjJzDQGte1hYIOX/0F41oiS99SXzQpZCXI1ewwabvprmtK?=
 =?iso-8859-1?Q?gYmEnS7pPAiEuzF7ub4zJu64t8IwffQQGA5+DZKX2emcHcy4plWgnhs4HX?=
 =?iso-8859-1?Q?jyoj//aOmW2d7igQPBk8qPEbOh/tM+8RcgldpfBHfd5CxCELdwOSS3lybo?=
 =?iso-8859-1?Q?Er5T8K9gCi/BUARhwCzwM8Eh+QPgSUDhkMrLwb9gPj6v20HqrxMf9/ja/S?=
 =?iso-8859-1?Q?JyhrNGJsAZ5pZXBPwoEayI/ev/JvjxcR5XNFmKa9aSnUCpbEmHw3/RrXuW?=
 =?iso-8859-1?Q?+avm1of7l7I4v9X6feDHIRX9MEq70/G9vXFuxOIHqayY/hxv8VQ5qMwivj?=
 =?iso-8859-1?Q?ybsAXSrSzZCwdyRhV0QlOGjdSnPG6euo4hOfxtyD5pBOuhV2mMSy+NaxxT?=
 =?iso-8859-1?Q?UCHXwohoJ684CYkPsbBSqIRDN09Wtt0FMrzY/Rcv8G/vu7G5pWWYV8cWRu?=
 =?iso-8859-1?Q?Xwoqh63K0CIbdbl6lnA6kQX0OS8HNUsFHyxwBPy1N+vn/JYCKd7pMyQIUH?=
 =?iso-8859-1?Q?EF5Rf/9dycSXxylc7lGqplA31F56taY2ZxZywLV8fkgACXUd/Eo47B/OnT?=
 =?iso-8859-1?Q?NpktuVzUkB0JRT9k9lw/2Jy94RsyXI0aiFSBw0HaU0iGe/cGHJzZGsKC8v?=
 =?iso-8859-1?Q?ijj3wvn7LVHh478nIR0Bjv7FlaIdylr2EtP2VthfpixudwHHcNdhTVR5GQ?=
 =?iso-8859-1?Q?P9xIwXZZNr7sUEy1udYymzjceiHbKnk7PK1fuce3rt8tVq+7B2I4ghLPCU?=
 =?iso-8859-1?Q?kkn50lK3dO+lCV63tx2f5D1s6pPjJ/aQAf8tBRwypB/f2T3TBGIWdjj1yA?=
 =?iso-8859-1?Q?akIHNpTwH8BGuVBD/okemDnTEyUQ4uN0DD9RX5quBM/PR9O0znKJYqAjmA?=
 =?iso-8859-1?Q?O6v5YwFspUJUpaoaAZT6VOXueyPDtKefQcI9hyWhKF81H1MvdUZRVVTJzp?=
 =?iso-8859-1?Q?DhOzs/5p2E21aInbDtnBOM1jor2h+5BkaO6ZXTHNZgBxci2ohPL6oBWSFL?=
 =?iso-8859-1?Q?tE+PTOOEbbufcBfCnPrrk4UAs2j+r//iNEvGfMpqDKNaILwtOghJa5/V9i?=
 =?iso-8859-1?Q?AG51GysOiF/CWu2jeedUa2oVimOhJ+KYPUOpEK5rbqeWVlspDWaI4zYgBX?=
 =?iso-8859-1?Q?CjjMUfGgWi2FJHt5tVUnk6TwYewKXpoB3N5HJKuvPi2f1l/TL0W9tBuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e761a1b0-9ee3-4229-b25e-08ddf6e65bea
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:05:40.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYgCpetD7s5v7yQSOJ5EY4VVYzcvZAxI2hRdjSCbrFBAwTgkQjsYiqD5J12qzWGtwrrIVvOCsaVmFMYrIPRMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

Hi Dave and Sima,

Here goes a v2 of the drm-intel-next-2025-09-12 request.
The first one didn't get to the various mailing list because
of the very long diff.

This is exactly the same pull-request, but with fixed diff
history below. The backmerge in the middle got git confused,
but there's nothing wrong with neither the backmerge nor
the tag themselves. So, I regenerated this pull request with
a manually generated diff as suggested by Sima in #dri-devel.

I have tested and it applies cleanly on drm/drm-next.

Sorry for the delay on noticing that something was off.

V1 message:

Here goes our last drm-intel-next pull towards 6.18.

Some clean-up in the i915_utils.h which even moved stuff
to the core kernel (overflow).
On the drm side there was the killing of the old struct_mutex
since i915 was the last user of that.

It is worth saying that we are without drm-intel-next CI after
I backmerged drm-next to it because it brought the lockdep
prove locking that kills our CI, but nothing related to our driver.
I'm relying more on the CI results that we have in drm-tip, what
looks solid.

Thanks,
Rodrigo.

drm-intel-next-2025-09-12:
Cross-subsystem Changes:
- Overflow: add range_overflows and range_end_overflows (Jani)

Core Changes:
- Get rid of dev->struct_mutex (Luiz)

Non-display related:
 - GVT: Remove redundant ternary operators (Liao)
 - Various i915_utils clean-ups (Jani)

 Display related:
 - Wait PSR idle before on dsb commit (Jouni)
 - Fix size for for_each_set_bit() in abox iteration (Jani)
 - Abstract figuring out encoder name (Jani)
 - Remove FBC modulo 4 restriction for ADL-P+ (Uma)
 - Panic: refactor framebuffer allocation (Jani)
 - Backlight luminance control improvements (Suraj, Aaron)
 - Add intel_display_device_present (Jani)
The following changes since commit 70a9b201cfa893fd0b7125c8f9205d9e12e02ba5:

  drm/i915/display: Avoid divide by zero (2025-09-05 15:24:46 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-09-12

for you to fetch changes up to 65805c2ed74ee47e81246f97f4b3c126a75f0b0e:

  drm/i915: split out i915_wait_util.h (2025-09-12 11:08:45 +0300)

----------------------------------------------------------------
Cross-subsystem Changes:
- Overflow: add range_overflows and range_end_overflows (Jani)

Core Changes:
- Get rid of dev->struct_mutex (Luiz)

Non-display related:
 - GVT: Remove redundant ternary operators (Liao)
 - Various i915_utils clean-ups (Jani)

 Display related:
 - Wait PSR idle before on dsb commit (Jouni)
 - Fix size for for_each_set_bit() in abox iteration (Jani)
 - Abstract figuring out encoder name (Jani)
 - Remove FBC modulo 4 restriction for ADL-P+ (Uma)
 - Panic: refactor framebuffer allocation (Jani)
 - Backlight luminance control improvements (Suraj, Aaron)
 - Add intel_display_device_present (Jani)

----------------------------------------------------------------
Aaron Ma (1):
      drm/i915/backlight: Honor VESA eDP backlight luminance control capability

Jani Nikula (18):
      drm/i915/power: fix size for for_each_set_bit() in abox iteration
      drm/i915/ddi: abstract figuring out encoder name
      drm/i915/fb: add intel_framebuffer_alloc()
      drm/{i915,xe}/panic: split out intel_panic.[ch]
      drm/{i915,xe}/panic: rename intel_bo_panic_*() to intel_panic_*()
      drm/{i915,xe}/fb: add panic pointer member to struct intel_framebuffer
      drm/{i915,xe}/panic: rename struct {i915,xe}_panic_data to struct intel_panic
      drm/{i915,xe}/panic: move framebuffer allocation where it belongs
      drm/{i915,xe}/panic: convert intel_panic_finish() to struct intel_panic
      drm/{i915,xe}/panic: pass struct intel_panic to intel_panic_setup()
      drm/i915: rename range_overflows_end() to range_end_overflows()
      drm/i915: document range_overflows() and range_end_overflows() macros
      overflow: add range_overflows() and range_end_overflows()
      drm/i915/display: add intel_display_device_present()
      drm/i915: split out i915_ptr_util.h
      drm/i915: split out i915_timer_util.[ch]
      drm/i915: split out i915_list_util.h
      drm/i915: split out i915_wait_util.h

Jouni Högander (5):
      drm/i915/psr: Pass intel_crtc_state instead of intel_dp in wait_for_idle
      drm/i915/psr: Add new define for PSR idle timeout
      drm/i915/psr: New interface adding PSR idle poll into dsb commit
      drm/i915/psr: Add poll for checking PSR is idle before starting update
      drm/i915/psr: Panel Replay SU cap dpcd read return value

Liao Yuanhong (1):
      drm/i915/gvt: Remove redundant ternary operators

Luiz Otavio Mello (9):
      drm/i915: Move struct_mutex to drm_i915_private
      drm/i915: Remove struct_mutex in i915_irq.c
      drm/i915: Change mutex initialization in intel_guc_log
      drm/i915: Replace struct_mutex in intel_guc_log
      drm/i915/gem: Clean-up outdated struct_mutex comments
      drm/i915/display: Remove outdated struct_mutex comments
      drm/i915: Clean-up outdated struct_mutex comments
      drm/i915: Drop unused struct_mutex from drm_i915_private
      drm/i915: Remove todo and comments about struct_mutex

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Suraj Kandpal (1):
      drm/i915/backlight: Disable backlight when using luminance control

Uma Shankar (1):
      drm/i915/display: Remove FBC modulo 4 restriction for ADL-P+

 Documentation/gpu/i915.rst                         |   7 -
 Documentation/gpu/todo.rst                         |  25 ---
 drivers/gpu/drm/drm_drv.c                          |   2 -
 drivers/gpu/drm/i915/Makefile                      |   2 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |  15 --
 drivers/gpu/drm/i915/display/intel_bo.h            |   3 -
 drivers/gpu/drm/i915/display/intel_ddi.c           |  69 ++++---
 drivers/gpu/drm/i915/display/intel_display.c       |   3 +
 .../gpu/drm/i915/display/intel_display_device.c    |   5 +
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  23 ++-
 drivers/gpu/drm/i915/display/intel_fb.h            |   3 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_panic.c         |  27 +++
 drivers/gpu/drm/i915/display/intel_panic.h         |  14 ++
 drivers/gpu/drm/i915/display/intel_plane.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  81 ++++++--
 drivers/gpu/drm/i915/display/intel_psr.h           |   2 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  40 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   8 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   4 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   1 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |   1 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   7 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   7 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   1 +
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |   6 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |   6 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |   8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  10 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   6 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   3 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  18 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   6 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   3 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   6 -
 drivers/gpu/drm/i915/i915_list_util.h              |  23 +++
 drivers/gpu/drm/i915/i915_ptr_util.h               |  66 +++++++
 drivers/gpu/drm/i915/i915_request.h                |   5 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |   7 +-
 drivers/gpu/drm/i915/i915_timer_util.c             |  36 ++++
 drivers/gpu/drm/i915/i915_timer_util.h             |  23 +++
 drivers/gpu/drm/i915/i915_utils.c                  |  30 ---
 drivers/gpu/drm/i915/i915_utils.h                  | 215 ---------------------
 drivers/gpu/drm/i915/i915_vma.h                    |   6 +-
 drivers/gpu/drm/i915/i915_wait_util.h              | 119 ++++++++++++
 drivers/gpu/drm/i915/intel_pcode.c                 |   1 +
 drivers/gpu/drm/i915/intel_uncore.c                |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   4 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   5 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |   2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   5 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   2 +-
 drivers/gpu/drm/i915/vlv_suspend.c                 |   5 +-
 drivers/gpu/drm/xe/Makefile                        |   1 +
 drivers/gpu/drm/xe/display/intel_bo.c              |  91 ---------
 drivers/gpu/drm/xe/display/xe_display.c            |  33 ++--
 drivers/gpu/drm/xe/display/xe_panic.c              |  80 ++++++++
 include/drm/drm_buddy.h                            |   9 -
 include/drm/drm_device.h                           |  10 -
 include/linux/overflow.h                           |  70 +++++++
 82 files changed, 770 insertions(+), 621 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_panic.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_panic.h
 create mode 100644 drivers/gpu/drm/i915/i915_list_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_ptr_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_timer_util.c
 create mode 100644 drivers/gpu/drm/i915/i915_timer_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_wait_util.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_panic.c
