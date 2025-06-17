Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43BBADD99D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 19:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456AB10E082;
	Tue, 17 Jun 2025 17:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBEXVlpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770610E082;
 Tue, 17 Jun 2025 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750180092; x=1781716092;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V6YfRtZ6UdGYJnWjy6soYyRUk0SCk1MUCxa2mq2Q0cU=;
 b=DBEXVlpOdPsYq4oP2RGIl/beNOtnmnK43ZKh9Wg+GvRaiHPd/LMHHtPQ
 HmDu4U2COl+B3XsNcwPgNvBpO1OYQFI1zu0C4smvdNKnsqtfNzrekyVIH
 NAsjDCYbBpb55tD4giU16oJUamhsA8FWFVZJ6EM/ewA4QajFKhN3CUSzr
 qkeD0+zrgBoWjZDTdumKu7zpyrbc281QTu2Swd9mlFilqpDJ+/t0WSYeb
 RMtv8gOwjhfqOwWJvxenMYCzAk3yF9j3KVC6c8fouTSw1vL0sTfI3yEKI
 vlAs+pNJOBQiSPmpeZNz/fth2CupE8ritrgNIWXkZQusa/1xjlX/yKPbs g==;
X-CSE-ConnectionGUID: bcywAbs5TzCmM+RzqeoqHg==
X-CSE-MsgGUID: vf5II6YGQS6hOwDBVSQ3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69818070"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="69818070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:08:11 -0700
X-CSE-ConnectionGUID: MKHS+HR5Tf2t/YsB2visCw==
X-CSE-MsgGUID: NuHK2utKSnShf4wsaC6ATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="152732769"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:08:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:08:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:08:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXY2Wq4HdOiF9QNPxdVHvQJ/5GVVjPZ8YqLRHvXM8FcysB8W+JNwwZvfVJTBmy0ja6pLnqlniqqzuWWaBXa1z5hoy0Dxm4HlBfYKIS/qDdBu1WYJ5qlrziy5se4HYGtGFLFznrn4Eh+Kbbe3xl2vcrfW9+fpIV8iq8X0lFChXOr+KvdqrQ4YGxs5190K/E9aB8LTt/2vjRjrGGKPGrmb9JTrWP/06sqj9QaeDT4c+bKT5cgDDDxZlv9id4C173muvhUys4vZdLLWur9c3u1O1D4N/yAi0wVYMzbwnMMwk62o9+eqeHuj+k30l6Y14VJW61WChcy5zh8c57oizkIz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ9dv83/7vyAySPrXEzrGJ0AZ/P0TdvmsqLUmgEA3NI=;
 b=ZfxYOW3jpnIDLTZtDnJg/Z4ChgbZTc/S5bOSDEfu6b521LImJJNjPeLuhCg4I3ZWKXVHD60lDJLSJ40BLAqv+I01K8mL2DsbX5pvJFxT2fbKbdLtaCQf+M/K0tCiwRwtXboLy4auGG4OIpddTfE1/hZT1h/hpo64X2ek002cukkpwwJYF36i959NGLn3oghYcROVLjHN0i0sfZSxlDMGalIA3dbszLsFH4BQhgwP0Oig0fEDWRYMepts8/T8A9AOwGKn75lc86e4VkDwhncKZ5ouSD7lPbdIhgfPN8CzBFguwwxkgOWQJ18NPQKwsdbgSzp90k/EOA15yzpsdUywvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:07:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:07:27 +0000
Date: Tue, 17 Jun 2025 10:09:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Felix =?iso-8859-1?Q?K=FChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Implement and use the drm_pagemap
 populate_mm op
Message-ID: <aFGhL13lsNFAiKW8@lstrano-desk.jf.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613140219.87479-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c5fefe-db98-4cad-7570-08ddadc16fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vtrnYJgZTgUct98lK7eCcie1QdNDULDDTru9QI9dCkWJsf1GTvyVl0zhlY?=
 =?iso-8859-1?Q?LuXnRw20Y/CNySCnohDGfXEW4FbH6HjS+8VGTnwpVXzpA5acYL84dM91Q3?=
 =?iso-8859-1?Q?fm8tVfHNUMltL8SBZ+aeY10vdtl7hn6eQmFWuaeWqs8cCkiffrdbfZVLVT?=
 =?iso-8859-1?Q?NTbkMbxtWXI68gcpDlpi41m1yZhH16nDEfFDy1KYtSv8qDO0PhljSsI275?=
 =?iso-8859-1?Q?HaF1Hnkf6VLvDltq7BQNvcULSvs5c/b8SJ1eVWa6WqAKFUCl6CPVJujJA3?=
 =?iso-8859-1?Q?LfYeSZWUT8lUXD6jh9dRf/imIkvnGz5en7OwzXobuwQjrrZCyhNJ2mw+p8?=
 =?iso-8859-1?Q?45tgE+JtF0pCYUWu61qxKLRfIIl7fqcnGGwT2ELPSED2iMg41O5IsCtI3D?=
 =?iso-8859-1?Q?OJSFiM7SoSu0B4Cu2ZO2gl3YCHvrBDgon7w3kMYEVqxxpwm6cHfWuqLxHV?=
 =?iso-8859-1?Q?sRwGbmSjSjx6z3yFtG5XbsdWgMd68cE3+m2/AFuIYiBCL8KKzVM/3RSP1H?=
 =?iso-8859-1?Q?PNVplWqxwyifhGSV9nMCuMK5zCTcpNOzMdYQfoFUzz5IsLvBmya3dj+aP3?=
 =?iso-8859-1?Q?56FUviC2g5YcNt8joE0JieG0fDELJM/58xFqzX6wmJUyKWgCnz0pQfAqZs?=
 =?iso-8859-1?Q?/KmAlYuYusZivlcb/BiHqLnD7XiPjSaNYU7p3m4FeNMwRIvaS8z2G6YxPb?=
 =?iso-8859-1?Q?7InuHDEnGh/N6mnqaYdXxTtV1L5dQs+Aixdmr4jUS66sDtMjp/Onpa1VkZ?=
 =?iso-8859-1?Q?nRhO3d9d0HxcmXnvSQlQn/uNHRdDa1a9FrxQLbSx4d1N6j/9Gn1L+cDvX6?=
 =?iso-8859-1?Q?VrexUlxAjMh4uqrgssO2pTAZd2j4S5DTjBgcTKlACrR3tsFm4A1kxhpymN?=
 =?iso-8859-1?Q?yPwAtlyCn3/4m3zV7FrVc9N0yc0EuNkcJl5kJdY30+Adkg4RV6gAvjrQSD?=
 =?iso-8859-1?Q?H6RZF173fg6skklUqJtueWm6yTR467CuzuFzTtwo5NruBM00llCH0kQZoH?=
 =?iso-8859-1?Q?gfSFtTyf7FvuQXXWcpgnNaWwhycP7FYX4VNqjVim2Fw6dUhKpRIq9dJ0y+?=
 =?iso-8859-1?Q?8d41evh/cH8G0rdwuFoW3t3aNPGoAFsCzlZl0v/z0BYAfkfVEtISPfePTo?=
 =?iso-8859-1?Q?xuapLsHcdox0AiXgPsaf/cUh/SLe45UikFnUryP9Q0sSSWCf79oGy0/OWG?=
 =?iso-8859-1?Q?t8XBz0is3Wad64ZDpclnfO3gxAtiu36svtFWjP7whimm24zi0M9QkFN31D?=
 =?iso-8859-1?Q?xVLYwcpvyV5yU4i0b1AFH2Np5jlJdXC7HE3ueBHnx46fkux3QCEc+BFkjT?=
 =?iso-8859-1?Q?q7k03IYoY21OLSYfza6bIbmyFMOtx4Dj3mXjTwK+IpQ//9DHj9A/VAQsPN?=
 =?iso-8859-1?Q?bP9D0veLzV6Dpys2nVwtBnrlJR0QZmUXQXaS7Se+uzG53bbFDWQOjeaHFr?=
 =?iso-8859-1?Q?Lyo1eaLN2TMbs8r8LcCLHU46Egp0HXAAG1owPDFKAQ5lvkX9UTVa2SWxll?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VT2fJcXK0dGGpYzowmgA442thkXxZjA0SUkqPTmTZz1CF8YJUzxqHP7odW?=
 =?iso-8859-1?Q?gMf5LVCrQtrG6lZt6S15ifhl30l+xu83CxIYvBlmbL0FQ7VWsHW8q7TdXv?=
 =?iso-8859-1?Q?9CktYxfsUgKvsvfA2jrmctef6c54x/b8ax5bfyMHLyZH2uWv8TjXmHHn86?=
 =?iso-8859-1?Q?YGufwvGJ0VnolS8IbirFJnkDmxq1zTK0XPR1DMK5wtQbTuYz6UPnh1VoQ3?=
 =?iso-8859-1?Q?+Z5k47lscBmJeTq1JMqA1Mi3enTPIqhTWsIeMgg4Wj4BcS2DTkC1b8JRrz?=
 =?iso-8859-1?Q?7zIuLUKf4/1IRpwkvjvi4oXVw557c8QUatL9OpHC8WnY4tm5gcXO/kBYSu?=
 =?iso-8859-1?Q?seJw2QxfU0Dmk1/hhDMhB5ndnz0lbPsna5Qfp2ShnI+bX06+5LCWx0VPoo?=
 =?iso-8859-1?Q?ceEjUHyaDLt/gQaGchvCLlPVS38LLL5GHwbRB4wkP45mQtuOb/+d7+fiOD?=
 =?iso-8859-1?Q?6sr8KcdMd7xZDr2HfGCa7mtm5IfFXB5Y8n2wBuANLa94/gmnq9Gd5ZDbQf?=
 =?iso-8859-1?Q?MpuBK13rVmD7v5XmPlNchxvUsV3S/ohXitsCwVAcJAEjKFh08Pin8cCAvg?=
 =?iso-8859-1?Q?QzZ1UVRRQm85AVV701CMWcaD5cu3DUJxnD/3jPdIE/6Phc2C9e972+W0is?=
 =?iso-8859-1?Q?vvVRgogwa7rFh8kqRkw1D2HtS8Cy+MW+HNYpHIloICKmGNiqAS7r26TKVu?=
 =?iso-8859-1?Q?5zJueaf/GFC8iWx9VGkbarH6HDfxhLPe8Y49YAVGb5HrGVoPvpoVnNETms?=
 =?iso-8859-1?Q?Hq/JAmDuiF9QFypKuY5o97aVSaMkJRfLCP300R24mfZnqv6AoGwzKXhChB?=
 =?iso-8859-1?Q?kZ4tQyTIcpszSGdVBz6N8ladm6Dgi89q32mdHMHH3kxGemdNfaKjBd3FQe?=
 =?iso-8859-1?Q?rjGU6P4j0lBFrKfIlCVGWEZ7hvpTEIIvI9cVLRTfFWj49CYnwgwGhGH7hj?=
 =?iso-8859-1?Q?kTYig0ZkL9IC//s3JlGk9lFYR75ax6//XFpVpsG/0YxavbekqtEFgqkZZZ?=
 =?iso-8859-1?Q?XugrI/QTkdJ9ZvSsO7dUxWDl9E/b9vtJYuODk3t4TZaxIrclzwGflE8ACF?=
 =?iso-8859-1?Q?SRWFz/qz+wnvhwclpD93O9YX6l5bgYo7OX/0EJ7d5pzDf9JnlGdxsFEly1?=
 =?iso-8859-1?Q?anig+WgGnOhJScTBGfe0cKGZUwUxUDikaQH8Mi6HKeJ4MkVWMX0IvYsZFP?=
 =?iso-8859-1?Q?AOl0GzQL+4Og+bZayYZpjXaNPmNIyh9fGKSC26RTSZixwKyPJMO+n7/QqO?=
 =?iso-8859-1?Q?DCJ2SRnS1Z8ohuqb98ZNg2a9k7KK0YM6qbJE37obePL291PyrXhVMEbvSt?=
 =?iso-8859-1?Q?pmu9wmSeoqXT8+nUALmsMyDJrl4IsrNL0TTwG0HaT5g9l8j581yzbT/pPw?=
 =?iso-8859-1?Q?cnPtRbrd2Ao3en5AHAaPe1rhQNLi5DQ+DPKB6WIdA0VwctkQ+OyRK9ueDq?=
 =?iso-8859-1?Q?GyCzTlbT7av9SHQ9kfmnfF7MEy86mcB0bgl0WScK/+OJ6qQg5SRHclZ8ro?=
 =?iso-8859-1?Q?HP0DgNMsvqCpMb1TL1Dtz+cIo2jsN0QwyHf041GTiIfQ0cO0YGETxrei83?=
 =?iso-8859-1?Q?9eazBOiItNaQD27pN5b+YZQv68hPbATy0txcYTV9eRCKT+s6XN5RIFZT8q?=
 =?iso-8859-1?Q?SHmAEgu1pZl6HzBgMoB7EXvdpC3AAV9vYVb8xVqYjJkaIsK8vsxFDH2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c5fefe-db98-4cad-7570-08ddadc16fd2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:07:27.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnIZw0z3UZNBCVvXhnYZsn4zqA2zXVVZS9e2nkhCiZ25Mf4uUNcMD7CuFdmQRjLyxMy4nyUH5Ki02s7L+IRyDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

On Fri, Jun 13, 2025 at 04:02:19PM +0200, Thomas Hellström wrote:
> Add runtime PM since we might call populate_mm on a foreign device.
> 
> v3:
> - Fix a kerneldoc failure (Matt Brost)
> - Revert the bo type change from device to kernel (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c |   1 +
>  drivers/gpu/drm/xe/xe_svm.c   | 101 ++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_svm.h   |  10 ++--
>  drivers/gpu/drm/xe/xe_tile.h  |  11 ++++
>  drivers/gpu/drm/xe/xe_vm.c    |   2 +-
>  5 files changed, 76 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index e4120c8db262..e0d0a1137cb3 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -829,3 +829,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(drm_pagemap_populate_mm);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 51b01a11a0cf..6e760a62e3c8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,13 +3,17 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_bo.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
> +#include "xe_tile.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> @@ -525,8 +529,10 @@ static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
>  static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> +	struct xe_device *xe = xe_bo_device(bo);
>  
>  	xe_bo_put_async(bo);
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
> @@ -720,76 +726,63 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -/**
> - * xe_svm_alloc_vram()- Allocate device memory pages for range,
> - * migrating existing data.
> - * @vm: The VM.
> - * @tile: tile to allocate vram from
> - * @range: SVM range
> - * @ctx: DRM GPU SVM context
> - *
> - * Return: 0 on success, error code on failure.
> - */
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> +				      unsigned long start, unsigned long end,
> +				      struct mm_struct *mm,
> +				      unsigned long timeslice_ms)
>  {
> -	struct mm_struct *mm = vm->svm.gpusvm.mm;
> +	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = xe->drm.dev;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
>  	struct drm_buddy_block *block;
>  	struct list_head *blocks;
>  	struct xe_bo *bo;
> -	ktime_t end = 0;
> -	int err;
> +	ktime_t time_end = 0;
> +	int err, idx;
>  
> -	if (!range->base.flags.migrate_devmem)
> -		return -EINVAL;
> -
> -	range_debug(range, "ALLOCATE VRAM");
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
>  
> -	if (!mmget_not_zero(mm))
> -		return -EFAULT;
> -	mmap_read_lock(mm);
> +	xe_pm_runtime_get(xe);
>  
> -retry:
> -	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> -				 xe_svm_range_size(range),
> + retry:
> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end - start,
>  				 ttm_bo_type_device,
>  				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				 XE_BO_FLAG_CPU_ADDR_MIRROR);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> +		if (xe_vm_validate_should_retry(NULL, err, &time_end))
>  			goto retry;
> -		goto unlock;
> +		goto out_pm_put;
>  	}
>  
> -	drm_pagemap_devmem_init(&bo->devmem_allocation,
> -				vm->xe->drm.dev, mm,
> +	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
>  				&dpagemap_devmem_ops,
>  				&tile->mem.vram.dpagemap,
> -				xe_svm_range_size(range));
> +				end - start);
>  
>  	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>  	list_for_each_entry(block, blocks, link)
>  		block->private = vr;
>  
>  	xe_bo_get(bo);
> -	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
> -					    mm,
> -					    xe_svm_range_start(range),
> -					    xe_svm_range_end(range),
> -					    ctx->timeslice_ms,
> -					    xe_svm_devm_owner(vm->xe));
> +
> +	/* Ensure the device has a pm ref while there are device pages active. */
> +	xe_pm_runtime_get_noresume(xe);
> +	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> +					    start, end, timeslice_ms,
> +					    xe_svm_devm_owner(xe));
>  	if (err)
>  		xe_svm_devmem_release(&bo->devmem_allocation);
>  
>  	xe_bo_unlock(bo);
>  	xe_bo_put(bo);
>  
> -unlock:
> -	mmap_read_unlock(mm);
> -	mmput(mm);
> +out_pm_put:
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
>  
>  	return err;
>  }
> @@ -898,7 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> -		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		err = xe_svm_alloc_vram(tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
>  			if (migrate_try_count || !ctx.devmem_only) {
> @@ -1054,6 +1047,29 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
> +/**
> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> + * migrating existing data.
> + * @tile: tile to allocate vram from
> + * @range: SVM range
> + * @ctx: DRM GPU SVM context
> + *
> + * Return: 0 on success, error code on failure.
> + */
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap *dpagemap;
> +
> +	range_debug(range, "ALLOCATE VRAM");
> +

I thought I had suggested a check here on
range->base.flags.migrate_devmem, that seems to have missed.

Otherwise patch LGTM.

With a check (or an assert) on range->base.flags.migrate_devmem here:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Matt
 
> +	dpagemap = xe_tile_local_pagemap(tile);
> +	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +				       xe_svm_range_end(range),
> +				       range->base.gpusvm->mm,
> +				       ctx->timeslice_ms);
> +}
> +
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  struct device *dev,
> @@ -1078,6 +1094,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.populate_mm = xe_drm_pagemap_populate_mm,
>  };
>  
>  /**
> @@ -1130,7 +1147,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	return 0;
>  }
>  #else
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +int xe_svm_alloc_vram(struct xe_tile *tile,
>  		      struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 19ce4f2754a7..da9a69ea0bb1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -70,8 +70,7 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx);
>  
>  struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> @@ -237,10 +236,9 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> -static inline
> -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +static inline int
> +xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> +		  const struct drm_gpusvm_ctx *ctx)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..066a3d0cea79 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -16,4 +16,15 @@ int xe_tile_init(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram.dpagemap;
> +}
> +#else
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d18807b92b18..d07264e8211f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2913,7 +2913,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> -			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -- 
> 2.49.0
> 
