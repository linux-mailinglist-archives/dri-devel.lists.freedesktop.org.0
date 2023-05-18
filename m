Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C55708283
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CC210E522;
	Thu, 18 May 2023 13:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222A810E0A1;
 Thu, 18 May 2023 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684415826; x=1715951826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5olNasP3duaTn+OohKwtiqb+iuGLa1zYWGTl0sNJQD4=;
 b=Q/NcDbLvkiDeGrYK5Y4eF1oe2uLNy/L5cL7Fh7KUZouRYHP6NP2uKCL8
 znExpwH8OpLGbxHS1NwBHXbpYv5vVeMk1r1m3valINARmppGKQqTxPOj3
 VA7j37Z23nyIA5i09hmqVgCpeSqIBlFqnH+NtMYdpeDjyfo9pTeLFqt1V
 Ckb9DD14Pewu4TNB0stdEfJ2CZFOi3gn8RSD71Lz+fOr0+5E/WtNPIpzw
 eSzQjRZwImTpoWTJEit0qmxvRjsaYTAfk0BdPZs37ooGjuFs2ThvqCdf6
 Wyx3POzHbvMkYlKZQx4RmHN3YH+vYOb0ZpdI8y161RhNF+KdCJOtjHoxm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352077179"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="352077179"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705193255"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="705193255"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 18 May 2023 06:16:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 06:16:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 06:16:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 06:16:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 06:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZU/LYftVzjPW71YeVuBAGPbKAho43piK1CjDlDLcMc2FrENVO7f5QumrcfzQE5Ae0dqMH11rknCVozsLT6UUk+AKqKdjjXXJq9AEpuKxuKDYxa3xPsMZd+XtIWEkMlVOZkg87IWKRQ0EKg2lY0/w1TpM0L5i7GRpCXrtp6LcKslLvYPLEKKoWIjVJn+j+/RDk/nr7awyohviqE+wQhloHjkb3vbaZMLe0Rnm9mo64zK26JzFBVFwiQtPUIAMTik6nnjpzmx7/IhQVFe6huxAvhS4QFVOhE+GmueyMfZ9WWJvKFD6oual1u2MT30VijDOhgv20sO8Kowpywm8Z0WAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdXulsGN75RH9S6mVwkxBCOEGtxqD1TOCR3K0jc0K/Q=;
 b=EVZJradRvx6/0g9o1XIQx0DsjkJTc7m80aHtPiYoMM49T4QFMOpPjEu7zRnV09C8Ic2ZxwWtr20t2c2y6YbOgVWU6+/7v7fVWXcybJTJiVxVNF7SYCfcpaDSmxjwfein/cNYHdJv696fLitvQUAZfEP7896tmxXFoY4PzqhWR+iYsgodxTzlJnxKOOkKFF/hwLRHjSJOy8qpbHVa6J/DSp1Gb/kpTbFwjON7ppwUvkpt6czfgqWuAH1MDOJlXhqAOHwkJZt2ZISWbSwvtshigAU6fqjodHZjTVQ9fkxfbIlti6mK8O2ZzEKF3RuftMULYp5wYD2zy1prW96XN75hmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 13:16:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d1b9:3221:bc0d:1a9b%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 13:16:44 +0000
Message-ID: <eb6acb04-e317-9f2c-3537-d92623c7222c@intel.com>
Date: Thu, 18 May 2023 18:46:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/13] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-5-ankit.k.nautiyal@intel.com>
 <ZGI4y-6NKngtl0wh@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZGI4y-6NKngtl0wh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: a858a63e-233a-415e-51a0-08db57a22075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TAyvwNUWYjPbvtO1NC9IjP39aDeF/YspEO6MWnaWU7ei+WqqVdr7o1oY1XQu3pbqj9hARIfL06P0CFRD3Xyh67WFUACslirrlu6Wf/u2893chk6tui2wF9iJZC43uYx6eSBfAQ96YC/YGeUlm3Af3pC1wyKeSCDj5cNsnAbGhLX2+7lWiElDrsdoGnaUg+8qE99AP7qwbxu+p6wguUiN1o1ee2oMQQ/0S6d1pUNNovzAcD0wy/R7fvAuMl1r6/1+vbnFcKVMb0AlEwYjrJZ1fqvX8ZLz94qpnPgOrVtPt7r3jCaw5vAWmydAiPbRvZ0sJdT9dbqo79vxsJtrkfIArvAsWfIbIm/yhqynpoIoiGhzC64yNBaCBwC2AoutIyAgSIvRJU5U4uDbM3YtxNMq4a3kSlLjP6RnzQarWZpfRaKtcXhBYVynlRmbDRHA2bAdgBCn/R7MZTyPdeZcsj8VL9bZ1Vy+sE25AdhONcKXmCf+bo7s20TRJIr+tb/eN0PAeCssb1yUqksngF/uYC9/icKBXboQLXKuFut5qk7BDASYSf3LmYM4hUpYJGliLxVoV61dFiTzTabTE4cug3c3oWO9bxVXrXjuNahyDvQUuxUrHghuLyUgs1X6CVvjbJCmxtkwhWgjmpftVABMx5v2aQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(316002)(2906002)(478600001)(41300700001)(4326008)(8936002)(8676002)(6916009)(31686004)(6486002)(6666004)(66476007)(66556008)(66946007)(5660300002)(53546011)(55236004)(6512007)(6506007)(26005)(82960400001)(38100700002)(186003)(2616005)(83380400001)(66574015)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtuMGNMRWZSWTNXd1lHNmcwLzBhMENvS2dpd1NVYXlkQVN2RnJrZGNQcE1M?=
 =?utf-8?B?akx2aGU3VHhTYXFOQmxqMFVMV1psUE9XbWlvUjVYdFJFWXY4U1NjZG00WVpm?=
 =?utf-8?B?NGdhWC92bXNRb1VJRnFDS3VNc1NZK0pXeTR5Si9iNTIzMExOZ1U3Q0lwdXc1?=
 =?utf-8?B?V2o0TjhVWnhoSk5SWjlOb3Q5THA2Rzg3YnJSdnpvMW1VdjRPbUlGV0lhdGVi?=
 =?utf-8?B?cGRTK3hJT04vS1NCYTl1SHRLeDdoTm0zVFpHMnpwQUlhV2lIQmtyY3pUendj?=
 =?utf-8?B?Z0hJd0t1MTBjcG9KMGErTkxmY0kvd0NVRlVDdmwyRDhqeUpIUmRPbC9lT2hv?=
 =?utf-8?B?NXg3eWpMRUVqYmk5eFVkRGJmampYdFAzb3dBV1N1SURFdFhxYTAxMmsvNmFX?=
 =?utf-8?B?UE91UHYxbzNXS1hkMEZoMnFpc3JVcGxrci9tdkh4RThuckVUZTFzaGlIaVhk?=
 =?utf-8?B?UHhFUE9NRHNPYUZZVjE5RTlyL2FlZTNtYzFJNFZmb3FVajY3NmUzRmVRK0NJ?=
 =?utf-8?B?R045eGUrcWNBUlpQRUw2Umc2eko4Vk84dkZ5dFp6M2g0ZGFub0lSYVI3cWEx?=
 =?utf-8?B?dmlLNUNISmZXTjFFY2xrdTRKNFZPc2dEUEhaeFdaS3ZqUkY0S1dyUnlZc2Qv?=
 =?utf-8?B?amFEUkcxQW1jbFJiMkNLRzJlYWxTVHFtVkQ3K0Urd0dpb2NkWmxSWWE0emFw?=
 =?utf-8?B?dEZXTGl4VkF2Y0NWQmQ1czBVRWJQQlVKV2kvUi9KWDc5eFRUcE9zc0NZd0ln?=
 =?utf-8?B?N0FWT3A1OGhqdVNkL085NTc1bzlUZTdveXNhQUhwWGgrWUtXTzl0QWUvdzZO?=
 =?utf-8?B?QkhSQjlnVmI3QWtyek1GRmh6VFJlZm1GODljYjJrL0hVSUVwZDYwMDNhOHpp?=
 =?utf-8?B?d2xicURQcmNiQ0JiekM0cEFkT3p5MENmZSs1VEtsQWhiRE40NjlVd3g0U0dz?=
 =?utf-8?B?aHduQ1F3KzkyMERubnFRdVRKeXJHRXROdlBnRWdSZFZBMmZaMFlkaFozMWtn?=
 =?utf-8?B?THh6ajlwdWxuVDduUktjMlpmTnFMNkNXdlc0Qk9QU2lPdFNGYXZGeXU5QWNm?=
 =?utf-8?B?cUhNMUVwSUp6eGQwbFBoV1M4dGZtalNsUE56MzRZWmtZZDlBSjdCcWRqU0kr?=
 =?utf-8?B?SEtROUh5V2kvc2dwNGtoazBDMTZUN09sVTdhVmxpVVNpN05ybUN3WkpmR2s0?=
 =?utf-8?B?U24ydm5tWkc4M3BuVkRyeHVvUmRkRVN5dGpjS2dwUHJmblFjc256ZnFwSlA3?=
 =?utf-8?B?WnY3QVljREI1Ynd0aC85ay9FekNDQWNKOFc4QmpBYm5LNnBmai9NYXZKZnVO?=
 =?utf-8?B?SXZQVHJUVUwxUVdwQkdpTW5mQzRreWxhbnFZYmI0TXliQ0poQTQwV0d2eFpj?=
 =?utf-8?B?OGVTVC9VSXByS25zTGdlQkpCS1NsQWhaYWRHY2lESlhlVW42S04rblppWkN2?=
 =?utf-8?B?SWVMNStGQzBJclk3cU9hcUhGNVRBRDd0MGE4YUZLM0pZNlc5Skw1SnNjajBt?=
 =?utf-8?B?bGpYKzdTQXZaSVNDNW1CMnM2QWM4UW9GRWh2M3AxbmRDbWg1cGwxd2FGbHlE?=
 =?utf-8?B?aHNyT3ltbkdoSXdLc0lwTGZlaWxJMGlwd2JDY1YrTlNGZ2t1bHlBU1VzYXdy?=
 =?utf-8?B?eFV0L2M4bGI3dnl4RTRlZTRJR1ljUytkMGNpTUpqL3Q4R2MvSVFTVFpzVU9E?=
 =?utf-8?B?Q2RFUlF0ZVBKaEtTN3VpYU0vWGt0WXhxWFY4UmVsSUtoMWJsSHllR2MvVDRU?=
 =?utf-8?B?eGQ0MzRXQXYzbC9BVFZJVmVQemd1RmtMOXlEYk5tcFc1cHV3c256aWxSNEJw?=
 =?utf-8?B?OGlCTnlhd21DanFuc0lGUGRoMER4eFJWWm96RGFZeUd4b2krb2x6QjhxWEVV?=
 =?utf-8?B?RHVsZkcvNVRjT1BCd0gxeTQvc1JLWGUwWmlQOGhFVVVldlpRVncveU9hZ2p3?=
 =?utf-8?B?TmVqK3IzTGR5dWJLaFE3RTZ0Z0xWSEdNbmJnNWdwaytYY2Z0Y0YxK3laTXlt?=
 =?utf-8?B?QlM4QkhuRUIyL3o5c3pNaWYzM3E5YVg3SnBBVVpGTzdaVXZob1hxdEJpTzUx?=
 =?utf-8?B?OEVxSjhsNlZRWHJMYU1Sd0tNMjRLUGQ4eE8yZmg1ejdVNGdjSk5lQ29mVGJ5?=
 =?utf-8?B?SWZiMUNlT29wVUVnUVdtRE1oN1lYNjFnRUN6UUhOUnk0cUVvNUZDY0RFeUpO?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a858a63e-233a-415e-51a0-08db57a22075
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 13:16:44.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFd809bBTK+ynTBz8rsnDVedXZ9yJNO+YY7uQnYMsC3mjxzxtTjaYe/f8C3S9um6wyGh5VJvpXTyDEaTY4XL/+enkblqOzUEl50dDULULNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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
Cc: stanislav.lisovskiy@intel.com, intel-gfx@lists.freedesktop.org,
 anusha.srivatsa@intel.com, navaremanasi@google.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/15/2023 7:21 PM, Ville Syrjälä wrote:
> On Fri, May 12, 2023 at 11:54:08AM +0530, Ankit Nautiyal wrote:
>> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
>> DISPLAY > 13 is 36 (Bspec: 49259).
>>
>> v2: Corrected Display ver to 13.
>>
>> v3: Follow convention for conditional statement. (Ville)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 24de25551a49..bca80c0793e9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -783,8 +783,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>>   	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
>>   
>>   	if (bigjoiner) {
>> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
> 'x >= 14' is the usual convention.
>
> with that
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks Ville for the reviews.

Will fix the check in next version of the patch.

Regards,

Ankit

>
>>   		u32 max_bpp_bigjoiner =
>> -			i915->display.cdclk.max_cdclk_freq * 48 /
>> +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
>>   			intel_dp_mode_to_fec_clock(mode_clock);
>>   
>>   		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
>> -- 
>> 2.25.1
