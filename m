Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805B46677A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C696FA6D;
	Thu,  2 Dec 2021 16:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AFE6FA5F;
 Thu,  2 Dec 2021 16:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdyNEiJhQ2i9khxKiQqCtebw94FdpV4JTwWmt6WPNBdmFQ9fnJNfH+j/MhCZNHfKqL6CvuP3Wabe5grpnRU/JosE3LdHHgQH8MeUQY59WRLJAvB7H7cid0ry2/luFH7tfBDLpR+/L3C0Y9ehP/B5L4zptTYcacSvnsbVYq4Cf8SkMz8IT+qpap5TMXSbxGiouyGxlBgaLhUxk3jFbk3yRnURpj/QWPcexzZeFZfpuoFefaJ0USZeYdDIDXxUwdfFScgaBWq6TzAgDZ2W/yGyNpFdz/Y+OZiMstJTYHtn3gotTVurCKMwj/NAix8cUYc/UfkglVgebNyEL3NU49z8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=PZE1VglZLccNThr6zBWL5yVseF3A/TGoiSL0/Aj2CJWRWSIXCDX34K4MPWgpr6ssNiYA6/fVlg9aTDhDJMfhKUrKcbsSCym7+vSyfpFxYTanhhlP8WAJZHzL9cextu/lbXRHfbjZY8DDV2u9klglrjiYxFGOPmSy22W71ZJemqLmEUsSCjEo0IBpEpoCon1aNU1LgCsLk5YcEIeDOwBg0qCCZYnplRMhR+ZwMbvM17wdSkEvHURYIl+AVgCZhd7JAmjWok18soE+aV44qSbuLgjVOGRhsfR2GqSDYoLLHQc39b2YCA0iDWk4cXcJY68JCk28pegwDmGjs2+vpSz11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udUHp7cOVfN39epaKhTDE6ZCY+Q3pzyowQiKKO19vbc=;
 b=GSMU2Bo9EqP/nBT3Qw3pm4yqiZcIoBxMSC/3MxOvDSLvByloEKuR/ScbSiCSOd3AZoDQyLl7l2OUkLq9Olui/oZ+PoH5VWwUs8TzgMqGPe4ewkUVfvdW64zbc2vaAmjcmbeNNFZCv2l1vNKzd6aY+zqczWRdwe19EuJvUFVktpE=
Received: from BN9PR03CA0135.namprd03.prod.outlook.com (2603:10b6:408:fe::20)
 by MWHPR12MB1359.namprd12.prod.outlook.com (2603:10b6:300:11::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 16:02:02 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::40) by BN9PR03CA0135.outlook.office365.com
 (2603:10b6:408:fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:02 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:01:57 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 1/6] Documentation/gpu: Reorganize DC documentation
Date: Thu, 2 Dec 2021 11:01:27 -0500
Message-ID: <20211202160132.2263330-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
References: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8311bc65-3c2c-484e-ecc8-08d9b5ad1433
X-MS-TrafficTypeDiagnostic: MWHPR12MB1359:
X-Microsoft-Antispam-PRVS: <MWHPR12MB135921E36CE93A351471F91198699@MWHPR12MB1359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gLU58R8wN+2QsVaFpwUPa1cS+U/I8W5pk6S+k4jlqQM+Wdqvh4iSL9zPLac4coU56EEEz+ihGZecfMpu5pZrJeKlry3QxTcB88lgoeoaGkVwWLS2sn1bUfFDpAHu4J86954GAuNZPBSeDOxksz85JqdlzYp6T5IWBGFatZ5VsOVMeEWeVDBsPic48lJEzgMF+oPUnIgGKOoyfgrHTVN7TPJdefD+T0ObvvvjYNVl6BFflqFjn46V1ce8nw78qnEq3bR/cLAMU9eOlcsY6IE68k4Ih+2mRSJW17N4gu1Z3s6qLTFO1z6W+y3Kvi2c0KyWdyAgxQivd8T2fTU16gvpAsGou/cHkDvzMQ26YI2BYYwvoTBabCAMZKU2Hqts+HWsxmQGV8F1a6qBJIF7eIdnkjbo3aXJOOzJqAnICQ7oMShz4dKpbEMr2tTrB0JsEisJYhCp6i99l5W+zUUWAWZUDluPDmhD56xvGZG/FpbxmSXtvYdFUZc57lcTsPzsQTTYm52+F7myj9Ks6lxAb6uutNbAHuswPPwpLjNMwJX6ABIl16FwNR4RpGTUrTH8H9Z9YPOSeb7UJTpIEYihKmrtvIplaQNlWtBMd1GvHJNKlKTV0T4BQ8/NtIVfF7NGQcfer9Y0q0WqQdcaXEF2UDKY34oDyQJOG3mFatxvjUl+8q9DUg/8SuWcHCCBzfkqr1H0g8qvhYcdRbA+52sntKNSTZFZPEiYnMY91vnmUcrAwkAm8uvXgtZtxlB/J2pCELDp2MuWXDY40dV3L8MGMeZHJsBGXyIAQvm4Nk8U9qVGl8Cp37SxmOuizmmn3nm5Iip
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36860700001)(26005)(83380400001)(186003)(16526019)(36756003)(40460700001)(356005)(81166007)(86362001)(336012)(5660300002)(47076005)(6666004)(426003)(82310400004)(2616005)(70586007)(70206006)(1076003)(316002)(4326008)(7416002)(8936002)(921005)(8676002)(110136005)(2906002)(54906003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:02.2084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8311bc65-3c2c-484e-ecc8-08d9b5ad1433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1359
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
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core documentation is not well organized, and it is hard to find
information due to the lack of sections. This commit reorganizes the
documentation layout, and it is preparation work for future changes.

Changes since V1:
- Christian: Group amdgpu documentation together.
- Daniel: Drop redundant amdgpu prefix.
- Jani: Create index pages.
- Yann: Mirror display folder in the documentation.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
 Documentation/gpu/amdgpu/display/dc-debug.rst |  4 +
 .../gpu/amdgpu/display/display-manager.rst    | 42 +++++++++++
 Documentation/gpu/amdgpu/display/index.rst    | 29 ++++++++
 .../gpu/{amdgpu.rst => amdgpu/index.rst}      | 18 ++++-
 Documentation/gpu/drivers.rst                 |  3 +-
 6 files changed, 91 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-manager.rst
 create mode 100644 Documentation/gpu/amdgpu/display/index.rst
 rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (96%)

diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
deleted file mode 100644
index f7ff7e1309de..000000000000
--- a/Documentation/gpu/amdgpu-dc.rst
+++ /dev/null
@@ -1,74 +0,0 @@
-===================================
-drm/amd/display - Display Core (DC)
-===================================
-
-*placeholder - general description of supported platforms, what dc is, etc.*
-
-Because it is partially shared with other operating systems, the Display Core
-Driver is divided in two pieces.
-
-1. **Display Core (DC)** contains the OS-agnostic components. Things like
-   hardware programming and resource management are handled here.
-2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
-   amdgpu base driver and DRM are implemented here.
-
-It doesn't help that the entire package is frequently referred to as DC. But
-with the context in mind, it should be clear.
-
-When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
-supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
-Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
-
-To determine if DC is loaded, search dmesg for the following entry:
-
-``Display Core initialized with <version number here>``
-
-AMDgpu Display Manager
-======================
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: overview
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
-   :internal:
-
-Lifecycle
----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: DM Lifecycle
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: dm_hw_init dm_hw_fini
-
-Interrupts
-----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
-   :doc: overview
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
-   :internal:
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
-
-Atomic Implementation
----------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: atomic
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
-
-Display Core
-============
-
-**WIP**
-
-FreeSync Video
---------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
-   :doc: FreeSync Video
diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
new file mode 100644
index 000000000000..bbb8c3fc8eee
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -0,0 +1,4 @@
+Display Core Debug tools
+========================
+
+TODO
diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
new file mode 100644
index 000000000000..7ce31f89d9a0
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -0,0 +1,42 @@
+======================
+AMDgpu Display Manager
+======================
+
+.. contents:: Table of Contents
+    :depth: 3
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+   :internal:
+
+Lifecycle
+=========
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: DM Lifecycle
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: dm_hw_init dm_hw_fini
+
+Interrupts
+==========
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
+
+Atomic Implementation
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: atomic
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
new file mode 100644
index 000000000000..a443866332ac
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -0,0 +1,29 @@
+===================================
+drm/amd/display - Display Core (DC)
+===================================
+
+*placeholder - general description of supported platforms, what dc is, etc.*
+
+Because it is partially shared with other operating systems, the Display Core
+Driver is divided in two pieces.
+
+1. **Display Core (DC)** contains the OS-agnostic components. Things like
+   hardware programming and resource management are handled here.
+2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
+   amdgpu base driver and DRM are implemented here.
+
+It doesn't help that the entire package is frequently referred to as DC. But
+with the context in mind, it should be clear.
+
+When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
+supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
+Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
+
+To determine if DC is loaded, search dmesg for the following entry:
+
+.. toctree::
+
+   display-manager.rst
+   dc-debug.rst
+
+``Display Core initialized with <version number here>``
diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu/index.rst
similarity index 96%
rename from Documentation/gpu/amdgpu.rst
rename to Documentation/gpu/amdgpu/index.rst
index 8ba72e898099..5c8cbf514097 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -1,6 +1,6 @@
-=========================
+==========================
  drm/amdgpu AMDgpu driver
-=========================
+==========================
 
 The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics Core
 Next (GCN) architecture.
@@ -71,7 +71,7 @@ Interrupt Handling
    :internal:
 
 IP Blocks
-------------------
+---------
 
 .. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
    :doc: IP Blocks
@@ -79,6 +79,18 @@ IP Blocks
 .. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
    :identifiers: amd_ip_block_type amd_ip_funcs
 
+Display Core
+============
+
+This section covers Display core.
+
+.. toctree::
+
+  display/index
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+   :doc: overview
+
 AMDGPU XGMI Support
 ===================
 
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..3a52f48215a3 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -4,8 +4,7 @@ GPU Driver Documentation
 
 .. toctree::
 
-   amdgpu
-   amdgpu-dc
+   amdgpu/index
    i915
    mcde
    meson
-- 
2.25.1

