Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E35B2577
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77CF10EB8C;
	Thu,  8 Sep 2022 18:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E3010EB83;
 Thu,  8 Sep 2022 18:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVc5jw+A+i7y6NuRiYPMXQGV5pe1oTDpaqw80k356HkbmUjipBeXh+C8j7Jk6KQLe2U9Lwz9fxOCZI+Ii2MgLfyPGI5rvwx05MYZ5Bj0p55jZHmKBP/DRiMwZaGyHTVBIsRtL9kNj8DVW3C83CLQbDg8XOmhUATifIO36jAIjxIl4OxbaxbA+huZJ9ni8s8mWxqFwockm4nDsmRaOIP2El+2rqGOO0VP8Xwzwtxd0hzXweUVmxXSlqX8B6v9/0O6va6GqBypkg8GzqNEm3UI+AG983Pv6MXvTowJJuW5o0aUItMa/ILpvmXUPp/3jNjQuSdc2ODz0NtD1rLfLIf5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y2Xw9AO9+epD5mdEkXUtE19fjHqnw/KJy/f24cBs4U=;
 b=NghirZc4hPfaoS78METIjeUxJMejRe61dqF7TkByDBzmuYL/X2/AGU8VmRSCfbBtYjZNEIPJt+l1rVuwOMaHFJmvb9rtOhxqzP8C4dF5Zf6eHVWzx8vBmgcgMYlgkg/CmgD/UV+7ca4biwjZeushk5JtrxdbRC5M71EIHBJQU2TySDvr+/jw8fbVHn3UCb7e+Lpy01i9b5sDo2TivRp+Bxb7FYrt+hp76tqEjJXDzErbw5dT/mbsInlPhPU3MpG+psCnIlaWaoxAbXOVKlbtgHRx0CHgqAOAdHHnu9qL5sscQS5h+kh5Pku14xFeFKv6J6M8ss5VnxuQotU/1MbJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y2Xw9AO9+epD5mdEkXUtE19fjHqnw/KJy/f24cBs4U=;
 b=fP01vJtN2V9WQrBob/XU3rok7P0vTQ/nqo0BA6iPJQ+r483cubzP/oF8L274KtoVHZ0bncZFC3jQH5eTxuS41XzkRO2vIBOX5xPwU8Zke89J3Ca4NiFvhmb0a+qN9J+vcmbYpfWbUTB+rkYQYFIZs6tNbhZDwPWxZLjfx8kmqVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5193.namprd12.prod.outlook.com (2603:10b6:408:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 18:16:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 18:16:40 +0000
Message-ID: <d158666b-e50e-57be-e6e3-e5bc5be7e893@amd.com>
Date: Thu, 8 Sep 2022 14:16:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.1
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220908155202.57862-1-alexander.deucher@amd.com>
 <2b5b57e7-9f81-45c4-1375-4577d3854bbd@amd.com>
 <CADnq5_PE_i-E7gLKOZh34U=Z9B7gV7EN6eaC5fuJ3EMdWhKkoQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <CADnq5_PE_i-E7gLKOZh34U=Z9B7gV7EN6eaC5fuJ3EMdWhKkoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0040.namprd14.prod.outlook.com
 (2603:10b6:610:56::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BN9PR12MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 598add5a-90b8-44cc-9d56-08da91c646a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5V5/D8ouR/o8mICJhdU+NJbcS7TpAXz4g9C73KV4Kl3jXoYuUvQHn/Q9qJumqMdc5GOJ7SmKCWebQ/hE+eC1y9KuJnbNiLnZ3Lg1KEARjDK6uqYAplvfGwLTdRR52NR8fEnQYUYR7hW5mjhDTwhos6m+kMHYVMZEoiTLqLmNUQHAPrzpk1LkkaYTjNVkCe4x22hFwot8+U1UVkh2pMZvbCPXkgoyDKOB7CUHb+P6Q1irF4W7C+Mf6RvlG1nHD7uHwYLP0aZKw2hLM4vu1A725Ej+lHopdHMFQCgZOd5TaH0WembtrBVmC02Fikk2Zg60TfHmgnovQtSZ9uHpXW0AIZDtGicaHm2EJoWwG8sPuzRohR2Q7Io1kqMm5NLDJ55lMzQjYAVo9a5g9bE9y1bE5vAf3a4J7On19D5I5PFiu8R1huErnz+FzyW7f/v7Ud9m4yMCL1fJyEWgTswCP+h59tdg8foOhc67bnxsB2atByKgzeAG4oObfQIq0rg4ELNOvw8DH8dN6J5Mz/NAG7lG5rFIDuEOSELwKYVok29JHisngVj1jYOSwiYlkoPxofojPooLXNRqeqt6CIN7MBYafI95mwgUfetIvzpguvjMtYO32TUs9Mt/ubzA7fundBxJp6ty6ZPiMR30Rlf2kapgEkayNtgQ288COip0Pz3EjbGxhOkRO4FAZ0y8U52cptXvs6UmqaKyGWWcM3oCWagzp52PmzwHh2DZm7pH8ePcSgPfV2ucIDa0eA189wTllFIl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(86362001)(186003)(31696002)(66574015)(53546011)(36756003)(31686004)(478600001)(41300700001)(36916002)(6512007)(6506007)(26005)(2616005)(83380400001)(6916009)(316002)(4326008)(8676002)(66476007)(6486002)(966005)(66946007)(44832011)(66556008)(2906002)(5660300002)(38100700002)(30864003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVFmclZ2QjZoV2tnNWJiSW5td0crd2hlRGlyZWZrU1U4K0IwTDJiY1dLbm5E?=
 =?utf-8?B?V2ZiekJ6cWRQa0E1SHpGQ1VBNHpnZmREdjJXaUVxdHdqeXlKd3RzLzM1WFZq?=
 =?utf-8?B?MUowek1HbUpQRDBla1p0ZlEwVm5iYlhEd1M4UVk1U3FwWXl6Y3ZmMDV6QjlN?=
 =?utf-8?B?L1hhaFc0RVFYVWxRbkNjbUkrVzlnVy9xNXNRdVYzTEhtUVlVSXUycUtuV3Rt?=
 =?utf-8?B?UGQxbUYwK28wMVBWY3NSTkRJNUR3dGxlZU1WUVdIRFBHQlN4dkg3RFQ5akRk?=
 =?utf-8?B?blNGOGRnNTBCNWM2bXE0cUNHZVpVR1AvYU5LSWtrWDdPSDdtc1FoWmtBQXRS?=
 =?utf-8?B?UFFERTRaWlRRSU55QzFGb0V6QUcreUVTcGlwR0oyWjNPcDZ2MSt2M2xDTVFE?=
 =?utf-8?B?TWxtbDFOMXNPekJ0cnRlclNRTWtOckMrZzkvRzQ2Yit0QVlmRk9NS3NSZ3px?=
 =?utf-8?B?ZUJSMWhtSkpsQzh4YitDWTVzZzQ2WXBPT3JuUnRzaFJTVDk5TUZNUkZjenJk?=
 =?utf-8?B?dTUrYVVsVllLZEpjdDB3REF4QW95YTJWVWdlOHhBdElPVklQeW1UR1BUemxt?=
 =?utf-8?B?bzJRNU41WFc5UE1FUlhqbFBLNkY3d2xiZjlONWNzSUV0MHdsRzlCNDg1NzZt?=
 =?utf-8?B?SlpzYk5TbVkrRit1NkU4aGNIbTljdWVHQmM0akpGREgzdGFTUDRUaGJUNkxo?=
 =?utf-8?B?QzNTWkRuY0dRaUQ5QXNqSGcxN1VSZFdzdHJlYWR5WWdPUEdPQ0ZLcE5Kem9z?=
 =?utf-8?B?Slg3V0dKVmlOMldQa1JrNFdFVGdtRVFZS095MDlnYk5INDZNSHVUUEZLZ2RU?=
 =?utf-8?B?aEk3S25MR212Wmw1TWpQNjRqUThjdlBFTzlhZzl1RC9OTHdHWXhtZzhCZFNP?=
 =?utf-8?B?d0ZiV29HVlpuK1lOQnRIM0hQQ1dUaUdCbURSNEtBWTEyeFZnb3ZEWEhwUnc5?=
 =?utf-8?B?aUhvUlNoaW8vYWdnanFFWGw1L1R1QnVQWHBiZ3VwbGc0RUEvS2lneFJaU1g4?=
 =?utf-8?B?MHB3Z0k1SXI0Q3dFZXE4L0JnR1RMb0Fram1vMnNhWWhvM29CTE54WVh5VlN3?=
 =?utf-8?B?aENjaVlCZkVXZCttZ0x6NDdDcFdvbDJybzFRWEpKV3VkeXlVZlRPRk5EKzl1?=
 =?utf-8?B?YXB6ZXplQzhobVFzZFNWamN2ZC9RQ2RKa0tEd2JGNXV6TC9lTXVhSzU5TFpS?=
 =?utf-8?B?SHZjS2tRTHJaK3M3enRjUllkbHhnTXdWNkdmUmFGdjBWV3lqUkVueWRNNVFm?=
 =?utf-8?B?VzNTMURxZVlvSm1jdzdTamFSMlN1R2dPaW1NZEFhZFdYTG9GazNkWHJRVVVD?=
 =?utf-8?B?TEpBNmFOd2lVRXFtdEFZdFlhRmh1dWg4VHF3a3ZEVlMweCtWL2Ewa2hKUTIz?=
 =?utf-8?B?Z0E1UC80WHBhUnBxWjJkdWZEZU1lenZNQWNNWUwya2lOdFRiZSt5TDd4S0ZZ?=
 =?utf-8?B?SFBIcTdPYUZXOGdLa29DRE16Nkdkb2lDekpDcFRqMlBTZXo4VTVOZElRQWZS?=
 =?utf-8?B?RGttRVFsemlPK0VjL3B1ditMWFFjU2hFM2dVSHExQVBzbExvZzFucXdONE9X?=
 =?utf-8?B?Ly9VNUtFay91bllTUzRobFFoS0RZc3JYV3lzam4rSy9nRVluWkJYS0V1VUF4?=
 =?utf-8?B?MXVPTzdKaGZIYldNdVQ4Qk1WN21lZnBjNFd3cGhoeEhvb3dpWEd6YTF0MWYx?=
 =?utf-8?B?NG1ZUDNzeTVwNVlSbEJxcG5LTzQvNTN3Q1RxRlFqQ1Jzc0lOV3NES3lGZ1lv?=
 =?utf-8?B?cmZTZnNBekZlb3doZUd2dm9qakh1N2lzY1lXWm1raHJwWmVMYnNUbDJ0Q3pT?=
 =?utf-8?B?bTluaUlZK0I5WEZzMFY3WWVrWFhQSnFYVzNIZXJua3BtSTNjMSsyWC9xWFVk?=
 =?utf-8?B?dDJDZzREQTN6UVlwdno2K3l2aEl1eEo2NDkyU3lSRXd3N1V4cjdaRFdVL1h5?=
 =?utf-8?B?bVBYNzZrOXc4dm1OOUdGOHRidmNsMTNZcExSZXhoQWF1cWxLc1JrVkRsMzJC?=
 =?utf-8?B?anFobWJjZ0VERXFoc2VNb1RtdCsxTnYrSFlqWDVKWEowSTd6RUk4V1dyT2ZX?=
 =?utf-8?B?VkhQRzNPbjZoZTdTaFptaFpoRk9uZ3NDOVVTeks0bnJNbFpkN0lmdE8zT29u?=
 =?utf-8?Q?QJvO8FwRZa59iK0Ow8NXX3Gla?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598add5a-90b8-44cc-9d56-08da91c646a3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:16:40.2432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXKW0Zjc6nDJtvh/7TD5RDHd/anWKKz9s5p7UsYM0d//uOY0ZUfTfx6EG4kLrhyV4VjP2m6CnbfQkYoIQBNYFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5193
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

On 2022-09-08 12:35, Alex Deucher wrote:
> On Thu, Sep 8, 2022 at 12:29 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>> On 2022-09-08 11:52, Alex Deucher wrote:
>>> Hi Dave, Daniel,
>>>
>>> New stuff for 6.1.
>>>
>>> The following changes since commit 085292c3d78015412b752ee1ca4c7725fd2bf2fc:
>>>
>>>     Revert "drm/amd/amdgpu: add pipe1 hardware support" (2022-08-16 18:14:31 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1-2022-09-08
>>>
>>> for you to fetch changes up to 780244a2fe8a82424c85f4cb15e45d0bbeec8f26:
>>>
>>>     drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers (2022-09-07 22:28:42 -0400)
>>>
>>> ----------------------------------------------------------------
>>> amd-drm-next-6.1-2022-09-08:
>>>
>>> amdgpu:
>>> - Mode2 reset for RDNA2
>>> - Lots of new DC documentation
>>> - Add documentation about different asic families
>>> - DSC improvements
>>> - Aldebaran fixes
>>> - Misc spelling and grammar fixes
>>> - GFXOFF stats support for vangogh
>>> - DC frame size fixes
>>> - NBIO 7.7 updates
>>> - DCN 3.2 updates
>>> - DCN 3.1.4 Updates
>>> - SMU 13.x updates
>>> - Misc bug fixes
>>> - Rework DC register offset handling
>>> - GC 11.x updates
>>> - PSP 13.x updates
>>> - SDMA 6.x updates
>>> - GMC 11.x updates
>>> - SR-IOV updates
>>> - PSP fixes for TA unloading
>>> - DSC passthrough support
>>> - Misc code cleanups
>>>
>>> amdkfd:
>>> - ISA fixes for some GC 10.3 IPs
>>> - Misc code cleanups
>>>
>>> radeon:
>>> - Delayed work flush fix
>>> - Use time_after for some jiffies calculations
>>>
>>> drm:
>>> - DSC passthrough aux support
>>>
>>> ----------------------------------------------------------------
>>> Alex Deucher (1):
>>>         drm/amd/display: fix documentation for amdgpu_dm_update_freesync_caps()
>>>
>>> Alex Sierra (1):
>>>         drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks
>>>
>>> Alvin Lee (6):
>>>         drm/amd/display: Free phantom plane and stream properly
>>>         drm/amd/display: Add interface to track PHY state
>>>         drm/amd/display: Uncomment SubVP scaling case
>>>         drm/amd/display: Don't choose SubVP display if ActiveMargin > 0
>>>         drm/amd/display: Only commit SubVP state after pipe programming
>>>         drm/amd/display: SubVP missing scaling case
>>>
>>> André Almeida (4):
>>>         drm/amd: Add detailed GFXOFF stats to debugfs
>>>         drm/amd/pm: Implement GFXOFF's entry count and residency for vangogh
>>>         Documentation/gpu: Document GFXOFF's count and residency
>>>         drm/amdgpu: Document gfx_off members of struct amdgpu_gfx
>>>
>>> Anthony Koo (2):
>>>         drm/amd/display: [FW Promotion] Release 0.0.130.0
>>>         drm/amd/display: [FW Promotion] Release 0.0.132.0
>>>
>>> Aric Cyr (3):
>>>         drm/amd/display: 3.2.199
>>>         drm/amd/display: 3.2.200
>>>         drm/amd/display: 3.2.201
>>>
>>> Asher Song (1):
>>>         drm/amd/display: remove a duplicated declaration
>>>
>>> Aurabindo Pillai (8):
>>>         drm/amd/display: change to runtime initialization for reg offsets for DCN32
>>>         drm/amd/display: change to runtime initialization for reg offsets for DCN321
>>>         drm/amd/display: program k1/k2 divider for virtual signal for DCN32
>>>         drm/amd/display: Fix CAB cursor size allocation for DCN32/321
>>>         drm/amd/display: disable display fresh from MALL on an edge case for DCN321
>>>         drm/amd/display: use actual cursor size instead of max for CAB allocation
>>>         drm/amd/display: Revert "program k1/k2 divider for virtual signal for DCN32"
>>>         drm/amd/display: Use correct plane for CAB cursor size allocation
>>>
>>> Bernard Zhao (4):
>>>         drm/amd: fix potential memory leak
>>>         drm/amd: fix potential memory leak
>>>         drm/amd: remove possible condition with no effect (if == else)
>>>         drm/amd: remove possible condition with no effect (if == else)
>>>
>>> Candice Li (1):
>>>         drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
>>>
>>> Charlene Liu (1):
>>>         drm/amd/display: fix wrong register access
>>>
>>> Chengming Gui (3):
>>>         drm/amd/amdgpu: avoid soft reset check when gpu recovery disabled
>>>         drm/amd/amdgpu: skip ucode loading if ucode_size == 0
>>>         drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_header
>>>
>>> David Belanger (1):
>>>         drm/amdkfd: Added GFX 11.0.3 Support
>>>
>>> David Gow (1):
>>>         drm/amd/display: fix overflow on MIN_I64 definition
>>>
>>> Derek Lai (1):
>>>         drm/amd/display: do not change pipe split policy for RV2
>>>
>>> Duncan Ma (1):
>>>         drm/amd/display: Fix OTG H timing reset for dcn314
>>>
>>> Ethan Wellenreiter (2):
>>>         drm/amd/display: Re-initialize viewport after pipe merge
>>>         drm/amd/display: Fix check for stream and plane
>>>
>>> Evan Quan (5):
>>>         drm/amd/pm: update SMU 13.0.0 driver_if header
>>>         drm/amd/pm: use vbios carried pptable for those supported SKUs
>>>         drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
>>>         drm/amd/pm: bump SMU 13.0.0 driver_if header version
>>>         drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU 13.0.7
>>>
>>> Felix Kuehling (1):
>>>         drm/amdkfd: Allocate doorbells only when needed
>> This patch broke CRIU. Rajneesh posted a fix for it. I'd recommend
>> including the fix, though we're still debating the root cause and may
>> refine it later:
>>
>> [Patch v2] drm/amdkfd: Fix CRIU restore op due to doorbell offset
> If it's critical, I can respin the PR today, otherwise, I can include
> the fix(es) in my PR next week.

I think CRIU is still a niche use case. Including the fix next week is 
probably good enough.

Thanks,
   Felix


>
> Alex
>
>
>> Regards,
>>     Felix
>>
>>
>>> Frank Min (3):
>>>         drm/amdgpu: support psp v13_0_10 ip block
>>>         drm/amdgpu: add new ip block for PSP 13.0
>>>         drm/amdgpu: add gc v11_0_3 ip headers
>>>
>>> Gabe Teeger (2):
>>>         drm/amd/display: Cursor lag with PSR1 eDP
>>>         drm/amd/display: Cleanup PSR flag
>>>
>>> George Shen (1):
>>>         drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming
>>>
>>> Graham Sider (1):
>>>         drm/amdgpu: Update mes_v11_api_def.h
>>>
>>> Greg Kroah-Hartman (1):
>>>         drm/amd/display: fix memory leak when using debugfs_lookup()
>>>
>>> Guchun Chen (4):
>>>         drm/amdgpu: use adev_to_drm to get drm device
>>>         drm/amdgpu: use dev_info to benefit mGPU case
>>>         drm/amdgpu: disable FRU access on special SIENNA CICHLID card
>>>         drm/amdgpu: prevent toc firmware memory leak
>>>
>>> Hamza Mahfooz (6):
>>>         drm/dp_mst: add passthrough_aux to struct drm_dp_mst_port
>>>         drm/amd/display: consider DSC pass-through during mode validation
>>>         drm/amd/display: implement DSC pass-through support
>>>         drm/amd/display: include soc._clock_tmp[] into DC's scratch region
>>>         drm/amd/display: fix i386 frame size warning
>>>         drm/amd/display: fix indentation in commit_planes_for_stream()
>>>
>>> Hawking Zhang (16):
>>>         drm/amdgpu: drop gc 11_0_0 golden settings
>>>         drm/amdgpu: initialize common sw config for v11_0_3
>>>         drm/amdgpu: add new ip block for SOC21
>>>         drm/amdgpu: declare firmware for new SDMA 6.0.3
>>>         drm/amdgpu: add new ip block for sdma 6.0
>>>         drm/amdgpu: add new ip block for LSDMA 6.0
>>>         drm/amdgpu: only init tap_delay ucode when it's included in ucode binary
>>>         drm/amdgpu: initialize gmc sw config for v11_0_3
>>>         drm/amdgpu: add new ip block for GMC 11.0
>>>         drm/amdgpu: declare firmware for new GC 11.0.3
>>>         drm/amdgpu: declare firmware for new MES 11.0.3
>>>         drm/amdgpu: init gfx config for gfx v11_0_3
>>>         drm/amdgpu: enable imu_rlc_ram programming for v11_0_3
>>>         drm/amdgpu: Set GC family for GC 11.0.3
>>>         drm/amdgpu: add new ip block for GFX 11.0
>>>         drm/amdgpu: add new ip block for MES 11.0.3
>>>
>>> Horace Chen (7):
>>>         drm/amdgpu: add CHIP_IP_DISCOVERY support for virtualization
>>>         drm/amdgpu: add sriov nbio callback structure
>>>         drm/amdgpu: add a compute pipe reset for RS64
>>>         drm/amdgpu: enable WPTR_POLL_ENABLE for sriov on sdma_v6_0
>>>         drm/amdgpu: refine virtualization psp fw skip check
>>>         drm/amdgpu: sriov remove vcn_4_0 and jpeg_4_0
>>>         drm/amdgpu: Support PSP 13.0.10 on SR-IOV
>>>
>>> Ian Chen (2):
>>>         drm/amd/display: Refactor edp dsc codes.
>>>         drm/amd/display: Add comments.
>>>
>>> Ilya Bakoulin (1):
>>>         drm/amd/display: Change AUX NACK behavior
>>>
>>> Iswara Nagulendran (1):
>>>         drm/amd/display: Fix primary EDP link detection
>>>
>>> Jane Jian (4):
>>>         drm/amdgpu/vcn: Disable CG/PG for SRIOV
>>>         drm/amdgpu/vcn: Add vcn/vcn1 in white list to load its firmware under sriov
>>>         drm/amdgpu/vcn: Add sriov VCN v4_0 unified queue support
>>>         drm/amdgpu/vcn: Add MMSCH v4_0 support for sriov
>>>
>>> Jinpeng Cui (2):
>>>         drm/amd/display: remove redundant vertical_line_start variable
>>>         drm/amdkfd: remove redundant variables err and ret
>>>
>>> John Clements (3):
>>>         drm/amdgpu: added firmware module for psp 13.0.10
>>>         drm/amdgpu: added supported smu 13.0.10 sw pptable
>>>         drm/amdgpu: enable smu block for smu 13.0.10
>>>
>>> Leo (Hanghong) Ma (2):
>>>         drm/amd/display: Add support for visual confirm color
>>>         drm/amd/display: Add visual confirm color support for SubVP
>>>
>>> Leo Chen (3):
>>>         drm/amd/display: Adding log clock table from SMU
>>>         drm/amd/display: add a override flag as wa for some specific dongle
>>>         drm/amd/display: Missing HPO instance added
>>>
>>> Lewis Huang (1):
>>>         drm/amd/display: Refine aux transaction before retrieve caps
>>>
>>> Likun Gao (1):
>>>         drm/amdgpu: add MGCG perfmon setting for gfx11
>>>
>>> Magali Lemes (1):
>>>         drm/amd/display: remove unused header
>>>
>>> Martin Tsai (1):
>>>         drm/amd/display: Correct cursor position on horizontal mirror
>>>
>>> Maíra Canal (1):
>>>         drm/amd/display: Include missing header
>>>
>>> Melissa Wen (4):
>>>         Documentation/amdgpu_dm: Add DM color correction documentation
>>>         Documentation/amdgpu/display: add DC color caps info
>>>         drm/amd/display: add doc entries for MPC blending configuration
>>>         Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode
>>>
>>> Michael Strauss (1):
>>>         drm/amd/display: Add DC debug option to force LTTPR mode
>>>
>>> Mukul Joshi (1):
>>>         drm/amdgpu: Fix page table setup on Arcturus
>>>
>>> Prike Liang (1):
>>>         drm/amdkfd: Fix isa version for the GC 10.3.7
>>>
>>> Qu Huang (1):
>>>         drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
>>>
>>> Rafael J. Wysocki (1):
>>>         drm: amd: amdgpu: ACPI: Add comment about ACPI_FADT_LOW_POWER_S0
>>>
>>> Robin Chen (1):
>>>         drm/amd/display: Cursor flicker when entering PSRSU
>>>
>>> Rodrigo Siqueira (10):
>>>         drm/amd/display: Add documentation to some of the cursor struct
>>>         drm/amd/display: Add basic kernel doc to CRC code under DC
>>>         drm/amd/display: Add some extra kernel doc to amdgpu_dm
>>>         drm/amd/display: Document pipe split policy
>>>         drm/amd/display: Expand documentation for timing
>>>         drm/amd/display: Document some of the DML structs
>>>         drm/amd/display: Remove unused code
>>>         Documentation/gpu: Add info table for ASICs
>>>         Documentation/gpu: Add an explanation about the DCN pipeline
>>>         Documentation/gpu: Add Multiplane Overlay doc
>>>
>>> Roman Li (2):
>>>         drm/amd/display: enable PCON support for dcn314
>>>         drm/amd/display: Remove redundant check in atomic_check
>>>
>>> Saaem Rizvi (1):
>>>         drm/amd/display: HDMI ODM Combine Policy Correction
>>>
>>> Samson Tam (1):
>>>         drm/amd/display: fix odm 2:1 policy not being applied consistently in 4k144 modes
>>>
>>> Sonny Jiang (1):
>>>         drm/amdgpu: Enable pg/cg flags on GC11_0_3 for VCN
>>>
>>> Taimur Hassan (3):
>>>         drm/amd/display: Set ODM policy based on number of DSC slices
>>>         drm/amd/display: Remove assert from PHY state update
>>>         drm/amd/display: Allow PHY state update between same states
>>>
>>> Tales Aparecida (2):
>>>         drm/amd/display: fix minor codestyle problems
>>>         drm/amd/display: remove unneeded defines from bios parser
>>>
>>> Tim Huang (5):
>>>         drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
>>>         drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7.7.0
>>>         drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
>>>         drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
>>>         drm/amdgpu: add sdma instance check for gfx11 CGCG
>>>
>>> Tom St Denis (1):
>>>         drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers
>>>
>>> Victor Zhao (6):
>>>         drm/amdgpu: add mode2 reset for sienna_cichlid
>>>         drm/amdgpu: let mode2 reset fallback to default when failure
>>>         drm/amdgpu: add debugfs amdgpu_reset_level
>>>         drm/amdgpu: save and restore gc hub regs
>>>         drm/amdgpu: revert context to stop engine before mode2 reset
>>>         drm/amdgpu: reduce reset time
>>>
>>> Vignesh Chander (1):
>>>         drm/amdgpu: skip set_topology_info for VF
>>>
>>> Vladimir Stempen (1):
>>>         drm/amd/display: Fix black flash when switching from ODM2to1 to ODMBypass
>>>
>>> Wang Fudong (1):
>>>         drm/amd/display: set dig fifo read start level to 7 before dig fifo reset
>>>
>>> Yang Li (5):
>>>         drm/amd/display: remove unneeded semicolon
>>>         drm/amd/display: clean up one inconsistent indenting
>>>         drm/amd/display: clean up some inconsistent indentings
>>>         drm/amd/display: clean up some inconsistent indentings
>>>         drm/amd/display: clean up some inconsistent indentings
>>>
>>> Yang Wang (3):
>>>         drm/amd/pm: add smu_v13_0_10 support
>>>         drm/amd/pm: add smu_v13_0_10 driver if version
>>>         drm/amdgpu: add gfxhub_v3_0_3 support
>>>
>>> Yang Yingliang (1):
>>>         drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_runtime_resume()
>>>
>>> YiPeng Chai (3):
>>>         drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
>>>         drm/amdgpu: fix hive reference leak when adding xgmi device
>>>         drm/amdgpu: TA unload messages are not actually sent to psp when amdgpu is uninstalled
>>>
>>> Yifan Zha (8):
>>>         drm/amdgpu: Use PSP program IH_RB_CNTL registers under SRIOV
>>>         drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV on MMHUB v3_0_0
>>>         drm/amdgpu: skip "Issue additional private vm invalidation to MMHUB" on SRIOV
>>>         drm/amdgpu: Skip the VRAM base offset on SRIOV
>>>         drm/amdgpu: Skip program SDMA0_SEM_WAIT_FAIL_TIMER_CNTL under SRIOV VF
>>>         drm/amdgpu: Use RLCG to program GRBM_GFX_CNTL during full access time
>>>         drm/admgpu: Skip CG/PG on SOC21 under SRIOV VF
>>>         drm/amd: Skip smu_v13 register irq on SRIOV VF
>>>
>>> Yifan Zhang (3):
>>>         drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.0.1
>>>         drm/amdkfd: print address in hex format rather than decimal
>>>         drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL_RANGE
>>>
>>> Yu Zhe (1):
>>>         drm/radeon: use time_after(a,b) to replace "a>b"
>>>
>>> YuBiao Wang (1):
>>>         drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl
>>>
>>> Zhenneng Li (1):
>>>         drm/radeon: add a force flush to delay work when radeon
>>>
>>> min tang (2):
>>>         drm/amd/display: Fix comment typo
>>>         drm/amd/display: Unneeded semicolon
>>>
>>> shaoyunl (2):
>>>         drm/amdgpu: use sjt mec fw on aldebaran for sriov
>>>         drm/amdgpu: Remove the additional kfd pre reset call for sriov
>>>
>>> sunliming (1):
>>>         drm/amd/display: Fix variable dereferenced before check
>>>
>>> ye xingchen (2):
>>>         drm/amdgpu: Remove the unneeded result variable
>>>         drm/amdgpu: Remove the unneeded result variable 'r'
>>>
>>> zhang songyi (1):
>>>         drm/amd/display: Remove the unneeded result variable
>>>
>>>    Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     8 +
>>>    Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    24 +
>>>    Documentation/gpu/amdgpu/display/dc-glossary.rst   |     2 +-
>>>    Documentation/gpu/amdgpu/display/dcn-overview.rst  |    59 +
>>>    .../gpu/amdgpu/display/dcn2_cm_drm_current.svg     |  1370 +
>>>    .../gpu/amdgpu/display/dcn3_cm_drm_current.svg     |  1529 +
>>>    .../gpu/amdgpu/display/display-manager.rst         |   141 +
>>>    Documentation/gpu/amdgpu/display/index.rst         |     1 +
>>>    Documentation/gpu/amdgpu/display/mpo-cursor.svg    |   435 +
>>>    Documentation/gpu/amdgpu/display/mpo-overview.rst  |   242 +
>>>    .../multi-display-hdcp-mpo-less-pipe-ex.svg        |   220 +
>>>    .../gpu/amdgpu/display/multi-display-hdcp-mpo.svg  |   171 +
>>>    .../gpu/amdgpu/display/pipeline_4k_no_split.svg    |   958 +
>>>    .../gpu/amdgpu/display/pipeline_4k_split.svg       |  1062 +
>>>    .../display/single-display-mpo-multi-video.svg     |   339 +
>>>    .../gpu/amdgpu/display/single-display-mpo.svg      |   266 +
>>>    Documentation/gpu/amdgpu/driver-misc.rst           |    17 +
>>>    Documentation/gpu/amdgpu/thermal.rst               |    18 +-
>>>    Documentation/gpu/drm-kms.rst                      |     2 +
>>>    drivers/gpu/drm/amd/amdgpu/Makefile                |     7 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     6 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |     6 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   170 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    31 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    17 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     9 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     9 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    41 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    14 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |     3 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    26 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     8 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     3 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    44 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    21 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     3 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    13 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    57 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     5 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     5 +-
>>>    drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    69 +-
>>>    drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    86 +-
>>>    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    17 +-
>>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   108 +
>>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   511 +
>>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h         |    29 +
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    19 +-
>>>    drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    26 +-
>>>    drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     6 +
>>>    drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c           |   144 +
>>>    drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h           |    29 +
>>>    drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     3 +
>>>    drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
>>>    drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
>>>    drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   140 +
>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    44 +
>>>    drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
>>>    drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    84 +-
>>>    drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     2 +
>>>    drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     5 +-
>>>    drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     5 +-
>>>    drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |     9 +-
>>>    drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   303 +
>>>    .../inc/dml_wrapper.h => amdgpu/sienna_cichlid.h}  |    14 +-
>>>    drivers/gpu/drm/amd/amdgpu/soc21.c                 |    41 +-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   297 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    22 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
>>>    drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    14 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |     9 +
>>>    drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     5 -
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    24 +-
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    46 +-
>>>    .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   109 +-
>>>    .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     1 +
>>>    .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    64 +-
>>>    .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    84 +-
>>>    .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     5 +-
>>>    .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     8 -
>>>    drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    19 -
>>>    .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    46 +
>>>    .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    50 +-
>>>    .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    48 +-
>>>    drivers/gpu/drm/amd/display/dc/core/dc.c           |    80 +-
>>>    .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    38 +
>>>    drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    28 +-
>>>    drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    65 +-
>>>    drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     3 -
>>>    drivers/gpu/drm/amd/display/dc/dc.h                |   132 +-
>>>    drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    50 +-
>>>    drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     1 +
>>>    drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   148 +-
>>>    drivers/gpu/drm/amd/display/dc/dc_link.h           |    13 +
>>>    drivers/gpu/drm/amd/display/dc/dc_stream.h         |     2 -
>>>    drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    12 +-
>>>    .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    21 +-
>>>    drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     5 +-
>>>    drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     9 +-
>>>    .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   109 +-
>>>    drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    41 +-
>>>    .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    18 +
>>>    drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     9 +-
>>>    drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    15 +-
>>>    .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     3 +
>>>    drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     9 +-
>>>    .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     1 -
>>>    .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |     1 +
>>>    .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |     3 +-
>>>    .../drm/amd/display/dc/dcn314/dcn314_resource.c    |     7 +-
>>>    .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     1 -
>>>    .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     1 -
>>>    drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     8 +-
>>>    .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |     5 +
>>>    drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   101 +-
>>>    drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     3 +
>>>    drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     1 +
>>>    .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   667 +-
>>>    .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  1080 +
>>>    .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |     2 +-
>>>    .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   648 +-
>>>    drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     7 +-
>>>    .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    |    14 +-
>>>    .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    32 +-
>>>    .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    34 +-
>>>    .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   295 +-
>>>    .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    40 +-
>>>    .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |    77 +-
>>>    .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    52 +-
>>>    .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    10 +-
>>>    .../dc/dml/dcn32/display_mode_vba_util_32.c        |     9 +-
>>>    .../dc/dml/dcn32/display_mode_vba_util_32.h        |     1 +
>>>    .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    13 +-
>>>    .../drm/amd/display/dc/dml/display_mode_structs.h  |    36 +-
>>>    .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     1 +
>>>    drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |  1884 -
>>>    .../amd/display/dc/dml/dml_wrapper_translation.c   |   284 -
>>>    drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     4 +
>>>    drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     6 +
>>>    drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    91 +-
>>>    .../drm/amd/display/dc/inc/hw/timing_generator.h   |    14 +-
>>>    drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     7 +
>>>    .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     4 +-
>>>    drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
>>>    drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    63 +-
>>>    .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |     8 +
>>>    .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    10 +
>>>    .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h | 12086 +++++
>>>    .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    | 44640 +++++++++++++++++++
>>>    .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |     2 +
>>>    .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |    13 +
>>>    drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     3 +-
>>>    drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    45 +
>>>    drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     3 +
>>>    drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    34 +
>>>    drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    22 +
>>>    .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    31 +-
>>>    .../amd/pm/swsmu/inc/pmfw_if/smu_v11_0_7_ppsmc.h   |     4 +-
>>>    .../drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h |     5 +-
>>>    drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
>>>    drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     9 +-
>>>    .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    54 +
>>>    drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    76 +
>>>    drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    38 +-
>>>    .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    72 +-
>>>    .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    36 +-
>>>    drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     3 +
>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c      |     4 +-
>>>    drivers/gpu/drm/radeon/radeon_device.c             |     3 +
>>>    drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
>>>    include/drm/display/drm_dp.h                       |     1 +
>>>    include/drm/display/drm_dp_mst_helper.h            |     3 +
>>>    181 files changed, 69781 insertions(+), 3694 deletions(-)
>>>    create mode 100644 Documentation/gpu/amdgpu/apu-asic-info-table.csv
>>>    create mode 100644 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv
>>>    create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/mpo-cursor.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/mpo-overview.rst
>>>    create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_no_split.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_split.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
>>>    create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo.svg
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h
>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
>>>    rename drivers/gpu/drm/amd/{display/dc/inc/dml_wrapper.h => amdgpu/sienna_cichlid.h} (81%)
>>>    delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
>>>    delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
>>>    create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h
>>>    create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h
