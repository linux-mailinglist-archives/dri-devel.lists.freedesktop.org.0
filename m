Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2417972E5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 15:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9EC10E247;
	Thu,  7 Sep 2023 13:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C9C10E238;
 Thu,  7 Sep 2023 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694094447; x=1725630447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=elhqw3+awtjalcy82Dlte9Yos/Ni44tITnrqbmALYLA=;
 b=CbHaqBAZsqydW8tpJtIBebGZo58VuGWCr5EYj9hvMA+whZ1FY2U1pfOC
 5IyrwhAqi96GNXkk37W7ehlDbPet0/AW9kMsZ9i6HlkB2jz72eosmj0NY
 Osu5eSNqe692QZ19k5opUD50rX89cU0+pHh2zY3u+5RN+DQVp2bXnA5Bd
 hYKYNOT3zidnCLWfh/9QcxgCmJdfuFP9/g8MacfH8OfjkYPTrBEVHK1J3
 wCkBdfT1zF8mjLVbIiu+4tJ6vvZpIcF0htYgy8KXAX8hbSO68pXWwRMUZ
 7AsEdIP58ImkKWLKt0Ai4m940cA2QWbOJZRFGNDkJQ11HpCPBRsXSFfos A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="377270873"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="377270873"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807555094"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="807555094"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 06:47:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 06:47:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 06:47:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 06:47:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 06:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GudsnjUNrh/827MIO4pGysGyQvkJzVVIWMfLzTG0PNwNQMH6BrdAN5MFi8HOV8Z/lLnGt8yPgrp+/f0OZ6OhJ5OvTVk9f795CjbLjbDR8zqtRfczv4TcqQQDzW5mM7uo2ZI8dfVNA1HGvzL5epV2hCMarg5FvvwDlx/GLeOdGjp/BEhi332ehaHJ/jfGzRXb5e/a+2AHwihehEvQwnJP0OjFzk3+mCvSfKcdH56q5nLZ8TfvHGM2XcwmyQMwPXeCo96xqBlmzuQvS6458UMA1X+xQBDnE6fdTx3CwIBW5JV0TGVkRD0Wc+aKlwdIEaAFBQI6vvE3sLgOyuCohg5DNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkQE97aIAAwLSE7P1ayZvU8F7BqqmCE7Ntr9RRZahkQ=;
 b=GwGuYZJRi0osmLE4Hb3vTbv9QecEKOXPhe0LqbG0wEFaJrBJAc5AkXcZOC2SmYWlMOeRTmd1MPN2wNwzLOYSqbx+lauBXQs7JnouWmXdIOMkuGVY8GNdFwbvfybAVwbEB/4V7h0JLRHXST8YjkNeCXzjkN0EiUmxa2xa/LWM87YvhDTM6fwGS4y68WpFecXBwZXSrgeIJh7ivL9F86xe7z0pO7hi2S00cjJMjB9GjkDRog39+g5fZKwQkCQjVPkHuSwwhur+BbMyvBg6UvfXfYK7Jv3BeWTogBShL1AXTKzsZQ4HIRe3aDxQDhEHZEdWTtsYFRrCbQNCTvlTqGvkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8247.namprd11.prod.outlook.com (2603:10b6:208:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:47:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:47:24 +0000
Date: Thu, 7 Sep 2023 09:47:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Run relevant bits of debugfs drop_caches
 per GT
Message-ID: <ZPnUZ6uUmyWnSdKK@intel.com>
References: <20230907125808.186088-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230907125808.186088-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abccdf4-e09b-4989-af2d-08dbafa8f71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFuhDniC1GoPJvQXqwmQfhd7Oxj63nTW6x6oURGHvXCAkWvt6iaoWmQbmiDWPJVVJeFP+VDLlBeKKJPfch+QVUfoKhLRUIEn271kKhIDTZv+G28snSt9Uq6oYbanqg03Tn8SKCgV33gcx0YGq9bs/agNCoC2Jx9/AfDz7nf2h85v4BfpD8vb1AG5hRiQPsQhwv5ysRGZWPHE8u3XiNUIEVMV6/lhp5zD0egI2DK7jzkEiKHh0Gf3ktvPE+ComvsGgGjgnE43hYdzNYXL4bLzHPZ7MyA/BLmtxC7GqQoQS457m+4HEGMGqYxK6CO/PCJj3qQd8i6KYUNr5Rrjl+I7e79o0AghSk0x6zyC86ZWAD90vuKTY//zsiYez3b+zvC+berW+eSS9yiER87aVp4OjtU3DgqJ5lLqm1+mMD/yLi74ULqo7wLx585Af6feF9kcSKsPr1ZOHtoQgYzqbpNLgvGpPO0E06M1/rgtmiqXkC8ixgCnA3piMPha3q67rBEOqnfINT3J7zbB9NOo6zvCI6/0oGtf1f6/jNBbozx7zbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(1800799009)(186009)(451199024)(6486002)(6506007)(6666004)(86362001)(82960400001)(36756003)(38100700002)(2906002)(966005)(26005)(2616005)(6512007)(478600001)(83380400001)(316002)(66946007)(8676002)(5660300002)(8936002)(4326008)(66476007)(66556008)(54906003)(44832011)(41300700001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+D7Al2bz6AsCr9hTpcB8cU3dvMSwnq3/qbUKeqlE97HKA3GObDnrKG8Higmw?=
 =?us-ascii?Q?A623Yg/TzJi70JXrhx27tUor56cJ9ZK3veIs5S8G5urtEgdpc4DElmdGau/Z?=
 =?us-ascii?Q?NZ5NDBQGN7cc2as3D00wQOaqO9KBcbtTAqareiZlMDO9VdPO74qApl5Ldf7T?=
 =?us-ascii?Q?Hcpff7z1FSt4jOmWTuX6QTsjR6KgBrbxCtJHe+jDQKJQJ/w4n8vVvxHng4uE?=
 =?us-ascii?Q?DePYspk4baxc301210+CzVKvXOBseEObnlQywkbzU9ekj3FB7N4i/0Tdk037?=
 =?us-ascii?Q?+0Az+VdEXuXmqApI79EzrAVWD+792Zum7hhuWMxfKtNnWYV7gw4bvCPzhLNM?=
 =?us-ascii?Q?qX1+Z9F4196UCLD9uiy4JzJuS2fJaP1ilH9xapmC5qSfOQkxfd7pJ7H4ZplK?=
 =?us-ascii?Q?u1Y+HGGJZs9p0smIGWRSQ2rlCAGkPWKhUYB4i7y2ZGWmYy7/l33HoRgQBX9n?=
 =?us-ascii?Q?xAwctHjjVdmSx9WB3mVdgL2odFqYOe3SfpPIbAcDmKVSn8zcqA9CDD9+Ub8P?=
 =?us-ascii?Q?XfdzlDpJgdnJIyrirKyNGHfEcHEZ8VxnYhmCxLjqSfZVsHOcsO6BYCdaU0Mu?=
 =?us-ascii?Q?dlIcWnoVAZtKxlWxX6+dTVcjv/tp7wPZ4yM/FoGsE+fApiooy9JwmM1JtsiS?=
 =?us-ascii?Q?/5ftRmgTlADB1C7YUmi5H3+ITxmadzMpcoJfBZFC3fK9K4gPx+Jv66HGe7Zo?=
 =?us-ascii?Q?8m5xJ5M2P/Ih4xaWNu9H+vDAr7twkGUX/u6BOTiWsF4o2dtdvUc3HYvX5B0w?=
 =?us-ascii?Q?e2CKVg/qs9WaNJgwfaFXL5X3VEZd5+vvTj75uC1dfuMdggaLuQlugw0bfFPY?=
 =?us-ascii?Q?8Z6aBDqxovDRNsMEuzEtX/8AdvQwPJCGIsVUsOOyw+qJllHA00/90rB/M4e0?=
 =?us-ascii?Q?rCtXtY1iJ5ChnYYGxPEnKIRsJTyQBLjrjmAMjUb37op8f2ZuvX0OYRHhGrjZ?=
 =?us-ascii?Q?6Wn1upuUr37ORjpEC3HKnW283+QNNKoycal0ALAymAjWFgi5RlRUXBV2X+UD?=
 =?us-ascii?Q?08GNIPw7oru5/jF5vsSMf1xONBKQFqV2/voHucZjItGfDvrgLn52M+8sAzP8?=
 =?us-ascii?Q?Zp6e2QN0Bpq1xLhZ6SwUKa5c8vXPIZMGzZuXWTw0/G+oJKaxKPk0iPy5fuzi?=
 =?us-ascii?Q?cXZ0OTXyK3WhFu2tSlWngUwTVYQvzyM94F0HhDlu3NXzXAcRSMK75oTdQjFr?=
 =?us-ascii?Q?Db61uKXPWN7ydjaR8vgoS8iWiRuRvuqB34I1xqFNVd+VeubD7yZKN7Y603n1?=
 =?us-ascii?Q?kRXicB0T8tThvrKMglVFdgOyYpJ2L8op65NsrS98u2g9AHFwXMPapKt3m2Ho?=
 =?us-ascii?Q?4w9eiVY5ga2OBk0yhXi7C3dXMOxsZUaQ0b0wMyLcJeZiWUTy2xfFBKbB2zoj?=
 =?us-ascii?Q?Zi8hdiNQLbQ/aU4//2kfQ3otXgai9eOZsqxA/+93m8+0uSOuYkiMzRHByiUz?=
 =?us-ascii?Q?rqsduhxashNXDZATstpJCQLABpNDLB9gyt3dTx13p4hor+S1ze50wDV7l7oO?=
 =?us-ascii?Q?3RoOgImSVrcFs8F/s5rApM13QY2Qn1xD8NbudEU30o7Nrc9vgWw6/2Xob9vA?=
 =?us-ascii?Q?H6s064ZCAiy6ZDcSlPc/F8haZp99LTDGI0EfEz4WYoO9BK/CD9fyB6nGLpfh?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abccdf4-e09b-4989-af2d-08dbafa8f71e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:47:24.1139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2jdJAa98wWoCtE2dniUgjALJ+2YDKiRmaxLLAJYtX0d50NwGq5LirjGQ86kjNDpPJEdsqBu9cautYas80xvYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8247
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 02:58:08PM +0200, Andi Shyti wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Walk all GTs when doing the respective bits of drop_caches work.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> Hi,
> 
> I'm proposing this new version of the series I sent here[*].
> Patch 1 from that series is not necessary so taht I'm going to
> propose the original version proposed by Tvrtko when we were
> young.
> 
> Andi
> 
> Changelog
> =========
> v2 -> v3:
>  - fix the "for_each_gt()" parameter order.
> v1 -> v2:
>  - drop the gt idling and the cache flushing decoupling and stick
>    to the original version.
> 
> [*] https://patchwork.freedesktop.org/series/123301/
> 
>  drivers/gpu/drm/i915/i915_debugfs.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 7a90a2e32c9f1..e9b79c2c37d84 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -740,15 +740,19 @@ static int
>  i915_drop_caches_set(void *data, u64 val)
>  {
>  	struct drm_i915_private *i915 = data;
> +	struct intel_gt *gt;
>  	unsigned int flags;
> +	unsigned int i;
>  	int ret;
>  
>  	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
>  		val, val & DROP_ALL);
>  
> -	ret = gt_drop_caches(to_gt(i915), val);
> -	if (ret)
> -		return ret;
> +	for_each_gt(gt, i915, i) {
> +		ret = gt_drop_caches(gt, val);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	fs_reclaim_acquire(GFP_KERNEL);
>  	flags = memalloc_noreclaim_save();
> -- 
> 2.40.1
> 
