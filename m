Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF3311EB9D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EE86ED59;
	Fri, 13 Dec 2019 20:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27476ED14;
 Fri, 13 Dec 2019 20:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9qn7bjLvD2O2dTo42IhmIGwXSkwqDCGp6sqSJ7pzDc48nDj/ZKuR5j3o/bqDwVDsJ6N8jzsem6wtn542iMUDVwsBFEGxbl7JSeDpJBfm8ZyOomXcaL3mMsDfmeN6CWPs7NasgRztE1KzYZbhHXiR6ldvMf0SUW0kTj4aDpMQ7SpV/Cg/ynBo2vEF33d5zVpGYEywftxOh1FH63PGCh8Ub3tYTboD0p27F38MhJblrmw579h4Flye3y39Ixoozo7SewE2Umxp3W6d8kdeV2ode6BbS01WZ0zvErlaFPEDspYp3mxpZwVlcWrNjcFX/H4448ypsL2z/NW+bgvWRqxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRzhwDo3wWWjUcrD6HWtUUR3XzFFOJx+nXqrX5apbBk=;
 b=Dxf+yOO8gWQ9ngxGLKwjWGVxhXzv9LdO8+CRbPXIKRRSaKrAhWbuoQLYA8PYFq5aVv4hAPzT1kXyUUpWM9r/MSJIwyGzoNqlul9ieSecU/NnkfGi7tbHolDjMQjJbFLZGxKjUvfuprhQLClhXnx50jncvn8sXymybARwhxrv7yvKe5nk3wGc6moSw5owlxF5LhRxwqLftu5eObdwqqdfGbmLefAnDZLcXfI1pPD4k3HO7YU+v3vC7tVorSMT808dE0FW4zoOOeeeVZBOlbqh+NINTmZejDDmzTYcIztoewdTLuvPHh/NZnvi5FcAgFZMhBaEUZQLEV/T4EM9fFYBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRzhwDo3wWWjUcrD6HWtUUR3XzFFOJx+nXqrX5apbBk=;
 b=MNwFzn7VssymXIEZosFqK0TQiQZf658SufVlCvuhx6eGn7wJ90ccrEsXx1GuCZXu4wAnQ99iN3+S7MVeNvKCMutmcfYbxs/v5evpqvmmrc6s3Y5NwUO5mEj+EwtHrVsDE759ECDtsjjb55IKyb1ZxF2Qs2MAsiCRxHf1DTEuzAk=
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Fri, 13 Dec
 2019 20:08:59 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Fri, 13 Dec 2019 20:08:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:08:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:58 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:57 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:08:58 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 00/18] DSC MST support for DRM and AMDGPU
Date: Fri, 13 Dec 2019 15:08:36 -0500
Message-ID: <20191213200854.31545-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(199004)(189003)(4326008)(26005)(426003)(54906003)(2616005)(336012)(450100002)(70206006)(186003)(70586007)(7696005)(478600001)(86362001)(356004)(8676002)(8936002)(5660300002)(6666004)(2876002)(6916009)(81156014)(2906002)(81166006)(36756003)(1076003)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4179; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4662ba5-81a3-4aa5-0586-08d780084a37
X-MS-TrafficTypeDiagnostic: BY5PR12MB4179:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4179B6B0D27B96431B109B67E4540@BY5PR12MB4179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dp8/YWvDIO5B1Fnu4jJOI+KofY27wUs4TRgbLwe+RoFXKUTIsFAHDqVzKmPw091BfDRVSHQLOs29r86SIYfARbe1T6caBURgo4jSorUAbpX5VYNBfRPhZatwWU/+O1gXTZYaoQxhczz4URQR26d6ozDvINyERevKcpvuXkSOjwJ0TezM/kywE2Uf7O9YEW2YXSnYk2ajiyAvXq+8/mTcsasARAIh8BZl1Z0P/9X8iZ0T4xKt7Le6azpv+u3SL2Hv3k82y5RIh1eTgJTH0w+PYcmoDkF8/QvMt8wEJ+FwSCX31FYgU/FJf03nxQxvIGBJ1FLHzCrPm68z6hP2PicjIf8GVoEU2n4jqWrbS1/K8BrygpR5PcHqrtrqqVt3DUL8fVvznlRsM5WGmAfGbA0oebjVlZziuabo40w6r0caQWMMIonYBiOZtsYpjxZ/L9KV4oXsxRyUNcKDGNkypwWZcccre9F4eeKQBGPR3/oecVeJ8zmAvuWWP4nexfGpjuNI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:08:58.9017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4662ba5-81a3-4aa5-0586-08d780084a37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>


This set of patches is a continuation of DSC enablement
patches for AMDGPU. This set enables DSC on MST. It also
contains implementation of both encoder and connector
atomic check routines.

These patches have been introduced in multiple
iterations to the mailing list before. These patches were
developed by David Francis as part of his work on DSC.

v2: squashed previously 3 separate atomic check patches,
separate atomic check for dsc connectors, track vcpi and
pbn on connectors.

v3: Moved modeset trigger on affected MST displays to DRM

v4: Fix warnings, use current mode's bpc rather than display's
maximum capable one

v5: Moving branch's bandwidth validation to DRM,
Added function to enable DSC per port in DRM

v6: Compute fair share uses DRM helper for BW validation

v7: Add helper to overwrite PBN divider per slot,
    Add helper function to trigger modeset on affected DSC connectors
in DRM

v8: Rebased on top of the MST refactor patches that were on DRM-tip
    Some cosmetic and cleanup changes

v9: - PBN calculation updated (preventing flooring the remainder)
	together with selftest
    - Move branch->num_ports deprecator to port unlink function
    - Added capability check for MST DSC capable sinks connected
	directly to GPU, also removed Lyude's reviewed-by since the
	functionality has changed in patch: "drm/dp_mst: Add helpers for
	MST DSC and virtual DPCD aux"
    - Renaming of drm_dp_mst_atomic_check_topology_state
    - Bug fixes after testing with MST DSC capable sink
    - More state and sanity checks added 
    - Typos fix and indentation fixes 

David Francis (9):
  drm/dp_mst: Add PBN calculation for DSC modes
  drm/dp_mst: Parse FEC capability on MST ports
  drm/dp_mst: Add MST support to DP DPCD R/W functions
  drm/dp_mst: Fill branch->num_ports
  drm/dp_mst: Add helpers for MST DSC and virtual DPCD aux
  drm/amd/display: Initialize DSC PPS variables to 0
  drm/amd/display: Validate DSC caps on MST endpoints
  drm/amd/display: Write DSC enable to MST DPCD
  drm/amd/display: MST DSC compute fair share

Mikita Lipski (9):
  drm/dp_mst: Add new quirk for Synaptics MST hubs
  drm/dp_mst: Manually overwrite PBN divider for calculating timeslots
  drm/dp_mst: Add DSC enablement helpers to DRM
  drm/dp_mst: Add branch bandwidth validation to MST atomic check
  drm/dp_mst: Rename drm_dp_mst_atomic_check_topology_state
  drm/amd/display: Add PBN per slot calculation for DSC
  drm/amd/display: Recalculate VCPI slots for new DSC connectors
  drm/dp_mst: Add helper to trigger modeset on affected DSC MST CRTCs
  drm/amd/display: Trigger modesets on MST DSC connectors

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 117 ++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  19 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 399 +++++++++++++++++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |   5 +
 .../drm/amd/display/dc/core/dc_link_hwss.c    |   3 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c  |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |   7 +-
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   1 +
 drivers/gpu/drm/drm_dp_aux_dev.c              |  12 +-
 drivers/gpu/drm/drm_dp_helper.c               |  32 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 389 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   5 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |   2 +-
 .../drm/selftests/test-drm_dp_mst_helper.c    |  10 +-
 include/drm/drm_dp_helper.h                   |   7 +
 include/drm/drm_dp_mst_helper.h               |  20 +-
 18 files changed, 986 insertions(+), 51 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
