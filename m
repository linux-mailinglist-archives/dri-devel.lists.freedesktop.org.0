Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DFEA5B815
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 05:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B52810E0D3;
	Tue, 11 Mar 2025 04:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZEUp9Sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7710E0D3;
 Tue, 11 Mar 2025 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741668618; x=1773204618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b5vzful44IZGka9ESmyCBZcsfN9Zck5TwWmiqPJZs/g=;
 b=mZEUp9Sj4Bcj1aI9unYF1GyUkVgnWxUcvjG33vjMuUgRTcrlrUu1FUpn
 dQOBFPfszhP/EelzMWGFWYnayvF0b1i5GE4umTKX963iWE6cupGdn5u/n
 5rtnAWWQrZzSwJgvnK0JHhQoW+Hv2Jg8xtoviGIRHs22h8EVMO3Hr3wm1
 AJcdGDUz3uQGIe8LbEdVYI4pC28Nlv6ErVSLJ8SIaobzL7u2ORlhkj9VH
 z+lkpdw/3FMo/SFN60ICpSuKkbOdU9evypnWgBGwCp7Ryik6lklUSQHgc
 HNwndXuKu4AhT0E4w78hJUc+dF9ER/5VW+rGAhEef81tJkLvetBG0gJRH w==;
X-CSE-ConnectionGUID: TTEahtGHRPiwg9+x8geuyw==
X-CSE-MsgGUID: nyiSxNGJQpW1g20Q9BjYOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42563454"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42563454"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 21:50:17 -0700
X-CSE-ConnectionGUID: oo6OkJHzT6yBotSbZGxHaw==
X-CSE-MsgGUID: MdxYy0KxSb6OafI5okAv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="125102754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 21:50:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 21:50:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 21:50:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 21:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWV+OUCEnqK7Zyd8K2lCUDqHMgB59Zk2LU5COPZfPsbc6zyLEcC1R7MfG8r01STy4hejlNa4a/Ev95dxd/+HMtAuDjfJYAMhl51IWbZYAtuhhxpOqgoePPYIECh1Lf3fMrmeJuTWYHSZhxgHQsxPigO0KVNH7UuXDKvVINXlwSvVK/s90v7fGAElOuZ5MHKgFMgxgtnnAg610hJyXT1icpYD/I+V1bkblCu/8CzqTkaxC3vS/C7nmdxRggD0bfbTs/EIueYz1D15/9BU7ICOsXyBHb41ylMwHN5vMhjGeNF8aQAMC/18ZR2nu3XvnObgbcgAejKeB8p2TBa0HnWhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWrSScAm0dcXJJ5GhevP8if4r0BnxRNeo+qH0rWCFTo=;
 b=wGNrR1oXwkGxGQE3Bhjz8Sox+tHREGOR+O/y3JItMy1c22OrdtDJIPaN4hh7CxsuJTg7hoGagm33FOdjVXBTz0sL01VARLZ+H6Drt+3nuKQa104YLPfuYRaKBiR4Wv/pqTl/Xi7QlfL82ZNuSXgZ6nJvoCFCNBwDftGl0kfj1+D6dgbOPdEkHlDRub6w0Gf1pnqankOPY92Sw53DDLqrfdvKnn9kZn0IG3lQAP51YJ3OCHR7xxBz8Uo8ySkaAqFPStamBQK2A+6rOszM55DXH0BuTt/mqI5H/+3w+hkRZmTZ5uOiF6ITYt1H76HQD1ySbWIJ7mSE1NijWyvgZj8Ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 04:49:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 04:49:30 +0000
Date: Mon, 10 Mar 2025 21:50:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Message-ID: <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250310171834.78299-5-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:303:b7::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 54775027-cb11-47f1-47d7-08dd60581c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8S1heyH/Ox/dXePPRfYu8VTZQugB03G+YlOikDYz5KR7AJ3BA3IthhDWsyM?=
 =?us-ascii?Q?gUZPKPBsxtOvzWVcfOxlCLUER7GKkhy5Ck8ddO0NSZlo6GrjeJLI8WI9AY4c?=
 =?us-ascii?Q?FrY6fHiaFpHcfWGYmo/Ch0MrUOuOpDsVDaL4H13/HRGTELNiK4TdJuIByqr0?=
 =?us-ascii?Q?Kj4EoroAH3wttjX3nAwNcN4GrpjUmub88OAOU4ZOX1aXTy555dtzlDrfTYqv?=
 =?us-ascii?Q?zYznb+uh2tTF7QqIoKS5aw5jx1tQUxUySdvMrBOkIGgXWCGD6cfUZSnOCEVb?=
 =?us-ascii?Q?9ChJAsxqt1AuLbxs6xPTYzo8Rm5TJoFF9rrs8j8A4m7JtgdD0rOGxujh32tV?=
 =?us-ascii?Q?TMsyQAT9qA5oC2x/bh5h5eFZDjCRhWjms27qTdEoZkeoeKW1QJ4hi8Js+Zxx?=
 =?us-ascii?Q?nxAgDX/nAfBEg7kypdCPBQBH6maxY0uDJAPCtW1qo+O5aftXbSR0QrGN2qfh?=
 =?us-ascii?Q?/vhbLsRxEbp7Ig1Jw64X0kpAwFvWBFsV35EKf+Kd/4DwkTkxhv7E+aB4lRzk?=
 =?us-ascii?Q?EvIpCRi+fAe4I3+2q4JQfKLvGZ+aR8Afgdj2LbPzsamUQ5hQCChzEtAdyEZB?=
 =?us-ascii?Q?g62dil3jNRLZVfAqpSdql+iguyBOURUjISvecbFX6u34ccqIuYozhqKxQJzO?=
 =?us-ascii?Q?nqu+IoSxlj3a7pVdxlOUhMAKvDuxeX127IN9Xdj38VMbpTQLCb7oJn5P00Bx?=
 =?us-ascii?Q?PZDtuAoETVV1m2OmcUZlCS5lJu+BnEOzIMPPcZc0GNGx0nRAd/BRpofqjS0N?=
 =?us-ascii?Q?tBfmMRqNVo3iCoUZ8d1CVKHKaD9dyIFQg6QV+0F1AJqmpk/A2yHy6wQh0w4+?=
 =?us-ascii?Q?dV89citT7b/kzr1tZ8LOwIVFw5iSv+N7lktT+PTOnZKyzMYCmdU+bqMyen+e?=
 =?us-ascii?Q?2iyTbX9677FuCFgOz8cfqqqdYVX8B7zSlpzk8KLeJWV+bAAlhk3E8dN6dwJP?=
 =?us-ascii?Q?4mJBXzpWkIuNe28CfeaDpO5FZj1At8aKQc7WjRQ7FKfK+7ETygRZPXVqGJfq?=
 =?us-ascii?Q?3/UOIo04aBYNAJ85QysceXOxKD6BT/hpa1nuCp8l6DbcV8pYYx9zCVBY9nF4?=
 =?us-ascii?Q?148LhG31WAPTvHBEd6A1CfkZGkNvhgm8I23lUyUbsfGVbMN/VEp6K8TDNcuL?=
 =?us-ascii?Q?TT3VfS3RiGgAqF75Oz0CStKfaUxUnhg+m2erT0OEDaqZbkVvNXWhoKYiv4Ib?=
 =?us-ascii?Q?B/kmvx2CPWVdYyX1pEgomVoTLSFa/kBb9ThHfuLL+tJ+B7ytJkcaf6pCeQgz?=
 =?us-ascii?Q?aBm2ToHY95bfZnq/3qMPB474xUS0emTVpaOg+9jTQow69s8zZ+5oD8cRkJMN?=
 =?us-ascii?Q?UTAqsZRFrmPXfXTKBmY1jGJuw+5QF3t80o5aX+4F74C7k9g4Tg1V5RE0XQaN?=
 =?us-ascii?Q?LWx+NrscNheSgJ8nplCdpKMBgS0Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8oFAR1MJGDWxoRjahYSNEeyzgTI8NGrxGRFJsd0cTs5uWxbvnV94KFxhLvp?=
 =?us-ascii?Q?8Osrdcwgf07IowIAsMyKNvh6R73m6KD1pK7xYCqTdGyEpr0If1477DW72N/H?=
 =?us-ascii?Q?zP9b/YvbIglnaf3HXU3W9+gZD4ENP1AhhgsdMAJ1kKdouXfofL6k3G8LXPpy?=
 =?us-ascii?Q?yZO01N+ClWYuzmgdr6luj2/8V64TAlmHTO3ZE9hvPxMab5sMjsylblW7Ymzm?=
 =?us-ascii?Q?Toe1OriFRfSmxAxqyzmOrQVAshTw3J9RzWAqZPR8JOEL/KgrD+AZQaF340B2?=
 =?us-ascii?Q?BYrWZAzCw0htkOWRSutFUmgh70k4TsaNgc+Ty/kwM7vpn21TQD79ZQ2dwp6K?=
 =?us-ascii?Q?sV4zaDgIQn2h01sk/aFbTjIvpZeH2u5VnIXuPBMPxyivxv/NvDVMzysprQlE?=
 =?us-ascii?Q?3joB3pPA6ufGn5JCm0K8drKYhCyZJfGLmb/Drw4AgFAGum9iygVetbZOEg/L?=
 =?us-ascii?Q?wdfrVJvzzYjI+3QD9nFx4JWuQoh7fGU/+lnapdr1vQ5pghCrAABwk4l6x4w+?=
 =?us-ascii?Q?si4IJpAThshN1ar1cTxLXh8wbeWnGMIhdCph4O90pIOqIbU811vrYnmkKWqC?=
 =?us-ascii?Q?+wKy7HF4UYHSDZqv5w4if5CwQ1daQeoHYZl6fKYUoOMtlmXH7lkMVKwRNmLc?=
 =?us-ascii?Q?dmPHpdKHl+Wxuz/GtrUcoMedO1oQ9XqWtQoeJDL5goPLCUCT/eieGhBtDyk6?=
 =?us-ascii?Q?71ZvRusBfcYUvo8RHbOdkhDW0d/Ilr424q8U3bzHJ+nIr0t0/DHt55cVnZzp?=
 =?us-ascii?Q?TvEMPVk04TJDRjg6OaVZZwlIyBkTh3nSeQ0ghRjOTnTIPk1khNP+IqHauo2J?=
 =?us-ascii?Q?xmQGM2Y+IwY5BoqFA39bltkPI3g3oiPKiOMTws423ApL9G3+7wE5p4mtxyjG?=
 =?us-ascii?Q?qg7k7adeO1OdJO6YDt8G0kqHTfByJXtvbA/kb/VC7/fskwkZq1lVn6KskKTn?=
 =?us-ascii?Q?H9QQ7ovbO35vZ90UMIa6Fy8mcX8YJqGL4JJYE8gHZY6LHemhl3x4+cZQ56to?=
 =?us-ascii?Q?jC2snvA41wbD8/sIn5XckAveYnw3m8mt5A26r6HFjS7zhOc8y+BDRqkcyS03?=
 =?us-ascii?Q?2ram2uHE46o/sJIp9lGj14AQqynE21giuP2pPYccx+PhfGzD51fBxSCtmfdl?=
 =?us-ascii?Q?dSFJFBqDpce+0xdKE9nkiS92Rfq7ED7XB5RW0fu/EeoET3wIb1AxlrhiWouK?=
 =?us-ascii?Q?EcqfWhRX3VzME/1sCxGiInrJqk/y6pMXXc5p287WCyFUAGm0P+xltD4OaWeh?=
 =?us-ascii?Q?NJgOImtbYsY/ZpiwHkhViRg6ACSahnaTzicTaGJ2SE9g8auG2pbLJPZAYl4w?=
 =?us-ascii?Q?I3YR6Q9MjiC1cOnjJrHeBzBdizhWjbWL4Q4LMtE965LysYjMFWef4n7H2gj4?=
 =?us-ascii?Q?jbmKK8ywh1M0SD2AMJ477Ov/yFBY7ROEyJwKbxO2isRYX/AtU81okuuAu0Wf?=
 =?us-ascii?Q?5hf4uzXERHV+0/BVkci0fGqJ1xDYQcrhp87DSFkXZKSsXFSIoOvHhL0Ws190?=
 =?us-ascii?Q?9xNEgk7nQSDwMEO0Q4DjdcUvfPkSvqZPIgVrPWJXgHiuy6KVjuTg3XMVB88M?=
 =?us-ascii?Q?DteCWbpDPzEEQaCgD/yhtuMPD/c4wS2s1IpIKuuj3+CNu5kK03u2AV5t2M5U?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54775027-cb11-47f1-47d7-08dd60581c72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 04:49:30.8407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFY6Y1R5XqC9jP3f29spqTh8g+5ngGjhy4IjWd7Fcb9555mqDNJQ5dQL9OKfqMnvWHXZXAQsodgbzc5L2rxZ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

On Mon, Mar 10, 2025 at 05:18:32PM +0000, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_faults ioctl.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 616916985e3f..90c2fcdbd5c1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - %DRM_IOCTL_XE_VM_GET_FAULTS

This should be a generic "get VM property" IOCTL, not a specific IOCTL
that only retrieves faults. This allows for future expansion of the
uAPI.

>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_FAULTS		0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_FAULTS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> +struct xe_vm_fault {
> +	/** @address: Address of the fault, if relevant */
> +	__u64 address;
> +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT		0
> +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT	1
> +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT	2
> +	/** @address_type: , if relevant */
> +	__u32 address_type;
> +	/**
> +	 * @address_precision: Precision of faulted address, if relevant.
> +	 * Currently only SZ_4K.
> +	 */
> +	__u32 address_precision;
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS
> + *
> + * The user provides a VM ID, and the ioctl will
> + *
> + */
> +struct drm_xe_vm_get_faults {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +	/** @size: Size to allocate for @ptr */
> +	__u32 size;
> +
> +	/** @fault_count: Number of faults to be returned */
> +	__u32 fault_count;
> +

fault_count is implied by size.

Matt

> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[2];
> +
> +	/** @faults: Pointer to user-defined array of xe_vm_fault of flexible size */
> +	__u64 faults;
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> -- 
> 2.43.0
> 
