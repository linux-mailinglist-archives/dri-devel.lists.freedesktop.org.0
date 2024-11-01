Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B859B965F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 18:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976D710E15D;
	Fri,  1 Nov 2024 17:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lH5lNE78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68AE10E15D;
 Fri,  1 Nov 2024 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730481554; x=1762017554;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5fl3DyhEJtNFRL2SYEG8vz1knBF3kVAYYO0b6dZpRnw=;
 b=lH5lNE78SE5oFKEXaNXBFHCn2h1lLf8KpXxp+aYZTT2zWStGmOYvQiGm
 LQE158JKF4lsKs0BZfa7NYJyqU5NerBwaDBuce2q7hZSrPugKueEst/bJ
 rOhUXD4YiSVsvK8fYT1CPuo8ZkDpigNG574UYWxg31bX3rjdR/STStFWr
 BgD7MSiykValaZSeSof4/99tuYTM8qzPf2IHCVdyqDc8zNR+gnJD7FSeS
 bRfaA6wAJRoRVxP1ry8yBueSmxiLHXO4alhBvNZpW66GnR+PRE1XrU94W
 1Yfv+EyKlKe4bPZRuM2Lwfi+ZsZliUA8MOs/eDRe8Q0X5y2FbBPybdm+M Q==;
X-CSE-ConnectionGUID: 5O8gyPeOS9meQGeK+J+//g==
X-CSE-MsgGUID: 9e/1MZSdSpO5bPqcdWWvpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41615334"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="41615334"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 10:19:14 -0700
X-CSE-ConnectionGUID: ZEvz0HxWQaOreA8IHfJidQ==
X-CSE-MsgGUID: wqxPxg2IR8OU8Zcdl8QkIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="87619530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 10:19:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 10:19:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 10:19:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 10:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9AKeNsUQnLerGwvWrpUEpvecEr71tvXAZs5rUhKhOYUtWE3KcqyIMgd4WlsETiFeElOFUEdtHN438fcaU4Qc5eqYkmcXsWuRiqxWaQOCtJyYua/9FWHbQwz8Syd0PoY0WJfCEHXTSI8If/4/qowDPB4RwVwKi+gdI7trzvLJPBa2pHRsQK1CiPjDhpft/rFhOG69lIPg+OV3aj0A/kAeYJb4WmESg+mF2ayXTMVNCPftQ4SiXqwi/JJSkDFsUlwlBKNBBek4IwF0lhf63x7qNLliBdue/LquLC/pjIkI6vNlW2RHAQcDu6HAmgbTERwxVms3KCATsbxxVTSqeh59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI+RPxAUMlGYa5iGHSGvHirJ8tBvzdAMYwSMl7FPJjM=;
 b=YmpjbtedIlpsspIHFu6Z0znwAUfiPnTOQsUqfPB/Vlkt5fBWMGEiqmanQwoyP0LowJr9N7mBmDXu/om7Zvn3AxBJC1pJwkU1IJAc9SfvKM0R+Jd4YTvKw1eEVNnz2cMaUG60+pr8fBDzhPl3PHW6dZkZK+gzasTr40GpPekx6YBD2kMRlyZAaVgXHa95jvpcRZILH8a5CGkIvpCZ1dgNzlRhARIKyfse+AAYpQZdVP42dJ8poyUh4i0sK5zhtSCbr5zVePpwpKChscV9SnRhnI87RisVFw60QcRXH0AmwXHZtOvj6TEnSe6r0AXyjj/4Q7eWztjVxVqlSq/oooC2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7669.namprd11.prod.outlook.com (2603:10b6:a03:4c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 17:19:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 17:19:10 +0000
Date: Fri, 1 Nov 2024 10:19:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZyUNq0l3az2w4JLr@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <87sesw8ziu.fsf@nvdebian.thelocal>
 <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
 <87cyjzo5pt.fsf@nvdebian.thelocal>
 <Zxrm8vcszpit/ZNK@DUT025-TGLU.fm.intel.com>
 <87iktbs8q7.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87iktbs8q7.fsf@nvdebian.thelocal>
X-ClientProxiedBy: MW4PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:303:b4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b8f6bb-5223-4ff4-2f1b-08dcfa994c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PWldpOJScSpS7ZOi1Odew06snjolRjKrCdIJMeLhSkoSDMk2Ok6d4IV3K0?=
 =?iso-8859-1?Q?S97mBxrI46hNgHu2S2fRFpdyuKDArnK7SoSy2A4zP3mDTlw+GfKLzIMZAT?=
 =?iso-8859-1?Q?CplyvHGhoEbIXJc3QZCXLDU35nd1phNtz8qMHph9J6kWDohwkkzcgADWj8?=
 =?iso-8859-1?Q?rLdatJrHU7XqPCQk5d3h4V25us4slBn4PpMwAxJDhmf4/2fjZ7vly8nipf?=
 =?iso-8859-1?Q?pz/YANtVSpo9/IB2IX9kQ+oh8+hjMNzzdHPm/4rf/RXGGx8d0cXTPMHYhq?=
 =?iso-8859-1?Q?wqq35pxuKYVFPhjziy/kkxVtbINdxgEHYgdWGi58fwme5aSeWivCsym5Gm?=
 =?iso-8859-1?Q?qTjwuIXY24lcrXtnv7F9JbfIcrMYZgDP+HqSxSlAgKhwtL5u+nS1wdbgjG?=
 =?iso-8859-1?Q?4aRP3oQ5B/2/hi57sX7wsHHJbCS6/qkWojeE2Z2zOsp8q5+JS4Z5UjGMsO?=
 =?iso-8859-1?Q?7W1wIfneUvz3/rsOZ3cqb2zqmjOXVfMgy0WjjYGZmqFkFmzhPjta3qO9Yw?=
 =?iso-8859-1?Q?W0RcfjalCngoLS+/E/kEp0tRMqrrbdeLgYrg8LsyozJHNkL4wTCxdHbos3?=
 =?iso-8859-1?Q?7yUDq87Oy90s6GKlfsjTpuq7L0rlGdvaHqu6jGgNwsL7qeCiWC88//2TAP?=
 =?iso-8859-1?Q?XGuGK9bh7FkgXdR8ZFq5KQEVja8965+VyK0VGBofYYJjpdbLC/+1np3qYr?=
 =?iso-8859-1?Q?MXklVBInoFGHwBFrLZ3Yu7P9OA0ztxl4feqjOdt7fzERx/QjhI4sK94jOK?=
 =?iso-8859-1?Q?QbTB/yC23kUg0SstKN+HxaczLlINuVmeYdud/lm8GqpNyUFNBQqiZgfTdK?=
 =?iso-8859-1?Q?Tajsg3s1w686jovAYtEC/lr1HIPKrQRsDZim5Vqlin3EBCc8VORoFnnzLM?=
 =?iso-8859-1?Q?7nZ2p/5J3l+l5ZpgsQLltLisFfSUVYcIIQpaVPxJF8/NjCPpwdJjC8auZb?=
 =?iso-8859-1?Q?FD42kTSJ11yNweu1j4ginLnGbHP7gm4TehXXjTDhG9VmDWmFHGQTEYoMjy?=
 =?iso-8859-1?Q?ibLa+kpGmXfM7vKKDtgHqggF0jXevR98VSVJBg4bxF+nn0XUkH2pVFpPnG?=
 =?iso-8859-1?Q?t8ZH5Dn3sHF6rqcbnPjZk3wfWPmKJxxHdjWnd2hzecq+cpWRWFAr7A4OgM?=
 =?iso-8859-1?Q?bJ+CmtDlqCvXo2ewedFo0DPyhqpVL1pqummNr43pJlkrokPgoklQnsNL+m?=
 =?iso-8859-1?Q?oanCTrSWq1K3PEMuFTFfGFmtScknIPOgt9j5KLIH5M319XGcKFIRKepIvi?=
 =?iso-8859-1?Q?wU+768q1h1+tK+3pxlkar7LgR44yRYF+yXRppiBoCuBY5a321MD6+2v4rL?=
 =?iso-8859-1?Q?sem+2iAOzgt3qPfZ7cFcbeSnn1+CUArc3cl2UkO/A9cORh9aFPT3N5+pbH?=
 =?iso-8859-1?Q?grXZlBsaJC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3L0sYVIvRTQCn3Q9ub2vbvWrCcyLBLaKQ0H0njHm2+Ok/ojBBkGKoeJGxl?=
 =?iso-8859-1?Q?0AbCDamLNmCcd8A2CJuCqAt1/j1Ddnm5fqpY9PjntKC3GM9MlTj4LCvxa+?=
 =?iso-8859-1?Q?bWW5GGWjx1CGv2MdY1J8114WUoaWMQ5jyg4L9aWRW4kwDFoitmm9Q9G9fy?=
 =?iso-8859-1?Q?iQmJqZCu+bfNqI0x8c3+CZg+0tT/AEaRl3NQ2dNYLxuLgwg4CBt54b/wQb?=
 =?iso-8859-1?Q?PeVqLJehBCLO3ywaSWXr2UKp1ifuxKGIgujbGk6GJ8z90jjEiaf/VsX+NJ?=
 =?iso-8859-1?Q?2zZiPHWTnEenMVhs8N2DJ6kEJE3Q+ZLIUk8hHoTEaF5yfVvdUxVEW0UuEW?=
 =?iso-8859-1?Q?enpd21DNhcczuuJO5VlL3SOxsJxXmvycuVrtXNwRbcw/vZc1/1BeMM/xRr?=
 =?iso-8859-1?Q?OHG265RrsuSda1u6alDu1nJsWmECIa4PmAnN469wB7OvDKLcfunnYTPrXM?=
 =?iso-8859-1?Q?rcLhcwIwejCejbsLdS/u0xfS4q56NpTQrFbVRZrTZWySSZhLRPtYl4dhuv?=
 =?iso-8859-1?Q?+BLpbg5kupYxvjPwRzmcMCkIWhC8PEiUb3okjgYZm5EpyVW5gSO26rncIB?=
 =?iso-8859-1?Q?6RqtULlUl4kPrpWkPr3Mf/M22x9QrNuzb7AcvKM+NwIB3GWXfjbyC0Acad?=
 =?iso-8859-1?Q?Q7/JbWRn3qszEmyMoWTji8ZRLOxpKTnxnWrYziMLfcihlBzKO5U2ASc2Xs?=
 =?iso-8859-1?Q?7zFrRZrwnRTVN4zjJKr0bo/t+gZBPv/TS26qgqvarmeCcBlyOKFojyMZNo?=
 =?iso-8859-1?Q?nYEy0WTZomroLT5/XZHrpW50BIfo6RPAJtC94P9EvwBVAVVt7jixKTsqti?=
 =?iso-8859-1?Q?iaaXtNPB8oYduXDhmP+O6WRpu8QdCpF5ZFIP97KbtW63tOPB6tTcqMCXW/?=
 =?iso-8859-1?Q?SZUOATS5Edl3aqnjRLmOahIFDp0gZrFRKh5IWrWubNHygVQNlVFuKH0QMC?=
 =?iso-8859-1?Q?kjmO5QrZPeByR4YEKeALQ6I/iDUxZ+E5cVLHXYL9Rx7XxEW/y0pJ4mO3r4?=
 =?iso-8859-1?Q?k7gWaHpeu39TmxvC9ww+9EGNyuxCcurZOWaco9RpD/fsfvtzd9kcvLqSok?=
 =?iso-8859-1?Q?bpJyZ+l3ngxc78xfHBpuvs1cyUhNjMbdz7V+fy9ToXjIyzhUS3Ky5Mj5+e?=
 =?iso-8859-1?Q?1K2Fk48eSEeRUrIcYFlvfp6UlK1EESRvRU7WRewFGFext0HmUve0SleTGq?=
 =?iso-8859-1?Q?V9vNUOh/9Z6Yt7zRNtjvu6WkLN6BMpnjExYlVJQzGqOT8kNjdTSLZuXfnb?=
 =?iso-8859-1?Q?6uBHLxECj3bx7WdaaCDMDePrvJ1QjWgMRtM92arekzMj9A+x3xwL/MrHk2?=
 =?iso-8859-1?Q?zs8sk41QeqAHRTHMM7P2ALIhOAPoPU2lcbSvhtFHu7EvOWnTWhA128EidW?=
 =?iso-8859-1?Q?080QTNbNVHCpOOoidDbUCl8vb5yLdy/R/QAcUjRfuFs2loQUYakGT0SMjZ?=
 =?iso-8859-1?Q?w25L+eILex/oAyq/DjSDPQDmzfHRouoP1KBX/sOiHdZjW9Fi3m4iHET0Qc?=
 =?iso-8859-1?Q?5X6i1+vau7jWDlQHLpqCYp7qraZ/ETPk3mfK2+hzMUaDd/eoHo9nx2vRfA?=
 =?iso-8859-1?Q?+cpfYVaD8tGfqt4kvEz8SKL72jXgQB9TXgsg1DZDdl2xy/uuKMLDFYGEZS?=
 =?iso-8859-1?Q?cUenKYjg56QH94aS29T/wnkZcJOKogpRBY6RVz+F08TkD4R6BeuWgJgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b8f6bb-5223-4ff4-2f1b-08dcfa994c68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 17:19:10.0111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYa9eFurQeJs9Q7LDUP7arGXzNKok48BT1FA5Gw0nKS7frQvUQ0hRg2lHt56zk63BZ2ZrHwrYLxzC30GGd0BTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7669
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

On Tue, Oct 29, 2024 at 05:37:45PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Thu, Oct 17, 2024 at 12:51:08PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Wed, Oct 16, 2024 at 03:00:08PM +1100, Alistair Popple wrote:
> >> >> 
> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> 
> >> >> > Avoid multiple CPU page faults to the same device page racing by trying
> >> >> > to lock the page in do_swap_page before taking an extra reference to the
> >> >> > page. This prevents scenarios where multiple CPU page faults each take
> >> >> > an extra reference to a device page, which could abort migration in
> >> >> > folio_migrate_mapping. With the device page being locked in
> >> >> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> >> >> > locking the fault_page argument.
> >> >> >
> >> >> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> >> >> > DRM driver) SVM implementation if enough threads faulted the same device
> >> >> > page.
> >> >> >
> >> >> > Cc: Philip Yang <Philip.Yang@amd.com>
> >> >> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> >> >> > Cc: Christian König <christian.koenig@amd.com>
> >> >> > Cc: Andrew Morton <akpm@linux-foundation.org>
> >> >> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> >> >> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> >> > ---
> >> >> >  mm/memory.c         | 13 ++++++---
> >> >> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
> >> >> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >> >> >
> >> >> > diff --git a/mm/memory.c b/mm/memory.c
> >> >> > index 2366578015ad..b72bde782611 100644
> >> >> > --- a/mm/memory.c
> >> >> > +++ b/mm/memory.c
> >> >> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >> >> >  			 * Get a page reference while we know the page can't be
> >> >> >  			 * freed.
> >> >> >  			 */
> >> >> > -			get_page(vmf->page);
> >> >> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> >> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> >> > -			put_page(vmf->page);
> >> >> > +			if (trylock_page(vmf->page)) {
> >> >> > +				get_page(vmf->page);
> >> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> >> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> >> > +				put_page(vmf->page);
> >> >> > +				unlock_page(vmf->page);
> >> >> 
> >> >> I don't think my previous review of this change has really been
> >> >> addressed. Why don't we just install the migration entry here? Seems
> >> >> like it would be a much simpler way of solving this.
> >> >> 
> >> >
> >> > I should have mentioned this in the cover-letter, I haven't got around
> >> > to trying that out yet. Included this existing version for correctness
> >> > but I also think this is not strickly required to merge this series as
> >> > our locking in migrate_to_ram only relies on the core MM locks so
> >> > some thread would eventually win the race and make forward progress.
> >> >
> >> > So I guess just ignore this patch and will send an updated version
> >> > individually with installing a migration entry in do_swap_page. If for
> >> > some reason that doesn't work, I'll respond here explaining why.
> >> 
> >> That would be great. I have a fairly strong preference for doing that
> >> instead of adding more special cases for the fault page in the migration
> >> code. And if we can't do that it would be good to understand
> >> why. Thanks.
> >> 
> >
> > I've looked into this and actually prefer the approach in this patch.
> 
> Thanks for looking into this.
> 
> > Consider the scenario where we install a migration entry, but
> > migrate_to_ram fails. How do we handle this?
> >
> > We don't know where migrate_to_ram failed. Was migrate_device_finalize
> > called, removing the migration PTE? Do we need to special-case failures
> > in migrate_to_ram to prevent migrate_device_finalize from removing the
> > faulting page's migration entry? Should we check for a migration entry
> > after migrate_to_ram and remove it if it exists?
> 
> The driver should always call migrate_device_finalize(). On failure it
> will remove the migration entry and remap the original device private
> page. That obviously doesn't handle the fault but the process is about
> to die anyway with a SIGBUS because migrate_to_ram() can't fail.
> 

What if migrate_to_ram fails before calling migrate_vma_setup - e.g. a
kmalloc of the arguments fails? Very ackward situation.

> > Now, if migrate_to_ram succeeds, it seems the migration entry should be
> > removed in migrate_device_finalize since the new page is only available
> > there. We could return the new page in migrate_to_ram, but that feels
> > messy.
> 
> Agreed - I would expect migrate_device_finalize() to always be called
> and remove the migration entry.
> 
> > Additionally, the page lock needs to be held across migrate_to_ram, as
> > this patch does, so we'll require some special handling in
> > migrate_device_finalize to avoid unlocking the faulting page.
> 
> Or just unlock it in migrate_device_finalize(). I agree locking it one
> place and unlocking it in another is a bit ugly though.

Agreed.

> 
> > Finally, installing a migration entry is non-trivial, while taking a
> > page reference under a lock is straightforward.
> 
> I didn't think it was that hard once you have the PTL - although there
> is a bit of account keeping the same as migrate_vma_collect_pmd() but
> that could be abstracted into a common function. The advantage is it
> saves a page table walk, but I suppose that isn't that relevant if
> you're migrating a group of pages.
>

A helper would definitely be required if we do this.
 
> > Given all this, I prefer to keep this patch as it is.
> 
> Ok, I will take a closer look at it. Thanks.
> 

+1. Let me know what you come up with. This patch doesn't strickly block
my work but it would good to have something in to fix this problem soon.

Matt

>  - Alistair
> 
> > Matt
> >
> >>  - Alistair
> >> 
> >> > Matt
> >> >
> >> >> > +			} else {
> >> >> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> >> > +			}
> >> >> >  		} else if (is_hwpoison_entry(entry)) {
> >> >> >  			ret = VM_FAULT_HWPOISON;
> >> >> >  		} else if (is_pte_marker_entry(entry)) {
> >> >> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> >> > index f163c2131022..2477d39f57be 100644
> >> >> > --- a/mm/migrate_device.c
> >> >> > +++ b/mm/migrate_device.c
> >> >> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >> >  				   struct mm_walk *walk)
> >> >> >  {
> >> >> >  	struct migrate_vma *migrate = walk->private;
> >> >> > +	struct folio *fault_folio = migrate->fault_page ?
> >> >> > +		page_folio(migrate->fault_page) : NULL;
> >> >> >  	struct vm_area_struct *vma = walk->vma;
> >> >> >  	struct mm_struct *mm = vma->vm_mm;
> >> >> >  	unsigned long addr = start, unmapped = 0;
> >> >> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >> >  
> >> >> >  			folio_get(folio);
> >> >> >  			spin_unlock(ptl);
> >> >> > -			if (unlikely(!folio_trylock(folio)))
> >> >> > +			if (unlikely(fault_folio != folio &&
> >> >> > +				     !folio_trylock(folio)))
> >> >> >  				return migrate_vma_collect_skip(start, end,
> >> >> >  								walk);
> >> >> >  			ret = split_folio(folio);
> >> >> > -			folio_unlock(folio);
> >> >> > +			if (fault_folio != folio)
> >> >> > +				folio_unlock(folio);
> >> >> >  			folio_put(folio);
> >> >> >  			if (ret)
> >> >> >  				return migrate_vma_collect_skip(start, end,
> >> >> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >> >  		 * optimisation to avoid walking the rmap later with
> >> >> >  		 * try_to_migrate().
> >> >> >  		 */
> >> >> > -		if (folio_trylock(folio)) {
> >> >> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >> >> >  			bool anon_exclusive;
> >> >> >  			pte_t swp_pte;
> >> >> >  
> >> >> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >> >  
> >> >> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >> >> >  					set_pte_at(mm, addr, ptep, pte);
> >> >> > -					folio_unlock(folio);
> >> >> > +					if (fault_folio != folio)
> >> >> > +						folio_unlock(folio);
> >> >> >  					folio_put(folio);
> >> >> >  					mpfn = 0;
> >> >> >  					goto next;
> >> >> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> >> >  					  unsigned long npages,
> >> >> >  					  struct page *fault_page)
> >> >> >  {
> >> >> > +	struct folio *fault_folio = fault_page ?
> >> >> > +		page_folio(fault_page) : NULL;
> >> >> >  	unsigned long i, restore = 0;
> >> >> >  	bool allow_drain = true;
> >> >> >  	unsigned long unmapped = 0;
> >> >> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> >> >  		remove_migration_ptes(folio, folio, 0);
> >> >> >  
> >> >> >  		src_pfns[i] = 0;
> >> >> > -		folio_unlock(folio);
> >> >> > +		if (fault_folio != folio)
> >> >> > +			folio_unlock(folio);
> >> >> >  		folio_put(folio);
> >> >> >  		restore--;
> >> >> >  	}
> >> >> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >> >> >  		return -EINVAL;
> >> >> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >> >> >  		return -EINVAL;
> >> >> > +	if (args->fault_page && !PageLocked(args->fault_page))
> >> >> > +		return -EINVAL;
> >> >> >  
> >> >> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >> >> >  	args->cpages = 0;
> >> >> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >> >> >  }
> >> >> >  EXPORT_SYMBOL(migrate_vma_pages);
> >> >> >  
> >> >> > -/*
> >> >> > - * migrate_device_finalize() - complete page migration
> >> >> > - * @src_pfns: src_pfns returned from migrate_device_range()
> >> >> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> >> > - * @npages: number of pages in the range
> >> >> > - *
> >> >> > - * Completes migration of the page by removing special migration entries.
> >> >> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> >> >> > - * before calling this.
> >> >> > - */
> >> >> > -void migrate_device_finalize(unsigned long *src_pfns,
> >> >> > -			unsigned long *dst_pfns, unsigned long npages)
> >> >> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> >> >> > +				      unsigned long *dst_pfns,
> >> >> > +				      unsigned long npages,
> >> >> > +				      struct page *fault_page)
> >> >> >  {
> >> >> > +	struct folio *fault_folio = fault_page ?
> >> >> > +		page_folio(fault_page) : NULL;
> >> >> >  	unsigned long i;
> >> >> >  
> >> >> >  	for (i = 0; i < npages; i++) {
> >> >> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >> >  
> >> >> >  		if (!page) {
> >> >> >  			if (dst) {
> >> >> > -				folio_unlock(dst);
> >> >> > +				if (fault_folio != dst)
> >> >> > +					folio_unlock(dst);
> >> >> >  				folio_put(dst);
> >> >> >  			}
> >> >> >  			continue;
> >> >> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >> >  
> >> >> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >> >> >  			if (dst) {
> >> >> > -				folio_unlock(dst);
> >> >> > +				if (fault_folio != dst)
> >> >> > +					folio_unlock(dst);
> >> >> >  				folio_put(dst);
> >> >> >  			}
> >> >> >  			dst = src;
> >> >> >  		}
> >> >> >  
> >> >> >  		remove_migration_ptes(src, dst, 0);
> >> >> > -		folio_unlock(src);
> >> >> > +		if (fault_folio != src)
> >> >> > +			folio_unlock(src);
> >> >> >  
> >> >> >  		if (folio_is_zone_device(src))
> >> >> >  			folio_put(src);
> >> >> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >> >  			folio_putback_lru(src);
> >> >> >  
> >> >> >  		if (dst != src) {
> >> >> > -			folio_unlock(dst);
> >> >> > +			if (fault_folio != dst)
> >> >> > +				folio_unlock(dst);
> >> >> >  			if (folio_is_zone_device(dst))
> >> >> >  				folio_put(dst);
> >> >> >  			else
> >> >> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> >> >  		}
> >> >> >  	}
> >> >> >  }
> >> >> > +
> >> >> > +/*
> >> >> > + * migrate_device_finalize() - complete page migration
> >> >> > + * @src_pfns: src_pfns returned from migrate_device_range()
> >> >> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> >> > + * @npages: number of pages in the range
> >> >> > + *
> >> >> > + * Completes migration of the page by removing special migration entries.
> >> >> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> >> >> > + * before calling this.
> >> >> > + */
> >> >> > +void migrate_device_finalize(unsigned long *src_pfns,
> >> >> > +			unsigned long *dst_pfns, unsigned long npages)
> >> >> > +{
> >> >> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> >> >> > +}
> >> >> >  EXPORT_SYMBOL(migrate_device_finalize);
> >> >> >  
> >> >> >  /**
> >> >> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >> >> >   */
> >> >> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >> >> >  {
> >> >> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> >> >> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> >> >> > +				  migrate->fault_page);
> >> >> >  }
> >> >> >  EXPORT_SYMBOL(migrate_vma_finalize);
> >> >> 
> >> 
> 
