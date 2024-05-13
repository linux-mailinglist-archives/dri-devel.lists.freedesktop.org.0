Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274688C44AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FD010E2C5;
	Mon, 13 May 2024 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+s0afhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD210E2C5;
 Mon, 13 May 2024 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615900; x=1747151900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fn2EXiAI8FMWCEstqovKijm1dVrrBRM7l6SS5ZtFe9E=;
 b=H+s0afhIzVaHW8qSwpYK2mBsk46jbfew5UmXb3OJrIXHFtRh+mt+zJLT
 qve7ixHN17KnEXLf6DQBt7v7k3slkYSZQ5MHon/MJd6BuB+TqERz0epJy
 iCzFlhrE139IEImrBuDhbtCgNRdVKv7imA9Kls/x4do7KwGTyZ+4dUnK+
 feMYNm55ytG4hJRcTQFWBE+18BJRe+58H1uUqq2Uon1FbcCzLxo3gS+Ih
 PNZ79+nZLnKeIdp1doAomO0huZoOnpxf2c4yWMR7VAe7shwhZAbDzavyn
 7izgozrhFpvbrBH1Tk+Zqfp6rpEy7B9dsxT8YLbbkUh37l+xl7mu8EJAU A==;
X-CSE-ConnectionGUID: rLYJ8jIIReGu+fcuBIZ8TA==
X-CSE-MsgGUID: dMQ6NW9TSg6qBePee4pyKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22707135"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22707135"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:58:19 -0700
X-CSE-ConnectionGUID: hqShVNvWTc6ON+b8Ez+Pkw==
X-CSE-MsgGUID: nL7APDTuR26Li6o3xyb9vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34809210"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:58:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:58:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:58:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZl7CjXOu+LjDgrl+Ns6T23myMH8uz9Fe3cZ/URKcm5u2SSWHphy19cFnhg6RoKeTWChgttn9qO54WSve/P2lDecBaxyRaL1y2g198YazLV4RFRP81T+0F9sfQUzYA8CZ14nY1fY3sJM4eSxyJg0I2/mmlE868ulvBy17dfS2n+DwOTUtb0u4g649RTHYRBh6ctUQS6q4T/79Uuk8hSl36qqQvX2fymbifvF3EZ2G2FcbIXRuOYSC9ELKhzmEbYNq7kl8aYlU7Gcilabh6N1/fIuiDWa5XbnYpA+dovnjyBMSPG5vv8euB6ciaP9afeyjzHxG4rh9IGvfhiZ7reOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBITgpUil1EJWaIPdnWwbClxuoz3aGvsRysj4n6u24s=;
 b=MAPjskOD5l4DE7RTcbHik96rgsjbEcJqT43cazEe4zV+1armv1H1jQc8LSJMKHYV+9AcZ58Zc3DKWlx8Y2kXhhjwosjMZNnsmIztuOhZcVpI+kQRTduTT83Kl0OiKhNKoo+qbOVosCg2Q8R+ho5x6H7rcZyScAw6LW7/ZbEKFwuBAGmbU/ae4OFvJBnnfJmZqLP8F1Q/msVmqzGVtuJvPszGGh6896QZf8BGnginllFF2QSCZWWjcblQeBIz3dZk+rRxBu/PwUc9Hp4apEnL0o2AYKTmQz04R+n0fSFykq7MKO4JjVEDqnNrkaiXtOHhDGPpDaXhvZuvL5hcILvVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:58:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:58:08 +0000
Date: Mon, 13 May 2024 11:58:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deming Wang <wangdeming@inspur.com>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gem/i915_gem_ttm_move: Fix typo
Message-ID: <ZkI4jD4K_sRliFls@intel.com>
References: <20240513061451.1627-1-wangdeming@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513061451.1627-1-wangdeming@inspur.com>
X-ClientProxiedBy: MW4PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:303:b7::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b64c956-4cdb-44dc-3326-08dc73657bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yjqmKFAXgDelM5N5P2g0qn6PI/U/vzG1beODiL2sxOEsKSw53NCu3ycL0Sm0?=
 =?us-ascii?Q?beE6X7p1pWlxQdj1I8DVnXxv9+IaKXmKSKo64XFD43TNJaoZpb3XsUYL4Y9V?=
 =?us-ascii?Q?0933oyVBp3bCh+VjwnXASh/Klkp2oa4S1eGB7Nht+BWrJdtnJQ3Wpij8x651?=
 =?us-ascii?Q?0QJpXOZnludTPige/QnBNAmMzpVq5lL1I1B6GIX+qj1gVnqiKO9L3b3aW8dA?=
 =?us-ascii?Q?bqXXO2d/eqor/f0OqkNV7xFKJAjYKTBOQ7CHvPVzSnM8CU8puyBURYEhtDpL?=
 =?us-ascii?Q?LV1JcmDeTLZ98UM26P3JViBiLHSledzbtgYuNTnuXwxdSvLhVvX7BdLg0DDG?=
 =?us-ascii?Q?/RkRTPgLfNsLvmF154GZSOgcU1CmfIvpjEJrwIVOxhv+sxNIYbGsodswyb6j?=
 =?us-ascii?Q?DE44JwiQClDIgHjUhwLPPIWeMkCfKcHTs5chTd1oGDykgI16rK3JVkwn4Zz4?=
 =?us-ascii?Q?jHxMnSLyoLURwme4zQs2Yasu4EelhVMsfX5UZNFsz7FM+mhQPD1FCMv29Edu?=
 =?us-ascii?Q?JMQnoGnEK/DwY2elfNQWQUBdz8/iXIxKI54qhZvYf0CoVuAOq/1Neuo8hUj2?=
 =?us-ascii?Q?s9JBTIao6/Bwjz8ttyeciXcq97PTa9/JpIJJtca+PCdkcCQ2jffDydl+eq7s?=
 =?us-ascii?Q?xXgEEGFHvU7sQ0b0uxYakV9lfEIZYIxqyzn9+QLBiJGNlNhOuGdmWa718R0t?=
 =?us-ascii?Q?tSn+pQwshBlerAS8r2pBJUbP5ivE2zvxXXQNdyvqZWuqFazCCkTp9IfsSzG4?=
 =?us-ascii?Q?bxIk9+sFHWVmfgqQizlIm2PF6nXeYpoFVXJXVDjFZLBXvPj1sqmh0m8i7zsa?=
 =?us-ascii?Q?7oXVt7/EwFBZGVBk88RavKr30BVShNSxE3z2XFY/drmrnZ3IZcLsr4OQaUj6?=
 =?us-ascii?Q?D7RxeLmz27rKM8cseQwFgfROLsZZJJkpVMDbNoc+8UYKJ5w3s0Qwz8H4w6qB?=
 =?us-ascii?Q?JqOq9UX8yUgzYwilaryvejb8AZltO8cYS7Z61FRG17aw5/ftX70u09CcVCfj?=
 =?us-ascii?Q?atSlm9Cmva5gQ/1C+0jRKL4lEwKjMzchqzcO1g6OySUle8DfjvxnXbZWdyhO?=
 =?us-ascii?Q?zgje57+OBriBJQeqavdNFmxn64v1nO5MehmeFqCry1ub5BWT6yNduBTaUV6H?=
 =?us-ascii?Q?svQAVSGNx8/N0n28gfwZQykHr8XKdg5jCpIq2q5nHxJeOgf3fuxX3AqYIkmS?=
 =?us-ascii?Q?jPmEIfCW6H/BEhwDQDmsLpXDMzbLGDs7sAJeh3lXDOuxYOSX1ks5J7j+31Mc?=
 =?us-ascii?Q?5ucYMvYEuRTE+C3xQl2K93RVgYtjl8rivB+x4DrUbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YUBAfvBWhhnTpyEGnbDYDQMIgv8BPflTZrMnB8DgLNAvU+mjmLUJAFI9tKzK?=
 =?us-ascii?Q?SzhGVS8l3F6dTfyMWDcyoGJtWeafqH1nXV5vP6fz2/Z2TuOPVcNDORf7BbY8?=
 =?us-ascii?Q?loQVNeCI9XWlXQqIZ5cFtnPiZ8ymwrtT0QIxdoJOxNNLYJKbIRJEZvimwOcG?=
 =?us-ascii?Q?+Evvg3abp50Of3gMDTiq2meZPEt/YGtHzJrNUmGgGSOJHml7AENTNd0kFeG+?=
 =?us-ascii?Q?DNZhpGc7MucxH1EvgnvgenmbO2sLp6mZYdaiHUkhXAZPDOSNZ0zYD8wOiIF6?=
 =?us-ascii?Q?p98iW6CtGGXjK93hBZ8KNIcXeB9KvVka4A5+a8uvduTwHynYPeomBD9tSPqi?=
 =?us-ascii?Q?SXmPebQ0LtU65w6pCmb3ZGu8T70urs1hpYX00DbbOxX6ZjIFdKnj+k4CCHuT?=
 =?us-ascii?Q?6VyS/GkOSQzY3o9t+DmZrRsjWb9/xkiyM68nOc4hfox55Sardhl7EpzoM9N4?=
 =?us-ascii?Q?Aad47dzTb5t6vFok9JyBiw6+3djVqoA7CSC5MLZQ9Kqv/X5hitYxp2hDyvb0?=
 =?us-ascii?Q?RdZ2MbKwSr56RGy906yWwlfZdHSCTCar0qx4aVrYZt7Dc58oj4IH9h6ZJRmR?=
 =?us-ascii?Q?ZWdElrfGBjfFXcsvlXylKlYzmMJMm59UZQHS0dkEKPlDyJ3tXp49G3eirto9?=
 =?us-ascii?Q?jwAXD3q9wbwyZxWs87Y1QP2/MnzOY1AvmggceiuPIutrC3HnpdzQfTV82YIX?=
 =?us-ascii?Q?TcPLoDmePcj8da+xjjmTWCjQI4R5scVv2HPN8C/U9nMTgun5DkUOqj+fmf4u?=
 =?us-ascii?Q?KHT3V70Nwov4TXyOQqn9kWzRCWUsS/4wkn9QKwpi9IZ0aRSpLMFBTDAR+3Hg?=
 =?us-ascii?Q?dEVCrPQoFf/xjLuPLBWgg4dWL+tI15xmO5bMQx8FWMzSkkJM9i4AEmUkiqGf?=
 =?us-ascii?Q?kpK8W55RQW7tvjOsCMhy0x7pIe9WnCjW3xMpezHXn2wjFp0z7K1PXsrb2jbG?=
 =?us-ascii?Q?5BkbCB526Z9JKpJhcXmvh46F6AYWQ+n8RWgmPN6T4cG0JG3VtfPRKLt17/iG?=
 =?us-ascii?Q?G9Fgwbn4+7UXLvaMGT4kov8k7HJre3E0GW26Gle8SKBwT7LmzCck9AEGhRLm?=
 =?us-ascii?Q?4sCWJKRuKagZz/1sZKgMsGBfr0Afkz8gBpkbv9+3rMi5KMlQi3Ih4mKEHHVK?=
 =?us-ascii?Q?Fz0dwck5EQa/sbfHultAvAhN8kNuORLJdcIry5TfsJynxQd0Nhf6mY0iBC0l?=
 =?us-ascii?Q?wsxGClI7aamFtpvDlSttfpcmdOXl+7ysPwDLr5kp2Sf1rC4Jf8Cjm5awfsZI?=
 =?us-ascii?Q?BREoncTQBBVVK1wn+VqQ7+xjpEKyBmcqFHsbCRZ37Y5ZXnjlNP5b+4XAUoI3?=
 =?us-ascii?Q?iEOYjNqxircQ98NMBK0LKarvAExsBvErE5DeoyY4owSrDU0hXfx34TvZORKF?=
 =?us-ascii?Q?Jks4gUz0fO/aP9QhSmqYGguVGL8fBg71sNmwwmTYcHp6VVuFLTl2o4AF+eVv?=
 =?us-ascii?Q?UJ9UhFXVmcvn6WVkM/A3FypZtTGXB+A2fwjCHmLDu1wqaQNwF/kcydqEvfrn?=
 =?us-ascii?Q?P7D755LGNRAjrPRmL9g22ksNBNN3giJuilp+k83JAK+HpJaInxeDbWRwYHH7?=
 =?us-ascii?Q?cB1Frk84QZEzrID12t4gN/aW+ZV3QlaqbJpbd0yx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b64c956-4cdb-44dc-3326-08dc73657bba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:58:08.5662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCiEptSQvGe0NVIr5ZjAsLj6mOBtMqVrRKheCPTQs/CtTV4xrKfUFS2obuwzylkinjrVBSlxhoMw5dCGoKd6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Mon, May 13, 2024 at 02:14:51AM -0400, Deming Wang wrote:
> The mapings should be replaced by mappings.
> 
> Signed-off-by: Deming Wang <wangdeming@inspur.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-intel-gt-next

thanks for the patch

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 7078af2f8f79..03b00a03a634 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -155,7 +155,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
>   * @bo: The ttm buffer object.
>   *
>   * This function prepares an object for move by removing all GPU bindings,
> - * removing all CPU mapings and finally releasing the pages sg-table.
> + * removing all CPU mappings and finally releasing the pages sg-table.
>   *
>   * Return: 0 if successful, negative error code on error.
>   */
> -- 
> 2.31.1
> 
