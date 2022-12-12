Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87164A6DD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33B410E257;
	Mon, 12 Dec 2022 18:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5A10E24F;
 Mon, 12 Dec 2022 18:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH0Kj0BRvBupkhGzzHbw9HJNWJoQoNf1FBSuJrxc1iS2SyyBGPGTUANhTmUOCH6wb2QBatoWiZu4Pjz3mN+OzSNFOGPIZ3vKwEOQyMDlIZN6ltIZOdn/MIa35Axsi5oDVhKkT5lIdTURopW/3ngIkGIjDMYrmYf8IvvLAQQ77y1ejd9Q7vUW0wrjNT/HBaib9zD0M3SmBE2SDDBmnO04vtVfmcHmhYwMTveP6FIFTWnspxQ5hJ0CuLeCQqg/5WylQdVFiOi/JIi9zoU/VWdoOLQG1rP+6wHxfSZJLnEfTc3M+69ARSqx7fcNJLE8/nKPf14P+c7e6TIwJ5NhiyxMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek5OvmwN/ue/6vZJOyT37vtJlRrImrf/xyNj57Cg3oE=;
 b=E/6auG8XHS9+POoZxTMbC3Ly0mosLn9RbtnPRyncPQi0cuuUeN4v8d0WpHjzyxwCZsb2DfFQy9rE9sktDnqh+MPfmhXQ3kmcFWuD8mSWaaorlYTSUyPsCVz4CBQ++ZH6wwU0a0u3sWqMmHSRWVQSZHY8ZRU9DpByYWpxcq0fhq4CHrQ0VoVFTXkX6rh7gNltrqBd/JSvNZ6sVZZZihGxt6wpsS6NMJUSdmBnIWE3gA5sLI78HddiPi/ULzErCvVLRzFMRAT5fWV6vLtfN1A93ikwnDqUxagYlVNKj/SlJzfXr+RbjjXP4Cl15e6hdUejdVDpPXRu6bInwVRKadAfzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek5OvmwN/ue/6vZJOyT37vtJlRrImrf/xyNj57Cg3oE=;
 b=c0TvAVbvVN+aGBYgZMHlPGPS2NOpFWxGOMfwkledfQSXlQhJBI1Y/YsJCZmOneSxX1OJPQ0jw9n84wsTA+vzuocUIPvmkh07uu9m2k307K96M//IjrDypqG63tibdAg/1G1n+pyQNXA/Kk+f0Cb1b8ghsiLCIfRA5UKTQURQ7bI=
Received: from DS7PR03CA0005.namprd03.prod.outlook.com (2603:10b6:5:3b8::10)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 12 Dec
 2022 18:22:05 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::ca) by DS7PR03CA0005.outlook.office365.com
 (2603:10b6:5:3b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:02 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:02 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/16] Enable Colorspace connector property in amdgpu
Date: Mon, 12 Dec 2022 13:21:21 -0500
Message-ID: <20221212182137.374625-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT092:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b466fa1-f475-4aa2-787d-08dadc6dc5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJ+PKHv2AieZdb7WpCv361dJXfHi4HH9uiwyBlkr66C3Pcjbc1r5GKu3EBfdsNF+sbKX9W33v5T6wc0gncRaXpuktliviSNmTCEmLfXgeRCaWIL3cZyKvu3BqvQTNcHwFWww7/E4hyLUlgDzjT4gT4hVljkRJ/Ao0RoZtxVZc0WzJpO1d2LrScvsNxstRVhn6+NC9BYTZTGhkaoX2dJFwCwskd6Qaae0l8daLE64mXLjfuZOqR+b++x/kSkx6EOB429OtQufIhwYwuuku1BnZeXhDGXBzG/P+5ycZR7eK+z3cIj06iWmXwWfg+ymeT6y3h+LRY4KUlPOp7oSzbvNFgwbmSV8RMbdVZzC6FGRUqxB24p2fqnXV0cClxlAFqDoC8L08cXoaXtlnf4+z82KOroACMod+V9skoiO8Zuc5P2MU3gVJtQGVOpzbjl4QFeV+2PvgYQMTwMELr4R3bvZPoyzSVzmgQ4eIMPFxb1j/CblWA7JHaqpb4sVLn48HyC4oJi0rY536MyYdoTm3fO/GmrzwRrRp3FKg/c98kaSusTwe8bHs2FOaFQ9vGicKOzp9k3CQ5iEiqhTbdR7TTRVs5F8/oN8Vz5nszZnWNEb6+6vQBFde1W+AfNOmkaWZj5fNlHeE4gZgmfSCNKBR9v7UFOg28KyY6b9hFVTFFX1s2zqXtb+ovMuuWE8h962dQ03
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(2616005)(40480700001)(66899015)(1076003)(82310400005)(6666004)(83380400001)(966005)(7696005)(316002)(66574015)(186003)(47076005)(44832011)(5660300002)(86362001)(36756003)(26005)(2906002)(8936002)(336012)(70206006)(41300700001)(36860700001)(8676002)(110136005)(40460700003)(478600001)(356005)(426003)(54906003)(4326008)(82740400003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:04.9570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b466fa1-f475-4aa2-787d-08dadc6dc5a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset enables the DP and HDMI infoframe properties
in amdgpu.

The first two patches are not completely related to the rest. The
first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
unknown in the kernel.

The second one prints a connector's max_bpc as part of the atomic
state debugfs print.

The following patches rework the connector colorspace code to
1) allow for easy printing of the colorspace in the drm_atomic
   state debugfs, and
2) allow drivers to specify the supported colorspaces on a
   connector.

The rest of the patches deal with the Colorspace enablement
in amdgpu.

Since the Colorspace property didn't have an IGT test I added
one to kms_hdr. The relevant patchset can be found on the IGT
mailing list or on
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorimetry

Since I don't have a DP and HDMI analyzer I could not test this
end-to-end but someone will test it in the coming days. We'll
refrain from merging this until we can confirm the DP/HDMI analyzer
shows the correct infoframe.

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org

Harry Wentland (15):
  drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
  drm/connector: print max_requested_bpc in state debugfs
  drm/connector: Drop COLORIMETRY_NO_DATA
  drm/connector: Convert DRM_MODE_COLORIMETRY to enum
  drm/connector: Pull out common create_colorspace_property code
  drm/connector: Allow drivers to pass list of supported colorspaces
  drm/connector: Print connector colorspace in state debugfs
  drm/amd/display: Always pass connector_state to stream validation
  drm/amd/display: Register Colorspace property for DP and HDMI
  drm/amd/display: Set colorspace for HDMI infoframe
  drm/amd/display: Send correct DP colorspace infopacket
  drm/amd/display: Add support for explicit BT601_YCC
  drm/amd/display: Add debugfs for testing output colorspace
  drm/amd/display: Add default case for output_color_space switch
  drm/amd/display: Don't restrict bpc to 8 bpc

Joshua Ashton (1):
  drm/amd/display: Always set crtcinfo from create_stream_for_sink

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  86 ++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
 drivers/gpu/drm/drm_atomic.c                  |   2 +
 drivers/gpu/drm/drm_connector.c               | 181 ++++++++++--------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_dp.h                  |   2 +-
 include/drm/drm_connector.h                   |  57 +++---
 9 files changed, 261 insertions(+), 138 deletions(-)

--
2.38.1

