Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D61573A9C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 17:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61409432B;
	Wed, 13 Jul 2022 15:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE048EB3D;
 Wed, 13 Jul 2022 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657727648; x=1689263648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Y+vxTm2GaTwGFzzy6wg80qOOsdcq+Dl2QxRGzMBUGQ=;
 b=P/A7UpjubPGLnJRJbxAWlUMnsaOpjYY8alzpZrVI+AYed2yfyZZ5D5Dg
 6kdW3/gq5do28ORNoHFt23ejK3C2Z2p/23jTMOM9tC/v34VedLB2vAr1c
 IgeVMQrmcJ5oSWIAW3RYZOBwxxER4QKwolhNGJOHYFNWYW7K/7EsSc66/
 ZEeTaaiWAmHMVq3TNIJkoSoLzjhw7Uxqsn30iJHBFZZERivZYuUYpOfAk
 Fet+R+TSC6HOmoUhZZwFkLKHefhUzXoorZz7uSOfVGy15vAELQx4gfXvF
 +Ljk0Hjztgffae/MbuaVJWjmTO+FDlhwwhhuQOApTScE4tBWPbC1E3WXg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286006304"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="286006304"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="922688593"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2022 08:48:26 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 08:48:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 08:48:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 08:48:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 08:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QudOyXV6Jr35Zojllf2lX13z4VTyKkykZYmwlQN+88iNyX7LDGMWn6WunIq9uNlF/umXOLI2khsbCUDi8gwdED7CF1JmDXKdS2sNs+V0p9XfHALJjIZ45wpBsD6ki3dxzZ1yzoiaSw7rsRZUFjtaPH083YPAAXXso1pioXBtJOR2sq6gm+Zx8I/a81z1AmRRvpXoszbAz1pwjv0UdasUTWtjtrM3TspS0eha0GzyGcjDAh8EPEoVo0J+TWw2zqyvsniW52GZyb4hac7VVx2ZF2m/euP6r64MiN8IFtMC4rSb4BGeyH8gutWsZWvRuA3nif5V1PdkpyPristIGTQ8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Iy4KZ3z0IVCx44qbK6Ba7o6c7M5G3JXBtXyIAbsLlM=;
 b=YfM3DEZcPrWbRjj5kfPPEW1LxQ4uOhMYdVNw6fLMsR9JzdJJ/3nb1Rxa953rtz1AQvDe+bPer5N95A2xlBlxp2nCBLYq7dspoFQZ2YtMJpBltch+qP1765FvH65dazod7F6KTFE24K2B3RSqNPR33AmR/tBdYdEAQjB3sqFYBdA/tzAU2/AYukBqeH2q5jqeIrEZ+lSDNHXb+Xs53qWMPKr5X/efIt93qcp66QLArtvGHGSUAVU9tF5GU1EvImU1dj6n4k8DbSiES1jzpCjqINdXvMShhqmZUsxIr9RmXEUswOMu0ZeOXjb38tdP1FL9BtPKj8ewR1847q///LCJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 15:48:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 15:48:23 +0000
Date: Wed, 13 Jul 2022 12:48:18 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/i915: Correct ss -> steering calculation for
 pre-Xe_HP platforms
Message-ID: <20220713154818.mlxpncmwpmvpmliu@ldmartin-desk2>
References: <20220712220513.3451794-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220712220513.3451794-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bda36f9d-d0ca-47d0-2f3c-08da64e71e2f
X-MS-TrafficTypeDiagnostic: PH7PR11MB6473:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Macmb8zkn03c/kgtxP15KpgyKgj9pLOA+ZGgRoOqXRNTwDOKYJRw4OSs0f6VFmdNoaeNqc4CB8Undtq0KCMIFje6r7E5bGPalo85hqQROyO/Q2kDz9KMIlQyvobuqP7Ix/dmYnbIyi21kRmGW3DCnBpKi6PUUu5nk97U478P/1rDn36EIpau0QJ2vgyBCbZy1R3mefJR79cMXWxKE8MDva7ReYvVrJvcI/j8+5CiubwWTeXIPrvl/H0zFL/gUHra6JYbx+hRYcpP69JxrPFTSznW4tbQcRmNmLnfuh4K9mBMz3+Y+ObK+/36YqXbkxqWNRDOKocigkkfAz2BoG2gagTzevKr8O5YsGN26M5se0rT6uDgcPH0aPBNm6uyJqJ8staezcaEOLliLgkvsSiF2916XJ9YOshOVeKuOCTw2yEXYQbtd9bQh+Npg1wX34P8kuK3jPwEfopg815puaOi7RHvcvi2zQmtEMHvn47Opdy5eObqqlQyFuZCLrRxcFs/cHg1owc4ZagwmJMAVIqMhaJFWB3lHxfArbyycHJr5+Dk6HifNrRAQGV5ztBm/es9Xnja/60grB8m+cxIkv4ztNDUVtxC5bGkXdZmgNXHXf1MCyHHsWwaAE7/HWFs8jAzUjOWhNrITsWVNe/WPT3LcRSU4LQu7p1fvnbqc6K9S0rQJeCIQGLsS4OWXjmaW7wK3HFyBOdUKKZfmhnhyUoHRh2b62BS1ZEDCXsEgsFKZPqlJVT8Cg0CRztKscIEVAm+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(5660300002)(6636002)(8936002)(478600001)(6862004)(8676002)(450100002)(66556008)(86362001)(316002)(6486002)(82960400001)(4326008)(66476007)(66946007)(3716004)(83380400001)(6512007)(1076003)(186003)(33716001)(9686003)(2906002)(6666004)(41300700001)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gYd8IZgA0DQKRCOvNMAZmdejk/kgIfEY7tp/5/aHP6ypdspGLxgPMThBD5a?=
 =?us-ascii?Q?JBbNL446nb86z6eemuSISAvI3KxjDXY/hkeGldoXSZtprpppqeIXC1waTtPV?=
 =?us-ascii?Q?E+hDJPHzhDr9XOhA5lAJVHZ5N99roflCg4qopfSdWe1iAUykWa4b1nw1mu4B?=
 =?us-ascii?Q?WERl/Jd9SYP6sq9PEF7YPksGKIDdV3nERqbV/tcmYJVzv3vV1wbYhOsD2u4+?=
 =?us-ascii?Q?UkNBNHRjfoau2TLhm4ngOKQWcyuXbPJ1mMBJE1c4hcXTsznNn9orTcz5hsWu?=
 =?us-ascii?Q?r2nAq+p5S0Gpqnd2vO7zi7R3bWPsmThJcH6eqTQZLIrginhFknkRlc5b4kHe?=
 =?us-ascii?Q?Odir6roKZQ7bfGj8PobzS/D+3PLDpYPfvK//87r3zWzwcKPQT+1zragl4bFT?=
 =?us-ascii?Q?KHTw3Z8zvQEtdYzNSqdDyeEe7wLX8bIrfjdwnFpviw7vAPNsIDz1yu/9AmGV?=
 =?us-ascii?Q?zrGXuFg2z8KcYqLTtqbQs4SogMtJcbJvMIGIRClMPo1/1j1dcdbRSS+5bKDR?=
 =?us-ascii?Q?G0vFe9e81RJAqg4u4qAnwlJJo15TB8FoZT9As0+17qeUwfPNUl5eKPjoKeOu?=
 =?us-ascii?Q?taL7VPeHle7/0UvU+vyjgsrCvgzCvkMfaXA1YILAmnDi9TUOZametlW3Q6p/?=
 =?us-ascii?Q?Muvv4wJzTNWY2kzD3eYRXHMKJjTvuInwmAfTBPeew/TIt9WQk1Ei3QnXtwMT?=
 =?us-ascii?Q?BYjqAkNm3SlbZYv5zhBG9nNaouZ26moBUU+Vkgqomia3pPdX02kb81HJ8gvC?=
 =?us-ascii?Q?8blnYylNlI+UU9QEGomPu9r1XSyGNro6NLsumrnYrTBiiYZnb2H7zkS5xzCb?=
 =?us-ascii?Q?DeZSGdxOnRo0ds86Ewvxkc/9YXMHN9vWECDuXyq9HhktlhLmOlq3CPLuMEg9?=
 =?us-ascii?Q?YbpnkjXd+fSEyXY/5JP3X+XvkFI5tt9sfBzSBNNQ60Il7pCCtJgVPPpL/y2g?=
 =?us-ascii?Q?t422gs6m+cV/OU+KPdDX37rMx3zD409DBe2Dbsty8gXJyah7Gh+KhdTkH5YQ?=
 =?us-ascii?Q?dPR4DHT8QWKpstwM4lK3b2QYJgeImHZnXq0y5ejUS0YMGPKvAXhVLmZHhOFO?=
 =?us-ascii?Q?q2/OmZg+Gnm6oSwvZGNVEewXb8apNk6syC1ycNJOj2DOnObLYpzaG+U/uq94?=
 =?us-ascii?Q?cVeKv45Zcz4cZbz+wD1q+mPGQDc239e9BXdXbN2i/ELbIHVHma/ZgiT+Y+OT?=
 =?us-ascii?Q?UcL5FUpIV2upZOLeDmGECi25xldEH11WyA85uj5Ptl2gqFO7VCIelLEBj2xm?=
 =?us-ascii?Q?rbQa58nE5yrpKaxRG1/tOl7+rRXEBDCtJOn+bMUg4tCWKTENf1H5VX5ka8L6?=
 =?us-ascii?Q?QVTiXxrnNoTKWu0do2KKZaIQE2mEpcvzJF4qJ+LOOLjJqVImr6L766j4da8g?=
 =?us-ascii?Q?a2ok85OPxevtPBmUTUmJIe39d3oaQPf6hUNpnsksK6ySpTcvrV5t2InP3Iqj?=
 =?us-ascii?Q?yey0EJGtKfbDlbE2W6pWgo1kRUJcO2FAPMmwSurvSz1Vod/TW86lUbF3fu5T?=
 =?us-ascii?Q?0MNwujLj/ZFi8SASxiZZ2VCPLFZ6ChLAuESUBpuUNols2fyCOyc4paf8YaDO?=
 =?us-ascii?Q?k03jOX1caP+KcMUQhuZj36pmbdVLyorhwpCCKB/Rny7ZClxQVnDQUbvLaPYQ?=
 =?us-ascii?Q?zqDF54o+0zTXe/zqmy7D19moiUfB+ldvo1HmQHpWxN9N5jI9fZ7k7uJ4sa89?=
 =?us-ascii?Q?HBg1CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bda36f9d-d0ca-47d0-2f3c-08da64e71e2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 15:48:23.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REfZGkdVX5l6xIj46RWjzC/xHHXDj2+94SSqgwJH/VVq2G+7kfYT2cOOOQLwLVRsRoVUheOyvH0+fzo+nhGEpHhzmJVG6PJsO0Zkuk9d6e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 03:05:13PM -0700, Matt Roper wrote:
>Accidental use of a "SLICE" macro where a "SUBSLICE" macro was intended
>causes the group ID for steering to be calculated incorrectly on
>pre-Xe_HP platforms.
>
>Fixes: 9a92732f040a ("drm/i915/gt: Add general DSS steering iterator to intel_gt_mcr")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>index f8c64ab9d3ca..e79405a45312 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>@@ -515,7 +515,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
> 		*group = dss / GEN_DSS_PER_GSLICE;
> 		*instance = dss % GEN_DSS_PER_GSLICE;
> 	} else {
>-		*group = dss / GEN_MAX_HSW_SLICES;
>+		*group = dss / GEN_MAX_SS_PER_HSW_SLICE;
> 		*instance = dss % GEN_MAX_SS_PER_HSW_SLICE;
> 		return;
> 	}
>-- 
>2.36.1
>
