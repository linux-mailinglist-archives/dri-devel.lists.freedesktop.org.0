Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F058A44E76
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0210E7ED;
	Tue, 25 Feb 2025 21:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+J2Mhmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3892910E7ED;
 Tue, 25 Feb 2025 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740517903; x=1772053903;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oaBEj0fy9aFeAYU5Lgz+4ks436iXETopWbyWznjsFm4=;
 b=m+J2MhmxJ40MADQN3LDCOTEaKMeIDsqWVdUj7oQqtJh3VkmdOvMhbKLj
 gvN+MjSz8Z5dyj4TBCMCsLKoeO4rbpSaVFWPDeUtZkbPjpJcZPjY04BEF
 +ynMo6U1EfDQHYSzCXSefO+VtiAh9M0uFLxy3MhCyrFpy0lxthuOS0TTs
 Ua9xhGsn7LPuk/COFwcUWYU4E540UxqGM4cKtqBqMQEwP1Ke49qkbJLyq
 SrvzxFvo5b95f3Thh78Y7xgbJknfuMeasLagqz+7/XSt5cT4cF0nci0UE
 YL8YBni2Y7FKqoDX91dlHnwz944CvojALaX9rpSLXLjhsGUDe0XOd69rt A==;
X-CSE-ConnectionGUID: ICcVv9fSQHmhAPdm6Mcb1w==
X-CSE-MsgGUID: lFM6tNm2T8it9Bu2/ZVpXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44995956"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="44995956"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:11:43 -0800
X-CSE-ConnectionGUID: fbw1YjDKQ32kXnrlXXPD3w==
X-CSE-MsgGUID: 1Xoa+kULTQSdG+MDwR8hng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="117120258"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 13:11:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 13:11:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 13:11:41 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 13:11:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tdh/oOG0YNkv8ujzhtOLmwls8OCnISqyKFaM/cMciOSuRpsQJtLdtPh3j+43BC9SVUSzuwu7m6DZKDOsq2nzkmP0zRmG2CS7I2T2PC5rMQide0xnM/+QDGEy7hsuxzUjWEVqsEcjluWZzoi9H5GCbUvjzEBWRQEsyocc49RG27v6FsCiyq4PzgOeJwncpF376y8IM4jqe2w5TyLaQBh0rEYYM0tE04SAJ6HJLVz9mC50O+gw0KNvbUe1JKbck3JLvUaOl49Lm0j/2QTypwVRF/7TNv/j+F4eE7YdS2crwWp8O8ubBBOutmfSrQPPuuV+SG4UEYtp2WtvMj7ey/WFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+fBZv0sgtcwpojx5fbJvadXLTlH0LUxaUWVaNq6mNM=;
 b=UjMwhDImDKpIECEuQaGJUnGw5H35oi3Qqx/mfzIA9z6xAHrMFt0rRp4u2bLqUvve/pd2r2Lub6qDmFIFZjObXdnZT8NB75dqQzAiY+5GiShkL3U3oBLTE0C6amj/rlCX/fjpIn3NHIYDdX5jSFqLr0ZanQkj9bhT/Av7K5KcRc2wd7WrMrdYiRnnEa2/7F90sM7BdE/Uj8g4f5+ps1quRgVgpjZQ6eKWbl11BnCa4ZRD4lJHgD1Ab7aZ5cuEozZcrP3Mfqjugt0zRDI8Li0rXuMhzAdEA1qg2W1uR+0xGZAcX8u9MuCdN3VG8970REFmiuXrfW7q7pxmI/4EHR2HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 21:11:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:11:24 +0000
Date: Tue, 25 Feb 2025 13:12:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 1/6] drm/xe/xe_exec_queue: Add ID param to exec queue
 struct
Message-ID: <Z74yO1wuusHbqIss@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f449930-2f4f-4dd3-7671-08dd55e0f598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1AYLTd9rA0CzcbNUI7Mvm4720KsgQ5wWSEvIRF7aiUI4AiXKiUfc/rcZhE6w?=
 =?us-ascii?Q?w1alCvAYAe7CAMZgILMkJQf2vl2Lz2zaCwIiMieRplnRGJ0LfzjaL5MqZcai?=
 =?us-ascii?Q?MdMJmU5kTXez6PaMOd9uVtnqH0ECX2UIY2MdSFhbzZbkudqcW+cUKuBaLNPk?=
 =?us-ascii?Q?hHtxl7Jdndws58qxdYjxJDv3xiXX30aFcvFkBNwikg1Siy3br4oGlgUgHFWz?=
 =?us-ascii?Q?RwHSbVE+qkDhuE8uH8soG4uuNeB0/st1bHy4qbKUR6bbgFPN6uDqEvm7qxS4?=
 =?us-ascii?Q?Q4sIyxl0i2oLFLvjA5SfR07XcWgdFzTNIm2y9RDXS6CZvDqAVuTg4pmAhRS3?=
 =?us-ascii?Q?8oK/00b5CD0LrowlYt3nMx9BVk3iookvnjjbUJeIvheWD21zpFrfnPAKZaDn?=
 =?us-ascii?Q?thgI5QmMmkqQtVos87AC7wQU3RUYPGMHqGPLhfA0FqPvViXubPjICekRsgGJ?=
 =?us-ascii?Q?2mKmDQdE8JnHm2+RP6tF8kgoixAAgJtLArXG4rzr/McMEcCVWXc/uzHNJg51?=
 =?us-ascii?Q?+JhlrhlI3UGgEOKoJwcnPYl2SKSuubsmdKjWWjpZtKijVSaGk/pAfyJxUmFR?=
 =?us-ascii?Q?tNBXIVr3MtgVK1s4ChUaucHnEWg2GatXpKxzRBY8MSKEsRGT9dlqC+qIZkxA?=
 =?us-ascii?Q?RmrXsg/v2b1YHk5qN9UBsEyNvIPxff11XfF9a9/Z4HRbGlvzynCOaX7CkNZE?=
 =?us-ascii?Q?+oGgTzyqz0NrOo+VWr/vHVfFfNVbCTThwFQIaOMab73I8hg4FL734iol9yoY?=
 =?us-ascii?Q?xsjDrxNjV/QRdGjlpNguQ58JqdPH/Nzrcshmgn3la3CwQB7AcLUkhWhVPfWG?=
 =?us-ascii?Q?jzHAWedeiQWR58FmWe8YkbVRlYGW6GF1QdybKg8/pgtqBB9vdKRJ0K036/0X?=
 =?us-ascii?Q?nTMBwgQr+rB6xCG96Grq2a/F+o9yPYZUTPnqV3Ncllpmg6Q9n29JMuIHZrkO?=
 =?us-ascii?Q?LeoWcUJZx0jDMYOaqA/cRE/0g2zvW69IMmpgdCOM+DQeZCcU4Od1XqYkBe8E?=
 =?us-ascii?Q?vRcvyOVU3xgV7+TW8Arz+zl1R0yh6a2TDLPvd09YcKzwwa+d0SX0oW4kKLmA?=
 =?us-ascii?Q?1eC6PUWhv1IId8zDMOexJ2Es64s5h9e5ytUoM+XIZbjUCt1KTsea19aiIQLl?=
 =?us-ascii?Q?eQXpqM81w8QByHJpVe8FJzy0Q4vFygZn5doWzzP1BsbxSVxsZ62/87tliEXW?=
 =?us-ascii?Q?8Bb/q3Cc6f9kg6oOYfX8VNdQEt4QhFyCdSGzGexVbLk5yjhT39B5E7MjwvMu?=
 =?us-ascii?Q?V1EkCJ0aVSbaI4Art3qG4Y/EkO//Bm4nJ2SF8D31z1goYFcZuysUlpbiWlyO?=
 =?us-ascii?Q?DDbte1a5Z6wdZKViYynTcSOkAt5v5CJnjQ53pRK6TaUuJCXpdRik91iUxmNO?=
 =?us-ascii?Q?TgYCS8pWSry7bdCnV8pU7xApBss+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZ8DKAqaQmnmD0ySr+dPP5cRRlb6YkqYOTUBRCKX2PlbtHTBOcDYFZOXl5LO?=
 =?us-ascii?Q?qboQZDy19EuENSsnmi3PXNB5l6mgWj8A35FwA6snXmRYuw3gB2VUY5YvB5Bd?=
 =?us-ascii?Q?xwzzUCowm6cdQsxPysZ4hS4OdhnCKKzcyGOzqadt5vIfEhaoDmGQSitki8Oa?=
 =?us-ascii?Q?BbI4hlqBHEYwwhztXOHfxqq4XbuF40COvN9kXTrgqDwvcCphG1VniIfEZiL2?=
 =?us-ascii?Q?1+EPhC2vuFVs2AAx9jW7/ysuyfT+qjugCKKA4EI4CGAuRaLekEBr4YgNiub3?=
 =?us-ascii?Q?TnfbzNMsPptbnOkpu3utmXsycUo8ABVGkpUi5o7e0z5W+8/agYef7oxky3U6?=
 =?us-ascii?Q?hNG14gjsFkgv/qSnWbwW1mrJHEzdOhJbiMHeFD4l0zJV/gdhS2OyZxkdAmj7?=
 =?us-ascii?Q?7cAsMfOOuhRpcdKOULNk2QCAvdFLMWs9HEZQpmISMj6fWjk6Z0bxVGgIiYfv?=
 =?us-ascii?Q?7e9tiEg24Ly7k0/d4CFDJFWKYwjyL6/y7T7GcFGBw0l8qsl9P8LsrnCTwAOj?=
 =?us-ascii?Q?SWGy2QzwtbWZaym1nZ9QKkvQ6cKQUeDaLOE/pHKMACfo1srHkhsEnk96P0ox?=
 =?us-ascii?Q?8B+SxIjZc2mwnf1p1SoGNkqXR4kIroK/nqCGvlNFXKEixCpqnzcYyaz3WKsK?=
 =?us-ascii?Q?oqtK3RWW4kV3BqHlJzgd8h+B4jBtGvPToPHlEbaSaClNrE+xs93N9zdqQh4B?=
 =?us-ascii?Q?5yxG1aKCTl0GktCY68EJceDgVh5OutVS6L1d6V8wzjEmO3gWzUStkQpPSo9+?=
 =?us-ascii?Q?kbBY2Z4eX9bdeDuEr9UGlnRMWRCLTIbf1IR7qPgZMp0MwAHTJfrG+tazNNNs?=
 =?us-ascii?Q?fenfxHU7F1EUt9cTjTRzu4Dp5araQlQGsCo/pgyGypWzyPSagL3ZlbsJfbBw?=
 =?us-ascii?Q?NZ/CdMlLSIDRGwu6obW0Sy61PBo44dQozdiyNgHpk8SEAbE8gM0rSG/ETecL?=
 =?us-ascii?Q?wUhZ5JWFfwYZOM8A+3Exp/oDLEDaG+Q+GWNPKwLhiQq1f5IJZjGXWs52lOP9?=
 =?us-ascii?Q?5lwy6HTvT2Voqy/STrCmislLNWzrgCmODbveGqb+89AneLKNlAhYbyIpNEhn?=
 =?us-ascii?Q?gzq7ZuSLu+0Jfxiv3a3pWrrnhizZDEyxY+EOUti7DOtFwzkBkUtLl4ed99tt?=
 =?us-ascii?Q?VyUkXjoaVbge0uARuDUZCAwFcCnlGgapC2TBn8G4mbxcoXID7o193o6DPxKn?=
 =?us-ascii?Q?mAE0IAwaLyMWR18PM38GG2lqvgLE1OF+RTt4JmIdTvlIP57zS1nEeAgJzW5Z?=
 =?us-ascii?Q?vc11egpjSze2o7dd7PAelcoTXeIeVDTIw7UaqDeMjsh39HsMsQ9x5JLJOfFR?=
 =?us-ascii?Q?LrAgBFwmpTE8Qi5FMllD0b/IHgyYMfjStfdYWmVh9UKYtaTUhCfJSuItoBNP?=
 =?us-ascii?Q?LGKYHjN8oG4Hc4hszxgyyff2j+wnn312c5UWbukTAPpgRarYeHW6i+T2F/8m?=
 =?us-ascii?Q?ZN3WjV/VlwnkuidkcjPPQTrrnWn11/EPb4grEQY/tlLBwB3W6/PzXNJuF1VC?=
 =?us-ascii?Q?M7nQJQ13asKk5n9WXD+hRBX88nztxoCYld9/AZl8p1kqc1sBipejacOSjQEq?=
 =?us-ascii?Q?hxPyx18mCoLbxtfrlfbJTkaoSd8LaenDHeBm5wM5Ac7kJnRjZJDbEQiX94NG?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f449930-2f4f-4dd3-7671-08dd55e0f598
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:11:23.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17O0c1UxA05MlZ4JG7qq8joD8NaSK4jfU3zRAQhhgRsaxOkVTzR/d25CRWaXkT7VxdT5sB2GGOQpBRL6G0fd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

On Thu, Feb 20, 2025 at 08:38:27PM +0000, Jonathan Cavitt wrote:
> Add the exec queue id to the exec queue struct.  This is useful for
> performing a reverse lookup into the xef->exec_queue xarray.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Have quite a few comments on the series, assuming this is needed after
those are addressed:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 23a9f519ce1c..4a98a5d0e405 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -709,6 +709,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (err)
>  		goto kill_exec_queue;
>  
> +	q->id = id;
>  	args->exec_queue_id = id;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 6eb7ff091534..088d838218e9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -55,6 +55,8 @@ struct xe_exec_queue {
>  	struct xe_vm *vm;
>  	/** @class: class of this exec queue */
>  	enum xe_engine_class class;
> +	/** @id: exec queue ID as reported during create ioctl */
> +	u32 id;
>  	/**
>  	 * @logical_mask: logical mask of where job submitted to exec queue can run
>  	 */
> -- 
> 2.43.0
> 
