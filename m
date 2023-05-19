Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB5709EB7
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9410E372;
	Fri, 19 May 2023 18:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3810E0A5;
 Fri, 19 May 2023 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684519434; x=1716055434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FE10tnIXXo3FR56VbYzGP7N1LShiR+t2kmA4V8xjE1o=;
 b=aQ/mvZrHdkVzQBFw0yoIXD9lqZJFWv6qPlH286ewXwNk+Eg9P0WTd99X
 zW+/J0RIfCBamizwRRKmcVpPEAuw/A3gRRVetTDi9d8CPDMpDGnYCK0UZ
 ALY7/cHSQHx/Tt9dvZ5YNHpgaLiUJN6bQ0u87My54D8VyHVZcaynyeFdf
 UoeuivVUdEODHwwI74yGDjkJgS8p2FHMPidcsnIaj/epMnwNW/O/Kir+B
 SBi6mLZlEYm7nkLGww7C3+3NixdtnL7YbuRqEnCb/uVHIScZmrEaxDF/m
 C2PLh+ruR2iVMbMmaFSCkl4iNK/VKnXgZc/dLaVYiqUMK+NBCXOJz+aHQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332047880"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332047880"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 11:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="772374122"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="772374122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 19 May 2023 11:03:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 11:03:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 11:03:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 11:03:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 11:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaJ3RszG4jjxs2VS0+OopTun1Qt6p6fHkp33SnAcjE67iHUmiZs8ePPUHVNyIrexuDu+0J1JDIrPG7JXXT3NvRlFDS8N1IqfKqaUcMxP5lGVKD0XHo0CScCWXz0BFIvvGV3xnTSKXP1jje+aDyVGNlKXUQ44hjwLdQlU3QNRq5LI9jzFuiTCinck54Zqjguho2jf+MQmxiciss417qXyysGe2YuP6LSP7I/qXD+U650pEJ/rkXAhwUTrYYLjgfJWshuCRi4z/OrqeERFQ4qW8ScSLszxnjKJQBCZOpHwjXpgtx/mh5q/6+OJxnrR8sKfDOMJPZ8rmbcNzKvPOW/6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXOgxw8PmXyBi2cZe+nhzj807j3YmO6fpwlhKHd+2lM=;
 b=IlLuKG05KRecvpe5u94KKedX9Nerp+btyVPX3hYFzRPrr6hds3oY4ALIC2gJW+BZqznVn6mRH3laoQn/IThBMFqBgF7VqfPVfHk2zvme5nSzCaxE+V2OsU3cgKOm2Wgub9M4k4chMHxY0QcVGmcEeI++QwkToaPJD3HkL2UWN8bM+G06d2KHhlmNqeI7KmmOnHFsGuY572iQOf1vL8R7GsnI4EspV94IDxFOxHYrm6YUHGERgq2cYA2qMxDY42MYAiGANrqrG/JFUHVdLQO959Gg57H6+TwQSSc5loHM78X4OODWxVsDBqbjbE+TT65UuiwSbL1pkZcamDndx+zojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19; Fri, 19 May 2023 18:03:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 18:03:47 +0000
Message-ID: <702e2a4f-0541-d528-421a-8ad783ee2c87@intel.com>
Date: Fri, 19 May 2023 11:03:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 4/8] drm/i915/huc: Load GSC-enabled HuC via
 DMA xfer if the fuse says so
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-5-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230428185810.4127234-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: a2459cf5-d253-4f95-7ce0-08db58936473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcIPsGbZzufSxSncgAn589qg4a7DvpYR93J/cYmYQJM5/ReqU+aTZia4Z5NiyWW4RdB20sQeGPKlBexsCs1mmQeW/2iPBfmuTi2dZbJpVbH7C8j4JbYcORtiBbuZ/3eZpuS6YrNu/9S4mFE2PoK0GO6sCa+PleTkYpKiVfktDacvkEbfMlnlEgq4/hSDmkXxd3OXFDqvitpJGqObS3OrZo6ijujBWG7nHQLT8Ib6Ne3B7VWQyEgTe0ST2j0OvAQ1w7P3XGVcoecroqCU+7AP9VGQxpTU80yAvhed8772IUZDTzuzMbxi1198+IgOzr57nU+QFZr1Lyt1HzLsvz5bHiM/3sqpfR4t4Yd6a6psKS670tN6kZ07RJ+98ZklU7VW8V6A2fZUq7SGVm+uRyvzLfiSk5jThQ4jzocOWhlKbe2lMvwl7IOgTH1ugHYFxhdSc8X+yMIyb9EQDsN6rmG9wVltb+dLBh++U96OHMTBq0pij603/VxZ+UFJm6jpbgJuIhYkdr0UNs4Ld7v8KKBzSAdMdvSOs6QRZR0EDMkZO6sjj+CIwCnis3fg+q4Y/h6LI1ags0ctbV/gwXdcVxLzTaKdssOqY5eg4t3/DCKSk1Q15SDaUCN78qld3pouj8lbkSGGWde2+vGVmjQutSFa0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(6512007)(26005)(6506007)(53546011)(36756003)(2616005)(31696002)(83380400001)(86362001)(38100700002)(186003)(82960400001)(6486002)(478600001)(316002)(31686004)(2906002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(66476007)(66556008)(66946007)(450100002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBZcjVzWTlRZ0dxcG5ENitkZWlIQzhFWmgvRk00Q0tuMTBiRi9HSkdpZG9k?=
 =?utf-8?B?NWxlaHBoZ2FUT2dnemtlQ3dEOURqNGkyUVZLYTFvREljQUJjTFEzcnRhc1dJ?=
 =?utf-8?B?UnlJZko2TmNSaG1tZ3o3cm5tU0tyRlhadUZaclBYM2dWTUYwTUxDUEJmOVJw?=
 =?utf-8?B?d2s3Ymp0eGhZdEtrRXVTZ1RUaHRvTkFyMWdNWmVMYjRWejJEYWxqTDRNUmQw?=
 =?utf-8?B?YTZkN3dianFSRVpiMGJWUWEwU1FmVDJ5S1FHeitiekdqaW1FM29Bc1EwODY4?=
 =?utf-8?B?dE96TTFqUVlyMzlFSTZvNFRJQmtXTFBnVFNEVFR6cGpVU2UveGhYRGhNS1px?=
 =?utf-8?B?QTBrNWl5M3htOENBQ3pWdSsxRC9BcE1GSVloKzRtNUNYR285YUpqM0o5WUxs?=
 =?utf-8?B?amphRkVwR1JlVjh1WVIwdFVXeUNpR3BXRWRGWmN3dEFOcTU5RVJ0Vk1xdUNU?=
 =?utf-8?B?TzZYM2g2aTFDVzlvcFR5bzFna2FHY3lIVXl3aVRBTGppRUNGMm5SMERkazNS?=
 =?utf-8?B?aS9tNVhVZTMxWWRadmFUdXh6UEROcllFZXRCZHRiaTFPblF1TkNNdFBJUzAx?=
 =?utf-8?B?d3RPazBhZXhrM2tERFh2VFhGQkE4R3dYMnFRUXRmazJySzJGZzBJazlIQis0?=
 =?utf-8?B?TnMwNGtlZW1QQTBzaTRpYS9zOXdmV1FrV0RBc0QvaExaVHY0QW1KNnlYVHhT?=
 =?utf-8?B?SWc2ZGpXaWdIWkgyRlRzVXBrNENsYlRNdVNCSWRVV3ZHMUxTdWc2NTc3RWhI?=
 =?utf-8?B?VUZ2QUMxcEQwazB0cFp4d1R2MHJHTTVxV3dSSGFSRU1qcnA5bGNnekl1cjVl?=
 =?utf-8?B?cUczd3FWbVRoK2J0bm5Eb0tXMm5IZTJjVVhMVVU1UTlmb0ZROXBMSGs0ZHl5?=
 =?utf-8?B?aHk5WFdBRVBBRFo2RmZjQitWU3M0WlprUWQvTTdxSmFGeVhnVG1PVWd6d0lK?=
 =?utf-8?B?aXVuems0djl2VGNPRENMK1VzdnJIUFRRQS9ZdlljK0NBTjVNV29aZVFLWDdv?=
 =?utf-8?B?bGtOMjBMMktoMFVWSXBLRStRaThYRWZpdldXVlFJWXVwWFhBUERhY1NlTWJ5?=
 =?utf-8?B?elY4THQvekptTm9LcnJDWWsxanZzMkE0S0d1V3pzWGxYZDRMTFRSOWZFanQx?=
 =?utf-8?B?VGJ1bGV3LzYxQU5iN1JGdGRNUFhOeHdsUVRwSmx6WEV5a09PS0h4UGNqNXpO?=
 =?utf-8?B?NmdHazhSL25VTDYzNzQya1J3YWVQbWVrVmJUZWxrM2VkN3B0dHMvc2V1WHY3?=
 =?utf-8?B?ZHpkWXJNOXRXT0h5bUJwRlhPVmN5TEtISTV0ZTRSc2FzeW8vd0Z5WThpWmZh?=
 =?utf-8?B?RkJWaUhmeXkvMFc4RzZvcXhJUU8zY2R1OHhOa3V1SkNOOFFpbkpuNHl2UnhO?=
 =?utf-8?B?RmNudkJRUDhTc05xTkptVDdhdVNmZlk0cVFyZC84TXlHZlJGZW9wTndKbFdh?=
 =?utf-8?B?SkhITEZxL0VvSVVCN1RZVGVtWk9IWFhmL25RZWpnTVhqUDBsNm5UT0Zzc3dT?=
 =?utf-8?B?TWxqeVV6M2hHdGViSUdlNVNtUEpXNDdNbWhrSnVZM3ZVN3hpcXNWTXRMRTNN?=
 =?utf-8?B?Mm92OTc3Z3JkS2hnaVR5TlVacG9BbVhuZWt1N3RNR3VGUXdlcklobkp6cjU3?=
 =?utf-8?B?V0xxSzRZa0FuWkdhNEpaNWxaK1V4RG9JYzBHandlVmdRM2RKRWF3b21ndGt1?=
 =?utf-8?B?UEhaYVk1Y3hKaFFvV0tTSmlEd3o2Nk8zWUgrb0xucU5DUVEzTVoxT25sdlBV?=
 =?utf-8?B?Tjh0NjV5QU5FTmRDMXBUR005K0dXTGlLdEZ6ekZMVEZQSFltS0ZEZUtIc0NF?=
 =?utf-8?B?RU1IOElrYWdSV0xrK25mdHNBeVRhZkJUenBmTXdnM2dyU0M4UmsxWTlxQ01h?=
 =?utf-8?B?RCtNRUpieEVxNExYL3FYcGNBcHMvN1lMZVlReVBjSzY4R3J6MWtMNlY3Y1Y3?=
 =?utf-8?B?UkszbWk2czFhS1d2ZVlXbHhmN1dqKzQ0RGpqRG1DTDZVSkNwWFJaeUlBNm0v?=
 =?utf-8?B?RGhGanRhTEZtbS9FbHJHT0dOd1BrU3NHRFdCa09KWm1xRTV4MUJlZ3puNXEv?=
 =?utf-8?B?ZHlMUXJNSTdnNDZ4aDhHa0hFaEViRVpldWVzNUZIc1hTWVdHMDZQRUlSMmI0?=
 =?utf-8?B?YmRBV01KVTZRUW40eDI2UWpVREE4K2ZoTnZEZGsrZk1GREVRM0ZDaVc5QjJU?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2459cf5-d253-4f95-7ce0-08db58936473
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 18:03:47.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL3/gb201dEyoDjohgfgUI0+PqcCrqDrE4+dHx3593B92edBKvJSSShHZDiXJz7PqVKj3OF8MVE+RIrt90Njp982a3W0qCvwez/uSGWuiqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
> In the previous patch we extracted the offset of the legacy-style HuC
> binary located within the GSC-enabled blob, so now we can use that to
> load the HuC via DMA if the fuse is set that way.
> Note that we now need to differentiate between "GSC-enabled binary" and
> "loaded by GSC", so the former case has been renamed to "MEU binary" for
> clarity, while the latter is now based on the fuse instead of the binary
> format. This way, all the legacy load paths are automatically taken
> (including the auth by GuC) without having to implement further code
> changes.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 27 ++++++++++++++---------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  4 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 14 ++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +-
>   5 files changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 062ff914b274..c189ede4ef55 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -298,31 +298,38 @@ void intel_huc_init_early(struct intel_huc *huc)
>   static int check_huc_loading_mode(struct intel_huc *huc)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	bool fw_needs_gsc = intel_huc_is_loaded_by_gsc(huc);
> -	bool hw_uses_gsc = false;
> +	bool fw_is_meu = huc->fw.is_meu_binary;
>   
>   	/*
>   	 * The fuse for HuC load via GSC is only valid on platforms that have
>   	 * GuC deprivilege.
>   	 */
>   	if (HAS_GUC_DEPRIVILEGE(gt->i915))
> -		hw_uses_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> -			      GSC_LOADS_HUC;
> +		huc->loaded_via_gsc = intel_uncore_read(gt->uncore, GUC_SHIM_CONTROL2) &
> +				      GSC_LOADS_HUC;
>   
> -	if (fw_needs_gsc != hw_uses_gsc) {
> -		huc_err(huc, "mismatch between FW (%s) and HW (%s) load modes\n",
> -			HUC_LOAD_MODE_STRING(fw_needs_gsc), HUC_LOAD_MODE_STRING(hw_uses_gsc));
> +	if (huc->loaded_via_gsc && !fw_is_meu) {
> +		huc_err(huc, "HW requires a MEU blob, but we found a legacy one\n");
>   		return -ENOEXEC;
>   	}
>   
> -	/* make sure we can access the GSC via the mei driver if we need it */
> +	/*
> +	 * Newer meu blobs contain the old FW structure inside. If we found
> +	 * that, we can use it to load the legacy way.
> +	 */
> +	if (!huc->loaded_via_gsc && fw_is_meu && !huc->fw.dma_start_offset) {
> +		huc_err(huc," HW in legacy mode, but we have an incompatible meu blob\n");
Leading space in the message? MEU or meu?

> +		return -ENOEXEC;
> +	}
> +
> +	/* make sure we can access the GSC if we need it */
>   	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
> -	    fw_needs_gsc) {
> +	    !HAS_ENGINE(gt, GSC0) && huc->loaded_via_gsc) {
Should that be || !HAS_ENGINE ?

>   		huc_info(huc, "can't load due to missing MEI modules\n");
'missing MEI modules or GSC engine'?

>   		return -EIO;
>   	}
>   
> -	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "loaded by GSC = %s\n", str_yes_no(huc->loaded_via_gsc));
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index db555b3c1f56..345e1b9aa062 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -39,6 +39,8 @@ struct intel_huc {
>   		struct notifier_block nb;
>   		enum intel_huc_delayed_load_status status;
>   	} delayed_load;
> +
> +	bool loaded_via_gsc;
>   };
>   
>   int intel_huc_sanitize(struct intel_huc *huc);
> @@ -73,7 +75,7 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
>   
>   static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   {
> -	return huc->fw.loaded_via_gsc;
> +	return huc->loaded_via_gsc;
>   }
>   
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index f1c973e1c676..88ad2c322c4a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -34,7 +34,7 @@ int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, s
>   	size_t min_size = sizeof(*header);
>   	int i;
>   
> -	if (!huc_fw->loaded_via_gsc) {
> +	if (!huc_fw->is_meu_binary) {
>   		huc_err(huc, "Invalid FW type MEU parsing!\n");
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index da6fcfe1d80a..3338dd45e78b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -180,7 +180,7 @@ struct __packed uc_fw_blob {
>   	u8 major;
>   	u8 minor;
>   	u8 patch;
> -	bool loaded_via_gsc;
> +	bool is_meu_binary;
>   };
>   
>   #define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -189,9 +189,9 @@ struct __packed uc_fw_blob {
>   	.patch = patch_, \
>   	.path = path_,
>   
> -#define UC_FW_BLOB_NEW(major_, minor_, patch_, gsc_, path_) \
> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, meu_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> -	  .legacy = false, .loaded_via_gsc = gsc_ }
> +	  .legacy = false, .is_meu_binary = meu_ }
Should we be changing the filename suffix to be 'meu' instead of 'gsc'?

John.

>   
>   #define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>   	{ UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
> @@ -296,7 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.ver.major = blob->major;
>   		uc_fw->file_wanted.ver.minor = blob->minor;
> -		uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
> +		uc_fw->is_meu_binary = blob->is_meu_binary;
>   		found = true;
>   		break;
>   	}
> @@ -680,7 +680,7 @@ static int check_fw_header(struct intel_gt *gt,
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>   		return 0;
>   
> -	if (uc_fw->loaded_via_gsc)
> +	if (uc_fw->is_meu_binary)
>   		err = check_gsc_manifest(gt, fw, uc_fw);
>   	else
>   		err = check_ccs_header(gt, fw, uc_fw);
> @@ -929,7 +929,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   
>   	/* Set the source address for the uCode */
> -	offset = uc_fw->dummy.start;
> +	offset = uc_fw->dummy.start + uc_fw->dma_start_offset;
>   	GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, lower_32_bits(offset));
>   	intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, upper_32_bits(offset));
> @@ -1168,7 +1168,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>   {
>   	struct intel_memory_region *mr = uc_fw->obj->mm.region;
>   	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
> -	u32 offset = sizeof(struct uc_css_header) + uc_fw->ucode_size;
> +	u32 offset = uc_fw->dma_start_offset + sizeof(struct uc_css_header) + uc_fw->ucode_size;
>   	struct sgt_iter iter;
>   	size_t count = 0;
>   	int idx;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 2691bb6bde48..8f2306627332 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -115,7 +115,7 @@ struct intel_uc_fw {
>   
>   	u32 dma_start_offset;
>   
> -	bool loaded_via_gsc;
> +	bool is_meu_binary;
>   };
>   
>   /*

