Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29870A6AF7D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C710E291;
	Thu, 20 Mar 2025 20:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbPElVvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC810E291;
 Thu, 20 Mar 2025 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504287; x=1774040287;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V1j3GjkaLdZ7NdtEUiRrl8OFOzcTB1TbFqbh641khfw=;
 b=YbPElVvmPpsqtgyFdJnetNRvay9C6ffxCO2C11khvcqcovQG0JU04aU5
 9wtzceb59DdQfxgC+A5MBua+aM7Mgt/jiVgQG+hwbwcc/oVFP4QKmZ9YM
 7GdY9jmjb3mpia83X73vFS1ZzES4NMdYtzM9INUgBAh0of5JHNQUO9Y35
 jBrkxhihFDgy/8mQFf1Fsu2l7mSwF7FDyVJVMNER1GGZeg+KLcZq6HjQS
 VgEv67X/v7cJf77905m5ZQfNwzzWXBh0UYqpD+h33zK65C1M60gEF68g4
 H3/CQkvENsnSlgZvpnth9qGcHj4llQr532xDUxlPkaZyfnWJwPmQT9lZU g==;
X-CSE-ConnectionGUID: JY/iF/8uRM2irQGdqm1hSw==
X-CSE-MsgGUID: wqOjJq8zQL63skYyr+hxgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47534341"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47534341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:58:04 -0700
X-CSE-ConnectionGUID: PLqR0wc8RWyGo16Hg1MHQA==
X-CSE-MsgGUID: ri+pDQuYTeSwluSX+IoCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="160440537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 13:58:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 13:58:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 13:58:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:58:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFivIAUBWAqr3wVOsBqWH/iaydQokRqhUTGIG3glPz0NoF8EJJgt9nYNgi4Z6nY8UMLXi51DFxka/nwVb9rqaEBcvb3jy53o31mu9RmzMeArekJfzsXidC5Q0wlebr6rsqm4GdIW8L2OJZZCTEbqRgmKQ4BCJf7eQSJ+PG1QlNZJ8eR6AzgUQZySEmOkSfRukicuJiFm3ur+89CSU33XBVVPqWt6w9C7ivyHN9Ye0Zmfxc3zsddJQENU3n4/gPuWVMUpbb/LqEeAjVwzmYf7oVvdCE77dGLKGvnjY7DEnpUdf8MBeOwIbPW8RCr9QmGxlSnu46RvlHEA99EJqQzWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe3MwnpqPI2IOHXd5Obh/JjECtvpuqzLSTWLDhSUAmo=;
 b=vD1Iotoxk2pQ9sD47cXnpXNDEEC2L2LXmr8WjuzWzBZ9Z7Ly7Y5OU17X2auWagVaZQ46gWlZj4UMiDYec9PL7eXiV2ZVjFSC5Ul3z0dfQtq8gNlclHgrX+1TUM4PWnKv8o6gaEHajs9OZe5NRLJp5YfzkghjXLA76US/pEXgMnVho7r9nbNmxLyzRn1YBBXzx4JEVIzTloDrII0SkTuaMNLcueDYooy0lygTNTm+UJFqUYdiV8eXwdVFcvhsf9jng2A4qx8Vu21id/rVKCbedSlQ+2XQbxqWIQCCwV004Hd8hWOU8gb2ExI+q9F1qjB918EGCO05UjSVqcm2zHoECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 20:57:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 20:57:59 +0000
Date: Thu, 20 Mar 2025 13:59:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 5/7] drm/gpusvm: lower get/unmap pages
Message-ID: <Z9yBnajVqpRmi4Ss@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-14-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ca5a53-6428-42c6-4305-08dd67f1e575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?33Q50GChBjtyhYB9T8iXPtnSer1iCHnXaHqG3eXvJSKRMPZzxrvzyjMYrq?=
 =?iso-8859-1?Q?niIG1qYMf20MMGZ7FB0hlx+7keRoHLuuOnO8HKr5GtZz4TBATC5kZ4FI18?=
 =?iso-8859-1?Q?edHMv6RAHPgMoKP/Dyr6g9dEugKRsEvoCdgznHyGUFG9r52TK4WsfMDBKr?=
 =?iso-8859-1?Q?4d/urAIHFmpC848TJN2ReVS/yfaDvC+Vaomz41JqwSVhoe6laNLEUE05Nj?=
 =?iso-8859-1?Q?cEb5g0Z3WtaqTTyXNum+6uuel5PMBS0UbL0i7NFI1CoGO2DPWIR310tnn2?=
 =?iso-8859-1?Q?RJv5hBuxedCGk3ZCv1P9EC8TZfP01oTLqeqrDTvXNi+HOirAlenbfgH1u+?=
 =?iso-8859-1?Q?B3/c2vm6CbJeJYXEUE56ojk2TFWivvWnj0C6DNpE2JidRcwzRzJtzh1GF8?=
 =?iso-8859-1?Q?dc7cBParywoq9PoKPzbUEWHBr4FhETQYA62iFNKfvGiz6MpeefFnJ5U06I?=
 =?iso-8859-1?Q?ZC9FY3jyux3tT1c4fxbjzrMxN43IB+QzJD1jxyVyvZ3C5iKOmiKvGrMUDU?=
 =?iso-8859-1?Q?YeHda6Azsi2T7nJHFTzbxQtc7Qw0Qrmqr8A7mHJJFcO7k5ZCUc+0YOYwVo?=
 =?iso-8859-1?Q?s8F5RRETh06iWHXtu4Bo5iULgw2t+emIpazEOMBsM2kE+Xl6a++ilT+HyT?=
 =?iso-8859-1?Q?3ghqc+JUea2AB1qWsjW5ZpV5CXUhm4MdDu9uX8McWYunX7fkViiTrTvAdD?=
 =?iso-8859-1?Q?m18lZ1S6++y97vPmUmRCXUA+HEHBHolq80JelkSB1BgDezR/5C3g6ZXKAi?=
 =?iso-8859-1?Q?8Z/BYgNJq5XhQVOEZvz/MPTEBrf9hm/ryzJt6bMLqQLwwaajet5N6wC8Hx?=
 =?iso-8859-1?Q?vVIsYNHK2XA2rcDswRoJ5JP46uC/2Rp4KxkuvKz1cd0WFFghdCGKPXj7ui?=
 =?iso-8859-1?Q?sGkE5SZvxZNs0u0LdQaXE+FSn0Ns5nyGyRuKmQaWjxXV5be5sW10+/CqGy?=
 =?iso-8859-1?Q?DnN3ahHd2pqq+vE8L8R/g5Son3q//JAUUqgK7wFSHW5EXWewf4iJqTSSz+?=
 =?iso-8859-1?Q?FeXSBH3x+RBsSi27RBnofuFGQ7QPLp+t3+HzAU0WYJYBlU8vVH/G8evvER?=
 =?iso-8859-1?Q?Vw24YRO9DSe9cU9uLJUZ7dtZeY27t83neZ8Ug8jJg8uoHn9W0hRkhEWV8i?=
 =?iso-8859-1?Q?yRSxNVFCZ+Am5RSqz5hmxc54J/MdxbVJcdFHyk5swmNAnAhOWxsiolf+Ne?=
 =?iso-8859-1?Q?7bpworCj2njR5FGPwr7bkb2zNqCk/3A6VUGpnKoxI2k0xjLaliArQcgRn/?=
 =?iso-8859-1?Q?OrmCbY2iNC56qSH8sa7uPOh044J6n9uuG0McGm2bcLp36Nq0KFLL/RzKA3?=
 =?iso-8859-1?Q?pLaiq0JARnbZ5fklvsYB1azQuX2bv04vJNI22/vU9AL9W8mbsGS08VagDS?=
 =?iso-8859-1?Q?/QxPIhrBi530qq11M9ES/nuHdtjRcpqPymWS+w1+1DkGtNZCUflO/YDpyG?=
 =?iso-8859-1?Q?VrmwynRlOWgSFD3U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EqgUU1YZtkF4uqT7cedxgi17Wi554wMzeOB62sxJGF7Y2xQDdcBKVHXl6I?=
 =?iso-8859-1?Q?xbO9O2JDqzr7BL4KYuty5ufMCSd/a5+4XWbQ81z40w22N2isH0LjWs+iZS?=
 =?iso-8859-1?Q?xzSzB3CZL/YsBg7btkB7IoG/IZaQWGHzkGLYmcinrcjKz/lNh6v2v3EV1l?=
 =?iso-8859-1?Q?+wuCKKJZAShDum3eNYWY0njfzm8HFzyIafFS0oilo8vIeGl6ecrfU/IeQ6?=
 =?iso-8859-1?Q?o5iUVY2CWIXeuAnk+M7aZ2dTMYrz4WCleya3YQDkxnJPWj/Ugy/fYWniJL?=
 =?iso-8859-1?Q?cBVufdrS0PnK1He5oU+1c34oO3gwG/0slw8m2P8YLoIDN68r7jhy/fRGjj?=
 =?iso-8859-1?Q?YnvmPUs3cHXsEAlpdeJgggkr6NK58UO3NF+ItirGixBSWNhPRRZIqpQlH2?=
 =?iso-8859-1?Q?EfM0L/V7VoMmrmU4OpNN36e1+CmcbyfkEFKpyemmIcj6ji9DGwJjP2MGlR?=
 =?iso-8859-1?Q?WF9Hkd3PBOOdyhJjnVSAA9Xpfh9uU6OQnfmRYENU49Z+NBJOmWTNgDfL+5?=
 =?iso-8859-1?Q?0UeHabPvn7vBhBckB/p/4JdDnlPtRxXbZVZxQTlr36dU/Ix/ShQ97iFIh+?=
 =?iso-8859-1?Q?oaBASGQ7jc+EmQkRVy0N9iTSVQZZ48ovs9R9KRqDoLr2SmlIdbZh8+noTG?=
 =?iso-8859-1?Q?DMp6j8oiRNiSRdb0MFwXrMvpOuAR5+nLeAFOtvU0BI2fFn89RiJ0knqlUF?=
 =?iso-8859-1?Q?2tb7psDgYSRdyZVYKOVRtuzB2pPGQwN+se5QBbYlPhPdBqF/sKSLC9NLc6?=
 =?iso-8859-1?Q?Zc/67WEp6UmN3aVP9TfqbibLD8xKkqZiZIiG+uT2aNVobtU6qnlpoCaDF7?=
 =?iso-8859-1?Q?4tZJGI33UUi0uDmR9BIgnIQdp+XS+X+JRFh97y3zrAGSFEV4kuqVY5SDoU?=
 =?iso-8859-1?Q?qbbY2x6TDSFrQLIsKI5KS5V7G0tB896V8/Sc6VLIDmBCA+LW2z96uczovI?=
 =?iso-8859-1?Q?OrMXU48aL2fNZUcDv5HQt9GM0BD0XYkCcBp73G6jENwq3p/1lZHngFdFRn?=
 =?iso-8859-1?Q?5SURsLi2qMJ8EoYh/7pd9K+d3QP/hkBLTQ8qVG8oUONKyjVPR6BTMGP85j?=
 =?iso-8859-1?Q?XmndotzKxtnYXvLOSeCHBqlDeaifmYqZP5/koCMA72i7naA8NhZXnOkR01?=
 =?iso-8859-1?Q?9aTZtpdqcdE68UKmkK8QpEHfhc5ZAgVB/1NiGJcB31QPl7aNth5/BKwY2F?=
 =?iso-8859-1?Q?pC9Ii/5g0FoXwQOuhTjcIxspiBA4qkd6aWAphTINEakRUjk5ftqJjc1LVw?=
 =?iso-8859-1?Q?g5qvpK9dG6Ilx+iYoi+Lfdfyuse4QWdGvjVVzl/nj5D4IDXtoNVRAEJHh7?=
 =?iso-8859-1?Q?v/45gtK9loiEGgE7wTW7rpKiwEHZv0pupm/bSTfxVrUvtGM4BNY6fGBxPL?=
 =?iso-8859-1?Q?zYCc2sQ0zULQeQvR1bhK+BwbLrwOUO4gluAfqtrAyr2KFIPZAT/cSPBrSN?=
 =?iso-8859-1?Q?Cxvofznp6KpM13U9ZWUSr7POoidJWaY9yhuMZmqg/GdgkFQjmYC/oF7ZrX?=
 =?iso-8859-1?Q?Z9kttH1chFlxIdyxytyyXFTN/8WiRENS4wCakN4sQJjcpJdUpuXAyXiZoJ?=
 =?iso-8859-1?Q?X7ExJzl04dzq8GXAKM6DeApC36U/jJvHcLmUi5dpjHOyzy0mvGcUPNALjw?=
 =?iso-8859-1?Q?5jChz0nE7RkwBkL8AQ7MPAGZkLPTrIb4sOM75BLxREWxFRGznBZoDMew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ca5a53-6428-42c6-4305-08dd67f1e575
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:57:59.2685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sakcKdPYpizBW8MJN9v/TXAoZ5v1GqFHTjx+hnyUqXfGFVXY12CdDn3b3jETEr+5vmxR+W9RmdSw6JUm4Lfrjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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

On Thu, Mar 20, 2025 at 05:30:02PM +0000, Matthew Auld wrote:

Maybe try rewording this. I find the lower in patch subject / usage
below a bit confusing.

> Lower get/unmap pages to facilitate operating on the lowest level
> pieces, without needing a full drm_gpusvm_range structure. In the next
> patch we want to extract get/unmap/free to operate on a different range
> type.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 90 ++++++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index f27731a51f34..2beca5a6dc0a 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1323,38 +1323,28 @@ drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
>  	return pages_valid;
>  }
>  
> -/**
> - * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> - * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - * @ctx: GPU SVM context
> - *
> - * This function gets pages for a GPU SVM range and ensures they are mapped for
> - * DMA access.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> -			       struct drm_gpusvm_range *range,
> -			       const struct drm_gpusvm_ctx *ctx)
> +static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> +				struct drm_gpusvm_pages *svm_pages,
> +				struct mm_struct *mm,
> +				struct mmu_interval_notifier *notifier,
> +				unsigned long *notifier_seq,
> +				unsigned long mm_start,
> +				unsigned long mm_end,

s/mm_start/pages_start ?
s/mm_end/pages_end ?

Matt

> +				const struct drm_gpusvm_ctx *ctx)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
> -	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>  	struct hmm_range hmm_range = {
>  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
>  			HMM_PFN_REQ_WRITE),
>  		.notifier = notifier,
> -		.start = drm_gpusvm_range_start(range),
> -		.end = drm_gpusvm_range_end(range),
> +		.start = mm_start,
> +		.end = mm_end,
>  		.dev_private_owner = gpusvm->device_private_page_owner,
>  	};
> -	struct mm_struct *mm = gpusvm->mm;
>  	struct drm_gpusvm_zdd *zdd;
>  	unsigned long timeout =
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	unsigned long i, j;
> -	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> -					       drm_gpusvm_range_end(range));
> +	unsigned long npages = npages_in_range(mm_start, mm_end);
>  	unsigned long num_dma_mapped;
>  	unsigned int order = 0;
>  	unsigned long *pfns;
> @@ -1518,7 +1508,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  	kvfree(pfns);
>  set_seqno:
> -	range->notifier_seq = hmm_range.notifier_seq;
> +	*notifier_seq = hmm_range.notifier_seq;
>  
>  	return 0;
>  
> @@ -1531,8 +1521,48 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	return err;
>  }
> +
> +/**
> + * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are mapped for
> + * DMA access.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	return drm_gpusvm_get_pages(gpusvm, &range->pages, gpusvm->mm,
> +				    &range->notifier->notifier,
> +				    &range->notifier_seq,
> +				    drm_gpusvm_range_start(range),
> +				    drm_gpusvm_range_end(range), ctx);
> +}
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>  
> +static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +				   unsigned long mm_start, unsigned long mm_end,
> +				   struct drm_gpusvm_pages *svm_pages,
> +				   const struct drm_gpusvm_ctx *ctx)
> +{
> +	unsigned long npages = npages_in_range(mm_start, mm_end);
> +
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +
>  /**
>   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1549,19 +1579,9 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range,
>  				  const struct drm_gpusvm_ctx *ctx)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
> -	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> -					       drm_gpusvm_range_end(range));
> -
> -	if (ctx->in_notifier)
> -		lockdep_assert_held_write(&gpusvm->notifier_lock);
> -	else
> -		drm_gpusvm_notifier_lock(gpusvm);
> -
> -	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
> -
> -	if (!ctx->in_notifier)
> -		drm_gpusvm_notifier_unlock(gpusvm);
> +	return drm_gpusvm_unmap_pages(gpusvm, drm_gpusvm_range_start(range),
> +				      drm_gpusvm_range_end(range),
> +				      &range->pages, ctx);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
>  
> -- 
> 2.48.1
> 
