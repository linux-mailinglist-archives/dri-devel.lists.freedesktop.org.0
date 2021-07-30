Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFF3DB1FB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 05:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F86F3A8;
	Fri, 30 Jul 2021 03:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25756F3A8;
 Fri, 30 Jul 2021 03:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpVDQT3+JMK18YJOTZY5dMfHPLXBFJPFjFeUiO/UfZJL64TAhD/hMm0vUMElDcy48PuHYll/kMsdN1PG7IGLNoFtEgXGLyToW+JKnrex5h5izkwADG4aYDcHvWDvcZ5gYPc7M8gx7R1P0MnLCK9+HowR/vQo1mE2Hmrm0Yjtbm2HKH1rTiwGANcKvokOqvTBboFsSKRvhKqfy02VoR+cJCDqQprvCDmlrkiS6hDMDOwDMW6frnoSZhgZevcwX2hohHKLv32BS3NIWtNSl5oTQ823VzWEZL9ZSh2Wjxd1NUTBbXarJBGvXoMM8VMUpSGAIwSYI1WDLOhos82/ortCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvKA2KPYFLiUfU6OGEQ/lrIi0rYqxJyyYt0L4rbFWl0=;
 b=DDhHb8XpsrdEVoLWH9lnjOdXlvCUQhTt0Tpl/Fm+eQunE5m1HGbbM+jE5VSgoxtfrGSYGPY3hDFQPr8uixc0rPHI9BykS8qA8Xnc8twft5nsyB20I95Oj222/UsjCjnzdAhmP0m5SWKtH8mDW3LSqnadUH6LxsXeqFxj6mq64XD4b5wo7zH8PDoYRJUlAmK1QpSbsRj2Nfysq5Qkxuaa3b6ZLSrV8olEDxxkdKfgUbxfsXZRluqtpX6lSRZuU8rhDcpzI0KjId67IjYlZKtqF2Qg6YRZBRjwUJKK+yp1FZwlES0EEWgNnIGAauZp+kTgce+9WQ4hcvr+buTL7vP3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvKA2KPYFLiUfU6OGEQ/lrIi0rYqxJyyYt0L4rbFWl0=;
 b=1zJXnI/jXG1P8onXsNgdb/gJERtOje2PQjYa9M8/5MtHFUlKbkD4OFFiC/nC/Lv8COVBKTM48WuzROTQ2o6n1SkVDW0f4T2aVVrhTH268kQddAw4KoBHZpaYkl51NvyomCFLk0VQXHkAtQMtxf94GXA6LPtIJILvCnCwttU/Tic=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 03:35:10 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 03:35:10 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.15
Date: Thu, 29 Jul 2021 23:34:55 -0400
Message-Id: <20210730033455.3852-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1PR13CA0327.namprd13.prod.outlook.com (2603:10b6:208:2c1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.9 via Frontend
 Transport; Fri, 30 Jul 2021 03:35:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18125ead-fcd4-47d3-9671-08d9530b0868
X-MS-TrafficTypeDiagnostic: BL1PR12MB5379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5379BDD7D2F7A5580191B753F7EC9@BL1PR12MB5379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yutHCIc3DAQGyCant/ep3v6eUlOd9kMwA79O5SUun/tJ1wIxwlXSVbLvg96cFebMG/Sx0AeJteTWup67ypqbX/U0cn5Oue3ptTyzNze63Nnf6ygbdnr3N/bN6D/xAYQ2S2/UpqQwc/HXhjp9F5vhRgwWYc8ZANGIGYsgMBMKVXcaWrD6U70uyxgRoq2c/amIAEzFE3ERgzOlp6RwJF6B/ECy6Po7E6PeUlDMj1Jw6VFoWwmfYcdmNGHghpA6CggW2zYx6KVHdcnGdyNOSdMYY0QA8d7VsCmk2f1S77njqiCQID8BXW4jRVdlJ0UvDPKjTCnhhSjAtulybildmqVp5FBVAJ5FmyNdCGu/S/0GWVXYI/AvDRNpzAC7+BMvtS5FmzoahUjR8NZJz5nticbUyN8m3OJaRBEef4w2P9bsS15P/SX82bVvvNytH3sgR/cfq+vjUTwaWy5kiqyePpchaCaq7yZ/gz4YWgoOEHt7UT7U1fEG5jTAwoLlIW3YDZYEEA5X05kys0a4V2hNYUAqydKaIcCR+Vb8OVijy+ORqyCfydVcDS5iL50qVYvtI+J+BKo5bl2KyMHCXQp5Ja1ZvxrTFzAjgt6wFCwNHW5ghojAm8/USVNrjwoA7gtkcXGIqBpMjpWz7xSE0dUjRsBA1E3y2j9yyxQ1+J2FeneOwesLCObBWPKC5ei4gkqOoaIra+f4QF6HKmNfIAGF+2zqdAKChM3CHePe3R+XX4YywG6J/H46R24WhkNC+2vU54lf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6666004)(316002)(30864003)(52116002)(19627235002)(26005)(186003)(66556008)(66476007)(66946007)(956004)(2616005)(86362001)(5660300002)(1076003)(6486002)(4326008)(83380400001)(6512007)(38350700002)(38100700002)(8936002)(6506007)(508600001)(36756003)(8676002)(966005)(21314003)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhcY4K4lkMuRXNhOE7s6C2M9WdzjryraXurkkirigisjQGFvL7KQ0UtzeYou?=
 =?us-ascii?Q?rJIbawY37axxtJjto4Nu4tXPhGho0SYzEn+nyhrFqvvPFOGm9E9Y5v6MOI9D?=
 =?us-ascii?Q?pR1cP3VqLJVoXuLguDyJjQvXIRfKLQW0R7KAliU2B/XQYZDOsbBKrcwCs6yk?=
 =?us-ascii?Q?cvPfQt/j6SZEh6qrs5qJ5swEdLL0OsN6hqCGwqe7hUA2g1woQV1y0xjf/Ww4?=
 =?us-ascii?Q?KJC4H2JmXm0YaaUuOAXqJLspSpoQkDeYdLWx20vzCaH9Ij/bX0W5gd/tmngi?=
 =?us-ascii?Q?0M6IVmYSF89FT7qol32XN1g7EjKEF16KCSxXXOzlYApSyqGL6j6LlpzSaTBZ?=
 =?us-ascii?Q?f4j7/Vp3RfVFMhjVUQkE6avvx1MdBvMG0TTL0NTkGKEBsmcnIUKWf8SER/PJ?=
 =?us-ascii?Q?3keArfiN23KPvR9nAyp3+pQfG1CwTCdsymwYWD8MhGMHjUw1qKHs+TuGBc1y?=
 =?us-ascii?Q?6Kplxk753yoB1su6shNlPWjKrHTSS+r7AOno4ntngg7zbk8eo6qYwK+pyKG+?=
 =?us-ascii?Q?2TpjoT9/WqgPcJKObCFtgIkuV0iApS2Ua7JwzYsNIs3bC3DKTqRYKkSO9NfC?=
 =?us-ascii?Q?VHUEifWJzbonjFZzo+sZsCtk1jHJXPhs+5j3vAsan+N7ocX+lhB9RElCcpoy?=
 =?us-ascii?Q?Rv3e0qXnSOLrkZoehS1Dm1mMxyYEigeVPo2JKZ+LRf0R1o72PyieUwdjioAc?=
 =?us-ascii?Q?UXqWnkGGbyvqi8GYKGtwahOqYvr9ksz95pxObrNZm1oqOXjw+/oEQHUcF2NI?=
 =?us-ascii?Q?V8OzV7rp1Lv7yjVls6/FvmMIAKkqzAsZqONOEd5W8oQPVmpN3R74uxzQtsix?=
 =?us-ascii?Q?1juHmmJRwdFAjoVDYOJpCrcWleBIi2PagRRFaU1G7po1Wz0LmhHzl4HNrx3+?=
 =?us-ascii?Q?xk9/L5qAzK4guoYDP8Mrf5/RZqSK3HddFdtWUXOeP+9/7/ZS8I2OP1vaoLLy?=
 =?us-ascii?Q?up5/uKZ2PfCP1bTtpXVlM8Xxz0Yb4bZlvWTeGiXyZBtYC2uPcN8wHofAxzRX?=
 =?us-ascii?Q?UF3Qhfr5Lmopg+yj/v5zuCvJwK1rX5dEoUQ/ozGCw7e3eBlVgvlpu2/mWc5V?=
 =?us-ascii?Q?Ud882xFhUz8QjzbbWxL2TU2/mX/cZDiJyYM0D4CMnUv0Iia8CL1Tjzxz1jZ5?=
 =?us-ascii?Q?FxkgLTmS8ZywpIoiHNSo45f0v0W2hQV29rAybBpF6h8gieHDIjM9jsYckJBX?=
 =?us-ascii?Q?fwYWZ8rnJOK8oLPwNGF6UkhMizUQ6rA5oigSMzo4c94baM9Hx6F0VBzz98Ot?=
 =?us-ascii?Q?zLFeZRuZnJElcFVm54tRlsXg0B8WMFs2YfEX6oILyea5w4z/xEODqfxSQdNN?=
 =?us-ascii?Q?7S1fXPp6TGqCZE7HPBmzEhS7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18125ead-fcd4-47d3-9671-08d9530b0868
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 03:35:10.3121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBw4pCv0cZyN6x18nevkL1jtGYhWdC4d3pw+nQRKyMQcv3SUKaRiUMWcDHZqMAxg16b+dqX39+iXXh7cuXBCPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
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

New stuff for 5.15.

The following changes since commit b322a50d17ede5cff6622040f345228afecdcc45:

  Merge tag 'amd-drm-next-5.14-2021-06-22-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-24 07:57:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-07-29

for you to fetch changes up to 544dcd74b7093ad4befac99b11d90331aa73348e:

  drm/amd/pm: Fix a bug in semaphore double-lock (2021-07-28 22:15:44 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-07-29:

amdgpu:
- VCN/JPEG power down sequencing fixes
- Various navi pcie link handling fixes
- Clockgating fixes
- Yellow Carp fixes
- Beige Goby fixes
- Misc code cleanups
- S0ix fixes
- SMU i2c bus rework
- EEPROM handling rework
- PSP ucode handling cleanup
- SMU error handling rework
- AMD HDMI freesync fixes
- USB PD firmware update rework
- MMIO based vram access rework
- Misc display fixes
- Backlight fixes
- Add initial Cyan Skillfish support
- Overclocking fixes suspend/resume

amdkfd:
- Sysfs leak fix
- Add counters for vm faults and migration
- GPUVM TLB optimizations

radeon:
- Misc fixes

----------------------------------------------------------------
Aaron Liu (5):
      drm/amdgpu: enable tmz on yellow carp
      drm/amdgpu: enable sdma0 tmz for Raven/Renoir(V2)
      drm/amd/pm: Add waiting for response of mode-reset message for yellow carp
      drm/amdgpu: update yellow carp external rev_id handling
      drm/amdgpu: add yellow carp pci id (v2)

Aaron Rice (1):
      drm/amdgpu: rework smu11 i2c for generic operation

Alex Deucher (16):
      drm/amdgpu/display: drop unused variable
      drm/amdgpu: add new dimgrey cavefish DID
      drm/amdgpu: add a mutex for the smu11 i2c bus (v2)
      drm/amdgpu/pm: rework i2c xfers on sienna cichlid (v4)
      drm/amdgpu/pm: rework i2c xfers on arcturus (v5)
      drm/amdgpu/pm: add smu i2c implementation for navi1x (v5)
      drm/amdgpu: add new helper for handling EEPROM i2c transfers
      drm/amdgpu/ras: switch ras eeprom handling to use generic helper
      drm/amdgpu/ras: switch fru eeprom handling to use generic helper (v2)
      drm/amdgpu: i2c subsystem uses 7 bit addresses
      drm/amdgpu: add I2C_CLASS_HWMON to SMU i2c buses
      drm/amdgpu: only set restart on first cmd of the smu i2c transaction
      drm/amdgpu: fix 64 bit divide in eeprom code
      drm/amdgpu: add license to umc_8_7_0_sh_mask.h
      drm/amdgpu/display: only enable aux backlight control for OLED panels
      drm/amdgpu/display: add support for multiple backlights

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

Alvin Lee (1):
      drm/amd/display: Adjust types and formatting for future development

Andrey Grodzovsky (8):
      drm/amdgpu: Remember to wait 10ms for write buffer flush v2
      dmr/amdgpu: Add RESTART handling also to smu_v11_0_i2c (VG20)
      drm/amdgpu: Drop i > 0 restriction for issuing RESTART
      drm/amdgpu: Send STOP for the last byte of msg only
      drm/amd/pm: SMU I2C: Return number of messages processed
      drm/amdgpu/pm: ADD I2C quirk adapter table
      drm/amdgpu: Switch to VRAM buffer for USBC PD FW.
      drm/amdgpu: Switch to LFB for USBC PD FW in psp v13

Anson Jacob (4):
      drm/amdgpu: Fix documentaion for amdgpu_bo_add_to_shadow_list
      drm/amd/amdgpu: Update debugfs link_settings output link_rate field in hex
      drm/amd/amdgpu: Add a new line to debugfs phy_settings output
      drm/amdgpu: Fix documentaion for dm_dmub_outbox1_low_irq

Anthony Koo (4):
      drm/amd/display: [FW Promotion] Release 0.0.72
      drm/amd/display: [FW Promotion] Release 0.0.73
      drm/amd/display: [FW Promotion] Release 0.0.75
      drm/amd/display: [FW Promotion] Release 0.0.76

Aric Cyr (7):
      drm/amd/display: 3.2.142
      drm/amd/display: Round KHz up when calculating clock requests
      drm/amd/display: increase max EDID size to 2k
      drm/amd/display: 3.2.143
      drm/amd/display: 3.2.144
      drm/amd/display: 3.2.145
      drm/amd/display: 3.2.146

Aurabindo Pillai (1):
      drm/amd/display: add debug print for DCC validation failure

Bindu Ramamurthy (2):
      drm/amd/display: Populate socclk entries for dcn3.02/3.03
      drm/amd/display: Populate dtbclk entries for dcn3.02/3.03

Camille Cho (1):
      drm/amd/display: Only set default brightness for OLED

Candice Li (1):
      drm/amd/amdgpu: add consistent PSP FW loading size checking

Charlene Liu (1):
      drm/amd/display: reset dpcd_cap.dpcd_rev for passive dongle.

Chengming Gui (2):
      drm/amd/amdgpu: enable gpu recovery for beige_goby
      drm/amd/pm: Fix BACO state setting for Beige_Goby

Chengzhe Liu (3):
      drm/amdgpu: Power down VCN and JPEG before disabling SMU features
      drm/amdgpu: Clear doorbell interrupt status for Sienna Cichlid
      drm/amdgpu: Add msix restore for pass-through mode

Chun-Liang Chang (1):
      drm/amd/display: DMUB Outbound Interrupt Process-X86

Colin Ian King (1):
      drm/amdgpu/display: make a const array common_rates static, makes object smaller

Dale Zhao (1):
      drm/amd/display: ensure dentist display clock update finished in DCN20

Dan Carpenter (4):
      drm/amdgpu: fix a signedness bug in __verify_ras_table_checksum()
      drm/amdgpu: Fix signedness bug in __amdgpu_eeprom_xfer()
      drm/amdgpu: unlock on error in amdgpu_ras_debugfs_table_read()
      drm/amdgpu: return -EFAULT if copy_to_user() fails

Darren Powell (1):
      amdgpu/pm: remove code duplication in show_power_cap calls

Dmytro Laktyushkin (2):
      drm/amd/display: remove faulty assert
      drm/amd/display: remove compbuf size wait

Emily Deng (1):
      drm/amdgpu: Correct the irq numbers for virtual crtc

Emily.Deng (1):
      drm/amdgpu: Restore msix after FLR

Eric Bernstein (1):
      drm/amd/display: Always wait for update lock status

Eric Huang (12):
      drm/amdkfd: Only apply TLB flush optimization on ALdebaran
      Revert "drm/amdkfd: Only apply TLB flush optimization on ALdebaran"
      Revert "drm/amdkfd: Add memory sync before TLB flush on unmap"
      Revert "drm/amdgpu: Fix warning of Function parameter or member not described"
      Revert "drm/amdkfd: Make TLB flush conditional on mapping"
      Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update"
      Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping"
      Revert "Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping""
      Revert "Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update""
      Revert "Revert "drm/amdkfd: Make TLB flush conditional on mapping""
      Revert "Revert "drm/amdgpu: Fix warning of Function parameter or member not described""
      Revert "Revert "drm/amdkfd: Add memory sync before TLB flush on unmap""

Eric Yang (5):
      drm/amd/display: implement workaround for riommu related hang
      drm/amd/display: add workaround for riommu invalidation request hang
      drm/amd/display: change zstate allow msg condition
      drm/amd/display: fix missing reg offset
      drm/amd/display: refactor riommu invalidation wa

Evan Quan (12):
      drm/amdgpu: correct tcp harvest setting
      drm/amdgpu: fix Navi1x tcp power gating hang when issuing lightweight invalidaiton
      drm/amdgpu: fix NAK-G generation during PCI-e link width switch
      drm/amdgpu: fix the hang caused by PCIe link width switch
      drm/amdgpu: correct clock gating settings on feature unsupported
      drm/amdgpu: update GFX MGCG settings
      drm/amdgpu: update HDP LS settings
      drm/amd/pm: new SmuMetrics data structure for Sienna Cichlid
      drm/amd/pm: update the gpu metrics data retrieving for Sienna Cichlid
      drm/amd/pm: bump DRIVER_IF_VERSION for Sienna Cichlid
      drm/amd/pm: restore user customized OD settings properly for NV1x
      drm/amd/pm: restore user customized OD settings properly for Sienna Cichlid

Felix Kuehling (1):
      drm/amdkfd: Allow CPU access for all VRAM BOs

Graham Sider (1):
      drm/amdkfd: Update SMI throttle event bitmask

Guchun Chen (3):
      drm/amd/display: fix incorrrect valid irq check
      drm/amd/display: fix null pointer access in gpu reset
      drm/amd/display: avoid printing ERROR for unknown CEA parse(v2)

Hawking Zhang (1):
      drm/amdgpu: retire sdma v5_2 golden settings from driver

Huang Rui (3):
      drm/amdgpu: move apu flags initialization to the start of device init
      drm/amdgpu: remove the access of xxx_PSP_DEBUG on cycan_skillfish
      drm/amdgpu: enable psp front door loading by default for cyan_skillfish2

Ian Chen (1):
      drm/amd/display: Extend dmub_cmd_psr_copy_settings_data struct

Jake Wang (1):
      drm/amd/display: Fixed hardware power down bypass during headless boot

Jing Xiangfeng (1):
      drm/radeon: Add the missed drm_gem_object_put() in radeon_user_framebuffer_create()

Jingwen Chen (2):
      drm/amdgpu: SRIOV flr_work should take write_lock
      drm/amd/amdgpu: consider kernel job always not guilty

Jinzhou Su (1):
      drm/amdgpu: add another Renoir DID

Jiri Kosina (2):
      drm/amdgpu: Fix resource leak on probe error path
      drm/amdgpu: Avoid printing of stack contents on firmware load error

John Clements (6):
      drm/amdgpu: initialize umc ras function
      drm/amdgpu: Resolve bug in UMC 6.7 error offset calculation
      drm/amdgpu: Added latest PSP FW header
      drm/amdgpu: Added support for added psp driver binaries FW
      drm/amdgpu: Consolidated PSP13 BL FW loading
      drm/amdgpu: Added PSP13 BL loading support for additional drivers

Jonathan Kim (3):
      drm/amdgpu: add psp command to get num xgmi links between direct peers
      drm/amdkfd: report xgmi bandwidth between direct peers to the kfd
      drm/amdkfd: report pcie bandwidth to the kfd

Joseph Greathouse (1):
      drm/amdgpu: Update NV SIMD-per-CU to 2

Josip Pavic (1):
      drm/amd/display: log additional register state for debug

Kai-Heng Feng (1):
      drm/amdgpu/acp: Make PM domain really work

Kevin Wang (3):
      drm/amdgpu: split amdgpu_device_access_vram() into two small parts
      drm/amdgpu/ttm: replace duplicate code with exiting function
      drm/amdgpu/ttm: optimize vram access in amdgpu_ttm_access_memory()

Krunoslav Kovac (2):
      drm/amd/display: Assume active upper layer owns the HW cursor
      drm/amd/display: Refine condition for cursor visibility

Lang Yu (16):
      drm/amdgpu: add function to show ucode name via id
      drm/amdgpu: add function to show psp_gfx_cmd name via id
      drm/amdgpu: show explicit name instead of id in psp_cmd_submit_buf
      drm/amdgpu: adjust fw_name string length for toc
      drm/amdgpu: add mp 11.0.8 header for cyan_skillfish
      drm/amdgpu: add psp v11.0.8 driver for cyan_skillfish
      drm/amdgpu: init psp v11.0.8 function for cyan_skillfish
      drm/amdgpu: enable psp v11.0.8 for cyan_skillfish
      drm/amdgpu: use direct loading by default for cyan_skillfish2
      drm/amdgpu: add smu_v11_8_pmfw header for cyan_skilfish
      drm/amdgpu: add smu_v11_8_ppsmc header for cyan_skilfish
      drm/amdgpu: add smu interface header for cyan_skilfish
      drm/amdgpu: add basic ppt functions for cyan_skilfish
      drm/amdgpu: add check_fw_version support for cyan_skillfish
      drm/amdgpu: enable SMU for cyan_skilfish
      drm/amdgpu: add autoload_supported check for RLC autoload

Lijo Lazar (1):
      drm/amd/pm: Support board calibration on aldebaran

Likun Gao (2):
      drm/amdgpu: update golden setting for sienna_cichlid
      drm/amdgpu: adjust fence driver enable sequence

Liviu Dudau (1):
      drm/amd/display: Fix 10bit 4K display on CIK GPUs

Luben Tuikov (32):
      drm/amdgpu: Fix Vega20 I2C to be agnostic (v2)
      drm/amdgpu: Fixes to the AMDGPU EEPROM driver
      drm/amdgpu: EEPROM respects I2C quirks
      drm/amdgpu: I2C EEPROM full memory addressing
      drm/amdgpu: RAS and FRU now use 19-bit I2C address
      drm/amdgpu: Fix wrap-around bugs in RAS
      drm/amdgpu: I2C class is HWMON
      drm/amdgpu: RAS: EEPROM --> RAS
      drm/amdgpu: Rename misspelled function
      drm/amdgpu: RAS xfer to read/write
      drm/amdgpu: EEPROM: add explicit read and write
      drm/amd/pm: Extend the I2C quirk table
      drm/amd/pm: Simplify managed I2C transfer functions
      drm/amdgpu: Fix width of I2C address
      drm/amdgpu: Return result fix in RAS
      drm/amdgpu: Fix amdgpu_ras_eeprom_init()
      drm/amdgpu: Simplify RAS EEPROM checksum calculations
      drm/amdgpu: Use explicit cardinality for clarity
      drm/amdgpu: Nerf buff
      drm/amdgpu: Some renames
      drm/amdgpu: Get rid of test function
      drm/amdgpu: Optimize EEPROM RAS table I/O
      drm/amdgpu: RAS EEPROM table is now in debugfs
      drm/amdgpu: Fix koops when accessing RAS EEPROM
      drm/amdgpu: Use a single loop
      drm/amdgpu: Correctly disable the I2C IP block
      drm/amd/pm: Simplify managed I2C transfer of Aldebaran
      drm/amd/pm: Add I2C quirk table to Aldebaran
      drm/amdgpu: The I2C IP doesn't support 0 writes/reads
      drm/amdgpu: Return error if no RAS
      drm/amd/pm: Fix a bug communicating with the SMU (v5)
      drm/amd/pm: Fix a bug in semaphore double-lock

Lukas Bulwahn (1):
      drm/amdgpu: rectify line endings in umc v8_7_0 IP headers

Mark Morra (1):
      drm/amd/display: Fixed EdidUtility build errors

Michael Strauss (1):
      drm/amd/display: Enable eDP ILR on DCN2.1

Michal Suchanek (1):
      drm/amdgpu/dc: Really fix DCN3.1 Makefile for PPC64

Mikita Lipski (3):
      drm/amd/display: Prevent Diags from entering S2
      drm/amd/display: Remove MALL function from DCN3.1
      drm/amd/display: Fix PSR command version

Mukul Joshi (1):
      drm/amdgpu: Conditionally reset SDMA RAS error counts

Nevenko Stupar (1):
      drm/amd/display: Line Buffer changes

Nicholas Kazlauskas (5):
      drm/amd/display: Extend DMUB diagnostic logging to DCN3.1
      drm/amd/display: Fix updating infoframe for DCN3.1 eDP
      drm/amd/display: Fix max vstartup calculation for modes with borders
      drm/amd/display: Query VCO frequency from register for DCN3.1
      drm/amd/display: Update bounding box for DCN3.1

Nirmoy Das (2):
      drm/amdgpu: use xarray for storing pasid in vm
      drm/amdgpu: separate out vm pasid assignment

Oak Zeng (6):
      drm/amdgpu: Set ttm caching flags during bo allocation
      drm/amdgpu: Fix a printing message
      drm/amdgpu: Change a few function names
      drm/amdkfd: Renaming dqm->packets to dqm->packet_mgr
      drm/amdkfd: Set priv_queue to NULL after it is freed
      drm/amdkfd: Fix a concurrency issue during kfd recovery

Oliver Logush (1):
      drm/amd/display: Fix timer_per_pixel unit error

Philip Yang (5):
      drm/amdkfd: add helper function for kfd sysfs create
      drm/amdkfd: fix sysfs kobj leak
      drm/amdkfd: add sysfs counters for vm fault and migration
      drm/amdkfd: implement counters for vm fault and migration
      drm/amdkfd: handle fault counters on invalid address

Pratik Vishwakarma (2):
      drm/amdgpu: Check pmops for desired suspend state
      drm/amdgpu: Rename amdgpu_acpi_is_s0ix_supported

Reka Norman (1):
      drm/amd/display: Respect CONFIG_FRAME_WARN=0 in dml Makefile

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Fix overlay validation by considering cursors"

Roy Sun (3):
      drm/amdgpu: Change the imprecise function name
      drm/amdgpu: Add error message when programing registers fails
      drm/amdgpu: Change the imprecise output

Shyam Sundar S K (1):
      drm/amd/pm: skip PrepareMp1ForUnload message in s0ix

Simon Ser (1):
      maintainers: add bugs and chat URLs for amdgpu

Stylon Wang (2):
      drm/amd/display: Add Freesync HDMI support to DM with DMUB
      drm/amd/display: Fix ASSR regression on embedded panels

Tao Zhou (18):
      drm/amdgpu: update gc golden setting for dimgrey_cavefish
      drm/amd/pm: update DRIVER_IF_VERSION for beige_goby
      drm/amdgpu: increase size for sdma fw name string
      drm/amdgpu: add cyan_skillfish asic type
      drm/amdgpu: dynamic initialize ip offset for cyan_skillfish
      drm/amdgpu: init family name for cyan_skillfish
      drm/amdgpu: set ip blocks for cyan_skillfish
      drm/amdgpu: add cp/rlc fw loading support for cyan_skillfish
      drm/amdgpu: add sdma fw loading support for cyan_skillfish
      drm/amdgpu: load fw direclty for cyan_skillfish
      drm/amdgpu: add cyan_skillfish support in gmc v10
      drm/amdgpu: add cyan_skillfish support in gfx v10
      drm/amdgpu: add sdma v5 golden settings for cyan_skillfish
      drm/amdgpu: add gc v10 golden settings for cyan_skillfish
      drm/amdkfd: enable cyan_skillfish KFD
      drm/amdgpu: add chip early init for cyan_skillfish
      drm/amdgpu: add nbio support for cyan_skillfish
      drm/amdgpu: add pci device id for cyan_skillfish

Tiezhu Yang (1):
      drm/radeon: Call radeon_suspend_kms() in radeon_pci_shutdown() for Loongson64

Veerabadhran Gopalakrishnan (4):
      amdgpu/nv.c - Added codec query for Beige Goby
      amdgpu/nv.c - Added video codec support for Yellow Carp
      amdgpu/nv.c - Optimize code for video codec support structure
      drm/amdgpu - Corrected the video codecs array name for yellow carp

Victor Lu (3):
      drm/amd/display: Fix comparison error in dcn21 DML
      drm/amd/display: Guard DST_Y_PREFETCH register overflow in DCN21
      drm/amd/display: Add missing DCN21 IP parameter

Wang (1):
      drm/amd/display: Add null checks

Wenjing Liu (3):
      drm/amd/display: isolate link training setting override to its own function
      drm/amd/display: add update authentication interface
      drm/amd/display: remove unused functions

Wesley Chalmers (2):
      Revert "drm/amd/display: Always write repeater mode regardless of LTTPR"
      drm/amd/display: Add copyright notice to new files

Wyatt Wood (2):
      drm/amd/display: Add ETW logging for AUX failures
      drm/amd/display: Add ETW log to dmub_psr_get_state

Xiaojian Du (1):
      drm/amdgpu: update the golden setting for vangogh

Xiaomeng Hou (2):
      drm/amd/pm: drop smu_v13_0_1.c|h files for yellow carp
      drm/amd/display: update header file name

YuBiao Wang (1):
      drm/amdgpu: Read clock counter via MMIO to reduce delay (v5)

Zhan Liu (3):
      drm/amd/display: Enabling eDP no power sequencing with DAL feature mask
      drm/amdgpu/display - only update eDP's backlight level when necessary
      drm/amd/display: Reduce delay when sink device not able to ACK 00340h write

sunglee (1):
      drm/amd/display: DCN2X Prefer ODM over bottom pipe to find second pipe

 MAINTAINERS                                        |    2 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   83 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  178 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |  239 ++++
 .../inc/smu_v13_0_1.h => amdgpu/amdgpu_eeprom.h}   |   40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  369 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  165 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 1258 +++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   86 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  147 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |   12 +-
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |   51 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  429 +++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    3 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   13 +
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   85 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   72 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  298 ++---
 drivers/gpu/drm/amd/amdgpu/nv.h                    |    1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   49 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |  208 ++++
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.h           |   30 +
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  126 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   17 -
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |  324 ++---
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  190 +--
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    8 +-
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |   14 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |   15 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |   15 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   17 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   30 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   39 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  100 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  272 +++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  242 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  273 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   18 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    4 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |   12 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    4 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   14 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   16 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   29 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |   10 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   59 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |   54 -
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   14 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  118 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  147 +--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   25 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |   24 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  131 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_stat.h           |    1 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   83 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    8 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |    4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   21 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   31 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    7 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   19 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   29 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    4 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   42 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    2 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |   21 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |   33 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   17 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   60 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.h    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   16 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |    3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   25 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    8 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |    1 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   13 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |    2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   33 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |    1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    1 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    8 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   16 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   18 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   15 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |    4 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    2 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   12 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  393 +++---
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    1 -
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   11 +
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |    3 +
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |   25 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |    4 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   18 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   47 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   80 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   22 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   22 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   70 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    2 -
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |    6 -
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    3 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   53 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   12 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   11 +-
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |    4 +
 .../drm/amd/include/asic_reg/mp/mp_11_0_8_offset.h |  352 ++++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h |  355 ------
 .../amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h    |  531 ---------
 .../amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h   |  179 +--
 .../gpu/drm/amd/include/cyan_skillfish_ip_offset.h |  714 +++++++++++
 drivers/gpu/drm/amd/include/navi10_enum.h          |    2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   95 +-
 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h       |    3 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    1 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |    8 +
 .../amd/pm/inc/smu11_driver_if_cyan_skillfish.h    |   95 ++
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |   65 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |    3 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |    7 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_pmfw.h        |  152 +++
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h       |   70 ++
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |    1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   21 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/Makefile        |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  246 ++--
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   76 ++
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.h    |   29 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  173 ++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  494 ++++----
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   29 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  289 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   24 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c   |  311 -----
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   52 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  286 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |    8 +-
 include/drm/amd_asic_type.h                        |   17 +-
 211 files changed, 8211 insertions(+), 4872 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
 rename drivers/gpu/drm/amd/{pm/inc/smu_v13_0_1.h => amdgpu/amdgpu_eeprom.h} (53%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_11_0_8_offset.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu11_driver_if_cyan_skillfish.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v11_8_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.h
 delete mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
