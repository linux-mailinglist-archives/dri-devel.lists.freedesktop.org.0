Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F249FACF998
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723D10E895;
	Thu,  5 Jun 2025 22:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNbkJ+Lk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC210EA1A;
 Thu,  5 Jun 2025 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749161715; x=1780697715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B7zBVOotGS3FDZuLJ36qYOW+8qDIMVuHw2Dvxn4nQo0=;
 b=UNbkJ+Lkvvgxf9Q8722Z3BpLqg6rbipBDiiVWlB8g1LA9hqSqhgnap3T
 nuAHzHBrRiDjtHoOdxj0avcWVQFZu/+MNwRebrcq88ZLSnYdc4XG/N73O
 xdXFlzI8FCLscmcUoBcRrxaKelAZMh8zgqVROSv0B97JFMXtdOis9EzSq
 +rJugFnKki92JLmJQifWLVjsnzmXYBgmwnanAyPV4Z1F/hQGfW0UMaerY
 Biku195lkpefSQnzdkYdXlK4GkDl8M2pC6tgSPZK2+oFWi0yta6IIpy2i
 JzSWrqU5ShdauiwrEQq89DpDoNRQdL05dMWb1xF/hEqrKZIX0Cf3MbMiY A==;
X-CSE-ConnectionGUID: kAk1KIRgSsClo9YEPgwzAg==
X-CSE-MsgGUID: wgAFdgGTQOyzthTgvXZv8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51398329"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51398329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:15:15 -0700
X-CSE-ConnectionGUID: 3Mo5XGroSkWQR/QV7QgTYg==
X-CSE-MsgGUID: NafwhL1RRtiswbdXItY+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="145589675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:15:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:15:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 15:15:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 15:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKWzgZDZHbCphYua6CQCH/yq1LDnLF0JrEvPZgSZo182iWuf8RTZ5dPB0FnMB9K0OLEyDxmHeYJOPCEX744K2Are8OggDaJI6w0omYcPg7jdRD6DliLckEotWGvuBP8TawlUZKLfXp1WUabPoocFHkvXpZqoKh4d1+vR2dflY4FLR4wUkwXgUIQFxcckOACEIasKmMOpJAkyXMnCCMlBwLXNRhJgcu3Dn57RdjQO71W6FJ+HTnt9tqUVBJkY9IOdn+qnHEz3xaDALK92fFEm1jMeLSNl9b3NoBdG7xdBKQP7GrXuG1e824f7P/uxDnNZbb2GGUXKeFVB5q9wZ98FdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q6H1Z3EMdqZmiK5byW0/GXOXIcZtn3fMhqx33y1Wy4=;
 b=aVWm+HJvbZaECy5AMEoI06O/aN12SAMaGmRfpW5g/uJacPL3QbdmT/ghJriwOixb+bTgWCrEU/PbFYhyVtb/IHvTu/hAGeeVel8hdF1+i+sBcAcUm2c7Sv3Pm3OlgPVuKGODmW6GUgw0pVSs6x53zoFe+4kNJatiXYHGndNVf6HjVnwcpL9oKkKjBTHwnlad40gU78tHVDqTugJ642agiXEkiPbtFAEigBNwmXVhzLs6KJrjI99E/L7GbDm7jCyU7plrE3aUPfv75RATY0aMDOsaL3W2MNkD50ncSmYb81gYnX5Vylirqxgawhfdd77y0QwYwu7hIByysP8bUkzIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 22:14:57 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 22:14:57 +0000
Date: Thu, 5 Jun 2025 15:16:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Implement and use the drm_pagemap
 populate_mm op
Message-ID: <aEIXPQpz0BqO58l/@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 2117c42d-78b5-4ff3-233a-08dda47e67d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CpuXznPHML0+82uyaQPuh+yrqYOAmYhtJg8FonLEv4DwmLKJkFuSjmHEZn?=
 =?iso-8859-1?Q?pujXRdMBjpV2NCg+JFQx9fnPSYFfrMleK6FQn+PFcjv6evPmSoLdJxqpZv?=
 =?iso-8859-1?Q?E4jrkQSpIeS+jZ2D4rWBUm4kR38vMUXBi5nC2Cg/1f7EJ1/TbLX2aNw///?=
 =?iso-8859-1?Q?XNwVBZeAH5HjKAf/ZnFmWGq1h71jlZYNNCC0ZVylsexgqdC+mVmxxZ72ap?=
 =?iso-8859-1?Q?ZrBBUPkBC5VrJIgeCZc8wbtBkexNyg8UJoI4w8ERh499DlKa1KzuuNrdZ6?=
 =?iso-8859-1?Q?lT19pvkCDvLo7a6zwl4Hgc/aadvJlHGs5n/a5uX6uyni3/Z2V4UtCfr+TO?=
 =?iso-8859-1?Q?DaVjqomfPqOkPXFhGsJaztnb+GZnKgyvJY9bXB+ISjTfgWaFDczb//Da07?=
 =?iso-8859-1?Q?1JCDFQht7qSrEBItO2j12Srjni0HIp+HOiGpHDSKzYLR6UAsKTAY0EVut/?=
 =?iso-8859-1?Q?mjBaKIlV2uXkwG8sqwY+QA/odkfWferaPGqbTzuDAFYvHIwnpgxuP6UGxk?=
 =?iso-8859-1?Q?9nmbsYgnWpeJ8YkGnW73AaCBuYgUdYBF1C4ZU8mnjLkg0jnszmzm+O0c6D?=
 =?iso-8859-1?Q?yWeVqrYT7QlNnpxxjwwz7Hqq2S91KBXogANVqURXi2syo5MOwGNvn12/GU?=
 =?iso-8859-1?Q?DNoUajKnmAjkSA4Ea4KR899GecD1fEjRLTpGxvuDw7ecRn14gxlS1YYehq?=
 =?iso-8859-1?Q?gCCng7yB6puWLoDTzh2sSXphFXmSVWht2lDegQ5yaVDcTdv6mlf3oO4y0P?=
 =?iso-8859-1?Q?ADdxL26BL1cAZUiCgVw/KvsXSNbr0T9FBt0te2n+jMNK9Zwsth1tjeAmbJ?=
 =?iso-8859-1?Q?LtuqPIQET7PLpZ0oAgnLByHlv7sQ7EYTZUQFR1MkIZ4bDB4kvf8MfNvMhl?=
 =?iso-8859-1?Q?CUl3O1iiLuSk0qa924OZlDciFNerdTOXV0MnswZoIMbXDawGbf+PGGzWP7?=
 =?iso-8859-1?Q?yTNO3A47H99kWXFqdIaK78Vt7kuHJpcbj+rhsAT5eC08XdoCbbNbJHTOe2?=
 =?iso-8859-1?Q?pL0FHKmxrNS61Ec9y0g2IyxBQysE43b8aW+gfrMcCX6886bX2xwIqf7w/G?=
 =?iso-8859-1?Q?+Gagg/MaOXNOWCo7gryN0e9Y1K+/2O0yCQN3JjYH7vqe/JM6TXQrYh79Au?=
 =?iso-8859-1?Q?1Ff685jLSi25IgMM6hECzkQbXr3HAcMSQQA0RBWxt3/naDa4HvK70LE1yq?=
 =?iso-8859-1?Q?tzaRyCRYQeGh2WALPW7snyGQxRAiOvueTZLyNzws3M4Czr5RWDqu3YEEeE?=
 =?iso-8859-1?Q?XC2hzPoWp0WWATX/MepxLCI8Pg+dLuu+HO13XeVd5cuDmduSI81XOGyN0f?=
 =?iso-8859-1?Q?sk3HF7a1hSR0F2cqe24fn2US9f/tUjBaLChloNnay2pc0wdMW7CcdnJnvA?=
 =?iso-8859-1?Q?IKJrDPwJwww7ZMUcFNgYghKsvuHfD2nicIljnIKijTMksS+mNGzIj+wkpw?=
 =?iso-8859-1?Q?DO+rQ3RQva/zkE1cp2tuqvcRQkOtJqzYuroKI4Z1T+YT2LZsbZuHvhVrfR?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+pD+Afti3m8egv1/BdT/gxjGAHA1ueZ93oHgNca5wQzVSJZBx55mCpn9Y6?=
 =?iso-8859-1?Q?ZRffigtxzkXEpEDVaZb9FmkCGKQe0d4vp4yk8sxbV5O9ewO5f4LYlpbIbv?=
 =?iso-8859-1?Q?EIr8+dqQBpR4vtojgw9ZnX+30bO8IEGqF9acqb7b9jUueKnYrz468M8iVa?=
 =?iso-8859-1?Q?D2P+qUs5P579UmCCxg2reut1CgsS/g6Iqd3WsLFmlwdsg3CZKnbhrbBK7Q?=
 =?iso-8859-1?Q?AQ//PnI1jQb0mPSyI+QFqOo26axEVXpfLO/63jzI0Gs6Fl+jZtu9QXY8Nc?=
 =?iso-8859-1?Q?fbdrtxR6rdDyRfhLvj/KlffJV8AyGqcQ87wcZpIS5+1dIboRHi3sSoyK9j?=
 =?iso-8859-1?Q?oA4NCCduFLdk6wvDfpgZzijkYFfkjrxf/NVcraoDtLWABqJW3VZLmckzB3?=
 =?iso-8859-1?Q?97AkNv3ypy7JBA3BOAMzE21EfI5zidlCGh1q/Cv1QL8GxB1Ve0iMkkm9Ic?=
 =?iso-8859-1?Q?UZIUHpvF1cJW+6d+lv3i9AdeEaSxGu1jDTXFEvhIvsdHc5/hR/Qs26k8Vi?=
 =?iso-8859-1?Q?jpK6/5PAVhzN3UUcpHUgbTLjwZ8ppJMNoSOOOH87nRr/WY3h7vXyWutiEF?=
 =?iso-8859-1?Q?+5yCCek4pk2G3aX+6xes7SLGW86v6M5L+0i4QwmiYI6wa5gAw0KRS8I9CS?=
 =?iso-8859-1?Q?PdM2Juiq1pY5CsbsyDJZ8cul5JKeLTVmmnwwUcCg24pyLBiZG/gqNfaDqO?=
 =?iso-8859-1?Q?jZuddllaa1KvT7vE/mPHuU0nkuodoyVEQoIAz9JeQ6Tkf/2/UgXjreg89/?=
 =?iso-8859-1?Q?TvVrfvPEOoB2e7uHio7j26pg42dSwDdk97EW1iz2EvRb/rODJfNpJIhKQL?=
 =?iso-8859-1?Q?yt1qKjoc9R35bshZF9m5ODeppXkWLlBO6/C0UhwJz7jcSr84/pPt84Ctr0?=
 =?iso-8859-1?Q?/9UH6z0ioLcoTqdBUFOXrWGm2MEX/nLFX46xJrMHnvurpQC/4vbK2CP5kU?=
 =?iso-8859-1?Q?4jvLMjR2yj0KUe7x3Q+25i08Ui0Ta4+71ZSk9IBmnVzQnwQRL1zWtTGDNf?=
 =?iso-8859-1?Q?0B8vAl7v4Sq4o8WByP0h6y3hLIIwU4/0PIipj1hu6Ci27dm0TEVzBHYUv8?=
 =?iso-8859-1?Q?QbcHJrL2Hy/0juoZnpRGpb1b3z4brYPZnFtg8kNuZ4vliGZ05IIzAeSFr0?=
 =?iso-8859-1?Q?ACmRYfvdbb72ZA2qYtJPrTdZ83XdmclqS5IFGt3t2Jn8bhiZg9oVX6gpZP?=
 =?iso-8859-1?Q?hrtfjVl0646Ua4g2csW10xZFg6hDKiFCayv9l7V5uK6Fx96QaiP6E9rkPK?=
 =?iso-8859-1?Q?EMVycywAaLIg/1jRJV03/WqYjlAKTm31YrcsQdwaj0RWSVbR4R0fhFSnQ7?=
 =?iso-8859-1?Q?LWm+IXP0lG5Y5JwdF82G7xyYKs7PAQNLwaMpVROyTnVTxwQB0aGAVsrGJL?=
 =?iso-8859-1?Q?l78/7vxTtfMX2z8S7DYeoHiJtDSxJJEAldupqGAwkeft4vQ5A9oKA0O4g7?=
 =?iso-8859-1?Q?TmwUjFxzXbnIvBF0iVSVy+wQbd84PouEUB9zWv0fz8W6/tzQ721TXD51cy?=
 =?iso-8859-1?Q?fy796XCbXI/qg3sbAgnTOdTS5An49IXD8tpwsQibS4kjNapoAhUIRd3ars?=
 =?iso-8859-1?Q?5X8q36ALY9N4TBo66S6MOfeYgkmAZVjCj3k0eyGZ3PTqzEo9TRGtM3suRa?=
 =?iso-8859-1?Q?mkp9XJy6EVRHfZanCeMZx7XQJvZc3w4U0VB7J9iOPTwTBWJqsSpUwGIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2117c42d-78b5-4ff3-233a-08dda47e67d6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 22:14:57.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+DM7qS75gFIJ73nTwUhbqUNeVcmQYLccrmtnpFUy/NzCb6NW9kf2XULI5fnFzetDv8Fy4pTEv2Upscte6HVEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
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

On Wed, Jun 04, 2025 at 11:35:36AM +0200, Thomas Hellström wrote:
> Add runtime PM since we might call populate_mm on a foreign device.
> Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
> initial clearing and the creation of an mmap handle.
> 

I didn't read this part - skipping the initial clears. Discussed this on
a private chat but to recap we need initial clears as copies for
non-faulted in CPU pages are skipped which could result in another
processes data being exposed in VRAM. We could only issue a clear if a
non-faulted in page is found in xe_svm_copy or IIRC there was some work
flying around to clear VRAM upon free, not sure if that ever landed - I
believe AMD does clear on free their driver + buddy allocator has the
concept of dirty blocks.

Matt 

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c |   1 +
>  drivers/gpu/drm/xe/xe_svm.c   | 104 ++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_svm.h   |  10 ++--
>  drivers/gpu/drm/xe/xe_tile.h  |  11 ++++
>  drivers/gpu/drm/xe/xe_vm.c    |   2 +-
>  5 files changed, 78 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 25395685a9b8..94619be00d2a 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -843,3 +843,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(drm_pagemap_populate_mm);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e161ce3e67a1..a10aab3768d8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,13 +3,17 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_bo.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_tile.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> @@ -525,8 +529,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
>  static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> +	struct xe_device *xe = xe_bo_device(bo);
>  
>  	xe_bo_put_async(bo);
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
> @@ -720,76 +726,63 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -/**
> - * xe_svm_alloc_vram()- Allocate device memory pages for range,
> - * migrating existing data.
> - * @vm: The VM.
> - * @tile: tile to allocate vram from
> - * @range: SVM range
> - * @ctx: DRM GPU SVM context
> - *
> - * Return: 0 on success, error code on failure.
> - */
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +				      unsigned long start, unsigned long end,
> +				      struct mm_struct *mm,
> +				      unsigned long timeslice_ms)
>  {
> -	struct mm_struct *mm = vm->svm.gpusvm.mm;
> +	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = xe->drm.dev;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
>  	struct drm_buddy_block *block;
>  	struct list_head *blocks;
>  	struct xe_bo *bo;
> -	ktime_t end = 0;
> -	int err;
> -
> -	if (!range->base.flags.migrate_devmem)
> -		return -EINVAL;
> +	ktime_t time_end = 0;
> +	int err, idx;
>  
> -	range_debug(range, "ALLOCATE VRAM");
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
>  
> -	if (!mmget_not_zero(mm))
> -		return -EFAULT;
> -	mmap_read_lock(mm);
> +	xe_pm_runtime_get(xe);
>  
> -retry:
> -	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> -				 xe_svm_range_size(range),
> -				 ttm_bo_type_device,
> + retry:
> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
> +				 ttm_bo_type_kernel,
>  				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				 XE_BO_FLAG_CPU_ADDR_MIRROR);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> +		if (xe_vm_validate_should_retry(NULL, err, &time_end))
>  			goto retry;
> -		goto unlock;
> +		goto out_pm_put;
>  	}
>  
> -	drm_pagemap_devmem_init(&bo->devmem_allocation,
> -				vm->xe->drm.dev, mm,
> +	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
>  				&dpagemap_devmem_ops,
>  				&tile->mem.vram.dpagemap,
> -				xe_svm_range_size(range));
> +				end - start);
>  
>  	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  	list_for_each_entry(block, blocks, link)
>  		block->private = vr;
>  
>  	xe_bo_get(bo);
> -	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
> -					    mm,
> -					    xe_svm_range_start(range),
> -					    xe_svm_range_end(range),
> -					    ctx->timeslice_ms,
> -					    xe_svm_devm_owner(vm->xe));
> +
> +	/* Ensure the device has a pm ref while there are device pages active. */
> +	xe_pm_runtime_get_noresume(xe);
> +	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> +					    start, end, timeslice_ms,
> +					    xe_svm_devm_owner(xe));
>  	if (err)
>  		xe_svm_devmem_release(&bo->devmem_allocation);
>  
>  	xe_bo_unlock(bo);
>  	xe_bo_put(bo);
>  
> -unlock:
> -	mmap_read_unlock(mm);
> -	mmput(mm);
> +out_pm_put:
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
>  
>  	return err;
>  }
> @@ -898,7 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> -		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		err = xe_svm_alloc_vram(tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
>  			if (migrate_try_count || !ctx.devmem_only) {
> @@ -1054,6 +1047,30 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
> +/**
> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> + * migrating existing data.
> + * @vm: The VM.
> + * @tile: tile to allocate vram from
> + * @range: SVM range
> + * @ctx: DRM GPU SVM context
> + *
> + * Return: 0 on success, error code on failure.
> + */
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	range_debug(range, "ALLOCATE VRAM");
> +
> +	dpagemap = xe_tile_local_pagemap(tile);
> +	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +				       xe_svm_range_end(range),
> +				       range->base.gpusvm->mm,
> +				       ctx->timeslice_ms);
> +}
> +
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  struct device *dev,
> @@ -1078,6 +1095,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.populate_mm = xe_drm_pagemap_populate_mm,
>  };
>  
>  /**
> @@ -1130,7 +1148,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	return 0;
>  }
>  #else
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +int xe_svm_alloc_vram(struct xe_tile *tile,
>  		      struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 19ce4f2754a7..da9a69ea0bb1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -70,8 +70,7 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx);
>  
>  struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> @@ -237,10 +236,9 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> -static inline
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static inline int
> +xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		  const struct drm_gpusvm_ctx *ctx)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..066a3d0cea79 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -16,4 +16,15 @@ int xe_tile_init(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram.dpagemap;
> +}
> +#else
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7140d8856bad..def493acb4d7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2911,7 +2911,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> -			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -- 
> 2.49.0
> 
