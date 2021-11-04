Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017A445746
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB526F9DD;
	Thu,  4 Nov 2021 16:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2059.outbound.protection.outlook.com [40.107.100.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364966F9DD;
 Thu,  4 Nov 2021 16:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayMltZoXDc1uMIwx3Puo4Cx1v7CM/Bd1zRCu7qrbEICi9ClxMc5QNRxFVDHoWZo4X+QwI9u3JZI0XV0MUmBipl4R7fdx+KP3MOimbZ9VgTDG5GBYAplgDBOZAoj1Pf8O9rZpcJhFlhvL/eOFw5kpAZtMDFtGnKmmK/BrvA6Ea/x0zfK38FYRAFZNCTBHOIm/mRaK8qM2LUQof8d37VxEL0Ry9sl57ItptP3MyUBJVYba3omeCPG3z/pIvx3EEAQR+O5OGFLWyP/3Okyzl/xVDZVQCur+3o7cap7RQbwi22qUSthK+yRej7p98hNv1gmf6ZJf5mrAHuRnbWDJCF3nNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ7An+tEZF2F8HpjAOr7H9tDesAdoB7N2ILZEEM6KNc=;
 b=aeK6Yqa5RuSa1cz1IOoilsyxVdABiW/RQ7hqgNx65Dvx1hTRoRUTgMXBSGWOmTiffDOyaT4aKXnqhHRVSXBOZoK3uG/g47O6KpF7EFJ4YaRbBvRw9NXwGHWyI4gk89hNNqYzATQi5tkNe6WrXO6KpZJD7F7e+D7SVQEUR2LMjrisQl2HGGxXC7eIClelxVzhrhSzwr89F22tlnvx3K763EzzgvSgQ3P91PqLlPJCrS43EPglmIOteMbdSgwtjIGrj/hme18FC5Uw56vzZxBR32Eth/py+VoK8W2AtxUu1sEqCLTDLyHd33d+Nti9vK6KchrzIXKfftIXjEL2C4QiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ7An+tEZF2F8HpjAOr7H9tDesAdoB7N2ILZEEM6KNc=;
 b=AQMOF4UjoDOVhZfWI+nAr2y00VzyhSksoASlcydUjYMHcR99Gx6aN44qrbndbYx2McOkt7w2S3bwdgmZ7bkoAQsXWbLeIhwQvCQZV3ERC45YZGOGaL0VyY+OSkuww+d5O9DRfIaxULv440Mt60XLWaLMZxnqqCSV2PIbfXg8c9c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 4 Nov
 2021 16:28:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.019; Thu, 4 Nov 2021
 16:28:00 +0000
Message-ID: <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
Date: Thu, 4 Nov 2021 12:27:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211104103827.2cf48bb7@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:68::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Thu, 4 Nov 2021 16:27:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996e7dff-5d72-4906-f5f2-08d99fb0116b
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5444F37201BE6D1FBD1E3E9A8C8D9@CO6PR12MB5444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcR072M/rCuattkcWA/6HerUNbb92u7jvPwfqWzWrgTZgmW57yxhLylVzH25wmgEpGHqgyd2HwBWME4XbgJOKXJN5NTDw5Q96qSgCimJs92BWv4rcWRHJ6Mv4Jk++Fr5kJemQvQH2ItglutWnlIvrUzdRvsBgnx2Ej8l+KYXVfq+m/QCjwA5VB0N67nQ4aYF3h4ZtNAocYDP79XgaK2x5rkiussazhZbbOD1a30uRjoaOAWPGd22YrlURpfdQSteCwJSkWrM2IMSmECLTl8NPZ8VGRx9jPFb4nPp1h22e0uXk1lnYoLyZhv4mwxO05MN8uxxZuERup8okIaEQpuND3xESgdLFys30PxWu0LT5QoSbH1s9e+pM/S+CP6+xHcVi89IwsIJvMKUL/BUkT6vvHIMcLpPIoyA7a1i8RW3qGyXwbZugeqbaLfAWzHsdc6zx4TPbGMxeCzCXFWKrmqe0USY1LES7np8igS/eNQnNtReHYjL2rzkNLTA774+sdStY7SnHTHk0CEK0BwTqqYdVGPd+owtowo0XOp8NymUrJ2Ti/9AaPVgfRn7e3bb2+Nm5GoVghlyJK2wIIro0wCYNyrE9ei48R4cHbcR0nlDjW3zTg5MBSCN38S3liIhzY0Yzk0PLw2VkI/bsqhBs+bOxHbWXNlrq4tYc7356ob4sVc6eOmsyqo2XuPwWJrl7guRiut3r1x/B2qMdnAl2rXAmMPp8jbtEPuH+LfuD5jQZ4Absk6WxJANWLR0tQQJH7x/M3rkK0W2+JKp8z/SYf8x1V57R9n5WZIuyfWyYEeyGSZReisfoaNF5Mi0tMkiQ+G4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(53546011)(8676002)(6486002)(26005)(66946007)(508600001)(5660300002)(186003)(66476007)(66556008)(966005)(38100700002)(54906003)(6916009)(956004)(2616005)(31696002)(83380400001)(6666004)(8936002)(4326008)(2906002)(16576012)(44832011)(86362001)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZyL1RMUVJyejZ5Ynh3QWYzb3J0Q0cvbzBVMEpwSjFIWlIwVmZkeWx2K09v?=
 =?utf-8?B?UGNKUmdnYjQ2cU5yUC9tUUpyM3JiUTNQU3hZZHBqTmlML0tvY1NjTkNReitw?=
 =?utf-8?B?YlFKVUtBZVhxSkNMMlR4SG5EUEpHV2FRTnVYOWhXTUE2Sm9MTzEzS0FZMTQ3?=
 =?utf-8?B?WktGbjdiZFR3N1NBTUp5a3h0ZXA1UlgzSXNqb3VvZTJGOGp3UElvV2NFdVh6?=
 =?utf-8?B?b3duZG1jWUVxdVY1MFJLSXBDTFM5UnltVzF6bjBJQ0gyQVpFTzNGMEtWclNH?=
 =?utf-8?B?aENOVVprNEJwd09ydWR0TS9YR1ZEeTU1L20rWVpZc2UzWmttYUQ2YmRGZk5S?=
 =?utf-8?B?RlpBTktKTlhoZTZrUmVBZ2JtK0grWW9rbUxyeUJPU1l6RkNLWk5VeVlybysv?=
 =?utf-8?B?RWxlb3NydFlYMUNBSElVZmJzOFRJd1dCdzNXSkI1Z0tWK0lycU1uZmJabzN2?=
 =?utf-8?B?RlJDbHFTMDMrUDQrYWhOSTlYcnFHdkRtSTlPM3JyT3YwSjlGSms0UDFpM1Bl?=
 =?utf-8?B?bDQ5dzRXYVhQYlRHcFF4NnN1MktqeFZjSmsza2c1cmdpYzdqdi9tMFhUaWhB?=
 =?utf-8?B?cjdDT21RemVlYnA3dCs3aG81cXd1bW9EZDI3ei9yN09lUEx0K0JxYmxoNTA3?=
 =?utf-8?B?aGhYT3V5SFMyM3dGVXF5YVgxMXE0SURUL0VQZUxiOFRrandHOTJEdmJCbEtZ?=
 =?utf-8?B?UGlNbGt0eHhFVVhJY2Z2L29ZQkpiV291c2JzRWRQRlMrZFFHN3RscStZZmND?=
 =?utf-8?B?dmNkek9HZ3lBN0ppNkIxVWtiSWcrbVlsUnNvUVBVWGdUeGVNeTREZStWbDJG?=
 =?utf-8?B?WjBMY29SMnRJQVZLYmlZdFB0NXJ5SkVGMDJydHNBTCswVUdzeldaaTR3M3gv?=
 =?utf-8?B?OWlDZ0dCTW1xZ2NFYzJsUzRhN0VIREpSalFSWHIvTXIrMTBrNWJVMUlnQ3Jl?=
 =?utf-8?B?bjJWQnd4NnBzTG41OFoxcnJ1S3BNMENDdlpFTXV1a3NwdHZvV1RPRjhxTFdx?=
 =?utf-8?B?Zlh3R0xtQjRBc29jdVMzbWNVUEsxSFJEVG9kL1UyTWJOUU80K1BtWEtYZWVN?=
 =?utf-8?B?bmEvUHdmU1d5N0Qybk9MeDQvRGFxY3ZFYWYzS3kwVHNzeEFYSm95SmJ2Wngz?=
 =?utf-8?B?enhqN2Z5dHNLMmlTc1BTenB0QkFpTmd6THBPUjh5V08zdVlPc0tiVHA2YmdQ?=
 =?utf-8?B?QW1wWUNYZW5qVC8zQ0ljTlZGY1RhQTNmKzJETkI3NkFsRHo1M3lPeEdSc2xy?=
 =?utf-8?B?RUF4OFE3QmpXby9hbFl5eEJ5cnV0MmZJYk9tVW1tbnZwVnZlSnErY2NhQlhW?=
 =?utf-8?B?dGZIVWQ0ZForQVpmb3ZxUEJYT0ZWRkVxY1pFZUhGeXMyYmU5eWJZQnFEQzJk?=
 =?utf-8?B?aW0xNTlKQWFZbXRuRFl6OG5kZWZLK2o4OWV0N1ZUdnFWU0RSaFJHVFNsV3dX?=
 =?utf-8?B?RVNGa00zeFNDN05NTVpuVHVBOVlZR2VEcDlGY2tMVXdhdWdZN1dJVTlVQkVR?=
 =?utf-8?B?Q3F4YzJ4ZEtIOHFFUS96NHh0RmpQRnI0aTJqbTUraTFXM3lyZExHTUZRY0VD?=
 =?utf-8?B?RURIY2ZPMVhhVVhhTFZPakFlR0tHUGxiSU0rSFphMUw2cWVqZFdiVFRHd0p0?=
 =?utf-8?B?NjZJYjRTUGF5MnphTU9QUHBLY2NuT3RaZTR4MVQ2aFhMN3JpVlpOUkVzZEMy?=
 =?utf-8?B?dzVxS3FWY01xWkR1bmxreGM3MEFJV3pXbTBSaE9wMHV5YnhhSHE1bGMxaUE4?=
 =?utf-8?B?Q0QwbXE3b0NRZjBUZzJMVzBCRk5ZYzVCRG94RjhkdkdQOVJ2TzFzNWR4aVJr?=
 =?utf-8?B?QTZjdGlPWGkyaVVJR0poamZUSEl4dS9rWmV2Qnd1NzV4Y2FKanFOSlFnVmxC?=
 =?utf-8?B?SCtCVGREZGdmMDQ3Q0crZHQrSzRlVnp3aDExV1ZMMzNWZ3dnZzRSbzRSQ09s?=
 =?utf-8?B?QWF2cTRXM3IyVy9zcWNVdWRuRGcvTWpaTkhaY256NlNLOVF2VjZVbnJlOTk5?=
 =?utf-8?B?UjhxbUs5b25lM2FCVmVWNHV1RldEQWdWeHF4NUdkVnRRUmtOeGtlczh4OFVq?=
 =?utf-8?B?ZFBRT3diNm1VbWZEdk1heW9oK3N6MUc2bm9YZjY3OHNrNkZkYUF3Ym9vNXYr?=
 =?utf-8?B?MzJFUnEwRWxNd1JKbnpDQjdZT2JUYnQ2cWtIVUNlaTR3Y1pWZUhRUXhKWFdt?=
 =?utf-8?Q?BvIkqqKAg6Fw8C9hewVoxnc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996e7dff-5d72-4906-f5f2-08d99fb0116b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 16:28:00.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/+GyJ6vEek4Qij7mHb5z1Z9piUCFSFbGxz05ZGdjuNuqeuE0cyUX2hDgLWkdGXytscN9DoIrEmZ/o2e+uW5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
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



On 2021-11-04 04:38, Pekka Paalanen wrote:
> On Wed, 3 Nov 2021 11:08:13 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-09-06 17:38, Uma Shankar wrote:
>>> Existing LUT precision structure is having only 16 bit
>>> precision. This is not enough for upcoming enhanced hardwares
>>> and advance usecases like HDR processing. Hence added a new
>>> structure with 32 bit precision values.
>>>
>>> This also defines a new structure to define color lut ranges,
>>> along with related macro definitions and enums. This will help
>>> describe multi segmented lut ranges in the hardware.
>>>
>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>> ---
>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 58 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index 90c55383f1ee..1079794c86c3 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
>>>  	};
>>>  };
>>>  
>>> +/*
>>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
>>> + * can be used for either purpose, but not simultaneously. To expose
>>> + * modes that support gamma and degamma simultaneously the gamma mode
>>> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
>>> + * ranges.
>>> + */
>>> +/* LUT is for gamma (after CTM) */
>>> +#define DRM_MODE_LUT_GAMMA BIT(0)
>>> +/* LUT is for degamma (before CTM) */
>>> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
>>> +/* linearly interpolate between the points */
>>> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
>>> +/*
>>> + * the last value of the previous range is the
>>> + * first value of the current range.
>>> + */
>>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
>>> +/* the curve must be non-decreasing */
>>> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
>>> +/* the curve is reflected across origin for negative inputs */
>>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
>>> +/* the same curve (red) is used for blue and green channels as well */
>>> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
>>> +
>>> +struct drm_color_lut_range {
>>> +	/* DRM_MODE_LUT_* */
>>> +	__u32 flags;
>>> +	/* number of points on the curve */
>>> +	__u16 count;
>>> +	/* input/output bits per component */
>>> +	__u8 input_bpc, output_bpc;
>>> +	/* input start/end values */
>>> +	__s32 start, end;
>>> +	/* output min/max values */
>>> +	__s32 min, max;
>>> +};
>>> +
>>> +enum lut_type {
>>> +	LUT_TYPE_DEGAMMA = 0,
>>> +	LUT_TYPE_GAMMA = 1,
>>> +};
>>> +
>>> +/*
>>> + * Creating 64 bit palette entries for better data
>>> + * precision. This will be required for HDR and
>>> + * similar color processing usecases.
>>> + */
>>> +struct drm_color_lut_ext {
>>> +	/*
>>> +	 * Data is U32.32 fixed point format.
>>> +	 */
>>> +	__u64 red;
>>> +	__u64 green;
>>> +	__u64 blue;
>>> +	__u64 reserved;
>>> +};  
>>
>> I've been drawing out examples of drm_color_lut_range defined PWLs
>> and understand a bit better what you and Ville are trying to accomplish
>> with it. It actually makes a lot of sense and would allow for a generic
>> way to populate different PWL definitions with a generic function.
>>
>> But I still have some key questions that either are not answered in these
>> patch sets or that I somehow overlooked.
>>
>> Can you explain how the U32.32 fixed point format relates to the input_bpc
>> and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
>> the framebuffer.
>>
>> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
>> is non-multiplied)?
>>
>> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
>> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
>> be interpreted as 0x3ff << (24-10)? 
>>
>> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
>> the output value be 0x3ff << (16-10)?
>>
>> On AMD HW the pipe-internal format is a custom floating point format. We could
>> probably express that in terms of input/output_bpc and do the translation in our
>> driver between that and the internal floating point format, depending on the
>> framebuffer format, but there is the added complication of the magnitude of the
>> pixel data and correlating HDR with SDR planes.
>>
>> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
>> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
>> to represent that with the drm_color_lut_range definition.
> 
> 
> Hi Harry,
> 
> I think you just would not. Conceptually an SDR plane gets its very own
> LUT that converts the FB [0.0, 1.0] range to any appropriate [a >= 0.0,
> b <= 1.0] range in HDR. This is purely conceptual, in the terms of the
> abstract KMS color pipeline, where [0.0, 1.0] is always the full
> dynamic range at any point of the pipeline, meaning it is relative to
> its placement in the pipeline. If you want to use values >1.0 in hw,
> you can do so under the hood.
> 
> At least that is how I would imagine things. With LUTs in general, I
> don't think I have ever seen LUT input domain being explicitly defined
> to something else than [0.0, 1.0] relative to the elements in the LUT
> where 0.0 maps exactly to the first element and 1.0 maps exactly to the
> last element.
> 
> I'm of course open to other suggestions, but having values outside of
> [0.0, 1.0] range in the abstract pipeline will always raise the
> question: how do you feed those to the LUT next in the pipeline.
> 

AMD HW defines the LUT addressing in floating point space and allows
for addressing beyond 1.0. In fact on other OSes our driver uses
[0.0, 1.0] for SDR LUTs and [0.0, 128.0] for HDR LUTs.

There are color spaces that extend beyond 1.0 and even into the negative
range: https://en.wikipedia.org/wiki/ScRGB

I don't think we should define the LUT to be limited to [0.0, 1.0].

If the framebuffer is not in FP16 the question then becomes how
the integer pixel values relate to LUT addressing.

As well, LUT entries are defined to be U32.32 fixed point, also
allowing for entries much greater than 1.0. If those are programmed
as entries in the input (degamma) LUT how will they be used to address
entries in the output (gamma) LUT?

Maybe we want to say the actual input values are being used to
address the LUT entries? But if we look at segment 1 of Uma's
d13_degamma_hdr definition we see that the range of 0 to
(1 << 24) -1 is covered by 128 (1 << 7) entries, so the range
of 0 to 256 (for RGB with 8 bpc) would only be covered by 2
LUT entries. So this interpretation doesn't make sense.

You can see, I'm still confused by these definitions. An IGT
test would help explain the API intentions a bit better, though
I would like to see more precise documentation.

Despite my confusion I think the segmented PWL definitions are
a neat way to concisely describe the HW capabilities to
userspace and a concise way for userspace to provide the LUT
more precisely than with a uniformly spaced LUT.

Harry

> Yeah, I have no idea what it should mean if an FB has a format that
> allows values beyond [0.0, 1.0].
> 
> 
> Thanks,
> pq
> 
> 
>> If some of these questions should be obvious I apologize for being a bit dense,
>> though it helps to make this accessible to the lowest common denominator
>> to ensure not only the smartest devs can work with this.
>>
>> Harry
>>
>>> +
>>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>>>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>>>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>>>   
>>
> 

