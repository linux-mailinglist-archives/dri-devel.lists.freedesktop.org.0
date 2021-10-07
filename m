Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680C425FAD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 00:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2946F4EC;
	Thu,  7 Oct 2021 22:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497A6F4EC;
 Thu,  7 Oct 2021 22:11:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="206499599"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="206499599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 15:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="560937249"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2021 15:03:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 15:03:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 15:03:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 15:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBU8Gc6BwxBXL1/ghjE7RyLQAeM1wB3CYwIPjh9vDHOFiQrYMAtn3yhhdDDVjXVsCyfQN+1UR0jIOz48/FzACvP5pL80DNj8pbAGKZ7LSDzOD5F3+8qLY4ToZCTM3C5LrqjTkFK13PEE7EV36n19UufsNee3fpwD/DJVByTrzGoInWEdvd6YNuuf/534uFm2kZqC51jhGHudd12EAZuE3FdoXnoRX4EOH6gF+gGn2nC+jqjynwezT/6f/AcsWY3FgGH+5XqiY3sSNYD4Clo6r1EBz3syWDYrNPeGH7FidMRmw/oKJu7LjDupDPdIL6KifrzHXiqwI3kK/c+kX+11rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSUfXBYFMakcXvRhzyxgHUFOuRPQu3gJqcQ//k6oxSo=;
 b=BoJfrQbX+SSJpYKa8w6rVGXLtudVvZxWyKsfOWCadaYLTziuopkwgQPHuafvmgraGnJA6kITnbZFp/iJn3NJTmMMc/ps+iIAoA8ztw8pee8Zq7iiy/ztTGWq/s/ztQoiJlX6t2jejcGD+bg3ngAQZW9lbfeU3EZWVQ/uLXI1UCy86/E/9xlMap3GTboR711rZuBQ7/+/DVaqDz0RYO9IICxJ8tQTN/yHa6mSetWYJcqYcfCU4I3QBNXVYPMkOAjVk+Ph7IFzKqt+cz46gx5Kf9aw8cM6rxNFfFaP4uG6HrgVgNP1rGMeu5nA7cQZ043Tm50RX8/raX/Hs212XZGaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSUfXBYFMakcXvRhzyxgHUFOuRPQu3gJqcQ//k6oxSo=;
 b=niWw377E0i4AwNE3gKE8BKuLsP5kON0K0THjGAZFiG2LlZAetNMc/jnE2bGwccOw52uktAoh6DBQZBb1mtXwm2S9iuXu/QZPp9rf+gnUeNuMon+AgEsXjqeCwP618iNyvNtDSPV5VfgabxFNF6QtCLWl5JXLZB6kN2HMw8JO3XA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 22:03:07 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 22:03:07 +0000
Subject: Re: [PATCH 10/26] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-11-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <63c2eb50-b5e9-5aec-1cf8-0e0b94cb991a@intel.com>
Date: Thu, 7 Oct 2021 15:03:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::37) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BYAPR06CA0024.namprd06.prod.outlook.com (2603:10b6:a03:d4::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.20 via Frontend Transport; Thu, 7 Oct 2021 22:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7ad123-2206-4c0f-6960-08d989de3e71
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5593F31B0536ED84209CAB11BDB19@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEK8cLvYtCYT9enc8roiPgMRmd6mOokArGsbPkrZM86P8oULEeYBo6RJQGG1GeWjM7jHfJtGF03Vht0DtHAnZI0Cuoe9M9gQ+eE2TZ3wHIW2XQS9memNS3KVH87UcrunNp+BinW/E7QAAMR0tqZE+5BCaTaIYd84lcEYcyRw+yU/2GTXwlTVrFrx4PiImwDOOaseX+1ZYbNb8AS7P8KKS2MdVtSCH5LYGGNLolNDPulu6uhsPMu3bux67O45+DuoXe9+jyqVzMdAlOGQKyR6GUJwwaDqT8qB3jS59iXf6KVjHGIyAe6Ot3cndhq0v6QwvQDCaPvY92bX5W0+bptFvBvekiOL1b/dQPBa5uICx1fmbBL6JUbpQRUpA3ACczk3cR2Zu3j0qGIJ8cY8qc4odMmWMozlSZ80MVHwpxBAaMEf5X+HE0Y23wsQ7fuREtSASTMrgxEHN8p5rEaG9lThDVSDdP+H1zquW0Cu3oHLJ2pQ5VZOCduAt/QTdPXsTWX5zvDWfXI23pooYdfN1GyVoczVwQk/hCRyb+Dw3p92vhpUgvcYa9hllOdziVcMBXxk0wYrh62tOJuR5rjlXFgxD1mccdO310BiGW/ZZmn4sqI5XXy7uXmzX1XI4QylwgBX932Jvh4QTNMTR7keywJBCxRYE/94rr42T1sQiU80YLdbASCAoaxuOv8IktNIf2EezQZn2nm61NAN+Skl+E50CwkMCfs8MeECRkneP33qqjvi+JSuMAGyZqa7zxjl44yO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(31686004)(8936002)(66946007)(31696002)(4326008)(450100002)(86362001)(83380400001)(8676002)(6666004)(38100700002)(6486002)(5660300002)(316002)(16576012)(2906002)(53546011)(956004)(107886003)(2616005)(508600001)(26005)(36756003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFR1aDlVUk03ejIxNDYzdVNVaEs2bjhYRjg5K3IyQThHMTVRTksvVzhtWXVX?=
 =?utf-8?B?d1o5WlMyYlU3RHBOd2hRbGJ3SzZ2R1ZBLzBCZTViM2VEbkIrTUN2cXlIZmhn?=
 =?utf-8?B?MjJESVRNS2tXUnFQbFNIQ2V3Vzk3NWNldU1vRzBLRG9Ydys5cDB6VE5GUU1X?=
 =?utf-8?B?MXo4c2pnTVVuR1lSbDVsV2dLZ0hzL3hHZ2ZmSUxINUFxMHhNRWN0cTdIUEFw?=
 =?utf-8?B?TlJ3U0VXcEM5dVM2bnpzS0grZlVXM2RaSlFkWCtaSWpkUEgvMGF4S3ZTQ0d3?=
 =?utf-8?B?WVJQMGpqSFRxSXRaWHhkK2hrUkZuRjRXelY1T280dnNVbmFJcWNLSEtqUzM1?=
 =?utf-8?B?Wm9QS2dORkJBUFpCQXpRM2tnVEZGV2JmV3FLbVJhYnNrUnEvNlkyNzdrcy9X?=
 =?utf-8?B?VHk4MkE1T3pFYTZNclFEN0ZhaWw0Tjl0MndaQUxySlVvOUJIWEllek5GS0RK?=
 =?utf-8?B?U0lJWVlCZTV1OHRXK2ZOUElTQ3VBRERYWGNBeTRnQnF0UUlwZ0d6eVJLUDR6?=
 =?utf-8?B?ZTdwTmNKZVlsbHkrbi9mZkZTOXUvTkl5SktUdDZYMEIwbUl6WEd0ZEFxWFNa?=
 =?utf-8?B?L1FUeEtCakMrY1o0R3lZUjRYRkJQT1pac3ZiYnBtYXFqenFhOUc4eFQyZnAw?=
 =?utf-8?B?UlFBSGtWQ2RGeDdILzdnVTdqcVhwREpuWDkwR1ptWGUwWGVobTA5OGVldDYr?=
 =?utf-8?B?SmhEek9qZkkweTA4a1crMUZ5YnZwQWEwSnAvZVh0MkZJMHhoU0lMbEo0eU4x?=
 =?utf-8?B?Y2R3a2g3b2FPenNVZE9XeTJkMkVpa3NLZ2VmRDB0OVh1WTd3V2RlMzBCd3dT?=
 =?utf-8?B?clhnYTRFemxKWnhEOGFlT2dlQVFLendhTnlja1JCYVIvb2JUSW9jVzlTVTJq?=
 =?utf-8?B?UlZmdzl0WWc1SmxML0lkckNQRkxCd21KRXlHQmlUSkJYQkwyVXBaRHNUTnJw?=
 =?utf-8?B?OHpNYkZ0YWRLdHd1d01ucjc0aFIvUzkwWlJTTjRjbERudTB6VS9xdXlRRDUy?=
 =?utf-8?B?b2VyeWxVTFI2NWpwVlNhZnZObFZFOURnSkZNNExOVlBsRjlyVVQ3Nk1JOEth?=
 =?utf-8?B?VkVqUE9wSWx5QVRQVm5OY3VCZVE1QXdyMyszYVB6TnZJZ3M1ZlVDaFlqVEZO?=
 =?utf-8?B?czh5Ykw2NG9aZnVjbDJsSjhKQmhBQ3hSQi9kaU45L1JYeGRpVmhnTFIweFRW?=
 =?utf-8?B?QXNmQWtLRzBDVTZOaVM5akZmeTR2Y05yK0FWRzZ2ZWJCaWlQbFAwNVpVb05i?=
 =?utf-8?B?c0NKNFJlYzhBNUZ2QlZXK05hVUxzTnFDU21jMXJ4UVlFZnBNSVV5YUM0QVZD?=
 =?utf-8?B?bXlMWW52bUJvbk9QNU15NWVvYlZlU294bTZYZ3Q2VUNtRlhZZkNZRnMySm5q?=
 =?utf-8?B?UlFKQUxCMk9RUWlMSTI2ZUk5SFJkVENVRFFsNzNQOGxjUFdRZ09hSDlzZ0Uz?=
 =?utf-8?B?T2VwSWV5Y09ZUlNveDhpUm9BUDJ2cFNPQU1xT0V1aUNhRTNXa0swcjlCQkth?=
 =?utf-8?B?dnlvUFNUMlZyVHpMNlM3eFc2dkJGSVNONDk3OWI4aGx4cjMxYSt2QlJ6QWJr?=
 =?utf-8?B?RElLQmJoeWRVN1BYMUtoSW54RnF5Qllhck5oUXo4UmlNUHJxcWtDSk9FaUFv?=
 =?utf-8?B?RkkwYWc3TGlHTWptNC9RUkpSbVVzMXlxNk9vbXMzSldWWGcwbHU4bDV2clpm?=
 =?utf-8?B?N2FodWIra1dMamNoZ0ljOWt5TFROVlRqZjBMNE9Hby9KSUQxejl0Um5jcFR6?=
 =?utf-8?Q?EBcoTrxIafkVWw0uPZ5pJ0Qra58jIZx1OVGMNyU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7ad123-2206-4c0f-6960-08d989de3e71
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 22:03:07.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8j/5T2h+EketpveaPm7np3cB5w2sRBDr/pbn22Ht0083wOmDfDh7SfXPxafdarNVFquEZWiYYtnAYERFFHMR0FH2pY6uvCzfyr2SNR38KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
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

On 10/4/2021 15:06, Matthew Brost wrote:
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
>    - Explicitly state why we assign consecutive guc_ids
> v3:
>   (John Harrison)
>    - Bring back in spin lock
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 104 ++++++++++++++----
>   2 files changed, 86 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 25a598e2b6e8..a9f4ec972bfb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -76,9 +76,13 @@ struct intel_guc {
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
>   		/**
>   		 * @guc_id_list: list of intel_context with valid guc_ids but no
>   		 * refs
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1f2809187513..79e7732e83b2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -128,6 +128,16 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> +/*
> + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> + * per the GuC submission interface. A different allocation algorithm is used
> + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> + * partition the guc_id space. We believe the number of multi-lrc contexts in
> + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> + * multi-lrc.
> + */
> +#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> +
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
>    * require a lock.
> @@ -1206,6 +1216,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
>   
> +	guc->submission_state.guc_ids_bitmap =
> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> +	if (!guc->submission_state.guc_ids_bitmap)
> +		return -ENOMEM;
> +
>   	return 0;
>   }
>   
> @@ -1217,6 +1232,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	guc_lrc_desc_pool_destroy(guc);
>   	guc_flush_destroyed_contexts(guc);
>   	i915_sched_engine_put(guc->sched_engine);
> +	bitmap_free(guc->submission_state.guc_ids_bitmap);
>   }
>   
>   static inline void queue_request(struct i915_sched_engine *sched_engine,
> @@ -1268,18 +1284,43 @@ static void guc_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> -static int new_guc_id(struct intel_guc *guc)
> +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
> -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
> -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
> -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	int ret;
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
> +	if (intel_context_is_parent(ce))
> +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> +					      NUMBER_MULTI_LRC_GUC_ID,
> +					      order_base_2(ce->parallel.number_children
> +							   + 1));
> +	else
> +		ret = ida_simple_get(&guc->submission_state.guc_ids,
> +				     NUMBER_MULTI_LRC_GUC_ID,
> +				     GUC_MAX_LRC_DESCRIPTORS,
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
> +					      order_base_2(ce->parallel.number_children
> +							   + 1));
There was a discussion on the previous revision about adding a BUG_ON to 
ensure that number_children cannot change between the bitmap alloc and 
the bitmap release. I'm not seeing the new BUG_ON mentioned in this patch.

John.


> +		else
> +			ida_simple_remove(&guc->submission_state.guc_ids,
> +					  ce->guc_id.id);
>   		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> @@ -1296,49 +1337,64 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
> -static int steal_guc_id(struct intel_guc *guc)
> +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
> -	struct intel_context *ce;
> -	int guc_id;
> +	struct intel_context *cn;
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
> +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
> +		GEM_BUG_ON(context_guc_id_invalid(cn));
> +		GEM_BUG_ON(intel_context_is_child(cn));
> +		GEM_BUG_ON(intel_context_is_parent(cn));
>   
> -		list_del_init(&ce->guc_id.link);
> -		guc_id = ce->guc_id.id;
> +		list_del_init(&cn->guc_id.link);
> +		ce->guc_id = cn->guc_id;
>   
>   		spin_lock(&ce->guc_state.lock);
> -		clr_context_registered(ce);
> +		clr_context_registered(cn);
>   		spin_unlock(&ce->guc_state.lock);
>   
> -		set_context_guc_id_invalid(ce);
> -		return guc_id;
> +		set_context_guc_id_invalid(cn);
> +
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
> @@ -1356,7 +1412,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	might_lock(&ce->guc_state.lock);
>   
>   	if (context_guc_id_invalid(ce)) {
> -		ret = assign_guc_id(guc, &ce->guc_id.id);
> +		ret = assign_guc_id(guc, ce);
>   		if (ret)
>   			goto out_unlock;
>   		ret = 1;	/* Indidcates newly assigned guc_id */
> @@ -1398,8 +1454,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
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

