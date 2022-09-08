Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD905B239E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C70E10EB6A;
	Thu,  8 Sep 2022 16:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BAC10EB60;
 Thu,  8 Sep 2022 16:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByDKYhv2yHhlwriPHUyz5AliLyOiPbdW8ISOah/Gg/7kNct85i/sil6IRihqQP1QsP6emIqSe9uumS7F9Eq2uBg6v3CqGogiSwuaJ/zYaejt3BV4YBUNoYlYmqtrMewcJ3yO13cZLM1Bm/GnvXiIqDM6msbrBFB8wXwnEuNM82Q1cr5ULHKzQdR7r0pJVjQZPpNAWbH1UgCSGqZe7lUlhRTAEBpVO32hejRnY2aSLtkKV39XO9zCVIcwvUeAg2WPatyBEedzFEmeKxjssxNnnDJiqe70yTbEQ5tEAbX3xnI/GHMVpR7MVuAQAMGTVt8RG9U2Ojt2TAeAkTJ4HKVFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYBJiWdnWpn/qtVW7GE2SBCQiuy0SAJiBSYlzHBAVbM=;
 b=GAMhswhAMZz2RpsO9IQXPZB8Sc7mo41IYQ2j2dK9tJKnPf86OWucjHiect9kUMUkCGWR1GxilUqK5Da3bwbC5dH1cFepICp6MfcRrJLyowppb3jzsDEbY3uqR70/4jht+fcP2tPgnBkinmkcE/PO1gF8zhUdw024z6XvE37XKfI40lEsSw8Go4AwUmt8ejKcad2fVbi1wo8mdP3AwCZZUR+mQRDXagfAzMD0AHZBFXs7sPHA0ya4n2jdDsnzWHlhshXXjVE3hMQ9IqoR8ZSDsXBbnzmcuXlFvkDdbGf7/vUdzRKFvLqdrR+tDCmRU1/1S01Hpkk8v2knWMhn4eEfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYBJiWdnWpn/qtVW7GE2SBCQiuy0SAJiBSYlzHBAVbM=;
 b=zKnyuND5fG+NC1rUvG8CouDPTqDHndWpnnEtzzRRILC5tOv9BRRrAAhpUCRsyTth1nBgwcrs5Dydf2Qfkrv+qP36kAAwvUIBWWS8uhTiw7ciiOK6DKpXqox5vW+CR8i4ir7FKbFE+ThxSfi9SNDIy3mWLc/LUBrHy4xJqSGEuvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 16:29:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 16:29:36 +0000
Message-ID: <2b5b57e7-9f81-45c4-1375-4577d3854bbd@amd.com>
Date: Thu, 8 Sep 2022 12:29:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.1
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch
References: <20220908155202.57862-1-alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220908155202.57862-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:610:60::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f4f2b8-e06a-4135-1f6c-08da91b751ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmGM019eW3qjEU0LskuuAxJZyYtR6EaJvVPBKykHWEy1n8xFooILs03hItIxZnjyI0sUBMmzrRLmkNrMvwkZ6MB+56+oRdD+8M49Gvu8Gq7I9yPqcPmMZ2hDHGY+QoriMm2i/XCchEAytSIWzS4s2c//n8rtFC5w96o5MnP49UwHdMzGp6/4yAWGTzMkC5rwyCeq91nCaoVyMyyAW3SddtjNcmpXdAnNPkPvktyMOQWXbgW+cH8bHLG4u8GUBiFebouF4JV95yU3WHGe3Hs6xquVD9XHgho8s0jmLMBYAZ/Q7vEu80OfFwQ9B7gc5UDECmrBH0sSIOi+pxFFH9Mb6CozLn1YP0n2U2xFEVvCsjGiOYdeTSbaqDG8q9lAZRoENJeEY1VZizN4cpn44Hl6cAUYAnIrMgL+T48HsiJV7oAMaxRqC8pKY3/ksT9uFA1JxJKfNoWX8JxPhYf1dtavxMyq4VOqQn/Kw6GgOLH0Cc25XeQt6psDinVTj8hQ7cFnq8zOiCTbVQkU7+fB5/47cg7CEU+MfvmpkuJdZN75suunvuxdsFn46FSGGdUpxbH0o9XnZ4djak2rTY7vn7kc1ymK+ySEMBbEy1uMRu1D9sz+fFoo8L1veXGEVIIly1krK3KFqU6JeYEMHbCSgVpqgda83rLuMQlOZ2s7olBDTi6gGMGzNxXGyyLIsUML4jysgh715xb/6Y998m9Ifd4+6vC+tMXLY3oIuSrIngLtK4Rv1VZHyA3VrmqfoI8oVJHK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(36756003)(8936002)(6512007)(66574015)(5660300002)(53546011)(186003)(6506007)(26005)(30864003)(2616005)(44832011)(36916002)(31696002)(6666004)(86362001)(31686004)(6486002)(41300700001)(478600001)(966005)(2906002)(38100700002)(83380400001)(66476007)(8676002)(66946007)(316002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExFWldXRi9SdUppRjliQ3orclJKVjlsdHFnOXVwa0c0TlFyYkhTTnRTMjZV?=
 =?utf-8?B?dVpQUUYyRUp6bEIyRkp2R29BRHQ0QlhZUFpUZ09uY2sxM1hjb0M2WEpkM3cy?=
 =?utf-8?B?WVZPTHgvMis1Si9lNUJ1Y3g0bUZaN0FEM0ZMRVQ0MGtDYjIraVU2bUNoSnI3?=
 =?utf-8?B?N0JTWmhrd0lLMDlsSFZ2bEdwbUlYa2FZNDlSK2hrczdPL2VHSktqZjkxMEN5?=
 =?utf-8?B?dXR2RFFaY1J0ejhHeXNSNEkxT2dmMlpuZFpyY3pyL0dhamJLQTBjWWRiVnIr?=
 =?utf-8?B?TzA1RFgrTkVEd3lsNk9IempHYVdSc2NsQlMzMlRUMjhiWDJOekJYb0hZWUVF?=
 =?utf-8?B?aWVCU1NXL3pkZG5TM0R4dGNWbE0rOGNYU3BLZnQ4eWRsWjhQaFNqNCtkeS9s?=
 =?utf-8?B?WTNVeGJzNjg0L0dJbk9oNjFjb0VBTzhjenZwWG0rM0RpeGRzcXIxSWdPSERB?=
 =?utf-8?B?OFptaHRxK25QZ04xMnNpM2V2SU9DTmpXZDdnaTd6T2x4NDB2TjNUR0s4ejVw?=
 =?utf-8?B?TzA2RlZBaFNBL21RbEo0V1Ewa0pGUncrc1ZhRnFPZm5KT2pYWEtiS0RIME9C?=
 =?utf-8?B?clErQ0M3bnZoZjhaaTdtbnVyZ1BhaVJyRHAxdUh0SldEYyt2ekROaHd6Q2J6?=
 =?utf-8?B?cDF4VEJlVTVTMkVXc01TRGE4eEpzYkpYcmMvb1k0cHAxS0tjOEhGZmV6Yzl0?=
 =?utf-8?B?RFFIbDNzOGVCS251a3AxWE11Qy9WZnFBcWZrQ0ZBaEZiWFJtVDlFN0pFSTly?=
 =?utf-8?B?RGpnaHdUbFRTRk00Tm9BbnRqSGpWTk9tMUZTUUJHczNhbERueFpiQVpub1No?=
 =?utf-8?B?TEtyZmFBaU1HTWVTekQraXpWNmpWV0NDeXg1eEJJdDNyWmZGN2wwb1hxbHQr?=
 =?utf-8?B?empDL2N6RThKc3ozdk16REFqQjJ5SFRLanJ1WlFNSlA4c2E5VUdtTkgwejY2?=
 =?utf-8?B?b2lhQTRIajlQN1pVd0RZWE9iQjQ2dnJzMWFocnRuVCtQekx3NXRWVU5iYjNE?=
 =?utf-8?B?WnlJZXB2ZkFiNkovakg5ZUI3OWZhS3FLTTIwaHNTWjFLQms0SXpTYXNMSmFK?=
 =?utf-8?B?djVncnlaRTlDQm5RUkxzRTFpT1RwcFFRQ1NyOTJra0xabHQwSnJRQmdZNHZn?=
 =?utf-8?B?ZFdGWmoyNjlrWW9BdnI1SjY2WkE3Y2RsM3Bvd2tQSWRwRGVMNCt3VGJSaHg3?=
 =?utf-8?B?VUxIcW83a2c1OGlIL2tibjN2cHJYN2VWd0dvR1pQUGwvWVpaTmF2cGZUZFFH?=
 =?utf-8?B?V0Z0S3lxSFdNN0VYb0phUCtsMitOYzZBbnVzUzdZNk9lVG5SRFFLNlFQZkx1?=
 =?utf-8?B?ZTkrNWhTL0hKL3Jod2M1TmE0VElNTjZEdnptNG5oV2NYQkZaWEY3YUNpNW1v?=
 =?utf-8?B?eEFic295OE9lSTNFUmRCMlZ4a1lSNnQyeUZkYm5DeGFHN3ZrUUZyaHErcDJu?=
 =?utf-8?B?T29tV1Z5OGtCdmRwV3BSYy9kOFUwNDlBV3YzTFVIb0EwZkNwT2F3aVJiNUxr?=
 =?utf-8?B?aG5aNUZ3UjVuclFRcUc0NWRLRnNSTU54Wi8yQjhWNTg5Vk1tL2Z1SEFuQ2NG?=
 =?utf-8?B?VVhIZkgxekVyMzZ4YzFwNmE0MzE4aUwyZkRZRjExVWE2WDRNaFM1S0I3RnhF?=
 =?utf-8?B?Z2t6NW9sT1grUVExb25sclBSd2ZuK0NWall1VXhDeGltU1p1UXNLd0M5WHlt?=
 =?utf-8?B?aFNIYi80M3BYL2VKL05iZ2taeE1YVW5BYnFYQTduckdaVEJlMXlDSmwvMVk0?=
 =?utf-8?B?VU50SHhPSlIvOFU0WE43QXFiNVlHcUlRYVlmckp0UEpoZkpjSzlWS1BjZ3NL?=
 =?utf-8?B?RWVGNWQ3UUZwTDFtZEkxMk40VFN4N2JlRzM1N2hCdFJybjJ4ZVJGT3oyWXla?=
 =?utf-8?B?enh3d2QwQk1iUFJORmV2a0tabEUxN3BLOXcyT3VFQkczTC9ZZ3dxRExIYWFN?=
 =?utf-8?B?NmRpYVNmaVA5TWlTL3BkMml3MWFzaGlhdDNmK1lpZDZHT3E0NG5hbnJqdHEz?=
 =?utf-8?B?VmpQbHVOUW96TkdGelhaalFZNzhmSitkUjZVaFl4U002Z0gwWG15dFZWV2tz?=
 =?utf-8?B?cTZNYmtnVHRzanAyMzY1NjNLWEVOM2poVGpSM2c2RUlIU3k0dUxZbGlyQXJ2?=
 =?utf-8?Q?QJFoHKdX9wGXsc8t9jNsYD9s7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f4f2b8-e06a-4135-1f6c-08da91b751ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:29:36.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5OZ/iG9NhYjKVS96/4CbEa+9tBBfg0FLSuXKTyHqj9tA4B9DHzxyuCD9sjo+2vRlC92L/5r8Ht2GeHxvAdLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
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


On 2022-09-08 11:52, Alex Deucher wrote:
> Hi Dave, Daniel,
>
> New stuff for 6.1.
>
> The following changes since commit 085292c3d78015412b752ee1ca4c7725fd2bf2fc:
>
>    Revert "drm/amd/amdgpu: add pipe1 hardware support" (2022-08-16 18:14:31 -0400)
>
> are available in the Git repository at:
>
>    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1-2022-09-08
>
> for you to fetch changes up to 780244a2fe8a82424c85f4cb15e45d0bbeec8f26:
>
>    drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers (2022-09-07 22:28:42 -0400)
>
> ----------------------------------------------------------------
> amd-drm-next-6.1-2022-09-08:
>
> amdgpu:
> - Mode2 reset for RDNA2
> - Lots of new DC documentation
> - Add documentation about different asic families
> - DSC improvements
> - Aldebaran fixes
> - Misc spelling and grammar fixes
> - GFXOFF stats support for vangogh
> - DC frame size fixes
> - NBIO 7.7 updates
> - DCN 3.2 updates
> - DCN 3.1.4 Updates
> - SMU 13.x updates
> - Misc bug fixes
> - Rework DC register offset handling
> - GC 11.x updates
> - PSP 13.x updates
> - SDMA 6.x updates
> - GMC 11.x updates
> - SR-IOV updates
> - PSP fixes for TA unloading
> - DSC passthrough support
> - Misc code cleanups
>
> amdkfd:
> - ISA fixes for some GC 10.3 IPs
> - Misc code cleanups
>
> radeon:
> - Delayed work flush fix
> - Use time_after for some jiffies calculations
>
> drm:
> - DSC passthrough aux support
>
> ----------------------------------------------------------------
> Alex Deucher (1):
>        drm/amd/display: fix documentation for amdgpu_dm_update_freesync_caps()
>
> Alex Sierra (1):
>        drm/amdgpu: ensure no PCIe peer access for CPU XGMI iolinks
>
> Alvin Lee (6):
>        drm/amd/display: Free phantom plane and stream properly
>        drm/amd/display: Add interface to track PHY state
>        drm/amd/display: Uncomment SubVP scaling case
>        drm/amd/display: Don't choose SubVP display if ActiveMargin > 0
>        drm/amd/display: Only commit SubVP state after pipe programming
>        drm/amd/display: SubVP missing scaling case
>
> André Almeida (4):
>        drm/amd: Add detailed GFXOFF stats to debugfs
>        drm/amd/pm: Implement GFXOFF's entry count and residency for vangogh
>        Documentation/gpu: Document GFXOFF's count and residency
>        drm/amdgpu: Document gfx_off members of struct amdgpu_gfx
>
> Anthony Koo (2):
>        drm/amd/display: [FW Promotion] Release 0.0.130.0
>        drm/amd/display: [FW Promotion] Release 0.0.132.0
>
> Aric Cyr (3):
>        drm/amd/display: 3.2.199
>        drm/amd/display: 3.2.200
>        drm/amd/display: 3.2.201
>
> Asher Song (1):
>        drm/amd/display: remove a duplicated declaration
>
> Aurabindo Pillai (8):
>        drm/amd/display: change to runtime initialization for reg offsets for DCN32
>        drm/amd/display: change to runtime initialization for reg offsets for DCN321
>        drm/amd/display: program k1/k2 divider for virtual signal for DCN32
>        drm/amd/display: Fix CAB cursor size allocation for DCN32/321
>        drm/amd/display: disable display fresh from MALL on an edge case for DCN321
>        drm/amd/display: use actual cursor size instead of max for CAB allocation
>        drm/amd/display: Revert "program k1/k2 divider for virtual signal for DCN32"
>        drm/amd/display: Use correct plane for CAB cursor size allocation
>
> Bernard Zhao (4):
>        drm/amd: fix potential memory leak
>        drm/amd: fix potential memory leak
>        drm/amd: remove possible condition with no effect (if == else)
>        drm/amd: remove possible condition with no effect (if == else)
>
> Candice Li (1):
>        drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
>
> Charlene Liu (1):
>        drm/amd/display: fix wrong register access
>
> Chengming Gui (3):
>        drm/amd/amdgpu: avoid soft reset check when gpu recovery disabled
>        drm/amd/amdgpu: skip ucode loading if ucode_size == 0
>        drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_header
>
> David Belanger (1):
>        drm/amdkfd: Added GFX 11.0.3 Support
>
> David Gow (1):
>        drm/amd/display: fix overflow on MIN_I64 definition
>
> Derek Lai (1):
>        drm/amd/display: do not change pipe split policy for RV2
>
> Duncan Ma (1):
>        drm/amd/display: Fix OTG H timing reset for dcn314
>
> Ethan Wellenreiter (2):
>        drm/amd/display: Re-initialize viewport after pipe merge
>        drm/amd/display: Fix check for stream and plane
>
> Evan Quan (5):
>        drm/amd/pm: update SMU 13.0.0 driver_if header
>        drm/amd/pm: use vbios carried pptable for those supported SKUs
>        drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
>        drm/amd/pm: bump SMU 13.0.0 driver_if header version
>        drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU 13.0.7
>
> Felix Kuehling (1):
>        drm/amdkfd: Allocate doorbells only when needed

This patch broke CRIU. Rajneesh posted a fix for it. I'd recommend 
including the fix, though we're still debating the root cause and may 
refine it later:

[Patch v2] drm/amdkfd: Fix CRIU restore op due to doorbell offset

Regards,
   Felix


>
> Frank Min (3):
>        drm/amdgpu: support psp v13_0_10 ip block
>        drm/amdgpu: add new ip block for PSP 13.0
>        drm/amdgpu: add gc v11_0_3 ip headers
>
> Gabe Teeger (2):
>        drm/amd/display: Cursor lag with PSR1 eDP
>        drm/amd/display: Cleanup PSR flag
>
> George Shen (1):
>        drm/amd/display: Fix DCN32 DPSTREAMCLK_CNTL programming
>
> Graham Sider (1):
>        drm/amdgpu: Update mes_v11_api_def.h
>
> Greg Kroah-Hartman (1):
>        drm/amd/display: fix memory leak when using debugfs_lookup()
>
> Guchun Chen (4):
>        drm/amdgpu: use adev_to_drm to get drm device
>        drm/amdgpu: use dev_info to benefit mGPU case
>        drm/amdgpu: disable FRU access on special SIENNA CICHLID card
>        drm/amdgpu: prevent toc firmware memory leak
>
> Hamza Mahfooz (6):
>        drm/dp_mst: add passthrough_aux to struct drm_dp_mst_port
>        drm/amd/display: consider DSC pass-through during mode validation
>        drm/amd/display: implement DSC pass-through support
>        drm/amd/display: include soc._clock_tmp[] into DC's scratch region
>        drm/amd/display: fix i386 frame size warning
>        drm/amd/display: fix indentation in commit_planes_for_stream()
>
> Hawking Zhang (16):
>        drm/amdgpu: drop gc 11_0_0 golden settings
>        drm/amdgpu: initialize common sw config for v11_0_3
>        drm/amdgpu: add new ip block for SOC21
>        drm/amdgpu: declare firmware for new SDMA 6.0.3
>        drm/amdgpu: add new ip block for sdma 6.0
>        drm/amdgpu: add new ip block for LSDMA 6.0
>        drm/amdgpu: only init tap_delay ucode when it's included in ucode binary
>        drm/amdgpu: initialize gmc sw config for v11_0_3
>        drm/amdgpu: add new ip block for GMC 11.0
>        drm/amdgpu: declare firmware for new GC 11.0.3
>        drm/amdgpu: declare firmware for new MES 11.0.3
>        drm/amdgpu: init gfx config for gfx v11_0_3
>        drm/amdgpu: enable imu_rlc_ram programming for v11_0_3
>        drm/amdgpu: Set GC family for GC 11.0.3
>        drm/amdgpu: add new ip block for GFX 11.0
>        drm/amdgpu: add new ip block for MES 11.0.3
>
> Horace Chen (7):
>        drm/amdgpu: add CHIP_IP_DISCOVERY support for virtualization
>        drm/amdgpu: add sriov nbio callback structure
>        drm/amdgpu: add a compute pipe reset for RS64
>        drm/amdgpu: enable WPTR_POLL_ENABLE for sriov on sdma_v6_0
>        drm/amdgpu: refine virtualization psp fw skip check
>        drm/amdgpu: sriov remove vcn_4_0 and jpeg_4_0
>        drm/amdgpu: Support PSP 13.0.10 on SR-IOV
>
> Ian Chen (2):
>        drm/amd/display: Refactor edp dsc codes.
>        drm/amd/display: Add comments.
>
> Ilya Bakoulin (1):
>        drm/amd/display: Change AUX NACK behavior
>
> Iswara Nagulendran (1):
>        drm/amd/display: Fix primary EDP link detection
>
> Jane Jian (4):
>        drm/amdgpu/vcn: Disable CG/PG for SRIOV
>        drm/amdgpu/vcn: Add vcn/vcn1 in white list to load its firmware under sriov
>        drm/amdgpu/vcn: Add sriov VCN v4_0 unified queue support
>        drm/amdgpu/vcn: Add MMSCH v4_0 support for sriov
>
> Jinpeng Cui (2):
>        drm/amd/display: remove redundant vertical_line_start variable
>        drm/amdkfd: remove redundant variables err and ret
>
> John Clements (3):
>        drm/amdgpu: added firmware module for psp 13.0.10
>        drm/amdgpu: added supported smu 13.0.10 sw pptable
>        drm/amdgpu: enable smu block for smu 13.0.10
>
> Leo (Hanghong) Ma (2):
>        drm/amd/display: Add support for visual confirm color
>        drm/amd/display: Add visual confirm color support for SubVP
>
> Leo Chen (3):
>        drm/amd/display: Adding log clock table from SMU
>        drm/amd/display: add a override flag as wa for some specific dongle
>        drm/amd/display: Missing HPO instance added
>
> Lewis Huang (1):
>        drm/amd/display: Refine aux transaction before retrieve caps
>
> Likun Gao (1):
>        drm/amdgpu: add MGCG perfmon setting for gfx11
>
> Magali Lemes (1):
>        drm/amd/display: remove unused header
>
> Martin Tsai (1):
>        drm/amd/display: Correct cursor position on horizontal mirror
>
> Maíra Canal (1):
>        drm/amd/display: Include missing header
>
> Melissa Wen (4):
>        Documentation/amdgpu_dm: Add DM color correction documentation
>        Documentation/amdgpu/display: add DC color caps info
>        drm/amd/display: add doc entries for MPC blending configuration
>        Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode
>
> Michael Strauss (1):
>        drm/amd/display: Add DC debug option to force LTTPR mode
>
> Mukul Joshi (1):
>        drm/amdgpu: Fix page table setup on Arcturus
>
> Prike Liang (1):
>        drm/amdkfd: Fix isa version for the GC 10.3.7
>
> Qu Huang (1):
>        drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
>
> Rafael J. Wysocki (1):
>        drm: amd: amdgpu: ACPI: Add comment about ACPI_FADT_LOW_POWER_S0
>
> Robin Chen (1):
>        drm/amd/display: Cursor flicker when entering PSRSU
>
> Rodrigo Siqueira (10):
>        drm/amd/display: Add documentation to some of the cursor struct
>        drm/amd/display: Add basic kernel doc to CRC code under DC
>        drm/amd/display: Add some extra kernel doc to amdgpu_dm
>        drm/amd/display: Document pipe split policy
>        drm/amd/display: Expand documentation for timing
>        drm/amd/display: Document some of the DML structs
>        drm/amd/display: Remove unused code
>        Documentation/gpu: Add info table for ASICs
>        Documentation/gpu: Add an explanation about the DCN pipeline
>        Documentation/gpu: Add Multiplane Overlay doc
>
> Roman Li (2):
>        drm/amd/display: enable PCON support for dcn314
>        drm/amd/display: Remove redundant check in atomic_check
>
> Saaem Rizvi (1):
>        drm/amd/display: HDMI ODM Combine Policy Correction
>
> Samson Tam (1):
>        drm/amd/display: fix odm 2:1 policy not being applied consistently in 4k144 modes
>
> Sonny Jiang (1):
>        drm/amdgpu: Enable pg/cg flags on GC11_0_3 for VCN
>
> Taimur Hassan (3):
>        drm/amd/display: Set ODM policy based on number of DSC slices
>        drm/amd/display: Remove assert from PHY state update
>        drm/amd/display: Allow PHY state update between same states
>
> Tales Aparecida (2):
>        drm/amd/display: fix minor codestyle problems
>        drm/amd/display: remove unneeded defines from bios parser
>
> Tim Huang (5):
>        drm/amdgpu: enable GFXOFF allow control for GC IP v11.0.1
>        drm/amdgpu: add TX_POWER_CTRL_1 macro definitions for NBIO IP v7.7.0
>        drm/amdgpu: add NBIO IP v7.7.0 Clock Gating support
>        drm/amdgpu: enable NBIO IP v7.7.0 Clock Gating
>        drm/amdgpu: add sdma instance check for gfx11 CGCG
>
> Tom St Denis (1):
>        drm/amd/amdgpu: Add missing CGTS*TCC_DISABLE to 10.3 headers
>
> Victor Zhao (6):
>        drm/amdgpu: add mode2 reset for sienna_cichlid
>        drm/amdgpu: let mode2 reset fallback to default when failure
>        drm/amdgpu: add debugfs amdgpu_reset_level
>        drm/amdgpu: save and restore gc hub regs
>        drm/amdgpu: revert context to stop engine before mode2 reset
>        drm/amdgpu: reduce reset time
>
> Vignesh Chander (1):
>        drm/amdgpu: skip set_topology_info for VF
>
> Vladimir Stempen (1):
>        drm/amd/display: Fix black flash when switching from ODM2to1 to ODMBypass
>
> Wang Fudong (1):
>        drm/amd/display: set dig fifo read start level to 7 before dig fifo reset
>
> Yang Li (5):
>        drm/amd/display: remove unneeded semicolon
>        drm/amd/display: clean up one inconsistent indenting
>        drm/amd/display: clean up some inconsistent indentings
>        drm/amd/display: clean up some inconsistent indentings
>        drm/amd/display: clean up some inconsistent indentings
>
> Yang Wang (3):
>        drm/amd/pm: add smu_v13_0_10 support
>        drm/amd/pm: add smu_v13_0_10 driver if version
>        drm/amdgpu: add gfxhub_v3_0_3 support
>
> Yang Yingliang (1):
>        drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_runtime_resume()
>
> YiPeng Chai (3):
>        drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
>        drm/amdgpu: fix hive reference leak when adding xgmi device
>        drm/amdgpu: TA unload messages are not actually sent to psp when amdgpu is uninstalled
>
> Yifan Zha (8):
>        drm/amdgpu: Use PSP program IH_RB_CNTL registers under SRIOV
>        drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV on MMHUB v3_0_0
>        drm/amdgpu: skip "Issue additional private vm invalidation to MMHUB" on SRIOV
>        drm/amdgpu: Skip the VRAM base offset on SRIOV
>        drm/amdgpu: Skip program SDMA0_SEM_WAIT_FAIL_TIMER_CNTL under SRIOV VF
>        drm/amdgpu: Use RLCG to program GRBM_GFX_CNTL during full access time
>        drm/admgpu: Skip CG/PG on SOC21 under SRIOV VF
>        drm/amd: Skip smu_v13 register irq on SRIOV VF
>
> Yifan Zhang (3):
>        drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.0.1
>        drm/amdkfd: print address in hex format rather than decimal
>        drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL_RANGE
>
> Yu Zhe (1):
>        drm/radeon: use time_after(a,b) to replace "a>b"
>
> YuBiao Wang (1):
>        drm/amdgpu: Fix use-after-free in amdgpu_cs_ioctl
>
> Zhenneng Li (1):
>        drm/radeon: add a force flush to delay work when radeon
>
> min tang (2):
>        drm/amd/display: Fix comment typo
>        drm/amd/display: Unneeded semicolon
>
> shaoyunl (2):
>        drm/amdgpu: use sjt mec fw on aldebaran for sriov
>        drm/amdgpu: Remove the additional kfd pre reset call for sriov
>
> sunliming (1):
>        drm/amd/display: Fix variable dereferenced before check
>
> ye xingchen (2):
>        drm/amdgpu: Remove the unneeded result variable
>        drm/amdgpu: Remove the unneeded result variable 'r'
>
> zhang songyi (1):
>        drm/amd/display: Remove the unneeded result variable
>
>   Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     8 +
>   Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |    24 +
>   Documentation/gpu/amdgpu/display/dc-glossary.rst   |     2 +-
>   Documentation/gpu/amdgpu/display/dcn-overview.rst  |    59 +
>   .../gpu/amdgpu/display/dcn2_cm_drm_current.svg     |  1370 +
>   .../gpu/amdgpu/display/dcn3_cm_drm_current.svg     |  1529 +
>   .../gpu/amdgpu/display/display-manager.rst         |   141 +
>   Documentation/gpu/amdgpu/display/index.rst         |     1 +
>   Documentation/gpu/amdgpu/display/mpo-cursor.svg    |   435 +
>   Documentation/gpu/amdgpu/display/mpo-overview.rst  |   242 +
>   .../multi-display-hdcp-mpo-less-pipe-ex.svg        |   220 +
>   .../gpu/amdgpu/display/multi-display-hdcp-mpo.svg  |   171 +
>   .../gpu/amdgpu/display/pipeline_4k_no_split.svg    |   958 +
>   .../gpu/amdgpu/display/pipeline_4k_split.svg       |  1062 +
>   .../display/single-display-mpo-multi-video.svg     |   339 +
>   .../gpu/amdgpu/display/single-display-mpo.svg      |   266 +
>   Documentation/gpu/amdgpu/driver-misc.rst           |    17 +
>   Documentation/gpu/amdgpu/thermal.rst               |    18 +-
>   Documentation/gpu/drm-kms.rst                      |     2 +
>   drivers/gpu/drm/amd/amdgpu/Makefile                |     7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     6 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |     6 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   170 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    31 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    17 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    41 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |     3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    26 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |     3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    44 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    21 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    13 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    57 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     5 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     5 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    69 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    86 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    17 +-
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   108 +
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   511 +
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h         |    29 +
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    19 +-
>   drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    26 +-
>   drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     6 +
>   drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c           |   144 +
>   drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h           |    29 +
>   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     3 +
>   drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     1 +
>   drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
>   drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |   140 +
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     1 +
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     1 +
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     1 +
>   drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    44 +
>   drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    84 +-
>   drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     2 +
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     5 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     5 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |     9 +-
>   drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   303 +
>   .../inc/dml_wrapper.h => amdgpu/sienna_cichlid.h}  |    14 +-
>   drivers/gpu/drm/amd/amdgpu/soc21.c                 |    41 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   297 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    22 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    14 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |     9 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     5 -
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    24 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    46 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   109 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     1 +
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    64 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    84 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     5 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     8 -
>   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    19 -
>   .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    46 +
>   .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    50 +-
>   .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    48 +-
>   drivers/gpu/drm/amd/display/dc/core/dc.c           |    80 +-
>   .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    38 +
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    28 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    65 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     3 -
>   drivers/gpu/drm/amd/display/dc/dc.h                |   132 +-
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    50 +-
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     1 +
>   drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   148 +-
>   drivers/gpu/drm/amd/display/dc/dc_link.h           |    13 +
>   drivers/gpu/drm/amd/display/dc/dc_stream.h         |     2 -
>   drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    12 +-
>   .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    21 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |     5 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     9 +-
>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   109 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    41 +-
>   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    18 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     9 +-
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    15 +-
>   .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     3 +
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     9 +-
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     1 -
>   .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |     1 +
>   .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |     3 +-
>   .../drm/amd/display/dc/dcn314/dcn314_resource.c    |     7 +-
>   .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     1 -
>   .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     1 -
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     8 +-
>   .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |     5 +
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   101 +-
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     3 +
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     1 +
>   .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   667 +-
>   .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  1080 +
>   .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |     2 +-
>   .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   648 +-
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     7 +-
>   .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    |    14 +-
>   .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    32 +-
>   .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    34 +-
>   .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   295 +-
>   .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    40 +-
>   .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |    77 +-
>   .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    52 +-
>   .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    10 +-
>   .../dc/dml/dcn32/display_mode_vba_util_32.c        |     9 +-
>   .../dc/dml/dcn32/display_mode_vba_util_32.h        |     1 +
>   .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    13 +-
>   .../drm/amd/display/dc/dml/display_mode_structs.h  |    36 +-
>   .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     1 +
>   drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |  1884 -
>   .../amd/display/dc/dml/dml_wrapper_translation.c   |   284 -
>   drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     4 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     6 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    91 +-
>   .../drm/amd/display/dc/inc/hw/timing_generator.h   |    14 +-
>   drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     7 +
>   .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     4 +-
>   drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     1 +
>   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    63 +-
>   .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |     8 +
>   .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    10 +
>   .../drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h | 12086 +++++
>   .../amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h    | 44640 +++++++++++++++++++
>   .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |     2 +
>   .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |    13 +
>   drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     3 +-
>   drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    45 +
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     3 +
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    34 +
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    22 +
>   .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    31 +-
>   .../amd/pm/swsmu/inc/pmfw_if/smu_v11_0_7_ppsmc.h   |     4 +-
>   .../drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h |     5 +-
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     9 +-
>   .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    54 +
>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    76 +
>   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    38 +-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    72 +-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    36 +-
>   drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     3 +
>   drivers/gpu/drm/display/drm_dp_mst_topology.c      |     4 +-
>   drivers/gpu/drm/radeon/radeon_device.c             |     3 +
>   drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
>   include/drm/display/drm_dp.h                       |     1 +
>   include/drm/display/drm_dp_mst_helper.h            |     3 +
>   181 files changed, 69781 insertions(+), 3694 deletions(-)
>   create mode 100644 Documentation/gpu/amdgpu/apu-asic-info-table.csv
>   create mode 100644 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv
>   create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/mpo-cursor.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/mpo-overview.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_no_split.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/pipeline_4k_split.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
>   create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo.svg
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.h
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
>   rename drivers/gpu/drm/amd/{display/dc/inc/dml_wrapper.h => amdgpu/sienna_cichlid.h} (81%)
>   delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
>   delete mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
>   create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_offset.h
>   create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_3_sh_mask.h
