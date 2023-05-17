Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3040707386
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B7210E487;
	Wed, 17 May 2023 21:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901710E482;
 Wed, 17 May 2023 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684357526; x=1715893526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4q+3JsG9hxjG+RJZraallthYakq0l/XWNY0rp3pS06k=;
 b=BLZZCLBJZy7TI38Guvq67NIgQofIoixaFS7wmtpSzVGOu5rMtLyHmA7+
 xKVWtFMDkZMxSaudZRZekbb0kOLUu86SyBa+QtXzqgCGHjHHs/dZebd3Q
 o41TVnt5bSHynCZLUf8LxJ3hirYGmgpl2WVP9irYRZkWwk67fbTT8ufxG
 PHQKl+jUKgnOLhQYGuf43g5Bu6YE7QCm4tHV2kU2yXQYoG0ae+ZHBelgP
 y8+97qT9sIMYVyCkSMjvHD1dzzcon0LDPyVRkq0DRN59kVEW5DW/pGGsG
 ogt9MUpOhTuKN9ofbQBevHWHm2dHqLJzVOlCZNkyS81mRTwlseSQwPHQx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351891851"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="351891851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 14:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696024851"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="696024851"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2023 14:05:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:05:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:05:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 14:05:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 14:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVyS8kxsEanCLdC39G58bhCp8d/uE58HZIK8EBoKSEETVs+oCCgoCZ8ooI17yzu3mZbT6iz6O/9Z6cx27BNQ4sIfgwCYyr7uCib1G1pKVBmHGXRmmiaTlg6WdNh/6QQ5xtV242rDMxW3Gg3ZpJ6K/nST2Gk0lrOfZzGTngcOxB2Fxbw87N4sbpwiYtzrh/XZWVQJFzZ0hUytLjhfrcDFzh0Hj4dRiLrFbbQe6f2VPppzmfTozI84YZYT8vys3/C5pyGNoPP8qjHjc4yBoklHvZB2BaR0Z1qGj9A0ncYVbTkpyPQCSoS67/aoRStWowOBwuDAhyWiM1OcUYrvq2zjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xaVuqWwbbdrv/9lymnsj2X4yJHDP/0Aq6U0oT7511g=;
 b=DBt8WWrWOrH2bVCq7f5s9zNPiQ/iDj8ETc0vlVKIbu78BcUzkEnzJutzgtJgY42An36rk8dUVQSthNLSUXLgbr+L9RUf80RQqPHmiT1cjenNHOkDEn4eLQ2yosooJOtjsi5XHDXrRw8rdZuxhVgcbwflsPtQrYSxXgOO0o1N0lHztsBP/LgCAbsPYeNR/2vzWF34MG+1SgsrXSyiG+76hXCl/dEIQxgf0A/BcKPbvgx+7jQQFVgwI+3K2nlomIZPl+eJzBon8ZBFqhGY4oXOL9qrNLLw6WgtcAsDzq93bMuZolP/81DJB8uQlSYe3tByzHlGmX64HfTNRg/P+jznAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB7129.namprd11.prod.outlook.com (2603:10b6:806:29d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 21:05:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 21:05:00 +0000
Message-ID: <a856d7ca-e5a7-fe85-a96b-6db37764bbdb@intel.com>
Date: Wed, 17 May 2023 14:04:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/huc: Parse the GSC-enabled HuC
 binary
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-4-daniele.ceraolospurio@intel.com>
 <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: a680266a-141d-4cfc-46a8-08db571a6048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XpXRm3diJ6pyUfq9AsFiZRvjDGfo+op5DwF+uVDx5a19CgO1n8bIl4KFfUJSqrUGE8jx9le4ofJTf7sGPSm0IRR87JFD6fyfS26FWyJ88lu5Rb1MSTiazPI+TI/yryi+Kg9VCac67FXazAQR3rJByyv5HqhhXqns3BBWxzLlntMMxcEXHQ3TQgiTOYYxbW35Hl71lU2ePmuamvYzpDs6neiOSSjR+a0Zye8cBxE9LkcMMgNtCntwf2CbIW9uWmZpQLkWKKWH866mwPij77z7oA/alrXOHNUrp1mFbWWev+HqR2jCWrSD3TYhNSpI0Fk9yz8nRifTiNKEStYI7yL16xj8wiodNCb9o/MmNCT/X4Zpfw9cmxSFse/8wmH7XPMX1ypXnbK6osGfjenx2Rc5QsyMvfPuTpmHnmfsx8uUsvOKfpglALwPj8gQ4Sw2vFluJTRl+9ZsIiUjWtNFPPWxS8KuEm6rkoHofoMZ7dAs1Q+iO8zm4oOjStDMde+oBZkjreWh17wSloWzD90Sjwh02bYF+sFaqztVt2u8R/PCDd1nGsifs76HcLwLCiHr7VPBMvAc465pHmU7KCdMhxoXFH9rHgoiSphy1kD/WiOJTqcLl6GoBOaB1dS0Wdi8FtuKBM+PU3+OlLOP2oS8cLvsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(36756003)(478600001)(41300700001)(8936002)(8676002)(38100700002)(5660300002)(30864003)(2906002)(450100002)(66556008)(82960400001)(66946007)(66476007)(31696002)(6506007)(6512007)(4326008)(53546011)(86362001)(26005)(186003)(316002)(31686004)(83380400001)(2616005)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBHUDFaaU5BY2dxUW44bnZiS2ZodXJhejB1MitRYUxjdEsvb0MvVzdDbHF4?=
 =?utf-8?B?cTNuWWk2ZUFnZ0ZUZ0g5NHErMHhoeTdmS0RycDAzYVlvRngyMmsvUDdwVnJD?=
 =?utf-8?B?Tm5FTGZPYmxNOW9XNi84dGk0L1NzTVUrZVFZV2xZRlp2NDhZLzZiMkxRSWV6?=
 =?utf-8?B?MTdQY3oyUnhkUkdMTDRENTM5WWNNZGNDbDVJckxuK3NhNmZtUnJTYWdmV0ZR?=
 =?utf-8?B?Tkdab3ZRS2RrbjVudEZyVzNtdi9oM2Q4dEd4ZnY5OFh6dXZTbDJQenZoczcw?=
 =?utf-8?B?S3Y3TWd5RklSU3h4VGpjWHpqakhPRzI2STFJUk1WeFNQYmVtaHVMNG01bHlv?=
 =?utf-8?B?MGxPdU1iT0hUNER4dUZkQW5NdXp1ZjlzVDhOQmtjYUI2NGgwcEltK2IvamRy?=
 =?utf-8?B?cWNuQ2lGbEFPb05TVnp4QXFKK1B3UzVhaW9VakFtUnI4a1BIeWFmenF5U3JK?=
 =?utf-8?B?R2hremtodVhwZTREak1GZTZSZWVYUGpWQitxV25mSkV6ZzdvaXdhQnJ2QmJu?=
 =?utf-8?B?d2oxenRFQXp5Nlh3TDR5M2ZQYnhhZTlqd2haSGlsVFF0cUUwNWJXNStpRzhH?=
 =?utf-8?B?eFpxdUxUTU1UcDRnTkNHd3N4c0J2TWYxeXBlNXR6UjVnaHMyM00zdFdNV2Rv?=
 =?utf-8?B?MmdnWit1RWU3UHRrN1BicU1qQisxbGxvUW9hZGJWQ2RhWnZ1OGMzaHN2Wk5N?=
 =?utf-8?B?cngyWnVId2dwOFRnSm4zeXVLV09vaVM2bk9wbzFqNzRRK1JSZTVCWnk2a05L?=
 =?utf-8?B?eGlXN2o1SndBdUlNTDVwajlWcGtGaEM1RU1mMzBCMGNNNlBMOEp2SEx1cWF4?=
 =?utf-8?B?YlNKb25GZDZIRFFjZGgzWXQwVVZnbHk1K1d3N3pYWUFRYm9xZENOTUtoS0JT?=
 =?utf-8?B?ejFpVTllMW5aeTJhN3Zyd3Q4YWFJTnkwLzdLbEhvRDJya2UwQkd0Vm9TNU1k?=
 =?utf-8?B?dmxoc2xQMm5pSDZoZlZ0Rk92MVVWdnBRcHVOMXhheVEzbHZWdVpTWkQyemZF?=
 =?utf-8?B?UGxramhjWjkrczgwRnpjelNVWDBiSlJkUS9hQ2lqcC9ueGUxYzdHcnBNaEtH?=
 =?utf-8?B?QTJ0elBrQVZmMlRrUEFiK0dJWWVuSGNPdmFJWDRDd1VHTmVDN1o0Yk10NWpU?=
 =?utf-8?B?elZTZUJmdHFSSTRvTUVqaWdMSjFHcjFhK01lRHEzMVFLN2RSbytUdEFtNVlR?=
 =?utf-8?B?NTYwZU1zMWI2bzZGaHdVb1pCNXE0clFNUk03bStEc09EbEpiVzdrTm9sTWxk?=
 =?utf-8?B?UVFSNFNIdkp5YXlUbEZXMWEvQkhsRk9GVmw3dkRHRVRyYmRtQWU2R2RCTHRq?=
 =?utf-8?B?YndmMmozOXJsSDExcVArOTM5UXowVXZUUjMrYTZONEJwTmc5cVhOZWxPYXBy?=
 =?utf-8?B?VmJXRjZYVk05ZG1wbnc2NndSUXFGenBSbEsvVWNLKzRpb0hWbFN0Rkc1ZFNK?=
 =?utf-8?B?TFlFTTJLRjB6M1NjRzdTQ3Z2T3h2aVBYc0JWV3hrL1dHaGhpUVBzQ3czbmd4?=
 =?utf-8?B?Y0xHdGNSTjRVYTRvR3VQSnYyVjFPSGs1NUhmakM3MlV2a1luaDV3cnZQQXg3?=
 =?utf-8?B?T0JkNVZDV1lzZ1MyYnMrOVMwUmVRTytVR205NUJyRVBzKzRralYrKzU4UCsy?=
 =?utf-8?B?UXUxd0Fwd25EWVNBSGM2ek94TGNrZUhwVkFPeDZlTFF6OXBjMVVFU2V6cnhT?=
 =?utf-8?B?TkJCZS9DTjJHbkRsU3M5Qml0Z0xNRzg2MlZjZEh4Z1QvMmdEYVV1ellpVVF4?=
 =?utf-8?B?aEZXOURydi9raFd5eHpaWjlScXBhYWcvVFBPeHZsUjBRaU5EOTdZQmtVZVVy?=
 =?utf-8?B?ZkpRaFNXVzYvc0IyZjFjOHFCQ1lURTZLWkk5RlVRczBJcjBHODArQ1JDSXlH?=
 =?utf-8?B?Mkhmcm9uMnJaTDFzRVZLQTFSYlIxM3podEtnYTJhZTZIUlYxKzBKdk9ndHVY?=
 =?utf-8?B?bS96OFVQdmE4S1RYUGRMWElOYU84Zkp3QjVTWkxLcFVGdE9aY0E2UW56amow?=
 =?utf-8?B?UGpzVk5uNUlnOEpCRjZEZ3F3dHdVSTZHTHVoQ0dpdllHbjVvbkpWM1Z6Q1A1?=
 =?utf-8?B?SFl6TEF1anduVXZiamRKU3FUc29MZEVGOWE3Q0hLZjR0MEZXUVN2YkN2ek02?=
 =?utf-8?B?dzlPUXhhTllBUjlvd0t1N1Rtd0dCRWlKeTJGVjNidjV3b0NOZmdHb1pwREZN?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a680266a-141d-4cfc-46a8-08db571a6048
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 21:05:00.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0dI8YlAZaYCLJ8IbxlWJ41/m25XPTWYIeFrI6aH2zu4Ef/lCNVLKUxVmVJxMey40vrbvAGu0sMpFpjY2GzLNslMwTQ+7qzv6+G6QlW5tZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7129
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

On 5/2/2023 08:27, Daniele Ceraolo Spurio wrote:
> The new binaries that support the 2-step authentication have contain the
have contain?

> legacy-style binary, which we can use for loading the HuC via DMA. To
> find out where this is located in the image, we need to parse the meu
'meu manifest' needs some kind of explanation. 'meu' is mentioned many 
times but nothing ever seems to explain what it is or where it comes 
from. Also, sometimes it is capitalised and sometimes not.

> manifest of the GSC binary. The manifest consist of a partition header
> followed by entries, one of which contains the offset we're looking for.
> Note that the DG2 GSC binary contains entries with the same names, but
> it doesn't contain a full legacy binary, so we need to skip assigning
> the dma offset in that case (which we can do by checking the ccs).
> Also, since we're now parsing the entries, we can extract the HuC
> version that way instead of using hardcoded offsets.
>
> Note that the meu structure will be re-used for parsing the GSC binary,
> so they've been added in their own header.
>
> v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
>      message, check ccs validity, drop old version location defines.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 ++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>   8 files changed, 272 insertions(+), 53 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
> new file mode 100644
> index 000000000000..d55a66202576
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_MEU_H_
> +#define _INTEL_GSC_MEU_H_
> +
> +#include <linux/types.h>
> +
> +/* Code partition directory (CPD) structures */
> +struct intel_gsc_cpd_header_v2 {
> +	u32 header_marker;
> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
> +
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u32 partition_name;
> +	u32 crc32;
> +} __packed;
> +
> +struct intel_gsc_cpd_entry {
> +	u8 name[12];
> +
> +	/*
> +	 * Bits 0-24: offset from the beginning of the code partition
> +	 * Bit 25: huffman compressed
> +	 * Bits 26-31: reserved
> +	 */
> +	u32 offset;
> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
> +
> +	/*
> +	 * Module/Item length, in bytes. For Huffman-compressed modules, this
> +	 * refers to the uncompressed size. For software-compressed modules,
> +	 * this refers to the compressed size.
> +	 */
> +	u32 length;
> +
> +	u8 reserved[4];
> +} __packed;
> +
> +struct intel_gsc_meu_version {
> +	u16 major;
> +	u16 minor;
> +	u16 hotfix;
> +	u16 build;
> +} __packed;
> +
> +struct intel_gsc_manifest_header {
> +	u32 header_type; /* 0x4 for manifest type */
> +	u32 header_length; /* in dwords */
> +	u32 header_version;
> +	u32 flags;
> +	u32 vendor;
> +	u32 date;
> +	u32 size; /* In dwords, size of entire manifest (header + extensions) */
> +	u32 header_id;
> +	u32 internal_data;
> +	struct intel_gsc_meu_version fw_version;
> +	u32 security_version;
> +	struct intel_gsc_meu_version meu_kit_version;
> +	u32 meu_manifest_version;
> +	u8 general_data[4];
> +	u8 reserved3[56];
> +	u32 modulus_size; /* in dwords */
> +	u32 exponent_size; /* in dwords */
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 9721761373fb..062ff914b274 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,23 +6,14 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> -#include "gt/intel_gt_print.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
>   
> -#define huc_printk(_huc, _level, _fmt, ...) \
> -	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> -#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> -#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> -#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> -#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> -#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> -
>   /**
>    * DOC: HuC
>    *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 534b0aa43316..0ec48c2cd749 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -5,11 +5,146 @@
>   
>   #include "gt/intel_gsc.h"
>   #include "gt/intel_gt.h"
> +#include "intel_gsc_meu_headers.h"
>   #include "intel_huc.h"
>   #include "intel_huc_fw.h"
> +#include "intel_huc_print.h"
>   #include "i915_drv.h"
>   #include "pxp/intel_pxp_huc.h"
>   
> +static void get_version_from_meu_manifest(struct intel_uc_fw_ver *ver, const void *data)
> +{
> +	const struct intel_gsc_manifest_header *manifest = data;
> +
> +	ver->major = manifest->fw_version.major;
> +	ver->minor = manifest->fw_version.minor;
> +	ver->patch = manifest->fw_version.hotfix;
> +}
> +
> +static bool css_valid(const void *data, size_t size)
> +{
> +	const struct uc_css_header *css = data;
> +
> +	if (unlikely(size < sizeof(struct uc_css_header)))
> +		return false;
> +
> +	if (css->module_type != 0x6)
> +		return false;
> +
> +	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
> +		return false;
> +
> +	return true;
> +}
> +
> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
> +{
> +	return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
> +}
> +
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size)
> +{
> +	struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
> +	const struct intel_gsc_cpd_header_v2 *header = data;
> +	const struct intel_gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	int i;
> +
> +	if (!huc_fw->loaded_via_gsc) {
> +		huc_err(huc, "Invalid FW type MEU parsing!\n");
Not sure what this message is meant to be saying?

John.

> +		return -EINVAL;
> +	}
> +
> +	if (size < sizeof(*header)) {
> +		huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/*
> +	 * The meu HuC binary starts with a directory header, followed by a
> +	 * series of entries. Each entry is identified by a name and points to
> +	 * a specific section of the binary containing the relevant data.
> +	 * The entries we're interested in are
> +	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
> +	 *               contains the version info.
> +	 * - "huc_fw": points to the legacy-style binary that can be used for
> +	 *             load via the DMA. This entry only contains a valid CSS
> +	 *             on binaries for platforms that support 2-step HuC load
> +	 *             via dma and auth via GSC (like MTL).
> +	 *
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_header_v2                       ]
> +	 * --------------------------------------------------
> +	 * [  intel_gsc_cpd_entry[]                         ]
> +	 * [      entry1                                    ]
> +	 * [      ...                                       ]
> +	 * [      entryX                                    ]
> +	 * [          "HUCP.man"                            ]
> +	 * [           ...                                  ]
> +	 * [           offset  >----------------------------]------o
> +	 * [      ...                                       ]      |
> +	 * [      entryY                                    ]      |
> +	 * [          "huc_fw"                              ]      |
> +	 * [           ...                                  ]      |
> +	 * [           offset  >----------------------------]----------o
> +	 * --------------------------------------------------      |   |
> +	 *                                                         |   |
> +	 * --------------------------------------------------      |   |
> +	 * [ intel_gsc_manifest_header                      ]<-----o   |
> +	 * [  ...                                           ]          |
> +	 * [  intel_gsc_meu_version fw_version              ]          |
> +	 * [  ...                                           ]          |
> +	 * --------------------------------------------------          |
> +	 *                                                             |
> +	 * --------------------------------------------------          |
> +	 * [ data[]                                         ]<---------o
> +	 * [  ...                                           ]
> +	 * [  ...                                           ]
> +	 * --------------------------------------------------
> +	 */
> +
> +	if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
> +		huc_err(huc, "invalid marker for meu CPD header: 0x%08x!\n",
> +			header->header_marker);
> +		return -EINVAL;
> +	}
> +
> +	/* we only have binaries with header v2 and entry v1 for now */
> +	if (header->header_version != 2 || header->entry_version != 1) {
> +		huc_err(huc, "invalid meu CPD header/entry version %u:%u!\n",
> +			header->header_version, header->entry_version);
> +		return -EINVAL;
> +	}
> +
> +	if (header->header_length < sizeof(struct intel_gsc_cpd_header_v2)) {
> +		huc_err(huc, "invalid meu CPD header length %u!\n",
> +			header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	entry = data + header->header_length;
> +
> +	for (i = 0; i < header->num_of_entries; i++, entry++) {
> +		if (strcmp(entry->name, "HUCP.man") == 0)
> +			get_version_from_meu_manifest(&huc_fw->file_selected.ver,
> +						      data + entry_offset(entry));
> +
> +		if (strcmp(entry->name, "huc_fw") == 0) {
> +			u32 offset = entry_offset(entry);
> +			if (offset < size && css_valid(data + offset, size - offset))
> +				huc_fw->dma_start_offset = offset;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> index db42e238b45f..0999ffe6f962 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
> @@ -7,8 +7,11 @@
>   #define _INTEL_HUC_FW_H_
>   
>   struct intel_huc;
> +struct intel_uc_fw;
> +
> +#include <linux/types.h>
>   
>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>   int intel_huc_fw_upload(struct intel_huc *huc);
> -
> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const void *data, size_t size);
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> new file mode 100644
> index 000000000000..915d310ee1df
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_HUC_PRINT__
> +#define __INTEL_HUC_PRINT__
> +
> +#include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
> +
> +#define huc_printk(_huc, _level, _fmt, ...) \
> +	gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
> +#define huc_err(_huc, _fmt, ...)	huc_printk((_huc), err, _fmt, ##__VA_ARGS__)
> +#define huc_warn(_huc, _fmt, ...)	huc_printk((_huc), warn, _fmt, ##__VA_ARGS__)
> +#define huc_notice(_huc, _fmt, ...)	huc_printk((_huc), notice, _fmt, ##__VA_ARGS__)
> +#define huc_info(_huc, _fmt, ...)	huc_printk((_huc), info, _fmt, ##__VA_ARGS__)
> +#define huc_dbg(_huc, _fmt, ...)	huc_printk((_huc), dbg, _fmt, ##__VA_ARGS__)
> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), probe_error, _fmt, ##__VA_ARGS__)
> +
> +#endif /* __INTEL_HUC_PRINT__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 03f0b258aea7..da6fcfe1d80a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -492,33 +492,6 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
>   	}
>   }
>   
> -static int check_gsc_manifest(struct intel_gt *gt,
> -			      const struct firmware *fw,
> -			      struct intel_uc_fw *uc_fw)
> -{
> -	u32 *dw = (u32 *)fw->data;
> -	u32 version_hi, version_lo;
> -	size_t min_size;
> -
> -	/* Check the size of the blob before examining buffer contents */
> -	min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
> -	if (unlikely(fw->size < min_size)) {
> -		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
> -			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, min_size);
> -		return -ENODATA;
> -	}
> -
> -	version_hi = dw[HUC_GSC_VERSION_HI_DW];
> -	version_lo = dw[HUC_GSC_VERSION_LO_DW];
> -
> -	uc_fw->file_selected.ver.major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> -	uc_fw->file_selected.ver.patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
> -
> -	return 0;
> -}
> -
>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
>   {
>   	/* Get version numbers from the CSS header */
> @@ -575,22 +548,22 @@ static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *c
>   	uc_fw->private_data_size = css->private_data_size;
>   }
>   
> -static int check_ccs_header(struct intel_gt *gt,
> -			    const struct firmware *fw,
> -			    struct intel_uc_fw *uc_fw)
> +static int __check_ccs_header(struct intel_gt *gt,
> +			      const void *fw_data, size_t fw_size,
> +			      struct intel_uc_fw *uc_fw)
>   {
>   	struct uc_css_header *css;
>   	size_t size;
>   
>   	/* Check the size of the blob before examining buffer contents */
> -	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
> +	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -ENODATA;
>   	}
>   
> -	css = (struct uc_css_header *)fw->data;
> +	css = (struct uc_css_header *)fw_data;
>   
>   	/* Check integrity of size values inside CSS header */
>   	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
> @@ -598,7 +571,7 @@ static int check_ccs_header(struct intel_gt *gt,
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, sizeof(struct uc_css_header));
> +			fw_size, sizeof(struct uc_css_header));
>   		return -EPROTO;
>   	}
>   
> @@ -610,10 +583,10 @@ static int check_ccs_header(struct intel_gt *gt,
>   
>   	/* At least, it should have header, uCode and RSA. Size of all three. */
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
> -	if (unlikely(fw->size < size)) {
> +	if (unlikely(fw_size < size)) {
>   		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>   			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size, size);
> +			fw_size, size);
>   		return -ENOEXEC;
>   	}
>   
> @@ -634,6 +607,32 @@ static int check_ccs_header(struct intel_gt *gt,
>   	return 0;
>   }
>   
> +static int check_gsc_manifest(struct intel_gt *gt,
> +			      const struct firmware *fw,
> +			      struct intel_uc_fw *uc_fw)
> +{
> +	if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
> +		gt_err(gt, "trying to MEU-parse a non-HuC binary");
> +		return -EINVAL;
> +	}
> +
> +	intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +
> +	if (uc_fw->dma_start_offset) {
> +		u32 delta = uc_fw->dma_start_offset;
> +		__check_ccs_header(gt, fw->data + delta, fw->size - delta, uc_fw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int check_ccs_header(struct intel_gt *gt,
> +			    const struct firmware *fw,
> +			    struct intel_uc_fw *uc_fw)
> +{
> +	return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
> +}
> +
>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>   {
>   	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 26a9d6e0dc00..2691bb6bde48 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -113,6 +113,8 @@ struct intel_uc_fw {
>   	u32 ucode_size;
>   	u32 private_data_size;
>   
> +	u32 dma_start_offset;
> +
>   	bool loaded_via_gsc;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index 646fa8aa6cf1..7fe405126249 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -84,10 +84,4 @@ struct uc_css_header {
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   
> -#define HUC_GSC_VERSION_HI_DW		44
> -#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> -#define HUC_GSC_VERSION_LO_DW		45
> -#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
> -
>   #endif /* _INTEL_UC_FW_ABI_H */

