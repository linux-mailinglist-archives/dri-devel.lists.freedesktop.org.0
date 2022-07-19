Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5967579781
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 12:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD5814B620;
	Tue, 19 Jul 2022 10:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A614B61E;
 Tue, 19 Jul 2022 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658225962; x=1689761962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iOg6vu8NuT4JVxzU9w3BE1wuRcC2zv9De6hy5NXrzAI=;
 b=If2JfR5Hcq6c0Vhu05v93Hyd6TJPnMPO/KjTKzRKyQ6nf4RczqKtCVM4
 zPQ6D6rWUXp5vSNvdeu7DryC7y7I4szm47d3xSiSdk8wj2L+BjS2+5wfO
 PajTvTXaJ/vc7DAyHrIbxfLHuoeYXqLp6GyJXVjs0p4s3xU1emp0aTsfh
 GoI1nKcWuzBKruwuvPLSitFV4b2QYivHZdbPa0unArjegnRFGQTc5UHLe
 QrVTTNaINbxG/kYSxSumtk9z0IxhZbXRXAyWnY+2bN8Pk/x+FVKqOX9Oz
 EsFUBAMdQfAkg10tav36k/tI1rV/HRmFS5zVz/daZLQZFzXB09gu39/6/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266855325"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="266855325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 03:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601543560"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2022 03:19:21 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 03:19:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Jul 2022 03:19:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 03:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzuS9Esc5c96gaYncxSf8Or+mTAHDnQGCJvSVXpON8vOQOPGMxqUguTGALnSnQe2TwnduG4rNBGAG8l6B1/c6xP2fbP5oSp1G3FzotVqCIi71lj7G8Jyt64LrmzBH6XbMd48KjYEtsRnf8Sa+M6k10j4707/doXkJoe8TYPqaRSLUzk2ywd0l6PL4J4ju1zezsqkphE9P9eujWAvD74xmPAj0hlbVIzF1ODZ8lNQkIMzY/K8E2k1Dgtc/EcN6E0Ki5k+MnP5dFIRMQj2Au/CNMHGP7EyMXRIjYJwfEA9t0TK3yX821jAT8Xbf5djJPUUkLVLCO8aPJPIViVutmtCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YTa1oIkL8VzPEvoxGb3nphl0o8TTQIuwiG6FzPkuC4=;
 b=UFrdioNDsiv8xHAZMlcixIh6IT+HqErGz/ocSwJt/ephluHsIke4RO97aBsOEHapq4TrmVDojsdt/TDQtYTc9EPi3qg7qRwkhwKh3Z4hUOe7cLRuwVk/Hk8MiwaqJWxmzK1BWSrA4TMUsjBw2JTvWsdBfaaJiORersYJFLL7Z2+wXzkr30LWGEByAzrh1tI9+6GMItIGeYt2bwd2LSnqnA8evzW4lp4gjRUAX8L4og43I+++mCPcXrnMAIZavqCGd/LtO+NbAcRr14Mgrgyj7GeKWqCvayfSKI3NkwSsX3K2c4zttq0uMZFhAQjZNsx0+b0cW4wAymIcj3oO77NUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4014.namprd11.prod.outlook.com (2603:10b6:208:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 10:19:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:19:19 +0000
Date: Tue, 19 Jul 2022 06:19:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915/gt: Expose per gt defaults in
 sysfs
Message-ID: <YtaFIr9gGmh1V+7A@intel.com>
References: <cover.1658192398.git.ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1658192398.git.ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44b1c745-04ce-4afb-3b72-08da697023dc
X-MS-TrafficTypeDiagnostic: MN2PR11MB4014:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Flpayjt6A0fpxRpGIlVgoFP2aMi4eXCS0c0IJfCb1Hnn9zYjKRtD1vDW9lWxQeFX4tO8g9rzOQhgpVmJY/wmlmIupUF5+8MTkXI0JUd7AzRNWKTotThW8+DeNbSf0Qr8kJ7Xpy1t1rSS5naMCy742TzafK6QDYKVg+OKReG7HpEvdVLuSPZ1nZTvVyH1IUeqBSELDYvr106xDmjRPNvSM92MeBYXMNZV8yFVf8lLbGvRaIhCFbY1DBG4zRtl2gQRoVNkQh39pCjhhXeIRsgfqqd3jzYqgIvGVIkYq5jT3ZQb0e4Efg6IFgrp+Fz8YrDMs0uxxm+9Dcwno8bECQP+fhz6vLJ47Bj78tuVVh3PGrSVCQT6xA/9pYf2oWNDSu+8B6DZ+R90AnA8J9dSF8vFkg8fcVShgVmG2m6TWYcspZKzAXeVcjnCZWx8ENanzFm2B6IrkRJBJr/SR9Ujjii3O94YQtOwlB8aG+9xpHzliajHFD0UqYCL4FKBVfI0t/jOLwX/IsoRd/j9AzBuhSpNJsueC/MbmVS2iRUiWGgoVSVlbhuqStCEmF7la3mohC5fFq8gt7ecQnvOGpGNVpWQlznpPmxuAoDivFS6HPYmsI0ru7M6K6TI4f/sOlsCoyr2xV74c5ViYkbGatVdVXq7K8JuGqjQ3VdAlVaVRdP0YiHJJ1zTEI+HSNbOHnQchh1qHXNo2XWWuBCUIUxBi9391jRIwpGRotchWZAMS1yruDm4Pb640rjkd9L5JLo4vR6w8F6GOTyIqG97/ylHHi97oYaPEDOOs17vtPNY1RpAFSPT3AZKpkp4FFacL6SZrP30UX3GS58eUNyHoK65tUQ8pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(366004)(396003)(39860400002)(136003)(38100700002)(6506007)(6512007)(26005)(966005)(8936002)(8676002)(6636002)(82960400001)(316002)(37006003)(86362001)(2906002)(41300700001)(6666004)(6486002)(66946007)(450100002)(4326008)(66476007)(186003)(107886003)(36756003)(83380400001)(5660300002)(2616005)(6862004)(44832011)(66556008)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T3H3ogosjA50CJxPar8dOw6KthJx/sONEG6ywnxmQHQqraiTU0tRkqnOPNoK?=
 =?us-ascii?Q?G9sjgGSe1kosScpxtT2EaQB+K/WQR2YsU/d1yOJfR6sSacZ5UHs5lqlOooNa?=
 =?us-ascii?Q?95lvuHPqc7e7c8xy13JUY5zpa5x4PvYPy7vQFXPKBzgXzL9ggvPit/rPJiYT?=
 =?us-ascii?Q?gQN12pesQXgplsqabARr7fIpZDWYDS+2NEt23kWpTYmJRP4l7Zcyoe+5SDIC?=
 =?us-ascii?Q?RkHGwmP+8CWX/8ZowSu0re6H93WsZ+kVLKcTqs/AWOu5v85aYt3Jpf+9EAs9?=
 =?us-ascii?Q?p6ZIvUnAvosiDb/nhdTP8oJYMXMZMaoKfEUrxUKrml+HB1kD3litKMmM9ZKy?=
 =?us-ascii?Q?nx5CL6nP4dJ3IbtJXiy5rBy7VUDDCHp9jjA1dFWIn0FnK9RrhatndyQjVpVd?=
 =?us-ascii?Q?Uyt8rpErP3XHZXIjyPh7a7eul+MlCUrMsniGDiIihWnxSJgok9R/KU61ls0z?=
 =?us-ascii?Q?jmzYTs9RhdHV1KVzqZAsbxpqJ2uUTclvNsa4YHbd6rjRCBk5/N/pRjIRhiyf?=
 =?us-ascii?Q?weEBYsCluWQlPCLp+8v8vzGYJJwDiKW2lCzAAHXhLXkYWfr34hqVKHvSLNU3?=
 =?us-ascii?Q?GU6V3i5N2u6fqMgAY0aEEM6mV0hG67FHKoJ/0slc0mxjnwEaAKye09Swxkg2?=
 =?us-ascii?Q?idst9r3dvCHWas+yRiSKCcl4YS8JQd3cbtF+Cu0aokOrDtIkKiQWzJpNvn8f?=
 =?us-ascii?Q?U0vULtxJyAC0ZEEz8M5a2IW/j+P9f8IXIxVKzKuu7+3vEc3kN46WwgdqM/Ol?=
 =?us-ascii?Q?/paNncZy6dzP35ms63cEUOwT9LZzMuRYfGVCoCr6+oWXT928N7eI+QBBbskf?=
 =?us-ascii?Q?/wZxj1/ZBbOGsmHk6PLlnonn2Oi9k1f3i2X065sX0shUKJvPMdLMP3uz8wvy?=
 =?us-ascii?Q?sU0Q41GiAAJRmSiWBny34BffCA17QJQjX8fdlzuDai75bFg6x8YTrPLthXy+?=
 =?us-ascii?Q?PjfyaL5CEVJx7F25VcdakRJpz1x8wg2iX+M3YO7c55ZYnFnsIAG6Cry98Yeb?=
 =?us-ascii?Q?vdfcucjFkz4VO5bFfYUFMbWPRiqjff3Tdcvnjvl91oIgSeO6H8q6QPYpo2Cg?=
 =?us-ascii?Q?QVwbyS1JhgMynlF6i/PUpkP1J8M0K1VUoPT8HTpW019lAIctCNfHJN3aJnco?=
 =?us-ascii?Q?2uCvULyZ8u5gFsT7Y13nEC5s1V+RozBikSSz9xIZe6gsKSfIAWur/7IjNV/V?=
 =?us-ascii?Q?O3QzRT4W/ii7irKHi9C8rqU7b13IP85hoZIQ+lmjjyDpLgzEadVEEuQdV6ZU?=
 =?us-ascii?Q?vY0evlAxTC5c7PHya69XDLfKzArJ8RZC+uL+SmUX1wbDUUdR9qYc5e0uDY7T?=
 =?us-ascii?Q?ja5bLeIa7+4W/osZy6M+m4cDTsoV3/AaYqLAMKHVCOytksx6Th+FCeukrrha?=
 =?us-ascii?Q?+vkihjma/IpVE8pFBzFZ6H3f7TE4u7VBvwEpWc+MbZXkoHS+8tAtBaMkRWHP?=
 =?us-ascii?Q?OdrFp9s9ceHheFFDmoIoWvEjN49i1od7Ap1bYxDWwUwtf3rtWJO4QL5DD19u?=
 =?us-ascii?Q?rFf/R1Lzcvepi/gpZCZvT5I/MAzsJYr46D2TYwNuSBaB4Vr9BYpUoSTr6VLS?=
 =?us-ascii?Q?QUC7rej4PpTYcuNlTejy+UDbU+dbeEUyeXsJxNw1jyZFqHcpmYyVJdLZP/+m?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b1c745-04ce-4afb-3b72-08da697023dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 10:19:18.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoY5nKQ55rHOuaVXhozM5CfoczaAeR+4Oz8THEz06MsCuO07DDxFFHo9oRY+kutacfd4xr2nLxivXIx6/VkVcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4014
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 06:07:06PM -0700, Ashutosh Dixit wrote:
> Create a gt/gtN/.defaults/ directory (similar to
> engine/<engine-name>/.defaults/) to expose default parameter values for each
> gt in sysfs. This allows userspace to restore default parameter values
> after they may have changed.
> 
> Patch 1: Creates the gt/gtN/.defaults/ directory
> Patch 2: Adds per-gt RPS defaults (rps_max_freq_mhz and rps_min_freq_mhz)
> 	 to gt/gtN/.defaults/
> 
> An approved Level-0/oneAPI UMD pull request which consumes the exposed
> defaults can be seen here:
> 	https://github.com/intel/compute-runtime/pull/552
> The UMD pull request will be merged if/after this series is merged to i915.

Pushed to drm-intel-gt-next. Thanks for the patches.

> 
> Previous discussion on these patches can be seen here:
> 	https://patchwork.freedesktop.org/patch/484238/?series=102665&rev=4
> 	https://patchwork.freedesktop.org/patch/483988/?series=102665&rev=3
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Ashutosh Dixit (2):
>   drm/i915/gt: Create gt/gtN/.defaults/ for per gt sysfs defaults
>   drm/i915/gt: Expose per-gt RPS defaults in sysfs
> 
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    | 10 +++---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.h    |  6 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 34 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  9 ++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c         |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 12 +++++---
>  6 files changed, 64 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1
> 
