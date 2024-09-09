Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A641A971EE8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 18:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8746510E5D6;
	Mon,  9 Sep 2024 16:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irnQEkCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034C10E5D6;
 Mon,  9 Sep 2024 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725898574; x=1757434574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=47dRK8i8LeJY3JwWSJtTG+bRbHZl0Za3S2QwR3wB0fk=;
 b=irnQEkCD1Im70Oq2f7/C/GsLL0zXYgo2s/t7rSImXA2hw9cVcWCrS3tk
 kPkc98vDw0wFdT53qGWvYBjtF0Y+K5XTM5TEmhvTIC20su1QmNc0Uja6E
 lphf1eIvzaP1D+C80AuVBDxzf255dPXh+pbnxJCUYflMO0S9BH2NKrNPj
 1eSI21DumlG8MMvWf17mpwE1CRy1/iDycZ0TOMvPQpqP/YQweXPnZRjo4
 tItufwFUIHNfDPnjPep66aaXB2cotu4S6QSl8w1/298B4anWxkN4VikXr
 S7Ftol1N0aKwGPtO3kzt8z4Gc1XUTly7sFQUWDjGGeZbtOwGFKumcqZT9 w==;
X-CSE-ConnectionGUID: Tix+18kFQ62uUFKaAUAEaw==
X-CSE-MsgGUID: w8TjF4vCRiCYa3jKgjCeqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35197138"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="35197138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 09:16:13 -0700
X-CSE-ConnectionGUID: 4I6ShA3XRM+F4V0ljWSdAQ==
X-CSE-MsgGUID: oaRJCaScQYuUw0WjHbmZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="97528619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 09:16:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 09:16:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 09:16:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 09:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN30ucO1ZSsxN4Nhu+HH02BpQr64o3Z5fqyLsgRALO8i0joo9XyLxroXjQ0baHRVkoO2IxbAqAeFZpgn2FmdPSZf/qNIkqKb33FFer94WPgp1pQAbaeNFzTyvWgpsohd+suy3wPNjFrJtqqYV740HOWVVc9pXsat1i2f945LtYGM4MkLD0B79J48BEtnWur6l0nxsVEKUElA8eQZmJ4ePwRnVJkX8pKCcNuqeISrGYWk3v1ev/spo0vperOGbzVDlbRIOWHAsXk/FljtkOwdzAEV6uPQMqHGxHAK+oNVUCwit2uwNOL19M2Rp+CC9le8d/ZJ8Hig5KBp4ttwZHMW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJEt/BmVT75QKiYmTHco3lb1y1yw6+JXOzLdSc500nE=;
 b=jXtu+IvPPECWW0Od5+GnQla2JT+UPA37eq15L9OA14HGWzPfg2jwkAn1fKnRXlZPi5Do6Fi4Mocj8r41AUPXnlK616Y/ry+sWMsGh7Pz5ZZBa0ruoAMQPR31jko3EcNDepLF5OgGgzf7rcnBX5Zi+rp9P4StUd3CcvCBQNviTO9EZ/qyAP+aX6pbtwNhXzgLy9scYU02pXbqCKIPQi4DoNWLY8hInFzNiPdZnjYj5SWo7Cb/ErnPBO/ZxVupwyOxc4eyzVxBEh/lSbZNjPob41+b8B8hbUBvxkMh1uNml0BjyVfKfuWA2kHK/9sMM4BBk+lYZEQy9B0XmEcT37eIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.31; Mon, 9 Sep
 2024 16:16:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 16:16:08 +0000
Date: Mon, 9 Sep 2024 16:13:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] drm/xe: Use ERR_CAST to return an error-valued pointer
Message-ID: <Zt8exTWvVGz7CuDf@DUT025-TGLU.fm.intel.com>
References: <20240906070109.1852860-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906070109.1852860-1-yujiaoliang@vivo.com>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: de9dd45a-78f5-4d73-4ec9-08dcd0eab6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uYy0meerT+1jqGVZ5F/IS8+cm45o/QfaRurFdhy8CkJXWIziSBOaiO8Tl2G5?=
 =?us-ascii?Q?pJCzRLA6CmVzTBXihCaj8VarS8WWy2b6n/xGl5BlvahXCSWxyoNE+x5OAkbu?=
 =?us-ascii?Q?qNybxmjye9EUDA3+DDxDF6ZbMcleyfXnzYc8c+8djIK7i/NQDx9zLyN03rp7?=
 =?us-ascii?Q?2tPP7K9pucRwdBrTjsTnyAxdttmyXBRoFV++rntQHZXXh6c2CLIMyMChbkOB?=
 =?us-ascii?Q?4W/sCplx0+nukDBdEmwyuDGlHBdqjqwuju59M4hCKOtT4qv9t1GFiVzt+dsP?=
 =?us-ascii?Q?y6oWLd6MzZMODOHcMrg0I8heQbmqV3JnuwTP5GzVNWQTp8IEzzQROBU3ywU5?=
 =?us-ascii?Q?PG9lxIi36oeE5BTtL6FbVrK2jFlMo4eam4LPxmkpEAIxJkhL4JG6u3YyZ5rN?=
 =?us-ascii?Q?0Z5g7taKTnpX/eAlId201dLTv0yaSoBdgAZKEw3TveJsDBz/epecQo4+2JXg?=
 =?us-ascii?Q?k7s5vMzbfjrGyKQADYWETmufh6xmoS/kWK5MvBYlPFvMUipxyny1uDUXIKau?=
 =?us-ascii?Q?Wk9tcQlsUrj3kJ/2RCkiUugzQ3dKGh8VIJyWy7zV+RJ406ZTDJ47/Rie9Hlu?=
 =?us-ascii?Q?wg0yuYEKn2u7ocMmy9bhsq5Tpd+mxGf8M20A6SzQZpVs715GBcJYPBzcnTE2?=
 =?us-ascii?Q?pC98NRZXm4e8G3hc6ErHbvzfKABiJC7rFOswqmL9uk6mkiyZTe+OpS/kAPiu?=
 =?us-ascii?Q?zfLg/YmWVjp4OIJQRLL6JzxrG4yxG4rN/RRwGgcbrp5RBBQ3YbSDidUJcDG+?=
 =?us-ascii?Q?aPGHJTA76FkkZnPDFzoJYUSJCt5XvYG8adPo0E9AIHoyMK7tHYrgIMs6QGKr?=
 =?us-ascii?Q?7TsJtdUrVpTEuSMqsvixk4dhiHHNCRD88xpVtZwT+ZC+2MoZ/7RtE9YPOXxV?=
 =?us-ascii?Q?rIVhQO4VBPrlJaOAC0mNTDuRPfcxpQaJjHQlu9cpkxrFUd8p8Bv3r6jlj+tA?=
 =?us-ascii?Q?tUUqEkbgNT+Qlkb2eFZj3PX8ZuhWeMDRovvY2T+hHTq00EOya3I80OHFFc/v?=
 =?us-ascii?Q?sakHEw1nngXwuuwf55V2vXRQ7P4py2AIx8QiHG4VXIjrnEZ+JYdl23Tn/IID?=
 =?us-ascii?Q?PMx6Xp+ndLQ22757w8uBsNrsf17GcidZqDSBarK9lOMMsSKHnLkGdprwQTFu?=
 =?us-ascii?Q?cfT8wE2/9nLyz+1lthqBdRKMbx8SLKamMqckS0K2BLlv4uCX+7io8LhSboDf?=
 =?us-ascii?Q?k3YL1i/2XevCWfoPypFOXmAFpvjeZ7DLDrp0k+xYZrxoNwQhDZYGVJNy1QnE?=
 =?us-ascii?Q?sCyCD36Tw1qXvHXqpyo+YXovMESmNbBxkGNNvJzLaq9gsf+GsSET3MMsThRp?=
 =?us-ascii?Q?vw+d9lwcKMKelOlea2zu9v7ZuDR9Lk6/d2cgbQZ6vjUmHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iD1glyMgeHb5wn8bHxPgUStbPU4HqAlnoJSKEXHxGMYU8CF3Zy/TM3cZpce1?=
 =?us-ascii?Q?C/f/Fm72xg8/k1aUtB4Hs8GkHR5GJDDt9EeuLWz18ZS5NUUBjG28O4sLW6H3?=
 =?us-ascii?Q?cXn2bZlHxzLXbIusobacxNUqK5BnVsAynunQuQ9QLNHj2Jho9vkaNkTQi4tY?=
 =?us-ascii?Q?29kt9WfTEUjufIYG1WTsHX4Nr9HOfMtbN/8dUyBH1yTmAXR8wOVWPfN/Z3Ps?=
 =?us-ascii?Q?m+I2lRTzpM06V1/bsAjE4f3VkJk7P9ArD/MYHLVj+IcA7oNhUyoIrRfpCgkI?=
 =?us-ascii?Q?E0n4Gr/0M/3gEytfQtLUGw+N4y1jBFPghrSQ/bvbzF2rfKW/Xer+Yhdc5456?=
 =?us-ascii?Q?DQT2u1riEhRtI566jQ7sf5TU/M1zUlj4St+kUdQflsYsqBEOsmbTv/P/jugt?=
 =?us-ascii?Q?trkJN3lnvhlu8h6UBpqge/fWn2HoYGfIB5mlHPI+fQe5Or50j4TRqO1G8res?=
 =?us-ascii?Q?OjHYbEaYBcxceHUq0Tq0ea5HCni24cnrRs6fwkqhqynJzUGUEDBwADuIYky6?=
 =?us-ascii?Q?IXxTL8E8l5Wfsky8QF/YPRL6jIINWo8o6UWqev1sluoYqJ+S+XoAB5fdGTnF?=
 =?us-ascii?Q?y6JEVzZ32Eq9yilBRwHTLtRqigi2+qcSebuUYaU2eNHkYpPVKCv4m1VIPomF?=
 =?us-ascii?Q?6zursu898AJkFZwMBEGYkgI0gZEyAIBIICRPxW1SpKhSPsUSLqXXkK5wJ3jw?=
 =?us-ascii?Q?21io6jDEGDNoQlXjO9G9YpviJ6sYLMzG8xYtcoUg8goprZylWDaLyknigjCH?=
 =?us-ascii?Q?dl/mnDN3Du8g3AKQ8ahVCu905gYJI6zgNj5qlO9iPHygv2hW/hBnZneus84v?=
 =?us-ascii?Q?D0d34mOVZRKaO46owdXqPBHoDTHIMgHCExAtQ4bFyxRh9e5XjlqSQZzSiRVa?=
 =?us-ascii?Q?Y2Pu2h/jcpH0f/zN+N7G2t+aF2gyVLdvlNG00L1VI/X+Z317zJxJDJBSSuGe?=
 =?us-ascii?Q?LpRqUHUQnAcZEbEinjAweq1Z+Xqh7DOOmgzd5L6wiBu4vc3W+bCQunXwFQoH?=
 =?us-ascii?Q?0LGspLZ/zTJbCqGMijLCe0WZCSwxgk7OeTP1u9aiFqJiCXAxz9SxweyO1Bu/?=
 =?us-ascii?Q?Y2Rqd6TJPEgVjgndCjdZhzmDsZOqSQhlEAIKVn42j3xiTg7RpHpf3Em30wym?=
 =?us-ascii?Q?VDeYuy9qayMH9/gu9fp+qyrCOKTEUzBqb2Qk+OAz/nfSTNA7o8ymUk8pXwND?=
 =?us-ascii?Q?80P+GlswOjVFFegwf+SPZ2hQ7xnDbfgVSU6NTOnOpDj5H1ZsgE+4XTXhtOC/?=
 =?us-ascii?Q?U3GLxfgd6+bbWVqPctV7vQRZFAYTByRP/k77tj7i3FdtC3J1kM2O0ALposQk?=
 =?us-ascii?Q?kiAtAle5gKfMK365CStARQAWnZPSHrV1GT5wS9COU7v6V7CRkBY2f+jWHW0U?=
 =?us-ascii?Q?MH7USbc5qk1KfsAO3NA3IjD+RU+rabjadqVH+pzr2d2fkrmlbZWZLhJ8e9N+?=
 =?us-ascii?Q?0yzTbf70dJtZSu0495SLhLKQVBEJFzY+SMaGcQIk0ZdIiFZJxkVX+2UH/KEK?=
 =?us-ascii?Q?ixUaHPRB1f3k2GorKjnd7OfZCvaJWodnKik2n/5aBtbCWpClDy/mKo4GGS2y?=
 =?us-ascii?Q?zu+gemLPkLOmvzRI4ZmeU8dJ9Hp9NB0Zg6ibgW8lmqgvEzhb2Fm5OMpBTylD?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de9dd45a-78f5-4d73-4ec9-08dcd0eab6a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 16:16:08.6320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A06lt8riIk3Ty9NPvaJM2Ho2c+p8p1SYHSDWjRRCOqh/YnRRUeHoNZveJhNld3cPwnRH2vSFglitktgFJd5NNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

On Fri, Sep 06, 2024 at 03:01:09PM +0800, Yu Jiaoliang wrote:
> Instead of directly casting and returning an error-valued pointer,
> use ERR_CAST to make the error handling more explicit and improve
> code clarity.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index fe2cb2a96f78..e055bed7ae55 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -53,7 +53,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	if (IS_ERR(bo)) {
>  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
>  			PTR_ERR(bo));
> -		return (struct xe_sa_manager *)bo;
> +		return ERR_CAST(bo);
>  	}
>  	sa_manager->bo = bo;
>  	sa_manager->is_iomem = bo->vmap.is_iomem;
> -- 
> 2.34.1
> 
