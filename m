Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBFB131FB
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 23:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1110E156;
	Sun, 27 Jul 2025 21:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwz2UcdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317FE10E0F4;
 Sun, 27 Jul 2025 21:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753651010; x=1785187010;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0KH5wpul4PjQBXZE2L/RflrtdkyXxbqwW9IIv9vmGUU=;
 b=kwz2UcdV4qeZLMKfm1/En49dPntaRUm0iHO0JvPp6N+poNxYennf5rFx
 1xDWygeGmC7NEgdf8oTdoHmOq/nkPKdXr5MZxqV+T+4mreGYC6CJEmG6N
 gAD6LMbeCROpguuApvG3ddsMCwNhOcAja8XPLbJArcMpk12nknMgcRIK+
 UylrUSTndFRRApRD6C8P3p3JMtgcf3CQa58U4/fho7c4auScI1YL2T0kB
 uN52uTdaycDi0vZ0y5BnWMjhnVNxEKAf0muSwv0gphr4EtfZ7FO3prw//
 wteLY7aYKx3AOhTbWrK5waMqDHbSmcUScNBxdkNvWzU5341sTx4I75ydO g==;
X-CSE-ConnectionGUID: VB+c/3sRSo+CXDQb7amS/w==
X-CSE-MsgGUID: rMtZ3twuReqDq8JLMdTueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56053151"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56053151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 14:16:50 -0700
X-CSE-ConnectionGUID: QqhGhVrYS+OSEXUJaWoPRw==
X-CSE-MsgGUID: j7K7hvtgQ3Gk7TL3WqPmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161837818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 14:16:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 14:16:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 14:16:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 14:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5K5RqzzVXXnq94a1bBuNJE8x8e6vTjQiJPy6xIinEfBT+i84xnun+D6TdAOTkmNn+DPlzAuhF7bSnLHecU5RUBRQ/W+o1k16/Gpj3wAEsyHjM2865AG+qOmeiG6qu5Jwe8FkKerlTXAiZjphjLcw5i0sJUZlCuQkOpswyOoII+RygsQeUnXmvv4Y3RJSxyvTQWv3Uj4Ug+C00ORUXnOk4pkF3T0ZWoy+dgZKdQS8t5wmZuqwHLZ+Br7z/J37YRWTTovKE/mWVyjWJw0td0TxaAtAgSMySmTP14kzzwhkyA1+qjqAaKxIHp3DzQHNcN+HVRE6zQERO53As4FA70tUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u85kdX+lRW25tApnBWev4k+t9y05+0eD4hXFPfrJFpg=;
 b=r9ZX26Z4r2VgYMMjnYd6cUPJ7WzJPGjCiRIJ+PKCYungRc9a7DQMCaaWOdqeD3+APOsyWtJmYOvjGpCjII7I9D1091xWMitKUZ16FXlaSRaEY7de7gRwThn/BhSQApkJUreeXYOOzSL5/x7JqOeg/zYhfy8RdeuVj9nO2IAs753v0FYc/uo2uoBw2tyMshOAt/O05KvXTQ8jpM65hBZjelllAZUE9wajQauQ9OluoW1rCJINKaZ5ZYeccfZHJgMbMUhqGeqpxyNj3pQ2Wc9VvxqdRoKFMIVF+Exiu0f2Or/znbV50P0Fykty/5WEQZiQvX0vVJrTyu+jIC3rOAWFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 21:16:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Sun, 27 Jul 2025
 21:16:44 +0000
Date: Sun, 27 Jul 2025 14:18:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Message-ID: <aIaXqs0VeO92RzXO@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 1852e5cc-8c10-409f-06f2-08ddcd52e385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MRbuKzjkJ1uaU6yNmqPUvwkD8XKkOvmeIFjoZlIVfV9qM1aGsap84YPRQ7d7?=
 =?us-ascii?Q?fD2Nlz9vW2hKlYN//fz+anaml+4jg4t+9bPf4k6N4Md/OObSfheZ3gZrcqqb?=
 =?us-ascii?Q?kTNxvFhHYXVtoB03S1f+glFBPhY1XDJ0Hgqqg3TbYnCBW1mTYUUcVNsLMB+s?=
 =?us-ascii?Q?KZPA3XGFzOT7CYdmTSKrfIFu3iOEcZW2+O6y8CEW5P6ApreC6Dbaw6Emnbdp?=
 =?us-ascii?Q?Hb95lqVuhjLI/3xMJWTnU//HxDm3pA/PxRGX2IF9DerxzcWv/a55WpxWOGaW?=
 =?us-ascii?Q?DtDdOQMhCrk43DHbkUvlx8G9EKT8JFfOdApDZ5ThaG/aF2vDBYX2Sqj2+ffB?=
 =?us-ascii?Q?AybgqcfHYTRxrYyD+IxVpV/ocLzW435nGf1KnZvH1X9eznF2Bc2f2tShWawq?=
 =?us-ascii?Q?+EvjxKI1YmB4gaajG9M6yYsjUf3Gf1nlLpd0Iwe6m+3IqZT15ytJluZ1HHRr?=
 =?us-ascii?Q?QC3KnyVoS6XGoKIEykJwPN46xz+Svza29x1y0oqugxafjU+p6kEvydWxK2jW?=
 =?us-ascii?Q?2CDtFj0qmIxpM9dPw43FaRPAtvXlV1tDJ0274xGCqu/T4oMJbbXy1RTdYcui?=
 =?us-ascii?Q?ZQ3EMbR3Fzt/s/ldfuzO3MWTpquiZbTp2vRoDpkIZ/HBXD5XbQTnkfMLNval?=
 =?us-ascii?Q?e2fN2ikdLRD/Qnr0CLcgDfjEjHngEyNz0mieAM98yGJH/DPqAVPAJ8ApdEpI?=
 =?us-ascii?Q?cfsmdl87Ors6i3C6BjbZxt8vNAsyIyNBvUtZu5KQmf5vR2jV3Ts54HoEQVwc?=
 =?us-ascii?Q?JKkCibbqeDIz6VSj3DoEMkRYH/FGkiwmDqFVftFcU4HReugHvlnI+1+4wCaT?=
 =?us-ascii?Q?P1FvxqJqH52YQh2hL5MocImrazwUYxl1TjMdmUJQQzVHD2qHWQyz47mLEvDv?=
 =?us-ascii?Q?xQtvjckNM883Cg0itB11I28BwvmsxVz1f8G7n8C7wn0aXZHSLwhuQrdnvU5/?=
 =?us-ascii?Q?2B2jEv8VV45roLetmCp3zDH29cNeP3uxJSnjbEs26NImKD3zKl0iK8vYbhPl?=
 =?us-ascii?Q?kcQ6ZJsqKaARIiC6fWiNm6TjKti3oc/5rUKWsgvGswBrbMKdSuX7wyzplvRX?=
 =?us-ascii?Q?fbDSNJ3aS6GOc0i/Lla9X/ruseKUpG850MLMBMDdHvOLIwak8KMvlVjOJesD?=
 =?us-ascii?Q?krA/nNh5ze4cyACwN7mdQJioCZR/GOmv+uieoQYhputwm26dvn/hsXehNvr+?=
 =?us-ascii?Q?iSCy3d6o8gVrDm4eQfjGpkYcpEKjcu28r5gaRjflTRRtgagYvYs0Re0Urujg?=
 =?us-ascii?Q?0B1v/MRZWXQpUtb8Ia+iZBTwRRoe3cxAaklaGZcY21b1gf48jWo7TZiPf8cU?=
 =?us-ascii?Q?z3EPSklZODH6KkTonm89sC0XGb1GZfUvtG8w0Zlt0/G1nzjuJrR3kFnK8dIP?=
 =?us-ascii?Q?lnL0KbSrvlSjj2n1gdOTVTtDrDVvSCIrwLxtgqV9oiktA+exZoXYA6jE4/oJ?=
 =?us-ascii?Q?16ZlySW6rjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NF0245FOJ4/8ofZ5kP/R8xDAqW1PriimIIt/TfHrO/7lcpxXTmcKocorLXib?=
 =?us-ascii?Q?H25I95E3a64toO9I+WS4m3YKCg7+EgGU1gBERuFxN1k6NbbTvDHbB3AwP76S?=
 =?us-ascii?Q?ID2TtKgp7g/zXYM1p5tf0NwDuG0vGt4xFHThcavsiETKZtUesbzxUKAXFqdL?=
 =?us-ascii?Q?dEad33FSO1edsi6R/h0w0S2DaUyZptRnyY4J7NcvylMifMYopHH44ql44+JP?=
 =?us-ascii?Q?hboRnlkzzp8bhGhawpvMq+TZLzIAwXeCFmUkJNNXJ2/CRrKKjwOoqOydVBHw?=
 =?us-ascii?Q?b0cqmMLN9RMyjRPIEH4k8KAhpIJYLryev5o+yospzyFNgWh9fHAAQYVGuME4?=
 =?us-ascii?Q?rJI1FyzAKr07lb2dCjVYXQ1p+fJxQ0qHaXTf7BI7KhXd4d385goBnRwAfJif?=
 =?us-ascii?Q?uBsPz7KfbgSpM7vKgQOhlFoScq+Z87B/MaNw1TWDpnqh6r4FA9tQEe+OP/s9?=
 =?us-ascii?Q?c+CrKwl0EG770gg2nHWUq+h1tftyw1tDe5hK3y4Uj45w12HJfAW5jHpsgOLh?=
 =?us-ascii?Q?D0C3XOcnhwdAvltrKbsgVYilGLLMdLEX9y2T+XuJPL+4RtIGmpp+g/f60UVZ?=
 =?us-ascii?Q?dJ7c9MetcusWQSREP1e8c1y8JNzp8BIFZfjksUmm3iib56r+AC9VtD4zlxmt?=
 =?us-ascii?Q?k4lXNchaAoczPWCsGETt5/6r7cfq8FxPpzsFLTiMqm4MDWcHJwr8ta4Pn9Qz?=
 =?us-ascii?Q?4vSCRtxCohAjFXsiMgISlDaJT2AfyyHiibiO4GMEsBw5yhpocqKtZK+92boV?=
 =?us-ascii?Q?TMnTFIAI8qagsOtKCSjw8clItN73khwdieIGFC+ktncnbUcSoIj8fo4U4pq/?=
 =?us-ascii?Q?OkMSohUhz95K/J0bilZnUzDV0w/bEDzkRrlt1QE2APBtcn6CDWzH7a8iDYz+?=
 =?us-ascii?Q?OMNQwhmzqnB4yjUCOm5vWjyS6xLU82+DQ0Bq7zcruxHuaS+4UX8Pp90OBPFK?=
 =?us-ascii?Q?Ch9qp344uN73x4DIYnfie9Vmsm+y1uKMU4bW8SkT7U1iuUkF2Z1aNju4RQTx?=
 =?us-ascii?Q?mUIwxjQR1hoPLGXd3M4+ZRhpbCNvounfT77qkWsMbliMKuN1mCXHHM8jO5f3?=
 =?us-ascii?Q?LqAcT+5mcqi7qrI4lP8GV9+eSGrAu/m8Ye4o1A7JjbkUBH+F0OFM00hy/Kvh?=
 =?us-ascii?Q?JGIDHSc44V0JXj78WInHtHGphcYDHsyK8jQjrmzTtn5brI5ww4xHgfZK7qZU?=
 =?us-ascii?Q?DES6447FZS095KPkoiTPprarmw0ySUjYmVtX+jh98RzYLhlKzafmWCKqp/Nu?=
 =?us-ascii?Q?hPESAucqpxfi552Jb+YU5nAaCl3jjWag/xJXOigj0TKk9ZCZAeZJ2gXMQNam?=
 =?us-ascii?Q?nXNNSPgmoYV3e4Q06Rs0I8JLercKHOh24OZa3KXPQCgpZdM+H3Tfzvo99sEu?=
 =?us-ascii?Q?VM15kGe/P9wlzjxayRKZlN0DZ5Op3Oa6UMjZnDJ8wNluRKtmH+OWu7Nl+Vt8?=
 =?us-ascii?Q?wv1vKLAidQuijX3Zr8I2kTYLM1l77T3vEAc8/VEv61iAPXiy3YE5pUdoOOTC?=
 =?us-ascii?Q?1KPJA+UwTX4mwQGrZ2QHfcwjBuJrJLEEXUbHKwdW1JnJHq4GDle0CQiTeKii?=
 =?us-ascii?Q?2nvKTrsFh2qM1GOpKpn8Mjn3zSclaoUKHs0BK2UgNDa43XAJS4rvu6pcCSoG?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1852e5cc-8c10-409f-06f2-08ddcd52e385
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2025 21:16:44.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10olpWmTYmifHkIcv80q4x7cW87YkSbKhKcqnzNYrssY1AH7Sh+RrUJCNK4m7k/OWJOuXuKn0OoRF0PR0wzoZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

On Tue, Jul 22, 2025 at 07:05:04PM +0530, Himal Prasad Ghimiray wrote:
> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>   range.
> 
> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> user-provided range and split the existing non-GEM object VMA if the
> start or end of the input range lies within it. The operations can
> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
> used by the Xe driver to assign attributes to GPUVMA's within the
> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> the operation with this flag will never have UNMAPs and
> merges, and can be without any final operations.
> 
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)
> - Add doc (Danilo)
> 
> v3
> - Fix doc
> - Fix unmapping check
> 
> v4
> - Fix mapping for non madvise ops
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>  drivers/gpu/drm/xe/xe_vm.c             |  1 +
>  include/drm/drm_gpuvm.h                | 25 ++++++-
>  4 files changed, 98 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index e89b932e987c..c7779588ea38 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2103,10 +2103,13 @@ static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
>  		   u64 req_addr, u64 req_range,
> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>  		   struct drm_gem_object *req_obj, u64 req_offset)
>  {
>  	struct drm_gpuva *va, *next;
>  	u64 req_end = req_addr + req_range;
> +	bool is_madvise_ops = (flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
> +	bool needs_map = !is_madvise_ops;
>  	int ret;
>  
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
> @@ -2119,26 +2122,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 range = va->va.range;
>  		u64 end = addr + range;
>  		bool merge = !!va->gem.obj;
> +		bool skip_madvise_ops = is_madvise_ops && merge;
>  
> +		needs_map = !is_madvise_ops;
>  		if (addr == req_addr) {
>  			merge &= obj == req_obj &&
>  				 offset == req_offset;
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = range - req_range,
> @@ -2153,6 +2165,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr < req_addr) {
> @@ -2170,20 +2185,42 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			u.keep = merge;
>  
>  			if (end == req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> +				if (skip_madvise_ops)
> +					continue;
> +
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops) {
> +					ret = op_map_cb(ops, priv, req_addr,
> +							min(end - req_addr, req_end - end),

This doesn't look right.

This creating a new MAP operation to replace what the REMAP operation
unmapped but didn't remap. In Xe debug speak, this is where we are:

REMAP:UNMAP
REMAP:PREV
MAP <-- This is the calculation we are doing.

We want to 'MAP' to size here to be:

'REMAP:UNMAP.end - REMAP:PREV.end'

Which is 'end - req_addr'. So delete the min statement here and replace
with 'end - req_addr'.

Matt

> +							NULL, req_offset);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2195,6 +2232,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map = true;
>  				break;
>  			}
>  		} else if (addr > req_addr) {
> @@ -2203,20 +2243,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					   (addr - req_addr);
>  
>  			if (end == req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				break;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret = op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
> +
>  				continue;
>  			}
>  
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
>  					.va.range = end - req_end,
> @@ -2231,14 +2280,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					return op_map_cb(ops, priv, addr,
> +							(req_end - addr), NULL, req_offset);
>  				break;
>  			}
>  		}
>  	}
> -
> -	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> -			 req_obj, req_offset);
> +	return needs_map ? op_map_cb(ops, priv, req_addr,
> +			   req_range, req_obj, req_offset) : 0;
>  }
>  
>  static int
> @@ -2337,15 +2388,15 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  		 struct drm_gem_object *req_obj, u64 req_offset)
>  {
>  	const struct drm_gpuvm_ops *ops = gpuvm->ops;
> +	enum drm_gpuvm_sm_map_ops_flags flags = DRM_GPUVM_SM_MAP_NOT_MADVISE;
>  
>  	if (unlikely(!(ops && ops->sm_step_map &&
>  		       ops->sm_step_remap &&
>  		       ops->sm_step_unmap)))
>  		return -EINVAL;
>  
> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req_addr, req_range,
> +				  flags, req_obj, req_offset);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
> @@ -2487,6 +2538,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @req_addr: the start address of the new mapping
>   * @req_range: the range of the new mapping
> + * @drm_gpuvm_sm_map_ops_flag: ops flag determining madvise or not
>   * @req_obj: the &drm_gem_object to map
>   * @req_offset: the offset within the &drm_gem_object
>   *
> @@ -2517,6 +2569,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  			    u64 req_addr, u64 req_range,
> +			    enum drm_gpuvm_sm_map_ops_flags flags,
>  			    struct drm_gem_object *req_obj, u64 req_offset)
>  {
>  	struct drm_gpuva_ops *ops;
> @@ -2536,7 +2589,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  	args.ops = ops;
>  
>  	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -				 req_addr, req_range,
> +				 req_addr, req_range, flags,
>  				 req_obj, req_offset);
>  	if (ret)
>  		goto err_free_ops;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 48f105239f42..26e13fcdbdb8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1303,6 +1303,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
>  							      op->va.addr,
>  							      op->va.range,
> +							      DRM_GPUVM_SM_MAP_NOT_MADVISE,
>  							      op->gem.obj,
>  							      op->gem.offset);
>  			if (IS_ERR(op->ops)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2035604121e6..b2ed99551b6e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2318,6 +2318,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	case DRM_XE_VM_BIND_OP_MAP:
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>  		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> +						  DRM_GPUVM_SM_MAP_NOT_MADVISE,
>  						  obj, bo_offset_or_userptr);
>  		break;
>  	case DRM_XE_VM_BIND_OP_UNMAP:
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..c589b886a4fd 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -211,6 +211,27 @@ enum drm_gpuvm_flags {
>  	DRM_GPUVM_USERBITS = BIT(1),
>  };
>  
> +/**
> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
> + */
> +enum drm_gpuvm_sm_map_ops_flags {
> +	/**
> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
> +	 */
> +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
> +
> +	/**
> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> +	 * user-provided range and split the existing non-GEM object VMA if the
> +	 * start or end of the input range lies within it. The operations can
> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
> +	 * in default mode, the operation with this flag will never have UNMAPs and
> +	 * merges, and can be without any final operations.
> +	 */
> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
> +};
> +
>  /**
>   * struct drm_gpuvm - DRM GPU VA Manager
>   *
> @@ -1059,8 +1080,8 @@ struct drm_gpuva_ops {
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>  
>  struct drm_gpuva_ops *
> -drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 addr, u64 range,
> +drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm, u64 addr, u64 range,
> +			    enum drm_gpuvm_sm_map_ops_flags flags,
>  			    struct drm_gem_object *obj, u64 offset);
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
> -- 
> 2.34.1
> 
