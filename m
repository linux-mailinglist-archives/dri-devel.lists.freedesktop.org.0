Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954647662FF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3EA10E639;
	Fri, 28 Jul 2023 04:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9A610E639;
 Fri, 28 Jul 2023 04:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517906; x=1722053906;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FQbbj+bA+QB5obMRh69Ej7vARm4Lq98w9UPNKopxyLk=;
 b=LzAQeCYYgF+5oyItAkMeOccdtvlz35EMtRkbqxTnIb7hmOUFcsvrzGkY
 AfWLZFiPyw7fP0ghOZruqkmyThQfngOoahivVs/Ud0xesgSHX44mS3yf5
 Zzz1+JHErCaFTM/4ccYMFgZ480YXD2Qc7CPk/W1Ym61Rrza99J5iLUf/x
 0xvQ+IY8pXnE1to5Sh2i/S8AWz50xrZei0vKEu4k5fOpbGCSPBJGRPWk+
 Y/pI3dQNaZYJd2FDC20in+sX67RneuXz6CS5W+bSLE5tfP+7mdLJqpFPe
 RwZOCpnXMRQpVAYmpKa2+nGqwDGWh86u2eyDY+fCFdBArKMBDJ7Dzgxxk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372122263"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="372122263"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901077499"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="901077499"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 21:18:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 21:18:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 21:18:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 21:18:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 21:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS8p+AE+VynHSImwgc6MfizWI6i2GTdUUW9fO++L6c9HD/GZ0TtamJkfkJvwLhOZ4lh8FW3Xu5KTl7If2qV38sRugX+X5wiO8MkYwBQbe83xotwaJYdCGnZa+CuN0OT7pIgwV68h+emqJNlmzf/0xaxn/1q5nhNMsiB74H3icAA6trKWKh8SkEXNiCJBxd3qINZjltomJ1AN/maVdoaINkhvq0ovfCFZBiMlGr5sEt+KwkbH+vrxtFlk0nKnZTU3AMRDsxkc9cbyelD2qeFePvLFneOIgI4rPLJa35MDr+cLazb4wzLUtKF0/VHa5LQoYpC5t7iZtc9AfEjob4kUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQK5RzNIRJwITdtzlxjv2G4MCTc9upVTBN8GYRRjcDY=;
 b=QvK3p1cF/u4GvteQlGM102vhzLeooTRPtwBQuRBM3JUDkN5/SExeKcxORq+MjEkxHbV/J7lQkGt23k6jt6NLEOHjIZKlSYf7vheHB5c6GPkr55gbwgGv43hrpz3biET95/kExBRFupryULJYsKrP7ELMl0YX/vbdUjpWNnVDUn3avnZb7CUAeF7nxjHoNsCbZzgy8EYUoUSAGPwddsOt5e7EaKJgto85jpxGh4kAYpV6AeOM3HRs/AgzJwUCG3YKrKeMMuq6aJk4/zne8l4BLDBp5rT9JeQjlkAukWe8kpqtzMPqifyhexe0yQUUbsIJ3mJAu6utL+Fl0mpVVvQPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BN9PR11MB5498.namprd11.prod.outlook.com (2603:10b6:408:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 04:18:22 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 04:18:22 +0000
Message-ID: <e4800dc2-d2e2-e545-d54c-e58838ee0ef6@intel.com>
Date: Fri, 28 Jul 2023 09:48:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/19] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
 <ZLj+YEpuQMDcogN4@intel.com> <65cb4383-ff7d-f7b4-29b8-4d81fbe076c7@intel.com>
 <ZL+gS640uxlrzhSP@intel.com> <af9fcee3-608d-a1e7-b1ae-29be77525083@intel.com>
Content-Language: en-US
In-Reply-To: <af9fcee3-608d-a1e7-b1ae-29be77525083@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BN9PR11MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: db0462be-5706-444a-1eba-08db8f21adeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4NkjEV2Y0fInDxnaC1YxfGFV8p/mdwQBkW+ubeZCaSgKjG0S0fq6bZj8H6yfm+mHOJzA63oM/+746L+UKqVmuia/8qMfISgMAKmDdpkUIs1/QBDXVWNtWo1AJuozHL+aFsN6MM9y4HeHA+6MsZxY5LrVf5R765eABChDX+xKv6v8hgpg1NyBsiTH30x4u0a3zqq4ZlKEZLBe0+6mEtM344DLaqYgegdpNCDG+kmneyd5v8Lq0QpHWjj4zXeDhLmvW+CJLwz7fbxQSrtFruMfVhSBYwlKaUndvj+LlufmQjQrzCKMFJQIOx9yMycvLfPIm5nMr4BRceFTfn0DNrFm6Uod8tS6vwaCgXC13x/jryj+d9GI2CUs5SB8GhWnX0EAF/gfb5blaGniOMBl7CXVpaHFuVWZm+y/0ptQrksIDMyHBff4K1xbhr+aJPQ/1NfzmTQO/AF5R+g7SzRRXVMCZt1H8IcgUYdzEFAlkv4DK04iTfkkYmaSzh6TxAuw6EUmEPVSF7sD6ogGoJxOk4cRDdsxxstsde3aeGJ40Yh/cRPfOGAZO2i38XG3uGYs2CaXt8gCXVpTtm68Zyz45nc4S4VoaSxfAlNeROr0oTcSvwMg6keJUgHo+spbHefsiRJClro8MByINFk3YOL6jOQ2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(316002)(8676002)(41300700001)(66476007)(8936002)(6506007)(26005)(6862004)(53546011)(66946007)(37006003)(82960400001)(4326008)(478600001)(6636002)(6512007)(66556008)(6666004)(6486002)(38100700002)(36756003)(2616005)(2906002)(66574015)(83380400001)(31686004)(86362001)(31696002)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NyS3I5MGhkaTVYTzdnK1FRbHFnSSsvYkJlMDdob0ZCR0N0WjhiaVN3Tzh6?=
 =?utf-8?B?RXZpOThNM1ZEZDBvQlI0TlR1WGEwMCtkRFFZRTRmTHNDb3gwTFZQQWhRcERs?=
 =?utf-8?B?ZmxMVllBQm40TXl0UmZiU0VnYWpWdjU2RkpsVkhlUGx3TGhab0psbW9aN0sw?=
 =?utf-8?B?VXp0cXJHMm9vNisvSG9kNXhvclk0NzRSckFoL29lYWh5cnpleTFsc3pmUHFC?=
 =?utf-8?B?Z3lQWDlBUCt1U0pURHozbjdOaTQ5WnVnYmxESnhYL0Q4NmQxRWt5VTcyakxC?=
 =?utf-8?B?aTVJYXFMU0ZOc3J6amQ4YUFhaFc3dFRkdnBwOXVXYUE2Uk9kTTJ3TWNXeFda?=
 =?utf-8?B?NjQrdFVyT2RGbHBHQkhSTHBsY3haYm9pNVZDb2VCOTVvVXVYcnpQazVTNUdF?=
 =?utf-8?B?Ky9Sd1UyRHB4VkpiZVRQakhoMzBKNHFLOFhGOExzMHVxK3YzcThud3VpMlF4?=
 =?utf-8?B?aVVUR3BnbmhjOHdXSWFXNFdNVHlWelNwajFxL3g5TDVQVzg1ei81bmxYVWI0?=
 =?utf-8?B?WmlqQTkvY3gzTjRDOGNDdG9nb2wvMzRIY1JMcWloVHU5aWZtbXBEZzd6RWVS?=
 =?utf-8?B?c09pK3VONWIyd3FscHZzREwwK1A5M1FBQmM1QjlzQkd1VnZCVVE2MVQxV3Zz?=
 =?utf-8?B?blptUzZWNUJyNnVpWnhsYU4ya0N1bjljYjBOU0xMK1AvR1IwZWtFYlhFQVVD?=
 =?utf-8?B?ODAwUWtrN05GRzNPSVhrNVdxY1dkSVB4RFdMdnBFRXZjOVlpdFRqOUUydVpK?=
 =?utf-8?B?ZFBVOUtvcUlaNFE0bFpxdmwzeGI1UXVxd2FCMURQQU9SWjEvSFJJZGZIMnFD?=
 =?utf-8?B?YitiWmpyWG1CWndoT1E2cU02OEhpRVlOVGpjTnJTZmU2S0htbzQvdW5KV3BW?=
 =?utf-8?B?ZkJMYmw2M1NXaWlBVWlpOVR0M3NQZllCam95MlRTWDVOTVNrT3gzaXREMDRt?=
 =?utf-8?B?Z1VPMlFoWFpyQkJQWm4zbzViRUZDZnB4aXQ0T0x0czI4YUM3aE1SV1BxazNH?=
 =?utf-8?B?cmlTbUkzY2NmZzFFam5ZSHAxMnZXZHBYVk1HK0JiR2FuWk5acVdFeFpQbTB6?=
 =?utf-8?B?Q1JtNk5ORFVtcy9aMmMxaWRZYzczeUc4U1FYZURYQWZUOTV3Q2YzOEJ1UXp5?=
 =?utf-8?B?dHJ2WTZDRktGcHFyVDlFbjVVdnNuQTZkTFNFTDFkMlhLTHJuZmkwUkIwNENZ?=
 =?utf-8?B?STl2SnVtSDRpTU1SWitOeFF1V3RqcVRPeTJmU2s3QmNHaXBxVVYxaG50SzRn?=
 =?utf-8?B?OFd6bGtqdG1kUTU3UTliQWNGWnp1Wi9oVW5JSGhyUzNuREh1NDNLVTBQam5p?=
 =?utf-8?B?OE1ITno2alhnQXhsQmNGU3U2T3hmQm5CYzA4QUF0anpvNUhMNmhCZm5UREFa?=
 =?utf-8?B?ZC9tejQrUDhDem5OWGk4ZGtTVnJ3b3c0V01IdU04QUtBQ3V2dVNGV2VxWjVL?=
 =?utf-8?B?dXNqcE0zdmVwN1oyZVh3eHVjbmtEUW9aSm1sWjRUTVdhY2pUN2NXaE9pNnhj?=
 =?utf-8?B?R3VLY09pTnp6M0dNNUlaQnBlMUhrakZCSFNydXhyNEJhck91aURiTCt4L201?=
 =?utf-8?B?SkNJTFNrNmpxeWpTQXZ1ZzR5NGZvZVpIR0JFQ3YzeTRLaEVEWTM0M09kMkNk?=
 =?utf-8?B?bGZMYnFPQllJR3hnMmd2Zlg5YXhRbmVMYWtZU3N4R1ZDc2ZrZ1M1K2pCdTN1?=
 =?utf-8?B?Q3V6bTZSdUs3WVJ4YWl3WU5UcGoxc1Q4RW1BdjN2QjhpT2xkM2s5Y2tla0Q1?=
 =?utf-8?B?bFJkN25JdFAwdlNTbndmY0pEMzZlTmhSL1BOcURXdG5GZzV2dEZsREZQdzUv?=
 =?utf-8?B?ak5XTTZvYzlWSjROL0NNTzdYSy8yR1gyVVQzV2hQYXFKWWJIK0pGd0ZzTngw?=
 =?utf-8?B?eEo3QzJYU0ZrN0pkaVJNMmh2ZG9FSUk2NjdHajlrdElRTHhoZVNabGlrVlhO?=
 =?utf-8?B?VkRCaFRJZThHT0kwa2p0UGcyckNRMVpHRWF3TXhrcWxoclpJN0l1aXMvWTYr?=
 =?utf-8?B?cjdQNXRIQWM3VktXWVkzZDMyZGVZeTFHRStWT2FIOU9oYjJlbTluZ0F0Q0Y2?=
 =?utf-8?B?djd3cG5seTlKeGwydzlidTdKamE3UHhpY1R1L1lRR1RaVkUwQkpIYTRZYkR5?=
 =?utf-8?B?MStPdE41blVLZVZxK1lHVXhsMjBHVnU3Z3c2a1FsREhnSVZ3WW5pYlk1S3lL?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db0462be-5706-444a-1eba-08db8f21adeb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 04:18:22.2709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6k78ljvMWqnlZlRtlXuqjsfa+phvhq93NEfN8oADQO+ReTwYhUSWf5YzeMKsLLbGvOyGTbTIuOC7jJNZdqK0AUdl+SFnksBFGp17vxA+arE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5498
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 navaremanasi@google.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/25/2023 4:49 PM, Nautiyal, Ankit K wrote:
>
> On 7/25/2023 3:43 PM, Lisovskiy, Stanislav wrote:
>> On Mon, Jul 24, 2023 at 05:49:11PM +0530, Nautiyal, Ankit K wrote:
>>> Hi Stan,
>>>
>>> Thanks for the reviews ans suggestions. Please my response inline:
>>>
>>>
>>> On 7/20/2023 2:59 PM, Lisovskiy, Stanislav wrote:
>>>> On Thu, Jul 13, 2023 at 04:03:32PM +0530, Ankit Nautiyal wrote:
>>>>> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
>>>>> DISPLAY > 13 is 36 (Bspec: 49259).
>>>>>
>>>>> v2: Corrected Display ver to 13.
>>>>>
>>>>> v3: Follow convention for conditional statement. (Ville)
>>>>>
>>>>> v4: Fix check for display ver. (Ville)
>>>>>
>>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c 
>>>>> b/drivers/gpu/drm/i915/display/intel_dp.c
>>>>> index 19768ac658ba..c1fd448d80e1 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>>>> @@ -802,8 +802,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct 
>>>>> drm_i915_private *i915,
>>>>>        bits_per_pixel = min(bits_per_pixel, 
>>>>> max_bpp_small_joiner_ram);
>>>>>        if (bigjoiner) {
>>>>> +        int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 
>>>>> 36 : 24;
>>>>>            u32 max_bpp_bigjoiner =
>>>>> -            i915->display.cdclk.max_cdclk_freq * 48 /
>>>>> +            i915->display.cdclk.max_cdclk_freq * 2 * 
>>>>> bigjoiner_interface_bits /
>>>> Probably "num_vdsc_instances = 
>>>> intel_dsc_get_num_vdsc_instances(crtc_state);" again,
>>>> instead of "2"?
>>> Currently intel_dsc_get_num_vdsc_instances will give total number of
>>> vdsc_engines including joined pipes.
>>>
>>> So with bigjoiner the function will return 4.
>>>
>>> This was good to calculate Pipe BW check: (Pixel clock < PPC * CDCLK
>>> frequency * Number of pipes joined
>>>
>>> as we get PPC * number of pipes joined from
>>> intel_dsc_get_num_vdsc_instances)
>>>
>>> Or to calculate DSC_PIC_WIDTH PPS parameter.
>>>
>>> But here we perhaps need intel_dsc_get_vdsc_engines_per_pipe that 
>>> will just
>>> return 2 if dsc_split 1 otherwise.
>>>
>>> Thanks & Regards,
>>>
>>> Ankit
>> Yes, I agree, unfortunately not applicable here.
>> May be yeah we need some function like that and then refactor
>> also the intel_dsc_get_num_vdsc_instances to use that one..
>>
>> Stan
>
> Alright, let me make the change in a separate patch and add to this 
> series.
>
> Thanks & Regards,
>
> Ankit
>
>
Since we call this function during mode valid too, so cannot directly 
use intel_dsc_get_num_vdsc_instance,

so I have put a comment for clarification about PPC in the latest version.

Regard,

Ankit


>>
>>>> With that clarified,
>>>>
>>>> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>>>
>>>>> intel_dp_mode_to_fec_clock(mode_clock);
>>>>>            bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
>>>>> -- 
>>>>> 2.40.1
>>>>>
