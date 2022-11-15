Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2062920D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 07:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF7C10E377;
	Tue, 15 Nov 2022 06:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293810E36C;
 Tue, 15 Nov 2022 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668495339; x=1700031339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HBzFEE9fmtER06ItOhIBJVLQEaxawxdNflsyRgHt4Tc=;
 b=EDZ1GNHLFZnRr+FCPlQZkXosT/DYbE40CimxoVrXlPxDxf1xP4vPBdwq
 uU6FYupX3Mp40Gh23NLlRytGhZ3Ve4UiI8JfK2lofiyU90FKOpLVZuffQ
 iORtMOOU3j0XBk4y7I5pmFhIdYgv3xj5fKqjWjw0EibicWCpt2EP8lSSZ
 12nuxPpNGaWcd5BJ0UeV7/DRBs9obRfzbNNPuXPgZUPKmYJsJZl+zHR3f
 8p83uMRKVEQCvXQLb+bXTfArbJ8oZdF/EPRpy/oUXfFwzJm7vvt7B1Edn
 jjg7WEO3EYwlIBsScR3Tu7O/n4JAaYEzvvmA4FJEyUPkSssHebcJSleLm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="291890967"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="291890967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 22:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="883846331"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="883846331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 14 Nov 2022 22:55:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 22:55:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 22:55:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 22:55:38 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 22:55:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac4vRLXrbFtrRvwz7KihahJ1UhYZjsoNEaEw+U6vR3sasSWE2e7qp2w1Q11lWn/FyIUB11gKgurxeFllRpV/37cTthgv+QvTGxY1hp+bu+too+zMX4mBMkV8vY4MnAaN1ofZRfLlev3cyVsiFOdYfTzbsPlocTMdP4MboojHq7wPh4r2OkBuKhDBhsZ535bvX8ZklqkF0NwyPgSDwYKlecMGZfQywjamiKIghBHHuUYiNeQMLt3LFR7BI/yYL3uoOKLo8jymUuDQHGS/6G2GfrqvNV4/dTYhohMetbIYVejqXixBXbWm++JdZddN/g0Wo9GDQp9Gvtxp5zbLjkp7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2iIwbsBIczt9DXYsbD1Ob+c3mgQSX5xQszvnkELCEE=;
 b=j1YceR7QtO3swv0SAxEGWbL1TBUkFoZyAaBDpbAz6jKRXxGEPFEEFV6cdKe3wGzh1MJ9Ub77jmLICtrFkVBBKPMxrJ6e98yKVwAinhlJKd0xK/sG7JI3d/4YNu4ucAVwl2ZJCnAr5iGo7ysRI69jRZoe0Kg9g0JR+ugdfVQUSaQZSKOsr72GVs/dRG/UrLisyuHQCN50FPM5YKdFNzmiNJc8rkcawtFIYnhfn3ngQlQZM2fTxza65K+c9jQweo6xZHLyoFCgh4fV7UnXktxJg2r8EM/y6sKWMpn5ShJ9gmKQ0p1PX6BBXhFNBxdJTVygW8xRAs9XidvabnINn+GiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 06:55:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 06:55:35 +0000
Date: Mon, 14 Nov 2022 22:55:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/3] Documentation/gpu: Fix section in the wrong scope
Message-ID: <20221115065530.2ods2htabemucvuz@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
 <20221107173209.2219571-2-lucas.demarchi@intel.com>
 <ee6f2ae9-9420-1c91-a029-644cb8ac85e0@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ee6f2ae9-9420-1c91-a029-644cb8ac85e0@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: ee193946-368d-43de-8763-08dac6d66407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7lbZXIKi6/8DNCoH403PNk8EjrOa0fGhrfVBCC7Fxu8NunaVZRUUvY6nxAV14saStN+LIrkjuK8Vi0VEnSkV7Y2WjqChfso8whP/j93qo718caQblIMDTT+gCrCHRPW9/lQ/N8OEQV00m40I94jUwu4mCk9W1hR3Bu8Yd9H0qWdWmrqA4l9DiMnTLnTrzm6XcUbZN0JRjCnzHCwYsIRV5owtNcR553hoOm8JpfXzOYDpTo4Q0wrojlmHdS/ARDV9AHs/tGPSQD3r/LA6Hj+ncbgs8yMxWuxeQriWRgk9Vvvv6Pi9T2sn1/9y5Yzibn2XHY5x/PCC4Q/lIkZ2Cf6E/rUPf5bF88NPzmfadGWGVLHRRh1kryursCgjVFxpPjKUclzOaTtynOt68Rn/lmmGL9k2n5jKUUfwAo7nCM33R9bTfXWCKoKCSpl0frjMeuW81MJkJRrst2OojPv06vPcgnDxgepkNk6Wxkq7Ims3tJp/obkjIJEvPvIRhzp1CvR9jzDM85/cUXsHkPmP9BLTZoNAzDwIpoCTj3H0Y9C4rGg0oBXvO4mocqNUvhbFsx7AUmtHjzDAk3DE+gp6pmPfZrSmuH+qqGHpiAuSCYJ1X1FH8RppqeH3TI8mTxay4JzJx2wG4GNAloucKIj1e8aEF/GIw3RZ73jgkwoDg6n8lz1DVYlS3ACQjmhz7URLVS3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(478600001)(6666004)(6916009)(6506007)(6486002)(9686003)(6512007)(26005)(82960400001)(316002)(66556008)(66476007)(4326008)(8936002)(8676002)(86362001)(38100700002)(66946007)(41300700001)(5660300002)(36756003)(186003)(1076003)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uEbm4sZ658Q0AwYs9f3jR7nw+Ab8+eqziOfKDcWylwGaz123H4cGv2VvemV3?=
 =?us-ascii?Q?+PPpCb5aa02QOZvL9omwPYF9k6MURiwrDF3vpu0s/0B35UUM4DLSiUOguVHY?=
 =?us-ascii?Q?Se5R2NVbyyp0f8bmcm2TpeEilR69mT9yO0dV+XV4Xxn7QU3lCshKwcIyBTmY?=
 =?us-ascii?Q?Khet6AAsmQ4slosCtrjOfI+mqmO68kXint+DPcNE/3nqLSXkPleKdnSv3dHr?=
 =?us-ascii?Q?VPnVTtt/K4Dz1ochCQPZgMU3zbj1d2vhKDCWNHc8UtKf8ScA1ClPCw1zkl76?=
 =?us-ascii?Q?vcdNUaLJqMXN1I2pkJsufyt7HE/adDi+yUDQvttyBXVfH3a6/bkicQHXLhss?=
 =?us-ascii?Q?Sr9xhOVWw4byveV4wTDNPtUFcw+rJvjg7+1JEmKQzmyHNT07xIJXHy0jQMTg?=
 =?us-ascii?Q?WUUk+nebDzx3xjWXDGB09AlTELRXWICWcc445wqLx3jI78VTbF8JIO+PWm5E?=
 =?us-ascii?Q?nVu9CJBoGV4vpenMHMetTGOOJYnaRhzQAS29qnHqrZlEvH4UTAV1PT/ZKKYJ?=
 =?us-ascii?Q?x4PQeNxcT29eSzpQp+yke0LhBKlXKg4K9amhKa/XDCF/k8YGe4u8R4j57PYN?=
 =?us-ascii?Q?j3manyQrZX0NmctUoVUwfvkahPdM+ywpi+4+EOHIuPB6WI8ZC4lcEXkXZ6Y1?=
 =?us-ascii?Q?A2RycGO/Qk/KtBjnliurjT4ahMLYCH8eY8SLUUUD1zzSmp2A3k282w449Wd9?=
 =?us-ascii?Q?pnGRBhHEaeF+fhnoxfXIuRfozKnm2+s0GvrqeRi6+QtNAEdKHQMk9PGNbu0a?=
 =?us-ascii?Q?MQQOiDbTec1Qgj5ZdV/qSZ0q+Z0DSo93/0cqjq0k/En9QP4ABy9DMtlB4N8n?=
 =?us-ascii?Q?UTuB0+iu0IdBjDksJsMhID3RiFJe98UsACKNgcYOWrZHpZTZQSCNVnoZML5/?=
 =?us-ascii?Q?NgYgy9a6pdQdDVf43Oi7p+W3euRmog+4d9oEnbW+6BqxY+wpfWhcVblzqfJ0?=
 =?us-ascii?Q?XYqP8rifBxbnhWtxfp2wy5iblMMVSs9k9eKTCBVrojIjbbBN2shopqPGSIkR?=
 =?us-ascii?Q?lSBewTxxsqWbN/IslRNXTZ82+lLb1TfwZUklMGjJ3pGUBga12Ofoj4F6KFb7?=
 =?us-ascii?Q?ndPaIsXO68jCQMPV3W6ORYnD7bFOuKGADmaoL6w5GvnamdbrvpJFkPAjYF9o?=
 =?us-ascii?Q?PP8dfEP68p172jR0BQTJboqO6E2wyoPIH3slCFJSsA4Ih3r9x8K2fjAeVoaN?=
 =?us-ascii?Q?k/U8Z3lmstJx2RpGQSBg2EQAlzufrwRPD1S/cUhCwY1BGJ1Ypbqg7KukD61o?=
 =?us-ascii?Q?7Vh9ozLuE2D7cnL/yOfDmDwosUpHnOW8tLPYGPzI2F86wETZTeWsBoCixVeQ?=
 =?us-ascii?Q?g8FofLDnnB/ZmEscji2Bxx5aj6ZKNzi/jc+35+hl2cyOr4+nqB4WV/1rHkZn?=
 =?us-ascii?Q?edR83VyTKzcyHvzMZiGb+NyFSsynpMb3bAQQ5hGrSgS4PMhq9eY0EXNauy6m?=
 =?us-ascii?Q?9PJlOr6EjKkEjCwXpuTzv9Ah1GlTOdeoZdSWxEkxZ62BGHC7SD/UhLYgxRgg?=
 =?us-ascii?Q?Pe+KAOQxW/n98pk4Bh01Szk5o9NxQfYcw0th3GtyVSSpI4rjZmr/izJ4cGbS?=
 =?us-ascii?Q?urpdEdZ1V/gE+CIfvU/isWyNGOZNeaYsExaCZQfj34Zh6wcabU6VA+F/GWo9?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee193946-368d-43de-8763-08dac6d66407
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 06:55:35.2224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agLge8ppod/yspGnvaeAIv3scNsc5o0ye6HXcYs60E4XCHoo9tMxl26ivCUQhrFFwNspbpfGhR79xaqiz+7bxPFAUvFJAU0obDi6JkyPTv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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
Cc: intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 09:49:45AM +0000, Tvrtko Ursulin wrote:
>
>On 07/11/2022 17:32, Lucas De Marchi wrote:
>>That section should still be inside "DRM client usage stats" rather than
>>as a sibling.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  Documentation/gpu/drm-usage-stats.rst | 1 -
>>  1 file changed, 1 deletion(-)
>>
>>diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>index 92c5117368d7..b46327356e80 100644
>>--- a/Documentation/gpu/drm-usage-stats.rst
>>+++ b/Documentation/gpu/drm-usage-stats.rst
>>@@ -126,7 +126,6 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>>  time active without considering what frequency the engine is operating as a
>>  percentage of it's maximum frequency.
>>-===============================
>>  Driver specific implementations
>>  ===============================
>
>Oops - yep.
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

thanks, applied this.

Anyone could take a look in the other 2?

thanks
Lucas De Marchi
