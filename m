Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5505389BA6
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AF56E3F0;
	Thu, 20 May 2021 03:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AACD6E3F0;
 Thu, 20 May 2021 03:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EscqkJyYdeFvRDsVOFB3vy/i6wk/5JqOa2QM96IV/xkzYZ4tk8/R0uNJx5uHg8J+vKXpKoLKBHtgUzQYg7jSpDRAonNqa2T/Nxrer91Qy2LB5MDJKZ4JV/HcFNh1sWhy9MP586o0hG4zUrhj2P4djWGw1xURZMXz+tFm2jQ4pU2VDkh9b6SWgyKQIeXCEpwz78859XLGtDTbNk1azuXhk+YniWyd/j2cOYxZ649eeHiPstp6IPg93OULJyf8Xm73dRK9uwcqrok3wDqLHI3FG19oUqs4vmibTgolnswwo7sTeRJsh+qy6tnrTkNHO4G7/nY+ngoXr6W4jyfCYg6lUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPj0xaGOU/XLLWUf4DGdhYIqCHaI+MxXAXtWMVOAAKw=;
 b=kt6h/UxWRDEPcjz3K/YRydl0Nhhg0LHK4t6cJi991AhsHTEB6aG9TlkalUPPE+ersekIiTDPFlQQFbpakLwKFw983+g4UVrYXqaYUwF0VTumOwzAEAaJHzReuiBUzKXX55BEr/QdklAAQjyUsk2tNKKFuLL034TVgRWUQWufgP+BG4DwTy6DwGtCE7+C4byPFgMahGvQ2siCpkFKp8BQpmRpGlaaxBLNCnSkT5dgwncF2TwkD6ZhXKFygJRKf2RSr385gaANrK0WKHV+RJSY/9fdHq7EROd/b2G2aectaoVvJoQhA09X66QG4fyoy0jGMa4tW8NeoU0ZJPzM4fNd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPj0xaGOU/XLLWUf4DGdhYIqCHaI+MxXAXtWMVOAAKw=;
 b=ENLDFhaJ2et7uuXZnqOWcuM8aDN0zuEfbXdOjFH4tJALmC6gvvKGCNhgsV997KcBXuO0XIeUcJEy/NK6QxEaNC+q2hmIJz7pYeKrubhzagoDLI+uhqlECgLAwTCMlVHmEyr3fsfKxJDgoNkEONikuIjUCLlgwhPHqsy15me/3rk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4799.namprd12.prod.outlook.com (2603:10b6:208:a2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 03:13:20 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:13:20 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.14
Date: Wed, 19 May 2021 23:12:58 -0400
Message-Id: <20210520031258.231896-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [204.111.139.213]
X-ClientProxiedBy: BLAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:32b::24) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.111.139.213) by
 BLAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:32b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 03:13:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd890050-489b-47e8-47d4-08d91b3d3807
X-MS-TrafficTypeDiagnostic: MN2PR12MB4799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47991FDE0444F7CF65041920F72A9@MN2PR12MB4799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++K575XaCxvIKAhcW9+DzSzk3EdkxGBmCMgQBQipTfIw/EeZyyDyUsnImqscNEDeFgdFQa1VeCSks6wxvYjinUh3/HooRi/CXHrYLteYcHCtPt/3HOPxfr5jUKrNS445SUbWxAN0tQXvDbJTBjz6MFt8CDxoPlS73wxOgztQbbNr2mnRMS4TZckeH2DodqjG+P5Axshvnu+e1JDds6TO2bBJ8u9JVXAw11W3TiTLKVYtTptRsiLcHp9h97ykXbGony+vcBsF9XARLg3MfU+fbljVUS/3jB3Io1VrVXGamW0jEkq04I2VdrYpevZCoN+64ttPjNp4GqBPM5JZAnKeif/H2Gkz0w5Gup4j5HULv9isLWTQr/x8VYUcXLM+pB7WHgFlRADtEpqosbi29a9w7pE9flK28xOxXD1CMdAW/nq4YHpfCZa/DooBRGnA+bcpCDNNVwv3YX7fpoehiglLczgWscQSksetOy1GX/0ZDXagE4/juCWTJRvdhTaM1Hm7ufHKyjheS3qsDpu1oFUG548UPtBasGchfznzbntoy9vST/xiy1A76LUs8m+/+H03a4vvVi17Ha0zDKYVbjF9sf5ckLXfhdesz6nXxrSA+bcQDHTbrXraIao4g8LQd9ySfJWZqebmaDPczRCFyT4RVo9KtVrBn8MdY4gGXP4jNnbe74AJntfdEXR8svNihn+O02rGgm+6jWVqVrAil381JNKjkrLlgdlK4sTFxaC6+UJyG6MJtavffDWBmPM1Ocrk1NCGiYPnToeAH6kGQ//ydp8oGPNTGc1d+9+zr9AfO0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(66476007)(478600001)(66946007)(66556008)(26005)(83380400001)(4326008)(2906002)(956004)(316002)(86362001)(6506007)(2616005)(6486002)(966005)(6666004)(36756003)(5660300002)(6512007)(186003)(16526019)(30864003)(38100700002)(38350700002)(8936002)(52116002)(1076003)(66574015)(8676002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDB2WHBXc25TSEZJRHVNazJlQllhRTZnSUpnQUpMUjN3d1Z4OERHcTFwd3dV?=
 =?utf-8?B?eTRLV3I0Y2JWdFFZbWFIYjNTZ1ZvanRuRUZWU0p3WDVhZ2Jxc1h4bXcvVUVk?=
 =?utf-8?B?ZGRQNzU3MkM4Z20vQktUbjdRTTRrODV4YXp5dmNPMXpiM25IaXRkZC9iWjY5?=
 =?utf-8?B?ak9tNmMvWmIyNFNDa0taSXQ0eTc2aExnN1FKZC9tb0M3NHVYVVg3NUFTYmg2?=
 =?utf-8?B?eGY0dGlScTdBaG41aGpteFpOZHVCTmZ3c3g2alpMRWhaRTlMY1g0dTM3UzFT?=
 =?utf-8?B?K08ySk15dTFFRVNhcE9pY20rY0pVVEdYZ0YwMTJzbnEzR2IyUzFhK3pNYU4v?=
 =?utf-8?B?YW80WTNjMnNkYlNGb2dDcCtpL3l5akhITjRQQ3VlaDJ0bnRCc0M5Tld3N2dD?=
 =?utf-8?B?dFVjMDY2aEFNOVE5NkNZMStxazJIbUk5aWpYRWw3Y0lYU3BRZk01UWwya2Q2?=
 =?utf-8?B?anBHU243MHM5emhQcjlEd1VSYWV4S2trMXFrdU5vUDY5VGNadnpLd09qb3pz?=
 =?utf-8?B?SC9KVUlHWU9OMDRJSjV6Ujd4RDJnV0NRQVJDZW1NNm81bG1kVTdCSWYzYTJo?=
 =?utf-8?B?QXBycU5jNWRaZjMxRFB0Umg3aldMUDhPaEowdjJOY25DL2NjVmV1RU5FejdS?=
 =?utf-8?B?K0pDS3BMRFIzMG9ncCtqQmNKQ0pDVlhSZGd4ZHBZWDROSnJ5Y09lWUwvR1BP?=
 =?utf-8?B?dXJidmR2Tmc3c2lMb2xWaXlnTVBkczBGK3drNDBOd3hVQitISjhGU3FzWTF5?=
 =?utf-8?B?ci9FMnNRWlJJZ1ZtdWdvMVpCeTYvS3o4d1YzMnJMcTFTT1ZFclhSRUc4bU44?=
 =?utf-8?B?U1Q1dThWZE5iSGQ4dXlkclpEWlVZRFhERUJRU1ZkRkVaQm9ZT2NJRVBUb1Az?=
 =?utf-8?B?SGJQL01tcTRITVBUZ0ZtVkNBcWVaN1hIekp1eklsblRZODU3SG5KVkVtVElN?=
 =?utf-8?B?R0pwV1BxMEZ1YWVmbVJYbXNtMUFzS0VEVDBxcUNRK1hXS2NJaWdyUTE2WlYx?=
 =?utf-8?B?K2FDVkZaanBzQ2RNdE5oNEtpRitmNlVUWHJNaGs4Nlgwb3lmR090VlJPSk9k?=
 =?utf-8?B?N3IxenpTSjR1a3pPdStIWmZQOHRocE1iWEFEQXVLVzZ4Ulp1VDc5aHUzUnpM?=
 =?utf-8?B?RFA3WTkrbXpTaDljZFRTdDAwQjg3Y05lZWZNcG1HRHJzQjltMjNWSkRCbVRx?=
 =?utf-8?B?OGNkSDl0UllrMFdaSnNETHRaUjBxYnBQQzZmblJ1a0orT2FsV2lmMWMrR1Zn?=
 =?utf-8?B?VC8ySUtLS3ZLdTVtd0lqUzR3c1NGQWFhM082ZEMxQkMzVTBEaHpnVmVUQkp1?=
 =?utf-8?B?R0JPUG1lbjdSejVSOVVuYjYzQlRXNmJvT0dmMXdrSXVqVmlaWU1jRkdwQUd2?=
 =?utf-8?B?Y3c1dlB5ZTFxcVhTMTBHUEowVGd1Y0kzbWxkL0gwcjRxUGxDUHd1bmhhUDhG?=
 =?utf-8?B?U0NDTUx0WjJ6VTNRci9LcHlEYWhRSytaR0U5YXQ5aXRDd0hlNkw1VmtURlE0?=
 =?utf-8?B?WHlDTEZoeUcvVE9qV0t5UnEzYkprNWlLMWk1UUVMem8xTFkwQ1ZRSnJQalJC?=
 =?utf-8?B?ZUVjdWl5cVNsdEpPbkU0STBSaVNQNU5xS1pid2tFWVB3RVBQL0JQekZ4cFBG?=
 =?utf-8?B?b1YvbmdFOXFmQytPN0dXL25TaEFrdFIrd3BkbTg5QXovQi9VRUtmSjArTGhM?=
 =?utf-8?B?R0FQUzJLZUVud2daUjlYYnFXaWNqZWpVdm5yWHRXdDkzMjVtUytjRnRxdUhX?=
 =?utf-8?B?YlE4RXJLTm9ZWGdaemYxRjh4OFVBZE11d1U4bDNHTlJSZFF2Z3lYRnExdEhp?=
 =?utf-8?B?NkY5L1FjTnNRd0tPRjZ4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd890050-489b-47e8-47d4-08d91b3d3807
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:13:19.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfYwd92TnDe1Rm9tH/h8NPRAOhreTJ0sGD0Jn6cX3MFd03WUjoOq0itmlldie1icYo7TiupPJQulmiG7biv+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4799
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

New stuff for 5.14, same as last week, but with fixed up fixes tag.

The following changes since commit af8352f1ff54c4fecf84e36315fd1928809a580b:

  Merge tag 'drm-msm-next-2021-04-11' of https://gitlab.freedesktop.org/drm/msm into drm-next (2021-04-13 23:35:54 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-05-19

for you to fetch changes up to 2bb5b5f688cbbd5030629905d3ed8032ab46e79f:

  drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected (2021-05-19 22:29:40 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-05-19:

amdgpu:
- Aldebaran updates
- More LTTPR display work
- Vangogh updates
- SDMA 5.x GCR fixes
- RAS fixes
- PCIe ASPM support
- Modifier fixes
- Enable TMZ on Renoir
- Buffer object code cleanup
- Display overlay fixes
- Initial support for multiple eDP panels
- Initial SR-IOV support for Aldebaran
- DP link training refactor
- Misc code cleanups and bug fixes
- SMU regression fixes for variable sized arrays
- MAINTAINERS fixes for amdgpu

amdkfd:
- Initial SR-IOV support for Aldebaran
- Topology fixes
- Initial HMM SVM support
- Misc code cleanups and bug fixes

radeon:
- Misc code cleanups and bug fixes
- SMU regression fixes for variable sized arrays
- Flickering fix for Oland with multiple 4K displays

UAPI:
- amdgpu: Drop AMDGPU_GEM_CREATE_SHADOW flag.
  This was always a kernel internal flag and userspace use of it has always been blocked.
  It's no longer needed so remove it.
- amdkgd: HMM SVM support
  Overview: https://patchwork.freedesktop.org/series/85562/
  Porposed userspace: https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/fxkamd/hmm-wip

----------------------------------------------------------------
Alex Deucher (12):
      drm/amdgpu/gmc9: remove dummy read workaround for newer chips
      drm/amdgpu/display: add documentation for dmcub_trace_event_en
      MAINTAINERS: fix a few more amdgpu tree links
      drm/amdgpu: Add graphics cache rinse packet for sdma 5.0
      drm/amdgpu: drop the GCR packet from the emit_ib frame for sdma5.0
      drm/amdgpu: change the default timeout for kernel compute queues
      drm/amdgpu/pm: add documentation for pp_od_clock_voltage for APUs
      drm/amdgpu/pm: add documentation for pp_od_clock_voltage for vangogh
      drm/amdgpu/display: remove an old DCN3 guard
      drm/amdgpu/display: fix warning when CONFIG_DRM_AMD_DC_DCN is not defined
      drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not defined
      drm/amdgpu/display: fix dal_allocation documentation

Alex Sierra (12):
      drm/amdkfd: helper to convert gpu id and idx
      drm/amdkfd: add xnack enabled flag to kfd_process
      drm/amdkfd: add ioctl to configure and query xnack retries
      drm/amdgpu: enable 48-bit IH timestamp counter
      drm/amdkfd: SVM API call to restore page tables
      drm/amdkfd: add svm_bo reference for eviction fence
      drm/amdgpu: add param bit flag to create SVM BOs
      drm/amdgpu: svm bo enable_signal call condition
      drm/amdgpu: add svm_bo eviction to enable_signal cb
      drm/amdgpu: extend xnack limit page fault timeout
      drm/amdkfd: svm ranges creation for unregistered memory
      drm/amdkfd: set attribute access for default ranges

Anthony Koo (6):
      drm/amd/display: [FW Promotion] Release 0.0.60
      drm/amd/display: [FW Promotion] Release 0.0.61
      drm/amd/display: [FW Promotion] Release 0.0.62
      drm/amd/display: [FW Promotion] Release 0.0.63
      drm/amd/display: [FW Promotion] Release 0.0.64
      drm/amd/display: [FW Promotion] Release 0.0.65

Anthony Wang (4):
      drm/amd/display: Force vsync flip when reconfiguring MPCC
      drm/amd/display: Add DSC check to seamless boot validation
      drm/amd/display: disable seamless boot for external DP
      drm/amd/display: Handle potential dpp_inst mismatch with pipe_idx

Aric Cyr (8):
      drm/amd/display: 3.2.131
      drm/amd/display: Fix FreeSync when RGB MPO in use
      drm/amd/display: 3.2.132
      drm/amd/display: 3.2.133
      drm/amdgpu/dc: Revert commit "treat memory as a single-channel"
      drm/amd/display: 3.2.134
      drm/amd/display: 3.2.135
      drm/amd/display: 3.2.135.1

Bas Nieuwenhuizen (2):
      drm/amdgpu: Init GFX10_ADDR_CONFIG for VCN v3 in DPG mode.
      drm/amdgpu: Use device specific BO size & stride check.

Bing Guo (1):
      drm/amd/display: add helper for enabling mst stream features

Brandon Syu (1):
      drm/amd/display: fix HDCP reset sequence on reinitialize

Calvin Hou (1):
      drm/amd/display: remove checking sink in is_timing_changed

Chaitanya Dhere (1):
      drm/amd/display: DETBufferSizeInKbyte variable type modifications

Chris Park (1):
      drm/amd/display: Fix BSOD with NULL check

Christian König (4):
      drm/amdgpu: fix coding style and documentation in amdgpu_gtt_mgr.c
      drm/amdgpu: fix coding style and documentation in amdgpu_vram_mgr.c
      drm/amdgpu: fix concurrent VM flushes on Vega/Navi v2
      drm/amdgpu: restructure amdgpu_vram_mgr_new

Colin Ian King (3):
      drm/amdkfd: fix uint32 variable compared to less than zero
      drm/amdkfd: remove redundant initialization to variable r
      drm/amdkfd: Fix spelling mistake "unregisterd" -> "unregistered"

Dale Zhao (1):
      drm/amd/display: Add audio support for DFP type of active branch is DP case

Dan Carpenter (2):
      drm/amdgpu: fix an error code in init_pmu_entry_by_type_and_add()
      drm/amd/pm: fix error code in smu_set_power_limit()

Darren Powell (3):
      amdgpu/pm: add extra info to SMU msg pre-check failed message
      amdgpu/pm: Prevent force of DCEFCLK on NAVI10 and SIENNA_CICHLID
      amdgpu/pm: set pp_dpm_dcefclk to readonly on NAVI10 and newer gpus

David Galiffi (1):
      drm/amd/display: Fixed typo in function name.

David Ward (1):
      drm/amd/display: Initialize attribute for hdcp_srm sysfs file

Dennis Li (9):
      drm/amdkfd: add edc error interrupt handle for poison propogate mode
      drm/amdgpu: fix a error injection failed issue
      drm/amdgpu: refine gprs init shaders to check coverage
      drm/amdgpu: fix no full coverage issue for gprs initialization
      drm/amdgpu: update the shader to clear specific SGPRs
      drm/amdgpu: covert ras status to kernel errno
      drm/amdgpu: correct the funtion to clear GCEA error status
      drm/amdgpu: add function to clear MMEA error status for aldebaran
      drm/amdgpu: add synchronization among waves in the same threadgroup

Dillon Varone (2):
      drm/amd/display: Fix call to pass bpp in 16ths of a bit
      drm/amd/display: Report Proper Quantization Range in AVI Infoframe

Dingchen (David) Zhang (2):
      drm/amd/display: update hdcp display using correct CP type.
      drm/amd/display: add handling for hdcp2 rx id list validation

Dmytro Laktyushkin (1):
      drm/amd/display: fix use_max_lb flag for 420 pixel formats

Dwaipayan Ray (1):
      drm/amd/amdgpu: Fix errors in function documentation

Eric Huang (2):
      drm/amdkfd: change MTYPEs for Aldebaran's HW requirement
      drm/amdkfd: add ACPI SRAT parsing for topology

Eric Yang (1):
      drm/amd/display: Extend DMUB HW params to allow DM to specify boot options

Evan Quan (3):
      drm/amdgpu: add new MC firmware for Polaris12 32bit ASIC
      drm/amd/pm: new gpu_metrics structure for pmfw attached timestamp
      drm/amd/pm: expose pmfw attached timestamp on Aldebaran

Fabio M. De Francesco (4):
      drm/amdkfd: Fix kernel-doc syntax error
      drm/amd/pm/powerplay/hwmgr: Fix kernel-doc syntax in documentation
      drm/amd/amdgpu: Fix errors in documentation of function parameters
      drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all with drm_modeset_lock

Fangzhi Zuo (1):
      drm/amd/display: Add dc log for DP SST DSC enable/disable

Feifei Xu (2):
      drm/amdgpu: Change the sdma interrupt print level
      drm/amdgpu: Correct and simplify sdma 4.x irq.num_types

Felix Kuehling (18):
      drm/amdkfd: Remove legacy code not acquiring VMs
      drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
      drm/amdkfd: Allow access for mmapping KFD BOs
      drm/amdgpu: Remove verify_access shortcut for KFD BOs
      drm/amdkfd: map svm range to GPUs
      drm/amdkfd: svm range eviction and restore
      drm/amdgpu: Enable retry faults unconditionally on Aldebaran
      drm/amdkfd: validate vram svm range from TTM
      drm/amdkfd: HMM migrate ram to vram
      drm/amdkfd: HMM migrate vram to ram
      drm/amdkfd: invalidate tables on page retry fault
      drm/amdkfd: page table restore through svm API
      drm/amdkfd: add svm_bo eviction mechanism support
      drm/amdkfd: refine migration policy with xnack on
      drm/amdkfd: add svm range validate timestamp
      drm/amdkfd: multiple gpu migrate vram to vram
      drm/amdkfd: Add CONFIG_HSA_AMD_SVM
      drm/amdkfd: Make svm_migrate_put_sys_page static

George Shen (1):
      drm/amd/display: Filter out YCbCr420 timing if VSC SDP not supported

Guenter Roeck (1):
      drm/amd/display: Fix build warnings

Gustavo A. R. Silva (3):
      drm/radeon/ni_dpm: Fix booting bug
      drm/radeon/si_dpm: Fix SMU power state load
      drm/amd/pm: Fix out-of-bounds bug

Harish Kasiviswanathan (2):
      drm/amd/pm: Update energy_accumulator in gpu metrics
      drm/amdkfd: Add Aldebaran gws support

Harry Wentland (2):
      drm/amd/display: Add debugfs to repress HPD and HPR_RX IRQs
      drm/amd/display: Reject non-zero src_y and src_x for video planes

Hawking Zhang (16):
      drm/amdgpu: correct default gfx wdt timeout setting
      drm/amdgpu: only harvest gcea/mmea error status in arcturus
      drm/amdgpu: only harvest gcea/mmea error status in aldebaran
      drm/amdgpu: disable gfx ras by default in aldebaran
      drm/amdgpu: implement smuio callback to query socket id
      drm/amdgpu: provide socket/die id info in RAS message
      drm/amdgpu: remove unnecessary header include
      drm/amdgpu: add hdp ras structures
      drm/amdgpu: add helpers for hdp ras init/fini
      drm/amdgpu: implement hdp v4_0 ras functions
      drm/amdgpu: initialize hdp v4_0 ras functions
      drm/amdgpu: init/fini hdp v4_0 ras
      drm/amdgpu: enable ras error count query and reset for HDP
      drm/amdgpu: retired reset_ras_error_count from hdp callbacks
      drm/amdgpu: switch to mmhub ras callback for ras fini
      drm/amdgpu: enable gfx ras in aldebran by default

Huang Rui (1):
      drm/amdgpu: enable tmz on renoir asics

Hugo Hu (1):
      drm/amd/display: treat memory as a single-channel for asymmetric memory v2

Ilya Bakoulin (2):
      drm/amd/display: Fix clock table filling logic
      drm/amd/display: Handle pixel format test request

Jack Zhang (2):
      drm/amd/sriov no need to config GECC for sriov
      drm/amd/amdgpu/sriov disable all ip hw status by default

Jake Wang (2):
      drm/amd/display: Added support for multiple eDP BL control
      drm/amd/display: Added multi instance support for ABM

Jiansong Chen (1):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for dimgrey_cavefish

Jimmy Kizito (4):
      drm/amd/display: Update DPRX detection.
      drm/amd/display: Update setting of DP training parameters.
      drm/amd/display: Add fallback and abort paths for DP link training.
      drm/amd/display: Expand DP module training API.

Jinzhou Su (4):
      drm/amdgpu: Add graphics cache rinse packet for sdma
      drm/amdgpu: Add mem sync flag for IB allocated by SA
      drm/amdgpu: Enable SDMA MGCG for Vangogh
      drm/amdgpu: Enable SDMA LS for Vangogh

John Clements (4):
      drm/amdgpu: update mmhub 1.7 ras error reporting
      drm/amdgpu: update gfx 9.4.2 ras error reporting
      drm/amdgpu: resolve erroneous gfx_v9_4_2 prints
      drm/amdgpu: add support for ras init flags

Jonathan Kim (5):
      drm/amdkfd: add per-vmid-debug map_process_support
      drm/amdkfd: fix spelling mistake in packet manager
      drm/amdkfd: report atomics support in io_links over xgmi
      drm/amdkfd: report the numa weight between host and device over xgmi
      drm/amdkfd: fix no atomics settings in the kfd topology

Joseph Greathouse (1):
      drm/amdgpu: Copy MEC FW version to MEC2 if we skipped loading MEC2

Jude Shih (1):
      drm/amd/display: Support for DMUB AUX

Kai-Heng Feng (2):
      drm/amdgpu: Register VGA clients after init can no longer fail
      drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected

Kees Cook (2):
      drm/radeon: Fix off-by-one power_state index heap overwrite
      drm/radeon: Avoid power table parsing memory leaks

Kenneth Feng (5):
      drm/amd/amdgpu: enable ASPM on navi1x
      drm/amd/amdgpu: enable ASPM on vega
      drm/amd/amdgpu: add ASPM support on polaris
      drm/amd/amdgpu: add cgls
      drm/amd/pm: enable ASPM by default

Kent Russell (1):
      drm/amdgpu: Ensure dcefclk isn't created on Aldebaran

Lee Jones (7):
      drm/amd/amdgpu/amdgpu_device: Remove unused variable 'r'
      drm/radeon/radeon_device: Provide function name in kernel-doc header
      drm/amd/amdgpu/amdgpu_fence: Provide description for 'sched_score'
      drm/amd/amdgpu/amdgpu_gart: Correct a couple of function names in the docs
      drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly documented function 'amdgpu_ttm_copy_mem_to_mem()'
      drm/amd/amdgpu/amdgpu_ring: Provide description for 'sched_score'
      drm/amd/amdgpu/amdgpu_cs: Repair some function naming disparity

Lewis Huang (3):
      drm/amd/display: wait vblank when stream enabled and update dpp clock
      drm/amd/display: Revert wait vblank on update dpp clock
      drm/amd/display: skip program clock when allow seamless boot

Lijo Lazar (5):
      drm/amd/pm: Use VBIOS PPTable for aldebaran
      drm/amd/pm: Show updated clocks on aldebaran
      drm/amd/pm: Add interface to get FW private buffer
      drm/amd/pm: Add debugfs node to read private buffer
      drm/amd/pm: Update aldebaran pmfw interface

Likun GAO (1):
      drm/amdgpu: add judgement when add ip blocks (v2)

Likun Gao (1):
      drm/amdgpu: update the method for harvest IP for specific SKU

Luben Tuikov (9):
      drm/amdgpu: Fix a bug for input with double sscanf
      drm/amdgpu: Fix a bug in checking the result of reserve page
      drm/amdgpu: Add bad_page_cnt_threshold to debugfs
      drm/amdgpu: Fix kernel-doc for the RAS sysfs interface
      drm/amdgpu: Add double-sscanf but invert
      drm/amdgpu: Remove redundant ras->supported
      drm/amdgpu: Move up ras_hw_supported
      drm/amdgpu: Rename to ras_*_enabled
      drm/amdgpu: Export ras_*_enabled to debugfs

Max.Tseng (2):
      drm/amd/display: Add new DP_SEC registers for programming SDP Line number
      drm/amd/display: Add SE_DCN3_REG_LIST for control SDP num

Michael Strauss (5):
      drm/amd/display: Add debug flag to enable eDP ILR by default
      drm/amd/display: Disable boot optimizations if ILR optimzation is required
      drm/amd/display: Remove static property from decide_edp_link_settings
      drm/amd/display: Add link rate optimization logs for ILR
      drm/amd/display: Add new case to get spread spectrum info

Mike Hsieh (1):
      drm/amd/display: Fix DSC enable sequence

Mike Li (1):
      drm/amdkfd: Update L1 and add L2/3 cache information

Mikita Lipski (4):
      drm/amd/display: Remove unused flag from stream state
      drm/amd/display: Connect clock optimization function to dcn301
      drm/amd/display: fix wrong statement in mst hpd debugfs
      drm/amd/display: multi-eDP backlight support

Mukul Joshi (3):
      drm/amdgpu: Reset RAS error count and status regs
      drm/amdgpu: Fix SDMA RAS error reporting on Aldebaran
      drm/amdgpu: Enable TCP channel hashing for Aldebaran

Nicholas Kazlauskas (2):
      drm/amd/display: Fix DML validation of simple vs native 422 modes
      drm/amd/display: Always poll for rxstatus in authenticate

Nikola Cornij (1):
      drm/amd/display: Avoid gpio conflict on MST branch

Nirmoy Das (7):
      drm/amdgpu: expose amdgpu_bo_create_shadow()
      drm/amdgpu: cleanup amdgpu_vm_init()
      drm/amdgpu: remove unused vm context flags
      drm/amdgpu: create shadow bo using amdgpu_bo_create_shadow()
      drm/amdgpu: cleanup amdgpu_bo_create()
      drm/amdgpu: remove AMDGPU_GEM_CREATE_SHADOW flag
      drm/amdgpu: remove excess function parameter

Oak Zeng (5):
      drm/amdgpu: Introduce functions for vram physical addr calculation
      drm/amdgpu: Calling address translation functions to simplify codes
      drm/amdgpu: Introduce new SETUP_TMR interface
      Revert "drm/amdgpu: workaround the TMR MC address issue (v2)"
      drm/amdgpu: Quit RAS initialization earlier if RAS is disabled

Paul Hsieh (1):
      drm/amd/display: update DCN to use new surface programming

Paul Wu (1):
      drm/amd/display: Set stream_count to 0 when dc_resource_state_destruct.

Pavan Kumar Ramayanam (1):
      drm/amdgpu: Handling of amdgpu_device_resume return value for graceful teardown

Peng Ju Zhou (1):
      drm/amdgpu: Rename the flags to eliminate ambiguity v2

Philip Yang (22):
      drm/amdkfd: add svm ioctl API
      drm/amdkfd: register svm range
      drm/amdkfd: add svm ioctl GET_ATTR op
      drm/amdgpu: add common HMM get pages function
      drm/amdkfd: support larger svm range allocation
      drm/amdkfd: validate svm range system memory
      drm/amdkfd: deregister svm range
      drm/amdgpu: export vm update mapping interface
      drm/amdkfd: register HMM device private zone
      drm/amdkfd: set memory limit to avoid OOM with HMM enabled
      drm/amdkfd: support xgmi same hive mapping
      drm/amdkfd: copy memory through gart table
      drm/amdkfd: Add SVM API support capability bits
      drm/amdkfd: fix double free device pgmap resource
      drm/amdkfd: retry validation to recover range
      drm/amdgpu: return IH ring drain finished if ring is empty
      drm/amdkfd: handle stale retry fault
      drm/amdgpu: address remove from fault filter
      drm/amdkfd: enable subsequent retry fault
      drm/amdkfd: flush TLB after updating GPU page table
      drm/amdkfd: handle errors returned by svm_migrate_copy_to_vram/ram
      drm/amdkfd: new range accessible by all GPUs

Qingqing Zhuo (2):
      drm/amd/display: Update modifier list for gfx10_3
      Revert "Revert "drm/amdgpu: Ensure that the modifier requested is supported by plane.""

Ramesh Errabolu (1):
      drm/amdgpu: Use iterator methods exposed by amdgpu_res_cursor.h in building SG_TABLE's for a VRAM BO

Robin Chen (1):
      drm/amd/display: Clear MASTER_UPDATE_LOCK_DB_EN when disable doublebuffer lock

Robin Singh (2):
      drm/amd/display: fixed divide by zero kernel crash during dsc enablement
      drm/amd/display: removed unused function dc_link_reallocate_mst_payload.

Rodrigo Siqueira (1):
      drm/amd/display: Fix two cursor duplication when using overlay

Roman Li (2):
      drm/amd/display: Fix hangs with psr enabled on dcn3.xx
      drm/amd/display: fix potential gpu reset deadlock

Rouven Czerwinski (1):
      drm/amd/display: remove unused function dc_link_perform_link_training

Roy Sun (1):
      drm/amd/amdgpu: Cancel the hrtimer in sw_fini

Sathishkumar S (2):
      drm/amdgpu: set vcn mgcg flag for picasso
      drm/amdgpu: update vcn1.0 Non-DPG suspend sequence

Shashank Sharma (1):
      drm/amdgpu/dm: Fix NULL pointer crash during DP MST hotplug

Simon Ser (2):
      amd/display: allow non-linear multi-planar formats
      amdgpu: fix GEM obj leak in amdgpu_display_user_framebuffer_create

Souptick Joarder (1):
      drm/amdgpu: Added missing prototype

Stanley.Yang (2):
      drm/amdgpu: optimize gfx ras features flag clean
      drm/amdgpu: force enable gfx ras for vega20 ws

Stylon Wang (1):
      drm/amd/display: Expose internal display flag via debugfs

Tian Tao (1):
      drm/radeon/cik: remove set but not used variables

Tom Rix (1):
      drm/amd/pm: initialize variable

Victor Zhao (2):
      drm/amdgpu/sriov: Remove clear vf fw support
      drm/amdgpu: fix r initial values

Wan Jiabing (2):
      drm/amd/display: Remove duplicate include of hubp.h
      drm/amd/display: Remove duplicate declaration of dc_state

Wenjing Liu (3):
      drm/amd/display: take max dsc stream bandwidth overhead into account
      drm/amd/display: add dsc stream overhead for dp only
      drm/amd/display: minor dp link training refactor

Wesley Chalmers (2):
      drm/amd/display: Set LTTPR mode to non-LTTPR if no repeaters found
      drm/amd/display: Unconditionally clear training pattern set after lt

Xiaojian Du (6):
      drm/amd/pm: update the driver interface header for vangogh
      drm/amd/pm: add support for new smu metrics table for vangogh
      drm/amd: update the atomfirmware header for smu12
      drm/amd/pm: add the callback to get the bootup values for renoir
      drm/amd/pm: remove the "set" function of pp_dpm_mclk for vangogh
      drm/amd/pm: revise two names of sensor values for vangogh

Yang Li (1):
      drm/radeon/si: Fix inconsistent indenting

Yingjie Wang (1):
      drm/amd/dc: Fix a missing check bug in dm_dp_mst_detect()

Yu-ting Shen (2):
      drm/amd/display: ddc resource data need to be initialized
      drm/amd/display: avoid to authentication when DEVICE_COUNT=0

Zhan Liu (1):
      drm/amd/display: Avoid HPD IRQ in GPU reset state

Zhen Lei (2):
      drm/amd/display: Delete several unneeded bool conversions
      drm/amdgpu: Delete two unneeded bool conversions

Zhigang Luo (3):
      drm/amdgpu: Add a new device ID for Aldebaran
      drm/amdkfd: Add Aldebaran virtualization support
      drm/amdgpu: Add Aldebaran virtualization support

 MAINTAINERS                                        |    4 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   30 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  159 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   64 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   28 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  197 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  169 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   69 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |   86 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h             |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   97 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  281 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   99 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  130 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  265 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    6 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   12 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |   17 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |  672 ++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   32 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   22 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   31 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h              |    1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |   49 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |  128 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  125 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   55 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   35 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |   35 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   40 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   36 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |   18 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   20 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    7 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    4 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  193 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   13 +
 drivers/gpu/drm/amd/amdkfd/Makefile                |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   80 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  881 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   19 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    6 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  128 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  937 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |   65 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   58 +-
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |   93 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   39 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  147 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 3085 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  206 ++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   82 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  365 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   25 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  143 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   44 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   27 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |    1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   12 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    2 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   86 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   27 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  189 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  288 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   22 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |    7 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   40 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    1 -
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   19 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |    3 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   30 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    9 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  155 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |    5 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |    4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    6 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    2 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   33 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |    4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |    2 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   11 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |   26 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   26 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   58 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   48 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   14 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  128 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |   43 -
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |    2 -
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   20 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    7 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   18 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |    2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   37 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  224 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |    2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    4 +
 .../drm/amd/display/include/link_service_types.h   |    8 +
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |    1 -
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |    7 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    7 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |    2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    6 +
 .../drm/amd/include/asic_reg/df/df_3_6_sh_mask.h   |    1 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h |   16 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |   41 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   63 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   80 +-
 .../gpu/drm/amd/pm/inc/smu11_driver_if_vangogh.h   |   40 +-
 .../gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h |    7 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |    2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v12_0.h             |    2 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   21 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          |  174 +-
 drivers/gpu/drm/amd/pm/powerplay/sislands_smc.h    |   34 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   22 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  378 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |  123 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   72 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    2 -
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    7 +-
 drivers/gpu/drm/radeon/cik.c                       |    4 -
 drivers/gpu/drm/radeon/ni_dpm.c                    |  144 +-
 drivers/gpu/drm/radeon/nislands_smc.h              |   34 +-
 drivers/gpu/drm/radeon/radeon.h                    |    1 +
 drivers/gpu/drm/radeon/radeon_atombios.c           |   26 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    3 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |    8 +
 drivers/gpu/drm/radeon/si.c                        |    2 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |  177 +-
 drivers/gpu/drm/radeon/sislands_smc.h              |   34 +-
 include/uapi/drm/amdgpu_drm.h                      |    2 -
 include/uapi/linux/kfd_ioctl.h                     |  171 +-
 211 files changed, 11394 insertions(+), 2274 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
