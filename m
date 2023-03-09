Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F86B2C99
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 19:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F6510E8D2;
	Thu,  9 Mar 2023 18:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AFB10E8CB;
 Thu,  9 Mar 2023 18:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQ6KK73Q38IAEz/QkwoPfreq3UoMFa9LxXnpK6AiH051rUVrIg0ihiJQrIOTeMMRoMuAqoScoWH+DLF9w0G9EBrLSgvo6USHDXQ/qXEK9sxum80Bg1PA1q7mlvCdrEXy0piLGxQPJduABQSQTnlCKm7s6nbNqEYp0k9Qf4aTfrf+lhzZo5D8vvmJoI97NalMh6J02+U4wqLPpf/BwnecX3IGTaHWFJDNQ5ph+7HlxQ4tPRaURnighv4TTa4yKRXtp9qYqT1yAYQsW9rR4arRF2aFLS3voW9IkaCFDFRYu9AbkrPBzwkaAP6n6OMwfN6/kYfocJhx1I7m/NfxQlLERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbZxFR1lWT9aJK32Ig945hSFqv0/6WTY6Wh2z6cdGG0=;
 b=Tm9UPOTyV4etAFH+rbIGr04aNj+V16It0uooVOzzIBFlqfSymMbSIP/UjGALSG0rRjkX0mxsDVIqXZdyJJ3QOMfc9DX1QNpwsn25aA2MXkHhKeWEMbQkvDLj+EBoWg+Fav3/0oiKsuXl0TqhBdM4DDo4HI20wqbQLjCfhpu1XlCZAuTmZNL9hMIINj/Y1lsSQGLwa6Gf1p7t0Jgikq8IXMZSncxEgiZwuF9QUQS8hIVI8xBClNPDsrwUNbzSdYTBif13U1kJGC0C2Uo6MXa0ZCvAEZUa+AeBspW/49V5QhKQ+3BP8EMRh8hqqfPrsmew4dBRbXp+IA7XTBdWtuzDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbZxFR1lWT9aJK32Ig945hSFqv0/6WTY6Wh2z6cdGG0=;
 b=p3ROtxWVetjw/VuIqvrCG94UUc3m642qQhBEU1GWO+CZcnaL7b3+4i84VWw3n8hfuRKFrhYgf8/yXIhpqXz5OM7ck3/k5o9cY8cGao7KqigseIzzrdMz73SNePPchzSxVHStCr1hluDn7sUKr2OfV3B2OJlAvKkLHUq5CkElrpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 18:05:01 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::dcbe:dda5:a90d:eba3]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::dcbe:dda5:a90d:eba3%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 18:05:01 +0000
Message-ID: <c7467047-737e-75c4-5c14-c1f05a30d6ac@amd.com>
Date: Thu, 9 Mar 2023 12:04:58 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.3
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20230309043816.7840-1-alexander.deucher@amd.com>
 <9bdb3857-c7c1-0964-270e-41717cce0536@amd.com>
 <CADnq5_PPTOChDcfv-aL3AWU_a+OTQntSNS86WNAxNELDsuXzjQ@mail.gmail.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <CADnq5_PPTOChDcfv-aL3AWU_a+OTQntSNS86WNAxNELDsuXzjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0024.namprd12.prod.outlook.com
 (2603:10b6:610:57::34) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2730ca-e466-44eb-fd3f-08db20c8cd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMcaxS53CdDc09mNTi7amXsdfI0D+LKK3aci4j5VCs+X5q/QkiEx4i7R85TShGlXFnbLwVy87TtrEN87nSLUuWp9tKGPM33Yv0lJmB45P8hWco7f3S59Y9U6PRRNafWdnEHRQnkzOz8kdJV8zfNI0FhdRG3PV0xghuPaK9LB5Y2IKte8lKaXZi4K4fLPqSnqFw6P+AU+g3LJZGhC2gKgF3DIrLC4KwTRYihhZOUKsee8qFtEwK+mlmDc4cOWbPwC6TIZL31TqRxYmZ47M6EZVo6YudR//2U6zYtV+VaS7ljx48scHJWTIOLQoVP/zwL3UZTegWTNz2DuPcZdqgUcvh7ezSSN3hePhIn1GVJSz/rRiNIEZkpnsXRe5l7+IqjMWgOGfuHy3EAkmn5xMPvRqnaTQw8yuJuTLg1Cn3JW7FeTxgCIgHRCNaJ0Y19h95jvj5FCRiBIR1xvlDUQ30//Xv9iAJ0ovdFDedpH6puwArEMN2v7OOFSTBCVkcbFfJq30jJPePiD/A1dmFswsk26Vl9GBR+pkz6fSwtPWIh99f6zKc2rUR4Z1bHHcwcH+7jUp94bOXVIWr9byi3IdmEb/n3z1ffXBKsbWoi9P2XNyCW5UwRfUV9B+pjRqje+Dh09262chIkRs3BbStN5KrS4NsElwKpFn5ko7S4FLfC5CJ++/Qyp3IprGSGUNQTg5ocH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199018)(110136005)(6636002)(186003)(36756003)(6506007)(53546011)(26005)(6512007)(2906002)(966005)(6486002)(8936002)(5660300002)(478600001)(2616005)(6666004)(31696002)(83380400001)(41300700001)(86362001)(4326008)(31686004)(66476007)(8676002)(66556008)(66946007)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWY1dW5SdWd4Nmp5SkFtWTUrM0dnVzVpOTY4dWprRUlQMmprRGp6UmIvZHRl?=
 =?utf-8?B?MElSVERqcE1rL1JXK1JER0xqVW1zcnZWMVVnY2RPNU1mSzRhdWZ0SmM3LzVq?=
 =?utf-8?B?bU1GUG5vNDdWdUJjcHFHSVM0TGg4cW9sVkVaUlBUbUZYQ2xwUHFNVGVwbW1T?=
 =?utf-8?B?SU4rTlF0Q1cwcHBMSnZMYjhPWUJRL2lZRllKaEQyNXlWWlNEWGtPOGNCYWpo?=
 =?utf-8?B?THdwUW95TUpRcFFuSWl4VzBjeHZZVlVOR2ZSMTRhWWw1dlpGUVR4U00vUDBE?=
 =?utf-8?B?RXpsNHdacVE3dUxVTU90bEhMbXZ0Y1RqTGx6TkVhUTRibDc5SXhDMzV1a0xQ?=
 =?utf-8?B?SVVTeGtwajdOSzg3Rjc5MWtnVWY4SEJRY1Q4ek8vNDNDUzFGZVdpd0ZCUlMz?=
 =?utf-8?B?MWFGOXlhR0syYXZHbk9sNlEwZXlWRDBCV09SSHA4VE12YmMvNWFkdk5SNGd4?=
 =?utf-8?B?SEk5M3ZLMmxYQjNRK2N4T2xHd2VEVlVHMW1jU0xZLzB4akZ3aTA1MktKTmJk?=
 =?utf-8?B?cUI4cDBraHptZ2JOQWZ5VzFXUlFYOGFvUTRidkQ5dFJWNTRhVms4YWpGYXN4?=
 =?utf-8?B?blRBL0ZadDI5U0djQjB3MXBTWW0zOS8zWmFDTVZUNjNUS3I3WGVZbEtrOWZI?=
 =?utf-8?B?ZGdFbXFoNWFPaWRXM3hmeFMxM1NpTEx4MDc5SXV3dU5oOTdmbEpUNC9PUitL?=
 =?utf-8?B?c3ZXV3BWaytMV3VuSHc0SGdzWjhpeXdNc0g4MUZwYzRYQnVLVmdTMmRXVyty?=
 =?utf-8?B?ZS9VMCtDVW1OWUlMdlQwc0s5Ti9tWUNzSlM1OVRsRXRhTThoUE9IQ2tUbnQ5?=
 =?utf-8?B?VTdzNlZ0akdzT08zZkNPQXk2QkltOW9tMXJVNzN0UENBcW55T2FFcnNhMVNk?=
 =?utf-8?B?YWRqMVdEaUVXbWEzTUFIQnYvOXp6VjhtNGk2T1NjQzVPYmd5eG1ya2l0SDNy?=
 =?utf-8?B?Y1E1T1p1dWVwU1VMelpkNmYrUnh0MmJZZ1JlVGpKN0ZRVmplNGNzb041Y3pK?=
 =?utf-8?B?MjNicG5rRW1rTEN0VXpQVXJQS29PQ21keXZZbXdreG83ajZDdDZlU0I5WHhM?=
 =?utf-8?B?TDV4YmtPQlcvMnhPU0JLR2p5aFA2ZEFvQ211bmNvNE5rd01abUlWWmErcmFh?=
 =?utf-8?B?d0NVSDVEVlNDSTkrT0ZRQXErZkNkSEF6Y3JTSUlxdzVybUU3ZEtqZUM0OUNl?=
 =?utf-8?B?NlJCVGRVTUtrWGtUQ1F3VDhVT2FBZUR5WGNpeHFZQm1Pdk1QbFNCai92MStS?=
 =?utf-8?B?Qy9jK1k0YjhRUy9VSnhRR25KUXVpQ2g1QzFZRDVvMzhCNGRwR1ZTOW5pUi8r?=
 =?utf-8?B?b20vQzVSUDhqRk85MlA3R1FHOWN0ZlFLMTBMOTFXb3pGSUZSV1ZQUTBucmJh?=
 =?utf-8?B?ZWRlNjRnV2dTNkVzK24ydGJTWURoU1p6NGZUbGhzTXpFMGIxQlBSdFAzTlRP?=
 =?utf-8?B?UGVpSTgxaHAyQ3ZxeVkvT1ZvV20vanlUSWhHQUdsd1R1VU5JTGF4cUNUMXdT?=
 =?utf-8?B?VEdkUkhOSytpTytPQy9sT3BGL0MvYk8xcE11OU5OcEY2MXpTUG1ycnZyaHJT?=
 =?utf-8?B?ZkFac3A1Nlo0Rm01Qmg5a29obXdBT1Y2MU5zVXR2WlZVZ3BlVzlxaS9nWCsy?=
 =?utf-8?B?Y1YzSVNTcXBzT1Z4cUgvNWo0SG1yeHloVUMwa0VWMitHZzZLN1BBUWlYckhn?=
 =?utf-8?B?ZEU1djJKQS9OSnNFT29wS0xrRnVZbUlQZUFOSzRZYUx5SVBmRDJYYko4S0NJ?=
 =?utf-8?B?b2JDQjVVU3hKbUZ6MEhzTmNpQjVVbVI4QzA3LzhMOXhVVmhSbTQrV0JZZ3Z2?=
 =?utf-8?B?aFlYRGhXSklCTHpZaDlicGtTeXdUZzU2OE0vUXg4REFmaUpDa1NyZy96bFk0?=
 =?utf-8?B?REptTFpRVDVIeTBuNk1BMGFFT1ZRd3FxTVNrOHRPcWlPb21MTGl2TVVPOGJY?=
 =?utf-8?B?U1NRNjBpTkpaYUl4Nk56MWlQNURHQXFUK3VkNnlNZ0NvS3d5bkVXQ3pYd3Q3?=
 =?utf-8?B?VnA4dWxJc01vczE0VklsVVJ4Vi85MFMwT2tjMHdBRTduWWhUSVI5VS9Oemwx?=
 =?utf-8?B?dkNUWTBHQW8xbE5YTFJyU3h0b1VNVTRidEVHajMwZTU3TnllNGY5alVrcWcz?=
 =?utf-8?Q?MteY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2730ca-e466-44eb-fd3f-08db20c8cd00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 18:05:01.2998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNwsXL3m0V8tfLz35ZCGs7WfV2HasnuYv5hAe2v4a1sUAGc+nUo+TlW15TIxPSxs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/9/2023 11:32 AM, Alex Deucher wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, Mar 9, 2023 at 12:16 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>>
>> Am 2023-03-08 um 23:38 schrieb Alex Deucher:
>>> Hi Dave, Daniel,
>>>
>>> Fixes for 6.3.
>>>
>>> The following changes since commit 66305069eb6d17d9190cbcd196f3f7487df47ae8:
>>>
>>>     Merge tag 'drm-misc-fixes-2023-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-03-07 05:42:34 +1000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-08
>>>
>>> for you to fetch changes up to 41f95a0e40903fcf70463fcc060b7faf761b23f6:
>>>
>>>     drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4 (2023-03-08 14:39:09 -0500)
>>>
>>> ----------------------------------------------------------------
>>> amd-drm-fixes-6.3-2023-03-08:
>>>
>>> amdgpu:
>>> - Misc display fixes
>>> - UMC 8.10 fixes
>>> - Driver unload fixes
>>> - NBIO 7.3.0 fix
>>> - Error checking fixes for soc15, nv, soc21 read register interface
>>> - Fix video cap query for VCN 4.0.4
>>>
>>> amdkfd:
>>> - Fix BO offset for multi-VMA page migration
>>> - Fix return check in doorbell handling
>>>
>>> ----------------------------------------------------------------
>>> Alex Deucher (3):
>>>         drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
>>>         drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
>>>         drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
>>>
>>> Candice Li (2):
>>>         drm/amdgpu: Support umc node harvest config on umc v8_10
>>>         drm/amd/pm: Enable ecc_info table support for smu v13_0_10
>>>
>>> Harry Wentland (2):
>>>         drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>>>         drm/connector: print max_requested_bpc in state debugfs
>>>
>>> Mario Limonciello (1):
>>>         drm/amd: Fix initialization mistake for NBIO 7.3.0
>>>
>>> Shashank Sharma (1):
>>>         drm/amdgpu: fix return value check in kfd
>>>
>>> Swapnil Patel (1):
>>>         drm/amd/display: Update clock table to include highest clock setting
>>>
>>> Veerabadhran Gopalakrishnan (1):
>>>         drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4
>>>
>>> Xiaogang Chen (1):
>>>         drm/amdkfd: Fix BO offset for multi-VMA page migration
>> This patch introduced a regression. Xiaogang is working on a followup
>> fix. I would recommend not to merge it yet.
>>
>> Xiaogang, please add a Fixes tag to your follow-up patch to make the
>> connection clear.
> Thanks.  If it lands today, I'll send an updated PR with the fix.  If
> not, I'll send an updated PR with this patch dropped.
>
> Alex
>
Will do it today and let you know.

Xiaogang

>> Thanks,
>>     Felix
>>
>>
>>> lyndonli (2):
>>>         drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
>>>         drm/amdgpu: Fix the warning info when removing amdgpu device
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 10 ++-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 17 +----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  7 +-
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             | 14 ++--
>>>    drivers/gpu/drm/amd/amdgpu/nv.c                    |  7 +-
>>>    drivers/gpu/drm/amd/amdgpu/soc15.c                 |  5 +-
>>>    drivers/gpu/drm/amd/amdgpu/soc21.c                 |  8 ++-
>>>    drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |  4 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  2 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 17 +++--
>>>    .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 19 +++++-
>>>    .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 75 ++++++++++++++++++++++
>>>    drivers/gpu/drm/display/drm_hdmi_helper.c          |  6 +-
>>>    drivers/gpu/drm/drm_atomic.c                       |  1 +
>>>    16 files changed, 146 insertions(+), 49 deletions(-)
