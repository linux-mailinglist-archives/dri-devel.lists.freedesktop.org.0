Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B82AF6454
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCC610E764;
	Wed,  2 Jul 2025 21:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ac/l8RVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BCB10E764;
 Wed,  2 Jul 2025 21:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492900; x=1783028900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bw+j5H+8EtANbua8BmJB138RkiBEpgQ9Fn6Te7D+7Rs=;
 b=Ac/l8RVh2vUMxiDw6MccmqrT0wAR1EgcOyyCmAUe5VI6hxMLRnF4Vb4H
 LdTE1pbMVCrr/pUtnhSGaMDQQrl/dYEbL2eZZqGrTWMvSGLVg0jFcZyjg
 11EgM3D7F3ZCQHHKE42WANWB4YlJJquf6bPdZy09XzCYTImQgp0SM8zoL
 I0Jod/hqjCpsRzKZ3lwDahj46QykpW24S+9DPRyVMFFKPWlEZwtm2DM/O
 y0Dr0NiAMxHS5zh51C6kG4Ds/2RBvryK4AP1qr3qjOo/TVuabRzACt9cv
 IMf5wBdjAypQ7x0PJh9FYr1TOraTE88IA17Sol0abuByBCHdUd2tTnrw6 g==;
X-CSE-ConnectionGUID: 60cJcs/JQsGQ6tC4JyXIAQ==
X-CSE-MsgGUID: 19k6SrLtSiSLk2LskPGv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64051075"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64051075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:48:20 -0700
X-CSE-ConnectionGUID: q8xNtlzYTPGzm3q2qHp4wg==
X-CSE-MsgGUID: rZeNE/BiSs2Xd9etjqLWGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153958877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:48:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:48:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:48:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgqaCs0YtxYFFjKLcmiKoFJfh73rhn48M+43g6Xj1i0+XIP71R/Zu2BX/hGn0cTaXUgSKc3Jla++zwKOxDd2z7cnBBIpEzv/SIdWDLbxm1fmaRktZ78wI4caPihEHMR8h2b+MWejBWvkxo4zQdoXU0DVHubrU4GP1owUl7TRwQKvuhRrpsWHlRX1uKjeaKfLP4groN4ZUCD1Ciotwkg5KpzTrzA7VKXjc5FzTncaQv9ZzJYszYxIzri0y/aQJziDh13gkKLn+QR9LW2Hxrcpxc5IVZSwaAPZh/UVUd89sl0c9ed9rfrW+c7R0I4RFfa4OJnM90QP1j4o8mQ6jPWuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeL5TBLek9YuOuHPnwyMxK5gUq66Fo2JtaU1GTFWtQ0=;
 b=ggJ4SSatQ+Wy5l1arg4ggtA9QfdUm6Li+c23OGT082POb0WDSRwhTvB2PmJzXE52i2p2rFToIxRRTTJvfm4tJWpK6KNb8IXpfmwVpOY/5Hyd1NVLYEoeNogu4Nk5cts0m6zZP9C9auB3GPHq64CfjUvAbHqaURxP5I026d1//pwcjI7z3TY6aLwvpl/GEoMwGMoODeuQnJTIPP+uXKObpKDt+IOOoVOwyLEmAWR6u1Phk2GelVNeVaINKe9ESFRHsnUq75ncOW08ENCDWfk84+Et2e8zQ8ZpsvHSt2eiJqGBRIaBb0wmj3f2oqdmGz+WUIBIHIkXKndN3ao7jDCzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 21:48:17 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:48:17 +0000
Date: Wed, 2 Jul 2025 17:48:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 10/10] drm/xe/xe_late_bind_fw: Select
 INTEL_MEI_LATE_BIND for CI
Message-ID: <aGWpHRrPR39LWKQ1@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-11-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702165216.557074-11-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0057c6-d20a-4f00-1e7b-08ddb9b2276d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BG6wwdYoy6rHO8FBj9zIul46NBIWhcfO33VAmZT4AT/X0S4o/1cSRdXaRDWZ?=
 =?us-ascii?Q?NVKurZWaFMV7kjU8EiRmTLfEzZaNtP2GRRWQihsa65osf8hS7/h15Ex82rG9?=
 =?us-ascii?Q?5UCU67mYRPdH7wgHC03cTf3FxSWyWLd24w/Av727Ka4z7DjZfYpKyUTXUYwy?=
 =?us-ascii?Q?vlkqwZCaXQPXaTgb3cEwVSpwgDm4ubvJoTADSge3GjJ7Rzk+F5x6YtFnHIMv?=
 =?us-ascii?Q?PfE8cSXmhVp4Y+mXSyEk/H5MrHBL8Ks+gfLtbHeQQBjqH04QvhBIilPrULkg?=
 =?us-ascii?Q?w6+N+NEIROGgZDYpGw0O/zVxQIgPjLxEXiu1pBAIbArOrKJT1ZCychL/lMj4?=
 =?us-ascii?Q?IIKqtixN4iuR43benGz8y+VcWM5oVFQxjNj4gyZW+Tp8H9EyMX5a36Nsz+J7?=
 =?us-ascii?Q?+pK8nnHDvq0BngY0Ds+iGcVN7bArys5qsksv9TDk3kQNXY+GEhS8zExoDX8U?=
 =?us-ascii?Q?uXi2a7miKMTfuIsl7nlg0rrL6T7a1toqpBvBRh/sBRcBgDVnPuTYEwDQkXF3?=
 =?us-ascii?Q?6xISGL1iF+LF45J+VZHPieO43veRHd8TXmdBcF6lNjiMT/DRmAReauAoQ3uX?=
 =?us-ascii?Q?MlAtaWnsJcO5IDi+6PzSa+RzZcy8c49QD1EhGzcA6jK3O7jffN5LtBrlwjyW?=
 =?us-ascii?Q?c4VpgsjBBxgZaXsPmPsmKLaTXMeFwf3ZwNLyb8MROXMHRT4t7xNemSNNBpLC?=
 =?us-ascii?Q?WRIItNC7Vae5qjp1OF6icZXudqikIlfQtr01xRLoSTf6l8aFexgYhrsv0dVH?=
 =?us-ascii?Q?tw9Ckxf6B3w7J3USlAmxTvjKLiaeb5IndAcTLF8GmYxYvY7d3+RGu33LCjJC?=
 =?us-ascii?Q?lRfAr3Yo6Tl7PkZPBmP+1troGIovTXe57OLrVZ3SYHLnY7fw6fQQUY62KoRW?=
 =?us-ascii?Q?nVaQnUDHpC+SYKDFICxG9InQB08dWFaT1CyAJY30H28TiUYvgut+jTWclslj?=
 =?us-ascii?Q?Js0cnBGwlLgxCyh4rWIXMnomPm5aKGlE6u2yYbRSyQHxdXn5B4g7CVBX+Ewi?=
 =?us-ascii?Q?YfsB/N6WEpAb8srRXa2Lj0nIBccPTAbTn+qRis0Qbd1Vn4arsosAYElBCkBH?=
 =?us-ascii?Q?GzvOzhSAy8jKK8grvuqKU6fCCwntw9EfVuuJJmxnOXPoEUb8kFW3XNoNqHT7?=
 =?us-ascii?Q?4eAfrLw6n7Jl4usKuIDYsaSlQyVqAp7W8z0VEbPPdCMgWEcf6Fc3e9QXkKTk?=
 =?us-ascii?Q?dKxdbif3dV4xjA7tdbPQlsTCU8HIrTLJg4qMZaYVItxj+ex33YmrGr2JcR4T?=
 =?us-ascii?Q?9jwNMvrWyN8fTTYz5kEnT+jX49ZktzC7lyS17wb8nmI1DHqRp7S9MyiJ+w0V?=
 =?us-ascii?Q?fWc9digQMDBwmps82FPKAjX8CiKlNUGORRNe5f2Jh79i5v0JrDAypnEpXI8v?=
 =?us-ascii?Q?CIlpXTGphuupIXSto3csd+DcjnnZabgQbiVGt+JCzpN2RtNbVC2xidIk2zcu?=
 =?us-ascii?Q?K/C4DG3LN5E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j/mx9aFM7tWka2A7+7ohHunt+Y0xFgp+PQWs+y2TYVa8CsHqC0GiWDEtD8GX?=
 =?us-ascii?Q?wYZZv9rHBb8rFgxJfy/VOzCskVxxu4IyMjRoTyytk45p++lwK7CAqN8ddWp5?=
 =?us-ascii?Q?uKSXJG9P4Y8xFIeoDoxpGXo/GzTR0YDPlY9EGIOyiC13oW+fEBpJqZpMreZO?=
 =?us-ascii?Q?6eWlUVCqIHebsNSxD1JpdK7lJNWe0PxUAXhFsdtKk7zwZDwGovU5FI0Qn4nF?=
 =?us-ascii?Q?S1c79V8zO6oxO7FkYnPALUclITB+45ARMk80cong4Awp4lNmgNismHtH3UwE?=
 =?us-ascii?Q?59q9hEQCiFlU5SrnWimHZwh/LWadZnCBzYBOywPOXFeg0LkQd0XwlENoHReG?=
 =?us-ascii?Q?dGHV9EOF+AfHTGtiIsovWjm45CuibaASSDwJMQzAsHVKP1BClGjlx1YzUZrv?=
 =?us-ascii?Q?13Nasv0gGcngXI6K8j7YKE6qwiARBK9iLqi+KGwMXN/iNo04AA2qwkROWeUw?=
 =?us-ascii?Q?9ewVZMLZO+Bgg4LxmxgKCGG2+qEH9ZwK22yX0ZHS9rtfa4i7XyfXXGBlUhxS?=
 =?us-ascii?Q?I1pmoE/H287vu0i/b6nBgkVoWzAp72vKf5fuUxmIcXn99ikGPsBHahbUT6FQ?=
 =?us-ascii?Q?LzvlIdfJzg2fgrg8E63L8cXjkHUOU85mFtrPB9xZa3nQfrPScbQsdPePq13F?=
 =?us-ascii?Q?1HOBJweP9EeTT/pYLkw1nRDhXKQ8/rUn/PxsSvviRUodkODz0n9SJKRCxx85?=
 =?us-ascii?Q?Ibx1jbPJtAYBk/EjgcJ80DDeVsQrimHyEEwaITb9pagcVfVuukDub6jURZgJ?=
 =?us-ascii?Q?TIohhMqPc84ejjj4ue8oinc8DRXExcuNjOgXLoQVfnPZnUOZlM59BHYp2EAT?=
 =?us-ascii?Q?qSjWTBxq/pWsSrn5qvhHDpYiQChW1QRXmDJUDEzM72XY15C7NtC4oZ/yutiO?=
 =?us-ascii?Q?APrwbwtHVDvKJt8h214I1wjtmDy3hpZAWS59q2vQxECTcARh+SXx7FXzbfe9?=
 =?us-ascii?Q?RupdkhcyA3AIuCWBAUht4B3I7V2ntZp6+JNCZLSrS/4ai3xl+CWYWt816KUt?=
 =?us-ascii?Q?hIV1+mj0JXusowbtfh6w5iNRVO0WVh8XTOaZh328L5xqsKRIlOPxBI8J3aNf?=
 =?us-ascii?Q?8VnJWoqKC104HmzDVCQoiQXtMdOhLeeKAwaMKpNVC0ywV565/W8JQCvjTW9/?=
 =?us-ascii?Q?j0KU4w41gn2q5Qy53EGMHvFmNvlFoTLAI5LmOPGscBYY7XDESFfdlAq5x6iC?=
 =?us-ascii?Q?Sz8nkks799XTapaYLCgDbMN+LZThC5+gVxZ7ow5ne+SlB2GlCYu8x7lJs8Hr?=
 =?us-ascii?Q?/1BAJWTyWwsYk/zQldUWY5QtgKEZYA7CxPKpn0DdSzKhJDSiWFUeuwNryiL/?=
 =?us-ascii?Q?84dA/kwq66oKJWW8OwhGHql3jsHhiMtWI+rlsNYyZRli/9x89CfvSJvd7bQ8?=
 =?us-ascii?Q?bYsXouy4lGNmkxKz3ndz5XaFp08a5WAsRrlu7HxSzlxSafNmucwB846/xHzZ?=
 =?us-ascii?Q?MWB2LjDEzlT0tySqz9u71qLtnk761LZBZmf4FcklA6KEVI/DlhnB2ezuipDC?=
 =?us-ascii?Q?WwtZdzAlC5q2n+Y3W84broopsUQNzMqcdTufj0eGe0qJYYDBsHvhfwn9GXdh?=
 =?us-ascii?Q?Mv5gpRhQI58W/tBd9YE/iVPCutnmesgoSj+ap+tvpSeRXPxX3NmUUI7Rypiz?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0057c6-d20a-4f00-1e7b-08ddb9b2276d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:48:17.5492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hl8Yf1H9tUSZZNqnEJMDBM+7LebFDJSN1K+WCFok5AvbgZMFoNGWm0nbirbLAzNAd5cay3kJfSQNJBcx8Ct/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

On Wed, Jul 02, 2025 at 10:22:16PM +0530, Badal Nilawar wrote:
> Do not review

Why?

Why don't we add this dependency here?

> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f66e6d39e319..ef3f4807b0b3 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -45,6 +45,7 @@ config DRM_XE
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
> +	select INTEL_MEI_LATE_BIND
>  	help
>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
>  	  for Xe series is also available.
> -- 
> 2.34.1
> 
