Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0644B502
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 22:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34726E43D;
	Tue,  9 Nov 2021 21:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55106E424;
 Tue,  9 Nov 2021 21:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKWIt4xGSQp4tNTvF5/UVWgLJG3WwPwy3HiO2Qy9qQ2ZFMjdJv03vT3/S3FWttxUBS7cnsLOwH9z6GaO+0b7xLucirJMP1mTciGZ9+APplE90V8jh4BA69Jb3PFyXsrSBgBazTz4LM/curIiHkdy+gVlg7/2umEsAJqVNuojDwtLvusDhTRF1N8HlNXzPlcuh3YPDRaLZ9oZxImhhfV+15BjPKPMzlNLeuCWBRBwXysmeKizhSWeBziyFm1bT3Qtp3uH0effNt3DY/MvEj7w/EIusr3+okEqA3FCoy05eSSnQDwHHYp8F0ge5xrwTR0KypFdCyrBL20wzdgluYSZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ/OdiRYGr9W88jciPPOzpHI36s7Tx8rHzZr4cTclD8=;
 b=Q3Io7BCw9xRUpjH+ssWXpCKuu04+SAgw6pzfi/7CxhxAQMdcDNIappdjxrw9tiaP286a0W347ldt2WBGyE2X00HnZ0pfdoh3eCtHb2byvQISumt05vBjTqWLj8ISBbBWJ18LWotvGbOgiNqPojYt1lHm/JmCwLhPPAOXiBMnUDVr5F4VmRVPwO1nhifOkJD8hbZVUb/rF/bd+y8lcFB7Z06vYT9xrDD3xM6xgQPIO8MGqWJiEGdu4QpeMmwscXSWKeJ2Mx3fJF6wIk06RNSlAECGP07xlzOryHsA4xLtvEN2gOuJ8fnJdqXpKXRwZSL7kyyp+CHV6Im6wpquUzRByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ/OdiRYGr9W88jciPPOzpHI36s7Tx8rHzZr4cTclD8=;
 b=XtTz6hQCzVt4Eu/reT7pIToxsATOZrSko78oWAC9c3yH3jGM4HJyEMfs9efs5bdFeypm07b+vYVyuvUj3rpcq78ig7CquOn496DxvlK89l8kr0Vk+h9siqOlLy0TAVfynK6YanvONDafwpdFpn0HRkPUaufnL4biNa7+BhGyWQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SJ0PR12MB5471.namprd12.prod.outlook.com (2603:10b6:a03:300::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 21:56:34 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5%9]) with mapi id 15.20.4649.023; Tue, 9 Nov 2021
 21:56:34 +0000
Message-ID: <7bf68949-dc41-1128-8e4e-93c0ce245f23@amd.com>
Date: Tue, 9 Nov 2021 16:56:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com> <YYUqwCBQwfL0SABl@intel.com>
 <5c7b65b6-69ed-2259-0edd-cf04cffa9231@amd.com> <YYrsErnyQ6oOFDps@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <YYrsErnyQ6oOFDps@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::19) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 21:56:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18a65fb-366e-4852-3722-08d9a3cbcbaa
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5471:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5471B33F18FA82D6859BC51A8C929@SJ0PR12MB5471.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+/imIQ3RmnUqcrPpxqxPFjhddFip0829zADX+pUxYY7Ic8Ri5CVKkHVWEw1g6e6EjNdWLv7HBAvyKHw+32BP0iiMGzFukgjbHVCXSQszdaUkB08bJFWxlUxSJqWkD4Vq/g8jdb3SMa5Fz8feFuTG9fRHxlekCEgHVJ5DeIQWT4uCVYO1pulJr3vGr6jpsJtF/oRciWQePLZMoKlw60d3bviYqqf4FLCm3N4slGUATcHoKuOpxVoe/iRMb/0XpXCmv8PA4w3u9nJ1ZYRMc7cL1lpQqaZLnFPXQuPV1PXlwcRzrE0296PxF4Fz/5jP9El4ggwA2Y4o8tnaUdcYvLNiG5e2QVxKOTiXl36zTZPDtG3zX8ygNEoXRzpko08hMcBhrCgV5rh9ENsY9j2jUCWdRCnz9tRJ/2pdmODvNkuwKOjcBDE5j2QKlRBa2Y18WkapB8nwtmSjOhgqNXXasYDryFqme5IVSW1LBQOhBSb5wrU1ME2Q0ZJAgPmIjxdAKONsSX335qtHWMWYqTGvxGifHNzoamsawIAaCjDoNbwIR+LflX5O4NxJIaJaBtVAQCHSCfVqcZmMzXvST/Jcv3WsdBTu72cntXsxBDQbshOMjA1Cr9jThqk/19MNEpYEAflvH0XZ2odTsM68j8TPzJSqxw9ofFl7ew0wUuOqypvxw6H+a/y8eurJiqziUVX6FT7CahVy07vnzFOvUkptHVZgekb0GrF4WYzi0IOUI7WnpuhLw5Gg45x3gmvSRKlSc6W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(2616005)(66946007)(66556008)(38100700002)(956004)(4326008)(2906002)(36756003)(44832011)(5660300002)(6486002)(31696002)(186003)(508600001)(86362001)(66574015)(83380400001)(26005)(8936002)(6916009)(8676002)(31686004)(316002)(16576012)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWlja2tUczJKVWFtOXhoTWRibjJ3V09UNzJLTXlhNTFXODFUTC9oWmpXRWE5?=
 =?utf-8?B?QTFpelJKNVMzalkrRm9wZ0kvejU3aTYxVkFaVnYyNGtobnZFeXBtVE5sZjlS?=
 =?utf-8?B?S0VEczBmV3hZYVJ5QUxlK1IxSEdYK1doazJDUEdtd1VtcVY0ZDg5MnB4QkZy?=
 =?utf-8?B?ZXhxK2FOZUFyaDlxUUFlRE1vQm1xVnJwUFk0alFQckNmNEZnSDRPYlNMZGZy?=
 =?utf-8?B?NytBY2w1K1M3Q29ybmdIbVVSSnQ0YU1ObzhSNjg2a3hoUGRJMTQ1R1FWT2tL?=
 =?utf-8?B?cEJzeWFaNWM2TUUzVWVwQWRjVlZRSk1jSnJGUTZFWFI2UU1XeC92WGorY3Bj?=
 =?utf-8?B?Qi90eU41YURGcU9LNVFpTGZQY1VXUktVenYyWlZXeXQvWjY2QmlFK1N3dHR1?=
 =?utf-8?B?UTNSYVlUbkhNZStNR0JRc1pkbjNTaTlGWUZFZTBwaUtmb0lleWI5dE9sMmhT?=
 =?utf-8?B?cHRRZ25PRElPR1ZnVEpDcWhraTlSand6WVRLb3NrQWRwNytlZnRMN0psa2dV?=
 =?utf-8?B?VDBEWmJDanM4eTNZL1hqVGorQlJKYldrbGVyc1JIQnZ1RHpwUjNqbzNURHM1?=
 =?utf-8?B?QWlFY1Jhb2Y0cFpIRmdPR2NiK1dMTjIxOEp6R3U2OHF2akQ4YkhHYzJSTWlG?=
 =?utf-8?B?c2wveU4wZVNHTUtlNytWWDUwcER3UmhjbjNwOGQreXh0ZVhiTjFaQy80WHdU?=
 =?utf-8?B?WnRvRUxmNGxKek5DU2dJT2c5eXk2ZUNqOEp1Y3JGbEo3cExENHh5N0lIcFor?=
 =?utf-8?B?RStZRkJJbHM1REFlVndLb3h3bzVFdGxRSTJIT0crM0lGanN6aU5kbW50TkRQ?=
 =?utf-8?B?VEpHczVZSXVLVTVwbVVFbGdmQVhaUkxyQjFDRkRRd3ZGblhqQm0xRlh4Sllu?=
 =?utf-8?B?ais3RU1yck5vb3pGU3VwVzlEUkptWWlhYTRHd0hkdElFVktWbG9LUGpQWWl6?=
 =?utf-8?B?NDZheTArNktoY28ybnNINHYyMnhUcTBzRzQzM2R5VVh5WnNHcWQ3cWxER01S?=
 =?utf-8?B?dmVNWC95dG9OeTY3d3FXdDAxR3I0RXdIOTB5VElpWDhGT1JuUkJCWnhEQ2x6?=
 =?utf-8?B?UjNRczlNcktVa2pNN3UxSFRrMStaWkpPNFA0SkZXQWJkMG1RS1ZtTlNMWngx?=
 =?utf-8?B?LzB3d3VpVmRwVjNIcDdDQ2R6NldZMUl2anBVU0dpQnNNWWZpbGQySW1RZmpB?=
 =?utf-8?B?WUM4STR6Q3BaVGkwSGpxRnU0R0hRRVJFMlZFUGtEcXN2ZkxFYUtNVHF2bTlZ?=
 =?utf-8?B?ZHZORDlHWExmemRxRk5pYloveXFLbGhvZllVczhGNG9NVXphOW5SYTRKWnV1?=
 =?utf-8?B?SHlVMk9pM0ZwWDhla3FrUFV1MlQ0M1NXWTcwR3ZMZHdzVnQyVVhmSlQ1SWVC?=
 =?utf-8?B?N24xYVhsK0toRlFyWjhnV1RXQlF0MytGeTJlaW1QWGVWZVlmVVFkd0M0Y0pD?=
 =?utf-8?B?TkdDMmc0TFhRdkdrNVAwRnJTWXlHM1ZlQTlxTnBob0twZmN0Wkt3cFpmbi81?=
 =?utf-8?B?amxqVHc1OEh3QUdKejV1YncwUGlqckJUdEM4am5rMjFWYjJSaVNJUVI1MzIy?=
 =?utf-8?B?MFhKeXp6QTZLVTBDTE41UXJUYWR6TENzNHV0d1lManR1OWFyTmJKZXg5QVZ1?=
 =?utf-8?B?c3VvQ0x6UnRnZDVWR1BEc0U0U0RjalBvZTJvcG9pYUNWSU1HK3J1WlNpYXU2?=
 =?utf-8?B?Z0l2ZDI3RFFNNkp3dytoMFkycHplTm9VWkhBcm5YWUhYWEJNV2tsT05ScFBr?=
 =?utf-8?B?cUsra1d0VDl0aFVWK0JDUTRveVMwbjA1bzhlTzQ1MFVLRnEvdlJEYUttQnBW?=
 =?utf-8?B?S1Z5RXJMUHQ5UmNVT29NUU9OeElwM2EvZzVVSkpvOHFSWWFiUktMUWt5eUU4?=
 =?utf-8?B?R20vRWRWREdTWWtqeWdORm1YYmxKdEJKV29kcUJUTytNU0JTTit3WWtqUlh3?=
 =?utf-8?B?eVVqSk5zL0xZVm5SM2pDcFBvUjlVV3N5bnhjeWlwdnppUWQyOWdaSlR6NFFL?=
 =?utf-8?B?S01sbGhic04rRFJSd2hRR0V4a2FxSG94RTlmWjN6NE9CS1FzcmxqQzZneDE4?=
 =?utf-8?B?Y1NZczhwb2N0bllWUXRCR2c5Q0c3NytpUE5aVkYrb2NBNVlIc09zWlh3V2wy?=
 =?utf-8?B?blJGcUxmaUJBMjJORU5GOHRIL1YxeVNBeEVRZzEyVXo1LzVxUmpuT3BYKyto?=
 =?utf-8?Q?hgvkXXcYI+75FSL+qxl93Mc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18a65fb-366e-4852-3722-08d9a3cbcbaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 21:56:34.2215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt5jxHect8eVy0e7jyNLJ67jhYJ+nRIbUFEP5L2f5ruBKiK/0fhIKGYiEdp673H7LhQrMgwvV6zGOtRoMUvdBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5471
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



On 2021-11-09 16:45, Ville Syrjälä wrote:
> On Tue, Nov 09, 2021 at 03:19:47PM -0500, Harry Wentland wrote:
>> On 2021-11-05 08:59, Ville Syrjälä wrote:
>>> On Wed, Nov 03, 2021 at 11:10:37AM -0400, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2021-09-06 17:38, Uma Shankar wrote:
>>>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
>>>>> planes have different capabilities, implemented respective
>>>>> structure for the HDR planes.
>>>>>
>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
>>>>>  1 file changed, 52 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>>>>> index afcb4bf3826c..6403bd74324b 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
>>>>>  	}
>>>>>  }
>>>>>  
>>>>> + /* FIXME input bpc? */
>>>>> +__maybe_unused
>>>>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
>>>>> +	/* segment 1 */
>>>>> +	{
>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>> +		.count = 128,
>>>>
>>>> Is the distribution of the 128 entries uniform?
>>>
>>> I guess this is the plane gamma thing despite being in intel_color.c,
>>> so yeah I think that's correct.
>>>
>>>> If so, is a
>>>> uniform distribution of 128 points across most of the LUT
>>>> good enough for HDR with 128 entries?
>>>
>>> No idea how good this actually is. It is .24 so at least
>>> it does have a fair bit of precision.
>>>
>>
>> Precision is good but you also need enough samples. Though that's
>> probably less my concern and more your concern and should become
>> apparent once its used.
> 
> Yeah, for pipe gamma we have a few different variants with
> non-uniform spacing of the samples. But not here AFAICS for 
> whatever reason.
> 
>>
>>>>
>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>> +		.start = 0, .end = (1 << 24) - 1,
>>>>> +		.min = 0, .max = (1 << 24) - 1,
>>>>> +	},
>>>>> +	/* segment 2 */
>>>>> +	{
>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>> +		.count = 1,
>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>> +		.start = (1 << 24) - 1, .end = 1 << 24,
>>>>
>>>> .start and .end are only a single entry apart. Is this correct?
>>>
>>> One think I wanted to do is simplify this stuff by getting rid of
>>> .end entirely. So I think this should just be '.start=1<<24' (or
>>> whatever way we decide to specify the input precision, which is
>>> I think another slightly open question).
>>>
>>> So for this thing we could just have:
>>> { .count = 128, .min = 0, .max = (1 << 24) - 1, .start = 0       },
>>> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 1 << 24 },
>>> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 3 << 24 },
>>> { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 7 << 24 },
>>>
>>> + flags/etc. which I left out for brevity.
>>>
>>
>> Makes sense. I like this.
>>
>>> So that is trying to indicate that the first 129 entries are equally
>>> spaced, and would be used to interpolate for input values [0.0,1.0).
>>> Input values [1.0,3.0) would interpolate between entry 128 and 129,
>>> and [3.0,7.0) would interpolate between entry 129 and 130.
>>>
>>
>> What in the segment definition defines the 1.0 mark? In your example
>> it seems to be at (1 << 24) but then we would have values that go
>> beyond the input_bpc for the last three segments.
> 
> Yes, input_bpc would define the precision of the input values (.start).
> so 1.0 would be at 1<<input_bpc. Tne range of input values is allowed to
> extend outside the 0.0-1.0 range.
> 
>>
>> How about output_bpc? Would output_bpc somehow limit the U32.32 (or
>> S31.32) entries, and if so, how?
> 
> output_bpc would define the actual precision of the output values,
> so again 1.0 would be 1<<output_bpc, and .min and .max define the
> min/max values (which can extend outside the 0.0-1.0 range). The
> alternative I guess would be to not have .output_bpc at all and
> just have .min/.max be s32.32 values. Though then you can't tell
> what the actual precision is. Same could be done for .input_bpc
> I suppose.
> 
>>
>> Or should we treat input_/output_bpc only as capability reporting, so
>> userspace can calculate the possible error when programming the LUT?
>> Again, this leaves us with the question what the input_/output_bpc
>> means for our PWL entries.
> 
> Yeah, I mostly thought they might be interesting if userspace wants
> to know the exact precision. But not strictly necessary if you want
> just to go generate a "close enough" curve. 
> 
> What's PWL?
> 

Got it, I think.

Piece-wise linear LUT, i.e. a (usually segmented) LUT that
linearly interpolates in between entries.

Harry
