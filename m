Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77D5B8EFB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2179E10E9DA;
	Wed, 14 Sep 2022 18:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282C010E9D7;
 Wed, 14 Sep 2022 18:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfTs+DcXGe7UOZIglulCZ+HOsNqqe3MUyVmj7wd13U2F0frnWkoW4B84f+yXoL35xPlNHcXAwP6Wc//qyCjjTsodKlxoNJXNxTBCqL0AzRITufxAZ1FB2u987TyCol1Z9G5a1wiEqWTEOptf5wgdpfncp+3K9vuWqPHM8CyLIpLROEBz5YRWVwaNer4ZeTWaX5JXGYQgUmjCFIAKxnajrZRatu3Pv4ZVU2ISSeoQ3RBNmyEiYb9GHIEdJjojOPgTO2i5AU5pfrHj7lv6WJF2eWiMhYCcHsQBAVo7KM0srIz8BATEOTSezz5CDT6bsznB1m5otSgMPwR3VRccs5++Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsf+VtE6Z1cUUeVS3H/EevAYcF4JJtZ9SmTJ2l2wh8s=;
 b=eFlT4aQiJWhV12y7qZcDusFXjFQ3sw6L64wLFHkJMxqZZK2ErEbXPxt+BXVL5eTl7uoMHwGaGwrRgu2IY/m4S6JENT9ObZ34F3nS7Lp3pjE0AEMGcaFOjXtxBRqpg89IrTiDo5iiZRsy5iufVrrxhcz7DhSKW7lzWV4L27wOG3j5rkIvd0x+6PyV/Jtl4aI7g9SkCElqGBQ8EvRZY5pSfje+9dbzMGGiOzdkwvs4Dn52ni1E3nSe8cAr15zylA5N59QqPQvOtqWJTYA+ef55qWY4Fyjf14bsnJV5TzFQrzDRGBCulOYkiSutAiErVKsj6eDIVL1lIMOJdrmIBm5yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsf+VtE6Z1cUUeVS3H/EevAYcF4JJtZ9SmTJ2l2wh8s=;
 b=O0nO5ql3mcCy/GeGgnSEPP+sq3WmmVpe77+DN8t/SIZaX6clLsbR7OLPiMfvYAK6z4M5njQkO93LUD/3DFswSkGSRsALwZWKUxY/4sjyQsT8eT8VsLfxOw4VAh96I/KgkJRtAYR+nqWaBmFeFIoc3kR+Z2Ds3umU6582C3cdn84=
Received: from BN9PR03CA0687.namprd03.prod.outlook.com (2603:10b6:408:10e::32)
 by CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Wed, 14 Sep
 2022 18:40:52 +0000
Received: from BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::66) by BN9PR03CA0687.outlook.office365.com
 (2603:10b6:408:10e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Wed, 14 Sep 2022 18:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT080.mail.protection.outlook.com (10.13.176.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 18:40:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 13:40:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Wed, 14 Sep 2022 14:40:30 -0400
Message-ID: <20220914184030.6145-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT080:EE_|CH0PR12MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c9ee4-272c-4dd9-6c05-08da9680a67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PR6CTJXus+WOzVOafnRZT/OAX3yhr2PQk2CiV9OxvBKoRl0bEEoaF2KMJhu9nFnEY2lT6ZHAclw/Adl1hnECyD1Yn0132ZZtmUJvuGAbCJMcwymA9t5jlD2BfZkBrU+d4wBOd8+IzyZEZyB3AHBfiGda+B2qBq1dP7CdFjIdld757h9W8ovKohumsVJVhDT4cso8n9pjIlFuUbWMLi80orzWNfBLF3I+5aZYs1LQstvhyv0jPkFPTkkJHjmNhTWq41PoENsUNsQDNlhTr2vreXUmqyeFZ+yAoFpSEkXzaq8HLIGhl1dN7wUiOrfYuYiwgI9hsFIsIx4/fj6FEfv3JFgu38OP2teTOssCi86lZI6JAo+WIFQrIaFg4e37Zh7WxP9PtsjxtzZ8ZwTF8g0ud/wbJFJkJ8KJpbYCpKWMWDaAEqvzIILTjLoWH5bjuIwBOtAp/a95ZcqHd0WvtINDtqBcr1uAic5iDBowBmGXGRwq2qBfNK77O8KYOkiz7KkBm2x5Jod/dYSoqts0TdgkIuEgIrBQpHBJLPKdju1w9+c08xDcuIkxwWFEd+Wdh8cBcBiWfoW5xjPfRLr8YkL4QU7vo8cLxqOatS+YFx/V9WrpO0q0T5jEb4ADT3Tgw8tGJG77ftxUEsAZpCI5pOyxlUVsWaC6Newc5UfXN9A2KBaItNqhg2OcYp1ZS5tJ40j1ouCH85SH/U8YWHbLQ6jPcyaVExAhjhomp26WrMPk+u5z38fGju9SMg2VIhinJwP+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(2616005)(40460700003)(82740400003)(8676002)(40480700001)(2906002)(356005)(36756003)(47076005)(82310400005)(186003)(86362001)(1076003)(110136005)(336012)(83380400001)(8936002)(7696005)(5660300002)(426003)(6666004)(36860700001)(16526019)(81166007)(70586007)(316002)(70206006)(26005)(41300700001)(478600001)(966005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 18:40:51.8914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c9ee4-272c-4dd9-6c05-08da9680a67f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5122
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

Fixes for 6.0.  A bit bigger than usual, but this is mainly caused by some
regression fixes which took a while to sort out and validate.  The rest is
fixes for new IPs added in the 6.0 cycle.

The following changes since commit 2edb79a5fb303dff577d6a0c7d571c3bab1d1455:

  Merge tag 'drm-intel-fixes-2022-09-08' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-10 01:42:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-14

for you to fetch changes up to a8671493d2074950553da3cf07d1be43185ef6c6:

  drm/amdgpu: make sure to init common IP before gmc (2022-09-14 14:21:49 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-14:

amdgpu:
- BACO fixes for some RDNA2 boards
- PCI AER fixes uncovered by a core PCI change
- Properly hook up dirtyfb helper
- RAS fixes for GC 11.x
- TMR fix
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- LLVM DML stack size fixes

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add HDP remap functionality to nbio 7.7
      drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
      drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
      drm/amdgpu: make sure to init common IP before gmc

Alvin Lee (3):
      drm/amd/display: Update MBLK calculation for SubVP
      drm/amd/display: SW cursor fallback for SubVP
      drm/amd/display: Refactor SubVP calculation to remove FPU

Aric Cyr (1):
      drm/amd/display: Fix divide by zero in DML

Aurabindo Pillai (2):
      drm/amd/display: Revert "Fallback to SW cursor if SubVP + cursor too big"
      drm/amd/display: add workaround for subvp cursor corruption for DCN32/321

Candice Li (2):
      drm/amdgpu: Enable full reset when RAS is supported on gc v11_0_0
      drm/amdgpu: Skip reset error status for psp v13_0_0

Duncan Ma (1):
      drm/amd/display: Correct dram channel width for dcn314

Guchun Chen (1):
      drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards

Hamza Mahfooz (1):
      drm/amdgpu: use dirty framebuffer helper

Leo Chen (1):
      drm/amd/display: Fixing DIG FIFO Error

Lijo Lazar (1):
      drm/amdgpu: Don't enable LTR if not supported

Nathan Chancellor (5):
      drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
      drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage

Nicholas Kazlauskas (2):
      drm/amd/display: Hook up DCN314 specific dml implementation
      drm/amd/display: Relax swizzle checks for video non-RGB formats on DCN314

Rodrigo Siqueira (2):
      drm/amd/display: Fix compilation errors on DCN314
      drm/amd/display: Enable dlg and vba compilation for dcn314

Taimur Hassan (1):
      drm/amd/display: Round cursor width up for MALL allocation

Yang Wang (1):
      drm/amdgpu: change the alignment size of TMR BO to 1M

Yao Wang1 (1):
      drm/amd/display: Limit user regamma to a valid value

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   9 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  25 --
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   4 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  89 +++--
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |  24 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  24 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   4 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   3 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  59 ++-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   3 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   3 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c | 420 +++++----------------
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   5 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  13 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c | 260 +++++--------
 .../dc/dml/dcn32/display_mode_vba_util_32.c        | 323 +++++++---------
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |  51 +--
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |  12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  10 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 .../drm/amd/display/modules/color/color_gamma.c    |   4 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  11 +
 39 files changed, 595 insertions(+), 834 deletions(-)
