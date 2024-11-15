Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E229CF59D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 21:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667C210E8AF;
	Fri, 15 Nov 2024 20:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxZpgWqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAC210E3DF;
 Fri, 15 Nov 2024 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731701924; x=1763237924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=70emvtH4rhvY6Z/Yxkf6NzHVWHnrwIQfJrElynTSv5I=;
 b=OxZpgWqr1UQZK+zZ9LwN6xc6YEKtMf5+nV2K+VmphEDPv0waa0pJd2F5
 kyZcVyFw+sF3STz88w4s3rR6BVIg3IxbfXhYrMF4wtaTtIX2s80GuXg/m
 5yVJVYdGnBUlkuJPhHGTMXo+ZPzEMOs180TbHku6drXon1KtMUOs90MeO
 15JlVVlTE/hlQqNvz7DfDhfO4udS6i+/XYhylzEc5A1XPm5vxknGguxAi
 tAa/GtOPx/meuzbQg8SA5pqWHM3zszWFS8RA4kKPDGJEovUY5aRVMLD64
 B0iX2IQamnD61AExOf0HBkj2mMT3mOjspSvach/rRq1QCloJYL17tuLBo Q==;
X-CSE-ConnectionGUID: yLb1bMMnS6yOlFPT2TDZNA==
X-CSE-MsgGUID: pXxplL52SVSQ4bcsm3Xu3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49156535"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="49156535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:18:44 -0800
X-CSE-ConnectionGUID: uMBgAGSASrC2x0FRt3kCcA==
X-CSE-MsgGUID: wPk8nSvGRYOLES/bCT0SHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88763994"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:18:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:18:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:18:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5D4BadtSTnfrZGT+uQhl5ItepSk/hx88ZIQ7PAUiAeYHvUb5Iauzc/D+GO1DNGk/Nq8V7aRsfewvttKWzh98OAgcDEPBHurBJCEHwthToirM4g4snk8qXalt1qw8JyiDB2x1keI/qck8BCz9S2Iw9EXEMRl0e+B/9Z5vLFVrLM4beXtJs09i8Qpffe5rbzeSIXK3fIv+M3qcLTrYCkwzubZ9yCtc8it2+SLZ5eZacdo3uBAVpkfj1nY94GEflhlV7spZAAvOqBYd4QGrFaeZD/CkiOeGAhVNRw2g5dtmmQUnFCu9UGNZ0hOPyopz++UtC8OtTCTL31BE0iv6mmJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVYa1ZXm2sYbL5JpdiltX3hV1F6hvhE2d6wNJU3oJx8=;
 b=n2aXPJ47vCK1uQgF0KxwBPTk/vXO6AGG9xsP26zISkqJeux11pFm/PxoJzutXpwx9GMEJQ7WkS3zU2mMZxF7gBl6Kjc6wueGxLHNIOSBGwzQDMRMXc21BUOoj7aGVRq2Qd0EO3fHjJ0up+HDEIK3YscHaDQgcQB9I/2CUk9U9pBqdSDMff6J5fezHP/SCF2wn4sR0dh7lQl4PD4MKo2hkTeL8xe4Q4kYI0dewxNnaSHfJT6Uckp7HvBWWz7e4wM4EqM/tMwA3kE9loNstFp4PTVBQ6L5aohI5Toch6ZgKevoHwfCJY7tivqCEzCUkYDyAfpIYh3qyyFpReeReS3UTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 20:18:39 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 20:18:39 +0000
Date: Fri, 15 Nov 2024 15:18:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/i915/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Message-ID: <ZzesmYGuVzLmY0un@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-3-imre.deak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115164159.1081675-3-imre.deak@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: b581ce63-e0dd-4092-e7ad-08dd05b2af5a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?auUtSMuQIvWFChk/cZi8jjS5nm082vIeG+dIhPgpdsFPY/f6EmHwjxuN4ojS?=
 =?us-ascii?Q?s9JAV54b98MuBvSNTLi5aPmJHpEVQYa56nOJG5AUYC4afBVrZ8BLjOuRwsH4?=
 =?us-ascii?Q?JYbGN2OwaUBWudyZIE8Ye9atjqj/r8NsKOrxV0DCaajO5P0t1SJ2T7zH5bLv?=
 =?us-ascii?Q?IQUbkMfdV5tfmvnvWV4sgu7LYYLjvUV/RUjx45CiM0VW94y0aP8sfBPl5hOy?=
 =?us-ascii?Q?waaV/C/H1nYe3QklV4ry+pqEhA1III2cSQqiuayVlEHyhwBBn+M8wL1dlV7X?=
 =?us-ascii?Q?/QYUo0OqZxbmmvB8FIa32qU8bt4hHupt19tgGUJvIjYQCJ/3Zj+9CVrPm6Rm?=
 =?us-ascii?Q?VdeGhkaOT+0Foh2kp6DJhgFrordIDm3vSt2LjPWjKF9PLvWE76iYpfPwueeR?=
 =?us-ascii?Q?jeYmuwi/VLB0LvWqtSjcnmgkQUrg5toCIpuFKYBwMjbkXmnGz1NFXEUT4JCp?=
 =?us-ascii?Q?gP9IoQOtnv7mAFDnMKdqSb+kXRncnEScD4qtmJZjrTPv/uxl4tcunbPj4f4X?=
 =?us-ascii?Q?0TjwMKRw6Iuqod8Y9LtFQF5ezsJHKqZyDpAqmI1hLfNeLe+JmwjjBNBy+96M?=
 =?us-ascii?Q?UKdQvgW5fPYPI0Om9aNXGXB/gx9INw7AC3bNGzvKANesuJ/IRdGAk2qZS4jx?=
 =?us-ascii?Q?lrwgl0MqVb0uBCtU0PVWhCQ8C3qFcMFtlAXwgxZSGGMIRdnsSFyn2/PKyFox?=
 =?us-ascii?Q?cfWw5Qgwhjnn72O3+T+CMiaV9pjSlQRDizcNFEWvBuKWT1YEZnh0IoogUDI9?=
 =?us-ascii?Q?5shbHcYfl/HdL9cD3C6Nr7iCUKDDVe1vl83XUkKeXoFm5jT6NIHnv9CN+rge?=
 =?us-ascii?Q?NTPLOncjJK7dkUomLJECVEqataKar21i/ZllWhkNgMAEHHmRvnnHL44N3gXw?=
 =?us-ascii?Q?WgfD/BD4+YI3R/LRxwXwgEXgdFGQAc8/8LSdVWX+LAuddFw7P0LwZMrK3q8I?=
 =?us-ascii?Q?XDup/j63R5xi718yQxIrSnZW6CwIxt+3O6WiIL4KWZbjWrPwNi9E9V1HOWDS?=
 =?us-ascii?Q?IHLk3ywwviGUDIMQak02iE3xxMIo/1fqe1JllvYM8fbbejw9U1gEpTW+x56j?=
 =?us-ascii?Q?p23cEhcjJBu+mT2vovR0TcAJWZPRPbTR1NuK2sEN9xvWYMUm85m9IOdDvFmZ?=
 =?us-ascii?Q?h1Gno2kcD80nNbwh3bL7Di/6PQlHQZ6Ic5qRJvibm1y7Yx+pS8aqsVoZ1F2e?=
 =?us-ascii?Q?yuRAI2J5mrnKbzT8JVPDZ3mKcweTQniMNjuqSzXbwjzNUPgZbVDAcYLg/nu+?=
 =?us-ascii?Q?vrarZcYLJMiPYoPw6x2BEyCu/nfJvbo5XWStaJWuw8kGUjm+Nfhw0XIKZHAc?=
 =?us-ascii?Q?fNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpkbpqTZi2g+MNNDNYp/U3R/oU423NJ+g6UvGZtfkCjwbCNoQT5dcGj2uMIq?=
 =?us-ascii?Q?DI2HnWJIGjhRWIU9qA1oc4jAu/kir8vX6KddTBG95Sj6aUyoxoyHKqCNEejo?=
 =?us-ascii?Q?kINsJdSvBuLmCn05iYTFqBn5u6yQqN++G9oQzP9gCml/xs8VQETuNfWlkJ+/?=
 =?us-ascii?Q?/cuNBbPggJWIO8uxoL/q9X6du/6Iy5XR1WTRyObUpYpEmTBhQaepuT++AW1b?=
 =?us-ascii?Q?W397X1jkZU+ZB91upi2Btooh2960MgVOCJtiMykxR0rDOURZoUzgEDUfkBwp?=
 =?us-ascii?Q?2RioGfphBH5+h/4E87Fuf64yayvkN9LFsUFXTcxyt3M63EDr3wCRMff4sUIA?=
 =?us-ascii?Q?CgtCvatr6TG+Oqy3o4qlu/HOuyaP4gPPRkFOFgqt66IK/yVkIq7GU99MeeAu?=
 =?us-ascii?Q?/uNaVQUO4FhsoXX6K3BATjZI/Bp9GLgWbFXZmjwcXVma9QlhdQlWRpovgofa?=
 =?us-ascii?Q?pe/WhA55zUQ+FcVEDArOKoSddH7XYWxIoiOVygTBirO1yekmHR0D2blyMVIj?=
 =?us-ascii?Q?/vzL2Qj6joqQ+KnHS6t+w+gvyMLRP7Un2rtnavGglDGSiwiJbMjh20gepSGW?=
 =?us-ascii?Q?P/Mqp0463n9GYTsagfBneChp1zy2Ol8DjIJCDrS0gPhLObl9hsz88g0AVUB2?=
 =?us-ascii?Q?AdIwbttPXaqhghkXsgDucfE2ncHWUqvEz4c3z+Zv1kar4f3KFl2L4/ajXaZP?=
 =?us-ascii?Q?5xvrX1md6nPPPSETtbTsltoTB65f2hNlOLW7wH6DQV8saJJX/AcgJWjsHD2j?=
 =?us-ascii?Q?o/j0K7mz9+N+cajp/1xIDS+A/wl+Jg72qrCyOeyWzst5ahEgMOs1HlyiKnFT?=
 =?us-ascii?Q?/iTB3XHkpLOE/Mbu5Mo1RsON5SrKkh3gq/S+U9QeBp8DYPoC7cmC0N884sFJ?=
 =?us-ascii?Q?kcUVc75s/KkELNO6dE05YwWzt9+4Dq/+WDpQMay1SFX2gGDITfQ9Fx0ga7Wl?=
 =?us-ascii?Q?GrDzP6yR5Scv0n5ZtiTwfqin3M8L3D4MD+P2VzNkJOzP7SlKnVdmZUcOPSFK?=
 =?us-ascii?Q?3WGtMdP+3xf6GMRC+F+d/xX9EtlJN/mUmSK5BmJT5swf9TK5YMM8cGVXDZjf?=
 =?us-ascii?Q?JPYL+1hBHPPDVjm9KWAp4vem334W9+teSP/IdVKYsWqdFdKK4/6xaz7P7xZn?=
 =?us-ascii?Q?CB5Z5kniu6ckwtUYYW8dJCMc36RKGKFIuF+qCifmn3s8lAZbgRNAV/VRjSSB?=
 =?us-ascii?Q?ey9s4V/t49os+6htdqEIE2zRJQrMqWvQUfmkEbnnAw+J2zKMdbTjSWaNC+Xl?=
 =?us-ascii?Q?mfxWS0p3ZlBkaCVRgrkOfXtU5mnrEEhzMp9Ec16gyUMj+p3VPhg4xyeF1Zut?=
 =?us-ascii?Q?ow55yyAONpvkmNkwGEWGJT1QDiYUTz4Qju4ytBdon1JrOsERCNUNc64V6c1G?=
 =?us-ascii?Q?Tsdg94NFd7F5naYy7ggsJ62fePDNqn9E/dSE3YuJHErfS96sw/ZcgNUHMJvS?=
 =?us-ascii?Q?iBuwfaYixJY0I1sg/Jc84+P1pZRW3uPU36lIKu9uzenUHsqHHFipv/ZlV4qs?=
 =?us-ascii?Q?hoZGPEP3/RYKhYvZrMRjHdMFPlbmfdgAQNz5Jon1x61jIvIR/5z7DVOIeF1g?=
 =?us-ascii?Q?Bo0c19nUt2zWklbNP9g4JffgLw9Fcwc4aOiCDnRNdmMMNLPtxUG4yvuEjsxP?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b581ce63-e0dd-4092-e7ad-08dd05b2af5a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:18:39.4397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvPaXxRgRoRkbCvho3w/MoY1rqOTm8eBMiCISasW5rtSF1lqM8NYX7aXsIZFwkFUw0sx8LFdn5Y9smUSH+2J4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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

On Fri, Nov 15, 2024 at 06:41:58PM +0200, Imre Deak wrote:
> After a connector is added to the drm_mode_config::connector_list, it's
> visible to any in-kernel users looking up connectors via the above list.
> Make sure that the connector is properly initialized before such
> look-ups.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 ++++++++-------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index f058360a26413..d91a1d1fb26f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1719,6 +1719,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  	if (!intel_connector)
>  		return NULL;
>  
> +	connector = &intel_connector->base;
> +
>  	intel_connector->get_hw_state = intel_dp_mst_get_hw_state;
>  	intel_connector->sync_state = intel_dp_connector_sync_state;
>  	intel_connector->mst_port = intel_dp;
> @@ -1727,30 +1729,19 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  	intel_dp_init_modeset_retry_work(intel_connector);
>  
> -	/*
> -	 * TODO: The following drm_connector specific initialization belongs
> -	 * to DRM core, however it happens atm too late in
> -	 * drm_connector_init(). That function will also expose the connector
> -	 * to in-kernel users, so it can't be called until the connector is
> -	 * sufficiently initialized; init the device pointer used by the
> -	 * following DSC setup, until a fix moving this to DRM core.
> -	 */
> -	intel_connector->base.dev = mgr->dev;
> -
> -	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> -	intel_connector->dp.dsc_hblank_expansion_quirk =
> -		detect_dsc_hblank_expansion_quirk(intel_connector);
> -
> -	connector = &intel_connector->base;
> -	ret = drm_connector_init(display->drm, connector, &intel_dp_mst_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
> +				      DRM_MODE_CONNECTOR_DisplayPort);
>  	if (ret) {
>  		drm_dp_mst_put_port_malloc(port);
>  		intel_connector_free(intel_connector);
>  		return NULL;
>  	}
>  
> +	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> +	intel_connector->dp.dsc_hblank_expansion_quirk =
> +		detect_dsc_hblank_expansion_quirk(intel_connector);
> +
>  	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs);
>  
>  	for_each_pipe(display, pipe) {
> @@ -1771,6 +1762,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
>  			    connector->name, connector->base.id);
>  
> +	drm_connector_add(connector);
> +
>  	return connector;
>  
>  err:
> -- 
> 2.44.2
> 
