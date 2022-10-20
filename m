Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F9605463
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 02:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BD610E130;
	Thu, 20 Oct 2022 00:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCEE10E130;
 Thu, 20 Oct 2022 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666224685; x=1697760685;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o+IdWt+tytM+nRlPz13sb3xJNoUv7N5easAJOkaxe/s=;
 b=n789OpbYN7LLgmyG0z6umVtwxYNZdy3LaZti6ic7rwuKaIn8ceGUDuzD
 xty8d2OMwc4/Be46QR70jWDnn1jBdzlvcIFUktgKxhv4JWdcbDieM0fjn
 vJx5T/hpCzZXTlK6KHpuqZ7/Xez158jG/BASpU8TmNPNukep5Cm43brsq
 QmKRU5WhrL2ReS8hMAOCOBN/OYpfvmMLAco3Hjttwwe3gzqzPhXTu0Ub7
 yRp1LheXuvR605ydv1yUWhSzfyygrwwwajaR0bTdbUthrBWPEHbjUwxi9
 s8lWIyinJ3eH6ViNYnhFFnPls04n1Arsj6SsTHEqAFqOJRYhIaRQWFXn4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286281839"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286281839"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 17:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="754821353"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="754821353"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 19 Oct 2022 17:08:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 17:08:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 17:08:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 17:08:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 17:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB66bDC7C+THSfEC6w7Is9IgVqLRoxNzpFKurl2QtUYDaZeW8rzPOqa0oQW+1GlzIo2PUcPqZh8UdHOr65HNbClBOHZysc1BwzqMN6rPlQbuFtImLoJBAuoNCD4FXw5L/L/0CHL5xicX5TIr9Pbh3iIxVY9BHPjyTj6SVAvUP6QQZuM+LCgxoUgc7ZPgdQesSRY0eWbV+nKCClf9sAGV6S4di84ThkUYKYqh64UNc+HnM0HUhYMSBVj42Sh59TnI7PQJSP+QynGnmBxfcC9JtTpqAf45XGsXLY86Q26CTZfWU/jUPDsI5cfo0wvKTPEsDQ4qxalrVAxvcFC9oC9P+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBMC15fSNKn82Eg2fnEERKzCiVeldamRV8Cwnv7sGtw=;
 b=TKdQ86IDsm2Gp9IIcsJivWHcFM9BOCIq2R0YVzDIOaqKpEZmtHUmOjowJ/UCaLF/PyoM8/n3xuBdN72km3uSBbBfQbyBT7M9pJxcxguJq3OWLVAFk6pwsexV9N6g0itNehXIGBm92Dad6WMJVc8gK9lFg2S5AqqFK5YDGvbIiEAKxkafHub8p4hxd/SRQdeqQ2GtXPxgcHjgx1/48Ard9x+6eGK3kZb1bjp5e8nd9k5Yf0Kp/0I42lChH3Pau+mQQ4+xmoweNJSJYm94T39AJp1yLcE4qDXoNXziRrlKG6hBU4iv63Q74UPED7XSo+UNQacQSN9TIY1BcGhT5gvwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 00:08:30 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 00:08:30 +0000
Message-ID: <8b96537d-b618-cd9a-0921-d616186f6761@intel.com>
Date: Wed, 19 Oct 2022 17:08:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221019230547.3590-1-vinay.belgaumkar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20221019230547.3590-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 8339fb46-575f-4525-6faa-08dab22f387e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFEv7cxqVlSnRS2IKGw9qY6vhAD6TJ+FEAYcXt+zSEBzy08Itd1P5ZPBjFIC1KMOkz8E8AoytBf9K1kuKtw+O6RFWW/5P2WxxrEOZSuExWoNE53xUkpj72boW83p28nGbgtaTzm9cq2unruSUgyBn1Dj+7dQQEFIZLjrORLZEnlKwhTRA7f3N8yGdp9B/ME8HzcG9WY3zsyxlEsCDaH+0oJVt78GKUGltYlDFCKLuKOxU5BBcaL9E1F5iMv3u43IWcKz4CznEPKu2jdECcgU9jOOslQhq2wDymZ7U3X0hglhlwxrFINi7KHiF8K14KNWClBpUFYazqL4IsQXpUJO2yVDyy/ZLGSPlI8523zGIQFFSWw0azvnGvSZQYzfESjvepG1j697aSdMokn/9FrPZA0pm2klicOZzcbkkaLGSt2kHZQOWJcaPpbwrB0c2ffvmofPjKL3wW6UyaHKWyDiTHSRuGP1zQsVV+f8qpHta4bAks3MdfJsswb9Rs2LVjDCl3wfOZdD8Ekk9gXvFEYp+RYaruWju85lFAe3FL8W8nbAExn1aWxhCSoQhwEWB73++EMQ11XDcvEtbVaxNmX2iqGQZeQkh70dMjmm6cL/4Y8zuH0dtjSZaKiLlk2cPxZqA00dCiNwJvoCO1ZsWblUvtgu+ZoVTt7pjIZbAGQN8726cVCJRZagB9EAPhP8YRBcxTv6tzIkQcLRg4G5lKmG9mt0n/nluy5eu8Xma0wNAr5USVpECRqewlCJ0y5BJhG0OROleGteFUWDNY2/rzXQ5YjraWChrlGhaS19i+FI4gU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(31696002)(86362001)(36756003)(31686004)(82960400001)(38100700002)(2906002)(5660300002)(6512007)(26005)(2616005)(186003)(53546011)(83380400001)(6506007)(478600001)(6486002)(8936002)(316002)(450100002)(66946007)(66556008)(66476007)(8676002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtwaUgwYTFvbmtlZkc3QWkvSENJT2tIUGdoQ0NBYy9sRzBUNFVVY0RtYUdL?=
 =?utf-8?B?eE02QXRMMUhTdVFpUTluek44NUdXSjRxWXhIdW5PVlk4Q2s5OWpISU5oT3o3?=
 =?utf-8?B?T3RCc1FBRmRMUHZTUThwbHZXMDFQZGN4M3A0dHBaOUU0R0FqRDFtVGc4M2lH?=
 =?utf-8?B?aXFRTnNlVDVmRzMvbFl2d0IyWGdScnR3cS96UHFmNU5oM0JUUmkzVGtjU2o0?=
 =?utf-8?B?OTlIcDVjWDJPMFpEdVBTK2tpbmhWSzBqM2V0alV6N2VsWTZManZEalNRY1Nx?=
 =?utf-8?B?L0ZaekxQcHhSRnhyRE5NZGgvRlRuLy9kYWN0N1lCRDc2Nk9GOWkydHJkRm9E?=
 =?utf-8?B?VkRxSlBrTGNacXprYTFzWG5HeVgvUXVGMzcwWjQ1QlEyQkIxSmttYW1CVVR5?=
 =?utf-8?B?YzR4d0xJMnBFSkFjN3VLeVBLelRCRUkvR3ByVlBHaFduSm5tR2N3TmJRa0Mw?=
 =?utf-8?B?UktCV040bFdJb2hsTWdjWmJmcGhOcGxBNEE5TGJFMEluUTJTZTNSQVBEeVJT?=
 =?utf-8?B?ODNxZXRFSUZoQjN2SjhmUXhwRnZON0FNdGdiNnczQi9OYVJ0dXFwcUtJSUdr?=
 =?utf-8?B?VGhsWFp0NnBiZHdDS1dVbGF3anZzd1FWSDV6eHdGMWlVOEhmMFkrN05IMUxy?=
 =?utf-8?B?M2VZcW1jaDB1cUhHOUN1dU5DM2ZsZ0V0RCtiU2VFYkZkRWdrOFRCdTF1Wmt3?=
 =?utf-8?B?SkMrQU9WNkFkNWc1a294L0hwNWd4VHdFaUdsdmVLdmRBNHU5U0dRYVdzY1ZT?=
 =?utf-8?B?NUU0bEJMZ2RSYWJ4RjVwN3ZEcTJUT1B3UnFObmNYVFFqQXVINXJRTW4zMHUy?=
 =?utf-8?B?bER0QTJvY1BXNTU3c0VGMVVEN2FzY1crOVdKaDhGRjIxdC9QMTJ1WXFaazk1?=
 =?utf-8?B?bHhvTU45QlN6aUsvODR1SS9xOHJZbUU3cUlpb1FjSXVWQUZKVWFVd0dSdTlw?=
 =?utf-8?B?djFhaUhTK1k3UGpwS0czeHg0VnFuVDR2Q1hFTVZaVnlDMzZwczlhc2lpaXdH?=
 =?utf-8?B?L3FKNy95YVdXVUx5L09XWFN6Nk5icDNvTk42b24xdStNcWEwcGErbnpJWkgy?=
 =?utf-8?B?blVxNFNRelhlL2IxOHVOSmNwSm14eHdtQjZ6Sm5wcnRtL0hvaThuTGJZSjNC?=
 =?utf-8?B?T2QwWFhicmVyZTFiUkJ4K3pKM01FWHdOd3VBTUZ4R2lMU2RjSXdHVDY5aTh6?=
 =?utf-8?B?K1JJQjE5MEpZZlY0UnZQbnBzTzNtMnFIVDdQU0hnb00wQ2x4VW5QMXQyWWdH?=
 =?utf-8?B?ZGQ4NzFtRHpJNGhUL0N4WThtd2d4emtCNkhrcDVjOEJhOFVCQ2UyS2xjZ1l4?=
 =?utf-8?B?QlJKOGRkWDU4YlAwUG5XcCt1MXExT2l3dlhYcjFaaVNJMldUblBxcmUzN2tk?=
 =?utf-8?B?dWU3YzNmd3l0NDZZSEhLTkpicWVhbzIxdFZZL0t2c1F6alFZY2VINFJMcGwr?=
 =?utf-8?B?RTVmTzJMdWJJTElRYlkxL015Y05ISS83TUlDYWR2SkJhUTVQcmVHMWdtS01U?=
 =?utf-8?B?KzEvMVI3QWlWN2dNTU5ZOUdSSS9lc2ZqQXhMQ1d4MnM4SEZVbWhEMHVTRGsv?=
 =?utf-8?B?Yk5zcWZIZFVHVjNEVmhsRzBLSVJFZU1abjd4bHEvR1BLSlJMOVhxVUV4K25S?=
 =?utf-8?B?T0xtUmlMY3B3MTRFdlVKUHpuNGs1eG9ocnNibXJqaFdETituNCtCRGIzOTJR?=
 =?utf-8?B?OWgzNUFqZkU5SE02T0RwaWlwZ2lON3FybjV0WlpLOWN1ZzRld3FXbVpFVVRP?=
 =?utf-8?B?MFJ2ODc2bVZtNzQyYVNOT2VMYkVLd3owd2VJMjdEVXVjNFIrbUxaekg3NTNw?=
 =?utf-8?B?WUhqWGZ6SmVNaTQ4NU15WllOSENZVkN4ME96NHdrUGY5ZDlFcGloOXEzOXVP?=
 =?utf-8?B?VG5QdzRMZWp3ektNS2N3aWJrZ1hoajdRV3dxRkhqcnI5ei9hTUU4TUZnMVZp?=
 =?utf-8?B?ODVYNzBiTzNHMVZWZDArQ3IvM0V4WTVLNklJUm1qbFhIZVJndHJmWkxjY1hP?=
 =?utf-8?B?OVp1cVo2alVGdHR3QmUrRDV0OVhNWDRqOVBXZ2VBNm1LRXFlby9MQ29RcnNh?=
 =?utf-8?B?Vm9IdVRWZkpJdTJLT05CdmNqT2xFVlhrWWtwK21lSTN4RWQvbDkxRm9nckhr?=
 =?utf-8?B?VnpWUStlaHBCOGo0eVNQTHNrb3BuWHppbGtkRVhVaHdkR1QxQVdRWXZ6OS9i?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8339fb46-575f-4525-6faa-08dab22f387e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 00:08:30.8301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vrJMpVM1ttg/JKbKtYbKe7FtYRZeppRLHPgauNhslEBHjN4JM3BKSAo31KhrLWXVV9lf56ciYl/w8Ik45ksKAgqmkte4S1CDh/LTbazOqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
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


On 10/19/2022 4:05 PM, Vinay Belgaumkar wrote:
> Waitboost (when SLPC is enabled) results in a H2G message. This can result
> in thousands of messages during a stress test and fill up an already full
> CTB. There is no need to request for RP0 if GuC is already requesting the
> same.
>
> v2: Add the tracing back, and check requested freq
> in the worker thread (Tvrtko)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c         | 3 +++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 7 ++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fc23c562d9b2..18b75cf08d1b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1016,6 +1016,9 @@ void intel_rps_boost(struct i915_request *rq)
>   		if (rps_uses_slpc(rps)) {
>   			slpc = rps_to_slpc(rps);
>   
> +			GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
> +				 rq->fence.context, rq->fence.seqno);
> +
>   			/* Return if old value is non zero */
>   			if (!atomic_fetch_inc(&slpc->num_waiters))

The issue when we move the req freq check into the slpc_work is that we 
are incrementing num_waiters. That will trigger a de-boost and result in 
a H2G. Need to check the req frequency there as well.

Thanks,

Vinay.

>   				schedule_work(&slpc->boost_work);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index b7cdeec44bd3..7ab96221be7e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -227,14 +227,19 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>   static void slpc_boost_work(struct work_struct *work)
>   {
>   	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>   	int err;
>   
>   	/*
>   	 * Raise min freq to boost. It's possible that
>   	 * this is greater than current max. But it will
>   	 * certainly be limited by RP0. An error setting
> -	 * the min param is not fatal.
> +	 * the min param is not fatal. No need to boost
> +	 * if we are already requesting it.
>   	 */
> +	if (intel_rps_get_requested_frequency(rps) == slpc->boost_freq)
> +		return;
> +
>   	mutex_lock(&slpc->lock);
>   	if (atomic_read(&slpc->num_waiters)) {
>   		err = slpc_force_min_freq(slpc, slpc->boost_freq);
