Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7DA155E4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 18:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016310EB56;
	Fri, 17 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe2gizet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8F10EB55;
 Fri, 17 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737135790; x=1768671790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tRZoxyI12662GhMO6GWxDt93Al113DssrqRNLpbd05I=;
 b=Oe2gizetY4ZRrC9kCNfOFSmt7r7JlKVPwrom9Wrk6IT7qe6ubtm4l8QZ
 7Sp7BxQC0PDUlPX5Nbgmqwz1a8qTUTKwxrNKo0K0anDScssIrquTaQVnY
 RnExk5mo6T2YxgoesCLBnT4To/DuFSVH4wBva+aV52p1vghzf5xB8y/RY
 Uv3IVL28cpfofwbgfLhbahM+E7UnWibG8GTFPPJL+U4F5IFhq+jNHcFyM
 RcUGMnphNEMvNk7BTbEFsloEIWESNk2H0fqVDWp3KaDegrmZMGSKjLKDX
 ZriXq3hu8WfcNvspXKy/W+mbRWdy+GOsbfTmhBbkdv7C28Kj245+rnt4h w==;
X-CSE-ConnectionGUID: 3Bf4FgETRwyT/3qczvLyDA==
X-CSE-MsgGUID: RnDVhN2CQsyd/+YsQnzdew==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37730015"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37730015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 09:43:09 -0800
X-CSE-ConnectionGUID: 7cPIeO9GRBuGXccsR08yDA==
X-CSE-MsgGUID: 98ScFGS1RNiuA4z962LbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105700467"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 09:43:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 09:43:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 09:43:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 09:43:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8FMhQKIVGFpRmN8bw9yoss99IIDoFEFffuvkeZidmPd1rK6B9TZ91V1FHXjLM72POIzGZmTLPZETXKWeRg0wPLLZ6Y1XVab1o8X7s1x3B/2VxQre8u8YOnKlW73Q5f7EF+ZY81xtIprFYV/ySbZY4eMCe3bRIpJS//+jS1PrP8sVGG3eSuAYYYiBs3Xe4HvCC0QliNJNqVXoHCCZXsg429h/13RMiGP0CyVQh5zZlYC0jEcrstNrZOeZY9sofxIb4AfK4Htl9L5/LfvrwzV9+B95pTwtH+3cb4ibmtyy+nYVRdENZztYLdu+jsxGUisrpbbs62m5BBdyfVuc6m5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf1+MYmbIJ+UeAHyTW1oPDoW0KsbhE3Hpz7VVq+ttyY=;
 b=oiPscju3gU/spjHk5X1KohogyP1AZr9mjS8fhh8RzH4P1WDTAzdeegVGhzypyLIqEa38U7qdy4Kkr2p29bGmQCTi/90JgsKkwL7vzaSSEJyLgQNmPE4M+aK9BtbSJQzivnVoHxj4aV7RYW4Txv7SZ/n1SQbYAIp9R1KwDAv8F6bVczOAL13tUm0PRsiZijFk1aPZLx5ZhZYMScDD5I4agTApV2x1WsOVySNNZfrDS0tpQxJVuvt4PlGycHhH1fx7Xs/0AG/W+pcAZ8fhy7he6Qvlncg+dwON8Ys6r4elvO4ZSp2ruBEufeGQUravPeJYoS+zWq2pPXifrw6a93K9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB7497.namprd11.prod.outlook.com (2603:10b6:510:270::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 17:42:53 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 17:42:52 +0000
Date: Fri, 17 Jan 2025 12:42:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Also exclude xe for drm-misc
Message-ID: <Z4qWmBtbg866SOth@intel.com>
References: <20250117164529.393503-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250117164529.393503-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 20778c4c-8889-49dd-6ba7-08dd371e5e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcIlUF8TmQR3KPHc1PcDFXmMztHfPGcZiy5BQE9TEkBiRptsbSfI9dGSGgiz?=
 =?us-ascii?Q?CfyZ1+y90FdqVwUH+OwnbwTIxhrZx8U6aOJ2GTApJBQOFqjv/G3LYzU/2DZs?=
 =?us-ascii?Q?lcYtkVMh7TexQCVLY2mhKzgKL/nvDSThrx7cDqzLCsAi8YgIa5r+fzDaoUvT?=
 =?us-ascii?Q?EUEJMDm0O7YLdaRGcVYtuhGysTbW0YvlhZ/5hIj9V808DGlRvl8CFqgEVXNy?=
 =?us-ascii?Q?lwxjzhCtpGyzIm+G+pVl9eorhOdrT6OOITlSX25sxVCq5+y/YbAjNjp33Zs2?=
 =?us-ascii?Q?rjHNyM4xojYxZL3ylVxcaukOW6MT5WP7/3yMc62DfOjglZK2NG4zvMU3Ne+h?=
 =?us-ascii?Q?rmD5sE5+e50XdByl5Jj0WmbjiSwz01PGZuLomUQw4QRhfmHgo8joNJXYIE4Q?=
 =?us-ascii?Q?Iynliy2aVgIEwzxJrEKG9UvykEG2gTKHqWRil8oB5p/ER8llrDUjMHR/fz5D?=
 =?us-ascii?Q?aB+6pAeR0EO4uYym26Al/gFS6qpzB+OxFPxz8lECL8P3IqzE6v86QkPM4B43?=
 =?us-ascii?Q?hu3QKmBMRUpuC2Ij+llHsRhPcKZ39EnPo2d5o7ObRJ00Uzt9HdSuEnG0GIG/?=
 =?us-ascii?Q?8mLKm4E3kHdWSRQdrazJ6RvSDVuYSRBXntwqziPIYj99SZkFYuqjI9a3Hvdn?=
 =?us-ascii?Q?aFi1Twaj1j2f2kWUZeFBZYTftnOUzaAgd1+LvrIxqgeRT0TCHhWZokvrDy/4?=
 =?us-ascii?Q?AF/lmyFAzqE11n1B0/XAfzARKuCNbJhGli67IyOU+2cCitHuDQ6todwcXZ5+?=
 =?us-ascii?Q?FTEYMR73c/NIbiqJxYogMTTBM3C9OIklhpXb0LhJpDN1B48t8PK2XawUQvFp?=
 =?us-ascii?Q?f8fm0pga9HP0uPDwyua3SiDgNoi29pLAZXdbZDPFseXArNzDv/QAfrZsoRvD?=
 =?us-ascii?Q?bcjqLVktcVitiwLHk3QQsY4YXrLxzbGo0bU4qPe4mRSTGHq1NhOppe+MoWM6?=
 =?us-ascii?Q?fjniqkliN3A2gml6YqjCHV0FiuDxRUvr8Pp5H1Clotyn1b0gMWA6Bu2Cs+ey?=
 =?us-ascii?Q?K33O1o7MucqdxJDRZFlTXTqqgL8ddstxugvX/UxEwGenOl+bFAskeCjc/71F?=
 =?us-ascii?Q?4XcU6dP+fbLrPVv0hDHRhzrX/ZPmUPOo+2DF/7go4S77ePOJtyLKKzF+Gtmm?=
 =?us-ascii?Q?nH1kadGqX+sPCfGyaIp/PLbjrSzTXEX6A5PLdYbrCO/sF896wHdd9MUtUgkP?=
 =?us-ascii?Q?5HRAOhdddMqLjXW22jBnEq3eZo8TNZ2fcKoXlORq7KEyElmzwsGKWFLxCQK8?=
 =?us-ascii?Q?iPEGOsq/3J6kgCryza89M8q/RxfNWrWzKzYcpdaexEiO+uul5+DSzZSUYCfV?=
 =?us-ascii?Q?c3upkVWV8/a2Kuxcv4HrdVuvsGJY0JLejgBH1z4t5bbbOkqEbO6IRvD2ITeC?=
 =?us-ascii?Q?8RyAWSV9DRtSboBrB09SspCF90Xf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15cvT2KivHSuJVF7XZLrDm5WvAir/3dKZo7JGAxEQEdo9AM3TZkI/Qh/Fu9+?=
 =?us-ascii?Q?AmVOirknlYpAwzrZ8abl8jz5bsidXEhNnMMDSLFLGiRzUV4Dp4uKMXha1P03?=
 =?us-ascii?Q?5UUEWD55lc5VisXIuBy/m7zvK5eNFn4Z4ret9pcYH8mD8iuzMpu07zrYULOP?=
 =?us-ascii?Q?ARDWE2TQwIsU2dR4Qy0tgdK6FfHtclR8NiTygnZ+7P3U2otoRveK5sA68TWa?=
 =?us-ascii?Q?9P4eoONqRlSGJTC6tORiM8OqOvter0GJL7K6sZfa5JqLnaHYmvBbiwXHQVhK?=
 =?us-ascii?Q?MaTK3ifPtpY4VJxPiSfDUDe7BXwA8OxpQRyXMdRqTK5Gx4jvqEnSwreCex0d?=
 =?us-ascii?Q?ihQctAIq2wUh2KNwSNDOPxtJJY0LFdxIKx2e3f0z6M5ac3X2INkcHjd9lX7m?=
 =?us-ascii?Q?cBEA7WWgEHifih+C7P6Of99OjYYKswSjmmwCehG2zTkkag5dinN2olUcBs7t?=
 =?us-ascii?Q?U+3+ZKrDbMXdJYrTlQC3H+oSDn76j7aa3Z5uEpqB86T5R5hjfJqMvQSBVOEA?=
 =?us-ascii?Q?CTrz98dysInD3pCbMRjenBRRl7D5GMX0j/ICkfUhHNoo14zaPL/DaNXcVP9R?=
 =?us-ascii?Q?xQUW5Q4zm1aq1n8H6tvWJ6wsgLdwxDu1x66QgjGWOfVnz2yJHc41gf+0SLNR?=
 =?us-ascii?Q?F4xO/4Td0XcHNBmTMn7CHZrnzZIsPgobDQ+6C3zVW8GWv53q0pwUuRFoq0nZ?=
 =?us-ascii?Q?SJbiWl8PisH2PDAVBSsSHu1ITFGatbWjc7dlorQFmSjZHXyzyKJFrGKmvS49?=
 =?us-ascii?Q?IVDV389vTT0gs6zfv5choF0E4gmN7m5YasFGQWl+1eE5RGqeNs9JJyzDQLpU?=
 =?us-ascii?Q?6iz2ibcitSei+4u8S71f9nepch6x5aRev/voZIDPQ+uSzGKiDmspWQECIUsh?=
 =?us-ascii?Q?1Ftrq8kYEfpmc4XNPgqSYqFtcsJ9twQNGWnrU0bJzvETIwlZ1Zjy2eLTssD4?=
 =?us-ascii?Q?g+pwgKL3x92Ba2/Jx/U+BOKwiVUJt4wScxpJvISJ39syYH1l3K4NJ2AME9c/?=
 =?us-ascii?Q?y5jLn8+RAjJiYKEc/SGAh5+6lIJOCoTwEKdx+mHl4veflxPeWWRb3Cs/aOCd?=
 =?us-ascii?Q?4EHD+SZh9QG8d00LOjWaWVP1Ta8ThQJnQNOHs/RcDYTeF7MAO7RFHvZMRW9l?=
 =?us-ascii?Q?iVn3pqwqBQjs0+a4reniURebfGf2ZdHHvsVS7NTxZOjSx6WxloPtDMn4y4y6?=
 =?us-ascii?Q?g/tjieTnU86b9UsMFhO2H0NFAQhyOKsz8uf/p8O+DSscSTgbYryk8k8NAmmi?=
 =?us-ascii?Q?3ft4tyHZkkSBKruRdTS09MIQ4yRCwCmz2Ufuht9ns2kZbBxDpHd+LKXQjOXh?=
 =?us-ascii?Q?8PMuQGJ5MIdYlvhFjfcjC/FOkotmGX/G0fLvm/seQC1Mc1CqwY9pJf+Y0cUJ?=
 =?us-ascii?Q?nqOsxKWgsz37O0kp2AaD+87TlfHGjwC52UodODEcpYWTqgV9pp1KlLif/5EN?=
 =?us-ascii?Q?j1TSksRPuiB/MXpIM8rayj5FPwafdB5uO4JZZhYTLqzUTHZDZUQHgEOz5PTV?=
 =?us-ascii?Q?Hgae9sdMGZGCztvvMPT/grCJ99A1fGgcKDjbImrbhr3Fcr9Wfvdvvsl+qnlF?=
 =?us-ascii?Q?aoDA0wyNjU5ghjRGYM9gfa/L1q7IJ5CnbpXKDabKkt9EaCFw4I4jTOiKXPxQ?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20778c4c-8889-49dd-6ba7-08dd371e5e2e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 17:42:52.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIKxgT24rDF4/8juqGeci7sIKM3XgxtHYqXWYfgl6NPOvqflSuSLy9LxqhZ5Wi0+7U9uiHf43PWm4YQBAKrgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7497
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

On Fri, Jan 17, 2025 at 08:45:29AM -0800, Lucas De Marchi wrote:
> When the xe driver was added, it didn't extend the exclude entries for
> drm-misc, as done in commit 5a44d50f0072 ("MAINTAINERS: Update drm-misc
> entry to match all drivers"). Exclude it like is done for i915 and other
> drivers with dedicated maintainers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d32d0a9428234..30d8e47a0e5f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7606,6 +7606,7 @@ X:	drivers/gpu/drm/nouveau/
>  X:	drivers/gpu/drm/radeon/
>  X:	drivers/gpu/drm/renesas/rcar-du/
>  X:	drivers/gpu/drm/tegra/
> +X:	drivers/gpu/drm/xe/

my bad! I honestly had never noticed this exclude block before...

at least now I understand why my inbox has more drm items nowadays :)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  DRM DRIVERS FOR ALLWINNER A10
>  M:	Maxime Ripard <mripard@kernel.org>
> -- 
> 2.48.0
> 
