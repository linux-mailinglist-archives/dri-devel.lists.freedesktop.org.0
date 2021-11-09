Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC044B3D9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF656E11A;
	Tue,  9 Nov 2021 20:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F756E11A;
 Tue,  9 Nov 2021 20:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGQi9jOM+Q07dVvq1IhgBYx9Axp+fkks4LwGyh1swnIJN4yi7utqh7YPSWX9tyVpsxH+H++Rnb9fJ0ZOSvPYZONrctHxNEev50IcC8HApmklJ52f8QW9Ye6nwPoCBGLvuRFA2LC4LcZzx5LJJRwrXdu6jCo7eY4NmM88aT8TXTJXYqY9wpPV9XBV0pwdEZXSVr/Alj/z4q0NLjMUDe35YD5DOyiGAYjmcqwWPBwkZ4m4H+mbwVJAcn2/+GzpRM/KE4ew9qlUuOb4wM+zZdO1LDwDWEQ5pMkfsykXbC7GDjR8ZDNYwJ7e+kIBew0hw7S6zyUOIgF6Ri0N48AZCw95Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwE/cPv7Y1wsZgrb8czikqzLq9hPDfICaCq0UmDxCeM=;
 b=aXObcU81C7P2GE/FKRBiaiX8JoPkjGjvm/gponCyrSHggTFWlFF5zf4pr0EXqbTe6VP+aq/FAep6ttSpedn9iO71NRNlGLghngIHZJMucrSs7yTzA8n6vr2CuGm5fbIGzUHOBoSwwzribPdM0A62v/8LJwcOgHUO7tGbfujoSje+LYpSZB7GA2HULdHkM9CPCtg+HZlfOHAJmLJo9S7MIqIVgXKVIrdSBig2bQQ16PvzxiDyTx5V4BDauxG7pAIBZ2j0nrIBMPRjSliy4pXtALjzuZQb3pEUgMZkbgtT3/ZPDac1G1N3oYtLSyZhh0A8zu9LGFO51mOICajyjlSdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwE/cPv7Y1wsZgrb8czikqzLq9hPDfICaCq0UmDxCeM=;
 b=qzBdcWiO5tYpb7kmQCAIyWHAiCUjvzcVY2xJIDLWhnjEkeYU/37uYAbFBXNsPFqyHT6ZQYgORxBj2hNMcxZ7hkZe3W5QrfqMBKrX7aHz0wcmP1K2t6O+E7z8+6WFLDgXsRIrCHBUZ++ZMdieHxknFEjx8ld7qj1eSwMTM6wXdmk=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5410.namprd12.prod.outlook.com (2603:10b6:5:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 9 Nov
 2021 20:19:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 20:19:51 +0000
Message-ID: <5c7b65b6-69ed-2259-0edd-cf04cffa9231@amd.com>
Date: Tue, 9 Nov 2021 15:19:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com> <YYUqwCBQwfL0SABl@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <YYUqwCBQwfL0SABl@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::38)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 20:19:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c87c688-4279-4efe-d125-08d9a3be48ec
X-MS-TrafficTypeDiagnostic: CO6PR12MB5410:
X-Microsoft-Antispam-PRVS: <CO6PR12MB541018A7E8129137E9FAE0878C929@CO6PR12MB5410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIPcMXZR3d/2RHeAb4f4HHR/JufngMJHTEJRxqnAF3eSr44NAEgZMhzTZ6oxxjZr4neqvtItTw0bFsENCoRgu6latw+RirD8c/T4XiR+AwlK43/NV5pWwbZj43KDWGPXI1Ad+i8l7D+j6MyjHfQUJ0BEql6bYaMDP46z6n/8OHpbaBOFfJFAss1igqchV2p3bNPF7jfCYUZtBzbF1M7xy/w5uhW08FaEWjc2PU4+7TaTGQyAHE7w2R86mJ1Lda0fgeSJC/DKQD3ZXZvwE7INZgVMnUXqSqjIxXCbkI+V8OlshzXB4kKLXs6MJV6PoooN9vxpsCJEV6N3iuupNfZXzEtuxMFQoaSpD2pz9hvRd6z2qB89wA4BSitt1xKxKvKHKvWxxMoAs8GbhiU89ySQNVv7pRb9Thg2WjjlFdh3c6gRgKSARmJu1TabWB9JqoLWiU8T5YbDGWM/w185/yH7rktrwyIgk6aYyuKt6MLLvz4vUc3dRSAFZhauoz3MPK6BuekK217Yu/vLaVibNO8VKSz8cf8LVg52t6q/TkO5RwolbGA6EofgmOXe+KZGMLMK5JieqzpLh9zQ/vcrHYMaL2Uu49OTBk/OXvsmx7mhG5Sx9enKDji1ncBVB0vjwV2wtasazc5nOSH1GcT5131Oj8/IeeUU/FrHJIUldudsiNSZbBfXNnRvC176Wo+/ybkio9Lv07f17j8xj8w9bXoaOP9v1ndFBRR9xeruafBaawCoaUiBe2iY77IyaAO6Fgrv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(83380400001)(6916009)(66476007)(38100700002)(66556008)(26005)(186003)(6486002)(53546011)(4326008)(2906002)(8936002)(508600001)(5660300002)(8676002)(31696002)(16576012)(66946007)(2616005)(316002)(66574015)(31686004)(86362001)(36756003)(44832011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDc3dHIrUGxVNTdxMkRzYW9rWjIySm43L0V3VzNXQ21DS2JMUUJWR3hLS296?=
 =?utf-8?B?S1VBWXI5L3MvR1JoQ3RXdzdLUW9GcjNUMk9YZldNYWxSMld5T1FmYVowTzJX?=
 =?utf-8?B?SmtrRzRSQ3dBOGoxNk5TRXQ4akdRWGZWUFlKdEcwQ2tOeVpITGRmcEJ0RUoy?=
 =?utf-8?B?eEpDMjdTS1c5SzRDSlZHb2tXc1B4Q0xrMmxCcGxBV0RYNTAxd2E0bVdyZDM1?=
 =?utf-8?B?a2ZjbjBIZ2RaZjM4ZkFROW1tUXRMNG1rQ2NlWWMzSHcvVm5qekFXOFE2T1VP?=
 =?utf-8?B?cGJpbitwV1RuTGhWaGE2Z3RqY0hFeTlscGliOHkwUGpHdWpRSHRSWXgrWWV4?=
 =?utf-8?B?dDBFL0VYeDVTVDNESmEveTFlVmM4V1NpUnBOREJ5Rk91N1hkOXFNZTBLQm1O?=
 =?utf-8?B?aVM4R05jMEhpK1huR3g0VzhnQXd1dWg4bGc2NEpkZ003ZXR1NGZZV0FrSy9l?=
 =?utf-8?B?eklsQit0V0xJWS9ibVhNYkwxVEpJcU1ZUE1aeWZSemdnTmRwWHlQLzVrYnBD?=
 =?utf-8?B?ZVUyMTBpQi9pakdaNHliYW1NTTQrRWhSYXBWWUJFelg4NFk2UWFIVnJzRzhQ?=
 =?utf-8?B?N3FOMkVFbEZIYm1ZZHNyYk9rMG9CL1NYcDdBTVpPOHBiZXNMb2ZIUlZFeGE1?=
 =?utf-8?B?NUxmVFRpS2hGUUtJZXFxUTZBYmpDS1lWNXZtcEsvRWxrTkxHS0NIWnRpQTR6?=
 =?utf-8?B?N0JzRUkyRnYzYUVOMWVkQnI0OWtScmo0TFdvM1VNc1RXcmVUUVlFOFF6REZT?=
 =?utf-8?B?RVJ6MUNJbVRlNVNZOVorWmxPNUhYN0FkWGJ6RUFkZGxYZHNFcVJhSEFDdXA5?=
 =?utf-8?B?R2dQTWc0MkZyRmRBdEhFb1cvMVVWZVQ3REpDYWpCWTR3QXovMkFaUFdvZXRU?=
 =?utf-8?B?YVZla1pyUTFjeHRrTmJzZHByR2hHcjcvZUVvelltaXdTRnNmL1gvemROZGtM?=
 =?utf-8?B?Mk5rbWsvNGhRSXhRcUtPMk1EYndVZTREYWtrN2UzajJuc29XTnNlSkF2dExs?=
 =?utf-8?B?QUkxUU1MZGg3cGNYS00wREs1dG9MeE92N3FYaFo3amYxZE5lQ0p4NmM1TEM0?=
 =?utf-8?B?MlNyYTNTZlBZZkFnVUk4SVBTRDR6WTZrbnNleWtIRTZldnZoTVk4SGVyc1V0?=
 =?utf-8?B?SDR6d1VuYnhFSEdrUExoQkowejJhM3hLbU4wK3NUMnFoOURJRUFxZXVBbDVu?=
 =?utf-8?B?MzlTRDk3T3lLL1R3YnV6VWx4NzYzZFlleDhrQlpPNGpyMzR2S09uZ3Q3cW1F?=
 =?utf-8?B?aDNpWjNMenVCSjE2OG1pVkxIK1lnS2pDeElCVGdETkhvQW1ZSnVTSkZtOW5v?=
 =?utf-8?B?UmZqSTAyNWR1QUJVWEcxZEk0YzVjeHAzdXpPY1Nlb0NMd0N5VGhwWWNybEpW?=
 =?utf-8?B?T1lYUlVsK3Y5UE5jQlVUSkZJbjd1QVE1T05jaDc3c1RPYjczWmlITXNyWHJ6?=
 =?utf-8?B?VHNtV1pSSm82NkJhOG9hWGYwVEJJZXRwVVAwRnN3dEtlU1pXV3BsSG1TQ3BQ?=
 =?utf-8?B?VlhnVWdGSjRUWWpQTldJRW9nMWhkZGNnc2czNHlvN0h4WjBMQTJQbUNiTjF1?=
 =?utf-8?B?cUpHaXFweDMvWlFwVXhydUxDYXNVRjZmWG1DeGxlMXBuRklkL3hvWjViSzVF?=
 =?utf-8?B?V3dzdStyKzd0QjZDc3NtM0VrSkpuVm8wVmxUT3dVU1lFekc5cXdOQnJLUjUx?=
 =?utf-8?B?VlpxTXc4WHMyaDNpd080eUZEdGFkdG9RZnp6MGoyaXIrTVdzVUNJdGhabWZw?=
 =?utf-8?B?dGVVYmxZMEFTSXFSRlc3K2R2bmtnZVRHWHFXM0M5OHVocytTQld5VDMzYlVJ?=
 =?utf-8?B?aWN0MW5vc3RScHFxTDhBVWhIVXBNZ3pwZSs1NHNEejB6ZG42SU8wN29xbjdH?=
 =?utf-8?B?QTRJSVJBaFR2bWFNeVkzZFdSb0ZWM1lkcW83c0xFYzhmdEJneE5kaHhSMVV2?=
 =?utf-8?B?Y3VWRXNiN2JLYkRvOWl5K0JGZ1BaaDh5VGpRL3N4bjVueFFONGQzMHFPeVZn?=
 =?utf-8?B?WUszc0ZOc3lnYnpPaUlJRVZ0bUxFanNQc0hJTzYyR1hSc3FYS01GcGl3V2gv?=
 =?utf-8?B?bHVENlhEUHY3d3Q4VWd0cmJPYkpWd2N3S2Y5WTVCQkpnNTcrM2tGT3gvelFw?=
 =?utf-8?B?ajRTSGRGN09HejRFY0RzbDZva3A2bDVHYVQ5RUlScXNvY3lEejdSQ3JaWElz?=
 =?utf-8?Q?QTcjNWUmCysXckGSKCAiMXA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c87c688-4279-4efe-d125-08d9a3be48ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 20:19:51.8989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAmlA4FnAUK0UPCsCwHxPPPPOevw04jflxOGuVjwoPEXr8bBwvJU2AjkF/CFM2f9xSPeoAK5WLKY8F2Uqo2ynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5410
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-05 08:59, Ville Syrjälä wrote:
> On Wed, Nov 03, 2021 at 11:10:37AM -0400, Harry Wentland wrote:
>>
>>
>> On 2021-09-06 17:38, Uma Shankar wrote:
>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
>>> planes have different capabilities, implemented respective
>>> structure for the HDR planes.
>>>
>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>>> index afcb4bf3826c..6403bd74324b 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
>>>  	}
>>>  }
>>>  
>>> + /* FIXME input bpc? */
>>> +__maybe_unused
>>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
>>> +	/* segment 1 */
>>> +	{
>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>> +		.count = 128,
>>
>> Is the distribution of the 128 entries uniform?
> 
> I guess this is the plane gamma thing despite being in intel_color.c,
> so yeah I think that's correct.
> 
>> If so, is a
>> uniform distribution of 128 points across most of the LUT
>> good enough for HDR with 128 entries?
> 
> No idea how good this actually is. It is .24 so at least
> it does have a fair bit of precision.
> 

Precision is good but you also need enough samples. Though that's
probably less my concern and more your concern and should become
apparent once its used.

>>
>>> +		.input_bpc = 24, .output_bpc = 16,
>>> +		.start = 0, .end = (1 << 24) - 1,
>>> +		.min = 0, .max = (1 << 24) - 1,
>>> +	},
>>> +	/* segment 2 */
>>> +	{
>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>> +		.count = 1,
>>> +		.input_bpc = 24, .output_bpc = 16,
>>> +		.start = (1 << 24) - 1, .end = 1 << 24,
>>
>> .start and .end are only a single entry apart. Is this correct?
> 
> One think I wanted to do is simplify this stuff by getting rid of
> .end entirely. So I think this should just be '.start=1<<24' (or
> whatever way we decide to specify the input precision, which is
> I think another slightly open question).
> 
> So for this thing we could just have:
> { .count = 128, .min = 0, .max = (1 << 24) - 1, .start = 0       },
> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 1 << 24 },
> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 3 << 24 },
> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 7 << 24 },
> 
> + flags/etc. which I left out for brevity.
> 

Makes sense. I like this.

> So that is trying to indicate that the first 129 entries are equally
> spaced, and would be used to interpolate for input values [0.0,1.0).
> Input values [1.0,3.0) would interpolate between entry 128 and 129,
> and [3.0,7.0) would interpolate between entry 129 and 130.
> 

What in the segment definition defines the 1.0 mark? In your example
it seems to be at (1 << 24) but then we would have values that go
beyond the input_bpc for the last three segments.

How about output_bpc? Would output_bpc somehow limit the U32.32 (or
S31.32) entries, and if so, how?

Or should we treat input_/output_bpc only as capability reporting, so
userspace can calculate the possible error when programming the LUT?
Again, this leaves us with the question what the input_/output_bpc
means for our PWL entries.

Harry

