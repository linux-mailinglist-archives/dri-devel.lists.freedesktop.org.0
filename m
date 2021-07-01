Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280893B8CE8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 06:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E17E6E9BD;
	Thu,  1 Jul 2021 04:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2A96E9AB;
 Thu,  1 Jul 2021 04:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1pdQ9DgHIgHAMJ1PFBNycWHei8Ia0ZW2MNzhHWeTNSlSwZGy2YmpaRRi76eWSmxY/n5TRm60lvUMyOod6P5V9tu0htve4W+E5AqKy3U3kYmRCFMtXeDkJNtj6vSoxTLGKzaFqFFNT+E/ggc4cSkriv4Ewxc8UgxemHzviG/CBW8grBsu/+oX8fSXDlKQZjqKLl/OcHSQsd9X4rC8AUmACJnnmBlOByggnPE1ewMOnmc6yGTAzWbvTsnLCRaKVEMO8fELpCGw8XySyFKmr1MrUPEOJ4ct6k9HX3S5qUjlJ3Mvyo9yiDsg2/WH8NOtYzvAsS6uNiDK4FvbVYS7Ot1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoZ2eKTGL8vV0XY7abRTYHcBznRMFA4SaQfoMX9/UFA=;
 b=FeUt7e3XBeXv6mv25csxy/R2+Y6+cXjAtPzEUNfcDmXs0gP+JtcBVqWeb7SUO2vsIR0p6I9iZISDPJwOGvKnZayriPwe9ZREEb3VUjWZigT0RGtbusDPPBYeaoyDV+6ORURk/ZCe6cRESRkDNcVVwV49bp5pQbeAT193Cq2mU/F0o9sW6wfMWrpTSGUjhPy42XnowcNZQr3Mh6+yB0RnHdI0zeQ5Zzo7lNYD6zsoEW06jM9mn3KpGm0UX6Cr2g5BG4pccRvymmbG81fo5s3jaM3/qKiNVm/KA9kdyb55IvST/bCwctpt3z/XuJQ0lQfWqI1w+61AD6flbbvC3BCG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoZ2eKTGL8vV0XY7abRTYHcBznRMFA4SaQfoMX9/UFA=;
 b=xlMk+6+ZutHHujOPrhjdcK2jXX+7V8Ba19B2xtVIX0mkWoqS6iLh7Q7y32mvHnGcLTpgnGUvifBYVKZiWgxLYSaK0w2W+qkL8StX6SWZ8XzEjHktFldxn1xmXqcA6b7vsxAst0AhWJ8fSXYyc3Oq0N7uE23GN4sB6JQNxKDHBRg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL0PR12MB5522.namprd12.prod.outlook.com (2603:10b6:208:17d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 04:22:56 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%7]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 04:22:56 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.14
Date: Thu,  1 Jul 2021 00:22:41 -0400
Message-Id: <20210701042241.25449-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.161.79.198]
X-ClientProxiedBy: BL1PR13CA0281.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::16) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.198) by
 BL1PR13CA0281.namprd13.prod.outlook.com (2603:10b6:208:2bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.13 via Frontend
 Transport; Thu, 1 Jul 2021 04:22:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6e394ba-f4b3-42d2-965e-08d93c47e68d
X-MS-TrafficTypeDiagnostic: BL0PR12MB5522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5522848F246E273C40FBDA94F7009@BL0PR12MB5522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwqeLQKTHvUcJ3S8YpWRPd1BZmdqiEPsIxoLIzYDToZqR4C6W/G8ykGLDz+ollmmPxwNHkO9AQQId1ScS5AooD8F+4dPI0e4r10Lw8Pm4R3aM4yPi/YdwmYHIx5tU0Bi+L1Ngw8uydxiKhe6YCwhVRrq5OyepB3LftCTDizw++Mj7VM9yVGck0aoVIHueR5s9CHWJ6YO8RNevzGTGGs05kKU9wMW6Jttbk822UoOdNdfW3mS//3mCs5aTCu5ErT/6b2IBhvURviz7cDKLHCrIh06uukBql9/47GGzk/zQ/55Iksl3ilVedJrzciGSFLGorjhxBvUUrKcjEcxNjA5NETZr3rC37G9GkczuHi/5BoX0j2Mi/50+PzQMMY6Hm2ra1lu7m/5khTzxFCZ/+IOFZIQUFyek4/JbMVrwRsmeUF0d1qZkTN1kPY3X/N72xSABvr25SwH0hued1G58+U+uVMelcTPUJ04VcRsq6OMCRIK2XTwiWk6unYCzThR9L01t1mwSZmglaF8rkUxSlmRrQuyFhF2ArD+6cUqr4/M1ChjH6pKy/vHuJnIYCLmMXvU6XvJglp5+Fz98gZGgQ0jLRKMRDarivSmw3R1Z+kbFOWUSiT2/OTcgbo1d7Qmzm3xosHd+FRapHhT30zz7TYT8J8gmGV7Y7aG9DUNvbsXodgwaCu6kTB1q/MXsQEwZYU9cBP7YHvnJCAE8uhUazlK8W335uOLjXsW3/QVG1eB3hOTC5wjfzESepjkxdufDuZN28Pubq8rMv/n5KpIylv3jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(19627235002)(66556008)(86362001)(478600001)(16526019)(316002)(6512007)(186003)(83380400001)(66476007)(4326008)(26005)(6486002)(5660300002)(66946007)(2906002)(38350700002)(1076003)(38100700002)(6666004)(8676002)(52116002)(956004)(2616005)(6506007)(966005)(8936002)(36756003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DcJ9QRrdgCTi+AZuYOPzh5ClWuLJCPwkupJA8NuusTn/k7LCX0As1Ssg4+8W?=
 =?us-ascii?Q?HcdEpPAcYdB+EEbUQSWOp2bSSvOIhee/aE1axM4/gQWbivlJtwUIMDWbZ3kM?=
 =?us-ascii?Q?PKOqRgjOStCTxzhUC0GWM/c2hBqP5bU7SJoKIuiI8621jramGfDky6S7yQa6?=
 =?us-ascii?Q?LTaDd3o91He/93w/GyGt24MoNzviZbWL5CI2FL6IVPEeGR94Zm6czHs7eao8?=
 =?us-ascii?Q?793a+3bi+v9TWJaVfe7QsSkkSUTeuRzHzIeQ2GuETzpbTLTIgDh4uutUS5xL?=
 =?us-ascii?Q?E7eA8j/zcTDJzePUYrDlXYnbnWyX4zY4ML6eHv48iPQiQpkM3nB7ubFPyYYM?=
 =?us-ascii?Q?I6iUVhSS49v/eMdNawWe/afKryORk7pa8+lh0pS3a34DgJED/eGxVaqWPnsy?=
 =?us-ascii?Q?0zi8ECe5gPsGZjoBykjyEVQJIOvbS0qLYtaZjB6LGUkdCyg/gJKzq5qPCcxh?=
 =?us-ascii?Q?G5FmP/dbGG50qNbXR3rSIB5Z2YLloaY2DSZAj51En6F932H4TVeSUBWAD1so?=
 =?us-ascii?Q?JJ4ZKyyVUTmvP5zBhU5m7VelLWdoh4a4uFgfcGWTg7EuQe1fX5IMbWCVI0+8?=
 =?us-ascii?Q?MaqCgJ2QdxySwxl81N+/IfIXdzJKuHAEZoiHKTlp2N3r6pi+NXtMA9x1V84j?=
 =?us-ascii?Q?vKWt2zf3qa6prdDio5akHAAMeFPnH0seXLxzkYQc7FBXhxa0vW5HPTqS/8hJ?=
 =?us-ascii?Q?e9eKcftHjfbi/wNnUMZkEZ3bKEh/kYeZ35UZfuszYteuTXW+gpaq9jNzXy7V?=
 =?us-ascii?Q?1nbGiqP8AzY3odKKO8TqmYAEsBIhMruhxi7ApR3hHwgQxPSpixzjca7+mq/E?=
 =?us-ascii?Q?W1njKwlW6PWRvFghZ/W6MIeOkX0QfDGuBwwzWrAmOLeOPqlXSrY8AQFEt42J?=
 =?us-ascii?Q?aiPUpUOENQf9juPbDSU81IkJb6p3CHfiitAklIksafC7x3lZJQDWMND8xw+0?=
 =?us-ascii?Q?yJvHfWXVK0Sbg1O7nBR2sUyLzqlaO0g6eXsdZNtELI45R9uVp6Zl8WLRQm1j?=
 =?us-ascii?Q?CWVa6l8XjjOSf2ie3ZWwbkByRicaVeZToYzym3DlppgwtPxIkkY5VmAdWCRP?=
 =?us-ascii?Q?V+cLpO269SdtMxrQwez6wa6N1HJKWlR2OsM5KMp+osGUMvrnN75ZT8fJ4gQu?=
 =?us-ascii?Q?osw9G9ouXkHQN2pgTyB1tt9oAaA8AhIWAdZuYv+ErQzfIML4j2VE+dzxifCA?=
 =?us-ascii?Q?hDatEep7dZqPwYcYaRhDs6lUcqUpbuTdc5t1qx00KIgyVuj2JEo0qNbMu48u?=
 =?us-ascii?Q?rrU36HFIntoTqV29RNK+kJpXw+U60eTGcJcW5B31yEAoYRA61ASNOQT9MD2A?=
 =?us-ascii?Q?Ko94xyOr0o7eIptCn3Y7Eujb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e394ba-f4b3-42d2-965e-08d93c47e68d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 04:22:55.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97A129O76sKGz19nU0gIQ5qRtnWw1STYLwsfG4o3ZwjjBmhqKA2fvn8rw0wQKQiB5WT6+q5l0I97i5ag6jgCig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5522
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

The following changes since commit b322a50d17ede5cff6622040f345228afecdcc45:

  Merge tag 'amd-drm-next-5.14-2021-06-22-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-24 07:57:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.14-2021-07-01

for you to fetch changes up to 93c5bcd4eaaafd7c25c062089806c86d9b7890dd:

  drm/amdgpu: Conditionally reset SDMA RAS error counts (2021-07-01 00:05:41 -0400)

----------------------------------------------------------------
amd-drm-next-5.14-2021-07-01:

amdgpu:
- Misc Navi fixes
- Powergating fix
- Yellow Carp updates
- Beige Goby updates
- S0ix fix
- Revert overlay validation fix
- GPU reset fix for DC
- PPC64 fix
- Add new dimgrey cavefish DID
- RAS fix

amdkfd:
- SVM fixes

radeon:
- Fix missing drm_gem_object_put in error path

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: enable tmz on yellow carp
      drm/amdgpu: enable sdma0 tmz for Raven/Renoir(V2)

Alex Deucher (2):
      drm/amdgpu/display: drop unused variable
      drm/amdgpu: add new dimgrey cavefish DID

Alex Sierra (11):
      drm/amdkfd: inc counter on child ranges with xnack off
      drm/amdkfd: device pgmap owner at the svm migrate init
      drm/amdkfd: add owner ref param to get hmm pages
      drm/amdkfd: set owner ref to svm range prefault
      drm/amdgpu: get owner ref in validate and map
      drm/amdkfd: use hmm range fault to get both domain pfns
      drm/amdkfd: classify and map mixed svm range pages in GPU
      drm/amdkfd: skip invalid pages during migrations
      drm/amdkfd: skip migration for pages already in VRAM
      drm/amdkfd: add invalid pages debug at vram migration
      drm/amdkfd: Maintain svm_bo reference in page->zone_device_data

Chengming Gui (1):
      drm/amd/amdgpu: enable gpu recovery for beige_goby

Chengzhe Liu (1):
      drm/amdgpu: Power down VCN and JPEG before disabling SMU features

Darren Powell (1):
      amdgpu/pm: remove code duplication in show_power_cap calls

Evan Quan (7):
      drm/amdgpu: correct tcp harvest setting
      drm/amdgpu: fix Navi1x tcp power gating hang when issuing lightweight invalidaiton
      drm/amdgpu: fix NAK-G generation during PCI-e link width switch
      drm/amdgpu: fix the hang caused by PCIe link width switch
      drm/amdgpu: correct clock gating settings on feature unsupported
      drm/amdgpu: update GFX MGCG settings
      drm/amdgpu: update HDP LS settings

Guchun Chen (2):
      drm/amd/display: fix incorrrect valid irq check
      drm/amd/display: fix null pointer access in gpu reset

Huang Rui (1):
      drm/amdgpu: move apu flags initialization to the start of device init

Jing Xiangfeng (1):
      drm/radeon: Add the missed drm_gem_object_put() in radeon_user_framebuffer_create()

Joseph Greathouse (1):
      drm/amdgpu: Update NV SIMD-per-CU to 2

Michal Suchanek (1):
      drm/amdgpu/dc: Really fix DCN3.1 Makefile for PPC64

Mukul Joshi (1):
      drm/amdgpu: Conditionally reset SDMA RAS error counts

Nicholas Kazlauskas (1):
      drm/amd/display: Extend DMUB diagnostic logging to DCN3.1

Oak Zeng (1):
      drm/amdgpu: Set ttm caching flags during bo allocation

Philip Yang (4):
      drm/amdkfd: add helper function for kfd sysfs create
      drm/amdkfd: fix sysfs kobj leak
      drm/amdkfd: add sysfs counters for vm fault and migration
      drm/amdkfd: implement counters for vm fault and migration

Reka Norman (1):
      drm/amd/display: Respect CONFIG_FRAME_WARN=0 in dml Makefile

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Fix overlay validation by considering cursors"

Shyam Sundar S K (1):
      drm/amd/pm: skip PrepareMp1ForUnload message in s0ix

Tiezhu Yang (1):
      drm/radeon: Call radeon_suspend_kms() in radeon_pci_shutdown() for Loongson64

Veerabadhran Gopalakrishnan (1):
      amdgpu/nv.c - Added codec query for Beige Goby

Zhan Liu (1):
      drm/amd/display: Enabling eDP no power sequencing with DAL feature mask

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  37 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 266 +++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  85 ++++---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |  51 +++-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  37 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 100 +++++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 272 ++++++++++++---------
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 236 ++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  31 ++-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   8 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  60 +++++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |  16 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   5 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |  10 +-
 drivers/gpu/drm/amd/include/navi10_enum.h          |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  95 ++-----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |   8 +-
 40 files changed, 987 insertions(+), 464 deletions(-)
