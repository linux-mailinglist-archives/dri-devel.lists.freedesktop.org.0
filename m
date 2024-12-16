Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC749F3E6E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D110E3A5;
	Mon, 16 Dec 2024 23:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxW5zlKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68C10E3A5;
 Mon, 16 Dec 2024 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734392753; x=1765928753;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eJh21GiviTqEv0wnOTjZg3ogNgKTiOcdS18VA3+SwAs=;
 b=HxW5zlKa4aiIds3PDbnnAYQCRBZFxYAgywAX4qEVZ2Hwq6rmvIsES52G
 nzRNl33cvIQNUvEvvRY5KcEtzE0dN7xvvu2fDkdqPznTV6AkANPgtyF6k
 hOTOOe89itcSgatd7txjX/M5wORzlavrDCfyZslTmxnqOPB7O1TrlYt9X
 C3RtGl36Y0nfLX0ebTsdw9WL2o4aEdG9iO19tToY7vl6ol1JSWOZ0NFtm
 9YrP5Ji7CiqoeNOMFsqLNEF8Ka4CAayzJyGEDuFBaM1r0sk8HgIY8QOJj
 VeI/fEZ6Z+CXR/wpppW4+tCaw6QH/xQg1FWCYHOg31Q7bnd8+ZOd0kSfu Q==;
X-CSE-ConnectionGUID: zmsFbVSuQkOwPWpLWUuIag==
X-CSE-MsgGUID: CLALGlU9T72hfdmYfDuviw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38575872"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="38575872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 15:45:52 -0800
X-CSE-ConnectionGUID: LihQgWfDTAiWeuQIB0iAzQ==
X-CSE-MsgGUID: lqXpdgUPT2KJZAqd0wm0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101509231"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 15:45:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 15:45:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 15:45:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 15:45:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxoOf+xdQXdaxeFUbb+IbhGsZkYPgyagB61CAKfUXsF0VRACyIhPUYjjdzzn9C6qmFWOpDXDHvGmr3m5okda4EAyAQEKkF87+xHPVjXcgzWEsQGKyZugXEJAdMAVAEMpzoB6A2da3NY6hqUrzkf60R+iB7pqt2U3aJqvtddw2NLyOUcgrjK1P/iDEBO3B2LMZNNE+aSnfAvLUaDcmdplJlS8LnkNh8xn3LoE7u27h7QEd6DtN89KRE8Gu8bvjc2/iEYsJz0WKTYs90YRqxZHCDiedT5IZGDOruorkZRwSI1qjJqzkThK4GgPSLK6Cexo9MGpvLWo6XuobeK3wB7MvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLFK1HdtyKP4HnA82BuJlp4I9Mw7d/dBCaHJmYLLK2g=;
 b=vDd1yqNs4rgITY1TCBB7FQEs8DQUOa5YdfkFjwrTjEoMWlCtxlCL/p3KtWxvP5Prx387aY2p1+GTGbLRqHhQriqw7vCWwJBsBhB9nu2vtSDna7PKLPYZg4yM/O8YIvBQwedcnqLT7Lb13jgcQB528cK20MeF48LBJha1HFiLNoV8lNEccKx6kTS61h4BSnJsYkJAez2tKMrCLUUVRhUoodxWZT0TiwuM8UbvVadyMRmOu9T/Y1EZtwi/J7qYfxdStkoYOj7ZDY4aizooltMO6j5E6Le17M6FtPWAJpyVIOQoR40FxcZAi7cXYkx5G6LT+ZeLg4xiljILc0wgOYKbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 23:45:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 23:45:22 +0000
Date: Mon, 16 Dec 2024 15:46:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 12/29] drm/xe: Add SVM garbage collector
Message-ID: <Z2C7vIFdVBdbigFA@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-13-matthew.brost@intel.com>
 <747e7befa275ac0fcc95dc4e7e7aca27020e8dda.camel@linux.intel.com>
 <Z1nlWBOgEOMuKbN2@lstrano-desk.jf.intel.com>
 <334bb2c9d2ff97caf712f5f8c17b494c63869265.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <334bb2c9d2ff97caf712f5f8c17b494c63869265.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3344e3-77b7-4726-9e2b-08dd1e2bb448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nppJmTrT2A5rcGxQoopNH/gHVSgT228yYXPt4Ua7/81euKBCXu1SMT28G7?=
 =?iso-8859-1?Q?XUvvVdFi7gihF5GPSWLBjkwP0Zwur3AmBLqV88Ce/kzhEuCePY/mLYlUIE?=
 =?iso-8859-1?Q?owqFEiBHkVkoBlrlMTFBnNO2Sn75J8Z1/rHgI8NoW1vX9WxGgf/z4YwO0D?=
 =?iso-8859-1?Q?5qpHav2w5QHiuJ9E3kAOna928Lv3MRG/U9Lk2Gb6eiRFnuM9RL3YcLluZL?=
 =?iso-8859-1?Q?ORUBZEni2nsORUmIQUSQy382K8Qx968k0/3DCXSzlLI2ECRnk2EQ4zGM8+?=
 =?iso-8859-1?Q?kbUP8w9vA6/qLi2+oIiN98Jb4pwG0Ygq0oddYycwGT6NL8WQcBG9DaNXgn?=
 =?iso-8859-1?Q?mee9iE9MkYB3lczdA22XHF0rLDTmr5Zlo0GN2x74ctZjdJe4/qQ0ABPZMz?=
 =?iso-8859-1?Q?8rRgAV4/nouFkQM0FhEKb9GtdjgC4zrcfz7Gdccz2gIdwWu1Sb/QXG6kkD?=
 =?iso-8859-1?Q?0J/jVj1bdkOyblbgqS7MQ7w/e+KwzBhxy/xWKSixBPr/x/YOxV6lfUs49G?=
 =?iso-8859-1?Q?48chNPFtY7P2nhcJjcMaS9/y1LSdjszzvfQrWt2KFa8Z1JW0Vvv7VjB/gC?=
 =?iso-8859-1?Q?5NEV4ODGzKN7chP3QkdL2UiqyboGs3wbO35oDsGvH7m+3wV3+eHy/nbK4X?=
 =?iso-8859-1?Q?E9g8W6qO5wbIlvZgNxVBl1AjoE7onb1wp7oFaosB+zA2CERYS0dbP0zg+V?=
 =?iso-8859-1?Q?OquFw94Xqsn2l8bKIrkgUK4j8u8jLa6psrAqhz8+Q12rP7lG4UmLs0kJRG?=
 =?iso-8859-1?Q?Fb7TATUzS+fQQihN7FInFIDBYqdc/Bwi/JeLYVYrP6HbTZPO6nA+aCfqVs?=
 =?iso-8859-1?Q?WKJtlmX5jZhYR78H7eJ1SKZ8+FX8roFF7L3eHO9VzxhXJ3Rfnwanr3azv+?=
 =?iso-8859-1?Q?+TJubWb9s3bdbpJjmKcTzxr4mqY43ib68+wZzF6uNQMAioXK6LkOvYeXnd?=
 =?iso-8859-1?Q?ySu0lNOxExenrshWDpEZof+vLlruZ8pYU86L4vIKT7xQcCR7iBHzE6B3zz?=
 =?iso-8859-1?Q?EwHA/dQVr4RwrJ4+8JKSp8XDGJSmKNDPxePF4BvuVIh3hDeg1u43WLDoD5?=
 =?iso-8859-1?Q?H4gWgA3v3AoDaNyyBZxlFVZaxJRDxKSA1aEyykW02HIBRObFTqx8/zsQhL?=
 =?iso-8859-1?Q?ZfaH07piTJXWU1pA+bNsuJBsGOxQML104XmxhL+jn7JoDmqyno0u2ZYWZM?=
 =?iso-8859-1?Q?n56yzHz8dTZPpviZuGjJBGAbj4BwBTClQc75X2N4W9/oIEWLmaDC6r/1Tw?=
 =?iso-8859-1?Q?BNkRiWzOMTNimEbaep7x8TOobW9UEWtlfdxahAi+ZrZA07J1+jSsi3nDiW?=
 =?iso-8859-1?Q?JFDk2CEdcM9qegIBW+CMMj8N1LjKUoYPONQUbHEkOS1F8HqzvcqNQjLLSa?=
 =?iso-8859-1?Q?PhjdP5pj7xGM9gsYe8SiIeZqMXcL8W7L6XCJegM1dODZyZNqNtMO1LNluX?=
 =?iso-8859-1?Q?S0JTEg94mkJUNpRk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sQ06W6a973pyzpnsJNbQ44ck3ea4beBoxycSaOWE+f3Av6QciSNHyMS5QN?=
 =?iso-8859-1?Q?UqaMpd9XGfcmSvMlwcHPZfmiW0IsgLUD1O8aBCQTPBd+mnsFgT1Jsiej50?=
 =?iso-8859-1?Q?6wh5o0x+WjKTikKx6mwjvld+Vn1SMru5AmjMkFqQl3EcAi9E33BkWrLVF+?=
 =?iso-8859-1?Q?e1X3kE1pIe1sySbGjo26UXkYpvIXyd9TWNJvLNmCq7QcR6VjbuEVGBKig7?=
 =?iso-8859-1?Q?wxGEPTVer+Y5WBSHUeSC9L02mnPpr464WyoWwP3RoPiFmcbH79HtQI0PKb?=
 =?iso-8859-1?Q?hACS1oYaOajIDxZTJhCnAdtpzl7JNh2YCAEsBR0hWuhvbDeCXMc/xtw99d?=
 =?iso-8859-1?Q?jCu2noPokXPsmB9gIWBNM2JwZnIM/GZV5m3iXGHf81S9/MXcxzGs5WQDt9?=
 =?iso-8859-1?Q?V+he5CePX7MokCzXQdS74RpZVjvTJq0n/ZloDJGBVE5xnChL/fJKiLvGuL?=
 =?iso-8859-1?Q?7ZPd257EbKnJPqV8Wcn4XdpW/CLiZoHmHdR4Wy2Y7rt7XMXxex3Qhy+FjT?=
 =?iso-8859-1?Q?ooroiY9qKMxzi/BW017MRS756xkJMIa3Uc1OpZLaS2OVKmtA1eHG5AIUku?=
 =?iso-8859-1?Q?9Dop6gu1Mc5zNkmdPFHXT+jMYCAMzqGvSKMlJ+o6NMSpvRYzD7l5zrNNyY?=
 =?iso-8859-1?Q?Zt+7xIwnXXbkxVLi75+dUncpNCQ+9rwP60eNklCLWjHqUPeqfZo+2rDIeN?=
 =?iso-8859-1?Q?rKyrp1DAXinOAebuBPlbyovd8rUN52Ro5wSVds8w2ZBwtYn5ZAcxrmQwJ5?=
 =?iso-8859-1?Q?Hope+NAu5UYNwxC93Oc4GPPMzwzpzRJOxYikUgHBaHP6DAVNg+u9dNj9vF?=
 =?iso-8859-1?Q?I3PyOumttSdkpC/52x1BS4N7fNf03Q1QdQfVibydGSen5S89//vhSjBoVh?=
 =?iso-8859-1?Q?CrKSQagm7kITN8IYTV3XxM7W90IZLoOkJbXRHC8L9HvTs2Ia+XFnT/QpLG?=
 =?iso-8859-1?Q?ZNHF7/2yfwfeNdataHZcc19Ma/nn3rnkKnDN+CRIKh3U4AGGTekfaf7hnM?=
 =?iso-8859-1?Q?kMCkFbLuEFYV3LKsRhDw9ZzmSGN/HB886oK/Q29U8oVA4LUsJ8JYYlI9NN?=
 =?iso-8859-1?Q?MhkGsdUVtOtl/xGtyxqwqv6N6qYn6egFnf5YUMMT0mVh+Pa3xxhM0obT6t?=
 =?iso-8859-1?Q?HBluNEJB1PL0pVo1e8KLyP6yc4D7vtBsk+pfVydpGA9tzTq+FfZ+xYpS2I?=
 =?iso-8859-1?Q?Nw8Xuo+fvD3ITccJEuaUh49hRXxgZHDIpj0eYJgqRcG4B7tsChYI7NE4lw?=
 =?iso-8859-1?Q?szPL87Vb1Qvp+1CorhnJQVV6McDhfbDU195eBtrx3T2AcatzUQtwCvKaQJ?=
 =?iso-8859-1?Q?m6yMvi0qir3xGgoDlpfwL/VXDi5motbzBSBJzJhTGhXZPpsxog3W9NAfRp?=
 =?iso-8859-1?Q?meukxuCsCUg2kJPbr1uq2bahZ8R7KyZkx8U7ls6BF1FgSBrKLEZ9xkBvbX?=
 =?iso-8859-1?Q?tnJaU1nZl8075y80EqNqhCCrBkf0L9kafuTziq6fy/KmsRwpn4WDgso9Pq?=
 =?iso-8859-1?Q?ZdmUw+GGag/zUIjalbEXyXzq8zlLQATWNUVQG0UeBla4XvpSvhWkwn9KoI?=
 =?iso-8859-1?Q?7Rzwd86fIOAKh8g6bwcP7cNCw+JWLFYbT9vjCFiEDgHbw2TR2DZOlXpO9y?=
 =?iso-8859-1?Q?Cf7Na2OGlDu7P+9feQUh3PWyS0yXZldqktCh8qanGeZFEfBOXyZWpzfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3344e3-77b7-4726-9e2b-08dd1e2bb448
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 23:45:21.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF27ejjKZAcEnoSI1NU0CrVvq3yrwSvx0v4VY48o7QcQyIrxqR/c0Y9abxrg+H9wrAAB4lw/I1MLsL+d7oQrtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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

On Mon, Dec 16, 2024 at 11:36:20AM +0100, Thomas Hellström wrote:
> On Wed, 2024-12-11 at 11:17 -0800, Matthew Brost wrote:
> > On Tue, Nov 19, 2024 at 03:45:33PM +0100, Thomas Hellström wrote:
> > > On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > > > Add basic SVM garbage collector which can destroy an SVM range
> > > > upon
> > > > an
> > > > MMU UNMAP event.
> > > > 
> > > > v2:
> > > >  - Flush garbage collector in xe_svm_close
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_svm.c      | 87
> > > > +++++++++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_svm.h      |  1 +
> > > >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++
> > > >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ++
> > > >  4 files changed, 95 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index a9addaea316d..9c2f44cba166 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -30,6 +30,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > > >  	if (!range)
> > > >  		return ERR_PTR(-ENOMEM);
> > > >  
> > > > +	INIT_LIST_HEAD(&range->garbage_collector_link);
> > > >  	xe_vm_get(gpusvm_to_vm(gpusvm));
> > > >  
> > > >  	return &range->base;
> > > > @@ -46,6 +47,24 @@ static struct xe_svm_range *to_xe_range(struct
> > > > drm_gpusvm_range *r)
> > > >  	return container_of(r, struct xe_svm_range, base);
> > > >  }
> > > >  
> > > > +static void
> > > > +xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct
> > > > xe_svm_range *range,
> > > > +				   const struct
> > > > mmu_notifier_range
> > > > *mmu_range)
> > > > +{
> > > > +	struct xe_device *xe = vm->xe;
> > > > +
> > > > +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> > > > +
> > > > +	spin_lock(&vm->svm.garbage_collector.lock);
> > > > +	if (list_empty(&range->garbage_collector_link))
> > > > +		list_add_tail(&range->garbage_collector_link,
> > > > +			      &vm-
> > > > > svm.garbage_collector.range_list);
> > > > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > > > +
> > > > +	queue_work(xe_device_get_root_tile(xe)->primary_gt-
> > > > > usm.pf_wq,
> > > > +		   &vm->svm.garbage_collector.work);
> > > > +}
> > > > +
> > > >  static u8
> > > >  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> > > > drm_gpusvm_range *r,
> > > >  				  const struct
> > > > mmu_notifier_range
> > > > *mmu_range,
> > > > @@ -88,7 +107,9 @@ xe_svm_range_notifier_event_end(struct xe_vm
> > > > *vm,
> > > > struct drm_gpusvm_range *r,
> > > >  	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> > > >  
> > > >  	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> > > > -	/* TODO: Add range to garbage collector */
> > > > +	if (mmu_range->event == MMU_NOTIFY_UNMAP)
> > > > +		xe_svm_garbage_collector_add_range(vm,
> > > > to_xe_range(r),
> > > > +						   mmu_range);
> > > >  }
> > > >  
> > > >  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > > > @@ -184,6 +205,58 @@ static void xe_svm_invalidate(struct
> > > > drm_gpusvm
> > > > *gpusvm,
> > > >  		xe_svm_range_notifier_event_end(vm, r,
> > > > mmu_range);
> > > >  }
> > > >  
> > > > +static int __xe_svm_garbage_collector(struct xe_vm *vm,
> > > > +				      struct xe_svm_range
> > > > *range)
> > > > +{
> > > > +	/* TODO: Do unbind */
> > > > +
> > > > +	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int xe_svm_garbage_collector(struct xe_vm *vm)
> > > > +{
> > > > +	struct xe_svm_range *range, *next;
> > > > +	int err;
> > > > +
> > > > +	lockdep_assert_held_write(&vm->lock);
> > > > +
> > > > +	if (xe_vm_is_closed_or_banned(vm))
> > > > +		return -ENOENT;
> > > > +
> > > > +	spin_lock(&vm->svm.garbage_collector.lock);
> > > > +	list_for_each_entry_safe(range, next,
> > > > +				 &vm-
> > > > > svm.garbage_collector.range_list,
> > > > +				 garbage_collector_link) {
> > > > +		list_del(&range->garbage_collector_link);
> > > > +		spin_unlock(&vm->svm.garbage_collector.lock);
> > > 
> > > This looks broken, what if someone removed the "next" entry here?
> > > You probably want to use list_next_entry_or_null();
> > > 
> > 
> > Yea, let me fix this loop structure.
> > 
> > > > +
> > > > +		err = __xe_svm_garbage_collector(vm, range);
> > > > +		if (err) {
> > > > +			drm_warn(&vm->xe->drm,
> > > > +				 "Garbage collection failed:
> > > > %d\n",
> > > > err);
> > > > +			xe_vm_kill(vm, true);
> > > > +			return err;
> > > > +		}
> > > > +
> > > > +		spin_lock(&vm->svm.garbage_collector.lock);
> > > > +	}
> > > > +	spin_unlock(&vm->svm.garbage_collector.lock);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void xe_svm_garbage_collector_work_func(struct
> > > > work_struct
> > > > *w)
> > > > +{
> > > > +	struct xe_vm *vm = container_of(w, struct xe_vm,
> > > > +					svm.garbage_collector.wo
> > > > rk);
> > > > +
> > > > +	down_write(&vm->lock);
> > > > +	xe_svm_garbage_collector(vm);
> > > > +	up_write(&vm->lock);
> > > > +}
> > > > +
> > > >  static const struct drm_gpusvm_ops gpusvm_ops = {
> > > >  	.range_alloc = xe_svm_range_alloc,
> > > >  	.range_free = xe_svm_range_free,
> > > > @@ -198,6 +271,11 @@ static const u64 fault_chunk_sizes[] = {
> > > >  
> > > >  int xe_svm_init(struct xe_vm *vm)
> > > >  {
> > > > +	spin_lock_init(&vm->svm.garbage_collector.lock);
> > > > +	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> > > > +	INIT_WORK(&vm->svm.garbage_collector.work,
> > > > +		  xe_svm_garbage_collector_work_func);
> > > > +
> > > >  	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm-
> > > > >xe-
> > > > > drm,
> > > >  			       current->mm, NULL, 0, vm->size,
> > > >  			       SZ_512M, &gpusvm_ops,
> > > > fault_chunk_sizes,
> > > > @@ -211,6 +289,8 @@ void xe_svm_close(struct xe_vm *vm)
> > > >  	/* Flush running notifiers making xe_vm_close() visable
> > > > */
> > > >  	xe_svm_notifier_lock(vm);
> > > >  	xe_svm_notifier_unlock(vm);
> > > > +
> > > > +	flush_work(&vm->svm.garbage_collector.work);
> > > >  }
> > > >  
> > > >  void xe_svm_fini(struct xe_vm *vm)
> > > > @@ -241,7 +321,10 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	lockdep_assert_held_write(&vm->lock);
> > > >  
> > > >  retry:
> > > > -	/* TODO: Run garbage collector */
> > > > +	/* Always process UNMAPs first so view SVM ranges is
> > > > current
> > > > */
> > > > +	err = xe_svm_garbage_collector(vm);
> > > > +	if (err)
> > > > +		return err;
> > > >  
> > > >  	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> > > > fault_addr,
> > > >  					    xe_vma_start(vma),
> > > > xe_vma_end(vma),
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > index ee0bd1ae655b..06d90d0f71a6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -17,6 +17,7 @@ struct xe_vma;
> > > >  
> > > >  struct xe_svm_range {
> > > >  	struct drm_gpusvm_range base;
> > > > +	struct list_head garbage_collector_link;
> > > >  	u8 tile_present;
> > > >  	u8 tile_invalidated;
> > > >  };
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 63aa0a25d3b7..399cbbdbddd5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3071,6 +3071,10 @@ int xe_vm_bind_ioctl(struct drm_device
> > > > *dev,
> > > > void *data, struct drm_file *file)
> > > >  		goto put_exec_queue;
> > > >  	}
> > > >  
> > > > +	/* Ensure all UNMAPs visable */
> > > > +	if (xe_vm_in_fault_mode(vm))
> > > > +		flush_work(&vm->svm.garbage_collector.work);
> > > 
> > > Hmm, what is someone added an UNMAP here?
> > > 
> > 
> > What we really trying to guard to against is user space doing
> > something
> > like this:
> > 
> > addr = malloc();
> > gpu access
> > free(addr)
> > bind_bo(addr);
> > 
> > We want to make sure all SVM mappings from the GPU access have
> > processed
> > the UNMAP events from the 'free(addr)'. So I think the code is fine
> > as
> > is - we just want to make sure UNMAP events prior to the IOCTL are
> > processed.
> 
> But the notion of "prior" only exists in the presence of some form of
> synchronization, like a lock. Let's say another thread calls a free
> either
> 
> a) before the flush_work
> b) racing with the flush_work
> c) after the flush_work
> 
> Is there any difference WRT correctness and how do we differentiate?
> 
> I don't think it's clear what this flush_work actually protects
> against.
> 

I still think this is ok.

Let's say we have 2 threads...

- Thread A munmap(address A)	- This address has a SVM GPU binding, we will get an UNMAP notifier
- Thread B address B = mmap()	- This happens to equal to address A
- Thread B bind BO(address B)	- We flush_work which ensure the UNMAP event is processed allow current view SVM state, avoiding bind returning -EBUSY

The key here is it is impossible for address A == B unless an UNMAP
event is queued in the garbage collector unless I'm completely missing
something. This is really the only race we care about - we care that
UNMAP events prior the bind matching the bind address are processed.

If other UNMAP events occur while processing the bind, that is fine as
they shouldn't colliding. Worst case if a collision occurs we'd return
-EBUSY in the bind IOCTL.

Does this make sense?

Matt

> Thanks,
> Thomas
> 
> 
> 
> 
> > 
> > Matt
> > 
> >  
> > > Thanks,
> > > Thomas
> > > 
> > > > +
> > > >  	err = down_write_killable(&vm->lock);
> > > >  	if (err)
> > > >  		goto put_vm;
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index b736e53779d2..2eae3575c409 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -146,6 +146,11 @@ struct xe_vm {
> > > >  	struct {
> > > >  		/** @svm.gpusvm: base GPUSVM used to track fault
> > > > allocations */
> > > >  		struct drm_gpusvm gpusvm;
> > > > +		struct {
> > > > +			spinlock_t lock;
> > > > +			struct list_head range_list;
> > > > +			struct work_struct work;
> > > > +		} garbage_collector;
> > > >  	} svm;
> > > >  
> > > >  	struct xe_device *xe;
> > > 
> 
