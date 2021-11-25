Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74745DD9E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617E96E974;
	Thu, 25 Nov 2021 15:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C516E954;
 Thu, 25 Nov 2021 15:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWfhY8rq1eYyEojiw+LUlShxSYeCIH1/Om7xxYdGNMXn4AA3kmkpg63TA+g4AQNJCQOx5I4oZx+4glEge7qZObVviy7VoNSZLR684A8vm4INhqChtvtmUTwrz9yVK1SrXdIyrXSf+f1ZFR5ZOwAPn4i0MINnq+tyl+sGx/6HYHT/G1J4qZLGXQNWWlViFt/ECSRrKdpTGRF/qPxNoQwPXhT2SMKIW/O8gO2woHaQU+MMcn5BWmR2mw8M6uFclWGjU63XKifb0JPlmq4LBVFvY3nIQCZAIEummhCGNn9ig61x1jpaDO/2FtLsdpq9HoY4KBZT6vCgHGWC2JOvWuPEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxP4RnWr0nUV+m7Ry8/qHnAZjW3mPvTijhXhqgc08Xg=;
 b=lFyZtLAdhe4L28wAroAnEWuetbFqiZow3FDFihBlUcj8fibGjEEvxc95zSzFwvjhGqx1drAdLMBDDo1+5S9SRtD5QOWO057iZ1Of3Fd5+2yXbSbZr99IG3I4X+apdRgWV4ejK3auRzc6pmUl0Di890YZ3VvvfFV+VxZvrcji9HAmcL/RRIxL44UPNWpRCUKdKu56xDJZ2FgN3LY1b5CrrDk/GGIDI3UKBp7LV4BAeVJe2A+Af2sAZsReckaHunAlNkrKnzxUAjRzBjtHy1hVxXZcGoXt2sBoxhUlk0ykCjyvp7mw2jUfb8b348t9dCRGUaiTZjXsyzcwyTiqT1cLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxP4RnWr0nUV+m7Ry8/qHnAZjW3mPvTijhXhqgc08Xg=;
 b=kQOv8EtVJzs5jy40+jJdVf7DoRftGymKuFhfEezAvZXuYfOBR6BTNWVt31tXj0tOjPj5UaihXuAlGW16hV89o5y6bVtx3rzfMddFDj9lRiKBf+PID7n0vwXT2OnqM12d62JQOMB28AS0MKVuirF8tUYmnas1WL0NdSljkgGF+xc=
Received: from BN1PR13CA0007.namprd13.prod.outlook.com (2603:10b6:408:e2::12)
 by MWHPR1201MB0015.namprd12.prod.outlook.com (2603:10b6:300:df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 15:39:33 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::7b) by BN1PR13CA0007.outlook.office365.com
 (2603:10b6:408:e2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:33 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:31 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 0/6] Expand display core documentation
Date: Thu, 25 Nov 2021 10:38:24 -0500
Message-ID: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce683bb-992c-4eb5-0715-08d9b029c736
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0015:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0015CAA7BDD5BCD38F11609D98629@MWHPR1201MB0015.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0YFS3gd3JivMI4UKNAfxlEBOOdwh7YhAmlpse+wNrDi4OMFUm3DzbX/nyTLD4Az3FMXjAs2oi1ZCrx1qFiJTwfjflQ5zQTrrtSbYP4PUqwUNVI6ma8I3vAYmdCLIvOPqbtvv2ZsubbhkI/H+htxWSdZXO5WfGrexibCYKOARFyr5X3Y0ks8YERoZzal2bcPVByzT6V0bptygec8lfjh1ZzGAJS/le2W5Igt5QVVk2dFeSmIgQ/pHBf1dlt64EgnlS61P9fBDsFN4v2W/4NmE67UK5krewyyJQu1Pdi7pTgXAV69L9DqMAGiYfFjbeX3dckv3VMpRjmiAS0/4s6RbQEeNGB//hOZI+N0NkU1gKGcZkH3o4XRqlCma0slYvlarQ6+TaK46gtgwJEenT8e9NuSXboUpvKezuNnhSzDMv7rfZtkWF1TrivNiERMvn8LRmhJrYZCtGz0LfJKwN38aJ5qBqbl/+JvgWS420s8BFVAsvI4isrqBrA+idRtUO90t2gxHgnm7IU8LwaazTOETUjmMgNnlI+YXsXss0lkU9St2+4JWRoWX1VAOcsoul2zQ1NQdV99jdKPvDEbdH9WP94cO433+nZ8EY/2MYtmLp0VOzGTM4V7RmkY9dadCk146tIrfJGARgY2/PgrlRpPpsGeFZtQe3PryK/eSx2TAX0iDnFWdCC9RyjXGE2DDf7r8bXEDZBNh9Q2w1yRpjaEv+2hvOfs0d3mIrfynAUndZjn+ppjOrATuzaZFJ/nFk9a
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(508600001)(8936002)(36860700001)(426003)(7416002)(110136005)(81166007)(1076003)(82310400004)(86362001)(83380400001)(47076005)(16526019)(70586007)(921005)(336012)(54906003)(4326008)(6666004)(26005)(356005)(5660300002)(316002)(8676002)(2616005)(36756003)(70206006)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:33.1546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce683bb-992c-4eb5-0715-08d9b029c736
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0015
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Core (DC) is one of the components under amdgpu, and it has
multiple features directly related to the KMS API. Unfortunately, we
don't have enough documentation about DC in the upstream, which makes
the life of some external contributors a little bit more challenging.
For these reasons, this patchset reworks part of the DC documentation
and introduces a new set of details on how the display core works on DCN
IP. Another improvement that this documentation effort tries to bring is
making explicit some of our hardware-specific details to guide
user-space developers better.

In my view, it is easier to review this series if you apply it in your
local kernel and build the HTML version (make htmldocs). I'm suggesting
this approach because I added a few SVG diagrams that will be easier to
see in the HTML version. If you cannot build the documentation, try to
open the SVG images while reviewing the content. In summary, in this
series, you will find:

1. Patch 1: Re-arrange of display core documentation. This is
   preparation work for the other patches, but it is also a way to expand
   this documentation.
2. Patch 2 to 4: Document some common debug options related to display.
3. Patch 5: This patch provides an overview of how our display core next
   works and a brief explanation of each component.
4. Patch 6: We use a lot of acronyms in our driver; for this reason, we
   exposed a glossary with common terms used by display core.

Please let us know what you think we can improve in this series and what
kind of content you want to see for the next series.

Thanks
Siqueira

Rodrigo Siqueira (6):
  Documentation/gpu: Reorganize DC documentation
  Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs entry
  Documentation/gpu: Document pipe split visual confirmation
  Documentation/gpu: How to collect DTN log
  Documentation/gpu: Add basic overview of DC pipeline
  Documentation/gpu: Add DC glossary

 Documentation/gpu/amdgpu-dc.rst               |   74 --
 .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |   77 ++
 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     |   29 +
 .../gpu/amdgpu-dc/amdgpu-dcn-overview.rst     |  168 +++
 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     |   42 +
 .../gpu/amdgpu-dc/config_example.svg          |  414 ++++++
 Documentation/gpu/amdgpu-dc/dc-glossary.rst   |  257 ++++
 .../gpu/amdgpu-dc/dc_pipeline_overview.svg    | 1125 +++++++++++++++++
 .../gpu/amdgpu-dc/global_sync_vblank.svg      |  485 +++++++
 Documentation/gpu/drivers.rst                 |    2 +-
 10 files changed, 2598 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dcn-overview.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/config_example.svg
 create mode 100644 Documentation/gpu/amdgpu-dc/dc-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu-dc/dc_pipeline_overview.svg
 create mode 100644 Documentation/gpu/amdgpu-dc/global_sync_vblank.svg

-- 
2.25.1

