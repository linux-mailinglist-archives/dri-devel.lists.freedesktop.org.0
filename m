Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670744B448
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFCE6E8B4;
	Tue,  9 Nov 2021 20:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EBC6E8B4;
 Tue,  9 Nov 2021 20:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bta1lpSHhPVdPxkP2IjihdIovUwaniDXDpoOqjZpZT5/E9+JPGJ15R+yjlxNhtI8yl6ITB1u6NxxuA164egZ7E6Nw/uoa/smD8TDkWQRlm7AGEGrFi3/z2mepMvgli8CpV86Ux/rUUDZJPPRe0OdrtLHSxkdlaKY6CQhXr23GxmgsF6Ha6khZA8jUbfqAtNvks361ZIeWRdWAZ82ME6ONbs9qufct2ZJksd8Dqi7j83Mv0cFlym3At28Hiu6Zln+sRbj5+X47/p90KCdpoiR/U8xehznqHxt71fTMMdwBb6JPXVIk78iKQayoC8p7a/WeSeCdiHS6NFD5eG2sMQeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIZ7Y+MwmN9/9dRBK6HgH339PeNEPRBcIdAPFk2U1N0=;
 b=Rg0AWNO+0TxfipGXk8P1YsZtxkwqhcYJt/30CatXrL5/g3/GRrqdyhXf/ZA/FmD/pqPQxNf1Yto1uMKjD+xgNMpk21TGnLwsTef5v5CQGtifPxrJ0LEq1w8eG3ncuvb8THzxon18SdeWF72kn3260oVsvU14qhlqWdPzMU+dCrOD3akJqJtc3WMRFJLB54Md22uIRhQPY4Q2IZhLqJ4dDarDoPxy0fAfzHofAAXLFLcoVkJIV1KVF9rynes1GiSfg+whdiAXeqaMhu7ttEX29ggRP5bwy+4NivuuP1J7qiL16hCzP+WVwmFBq415OvVUviT7eL1BhDNkqJC+Ou7IdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIZ7Y+MwmN9/9dRBK6HgH339PeNEPRBcIdAPFk2U1N0=;
 b=Y6ji4V90mSVG4ZOxS1hzpNE5xjVxaU+3VROL8YOPDmSmxrj+sJPpFqR+Jn0B/SI1b2MTwzbGpMY5No7DoLa6ez8RV3wA63THvzqt0UDDtYRtVzDldo8LOkRz9rkHU8lcKqvXso+cV2gmEgbIEZWNZbPvvS+xm3LtLPe4GVJks50=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by SJ0PR12MB5407.namprd12.prod.outlook.com (2603:10b6:a03:3ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 9 Nov
 2021 20:48:03 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5%9]) with mapi id 15.20.4649.023; Tue, 9 Nov 2021
 20:48:03 +0000
Message-ID: <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
Date: Tue, 9 Nov 2021 15:47:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211108115427.5c3f162e@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::25) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 9 Nov 2021 20:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1304b1aa-86a5-41f2-1f7e-08d9a3c238dc
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5407:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB540765DCFF25C491FC6B0E568C929@SJ0PR12MB5407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pCNC9ybiOcTmzwVlnmGsdMMrUUAXXLTcV1Lu+PdAZL5LkUc9/cUTe+tqqA+ko7x2kWF6NWMuTDj9WNp97whgDdu92r2ZylFBBbd4AS2aSnAiPyzGtja2J4HvNQbl6N9uq9gGkvtiRZmALgdAdci5e9DnlgVRkWhBKt7odgxwzaybMcsKdyYDBk69OI0pamKwm7kI1QwGV9sBOikpSvKV2POHIfsM4SR91nkvIpoxAc5bTd6WLO9oLBVRFiq87XKqTGjpkJLAGkKhfGY9tMqkYJIfoOTJUt41XZ5XB+0/NeUOhAE/75iW98fwt3mIljhqU3x4Hhd6Xe/jnAd9ntL5hR/8Z02Jl+YLUjjVBAKLhL/fKeKd83Ww3QmHbKIm9ZQTckcrp3kAshKV5wynQmfvS34KnAZfPAEFssDA2u1Wax+4ZEdhuNBt1dNhLVzMbjEWTRO+GuCoSKzNBbdBbzTddRkCA1iYt3hKQEp5KJfmJL86R/K4CVzflPCk96b6oJS6XziMUWNAXWjDsb38C7zSMvGAyGvNROSNQsjrCXE0morxP9ExcJaFtCZ+rH1x5vgRcMpaKe8BQcbjyalps7Qf0mWd1OhP0RCvMtEk4amah+yfGYi64mGMQcvMTe8RfQ/SkELZZcHGGRkfQeQlnS9NZG4Zx3csobcswz6tGmugZ4yOIrDuX4P7977JupVamjmdxfx4GSH5zXbsHNNY2cIcjkg4LRo9IiAhOo6Lr7Ml/U/9vvgNZckBnImRp4HA6IIIp5goElAWxXxLpLLZ0A953IqbavlVS8OO7g69UbMLsDe5aVTKL7xT5Zoozn0g6+7FG+BH0PtWRTSTCvGT8Qkr2EvAV85GKmr84IKgUhBvIJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(53546011)(186003)(4326008)(2616005)(8936002)(26005)(5660300002)(508600001)(36756003)(966005)(38100700002)(6486002)(31686004)(6916009)(54906003)(956004)(316002)(66556008)(2906002)(66476007)(16576012)(86362001)(83380400001)(30864003)(31696002)(44832011)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWYyZFU1YVBMaVRrTEhFQTlQUnFWT2FIM2M0SmV4eWMxcGx3cVZ5QTdMNFFy?=
 =?utf-8?B?cGo2emVoVU9pOWdBZDNSS0xJclZFb1p4OHpMS2dwY3FlNmxlMitWdUE2bWhF?=
 =?utf-8?B?L25sOVd5WDJtazR5Yzd4Z3VmaTZLSCszcnJxL3IreUFVVzVjS1FDV1FNMFlE?=
 =?utf-8?B?dlBnaUsvSzVkVElNNVJab2RKTk9sV3N3ZVZVdWdpMlZqa00zUkV1eFlpSWVR?=
 =?utf-8?B?ek9teXFRTjAvUDA3SU5oTkRNTWdBbytDZ2NjVnZuK1F6WWZsdVNpbUF2eTZk?=
 =?utf-8?B?TVlobEphcnhuYVZCVkhKSUhiUDg1cWUvbDBKUmNQZnVFUkJjZjdUU1VLS2Y0?=
 =?utf-8?B?ZHZvSndjMGtndHVLZjIyUWl6Z20vL3Uza2tsZ0ozcnliQ0xrWnhzRkZZZ2d6?=
 =?utf-8?B?eGxVYU5nZnlweWtyNVB6bGN3NUptYTVqZXFKUjhHTlhlc2lYTmdqbXJ4eThT?=
 =?utf-8?B?NW1yVWgyTkZOOFBXd3k5dEZPelI4QklpYzJudkhQb2ZPdFBlVXQ3Z0RURHdL?=
 =?utf-8?B?VUcrUy9GajJjemNHQndHSmR2QWc4YXV2Z3lBVVZHQUtkRmpETWdNRnZ2aS9k?=
 =?utf-8?B?ZHdKMHdBSTRPNjdhZWJjS2pRS2MycnFOMWRtSndtRERBZ3dTSXR4YTR0S1lj?=
 =?utf-8?B?M2dZeXlDckFYclgvVEU4VWJvai9XMVlseEIyazQxUDFjN2VjWHJweFFTUm9S?=
 =?utf-8?B?L1ExOTRnUytaZmhSMklkazNMZHU0OThEWDBhS0Z6ZjV6OEl5Q0ppdEtEY3g3?=
 =?utf-8?B?UU5MUURQUHlCUDJDMkhrR0NISTZWWm1zcm1PYldzL0NBWU9uQWhBQUU2SEs0?=
 =?utf-8?B?VmVCRmxhdnJKNjg4R1ZMM0dDUDZGL3Axa2l3cnpFdm5KYkI3NTI3Mk1zQ3lB?=
 =?utf-8?B?aGg4TkdlWVB0VkEwcy95ZXI4Vm1VZm9Uazh0QlI1Z25TVHB3akJNWHREdWRF?=
 =?utf-8?B?UUFWZWRLQXlGSHVtcTNwcFM1eU9hbzVoaDQvaWJYQk1GcGJVZHliM1NaaUVy?=
 =?utf-8?B?TlYycVJUZ1pXR3krVFgwcTVtRUloMkJLckNoanFpb2FxUDkvSnVrS01Maytt?=
 =?utf-8?B?cGs3aUVVSjZKRkc4bEtWNmNXUUFUZUY3MHptcTVLTHZleUpRalpLNmt4R21E?=
 =?utf-8?B?VUlrTS9sTVVQVURnb3Fsa1lWUi9ZaGV5SmtlRXlERWlKajU2R0hXckwxNGVF?=
 =?utf-8?B?T1BlcXFCQ2ltUWx3eXdLZmpVaWlHTzZLQjBxZHpJR2ZvNlpRZnA0eFdzMTBu?=
 =?utf-8?B?c0tXWDNxUUJFbFFjellza3J6SHR0Qi9YaFNJbXEzVXRmVFhaS3d0VFRaREJS?=
 =?utf-8?B?UjJ0VHBwalFwRm9GRUVjUytDWkxrR0J1OWlBZEFHZkdyaEk2NUJGSW9rU0Vs?=
 =?utf-8?B?TldzV1NicG9NeXBMcTRXdVA5UFVtdDZoYmNEWStIN3pQSkNYakt3d1dBVXJX?=
 =?utf-8?B?SzhxWURpazAwNW5NQXM1M3VuYlJuRUhUeVdIVUtMNlVjM2ZHcFRyNkJlb1l6?=
 =?utf-8?B?K0Vnc2U5TVY1N1BVd0dlMUVqYmhvcDlBS3Qyd3VCTDlQdFpjODZ5dThyc1RZ?=
 =?utf-8?B?RWl1dElzSG9HT1ZEMHJhOEozcmZmTDRtQ2hHZHdvT0wyK3dRMERoQmZ3c3Jn?=
 =?utf-8?B?ZWVkaE1NcWlpZUMzRzV2WTkzcnNGMWd6M0w4aWdDME5IbU5tRTBHWm4yZGNW?=
 =?utf-8?B?L2htVkdOR294MWNFQ0NIck1rMWwwVjIrTS9SazBDcVltYnZTZXkydWJPYTJF?=
 =?utf-8?B?d3FBMHkrM0tKb0JWazNkWUFGeFA0dHRHaGo5Tm5VRHoxbFdDcUtrQUdnQzdK?=
 =?utf-8?B?ZU1vYWRzMUxjZHFXRDNXMXFoM3Q2SmZQbHc2eHh0V3Fkc3V1c3c3TWdyb2py?=
 =?utf-8?B?djBZV2ZJTkZidXVjSlk5YjUxS0JnMmpqN0F0aklPUTI1RnhBVGVoalU2NnFD?=
 =?utf-8?B?UTNqbytpQ0NwYzhicUJINjFYZ3BWZUN6NnhuSndWQno2V3lqUDJ2UDJHOWJI?=
 =?utf-8?B?dmJCUHFWd1FyVnNiWGptZ0ljWHFVNmxFK2JsT0JRRXYxckdVUlBrSWJxSngx?=
 =?utf-8?B?SFMxcTNVcCtXZTBKV1N6eHlwekpiMnFPNnV1YUFJUmpqNktoNHhPdWVqMUhk?=
 =?utf-8?B?dzQ3TmRORkVsY1FuS05wUkg3MFlLQVZrNmZKc29IT1JFTzVxbVd4Q1dYUG9S?=
 =?utf-8?Q?eBHtZbDSeVyCViVAG+lE7+Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1304b1aa-86a5-41f2-1f7e-08d9a3c238dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 20:48:02.9836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLebw6AjopEjHC5pKiDSsYMVX/nHzsKmIZsPC/YedB+SQlUJeOHr+Go7teLyHPUCT/YMlWru9AXR+a70MIoE5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5407
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

On 2021-11-08 04:54, Pekka Paalanen wrote:
> On Thu, 4 Nov 2021 12:27:56 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-11-04 04:38, Pekka Paalanen wrote:
>>> On Wed, 3 Nov 2021 11:08:13 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2021-09-06 17:38, Uma Shankar wrote:  
>>>>> Existing LUT precision structure is having only 16 bit
>>>>> precision. This is not enough for upcoming enhanced hardwares
>>>>> and advance usecases like HDR processing. Hence added a new
>>>>> structure with 32 bit precision values.
>>>>>
>>>>> This also defines a new structure to define color lut ranges,
>>>>> along with related macro definitions and enums. This will help
>>>>> describe multi segmented lut ranges in the hardware.
>>>>>
>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>> ---
>>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 58 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>>> index 90c55383f1ee..1079794c86c3 100644
>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
>>>>>  	};
>>>>>  };
>>>>>  
>>>>> +/*
>>>>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
>>>>> + * can be used for either purpose, but not simultaneously. To expose
>>>>> + * modes that support gamma and degamma simultaneously the gamma mode
>>>>> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
>>>>> + * ranges.
>>>>> + */
>>>>> +/* LUT is for gamma (after CTM) */
>>>>> +#define DRM_MODE_LUT_GAMMA BIT(0)
>>>>> +/* LUT is for degamma (before CTM) */
>>>>> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
>>>>> +/* linearly interpolate between the points */
>>>>> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
>>>>> +/*
>>>>> + * the last value of the previous range is the
>>>>> + * first value of the current range.
>>>>> + */
>>>>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
>>>>> +/* the curve must be non-decreasing */
>>>>> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
>>>>> +/* the curve is reflected across origin for negative inputs */
>>>>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
>>>>> +/* the same curve (red) is used for blue and green channels as well */
>>>>> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
>>>>> +
>>>>> +struct drm_color_lut_range {
>>>>> +	/* DRM_MODE_LUT_* */
>>>>> +	__u32 flags;
>>>>> +	/* number of points on the curve */
>>>>> +	__u16 count;
>>>>> +	/* input/output bits per component */
>>>>> +	__u8 input_bpc, output_bpc;
>>>>> +	/* input start/end values */
>>>>> +	__s32 start, end;
>>>>> +	/* output min/max values */
>>>>> +	__s32 min, max;
>>>>> +};
>>>>> +
>>>>> +enum lut_type {
>>>>> +	LUT_TYPE_DEGAMMA = 0,
>>>>> +	LUT_TYPE_GAMMA = 1,
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * Creating 64 bit palette entries for better data
>>>>> + * precision. This will be required for HDR and
>>>>> + * similar color processing usecases.
>>>>> + */
>>>>> +struct drm_color_lut_ext {
>>>>> +	/*
>>>>> +	 * Data is U32.32 fixed point format.
>>>>> +	 */
>>>>> +	__u64 red;
>>>>> +	__u64 green;
>>>>> +	__u64 blue;
>>>>> +	__u64 reserved;
>>>>> +};    
>>>>
>>>> I've been drawing out examples of drm_color_lut_range defined PWLs
>>>> and understand a bit better what you and Ville are trying to accomplish
>>>> with it. It actually makes a lot of sense and would allow for a generic
>>>> way to populate different PWL definitions with a generic function.
>>>>
>>>> But I still have some key questions that either are not answered in these
>>>> patch sets or that I somehow overlooked.
>>>>
>>>> Can you explain how the U32.32 fixed point format relates to the input_bpc
>>>> and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
>>>> the framebuffer.
>>>>
>>>> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
>>>> is non-multiplied)?
>>>>
>>>> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
>>>> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
>>>> be interpreted as 0x3ff << (24-10)? 
>>>>
>>>> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
>>>> the output value be 0x3ff << (16-10)?
>>>>
>>>> On AMD HW the pipe-internal format is a custom floating point format. We could
>>>> probably express that in terms of input/output_bpc and do the translation in our
>>>> driver between that and the internal floating point format, depending on the
>>>> framebuffer format, but there is the added complication of the magnitude of the
>>>> pixel data and correlating HDR with SDR planes.
>>>>
>>>> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
>>>> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
>>>> to represent that with the drm_color_lut_range definition.  
>>>
>>>
>>> Hi Harry,
>>>
>>> I think you just would not. Conceptually an SDR plane gets its very own
>>> LUT that converts the FB [0.0, 1.0] range to any appropriate [a >= 0.0,
>>> b <= 1.0] range in HDR. This is purely conceptual, in the terms of the
>>> abstract KMS color pipeline, where [0.0, 1.0] is always the full
>>> dynamic range at any point of the pipeline, meaning it is relative to
>>> its placement in the pipeline. If you want to use values >1.0 in hw,
>>> you can do so under the hood.
>>>
>>> At least that is how I would imagine things. With LUTs in general, I
>>> don't think I have ever seen LUT input domain being explicitly defined
>>> to something else than [0.0, 1.0] relative to the elements in the LUT
>>> where 0.0 maps exactly to the first element and 1.0 maps exactly to the
>>> last element.
>>>
>>> I'm of course open to other suggestions, but having values outside of
>>> [0.0, 1.0] range in the abstract pipeline will always raise the
>>> question: how do you feed those to the LUT next in the pipeline.
>>>   
>>
>> AMD HW defines the LUT addressing in floating point space and allows
>> for addressing beyond 1.0. In fact on other OSes our driver uses
>> [0.0, 1.0] for SDR LUTs and [0.0, 128.0] for HDR LUTs.
> 
> Hi Harry,
> 
> that sounds like some kind of absolute luminance encoding. Very much
> like a PQ system. PQ system is very different to anything else, and
> fitting that with a relative luminance system (which is everything else
> in existence that I know of) has... things to be worked out.
> 
> I recall seeing some calculations where [0.0, 128.0] mapped very
> nicely to exactly the theoretical absolute dynamic range of the PQ
> system. It seems like that range is specifically tailored for operation
> in the PQ system.
> 
>> There are color spaces that extend beyond 1.0 and even into the negative
>> range: https://en.wikipedia.org/wiki/ScRGB
> 
> scRGB is really special. It's more like a pure mathematical
> representation than a color space. Just like you can take a color
> triplet in any well-defined color space, and multiply it with a totally
> arbitrary but invertible 3x3 matrix. You get totally arbitrary values
> as a result, but you are not actually changing anything. It's just a
> different encoding.
> 
> scRGB has two peculiar and different properties.
> 
> First, if no color component is negative, the values above 1.0 simply
> extend the dynamic range.
> 
> Second, if any color component has a negative value, that extends the
> color gamut, not just dynamic range. You can represent for example a
> red color out of your gamut by using slightly negative values for green
> and blue and compensate for the "negative light intensity" by
> increasing the red value above 1.0, without actually going outside of
> the "original" dynamic range.
> 
> When color spaces are usually defined, the properties are chosen such
> that all color components will be non-negative. That makes them
> intuitive, particularly with additive color models (RGB in particular),
> because the concept of negative light intensity does not exist in
> physics (but it can be emulated in color matching experiments by adding
> the negative component of the matching color as a positive component to
> the reference color instead).
> 
> Then there are the considerations of color gamut and available dynamic
> range, which are inter-dependent and together form the available color
> volume.
> 
> Traditional color management works with relative coordinates where the
> per-channel range [0.0, 1.0] defines the color volume with relative,
> not absolute, dynamic range. You also were not able to send values
> outside of min..max to a monitor, so might as well map those to 0.0 and
> 1.0. One could say the color volume definition is implicit here, with
> the added confusion that you don't actually know the absolute dynamic
> range (cd/m²).
> 
> Nowadays we have color spaces like BT.2020 which are larger than any
> actual display can realize. Therefore, it is not enough to know the
> color space to understand the available color volume, but you need
> explicit information about the color gamut as well.
> 
> We need to know the available color volume to be able to map content
> color volume nicely for the display. Likewise, we need to know the
> actual color volume of the content too for a good color mapping.
> 
> If you use scRGB, you lose all intuitiveness. You have the concept of
> negative light intensity which does not exist, but it is used simply as
> a means to represent a larger color gamut than what the primaries of
> the color space would imply. It can even extend to imaginary colors,
> colors that do not exist: there is no light spectrum that would result
> in that color in the human eye. (BT.2020 may be big, but all its colors
> are real.) So you need to be able to handle arbitrary color channel
> values, and you need explicit knowledge of the color volume you are
> working with.
> 
> Essentially I think this means that one would better be using floating
> point for everything, or maybe you can get away with formats like
> s32.32 which takes 64 bits when a 16-bit float might have been enough.
> But that then ties with the value encoding (linear vs. non-linear), so
> one can't make a blanket statement about it.
> 
> Anyway, all the above is for the userspace to figure out. I just think
> that using the range [0.0, 1.0] is very natural for most workflows,
> even HDR. I don't see a practical need to go beyond that range, but I'm
> also not against it. One can always program the [0.0, 1.0] range
> explicitly via KMS.
> 

I agree that this should be for userspace to figure out. For that reason
(and because we see OSes that do funky things) I prefer to not limit
userspace to [0.0, 1.0].

> The choice of the encoding at any point is always arbitrary, as long as
> it doesn't lose too much information. The important thing is to be
> consistent in a pipeline. That is why I'm not really concerned about
> what range the abstract KMS pipeline is going to be defined with, as
> long as it is consistent. An example of inconsistent pipeline would be
> to allow arbitrary values in a LUT output, but defining only [0.0, 1.0]
> input domain for the next element in the pipeline. Since any pipeline
> element could be missing, you can't rely on some elements acting as
> "sanitizer" but any earlier element could be feeding directly into any
> later element.
> 
>> I don't think we should define the LUT to be limited to [0.0, 1.0].
> 
> That is fine. You get to define the UAPI and semantics for that, and
> you also need to retrofit the existing pipeline components like CRTC
> GAMMA and DEGAMMA to work with it somehow or replace them. You also
> need to define how arbitrary values get converted to the cable.
> 
> However, what happens if we define the abstract KMS color pipeline in
> terms of supporting arbitrary values in any point of the pipeline, and
> hardware just doesn't work that way because it happens to be using e.g.
> limited integer arithmetic?
> 
>> If the framebuffer is not in FP16 the question then becomes how
>> the integer pixel values relate to LUT addressing.
> 
> Traditionally, and in any API I've seen (GL, Vulkan), a usual mapping
> is to match minimum unsigned integer value to 0.0, and unsigned maximum
> integer value to 1.0. This is how things work on the cable too, right?
> (Also taking full vs. limited range video signal into account. And
> conversion to cable-YUV if that happens.)
> 
> If you want integer format FB values to map to something else, then you
> have to tag the FB with that range information, somehow. New UAPI.
> 

On the cable we send integer values, not floating point. AMD HW uses
floating point internally, though, and the PWL API defines floating
point entries, so on some level we need to be clear what the floating
point entries mean. Either we document that to be [0.0, 1.0] or we
have some UAPI to define it. I'm leaning toward the latter but have
to think about it some more.

>> As well, LUT entries are defined to be U32.32 fixed point, also
>> allowing for entries much greater than 1.0. If those are programmed
>> as entries in the input (degamma) LUT how will they be used to address
>> entries in the output (gamma) LUT?
>>
>> Maybe we want to say the actual input values are being used to
>> address the LUT entries? But if we look at segment 1 of Uma's
>> d13_degamma_hdr definition we see that the range of 0 to
>> (1 << 24) -1 is covered by 128 (1 << 7) entries, so the range
>> of 0 to 256 (for RGB with 8 bpc) would only be covered by 2
>> LUT entries. So this interpretation doesn't make sense.
> 
> FWIW, it seems Vulkan has a long list of how to interpret each
> (integer) pixel format:
> https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#_identification_of_formats
> 
> Essentially NORM vs. INT.

Thanks for sharing.

Harry

> 
> Hmm, I wonder how SNORM actually works. The integer range has one more
> negative code points than positive code points, and zero. So if zero
> code maps to 0.0, max maps 1.0, and min maps to -1.0, then the
> conversion factor is different for negative vs. positive values?
> 
> 
> Thanks,
> pq
> 
>> You can see, I'm still confused by these definitions. An IGT
>> test would help explain the API intentions a bit better, though
>> I would like to see more precise documentation.
>>
>> Despite my confusion I think the segmented PWL definitions are
>> a neat way to concisely describe the HW capabilities to
>> userspace and a concise way for userspace to provide the LUT
>> more precisely than with a uniformly spaced LUT.
>>
>> Harry
>>
>>> Yeah, I have no idea what it should mean if an FB has a format that
>>> allows values beyond [0.0, 1.0].
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>   
>>>> If some of these questions should be obvious I apologize for being a bit dense,
>>>> though it helps to make this accessible to the lowest common denominator
>>>> to ensure not only the smartest devs can work with this.
>>>>
>>>> Harry
>>>>  
>>>>> +
>>>>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>>>>>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>>>>>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>>>>>     
>>>>  
>>>   
>>
> 

