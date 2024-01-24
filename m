Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D833F83A048
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A8810E944;
	Wed, 24 Jan 2024 03:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3E710E93B;
 Wed, 24 Jan 2024 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706068554; x=1737604554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G58jv/m237uwQJrq4tl7PDepdYtilU5WY2+/DJSEubU=;
 b=WVNK8x+9AU5xbK8CzzoEMvCKWOtUs9UGa5mEZhKrH2kXJgCQG4rquuJc
 wQDGI/rZU9/xwvJT0xyg4gaGSS1TZiQsVw6Ramru0K8CWFQoOKK+S5zSR
 BqgSwNFtHox/MbXhtB7/bUX28KYV1iT7aG6KYbvFtdxV6yxZujCfIujq+
 PcFy+nDKmTRaDMiDS5tHwNecfRbR+rNtSuMTQ6bg1a1jIfmGFYeYd7NGG
 eRTsvj4LlOxChn43kpFkAbWwdUBZjoxnCGCSyH1PZAocUiPinAnMK6HZO
 Y4XcxsJ7xsxsas6duZ92+hCFYUXT1j8ygpLMbt3XS0oml8V+x9klmRT5M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8491399"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8491399"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 19:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820318327"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="820318327"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 19:55:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:55:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 19:55:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 19:55:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD/wIQ/Zd3sJfr7rRbWkV6PJi6DS/QSpy39+pQvX6u7MRwg73VY5A/Ga+YxbExvmqeTg1UaeVmWWFhX8tIZjbq5+1+2OyKywDBu6Ir5fHQPSy7i8bxPGBd4Kf/MhWeN0EeWQX3uLN5tfLg7vWlj9TnJKQcICMFfMj4g1NsktLpn46pWy1N6l+HDvMBuRsMfTTTmUKr5kQyOi5aK7uHXGQuylv6F9SvIKjOkHAVmcJn4/snda/CkPSH5AsHfRK7LjMTJFJvmcw1D1tz8PfmXgFKJLTP3qt9Q8fwfb5AAua4mTiJXd17b89a5CFIFUoRH50hBuuj1VT6LueqGz4/Fxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTellMjqNbhqEEXGOrdCU1y1gDwGjXSnxT8Rpx+Qrl0=;
 b=bQUdZx8MocLmfutl4A+73ItB45vi68CSSPuKbHKVRYOhTnJiNNFhFx3n+PujbAX2Ez2HSzf0Cv2r23dST3hyMOkm6liBjrlQY6UBti4BIGO52OokdqM/bPk7bsVvl0MTkROYyyViyLMsTICDR2BRUvErsr/P76HwDi/6moct/uA1MST1NfWYqR+9z4JgBpywpwVUtyc0NOZJ6rjwN0k6tlCnuMBbHQqwZZbkMtJJv1k5aGre+VBBkHPIrrIKViYyHuliH0dbbMHiEz7o8K4KtECiE+9UDWRf3HQQ0xtDSv9xo0gBwBRs1mF4wDZg7SOWVfq1Yq79GWB6HzNqNXdMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Wed, 24 Jan
 2024 03:55:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 03:55:40 +0000
Date: Tue, 23 Jan 2024 19:55:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove PVC from xe_wa kunit tests
Message-ID: <20240124035538.GC5506@mdroper-desk1.amr.corp.intel.com>
References: <20240123031242.3548724-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240123031242.3548724-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6378e7-bb5c-485d-ed8d-08dc1c9054cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Wi2l1Dh0/gHoY4VTPGoZVk8HSO5ddjk9yJyNmEGhX0XlGujeswbpomJrr3vJ/zZ6bya6RUEc0xOlApfEWWFBHJZXuyTuOXtZb+Zy0Uc7ri+G3B6Xl8M6pwewlirjAMAUb4n2PhYfstYqP++7UYorhX/8gDyDUHyxHGL9vf/0NfquU5kolfgj6ACQpzZvYrGhXRB7lBuL6oaPFwI+/SlLXul4ftO2gysU95TCHVeQmkHawyf6N6gW+mC+d9rJCvG3N7Vi+3/Ls1urvjhDUDUuMPc44lxpPIN9SukPf8v1iiUf12YdNMRjZ/h0FEZqL+MCvsUxCGYPbSwUxJ0tKaxJyTGoiLK2Z+fcc0372Bhh7LRXboR/6B0d6rI4uhurCUjPPQHjvETdXUSrNMgVU1CxywmB2DIT3FJ0QJBv+g1gvtWNaWnThJWI+dfhypex5bjqeLV8kl+loaqtV6f/PofynvU0MJa8TIg9ydOIFgV0MduFUMjKLX4KtdxKP6iO9mLGpXThnWGyLFvr/jG8j6jOOZJIKl7uEFu8VwOlGQdCSdIykb01INFnaaPr00gacg3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(6506007)(478600001)(6486002)(6512007)(26005)(1076003)(316002)(86362001)(6636002)(66946007)(82960400001)(66476007)(38100700002)(66556008)(2906002)(33656002)(8936002)(4326008)(8676002)(450100002)(6862004)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEJn+wAgr392uBG+ImNbo7LwAopO6zA+XXMbU6/Hz8PPMSpy3PxrYbdMWUxw?=
 =?us-ascii?Q?Unek32h7gBs9BNGYG5uFwVmvQOr/DZlCh/GmscNhYEAa/wjO/PBYkxUF/vNZ?=
 =?us-ascii?Q?WMbvRYNnJeVALoaxtctaw4hCVzoJxRvEUNLQr8Z/FMZl9e/OAkB23I3hphrI?=
 =?us-ascii?Q?cq2+JJDRBYVkvwY37R8ep2veLvEpPmN8wrAWDeV84IcWAx47pbdHNhW2WQ/D?=
 =?us-ascii?Q?ZR/JyhJ8VSuLzor9ebspcqcQlJQxYZgeZUqHg3isDZDGq9E93Vndj7aHC6II?=
 =?us-ascii?Q?eCNS+NCHBo1GuA+oYzaEkwY56lzt8Rz7ZK4JX/yrBfeb0JmsEsKdx+sFqdiS?=
 =?us-ascii?Q?v1EFho/Wp7Z69/5COdbD3x2pSHeQ7JTCMVFf13TkZCkYEllfbjZkwrP3Z3eC?=
 =?us-ascii?Q?vpgA5irwgMMtLy/UajHcpX5OHDdWhVPFPzi0INiKM+tPgYq6td+fGV6eRWNd?=
 =?us-ascii?Q?qe0PMCTONf+i/cNZpuq1rSKu/Ty+NPDgWa7wC1c8Bedl5yzYNh2686Qj9rHi?=
 =?us-ascii?Q?yOXirf9S5i7auDTKz70IIz9OQBikXOrLQ9UpcFFRR/ZqRuBYQ1y+1seqKFjF?=
 =?us-ascii?Q?FumHzwtB5+eQCYAC29rnEzVezPvyDTTPiM+3+GT9xHf/5Yanj9HU/DrTeA+l?=
 =?us-ascii?Q?OO/Q7otF+1XH60QAjuvh5bmIGjrhXeq7jxRu8fp+S7TuFqsjOzcWW6LveIi+?=
 =?us-ascii?Q?zWewAIcBk1rDlVunKhokeeML0b9H6JSg8D3qJlBbUoN7rp6UAjoL65kSPQiu?=
 =?us-ascii?Q?kB5UkYETCUU5/ZkC2J55X4femZeL+HntPopmjTg67tXdU2dpzY4/JgSU0evt?=
 =?us-ascii?Q?teDEJ/04yqcbqtnXxAoLtzHE1933LQMOx0CEbmI8V5SQtBxg4X44BsDbujgG?=
 =?us-ascii?Q?Bq9+xhdh2X1qrWHFyjJfhdFFduJrPqWqlWHnOlyy/8UqsmA0sxnvdryDr/fm?=
 =?us-ascii?Q?upAZXga2v++ERGHGSn42eaknD0ExP1DrYX+PRMsja3+QMrIX1LPTGQNjRr7A?=
 =?us-ascii?Q?noo8hhyshMrfZQWKxBfSiH/kPAu2NyckoZd4RAFdT/Ki11Jh4+CdhDQME7MJ?=
 =?us-ascii?Q?O+jRAv72oQLgOyKQ502uehDpUjHHMyZVFk8oHG29i/d7Da9eIhSwybyaH1pz?=
 =?us-ascii?Q?oDTchchhEp+Y9LwtU5Kz4BTu3TbZHDYKVg/Qx7RzDEPNUUlWkEtZ9YAnm5AR?=
 =?us-ascii?Q?nqYw+SmV5FvGYf03dYUzKhhO0qmpTIoeir0FKYKnfqRLLFEsQzB2OyI4jzsZ?=
 =?us-ascii?Q?NwLnMniY0YC8tFxSqqOKhGmFLTSS0LjxeNUqmr9KlXyFIF1iY64rMPOVaPkV?=
 =?us-ascii?Q?A6fL7075Fvu5AvlAB4esWz91J0Y/HFNMzOxCshafmHgCLFuCvzy+kRJ0eoXB?=
 =?us-ascii?Q?fb9IGmZOUzfVeOF/gAzKc8zmaLUS9VyH3NFavbzcYYzqpS1n7dKiGCZm6R/S?=
 =?us-ascii?Q?7IjuyPKWvRNQDEZsW52qf37lDhKcF2z0lG0BVanGhS/5VeLuk2LtlxudbW47?=
 =?us-ascii?Q?9/+O4VcqDHBuHWhnc4P6shaqvArh/r6prY8F3xy+luGBgf/20HkVA6GO4Hl3?=
 =?us-ascii?Q?jCJPKdRfES+IdnAjyLYNzgRDbAsB6Sp7hhWdmld1baJnHeM3EF/VJ5U7nU6p?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6378e7-bb5c-485d-ed8d-08dc1c9054cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 03:55:40.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoIGAX4xY3G0bNJISPpeJ4Uw24rOMhm0iE4YRKcVvKpdLyx3Rk/aK0gkKWJcmT06B0MkprGWzfS57UBg2D2Vd4C9EnWhPEUeUgzJMk89esg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 07:12:42PM -0800, Lucas De Marchi wrote:
> Since the PCI IDs for PVC were added to the xe driver, the xe_wa tests

This first line doesn't seem to be worded right.  I think you meant
either "weren't added" or "were only added to topic/xe-for-CI."

Assuming you can reword that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> should not try to create a fake PVC device since they can't find
> the right PCI ID. Fix bugs when running kunit:
> 
> 	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
> 	Expected ret == 0, but
> 	    ret == -19 (0xffffffffffffffed)
> 	[FAILED] PVC (B0)
> 	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
> 	Expected ret == 0, but
> 	    ret == -19 (0xffffffffffffffed)
> 	[FAILED] PVC (B1)
> 	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
> 	Expected ret == 0, but
> 	    ret == -19 (0xffffffffffffffed)
> 	[FAILED] PVC (C0)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 439477593faf..44570d888355 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -69,9 +69,6 @@ static const struct platform_test_case cases[] = {
>  	SUBPLATFORM_CASE(DG2, G10, C0),
>  	SUBPLATFORM_CASE(DG2, G11, B1),
>  	SUBPLATFORM_CASE(DG2, G12, A1),
> -	PLATFORM_CASE(PVC, B0),
> -	PLATFORM_CASE(PVC, B1),
> -	PLATFORM_CASE(PVC, C0),
>  	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
>  	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
>  	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
