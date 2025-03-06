Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D94A54E27
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6010E9CF;
	Thu,  6 Mar 2025 14:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJXI93Fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD210E9CD;
 Thu,  6 Mar 2025 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741272552; x=1772808552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A3i3KSHvLjRwB8BzDnhTzixi/JwCkD4HTXt8Z87k8bY=;
 b=lJXI93FqjfYRU0TDrBbNHqisgwLLbFkVViWUz/miDTObafGgfXl+/4pO
 GcFmTpSrZ9iJa6+mwt9jGIrCnlfhRnO0ThkduaGvMjKeBlzmMBCAwhiLp
 wJatxZJ0rN6w4Xom4okskDcNL6nO/PCq+URq9u9THFFGeOo3WZYaU86kM
 +lLcaNelgkJVMGnUyNmxrCbgczpEsB7nsYYdHj/1vkYwjO6JTYLseC28R
 eymYVdfni3BBkJcQgtYE8fhBSBzK78UAtzBLcUsQfUsx+zJ+T3QGx4GCy
 ii5lcG7CT97HuWHPqDPNpZY4VASTkKX9u5CgM7s30NPIiEbo+emsvJoYL A==;
X-CSE-ConnectionGUID: e/kDXvCITR2Vgt3cVVmluQ==
X-CSE-MsgGUID: anj++/BrRmq4BzV+g7CWeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53269983"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="53269983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:49:12 -0800
X-CSE-ConnectionGUID: MYRENQIOSRuSHsXMM842lQ==
X-CSE-MsgGUID: sdQqyLPmSkSNPv6SkjkNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119714521"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 06:49:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 06:49:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 06:49:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 06:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8vNDcbeneJ4+KmnPwKkjSETlA4JabkwW72A4u5/H4LUhDPi7wPKBFOZAd/xpkVQeuwCSKDyjMa4TvbbsIVmA9NiUhQiZh3kgMw8CgN9t4tT1Drs6W4SaSfJyTKBbMw5ZKeYN0ZKjQ7qWSKmodO5DtlPvi77fGMaEc7bKDmXs15ZrWqu2QHrK7rzRzAbH/NtOb4bXxZX2K7CFp//mftIuFgWbDoBZBUAxwHumRpeb0eZ/3SVj3rUKhBxWzx3A0rRjU/yTgiABpSHo/nVpcdfKYl2gjLJSJccaDuIF9cYW41XvQa4PTB0EVkGlr5ptakcuPOU/CyymJ8DFgmkoJaihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3i3KSHvLjRwB8BzDnhTzixi/JwCkD4HTXt8Z87k8bY=;
 b=tFVgmHLaowbugCNoglDpvwtS7G/IgOAZHHzUFPW6pLd9FAA5wSvF5PvDenlDshA9m8yvPo15Txb4V6Pi0yZmt9KWfkMshd62PfEPVN+KnuKPRtFqFGcrhyw0/mriDESnGAI4cG6D74Zu71C+es1Z1KfRPCMutaVw7S0vvH/nKIwLN+QP+47fSwfxrXbMMWSTS/4lwZv/mqf4aUS8nROyFrLuJiMTi2yqGpeWZvUBentFzPdiJQ/zJP8SVj6OEq+qpRODbi1Q1y5uJGNi5bVeKI+qGnDCdeId4udI5WtH9ESWiYbeC8lJwKcMIky89WYx+Iiifbev7rJ8IKij3mul5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 14:48:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 14:48:52 +0000
Date: Thu, 6 Mar 2025 08:48:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <vwvpdshuoxvqzw6hdwofh3b5tgm5k4rldytcoidqdldhkdlmh4@epxun47qrzer>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hf7pN84-64LWPv@smile.fi.intel.com>
 <9f0215c4-62e5-4dfa-8dac-732682600c8c@wanadoo.fr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9f0215c4-62e5-4dfa-8dac-732682600c8c@wanadoo.fr>
X-ClientProxiedBy: MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d8f40f-2dfe-4d25-7fe3-08dd5cbe032d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eHlF8n527xPu4iJCy4IcAC2O0P03RlSiVkImhDl0cotinDpkwH6B9z42Zw9c?=
 =?us-ascii?Q?3XlhAAIhQg9W6XbD6PpKS3G7oezlxp62j0UyZCZ3nbC8a1PWTtQddtE+vGVh?=
 =?us-ascii?Q?AZvTKb2aPDy1Vt7V2c+vh/cm3F7GCPgG9hRXDmF/lfB/sEk9wld8fh5f6HA1?=
 =?us-ascii?Q?sfzilsUx4ZPC6g/4X1Fi6bkD7caMSWuuLIfX8aSbuP+RrdVO8d4AuKC8mS/r?=
 =?us-ascii?Q?jvbfC/f6VtYxFaEWGkuB59fW9edgRz/3ai4p5e4jbxeEPIDwfEcM9vVL/BZ6?=
 =?us-ascii?Q?A9lEe/U/e3U/IeIjcXBi4cxj3plQes52F4Syg4VNL2KUb6/FkK7zYFHLywjE?=
 =?us-ascii?Q?9zghZ/z9nDDwkJJIwPM/5YfdlLrtU9LtOK4kz8X834yn9kkMFN8EMCaw67Lm?=
 =?us-ascii?Q?ccfBCpRWIe/tMTeSumBHvr0z6+mDaj02hdvk5n7CCgqQD4bi2utkiOH+D9UD?=
 =?us-ascii?Q?xe/4krCrweaM63mmojORmWxiOmRcvdREoHSeRR+Hec32pDPMzsVn/e1UC0/N?=
 =?us-ascii?Q?QoloweV8Z1J3vdHfH7qUS8n74bzWE5eazILorZKTKoQ7Yni8/Usxfmkqit45?=
 =?us-ascii?Q?KBIG9pkzSbcI0u9Y1QCc1VVPXWUPBNB2G3xmdHB1mJDgJVcE+L6y2xhFjhVI?=
 =?us-ascii?Q?bJ5msMPWMBJVXDM9NBsW/FQ0ayTawzGMsWqX9EcjLNhmHweflxWeWb0Rb1qZ?=
 =?us-ascii?Q?o3DJ4RK0M843KFZ9mr3MlGaXlG9luLJB2Eu/lFlfUygGojCnWfXdgfrNaOM6?=
 =?us-ascii?Q?7etgikItYolWD0a4mABb6j4mYGUg07wQGlAC6NiXlYlyc9+qTONtHkqprdnJ?=
 =?us-ascii?Q?Esfyp4yAECJCiGOh08f34y0++y6C0vEsmJxscBBxwqxV4CpNld7TVApcfkk3?=
 =?us-ascii?Q?ipfYnfreDB1Htff7xVzQuO9nCs8T0YUWXqrGu+N4U9DkrVzrQhQ6OFyEv2gP?=
 =?us-ascii?Q?y2D60nh+jY45y08wjTnSM69w+FodD3Z1wPKsghTD2vSf+s8SNaLdLGE6DkDb?=
 =?us-ascii?Q?x6KlDybUC1SoYSTkQ5ALYSgSWUkDW0pdDL7XTyZBDnOizwVqJ4LyFCbYlq5N?=
 =?us-ascii?Q?z6uFA+qYzQXDr9tH4B873Wg3VQdzitkLIolG8Re1muNOhq4tIfcuJI2Lk/1E?=
 =?us-ascii?Q?7btYjn3Fql2DWNclPfe5P2FNFtgOBZpMNEyfxDyd47r0SoBjS9wv/dc/PyFh?=
 =?us-ascii?Q?6UXG/evq+TMWLb2Ho0dKB48sM7MeUyeIj9m4IzGQXDxyOjIw0Kej7OycbpLg?=
 =?us-ascii?Q?LNhuyVtq/L1s9C2ZFkiKAgjxqlNa3dObZu6FwBODOK7tZNLV6aXFAsBQ3T8m?=
 =?us-ascii?Q?1rHewhkTSIPKXRTmJAoJQ+F6RMvNpUzRLuDJkA5RmkMTe7g7HfSTMhm6Rw8R?=
 =?us-ascii?Q?uVcYFg5vEv4UHk0QsgiWGS/zD16t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opz80G80a9RhKb3CLMMCbopm1mh5ADr5805jI3dahqwK/A7wdspQBo3EBNmS?=
 =?us-ascii?Q?yrwWG58XpIoJGFczDs7EmVelmTIp+i0gFCtVDbYarEAMzdJBL+Vt41Ox3Z39?=
 =?us-ascii?Q?4ZHYGoYXWIZaNrBSAWMB68jb4WTMLFxFj6H5vn5RkLcf0alRWhlgrW9keZ4y?=
 =?us-ascii?Q?mdmz8J+pEzcwFXHpC0ACOTEaGr4IjptW4vV1NlR9tnXJW1RgUcBMm8cTNt0q?=
 =?us-ascii?Q?PZrj+voVwYvdOWz8srptz/YXNjoOiIsUqx6/Rpf6Xu2ynuxz1/HVd9A48Ftk?=
 =?us-ascii?Q?h5ZYo22fme7k49McziLvUfHdXPKqgyYjAtlNzDj4rMhRQcAa3ppeE40dMNZI?=
 =?us-ascii?Q?Y59/bi7RViL6J8Txy/Cv8mpoIsK+vKTZLgr+1hDtxVMWDw/XMc/LqpDd8W98?=
 =?us-ascii?Q?WGHNA5SYRpTjj9/aXx3b6Hpcik8pHxg9zBFYUYdD6BdbzPMLA4hXp2c9E5IS?=
 =?us-ascii?Q?FAyYTZl5cI+p80Q2ak68k+n5yIOCOoHD9Yw97vZnsvOxZExCyHj8fKd1FcpO?=
 =?us-ascii?Q?6VmMNQ7Xc2T/GnSlBiD4S57fMsViN7WNliDNxdVT0myHNoc7bEG5ota0EETr?=
 =?us-ascii?Q?2IBq/PLX6SNDhqLM2n8aWGAxIOg3hFLwsB+i1qGHfV80AEO7UHZ5i8kOORv9?=
 =?us-ascii?Q?vU3nkA7r/fSJl+BX7QGENzQ5N9j92KbYgceypmzzGytmB1VzHquvLEyRubrs?=
 =?us-ascii?Q?raHiAcgWmk1JuWCorJMCdHsmqOEqP7BIKQd0RqSvO3eARbBpp0+xEcWMjgEW?=
 =?us-ascii?Q?gIUT/owpevUf8AwuJVMFcrJiCJrZwI/KaS1imie6o3vrzOHal/oxTxmZyJEX?=
 =?us-ascii?Q?romlnHiEGgyrZ9un7yw7vBzFCr0zO4dGsRLVkzsBgZvj1P4kjq5GvobuNdFM?=
 =?us-ascii?Q?3maA/JKsDxj1wb7PVoBi2QEaAjoh8LwD7mmcd63DsE7pQb6iFB/RvdIHIEhD?=
 =?us-ascii?Q?yQ/fnTGSIMScHv3WEPr9oxd3jyBM6qFN3xgu+6WI+TokfzY4BP6sLBa3Gtrb?=
 =?us-ascii?Q?EeP9Z9+I+cILHpPModoW3vKJoo9puN2Plnf5ElbX9NvS027HfHH3eHuEiWSR?=
 =?us-ascii?Q?Q1kq1cs4+ExmhMbmU8JbcM4Ro3jonOH14oY+bmJ46H0F2uyAF690uiF+sWaK?=
 =?us-ascii?Q?Xgxuzmq62H7lvLFoPNX4dxH84QNtUHEziq+jtf5fLXR0ZAnMWObv2fLp7RkD?=
 =?us-ascii?Q?x3zszXzhkjG1se+s/RCdHe0xpRFZs/6gGuqC0zBO91kixxt5WoLadodZLIYL?=
 =?us-ascii?Q?qxZm7/pdGX8Fy+M6NUMed9NO/JQUxN0mzqmWaKDFDs4ERByS88ZQlBEl22r/?=
 =?us-ascii?Q?r6XqzSV8Ivq5WV7Z9fPMsKUvFDWd49dTDmejxEPCEvQSpBpdshnS+C/GbdMS?=
 =?us-ascii?Q?tlKn4FiwwVKfARAq/r3qW1Bw/1QT8MwiOG2Lacu6Mfl7/NVd/Fj2U5Kc2eAh?=
 =?us-ascii?Q?Z/MgBQ8qR0Jt1xdOlEz4rkZhIafOPerKXegtefxk4/wJwy5T6xud4pRq2GZK?=
 =?us-ascii?Q?lScVaCISmZCxZFSSa5iLE+BnjhfKgHwCnFNfXoMGXK2mIPcuRU+dco8zZF0+?=
 =?us-ascii?Q?M8nWR9SyX/UN940hDIw1fChXH9TctDjNBRcahWt3YK5ixJHkxst2SSBxPV/6?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d8f40f-2dfe-4d25-7fe3-08dd5cbe032d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:48:52.5475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEw2Co4/PcmvBYW+2B6oENDLLnQ26VGN+KfSs+sUpqH29/pFVIP42AnZrocQn5cniuNqkD7F45kdSzE8+me6bTb/2m1t4guqipBFpY0KdUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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

On Wed, Mar 05, 2025 at 11:38:19PM +0900, Vincent Mailhol wrote:
>On 05/03/2025 at 23:30, Andy Shevchenko wrote:
>> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
>>> From: Yury Norov <yury.norov@gmail.com>
>>>
>>> Add __GENMASK_t() which generalizes __GENMASK() to support different
>>
>> Is it with double underscore? I do not see it.
>
>This is my mistake. In an earlier draft, it was __GENMASK_t(),
>meanwhile, I dropped the __ prefix but forget to update the patch
>description.
>
>> _t is used for typedef simple types. It's unfortunate to have it
>> in such a macro.
>
>Ack.
>
>> Perhaps T or TYPE will suffice. Or perhaps we want
>> __GENMASK_Uxx() here?
>
>If no objection, I have a preference for GENMASK_TYPE().

ack, GENMASK_TYPE() seems better.

thanks
Lucas De Marchi
