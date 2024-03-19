Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529187FF74
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8DF10FAFA;
	Tue, 19 Mar 2024 14:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cC3dgTnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED110F66B;
 Tue, 19 Mar 2024 14:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjYpfgYLtu/At9fb3ixuh2i4oTMMJRMPgdyzTt8GvehMwsVEEpVToJ6cEJ5mAuVjHwyKGaUCBDgdaPuS+U7scFJ7hgTAne1C4yfI3St1Tper7srC4siCRkSMAFO0aP2Vnid4iM7+Q/dGfCAvKCuz4a/GPaSzCjY53Ke/Ow/7TRjCTy2eYu2okBl+WEATQn0T1+K5pY/OZgi9jqIEwCLAeCd0Nfak6VIlIoPXPGQdkgN0NvQZdwjD9MEo+3NGZGlOFkdM4Y3S4xUAdEzqP9WiabZuxzaFXm11om3SImqfypcHkRS/QfyS7JqYdfoJ2XyUoNUgbxsGAQ5LTte51mrbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEEjD/8axvjuqggz5JNypw3fcKMD79lmepef9AGkTrY=;
 b=RFFXoAD+4McPV/kpA6WGqeWGe9N8/yvC1dCfb4pZQbE1OXaVjiaJ7VBbpXOVRadaD+BCdCtkgTjic8UyrOpjAEU0Mx1pOaWJzzAUHkGLZAk7zfN3miQrY3qqcESOUvi+6H/qgBEo2CTPncS05/OxzwwU7thRF7pCRYAKehA7TYdvsLTcykttsl8pIOBSCRjePyktDIKr/vCU+6ScewuiNAF0bS4XZktB9hlaMLcnv7xA88BHhMLjjEId2VtVtm9J7LE/usCbqlr5hO15xQnIEHxznyHYhJ+fxAfgr02oFmkfGS22r8yem0rrg/P7107CfxGm6BnfNpxfLPDFe+YPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEEjD/8axvjuqggz5JNypw3fcKMD79lmepef9AGkTrY=;
 b=cC3dgTnwkaTKtEoT6IIII6t5EXVsIuA4i0b82Io0S8uJgi9j8DbJLv6N25yD89KCy9CIyiLcav/GFWnjdFhs2fOfr4ONkpH9B5VAeKzkwH0LGGQtE11N3fK9KGqlEFtWPSlWP6Ga79KIRTCW6BuY+4ZTrGn/R3DBUAx1zK87SsI=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 14:20:28 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 14:20:27 +0000
Content-Type: multipart/alternative;
 boundary="------------q0KERAwqL4nZIW708vOsc0CY"
Message-ID: <25dc4478-7c39-4557-ab5c-f2caad027428@amd.com>
Date: Tue, 19 Mar 2024 19:50:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
 <bcefa332-d29b-4fa0-9195-39dc77625e5b@amd.com>
 <6b00e84a-1720-4417-81bb-416ef6f01560@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <6b00e84a-1720-4417-81bb-416ef6f01560@amd.com>
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA1PR12MB6894:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvGwc4tqXy7QyM3o50UeJA+hU2rUrurAtquj61T3wmrDO08ayJiq65KIMQe5BJAqnkdayDFpp6VaTk9Riwe6F3WcXgPHJ4tePiF2ELZuUcy+0gbTIoYQSp5znR87GWOLJFW3rRZjA/K/1/E+fQQQQbS6ks6e4oAfg3s62OL24mX6kMXCf0ciZ8qnAb5EUze51qoV5NjBcN0kPmwWc+dmy/+Qx+KIFkO8WQgT0phAYIZ+SQoyOPQ8jlInvy5uDZdIMzGcGleU93X7oJ1emWSgA/kJ8k8i4r7A2VuDV747vjDqbG4406FzJf2VRsWciKdXfhdwkLVAsqxWDC0oAVclEnYlRX3rRX3a9l9mzxlHlyXiKWES8kIriKtplv4AbVKZTV/91Kfq/vYgfrITWz3Y67gI2Qni2T3SfZgSmCKPFJLWC7/yheptLqNxBO9LOTcl/txYxCuO1MKVRhM39O9IR1L3mWrCFBk6fG0eucfkDLZyFbW5M7yMrvISZaqkhZGBJWo+P/1TrN2cjPfAh4Nqi0yEB3YXRiq992CkGFpVrIg9b3tYgol5BwUna1xa6nhNLRCNDwXhSHdXugWJfTkA4+Z86Ut2yAjIMQu9JUiKf8YdvASHaRuPMCWwN91O8zfhNyzkOCkF7N11z7okLq4SH15Bi9SGibMe64n2VhVC85E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SS9YM1FPaXhTc2ViM01LWE1NVXlLU3M5K0xZRE1jeEk2UlMzaXIyNFdKeFdT?=
 =?utf-8?B?bVhLU1lPU1Y3WU5QRWlpUHNQK3lmejBUWk5WcjhoM043TmJLbXk2YmdGUUZ6?=
 =?utf-8?B?TENrZ3hOcmF4bkxJdys0QXlEajJ6bHRNVStOZFVVWnUwTU1jUGdXTFhOYnM1?=
 =?utf-8?B?QnNadnhFV2dCcWtxdS8xblhUNk8vSzZNcjVXelRBTC9lamZkUmdJYkRpYSsw?=
 =?utf-8?B?d1JDdmNHNzNnT3hWSHVhcFpJRTdZTW5QbXJkUUFEL09CNkNiSXRCS1gwRUh1?=
 =?utf-8?B?bWU3aVdaYllidjRWZXRpZnQxcDRnMXZnaWMwbkswWkJFYm1YUURDN3FzeXdr?=
 =?utf-8?B?RGpzeGRMWkxHMHFCbTRhN3FFTEFoRGpPVzRMYnpTS2lnWXkrY2R4KzVVZ0lL?=
 =?utf-8?B?YzI3N3FING1OSzlhaCtDWW4yU00vbElnNUJlcGV0ZVZ5K2lwVkh4MXdBeEFM?=
 =?utf-8?B?MXhWbTZjRTVqTmRTQzVScVlvYkt0SUhPYTNYR1EzNzI3MlBPUFhLaUo3aUdE?=
 =?utf-8?B?L3NZdW9kTjFuM0ZzaTNuQ1lQRFJlWE5yazN0bUR6R2ZaM1Y2eXM5ZUdCcWFq?=
 =?utf-8?B?a2l2UkVqRGhuYVJiRk5oeHNZRTV5TWIvZmVDM0VST2I4UzlEcW5YclJlK085?=
 =?utf-8?B?d2NTRkoyTHpQN0Q2bzJiNlZVNTJYYTNmUmp2K0hLb0ZrdEZZczJ1TVZ4eEhi?=
 =?utf-8?B?cHNEZ25CamhRQjlLWk1McFNmYnJZY1JQTlh0eDVjQzhQQmlSVVVmSm8xMURy?=
 =?utf-8?B?TlZnYzhiVkpNN2lFMGl2ampxckV4Y0hNUVZSTFJqaWcyWGtUclhWNUlSSTFh?=
 =?utf-8?B?ZENDR0V6aDVrK0luNjlLY2c4ZjQ3MFBDa1BpaWt1bkxtVC94ejFjYU0yYmFZ?=
 =?utf-8?B?ZG0wZ2ljUnYwalNnSXNiYUphMVRTYzl3Y1BaT2dxS0t4M1RPditXVHBYTTRQ?=
 =?utf-8?B?T09SQ01Ma09ONk9aQnVHR2pWMlBSY2lGcHlGWGxSL1hvTTJrOVFIQTdoUS9G?=
 =?utf-8?B?QW0yUEFWa3BtcXMzV3cxdmd1bmY1V3JaeGZLWHB6UGU1ZXUyL3FDVGliWkJi?=
 =?utf-8?B?cVRJN0E0LzB6TXJoK3JlUkRzWHpaLy9jRks5WlV3WXZjNytsdzZ1ZERNMW94?=
 =?utf-8?B?VXZBZXJCWFlEdHBpOFJvSGNmM1l1cUViNEgrQVU3b2pMaWZxSWVVUFdRQ01Q?=
 =?utf-8?B?Qlg1NDY2Z2JCVnZYbUNkQTlPN0ZtU2VITEdNN2dBWWl0aUxMY2hka0MxSkg5?=
 =?utf-8?B?N2Z3YVlkSHBwTVRvQmZOakM0VHBvZHc1UFpuWDVKTFBycGhuWHY3TDZOdVdn?=
 =?utf-8?B?eFN0RUg2ZVdNQ2FnM0w4MW52Sk1qOFFEMUxjcnFRY084M0kxWUVKakFXdVNx?=
 =?utf-8?B?a202aVptMmk5OEk2Q0RwditFTHpoY1hzejA5akg1TTQwR0gyc2xOeStibE42?=
 =?utf-8?B?dFdoZ1NlNCtDV1VvUitDcnZCY3V1ejZRMFN1NkZDd3dpRytHLy92TjVTVGJM?=
 =?utf-8?B?ZDF6YW52WHRoL0x5MmszYXVRNGZ2YzF5bS9qb1FQOGJFZjh1aGNDT01Eamsz?=
 =?utf-8?B?MURUdXZBOFI5U0RrVjZqalJ2V1Bhdk1xK0VnT3lxb2pPbTlaYzlkSkMyN1l1?=
 =?utf-8?B?bkVOcFVNbmcvZ3U4V1lFOUY3Y1dHdldHRjZqNmFJSU5FVTl1SjNzdlZDZW5m?=
 =?utf-8?B?QWxJai9vMEZsTGhQdmRXNlgrOVRPczZTVGxWNDFmM050aVNZNmQxZzZCaVE2?=
 =?utf-8?B?cjZxVDR3SVMzZTBjZWlPc1QxZUl0NXlvYkdybktRQlNaVzh2MjUzL1J2bnRJ?=
 =?utf-8?B?L1IwSHBLb0ZpUXZHd0FSSzM5ZXdRanBpYitIQVREWnoycHpRZElUdXFvWVI4?=
 =?utf-8?B?MUFMNG5FV0syV0hnMDVCVEthczA4L2J0YWFva2FZZnVMMFN4SEwvMHdiejhT?=
 =?utf-8?B?amxrWUhpUG5tWlV0MVRRdGxxUXgvY2dCSGNZMjZSUXc0ak1LR1lVakgybzYy?=
 =?utf-8?B?MmRlcVhORUZvaERVNGtnbTJvakQ4VUVFSUF4TjBOb0VJUzZVb3Ava1ZHbjNk?=
 =?utf-8?B?SzZ5VmxWZ3NuVk9kejJ2RDlZeUwxMmdpbm9YQUF6encvZXNtSUtpNndqTk9w?=
 =?utf-8?Q?5zTk1xQcXl0+7X2bxHXeCpiYf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a4b685-a062-4b6b-4dc3-08dc481fb9a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:20:27.9089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II5GKeCveyf/nIzRMzchtz5AvBc+CWH9naqDme4DuCHdYLE7ib5NcBGCv86aptZ3OVtngsI34MAuc9I/R6G5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894
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

--------------q0KERAwqL4nZIW708vOsc0CY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/19/2024 7:43 PM, Lazar, Lijo wrote:
>
> On 3/19/2024 7:27 PM, Khatri, Sunil wrote:
>> On 3/19/2024 7:19 PM, Lazar, Lijo wrote:
>>> On 3/19/2024 6:02 PM, Sunil Khatri wrote:
>>>> Refactor the code so debugfs and devcoredump can reuse
>>>> the common information and avoid unnecessary copy of it.
>>>>
>>>> created a new file which would be the right place to
>>>> hold functions which will be used between sysfs, debugfs
>>>> and devcoredump.
>>>>
>>>> Cc: Christian König<christian.koenig@amd.com>
>>>> Cc: Alex Deucher<alexander.deucher@amd.com>
>>>> Signed-off-by: Sunil Khatri<sunil.khatri@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>>>    4 files changed, 157 insertions(+), 115 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> index 4536c8ad0e11..05d34f4b18f5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o
>>>> amdgpu_kms.o \
>>>>        amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>>>        amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>>>        amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>>>> -    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>>> +    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>>> amdgpu_devinfo.o
>>>>      amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index 9c62552bec34..0267870aa9b1 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group
>>>> amdgpu_vram_mgr_attr_group;
>>>>    extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>    extern const struct attribute_group amdgpu_flash_attr_group;
>>>>    +int amdgpu_device_info(struct amdgpu_device *adev, struct
>>>> drm_amdgpu_info_device *dev_info);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>> new file mode 100644
>>>> index 000000000000..d2c15a1dcb0d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>> @@ -0,0 +1,151 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright 2024 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person
>>>> obtaining a
>>>> + * copy of this software and associated documentation files (the
>>>> "Software"),
>>>> + * to deal in the Software without restriction, including without
>>>> limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>>> sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to whom
>>>> the
>>>> + * Software is furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
>>>> EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>>>> DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>> OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>>>> USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + *
>>>> + */
>>>> +
>>>> +#include "amdgpu.h"
>>>> +#include "amd_pcie.h"
>>>> +
>>>> +#include <drm/amdgpu_drm.h>
>>>> +
>>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct
>>>> drm_amdgpu_info_device *dev_info)
>>>> +{
>>>> +    int ret;
>>>> +    uint64_t vm_size;
>>>> +    uint32_t pcie_gen_mask;
>>>> +
>>>> +    if (dev_info == NULL)
>>>> +        return -EINVAL;
>>>> +
>>>> +    dev_info->device_id = adev->pdev->device;
>>>> +    dev_info->chip_rev = adev->rev_id;
>>>> +    dev_info->external_rev = adev->external_rev_id;
>>>> +    dev_info->pci_rev = adev->pdev->revision;
>>>> +    dev_info->family = adev->family;
>>>> +    dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>>>> +    dev_info->num_shader_arrays_per_engine =
>>>> adev->gfx.config.max_sh_per_se;
>>>> +    /* return all clocks in KHz */
>>>> +    dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>>> +    if (adev->pm.dpm_enabled) {
>>>> +        dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev,
>>>> false) * 10;
>>>> +        dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev,
>>>> false) * 10;
>>>> +        dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true)
>>>> * 10;
>>>> +        dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true)
>>>> * 10;
>>>> +    } else {
>>>> +        dev_info->max_engine_clock =
>>>> +            dev_info->min_engine_clock =
>>>> +                adev->clock.default_sclk * 10;
>>>> +        dev_info->max_memory_clock =
>>>> +            dev_info->min_memory_clock =
>>>> +                adev->clock.default_mclk * 10;
>>>> +        }
>>>> +    dev_info->enabled_rb_pipes_mask =
>>>> adev->gfx.config.backend_enable_mask;
>>>> +    dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>>> +        adev->gfx.config.max_shader_engines;
>>>> +    dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>>>> +    dev_info->ids_flags = 0;
>>>> +    if (adev->flags & AMD_IS_APU)
>>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>>> +    if (adev->gfx.mcbp)
>>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>>> +    if (amdgpu_is_tmz(adev))
>>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>> +    if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>> +
>>>> +    vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>> +    vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>> +
>>>> +    /* Older VCE FW versions are buggy and can handle only 40bits */
>>>> +    if (adev->vce.fw_version && adev->vce.fw_version <
>>>> AMDGPU_VCE_FW_53_45)
>>>> +        vm_size = min(vm_size, 1ULL << 40);
>>>> +
>>>> +    dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>>> +    dev_info->virtual_address_max = min(vm_size,
>>>> AMDGPU_GMC_HOLE_START);
>>>> +
>>>> +    if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>> +        dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>>> +        dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>>> +    }
>>>> +    dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE,
>>>> AMDGPU_GPU_PAGE_SIZE);
>>>> +    dev_info->pte_fragment_size = (1 <<
>>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>> +    dev_info->gart_page_size = max_t(u32, PAGE_SIZE,
>>>> AMDGPU_GPU_PAGE_SIZE);
>>>> +    dev_info->cu_active_number = adev->gfx.cu_info.number;
>>>> +    dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>> +    dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>> +    memcpy(&dev_info->cu_ao_bitmap[0],
>>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>> +           sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>> +    memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>>> +           sizeof(dev_info->cu_bitmap));
>>>> +    dev_info->vram_type = adev->gmc.vram_type;
>>>> +    dev_info->vram_bit_width = adev->gmc.vram_width;
>>>> +    dev_info->vce_harvest_config = adev->vce.harvest_config;
>>>> +    dev_info->gc_double_offchip_lds_buf =
>>>> +        adev->gfx.config.double_offchip_lds_buf;
>>>> +    dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>>> +    dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>>> +    dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>>> +    dev_info->num_tcc_blocks =
>>>> adev->gfx.config.max_texture_channel_caches;
>>>> +    dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>>>> +    dev_info->gs_prim_buffer_depth =
>>>> adev->gfx.config.gs_prim_buffer_depth;
>>>> +    dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>>>> +
>>>> +    if (adev->family >= AMDGPU_FAMILY_NV)
>>>> +        dev_info->pa_sc_tile_steering_override =
>>>> +            adev->gfx.config.pa_sc_tile_steering_override;
>>>> +
>>>> +    dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>>>> +
>>>> +    /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>>>> +    pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask
>>>>>> 16);
>>>> +    dev_info->pcie_gen = fls(pcie_gen_mask);
>>>> +    dev_info->pcie_num_lanes =
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ?
>>>> 32 :
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ?
>>>> 16 :
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ?
>>>> 12 :
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2
>>>> : 1;
>>>> +
>>>> +    dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>>> +    dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>>>> +    dev_info->sqc_data_cache_size =
>>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>> +    dev_info->sqc_inst_cache_size =
>>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>> +    dev_info->gl1c_cache_size =
>>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>>> +                    adev->gfx.config.gc_gl1c_per_sa;
>>>> +    dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>>> +    dev_info->mall_size = adev->gmc.mall_size;
>>>> +
>>>> +
>>>> +    if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>> +        struct amdgpu_gfx_shadow_info shadow_info;
>>>> +
>>>> +        ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>>> This failure is ignored in the present logic and rest of the information
>>> is filled. Probably, need to continue the same way.
>> Since this is the information that we are sharing with user and on any
>> failure we just decide not to populate those fields. By default all the
>> members are initialized to zero and they
>>
>> are updated when we have valid values. To me seems the right logic
>> instead of failing the complete call, we provide the information what we
>> have.
>>
> Actually, this is not what is really done. If you fail here, then this
> happens down the call. It doesn't copy, instead frees without copying to
> userspace.
>
> +        ret = amdgpu_device_info(adev, dev_info);
> +        if (!ret) {
Good point. Actually my intent was only to check the valid memory as 
amdgpu_device_info will be used in other places too but yes 
amdgpu_gfx_get_gfx_shadow_infocould also send failure.
I propose that to not send the error for amdgpu_gfx_get_gfx_shadow_info. 
I will update the patch with that information.
>
> Thanks,
> Lijo
>
>> Regards
>> Sunil
>>
>>> Thanks,
>>> Lijo
>>>
>>>> +        if (!ret) {
>>>> +            dev_info->shadow_size = shadow_info.shadow_size;
>>>> +            dev_info->shadow_alignment = shadow_info.shadow_alignment;
>>>> +            dev_info->csa_size = shadow_info.csa_size;
>>>> +            dev_info->csa_alignment = shadow_info.csa_alignment;
>>>> +        }
>>>> +    }
>>>> +    return ret;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> index a66d47865e3b..24f775c68a51 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev,
>>>> void *data, struct drm_file *filp)
>>>>        }
>>>>        case AMDGPU_INFO_DEV_INFO: {
>>>>            struct drm_amdgpu_info_device *dev_info;
>>>> -        uint64_t vm_size;
>>>> -        uint32_t pcie_gen_mask;
>>>>              dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>>>            if (!dev_info)
>>>>                return -ENOMEM;
>>>>    -        dev_info->device_id = adev->pdev->device;
>>>> -        dev_info->chip_rev = adev->rev_id;
>>>> -        dev_info->external_rev = adev->external_rev_id;
>>>> -        dev_info->pci_rev = adev->pdev->revision;
>>>> -        dev_info->family = adev->family;
>>>> -        dev_info->num_shader_engines =
>>>> adev->gfx.config.max_shader_engines;
>>>> -        dev_info->num_shader_arrays_per_engine =
>>>> adev->gfx.config.max_sh_per_se;
>>>> -        /* return all clocks in KHz */
>>>> -        dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>>> -        if (adev->pm.dpm_enabled) {
>>>> -            dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev,
>>>> false) * 10;
>>>> -            dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev,
>>>> false) * 10;
>>>> -            dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev,
>>>> true) * 10;
>>>> -            dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev,
>>>> true) * 10;
>>>> -        } else {
>>>> -            dev_info->max_engine_clock =
>>>> -                dev_info->min_engine_clock =
>>>> -                    adev->clock.default_sclk * 10;
>>>> -            dev_info->max_memory_clock =
>>>> -                dev_info->min_memory_clock =
>>>> -                    adev->clock.default_mclk * 10;
>>>> -        }
>>>> -        dev_info->enabled_rb_pipes_mask =
>>>> adev->gfx.config.backend_enable_mask;
>>>> -        dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>>> -            adev->gfx.config.max_shader_engines;
>>>> -        dev_info->num_hw_gfx_contexts =
>>>> adev->gfx.config.max_hw_contexts;
>>>> -        dev_info->ids_flags = 0;
>>>> -        if (adev->flags & AMD_IS_APU)
>>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>>> -        if (adev->gfx.mcbp)
>>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>>> -        if (amdgpu_is_tmz(adev))
>>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>> -        if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>> -            dev_info->ids_flags |=
>>>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>> -
>>>> -        vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>> -        vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>> -
>>>> -        /* Older VCE FW versions are buggy and can handle only
>>>> 40bits */
>>>> -        if (adev->vce.fw_version &&
>>>> -            adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>>>> -            vm_size = min(vm_size, 1ULL << 40);
>>>> -
>>>> -        dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>>> -        dev_info->virtual_address_max =
>>>> -            min(vm_size, AMDGPU_GMC_HOLE_START);
>>>> -
>>>> -        if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>> -            dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>>> -            dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>>> -        }
>>>> -        dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE,
>>>> AMDGPU_GPU_PAGE_SIZE);
>>>> -        dev_info->pte_fragment_size = (1 <<
>>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>> -        dev_info->gart_page_size = max_t(u32, PAGE_SIZE,
>>>> AMDGPU_GPU_PAGE_SIZE);
>>>> -        dev_info->cu_active_number = adev->gfx.cu_info.number;
>>>> -        dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>> -        dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>> -        memcpy(&dev_info->cu_ao_bitmap[0],
>>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>> -               sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>> -        memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>>> -               sizeof(dev_info->cu_bitmap));
>>>> -        dev_info->vram_type = adev->gmc.vram_type;
>>>> -        dev_info->vram_bit_width = adev->gmc.vram_width;
>>>> -        dev_info->vce_harvest_config = adev->vce.harvest_config;
>>>> -        dev_info->gc_double_offchip_lds_buf =
>>>> -            adev->gfx.config.double_offchip_lds_buf;
>>>> -        dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>>> -        dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>>> -        dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>>> -        dev_info->num_tcc_blocks =
>>>> adev->gfx.config.max_texture_channel_caches;
>>>> -        dev_info->gs_vgt_table_depth =
>>>> adev->gfx.config.gs_vgt_table_depth;
>>>> -        dev_info->gs_prim_buffer_depth =
>>>> adev->gfx.config.gs_prim_buffer_depth;
>>>> -        dev_info->max_gs_waves_per_vgt =
>>>> adev->gfx.config.max_gs_threads;
>>>> -
>>>> -        if (adev->family >= AMDGPU_FAMILY_NV)
>>>> -            dev_info->pa_sc_tile_steering_override =
>>>> -                adev->gfx.config.pa_sc_tile_steering_override;
>>>> -
>>>> -        dev_info->tcc_disabled_mask =
>>>> adev->gfx.config.tcc_disabled_mask;
>>>> -
>>>> -        /* Combine the chip gen mask with the platform (CPU/mobo)
>>>> mask. */
>>>> -        pcie_gen_mask = adev->pm.pcie_gen_mask &
>>>> (adev->pm.pcie_gen_mask >> 16);
>>>> -        dev_info->pcie_gen = fls(pcie_gen_mask);
>>>> -        dev_info->pcie_num_lanes =
>>>> -            adev->pm.pcie_mlw_mask &
>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>>> -            adev->pm.pcie_mlw_mask &
>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>>> -            adev->pm.pcie_mlw_mask &
>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8
>>>> ? 8 :
>>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4
>>>> ? 4 :
>>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2
>>>> ? 2 : 1;
>>>> -
>>>> -        dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>>> -        dev_info->num_sqc_per_wgp =
>>>> adev->gfx.config.gc_num_sqc_per_wgp;
>>>> -        dev_info->sqc_data_cache_size =
>>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>> -        dev_info->sqc_inst_cache_size =
>>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>> -        dev_info->gl1c_cache_size =
>>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>>> -                        adev->gfx.config.gc_gl1c_per_sa;
>>>> -        dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>>> -        dev_info->mall_size = adev->gmc.mall_size;
>>>> -
>>>> -
>>>> -        if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>> -            struct amdgpu_gfx_shadow_info shadow_info;
>>>> -
>>>> -            ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>>>> -            if (!ret) {
>>>> -                dev_info->shadow_size = shadow_info.shadow_size;
>>>> -                dev_info->shadow_alignment =
>>>> shadow_info.shadow_alignment;
>>>> -                dev_info->csa_size = shadow_info.csa_size;
>>>> -                dev_info->csa_alignment = shadow_info.csa_alignment;
>>>> -            }
>>>> +        ret = amdgpu_device_info(adev, dev_info);
>>>> +        if (!ret) {
>>>> +            kfree(dev_info);
>>>> +            return ret;
>>>>            }
>>>>              ret = copy_to_user(out, dev_info,
--------------q0KERAwqL4nZIW708vOsc0CY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/19/2024 7:43 PM, Lazar, Lijo
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6b00e84a-1720-4417-81bb-416ef6f01560@amd.com">
      <pre class="moz-quote-pre" wrap="">

On 3/19/2024 7:27 PM, Khatri, Sunil wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 3/19/2024 7:19 PM, Lazar, Lijo wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On 3/19/2024 6:02 PM, Sunil Khatri wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Refactor the code so debugfs and devcoredump can reuse
the common information and avoid unnecessary copy of it.

created a new file which would be the right place to
hold functions which will be used between sysfs, debugfs
and devcoredump.

Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c&nbsp;&nbsp;&nbsp;&nbsp; | 118 +--------------
&nbsp; 4 files changed, 157 insertions(+), 115 deletions(-)
&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
b/drivers/gpu/drm/amd/amdgpu/Makefile
index 4536c8ad0e11..05d34f4b18f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o
amdgpu_kms.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay.o \
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
-&nbsp;&nbsp;&nbsp; amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
+&nbsp;&nbsp;&nbsp; amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
amdgpu_devinfo.o
&nbsp; &nbsp; amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
&nbsp; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9c62552bec34..0267870aa9b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1609,4 +1609,5 @@ extern const struct attribute_group
amdgpu_vram_mgr_attr_group;
&nbsp; extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
&nbsp; extern const struct attribute_group amdgpu_flash_attr_group;
&nbsp; +int amdgpu_device_info(struct amdgpu_device *adev, struct
drm_amdgpu_info_device *dev_info);
&nbsp; #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
new file mode 100644
index 000000000000..d2c15a1dcb0d
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person
obtaining a
+ * copy of this software and associated documentation files (the
&quot;Software&quot;),
+ * to deal in the Software without restriction, including without
limitation
+ * the rights to use, copy, modify, merge, publish, distribute,
sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom
the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO
EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include &quot;amdgpu.h&quot;
+#include &quot;amd_pcie.h&quot;
+
+#include &lt;drm/amdgpu_drm.h&gt;
+
+int amdgpu_device_info(struct amdgpu_device *adev, struct
drm_amdgpu_info_device *dev_info)
+{
+&nbsp;&nbsp;&nbsp; int ret;
+&nbsp;&nbsp;&nbsp; uint64_t vm_size;
+&nbsp;&nbsp;&nbsp; uint32_t pcie_gen_mask;
+
+&nbsp;&nbsp;&nbsp; if (dev_info == NULL)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
+
+&nbsp;&nbsp;&nbsp; dev_info-&gt;device_id = adev-&gt;pdev-&gt;device;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;chip_rev = adev-&gt;rev_id;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;external_rev = adev-&gt;external_rev_id;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;pci_rev = adev-&gt;pdev-&gt;revision;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;family = adev-&gt;family;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_engines = adev-&gt;gfx.config.max_shader_engines;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_arrays_per_engine =
adev-&gt;gfx.config.max_sh_per_se;
+&nbsp;&nbsp;&nbsp; /* return all clocks in KHz */
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
+&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.dpm_enabled) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_engine_clock = amdgpu_dpm_get_sclk(adev,
false) * 10;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_memory_clock = amdgpu_dpm_get_mclk(adev,
false) * 10;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_engine_clock = amdgpu_dpm_get_sclk(adev, true)
* 10;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_memory_clock = amdgpu_dpm_get_mclk(adev, true)
* 10;
+&nbsp;&nbsp;&nbsp; } else {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_engine_clock =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_engine_clock =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;clock.default_sclk * 10;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_memory_clock =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_memory_clock =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;clock.default_mclk * 10;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; dev_info-&gt;enabled_rb_pipes_mask =
adev-&gt;gfx.config.backend_enable_mask;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_rb_pipes = adev-&gt;gfx.config.max_backends_per_se *
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.max_shader_engines;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_hw_gfx_contexts = adev-&gt;gfx.config.max_hw_contexts;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags = 0;
+&nbsp;&nbsp;&nbsp; if (adev-&gt;flags &amp; AMD_IS_APU)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
+&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.mcbp)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
+&nbsp;&nbsp;&nbsp; if (amdgpu_is_tmz(adev))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
+&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.config.ta_cntl2_truncate_coord_mode)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
+
+&nbsp;&nbsp;&nbsp; vm_size = adev-&gt;vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
+&nbsp;&nbsp;&nbsp; vm_size -= AMDGPU_VA_RESERVED_TOP;
+
+&nbsp;&nbsp;&nbsp; /* Older VCE FW versions are buggy and can handle only 40bits */
+&nbsp;&nbsp;&nbsp; if (adev-&gt;vce.fw_version &amp;&amp; adev-&gt;vce.fw_version &lt;
AMDGPU_VCE_FW_53_45)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_size = min(vm_size, 1ULL &lt;&lt; 40);
+
+&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_max = min(vm_size,
AMDGPU_GMC_HOLE_START);
+
+&nbsp;&nbsp;&nbsp; if (vm_size &gt; AMDGPU_GMC_HOLE_START) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;high_va_offset = AMDGPU_GMC_HOLE_END;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
+&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_alignment = max_t(u32, PAGE_SIZE,
AMDGPU_GPU_PAGE_SIZE);
+&nbsp;&nbsp;&nbsp; dev_info-&gt;pte_fragment_size = (1 &lt;&lt;
adev-&gt;vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gart_page_size = max_t(u32, PAGE_SIZE,
AMDGPU_GPU_PAGE_SIZE);
+&nbsp;&nbsp;&nbsp; dev_info-&gt;cu_active_number = adev-&gt;gfx.cu_info.number;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;cu_ao_mask = adev-&gt;gfx.cu_info.ao_cu_mask;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;ce_ram_size = adev-&gt;gfx.ce_ram_size;
+&nbsp;&nbsp;&nbsp; memcpy(&amp;dev_info-&gt;cu_ao_bitmap[0],
&amp;adev-&gt;gfx.cu_info.ao_cu_bitmap[0],
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(adev-&gt;gfx.cu_info.ao_cu_bitmap));
+&nbsp;&nbsp;&nbsp; memcpy(&amp;dev_info-&gt;cu_bitmap[0], &amp;adev-&gt;gfx.cu_info.bitmap[0],
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(dev_info-&gt;cu_bitmap));
+&nbsp;&nbsp;&nbsp; dev_info-&gt;vram_type = adev-&gt;gmc.vram_type;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;vram_bit_width = adev-&gt;gmc.vram_width;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;vce_harvest_config = adev-&gt;vce.harvest_config;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gc_double_offchip_lds_buf =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.double_offchip_lds_buf;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;wave_front_size = adev-&gt;gfx.cu_info.wave_front_size;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_visible_vgprs = adev-&gt;gfx.config.max_gprs;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_cu_per_sh = adev-&gt;gfx.config.max_cu_per_sh;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_tcc_blocks =
adev-&gt;gfx.config.max_texture_channel_caches;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gs_vgt_table_depth = adev-&gt;gfx.config.gs_vgt_table_depth;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gs_prim_buffer_depth =
adev-&gt;gfx.config.gs_prim_buffer_depth;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;max_gs_waves_per_vgt = adev-&gt;gfx.config.max_gs_threads;
+
+&nbsp;&nbsp;&nbsp; if (adev-&gt;family &gt;= AMDGPU_FAMILY_NV)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pa_sc_tile_steering_override =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.pa_sc_tile_steering_override;
+
+&nbsp;&nbsp;&nbsp; dev_info-&gt;tcc_disabled_mask = adev-&gt;gfx.config.tcc_disabled_mask;
+
+&nbsp;&nbsp;&nbsp; /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
+&nbsp;&nbsp;&nbsp; pcie_gen_mask = adev-&gt;pm.pcie_gen_mask &amp; (adev-&gt;pm.pcie_gen_mask
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">16);
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp; dev_info-&gt;pcie_gen = fls(pcie_gen_mask);
+&nbsp;&nbsp;&nbsp; dev_info-&gt;pcie_num_lanes =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ?
32 :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ?
16 :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ?
12 :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2
: 1;
+
+&nbsp;&nbsp;&nbsp; dev_info-&gt;tcp_cache_size = adev-&gt;gfx.config.gc_tcp_l1_size;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;num_sqc_per_wgp = adev-&gt;gfx.config.gc_num_sqc_per_wgp;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;sqc_data_cache_size =
adev-&gt;gfx.config.gc_l1_data_cache_size_per_sqc;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;sqc_inst_cache_size =
adev-&gt;gfx.config.gc_l1_instruction_cache_size_per_sqc;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gl1c_cache_size =
adev-&gt;gfx.config.gc_gl1c_size_per_instance *
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.gc_gl1c_per_sa;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;gl2c_cache_size = adev-&gt;gfx.config.gc_gl2c_per_gpu;
+&nbsp;&nbsp;&nbsp; dev_info-&gt;mall_size = adev-&gt;gmc.mall_size;
+
+
+&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.funcs-&gt;get_gfx_shadow_info) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gfx_shadow_info shadow_info;
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = amdgpu_gfx_get_gfx_shadow_info(adev, &amp;shadow_info);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This failure is ignored in the present logic and rest of the information
is filled. Probably, need to continue the same way.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Since this is the information that we are sharing with user and on any
failure we just decide not to populate those fields. By default all the
members are initialized to zero and they

are updated when we have valid values. To me seems the right logic
instead of failing the complete call, we provide the information what we
have.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Actually, this is not what is really done. If you fail here, then this
happens down the call. It doesn't copy, instead frees without copying to
userspace.

+        ret = amdgpu_device_info(adev, dev_info);
+        if (!ret) {</pre>
    </blockquote>
    Good point. Actually my intent was only to check the valid memory as
    amdgpu_device_info will be used in other places too but yes
    amdgpu_gfx_get_gfx_shadow_infocould also send failure.<br>
    I propose that to not send the error for <span style="white-space: pre-wrap">amdgpu_gfx_get_gfx_shadow_info. I will update the patch with that information.</span>
    <blockquote type="cite" cite="mid:6b00e84a-1720-4417-81bb-416ef6f01560@amd.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Lijo

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards
Sunil

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Thanks,
Lijo

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;shadow_size = shadow_info.shadow_size;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;shadow_alignment = shadow_info.shadow_alignment;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;csa_size = shadow_info.csa_size;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;csa_alignment = shadow_info.csa_alignment;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a66d47865e3b..24f775c68a51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev,
void *data, struct drm_file *filp)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_INFO_DEV_INFO: {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_device *dev_info;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t vm_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t pcie_gen_mask;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dev_info)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;
&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;device_id = adev-&gt;pdev-&gt;device;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;chip_rev = adev-&gt;rev_id;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;external_rev = adev-&gt;external_rev_id;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pci_rev = adev-&gt;pdev-&gt;revision;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;family = adev-&gt;family;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_engines =
adev-&gt;gfx.config.max_shader_engines;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_arrays_per_engine =
adev-&gt;gfx.config.max_sh_per_se;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return all clocks in KHz */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.dpm_enabled) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_engine_clock = amdgpu_dpm_get_sclk(adev,
false) * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_memory_clock = amdgpu_dpm_get_mclk(adev,
false) * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_engine_clock = amdgpu_dpm_get_sclk(adev,
true) * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_memory_clock = amdgpu_dpm_get_mclk(adev,
true) * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_engine_clock =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_engine_clock =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;clock.default_sclk * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_memory_clock =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;min_memory_clock =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;clock.default_mclk * 10;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;enabled_rb_pipes_mask =
adev-&gt;gfx.config.backend_enable_mask;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_rb_pipes = adev-&gt;gfx.config.max_backends_per_se *
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.max_shader_engines;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_hw_gfx_contexts =
adev-&gt;gfx.config.max_hw_contexts;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags = 0;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;flags &amp; AMD_IS_APU)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.mcbp)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_is_tmz(adev))
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.config.ta_cntl2_truncate_coord_mode)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ids_flags |=
AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_size = adev-&gt;vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_size -= AMDGPU_VA_RESERVED_TOP;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Older VCE FW versions are buggy and can handle only
40bits */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;vce.fw_version &amp;&amp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vce.fw_version &lt; AMDGPU_VCE_FW_53_45)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_size = min(vm_size, 1ULL &lt;&lt; 40);
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_max =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min(vm_size, AMDGPU_GMC_HOLE_START);
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm_size &gt; AMDGPU_GMC_HOLE_START) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;high_va_offset = AMDGPU_GMC_HOLE_END;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;virtual_address_alignment = max_t(u32, PAGE_SIZE,
AMDGPU_GPU_PAGE_SIZE);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pte_fragment_size = (1 &lt;&lt;
adev-&gt;vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gart_page_size = max_t(u32, PAGE_SIZE,
AMDGPU_GPU_PAGE_SIZE);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;cu_active_number = adev-&gt;gfx.cu_info.number;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;cu_ao_mask = adev-&gt;gfx.cu_info.ao_cu_mask;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;ce_ram_size = adev-&gt;gfx.ce_ram_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;dev_info-&gt;cu_ao_bitmap[0],
&amp;adev-&gt;gfx.cu_info.ao_cu_bitmap[0],
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(adev-&gt;gfx.cu_info.ao_cu_bitmap));
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;dev_info-&gt;cu_bitmap[0], &amp;adev-&gt;gfx.cu_info.bitmap[0],
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(dev_info-&gt;cu_bitmap));
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;vram_type = adev-&gt;gmc.vram_type;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;vram_bit_width = adev-&gt;gmc.vram_width;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;vce_harvest_config = adev-&gt;vce.harvest_config;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gc_double_offchip_lds_buf =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.double_offchip_lds_buf;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;wave_front_size = adev-&gt;gfx.cu_info.wave_front_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_shader_visible_vgprs = adev-&gt;gfx.config.max_gprs;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_cu_per_sh = adev-&gt;gfx.config.max_cu_per_sh;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_tcc_blocks =
adev-&gt;gfx.config.max_texture_channel_caches;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gs_vgt_table_depth =
adev-&gt;gfx.config.gs_vgt_table_depth;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gs_prim_buffer_depth =
adev-&gt;gfx.config.gs_prim_buffer_depth;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;max_gs_waves_per_vgt =
adev-&gt;gfx.config.max_gs_threads;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;family &gt;= AMDGPU_FAMILY_NV)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pa_sc_tile_steering_override =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.pa_sc_tile_steering_override;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;tcc_disabled_mask =
adev-&gt;gfx.config.tcc_disabled_mask;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Combine the chip gen mask with the platform (CPU/mobo)
mask. */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcie_gen_mask = adev-&gt;pm.pcie_gen_mask &amp;
(adev-&gt;pm.pcie_gen_mask &gt;&gt; 16);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pcie_gen = fls(pcie_gen_mask);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;pcie_num_lanes =
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp;
CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp;
CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp;
CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X8
? 8 :
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X4
? 4 :
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.pcie_mlw_mask &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X2
? 2 : 1;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;tcp_cache_size = adev-&gt;gfx.config.gc_tcp_l1_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;num_sqc_per_wgp =
adev-&gt;gfx.config.gc_num_sqc_per_wgp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;sqc_data_cache_size =
adev-&gt;gfx.config.gc_l1_data_cache_size_per_sqc;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;sqc_inst_cache_size =
adev-&gt;gfx.config.gc_l1_instruction_cache_size_per_sqc;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gl1c_cache_size =
adev-&gt;gfx.config.gc_gl1c_size_per_instance *
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.config.gc_gl1c_per_sa;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;gl2c_cache_size = adev-&gt;gfx.config.gc_gl2c_per_gpu;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;mall_size = adev-&gt;gmc.mall_size;
-
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.funcs-&gt;get_gfx_shadow_info) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gfx_shadow_info shadow_info;
-
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = amdgpu_gfx_get_gfx_shadow_info(adev, &amp;shadow_info);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;shadow_size = shadow_info.shadow_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;shadow_alignment =
shadow_info.shadow_alignment;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;csa_size = shadow_info.csa_size;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info-&gt;csa_alignment = shadow_info.csa_alignment;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = amdgpu_device_info(adev, dev_info);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(dev_info);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = copy_to_user(out, dev_info,
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------q0KERAwqL4nZIW708vOsc0CY--
