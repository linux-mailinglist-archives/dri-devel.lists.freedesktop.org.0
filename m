Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F15832BF5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74FB10E0F3;
	Fri, 19 Jan 2024 14:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD93610E0F3;
 Fri, 19 Jan 2024 14:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIfsAs061SkZ1kZMbH1zg84pftbzZC+tKINOdFiaQ+6eeA8BHNGcPFXMnDl+H7p5hqB7DH1LRwo0EA7ysGdBF6nb6zmgT92gVbwBGnlQx/5+wznel+Z/hN5W+2r2bx5TWdkxPL5619CJy5kJ01vY3dA9XJlqRtbe4m8QMljpBTSq+AOzvV7UnTu4ztz3ErIlWVLkAsfLMq5zz/M2AOKgsgO55UblmAcqJDSevFuA/eRPLzkXANS/hBCZ3gDP/uRug2vKidOqMfLSJQzq20fIyizilDTzeVvbEI8uACjnqi5U/9QU1PwFgOanhHaI8Cs7TPqDJhpxiqB0uKGXrsvV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqfzpR0PupxSCg0AgBOz6XR8ag9wfm+qKbkg3jth/Ag=;
 b=LUU1aICB9eOSVh0MDSJEEfhNs0OyLAJbWHuS2hLGkS4aJot9vpUu08U7kiGWdpmRO+xMhE2F5h7QydR3OOEO9Wa2ZhicXvO9y1rFL3mJic5gOK6aqjaYmAQLRyLcA+umk9SxP69feudtBFyzXSLVP8rGQbMJ2ebHapybgOmdwW8vMdUSexpXqByJUIkZtasSJtNqCQimrK0Ijzjh4Ly+jF6Pu37U8CDPg9f8qoPjhg2T0qu3nt8Q8YHKH2IXBZBt0KAwZUTjPLIUF+jWEWifMlGCLwzOBHQNJBvm2c/Kw7/mvIRrmmsxe0un/T5kg0r57NKoGNtdtcPTOSDyV97BHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqfzpR0PupxSCg0AgBOz6XR8ag9wfm+qKbkg3jth/Ag=;
 b=ZCgAEoolTVbxQ8cY2lTmHfwpGEvWVkrqcFr8EC8BFnfdWM1944m9ia0GnoRv5sTO3Bbps3IfztD1+MTT+OemZwHH8VYiN4cLHpC0C7dQwoA5yozWQHB9NhBsFo0qeJSBPqmk3oMvovLUER7i33+JrBdvAKN9Lgb++geKVGYA9Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 14:56:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7202.026; Fri, 19 Jan 2024
 14:56:24 +0000
Message-ID: <ea31b795-5b75-40e6-846e-51dc6696f8bc@amd.com>
Date: Fri, 19 Jan 2024 09:56:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] drm/amd/display: improve DTN color state log
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com, daniel@ffwll.ch, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
References: <20231128175623.121356-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef52e68-b362-434a-9ada-08dc18fece7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4v3kVnu2X2UFOgDmBwbcRe5qsxuLOYFCSSKAp0aa7kn6AihagspnLsZQNFuKD7t9BhxPoxXGw4pvhVDQ7juUlgjxsUbgpKin1Jt53NMZDeOcJ9/KqECOYpvJvpaaPc1qHcAjb+j75bWE/q+cyexyX8/TcgY2hWSXAcwa9KieV59ZYyZY8juX9kvzHzv96Ts6EgZs/8RhUcLFaG45gdrtDkf3IttH1ine6pZMBgs4rI7NCJpe3I6OjXd85JtvuwluydjKLehc1bg498scIcq1qXveshTB/+mgMOC/IXATZdcQxXTQJQge9jB1i8AhynKzFdT9Bf/3ifHjnSWnVDEFtigpkjT3ixW7y3ogotjF4eWbobZSoEB9+Hm6ZeKiqKhFKJSzz32RHuhTrKZe5gGVujcb6y0/EMDZNga7CwYqqPimSEyKc5ej39AaxkkSoGlKaMIXIuT0LqZ23p461E+22onojubGca5PsUMW/VDW+AP8mww8LoUwAlRfxmhvwaJIu6YacsYgGByTnI0zbWdcjhtRHj29EvTpQ9jTXA6CAn9qHNpTUNYnjcGqswbrkKrHRWo0mgB8lw9iWeEjRdkh023XG+f/irR993FAT8EJ++vY8oBgov5UxXKFg3mrxYSbU1MKCbRkgWVcBzkAiHUUI3fnmSsg5QjbHYDtj9WJFG0Hpv4mQgHhooINcIsimPjO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(26005)(6666004)(53546011)(83380400001)(86362001)(31696002)(36756003)(44832011)(6506007)(8676002)(6636002)(478600001)(2616005)(6512007)(66556008)(2906002)(38100700002)(921011)(4001150100001)(110136005)(4326008)(66476007)(316002)(5660300002)(66946007)(30864003)(6486002)(8936002)(966005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmd0UFA3WWJOUGp1UWU4dEl2cGtZdllnZ3pJb0p6a2toeWU1a3l4Wm9WYTMr?=
 =?utf-8?B?MEJwSkxrR0JmQnZPRGdMWUs2TTBVWDZpcUxidHN6MzUrZG1uSXU1RlAyL1I4?=
 =?utf-8?B?Wmx4TTZwWEJjSm1pL3BZSXMvTE5kK0ZqZlZuRlJtRUZvZnBPU3psSURsSElv?=
 =?utf-8?B?TFBaSEwzYWp4YWFCRFFxcklKZzk2UU5abHhhTVlHb2FXKzE2Nm1NODJGQXgw?=
 =?utf-8?B?eUhsUFRjQTBySlhwcDhabVdjaXlGODhPY2VsSUQ3UFBzLzl6dldIK1c0dGFG?=
 =?utf-8?B?b3BhTG1SbERIRUFybTQvTWlLNjkxRkN6RTRLcU12SEhpb2xxcHErWU1TR29S?=
 =?utf-8?B?My8wSzl1ak9Mb0VEMHZwR2x1dUdCeWxWdjZvSGpIdEkzWG5qMjRQa0wyYUVi?=
 =?utf-8?B?TkZlT1NaTW9VZFY5WXB4aUdNbkpwMVI2M3VzR1JqU0dqdVRlYW9EOWFrLzNi?=
 =?utf-8?B?L1Z1QkNNVUwySEY3VTQwRjBOeVJ4Uy95MHZxeGFBdWdNQVlLWmYyMy9mUDRs?=
 =?utf-8?B?STFIZ2pLdm9FZkdRa3VERS92S0QveXZ5eXI3azFPdnAvdlVPUm9Cano3Ym1y?=
 =?utf-8?B?dkl2a3dhNHFITEk4bWZTUWlBVFc1cEhVNTQxbUQyUVJ3UlJVVFNIZUNhSEY1?=
 =?utf-8?B?eEhvbUpKbUxaMDFoUU1ISGFhelVkNWxXS2lyOWl6VHBVbXY2RWVKWWtTNHUy?=
 =?utf-8?B?MW9YTDRWNjNXRllxY3lOMldjSU1Yak96cjFOc1BaRXMyMW45U0hXZUd1aG9n?=
 =?utf-8?B?dnVySFFPc3I1NXV3VUFFZGJHa0NEWGt5M1JnbS9HQzVrODZyem5kQW84c0Nq?=
 =?utf-8?B?WkpuMVNYZWlteFpOOHNOK0lhQWJQZ0FHaHM0VCtrZllQYXNFMERZd3c0YUcz?=
 =?utf-8?B?TFJjellmcGlGenZEZE15clkvdmdmNkJRZDJRdVh0cTZvWENWRCtTNk9iSXBa?=
 =?utf-8?B?NzkraCsySk5oaTRubDdCVTY0ejF3UlZ3cHJxNFI5NE5lbW5NN2hoRmpBU0M2?=
 =?utf-8?B?K1Bqb2JNNDMrai81VDIyNE5zNmxuUWRUZDhBd1cyanNZdjRnOGgvdkEwQlVp?=
 =?utf-8?B?VEJaZUxlYS9uR0tsNzV3TTBwNkFOcnk5ak9JTUgrR1dmNDBlOHBYSlNTZDZX?=
 =?utf-8?B?Wk1mU1hIWDlKbmx5bnV1dkNUNHB0NDd5K2xuRHVPM2dwYk5ESmViSTVCL0x5?=
 =?utf-8?B?c2FBZk4weWE0WG1QV3RIWnNqT3daR0ovQ2lZYUprTFpiOE9wYS9RcWNmY3lv?=
 =?utf-8?B?SkJ0Y0pIaHd2TDhBT29kd212QnF5Q2ZMdUpveDdISGtBZDN4M1dZYzlvZ1Vp?=
 =?utf-8?B?eFZkaDFYYlUyYThEVFpMaytmbnh3ajh0UDB1dGljQ2hkTTJLaDFFWXlRc2Mx?=
 =?utf-8?B?blQ1Snc3TnU4SlY4Um40NGZkWWtiOWNPY0VEMkRtZGxCQkNLd0hWQ3BmVWVs?=
 =?utf-8?B?ejRnMFhZS0FNS0dsRllaVFBleGN3VWk5ZklJYXN4RTJtbEExNnNrY2tkSTh0?=
 =?utf-8?B?SmVIRVRSeVdTb29XZjBiUHhyTXNBZmZTb2ZOTEtmeDZMNFJhWDBJdW5ZaTYr?=
 =?utf-8?B?aEREZTlVV0ZzWlppUkxXTXlVWkZGQmJyTzg0WWtGY0RMS3hTVnBqNHdzMTZI?=
 =?utf-8?B?MTJ0MktuS3FxWlZ1Q1pralBXMkxmdWFlWmp1SFhFTDJ4YTEyTGphUXZJL1hv?=
 =?utf-8?B?aFdxMzdlSTNlTHk0Wkg2TVdpR01BNnhOd3lzWCsvR0YvS0ozWUJPaGFnOXZR?=
 =?utf-8?B?Q2xjcVN5Tk90Ym9IUWY3TlBnMWM5dzEyMGlkdDRCcFBTOGY5QjJJc0hybEps?=
 =?utf-8?B?RTNrSzRsd0VZRWFhUmV3eS90NjJ3a2VFYmJMTzR1SzByVEZaZnE1WTJHa2Qx?=
 =?utf-8?B?bGdLTUxhbm02eWVMYVdKTWZrdGxCVGVENXpxRTBwYmJZUDhPZ0xPT0Rwb3Z2?=
 =?utf-8?B?YmFoUjllN1BLdzhQV1FTZXZPbDhtdEhhcktkZ0p5enFVV2J4aTRmb2YxQVVY?=
 =?utf-8?B?SWZJUkZJVktrbUw0dCtmN1R4QUNDTDVBRGs1V2NDcHl6MWNRWHMwM0l2RC9T?=
 =?utf-8?B?UUNPY2VudEF4SFd0UjRXM2JScFJOT3VtQWtjakRhSG1ud3FaZmxBbUVGait3?=
 =?utf-8?Q?BCk/LMH+vbnt0Q1fNuJJPxWAV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef52e68-b362-434a-9ada-08dc18fece7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 14:56:24.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3YZF5CLr/RTHVIp5znEe0aw/mqN6zOAb2fS36q1oxLa+m0RWfX20fN0g1yqKGKHmn1QzpfYKhem9Gfo617xyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-28 12:52, Melissa Wen wrote:
> This series updates the color state section of the AMD DTN log to match
> color resource differences between DCN versions.
> 
> Currently, the DTN log considers the DCN10 color pipeline, which is
> useless for newer DCN versions due to all the color capability
> differences. In addition to the new color blocks and features, some
> semantic differences meant that the DCN10 output was no longer suitable
> for newer families.
> 
> This version addresses comments from Siqueira and Harry [1]. It also
> contains some improvements: DPP and MPC gamut remap matrix data in 31.32
> fixed point format and coverage of DCN2+ and DCN3+.
> 
> - The first patch decouple DCN10 color state from HW log in a
>   preparation for color logs specific to each DCN family.
> - Harry kindly provided the second patch with a way to read Gamut Remap
>   Matrix data in 31.32 fixed point format instead of HW values.
> - With this, I replaced the DCN10 gamut remap output to display values
>   in the new format (third patch).
> - Patches 4 and 6 fill up the color state of DPP and MPC blocks for DCN3
>   from the right registers.
> - As DCN3+ has a new MPC color block for post-blending Gamut Remap
>   matrix, in the patch 5 I reuse Harry's approach for reading DPP gamut
>   remap matrix and create a helper to read data of MPC gamut remap
>   matrix.
> - Patch 7 and 9 create the new color state log specific for DCN2+ and
>   DCN3+. I didn't extend to DCN32 (and also DCN35) because I observed
>   some differences in the shaper and 3D LUT registers of this version.
> - Patch 8 adds description of DPP and MPC color blocks for for better
>   interpretation of data.
> 
> This new approach works well with the driver-specific color
> properties[2] and steamdeck/gamescope[3] together, where we can see
> color state changing from default values. I also tested with
> steamdeck/KDE and DCN21/GNOME.
> 
> Please find some `before vs after` results below:
> 
> ===
> 
> DCN301 - Before:
> ---------------
> 
> DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 1]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 2]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
> [ 0]:   0h   0h       2h     3           0        1             0     0
> [ 1]:   0h   1h       fh     2           2        0             0     0
> [ 2]:   0h   2h       3h     3           0        1             0     0
> [ 3]:   0h   3h       1h     3           2        0             0     0
> 
> 
> DCN301 - After (Gamescope):
> ---------------------------
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
> [ 0]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 3]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
> [ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> 
> 
> DCN301 - After (KDE/X11):
> ------------------------
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
> [ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> [ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
> [ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A  SW            4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000
> [ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> 
> ===============
> 
> DCN21 - Before:
> ---------------
> 
> DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:            0h  BypassFixed  Bypass       Bypass            1    00002000h 00000000h 20000000h 00000000h 00000000h 00002000h
> [ 3]:            0h  BypassFixed  Bypass       Bypass            1    00002000h 00000000h 20000000h 00000000h 00000000h 00002000h
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
> [ 0]:   0h   0h       3h     3           2        0             0     0
> [ 3]:   0h   3h       fh     2           2        0             0     0
> 
> 
> 
> DCN21 - After (GNOME):
> ----------------------
> 
> DPP:  DGAM mode  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
> [ 0]:    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass            SW  4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000
> [ 3]:    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass            SW  4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:1  dgam_rom: srgb:1,bt2020:1,gamma2_2:0,pq:0,hlg:0  post_csc:0  gamcor:0  dgam_rom_for_yuv:1  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  OGAM mode
> [ 0]:   0h   0h       3h     3           2        0             0     0      RAM A
> [ 3]:   0h   3h       fh     2           2        0             0     0     Bypass
> 
> MPC Color Caps: gamut_remap:0, 3dlut:0, ogam_ram:1, ocsc:1
> 
> ===
> 
> Let me know your thoughts.
> 

Thanks for improving this.

The series is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I'll merge it over the next day or two (depending on how
well our CI cooperates).

Harry

> Melissa
> 
> [1] https://lore.kernel.org/amd-gfx/20230913164329.123687-1-mwen@igalia.com/
> [2] https://lore.kernel.org/amd-gfx/20231116195812.906115-1-mwen@igalia.com/
> [3] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> 
> 
> Harry Wentland (1):
>   drm/amd/display: Add dpp_get_gamut_remap functions
> 
> Melissa Wen (8):
>   drm/amd/display: decouple color state from hw state log
>   drm/amd/display: read gamut remap matrix in fixed-point 31.32 format
>   drm/amd/display: fill up DCN3 DPP color state
>   drm/amd/display: add get_gamut_remap helper for MPC3
>   drm/amd/display: create DCN3-specific log for MPC state
>   drm/amd/display: hook up DCN30 color blocks data to DTN log
>   drm/amd/display: add DPP and MPC color caps to DTN log
>   drm/amd/display: hook up DCN20 color blocks data to DTN log
> 
>  .../drm/amd/display/dc/basics/conversion.c    |  34 ++++
>  .../drm/amd/display/dc/basics/conversion.h    |   4 +
>  .../amd/display/dc/dcn10/dcn10_cm_common.c    |  20 +++
>  .../amd/display/dc/dcn10/dcn10_cm_common.h    |   4 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c  |   3 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h  |   3 +
>  .../drm/amd/display/dc/dcn10/dcn10_dpp_cm.c   |  70 +++++++-
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  |  31 ++--
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h  |   3 +
>  .../drm/amd/display/dc/dcn20/dcn20_dpp_cm.c   |  55 +++++++
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_init.c |   1 +
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c  |  24 ++-
>  .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |   1 +
>  .../gpu/drm/amd/display/dc/dcn21/dcn21_init.c |   1 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  38 ++++-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h  |   2 +
>  .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c   |  54 +++++++
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 106 ++++++++++++-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h  |   4 +
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c |   1 +
>  .../drm/amd/display/dc/dcn314/dcn314_init.c   |   1 +
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c  |   1 +
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  90 ++++++++---
>  .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 106 +++++++++++++
>  .../amd/display/dc/hwss/dcn20/dcn20_hwseq.h   |   2 +
>  .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 149 ++++++++++++++++++
>  .../amd/display/dc/hwss/dcn30/dcn30_hwseq.h   |   3 +
>  .../drm/amd/display/dc/hwss/hw_sequencer.h    |   2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  14 ++
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |   7 +
>  32 files changed, 795 insertions(+), 41 deletions(-)
> 

