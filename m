Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36B40CDA9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ED06EA1B;
	Wed, 15 Sep 2021 20:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73B06EA17;
 Wed, 15 Sep 2021 20:04:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="307964906"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="307964906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 13:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="700352534"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2021 13:04:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 13:04:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 13:04:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 13:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz5GhxBLiVXQM5YB9WJu7NLLnYXH2XNxXTUhj/LcMQvqYJfCQMrvT3660MmJb6BetqDn3g775X9ZEh2N1vxIm88OrLyC9bZslY3HOruZGxlhNyA9nXeHlLBu1o69m8AD+3lgV0vj+491YoMLUB1HC9MTrDe4J8IMhaCNhEfJRCCa/JbX2UoaZNs3ePK7quuLl7GIS2xxH9enTYPrQ1TLTo5VbOZ1QmaWN7bN4YVLqQ8/YJVrmU3f2gtep6coOWAboXtDpmW08c0RQagHMzaZG+mHAcj+opH1coXHr3WkDLrELGfXWmjVPeDIhm9UY3nt/s8ijPcUPbkHT0bhNFHEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zIqJqQRcdSRYsGjJR6e0oT4q4ffoy1Hsij+tR+LUCCI=;
 b=lbAzEOwC3HuhPSh83DMM7mZPCRWMBe/Ey+2pOMBUVQoWr7BzOVVLKirVQV2iJKSl6SdsFp0/rVfeYS93JY4HH+fMgHvhHWqzFSKfh9u+MkVROOa/TpWbMTkcAVgDqOPzH5oqRDwcRoyrQS65ol0JCBfaVE02UhsroqbU6eiPkyXThN85eao53SFOs9yHM8G2h3MeYLyHPBV9lGa3sBuXj1NBixiWhkiuTmpmayOw/PcTEmluSXZHYghVhhFuj37F+B+iV5zHyiI1h9Gt3yMMLODjsUjEEkUXPuIKqh4VNaKA4WyroTvYcTCZCY7+NLsSveUgABaThuSeKaUDiqqaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIqJqQRcdSRYsGjJR6e0oT4q4ffoy1Hsij+tR+LUCCI=;
 b=d319BKSkeHrVftHJF51kuCk0bOlO33mxIVCeWGRn9OglBbj+nwHftb9tlBedv61bybWz551EBzkwVYjsiqpy2SqFb7tnVTEafkOHEgsEvkzun9AMkmIs/Q5xpvDkLsdHfVBJ5NHGsEXbnqFGlcAccC3AhR7DrqKvpPw1rENW9k4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 20:04:48 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 20:04:48 +0000
Subject: Re: [Intel-gfx] [PATCH 14/27] drm/i915/guc: Assign contexts in
 parent-child relationship consecutive guc_ids
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-15-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <69b3d47e-75a3-b09a-aa52-5ff7113b7f32@intel.com>
Date: Wed, 15 Sep 2021 13:04:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-15-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR17CA0079.namprd17.prod.outlook.com
 (2603:10b6:300:c2::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR17CA0079.namprd17.prod.outlook.com (2603:10b6:300:c2::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 20:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c4e36bb-4e9e-4786-10dd-08d9788411ed
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56576AE20F754A1E5F2EC03EBDDB9@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/aqXrG8GyGBnmkLIQzcTC1RD9Zz+HGRjrp3NqIJzSU5tHgAzXWar9aIC8Oe0xqqfsshk9BMwtkNx2U6v2GNqhVh/p+QHY0z4qZ60S+9t97wKAUcNtcXaw5YusMkE3HKCSRHkXVKq00D1azsUrBQfmKn7SogjeqcUZCjD6yrbw0TqRMvEneSh3IadVUsuvQM1gyDH7vVDomUup6v8kZK5f4ZHiHDNh4Sc7i9V218hPlGcvAc5u/4EXm+A+waHEVjS/fc6typdtP13jpEP6TG5V3h3P2dfcqEXiggqkXBRXaqpls+nB61N9q2uvFmdVdL0oGJtmjaU4pSNsXcu0wE5Qyf1L2WeobVBIj4S813t5g28VLDI5l/X+ZrDtfmFx0xb3A8kFfwCrmQDm5krTMxJ0HKYHE4ctn0hPY9ThM2XadePERtekWr88HJvZyKmk9mRUAyEu/qiuCdLTm5nhXcA82omWkFwIjvrdUq8k85RjCAL7an0IMkDr/5tqqgU9vKjEooCN1S5/Mfbq0a+1CC8AsDgxSc01cE3GfK6MPtukyLqowp4jFzLQsSwe3sQxM555zxB9PLbfhWSp7Cqo7mMkh5MTWIIXLWlS/1Bh1GLIVLGPBOkSo97Okde4acloOQU1xjFqJvjfq28xI977ccNDnqvMAIJjMpsGDip7n1tyk+lfMLXa+zc1vEjZ2He9PuFwew456UmQlgwaq92eYcpp7FO1fgGbFBGaX9uq5v/jmprqp81zke/VPJUOn1aOZ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66946007)(2906002)(31696002)(53546011)(66476007)(83380400001)(38100700002)(66556008)(26005)(186003)(36756003)(31686004)(4326008)(508600001)(86362001)(316002)(16576012)(8676002)(5660300002)(2616005)(956004)(6486002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ovZXZUWGxIaUJyOEZ2N2ZxUDRTS3AyTktNUm15eFdHWEZVdVJac0VDOStS?=
 =?utf-8?B?OGdIbHFEdmwrWTJLdUE5T1MvendkazI5VytNNlRVTXhIQ250MWg3NXJlL2Ra?=
 =?utf-8?B?ZjVTVGNPeTRSbWhUUkVlN01qZnZVR2pkbUJQZUdxdXZjcmpzdDUxSHBKWDJH?=
 =?utf-8?B?U0RyT25ibXR1bXpobGV5c1cvUkxLRm5vc0x6alhVQ0pSVjZPZ1d3Tm9LWmdO?=
 =?utf-8?B?eFgwcW1jNnNJZzNyNEliTGt1MHBnSDNHWXdiSDhzL3JZRFZCWjZ2UllaOHln?=
 =?utf-8?B?RlJGenVuMnRmNmRLVUFoUzdhSExyaFBQTEt5N1lZOThQUUVIZG5aQzIxVHMw?=
 =?utf-8?B?Zkl6S01xbmNtSkNZS2U1bnorRTN6eWk0TVRXQjE0RlhPTWVmcm4ydXF3ajV1?=
 =?utf-8?B?Z01rdlp2ZWdkaHMxNlpsSWEveXJqNS9lOXd4ZGJGQVErTFk2K2RrNUVZdUVN?=
 =?utf-8?B?OU5Pa0ZTN3h3cGNsOWEwWEJiMU1iUlhlajR5OXBnSk9iWW5JRWJPNU9nUmNI?=
 =?utf-8?B?UlBPRnNOUXZwaWttY2YxVUpmZ1RLV0F4ek1MM2t5dFJVRDQ4bE1yQ2JHWW9j?=
 =?utf-8?B?YXdaeTFOekhmVnVTMUEzK0ZoS0sxU2NJMmJzUSs1N01qMmZQekhGUzlyQlJE?=
 =?utf-8?B?R1VRdGlCL25CQlpMSkgyeUExUnNHeE5sNjdFSEszUlA5eGZCTlVIb3gxZ3hZ?=
 =?utf-8?B?N1FSczZKN1c3TytZN3pXMUo3akhmeXBrWWNtTUxBWTkyY2JYdXV1VldlSE9H?=
 =?utf-8?B?cG5wOVFQbHFnK0c5R3ROengyNksvaG5hSm1QYUdCeS9EQzdLWFEzUzgxRld1?=
 =?utf-8?B?VjAwOGFKaTZGdmxTM0RYN2kzSml2bXZqTGpqSko1UHNDb1doNGNjSlNJMFZW?=
 =?utf-8?B?NjVPb215ZDVMUzBIL3IvYS8vM0ZUYlJjSmJtK0NpNDUzV0VqOTE5dWEyelor?=
 =?utf-8?B?ZHhvQVkzWFBvNmNUN0dueFdzdXk2RHBwMytDbXJ3aTBsdkdwOHhMWEhsbks2?=
 =?utf-8?B?aTVpU1NNaElydmpZRy93YnQ3TjdmcFRlOTFaZXpiMFkraU82dmFVMytoMmRh?=
 =?utf-8?B?eWdRWHFIRHhSYlcyS0Y4UkxLcVVlMkN2V1dsdks2ZlhCejJwcWJtZFMwY1Zy?=
 =?utf-8?B?NS9ndmxtZEp6NytFckFPK0RKS0FXZklaZHNpMko0Lys4ODJ1T1RObkIraGZ3?=
 =?utf-8?B?eW44L3psbnFxRkc4ZkppMXpnaTlLa3Bzd3owRkppK0g3UFAxY1FSelB2NlJB?=
 =?utf-8?B?ZGJhNkhlbFhmSGFNZ0RoeXZtLzNwUXhaWkdIYVFQd2hGbmljOG1pY3NibkY4?=
 =?utf-8?B?ZllBUlRjcEx1cEFQZE9JTFdoUXNaeUhRZFF0bWp0aDh0bW1lOGUzR1g0NGIx?=
 =?utf-8?B?SktIcDZlNkcvaVlVMnMwWitSYnRFSEJrMys3Um91S0tFMVNNektKOG1UNWpO?=
 =?utf-8?B?RlZPWTNYcEYrQUNnakU3SlUydjNveHdlVUhQWk1mQ0ZLZG96Yk15RllybU1P?=
 =?utf-8?B?d0RoYjRqRHdWUVVMenRvRngrbkV3ZFlvYlJpcW5LTU14VmY2M2Q1alY4U3A4?=
 =?utf-8?B?am4xSzVUT1FPREFPQ3JDbWZoQ2h4UDlqS1UyZlB3c3J1RkMweGltV0x1UDIv?=
 =?utf-8?B?c1N5LzBNb2NJNHQybWdHSmlEbUIxSGRJaTRCQWVhUnV0ZEJDd1Zjbmxtb2th?=
 =?utf-8?B?S0pkR1FMYzdma3gzeElZR0xuUDlFczAzaUI1cDhYWXExM3B6d1Bxb29lb25R?=
 =?utf-8?Q?E1XzAjQruoaHciLYAhegDRndQsLE1i9gAJ7FSRc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4e36bb-4e9e-4786-10dd-08d9788411ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 20:04:48.3262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BN6o8kIvX+W52RAUnnXrjXKnR0GrT1aIjaxr2OCDF/MD9e+tJ5RXkFAtIqZkEy7qUuF8D1K0A6O3UxLU6+4dKMb5QA3eHwZYqxDS73kv3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Assign contexts in parent-child relationship consecutive guc_ids. This
> is accomplished by partitioning guc_id space between ones that need to
> be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
> available guc_ids). The consecutive search is implemented via the bitmap
> API.
>
> This is a precursor to the full GuC multi-lrc implementation but aligns
> to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
> when using the GuC multi-lrc interface.
>
> v2:
>   (Daniel Vetter)
>    - Explictly state why we assign consecutive guc_ids
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 107 +++++++++++++-----
>   2 files changed, 86 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 023953e77553..3f95b1b4f15c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -61,9 +61,13 @@ struct intel_guc {
>   		 */
>   		spinlock_t lock;
>   		/**
> -		 * @guc_ids: used to allocate new guc_ids
> +		 * @guc_ids: used to allocate new guc_ids, single-lrc
>   		 */
>   		struct ida guc_ids;
> +		/**
> +		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
> +		 */
> +		unsigned long *guc_ids_bitmap;
>   		/** @num_guc_ids: number of guc_ids that can be used */
>   		u32 num_guc_ids;
>   		/** @max_guc_ids: max number of guc_ids that can be used */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 00d54bb00bfb..e9dfd43d29a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -125,6 +125,18 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> +/*
> + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> + * per the GuC submission interface. A different allocation algorithm is used
> + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
The 'hence' clause seems to be attached to the wrong reason. The id 
space is partition because of the contiguous vs random requirements of 
multi vs single LRC, not because a different allocator is used in one 
partion vs the other.

> + * partition the guc_id space. We believe the number of multi-lrc contexts in
> + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> + * multi-lrc.
> + */
> +#define NUMBER_MULTI_LRC_GUC_ID(guc) \
> +	((guc)->submission_state.num_guc_ids / 16 > 32 ? \
> +	 (guc)->submission_state.num_guc_ids / 16 : 32)
> +
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
>    * require a lock.
> @@ -1176,6 +1188,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>   	intel_gt_pm_unpark_work_init(&guc->submission_state.destroyed_worker,
>   				     destroyed_worker_func);
> +	guc->submission_state.guc_ids_bitmap =
> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> +	if (!guc->submission_state.guc_ids_bitmap)
> +		return -ENOMEM;
>   
>   	return 0;
>   }
> @@ -1188,6 +1204,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	guc_lrc_desc_pool_destroy(guc);
>   	guc_flush_destroyed_contexts(guc);
>   	i915_sched_engine_put(guc->sched_engine);
> +	bitmap_free(guc->submission_state.guc_ids_bitmap);
>   }
>   
>   static void queue_request(struct i915_sched_engine *sched_engine,
> @@ -1239,18 +1256,43 @@ static void guc_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> -static int new_guc_id(struct intel_guc *guc)
> +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
> -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
> -			      guc->submission_state.num_guc_ids, GFP_KERNEL |
> -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	int ret;
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
> +	if (intel_context_is_parent(ce))
> +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> +					      NUMBER_MULTI_LRC_GUC_ID(guc),
> +					      order_base_2(ce->guc_number_children
> +							   + 1));
> +	else
> +		ret = ida_simple_get(&guc->submission_state.guc_ids,
> +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> +				     guc->submission_state.num_guc_ids,
> +				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> +				     __GFP_NOWARN);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	ce->guc_id.id = ret;
> +	return 0;
>   }
>   
>   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	if (!context_guc_id_invalid(ce)) {
> -		ida_simple_remove(&guc->submission_state.guc_ids,
> -				  ce->guc_id.id);
> +		if (intel_context_is_parent(ce))
> +			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> +					      ce->guc_id.id,
> +					      order_base_2(ce->guc_number_children
> +							   + 1));
Is there any check against adding/removing children when the guc_ids are 
allocated? Presumably it shouldn't ever happen but if it did then the 
bitmap_release would not match the allocation. Maybe add 
BUG_ON(ce->guc_id) to the parent/child link functions (if it's not there 
already?).

> +		else
> +			ida_simple_remove(&guc->submission_state.guc_ids,
> +					  ce->guc_id.id);
>   		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> @@ -1267,49 +1309,60 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
> -static int steal_guc_id(struct intel_guc *guc)
> +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
> -	struct intel_context *ce;
> -	int guc_id;
> +	struct intel_context *cn;
Leaving this as 'ce' and calling the input parameter 'ce_in' would have 
made for significantly easier to read diffs!

>   
>   	lockdep_assert_held(&guc->submission_state.lock);
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +	GEM_BUG_ON(intel_context_is_parent(ce));
>   
>   	if (!list_empty(&guc->submission_state.guc_id_list)) {
> -		ce = list_first_entry(&guc->submission_state.guc_id_list,
> +		cn = list_first_entry(&guc->submission_state.guc_id_list,
>   				      struct intel_context,
>   				      guc_id.link);
>   
> -		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> -		GEM_BUG_ON(context_guc_id_invalid(ce));
> -
> -		list_del_init(&ce->guc_id.link);
> -		guc_id = ce->guc_id.id;
> +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
> +		GEM_BUG_ON(context_guc_id_invalid(cn));
> +		GEM_BUG_ON(intel_context_is_child(cn));
> +		GEM_BUG_ON(intel_context_is_parent(cn));
>   
> -		spin_lock(&ce->guc_state.lock);
As far as I can tell, the only actual change to this function (beyond 
'ce_in->id = id' vs 'return id' and adding anti-family asserts) is that 
this spinlock was dropped. However, I'm not seeing any replacement for 
it or any comment about why the spinlock is no longer necessary.

John.


> -		clr_context_registered(ce);
> -		spin_unlock(&ce->guc_state.lock);
> +		list_del_init(&cn->guc_id.link);
> +		ce->guc_id = cn->guc_id;
> +		clr_context_registered(cn);
> +		set_context_guc_id_invalid(cn);
>   
> -		set_context_guc_id_invalid(ce);
> -		return guc_id;
> +		return 0;
>   	} else {
>   		return -EAGAIN;
>   	}
>   }
>   
> -static int assign_guc_id(struct intel_guc *guc, u16 *out)
> +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	int ret;
>   
>   	lockdep_assert_held(&guc->submission_state.lock);
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
> -	ret = new_guc_id(guc);
> +	ret = new_guc_id(guc, ce);
>   	if (unlikely(ret < 0)) {
> -		ret = steal_guc_id(guc);
> +		if (intel_context_is_parent(ce))
> +			return -ENOSPC;
> +
> +		ret = steal_guc_id(guc, ce);
>   		if (ret < 0)
>   			return ret;
>   	}
>   
> -	*out = ret;
> +	if (intel_context_is_parent(ce)) {
> +		struct intel_context *child;
> +		int i = 1;
> +
> +		for_each_child(ce, child)
> +			child->guc_id.id = ce->guc_id.id + i++;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -1327,7 +1380,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	might_lock(&ce->guc_state.lock);
>   
>   	if (context_guc_id_invalid(ce)) {
> -		ret = assign_guc_id(guc, &ce->guc_id.id);
> +		ret = assign_guc_id(guc, ce);
>   		if (ret)
>   			goto out_unlock;
>   		ret = 1;	/* Indidcates newly assigned guc_id */
> @@ -1369,8 +1422,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	unsigned long flags;
>   
>   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
> -	if (unlikely(context_guc_id_invalid(ce)))
> +	if (unlikely(context_guc_id_invalid(ce) ||
> +		     intel_context_is_parent(ce)))
>   		return;
>   
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);

