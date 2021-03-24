Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49934348364
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 22:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D57F6EA5C;
	Wed, 24 Mar 2021 21:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2E96EA44;
 Wed, 24 Mar 2021 21:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSR2FQW/h3Co+NNCOQLNfWqhqPZo3FGZwdDiIrvyQbTYCP4WXxqbcEpNj2zS6y7l2n3F0F7SouDELAzw6IkWSteu9It9e/TP5Y0HZ0adgHMcqJKXM4c4fheFxohH7hdoc1Dxe0vWhvE+s9iHJxq0bsMDxEXXwsNtVmduZRLpzwptQoUdi2JLEa0NcksKREvrQ1ZxAjurWp1IiyiY+9fQTUfpfQak1LfvqSUoc+ylRTtOp5N1rC88F7NIIF7YJdfI3J9Td6AyXzzdLmTaFkfVMjdBmvMwmJiUlm3np8/wFVyDRrabmp7KxAyQ8Es9wjzjID8s/o+QAYisG+PugaFX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWH5t+Hm+LGsGq2rkkgDmUuoDlrpMrs3JC41itCAvPI=;
 b=Xu6C1sdCT3Cc6174di4JXnldJnBHnzc7pOtNovHsq0Ek1M1kuu0bHY70V1xagJPDpctxzq92QGhxuN6UJPNUkLwjbV3OYsTIsJxT/K3t3qQm5zM4G0rK+OIhcwrY/cq2SV9e8RXPlkQQEkwhmDsJzNmzFuCjR0s65gv170sFo7vNRhkzAL8pHYR4N7zXUyf1nPW7ZGKd4gQvYWcfGJelsjJncN8ExXT+r/jy1eYbUmkMe/5i54D3tVzyS0NXg2CYKpzt2sxaxdc6Fy0VZrMlHHP38V36/DIeQb78+j0cyuhn9tdsS8VVZoPeOcpFYyKLAFb0SrGlY+CTF457vG1cag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWH5t+Hm+LGsGq2rkkgDmUuoDlrpMrs3JC41itCAvPI=;
 b=VCSA/W1CwjKIkTZx2Vpnp6NE80i/l8Uk61R2n3z2RrW35j0Q2cQJNjYunoeuLQkiln//z/2pi5cntDpTOKyQAQkE4ZwZ8dwGMsbMDp0bUA/WgzpbZH56eivcByyGfyJ7Ci/2Qm62+BomrfLDXjLih9XBExxbtCvMQpIxqTbD3a0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4421.namprd12.prod.outlook.com (2603:10b6:208:26c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 21:06:55 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%6]) with mapi id 15.20.3955.025; Wed, 24 Mar 2021
 21:06:55 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.12
Date: Wed, 24 Mar 2021 17:06:30 -0400
Message-Id: <20210324210630.3949-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Wed, 24 Mar 2021 21:06:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebe9031b-1b7d-4cfa-460a-08d8ef08c12f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4421EE22DEDBF991D6794C1FF7639@MN2PR12MB4421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4M3Y77uBDWDU70PKX+pFwLxWYk0ldST8jyuXYNSO55ONWmF0M3Jxm65VnfwvHr7oEf5TDH74awJh/+Y2M94Li9Zh+XDfxI8arB7Z+FTnFQqTeKCvb/ZFmK2VNoHIG+M1kHDBH3L1V36Z/XEmtjcaW7/COBaZEPfeuBtW233fLh2FB2uaeOYjpDx2UUrBTsFnYkrTKmDE/jIRzKMpL5Hch5ktt6lybRbubSo1TJsu6JAz06juyiXkO0LwRsrf6DqB4Tm0p4s3/s/qQwKfsX6c8kVoYIaUbDstcR9836qiRenjDas3qOdoq2FAzicERTBmuCT9xNogqxhmFuK20hcjOJUtokbQUM7fI/2YmtG7smkC8wBMGog7WrnTyEI0ztkOg2mRPL1+f442kIgi9oaoWFrYMRTxzRh4oKxQYlZGU/qa2ElRfs8kOshBaXP6y/NOYs7p2rvzvolW35HSh2j/lepBWiWdgY8Ti62s38KhBg2GTS8H6hpMcKFkvuHGGO5pb4OPZOkkBKvlXTxM7yFA8AvvrATNJ5PjtXQR/rousHzIZFjZLeXxBcZALDeAmO5lz5HjrPysHcSKKMhKyxeENzg3t7mGSaHcNiZchokhwLTm7UEdr75ImMT1WShN5lS9P7mxcF9tiimxRplByuMSAVBl2RkeQAsQzs42f6W4407CIwW+gp4z4Ic/nJE68/XHKQmcJthQi9j5VEFAkT5aRztRX3JGAHtzHdTLAQKctY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(956004)(6486002)(8936002)(2616005)(6512007)(66946007)(478600001)(966005)(66476007)(66556008)(6506007)(52116002)(6666004)(5660300002)(16526019)(83380400001)(38100700001)(26005)(2906002)(69590400012)(4326008)(316002)(186003)(86362001)(36756003)(1076003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GI+Fu6UYFE0Z9bAaf5/Ip4xw/LhiRLaTtEEV1McU12t0YnmvRgyL+t/q9Coa?=
 =?us-ascii?Q?RqtJQMBHfqPLf5fKNN0iFps2PumPIEwP0tlC9JxwROwJplIU5XGGQA6CU6gI?=
 =?us-ascii?Q?1PwVhI7wgVxbksN2/NXMUu8xGKo5jS+EXIqOonQESfbu+jtn2aavdFjaxIMt?=
 =?us-ascii?Q?McyKhU95ImfP0+2BG5gDuEc4/JLAkeDzeor++q7Z3CL0EoLcaYUI7unL2T60?=
 =?us-ascii?Q?0AW5jC63qIY072LzH3aVAG+DKjxOtYGcaziJEen7uu8h51gSDGSsSuiyHsPX?=
 =?us-ascii?Q?joo4IIQkCZ02z+7Vet/PWUl8QtZHhMWZLklr3efJUaZSIZ6Pcfa42mLYmTJI?=
 =?us-ascii?Q?3yz2hjLNSI5k6KDXCQL4eZs0YiuN9oUOwl1zwdnhrnI0/rapz3ETyU7qQAci?=
 =?us-ascii?Q?WxpXBYxNwvE8IWYDHNcXR7gw0SYMRKzlowMb4D2cfWPr107avkajtNQh6TKl?=
 =?us-ascii?Q?QUcfBsBDgfyU1wE5Nsyn8MP3hKAz0uDzWv3wGQ2flF9KRdilfNxDDH/BUKU5?=
 =?us-ascii?Q?6zjumISOzrmLoyVs47XdU14xSJc9OiZIMoHNYsDNGW2C+KD0w25j3jVE6zNu?=
 =?us-ascii?Q?SHrAnX5gaegFZ50OMeMVSJ8ty5GjmR6di4njHmmvpFxNMh67lSoXqO28nbhF?=
 =?us-ascii?Q?HdfMFKA22C6BYzSHONScVNTSSnWIZcJbrhmo1DN2vXuVzDDHy3+2jKfhGJbW?=
 =?us-ascii?Q?huEF3TbfkovwhvlI4A3Q5mKXKSqxyar9de48aNrttpqam17rZcSyqKw96Ajq?=
 =?us-ascii?Q?Ziq4sZUAingwze/CktkNiBcXu5Y+VzD2vVeGsJkC8F+wofHtV12KxQJkn2xe?=
 =?us-ascii?Q?M/pgmsJDakY6qoMr79HpkxysL8LYS9RMciE01+a6TTTqVN9Ek6GbEPvta9Mq?=
 =?us-ascii?Q?mw+tDvWk3B+hu4gajyyfH89IXvsy0bYol4gTEmuh8GzSKg5r5NXPWXJL4eBs?=
 =?us-ascii?Q?0Y7qvUsK8XTlSTf349HPEjIW9w13XXiXT0XM4eeZEYzhmnZGQYK/AKX9Fq7j?=
 =?us-ascii?Q?LJSC5/CzdX2mJQTO5kdfNRBc2taK4zK/M2qQkpfJwehsfe/LUJbn8HIcwy7R?=
 =?us-ascii?Q?d0mFYDfV+S9/vewv1Le2aOIcfwWYWvLmPaFequBSFyrTJYWbg0bNWfVRBfaD?=
 =?us-ascii?Q?/b33V4P/QD5b6+m/6ibNUjAW2taeFO5HKj9kbtJg3XrkdgYGOYBHmzFXQaBQ?=
 =?us-ascii?Q?N2ui/LgV3klA/lny05oihXjcuUHNs01d1Lsjw9f6NpP0CprsTS7SUT2EvgJR?=
 =?us-ascii?Q?3A++KEG6kjoCof5kYVwInHNAayOOiQfzv+X0cKwgHb8+344KkV9zfmSsTRe2?=
 =?us-ascii?Q?TM3s7GCmJyEQnHdrGF/BH84J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe9031b-1b7d-4cfa-460a-08d8ef08c12f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 21:06:55.4664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7alW7M1gYTgyaZc8AAwkcy3e7N2hW6geDW92EHcBs8K65Ato6Y63CSg/fGujz9KTdNjua1lMqRPhSlfPx4kD0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4421
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.12.

The following changes since commit d27ce83fa4baa5cb908a42e9878564cad6ea0eb3:

  Merge tag 'du-fixes-20210316' of git://linuxtv.org/pinchartl/media into drm-fixes (2021-03-22 13:49:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.12-2021-03-24

for you to fetch changes up to 5c458585c0141754cdcbf25feebb547dd671b559:

  drm/amdgpu/display: restore AUX_DPHY_TX_CONTROL for DCN2.x (2021-03-24 00:30:57 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.12-2021-03-24:

amdgpu:
- S0ix fixes
- Add PCI ID
- Polaris PCIe DPM fix
- Display fix for high refresh rate monitors

----------------------------------------------------------------
Alex Deucher (11):
      drm/amdgpu: rework S3/S4/S0ix state handling
      drm/amdgpu: don't evict vram on APUs for suspend to ram (v4)
      drm/amdgpu: clean up non-DC suspend/resume handling
      drm/amdgpu: move s0ix check into amdgpu_device_ip_suspend_phase2 (v3)
      drm/amdgpu: re-enable suspend phase 2 for S0ix
      drm/amdgpu/swsmu: skip gfx cgpg on s0ix suspend
      drm/amdgpu: update comments about s0ix suspend/resume
      drm/amdgpu: drop S0ix checks around CG/PG in suspend
      drm/amdgpu: skip kfd suspend/resume for S0ix
      drm/amdgpu: Add additional Sienna Cichlid PCI ID
      drm/amdgpu/display: restore AUX_DPHY_TX_CONTROL for DCN2.x

Kenneth Feng (1):
      drm/amd/pm: workaround for audio noise issue

Pratik Vishwakarma (1):
      drm/amdgpu: skip CG/PG for gfx during S0ix

Prike Liang (1):
      drm/amdgpu: fix the hibernation suspend with s0ix

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 132 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  89 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  31 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |  15 ++-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |   3 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  54 +++++++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  74 ++++++++++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  24 ++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  25 ++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   5 +-
 17 files changed, 365 insertions(+), 142 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
