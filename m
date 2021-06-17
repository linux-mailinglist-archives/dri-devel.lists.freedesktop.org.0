Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DA3AA975
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 05:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1486E866;
	Thu, 17 Jun 2021 03:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7BA6E865;
 Thu, 17 Jun 2021 03:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE10nirfmQPAoxo8vBpyVcpoD42YhZScXnTuHc2H4W5Zl4nM/g2M8dEsKNSmrcAUe/6Bgu6hN1PlD33ULO1xVL7jZ2CLxTEpzkE+Brle4CljVDSbRfXGOwyI0FmUZ32C5zyJ63AmUASAX4lbKrmYFiHJMk333f8mx7c0BpmSfr7AlOVkGT1xYWivmpKPx/W1UGwGLk2rZvMfvGMvLDKBT5GAPjuqkwO9NJhKSVkE7l17200Bts94cullA/1akYpB2rWkKugR4NteasuHkcbAAavXMoZc6DapKVoTOIgkkACCyvOvnDMl0oT/rcC1Azr8wvkaIU74e+cZeZdaaWHdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p63eKrfJqQeQv0Ziob+0KocC5pRKiHTR/2sOvTErKk=;
 b=IQJgZaV18Uwl002XmeHnLfji1IJtYtJcyCW3bOXuK0bTMYx34u5XyW3uu/OgfK17+gsYp3Z5TZt0zrds0IR7WxvXRtpR3b01XQU7LKalJh/+IBHZ2XEW1Ljjy5F3eSoA1t+jwWdPbuC9DmQ3eVJhTJH7vyvYjZbTF0RSjqf3S2fISJ7iE1y6q+/UtBny4SXub05QUZ4nP4LOnhiG9BP+mH9eth75yWN2Dl9q5MIuSSg4TsTFoGTTmjsqWS7ByRKQ3+zJbav10ct71VMJmHEQxTaz9zUOFvfhMLo3FUqlyFwy5ZCYSGtfAHWetyQvwLSI2PlZq7BWZS/2PYgH9Ear7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p63eKrfJqQeQv0Ziob+0KocC5pRKiHTR/2sOvTErKk=;
 b=nQM4+26u9KGe/gFoRYCEnTkOq0pH3uPD9puEFYdYibhYKUWtPdulFFoZqoKhKv6B/J31jP6+I33pGkSqw+xp4nxjNJGfDUxMC3eKRkMbbGSTI6IWnPeG6hN6MscB9dkQUisHl2g741CEH0sO27bLJHCrVAYhWQ9GuUTofEIxibs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 03:17:37 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 03:17:37 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-next-5.14
Date: Wed, 16 Jun 2021 23:17:19 -0400
Message-Id: <20210617031719.4013-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR12CA0016.namprd12.prod.outlook.com
 (2603:10b6:208:a8::29) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR12CA0016.namprd12.prod.outlook.com (2603:10b6:208:a8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Thu, 17 Jun 2021 03:17:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e03d9e-ecc1-4670-e730-08d9313e74d0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51744845F4AC8EEFE09C66A9F70E9@BL1PR12MB5174.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7crpQ0kbaU4vkXZM7QjLKfUzLExGB6Lt+gHDIj6VQUygiztfAoHDOYtlAkYmS2/fz/axIRT7ygL0ntW0txHGmDmJKRSampPDfEQ/I7piAnsMo8Ah8LUvcR+7lPVqWW9d6rZbNQg9rwUuH7Om1bGDDh4S2dgW9rcKH9FgAXp38T87UkpQXOwy0qb1JWRol/1V2cQ+y5ktuk8FYoO3Z7tACyz+w0u7SgtBOuVBAZ8a5Cyy38KTRip70nAnSVWWkYP4X9zDJOys+XqsZxx6JoocXxZhjtzvMEtoPwRp+GpYRmxeCyibHlvVCbphxQyQoKhuJgZUj5pI1EOUwWDs8CvHNf/6Qd25Uzp1hlRXHLJY6G/9iqTmnW+vnWlNBMnf1j+9aP8sM11ShPeEF5892Wvylm2t6lGV1WeqcOIJPjvDi00eqxqtjwj3BGAuXQyrhk0bYhdMgTncAr5Qj44kFCLiMIjfG6lH6UbeaYeZwYZjnTW5eKC8rTTx2PJDezGF1Ym1JQ3uu63woGVun4U87ShACJj2r7LBe3z6CMSOqAdM23xDLES4oDqdSNhhvTWJNAyf5aQ2PXAV3gZ6HQB47YtIymd3si1bD6Sy10TvOcW8uQHmRnACSVBTA9UyBUK3ER1aZfWdnRNBCoVEYwC7Xat/tcLEluctuoaqPameIQYR9yVBZE8taqRH4oPapc2BR8BzUF3H7LWP+qaHQL8fQfrcLeof7P0pXzKkFTeAX5RbVfNemhm0fvB6AapzbIvKAid
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(316002)(478600001)(8936002)(36756003)(38100700002)(8676002)(38350700002)(966005)(66946007)(66476007)(6512007)(66556008)(186003)(30864003)(6506007)(6666004)(4326008)(16526019)(2906002)(956004)(2616005)(1076003)(86362001)(6486002)(52116002)(83380400001)(5660300002)(26005)(69590400013)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQTWabMzhY5TQ949TQ2PFP8Z+a6vIkdkB97NVFEQIPANeAs+aK6X9B0wiQkj?=
 =?us-ascii?Q?g2uDB8N+9xq3DVRifvqODMeI8cojHw6gAUvyb9OvbqIFog7xZyAgZpizNgWD?=
 =?us-ascii?Q?2stTo4Yy6CiXlKHxlR6LNevWgnSpHPusZKarbrVM+4l3ocPAN1M8F0/Eq6qL?=
 =?us-ascii?Q?O37dPf+UPjGtHHgBeLRX0ysWjkuLVqVVycUVKIm5EIkMPZSRR5E7IjNQsz2l?=
 =?us-ascii?Q?FIBBOHazdbe3v9kh7OI7UPQNGqRwk8VC+p5bJSBOcJIzoiGiqeCAmatKVXbM?=
 =?us-ascii?Q?ziFRiZLrfzDa6578I8kyO45ZZpydP7debCpTqNx2xkUPnUw64OrETD0wBAY8?=
 =?us-ascii?Q?B+iTZACS5a8R0UJtCt1uxxDDbyZhNPTX8C9nE1HerYkBCk4cLR94EPQ9v/jF?=
 =?us-ascii?Q?DzuIYgP+R7/q+1Z9iwyQybb5ujSL+wGdeFgRxogmnX+FXIUNITy3XCV1veht?=
 =?us-ascii?Q?OlZk51wH7b1+/0UQS+0PdQcSjy0RGK4i6rYBj+PaqxIq9HBcrbwZAaO9PZwC?=
 =?us-ascii?Q?yq3n3mfsrJIOmmCO+9It9Dk/yVPFYtoAAPucBuS1bBkAkIGgKjXXziyJy8rd?=
 =?us-ascii?Q?HTkmAg6WSyYbt0yl7/ldIueqGP03kkun77zINknCSR5/sJqRfdAf3DvSnvDV?=
 =?us-ascii?Q?L1bgksqRmj4E/+D2R//joK/RRD2JApw7UfRtDVFgFw2EAiZoR5ZXInqxhQJL?=
 =?us-ascii?Q?9gizWOYcmB3rkYS7kXXHxnQ3wWDm3tQslSG7RjxsB44JrqGog/99qH6mLZk0?=
 =?us-ascii?Q?1MHOyxam9U0goPZBctSg492aVQK1ujFaR4viUqgCbfiatGeF48DA3XpOdVQ+?=
 =?us-ascii?Q?tKRgf8HsQYdX6Mou6+tLZcNWozK7sSyU/jqbYHoASU31gw4jkjkdAUQHjVHo?=
 =?us-ascii?Q?LiSYzHPscFpP9WrWsOe+cdCG6F6YJIYbwlausNTbadAowbgRF5ZNFSZwto6v?=
 =?us-ascii?Q?tlcFt9+UxVnsXamIKX1+dsgkEk4Ni1+jlncunZ2RZP+ILH+3rx/AvB7s4X8u?=
 =?us-ascii?Q?GZ+Etw2RoFaBLCpG5/0+CZX8Q42vSVhoQHNqulRq0wj7puqmD3j2hxbV1LUk?=
 =?us-ascii?Q?MDj3ms7gG2+i1TbPieSExib56vt9aWu5+2HWygpCi3++ztRTPmA/wnVLyjDC?=
 =?us-ascii?Q?lmTay49fVJhF1mnnvr49VqU595MiuHbXpIBLIz8L9ZNDCabtmUG66rw+SqKJ?=
 =?us-ascii?Q?uNBChYu3afCmq4L++sXzL1KyffiDgU0OCLeFw4MF58MW5ZSI5hQfK7rzRbqW?=
 =?us-ascii?Q?9skAOaMP0OwYbxYrwTvE3t3ZsDIZG3PCDBFBNKRqH0h+3gZfBK/gro6UmHJa?=
 =?us-ascii?Q?XAg2WrsB1/cMMnQz0MXBW6Th?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e03d9e-ecc1-4670-e730-08d9313e74d0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 03:17:36.8790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcdgqztcmIS/PGZrD1tqzL45kRrkbBymv9P3UGbDaGaRc3MJ7xEhKk/smjX9eSFz5JDxzvm7vx8oLHmTeOR3hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
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

Fixes for 5.14.

The following changes since commit c707b73f0cfb1acc94a20389aecde65e6385349b:

  Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-10 13:47:13 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-06-16

for you to fetch changes up to a4b0b97aace09716a635e1a64c7e54e51f4a0f51:

  drm: display: Fix duplicate field initialization in dcn31 (2021-06-15 17:25:42 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-06-16:

amdgpu:
- Aldebaran fixes
- Expose asic independent throttler status
- BACO fixes for navi1x
- Smartshift fixes
- Misc code cleanups
- RAS fixes for Sienna Cichlid
- Gamma verificaton fixes
- DC LTTPR fixes
- DP AUX timeout handling fixes
- GFX9, 10 powergating fixes

amdkfd:
- TLB flush fixes when using SDMA
- Locking fixes
- SVM fixes

----------------------------------------------------------------
Alex Sierra (1):
      drm/amdkfd: move CoherentHostAccess prop to HSA_CAPABILITY

Amber Lin (1):
      drm/amdkfd: Fix circular lock in nocpsch path

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.70

Aric Cyr (1):
      drm/amd/display: 3.2.140

Ashley Thomas (1):
      drm/amd/display: add DMUB registers to crash dump diagnostic data.

Aurabindo Pillai (1):
      drm/amd/display: add dummy PG callback for beige goby

David Galiffi (1):
      drm/amd/display: Updated variable name.

Dmytro Laktyushkin (1):
      drm/amd/display: Remove unnecessary blank lines

Eric Huang (1):
      drm/amdkfd: Add memory sync before TLB flush on unmap

Evan Quan (6):
      drm/amd/pm: drop the incomplete fix for Navi14 runpm issue
      drm/amd/pm: correct the runpm handling for BACO supported ASIC
      drm/amdgpu: make audio dev's D-state transition PMFW-aware
      drm/amd/pm: update the cached dpm feature status
      drm/amd/pm: correct the dpm features disablement for Navi1x
      drm/amd/pm: correct the power limits reporting on OOB supported

Felix Kuehling (2):
      drm/amdkfd: Disable SVM per GPU, not per process
      drm/amdgpu: Use spinlock_irqsave for pasid_lock

Graham Sider (9):
      drm/amd/pm: Add u64 throttler status field to gpu_metrics
      drm/amd/pm: Add ASIC independent throttle bits
      drm/amd/pm: Add common throttler translation func
      drm/amd/pm: Add arcturus throttler translation
      drm/amd/pm: Add navi1x throttler translation
      drm/amd/pm: Add sienna cichlid throttler translation
      drm/amd/pm: Add vangogh throttler translation
      drm/amd/pm: Add renoir throttler translation
      drm/amd/pm: Add aldebaran throttler translation

Guchun Chen (1):
      drm/amdgpu: use adev_to_drm macro for consistency (v2)

Hawking Zhang (9):
      drm/amdgpu: update psp gfx i/f to support dynamic GECC
      drm/amdgpu: allow different boot configs
      drm/amdgpu: add helper function to query gecc status in boot config
      drm/amdgpu: enable dynamic GECC support (v2)
      drm/amdgpu: add psp runtime db structures
      drm/amdgpu: add helper function to query psp runtime db entry (v2)
      drm/amdgpu: cache psp runtime boot_cfg_bitmask in sw_int
      drm/amdgpu: disable DRAM memory training when GECC is enabled
      drm/amdgpu: correct psp ucode arrary start address

Jiapeng Chong (2):
      drm/amd/display: Fix duplicate included clk_mgr.h
      drm/amd/display: use ARRAY_SIZE for base60_refresh_rates

John Clements (2):
      drm/amdgpu: Updated fw header structure source
      drm/amdgpu: Added support for loading auxiliary PSP FW

Jonathan Kim (1):
      drm/amdkfd: fix circular locking on get_wave_state

Josip Pavic (1):
      drm/amd/display: tune backlight ramping profiles

Lijo Lazar (1):
      drm/amd/pm: Only primary die supports power data

Mark Yacoub (1):
      drm/amd/display: Verify Gamma & Degamma LUT sizes in amdgpu_dm_atomic_check

Nirmoy Das (4):
      drm/amdkfd: use allowed domain for vmbo validation
      drm/amdgpu: remove amdgpu_vm_pt
      drm/amdgpu: parameterize ttm BO destroy callback
      drm/amdgpu: move shadow_list to amdgpu_bo_vm

Peng Ju Zhou (1):
      drm/amd/amdgpu: add instance_number check in amdgpu_discovery_get_ip_version

Po-Ting Chen (1):
      drm/amd/display: Change swizzle visual confirm reference pipe

Roman Li (1):
      drm/amd/display: move psr dm interface to separate files

Sathishkumar S (2):
      drm/amd/pm: support ss metrics read on renoir
      drm/amd/pm: support ss metrics read on yellow_carp

Wan Jiabing (3):
      drm: display: Remove duplicate include in dce110
      drm: display: Remove duplicated argument in dcn31
      drm: display: Fix duplicate field initialization in dcn31

Wenjing Liu (1):
      drm/amd/display: dp mst detection code refactor

Wesley Chalmers (14):
      drm/amd/display: Read LTTPR caps first on hotplug
      drm/amd/display: Move LTTPR cap read into its own function
      drm/amd/display: Read LTTPR caps first on bootup
      drm/amd/display: Set LTTPR Transparent Mode after read link cap
      drm/amd/display: Always write repeater mode regardless of LTTPR
      drm/amd/display: Improve logic for is_lttpr_present
      drm/amd/display: Enforce DPCD Address ranges
      drm/amd/display: Rename constant
      drm/amd/display: 7 retries + 50 ms timeout on AUX DEFER
      drm/amd/display: Do not count I2C DEFERs with AUX DEFERs
      drm/amd/display: Partition DPCD address space and break up transactions
      drm/amd/display: Add interface to get Calibrated Avg Level from FIFO
      drm/amd/display: Cover edge-case when changing DISPCLK WDIVIDER
      drm/amd/display: Extend AUX timeout for DP initial reads

Yi-Ling Chen (1):
      drm/amd/display: add config option for eDP hotplug detection

Yifan Zhang (2):
      drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
      drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell.

YuBiao Wang (1):
      drm/amdgpu: reset psp ring wptr during ring_create

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  49 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  44 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  55 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 310 +++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  57 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  42 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  34 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 175 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  13 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  26 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  46 +--
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   4 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  62 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   7 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 141 +---------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  41 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  | 166 +++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |  37 +++
 drivers/gpu/drm/amd/display/dc/Makefile            |   2 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |  68 ++++-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.h   |   3 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   4 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 167 +++++------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 170 +++++------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c | 218 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  31 +--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 100 ++++++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  23 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   1 -
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   5 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |  24 ++
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |  12 +
 .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |   3 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   2 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |  12 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   4 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c   |   5 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h   |   1 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   1 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   4 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   2 -
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |   1 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  11 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   3 +
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |  18 ++
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |  14 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  29 ++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |  65 ++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |  14 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c |   5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  10 +
 .../drm/amd/display/modules/power/power_helpers.c  |  20 +-
 .../amd/include/asic_reg/dcn/dcn_3_0_1_sh_mask.h   |   2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |   2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  58 +++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  51 +++-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  26 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  59 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 115 +++++---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  86 +++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  51 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  63 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 101 +++++--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  34 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  63 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   5 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   4 +-
 include/drm/drm_dp_helper.h                        |  17 ++
 103 files changed, 2362 insertions(+), 888 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h
