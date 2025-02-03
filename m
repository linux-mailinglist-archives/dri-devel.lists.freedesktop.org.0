Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1937A26349
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 20:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5727010E100;
	Mon,  3 Feb 2025 19:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0C2KmkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26EF10E087;
 Mon,  3 Feb 2025 19:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738609553; x=1770145553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UflfMzP+AoeafIWnwiyhfnKbQ2WvSKdpXA7QmZvJUSE=;
 b=S0C2KmkTXTfXzxYDHU/7yNxg1pG9FI1V52xxcP3Fu7UNv8RPXA8hEktp
 2WOrXXjpVlNMmylQvyUupUxXvZ5vDPM0znE/pJ9lO24hmL+ZcKJAJICbD
 o4IRwzt6SRBq+aGWWajFR+cibeFW2QYKNOH3g3tmSBWWYuSZm0DE3QANV
 QSUUUJzwRSctFLbPy84TA8OpZj0Gms4JlfeDR9A7fRojZY32xbuRUd17+
 W378eAJXY41hCGgWzj2vbAykEIH0wdlxxnsn3cucihTi5m1sbKi5ZOPpr
 ZM5KKTCtJcH3QVDJqAXYcdCR18RTP4aXTDmXImwv/0l1JQ/H7CDaNgCBu A==;
X-CSE-ConnectionGUID: zn0SFLwzSOSsBQdNG2mqiQ==
X-CSE-MsgGUID: DVF1Cn8YTsSp/WoC6t85lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43040402"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="43040402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 11:05:52 -0800
X-CSE-ConnectionGUID: J75kqjLlQfWAXPJNi7XnZg==
X-CSE-MsgGUID: vzpSGZwcQRiPfy06XpgbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="110536089"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 11:05:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 11:05:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 11:05:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 11:05:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roKS/A2VJe7iwp28TWQXErRauDfxx0hysZnt1dRULkN6etIOkKFPyAata6osDjMDE1Yt/kTZqj4gFK7hi2fST8y3NOR/z8c38AdFrrI+DMqtcGAl32o7BM5ZjTSaESBt7TE83JvZo29x6EMztOhp2dc0v6X8k6XlULUMlnNCqVkOWnhZXzMCEl6JfMxi3lWsZ/NvMyVxhyIOOUHpzZkZSZPeRnt6s9lJYvpSf6dpNA3UV+wtAhhPsh5sJzlTogKDaMXmihUNw7lOMZTGr0E4s+yVJthUZkCJQPtBrVf9sfIImAUu6NwFyBO2sRFNVimhkIcI7JkcIPHgULyIf50v6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn5mT+9c2mxsH4UXfbemlBA36OiliK50NeLeNs5QM20=;
 b=cjGSwXsenc9w8BXEJ5C5XDmzCi1P3bO0XLKg3bNpq1eiULf3ViCxzI7TjOnNFidcYTzl9eTUfkuYivIZpR2AKl7CrahUFR/GzaYWqMBOz3lzE/xanrUyJ1sS62zWBPfKcVoMyUZaRhYvs1fFGRfhxV6Tx5WtsvSz6wE+dSwgFVH9MLmpB+Oa+pKbr4Gfc1bTNJhpDdbUe6ufOsChUPE9A+dOnSKLfQJeEw6QWeJ1ZYROk+J0/mAnrjkfHh8CENQXMbdqcqaA/Uwf2CXTGRIDf4iCC1/BZ9TVMGXetMXjrqhUmEiFGZWRPqLjak1Eo/Cp0bMTWFc5L8KiAKELeX1RBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 19:05:44 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 19:05:44 +0000
Date: Mon, 3 Feb 2025 14:05:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: David Laight <david.laight.linux@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
Message-ID: <Z6ETg52NDLC3Zhr6@intel.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
 <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
 <20250202132709.3ab54376@pumpkin>
 <27c1243c-15e8-4c24-a0a4-cc433000ad38@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <27c1243c-15e8-4c24-a0a4-cc433000ad38@roeck-us.net>
X-ClientProxiedBy: MW4PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:303:83::31) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3bed21-71ff-4e3c-abf6-08dd4485c262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?85wYLe1EzcotB5Vy3HyT/fzoRx1dHpticMMDRZDE4v3boqXgu6sOI2BmRKFH?=
 =?us-ascii?Q?JM9EzowDwyvTHeJTxVsgaDRc9sk2nbJfcfv8wHm4gBQ9D8E7zzScp8n806Fc?=
 =?us-ascii?Q?ncZetDlHAw/lDiSZPdEktX1brDetaHzEibyaCIQgO3w2Z8Xqq2ik/HKK42hf?=
 =?us-ascii?Q?Kn5mEHbCTjM9szLaRjRbuj/hDiObjiam/QP0zSnR9Blrq0hl/JPEMsfvCdjU?=
 =?us-ascii?Q?orLtyryrcF62SK+dAtlJePnkXiuIqvDeo0Ov12+T0wcZeIRkR2a2kNRl10Qb?=
 =?us-ascii?Q?0tZFs9zU9gy45eIlWYyA8W3rwGYkqIz9IHibWvGc5C33MNi9C/Zt4fAXdPaf?=
 =?us-ascii?Q?1iZzhtHNN2r089kaeBLT5R97isNaRTPGiUwy8auZSYQuK7SSbi+quYdCHTaH?=
 =?us-ascii?Q?h+Um8L/g+PJVEXU1pTsO+GUzyRdZo1GyP5G3SxvywAVi1w9A/WiWttIdQozv?=
 =?us-ascii?Q?TnWohhVviHrf5l25eWBJiEtzfDI8XDN+Ih0jjPLmb9XyC0Lh2dbTi7fTbHj8?=
 =?us-ascii?Q?yOViQyyMFbK+HxxtLnfYXAf03bYQAAWUNKa80DdjXCPrPadhDc3n9Q0vmgbH?=
 =?us-ascii?Q?m1B4LjPVmqHvSHqEpnrhh+Ec5vNZrQlb8UHkh9sjBiAlPX1X3SiI4jVq3uhF?=
 =?us-ascii?Q?1o42DYw8yCNqQPAGcTDRsDV2pu3bQjmLFsxa8v6x1lwlK09txx2qyHS4otjI?=
 =?us-ascii?Q?W9PEkx5V9mTxdQPThcKmVw1oREgCQgkGPBiL+IZrd+ZkvQhkhzaEw+wDTZlQ?=
 =?us-ascii?Q?tyDwViPtTqUvKkjTkIxFLF5A/t/So0pIL+mavdC+R6dsmYQ/+M/fSyfFgtvl?=
 =?us-ascii?Q?5oBgYrk3opAPE2UXBdbZA8aGogUTJAOQxbIhCtwOlQi4WcYkyDr7LN1yacRD?=
 =?us-ascii?Q?revC9Ylr0YubdMmK8SLIHzwOh4gfiScvv7pRqRhR/I8AejM2jNista5AMBAq?=
 =?us-ascii?Q?85tvTadUpDsnmyzWe5C7vFwJdiO1LU8f1XcTsXGmoZl2M0f3N9slE3xGZu15?=
 =?us-ascii?Q?+eYk2UhIFxQyaQIIToqi+xfwOSJ5LcleqWYj5ysdYJAHPzWuL4qgBjF6Vfpd?=
 =?us-ascii?Q?065LdboqW1KTN3HM52ubrMqraiev4tbXuHREyibzMoRgdTjNupHIFvzCHS89?=
 =?us-ascii?Q?xoVKv5WyXvhfi9HToLyL/RxosCRkv+iPsTFjHi8Exxnd83fgxrxSYvH/oqLV?=
 =?us-ascii?Q?9tG9d1/jvMLR0wkMcgISiqbrB2dJHNxg+/5Fh11wPKdCHQSzOO2auPW5lLrP?=
 =?us-ascii?Q?iq4qHOAJ+DMME7lSUKw0SY38sHCaL3JwKuw781SKCcZEe3dFwb2zgvPmefp4?=
 =?us-ascii?Q?bMmhV0ivVg28k5GSGLEXTKa1uDRNEkvGZOa9JXkG2HTg9PVXRMN0hj3fy2g5?=
 =?us-ascii?Q?jAnsnZ8yx1hN249iGfleDeILBDc1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SKL4E65QQ7AHKPT4wu3rp/KAZXzIei0lyPDmu1AGrHnVWhdbHerrkArC0ynE?=
 =?us-ascii?Q?VnrMGK2CxgP4WKGIdafbWdJpSkMCw7JwCn8vBveAAl2QasxpoXeJtE8V2zm0?=
 =?us-ascii?Q?J0WXFjSC8cvAtzfcsgbYr96cM3WyQx+TnB/XsnEMGRmTl942oic2CrYK+cDS?=
 =?us-ascii?Q?cLo8jP1vw+yFtN2i8uUnUgMJ/Kcruo/m5Xbs3GWSfOg8HBGg37v0r14tYUID?=
 =?us-ascii?Q?Y8H0eRERmdC7daIdbyDl6ow9mE6vU2W1cIAIMVcoyx6/KgtpyTh/ioJ3C5nh?=
 =?us-ascii?Q?CtxzOS6JufjSTniktsSEuL2nkSKwDo9+V77lsEf8qts1O77qBXFAksM3TW0h?=
 =?us-ascii?Q?agsT/LVCZgAUzf8eYFZdNM88YSlPxTogX1HD7XERnACcxL4AnBzFTVvA3WbV?=
 =?us-ascii?Q?gaSyt1T2b6gPWL5XvEk8nlFhUNF/aPuk5an44PcqV5R6RgGR6+4JpoeOgoO9?=
 =?us-ascii?Q?bDgIfzlG1IPVtRZjEpOFY4bwvpfMQZZkm8NbA6ls37wbYhMKwiYLJyZW4RRO?=
 =?us-ascii?Q?BTYp1Yx7glogEW0qih7k5Blqr5vgUux1TQ+D19zfqlbPlFCDAFA/Od2u342a?=
 =?us-ascii?Q?FYjwmdgC6aBO/HVorn7DrTukCkD+fP7xkC/TY7MsCrEC1QNFfuGfQTz+jryG?=
 =?us-ascii?Q?4jC8sg4pFxSyCo95c1l+r9Fl/foJ+ouMCpMJOdiAhnw/Bdbyh9/hSKw63kI/?=
 =?us-ascii?Q?aljFeUCRB9UzHKfuQ0F/M+Bn5fFmn7bIlsh5emctG7tI4z8Y3KiOFRDGojpD?=
 =?us-ascii?Q?WgbaWDBj7CoWMzEFUjHS0dhJMfO03MGd/8SEsRase3Pu4iut1jApT4tYhkO6?=
 =?us-ascii?Q?zm53V4944mh6y/HqJhmsJiy/HiPOvybJCMrjBbcUQpwrq5hlgxto2AVLDwFP?=
 =?us-ascii?Q?5eN4ggckwovwDaVi0/dY7kp7YXn2hxJ8I6Oo8y0Cw39/x1CQn5JPM3laiiST?=
 =?us-ascii?Q?M02c2+9g4cZN3xAdj1nA/hrjIhpjobBQ2du91aXCxK1LLnI6iyamVMUSVyKk?=
 =?us-ascii?Q?b7FwUAF20rYUWRq4OHISRapEpXBNykhfzb7ukFWkiBKiTTZiqfTsexBLnxFd?=
 =?us-ascii?Q?Z9jYv8InB/OL9tGb3O6TgEqy+3AKD7ehajVj/YYYNAFZkvjpebYnDLjsACwu?=
 =?us-ascii?Q?DCXXM0c9mIe+mJN4B4nj+ejhp73o2pQSGThd8d+t9KvoQJRjfKwTOuhoGcPY?=
 =?us-ascii?Q?pX6jSxENF2nMs4TPZ+C9mEoUsxFr0NUmfkKRmzyErWn/tdxVhol3YbTw46Jc?=
 =?us-ascii?Q?3FrK6AMEbRPBTPQJAn0fNC8jB5/C9EBx3knpXajvGaAwG6Y65XDwENc7WRZC?=
 =?us-ascii?Q?x5yJpErzDB1T52RQU6OHNv5lloPt0sBp07a/OHXHwfQYLOlwtuM0eHsWpfV6?=
 =?us-ascii?Q?7/W9mei95geIdzKra7NWwY1XAqsmY52unmZlLnDT764+rQpPG/AfsJQDzegm?=
 =?us-ascii?Q?DurltINwW6uvfsa7rzRhFKAz92tHp5MZgb6WeHCgVf7buRbnfMlSCAaqtmiV?=
 =?us-ascii?Q?VYGSfQONTCu6B9gSZSF0zSfO3+e3O6XHKnNvdty12yNBoa4uN3CB5s0yGlPy?=
 =?us-ascii?Q?o2tLlYVLIxvGpqB7Ai4/bT5KGBnSinbWcMqTwAy3QQUlC+lx93LX9QLaPVZK?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3bed21-71ff-4e3c-abf6-08dd4485c262
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 19:05:44.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86TRdptSItsNNS000wOD2pTu3sjM5jeO6x99V5NoY69jtYx4bjViq13xSCYvCoXNrfLtuPW3uhpES56aWg/iSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

On Sun, Feb 02, 2025 at 06:28:08AM -0800, Guenter Roeck wrote:
> On 2/2/25 05:27, David Laight wrote:
> > On Tue, 21 Jan 2025 15:15:09 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > > On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > > 
> > > > I'm pushing this soon to drm-intel-next, unless Linus want to take
> > > > this one directly to his tree
> > > 
> > > Let's just go through the proper channels and go through the drm tree.
> > > 
> > > Unless I've issed something, I think this is only an active issue on
> > > parisc (and only with certain compiler versions at that), so it isn't
> > > some super-urgent thing that needs to be expedited.
> > 
> > It probably wants pushing into rc-2.
> > The build bot is complaining again.
> > 
> 
> The patch didn't make it into linux-next (as of next-20250131).
> I assume it either got lost or it was dropped for some reason.

I'm sorry for missing that for our -rc1 cycle. It is now queued for -rc2

> 
> Guenter
> 
