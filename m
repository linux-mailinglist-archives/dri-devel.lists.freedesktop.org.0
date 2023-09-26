Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779077AEFB7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397A10E11D;
	Tue, 26 Sep 2023 15:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02B10E11D;
 Tue, 26 Sep 2023 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695742154; x=1727278154;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pYGI7iHH07fvmPIMzJV4LuSwVlFVJ1s1oktp12nx5Fw=;
 b=dqLJkK/hELpGefTkvbmqFW4F+79hbUj9/REbrJCrLuCdDJg9UDcyH/sx
 5Iu0+gS0/72KGOm7b5y+gX0l0YR7ect0/eB0wdIBGZzzPja2X+AGy4KUi
 F2tVtP5YRJbops7vWbMRGWJe911K3jKcNkOl/QS44u9Z7Y+ENIiG3Y72o
 7zXOsmrzxHi+p4O1txoOF9P6uT6z/tQ5FQ6NWQKTrl39CM3srJRO3Gkw7
 JrH2MBViRym99sz3ZLwuVNhnogean4fCKgZ21xZ9vfHg+O+lBxRa165+X
 mo0ik9l+XnWnvwNW5vEuXgkYIctr0yBWPPqKcAttlbsx4J3eJyQfDva+1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381493488"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="381493488"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 08:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995842381"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="995842381"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 08:29:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:29:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:29:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 08:29:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 08:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqsD2IuvA0bYl3hamKGGMf3wvEK0m+6Ij3qou+T4zu7gbAQW2Uu8+BNWUCHF8vE9iclHPFyQ/oh5MiBcL2wxGLnR0e1SMSGJG0+2YQPPxxY2KInZZgc8IFCsz/PBuW28TeZgTAI4nnxS8T/Hzq6MLrVFqmUbDttm8QP7UYTYtqN20qLzv+wpKOllpFuiq9gszbBnyOg2+DTEiHecHeSPW2v4KmwM8yKr2Jy3/smlNzdQengDuuPB3xe0NycNfOtM+7qgz5ypSoxH7sbzL/Is3PH1jyMiiW8k7PWR0ayV3qUaRVjwzoDkCTJAiROJLVUwzTeKEhCA3ggJ5DTaLe/PfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHlelSEtJF9/3GWwoaHKdJqRhLjI8vGiwOak8Jt0+68=;
 b=ITNTexx1jG7bNAcOIe4K8hocRFRSYynhznwv8i+6RlUSgio91xDSb5JZIW9dlJ2vPtOpHwYsoXP85OBxgbmrDkIVdy0bAj7PWn64GcLy2DWv510Nyfs2zOzeGdGxWcm+p6mSDNs2Z+3mLBpfJM/odwpQYKqxR2dzOv2B9XFHqprGYw+DlxLpJHqQ9ff7nfQ06T9Z3ZWHtImEtOZk4nAxEjDauysm6QTYV3YQFfJ6LpJoOcgrAO1eXOMBBWW+x9yFjhserjPhjJ6RMrzsyr49jPvAp5+Dd9abcLenU0sest5KA9J1O10hm4FiPkCIaLwrjGNzt6Uk9aD4Qu57vqNZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 15:29:10 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%5]) with mapi id 15.20.6813.024; Tue, 26 Sep 2023
 15:29:10 +0000
Message-ID: <4530159c-d3c6-533f-9e4b-f50dba6ffea2@intel.com>
Date: Tue, 26 Sep 2023 20:59:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] drm/i915: Add stable memory region names
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-6-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230922134700.235039-6-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::11) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 3381a786-54c0-4063-10aa-08dbbea55453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ANduKbISrvF0judYMHZ7dM1mu92X+gxxFKh3bocZgs3BI8TYu40A3g+qwzPcvQ/otyCHFQc4UycW1OUIjvguiX7BMxGdq9jKfO3pfCltpgFu5EVVESky3OwXyFC6Jlf6jibqeC3doafdCvSOf2ypRGh/sQ2u2AfP1Vy3ifz73waBWOdhAHunF1Q4SK288O1haqvGu6BScwA3AaB7dJFC+Vy7ROFfE+USfaik7VCrXnVpjVC9Yx873BGPRNGGQ0kH0eSV+LkQKpB7lZQJFfqIUv5qYRZycpVYThy7cZyvCGFHgISI9zqXS7a/0ahHnzZU5I9vZVmdh+huSXZs6av9xNo9KyKtzmcN7Y7dlTOMG7EnhGBRXkuFgrRO9J7bo/j6QWXxc3u1WLNFrlay4m3q+7kvI8f4Z5cH6m0LysbvRPsw9SRehehE1H8jsG8gNZMQMCWGQ5NQTu1uSglOVnW5QOsYPlFFo7OLDQHt61yJcA440MZRSk2PpH9WFr9JdB/DJ0WFf9TXoXaMLWkLz9fxooQGGtZlvEzNdNCwu8xbAtUcjX7vhsXajJt+krZfgjwWTplk4n7g33WFXisqFVHuuN80per0ypoE5ux9EtJCeTc+zDiNxcwq1SABcNNjZOfew43LQVsdXR0o8iumYQyRQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(1800799009)(451199024)(186009)(86362001)(31686004)(31696002)(2906002)(6666004)(5660300002)(83380400001)(4326008)(8676002)(8936002)(82960400001)(6486002)(6506007)(53546011)(478600001)(41300700001)(66556008)(66476007)(66946007)(26005)(38100700002)(6512007)(36756003)(316002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJxeGlxN0lwNWpTR3NXejNiVWIxcUtXRExRMk90amhEcmdDSUR4VjQ2V0RQ?=
 =?utf-8?B?N1FyVjdVNlhLVnhIcEFzc3h4MXJ4djFrOGhTTHBEcjJIOFJYdkE3T0w4SW5p?=
 =?utf-8?B?M1V4MlRjZjBTZkRTWkRCbitCT2hwTHVjT21zdW00THRsMzFIYnJiTGlvZmZB?=
 =?utf-8?B?N0pzenNCSm9hd3ZTY1JkVFR1M2F5VmtCZWdMeHJyR3Rjd0FBaWtRNVl2Nktv?=
 =?utf-8?B?bm9pd3l1Ym5GSDBlVWcwUXFTdGprWjRvcnBhdFdWUFRYK1creHRDc0JYWWNj?=
 =?utf-8?B?VUI2U0RjUGFDS0R0RVhqQmgyK2dFUmQwMHdPRktZS3h1Vk1VUzZUQ0pTOEpY?=
 =?utf-8?B?WHV2VEJwTjZKZWNaNXRmZEVZanR0SFFaaGhudzYraXU1QTRvMC80N3Z2Rkwz?=
 =?utf-8?B?WHBEMXc5ZXVpd2FEZ1VxWm8rZE9OODE4ZUZUR1RDZGdxWlk5SUpLYnJPVlk1?=
 =?utf-8?B?eUhMYnlrZXpvcVZMZ0NPcCthdDJGdkllQ1ZMQXBlZGtGVVkySzB0TnVSTFdr?=
 =?utf-8?B?S1pWYXREUTBMTVRjQVlkaldSRHhzeTVTYmtmb0hSNjFwRlhxTEtJL2N5Qzdp?=
 =?utf-8?B?SUpROU15NnZNWG1kS0Y0Y2ZRNUFpb1lrNlp3dXQ0MXJEMFV3QWFMdFZZcFdx?=
 =?utf-8?B?aUxuUnlJNjdET0owTE9KS2RZbTFyZWdFK1F6NExFbEJxLzVSR21CdDBQaTVi?=
 =?utf-8?B?QWJZamtnL0NLSnh2NTg0R0Z0MmVmWHNLb3RhVUxsVHBxZlFiYmhudjRIcWNr?=
 =?utf-8?B?RDM2U3FVcEIydnA0UVh0WEpIS01ySEhRVHFlTkhGRU8xV1hHZitLVlZCLzhY?=
 =?utf-8?B?VjRjREpvV242azV3elpLZjVkSE5Td05ETkNXUCtOcWVqSzhLUGViTGtMaWwy?=
 =?utf-8?B?MWZvdGQ3ZzFCWUY0SkprNFU4MWNVVkxXMWdzOW93K3lLa21vOXBwUlExb2Fi?=
 =?utf-8?B?V1hMNlpST3BqOWhXa0k5ZnBNbXMzcFVFWE80UkdaOUVZb1RPaXRqS0RXZmsw?=
 =?utf-8?B?M3NCUE1pSlYrOTh0UEl5SVpsVjJBK1laTENlamlvb2tXREdoN3U4VW9NNjBw?=
 =?utf-8?B?V2R2Vk1FbmJHQXNsckZRSHFkRWlXeWRBN1Vpa2R4UExYS3FRU1BwNmpvVXVU?=
 =?utf-8?B?dFplWXBSbTdjUFJLYUp6eEdHVUwvbWo2MW9qTVRBM0VtQWF3RE1NR2RGSlNs?=
 =?utf-8?B?cTRnTVVDRUhnZmhIRHZxNDZjSUdwOVNTQmZGY2xwanJuaFRuZnB1ZFJVMVZG?=
 =?utf-8?B?WVh2SS9HUjFZbkhYNXIvaUtpOVNUR3pmMlMwT1lyL095T1Y4WmYyekRkMnRT?=
 =?utf-8?B?TEx2RUxYTGMzZFU4WC9VL1FTRDhaMEE5dkdOc1ZnL0Jqb1NpUTJxdkExZTJ2?=
 =?utf-8?B?NS96NnJQamYrVUo2dlZBZEFlTWhNVWd0c1JwTmxya2daNG1ITlFVNXVXVXFS?=
 =?utf-8?B?MGhtTVRsMDJsdUxiSDhpMC9EMk9FdlhaMFhlZUJrV1NicXh3a1BuR3ZFRHhP?=
 =?utf-8?B?OFp0eGZ4SmtPTnFSQUg2Y1hMNmZMOUIrSkZEVG1WRU1qTU9jNWNCdGtaV091?=
 =?utf-8?B?Uy9kSUx2TFpkR1dBY1h4NHd2ZUFlQmdkcENja20vMFVMVFRWOTZTRU55YVpG?=
 =?utf-8?B?alowek5sYm1oVVZwUExxYzF0d1JUSitOZ1JhUUZUeDFqWlFWRUNRQVZudkNk?=
 =?utf-8?B?aG9rUklEK2JQdDUzSVRRUDZzMGV6dzBoVlE5YnFYWmliejF4QWh4dkpFbGZr?=
 =?utf-8?B?RytNRnZ6dlBIT3BzaHh1dVVkMEZrZjk1Y0dDRGxOTG5mSTZ4WGwvYXhRTE00?=
 =?utf-8?B?MEJoa2srQ0cwVjM1N3pZT1JCWmJXek10UHBBZUU1OUxWQ2FaZDBZeDJoZUlG?=
 =?utf-8?B?bjlSb2NvZThlS2FFUDY1TzBaUWxDUEwvWDJ2UnhycWF0VTZ4Yk9DWUNLNk10?=
 =?utf-8?B?UTBVdXBFWUVuQTR4bVhlaHNEQ1F6bktLYmhmRG9mUERXN0ZrZFZVZkMyK1lM?=
 =?utf-8?B?a1dqTENDRUtHSkhBVk9xWEhXTmF0emlwVy8rK2cwNFV1SHB1dFpQUnlCRzc3?=
 =?utf-8?B?eXo3ZFhWSEZwcWtDNzVSeEJnM0Z5ODV0MzdBOSswRms0ZWY3YkFVU3MyN2ov?=
 =?utf-8?B?aWhvWGZCVHZrMUdqa0tnODZBaVIwVmpoQy8wc2VBMXhJOFJqSEZiUFZkVGl4?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3381a786-54c0-4063-10aa-08dbbea55453
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:29:10.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgCym4DMK2qRFChVp6QKwhaJ+gETQxtrJX6uBDKLbm5OA/JksA9XQtp8fotkzqsEIeilyih2hdTns5xyfdnAF63zls5pnD0tPaSxlpaKsrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22-09-2023 19:16, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> At the moment memory region names are a bit too varied and too
> inconsistent to be used for ABI purposes, like for upcoming fdinfo
> memory stats.
> 
> System memory can be either system or system-ttm. Local memory has the
> instance number appended, others do not. Not only incosistent but thi
> kind of implementation detail is uninteresting for intended users of
> fdinfo memory stats.
> 
> Add a stable name always formed as $type$instance. Could have chosen a
> different stable scheme, but I think any consistent and stable scheme
> should do just fine.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_memory_region.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/i915/intel_memory_region.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index 3d1fdea9811d..60a03340bbd4 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -216,6 +216,22 @@ static int intel_memory_region_memtest(struct intel_memory_region *mem,
>  	return err;
>  }
>  
> +static const char *region_type_str(u16 type)
> +{
> +	switch (type) {
> +	case INTEL_MEMORY_SYSTEM:
> +		return "system";
> +	case INTEL_MEMORY_LOCAL:
> +		return "local";
> +	case INTEL_MEMORY_STOLEN_LOCAL:
> +		return "stolen-local";
> +	case INTEL_MEMORY_STOLEN_SYSTEM:
> +		return "stolen-system";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
>  struct intel_memory_region *
>  intel_memory_region_create(struct drm_i915_private *i915,
>  			   resource_size_t start,
> @@ -244,6 +260,9 @@ intel_memory_region_create(struct drm_i915_private *i915,
>  	mem->type = type;
>  	mem->instance = instance;
>  
> +	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
> +		 region_type_str(type), instance);
> +
>  	mutex_init(&mem->objects.lock);
>  	INIT_LIST_HEAD(&mem->objects.list);
>  
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 2953ed5c3248..9ba36454e51b 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -80,6 +80,7 @@ struct intel_memory_region {
>  	u16 instance;
>  	enum intel_region_id id;
>  	char name[16];
> +	char uabi_name[16];

Just a thought instead of creating a new field, can't we derive this
with name and instance?

Thanks,
Aravind.
>  	bool private; /* not for userspace */
>  
>  	struct {
