Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6075BC660B8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6110E1D7;
	Mon, 17 Nov 2025 19:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2j6eHq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650F10E1D6;
 Mon, 17 Nov 2025 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763409537; x=1794945537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1nWjHfX4kUQaxrEaNNIbl1nj+pBpL8ij8nU7fHlsDcE=;
 b=Q2j6eHq2X1HEfpjldxVphYeBX1BrLoNpP6D+eIt+Cna23JrkaRujgVjY
 bBsrDPMN1anJBKgQF7hss+XDhqaZpr9GFyWU5ZdG/ak7xa+lVdD+3KkVH
 gOAdyhTFE0U1huNGqOLLM6PG2AwuGriHtifplNQFp+my6JYA/IlsnHj/6
 yLei9G5PBJzkefT4qXGXY0fnEu/6TWupxR5sL2Mv9nc7gbUNRcWTFVX/L
 z6CYniRoK3LBXcezECTkkfYqDnkUI4PJ9RNI9E7oO4ddERyEcqDx6wiJI
 c77oyqDWDrOdu3mQG5WqXTGZjLKAlLo1hkipKjErmbO+1jXTvCGengLOs Q==;
X-CSE-ConnectionGUID: 8HdzlwTpTuGnRI0+/CBekA==
X-CSE-MsgGUID: 3HIM0l1NTnSIfcctaZZeJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75740512"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="75740512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:58:56 -0800
X-CSE-ConnectionGUID: 2IaINFUKSZ25JEyX8hBB7Q==
X-CSE-MsgGUID: qDlhudkWS+eFXxSHMr6Saw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="227877323"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:58:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:58:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 11:58:53 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 11:58:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixt79ctfitudH9d+Dac5TDZi5vNSGxKKnyDqhMDOOi9P87sNO5Y5QAdXMaLt35R67MtmQf/Shlha9ctGF8mXVhVzQS/m5lCLyztKT4aOgh3ZnBx5QpepfpFBYUG/2VAOOyKPY3YyoQnoaU0Yn/ghqXbKr1ulrMUkmNfGUeZHRyzEVxII00niCxcreBHJYxVNQLG4bnS1GsbJYw2P4WN6U/w7ULbPfd3ccE5yaII3o+dZhE4y7+vY1OTVgWyM7pEyQv8m4VvNXt+EP+rsTcd+nj0Y6wddiYuouUe4dlw7tOGzvX34ie+YB/87kl0du5e1C+lcw1LB568Vk4juSPvr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQF3+RMAEfyZbuxWCoqCAHG8RsxFYNgLbVbFb7sZLk=;
 b=Qfx7Q46cX9BbygKwyMTWfrPLsW8RDpTVYc1QasViFB3VvZNrNyJSad3i08jVN2FEXl3dl8h99eDkY5Wmj5pAa+OcuKecOJHxWSmtz1XpCHEtSh5hG1XnXkwiPio9gbiWSKg4ecupg9jhr/Qr3CSzi88z7In/jYcFQSJ1KqqMX7anPLfNwpwkl40KBVs9k9Jv0h8aCX1Bi5w+xF++OP2BuhDJFB4YssM5UHDRNAwsTz55+VGWSUfi7h7CcHvW91Ylek/Z8Hv/Ku+q2QShXDBjaiE2um3TaaSC+e3zeRLeEVMJ7vWQA/J5Ygad6WcDQ5GI+yTQcRZTyYLpHMQwwhM2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 19:58:50 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 19:58:50 +0000
Date: Mon, 17 Nov 2025 11:58:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 3/7] drm/xe: Add dedicated message lock
Message-ID: <aRt-dj6gAyP5y4TC@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb613f7-3f0d-48ea-45e0-08de2613b973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GdHfYANVW2kk6fcOCHM53b9W405ZpwA+J6VmhxEV4yoeLB/NcgHpORPB5NrH?=
 =?us-ascii?Q?1vRHRTwfvdl5vGijfhVEhzLs/Yyv+miCHHgTew1J/uCmlMwLl1fq2npe0cNp?=
 =?us-ascii?Q?E30nrMMP5s6hgxnPWCOoZVe6+qMUU9MB3AaFJoBf47FKN8viNS2ZXBDOexOU?=
 =?us-ascii?Q?5dTIMVeq/B4I8ehFuwE51Ks65MdzUp/b6zyv3XK3Zk9cDa6ySgnUtspnE9P1?=
 =?us-ascii?Q?6vZe8CVsIqBN5/VsYkIFa5cbQH1D+SDRCSQEUdLzqAFloxNyEOoC7FL8fDZo?=
 =?us-ascii?Q?lOJH3begKL8gxZbjco5vNSgwUoGxYVAYMw955DdlQp4pb6MPs232AnVQRsq6?=
 =?us-ascii?Q?4or1jOJyEPOb9SbIrFjMjEXWZEw8lHKAsk/NrtI3IACvWAUKQ992bH4xq+qU?=
 =?us-ascii?Q?s9h9W20CEoIVOgfNW1wVed8lc3C0aojGU5PXD7lrXfdRGp7VwBQav01NXtcU?=
 =?us-ascii?Q?otkEWYHQiyZjt4sfwiD0iGozg13FkRNk6mzSkm+I/1U3I0/gRCRFJhgGZtzj?=
 =?us-ascii?Q?mlH4IwMRtmA/8pVwSe1tenxgOxarpQusV5NnH8T2wk+WzAT7YNGk5aNJ158L?=
 =?us-ascii?Q?iajAeGRvt/iHprDXBzFdl1nfKSUGRvtcDaroScqyC6puJxNaQPLIwixdQwen?=
 =?us-ascii?Q?bQoQ74RAy/cP701wis/pqyaT23TYQhjD4hSjK23qDt8m+a7/24CD+ykEyDrS?=
 =?us-ascii?Q?6WEvF9Nx1TPIPTmoDc1CpNsE1xLqC+mFb3Gb6Q8gM/8ly2hS9q6mi2i7MAXp?=
 =?us-ascii?Q?hAOXMd/z6y8E5r4WWRMRjTw+XC44RU0/j456HUfBNAj8sfYa8FM23Hbg0M8F?=
 =?us-ascii?Q?Bqq7ViLtAquGxGpafkguZjv9izMZiGiDQcq6Ckdk3tVe9mk2ePWP955FB5SB?=
 =?us-ascii?Q?lKcHBzntKTQlHGUzUBVs3x6zk4DYszkZcJuivB49u/I6a9cNpZZVg/25OWOy?=
 =?us-ascii?Q?Bgy/6SDXo8W8kHyE4qCa60eM+xv9+G5iL7Jp1y/lp1dFdwwqpU9IwbYlwUO+?=
 =?us-ascii?Q?wNzIxywyest++dXNHjRvn3Qj2M/F+wBk6AHN2+oZm6LKnQvNfKy/zuG7o54Q?=
 =?us-ascii?Q?JPZUHc2q1ustZx7Wrxq1GEQGMp1IBHgzQ+vAd5FAy8oNgKZpKkzluaUjomJD?=
 =?us-ascii?Q?1WfpPxWstfl3pjGj5mL2oTkhG1/N8KDlG8wM6dZi1x46Gq5qxsG/atZhDvnW?=
 =?us-ascii?Q?xu1r857z519NLMnDHa05o6thwrdVHVUWSkxPYAsJAwarZU1AajZArocH/s9G?=
 =?us-ascii?Q?hgxFUWbXkH++yk+O3kQ4Q1ribX/ElFUmh+fWDmUmTIgK/bjzKCIzjTbiyVDP?=
 =?us-ascii?Q?zz3v0So+0tc515H4PEkO9MiU8azYvbjo1n7x5k4SxIKyBdbVmSFJosRREemO?=
 =?us-ascii?Q?VBnexVEUjgJq8XEjbKX6L8ORVM3lmq4djDsx+chdkejLe8MwLdmxsAqLgyBd?=
 =?us-ascii?Q?t+Sh5g2VDsEDX77NC3+Jpm7wVQDwwc0O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+iR0sY9whC8E/TIYLkEktrb/AcKa/euu4GzGiw53Bass40awlZbMfDTfp32?=
 =?us-ascii?Q?XFR33kqvdiWzQTDYHKm7nLY8XyeTM7M/KElvQAEFJEwHUV6Ayo3koVdFNcC4?=
 =?us-ascii?Q?rU5zNlADCx1ImfeFgmv46uotkj/YT8kGejDXvGCig/efo1+vuzoO+Ksyt+Gi?=
 =?us-ascii?Q?Uv0LQL6QWOfn4vQX0nfqhG21Ku8kjdSBzbr/NWHNPzewOcixHFndf5H+42c/?=
 =?us-ascii?Q?Znrtp8AOI20bWh/eVxpYAj2CCyxB6lyQ+9BHcx2PlUsUbecBoUZ2CiCu1Nhc?=
 =?us-ascii?Q?GSHJqRPFS6xZFocY7PneMmAqHH/JrkTzckHKXB20K9eh4a8ClPn6VrjbCOdp?=
 =?us-ascii?Q?5bj5HaAzQfRO5pmd8Py/LHLF8aYDJempruuVVo6r5DAOqwN3wgBnw67A01hi?=
 =?us-ascii?Q?M5ZV748bFCQGnX/80dM1oEUwphqz9X2OJXbvDIGb3IRpNqpbLE16leTboJV5?=
 =?us-ascii?Q?ly4L0cPAWIcrWlEmq/PKi8iAfXhrHwmoPamRxxtEoaKmHUcEzfRF4sXyfZ4W?=
 =?us-ascii?Q?uGUgckD4OOXG67DMWK0//dqsNl/BFIaemRacDO8zG++WkPIVg+iHBY89h0J6?=
 =?us-ascii?Q?0zC5zz/ig1E437DtfYylTHYpWiogg7db7SKlT0la4viYc0NUeHZxcc+qZBM9?=
 =?us-ascii?Q?BIPmEKW0APJYdjlIZfjj2tYLhWkBM2FpsP0lK4FUMijG2m9Acnj18JExiXUu?=
 =?us-ascii?Q?EdddjB+TA88kW2Z8YCx7SefhVypRMYvqc/kPvWOF9R0PhHcGci3W8zrpQfl6?=
 =?us-ascii?Q?PVvpM6jufoMw4c7nvGPtKc602S3uaTKcCezpNyRY0lgRubFVE7lstXcz2fNw?=
 =?us-ascii?Q?+l+Gv4bY9Et+/eIv/88l9mEzmlguFDLq6Iu0ex7JqQFNm1RODZru05JwrkMW?=
 =?us-ascii?Q?MNHFCkhX/ockS6C6SkoOfGnB5l4Fpo8uJT01CR99BDYKhIhAsYu/l/CN0hfj?=
 =?us-ascii?Q?LPpQlS3NFzrJuQeVK78pOGMkg8RDoGA0ol0i82z+PbBPFKDdNVJmG4oKNfe+?=
 =?us-ascii?Q?Bz4ScB3BffqTVhIVB896kTedLDunvT3gbTaceN6ONyV3dU9PgdmvxGia3UqM?=
 =?us-ascii?Q?BFWkkbmFTahsKtnylIw1qY/iqItiemqdRzfM/swfJ9z4MtsNENPCHMSuw6Sy?=
 =?us-ascii?Q?VsAHyOxudrSZDdvxogMVfHoFVyeNW1FFkWiWkF/SR9FRv0z3poGQWg7aagtQ?=
 =?us-ascii?Q?XQfdkVVE2p79tsOrRu15M1BWU37qxwTGc8yT1Um/EOjiI5bHMzFHlgCh36cl?=
 =?us-ascii?Q?zoSmeEw8TQmFbCvEwQ+8OM/CRnAaFQ7g+FkA0UhpIQexSj3NFPpKBC9qh8eD?=
 =?us-ascii?Q?fxThR+oAOPhcotUz71I02LpAEwGmRDmrH+tdt6jrQ+OlPBNMFk66cGZu8VtY?=
 =?us-ascii?Q?3+7Oj2DMZQNyH6+ZLIFIbSoG2GDl5dZrEwIpzYblnVHj4orQxtTQ9s9DZ+p0?=
 =?us-ascii?Q?CMp7FKQvr4yOal4J1x5OkOCNkvV1yB9IIWG70gG+HIITdQXAeQ2j9CGX2Z9F?=
 =?us-ascii?Q?9p8KxJZLxrf+HRV9/T7zEyXaBcQPlwqqpkDimlZWZtfbRnGhX9DXaABcROnm?=
 =?us-ascii?Q?/i8OJEBYlasSyq36ZkcxV2yeVMH9WrljCN8P+I4Xhi1VFp0asKfBMdilBEpV?=
 =?us-ascii?Q?E5Tx61I/nVTiM9usuIzFA5c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb613f7-3f0d-48ea-45e0-08de2613b973
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:58:50.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KPjrCPfYW29IUkolztsYfwkbQc4cq0fIBjPYV3CG09x3f76h5sE6xwzIPza8OkApYq1dtvNpys2tX85Jqzmnze2OnH70KRhpGdx8PJ5C3+yGOJTk12C8S4R9Wg0tLL3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

On Thu, Oct 16, 2025 at 01:48:22PM -0700, Matthew Brost wrote:
>Stop abusing DRM scheduler job list lock for messages, add dedicated
>message lock.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 5 +++--
> drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
> drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
> 3 files changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>index f91e06d03511..f4f23317191f 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>@@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> 	};
>
> 	sched->ops = xe_ops;
>+	spin_lock_init(&sched->msg_lock);
> 	INIT_LIST_HEAD(&sched->msgs);
> 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
>
>@@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> 			     struct xe_sched_msg *msg)
> {
>-	lockdep_assert_held(&sched->base.job_list_lock);
>+	lockdep_assert_held(&sched->msg_lock);
>
> 	list_add_tail(&msg->link, &sched->msgs);
> 	xe_sched_process_msg_queue(sched);
>@@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> 			   struct xe_sched_msg *msg)
> {
>-	lockdep_assert_held(&sched->base.job_list_lock);
>+	lockdep_assert_held(&sched->msg_lock);
>
> 	list_add(&msg->link, &sched->msgs);
> 	xe_sched_process_msg_queue(sched);
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>index 9955397aaaa9..b971b6b69419 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>@@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
>
> static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> {
>-	spin_lock(&sched->base.job_list_lock);
>+	spin_lock(&sched->msg_lock);
> }
>
> static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
> {
>-	spin_unlock(&sched->base.job_list_lock);
>+	spin_unlock(&sched->msg_lock);
> }
>
> static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>index 6731b13da8bb..63d9bf92583c 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>@@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
> 	const struct xe_sched_backend_ops	*ops;
> 	/** @msgs: list of messages to be processed in @work_process_msg */
> 	struct list_head			msgs;
>+	/** @msg_lock: Message lock */
>+	spinlock_t				msg_lock;
> 	/** @work_process_msg: processes messages */
> 	struct work_struct		work_process_msg;
> };
>-- 
>2.34.1
>
