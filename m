Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BBB1882A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 22:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D5110E8EC;
	Fri,  1 Aug 2025 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBd7bGWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0310E8EC;
 Fri,  1 Aug 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754080418; x=1785616418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/na8d/9LlyyIJsxpL9V1ycGyYChPR3VKNFwsfBUdvwA=;
 b=VBd7bGWQRtOViBJgsNskyt9cqu6iuT+adtdh0JnENgh8tQnRNZAWo8bB
 dbWUWdr6mI6oBAG7JCvp1FpwFnyQ6IURuUx1rZB3d5Bg157qdKB3SznFg
 aOw0Ybg7Vc1JIJcAvfYFag+gJlXRCd7eOyRDQW9N88Re9CCtBsPpBQFO7
 ScASt2P5ixyfNy6WRqPOoMXrSLZ5waqXnRJwDZbyXO8JGcEp3vaMB9JBM
 d3H94rJS9O2EWmJrErBvnfTuDopE1keuCi+YIxF5VUQCfXPQA/AL49eAz
 PsKgdc+KH0VeezP6sVT+EaNtrRnSFpIoF/+C9Uziap0kN6liajtHNekva A==;
X-CSE-ConnectionGUID: OqazWvNISRiZ377uHFxM3g==
X-CSE-MsgGUID: 4GR0tVeARy2XnlJzlbr3tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81888119"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81888119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:33:38 -0700
X-CSE-ConnectionGUID: RtZPAFbNTJihh90sJtRUZA==
X-CSE-MsgGUID: hTztcfz1Sq+QNViRY0X/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="164041995"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:33:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:33:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:33:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btEnJLuSEQxYy08InGvJ5gJs8Kv33wadIIlS/LXjdCa/ZqOqqJsx1RKxhrt/5JInYZtGC502/6hFwLiA9NhaGUtaI44PTqhf44K/trgySA9Wa9ky7mwsD3Tem0suUVoDOsA3zGbRds5U7M0TGunBg+TGw9Ra3+kg7aVvVJ2NhmZPjcKaCKsDxNN5GUfa5znn/fBF5qRrax+tOa22oCilyDGsJwMU2f27u91DJaxgir1Rdmh0u7oB4KN3X1SrbxA0bFgME/1Af4L67zSnJd9BIU8V2XW84+KduaqeYqJjCyaCd1X2uV6oNOsaMNNGyq0ySAbXEdeFWRNJ1dlRWqNclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGikSBPxM7GxhVjfX/tXrzq4etibn76MHdOCiaEKZSg=;
 b=eQ4tBbGuyttJUvSuvR0wBnhNJim5oDWm0U4nWbsqBxBahjYWHbhvmBtc0a7BV36MMXA98pgEWtw3pCW+y0BzvvcJUUx/Ng0bM6hL2bGEvwhz0ifUBk2ewne3h0wZ5wX84HFMx9/q6OSirY6fehNIHV6b9pjKro032UH2ZdVmHL0dfnxO5+2g9K4MIMRHu4H5Fy6UJTP6jqhRj6d/4APEsHAcRpofBM6QEjRbiX6AKDbd1BnZ8w1lgrA1NMstNePgIXmcbjhq+MjC4sJ37GZDxJHUyBwWn/4wqOgIiE6ZghS48kidawmzpt/T2ABLa0RV7ve1+83aUtK/h8a9UAmIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 20:32:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:32:54 +0000
Date: Fri, 1 Aug 2025 16:32:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/i915: remove redundant repeated checks on err
Message-ID: <aI0kcelkFZjHxU72@intel.com>
References: <20250801151705.2432911-1-colin.i.king@gmail.com>
 <CH0PR11MB5444A54DF5DA955CC30A8FD3E526A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444A54DF5DA955CC30A8FD3E526A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 51468373-b079-4a49-4a01-08ddd13a97d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hBcyUDVgByFlKj5w8Sas8AxxVVQlociRxb6jf2EgjkHpo428SCIAKeFFn281?=
 =?us-ascii?Q?M0r9Cg5lMGrE1UXaretZd/POohNHnQukgAUKuOWlw1V2nOdUSg7iWIjd8K/E?=
 =?us-ascii?Q?gElT31X3rrSgQLAMzAo67jCUoLVnYs3vsprLD5V7Xt3qN16x9Z+ji1n0XekK?=
 =?us-ascii?Q?5wjW6ftrHRjSLpbRoUH4A6cfX76gsq4izLN9r5JL2CK1pnKPSnt9GYiO8Jb8?=
 =?us-ascii?Q?1EH15ENThyXIWvHlM8RAT8ZpusgDjE6vi4ny09bDDWK6npgelm03e1fcF0ui?=
 =?us-ascii?Q?q/99NqYNpoabeoBxYyDwrZSImhREnnVg8sqWlszOBI4NpV9NazdDq69p4FXw?=
 =?us-ascii?Q?7n6kHU9+wLji9IvZH8l3adJO0wPbJqB0jj4TAEE6P56t+rVubmmnDhIpREWi?=
 =?us-ascii?Q?Rw2Rp0lWqcjVJEsgMb2l0ne1vZZ1QNGDAJy0Wucdkzhr6XFruKfXXG7Gvlcx?=
 =?us-ascii?Q?IDeeOnfZUHHYfZbNGyAK6nPKl/+nqP3eH5EBbhxzRHgC3qWebhFhGkRQgiBj?=
 =?us-ascii?Q?XAyg0cRjSqE48MCNLmFbRwhH6gMQDhrSfAliJpiic+P7fVp+rLR1+4TPZFHU?=
 =?us-ascii?Q?DwJbpeVPQuP0Fqpq06Odq9GC7X/L5S9Z1ERjFKB3BugkRNRIUcZZo8LqkOQT?=
 =?us-ascii?Q?uIWVrtPLFEAqxzW5yP6x3Y0i1FJJ4XU7UHFw3vmwpKCVwECae1hRWY0dOT2c?=
 =?us-ascii?Q?0cZjN56BeP/ZToRmlKxHY93Mx5booaG2jHh3fZTBBjw2yWYILANRLo8u2fdq?=
 =?us-ascii?Q?CX6Pz56vdSFFhov8QLvoasYrq7mBGlv1QmeemfgO1QiHzo7JecYgWVqPSEUk?=
 =?us-ascii?Q?BuWk/1MugsLr7nerxsTnh4pDVGL7en8eLwfv7su4qacp5mKV9mJotPERmO+3?=
 =?us-ascii?Q?1GMjkg8YAGYbBbN9f17FP9UPBiiEHwokPUWJZoi82sBlMM3Gk+4TJ7Fct/WS?=
 =?us-ascii?Q?GZXcXW5/lBww3vu3HkMmkOeQwUZqYI9AeohRBHXFbkTHapIDrUIGpPxfB4Cv?=
 =?us-ascii?Q?epGJ75HI7oZ8fieqvPSicdRi/bzUYsSHLkBgowNZZZGOhbfoZRKJqoWgJZsp?=
 =?us-ascii?Q?440ELKE+ZhEN8V3zgvqs5H8ODrlL4IrE4j72s7SrtyDMYLZ4a2dJisqACD9V?=
 =?us-ascii?Q?vNWTzZ5RtUu7w4VrVPNb61nu25Jc39SwuBwVfy1lLni+bOmjrhiIeQiKiwYf?=
 =?us-ascii?Q?1zPOb/6xGzjo5OqG1uUhbNBxPVNJLTSO0Xo5lTDW/3aWRzs4p2cN1dWo4JKT?=
 =?us-ascii?Q?Gj1kpQPAWzgsR9Gx8GI+aTvkx5HLX5bfAYvgVHb8B2T6DczQVaaMgz0XPASS?=
 =?us-ascii?Q?8w2Si+MXys4d3qjoy2lDiQNvSGi+Z26xqs/DI0W3vozbx+jhvQ6EVDO27aYj?=
 =?us-ascii?Q?vEozHYp2pOzWabpBtwKCkOsVc+75Qn4kfzHVWAI+Q/2UxiaUNGc01JzKNxPC?=
 =?us-ascii?Q?VkUg4QiE/mE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XzhAGbgGN0EPT3tqjU306FeYAWucj+r80rVLOOYNc7dcA9TFW3XTVaxyuEJt?=
 =?us-ascii?Q?EHVL6wcO//8HjRPg4CyN7nfS655x/vIrsi4jbDiBBSQzSHIPAx4boX4/1hZQ?=
 =?us-ascii?Q?LuAej0A1Hs/GT+xUS2FUOlk6MHq4lmD00VUl4BisokpBeqyzWGLasXatQ7PX?=
 =?us-ascii?Q?XoZXdRsFeQyV3iygHqCfss6GuGMmJjIebxCnFFZRL1tmIDfD6tSklm+X5xwV?=
 =?us-ascii?Q?uwds8s740s6Wt3+R0ucJzHhvYC1a0Pu5YN/eeZcBo2EZCJ0imHHsZTcRepLE?=
 =?us-ascii?Q?fkb9k7+WWqU0P7l5v4fTI4tprFbMXmTu+FLng15Q8LUZRhng757kzg7PD1C0?=
 =?us-ascii?Q?ldl6q+9diIiUe1I2Ha1felsciSjk88mh14CG+rXEdxu14YgjpWv2ZPVOgmpJ?=
 =?us-ascii?Q?wZJRL1L7RuTZvTDOTS5PvDSnA/Zhx+6IiwmnzJ19FTt3iNCd19YEykJ2W+gW?=
 =?us-ascii?Q?krTtsL3iv8zNtSbNxth5GN2N213W/ACSV1L1n0OFGTO/qkoreuVrKSYnIGu/?=
 =?us-ascii?Q?DR4g8xjD5D13qtNBteoauU49toQkJKZxZhM0zohhRZLn3eMiSbHJy/cszUzy?=
 =?us-ascii?Q?iN88SH6D7vnLoduJbtjs7deOt9nf0f6IPnzDOZvpHTixjyJE+SOD6EtYxJt3?=
 =?us-ascii?Q?HkVtcIzV+ORP2FxM9921fEuU2xvVM50kX117YOcO8cdykBB5/0+zt+O5HBll?=
 =?us-ascii?Q?X9Uo4OMks2Ry1yU1nGBEhQrOG4DMuuuqzGHmukWGY5bCjBQSTH517LCTgh8Z?=
 =?us-ascii?Q?68mkkSaSlYivF/BpqgzTXJvXl2OQpc1ziS38LrXRflSfIas8uPyUoSf/xuwZ?=
 =?us-ascii?Q?waG9IY+hZ2k3p5parQ1e0GB705QTjCSx7FaZB3SLxZfJlEe+zuWDsM2prFAJ?=
 =?us-ascii?Q?+0/VUf2r3guFMmX7FnOFyRSbpCqwBjIQt5PyTQiLviArU1zlXwCsCFw5ymcl?=
 =?us-ascii?Q?VT7tJAmwEkpU/sx60JJzDU6VT8uQS4nPIjJ6jvEk1GoJauNUe5QhFWekI6Vw?=
 =?us-ascii?Q?xn9pLep4T2NZWgwNsSqGcDZsUL1LINNbs4TFt5+gtsiOxwtrt2MTxhY4HafL?=
 =?us-ascii?Q?J6qQ4uGqjp06DkrluH0pZ3HOP+o1EdASEp6FXBp+muyse4JuKMsZI4csoKxn?=
 =?us-ascii?Q?I4r22KQXg57AjrzHLX+Vd+k7zNm8DuF7uSiC/GFbxtx8tpP96nMrMcRwCbO+?=
 =?us-ascii?Q?khlxww0oZLcqgTuJeoQgHf+K9E7CZOiWj9hZKX/gKa4+UuF05C+ult/wWyRx?=
 =?us-ascii?Q?3VEgLMBCfuClBr5QLQIEzzvRsF82txYeB28OwqwMMgBBOcyClQ1MEyo7Cumx?=
 =?us-ascii?Q?RSFboEVt47N+u+ZaF2Lr8iw3cy9mnr3MsxuwpLx4NyS8cwAQihAg1X68aoW9?=
 =?us-ascii?Q?frcyPVELe5NfRHai9haYxlLxBjNGzuLqcuhiiSD3iGOyuh+yAfASuVGt7GGR?=
 =?us-ascii?Q?C6GDg/pV+fWwYh3tsPvgoC30Ml2l/2QGrMofCB9NniyB587fYoK9WwmryGEX?=
 =?us-ascii?Q?A+SQoBJ4n5ltjpfAiwNWjgqym7Bi86tXttkAjHXF6WPW4koyN1CMDHWm1ubX?=
 =?us-ascii?Q?dxl+iSjztLxZMPVAoWl+960NZo5iXU7kAT77Bi4xnvPwlJh7pg8FCT0T38iT?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51468373-b079-4a49-4a01-08ddd13a97d8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:32:54.4191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHbUHm2+vXRqhWxUa31VK1F5nYXCPTp8JGQRtm4MBiNI49f0p/eMmnSWKnqTR22PMj9u3nNLegRInJmezMlBzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

On Fri, Aug 01, 2025 at 06:26:47PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Colin Ian King
> Sent: Friday, August 1, 2025 8:17 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drm/i915: remove redundant repeated checks on err
> > 
> > There are a couple of redundant repeated checks on err being non-zero that
> > are always true because they are inside a previous check on err being
> > non-zero. Remove the duplicated checks.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

pushed to drm-intel-gt-next

> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> > index d8f4a10d71de..3913b48cece7 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> > @@ -142,8 +142,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
> >  		if (err) {
> >  			if (!silent_migrate)
> >  				pr_err("Object failed migration to smem\n");
> > -			if (err)
> > -				return err;
> > +			return err;
> >  		}
> >  
> >  		if (i915_gem_object_is_lmem(obj)) {
> > @@ -161,8 +160,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
> >  		if (err) {
> >  			if (!silent_migrate)
> >  				pr_err("Object failed migration to lmem\n");
> > -			if (err)
> > -				return err;
> > +			return err;
> >  		}
> >  
> >  		if (i915_gem_object_has_struct_page(obj)) {
> > -- 
> > 2.50.0
> > 
> > 
