Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3379F99B3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C544410E3C2;
	Fri, 20 Dec 2024 18:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfa3vjA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8610E28C;
 Fri, 20 Dec 2024 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720320; x=1766256320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qR+n7TqasMn4YDsydWYxan65Pi9C2MJQC596ENogLqo=;
 b=dfa3vjA505RBwNka7WnBDPeWxS/vYztBje4EDAUgJeNjhV5lEsIMUlD0
 Db689a1z0eCImPhUyZj2aoX63oTA0soiArZ8xDg6tiSelx9pjl6JmsuNY
 b9sezwoDhUbxUaKppu32i2WjB/lq/H51S7ZG++D14RNTOy/xpMj9R3tjQ
 Z7wVovNMoaU7WyXwxAC9jAUSNXgxDdTzr+V9Pzp0ZfvhVg3wMsBWB7lZn
 3g1AIHjT4oikvO73IMcr8AvFbJollRMS+PuXgBsIdgIdDm7MLAysQvEBl
 nf60xOVt2a1tjfmjDyMkwotY+TNB7oAi7KojwQlxSIXElEZyyx8+02YFi A==;
X-CSE-ConnectionGUID: RLOIYYAeQh+1p/FU6mO3tg==
X-CSE-MsgGUID: V87vYGmzQimJvS2pKLbjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35158109"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35158109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:45:19 -0800
X-CSE-ConnectionGUID: xFlLluozTAyEBHM9f3z0PQ==
X-CSE-MsgGUID: 1idHVZRUQO+HXdeWkXAzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129395885"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:45:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:45:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:45:18 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:45:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxcE3rrJjeGbgOaXqxLWMfjeBD/o9O5lsDbDkGNsUvnLws78h6VXSqthWIfxubelcKOIw8hFcHLSyLfCbpSwaUTVCxAwaUTjpmiBEzwN77QBYbMPvJN0LGa5/XgoG2AHkhdLscEELFFQiQG1Kx6r69OVViZddXHSlPyAZkjhA2qAN+rDirWXYg7y+SQOYJnn3bjjfv/E4loKqk3+FY94BWw7RHCSItIaGcM8o66gmf8xRJzB3k2KLfpxVcNdwa1b4b7f4Y+r2KSDxloubSRg8ET+dWopY14ylCNG5gHPajkd2AWSEAwvimpBbArjQLKaCF1bb3VSuElmByR8JCZiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoGsIlaga2Hx8QtMiYn8JYARyafbzmIt2MkZinxaE7g=;
 b=eXLnodXJDqDqihLvrHr5PDa/vbPSjZxiUDZmFOwEbi4nycfPwZWnonetL2wmbUQZ+PlONWC9BmDdE0otT73QxXwWRaEWbVG8jr07wBf1MtzMx6/51RhkkNkTpZ0/B5oDsyXI3cGhQB7d0MWMzv2YgS8e+pyHYedXJazNo76x11u9VpwkBsymUuHqmQhlbyZVFtMAK3dzBdVRzxoOrc0G4Nxj/RpJlA303HmotbPNL5n4+NohgKRfKX329BhaJS6IPwZqOyV9fwtTdw/9spPnZXoO+Xjrj2HqZ6eUMlswgJVTGhZjQrUSpTtPxVHAdAdOwte5Q8KykXl4S5ZmC5s23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 18:45:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:45:12 +0000
Date: Fri, 20 Dec 2024 10:45:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 19/30] drm/xe: Add SVM device memory mirroring
Message-ID: <Z2W7ZeSp2shCGLoH@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-20-matthew.brost@intel.com>
 <b28530af-ea5e-4297-98d8-174d473e1d84@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b28530af-ea5e-4297-98d8-174d473e1d84@intel.com>
X-ClientProxiedBy: MW4PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:303:83::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: be57f6cb-4ed3-40fe-9a14-08dd21266fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zc+H9EyHpPnVIa0XZ61fopIX839ZA9hfoEiXz/QjPD9qhcPM0PgJWfigDLxh?=
 =?us-ascii?Q?JXvnI5Xb+KhJw4iIjFZHxhq2gQTqc4QrWkjUAV4tHfxPNNW0ad4HVsmNoIKa?=
 =?us-ascii?Q?0KttFGPpns37mii4hnelkOVQns8LVJdUCcE1faaNs0usqhD5pwl58PuPWX/k?=
 =?us-ascii?Q?GsYZ5UL3QPCLfOOO7ieijpp5pYYursOqj3fD6wPzPE9KP8IQWLY1KX5fb01c?=
 =?us-ascii?Q?R2+hOSzruIIYYdyLwaxJGr62eYJa5CDlB++QYN2ePHkX5gPFHMBYTywhiFzR?=
 =?us-ascii?Q?7yhQyXLnGz7kYS2tLopQlZOM0EeD5pr+PLzb7z3hM8D4u14jtMpjI7WJYh1b?=
 =?us-ascii?Q?DqpPzMDTTSrgi6pNRmjJ5xTZs5xxuN9BK9hCurN0WEolgb+P1p8dzXyk8HOm?=
 =?us-ascii?Q?QrD3mTlJ/K4HfD2Y7Sgf0kBwVvfw//HxHkOfZsqPE6HAbwafwRSx83wNzzt1?=
 =?us-ascii?Q?IFLaCVouMZuCN0onOD/hCODR5WLYMSteJeOqoDGl1M/rU90ZT48Tw0+ithSh?=
 =?us-ascii?Q?WQq8WRTgLbPIkVjF+7mI9uEJ/EQaBGT/bFRiB7Oz/e2cFbBGI5cupGv5Fgu6?=
 =?us-ascii?Q?GkOqbn6JynuwdiK0Z2pswZA2YHbCZB5vkX5pC8YdUlyWVzA5VeShE0C1/TkF?=
 =?us-ascii?Q?FGniWamT06q/qbd1M+EXnGN0KkjEkwhuXYicM0I9zKdye/2JTB9JSRfvo1ci?=
 =?us-ascii?Q?E+2lCz18M3OSYzNelDKQoob2CoOyHB7d7/3CEtTM+2aaMJc/zSQLVlgoLb4L?=
 =?us-ascii?Q?l1jt8ZahHQkfGlmAGRd5rnI1DdLmAy9eLmfQa7dkm7M5Y4T6q/vzTIG1FUW+?=
 =?us-ascii?Q?EhkyF9svxNjGkhedR7Fdt063Ia4qk/8tNhHX8nVD0mMXLUHX6UlLwJGlB2Vr?=
 =?us-ascii?Q?E6f89A+mrva2tvR5ogXyM7BkrwI51SFuezkTL+kNXCDrl+JuQsCuOwE9zpKl?=
 =?us-ascii?Q?eE2/Y5M0S4W13cFJ5L+mBNRrBs4erXdo9CfFWAgXqtNplk26R9WjrEFyeMDM?=
 =?us-ascii?Q?X1nM7eRN4VFnzy/5AJsAKjQbY9LTp5Zk+1QaP1VGcqJKLY5IMgXE54QEp0fs?=
 =?us-ascii?Q?gWlRlhcmdqzP7j7YW7kDlko4rVQFtDpl1C+FG/DPOcRKhJqnuLr/wDAf/QBZ?=
 =?us-ascii?Q?Iq7YrSND0irM8L5R//ScXTD9MBRl+Ih4bIIBkdd2rsIYRamrHQPeLi8nMGn7?=
 =?us-ascii?Q?hrrct9uiAuKHzLieDgmI8cjkhUfwn5QzSSzDcd7x9vgpBKmm8VYtlFB170pl?=
 =?us-ascii?Q?CYE8kjQspmjP9a12wzH4SyaFApbWUaBNXjfveYGm0LhrDYo3aWHNdiwnT0te?=
 =?us-ascii?Q?UJd0kmoxT0j8lvxqd6MZ0tZkOoih2VI+gW0x1OZW+4WhQJOk1MBBf5ypTOyl?=
 =?us-ascii?Q?e9qoLLxS4svC1+GZsQXGhsOAVxx0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOmfN0l2jMQf4rIql2MVASschZR6Xver+VxWD1LDAlZZxS6CkyE3ZGtyIFc2?=
 =?us-ascii?Q?aWNcGlsBp3SRHQg6QNtUvX0Lo4LeMx6UVzCPCLhdThg78H0NuEhPTI8QC6BN?=
 =?us-ascii?Q?SBVKTei+c5Vo5N1UVSZrWmX5fxHBUkjkV6TAZl/Ozut09LA+TAq5WaNl8F2t?=
 =?us-ascii?Q?VPiMWc74qbZj4Nj5S/gXF4jYRk8jiSgQkbLIx9NyuVu6f07LFk4HmlJVDvW0?=
 =?us-ascii?Q?KLNMYiOBSxDPY6QzNn+/tymHREDiVQYx+Fje2nEmStC6kP3Zij4WyshhNKh6?=
 =?us-ascii?Q?+1PLRKW6VD/eyatYJoHMSGqe1kaAoAIdDTEGmTE3BPaT+91d/7JJ5ndLeu2W?=
 =?us-ascii?Q?BeV34S76Pt65GRIm2T5shNEzfeAi2t8zggxZCiH/XjueHIQ85eFi+YBkHG6/?=
 =?us-ascii?Q?v3FVuJydRm6sfE+pflecDhXhcaOki8QJC1+kLdLsdsA8fTw8H8s2HkHbtPEs?=
 =?us-ascii?Q?L0VM45oyxdgVpjW+4GGgcizYxErgGF6mc78qXdUGQuAQV7K9g1FeX5BYXpwU?=
 =?us-ascii?Q?FoWL8/TLqdoN8zwpMY7EQ4r1xw7cy+bNVGFMZMXroqQOU7INarn6yTjyyyuW?=
 =?us-ascii?Q?ZF/W1i0Ra2WRZcq7zrxCVJAIXmZ5/xmlBG6l0vcrrmCkzrQ37TIagsp0GRtH?=
 =?us-ascii?Q?zQ7GxhF4pMoPgeBcB7t4fS7HWefCCF7+WvuXAzSmIcPZcswXVnasLUFBwSDb?=
 =?us-ascii?Q?BI3kMVxIcT4sJqtCCufQb9DY9G2zkTpEsbqG4asL8nG0nVsMJClNtVRwpxm0?=
 =?us-ascii?Q?nIjWPB84tdHW1JbUyLlbM2uwB09Voee4qucmNaFhk2ngzz025yVFX3avdrmC?=
 =?us-ascii?Q?mLV94lx6irR5dExqdJeDyC8/69aIcIckug31XSKHjTHuYuwJlQ/JeR8hdTfN?=
 =?us-ascii?Q?T5mnB9t+SYAOBPthXgd3LRMadJ3jOOCU5un23d1IqLprlERX7NCkuF38dK95?=
 =?us-ascii?Q?8hieT7S1d+0EdsNbE34h4ASYJF2BU+eIF/uSAlHo5KILRmOVb7HRcov+/Cpr?=
 =?us-ascii?Q?sJmph6DQho/76AlzKDih8yiu1O9306jAA5xHipNBDn/FNDo+t4gUz/B8e+mb?=
 =?us-ascii?Q?zyUFKamusLGZEnRFezA0+ILRBM9smnG7nqSU0jQXmkoY80cG455+66pbptLh?=
 =?us-ascii?Q?KtpJrjZJELXkud8iiZgX4RZsN64Mvw0KHV5rNaQy8WyAPNlg7Gjfe/NKpXve?=
 =?us-ascii?Q?C/9MNaeWfn42DTY/Sjhuml9U1d2nwZzMu7Pz3iCYta98eUOt/y1qpHTUXZhx?=
 =?us-ascii?Q?ux9eIYm0mL03STkhT16a3yaLTV4VVQWIi6roJr20WU8GuGzRjmEH3l0uyvVE?=
 =?us-ascii?Q?V/hk7dsbs5gMvX4c1EbHzZXElNxzguHkO3ZSY7g1HD4Ln42TtFGuaYT/fui/?=
 =?us-ascii?Q?PkbqVDyhjEaoJ4u4VJFufFQRuwDSCwvMtAkLmMCnQoKWKx+V80X8dhAQzSAo?=
 =?us-ascii?Q?xCHpmlYUv2zdCFyLWGWXH7NTMtybvZNbTNvbDHnx9uP/1ZjP1iGgEzG/QyrH?=
 =?us-ascii?Q?v9r3kDtELHDV9bpbpxElWW4tVng1dYvulh4bB8N/W8L/hrTvCGQTriIyjYVl?=
 =?us-ascii?Q?HWJldwdjqeICqYWSiU486Qt7/3zZ01l/gs0i8/X/6hBlDqXaSikvFglUDMde?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be57f6cb-4ed3-40fe-9a14-08dd21266fe0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:45:12.8750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYdFivVPD4+xEAP/dSyHMdbgFpJJGZUctVkKZdVq+S77UaJOVvQvXlwO9GkxrbYSL3Ji4l7WT1ya3yDTe92Dlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

On Sat, Dec 21, 2024 at 12:09:55AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 18-12-2024 05:03, Matthew Brost wrote:
> > Add SVM device memory mirroring which enables device pages for
> > migration. Enabled via CONFIG_XE_DEVMEM_MIRROR Kconfig. Kconfig option
> > defaults to enabled. If not enabled, SVM will work sans migration and
> > KMD memory footprint will be less.
> > 
> > v3:
> >   - Add CONFIG_XE_DEVMEM_MIRROR
> > 
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/Kconfig           |  9 ++++
> >   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
> >   drivers/gpu/drm/xe/xe_svm.c          | 62 +++++++++++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_svm.h          |  3 ++
> >   drivers/gpu/drm/xe/xe_tile.c         |  5 +++
> >   5 files changed, 85 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 3a08e16bfada..1989c99a9f5a 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -60,6 +60,15 @@ config DRM_XE_DISPLAY
> >   	help
> >   	  Disable this option only if you want to compile out display support.
> > +config CONFIG_XE_DEVMEM_MIRROR
> 
> 
> %s/CONFIG_XE_DEVMEM_MIRROR/XE_DEVMEM_MIRROR
> 

Yep, missed this. This version is broken with proper Kconfig enabled
too. Working on fixing this up now.

Matt

> 
> > +	bool "Enable device memory mirror"
> > +	depends on DRM_XE
> > +	select CONFIG_GET_FREE_REGION
> > +	default y
> > +	help
> > +	  Disable this option only if you want to compile out without device
> > +	  memory mirror. Will reduce KMD memory footprint when disabled.
> > +
> >   config DRM_XE_FORCE_PROBE
> >   	string "Force probe xe for selected Intel hardware IDs"
> >   	depends on DRM_XE
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 8a7b15972413..b949a960cebb 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -102,6 +102,14 @@ struct xe_mem_region {
> >   	resource_size_t actual_physical_size;
> >   	/** @mapping: pointer to VRAM mappable space */
> >   	void __iomem *mapping;
> > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > +	struct dev_pagemap pagemap;
> > +	/**
> > +	 * @hpa_base: base host physical address
> > +	 *
> > +	 * This is generated when remap device memory as ZONE_DEVICE
> > +	 */
> > +	resource_size_t hpa_base;
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 3cbf29732249..2860e54bb035 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -19,6 +19,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> >   	return gpusvm_to_vm(r->gpusvm);
> >   }
> > +static void *xe_svm_devm_owner(struct xe_device *xe)
> > +{
> > +	return xe;
> > +}
> > +
> >   static struct drm_gpusvm_range *
> >   xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> >   {
> > @@ -306,8 +311,8 @@ int xe_svm_init(struct xe_vm *vm)
> >   		  xe_svm_garbage_collector_work_func);
> >   	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> > -			      current->mm, NULL, 0, vm->size,
> > -			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> > +			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> > +			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> >   			      ARRAY_SIZE(fault_chunk_sizes));
> >   	if (err)
> >   		return err;
> > @@ -442,3 +447,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> >   {
> >   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> >   }
> > +
> > +#if IS_ENABLED(CONFIG_XE_DEVMEM_MIRROR)
> > +/**
> > + * xe_devm_add: Remap and provide memmap backing for device memory
> > + * @tile: tile that the memory region belongs to
> > + * @mr: memory region to remap
> > + *
> > + * This remap device memory to host physical address space and create
> > + * struct page to back device memory
> > + *
> > + * Return: 0 on success standard error code otherwise
> > + */
> > +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> > +	struct resource *res;
> > +	void *addr;
> > +	int ret;
> > +
> > +	res = devm_request_free_mem_region(dev, &iomem_resource,
> > +					   mr->usable_size);
> > +	if (IS_ERR(res)) {
> > +		ret = PTR_ERR(res);
> > +		return ret;
> > +	}
> > +
> > +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> > +	mr->pagemap.range.start = res->start;
> > +	mr->pagemap.range.end = res->end;
> > +	mr->pagemap.nr_range = 1;
> > +	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> > +	mr->pagemap.owner = xe_svm_devm_owner(xe);
> > +	addr = devm_memremap_pages(dev, &mr->pagemap);
> > +	if (IS_ERR(addr)) {
> > +		devm_release_mem_region(dev, res->start, resource_size(res));
> > +		ret = PTR_ERR(addr);
> > +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> > +				tile->id, ret);
> > +		return ret;
> > +	}
> > +	mr->hpa_base = res->start;
> > +
> > +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> > +		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> > +	return 0;
> > +}
> > +#else
> > +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> > +{
> > +	return 0;
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index ddce1069ba1e..85832e6ed3f5 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -11,6 +11,7 @@
> >   #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> > +struct xe_mem_region;
> >   struct xe_tile;
> >   struct xe_vm;
> >   struct xe_vma;
> > @@ -36,6 +37,8 @@ struct xe_svm_range {
> >   	u8 tile_invalidated;
> >   };
> > +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> > +
> >   int xe_svm_init(struct xe_vm *vm);
> >   void xe_svm_fini(struct xe_vm *vm);
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 07cf7cfe4abd..bbb430392dfb 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -13,6 +13,7 @@
> >   #include "xe_migrate.h"
> >   #include "xe_pcode.h"
> >   #include "xe_sa.h"
> > +#include "xe_svm.h"
> >   #include "xe_tile.h"
> >   #include "xe_tile_sysfs.h"
> >   #include "xe_ttm_vram_mgr.h"
> > @@ -164,6 +165,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
> >    */
> >   int xe_tile_init_noalloc(struct xe_tile *tile)
> >   {
> > +	struct xe_device *xe = tile_to_xe(tile);
> >   	int err;
> >   	err = tile_ttm_mgr_init(tile);
> > @@ -176,6 +178,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> >   	xe_wa_apply_tile_workarounds(tile);
> > +	if (xe->info.has_usm && IS_DGFX(xe))
> > +		xe_devm_add(tile, &tile->mem.vram);
> > +
> >   	err = xe_tile_sysfs_init(tile);
> >   	return 0;
> 
