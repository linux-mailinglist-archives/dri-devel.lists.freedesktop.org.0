Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB531A93C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 02:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB246F3DC;
	Sat, 13 Feb 2021 01:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6D16F3DC;
 Sat, 13 Feb 2021 01:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dz3HOWKQgPKD1k57IBFV4yNr14M3oWCpl2I4YwFXY1Uw0RgDgc2CWca5/YOh+/SKcqj+WJ/6NbY0c0DR7jak9CVfPijEh2ufmYP/CGINBALMpXjJFlmIXjvPcAZsSkeGvGhx9DGZMyM3MgEwlZrYjEbX+nY0nkAqickgwb4qpQUcOFI7x1VzjpWme3whqj7hgSyayUws9QdxYrCOZNW2d3pZ4OPT9LeJ1z1BabFjlxoT5VCt4l/UKsmU+seQ3YJvM5sRQxOayEYU5qTz7c4pO7SzKRyR9Q5iGFGuhc8mz3dUzYjyVvBSVP4oCg51BlEBHYgp6lXZC0OjB0CGLlykfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMuHFEett2j8oM0DbMMgOsf61fZLqgKEr9QTgx0P4QA=;
 b=MFQxS2yKtZLX8bKRJjVfqIn7V8RJluq26mDlPEG+cXfldp3tgG0lwAAqndnT3/JdV4PHoLqHiKX87KX0tVtuqEjFTtNl2LbDUXejcwpqynKJZ8U7tlmBiGYIaCl9inFXmDDnfWxFIq5XyE5G+wDA0WubHGd4vCm6AXGZqbYcZBffGwiiFZJigMTDfh43xDJe04NDvGfysvK2biClhlksU+GSQxNTpVwluXBrGY9YbybJx4wf/UlOsJqs1kR85MPg2M8PKgO6lMbWAXLIrR7P8mInx5v3FUZf1HRK9+VcbZUYsPYylizsZoYgFHLSBqykX+0s0kkaV2076jHRRkyB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMuHFEett2j8oM0DbMMgOsf61fZLqgKEr9QTgx0P4QA=;
 b=ph05LPEgCsYdcPNtpCmUgG2rwtDoUOBa8GfY2rM81RVo+y9pqSkW/ktnPDaES/9tYKLVrKCrawNnBcSuDTIKnZrbLEE+dWGR8rjN4m0TFmf6XnYHacTr4PuI9vUy1zkHh0KoSzVGuXMQFNTbXT8N8IF17JnA0iwVyJ4O2GdKrdA=
Received: from DM6PR06CA0063.namprd06.prod.outlook.com (2603:10b6:5:54::40) by
 DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Sat, 13 Feb 2021 01:08:30 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::62) by DM6PR06CA0063.outlook.office365.com
 (2603:10b6:5:54::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Sat, 13 Feb 2021 01:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Sat, 13 Feb 2021 01:08:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 12 Feb
 2021 19:08:28 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 12 Feb
 2021 19:08:28 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Feb 2021 19:08:27 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 0/3] Freesync video mode optimization
Date: Fri, 12 Feb 2021 20:08:24 -0500
Message-ID: <20210213010827.261272-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e93ccd-6b99-43ef-6e17-08d8cfbbdfef
X-MS-TrafficTypeDiagnostic: DM5PR12MB2583:
X-Microsoft-Antispam-PRVS: <DM5PR12MB258369E54F8092438574DDE18B8A9@DM5PR12MB2583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oD5shF55GCSyvo0HbF4Wc2PpsxOy4dRw5F+NRaThwDfrebcv08EVmR3ymmBqWpjr4+X6CMdM5kXb49g9pN/2EE0mrK4eMA7jKO1j2dvHWMXBTuRm4sc92L7xhhQ45hvVHtr22jMHCETdcobRnKrNxEFoJgJoGxx1bCx1vwuYQzQXQG0+rBGPaH8f4LCFAG57VePW9+DqCtKqFn0hgm722p3QT3x6ieEpmhWayizHdUBWEK65gqegVf1Yu9hb6uf3Bq2F4pC0EtWafVpmjJVUNJwJnbNftO79a8dO5npos0wy1xR2SZU18pAOHCQbTSvaRdUdh0fvJoeMR2QVAHTdiq++XuEhXpUWbsORf+xdriWIy1zX6Kge6go3IDrFmcmHveQJ4t3ZPIzpQbgJN72lzEr4K60H9UtrgJ2ic1EAhkw7o+NbB+tTroLSjgusewAcCyz+urqYgf9pONj2PHWJNNTcRvZmdcaEMzp+NDUaqXauXV0KictUL4uyPc8X0nFNy/iK2dHT0W5MedU0EcgOe1I9z6u0h3D5e41oJTztGPkqWqBOm9HlDKvitH3hZ8onCIaqETs2Nbc/SkWHu76+H5sNkWvr5DHLfT7QQmfbUJAWM2/isYEGgmwrs+GS/y7uPVThxEGPrLnlj2sV9wbR3iu/KIdlhSwJOe1ICRYsEizGDU0DuwRLLJCAWf5y6j2H
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(4326008)(47076005)(70206006)(110136005)(8676002)(356005)(2906002)(450100002)(83380400001)(54906003)(82310400003)(70586007)(478600001)(82740400003)(1076003)(2616005)(7696005)(6666004)(36860700001)(86362001)(5660300002)(26005)(336012)(186003)(426003)(8936002)(316002)(81166007)(44832011)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2021 01:08:29.4720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e93ccd-6b99-43ef-6e17-08d8cfbbdfef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2583
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, aurabindo.pillai@amd.com,
 wayne.lin@amd.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in V6
=============

1) Skip modeset for front porch change
  * Minor optimizations

2) Add freesync video modes based on preferred modes:
  * Remove edid parsing and use the already parsed valuescached in dm
    for the monitor's freesync range

3) Add module parameter for freesync video mode
  * Add info about potential higher power consumption when using this
    feature in the commit message as a rationale for keeping this option
    disabled by default.

Changes in V5
=============

* More info in commit messages on the rationale of changes being added
to the kernel.
* Minor fixes

Changes in V4
=============

1) Add module parameter for freesync video mode

* Change module parameter name to freesync_video

2) Add freesync video modes based on preferred modes:

* Cosmetic fixes
* Added comments about all modes being added by the driver.

3) Skip modeset for front porch change

* Added more conditions for checking freesync video mode

Changes in V3
=============

1) Add freesync video modes based on preferred modes:

* Cache base freesync video mode during the first iteration to avoid
  iterating over modelist again later.
* Add mode for 60 fps videos

2) Skip modeset for front porch change

* Fixes for bug exposed by caching of modes.

Changes in V2
=============

1) Add freesync video modes based on preferred modes:

* Remove check for connector type before adding freesync compatible
  modes as VRR support is being checked, and there is no reason to block
  freesync video support on eDP.
* use drm_mode_equal() instead of creating same functionality.
* Additional null pointer deference check
* Removed unnecessary variables.
* Cosmetic fixes.

2) Skip modeset for front porch change

* Remove _FSV string being appended to freesync video modes so as to not
  define new policies or break existing application that might use the
  mode name to figure out mode resolution.
* Remove unnecessary variables
* Cosmetic fixes.


This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default (due to slightly higher power consumption). Enabling this
paramters adds additional modes to the driver modelist, and also
enables the optimization to skip modeset when using one of these modes.

---
---

Aurabindo Pillai (3):
  drm/amd/display: Add module parameter for freesync video mode
  drm/amd/display: Add freesync video modes based on preferred modes
  drm/amd/display: Skip modeset for front porch change

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 369 ++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
 4 files changed, 349 insertions(+), 35 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
