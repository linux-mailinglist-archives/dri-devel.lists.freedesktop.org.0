Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60182E321
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 00:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C2E10E3AF;
	Mon, 15 Jan 2024 23:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C810E3AF;
 Mon, 15 Jan 2024 23:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXGQ4jQmIV2jSS+Yc5irGnTpdqiqhdERCYjMDzc0KwFt4UFaiW7HGBay11ry1E3DVQtQPH19rg6joQJwCdAog2LwrPObAW242BtQe/xY3nL2n/rxoNjCi0U9pdAc6x0Wqrs8/tooJjl2SE5Ma/t28eOau9oeaQaVnyIyUgCJQ4LYCHdxlRgN4SAYfvdtaZ2f3TJFWuRDU8+rXYzm56xM/y2UCZKZNYcbn29ou1NhQAAiZlP3kNpj7ymFNDPEuWMcsq472BS+a+fnTUIx5TO3dx4nSA18jq17CTjoJycF3Mo0VNhgd/UWIvdraTnwnvGpbOXtxdrU0LhmOG321P7nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jps5N3BGRW27xi5WYBhQsfq+fz9rDFPUal/IcVIdW+w=;
 b=hOqsPUaOiBx4gMr4eGM6B4DmzPk1RwPpgnPc9CfRDSv/XBQZfNRyE9GIT0LynQkQqq5QUU66SI4+WRvD0HRPnBe/Dx1qhk0NgHZdQmrHfnauyh6xA77mky8lOCc9xEG+dJ1Hiez4sIuSUOWXSCpHMr0MJUHMpJ6YVjksFXcp/F2UiaOEF0ODBZIwUDKgQ3IXGvPO8K978IdEZpCW2lQ/DYqWHxRmfX+KTjNf3FA0r2xdLmOOXOMsAomnWC3KeF3QT3QJt5Ey0KK1pTjADCikOFJjZnahJXjgZ5yFqfn1/5TYBvp/BXg5TeMEgmHmIicn3RBx+Ga8hdYpmmk8cNt8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jps5N3BGRW27xi5WYBhQsfq+fz9rDFPUal/IcVIdW+w=;
 b=A3kjpHYW7g7Uvb7GKMNpFO9+q7l2Eb7QT5ur9Tk4qlXetZb+sCxVbv0jNGk6WrrqubY16GpkbbjCOmeO2R3UfQTbjr4wbbv3g7f6umprR36pMw5VzmeWNvx+zWYC59ImnGpvbgJZMIRgkK122LtKN1GKcTmYDUEWRK+IzfnZaLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Mon, 15 Jan
 2024 23:01:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ed98:3dd5:fe85:ead7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ed98:3dd5:fe85:ead7%4]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 23:01:02 +0000
Message-ID: <5d5ffd38-005e-4a97-9609-265b517f4bb9@amd.com>
Date: Mon, 15 Jan 2024 18:01:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.8
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch
References: <20240115220841.1517007-1-alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20240115220841.1517007-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0503.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3dd8e8-377b-47a1-446f-08dc161dd8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeOATaOl9pU/p9yOLuez/L52VPHKoFTSq8/XDo9LBmsD6hYY6k4xR45/Wksv8Ge7z2YuSrEIYLW8OxUI5fuHneUspzsEp57lqjrn8Qi5/KpH7wyZ63YFqgZfZwRM1c6mbazAi0YhlmxjNLQp6UKywOC6JE7R8H0qNDT8fvdQdRcOyP+Dyr32I6F5parswufJ/ViHyD2GkUe/CqdfmzAEUvolW2g6r1wZjTBMWGrxpDQq+hDoe0Mu6LsKrswpwwwdzmhruW7ne7N/eOXd5KNZTUaeHIfmIr9xDKz24dozXlITwLd5r6iDjzos6dQRdJYKsLQph4uECH8OrsUhqGa+IcZ4itzhE5nNEEjYtaxmdTwGt7T05SckdGg0nqFGsc7jgrEuBjs9wQj4pATb8/VGDiW4yHZjTx/S6GHdFzVf7fbDtdJKqLvdjko+7qMdYiEO2lChR9S/aJwMjrCP64j8E2KS756+9UeqALm4RUn1ld1lY9psb8fQYGtZmSs43kg7mvS1Ag8/aeTIK1AVDyLrasYcXxlya48xf8t7kfU7OvSnMpZoaBm8TWz4pVdXfua1+FhyVsrWrZz7FWbPFr1oOOyCRNxfxHLE6c+sIX92gY8h1HQ9ZOFv4RzIy7vM82LGUjV2S6ubFzK8i/qJa4QUvxgIqvJbtFqgwLBwCQbLX6OLf1rG8bg9C3g6iibri6wRVUnMi0NN75I2W5WZeGn6ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31686004)(36916002)(66946007)(6506007)(2616005)(478600001)(53546011)(66476007)(316002)(86362001)(31696002)(6486002)(83380400001)(66556008)(26005)(966005)(44832011)(5660300002)(8676002)(36756003)(6512007)(41300700001)(38100700002)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUw4S0llN28wNUNCekNGR2lsTjkzTUhVVnpTdUFNa0pxRzdsT1JPZVJaMmkx?=
 =?utf-8?B?ZE1lS293azM4MDRxVVp5MGJwSms3QkhneVlLT3k4TEtXdFN2Wk5JT1RLVXR1?=
 =?utf-8?B?MVhiOW92dkJtdWQ2amZQdW9STldtSmMxbzZFRmgrMWNJSlkzTEJLUVRoV0lz?=
 =?utf-8?B?ODhMc1dCc0R5MFlvRFd6TEJRSWhlT1VZS252ZlpJRi9UQVpRb0J6a3pxQ3ZS?=
 =?utf-8?B?VTRDV0ZNaDVtN0JwV0c0QndNYUdac1g4aHRrL3c0OVNIeitQRTQ5djJzMkZW?=
 =?utf-8?B?MUVESm9KS3MxeFpiMmpYUmlROWpKNGNnQ1YvejZPbkhrNDR5VUp3cnFENzJx?=
 =?utf-8?B?MlJPR0ZtYXZOdUtmaFFLVjF0UnFTM0xLd3Z0WXRyTFc0WHhMejVZMUpzb29U?=
 =?utf-8?B?ZTIyeWNwZEFrODkydDhENkNOVVRjeFlLU1c3MmhjWUlJbjhBZVRBU1lFeFR0?=
 =?utf-8?B?em5uK0sxcXpGUW1nRExPMnl2ck53blpqcFEvaGtMQm9rTGNhMHlSRW1uK3ln?=
 =?utf-8?B?SlJtOFVoMGFFOGF3SkRicGI4bHpSRjRzYkpVbjNodjJ1Q05UeHZsTkx1RFdW?=
 =?utf-8?B?Q3kweVRYYi9hcFBobUtnVjUzZFZqUllMZktVYkE3K085NGttdXBoMnJtamZ0?=
 =?utf-8?B?V1pTM1BnRENWdXFlRytDbldxU1FhN25GTWhLaTNOK21WWGpUc3hHNWxaR2Mr?=
 =?utf-8?B?VndGSUJrdUw2Vm1BdVhsRGo0ZzMyZVRGcmlUQkFCMFBBTkJSODlPOUhXV3hZ?=
 =?utf-8?B?Sk1ML3FCQlprRis1dWc0cWI4M3JRWVdrVzl3VFRncWRiMXJQME1DNkp2RXFj?=
 =?utf-8?B?Y3JHeVFUOGZ5bWQzYkFzekxUVGQwZmp1Y2c1akx2UEVKNjVwaHVuZmNPN1dW?=
 =?utf-8?B?YWt6UW04anRxdmg0RERkcFpXNWRsMUxyTFh5WFY3TFByRENGV3R1RUMwN0Nk?=
 =?utf-8?B?OUpoMlF1TXFYc1JCT0N6Y0RiNGN1cjBKbm1GTFFTZlpxQUFoZzRxN0hUVEVl?=
 =?utf-8?B?QjFYNk9TaHVFVG53UkJGZTJMaDI5elZNNTd6K1VVbTdFb1lEK2tOZm5LVEV4?=
 =?utf-8?B?K2sva3dtNk96ZWpQUW5xZ3h3Yy9OVi9CL3dwUEsxZXhHRU5WWmRnT1d6ZUFI?=
 =?utf-8?B?aDJ0NnRrdXF5OUhjcjJXY2lqL01LbWE4YWo4czBxS0lyTzJ3dE9UUzMwRWdx?=
 =?utf-8?B?UDB4NGVTSnI3Wm4vb1ZISW91QjVjeHVFdDhaWUt0d0FMTHlMODFLT3dRZFFw?=
 =?utf-8?B?OUpmNE4ydEU4Vml5d2V6cW5yRk1HbE1obXBiRUtzMU9uSnlyUlRra09YVVMx?=
 =?utf-8?B?ZjRqMEVNRGpGQ3NYM3ZWRC9oK0RPNjhDMTI2azFRL1kyZ0diWWttcDE3MTIr?=
 =?utf-8?B?U3hIMjJPVlVVRDVhaDFaUWJZUnExKytrNk1QRkFHM29UYytMRWFncnVQaGdT?=
 =?utf-8?B?dzZYTmxxOFFndEJ6QXYyZ3h4Z3BKd3o4ckhDSDdsZGhOcXhYeGE0eHY0bG5P?=
 =?utf-8?B?RU51YlpuNG9EbUpLdkJWNVdxU1VLdVFzQnBYSTJQZXNFMHVRLzg0eVoxYUpV?=
 =?utf-8?B?WFVVdGZCVDNVY2s0bXZMRVpKRlNGVm9ITXhaenJQeG5veW9IRFBKWUE1eFdC?=
 =?utf-8?B?ZUc2N0tzY1g5bFBucWhEdnd2RE10TjVQVSttK1pvdXhoU1ljTlFnWkRBa3Zs?=
 =?utf-8?B?QW5laWZxZ2RkbXl4RGdvSG9sdGZYWldOWFN5c2p6TmdzZ0JDdWJvQjdzbWdF?=
 =?utf-8?B?NW95Y0t5enRWL0hWWjhIaytqU0Z1QjQ2ZkZsSXhDZnBxZkY2WHZacHlUL3NR?=
 =?utf-8?B?bE4rYUpKNFg0NlNwOWFSTHE2QkRabGNieTlvRlN6UEVDVUlLSXpIWlFUNkw1?=
 =?utf-8?B?Yzl1NUVPK1R6REdHSEwwbzhvZjNqMnNyT2RuTGhRZmZ3K1RRN2F3cDVpVEtm?=
 =?utf-8?B?UmlQOWpEOVVUTkMvY0hkSHJnNWVzRGlVdEluOWR4Ykt4ZWh2eXJOdUY1REdO?=
 =?utf-8?B?TjRsZ1VBUDk0UWxYNm1HTEJ3TzlEbkNzVDE3QU5rNU5WYnVHOWRuQ2lIZHc0?=
 =?utf-8?B?T2h1SU9vdVpZaXZTVXpvWGdyS0N4RHRpNUVJY21XcThROEYxbzIzV0gza0Nv?=
 =?utf-8?Q?wxqoI2cSsgIi8KXtyYBzvodm/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3dd8e8-377b-47a1-446f-08dc161dd8cd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 23:01:02.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdKmuRfP3s1P45fY+gImcaBKSwOaJv3CM/CKlnak0BYHFKAU4+lEY07OS5eQeMRNT39Dgo8/2+2BxDak0LCzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
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


On 2024-01-15 17:08, Alex Deucher wrote:
> Hi Dave, Sima,
>
> Same PR as Friday, but with the new clang warning fixed.
>
> The following changes since commit e54478fbdad20f2c58d0a4f99d01299ed8e7fe9c:
>
>    Merge tag 'amd-drm-next-6.8-2024-01-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-01-09 09:07:50 +1000)
>
> are available in the Git repository at:
>
>    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-15
>
> for you to fetch changes up to 86718cf93237a0f45773bbc49b6006733fc4e051:
>
>    drm/amd/display: Avoid enum conversion warning (2024-01-15 16:28:05 -0500)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.8-2024-01-15:
>
> amdgpu:
> - SubVP fixes
> - VRR fixes
> - USB4 fixes
> - DCN 3.5 fixes
> - GFX11 harvesting fix
> - RAS fixes
> - Misc small fixes
> - KFD dma-buf import fixes
> - Power reporting fixes
> - ATHUB 3.3 fix
> - SR-IOV fix
> - Add missing fw release for fiji
> - GFX 11.5 fix
> - Debugging module parameter fix
> - SMU 13.0.6 fixes
> - Fix new clang warning
>
> amdkfd:
> - Fix lockdep warnings
> - Fix sparse __rcu warnings
> - Bump interface version so userspace knows that the kernel supports dma-bufs exported from KFD
>    Most of the fixes for this went into 6.7, but the last fix is in this PR
> - HMM fix
> - SVM fix
>
> ----------------------------------------------------------------
> Alex Deucher (4):
>        drm/amdgpu: fix avg vs input power reporting on smu7
>        drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
>        drm/amdgpu/pm: clarify debugfs pm output
>        drm/amdgpu: drop exp hw support check for GC 9.4.3
>
> Aric Cyr (1):
>        drm/amd/display: 3.2.266
>
> Candice Li (2):
>        drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
>        drm/amdgpu: Support poison error injection via ras_ctrl debugfs
>
> Charlene Liu (1):
>        drm/amd/display: Update z8 latency
>
> Dafna Hirschfeld (1):
>        drm/amdkfd: fixes for HMM mem allocation
>
> Daniel Miess (1):
>        Revert "drm/amd/display: Fix conversions between bytes and KB"
>
> Felix Kuehling (4):
>        drm/amdkfd: Fix lock dependency warning
>        drm/amdkfd: Fix sparse __rcu annotation warnings
>        drm/amdgpu: Auto-validate DMABuf imports in compute VMs
>        drm/amdkfd: Bump KFD ioctl version

I don't think the last two patches should be on -fixes. This is really 
for a new interoperability feature and not meant to fix other 
functionality that was already expected to work. That's why the user 
mode code checks for the API version.

Regards,
   Felix


>
> George Shen (1):
>        drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled
>
> Hawking Zhang (1):
>        drm/amdgpu: Packed socket_id to ras feature mask
>
> Ivan Lipski (1):
>        Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"
>
> James Zhu (1):
>        drm/amdgpu: make a correction on comment
>
> Le Ma (3):
>        Revert "drm/amdgpu: add param to specify fw bo location for front-door loading"
>        drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loading
>        drm/amdgpu: move debug options init prior to amdgpu device init
>
> Lijo Lazar (2):
>        drm/amd/pm: Add error log for smu v13.0.6 reset
>        drm/amd/pm: Fix smuv13.0.6 current clock reporting
>
> Likun Gao (1):
>        drm/amdgpu: correct the cu count for gfx v11
>
> Martin Leung (2):
>        drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
>        drm/amd/display: revert "Optimize VRR updates to only necessary ones"
>
> Martin Tsai (1):
>        drm/amd/display: To adjust dprefclk by down spread percentage
>
> Meenakshikumar Somasundaram (1):
>        drm/amd/display: Dpia hpd status not in sync after S4
>
> Melissa Wen (1):
>        drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color
>
> Nathan Chancellor (1):
>        drm/amd/display: Avoid enum conversion warning
>
> Peichen Huang (1):
>        drm/amd/display: Request usb4 bw for mst streams
>
> Philip Yang (1):
>        drm/amdkfd: Fix lock dependency warning with srcu
>
> Srinivasan Shanmugam (6):
>        drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
>        drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
>        drm/amdgpu: Fix unsigned comparison with less than zero in vpe_u1_8_from_fraction()
>        drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
>        drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
>        drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
>
> Victor Lu (1):
>        drm/amdgpu: Do not program VM_L2_CNTL under SRIOV
>
> Yifan Zhang (3):
>        drm/amdgpu: update headers for nbio v7.11
>        drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
>        drm/amdgpu: update regGL2C_CTRL4 value in golden setting
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         | 12 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 43 +++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 15 ++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 29 ++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 21 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 26 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 67 +++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             | 14 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 10 +--
>   drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |  8 +++
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  5 +-
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           | 10 +--
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  3 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  3 +-
>   drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  6 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  7 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 52 ++++++++--------
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  2 +-
>   .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 71 +++++++++++++++++++++-
>   .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h | 11 ++++
>   drivers/gpu/drm/amd/display/dc/core/dc.c           | 14 +++--
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 14 -----
>   drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
>   drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
>   drivers/gpu/drm/amd/display/dc/dc_types.h          | 12 ++--
>   drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |  2 +-
>   .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  9 ++-
>   .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 14 +++++
>   .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 11 ++--
>   .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  6 +-
>   .../drm/amd/display/dc/dml2/display_mode_core.c    | 18 +++---
>   .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  2 +-
>   .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
>   .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 45 ++------------
>   drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  1 +
>   drivers/gpu/drm/amd/display/dc/inc/resource.h      |  3 -
>   drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 42 ++++++++++---
>   .../gpu/drm/amd/display/dc/link/link_validation.c  | 60 ++++++++++++++----
>   .../amd/display/dc/link/protocols/link_dp_dpia.c   | 36 ++++++-----
>   .../display/dc/link/protocols/link_dp_dpia_bw.c    | 60 +++++++++++++-----
>   .../display/dc/link/protocols/link_dp_dpia_bw.h    |  9 +++
>   .../dc/link/protocols/link_edp_panel_control.c     | 11 ++--
>   .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c | 19 ++++--
>   .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 12 ++--
>   .../amd/display/dc/resource/dcn32/dcn32_resource.c |  2 +-
>   .../amd/display/dc/resource/dcn32/dcn32_resource.h |  3 +
>   .../display/dc/resource/dcn321/dcn321_resource.c   |  2 +-
>   drivers/gpu/drm/amd/display/include/audio_types.h  |  2 +-
>   .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  8 +--
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 28 ++++++---
>   .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |  2 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 17 +++++-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 15 +++--
>   include/uapi/linux/kfd_ioctl.h                     |  3 +-
>   65 files changed, 635 insertions(+), 302 deletions(-)
