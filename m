Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F657E8D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 23:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E869132A;
	Fri, 22 Jul 2022 21:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4991136;
 Fri, 22 Jul 2022 21:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhQhABQ8zt9hFbl7E66nafvyOSHHZ9dLZFVJHLwdWyrFRYCk5jn9eJ43grXHIFEYXnznyLbsZUoi5C1FtPCEGtIY4hrLWLAKb34K/1iXXdgKgnltJsVhbqYQQb74E/CevnjIb5Muo/0fnMdTJlaU25FQTF1UlgYLI67mBwWcvRP3jvCqc4fy1xzft9Q1cqs+C91FmTp88ti63aYvFcdm14i2gjftG/21VBvvTIOEf5xTq92VZ8OlfKSayES/JNFZPW30LCutOIG75mRmMBC6S0BN3DkqnCpw5RbgaQpPRn1AI7UrVwI9e2CE6ZseI38DRJgKyn8ISTk/XykK6Pmivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XL6ZR2t1j7aqV83W2qvbOHKemoZ0by0a15/WD5KTfw=;
 b=LgwJvlq6I9kzCTY4Hy92dm+tlspwzuXb9l1MlsLiXYkaNA01fe7y+tx4kYsfaPxkRVTAIGOI5wPvIyFHhQiZK0tT7hjlIAdgpyuhMbOri7bxnw0QrAl8n1tRUHqepNUg39Hkq9FkooUvJsstDHGB6Oihp1b3/pKV2aQhX8uUFuN/G6FMlKmnKgd5hKGz/tJ1PJUp7axqJKH2pUBkfGwqRsaYUKNNGjxMrAgDG/HNxg6oyqV6MXPF9pK9883xpURgGqRLxy7akJGpyInRSGFm6u1cTg7d/3PK1FkWvmJ4w1bOkjZ1VtCEgf56FxUoV0Glz/fSrkeOhtCj2S1ZdC94vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XL6ZR2t1j7aqV83W2qvbOHKemoZ0by0a15/WD5KTfw=;
 b=XFy+6WBH5BrbQLuITboJeTulnjJbT1kFSA7GP75ujq2azrHYx5Z7EBiaDHm2qouhSdzckKoaajQwe139WYSaReu62XdkIByg1b13N8Cq5Wpdwvqa6plyVjRSYzGyEdqck6JRaNZMIJUAkSkOq9zYT86xSb2ywoy8iVia3UwFJWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 21:23:13 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 21:23:12 +0000
Message-ID: <06cf741a-28ba-632d-0303-8313c2a752a5@amd.com>
Date: Fri, 22 Jul 2022 17:23:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] Documentation/amdgpu_dm: Add DM color correction
 documentation
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-2-mwen@igalia.com>
 <b3845482-c53e-0ea8-6893-834a93ea5444@gmail.com>
 <20220720225413.3sjcfxuyakg3t7xd@mail.igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720225413.3sjcfxuyakg3t7xd@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::23) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 099abf04-5975-46b8-124e-08da6c286207
X-MS-TrafficTypeDiagnostic: CY5PR12MB6276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zsFNj4sLFuoEUF9AmxUW0SXuyHO8HtZFEUv/2tQKWoOfKUh5KTjFz1ZPzKAwe8Pc/yFmKs3c7Q0A0+CbIM5zmdr5rVZbnhrGg1zzmxWFp04hDDwBAmSQe8xX5r/livE/P3Nyj4c3cnuQNHDz9GUKxy17snArx+EdAKBFxFe850nApMKhP8OxSDPcf18bGnLGZJ6zBOPaoLKw1rhp8npXxgD6HxeashBxBpvChnaWlWl14rvlwsasdtkxSiKjNWyI9Y6M2MsIBLt9Ca4aTfLpC6TDWjvZjbtHXdEaV0ny7HTz+pOPgVr+rN3EiZ6X6S6da8qLf2iDHJ9xkcLeZq/BxLhXfRduMcvvKCpFQNLGJzxJwDsvBgnRLBSrMVZv4etqqj4b6fVs1R1+tEQsWygxDF96KFCAzIAd46CjhMiGqTIZiXvx+9XcL6uks7u+sLLE5q/opQK+kp7BTyTCI6/nWuIc35/YsiE6LYri8omdqld4/vJkPLYPU2M27rRU7FqSb3eaPUQ4A1mAw8a7SiEFygvRDdAO5d2eTtpU8OoN8LTAOmvP1QqXxs2SP+ydCM6JVRAoUYyll+zOYH1YKvHVrDtxtzViIf9OKG3u2VAckgz+NfDWcxLqZPbyw49VGNh21ldCaxLEBDKbGbh1h7Z/llgwtk6es7W/RTXXwhXvP2KwkeHfEJfJHwVZ2IOErxXA0WpHLsryJ1LCtS1jOAI5dZR4jFv+vx4NmDxjs0oKYk3OF3zcTvtHOSY+VsyqxmXcDaq+Tq0hRNnmXEhvFVSCHkgvtBXKJ3sZtmrWRvMzHvMeSVLDFrwaHTnUNw6IxtcPW08iQYFXOPhjRUTeb3C19Vr7AiwxzI/YjoHfoRZH3gL4AmsWp1k0LewW9VVzD+Y4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(30864003)(8936002)(66476007)(5660300002)(66556008)(66946007)(4326008)(8676002)(110136005)(2906002)(83380400001)(31686004)(86362001)(31696002)(36756003)(38100700002)(316002)(6512007)(26005)(186003)(478600001)(2616005)(53546011)(6486002)(966005)(6506007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzJVRmdEeU5FWGg1MlNKdnlSRjFxeGpxUEVvcUZoNWZiSkVkMzMxdGtKdE02?=
 =?utf-8?B?WHd5TjlBL1l5VVMrTmI1UzdkbWUxcHJETDd3ZzBhaGhWcEsrbXl1bnhrTHhz?=
 =?utf-8?B?VmhiY0JqcHhWc0ZuVjZjWnozcTVDSExmMDhaZUV1cTlYSnBhWkRoakNHdVB0?=
 =?utf-8?B?Y1B4UGlFaEdvbmMrRE5ZeWNMa3VHekp4MVU1ekZnVjdEZ1VCOVhkMWFEQk5R?=
 =?utf-8?B?K1JNR2R2aDA4TEtaU0ZjOW5jaVZEcXVPTUtkSlJGUmMrektQNUVCd0hlREJ3?=
 =?utf-8?B?LzVRNkFYcnVhenJvbEZFL2tQL0dIeVRyVjJmaGttdmhmN3ZZd1VSY256d09j?=
 =?utf-8?B?R0ZQVnBQTndQNnowN1lreXNZOG5oY3BXeWxKSFd6NHpQNSttSmc0emxNZE9L?=
 =?utf-8?B?clYyc2I3ekp5emtxdHBvSnZ1cERleksvT0p0cW90QnIvOFNJeFkxVlpvYVNG?=
 =?utf-8?B?aVhUekd5RjZKNDBHeEtFL0ViQkp2eHJNZElPRkJKb1AxcTU0M0tSZVkzTGJi?=
 =?utf-8?B?UG1kczJvSXF4aVVwMVBPRXh0Tms2VW5URmE4L3B2NTBUK2lzbFltank1YlM5?=
 =?utf-8?B?TUZjWWJlSFQrazFzMkdtaDFDeWRpSkpVM2ZwNXp6MEVwUHQ2SkdFWmx0aXNQ?=
 =?utf-8?B?LzczMFViZm0yeFRUeW5zU1hyQ0h5Ti9XS1Y0a29QZThXUEZqaXJlUytSQWZv?=
 =?utf-8?B?bHp6TWsrbVFqNUxZL2N3b3Y5dDVHRThvOFJDVlczS2NWQTZEbGVmNDlsTkdu?=
 =?utf-8?B?VFAydkh5OGp4amFYV2lRNDZTeXE4WStRdU5BTW9abFlwWkQ4TytySmF5VGlt?=
 =?utf-8?B?UFR6ZHJFck1tRXREdUFualR0bzI3Mkp5SHNmczA5VnNCTENVb0VhQ1owUnlu?=
 =?utf-8?B?K01tNDhtUUc5S09EcE03b1pOeFFFdVFtelJaVk93Ry9vbHlRMENqQlJxek9N?=
 =?utf-8?B?dnBuNjF5Q3FMT3JPc3dybDB5cVo1Zm9PYUJkb2VpUHY1dDhZcGlRYnoxNkQw?=
 =?utf-8?B?Y3k2cHhJU25ia0p2TzI5RUtqSFF6TXZFUC80TUVKN2N4MHZiekFhdStBUG1E?=
 =?utf-8?B?bkFsT3Z2UzBzQ0krUWtMYXZpMEJZNVBPNy9xK0NTUzRVdkw2TzVlcHV4T2hX?=
 =?utf-8?B?QmhUNGF3MDZJMXpOR3AyNXVVclp3Q1RLRTRWZDRzaGtSaFlSZW1mL2lneXlD?=
 =?utf-8?B?Z2NBTHJiWFhiU2FQNW1iRjBTLzV0Zm9mZ0dNY256cmZmYkJZUkRzekQrRjli?=
 =?utf-8?B?UzdrMkFsSHZsMGRaSzN3cU50WVF5UDN0dmxSSSsxZkNySEg0cFdWMk1STFIy?=
 =?utf-8?B?Y1hmc3gxNDdMWFFjSlFlWFdZQVh1b1lwUTdJcW9pWTZLdkd4Y04vWUJNeW5K?=
 =?utf-8?B?ZytPaFUxb0VieUM3VUJsUjJYRlAxby85OHFsZUxmcGxxSW9pUzVBOGdYZGYv?=
 =?utf-8?B?emhTK3lYa3dPVldZUzZKeTZKblpmdHJMVnA4RGNHNXVMMmhzbHZsdUFiSFND?=
 =?utf-8?B?MDI1MjdSek5ZWlpOVTZDSm1Tc2VLeG1sRjhwOVppREhQdTlWWHpVckNJRmZH?=
 =?utf-8?B?ZmVwckJyeXRWRTBGQU5GZ2I4T281RlZSYXArTTFISWFBUVp4bmJjQ1pBUzR5?=
 =?utf-8?B?dVY2L1RwYUhZN1dKTFNZeVlhY2Vvc2M3ckEwVFVtRWFJYXJWMjN3UnR0cGQw?=
 =?utf-8?B?Z1YrR2VneGhTdDJiUERHNHBxWXVLMlptUHRPaDdpaFI1SzRNME14NnR3dDJa?=
 =?utf-8?B?RGpjQkFjaVR4RzBCMmRodXpMRFRRZDJBaHdxU2R0bGNFK1dQS0VrZXF2R0hC?=
 =?utf-8?B?R1owRnIyVmhZOTl6VkFxZWhQQmhCWHpZd3JiVEM2a1FnMHNXRjNEQ1EwUmhQ?=
 =?utf-8?B?dHdqU2ozSTgrZTdWaWtqT0FsZVBHZlhCV1RyTmJWaFFKSWQxZmVpU2lRTTdD?=
 =?utf-8?B?S1hYeGoyM3FXWWhFU1YzR3hucXdlMklNc0o0N2ZUc0J1bCt3V0IwRDM0NXhy?=
 =?utf-8?B?SEt3ejRzWXpMbEpsZG8vUHJqVVVXeXI1enRQcmhBZkNFQ1c1U25Gd092V2oz?=
 =?utf-8?B?UjBJbDVtd2dxTGdZNnY5cTl0ZHYzY0VlNXpCNkZyY1kyUzVHWGNzYXNUbmNX?=
 =?utf-8?Q?Ua7g/FdUGNYs0aoiVbBDGKC+c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099abf04-5975-46b8-124e-08da6c286207
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 21:23:12.6718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V18AlHd3MXqgStNyZBJGe3kbm8hxP4tNssBCMLFmxbAJOhf2L+cOFH31eIP9Y2QXnNTHWmeMSu/acsn7P5oA1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 18:54, Melissa Wen wrote:
> On 07/17, Tales Lelo da Aparecida wrote:
>> On 16/07/2022 19:25, Melissa Wen wrote:
>>> AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
>>> to DC color correction entities. Part of this mapping is already
>>> documented as code comments and can be converted as kernel docs.
>>>
>>> v2:
>>> - rebase to amd-staging-drm-next
>>>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    .../gpu/amdgpu/display/display-manager.rst    |   9 ++
>>>    .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 121 +++++++++++++-----
>>>    2 files changed, 98 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
>>> index 7ce31f89d9a0..b1b0f11aed83 100644
>>> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
>>> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
>>> @@ -40,3 +40,12 @@ Atomic Implementation
>>>    .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>       :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>>> +
>>> +Color Management Properties
>>> +===========================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +   :doc: overview
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +   :internal:
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index a71177305bcd..93c813089bff 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -29,7 +29,9 @@
>>>    #include "modules/color/color_gamma.h"
>>>    #include "basics/conversion.h"
>>> -/*
>>> +/**
>>> + * DOC: overview
>>> + *
>>>     * The DC interface to HW gives us the following color management blocks
>>>     * per pipe (surface):
>>>     *
>>> @@ -71,8 +73,8 @@
>>>    #define MAX_DRM_LUT_VALUE 0xFFFF
>>> -/*
>>> - * Initialize the color module.
>>> +/**
>>> + * amdgpu_dm_init_color_mod - Initialize the color module.
>>>     *
>>>     * We're not using the full color module, only certain components.
>>>     * Only call setup functions for components that we need.
>>> @@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
>>>    	setup_x_points_distribution();
>>>    }
>>> -/* Extracts the DRM lut and lut size from a blob. */
>>> +/**
>>> + * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
>>> + * @blob: DRM color mgmt property blob
>>> + * @size: lut size
>>> + *
>>> + * Returns:
>>> + * DRM LUT or NULL
>>> + */
>>>    static const struct drm_color_lut *
>>>    __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>>>    {
>>> @@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>>>    	return blob ? (struct drm_color_lut *)blob->data : NULL;
>>>    }
>>
>> I don't think everyone would approve using actual kernel-doc for these
>> static functions, but I can appreciate they being formatted as such.
>> Consider replacing /** with /*.
> 
> IMHO, although they are static, they provide info to understand the AMD
> DM programming of DRM color correction properties. I see the value for
> external contributors, but I'm not sure about kernel-doc rules about it.

Yeah... I agree, I don't mind seeing kernel-doc for some static 
functions. Iirc, DRM documentation also documents some static functions.

>>
>>> -/*
>>> - * Return true if the given lut is a linear mapping of values, i.e. it acts
>>> - * like a bypass LUT.
>>> +/**
>>> + * __is_lut_linear - check if the given lut is a linear mapping of values
>>> + * @lut: given lut to check values
>>> + * @size: lut size
>>>     *
>>>     * It is considered linear if the lut represents:
>>> - * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
>>> - *                                           [0, MAX_COLOR_LUT_ENTRIES)
>>> + * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
>>> + * MAX_COLOR_LUT_ENTRIES)
>>> + *
>>> + * Returns:
>>> + * True if the given lut is a linear mapping of values, i.e. it acts like a
>>> + * bypass LUT. Otherwise, false.
>>>     */
>>>    static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>>>    {
>>> @@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>>>    	return true;
>>>    }
>>> -/*
>>> - * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
>>> - * of the lut - whether or not it's legacy.
>>> +/**
>>> + * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
>>> + * @lut: DRM lookup table for color conversion
>>> + * @gamma: DC gamma to set entries
>>> + * @is_legacy: legacy or atomic gamma
>>> + *
>>> + * The conversion depends on the size of the lut - whether or not it's legacy.
>>>     */
>>>    static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>>>    				  struct dc_gamma *gamma, bool is_legacy)
>>> @@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>>>    	}
>>>    }
>>> -/*
>>> - * Converts a DRM CTM to a DC CSC float matrix.
>>> +/**
>>> + * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
>>> + * @ctm: DRM color transformation matrix
>>> + * @matrix: DC CSC float matrix
>>> + *
>>>     * The matrix needs to be a 3x4 (12 entry) matrix.
>>>     */
>>>    static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>>> @@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>>>    	}
>>>    }
>>> -/* Calculates the legacy transfer function - only for sRGB input space. */
>>> +/**
>>> + * __set_legacy_tf - Calculates the legacy transfer function
>>> + * @func: transfer function
>>> + * @lut: lookup table that defines the color space
>>> + * @lut_size: size of respective lut
>>> + * @has_rom: if ROM can be used for hardcoded curve
>>> + *
>>> + * Only for sRGB input space
>>> + *
>>> + * Returns:
>>> + * 0 in case of sucess, -ENOMEM if fails
>>
>> Typo sucess -> success
>>
>>> + */
>>>    static int __set_legacy_tf(struct dc_transfer_func *func,
>>>    			   const struct drm_color_lut *lut, uint32_t lut_size,
>>>    			   bool has_rom)
>>> @@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
>>>    	return res ? 0 : -ENOMEM;
>>>    }
>>> -/* Calculates the output transfer function based on expected input space. */
>>> +/**
>>> + * __set_output_tf - calculates the output transfer function based on expected input space.
>>> + * @func: transfer function
>>> + * @lut: lookup table that defines the color space
>>> + * @lut_size: size of respective lut
>>> + * @has_rom: if ROM can be used for hardcoded curve
>>> + *
>>> + * Returns:
>>> + * 0 in case of success. -ENOMEM if fails.
>>> + */
>>>    static int __set_output_tf(struct dc_transfer_func *func,
>>>    			   const struct drm_color_lut *lut, uint32_t lut_size,
>>>    			   bool has_rom)
>>> @@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
>>>    	__drm_lut_to_dc_gamma(lut, gamma, false);
>>>    	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
>>> -		/*
>>> +		/**
>>
>> I don't think kernel-doc should be used inside functions, as well,
>> maybe keep the "/*" from before. This occurs in more places in this patch,
>> remember to replace them as well, if you concur.
> 
> hmm.. I think inline doc is good to avoid repetitions, at the same time we
> expose this info and keep it near its context in the code. This is why I
> chose this path.. I'll think about it

I'm not sure, but I think that kernel-doc inside a function is ignored. 
In that case, I would follow the kernel guideline for code comments. 
Maybe you can move part of this documentation to the function description?

Btw, nice patch!

Thanks
Siqueira

>>
>>>    		 * Color module doesn't like calculating regamma params
>>>    		 * on top of a linear input. But degamma params can be used
>>>    		 * instead to simulate this.
>>> @@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
>>>    	return res ? 0 : -ENOMEM;
>>>    }
>>> -/* Caculates the input transfer function based on expected input space. */
>>> +/**
>>> + * __set_input_tf - calculates the input transfer function based on expected
>>> + * input space.
>>> + * @func: transfer function
>>> + * @lut: lookup table that defines the color space
>>> + * @lut_size: size of respective lut.
>>> + *
>>> + * Returns:
>>> + * 0 in case of success. -ENOMEM if fails.
>>> + */
>>>    static int __set_input_tf(struct dc_transfer_func *func,
>>>    			  const struct drm_color_lut *lut, uint32_t lut_size)
>>>    {
>>> @@ -285,13 +335,15 @@ static int __set_input_tf(struct dc_transfer_func *func,
>>>    }
>>>    /**
>>> - * amdgpu_dm_verify_lut_sizes
>>> + * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
>>>     * @crtc_state: the DRM CRTC state
>>>     *
>>> - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
>>> - * the expected size.
>>> + * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
>>> + * are of the expected size.
>>>     *
>>> - * Returns 0 on success.
>>> + * Returns:
>>> + * 0 on success.
>>> + * -EINVAL if any lut sizes are invalid.
>>
>> I don't know if you expect this to be rendered in two lines, given that you
>> wrote something equivalent in a single line in other docstrings above, but
>> if you do, use instead:
>> ```
>> * * 0 on success.
>> * * -EINVAL if any lut sizes are invalid.
>> ```
>> As described at: https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values
> 
> I expected they are in the same line, separated by dot. I'll put the
> together for clarity.
> 
> Thanks,
> 
> Melissa
>>
>>>     */
>>>    int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>>>    {
>>> @@ -327,9 +379,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>>>     * of the HW blocks as long as the CRTC CTM always comes before the
>>>     * CRTC RGM and after the CRTC DGM.
>>>     *
>>> - * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
>>> - * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
>>> - * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>>> + * * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
>>> + * * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
>>> + * * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>>>     *
>>>     * The RGM block is typically more fully featured and accurate across
>>>     * all ASICs - DCE can't support a custom non-linear CRTC DGM.
>>> @@ -338,7 +390,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>>>     * management at once we have to either restrict the usage of CRTC properties
>>>     * or blend adjustments together.
>>>     *
>>> - * Returns 0 on success.
>>> + * Returns:
>>> + * 0 on success.
>>> + * Error code if setup fails.
>>>     */
>>>    int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    {
>>> @@ -373,7 +427,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    	/* Setup regamma and degamma. */
>>>    	if (is_legacy) {
>>> -		/*
>>> +		/**
>>>    		 * Legacy regamma forces us to use the sRGB RGM as a base.
>>>    		 * This also means we can't use linear DGM since DGM needs
>>>    		 * to use sRGB as a base as well, resulting in incorrect CRTC
>>> @@ -393,7 +447,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    		if (r)
>>>    			return r;
>>>    	} else if (has_regamma) {
>>> -		/* CRTC RGM goes into RGM LUT. */
>>> +		/**
>>> +		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
>>>    		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>>>    		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>>> @@ -402,7 +457,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    		if (r)
>>>    			return r;
>>>    	} else {
>>> -		/*
>>> +		/**
>>>    		 * No CRTC RGM means we can just put the block into bypass
>>>    		 * since we don't have any plane level adjustments using it.
>>>    		 */
>>> @@ -410,7 +465,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>>>    	}
>>> -	/*
>>> +	/**
>>>    	 * CRTC DGM goes into DGM LUT. It would be nice to place it
>>>    	 * into the RGM since it's a more featured block but we'd
>>>    	 * have to place the CTM in the OCSC in that case.
>>> @@ -421,7 +476,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>    	if (crtc->base.ctm) {
>>>    		ctm = (struct drm_color_ctm *)crtc->base.ctm->data;
>>> -		/*
>>> +		/**
>>>    		 * Gamut remapping must be used for gamma correction
>>>    		 * since it comes before the regamma correction.
>>>    		 *
>>> @@ -452,7 +507,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>     * preparation for hardware commit. The transfer function used depends on
>>>     * the prepartion done on the stream for color management.
>>
>> Could you fix this typo while you are here? prepartion -> preparation
>>
>>>     *
>>> - * Returns 0 on success.
>>> + * Returns:
>>> + * 0 on success.
>>> + * ENOMEM if mem allocation fails.
>>>     */
>>>    int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>    				      struct dc_plane_state *dc_plane_state)
>>
>> Thanks for creating more documentation!
>>
>> Kind regards,
>> Tales

