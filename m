Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F84FB11F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B8710E09E;
	Mon, 11 Apr 2022 00:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F3610E09E;
 Mon, 11 Apr 2022 00:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsK8Je1RBl4pf5J5hvyC3yYtuNjA3nivPAIfuIgMUayDD7WaNkROsdK5xr8chkwMu3Bw5PxmV+wAQD0ZThWDPdxU7zxbA8tcBt/CHaDfbf7dhJbI4HCNFTdof/HOImBxZOKa3kHIhg+J1xIADhULw0sGdGKGWATtXjkMnQCOLm3ZXxrWUfLLh+j93naXuxlDjUl2O5H3qCdKTo9GQLBUMjfiDKyWk9Bj/CEk0JUB7I7VRPDDr6XpNUykSjzBGd5rJPzcuuwJyqje4OKdmU57wHoWnBu2RhTiJk3Otdnq0o2u0AOKsKU7FEpji6WrvJPPYrYGWDgYINgfcL+aFQG1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEuXgWIM+XD7qnB0RN6glE6z2YYPSFI/7UzLYaxsq0c=;
 b=cuXJSBtGgJPm6Y5crmbkxhk5Z1Lf/ewqRpVH9ZqHC4irmRcaah28LwVwDdmIKH0a0AjTA8pAnvP1SNHrqJT3NojvXKBgA2fR7ZPJ9GxBvyHDG/rLDu2knnIyenlHzX15ADj2gKIkno9/LFwHQpM4mlVhNBW7ATcP90DwzV13z1uzHuORiQ/RyXMdnlfqyd+LxMHOiwAH65rYySy53xFEjlafNyCnYitsSXU4KVyAYzC8+OKH0G1o4R+4xdPOqzjX/sU1kTMyYBi4idzvEBRUG4HFMk/RejfKE1CQSFnyZnsxJ2RZi//cXTXeK1VQXW3UN26+8ODJeSIXyyrjRiLz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEuXgWIM+XD7qnB0RN6glE6z2YYPSFI/7UzLYaxsq0c=;
 b=uDl7H6AU3boQe7YVkfEb9GWMi7mmRj5OyEL+DPg0U8a8JLTJkhMB5N0Gu7chvbmT59xHfAVxhNJLh8gYOdDxt3cUxT3kDhqtaWhwiduDG4XRcVMNxDPfO5WuQdXmE9d37NFDuKrPpxvBYnfijlUqo9zj6Skk1FJF0y4XO2dYGbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by DM5PR12MB1497.namprd12.prod.outlook.com (2603:10b6:4:d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Mon, 11 Apr 2022 00:37:37 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 00:37:37 +0000
Message-ID: <cacb177f-20e2-b50a-806f-777837fba693@amd.com>
Date: Sun, 10 Apr 2022 19:37:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:610:e7::9) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 124a1db3-ff42-43e0-f59e-08da1b537a3c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1497D56D3834281E8032AE2F95EA9@DM5PR12MB1497.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n19RkfZQPZBHlnOtieRxGrUF5WerKjrawgWarnYvMBbdHIPhRhIgFPwjOqStJsZ5jtVSGhWwqzVMtNzOCGBzS9LAZPXbCq4oPcmNEB6xXCc0rz4D29dfJrB/NKMjnKWfb3ek0zlg8UMe1R+5dMbVc9V4L7QKgNaX6VmrL2fO6T+FHQAwdwZX2L3h1aEo+hgjOymUCkNljzVVAFP+mSx96t3MkNBGzLYsdYTyniecIZ4ikkfURhiW2bm9zORSoy9FPhjwvwukR734m/5CAcVNUU3qUpcZVQtPvJYTvDDu2RAct08LP1mx+6kz9bisKIKi+J/9QlVnaXvyzDI069mBczGEGJDA2vQJofLkVl3k2xrJeCXi3qjaFTtzrCoRDSyICoXt7LVaKdPTO3k0yIaEuzuHmoZeQr5frLVlNV91AKy30GQ/zpmkwtRsoy0bHkkqEb1JgSwfc4s7PyLJfzA4/4K/D7rMjNy31uoJUn2fkBQrqLWFeL3AY2NFHv1u6ZED+TdWefTam796hpyxVMdSygfkDONhPf3L+IvlDSNitff+xi7eFPjNhgKQJW0MYxflIFm8WYl6mPTa5EZ6xT6tAYCdLZd+6ptQle9pVw39NO/g8/SYWp7pD8Hrbb1mZB6Dslp0kPlV+Binn/4XicLRlOymxg8qSAic3MGP/iNhehBlY10o9Q+DkWHpBCZ445h/ylBrv7WxXQ46nUIH7Cx3Op5Jv5YLHo7eYVzp3Fo+WGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66556008)(66476007)(8676002)(66946007)(86362001)(31696002)(38100700002)(8936002)(5660300002)(2906002)(83380400001)(6666004)(6512007)(6506007)(26005)(186003)(2616005)(53546011)(6486002)(966005)(316002)(6916009)(45080400002)(508600001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpqL0lwTjd4ZGFhdmVvRmFPc0VlcURyVXVPLytJaytERHlRRVU1bE1HMnVS?=
 =?utf-8?B?RDM1WCsrUkhVa0pnN3UvZGtoMlhmZjNjUDUvOGU2YUJ3U3o0cDNhbzJhazkr?=
 =?utf-8?B?cjVQek1lS3kzcHRESGJQeFpOeElUUzlFL0hyMFJZdDEyNDNLb0NHYXN3WXpU?=
 =?utf-8?B?YUFxWlhMb2ZiK2k1alB6NkorWDBneno3Wkl5T2VFU09PMVZrZDNybHlMVGdY?=
 =?utf-8?B?QkRmV2lCZERsV1FITllrWDB0S3lZZXQwQzBLdVQ0YisrdVc0MTdaL2Yrdm14?=
 =?utf-8?B?czVhbDZkOVF1SW9nUzVvYVc3VlF4dVd0emEwQnVpcEdSMEVORkducXA3UjhR?=
 =?utf-8?B?OWc4R0pUSkEzZVliam5MVW5EU0dNS0NEblBiZVhwdnhSZTNraWpTdEhjRTdV?=
 =?utf-8?B?MHVvdGlzbzBZYmdCdHdqN3VJajdGSDVCTEIzWEp3NEd5YWRCUS9UVFd6M002?=
 =?utf-8?B?RWtLTTQyU3FEd2hLc3paQk55L2J3S3QrRW9KQUJJQ1RPOFJ2QnZkUVBta2Jy?=
 =?utf-8?B?cjFPVDExMStuMmowcFBPS0ZEcnBoN1U2RnZTUktTOHkvazhOeFVXYnMxOE9Z?=
 =?utf-8?B?d0tnR1hFS1ZqQXVkc1F5djdncXNTNGdFbmRqeEl4VGhwWStIS1kyZzFpTGpE?=
 =?utf-8?B?MjVwTWVwSld0YUVqTWl5VzBiQzlTM1hWLzdvME96bmJkN2dFM2Z0djBHTEw2?=
 =?utf-8?B?KzBadlVBTmVXTUZvOENhakREZFpqK3d2WlBXaC93QUxjTzBnN1R0TXkzNDM5?=
 =?utf-8?B?MXZZZXROSFJXaWtZL3BGbFlFeFNodnNNSlVlUDhhUHIrbHZTNllKYVI2aTNU?=
 =?utf-8?B?Lzl2dUJJV2JIMFNXUHVkMUJ5NGpWT044dyt1M000QnJxTi95NjVuY1IzbmFO?=
 =?utf-8?B?STRYSmMxNXE0WnJuY1FCU2ZtbnoxTUxaRjFwdTVHS09DVFFPZzNTM1UvOUU4?=
 =?utf-8?B?Y1JldC83MVBsYjcrd1VXaS9FdnY5MnNJVFp1dEVjdjFxWTNLNDFPTHZtOGVE?=
 =?utf-8?B?V042MGZQVk8yZEtSVDJQU28wSU1RQzlWRkh3bm1tZmhUQjFjZmcybENJVUM4?=
 =?utf-8?B?Z3U0NjU1VEU4NVFaTnNGcm1ONXU2QmxjRmZmMm5VTWlnY0ZGUXBIWHJxSDlG?=
 =?utf-8?B?dE8wbm5mdWVFU1Z3bWI2UGtpZ1ZyY1gxeHgxWUgySUczWlo1b1FPcGh6dzFr?=
 =?utf-8?B?UysxbDc4SFdsTFdweklFamhaUXhwRnZNU3FYclN5V1paanlEOSttZEsxODBm?=
 =?utf-8?B?alVuOVBTZ2lWdzI0T1ZVOS85OHZ3T0dlSEIwY0IyNHFEVmp1eVB0VVBlbmpw?=
 =?utf-8?B?ejZEemVXV3RtYUxtSnFMUWovS29FcDhadFRwWUZHVnZxVEhGWFpMek9sN0Fo?=
 =?utf-8?B?TVBTVmNsQml5R1ZRazJhTXFzWnRMeHZmUUdpeVB2bFo4cE0rdDdEa3lJa3VK?=
 =?utf-8?B?MGh1NStJN0F4YVoxbjF5SEJNQ2xmSU5SRTBXWENlRHE5bWpCUzN0U1pOblNt?=
 =?utf-8?B?ZXd1TlRoUmxFcEh2bXNvU2ZtMmhueEY3Q1hIOHpFRkMrOHRWUzBKbnk5RFVC?=
 =?utf-8?B?cjNOQjJPdHIrK1ZXSngzR1I2b2NNYUNnTzZmYU5CaEpHbjNhSFRxUW54N2RI?=
 =?utf-8?B?ZFdTMFVPU2hlc0RTdGRtelRYSlVIV2VqSlNRRlRmL2JORi9Kc1ZKLzhKYnBU?=
 =?utf-8?B?MjByNmpRUHJvemY1czlmYUloaU1BWFNNdmNrUmR3UlhwUVBHOUVuUnpIempq?=
 =?utf-8?B?c2tJQlFldDhxTytFK0FRbjcxdDJNYzVjM3U3SDRKaU4yN2JDOTBvSXlMK1c1?=
 =?utf-8?B?Y1k3TGZBdG5HczFmWlJJZUdJM1MrZkhLYzhucmN6UzF3bXNBaGZyOS8rVGha?=
 =?utf-8?B?aXVkTWpHS280dmRvSWdnMGVHUnMrR0phQjlKWllZSC80MEtxVDVPcUwrdWxZ?=
 =?utf-8?B?MDA1OXZDTzI4UExjWWcweUlwT1dveVExOGxsL0RQK2NYUG5meXNSUlowK1dj?=
 =?utf-8?B?TURnNVBxMEhib0lrU3pDclIydThLWSsrNTE1MEdWZGVQZXpaaHhOWGVFcmZQ?=
 =?utf-8?B?bHh1L29NSzdHRVNwZ3ozUWYyWXJQZUg0bFBncEErWXEvRGkxN2N2ekMyS2h0?=
 =?utf-8?B?UFJNUWx4Rk5jZjEvd2ZZWTI4aGhQNzlmSUZvOHI4bTNiZGl3emsrSGJ6cmtW?=
 =?utf-8?B?S3A1c2xMcnJ4cCt3S0psV0lMVzFpNGFXTXZQQm9UcHZxdnZaa281aHBtVDd2?=
 =?utf-8?B?YUJvaVkwdDlCQjd5QnN1cThobllBaTF2NU1ZdzR4aktZckM4MnVaQ3BiMEFL?=
 =?utf-8?B?M3NDaGJDSVNXLytqRUF5blEzUEs0NCtDSTlMMFJ6bzBwZE5vN3dvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124a1db3-ff42-43e0-f59e-08da1b537a3c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 00:37:37.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6j5sy6BE1bGxiQb8yeNsk1DejyCXFtQPFBCE9Y7l/dbmELwuFGcNAKYqwLFHBhD93FkChfDZfr/Wzc3WpGXgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1497
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, xinhui.pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 mario.limonciello@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/8/2022 7:19 PM, Paul Menzel wrote:
> Dear Richard,
>
>
> Thank you for your patch.
>
> Am 08.04.22 um 21:05 schrieb Richard Gong:
>> Active State Power Management (ASPM) feature is enabled since kernel 
>> 5.14.
>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>> used with Intel AlderLake based systems to enable ASPM. Using these GFX
>
> Alder Lake
Actually there are 2 formats (one with space, another is w/o space) in 
the upstream sources, so I will keep that unchanged and use the format 
w/o space.
>
>> cards as video/display output, Intel Alder Lake based systems will hang
>> during suspend/resume.
>
> Please reflow for 75 characters per line.
>
> Also please mention the exact system you had problems with (also 
> firmware versions).
>
>>
>> Add extra check to disable ASPM on Intel AlderLake based systems.
>
> Is that a problem with Intel Alder Lake or the Dell system? Shouldn’t 
> ASPM just be disabled for the problematic cards for the Dell system. 
> You write newer cards worked fine.
>
>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>> Link: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7Crichard.gong%40amd.com%7C6b94ff2249244c04974e08da19bea71b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637850604066094079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2FiF%2Bnwzm5RlClT%2Fv%2B0RJvmVwsc%2FiwV3jCiFq7PB84wM%3D&amp;reserved=0
>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>> ---
>> v2: correct commit description
>>      move the check from chip family to problematic platform
>> ---
>>   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 039b90cdc3bc..8b4eaf54b23e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -81,6 +81,10 @@
>>   #include "mxgpu_vi.h"
>>   #include "amdgpu_dm.h"
>>   +#if IS_ENABLED(CONFIG_X86_64)
>> +#include <asm/intel-family.h>
>> +#endif
>> +
>>   #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 
>> 0x00000001L
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>> 0x00000002L
>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>> amdgpu_device *adev)
>>           WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>   }
>>   +static bool intel_core_apsm_chk(void)
>
> aspm
>
>> +{
>> +#if IS_ENABLED(CONFIG_X86_64)
>> +    struct cpuinfo_x86 *c = &cpu_data(0);
>> +
>> +    return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>> +#else
>> +    return false;
>> +#endif
>
> Please do the check in C code and not the preprocessor.
>
>> +}
>> +
>>   static void vi_program_aspm(struct amdgpu_device *adev)
>>   {
>>       u32 data, data1, orig;
>>       bool bL1SS = false;
>>       bool bClkReqSupport = true;
>>   -    if (!amdgpu_device_should_use_aspm(adev))
>> +    if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
>>           return;
>>         if (adev->flags & AMD_IS_APU ||
>
>
> Kind regards,
>
> Paul
