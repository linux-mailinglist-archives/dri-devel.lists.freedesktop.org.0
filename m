Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD341EADE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6C6EDE5;
	Fri,  1 Oct 2021 10:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5566EDE0;
 Fri,  1 Oct 2021 10:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzL2k4aTG6k/I4kkAihAuXhZZ6OKBMLvIHpPEul3AqXFvipj4p8PGi4uyp/t7kPaT7hHWfHsZQW/gcxYLlLypX8VBma6yrFPg/QxgWTQ7cXbtnpGaQk5HsD/vodVl4cMYiJER5qVKhOj1YSHKSX39DHVFOh2OwmhswBaMjQOw6Uh19gst9tr34vRNkZzdowH//f8AMyN75GhQHHDORojf38uFnwoJhik40BSC8QadqaXeg7be+WCf6H+15JFMc1kRlDdJWd3jd3ns9Wm13ivSYonTmB0GiPw40if4OW/R9rMicH9XLBWm2QcRLcFJ5ju4zp/wCNewcVhLwbZ+Ysmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKCkS0joHXbUtq3dTsaKIjYRM6SZAn7J4GjTKivaqNE=;
 b=YEtuxj2uxIyZBIB+fvb0bc05GkUs2BsrN89OXn3afli7BSsEnLIX/351EKfDv4h+HUIK5ygGD9LqSDQn6b9QFLi/55YDtoUtbMck5q732I11kXr9Pgu3iWR5icwKpLgzuSbPA2XzjLjUxjWjXhsyzTMBk4fHMS1UZqbOYbMt7PbreTH9QnAcXmpr/ye8ZeRYJb5cci7xV6EYS/vVLi0dm5rAn+pA9JnqAciQdm3NGBtL4n0RQC37bIV3aslew7bRDAtZU2D6PSUktxs2sRWh/umHWEEV8mT0IMMbekDM6ktbGGe5Doo6awooLsD7anhgpw0vsIJLskcSTimQvnPoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKCkS0joHXbUtq3dTsaKIjYRM6SZAn7J4GjTKivaqNE=;
 b=2awTCNd0wtYLeIuQUssL2bbBsYeMstybdMGmk5OxDfRHOST1ZAhfisql9HF+xVDIfd0io1VNUyB9sG92VJ09XD3DDWtkvwGX9iaMa/+1J16Vs4KazPMIPJEEH6OG8VEt8b3/koeyTMoNQQQE4+Q9/9jfnoNrH6nA5u8m/kst+pI=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 10:16:02 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 10:16:02 +0000
Subject: Re: [PATCH] drm/amdgpu: remove some repeated includings
To: Guo Zhengkui <guozhengkui@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guchun Chen <guchun.chen@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Likun GAO <Likun.Gao@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: kernel@vivo.com
References: <20211001101348.1279-1-guozhengkui@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <50430f11-5e95-18f4-7620-2233ef573853@amd.com>
Date: Fri, 1 Oct 2021 12:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211001101348.1279-1-guozhengkui@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 1 Oct 2021 10:15:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 493c862c-8310-4371-959c-08d984c4781f
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB445832BDB8EA1B59EC76C95983AB9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2A9gJh8yU9iCw1ar4/+hbmzEAuloUQPCElbho+s2lA/rWAJ84xMCVr1iZDs2akEC91GwOc5TI2t39dmX9qVaPLYor3SYFeAC+KalWQlNd4NWj70iSDXcbn4P3ItW2c4PxscGf57GL+xwtFONjUAJPOP3Pv1DSxhDSfiTzCHuf+ZS5scmwkI06afNIYw6GelA8bnesGIyxh7CJIBoP35PXOThjwWCgETkMuYj/IkUG3//Wmt1qMcVTtXdhZPCUBMpVFO+/QF5q9MLPi7WNLpNQUgQdakP25cvUKG055KGtBn75hZDsZvL4Lan44MX8AVhTctxbYy8K57uE4M935WnmY86zqr0yFyLdekrhzKknkwSsF6DkGSKVmg231tq/ZjOxHHUi0EGJnaCNyz9cuMfEVATA9zJcNnbsq0mKBWFgQTv1WK7Aslz93ZdAlut1yXcR7dSSj4Q0l8CYO7qYzK4msTNAuxVI0iNcjCcuE/UofrmpSq8T24oCIe+39+ULgLIdIw3nSe5qBZbz8ZvUABUZAg51k6jWWyTf6ktYrqIDPt1z+Uv7zdWXEQTK1LtFjqdWaE6CbLiyAruUz8YUgyAHfIzB+3zB61ZnNU9GZLdPXNHAMFNnNTe6cpXYnBKZDNQ+roet+WLDeEDPX3aJeIhF9SEyK757wTqZXoGoeU07JBf/2x9y+W86JUDZZ/pQawqlHEHb/JvjdfChtJNmVbYNUlse3OGuqqitMR+sKt7MtcrgIfINuBSLaPfyfxwg36
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(31696002)(66556008)(66476007)(38100700002)(921005)(5660300002)(66946007)(83380400001)(2906002)(6486002)(186003)(31686004)(6666004)(956004)(8676002)(26005)(2616005)(4326008)(8936002)(508600001)(110136005)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhUemp4N2NRMU9SRjcxNGhra3Ayb1dmTHBKSjNramR6dkJKbTBvRkRhb2xE?=
 =?utf-8?B?aUcvNHA2ZElTVnhqTFB4UHpaZnRwTnV2elZPTlorSGFnWURZUW9aK0kyT3Ez?=
 =?utf-8?B?ODBhRUdIUkJ6alkyWG1WaEtIY0ovTzFDbHFTS2RXM0RnRWFSVnAvTnk3ZEFm?=
 =?utf-8?B?R1YzMHFFMjkxZUl1Zk1Yek1iZERTSnlDQzF6WlBPTlpPUVpaV3BWMzUwSnJT?=
 =?utf-8?B?UVhXNGVOSlhJUUdNSElPbFREZ3BXYlpReWlCL2dQanU3alVuZGY1SXRPYkF4?=
 =?utf-8?B?aW5nQlpsK3RaUDEzbFRXWEZicHVKeWxTSGdZcjE5TVF4M2IzakpVQ0NLSHZw?=
 =?utf-8?B?dmJ6a09YZVRCRjJJOFd1MHR2eU1uRUtxbnQ0bjFHcUhZcVBXWG91Yldnb1pO?=
 =?utf-8?B?ODdCd0FZTHh0Vm4vaVZOajI4a05EaWozZlFaS29pMG44Ym1RZkg4WFdNVy8w?=
 =?utf-8?B?blI2QzUwc1FKMUNzYW13b1JjbWUzN2NZUXRUUUEvZXFKMVBMVDY1SWpaV01J?=
 =?utf-8?B?bTVLTjQ2L2dQZWxVVzZFUlRQMHZNMUl3MmdvQzlpRGFLakJNaVU1NndEMVpL?=
 =?utf-8?B?cWI5ZjNWY1FIOXorOVZ1eW1uV05rVGZtemdycDMzTWh6NVN0ZGZwSXRjRWdu?=
 =?utf-8?B?VDROaVdYZERENlpzSHRRQjVOczhjUVAzRm15WnRINHp1cWthTHluZWxNRmtB?=
 =?utf-8?B?R1cxcmwrV0dLOW1SSE52SlRXdGVpa1RVWWxPdUJZUC82NWx0Qk9VMzBjTFZy?=
 =?utf-8?B?alFRd0RuSG4rMzZmR2xVY0tFN1NaTmxYTmIydmtEY2lOOW01MUVxeDJFaGJn?=
 =?utf-8?B?WmxUNWxDcG5tYnZiam16a1RYdkxvTEtuVmNzcVdHVzl6UjM5TGQzZlRGcURz?=
 =?utf-8?B?cVZJNEREblUrWFpMSmpyYXBiQWhzdjBwaHk5TXhKZlpXV2pxZk1Tdjdwb2ZW?=
 =?utf-8?B?RHZ3WXYzVGVFdUVwSmpOVCtHa2RYRzRQYkZOVk1tZ0VTRUkxbmh6alBlK0FI?=
 =?utf-8?B?bXA3aktoWG4xcEZRSmVGMTYrVE5HS3dBKzVYT09vZDI4RGNENFJxOFdqTnYz?=
 =?utf-8?B?eGo5cEx6Z0xlbjNSMXJabjFoZENDcERUdDMyQm5udjl4OVRJTmZTK2U0T3NF?=
 =?utf-8?B?T0hsOWE5MFczZXVzcDR2MlMvUVVuN1R1dFpFTlI4d2Y1ZXVwejBiSmRCaFhr?=
 =?utf-8?B?NTZKdzJNVHhmSm81bXBibG43RzVwYmhEc0ZNKzJUWDNwdUJyWTFXV0gxdWpL?=
 =?utf-8?B?d3Rob3hvaUV4K2l5MVR3M2tNTGs4a1hOcWtDR3hqSHY4MnhvdldZL1NNWFNM?=
 =?utf-8?B?OU5xenJIYzRaNHZhMnNuMkhjUGUzYTRuT1h0QzRDZUJqSVI3alRYOFowdWNZ?=
 =?utf-8?B?NVV2QnphVEZWb3RyaHdhU2l2YXdPVGdPREtYTVBFT3ZTTUZkQnVDQ3laZGRx?=
 =?utf-8?B?UWpPUjZldktCRTRQb0xUOWN5dlp2cGJaMkYvZVpKQnhEWUJWSTRleUgzbHBk?=
 =?utf-8?B?YzNld3RHUmUxY0VRa3Z6cTl2MDdMSXh4dDhRUGNVbEhiOVU1eFVoNkxvTWFs?=
 =?utf-8?B?Wk91bllFUGlIc0FMcGUvM2U2NFR6ZTdqQU5nS3VDM3pzK3U5YTgybEMvTWp5?=
 =?utf-8?B?R0RGb3RwSzk5Rm84TGgvUEhPbkxYbGlKejVkM3dqMmFkR0YvNTZ0SFVvOHZ0?=
 =?utf-8?B?SVBPS1gzWDE2d0R5NXJNUmc3d1F2cjcvQXlCZWhadm9FZGl3TFdMRGxzQlJD?=
 =?utf-8?Q?CU+nbzqqsgxPs5RMTIzRpGAD6+Yk1PqatITqfLo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493c862c-8310-4371-959c-08d984c4781f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 10:16:01.8945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TyQpD0dTlZLFelTOhjqedC7mg0zZPWABk5mG0/prXlDDLT+6UD9PJmVpP5daKwe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.10.21 um 12:13 schrieb Guo Zhengkui:
> Remove two repeated includings in line 46 and 47.
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 291a47f7992a..daa798c5b882 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -30,34 +30,32 @@
>   
>   #include "soc15.h"
>   #include "gfx_v9_0.h"
>   #include "gmc_v9_0.h"
>   #include "df_v1_7.h"
>   #include "df_v3_6.h"
>   #include "nbio_v6_1.h"
>   #include "nbio_v7_0.h"
>   #include "nbio_v7_4.h"
>   #include "hdp_v4_0.h"
>   #include "vega10_ih.h"
>   #include "vega20_ih.h"
>   #include "sdma_v4_0.h"
>   #include "uvd_v7_0.h"
>   #include "vce_v4_0.h"
>   #include "vcn_v1_0.h"
> -#include "vcn_v2_0.h"
> -#include "jpeg_v2_0.h"
>   #include "vcn_v2_5.h"
>   #include "jpeg_v2_5.h"
>   #include "smuio_v9_0.h"
>   #include "gmc_v10_0.h"
>   #include "gfxhub_v2_0.h"
>   #include "mmhub_v2_0.h"
>   #include "nbio_v2_3.h"
>   #include "nbio_v7_2.h"
>   #include "hdp_v5_0.h"
>   #include "nv.h"
>   #include "navi10_ih.h"
>   #include "gfx_v10_0.h"
>   #include "sdma_v5_0.h"
>   #include "sdma_v5_2.h"
>   #include "vcn_v2_0.h"
>   #include "jpeg_v2_0.h"

