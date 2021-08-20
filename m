Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2F3F322C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 19:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330F6EAD6;
	Fri, 20 Aug 2021 17:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59B56EAD5;
 Fri, 20 Aug 2021 17:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG/h8EmfJIqR5zwr5I2CMoutrdroAdgS95ZyAShX31eTjwKbXpn64/CdDszVh9+iI91aNlpMyA4DO0qV/614lTayz7VKZharHrmRZlN9lRk7UkK6q3OV9zG92LIzOdE0YqaHOE8l87FKuL9qdNFQZvFI26cqL7opCTKVMLyawL+XV2W+T/7FORowNWFeeNgn4l6bhuNgpWPCyS+O9th6wdW3Eqr2QRq7q/QHOmtzUBGdvBtgMHR7OFVe46isuatQQUoGwbDGgYzJKHHCZer8PmWBUxcS1CDEOOb8VHwm99MjC2KGcWohkPkSLuYlDUyvUnzJhUq+NsZvitSkXsvshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhF9YR+ZSkyNkmYzYqxWGplto1awJNuKpgANeUMp1tA=;
 b=Wa5OLqsNfZ7WS+FCfr+ppXhNNJZohSouB28ryCfBhXVXAEezW+016cQaAvqx9KOoIGGNgm5grV9OBamAKg9CxNA19N9XFuMjDS7WvdXgH8KOPSht/f0r3M2+Gmuk8Yt/fRsnMi6futHHbF9M9sQWtU0IP1Yan09iBiNoJlDRMu4tRekHZ/TpQGOoZYxhYdlDknsJxicjH/VNUFgjRfHwmNsn8C8YheNNqJ9Lf2D0B5eGkQd6ZlfOpdJwD/UxDQfHPpE0sCqH+B9RKcJYJxrE9epknZmhRTxlUaflxrEs4gcYVZ12Mn3kWaNU73KCWhSVHk3F888Ard+KhGsnlNSnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhF9YR+ZSkyNkmYzYqxWGplto1awJNuKpgANeUMp1tA=;
 b=MvqBLJgyUw86So6IsyZh+BeE3zM1E1lkeLc9fygQFMg6MVzO/0dOvDO9rGHOLQIT4mV0AQPMD+hZX+Wq+/eLvqTdZ8TLtgsRT2MJOMHygS4avmIuYTuk383edgVZ5SaK0Yl9n0+A/PRqRgQMFW4l4NxjOPmsrr6Tkt9qsgPz+rM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 17:23:52 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 17:23:52 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.15
Date: Fri, 20 Aug 2021 13:23:35 -0400
Message-Id: <20210820172335.4190-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:208:329::32) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.191) by
 BLAPR03CA0087.namprd03.prod.outlook.com (2603:10b6:208:329::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 17:23:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 671b5c9c-27ba-4b58-cad1-08d963ff4809
X-MS-TrafficTypeDiagnostic: BL1PR12MB5269:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52694CA2AD76B0B2F5B6D829F7C19@BL1PR12MB5269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRkbpPJVbhoyw297n3jFILD/sdA0Gw+IsTmVx9j+lv2C4pYXVaZp9XuGuaLWWz2QVVt/49ZuquJjjEU/xK2c9d0aJ6PZ4wH934yEJLy+WGTEYEr2fFU2X0KFtec+y9zMyBBJgS0dzPtsXNwXAlrvHgOBLy4nuVVo4kM+DLR09x4MR62M4fO/D5TISMcZ8sIPAv38aCPime5T83jgjG6ezwUbK5W5DTBLsko45KyNuR0u96OX5CQ4SipFOaE6ftBQd9xsRj0lkd9DFAR9ukCEhboR/KOe20zxd1iy4iK5ntpFc4/l7FsZNWrLMEFXIp5gT5GwmNG3DOe2ll9Q+OP9jZYeomxOK8CYYZrQFn9XYSmeK78RiijPV/0GRCMbtMabMJ6lVa9gKOtQb/HrK1ZzI9Y2Zw4+powrpxg5Lj0em0l8RkhyrRVlOn3Pg/lfYccnkYhI2IboVnu/xGa44C/0cyQ9E+hMejn3kIkHTlEwhiS4S2Gz37hFr5AUhcYqw3FHGaSjCAK4yzg31UV45vb2b3n4DA6BxZJogJDHjsjeGOtVdQjNFu3ei/TU3P1s2HwpgQaGuBMjftAEgtVMO96Q1ah/A+FF7elpHu95b8AVr48DSFWEHE6OsjDlEhtLo+YU6oJIz0H3CQJnXJGHkN31cC/vnNajQGXSDUYLwWhDi7cr1+o7lKnXnb9h6sGwlri/dwvO1tiwXm8Czy6p9oS6UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(6512007)(66556008)(66476007)(186003)(6506007)(2616005)(2906002)(956004)(4326008)(38100700002)(6486002)(38350700002)(52116002)(5660300002)(66946007)(26005)(6666004)(36756003)(966005)(83380400001)(8676002)(66574015)(8936002)(86362001)(316002)(478600001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFaMWxET0xLdFhZVmMvRUcwN2JYcExWNWM5NzZaekg1Tk00S3J5TXkvNk9J?=
 =?utf-8?B?NXRVRjZzeDMzZnZMdmNKamQyaGRMd2djVi95Z0Z1ODZ4N0tramFpY292YWF1?=
 =?utf-8?B?WlZzby9nYU9qQXgyWHRTVkM0RytlZk9jYitVSS85eVVySUFEU2NLcGp5a0Rn?=
 =?utf-8?B?cloxNkRXK2FpU0xxZEMyT2ZwVlBSQm5vU3hiQnE0R3hVeVBUZ2JXb29jMzdh?=
 =?utf-8?B?alZXTGVGdGE0T3dzS1YwQjlQZm5OSGIrenlsaWNxQUhpSTJJakVZWlljOFUv?=
 =?utf-8?B?UU9WL3JpeCtGRTFod0FBemxJQ3EySURNamRNUENBSysrRWs1Q0RLVzJjVFor?=
 =?utf-8?B?MW9HQ3JOdmVFa1JDTWE1NVloQ0NMTENVQnVuRU5mTWJpbU9ZVUxsUk9HYis0?=
 =?utf-8?B?WmhmOWZucStMYnFUYmFhT01OWWp5bjBOQmZ0VVlqb285azAxckNzck5WRkYr?=
 =?utf-8?B?Q1hBN1VOcnBvY0VKcVFlNklxeitWbmE5RWIyZHlPU0RVeXBDNm1sVTJDVTNS?=
 =?utf-8?B?azdMMGErNTRXVStoVDB4MFM4R0hRRUV3VkdONDhEL09vMi9VYk9JOGRVaHU0?=
 =?utf-8?B?SWdKR1Q0cFVxSUk5eVdJakJyMEt5c3hDMnNzamdadTFOVm03OUh2SHQvZDB2?=
 =?utf-8?B?b2Jja3NQc2JmNzAvWWs3UDJtajI0T3FDYm5uc3U1alBaK1YwczVlenBnN0g4?=
 =?utf-8?B?SFBEU3o0bVFSUStGaE5YYTVBYlM5TzFmQml4Tjl5RG5rTnJwcEdWcGFxeEVZ?=
 =?utf-8?B?Z0VaaFp5dFp5clhNWlc0YlM1ZnFDSTQ1VHNsbkVvejlwNGgyalJsWndTc0o2?=
 =?utf-8?B?YjZZRXVuOWgvQzhPQ1pEemZpaXBEL2d1TjBKU1Q0ZS9mcEZTUmRQSjZLZXpR?=
 =?utf-8?B?SnRGTzg2Y2tEUzJSdGZYOXBwdFN4dTRXTi9EdGQ4WG1oMEhKNGwrOHlzdlFw?=
 =?utf-8?B?UXUveHBhZ1B1U3EwLyt2Z2xaekoyc1lodFBXYjIzMTh5Z09ITFVYbTF6aTgy?=
 =?utf-8?B?b29VWkVYN2hKYk9maVdhNmQySjBnYjJJcDRmZWZVenJzZFlZT1BjMk5BMzlj?=
 =?utf-8?B?dWxxSUdOY2w3SmlmTWlnYUZLaEtLQXQrUHd5SnRYbnhFY0JZdWtjKzROekZF?=
 =?utf-8?B?MHhBRUk5SG1vRmxxZHpOYTR1WGRtb0ozSEZPREowQUVFcVZQWlMrQldIWE1l?=
 =?utf-8?B?NEtPdm4wUmV0N0NSL2krMWR0V2d3TjJQRUVGYmlaR3R1UHF6Q1U4QjdNZnV4?=
 =?utf-8?B?bFp4UjB4MVpMYWdncjlBRk9oZkJ1cGpFNW5GWmRvb05hVmw2d240V2o1Z2J2?=
 =?utf-8?B?cFBxbTZyY3YrYXZZVFMvVzF6SW9mYk1lU1pVYlZrL1Y1dmR4ZHVxZHBySlBT?=
 =?utf-8?B?cmE5VkVOY0dSQVV1OHFlc0RPNWNMNHQ0bG4rbUNYQTVBZUtIWDNzNjVKK1hr?=
 =?utf-8?B?RTJ0dGZtNXpFaEtNaEwrOHFxYTBqdHFOb1gwQU9sVGVRNXZvNzR3a2ZIN1o3?=
 =?utf-8?B?WE5SUWtCR0RYcTFqZEtMK3k4U0V0K1dNMVZ3NlcyR3RMNVFQdUlySjhNTElk?=
 =?utf-8?B?d3NuWCttbVVxTTFYVWEvWnV2WmgxS0NCWmxzSXF2QkRmK2hYM0Q1aFBWbVVM?=
 =?utf-8?B?MWRwcitCdlhLNFUwbzJUSnJLSGt1dHZKRE9paU1RSiswUGJHMkVHUGYzUWE0?=
 =?utf-8?B?cU9pL2FhRTlRTXArNTk1M2dpdllIVDExbG5LYXAyK3VSNStueHl5cjBNcWZy?=
 =?utf-8?Q?C0i1Gpw1yZzgTTPJas8spmvcvy7qb6ticQTgVgF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671b5c9c-27ba-4b58-cad1-08d963ff4809
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 17:23:52.7859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbToo8vNlgmYZquxiaPXL6imWf/BWjBnZJamJgLRmgt9k7zgmxvx5Wt01b/dh10hpQrGNMTlgf5d9L2lqe81iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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

Hi Dave, Daniel,

Updates for 5.15.  Mainly bug fixes and cleanups.

The following changes since commit 554594567b1fa3da74f88ec7b2dc83d000c58e98:

  drm/display: fix possible null-pointer dereference in dcn10_set_clock() (2021-08-11 17:19:54 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-08-20

for you to fetch changes up to 90a9266269eb9f71af1f323c33e1dca53527bd22:

  drm/amdgpu: Cancel delayed work when GFXOFF is disabled (2021-08-20 12:09:44 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-08-20:

amdgpu:
- embed hw fence into job
- Misc SMU fixes
- PSP TA code cleanup
- RAS fixes
- PWM fan speed fixes
- DC workqueue cleanups
- SR-IOV fixes
- gfxoff delayed work fix
- Pin domain check fix

amdkfd:
- SVM fixes

radeon:
- Code cleanup

----------------------------------------------------------------
Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.79

Aric Cyr (1):
      drm/amd/display: 3.2.149

Candice Li (3):
      drm/amd/amdgpu: consolidate PSP TA context
      drm/amd/amdgpu: remove unnecessary RAS context field
      drm/amd: consolidate TA shared memory structures

Christian König (1):
      drm/amdgpu: use the preferred pin domain after the check

Colin Ian King (1):
      drm/amd/pm: Fix spelling mistake "firwmare" -> "firmware"

Evan Quan (9):
      drm/amd/pm: correct the fan speed RPM setting
      drm/amd/pm: record the RPM and PWM based fan speed settings
      drm/amd/pm: correct the fan speed PWM retrieving
      drm/amd/pm: correct the fan speed RPM retrieving
      drm/amd/pm: drop the unnecessary intermediate percent-based transition
      drm/amd/pm: drop unnecessary manual mode check
      drm/amd/pm: correct the address of Arcturus fan related registers
      drm/amdgpu: disable BACO support for 699F:C7 polaris12 SKU temporarily
      drm/amd/pm: a quick fix for "divided by zero" error

Hawking Zhang (1):
      drm/amdgpu: increase max xgmi physical node for aldebaran

Jack Zhang (1):
      drm/amd/amdgpu embed hw_fence into amdgpu_job

Jake Wang (1):
      drm/amd/display: Ensure DCN save after VM setup

Jiange Zhao (1):
      drm/amdgpu: Add MB_REQ_MSG_READY_TO_RESET response when VF get FLR notification.

Jonathan Kim (1):
      drm/amdgpu: get extended xgmi topology data

Kenneth Feng (2):
      Revert "drm/amd/pm: fix workload mismatch on vega10"
      drm/amd/pm: change the workload type for some cards

Kevin Wang (5):
      drm/amd/pm: correct DPM_XGMI/VCN_DPM feature name
      drm/amd/pm: skip to load smu microcode on sriov for aldebaran
      drm/amd/pm: change return value in aldebaran_get_power_limit()
      drm/amd/pm: change smu msg's attribute to allow working under sriov
      drm/amd/pm: change pp_dpm_sclk/mclk/fclk attribute is RO for aldebaran

Lukas Bulwahn (1):
      drm: amdgpu: remove obsolete reference to config CHASH

Michel Dänzer (1):
      drm/amdgpu: Cancel delayed work when GFXOFF is disabled

Nathan Chancellor (1):
      drm/radeon: Add break to switch statement in radeonfb_create_pinned_object()

Nicholas Kazlauskas (3):
      drm/amd/display: Fix multi-display support for idle opt workqueue
      drm/amd/display: Use vblank control events for PSR enable/disable
      drm/amd/display: Guard vblank wq flush with DCN guards

Wayne Lin (1):
      drm/amd/display: Create dc_sink when EDID fail

Yifan Zhang (1):
      drm/amdkfd: fix random KFDSVMRangeTest.SetGetAttributesTest test failure

YuBiao Wang (1):
      drm/amd/amdgpu:flush ttm delayed work before cancel_sync

Zhan Liu (1):
      drm/amd/display: Use DCN30 watermark calc for DCN301

Zhigang Luo (1):
      drm/amdgpu: correct MMSCH 1.0 version

 drivers/gpu/drm/Kconfig                            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  86 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 432 ++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            | 111 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  59 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v1_0.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  40 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  28 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  24 +-
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   8 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 112 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  23 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  12 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  23 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |   3 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |  96 +----
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  12 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  19 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  56 +--
 .../amd/include/asic_reg/thm/thm_11_0_2_offset.h   |   6 +
 .../amd/include/asic_reg/thm/thm_11_0_2_sh_mask.h  |   3 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   4 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  32 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   8 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  25 +-
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |   6 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   1 -
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |  11 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |  21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.h  |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  21 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  18 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.h    |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   6 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |  30 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.h    |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          |  19 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  81 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 174 ++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  28 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  33 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     | 107 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  23 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 102 +++--
 drivers/gpu/drm/radeon/radeon_fb.c                 |   1 +
 83 files changed, 1346 insertions(+), 848 deletions(-)
