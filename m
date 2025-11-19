Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12026C70CE9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE8C10E268;
	Wed, 19 Nov 2025 19:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENjpdffI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F5B10E265;
 Wed, 19 Nov 2025 19:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763580518; x=1795116518;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wtx9XNVWPvtA8XS8iBEdXfZZ5gsRmB0fNXpEcoug9Qg=;
 b=ENjpdffIozKd8hRvcysZRnsp4oj/b9qiCWHsS9w0a+XMjb1DL5vzw22a
 34cNboI+Omfk8L9TYHTIz3IIiuWOJBQgbHWUWORTlGFbhb3c341uV9HaX
 jwcKm11fhmoxzNixQLKTtFCQtYSz+cuq/tqiAJLv6At2zxmPfr67Uh04A
 a6Rwy9ads0u5TQgBEha0JW0Qk4zUvgARrFNuqpKvVIYOpl523zGhCuiBj
 7J0fYbaIvthANmHg8WWC/QBSH+sVz2wlhujukjUCM0ZvXWVqe6+UXMNnK
 WMS9RvXy2/54TiNOv84Aq2MxN4DGjmzbN2tsc9xMmIix0S0DnwoVhN/eK Q==;
X-CSE-ConnectionGUID: RXTPSJfKS/yUeww+5KtRaQ==
X-CSE-MsgGUID: 3s4BR08GS5+vRE8710bmQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65567607"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="65567607"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:28:37 -0800
X-CSE-ConnectionGUID: ZR59HPmSR3qEkoZEFknK7g==
X-CSE-MsgGUID: da5BE1d0RzG9bYvmNfgnlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="191405852"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:28:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 11:28:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 11:28:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 11:28:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrXit5T4PbYxugEqTSBTme5sffhIbZfkhHqYOCA81ZglZlzd8hZbBVwLVOxN0AGv0LVlMsLOCqLf6I2UksdzCRZpu2lqvQCDxkCZgnfowjxOcmpZAFPzkQxG3Jg/m8fNUrMvwDYnnNWFoFlnIGF8jk7sm7SHxZPAYWDAYBzMpmz/Ud5Odxt6mrCuaPa9BctPxLTihb9l+JrW9Y8czJUeq8H686LgnEMnwtCUJVdhurgMA4x5IbfzQ5endZVbqjEZesloFEzGpT7wNrYt5rOwSKPbEcssrXHdBRg5XlIroGPwN1SHo+BnpHfLLRNYnG17P6CegB6yRDjRvmpUI2dYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXf9V+KrbCDRQ9YEjRkSxPyCvxZEABFJ2gxFQBIXvVM=;
 b=C5RdcfuTjHTVW3V3dPU2+5im4YIhssyoR8HBbR3VvkPZBAWboYgZgYm4POmL8iG2XmLWNmq/54cv0TobwTRWzqr9OCugq3wfEbIeRuYUBJdEueKhBwxqazMGUblkiRCpi+JIAr6sbSk594Lx7W0R3nJa7sL6eAjuDxLzLEDUGjAhiWd7+wTcPcwOeg26IXtTwcXVP0kRG1xAqEJrW9zjl+6Tp5RaQv6OnC2EWM8LuCnzCAxZ6l3ex2jLLG4/LWg1wyV0hpj5+LqnRzCOnjnXy9bZPC/UXqkJUpgq+PIi43NR8fVaq8xPgK4nJ5Hb3ASr9ps4gCYGuNfIj4RS/AkF5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFD3EB37DFC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f52)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:28:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:28:28 +0000
Date: Wed, 19 Nov 2025 11:28:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 05/17] drm/pagemap: Add a drm_pagemap cache and shrinker
Message-ID: <aR4aWV5KAbLOVsaU@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFD3EB37DFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 955e3ecc-4591-4631-6efb-08de27a1d0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?thpHSMBv6eZo+8GQo3d6gO++0E17uLGqG12HZQirUnVWpi0RnE1MaZDW34?=
 =?iso-8859-1?Q?HL6WjpAC7NqhRAnt3y5j1anWj55SWdMycEpUZ/dDsm7vIOmZV+4L0j5XuP?=
 =?iso-8859-1?Q?ypIDtKypiq2U+CPcW3UiDkoEXWAZMY93x6gjXykUeN+SBUbIp3akU5A/Nk?=
 =?iso-8859-1?Q?NtzXfjcjGwaEOPNW5aSKOZUIIHjEiKpF1Kck6WzjSXx687Y0TFAg9ecffb?=
 =?iso-8859-1?Q?SRMeYy08PLsM8+bKLPVASo33osnku+XO9mWhbTBHp3yldxeCA7RqY0bmyz?=
 =?iso-8859-1?Q?8IW8QsF7jFSAtjp45EgwCq3MAVrMcNSW46BJwYPTa8GxV+86u50ZAiHo0r?=
 =?iso-8859-1?Q?GHnW3dGaQzl+YJu4R7G6NHcSrhysDoTaGh1U3RlAjwPY6JoqJdZ9iOF9eE?=
 =?iso-8859-1?Q?hKIFDgBJ1K73C5nsEq6Czwvi6sBbvsj9NEbeuN2S+x9DhHMxgwJyVQa7Vb?=
 =?iso-8859-1?Q?LULt80BBfPNyKuAq8zC0zkkrU74FumEGmWBPBwSBwrrO4C3pKe5T8Q57h9?=
 =?iso-8859-1?Q?SDcIXSAfqGrO0RVBsARjKiZlSKdo4fuFuzWqBkIPF89QlEJMZlZl7bYWnc?=
 =?iso-8859-1?Q?niJtXkeSpWPc1WvODxbdeUw4lhYS9duakjBlfRJQEVl8a80KN+g0h+KK8z?=
 =?iso-8859-1?Q?5c0/xCXyci8fu5CMQzte4ifVATh4XvLK0WCZoXG4oFfdcpOjH2YgJQaO0U?=
 =?iso-8859-1?Q?LEaRqHudRQLVWQQTNhYJVTLehSVsoLw2zS0ZaE3BODaRrughOjAZ8Jn1Cj?=
 =?iso-8859-1?Q?hBu1cVcGRXaDgVVLpJDOS9Df+8PDMSIhzNNz6WRSA3EEc1F3k7uncfKyfp?=
 =?iso-8859-1?Q?LMxrq5fPw1ENz+9I5fGxUMBcU6b7dmj1ieRCBWkrgmrcqZ5c4qRtW/1MXS?=
 =?iso-8859-1?Q?2gpfEurzPwjdFk/t7ixG4WV9AvNGW03JcRYbhcHLW5S49yOQ9uqjJc/utI?=
 =?iso-8859-1?Q?4VwSVMwmO1EgHlsLViLboOv7lqUoU6pxOoi7aOLzDk3p+aO5wpm9vvY0j5?=
 =?iso-8859-1?Q?iSmAsN9xdInbwtTanYnL4d8FQR29F3vdhL150EHsaKjSw0gr4KmJLAY1xd?=
 =?iso-8859-1?Q?Wah8T6xqdoQEs85qecmWD+XeEu5G7/hZjZcUmXnxkjfRKgrz/hkFdMyysN?=
 =?iso-8859-1?Q?9TrRQh0d7FfhO9bd/Tt68QU/RvqhWn69ZW9ud0COC4bBRQF5yCHSRyNkzp?=
 =?iso-8859-1?Q?kgwZWfOUyOVu7yEEmWFsGDq+cE4SOH71qLtYBhpAsLUVU6Buh9dZg6gmSV?=
 =?iso-8859-1?Q?nMY0WjaAltSYq4p5B3daXnGpiZJcRr4maeA1C7N/ILd2uxu2dr8guQHUMR?=
 =?iso-8859-1?Q?Lxfk25nkExzAWNzNqSYMgmossyOpEXLHt1JsBy1VZaTp18MpvSMsd5u65s?=
 =?iso-8859-1?Q?py8UKljZzaeRYDubu3d1G0tw7LLUFjJI0EXxATrwxLjEafXjfB40n0qr+z?=
 =?iso-8859-1?Q?yIxgC1dSULvwHEe0WeNM6crarEcb1z1W922QOed2v68lA65EKhpklHyzOb?=
 =?iso-8859-1?Q?G6upLym7hQCUzsrUuDId4V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hlLFjhDPl1k6XqU3+du+DXjIkiWEWe3Fdxi4Zf3SEO8K3cOnNqT35mIEjZ?=
 =?iso-8859-1?Q?0qQQfWU4F8lTyMkVGcQolnrFd8KjHWI1rrw6BOlv46PhdVg3PPZQKO0l8J?=
 =?iso-8859-1?Q?pxeYPMqddZxSuXLeSfI9znwKQ9bAT7UayI546T5yQBOWHRwhrxKO3vnMWt?=
 =?iso-8859-1?Q?9ZU5hK9akbaPYSKBjx7/Iu83E++svYMlq9mACEX5zVKCbF5lIejShYFG5q?=
 =?iso-8859-1?Q?qj3KjU65hB7uzE/RVsEmEECBhaPJH++jF3EQUdrwfQWz0u0nlqyFbyJKYL?=
 =?iso-8859-1?Q?zOg9Ropvc+C6dCJ/t92t1MdvsfEXglxJS5/hymYb4Q1XiVrXSAGnk5j8Mp?=
 =?iso-8859-1?Q?UQS9vpp0kMEG3JjdPKiWZJbyANbpbirqxpjiWNybjPCEbxm07r5DNuiBIT?=
 =?iso-8859-1?Q?Hj1P3MUPXEy6J1IGlNBxjqewrDw9nMjzgYfB5C+NOPMMoMFASnWLm1YsZl?=
 =?iso-8859-1?Q?Lp/5gzmDCFO2bQV/UFWQ/VPhQIuGlrtS9OMR6j9Dwccmo11X8MK7nfhcrK?=
 =?iso-8859-1?Q?jkTJbeI+XrmNtJDrjdpZfeFXZ1VhWGxJpO7b2X0esBdbe49tX3DlGY/lQX?=
 =?iso-8859-1?Q?0d3B0T5qh7u7cx79k6pEdaxZqprB6etN+YdnqtCOh9ujPstcg9vP49nLdf?=
 =?iso-8859-1?Q?zu/jsQZqZVBUTVlCi5zEYlKYS+2YoeIUEphVqMgZgIpRSFcCfTjZy6ewnG?=
 =?iso-8859-1?Q?A/0LoCMmy6UvkEOrHHC8kKd+Ub1kPCC4Bz3Ds9+UnAUSqjTQE6KgZYMIV3?=
 =?iso-8859-1?Q?fqqOP7xtK+hKYwnO8zzca27FwmgNgPWjNwVn00Lf3p5N/LMcvbVR2Z3S3j?=
 =?iso-8859-1?Q?Se9iSj5BvKiu/5CKx2rdaT2GCN3HcNfQ8BHuUU45ht5M4N4K2wJ3ubR0jT?=
 =?iso-8859-1?Q?lMRt4W0MWW1S2U0dCZiHx4vD+ikAli+gBvAn5uLI/jk+ePQGbop7Cg8SvL?=
 =?iso-8859-1?Q?t0h7FXPtmSaqAdxyqjIGKsfiU5J7bnLNyCdeey9pPep2fNGQN4Zv/0JJu6?=
 =?iso-8859-1?Q?yrC1wo9NrWAuQl38cQnFLDPAN3Y9P088wO7XKhVhuyDftSmPm+oEsfmHMZ?=
 =?iso-8859-1?Q?LIbUD5I9eDjx3xP/QfxMM3I5d4N2CD7gXznDa2/p5bsCSlBMZJMZbsR8de?=
 =?iso-8859-1?Q?wEK3uKBsJAWX7Wpy1V1GuE3e4kL8dc9BR3tii5PEBs1ZpsBUYmYFKXLN2+?=
 =?iso-8859-1?Q?nZp5k0Siu6fvRtELEdda7FcLGTTuZt2vAsh8VwMZE+3Pe7wpyzT3mIFXxT?=
 =?iso-8859-1?Q?+y1hh6Y7r8ayqNbZMylxvDKUU9TdfkRN3lqsSKHrICNK6nxZkKa4a01tvv?=
 =?iso-8859-1?Q?jbcZzySeQSG2vZyo814m5zJo9lEblNSmHxcBXHeMbyDGv/hzEKiSOxAqw9?=
 =?iso-8859-1?Q?CMM4RRJA8hu73TwKu0nPfxY8H0HdOuuJCWtLyOgg0dAi0k71nY8X1kCh1o?=
 =?iso-8859-1?Q?3SaibmlQj3dZuEinsW+qr4213aX30C/X9duVwga5WDxYxmxioEhRPDxMuM?=
 =?iso-8859-1?Q?KYOZPeJqFvIOCd8Emx4A4JtALvw3N7VHlYvS3aeD5ePZZG6gWgS0S4BPEE?=
 =?iso-8859-1?Q?1gH/zEjn/MKArfFHbxjX2akxd08e2GNhA/BqCX/kr9+2BuqMog6XbS8wXA?=
 =?iso-8859-1?Q?iB6OWmp/lLltmg8z7EgZ9gKDNNay4ctQgz5x7oh0Isd15LBLfo3ufazg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 955e3ecc-4591-4631-6efb-08de27a1d0b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:28:27.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9l4NZRvcmNhKZ77A506ZGj1k+8DsxXDjQ6fs7T2sa0T5raybiHWbveP4bcdFI+9Ct5iPsSn0YArKofR96DofdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD3EB37DFC
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

On Tue, Nov 11, 2025 at 05:43:55PM +0100, Thomas Hellström wrote:
> Pagemaps are costly to set up and tear down, and they consume a lot
> of system memory for the struct pages. Ideally they should be
> created only when needed.
> 
> Add a caching mechanism to allow doing just that: Create the drm_pagemaps
> when needed for migration. Keep them around to avoid destruction and
> re-creation latencies and destroy inactive/unused drm_pagemaps on memory
> pressure using a shrinker.
> 
> Only add the helper functions. They will be hooked up to the xe driver
> in the upcoming patch.
> 
> v2:
> - Add lockdep checking for drm_pagemap_put(). (Matt Brost)
> - Add a copyright notice. (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/Makefile           |   3 +-
>  drivers/gpu/drm/drm_pagemap.c      |  83 +++++-
>  drivers/gpu/drm/drm_pagemap_util.c | 450 +++++++++++++++++++++++++++++
>  include/drm/drm_pagemap.h          |  53 +++-
>  include/drm/drm_pagemap_util.h     |  42 +++
>  5 files changed, 613 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7789f42027ff..04ff0b3e55b0 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>  
>  drm_gpusvm_helper-y := \
>  	drm_gpusvm.o\
> -	drm_pagemap.o
> +	drm_pagemap.o\
> +	drm_pagemap_util.o
>  obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index fb18a80d6a1c..50d3963ddbbc 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
>  
>  /**
> @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref *ref)
>  	 * pagemap provider drm_device and its module.
>  	 */
>  	dpagemap->dev_hold = NULL;
> -	kfree(dpagemap);
> +	drm_pagemap_shrinker_add(dpagemap);
>  	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
>  	schedule_work(&drm_pagemap_work);
>  	/*
> @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
>  	return dev_hold;
>  }
>  
> +/**
> + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> + * @dpagemap: The drm_pagemap to reinitialize
> + *
> + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> + * has already been called. This interface is intended for the
> + * situation where the driver caches a destroyed drm_pagemap.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> +{
> +	dpagemap->dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dpagemap->dev_hold))
> +		return PTR_ERR(dpagemap->dev_hold);
> +
> +	kref_init(&dpagemap->ref);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_reinit);
> +
> +/**
> + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> + * @dpagemap: The drm_pagemap to initialize.
> + * @pagemap: The associated dev_pagemap providing the device
> + * private pages.
> + * @drm: The drm device. The drm_pagemap holds a reference on the
> + * drm_device and the module owning the drm_device until
> + * drm_pagemap_release(). This facilitates drm_pagemap exporting.
> + * @ops: The drm_pagemap ops.
> + *
> + * Initialize and take an initial reference on a drm_pagemap.
> + * After successful return, use drm_pagemap_put() to destroy.
> + *
> + ** Return: 0 on success, negative error code on error.
> + */
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops)
> +{
> +	kref_init(&dpagemap->ref);
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +	dpagemap->drm = drm;
> +	dpagemap->cache = NULL;
> +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> +
> +	return drm_pagemap_reinit(dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_init);
> +
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
>   * @drm: Pointer to a struct drm_device providing the device-private memory.
> @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> -	struct drm_pagemap_dev_hold *dev_hold;
> +	int err;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
> -	kref_init(&dpagemap->ref);
> -	dpagemap->drm = drm;
> -	dpagemap->ops = ops;
> -	dpagemap->pagemap = pagemap;
> -
> -	dev_hold = drm_pagemap_dev_hold(dpagemap);
> -	if (IS_ERR(dev_hold)) {
> -		kfree(dpagemap);
> -		return ERR_CAST(dev_hold);
> -	}
> -	dpagemap->dev_hold = dev_hold;
> +	err = drm_pagemap_init(dpagemap, pagemap, drm, ops);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	return dpagemap;
>  }
> @@ -675,8 +720,10 @@ EXPORT_SYMBOL(drm_pagemap_create);
>   */
>  void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  {
> -	if (likely(dpagemap))
> +	if (likely(dpagemap)) {
> +		drm_pagemap_shrinker_might_lock(dpagemap);
>  		kref_put(&dpagemap->ref, drm_pagemap_release);
> +	}
>  }
>  EXPORT_SYMBOL(drm_pagemap_put);
>  
> @@ -1023,6 +1070,14 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
>  
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim)
> +{
> +	if (dpagemap->ops->destroy)
> +		dpagemap->ops->destroy(dpagemap, is_atomic_or_reclaim);
> +	else
> +		kfree(dpagemap);
> +}
> +
>  static void drm_pagemap_exit(void)
>  {
>  	flush_work(&drm_pagemap_work);
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> new file mode 100644
> index 000000000000..84a7a4807bef
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * struct drm_pagemap_cache - Lookup structure for pagemaps
> + *
> + * Structure to keep track of active (refcount > 1) and inactive
> + * (refcount == 0) pagemaps. Inactive pagemaps can be made active
> + * again by waiting for the @queued completion (indicating that the
> + * pagemap has been put on the @shrinker's list of shrinkable
> + * pagemaps, and then successfully removing it from @shrinker's
> + * list. The latter may fail if the shrinker is already in the
> + * process of freeing the pagemap. A struct drm_pagemap_cache can
> + * hold a single struct drm_pagemap.
> + */
> +struct drm_pagemap_cache {
> +	/** @lookup_mutex: Mutex making the lookup process atomic */
> +	struct mutex lookup_mutex;
> +	/** @lock: Lock protecting the @dpagemap pointer */
> +	spinlock_t lock;
> +	/** @shrinker: Pointer to the shrinker used for this cache. Immutable. */
> +	struct drm_pagemap_shrinker *shrinker;
> +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap */
> +	struct drm_pagemap *dpagemap;
> +	/**
> +	 * @queued: Signals when an inactive drm_pagemap has been put on
> +	 * @shrinker's list.
> +	 */
> +	struct completion queued;
> +};
> +
> +/**
> + * struct drm_pagemap_shrinker - Shrinker to remove unused pagemaps
> + */
> +struct drm_pagemap_shrinker {
> +	/** @drm: Pointer to the drm device. */
> +	struct drm_device *drm;
> +	/** @lock: Spinlock to protect the @dpagemaps list. */
> +	spinlock_t lock;
> +	/** @dpagemaps: List of unused dpagemaps. */
> +	struct list_head dpagemaps;
> +	/** @num_dpagemaps: Number of unused dpagemaps in @dpagemaps. */
> +	atomic_t num_dpagemaps;
> +	/** @shrink: Pointer to the struct shrinker. */
> +	struct shrinker *shrink;
> +};
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap);
> +
> +static void drm_pagemap_cache_fini(void *arg)
> +{
> +	struct drm_pagemap_cache *cache = arg;
> +	struct drm_pagemap *dpagemap;
> +
> +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		goto out;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		drm_pagemap_destroy(dpagemap, false);
> +	}
> +
> +out:
> +	mutex_destroy(&cache->lookup_mutex);
> +	kfree(cache);
> +}
> +
> +/**
> + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> + *
> + * Create a device-managed drm_pagemap cache. The cache is automatically
> + * destroyed on struct device removal, at which point any *inactive*
> + * drm_pagemap's are destroyed.
> + *
> + * Return: Pointer to a struct drm_pagemap_cache on success. Error pointer
> + * on failure.
> + */
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker)
> +{
> +	struct drm_pagemap_cache *cache = kzalloc(sizeof(*cache), GFP_KERNEL);
> +	int err;
> +
> +	if (!cache)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&cache->lookup_mutex);
> +	spin_lock_init(&cache->lock);
> +	cache->shrinker = shrinker;
> +	init_completion(&cache->queued);
> +	err = devm_add_action_or_reset(shrinker->drm->dev, drm_pagemap_cache_fini, cache);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return cache;
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> +
> +/**
> + * DOC: Cache lookup
> + *
> + * Cache lookup should be done under a locked mutex, so that a
> + * failed drm_pagemap_get_from_cache() and a following
> + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> + * operation WRT other lookups. Otherwise, racing lookups may
> + * unnecessarily concurrently create pagemaps to fulfill a
> + * failed lookup. The API provides two functions to perform this lock,
> + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and they
> + * should be used in the following way:
> + *
> + * .. code-block:: c
> + *
> + *		drm_pagemap_lock_lookup(cache);
> + *		dpagemap = drm_pagemap_get_from_cache(cache);
> + *		if (dpagemap)
> + *			goto out_unlock;
> + *
> + *		dpagemap = driver_create_new_dpagemap();
> + *		if (!IS_ERR(dpagemap))
> + *			drm_pagemap_cache_set_pagemap(cache, dpagemap);
> + *
> + *     out_unlock:
> + *		drm_pagemap_unlock_lookup(cache);
> + */
> +
> +/**
> + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for lookup
> + * @cache: The drm_pagemap_cache to lock.
> + *
> + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> + */
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	return mutex_lock_interruptible(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> +
> +/**
> + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache after lookup
> + * @cache: The drm_pagemap_cache to unlock.
> + */
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache)
> +{
> +	mutex_unlock(&cache->lookup_mutex);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> +
> +/**
> + * drm_pagemap_get_from_cache() -  Lookup of drm_pagemaps.
> + * @cache: The cache used for lookup.
> + *
> + * If an active pagemap is present in the cache, it is immediately returned.
> + * If an inactive pagemap is present, it's removed from the shrinker list and
> + * an attempt is made to make it active.
> + * If no pagemap present or the attempt to make it active failed, %NULL is returned
> + * to indicate to the caller to create a new drm_pagemap and insert it into
> + * the cache.
> + *
> + * Return: A reference-counted pointer to a drm_pagemap if successful. An error
> + * pointer if an error occurred, or %NULL if no drm_pagemap was found and
> + * the caller should insert a new one.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +retry:
> +	spin_lock(&cache->lock);
> +	dpagemap = cache->dpagemap;
> +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> +		spin_unlock(&cache->lock);
> +		return dpagemap;
> +	}
> +
> +	if (!dpagemap) {
> +		spin_unlock(&cache->lock);
> +		return NULL;
> +	}
> +
> +	if (!try_wait_for_completion(&cache->queued)) {
> +		spin_unlock(&cache->lock);
> +		err = wait_for_completion_interruptible(&cache->queued);
> +		if (err)
> +			return ERR_PTR(err);
> +		goto retry;
> +	}
> +
> +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		err = drm_pagemap_reinit(dpagemap);
> +		if (err) {
> +			drm_pagemap_destroy(dpagemap, false);
> +			return ERR_PTR(err);
> +		}
> +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> +	} else {
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +		dpagemap = NULL;
> +	}
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> +
> +/**
> + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a drm_pagemap_cache
> + * @cache: The cache to assign the drm_pagemap to.
> + * @dpagemap: The drm_pagemap to assign.
> + *
> + * The function must be called to populate a drm_pagemap_cache only
> + * after a call to drm_pagemap_get_from_cache() returns NULL.
> + */
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap)
> +{
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	lockdep_assert_held(&cache->lookup_mutex);
> +	spin_lock(&cache->lock);
> +	dpagemap->cache = cache;
> +	swap(cache->dpagemap, dpagemap);
> +	reinit_completion(&cache->queued);
> +	spin_unlock(&cache->lock);
> +	drm_WARN_ON(drm, !!dpagemap);
> +}
> +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> +
> +/**
> + * drm_pagemap_get_from_cache_if_active() - Quick lookup of active drm_pagemaps
> + * @cache: The cache to lookup from.
> + *
> + * Function that should be used to lookup a drm_pagemap that is already active.
> + * (refcount > 0).
> + *
> + * Return: A pointer to the cache's drm_pagemap if it's active; %NULL otherwise.
> + */
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	spin_lock(&cache->lock);
> +	dpagemap = drm_pagemap_get_unless_zero(cache->dpagemap);
> +	spin_unlock(&cache->lock);
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> +
> +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache = dpagemap->cache;
> +	struct drm_pagemap_shrinker *shrinker = cache->shrinker;
> +
> +	spin_lock(&shrinker->lock);
> +	if (list_empty(&dpagemap->shrink_link)) {
> +		spin_unlock(&shrinker->lock);
> +		return false;
> +	}
> +
> +	list_del_init(&dpagemap->shrink_link);
> +	atomic_dec(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	return true;
> +}
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +/**
> + * drm_pagemap_shrinker_might_lock() - lockdep test for drm_pagemap_shrinker_add()
> + * @dpagemap: The drm pagemap.
> + *
> + * The drm_pagemap_shrinker_add() function performs some locking.
> + * This function can be called in code-paths that might
> + * call drm_pagemap_shrinker_add() to detect any lockdep problems early.
> + */
> +void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
> +{
> +	int idx;
> +
> +	if (drm_dev_enter(dpagemap->drm, &idx)) {
> +		struct drm_pagemap_cache *cache = dpagemap->cache;
> +
> +		if (cache)
> +			might_lock(&cache->shrinker->lock);
> +
> +		drm_dev_exit(idx);
> +	}
> +}
> +#endif
> +
> +/**
> + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the shrinker list or destroy
> + * @dpagemap: The drm_pagemap.
> + *
> + * If @dpagemap is associated with a &struct drm_pagemap_cache AND the
> + * struct device backing the drm device is still alive, add @dpagemap to
> + * the &struct drm_pagemap_shrinker list of shrinkable drm_pagemaps.
> + *
> + * Otherwise destroy the pagemap directly using drm_pagemap_destroy().
> + *
> + * This is an internal function which is not intended to be exposed to drivers.
> + */
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_cache *cache;
> +	struct drm_pagemap_shrinker *shrinker;
> +	int idx;
> +
> +	/*
> +	 * The pagemap cache and shrinker are disabled at
> +	 * pci device remove time. After that, dpagemaps
> +	 * are freed directly.
> +	 */
> +	if (!drm_dev_enter(dpagemap->drm, &idx))
> +		goto out_no_cache;
> +
> +	cache = dpagemap->cache;
> +	if (!cache) {
> +		drm_dev_exit(idx);
> +		goto out_no_cache;
> +	}
> +
> +	shrinker = cache->shrinker;
> +	spin_lock(&shrinker->lock);
> +	list_add_tail(&dpagemap->shrink_link, &shrinker->dpagemaps);
> +	atomic_inc(&shrinker->num_dpagemaps);
> +	spin_unlock(&shrinker->lock);
> +	complete_all(&cache->queued);
> +	drm_dev_exit(idx);
> +	return;
> +
> +out_no_cache:
> +	drm_pagemap_destroy(dpagemap, true);
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	unsigned long count = atomic_read(&shrinker->num_dpagemaps);
> +
> +	return count ? : SHRINK_EMPTY;
> +}
> +
> +static unsigned long
> +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct drm_pagemap_shrinker *shrinker = shrink->private_data;
> +	struct drm_pagemap *dpagemap;
> +	struct drm_pagemap_cache *cache;
> +	unsigned long nr_freed = 0;
> +
> +	sc->nr_scanned = 0;
> +	spin_lock(&shrinker->lock);
> +	do {
> +		dpagemap = list_first_entry_or_null(&shrinker->dpagemaps, typeof(*dpagemap),
> +						    shrink_link);
> +		if (!dpagemap)
> +			break;
> +
> +		atomic_dec(&shrinker->num_dpagemaps);
> +		list_del_init(&dpagemap->shrink_link);
> +		spin_unlock(&shrinker->lock);
> +
> +		sc->nr_scanned++;
> +		nr_freed++;
> +
> +		cache = dpagemap->cache;
> +		spin_lock(&cache->lock);
> +		cache->dpagemap = NULL;
> +		spin_unlock(&cache->lock);
> +
> +		drm_dbg(dpagemap->drm, "Shrinking dpagemap %p.\n", dpagemap);
> +		drm_pagemap_destroy(dpagemap, true);
> +		spin_lock(&shrinker->lock);
> +	} while (sc->nr_scanned < sc->nr_to_scan);
> +	spin_unlock(&shrinker->lock);
> +
> +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> +}
> +
> +static void drm_pagemap_shrinker_fini(void *arg)
> +{
> +	struct drm_pagemap_shrinker *shrinker = arg;
> +
> +	drm_dbg(shrinker->drm, "Destroying dpagemap shrinker.\n");
> +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker->num_dpagemaps));
> +	shrinker_free(shrinker->shrink);
> +	kfree(shrinker);
> +}
> +
> +/**
> + * drm_pagemap_shrinker_create_devm() - Create and register a pagemap shrinker
> + * @drm: The drm device
> + *
> + * Create and register a pagemap shrinker that shrinks unused pagemaps
> + * and thereby reduces memory footprint.
> + * The shrinker is drm_device managed and unregisters itself when
> + * the drm device is removed.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> +{
> +	struct drm_pagemap_shrinker *shrinker;
> +	struct shrinker *shrink;
> +	int err;
> +
> +	shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> +	if (!shrinker)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shrink = shrinker_alloc(0, "drm-drm_pagemap:%s", drm->unique);
> +	if (!shrink) {
> +		kfree(shrinker);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	spin_lock_init(&shrinker->lock);
> +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> +	shrinker->drm = drm;
> +	shrinker->shrink = shrink;
> +	shrink->count_objects = drm_pagemap_shrinker_count;
> +	shrink->scan_objects = drm_pagemap_shrinker_scan;
> +	shrink->private_data = shrinker;
> +	shrinker_register(shrink);
> +
> +	err = devm_add_action_or_reset(drm->dev, drm_pagemap_shrinker_fini, shrinker);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return shrinker;
> +}
> +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 5cfe54331ba7..4b9af5e785c6 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_cache;
>  struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
> @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
>  			   unsigned long start, unsigned long end,
>  			   struct mm_struct *mm,
>  			   unsigned long timeslice_ms);
> +	/**
> +	 * @destroy: Destroy the drm_pagemap and associated resources.
> +	 * @dpagemap: The drm_pagemap to destroy.
> +	 * @is_atomic_or_reclaim: The function may be called from
> +	 * atomic- or reclaim context.
> +	 *
> +	 * The implementation should take care not to attempt to
> +	 * destroy resources that may already have been destroyed
> +	 * using devm_ callbacks, since this function may be called
> +	 * after the underlying struct device has been unbound.
> +	 * If the implementation defers the execution to a work item
> +	 * to avoid locking issues, then it must make sure the work
> +	 * items are flushed before module exit. If the destroy call
> +	 * happens after the provider's pci_remove() callback has
> +	 * been executed, a module reference and drm device reference is
> +	 * held across the destroy callback.
> +	 */
> +	void (*destroy)(struct drm_pagemap *dpagemap,
> +			bool is_atomic_or_reclaim);
>  };
>  
>  /**
> @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
>   * @pagemap: Pointer to the underlying dev_pagemap.
>   * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
>   * device referencing.
> + * @cache: Back-pointer to the &struct drm_pagemap_cache used for this
> + * &struct drm_pagemap. May be NULL if no cache is used.
> + * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
> + * used if also using a pagemap cache.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> @@ -142,6 +166,8 @@ struct drm_pagemap {
>  	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_pagemap_cache *cache;
> +	struct list_head shrink_link;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		     struct dev_pagemap *pagemap,
> +		     struct drm_device *drm,
> +		     const struct drm_pagemap_ops *ops);
> +
>  struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
> @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
>  
>  /**
>   * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> - * @dpagemap: Pointer to the struct drm_pagemap.
> + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
>   *
> - * Return: Pointer to the struct drm_pagemap.
> + * Return: Pointer to the struct drm_pagemap, or NULL.
>   */
>  static inline struct drm_pagemap *
>  drm_pagemap_get(struct drm_pagemap *dpagemap)
> @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap *dpagemap)
>  	return dpagemap;
>  }
>  
> +/**
> + * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pagemap
> + * unless the current reference count is zero.
> + * @dpagemap: Pointer to the drm_pagemap or NULL.
> + *
> + * Return: A pointer to @dpagemap if the reference count was successfully
> + * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
> + */
> +static inline struct drm_pagemap * __must_check
> +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> +{
> +	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : NULL;
> +}
> +
>  /**
>   * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>   *
> @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  			    struct mm_struct *mm,
>  			    unsigned long timeslice_ms);
>  
> -#endif
> +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
>  
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +#endif
> diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
> new file mode 100644
> index 000000000000..924244d5b899
> --- /dev/null
> +++ b/include/drm/drm_pagemap_util.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _DRM_PAGEMAP_UTIL_H_
> +#define _DRM_PAGEMAP_UTIL_H_
> +
> +struct drm_device;
> +struct drm_pagemap;
> +struct drm_pagemap_cache;
> +struct drm_pagemap_shrinker;
> +
> +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> +
> +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache *cache);
> +
> +struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> +
> +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct drm_pagemap_shrinker *shrinker);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
> +
> +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
> +
> +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +
> +void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap);
> +
> +#else
> +
> +static inline void drm_pagemap_shrinker_might_lock(struct drm_pagemap *dpagemap)
> +{
> +}
> +
> +#endif /* CONFIG_PROVE_LOCKING */
> +
> +#endif
> -- 
> 2.51.1
> 
