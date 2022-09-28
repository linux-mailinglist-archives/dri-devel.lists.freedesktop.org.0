Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226605ED5EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 09:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9210E2CB;
	Wed, 28 Sep 2022 07:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE1F10E2A1;
 Wed, 28 Sep 2022 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664349006; x=1695885006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pxZQjRcEUeoniQzLZ3iLVrRNRnUMmUFc2fiJbHenWVU=;
 b=gyVAuCk0PuQN/W840q3mLZ4yDcJAlPhUXPRSZD/aZq4ePqMGUn3zMGY/
 JjPsHSfjesuaXFTZ7H70XhXsSOd0mavHqEggkAXMAXlsiQKqmIUhzyHQq
 lSVYeP9EetMdjT8MXI/FFGWikfFnXdiFYUVFyaG9Q6ffcA3AoRiIS9YJr
 Zf6NFGGlLSW8o4PssR5+8Gub7naAXA4klWd6WO7R1kKzt0Qb1Ahdq/hL3
 7NxD5gLXEXzYRs1iyTbCCy6nK2tcCLN5t70zFNyIRWtWDpe3V8LJ+s3Sw
 ABHV2+YIqg59uZGo8v/EK/Z4VhPANmVaKUDufEmjRfmkkTBDmaLcr/KP0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="303010571"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="303010571"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 00:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866864997"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="866864997"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2022 00:10:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 00:10:04 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 00:10:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 00:10:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 00:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4usDjTJq0PdmhG8it76P9NYvKfAmVnvsqaY1RCl/L54e7XrbKqgV72lo2Jt7zFvhvi3qZUu/vQFdGrFUundJgPCpxpHHKoyHDmOddVB8zLwDSWQGY8zwSpjGy4lKQ+mbW25hPcZKT1s8hH1m80p6M9WgGBjy3+4qNdQ6UY5hjkX9Kgx67bqXuXQmAamoibu+B/rnkndb63ZOUggaAVSFpxc17QJcMSc6Ix5DBQs0XWliiraXRXBjSWURnRKJMxPLQ6t9u78uDyPDFt4t+QOy8tb47o/u2gOSk3sMUmHsRjiFsbXT4/+lewhQKWyVB6jV6pvyRVlu2ru9IF9ra1CMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InY02pAEy0SKQASxU5wR3pcI53ow7yuaYDGAwfvgu4g=;
 b=huTVDPpmtxE15yCtOWe6DcZ3M8Hw0j5MHT+xBIAAR/1K0MHKJaAlS60F/et/tLEREX7rPRWhTJhxbCnw8D4Zv6d9nVP6YypPi1u/NWiv1BadCFeWAvUMRCxnWJ7ISs6Zt6vXUNKTl/VnBqmOwXZ+bGFKtE/1dAgNrRfU9wxCvJyYs4XRhFa/hpc2bQWprT+Iz6kmRAlZhOZiZA8w/vdf2U6H3YVZU/lf5Lmmp7llkkujUVGiKMXVpa9PwGYtc8g9McSvMbD1FfAJXCiXGnDl105b5B7RXGXcUq9tN5O2Z9md+nqEEds2DIMatibTZwcDVRpVuKkao/Mf5SrFCRh6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 07:10:01 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3755:4837:1896:43f3%2]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 07:10:01 +0000
Message-ID: <bfcc8cfa-f6ca-8b5e-5574-9c658cdc225e@intel.com>
Date: Wed, 28 Sep 2022 12:39:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-7-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220927055020.3499420-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::21) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cfbf8f-c91f-4458-183e-08daa12075ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TaE9y5dGTDsBLpcpWR8FqpM5B+GB/ua9R4GO6rpHzBy0y4QoDluQC2bIQoVS5nFhqoHGuANWDskVdV1lK9eT1yIF/O8DanHc+gjbKR3GkujXsTG0q0gONQPZbDy67PBAkAdaI5HqCiP4HsnkpF2tiJjS04bDo/KaA2azIYBEAT35Hh2vkSRtNPbiPUzoTO7MClFaao5dH7I76SZ7gc0Zf+8kuq2e5MSzOg+vtVyLHnyp931xOHK8QSdZ58P10Py946ly84ywslk7F+YxJY/e0mMkACEEtiQW1rZOKUGoWD7RePL8soUkO7f4RM4stPdfw9mz+gUrXUoR1Enn7SyqHeDrwG4kgXDwq90O+V4snZoeXCt7ebK+YXwVgXdVYSeo2CjMrp1QBbUks2m+AcC53AA/IZ6fan1jBvooBzHhysK3jAgf5Ok/VyMQwx7sni5ImXfzRq92z6U9peUDcjTbl8X8MjEozO9PQ/Ptc6wv2RSCMNLFZwEVNKGt2+gsgLY0/LM+/J5iePqcFTcIbS4TsBwc9dxFAZcbkphuauaQulix4eJn8U+fw/NY3MZ/PlpMbaPCcBTAPw4ufKJAbcF8CvMjPBZzp6891Sx2TcAvkMOvVK3ct+yRj7mYeLHfkHzTQPxTq1CgqOPjRHluwPyqzTKlcMRKoBxOjUZckGbu+fhudSG/hak3faDJQ+rRlyBzvEMDwDdBXqUKUcu7NnNa5rm9lky6KgMhiG9YdhImHrJHa+zUDMeeEjTzZwKdbJyxB1axK8iBQzZoJ9X8YExtmYCPhMKRdaqgToi0Jv7pujs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(31686004)(66476007)(26005)(6512007)(2616005)(186003)(478600001)(36756003)(6506007)(38100700002)(82960400001)(316002)(2906002)(83380400001)(6486002)(55236004)(53546011)(107886003)(6666004)(8936002)(5660300002)(41300700001)(66946007)(4326008)(8676002)(66556008)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTQ2ODFnT1ZBWDJjOEl0RVpKRituOWlsVy8xUVlkQkVtOWVlUmxlUjVmeEdn?=
 =?utf-8?B?a2hEclJBR081MkpONUVsTEY1T0ZTRWNFQVRXbXZwNTFJVVBjQnBHLzRPdW5J?=
 =?utf-8?B?b3N6SXZoUmpOS1YxdmM2b3JRamN6dWFjTmdFTUJVallIRy9MTEZ1UDlNak9M?=
 =?utf-8?B?OC94QTFYN05wa0QzSEVZb3pPWG9YNHdkbVZuZCtWRGNvMS80TGEvblFxZW8r?=
 =?utf-8?B?eVB0SnMzb0o5a3FLTlFjc3p1S212T29XNjB1MmVXd3F5OGVSYVZaTGZxSnRh?=
 =?utf-8?B?Njl0b3Rxa21nQy94aEw5L0dTbjN4SFZDVEJoOHkvUVU4R0U5bitxOURpTS9Y?=
 =?utf-8?B?a1lwbm9sWGY0c3dHR1l2c1NFM3BwcE8rWDNLR2lUR1F6MlptZENwaElaYTZ0?=
 =?utf-8?B?aG1PN2ptK1J4aDlhNXhRQnI4N0VXdzFSZHRtcmlsaXJueHRlZ0RuS1FnalNh?=
 =?utf-8?B?Nkk4Y2pwejAxb2Fuc1pvYVVBWjhzbVVLcWNub1lEejRJbmJJRVNPZ0hZUXRs?=
 =?utf-8?B?R3UrZFVleTM2ZVJEREZLem0zQUV6TDlDWVJVcTAreHJFZnozUXpjTmZ5aERS?=
 =?utf-8?B?Vi95UVk5S3lOTm5hazNmeEM1S3pDb1FoUVlLVVFKMmlQS2dIamZlN2NzU2RD?=
 =?utf-8?B?RWNHdUg2cmhYd2QyK2tDSjdrMkVsMHNaTURXV1pPV2FvUkZMOTY3RWxmdWZ3?=
 =?utf-8?B?TFRUVTRlM0NoOHBKRm5GTzBSdG9LcWNQVmdnVFNKZ1RMK3MzbWZJWlRleU84?=
 =?utf-8?B?RTdxSlF1bmJKcHg0cktkOGplVVJEeFYyUWdVblRuT0poOXhGOHVPS0pEeXFh?=
 =?utf-8?B?YmpjRWhSVDMvN1JXSjF6WDRHOUlUaWJuZnlDVDJZOGc0dlUxNjkzZFlqb0Yy?=
 =?utf-8?B?SFNKMUNoaEp5UjBkaFQxVXBZRWw2MktFSnZ3ZVk4VVgvRDFBZUtlSjQ2aXAx?=
 =?utf-8?B?ZEdUVjNaVUpid1BZVVlUbU9hSXdaejRhOU9SUXU1dGJCaTR4VWJnN1E5QUo0?=
 =?utf-8?B?S0pMWE9adTVnczM4RFVZM1JKMzBkWkZpTUNWbVNyNXdUMEFtSStTTWRhUHdy?=
 =?utf-8?B?WCtFRzdYRk1KdXM2c0xYM3FIek9EODFvUkNJUVJKZ1c3VkRQL1p0VDd1bEhl?=
 =?utf-8?B?UlBseEdJbnJTMWZMQjFWUk0wdWdrdGhUdXNiZ2ovYXJqbXdUQlJudUNSTXh1?=
 =?utf-8?B?VGhxRzhDbytBbTJGUkZ3QkxwYmhrOEpLcXhsRVNqbGJtRk9YTUhhcTUzVXUy?=
 =?utf-8?B?UnU3Wko5UUFZRVFQbjdTUzFSeUtQd0h3emtMWHJSYzE4Yy9ZV2Y3UnBJQTZL?=
 =?utf-8?B?TzJ2c1JTQyttTHlYZjJPQ08yd1c0ai9sTnp4cGtZUFNLUEVSUFdpN1I4aEI3?=
 =?utf-8?B?bEw1cEpnbnUzbTZFNVRsTkZ6WVpwd3hzdWc3WENmWWVJQnc0M2E1OU9vNnNU?=
 =?utf-8?B?bEZBcWFXNElXMUxoaG56VTJqRW93YUV4eS9CcVhOV2hHaHZxeHgyenVQcmVZ?=
 =?utf-8?B?Q0VsakFEQzZIdHA3c2FzK1k0d0dzRi9MNmZMNWRIUHNGQmtna2hxZmRyUmFn?=
 =?utf-8?B?TmNTYnhWMTBBOFhsVFhKSVQ4akN5Wms2ZWpFUW9lUUhJUytWRVZGbVlJbGps?=
 =?utf-8?B?YTBVTEdhSFRYVEJzVWk3ei9KQ2lwNlAwZ01qS2NsZTFaU2IwUW1vZ0FobGVx?=
 =?utf-8?B?aU5pWXhiazhuZFBGT09KbmN3L3gxdXhyUGxIbUVHenVYcFZON1RrU1hvZTIr?=
 =?utf-8?B?Y0oxbklWR3RtK3QxSVpBSUhTbU5xbjVVU0NyY1JscGtZMTlUYjRnbEtld1dR?=
 =?utf-8?B?dFVsNmhZRW5pVnhkRFp4R1Y3OVJRVVQyMXhxNm1vaHQveWtGTzgva3U0ckZm?=
 =?utf-8?B?RWM0RTVuV2JadWFRandQdEMrSmxueDBxZHFBNnJMdlhIeERPSGlQTW5WRjUx?=
 =?utf-8?B?QVJFYTFmSDRLdkkrY0xyNzJpbDJnSWZTM2NIemZLaHNMRkFmeUE0c0VWcnB1?=
 =?utf-8?B?RE5KQnBDUkljSFovSW50d1gza3FUVWZRaWh4STlGNGgrSXQyTisxK3pLNGJY?=
 =?utf-8?B?d1UyMXBSTDlGeVJyeUs3dVBPMW9EdG5kRGVlczlCRHA5Sk9GN21tS3JaMCtU?=
 =?utf-8?B?NjVlOE9qRDRuaUJONy9ETnYwdlpPZnZlTng1Z2RwcTFXeXBWWFF3bStyMkhq?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cfbf8f-c91f-4458-183e-08daa12075ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 07:10:01.4955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC/RBBKlljlJZDkt87y6MumTmeOObulPT7zvE4TQkfSNPJ4EDPXo45cqiIYGppOSt5A/0b5vXXn9bShZPbLz7Xe1eWgl2lAFRDMMc7ejM6Q=
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
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in
> GT0_PACKAGE_RAPL_LIMIT register (1.x * power(2,y)).
> 
> v2: Update date and kernel version in Documentation (Badal)
> v3: Cleaned up hwm_power1_max_interval_store() (Badal)
> v4:
>    - Fixed review comments (Anshuman)
>    - In hwm_power1_max_interval_store() get PKG_MAX_WIN from
>      pkg_power_sku when it is valid (Ashutosh)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> v5: On some of the DGFX setups it is seen that although pkg_power_sku
>      is valid the field PKG_WIN_MAX is not populated. So it is
>      decided to stick to default value of PKG_WIN_MAX (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
LGTM,
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 115 +++++++++++++++++-
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 ++
>   3 files changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index f9d6d3b08bba..19b9fe3ef237 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>   Date:		February 2023
>   KernelVersion:	6.2
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 2394fa789793..641143956c45 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -20,11 +20,13 @@
>    * - power  - microwatts
>    * - curr   - milliamperes
>    * - energy - microjoules
> + * - time   - milliseconds
>    */
>   #define SF_VOLTAGE	1000
>   #define SF_POWER	1000000
>   #define SF_CURR		1000
>   #define SF_ENERGY	1000000
> +#define SF_TIME		1000
>   
>   struct hwm_reg {
>   	i915_reg_t gt_perf_status;
> @@ -53,6 +55,7 @@ struct i915_hwmon {
>   	struct hwm_reg rg;
>   	int scl_shift_power;
>   	int scl_shift_energy;
> +	int scl_shift_time;
>   };
>   
>   static void
> @@ -161,6 +164,115 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>   	return 0;
>   }
>   
> +static ssize_t
> +hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 r, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +
> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> +	 *     = (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 = (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 = ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out);
> +}
> +
> +static ssize_t
> +hwm_power1_max_interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	long val, max_win, ret;
> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	u64 tau4, r;
> +
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in i915_power1_max_interval_show()
> +	 */
> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val)
> +		return -EINVAL;
> +	y = ilog2(val);
> +	/* x = (val - (1 << y)) >> (y - 2); */
> +	x = (val - (1ul << y)) << x_w >> y;
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +					    PKG_PWR_LIM_1_TIME, rxy);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  hwm_power1_max_interval_show,
> +			  hwm_power1_max_interval_store, 0);
> +
> +static struct attribute *hwm_attributes[] = {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t hwm_attributes_visible(struct kobject *kobj,
> +				      struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
> +	else
> +		return 0;
> +}
> +
> +static const struct attribute_group hwm_attrgroup = {
> +	.attrs = hwm_attributes,
> +	.is_visible = hwm_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwm_groups[] = {
> +	&hwm_attrgroup,
> +	NULL
> +};
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> @@ -472,6 +584,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>   
>   	/*
>   	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> @@ -510,7 +623,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>   							 ddat,
>   							 &hwm_chip_info,
> -							 NULL);
> +							 hwm_groups);
>   	if (IS_ERR(hwmon_dev)) {
>   		i915->hwmon = NULL;
>   		return;
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index bd42fb66e297..64aa1e9be463 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -194,6 +194,9 @@
>    */
>   #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>   #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
>   
>   #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> @@ -212,6 +215,10 @@
>   #define   RPE_MASK				REG_GENMASK(15, 8)
>   #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
