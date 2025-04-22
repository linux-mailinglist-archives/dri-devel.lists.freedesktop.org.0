Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88859A97064
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF6610E5C8;
	Tue, 22 Apr 2025 15:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hojl0CKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FEE10E5C2;
 Tue, 22 Apr 2025 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335276; x=1776871276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q055ywcP/3Qv0taDd/TuoCvK0Lxcap10TBjtJAu2jws=;
 b=hojl0CKVbbXd6gESkr3PGm+JV0FoXORSZiuuNnT6/2rPWaEC+vDWDlyd
 59zaB1Rv1ZIXS2wJ0erzZv4OHGzMWTsHbTb2/w8bGlmJy6uM1a1MI/Tjc
 gs4AvvUfdEgSN7TNA1AcH99f2HK31GHxaWmUBbw5hfkG07xVdsnCRu1MM
 gevEsZmuiKw2q66ni5YKXNi2V//d5h1pzIOAH5uPuY3zd2V6wdC8yEiDQ
 kspQQ30rEA3bLBNm7rWqa/MXTWIUG5hEgAZyVXZUHXisPLw4We1pDVPZb
 LkN7aOpUnqsFJT2Ex3Bluqng4VimhiOgRbGZtwzkZvZUL7TyaP/Kx1K4w g==;
X-CSE-ConnectionGUID: 2uv8CMNXSaOXPS51voowcA==
X-CSE-MsgGUID: 7+jMKYA+S+KqGE2u8LR7+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50729665"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="50729665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:21:16 -0700
X-CSE-ConnectionGUID: Q3C729ymTpWmiNMoYgR8CA==
X-CSE-MsgGUID: KeG4LRQMTb+p4QcuTgRgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="155240464"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:21:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:21:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:21:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEm5kIdcWfiBZepgrbDPM0YtKnlKkhvM8Tx5+8Y2sxtX8xyapqm09JW3c5SPaav8zpZGDygrSqM5XI17kIrc/CW8ByZRbE6kaTQyI7R45V0nC2VDVnqanIP/36PmselPAlEEyjy2MGcD8XAWI4LAMg91+LOSoDfHiC4ecfe8n9auVNuD3lOzgtJnvv1DjoPApYojLnkmY0M2C+L4Ypyif6e5MkmEyVsFls4gyqFBc2ZV6IcmofR5FH8/6ncXADj1ZHCktgR+Qc+Rc8Eiu3uuWNchvW8vCSq7LVWmti/l7j64qq1svL8nk1RTzJiljFHn/P5+NRBfT/fuNURmC2JGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGVyB1/yhgIlHwKE2kyTctmc/Un5UNvT4yRJOU2q58Y=;
 b=P2LtPqamLVYRbumO4KYpnzpciU2/psrAy/Rb7N0m3qSllPfGogB2RR4B7H8hS1GoA2v7KhM2jPcrnAWafb5dhcWAmwzn/a+lfNx0wJrmhYhsG7wHMNUDumf3gQ/p+a4PDSg6Rn2h76s/1nuEY786t5xM2b+2dRd6e2z7HMeWttb6JuORh6mDB/QP4rNFQBiOLFPiCN+Y5cha7If55Wg1hq+dFiQYDgT8IwgD/E7pzhl412eGijflU0D9W+tAwu9KcMZfHNgtxEXOr59VA4zk4Sp+HfX70GYnTBhIqVXjMBjWHjgZvLLrxgRFp3BdbnjN1niwe9UdtoVCEAy8RE1/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Tue, 22 Apr
 2025 15:20:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:20:31 +0000
Date: Tue, 22 Apr 2025 08:21:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aAe0EDNvvEhgAvNP@lstrano-desk.jf.intel.com>
References: <20250417041340.479973-1-matthew.brost@intel.com>
 <20250417041340.479973-3-matthew.brost@intel.com>
 <85da7210-3d79-427d-8199-e852cd6a16a4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85da7210-3d79-427d-8199-e852cd6a16a4@intel.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: bea6471b-dab0-4956-479d-08dd81b13857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eOCD2dn3GWKjyquH9m5TMkJyk92P/sn9tFBpMCac/abJd/tBSi/DrD0QxyIu?=
 =?us-ascii?Q?xZN497ftEL2A2sKYA/eAK74iSyPOstrws9A3EgGA60/AOPwTOPmaLyMjYL7u?=
 =?us-ascii?Q?eyjy8ENt0s9niChOr3UUzyBG3fWewy29GCwJ+b1tOmcT9aZopVqAnKMsHMCZ?=
 =?us-ascii?Q?25hOXnAd8A3aqVvuZ+ho6jKOo+hmmEzSsZUh4ve2YWTn7bTyS0v0Ot70kEmk?=
 =?us-ascii?Q?Kkqk7HVHtaujFRt0ZfnhBlOrpQYMG27ytPNHyKdRcwWkNzj+LB0Nz6QgB29Y?=
 =?us-ascii?Q?EDGLVhci5ndCnM7h4jiahu1/T2KmUUOfl/M+JLNmvojKjYF6zbiyXeXIvJD8?=
 =?us-ascii?Q?rCq1gnu9mgFnIEr46AYw5QsjN5MUtE4UlIx9//VWm56En7FbI2Y6/RCPZILp?=
 =?us-ascii?Q?5g0TOu6VXbQeuErl0CRTSkEZfTKz5dLIMSJXQoahp5SXoQkUAFBb5dKGXO8B?=
 =?us-ascii?Q?bm41skWNG8D1nkrPOm0yhqTiTDQuXDajKBbLlhUBQVfSotfqkLfWsqBMnVZ8?=
 =?us-ascii?Q?ULntXO9i/tTcCe4zhgJ+L6ttKI9WB2p9JH7P6zypWC4beuuDNf5Mx6BJ1SBJ?=
 =?us-ascii?Q?YMHNFony20blN5Lxy78JjCvJY2RK4kBbt+s30wNEkVQXOryWKO++ShkQIFLj?=
 =?us-ascii?Q?US5hOOEBhuM5i1jqav+SaI/RtHaD72ez3f3LJkwf93KLTBmGj7bfXZKj0H1v?=
 =?us-ascii?Q?UVLLzZXaZaGVFAY+ARKGKF0fr96Wtt0c3MSjOiUlKn17MzWZ9WLRi2+Isch2?=
 =?us-ascii?Q?fqPBYO5weXiPi75k+ZMH3jnbqSoY6IFD6xp/FneZxOoDgCChczrv5ynV1teX?=
 =?us-ascii?Q?GLGLy96WyUAI6Y/R09n7hKBIz4AO8itSi3tS6kn/l3vZAAXQT5knUlWhWHLX?=
 =?us-ascii?Q?6sP3h8g9Y9zCO2v0fnRtwqv6/xwyBnqiCm/mhIcxJ7ID26wxmCPOKYr+RzB4?=
 =?us-ascii?Q?b6S1vCcJrcjFXZrV+RUANYDZLMk5mIN7cUoGwrrBKY8PUqhIgy8C5bqYI0YO?=
 =?us-ascii?Q?Pp/87MQOl6nzQ8dsO7mVwLeJDDp7HGk9eABs+B0p132xhzYVQblmOFYuiRaZ?=
 =?us-ascii?Q?XrVnDYx3/A2HzBmam29rmGe9YvMPQSGW3mCTobrk431k2to8BXOfa6JZKCk8?=
 =?us-ascii?Q?+DWTRcGx7juoYhIPWVbRH2agU5umJJ+bHuZIUBxFj7x9rodmz59paV9SAVOv?=
 =?us-ascii?Q?bsjyI2CWlVi/HilNk3vB6c8Hqe7u2g66MNQhhITTg5qRFdko10TfleqtDkir?=
 =?us-ascii?Q?2Kdh3doQGtvNQSQCqrTxKT6/3J4CLNAemrAgmBC0cQrTfwQEK0LWL4n5Mzw0?=
 =?us-ascii?Q?Jb3KaS9s7vj0a6N0CElfPkoRjXRdUsKU5fzhL1S5uxs/udbP9d/gv64dPtOk?=
 =?us-ascii?Q?mEVlInYXWKbbl4KXVjKMt9n6WkMTvrgyKAGxx/4hiZ5Dh/pmzV8AydsC5ILC?=
 =?us-ascii?Q?8ThaT2a+sf8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V13UcrZViAUhz0llOJEuYK5hheOePJlH93u+lDAxQ44Zmo5Odg4NCjBx0GDa?=
 =?us-ascii?Q?54vky+0D3pylj1X3z8b/WWKFik4WZW4BQZaGAy51DjhGayUrlvbgAbwTLm1r?=
 =?us-ascii?Q?tM14TLRk38IeXtbMlpqYqoxL0seeh1X1dXmh2RnYXroWkLAK1XqQDXV3ih6u?=
 =?us-ascii?Q?qHxUmo6ewjL8hysIKeIBCSGq8cHARDMceiEFizMwQJErnKP4ABW6uHbIGn71?=
 =?us-ascii?Q?7R8muhfa+OBnHRHp5rrfMs2ntsFM5A8L6d5yc5ti5ymqSqfHeedSW/3e7Jc+?=
 =?us-ascii?Q?k5fAgDaMywJcmrxS+XdGlaaKaqybhJlc3Y7fi0fKq7eW0GRW/NaViOIFbix2?=
 =?us-ascii?Q?Z57PguBb8Srzq+7tpKbmXQU7ks4rqTEZ0jKPjou5sdJvHn3uK3HGU9k0K+4/?=
 =?us-ascii?Q?U0Gct2u9QlTWeTUd5xWGSQJHVcMNxbr617CQUDNzVf70Rt/5WbdESz86O3IP?=
 =?us-ascii?Q?sqzVPTdl01+fv5cqiXZqMzaNMNpSSN/XXksJ0OMcU8ZJFbQoOdcBeMgZ2nv9?=
 =?us-ascii?Q?MJ+Zg1MsQkQLBQjD8mQabgIk5drm6Hyz7r++ov+dEpV/fLR5cCs0emkNxWFt?=
 =?us-ascii?Q?tNcKeyROmf3MX3e7V/kvEodCu4KCgyrQ9EyKEVxCQNcSGsv3HmhM4qFU7x0u?=
 =?us-ascii?Q?XJAWF9p0aaOGjsbftK4A1BF7t4n7idA12MKgkem12jBuR6MuQ+b+ZuVN7ZNn?=
 =?us-ascii?Q?IK2oYWDHYUhWp/mivzprMc2xHvBHU+aKe2jvJw7yu1JFQxAr7wNu0gE4IHSx?=
 =?us-ascii?Q?55V7uQEYBrcQrTrmq6ceJTsLTypHLqYsQtIgonrUkeWcvqf+DQR3M/kQqzE/?=
 =?us-ascii?Q?Rky4HGcEt3GlRr8hki1ACsHvyYvr27N8yprQXtt4NY9U5nNMZvwkjO0fOu6u?=
 =?us-ascii?Q?LCqZwAU383lckiSFtkyeFtyZWDjPIK2KSTp6XlXNOC4p4Bx6cKe7jx2Ni9an?=
 =?us-ascii?Q?hOt6xLsVga2oOLmOCqPTjcNOWngEGG7HyZGEuGW1hNO439C5uD4Kh3LR5eFA?=
 =?us-ascii?Q?d1bD8NiI4gAkZYY3Yil5Dwm6eGgGSkD9R3zqR1/ibzBxrLbybVfQQVASoghK?=
 =?us-ascii?Q?jkp/HngnTDyQAuUxkBvzGpBuf96ayyInN6cBY0OAe8FkwubaTqklhe2QzCqm?=
 =?us-ascii?Q?65H4a2M9ETlvVOnjD+hJ/pK5rH8WcGwy+82c+u4LTpsaD350au91jFQ/bQWZ?=
 =?us-ascii?Q?XtRaue2Cd8zAJV786DNnkLF1iGoF20tdB1996yScjAqS+ao4vn9FL4huf/Ou?=
 =?us-ascii?Q?6znQrqbRgaQxtBQbBxNobYqG4n0/dAUf5Cw9ds6LcTr6HVIuVBMh6w5GUr+v?=
 =?us-ascii?Q?CkF/b9Z6iohkFUb03kSa691Aft7KzSUMQQGb21tb8pFSb2zU6WHu7MnIOnyA?=
 =?us-ascii?Q?Wz8BIzI1aWQ/WW3TYZAH7ivcTfVFupLspyhFbCEPbn83Ujyk0Fd/CBlsAcly?=
 =?us-ascii?Q?wdZ/P2g3bhPDWnvyjxYBQByStw0Y1pZXlXivvGSHNTTLClg9V502Kh3um1ii?=
 =?us-ascii?Q?CXU2eOKH0tT6dHML+7BeCTVdraMWbsiUayBlMwpmPzRk0QITRWGefG1/ufPm?=
 =?us-ascii?Q?fOZGVAzWAkyX/zbj1SlauRzt0d/SIOQ2TT/xBhCOPE0NNHuzDJnnzDwguDlh?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6471b-dab0-4956-479d-08dd81b13857
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:20:31.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hbt9zSDRnJ+qtVmOjbD/dUisVrq1m8Duv/aFSja/63aNJvxYM44MqCoYziHtTnL79Sc0ND3dtkGWHSdLtQoOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

On Mon, Apr 21, 2025 at 12:09:15PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 17-04-2025 09:43, Matthew Brost wrote:
> > Mixing GPU and CPU atomics does not work unless a strict migration
> > policy of GPU atomics must be device memory. Enforce a policy of must be
> > in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> > fault.
> > 
> > v2:
> >   - Only retry migration on atomics
> >   - Drop alway migrate modparam
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_module.c |  3 --
> >   drivers/gpu/drm/xe/xe_module.h |  1 -
> >   drivers/gpu/drm/xe/xe_svm.c    | 57 ++++++++++++++++++++++++++--------
> >   drivers/gpu/drm/xe/xe_svm.h    |  5 ---
> >   4 files changed, 44 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> >   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
> >   MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
> > -module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
> > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
> > -
> >   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
> >   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 84339e509c80..5a3bfea8b7b4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,7 +12,6 @@
> >   struct xe_modparam {
> >   	bool force_execlist;
> >   	bool probe_display;
> > -	bool always_migrate_to_vram;
> >   	u32 force_vram_bar_size;
> >   	int guc_log_level;
> >   	char *guc_firmware_path;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 56b18a293bbc..1cc41ce7b684 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -726,6 +726,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> >   }
> >   #endif
> > +static bool supports_4K_migration(struct xe_device *xe)
> > +{
> > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> > +					       struct xe_vma *vma)
> > +{
> > +	struct xe_vm *vm = range_to_vm(&range->base);
> > +	u64 range_size = xe_svm_range_size(range);
> > +
> > +	if (!range->base.flags.migrate_devmem)
> > +		return false;
> > +
> > +	if (xe_svm_range_in_vram(range)) {
> > +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> > +		return false;
> > +	}
> > +
> > +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> > +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> >   /**
> >    * xe_svm_handle_pagefault() - SVM handle page fault
> > @@ -750,12 +779,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >   		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > +		.vram_only = atomic,
> 
> atomic && is_dgfx.

Yes, indeed.

Matt

>  >   	};
> >   	struct xe_svm_range *range;
> >   	struct drm_gpusvm_range *r;
> >   	struct drm_exec exec;
> >   	struct dma_fence *fence;
> >   	struct xe_tile *tile = gt_to_tile(gt);
> > +	int migrate_try_count = atomic ? 3 : 1;
> >   	ktime_t end = 0;
> >   	int err;
> > @@ -782,18 +813,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	range_debug(range, "PAGE FAULT");
> > -	/* XXX: Add migration policy, for now migrate range once */
> > -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> > -	    xe_svm_range_size(range) >= SZ_64K) {
> > -		range->skip_migrate = true;
> > -
> > +	if (--migrate_try_count >= 0 &&
> > +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
> >   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> >   		if (err) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"VRAM allocation failed, falling back to "
> > -				"retrying fault, asid=%u, errno=%pe\n",
> > -				vm->usm.asid, ERR_PTR(err));
> > -			goto retry;
> > +			if (migrate_try_count || !ctx.vram_only) {
> > +				drm_dbg(&vm->xe->drm,
> > +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				goto retry;
> > +			} else {
> > +				drm_err(&vm->xe->drm,
> > +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				return err;
> > +			}
> >   		}
> >   	}
> > @@ -843,9 +877,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	}
> >   	drm_exec_fini(&exec);
> > -	if (xe_modparam.always_migrate_to_vram)
> > -		range->skip_migrate = false;
> > -
> >   	dma_fence_wait(fence, false);
> >   	dma_fence_put(fence);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 3d441eb1f7ea..0e1f376a7471 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -39,11 +39,6 @@ struct xe_svm_range {
> >   	 * range. Protected by GPU SVM notifier lock.
> >   	 */
> >   	u8 tile_invalidated;
> > -	/**
> > -	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
> > -	 * locking.
> > -	 */
> > -	u8 skip_migrate	:1;
> >   };
> >   /**
> 
