Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265CB9CF598
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 21:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EED10E0A6;
	Fri, 15 Nov 2024 20:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgXqf5X7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F26B10E0A6;
 Fri, 15 Nov 2024 20:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731701847; x=1763237847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hTLZIAVrP3jrXPKPC9b2LD0hD9S9/icgf6ZO/cfWauw=;
 b=MgXqf5X7ettfnOLEJhtUSSPcI9ToRWARn0oY4Ql0W67yKOKOYQiag/SC
 /s+UVrkiYv+408FodJiav82H0kaUtRoTWLj/6h4m4DG0Wi6loX2CXT63K
 48BxN/2L/nurynORyPdR1BFjRkCcwDKyMoDpXqtxKrusu/zvT2pBNOlf3
 Unxhmof6HlcWKfXxIBEU18DquzJeq3r5TaSEFlMHuWAKIYQzudEIiod8o
 C4+5IF0Qx97llUHZpR9v5cpr2DeCdC9Fy59o6NBu8saT5TRLqNk/UZrK4
 BbMOhhfVWAJDkEM1fur1kAMJRnP19j1X0e5pXdvClN94wlpZtP7HI94JJ g==;
X-CSE-ConnectionGUID: BDyiqYbASaicekvjQ3e8LA==
X-CSE-MsgGUID: n9/j8KJGROq6cHw/rS0w1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31135547"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31135547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:17:26 -0800
X-CSE-ConnectionGUID: 7sg5uzvjSjGO7ZOoPIk4/A==
X-CSE-MsgGUID: /XjlEeq+QoC7DZyzr/RqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="92736711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:17:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:17:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:17:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:17:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlceYY5j1sisEMrTghACRkERqAK4ADrOGiYtn3rlI1Kd24fEgKNyERa+JANtpDgb3dzeDzEmF58HMPXlLe1bX+3qEpLZ2SvPty+vqGLcxaK6EsmPenbrulEdX6brALmraDpruq9wUF0jQt1bEuR4sXMUSNnoUK73tT+HWHSf0xfroElOrd9usoAMOBCZJODPHHqSTCpDJiX6LM2HzPLIGMrAWWG+M+7+UUKLqs8lp49+OkyS93YUdxW3qa1/zTuUY1NSwJxRASb/Bk0WO8vP6Bsp197nnnqP1FNjvenRxabAjwDmiZJoQeUZz8Eb5VTsWV7r3cS7mkwpOlhdgJrTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/CTpd+er6IoNSkXuZIqK6NUqj1CpJUhKaaGNZIeing=;
 b=F0FTGNC+yz+eePgE0xqtAXWzSAt1kvZTAJwruFb1liPe3GUtaYuzzVBuDEVhu8MoKGYv2SuD07zPOdbHQqPekbWXL5Yfo0DMgyKYHgWinDBlhScdiiksBEyW2Mlw3oEGusLQ1v83m88Lnyf+sTLAoq72G9RdCJnXeiNxR11HOPfjhHljuC5gTqTqm9EjJEiEPbjzDhmGasI4dYncey81I7mpztEIMCqwCGlMEeMlCdl16mUv1L2S9YZ3ktNtV/enqxTV+Q3hNTxFrh2uqyDl2+Y6Ki5ib5jZug7/XdG44U0GJyfML/qRy8/gdYnf929XicYT37atbfg+f3fjvxcn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 20:17:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 20:17:19 +0000
Date: Fri, 15 Nov 2024 15:17:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/i915/dp_mst: Fix error handling while adding a
 connector
Message-ID: <ZzesS36ciEmCgVYv@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-4-imre.deak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115164159.1081675-4-imre.deak@intel.com>
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: edab68e9-4194-41f4-d902-08dd05b28139
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U6awnmCaoSKso3ogZ0pRhYcEkJL7S3dApsZKm2G4gaZrmT5Wfkm8H33x61GB?=
 =?us-ascii?Q?Czz25VYDOdsx/z6SX06zq0HDCm9Q3Sb7XEobPLlSxVoq+IyuNlRtPfJZfkiX?=
 =?us-ascii?Q?aQ2dLhKASWt88BQv0JhLucOGMbLNUy1kfdU+DqZ9kavsgiULX0eY2klx8T2Y?=
 =?us-ascii?Q?pgIyBILNDN6EjCLQH/GYKy/rM+EUKaPGYK4tkpTSo3C9OWOrihXCYY7lr4EV?=
 =?us-ascii?Q?8VGKnuAup8Vmi4xVEZzhZh3MhDUqY5CcT+uaH0PJTBYDaI4dMeefm25t8OrD?=
 =?us-ascii?Q?8XsADT/rys1ggg1nrVpKtZ/4o6jTZdy/jETXwmGgXWMN6r0qoso8zyGLNp6R?=
 =?us-ascii?Q?bj1kx5bPVpH2UetRBvK2MzqVTH6fxbzM99JbZIGLD7mQtmvM3G7qjXYC7DPY?=
 =?us-ascii?Q?Mm7nAzlY2a1yhYwsf4dTIU0dAAPownlFMJ3HSS95Vx3G1iYaIWK1u9gpNuDn?=
 =?us-ascii?Q?lhsOjjNY0TWfbzAuXvIsmI8A+MS5xZu2/BSBo5nrFSMcnxipVdYviVWkMZN/?=
 =?us-ascii?Q?Vjif+QkXngl1PrU+LKCe9HkN0h4psDnUsL2kBeAx257YcpNEvy8JGEEpdNEi?=
 =?us-ascii?Q?KdLTt3h0M5lHdKEXXZVRzmGZVaj2T/8udrkeKsNKLh7khF6ycnZ15AYJ4dqx?=
 =?us-ascii?Q?DBLlz5aD5Sq7RMc/HLWe0i54oKcEp5vfhNxZbk05cWFhM9RV/SqmTCrcpdMV?=
 =?us-ascii?Q?o89HnwYXTe7rDFIYIyxv9OzudScGFWrcL7VxXNvnMk1m3UiCxLfF1KsoK24Z?=
 =?us-ascii?Q?jToIdnDnnqsHsuEwCNsOrjYv7ni34/WiIHUjUFoLMouzI1wWcBxN1MElQbWe?=
 =?us-ascii?Q?VX0x26Uyxvz0doGN6EdlmMxvLeUK2gmQNJHeptq2RfDrvtVPuYIiaTuiVXuW?=
 =?us-ascii?Q?kgQYkUo72XJYMsn2Rt7It4m8ktgFT1APvgVIwvE3jW5nOozVXRZRZUIQSpur?=
 =?us-ascii?Q?yjXHmGXG9w4Z8dLIL8BleuCzoECeQer1p21m+hB3XOsZrYaWNVwgUKPxE5Qp?=
 =?us-ascii?Q?5VcRcpEbty2fH8WRO+36/FlhK1Mqj3ZmRCCp4QFrb9XjyyNO8InUqbDzxyVG?=
 =?us-ascii?Q?2yamtmZWtEyA8IAgn4JZP3blQUieEnoDioQ4AjuqULuGCUcvssAxJ9KCEBPo?=
 =?us-ascii?Q?zHoHChFhTQT/qji6Le39J1q/kcwsEbWhe6SemIEbBcFtfuLh3aeMrlNt5ndG?=
 =?us-ascii?Q?fxNeR7Z3UTHFaZMgwGGCiGU/r6MowfXQGgtT9iBYA0D2wVhjeijErh1gPjNL?=
 =?us-ascii?Q?Vl9A6pMDPBx0izmuENR1IbV4POi8CuSktuCI/jCqW4a4FQWzQe4VWZNYz5pL?=
 =?us-ascii?Q?LMbgSfyj3F0fF0zKq6pNS+in?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRy1IuYUhNNrHrwDBUlQl8f8sBSYa1QYdEmQzz/0zh+0DFtdTHf0c7RoGHaV?=
 =?us-ascii?Q?KpAr7HpLm6yonrdrIXmLIer8CV4DsnkJckqTNWrmEr9oSgGlylmWOxLIUsPm?=
 =?us-ascii?Q?FO6wbVDcJzi/NzasqVFoiyHdEmE58hZdbdKGusokyksZhIHkOkrELVeYJcyI?=
 =?us-ascii?Q?rITxLccNJD67z3al0s0D4yZ5FSsQA4BI3s21+W/1y9I+ii4Xyv4JjksxjRnQ?=
 =?us-ascii?Q?v7T5McWTPdhtcoguRjrc7rm7kaBf4XG87Y8XPlLz/fh1LxxEm5/u85bXgnvr?=
 =?us-ascii?Q?wmzA72RALV8vNaQitVAFepY7h6Y9FUCUd4l2qhcyBH7vX0etVr1cQDcA9is5?=
 =?us-ascii?Q?SgvchAScjReZOkEAxJCls1BoRFvmCToQSwh9FqxxHyv4VM89MYQ6alQzQn5T?=
 =?us-ascii?Q?zGqba1u0cAN6883ya33b0Y6OsI/uwMSK0lyvnblt9dBs1Mwk+I6HfmrN9xMb?=
 =?us-ascii?Q?4XX0+HDSOLgEQ+H30OjH7IfQhjuw1I75tUIbGHu5bgKnQs6Q2N6EzrmZAObf?=
 =?us-ascii?Q?9vfdbnmta/mqS3yFxIwEPabELhXOvaqLX/KbibiYeSR25zvkLmXbe1Aq3PcS?=
 =?us-ascii?Q?G9jUKV6QoaSQ5z3/UZPeJpNj7i9utDx6Tod6hSP45jgqKZbWiYObAdc7ySam?=
 =?us-ascii?Q?nKr9CosXmtTBWY1XDl7xniFO7QHluN3imXoStWsJ7xB5mcUyM6JW72QfQI/p?=
 =?us-ascii?Q?bwKPnvFlGMD4ubokEHPrAhqMxoYDYeA/KL3Cz4LZiRIJ2v//6J8m75MAbDNK?=
 =?us-ascii?Q?zs0Q6VJiTZ+IZLSI1lXwPeMAO5Uobs2EVJXmytefUeT5R+GQ2DzHdc3yG0nb?=
 =?us-ascii?Q?H1eLcznbCUjxOFqVchAaHcrg65YvxQOHFM7NBCjvhJ6KWlUp+m2/PeMcFPd9?=
 =?us-ascii?Q?XOuN2gZqbGlq+0Z+5BRaNWWo4M0mzXImW23JL1QOeqaEv2xNIZP2/gro9IJ+?=
 =?us-ascii?Q?FQ7XVXO6K4pbWU9JS3qfrGk52QUD+qQgUs1xQ11FpB1NSd40xnKwM3njQp93?=
 =?us-ascii?Q?xDloFcB+hQvXTRU6wRQM4fQ4IRfMnUS+sa5AP45FOSuAcxH4WpBERoW7hwI1?=
 =?us-ascii?Q?8fEGiPCcmDX2P7d0uSjeJRbQVl4akTqSWDhlWm87N4kI7ZIg9CEu09s06sHX?=
 =?us-ascii?Q?/KtpLxRZTMw8B6A4w2EUGkStaa7/ltknCfdPllXUWZTmcnSoiNIugQFilGXn?=
 =?us-ascii?Q?11ZvqSGaXQOhoyTUfBIM65AHyqFuI3ostDt2VDbGoRf5EzfZ+7cVSjmA5H/Y?=
 =?us-ascii?Q?3JYcUT+jEWwXAWTaDSfAatfy1V5BhE8zSANWiV3vcurQCIu9mWAhWL+UL6QR?=
 =?us-ascii?Q?42mulB8gG3DDj2yB0nLGQO6LG1gZLIcRysPNSn72hKQ01DpVnZvCj6xBNVLe?=
 =?us-ascii?Q?ZIOcMP3XJLafuSqZ5QBhYS/a6vZbt97qUf5nqflzdcFWOJ7upHVPBk0Xdp9n?=
 =?us-ascii?Q?/Iv6WVRTHxexEsKk1YBIgBls6mpZk10cL1OqjdUv79F42cd0WR9JndP7XDVI?=
 =?us-ascii?Q?vAgCPskeBJgQIPtAxAANxwxh5D31y2/cCTCDv56WO75fCicwe1yo3xL6+gOn?=
 =?us-ascii?Q?ofW1aC3azZja75L6uHwuM00UkKrrYf0vTSkSKk50CQZGh9hNbq35ybqKlTSk?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edab68e9-4194-41f4-d902-08dd05b28139
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:17:19.5456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0btT0dXYySUKfq7e2+ebZxJYhyOVDBViMNJLUKeGIK6oaHyuNvpGkeG9sxqWlVtJxL/Le38tCKXGPwSck0ydg==
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

On Fri, Nov 15, 2024 at 06:41:59PM +0200, Imre Deak wrote:
> After an error during adding an MST connector the MST port and the
> intel_connector object could be leaked, fix this up.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index d91a1d1fb26f4..70daa9131c92d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1731,11 +1731,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
>  				      DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		drm_dp_mst_put_port_malloc(port);
> -		intel_connector_free(intel_connector);
> -		return NULL;
> -	}
> +	if (ret)
> +		goto err_put_port;
>  
>  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> @@ -1750,12 +1747,12 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  		ret = drm_connector_attach_encoder(&intel_connector->base, enc);
>  		if (ret)
> -			goto err;
> +			goto err_cleanup_connector;
>  	}
>  
>  	ret = intel_dp_mst_add_properties(intel_dp, connector, pathprop);
>  	if (ret)
> -		goto err;
> +		goto err_cleanup_connector;
>  
>  	ret = intel_dp_hdcp_init(dig_port, intel_connector);
>  	if (ret)
> @@ -1766,8 +1763,12 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  	return connector;
>  
> -err:
> +err_cleanup_connector:
>  	drm_connector_cleanup(connector);
> +err_put_port:
> +	drm_dp_mst_put_port_malloc(port);
> +	intel_connector_free(intel_connector);
> +
>  	return NULL;
>  }
>  
> -- 
> 2.44.2
> 
