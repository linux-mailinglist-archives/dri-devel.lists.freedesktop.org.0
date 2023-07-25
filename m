Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16376147E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 13:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DDE10E0C0;
	Tue, 25 Jul 2023 11:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7C310E00F;
 Tue, 25 Jul 2023 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690283990; x=1721819990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oP0ZrbjUtcbwWVOQKrHxCR7aZZRpPts71Wxx3UrlV/E=;
 b=ZV7F70qa7pk+i3mSwoEkHue3HDBT9vToyC2mgc4Om57qRP3Puhr+tN2W
 7xjYHW/R7WOrUOCJDuj7ic/N1rtndZt3bxFJHvgV73nlOWRZqjwmaJVM4
 R34ulJx4LFc8AoPf+tyIMFwbLWkFNYyBPF3fLMMtugCnwMXcW5BatRB9F
 N2U5lo3MtghhEnG7csPVSrQHmgQDy2YwBYa04Q430tx3jzSnJsuwZB3u+
 6UCLHw9kawhpVY/QrU5uXLBR/RRPfTXv+shTI9wXlO2a/Oq4LDcpJpGBa
 Ako8Pfo22MTTJjUjh8VUYVDG96EtlHvr+NC2CraFp4qiHgLcG3QJwlL22 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398603953"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398603953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="726076040"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726076040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 04:19:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:19:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 04:19:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 04:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDiS6J0+D64aY3L4ryz9YNehGqmDM9DWYpPQEalAIWzZAD9fIk4JMat94vSDJdCyjrctwWB2eZn+YEqh+VRbeU7UzM2JbYw/iKUxgXQCDyYkpinMUaN1JrLuwEpcU593+/1oQhq0RH+MRRUnp+HXJrWNY5zCo9688nZ3Ib/WvAVHkW4oyJ3dtHV7MLxkQFlFVBA1riR0rCoclbSF2hi2Dfxmh7E0VFivp8PI13TUtU2qUr4DZGih7UdmgLkFr3gvrjCXCvlO0B36veSZFwkwQvEzx/2Y2kqaVgwBzd11fsvD+HcPbOyYxDt4fH+BX1tpZmCuJx45ueZnS+qjEMAXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAhLAz8znwUvDq6OlPMWdVtg0j84Qh5S13GaXxJ6TvA=;
 b=G7s5Hnb8W7S98NURaEIdaTiXi5qa6lwv1++enhCwUN9jYtZCFcG61KgeGIQ8q4L1e+n+eCK57xlX/iJOIL1RfLHxfXznVrE8ZMuE1NUE7YB2u9VZg2lNA0dy3ASZwT8GL7Qh0rWD693UCaQiaReIik+qpuFtj0W9r9k/4428qfD1b8dbLZBl/OdDqLtr5nCEcfqgQH3NUt/D9lJGAtFqdjFCiD+17u0xgR/qw8BRUp9WxxWpMNgyJ5441p3qbg+AYMils1LqOjqFsuoR1lZJEPJ12lEDcmlvh9tEq3s96AktAzrAlaZPpng0ndDziDBm4FITNRH4lLcxfvlFr9hhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5691.namprd11.prod.outlook.com (2603:10b6:610:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 11:19:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 11:19:43 +0000
Message-ID: <af9fcee3-608d-a1e7-b1ae-29be77525083@intel.com>
Date: Tue, 25 Jul 2023 16:49:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/19] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
 <ZLj+YEpuQMDcogN4@intel.com> <65cb4383-ff7d-f7b4-29b8-4d81fbe076c7@intel.com>
 <ZL+gS640uxlrzhSP@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZL+gS640uxlrzhSP@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f46499-7b57-4702-bc6e-08db8d010b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: meFDH2gDs7EHliajx+GsY3237DDFluaQIuLI5p9cOsGFf9tVLcxNdF/rmXdGjeYYrDOIlbXt4BlM1Vlskzq8T1GBQSGOiB57xij1sh2OoHB74MIDdjibu8UXHqeCzM3gqHQaUU8vEiG2LJ/cQ1KApshQmNCIL/Ltft5tXXDZieTr29P9e9E1euAperYilrfcDPnORVM7w/7IJ7+1Qdeu007iHAd+Pv1FwB61LC/OuLpakLJIBmFfRPwkUiboxmQhv/rMLfw3gd3ACQED/iEbrG98/ALcOkHhaKWEZ2K4OKh8qf5pf0saeN6buVUOWKFMFykApQoA9fTo965auYCNliyRvTBDWJPBUdFj/TfrXqvEQyz/NJTXXbvvkuOzs43nOe56HiWAK9HrDYtgALl9K34qVSGBVDiQrYSfmcqohkSxksBe2Zl/V+hTtsW7X2GjEI2OdspWYR1aT7SOFfbdEl3W41ywdRH8Ozj27eYfBLYUis2e29l+dU1zd9CYdGbjnFKi4KUbp8xXFStHWmjK31g+JnU8G2aDEundeFyE8g0ujnsUNNapAL2r/ZW3goaRb6C3uDTKqZfz23ZFY7p4BN0Srx/S2yzseetXKYz9SwhPgCaJQAtvNno9+7T9WHzGn2uQFmEkBejOW+4DvaGOmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(38100700002)(4326008)(66476007)(53546011)(55236004)(2616005)(66574015)(36756003)(83380400001)(5660300002)(8676002)(8936002)(37006003)(478600001)(6862004)(66556008)(66946007)(6636002)(41300700001)(6506007)(186003)(26005)(316002)(6486002)(6512007)(6666004)(2906002)(31696002)(31686004)(86362001)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0pweUt2MzgzY0RhbHJJRm9HM0tOOCtnYkJyQm9UY0l4dTEwVnV1bVJKZSsw?=
 =?utf-8?B?ODBBL0ZrT2xOT2Z4RU41R3c0OUMySkVvNVhqNUxDUjBjcXNreWh3WnhoaEVR?=
 =?utf-8?B?c0diNkwzYUwvUHJYUlMyRGVZeE9tcUs1NzAxcTc4Q21MQlFJb2VrL0lxamF3?=
 =?utf-8?B?Ry9oQlN3S01EMS9hY0N0M1o4bGN2NmJmRTVsVXlCK2pCakprc2Y4ejA3NDdx?=
 =?utf-8?B?RTNRODZ0UGIrVU1CSkR3QkpXV3pDU2YvK3dyTjVNZGRyU200Q2YyT0JxR2t5?=
 =?utf-8?B?emYwbUJldk5tNEJxSlcxR2psSlQ1OU4zK3BvSTZKREMwa3VxeEFXcHhJR1py?=
 =?utf-8?B?bTJscjdjVUQxbFRTdEEvYXBxVytCZUY0LzhRaTEvdEg5RTVJMkY2WWx3SlhH?=
 =?utf-8?B?cFRRSVRzTjZKWGs1dFpTRDdYRHlGZC8zNXc3bkNrOW96K3lsc3FSbVZGK1FZ?=
 =?utf-8?B?emFoWHNob3pIUEQyMDA1SlhYTVh1Qmg5UGdBTkdFTFBtN0NKcVpidVFERzdu?=
 =?utf-8?B?Q216OGw5ZjgzK29iRHVSYUpaS1pxVjliRmo2MllDenBwSHVzanZ2N2RhNU9l?=
 =?utf-8?B?Zy8wOXZIcExTSW1EMU9IVDgra25SSEZKcXIyNjllVDh3OVpMS21JSnYyQXp1?=
 =?utf-8?B?MDBRNFluMTJVZ3A0ZnhKQzNIekRoS2hrSnVNL1EySVh2YzhlUy94VXRQN0Fx?=
 =?utf-8?B?MGtwdXlpSkY4ejA5NitZN0c1aVlxSDlKQnVwZmlockg2RFNCdmJtdmk0ZkxB?=
 =?utf-8?B?Z25mczhuVHN6K3dOSm5qSmt0THdMSVZVQ2RCb3NnclpnV3VsL3d6ZFkvR0tB?=
 =?utf-8?B?cjNzKzMvbHZlbE9tQ3EzNnlJK1k4WWoyM2t6aDVxc09EWWFNbWRPb2g4TkxH?=
 =?utf-8?B?cDY4RlMycmJ1aFFaTXZIajBWL2o0VUZYZ043WFVmM0tST0czenYyM2hVcTZJ?=
 =?utf-8?B?dGFxU05LRVh5aFpTdjg1YjFZa21JZ21XVlhycHhJdnl2SGhmRGVNa1pmRnRI?=
 =?utf-8?B?d0tFZTZ0WEl5ZlFnMkZnQndGK2ltYWd3YThycGZsS3U1c0JOY0pFU200ZkRB?=
 =?utf-8?B?ckFCanliM2VIZUR0V2l3RFRTRCsrNzlEdWlkUzcxVlptQ3RqT2lZc3dvRHJo?=
 =?utf-8?B?emVSWklYbktMbHdCcE9ZUjVPZUdCSFZ5TEsrRGpxS0RwOUYvNk9WaklmT2xC?=
 =?utf-8?B?cHJoM3E1NTBhNmwxT0V5Mk5jdDZuZ09MYjBsMGNoTlErc0hVc0VySGJkWDNI?=
 =?utf-8?B?QUMvejJCSWVKWU1hWlJ6L3hWSWpZUDAwbFpBSDgrd1BnTTY5bUJaVTcxSlhC?=
 =?utf-8?B?Q3hFTFlxdEJ5cDFXOHAwdjlrVmZMcTR1RkhPU2ZyMVdWN3l1S2pCckRTczQ3?=
 =?utf-8?B?QTBkNUs4WEZNem56VWNEUitkT0NRc0FyclJHR09tL0hrUHhHUUhrN29OVGYw?=
 =?utf-8?B?MmRFa0E5ZVVISTF0K2wwVWVjaittZHh5NWtMdS9MMk1ZK2Jia1dyeUpLemtr?=
 =?utf-8?B?SlNUOUxiTUwrM2pJcU5SQURjNDVIUVRqeTNrNHVObWRuNnBRQjJ6Y3VVR05q?=
 =?utf-8?B?SHE5WjlIZjJDMkZDbjUyckVoTHhMZEpoYzB5YXlLUzgzdFdlR3oreUIwQmE4?=
 =?utf-8?B?N0s2VU9EZk1BY1FMSllGaCthZDdsNmltS2ZjY0hTd2ZqNW9BbHBRaDBrRlli?=
 =?utf-8?B?T1Uwanhhb2gzM2lQb3J0NHl6T2IwbjNLKzB0VFdCdnNXbjQ3SVRnYnFVcEpG?=
 =?utf-8?B?T2p2NDRydW01bXlxTnFmZW1HTnZjKzRkVjFUZS9aSDhQMkNpcXFaa0lxcm5S?=
 =?utf-8?B?T0xCQUVVekhRSkE0RFA2enhQTWtpTEFhUHJ4MkltaHBvVHFUYk5sM0VJNWd5?=
 =?utf-8?B?WTlrQkkrNnZuU0NJemNLT2tpbWcyL3duYVhyWkQraXI2QkxNZXhXYUlrQ0FK?=
 =?utf-8?B?bE5COGRLa0tQOHN6VnNndE10QTZnTU9vRUp4N1RqVC9PWUpNSGlxR1BNZHo1?=
 =?utf-8?B?Y0tTcFJqRTM3NU9QOERINFpVenYxK1k2WlBqWmRJU0g1bDNMWXFyZkxSSHV2?=
 =?utf-8?B?MzNpa2ZJZUhaNW44R3R5cnhlaGdoRHFQV0lUbDJPbm5XZ2R6eEFHdWkxT2pz?=
 =?utf-8?B?RWE4cUlMWGlURlM0UlAzNnhIWDdCTHRFV0JxTTlWakg5U28rRXFVcEY1R0F0?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f46499-7b57-4702-bc6e-08db8d010b42
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 11:19:43.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKRd2NzCmKytFcUkvvjkPqxnKoz8lDDO6pHt0GYciPPPVBk4uYzFWu5VRl0lKC/yoDk22q0bvO0mVd0trTHPtn9UsRQdU/9J3XU69cAlp2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5691
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
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/25/2023 3:43 PM, Lisovskiy, Stanislav wrote:
> On Mon, Jul 24, 2023 at 05:49:11PM +0530, Nautiyal, Ankit K wrote:
>> Hi Stan,
>>
>> Thanks for the reviews ans suggestions. Please my response inline:
>>
>>
>> On 7/20/2023 2:59 PM, Lisovskiy, Stanislav wrote:
>>> On Thu, Jul 13, 2023 at 04:03:32PM +0530, Ankit Nautiyal wrote:
>>>> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
>>>> DISPLAY > 13 is 36 (Bspec: 49259).
>>>>
>>>> v2: Corrected Display ver to 13.
>>>>
>>>> v3: Follow convention for conditional statement. (Ville)
>>>>
>>>> v4: Fix check for display ver. (Ville)
>>>>
>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> index 19768ac658ba..c1fd448d80e1 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> @@ -802,8 +802,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>>>>    	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
>>>>    	if (bigjoiner) {
>>>> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
>>>>    		u32 max_bpp_bigjoiner =
>>>> -			i915->display.cdclk.max_cdclk_freq * 48 /
>>>> +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
>>> Probably "num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);" again,
>>> instead of "2"?
>> Currently intel_dsc_get_num_vdsc_instances will give total number of
>> vdsc_engines including joined pipes.
>>
>> So with bigjoiner the function will return 4.
>>
>> This was good to calculate Pipe BW check: (Pixel clock < PPC * CDCLK
>> frequency * Number of pipes joined
>>
>> as we get PPC * number of pipes joined from
>> intel_dsc_get_num_vdsc_instances)
>>
>> Or to calculate DSC_PIC_WIDTH PPS parameter.
>>
>> But here we perhaps need intel_dsc_get_vdsc_engines_per_pipe that will just
>> return 2 if dsc_split 1 otherwise.
>>
>> Thanks & Regards,
>>
>> Ankit
> Yes, I agree, unfortunately not applicable here.
> May be yeah we need some function like that and then refactor
> also the intel_dsc_get_num_vdsc_instances to use that one..
>
> Stan

Alright, let me make the change in a separate patch and add to this series.

Thanks & Regards,

Ankit


>
>>> With that clarified,
>>>
>>> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>>
>>>>    			intel_dp_mode_to_fec_clock(mode_clock);
>>>>    		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
>>>> -- 
>>>> 2.40.1
>>>>
