Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CF399585
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B484D6E56A;
	Wed,  2 Jun 2021 21:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BE66E532;
 Wed,  2 Jun 2021 21:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9xanNhD4U2ZLyFX6812wENzMvQ3UFmaLgIWfx+cknfNjuhWZLeMTGusSfMbeBYKu1ZHYRY9gKZWtz+S6+oEY3jJLUIxPUvqWMWR4kTndoOmZysKpp9fQ4ZA/ODhqR3XEKSRnkyr3pDb3CnnmEgf1pamuZwmHH8mwLY2OVNHwxkCIjeYTsbDjpzp46ef4aP8zisEPkigmTXXkvlSTcXqgm6YWDsz9XBYSDv1XHuIyPY740OzEgylyNBJ+7XbQfTxB3qdC/g07cBxS1KQr2mJwzhR6CvUwWvnnnqFKfZDKNmfZoufh81jy9n+OPrPINekEt1nbJ3Jg9jt1uvgOQhbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRD/qz2llFC1tQoBLL0AW15jDN3U3sBaFHplZRg3mec=;
 b=hFhq0yhVfUDfnJkT8gd6bLfl59C8O5tlFr3HT0EUSay1HggKUfiFDsvpi5V/iQ43mVPOvEAwzhY7RajcUORBluXOlvFSQvflCztBpy0k0Bag/wAs55lObknq56ENKSsFxsK4XeqS6yx1yzK0qYyfu50EjmXOby0Vm3rwFY9WeysfnCJfpSKLkHXnYKoBcLHOCNBY5Bf33AEHS/q7WtDDfWs7BuMHuhrM3qHXc7LgjOdsMr4ZILdP9WsUXTFRJKP+8N4zkhPBTSKEpi0D7bZimBQkicbnAmUKOe/WtPEkstX5kE/zDKzZBzDVHUvy2neRLdfQytm7UKQUXFnXXCSrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRD/qz2llFC1tQoBLL0AW15jDN3U3sBaFHplZRg3mec=;
 b=4ubqug1HCPHrBBB8LPNmbcMvRNf92ewMVMzUtww+US/df0ztEuHs6/hSx6PlrzKeT66TlovlKwm6YH0mY4/j5x0pvdd9KCSWYcGsjb/xey4wwg3swDpIOg56QG/lRFmHiy5/m+R4vKYyVfZuhEY3DHKvHkELn4Qsefy7M4Hd3pg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3919.namprd12.prod.outlook.com (2603:10b6:208:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 21:40:38 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 21:40:38 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon, drm drm-next-5.14
Date: Wed,  2 Jun 2021 17:40:09 -0400
Message-Id: <20210602214009.4553-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: BL1PR13CA0332.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::7) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 BL1PR13CA0332.namprd13.prod.outlook.com (2603:10b6:208:2c6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.11 via Frontend Transport; Wed, 2 Jun 2021 21:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dc36ce4-7659-47d4-5082-08d9260f0f75
X-MS-TrafficTypeDiagnostic: MN2PR12MB3919:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB391984C8B16F3C4088E4E7D4F73D9@MN2PR12MB3919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DWDAmsKEKEMwckoIpseQjLpEc5OMkz6Z5ECVWDQAhO4JhqOAepgFUeqmwMWzgb9+RaEvY7rCqOw7KlDeKT6u+QJomi/SYO8cKJdlS0x9keUsTenKN4m7SUbo/zOWy7GokLUfWOlelh5vRcvlvOvQgKzpR2/STUOniEyeNb9kv4AdKFuYdfrdF03sg+MpVbW/kb4dQRl9vCqgU0VqmQgKL5PJZNdTlDYezT7paDfnUFrsNV0Ms2rZe5MpJc4r3TW6QZRatlfx+iNDM/Im0SQjF7PPo3fs1kkiJqUQ58toybmVMwa878SQ6Hk1JG50l/o6I+joGAHLFFYLO4Yq90ScMssxXpPj0kqKM8loOfOeKQ0bHHdFLtfA57DaFvD8ANJn/KB7Axx5TjR06gyF4EVk3OrXtuWwet2WxABOi3Q8BHBZrOUv75TMZCEQBvQYbJ9WI2+n4FXh9wBjrYbhv/g2S1DL1dkHQ87BThKe/fa2pB+P+MgWuQ4wvOMTflakEV4pt2UL4r4RrNM7e/0N261EW8KQcz/ahdnj6DT1uo8gYg3cKr1/d11YgoVKD/Qp91DaD1hGCB7WI6OV/8ijbEXocpfRDsbxgQoK+tU2MgPgeiGQUW1HDsJc6twgs+qSrmi2AH4jDz0bwpwEvqD04/qhJyr0mEVKQjxJiA10jSahA6282G+rNp/rmemqaHGQDhbsakU09y+3W1fvF8iU4KTQd2jp6R7M98xKWfhmZ35+IhMOCPFOjt+1cMeTTjXhof4bqhHMkCpYoKvRUWCScdkKvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(30864003)(5660300002)(66556008)(38350700002)(38100700002)(52116002)(16526019)(966005)(86362001)(186003)(66476007)(316002)(83380400001)(6506007)(6512007)(36756003)(8936002)(6486002)(478600001)(6666004)(4326008)(8676002)(2906002)(2616005)(956004)(1076003)(66946007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGtPWkJKTVk2TjNRSlYwNURKTUJqNjN6NmpERzFxR2VrZlhUczZkbitaRmZo?=
 =?utf-8?B?NSt6eURRU2lRTDdvQWVXZXhoa256cU5NRTZsRXltS0pTYjZlUitBZHVoZnhr?=
 =?utf-8?B?OVVTOStwVlcxbDRVc21pQ2g1eWdUN0oyd2d4bFFqZitKUGcwWWRpQjVuZFpa?=
 =?utf-8?B?MkxEaVU1NlJmUEwrL0dWMGJvcDdzd05URGRjd0VUbEtqNFdGUTZjcURBQ3BM?=
 =?utf-8?B?bEh0SzNzWU5IT1NNVVg5SmJ5MUtFaEp1aVFvZXYrL1FvcXRWM3J6RnlNU3pt?=
 =?utf-8?B?SXkxWFdWME1aQjUxbDdINnhpU0xMb3NqaTQrRENqNzFiRGZGckJHb0NRM2pz?=
 =?utf-8?B?MUhEbVFGTzNMZGxhQWlSYjZTeGVRSWEyUFloWk80NE9UZ3dHdGEvTXVZKy9x?=
 =?utf-8?B?cDRUMTVHN2VxT1g1U0MybVc0T3dOc1ROcktlVkpuN0JxNXFlTTBFUmN6Q2VZ?=
 =?utf-8?B?WElqYTVmQktlL1BIVHdDY0NSOWw5enRIMFppMWNGZi85WlFOZWFsajJDYVhk?=
 =?utf-8?B?V3NEbmtGK3ZsYi93SXR5NXpRYkUvc0R2ZEVlNEc4d2YxM0l2dUUzWFZyOHZt?=
 =?utf-8?B?bmZNZ3BBNThMc1lsaHdTY0tlTGNiYXNoakJxSkhtV0J4WDFzMkZ3MUJrejFl?=
 =?utf-8?B?aWZMQWh0Q3lkOXZsanp0SE1YYndDU1dGUkd6NS94aWx0dkl4RW5TTmdJNW1R?=
 =?utf-8?B?UGFwMVc4ZmhITEdFVjVsRnJUYllEdHhtRXRWclVWV1F6UXNmajQ0YVd3d0s4?=
 =?utf-8?B?WVBpYlltTk92N0daY3BiWE1XVDF1b3drYnB5ZW1QR2txMFFwUURoSUJUVmx4?=
 =?utf-8?B?YTZKazRUNjNBb2RQeU05amx1ODRycDBaWUJtS0tHZ1haT2JDeGcrZkc2WWl4?=
 =?utf-8?B?cFNwQjZZeEdnMU9GOXdRZVRqdk9RMENBMWpSTHJOWnZ5dnd6RmdMeDZhd1BR?=
 =?utf-8?B?b1VYZnQyRW5BT255NE50T3ZQNjhDL1hUZGVIa3lzWkFXa3lwZzN2SlVOenAz?=
 =?utf-8?B?eVBrbWNkOXRWek1FYm9IQzZ5MlQ2SGNBdFNORCswNFJaUnZ0bk5OUytGUEoy?=
 =?utf-8?B?SDRWaEh5ZE9laGJ3ZzRBN1pscTJaYkpvYUd0U3ZLOE83V0k0Q3VDUHNuQ1Nm?=
 =?utf-8?B?aW1NTFlEQTM3TGI3bk5iY1RTVFNFWGZFRDRUa3hHTjdndEY2eGJBM3B6YlpJ?=
 =?utf-8?B?cmVDYVZzWXhDcHpOdEVwVHhTRFhPUXlGcWp0MlNBVkVjRlVoY1lQNFZYYWNm?=
 =?utf-8?B?TWpVSTZrbmo2amtIbnlUUXJGdTFWaCtmYXhPemgwWVd0cTBFMnpjU1RGVzFh?=
 =?utf-8?B?UklNdGhmYTZVSHliSGMvOVVWbW5MWmQzNlArMHJnTnMzTXZxbHJ1b016VW5j?=
 =?utf-8?B?ekw5ZHFxL01seHgrZWMwbU1wNjB2eDJQY0tsamJEdVcvTklmR0src1dvYmFS?=
 =?utf-8?B?bGRhNjZUMHdtTUFlZGxqWWJyTXFaaHBITDlwNGdiN0wySDFwS0hiQmFERU1S?=
 =?utf-8?B?STJlbDd4WlpNempLODAzUXk2azlNQjlWQWpncFdnekhFa1Rxbjhmc3JPV1ZI?=
 =?utf-8?B?THprVVFVTkphWHBFNjYrTjh4ZkkrNUN0d3Vjby9ZcU5RYkZndmY5S3lnOGZX?=
 =?utf-8?B?VWVvc2FGbWYxY3lUTElsbTNCUTdDMXVLR1A1MzZjbnpBMnlwNmo0NW1POEJy?=
 =?utf-8?B?MXIzWHF5YWp2WWRCNTdXeHVTRndjcTFiVUJVS1pJeW9Dc1A0aE9SMWhuMHBr?=
 =?utf-8?B?Yk5nRnN0WHlaL3Npd0VBK1lwdmsrS1J1ZDliR210dWpWN3MxZ2VUNkg5cjZy?=
 =?utf-8?B?bkFRdzVEWHJ2UDlPcjBsQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc36ce4-7659-47d4-5082-08d9260f0f75
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 21:40:37.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0QfSy0uBfs3ujKTByWmeUyf4Q5ZwE6sjcjgdyXxB2yOeI4+QfeffUV68kNiOud/F2omorFppI93mjLMIYdNxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
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

More new stuff for 5.14.

The following changes since commit 9a91e5e0af5e03940d0eec72c36364a1701de240:

  Merge tag 'amd-drm-next-5.14-2021-05-21' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-05-21 15:59:05 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-06-02

for you to fetch changes up to 7d9c70d23550eb86a1bec1954ccaa8d6ec3a3328:

  drm/amdgpu: remove unsafe optimization to drop preamble ib (2021-06-01 22:55:39 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-06-02:

amdgpu:
- GC/MM register access macro clean up for SR-IOV
- Beige Goby updates
- W=1 Fixes
- Aldebaran fixes
- Misc display fixes
- ACPI ATCS/ATIF handling rework
- SR-IOV fixes
- RAS fixes
- 16bpc fixed point format support
- Initial smartshift support
- RV/PCO power tuning fixes for suspend/resume
- More buffer object subclassing work
- Add new INFO query for additional vbios information
- Add new placement for preemptable SG buffers

amdkfd:
- Misc fixes

radeon:
- W=1 Fixes
- Misc cleanups

UAPI:
- Add new INFO query for additional vbios information
  Useful for debugging vbios related issues.  Proposed umr patch:
  https://patchwork.freedesktop.org/patch/433297/
- 16bpc fixed point format support
  IGT test:
  https://lists.freedesktop.org/archives/igt-dev/2021-May/031507.html
  Proposed Vulkan patch:
  https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4
- Add a new GEM flag which is only used internally in the kernel driver.  Userspace
  is not allowed to set it.

drm:
- 16bpc fixed point format fourcc

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/display: make backlight setting failure messages debug
      drm/amdgpu/acpi: unify ATCS handling (v3)
      drm/amdgpu/apci: switch ATIF/ATCS probe order
      drm/amdgpu/acpi: fix typo in ATCS handling
      drm/amdgpu/swsmu/aldebaran: fix check in is_dpm_running
      drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)
      drm/amdgpu: bump driver version

Alvin Lee (1):
      drm/amd/display: Implement INBOX0 usage in driver

Aric Cyr (1):
      drm/amd/display: 3.2.137

Asher Song (1):
      drm/amdgpu: add judgement for dc support

Aurabindo Pillai (1):
      drm/amd/display: take dc_lock in short pulse handler only

Baokun Li (1):
      drm/amd/display: fix warning: ‘update_dsc_caps’ and ‘apply_dsc_policy_for_stream’ defined but not used

Bindu Ramamurthy (1):
      drm/amd/display: Allow bandwidth validation for 0 streams.

Chengming Gui (2):
      drm/amd/pm: Update PPTable struct for beige_goby
      drm/amd/pm: Correct reserved uint32_t number in beige_goby_PPTable

Dan Carpenter (2):
      drm/amdgpu: add missing unreserve on error
      drm/amdgpu: Fix an error code in kfd_mem_attach_dmabuf()

David M Nieto (3):
      drm/amdgpu/pm: Update metrics table (v2)
      drm/amdgpu/pm: add new fields for Navi1x (v3)
      drm/amdgpu/pm: display vcn pp dpm (v4)

Dmytro Laktyushkin (1):
      drm/amd/display: fix odm scaling

Eric Huang (1):
      drm/amdgpu: Fix a bug on flag table_freed

Evan Quan (1):
      drm/amd/pm: correct MGpuFanBoost setting

Fangzhi Zuo (3):
      drm/amd/display: Retrieve DSC Branch Decoder Caps
      drm/amd/display: Add Log for SST DSC Determination Policy
      drm/amd/display: Refactor SST DSC Determination Policy

Feifei Xu (1):
      drm/amd/pm: fix return value in aldebaran_set_mp1_state()

Felix Kuehling (2):
      drm/amdgpu: Add new placement for preemptible SG BOs
      drm/amdgpu: Use preemptible placement for KFD

Guenter Roeck (1):
      drm/amd/amdkfd: Drop unnecessary NULL check after container_of

Jake Wang (1):
      drm/amd/display: Added support for individual control for multiple back-light instances.

James Zhu (7):
      drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn3: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate

Jiansong Chen (2):
      drm/amdgpu: refine amdgpu_fru_get_product_info
      drm/amdgpu: remove unsafe optimization to drop preamble ib

Jiapeng Chong (2):
      drm/amdgpu: Fix inconsistent indenting
      amdgpu: remove unreachable code

Jiawei Gu (1):
      drm/amdgpu: Add vbios info ioctl interface

Jimmy Kizito (2):
      drm/amd/display: Update DP link configuration.
      drm/amd/display: Expand DP module clock recovery API.

Kees Cook (1):
      drm/amd/display: Avoid HDCP over-read and corruption

Kevin Wang (3):
      drm/amdkfd: correct sienna_cichlid SDMA RLC register offset error
      drm/amdgpu: fix sdma firmware version error in sriov
      drm/amdgpu: optimize code about format string in gfx_v10_0_init_microcode()

Lee Jones (45):
      drm/radeon/radeon_cs: Fix incorrectly documented function 'radeon_cs_parser_fini'
      drm/amd/amdgpu/amdgpu_ids: Correct some function name disparity
      drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of misnamed functions
      drm/amd/amdgpu/amdgpu_gmc: Fix a little naming related doc-rot
      drm/amd/amdgpu/cik_sdma: Fix a few incorrectly named functions
      drm/amd/amdgpu/gfx_v7_0: Repair function names in the documentation
      drm/amd/amdgpu/si_dma: Fix some function name disparity
      drm/amd/amdgpu/dce_v6_0: Repair function name of 'si_get_number_of_dram_channels()'
      drm/radeon/cik: Fix incorrectly named function 'cik_irq_suspend()'
      drm/radeon/radeon_vm: Fix function naming disparities
      drm/amd/include/aldebaran_ip_offset: Mark top-level IP_BASE as __maybe_unused
      drm/amd/amdgpu/gmc_v7_0: Fix potential copy/paste issue
      drm/amd/amdgpu/mmhub_v9_4: Fix naming disparity with 'mmhub_v9_4_set_fault_enable_default()'
      drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
      drm/radeon/r100: Realign doc header with function 'r100_cs_packet_parse_vline()'
      drm/amd/amdgpu/gfx_v9_4_2: Mark functions called by reference as static
      drm/amd/amdgpu/sdma_v2_4: Correct misnamed function 'sdma_v2_4_ring_emit_hdp_flush()'
      drm/amd/amdgpu/sdma_v4_0: Realign functions with their headers
      drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
      drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly named functions
      drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
      drm/amd/amdgpu/vcn_v1_0: Fix some function naming disparity
      drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
      drm/amd/amdgpu/smuio_v13_0: Realign 'smuio_v13_0_is_host_gpu_xgmi_supported()' header
      drm/amd/pm/inc/smu_v13_0: Move table into the only source file that uses it
      drm/amd/pm/powerplay/hwmgr/smu7_thermal: Provide function name for 'smu7_fan_ctrl_set_default_mode()'
      drm/amd/pm/powerplay/hwmgr/vega12_thermal: Provide function name
      drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Provide 'vega12_init_smc_table()' function name
      drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc headers must contain function names
      drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Provide function name 'vega20_init_smc_table()'
      drm/amd/display/dc/bios/command_table_helper: Fix function name for 'dal_cmd_table_helper_transmitter_bp_to_atom()'
      drm/amd/display/dc/bios/command_table_helper2: Fix function name 'dal_cmd_table_helper_transmitter_bp_to_atom2()'
      drm/amd/display/dc/bios/bios_parser: Fix formatting and misnaming issues
      drm/amd/display/amdgpu_dm/amdgpu_dm: Functions must directly follow their headers
      drm/amd/display/dc/dce/dmub_outbox: Convert over to kernel-doc
      drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types
      drm/amd/display/dc/dce110/dce110_hw_sequencer: Include our own header
      drm/amd/display/dc/dce/dce_mem_input: Remove duplicate initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK}
      drm/amd/display/dc/dce/dce_mem_input: Remove duplicate initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK
      drm/amd/amdgpu/amdgpu_device: Make local function static
      drm/amd/display/amdgpu_dm/amdgpu_dm: Fix kernel-doc formatting issue
      drm/amd/display/dc/dce110/dce110_hw_sequencer: Include header containing our prototypes
      drm/amd/display/dc/core/dc: Convert function headers to kernel-doc
      drm/amd/display/dmub/src/dmub_srv_stat: Convert function header to kernel-doc
      drm/amd/display/modules/hdcp/hdcp_psp: Remove unused function 'mod_hdcp_hdcp1_get_link_encryption_status()'

Luben Tuikov (3):
      drm/amdgpu: Don't query CE and UE errors
      drm/amdgpu: Fix RAS function interface
      drm/amdgpu: Use delayed work to collect RAS error counters

Mario Kleiner (5):
      drm/fourcc: Add 16 bpc fixed point framebuffer formats.
      drm/amd/display: Add support for SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616.
      drm/amd/display: Increase linebuffer pixel depth to 36bpp.
      drm/amd/display: Make assert in DCE's program_bit_depth_reduction more lenient.
      drm/amd/display: Enable support for 16 bpc fixed-point framebuffers.

Mukul Joshi (1):
      drm/amdgpu: Correctly clear GCEA error status

Nicholas Kazlauskas (1):
      drm/amd/display: Fix GPU scaling regression by FS video support

Nirmoy Das (10):
      drm/amd/display: do not dereference on NULL
      drm/amd/display: WARN_ON cleanups
      drm/amdgpu: make sure we unpin the UVD BO
      drm/amdgpu: add amdgpu_bo_vm bo type
      drm/amdgpu: move shadow bo validation to VM code
      drm/admgpu: add two shadow BO helper functions
      drm/amdgpu: switch to amdgpu_bo_vm for vm code
      drm/amdgpu: remove unused code
      drm/amdgpu: do not allocate entries separately
      drm/amdgpu: flush gart changes after all BO recovery

Peng Ju Zhou (9):
      drm/amdgpu: Indirect register access for Navi12 sriov
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file gfx_v10*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file kfd_v10*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file soc15.c
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file sdma_v5*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file nv.c
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file amdgpu_gmc.c
      drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV
      drm/amdgpu: Change IP init sequence to support PSP program IH_RB_CNTL on NV12 SRIOV

Qingqing Zhuo (1):
      Revert "drm/amd/display: Refactor and add visual confirm for HW Flip Queue"

Rodrigo Siqueira (1):
      drm/amd/display: Fix overlay validation by considering cursors

Roman Li (2):
      drm/amd/display: Remove redundant safeguards for dmub-srv destroy()
      drm/amd/display: Fix potential memory leak in DMUB hw_init

Sathishkumar S (3):
      drm/amd/pm: use attr_update if the attr has it
      drm/amdgpu: support atcs method powershift (v4)
      drm/amdgpu: enable smart shift on dGPU (v5)

Shaokun Zhang (4):
      drm/amd/display: Remove the repeated declaration
      drm/radeon/evergreen: Remove the repeated declaration
      drm/radeon: remove the repeated declaration
      drm/amd/display: Remove the redundant initialization of local variable

Shiwu Zhang (2):
      drm/amdgpu: fix metadata_size for ubo ioctl queries
      drm/amdgpu: free the metadata buffer for sg type BOs as well

Simon Ser (1):
      amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic

Victor Zhao (1):
      drm/amd/amdgpu:save psp ring wptr to avoid attack

Wenjing Liu (2):
      drm/amd/display: add exit training mode and update channel coding in LT
      drm/amd/display: isolate 8b 10b link training sequence into its own function

Xiaojian Du (1):
      drm/amd/pm: retain the fine grain tuning parameters after resume

Yu Kuai (1):
      drm/amd/display: fix gcc set but not used warning of variable 'old_plane_state'

Zheng Yongjun (1):
      drm/amdgpu: Remove unneeded semicolon

hvanzyll (1):
      drm/amd/display: disable desktop VRR when using older flip model

pengzhou (1):
      drm/amdgpu: Modify MMHUB register access from MMIO to RLCG in file mmhub_v2*

tony.huang_cp (1):
      drm/amdgpu: fix typo

 drivers/gpu/drm/amd/amdgpu/Makefile                |   7 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 388 +++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  42 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  88 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    | 190 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  63 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 166 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  19 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  | 172 ++++++
 drivers/gpu/drm/amd/amdgpu/atom.h                  |  10 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 117 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  41 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  11 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  93 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   6 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   7 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |  87 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   2 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 222 +++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  10 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   6 +-
 .../drm/amd/display/dc/bios/command_table_helper.c |   2 +-
 .../amd/display/dc/bios/command_table_helper2.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |   2 +
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  63 +--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 309 +++++++----
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 577 ++++++++-------------
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   9 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   2 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  19 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   5 -
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   2 +
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h |   2 -
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |  10 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |  10 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   8 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |   3 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |  17 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   4 +
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |   1 +
 .../drm/amd/display/dc/dce110/dce110_transform_v.c |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   9 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |  12 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  34 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |   6 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |   5 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |   6 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  31 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |   5 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  17 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   1 -
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |   4 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   2 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |  13 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |  12 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  70 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   3 -
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |   4 -
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   4 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |  19 +-
 .../amd/display/include/gpio_service_interface.h   |   4 +-
 .../drm/amd/display/include/link_service_types.h   |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |  29 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  13 -
 .../drm/amd/display/modules/power/power_helpers.c  |  15 +-
 .../drm/amd/display/modules/power/power_helpers.h  |   3 +-
 drivers/gpu/drm/amd/include/aldebaran_ip_offset.h  |   2 +-
 drivers/gpu/drm/amd/include/amd_acpi.h             |  18 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |  17 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  69 +++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   2 +-
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |   2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |   6 -
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |   3 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  21 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |   8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   2 +-
 .../drm/amd/pm/powerplay/hwmgr/vega12_thermal.c    |   3 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  46 ++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  85 ++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  14 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  33 ++
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  61 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/drm_fourcc.c                       |   4 +
 drivers/gpu/drm/radeon/cik.c                       |   2 +-
 drivers/gpu/drm/radeon/evergreen.h                 |   1 -
 drivers/gpu/drm/radeon/r100.c                      |   2 +-
 drivers/gpu/drm/radeon/radeon_asic.h               |   2 -
 drivers/gpu/drm/radeon/radeon_cs.c                 |   2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |   4 +-
 include/drm/drm_atomic.h                           |  12 +
 include/uapi/drm/amdgpu_drm.h                      |  15 +
 include/uapi/drm/drm_fourcc.h                      |   7 +
 164 files changed, 2705 insertions(+), 1498 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
