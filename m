Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1795ED5E7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 09:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5410E2B8;
	Wed, 28 Sep 2022 07:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125D410E2A2;
 Wed, 28 Sep 2022 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664348951; x=1695884951;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=erbhORMExiuG1oyhkTXNP/knEn9KkvSuDfgZ6Btc8Cc=;
 b=NEE2zy9aIh5gf2c/+T2zCn0V3xredbGJouxRHkahh1nBUEhNZ4P0m/xq
 LJfyGX1BcL5YSVdMX2m59yN/JhqHHRFz4f+IEfryf3zOTNw81KF295XU+
 Bm0Kehxk295X/xZuY9Xm1W2UJTuJD3w5WrtQkXL9mprmAvjMmOanYLe07
 KWfeCcv7eM41nBRLhBL7Um7I9gP9SfJzWd/a8s6NySWKFedie4eaq1u26
 s7rqHTuJlUd4G6dhHsCY6J8nGdXvBUrc4MlPE/jV0FloThjxuTxfVKZfg
 BfFbs+r7pBZchTCwUOu0CzybhS/sJVQU3qiRS+nczVd1zG7jzHj35aNKm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284659499"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="284659499"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 00:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="684294113"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="684294113"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2022 00:09:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 00:09:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 00:09:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 00:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsJgRwWlwIgt5jYkhKwhpEIfry1WMv650WdQGgHTFmYtkmwnfVf49GUgpBGACIgyvMqdvg8L5/IKdn5c1Z5vSyr28xKOdjQkzJYBWSM3gbKy+w3m/ZOWewaqt0un4nr1R+H1sZ3Cw0cIs0G7xRdlrHBamgj6tRnyh1xX3kk0t5/c7VVJFdntdVq3TtXSFgrHnNqkzlsLVNSoJjgUsLwRrCM695FHkjgZKldIo2EYk1KuFy01HCY4L4jCzQf2IB36j/2d92J0U9MiYppiErYCqMEl2UfvG/23IlK+z/RnasKD6ktce4FS3984kUUvdVYVXE0j3zXMT2JsapSBWo6Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3jB9P6TAP22WwS3KCiDYD3UPTjMvsF0nVEnr9Xj17I=;
 b=b6hFEIitk82Rb0rLmMJxEYaKt5RnBhlvHt2dsEBxvJK86d8lMytcUOwLA2pyH5twVxGbhCYr+JfMcyarizowhaNO+QZ58Cum+/wj4Nb79tAeBuv2z7S05sR1PNchdSGP1xJJpOBMR4DYPB2NEQ7Kfqx3W58j6HIp5oO68AAn0W3SQYNmGI3QXkx2CFPIxugPOdOxt63j6ZtJPh8qgtfywRNkrVWjvs4yBqOo1dLEvCmLC6wGXamwS2LKyGGNXtZ5PXqiwBXg17ojgURxDCpi/Ju5iQv74RhEtNd0fzjY5AqU5FX670iL8/unbehv1mYeQWBfNvxn++DEr/BEHv57JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 07:09:02 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3%2]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 07:09:02 +0000
Message-ID: <255a7488-2eac-3253-0c21-29998af83f00@intel.com>
Date: Wed, 28 Sep 2022 12:38:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-4-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220927055020.3499420-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::25) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d6b1a3-bc15-4fc4-1f5a-08daa120523e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Czii7YszxpTw6dcDfPBXxUhNCiQoPVsTvnjrXxWasMeUQeqqHiPOqPbYz2z76EGgcM8HWHmLH/MaVtrTWvbp+aifKu9ZYehojKNeU/KzhL5ZpMollIQL96MvQOlHCxzaKVEdqk5+X3S8asa/L0tNl6fjO5iAkeehvIJHjaeWUFByi/tQ5KaYNbOk1+bRuqXRsbVBNOpp5LkIu0Lyfpt7aprpzyHYSwptHn1LgwUyBeo8a0byn6REEIOYvP2PCQdn2w2BDY+sGYsjRvh4tPuJjJx02OK5rL3ZpKJsZIb04Y1pbKFNf78lfmBtrZBpOaWjZ+odb0C8bvcCM2HyW2Gk74Xuht5AsECjFDF6qJrvtFNTyjjgqSsoX16nRJBNA2vzVSWfrtnDcpHwSmO7MczvjHUbU8wGWXi23QoglB3zwifaodYLmAPxQ8icJatJRyJ+cKNxHDt+eaNhrpMhgofOoVo4B9h6NGzjgcixA5Gq5YRtDdnN+QNFMsKdsZ3pL4t22TVQpH7ElZxfxwH5YHTpBTfIJllD+DmqSgyFsOUvGD0KAdEd8U4U4ZpNvsDDE/dBUeBUTuERgN+aZsktxaoo3wv0KLTvWWFUKHK8/njWQPxRs/v5Fbs1CjavTr6QuDojKYrPf0OMhZaU0VAmlnjdpKZPEGi0epdOOgUMgR+e2jxodWxVNfcn/yc4TTb5/PDMyHQY+6zFilaiJjiw4WY61v/DMhYDDE0hicWSWRZullzQGKQDbmdurX9YFxd0flGoMksrop2oiJnB0hhjl4iJ+SKsRfHLf/2cELLtZBLbIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(31686004)(66476007)(26005)(6512007)(2616005)(186003)(478600001)(36756003)(6506007)(38100700002)(82960400001)(316002)(2906002)(83380400001)(6486002)(55236004)(53546011)(107886003)(6666004)(8936002)(5660300002)(41300700001)(66946007)(4326008)(8676002)(66556008)(31696002)(30864003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhYOW0xYkFwc0d2YlBDSVNhVStrWDB4YVdqdDZTaEQ2MzRUbFRYWHJFelpv?=
 =?utf-8?B?YThKM3c0WlJTMGNDUktYM3NBalEzbDFGUmlLV0FNb0lnY3huRkYyVlA4c1dC?=
 =?utf-8?B?bXBUMGtjZjQ2SkdGdmxoSE5IT3NsMWgwaGs0aTN3bGxLU1RxSXRocy9IOUF1?=
 =?utf-8?B?L0RXLzIzcHVLOUJkbzROdHNHR05BelkrK1N6Rzhyd0ROSjFFNlYxU3paVXNv?=
 =?utf-8?B?NExwcnRTRnpaKzdKYm5MNkxIUUxoK1B2blpPRjVKcFBDaFpwUzhQNEVjaTVm?=
 =?utf-8?B?bytUK25PMUpvUHdyTTdTTWI4eVNNY1RyUmpvZGpzMVlaRWhEakI5YzFWVHpE?=
 =?utf-8?B?YWc4TnIwWVdPZitvQmR6NU5neDArL3ZDZjFYYnJ4MVhvVkxlNmtKRTRWRW9V?=
 =?utf-8?B?SE95TzlSdnFkREdEWjlNTkw3SmpDTkVtV1IzS0IwOGRWcEtubnN1NUdTY3Vs?=
 =?utf-8?B?KzIxNHdPUExOQXhzaU1BUDBnQlR0b2xPTC9BZUJmaHlhQWVweXdZbERWcGdI?=
 =?utf-8?B?clhIanlwaWlnQmxTMFJkTWhwN1pxeTBPN1gvaHJ4bWJoaTBmc3RiSDNXWUtL?=
 =?utf-8?B?L1hPOEg4bkxmVmZXT2xzdUljbnNHQ0kvMWs4dmlZV3FqUTg0M05wSEJkL0dT?=
 =?utf-8?B?ZkNYZGQ5dzM4MWFUYklkejBCMGRweHF0VkkyT2JVemZSM2N0WE02VFJLSWht?=
 =?utf-8?B?YnRvb2htN0F0YnFTeU9GY3dQREExZ0tqaU9CWnRJaXU3M0d5bkc4Uk16VGVt?=
 =?utf-8?B?ZjlYMms1Q0NpK1pSeVUxeHdKYnBKcWpnZDJRK3ZiL1FEUXVMR3pJL3VRaHRt?=
 =?utf-8?B?bWVyZzBYZWE5UFgxVS92SW12ek83NDlwWU5ZcGd6Mkc4WFlIUjlaM2ZyeS9k?=
 =?utf-8?B?QTJLOEg3a1NoWllEWXpqaWMzempSTkdWcDJuUEVDYVBuWjM5WHFVem44cjFx?=
 =?utf-8?B?V3Z1SmtLVVcwaVRZRlNaM1FYOS9YNk04Tzh0UUVPUFBRT0RWbm1jOHJvT0g5?=
 =?utf-8?B?a0pDcHNpTDF5cjBiaHNmMkNqZno2UU43NXRaMCtHbGgraytpeHdLbjEyaDJI?=
 =?utf-8?B?ZzZ6QkI3c09FTjVaY2V4RHJxY3Zwa1FSOVFMRmJTazV0eVVRb1ZnNUpTdGRx?=
 =?utf-8?B?dXhFMXNveklyMm9qV1ErTWpXYzA0MWljWG1WdDgzM3dLcmI5MjlKdDhHTHlM?=
 =?utf-8?B?R0RlazFlUzk1b0lpTCtWa2QzNlJwNUVwRFZEQ1poVFNnUUJ5UnphNEVjbzFz?=
 =?utf-8?B?djM0TmZ6VEw5S0tmUlBQVXVsNlpHbXczeVlBVTFjemt6UE8zQzIxa1VXSU83?=
 =?utf-8?B?UDhEMFdxK0NST0psR2k0UTJRRVU2Rm9lWDVnb1JqUkRNalE5U2pGeDRkbTVw?=
 =?utf-8?B?QnU1RFp2M1RWOW9NWVFOS1lYdXhWMytYZVduUyt5RHUrRHFuTjZlMGlyY2Zh?=
 =?utf-8?B?TnVmbXBCWGhxYzZXRTNIcE52N0FGOGNoK0xGNHNTZldpTGhlWHVpTVcxY1Ex?=
 =?utf-8?B?MTNyY0V2aGk1WFZZK01GbTNnT2ZYa2JONkF1UTNpcGpWMVdZRlZTaTBqMjIw?=
 =?utf-8?B?TUZDd092Ykg4eFMzclRkQ1ExZWtGMVQ3SXhBNi9SZmEyMzh4alBRTzJ6TDhz?=
 =?utf-8?B?NlpSMUJDc0VjNUk4M2kvWjdmMXRZQUpIa1JFS0JQQnVIRzNmdW5ycEVkVmky?=
 =?utf-8?B?OTNqanZhZEFnaFVneEt3L05mSkRrS0FYSXBOdGwrWm9YQU9SeXBNK0MydDhB?=
 =?utf-8?B?SHlHcDhmcG9aQTllWEpNekpWMnEyWGtHTldQSENYWnUxaGhjWE5KUTdCT1Nl?=
 =?utf-8?B?TEsrdm03NnpaRS9NcmZ0aXhkb2V3MFBvNldFMjZacDRVQWlQMXIwbHZXR0hO?=
 =?utf-8?B?UHExaEhGanlhQnFIUUlld2tPU3o1bGpMeDJJaUMwSkR6MmtiZjR1RTR2YUE4?=
 =?utf-8?B?Mk5aZVpxODFnZS9nT0oxZjZCS3VVVFZvdzdxeldEWXRqK3V0dUQwN2IySE9P?=
 =?utf-8?B?S1d1a0owekpaMGhUM0U4akd0UlEzbUNsaFVNR2t3ZEd1YkRuRk5wYVRBbDFk?=
 =?utf-8?B?akdzREFqS0l5UkhoNW81RzNoaWw1cE5SOW5hcld3QWpBQy9pL1dDaGdrZ3B0?=
 =?utf-8?B?Z1BZRGVPSVNReis2TFhxVFQ0N295amkwelg5V3pQTkF0VmlEQ3pJTHgzNmNO?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d6b1a3-bc15-4fc4-1f5a-08daa120523e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 07:09:02.0612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC8buO/v7HszP34YbwOHoFpXupTNXpUdjszLZW2wQOB5lyuXZjX2J6/ndMF4+cbo/6lMqH/dzzV9nPRTIDosOKDwdBpmCstVNIIAuSAPApo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/27/2022 11:20 AM, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Use i915 HWMON to display/modify dGfx power PL1 limit and TDP setting.
> 
> v2:
>    - Fix review comments (Ashutosh)
>    - Do not restore power1_max upon module unload/load sequence
>      because on production systems modules are always loaded
>      and not unloaded/reloaded (Ashutosh)
>    - Fix review comments (Jani)
>    - Remove endianness conversion (Ashutosh)
> v3: Add power1_rated_max (Ashutosh)
> v4:
>    - Use macro HWMON_CHANNEL_INFO to define power channel (Guenter)
>    - Update the date and kernel version in Documentation (Badal)
> v5: Use hwm_ prefix for static functions (Ashutosh)
> v6: Fix review comments (Ashutosh)
> v7:
>    - Define PCU_PACKAGE_POWER_SKU for DG1,DG2 and move
>      PKG_PKG_TDP to intel_mchbar_regs.h (Anshuman)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
LGTM,
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 +++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 158 +++++++++++++++++-
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 ++
>   3 files changed, 188 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index cd9554c1a4f8..16e697b1db3d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Current Voltage in millivolt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9fcff6a884ee..53d34a7a86f7 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -16,11 +16,16 @@
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - voltage  - millivolts
> + * - power  - microwatts
>    */
>   #define SF_VOLTAGE	1000
> +#define SF_POWER	1000000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
> +	i915_reg_t pkg_power_sku_unit;
> +	i915_reg_t pkg_power_sku;
> +	i915_reg_t pkg_rapl_limit;
>   };
>   
>   struct hwm_drvdata {
> @@ -34,10 +39,68 @@ struct i915_hwmon {
>   	struct hwm_drvdata ddat;
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
> +	int scl_shift_power;
>   };
>   
> +static void
> +hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
> +				    i915_reg_t reg, u32 clear, u32 set)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		intel_uncore_rmw(uncore, reg, clear, set);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +/*
> + * This function's return type of u64 allows for the case where the scaling
> + * of the field taken from the 32-bit register value might cause a result to
> + * exceed 32 bits.
> + */
> +static u64
> +hwm_field_read_and_scale(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			 u32 field_msk, int nshift, u32 scale_factor)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_value = intel_uncore_read(uncore, rgadr);
> +
> +	reg_value = REG_FIELD_GET(field_msk, reg_value);
> +
> +	return mul_u64_u32_shr(reg_value, scale_factor, nshift);
> +}
> +
> +static void
> +hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
> +			  u32 field_msk, int nshift,
> +			  unsigned int scale_factor, long lval)
> +{
> +	u32 nval;
> +	u32 bits_to_clear;
> +	u32 bits_to_set;
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
> +
> +	bits_to_clear = field_msk;
> +	bits_to_set = FIELD_PREP(field_msk, nval);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
> +					    bits_to_clear, bits_to_set);
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	NULL
>   };
>   
> @@ -71,6 +134,64 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	}
>   }
>   
> +static umode_t
> +hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
> +	case hwmon_power_rated_max:
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_rapl_limit,
> +						PKG_PWR_LIM_1,
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	case hwmon_power_rated_max:
> +		*val = hwm_field_read_and_scale(ddat,
> +						hwmon->rg.pkg_power_sku,
> +						PKG_PKG_TDP,
> +						hwmon->scl_shift_power,
> +						SF_POWER);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		hwm_field_scale_and_write(ddat,
> +					  hwmon->rg.pkg_rapl_limit,
> +					  PKG_PWR_LIM_1,
> +					  hwmon->scl_shift_power,
> +					  SF_POWER, val);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -80,6 +201,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_is_visible(ddat, attr);
> +	case hwmon_power:
> +		return hwm_power_is_visible(ddat, attr, channel);
>   	default:
>   		return 0;
>   	}
> @@ -94,6 +217,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_in:
>   		return hwm_in_read(ddat, attr, val);
> +	case hwmon_power:
> +		return hwm_power_read(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -103,7 +228,11 @@ static int
>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_write(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -124,11 +253,36 @@ static void
>   hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct intel_uncore *uncore = &i915->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 val_sku_unit;
>   
> -	if (IS_DG1(i915) || IS_DG2(i915))
> +	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> -	else
> +		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
> +		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
> +		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +	}
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref) {
> +		/*
> +		 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
> +		 * so read it once and store the shift values.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
> +			val_sku_unit = intel_uncore_read(uncore,
> +							 hwmon->rg.pkg_power_sku_unit);
> +		} else {
> +			val_sku_unit = 0;
> +		}
> +
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	}
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index ffc702b79579..d7e2e4711792 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -189,6 +189,16 @@
>   #define  DG1_QCLK_RATIO_MASK			REG_GENMASK(9, 2)
>   #define  DG1_QCLK_REFERENCE			REG_BIT(10)
>   
> +/*
> + * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
> + */
> +#define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +
> +#define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +
>   #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>   #define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> @@ -198,6 +208,8 @@
>   
>   #define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>   #define   RPE_MASK				REG_GENMASK(15, 8)
> +#define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
