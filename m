Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDC782FB3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A810E29A;
	Mon, 21 Aug 2023 17:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9B010E298;
 Mon, 21 Aug 2023 17:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPMSeDDU6+aH28QGLebbDZVMiNBqj7oFNFwGkxUb1ToXzJXKLidPScfMP/X7F/IU8Ws92BhwhI5tn5QzdwCEqPSXTq+3EkG6sqjKLfEKl+XE3RzsXaRhFSm0Xed1AGybwIDAiu8fkyRwQ71ChFPxj8eNNO2gbOlpNoUG7+kJIULEIQ2YnBGiZFLMQVL/bXzB8uF7ylbE9LVg3vDNmZWiJuHpSruV7rMZT0F9RKmmfRgoJDi9T5Cz/PC4zymTibWCI0zk9vSOHw1DlmdNyoCwEVCPag+lY1n9joJ5Fxv2N96P6euJkLAIwe7T4eFldkgJ5+ai/akn8jzVhyJCuaZPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1DSp0JNVl68fgqDRIBuXNwPYR+sJeZ8incHaJKyNVM=;
 b=CybhMaKlV/7s2xxHXWKDJKCriD4Vblz+7i/LyzAW+4qhH6bUymU+JABJsHPSPXyUPa8ciGgwQOFTmAtiyNTSWVPhXgKcdZZdzpuPkfJeZqATGa/vTYTe6uvOMoFkTwNLnEV1/Ut5NYzVaqfnnlGtNbWbOaEumX/src5I7Xhzmx8IM+LsR9U0SwRUyYvcsUjT2ELp+TxmHBL4/ohVC6u2j/iHDhshwHd6MW2PLJSMJvaI/rfU4TB6tjIw/0yKsEwOE78vCOjpLSRcP3MfzOGm+HwU3U7OAu0WOf4GJtc5wyKznSKFoeTLmz/0tOw73j5iwpaeZeL0csmDMlTGu5IVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1DSp0JNVl68fgqDRIBuXNwPYR+sJeZ8incHaJKyNVM=;
 b=x4BKI43+rDdur9WtOvUYh1JGEwYzlrXI6lWYcbij7/F3jg9Wf5QQStqsVKZrDjL2GuQP+OqnJ3KVWu26JhVdimWrA7cgqHbl3nRHYd+P2yzsVBcRuOBpDT8ez6iSWoJThkjlffhBmbr/hxxPLc/xUAAbXdEvwU1YgS4LNjLWSr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 17:53:58 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 17:53:58 +0000
Message-ID: <fff2391b-fc18-af9f-6fe0-7b4c6650dcdd@amd.com>
Date: Mon, 21 Aug 2023 23:23:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
 <CADnq5_OBLh=fzsifOEhV3F2F1XGOcCujtVAba3KZ75MkY+tKHg@mail.gmail.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <CADnq5_OBLh=fzsifOEhV3F2F1XGOcCujtVAba3KZ75MkY+tKHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::35) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 12dbae70-c387-4a76-cb44-08dba26f9836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 817m/UcBxx5w9XkFOd53Ffz3WFxvrRYifbI/X1JsD94siqi/ADYPsPFTrga9vWCoYuuTT+DEfahIv1PVVXwzwfuGIge8vH+Cavf4h6uuOtO4nM2dtT/wKYi95WNGYVT80cW+A0Lnh06N9RHQhnuRRyPIjUPuOXd1dLxYrP0g2Gt/akDYQ7zf7myxjYvbcAbXEirsOF0kMY9PVu4OMwWQRoD9elRILOkY3hgIDZYEtCR+cuGrwfyUcb1ctfJgdD4120hkWkt+ndeCZ/iVGaRhvFww/t7soVe+33CQFEqlQbdfUDEDZ9M6R9GhGopOTzn/e/LwAm3vHrKg1q/bFCwMaqj5BHkG1jjjdjZFPuYbCJ8JkleEOSLwLQ1aYL7K9ush7zm4Sh2T53AWlyGkMtH5mPImm1BdHW9HNJG0Rn/0x+ezaQqcdXp6e0kGlwgBFTRmPbpNey+k6d0iVHjwZ/kVs2TY8r1it2zEfxdPX3qjKKgKlysUYsV+xqgVfSJ1DzEhAD4jt9mxRyIHEdFYhJoMHLpJ2TBFyiLkGBWX1rkzxevymCMithbACwhelINxNQhlWWrwUKq3W/254FKnxb722GSwrDdEJg4zqHdec8nxsdu67AV9qlw17SarIyhVPTZSCEmfMf8dpTlBNciUJZ8evw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(6636002)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJva2ZkUHFLUlNUeUpHVEZEOTZGNjFSRndJU2dtUzF3R25ZTTYwUktDR1ZU?=
 =?utf-8?B?YTVDdlhYV3ZwRDJKWkYrd0RQV3N4Q2lYV0tpNldVeG5yQTkrcXVQTytnQUhx?=
 =?utf-8?B?YUFVcTR2Q05URUV0MWQ0MFVnbnpjSS81Zm8wblByeUpkWE95SHllNVpzRU9W?=
 =?utf-8?B?U1YrYm1reW9KNUQxa0RrRmVDc2FLR0I1ck9GcndPZTVMYjdJa0JPRWNjTFhR?=
 =?utf-8?B?WUwvZ3NyZEF0NHplNFpFQ2tVMDd3TUpjS2NvczU2K2p4RDVMaFNoQlBSWkJD?=
 =?utf-8?B?RmtZL0Z0ZGVIRVEzZHJJbFZpUWN6aVoyelkrcU56ZEdHVnVKdUIxMGF2M2lC?=
 =?utf-8?B?eUxSRnZSTGU4Nmk0V0RzdGhrK1dKSGpwZjI1bDErRnZFRU85TjN6RGxCT3Fu?=
 =?utf-8?B?TVc4a0lPWnNOSFRWaG1GMUE5allXTy9KbzhsdXk3YkU5U1QzOGZYZGkrWS9M?=
 =?utf-8?B?cGFhbHJFaFFVN3ZTSU5Tb25vekpnaElTMDA1aG0zV2xwYmxtTTRyLzJSaURN?=
 =?utf-8?B?Q0JMcHdPQmNQVUgvdDdZeUlUNC9NNnR4OVI5TFA5ZzY4Y3FtSXFJbkhCWTJx?=
 =?utf-8?B?azJ3dGc5N0xwWjBUeE8ycHYvU1FvNGsvZGV0ay9tSnpOMnNvM1VscUtTbWNR?=
 =?utf-8?B?cUIxTjZHMGhUYnFndHpUSWlKcURQTkZQWkJkR2d1NkxibTF5TE9SUW5OMDk0?=
 =?utf-8?B?d0lEVHFMaGFGMWNoY2xibmo4QnA0TkdtYVFRb2xYdjE5S290ZVVzejVrU1VI?=
 =?utf-8?B?Y2VrZ3RFZDB2UlNwN3RZVGVGTzZaOW53bXBwZTJtYkVwQ1JmODV1M1N5WjlS?=
 =?utf-8?B?QkVFWjJSRzJFampEeTliQmJTMnRiYUlXYnl4R09laXlRZGdUTFI4SWphd0kr?=
 =?utf-8?B?TmRycEJ5Y25VL3VSMkhXS2VyV21EaGZMY1J0YkttUnBxVVpteTNmdXRnMTAz?=
 =?utf-8?B?QnBmd0I3U3FnZVowZWVHYThYRkFhYW9hWjM4S3YydEJ6SGN0OUFMUTc3S2lv?=
 =?utf-8?B?OXFJM2xjdHdIR3Iwclk0KzlOVjdzc0txWXlMUHZaVFVkeENaWlhEQ0pHODdC?=
 =?utf-8?B?K3BWQmJmYTV1MHZLVEd2Zkg0S3FMWFcvd09WRjNZenR1K3BweXdVQmxXVHZ3?=
 =?utf-8?B?N2hsMUtYU0Y3cUdUeW51cEZKK0NDcEtnWFFaL0xhS2xNdTMzY2RVMVpoRmFG?=
 =?utf-8?B?UHlFcmtDeGYvejFoc01RZGd4RG5YTm8rSExlNlJYNWNrSHErdkYzUzlwblVj?=
 =?utf-8?B?a1VUVjRQNnB1QWx5ZzVMQ1E0T3Q2YjRJUWJSbkQ3RjBhS1AyQk15RzIza0FI?=
 =?utf-8?B?S0M1Y0tCcysxencxNDZJZ1ZDVlNvdzlvY2JsSUhWTzNyYW9pYTRpajZOdWw0?=
 =?utf-8?B?Z1pXQUJYdEdEbWo5WXJuUWZtUnkxWGF6cTNhRHVMWHNjSXZ0dEFMRmF1WndS?=
 =?utf-8?B?NFIyRWV0YWxqNHNqQlpUNWF3cytpOTRKVXZRNGJqUHdQdVBQMFRQRW84NW9Z?=
 =?utf-8?B?cmtSVm9mQVJlU1VxVG9ONkxMVXNobGFwdStGdTJTNHdZYlhjVDBUemNXU2Qz?=
 =?utf-8?B?N2FsbGhQcUYwcDU0RHROa3IvRFBleW8wdFNWWGQ4WFgzWENRS2NvVURidmNZ?=
 =?utf-8?B?OThTbXBBb21uZUxSbnJoTW1oNTJQbEdDQStkTnc2MmZPWDVxM3FFUGRCZTI1?=
 =?utf-8?B?Mk9VZFh3b3Q4eFFRWVZ2TEx5V2dId0lURzVXam9CeDNoZ1RKWDBrVytPbHFX?=
 =?utf-8?B?WWNuUkZzVDdTKzlZaWlzbjdvWVB5YWRSdy9yK3k2dkZBUVgwakV2NEcxY2xQ?=
 =?utf-8?B?c3hBUkVudHNwSEdtMm1FamNMaE40R2RMNFN4aTA4U0NNWGt4ZG5tZmJvT29L?=
 =?utf-8?B?RmJ6Q1A3YUhweEQzSTc4a2R3K0w1OVBnM29YZnlTbTY5TEZIUzg3YkJYWm9y?=
 =?utf-8?B?dkM4OHNROGxhM0tlSDZTay9rdE91TmFVelBCcjRRSS9KOFRDemxrdVhwbUpV?=
 =?utf-8?B?K01XajVBSTVaMjhsNVI1Nmk3RGMwME11RUtNUkR6ZkYzRXFoVW04SU0wdXRX?=
 =?utf-8?B?VFM3OHpjNUxha20razNDalVsMTFaMTVxcUhGVEFmcWxiZHFFRHZuVi9GZWhr?=
 =?utf-8?Q?3284/fIBiUiTT2Jcg2jOR5ZG3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dbae70-c387-4a76-cb44-08dba26f9836
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 17:53:58.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX4dqrkSS0PWP7TEt1q3oj3gEVfUQMkXxa3nJq7BPjgsIZgaMF4WRk3za8qP+al9Y1a66VunNj8Uzz/vi8lzSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/21/2023 9:52 PM, Alex Deucher wrote:
> On Mon, Aug 21, 2023 at 2:55 AM Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>> This patch adds a function which will change the GPU
>> power profile based on a submitted job. This can optimize
>> the power performance when the workload is on.
>>
>> v2:
>> - Splitting workload_profile_set and workload_profile_put
>>    into two separate patches.
>> - Addressed review comment.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> index 32166f482f77..e661cc5b3d92 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -24,6 +24,62 @@
>>
>>   #include "amdgpu.h"
>>
>> +static enum PP_SMC_POWER_PROFILE
>> +ring_to_power_profile(uint32_t ring_type)
>> +{
>> +       switch (ring_type) {
>> +       case AMDGPU_RING_TYPE_GFX:
>> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>> +       case AMDGPU_RING_TYPE_COMPUTE:
>> +               return PP_SMC_POWER_PROFILE_COMPUTE;
>> +       case AMDGPU_RING_TYPE_UVD:
>> +       case AMDGPU_RING_TYPE_VCE:
>> +       case AMDGPU_RING_TYPE_UVD_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_DEC:
>> +       case AMDGPU_RING_TYPE_VCN_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_JPEG:
>> +               return PP_SMC_POWER_PROFILE_VIDEO;
>> +       default:
>> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>> +       }
>> +}
>> +
>> +static int
>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>> +                        enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +       int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>> +
>> +       if (!ret) {
>> +               /* Set the bit for the submitted workload profile */
>> +               adev->smu_workload.submit_workload_status |= (1 << profile);
>> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                                uint32_t ring_type)
>> +{
>> +       struct amdgpu_smu_workload *workload = &adev->smu_workload;
>> +       enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
>> +       int ret;
>> +
>> +       if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +               return;
> Why is this one skipped?  How do we get back to the boot up profile?

Hi Alex,

enum PP_SMC_POWER_PROFILE {
     PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
     PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
     PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
     PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
     PP_SMC_POWER_PROFILE_VR           = 0x4,
     PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
     PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
     PP_SMC_POWER_PROFILE_WINDOW3D     = 0x7,
     PP_SMC_POWER_PROFILE_COUNT,
};

These are all the profiles. We are using which is > 
PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT.
Now suppose the profile was DEFAULT and we set it to VIDEO, SMU will 
move the profile to a higher level.
When we reset the VIDEO profile then SMU will move back to the DEFAULT one.

Our job is to set the profile and reset it after the job is done.
SMU will take care to move to a higher profile and after reset, it will 
move back to DEFAULT.

ThankYou,
~Arvind

>
> Alex
>
>> +
>> +       mutex_lock(&workload->workload_lock);
>> +
>> +       ret = amdgpu_power_profile_set(adev, profile);
>> +       if (ret) {
>> +               DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>> +                        amdgpu_workload_mode_name[profile], ret);
>> +       }
>> +
>> +       mutex_unlock(&workload->workload_lock);
>> +}
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>   {
>>          adev->smu_workload.adev = adev;
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> index 5d0f068422d4..5022f28fc2f9 100644
>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
>>          "Window3D"
>>   };
>>
>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                                uint32_t ring_type);
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>
>>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
>> --
>> 2.34.1
>>
