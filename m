Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF45349BE9E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDCB10E58E;
	Tue, 25 Jan 2022 22:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088AD10E58E;
 Tue, 25 Jan 2022 22:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0QrS4aKsR3bxHwLZhXGHnemu3JYn7gsD/lYAez6LuGk1u3LLOumLy7NyB5lICRJB2R341J/d7Dg5VJDAXjdZTu3gcI/UWwg01vpXYOxCWN9jqBHD9h3SsWj4PBUBtC4oO2a/6+DyWyoeGJIB43MFfuEPmcp/Zc+vlr2/H6xCEO015CgqLv9ziymSKTQEsqDWdspu24qA7BiPP5JlzrD/8kGKgfAMhAQZ7hlF7Oo98ZvZwXetN5nxRwlzqZrbFD4//NNSWF0GqKNSTen+X0e9s9mxVfdTjL1kspFV9yMgYG64+XSbM+rt9MJ0rmGMQSmsUOE9rYu6tsQrcbolyk5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9PNSwdHH2QjPGnjsfs/SGczVGN2L5mFIqUNdMaQMbI=;
 b=UQOF1b+ygrHGsGlK60paAP5pUYPweDW/JLVGVmO2ug5Xd46hJBb4qroX2w9QdlAAGsFux5LsLqxib9pxHS/PAxzY7/OohAtsMEmjr8Gig9taT2ZZGtdl1N6g5hRWSeV0E87XQFX+RdldSmiTOdui5Y98ROrNuyGxDKEAYsbhx2+ZtOKJXh4ca3USDtWQkTs6I1WNpfiU4cO2otmhsVHGNdDd2CPERU+YOm9O1pF8AV7ZnCQLpn2zG7/4gvU+tbK77q0XyBoTZlNs0xv9S+5SVm33Ov8tVrUzvv38VxkjA06jCYNPaqa5OopRe3Ng20qu0BmwfZnZHj2a2egOpCb/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9PNSwdHH2QjPGnjsfs/SGczVGN2L5mFIqUNdMaQMbI=;
 b=qUtccYAR1rimHJo7tubmGElAO2OFSxUqOx5+SPCXkgOobFhnymCSCi30V4PAdAoy9LPyppO6LZtXpGo6lyTksUwOPByeCtn1tZGVxRkrc/P+TTRYpDCci9Sg5dJcd7Ude5BMkob7S6/kNonmDgOj2CuysHfxvFt9k6fElj1GntA=
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by BN8PR12MB3028.namprd12.prod.outlook.com (2603:10b6:408:43::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 22:38:16 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::e0) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:15 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:13 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 00/12] Define and use reset domain for GPU recovery in amdgpu
Date: Tue, 25 Jan 2022 17:37:40 -0500
Message-ID: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5dcc040-759a-4ed5-d2a4-08d9e0536082
X-MS-TrafficTypeDiagnostic: BN8PR12MB3028:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3028EDDA4244E143CC7AA1B1EA5F9@BN8PR12MB3028.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hs5PdSHFAOp/0xAS0g3aRN5bgNz8Mokt1QUOtGvkL0RFcAQdhNFCOWHqbOv8ca/kDwC87lGnmTaafXs46eRlw3/hZXXQ5sBfboqctz4ZBL+AtKmolYtEeGEwU8w4ZuLgt/4ZZATA5UN50zfMNJJ/Kqrc3Jv11uIoAM/2lmWP3ECA3dbNR+laaKCJKydlNByBQ0G4SRzgyK9F0AwVKJUPQ2foA6WBMsFm7i1yyEFS0hq/u7gZhepr7ZTOMXwVpnLipjWlQaXJXrKWIXPIVbkGJTG+UcDcs+v7JCNRsgGr/BNf9awzV1n4WpmToFC2+yhH1U9Cjevfvnuyda7mr7Wvgrr+1KDKf27fzlH08JW82ep2TpAY61QLTD+g+dDrCJ9Kzmop0G8RkbAE6q72b7+xjB1J6HUpwd1WwQJ+0eeeVn4y7qjHTc24Ipx1FRFE4n1mJBjrMrAsSQUM7mUX1Kf5oBkqGRfs0/mt3QXaVhrwu7wlMPwc3R5P3iJmqi/n4dbhgEgXROBcykNgWHohdFLkVUNiXC4iL3VS3NepOdgHf+W12tcAzkgTypKIhEkm+GKvqy6jJWL+zcKOqMr6kDoRF6AcEcWd6aG1xpY1B3A13t2la0Naumv8U7719Y3Z1dqW5wxiGZxM5p4WKXwfGPsNhJcU+3DtrGASlvZL3XA5fvTNdmBc1tF5VNu98XbQ01fkfHXpW51TOq/aQcKtwv45gS4s94eOs3wI4T6idzJ69QuFOQ+0MfSOqyg7IDYhlcjwHwgGMwPYajeV8TwnBYr2YoaGtnXqsj9Emas6S/nJjR6BnbSznOKI7aXEHhC1vhAvGwEblcTYap7ns3pmWvj8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(508600001)(54906003)(36756003)(2616005)(110136005)(47076005)(36860700001)(16526019)(316002)(186003)(26005)(966005)(336012)(426003)(70586007)(40460700003)(1076003)(5660300002)(82310400004)(81166007)(7696005)(6666004)(356005)(44832011)(4326008)(8676002)(8936002)(70206006)(86362001)(2906002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:15.4792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dcc040-759a-4ed5-d2a4-08d9e0536082
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3028
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on earlier work by Boris[1] that allowed to have an
ordered workqueue at the driver level that will be used by the different
schedulers to queue their timeout work. On top of that I also serialized
any GPU reset we trigger from within amdgpu code to also go through the same
ordered wq and in this way simplify somewhat our GPU reset code so we don't need
to protect from concurrency by multiple GPU reset triggeres such as TDR on one
hand and sysfs trigger or RAS trigger on the other hand.

As advised by Christian and Daniel I defined a reset_domain struct such that
all the entities that go through reset together will be serialized one against
another. 

TDR triggered by multiple entities within the same domain due to the same reason will not
be triggered as the first such reset will cancel all the pending resets. This is
relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
those will still happen after the in flight resets finishes.

v2:
Add handling on SRIOV configuration, the reset notify coming from host 
and driver already trigger a work queue to handle the reset so drop this
intermediate wq and send directly to timeout wq. (Shaoyun)

v3:
Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain struct.
I followed his advise and also moved adev->reset_sem into same place. This
in turn caused to do some follow-up refactor of the original patches 
where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive because hive is destroyed and 
reconstructed for the case of reset the devices in the XGMI hive during probe for SRIOV See [2]
while we need the reset sem and gpu_reset flag to always be present. This was attained
by adding refcount to amdgpu_reset_domain so each device can safely point to it as long as
it needs.


[1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
[2] https://www.spinics.net/lists/amd-gfx/msg58836.html

P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.

P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.

P.P.P.S I wasn't able yet to test the reworked code on XGMI SRIOV system because drm-misc-next fails to load there.
Would appriciate if maybe jingwech can try it on his system like he tested V2.

Andrey Grodzovsky (12):
  drm/amdgpu: Introduce reset domain
  drm/amdgpu: Move scheduler init to after XGMI is ready
  drm/amdgpu: Fix crash on modprobe
  drm/amdgpu: Serialize non TDR gpu recovery with TDRs
  drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
  drm/amdgpu: Drop hive->in_reset
  drm/amdgpu: Drop concurrent GPU reset protection for device
  drm/amdgpu: Rework reset domain to be refcounted.
  drm/amdgpu: Move reset sem into reset_domain
  drm/amdgpu: Move in_gpu_reset into reset_domain
  drm/amdgpu: Rework amdgpu_device_lock_adev
  Revert 'drm/amdgpu: annotate a false positive recursive locking'

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  43 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  39 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
 16 files changed, 313 insertions(+), 199 deletions(-)

-- 
2.25.1

