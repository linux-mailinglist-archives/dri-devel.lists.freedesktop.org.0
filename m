Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCB466783
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DCB6FA82;
	Thu,  2 Dec 2021 16:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B76FA82;
 Thu,  2 Dec 2021 16:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH1hNBYdND6KKNAJUw8h0hPO1FRUkT/JjrtF2mKMdz16Uex+vJa4gzbuV4tmd+CFs71bOIsRfQuU4aAWpH2EXiGFA8y0+aKJuu0mLEgsTqQTnbPI88tr0gAQ946TwSv4oBNISY7hli1aAcp1G0A0tRSokwErjePcVVYTWyMEfYbfXDNMIyjQhUAoc7Rc7EwYRuXIIdIiBGTZNv6oaXe0ctxIbvRpkL9yG4JD+xz9G1mNmaZmZvsDHQk86hxWNGqo23JRt9khJTnuhM464qDFce1RkjgOXjYqpzbfGfMsJ0oXumycSqdOuXODtl2UuCiiL4ukbesAT6XK51LpWDycRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ppMgoI3tAVIQx5GbsEm1RLdD9sOfUNShpp7EvD4s6g=;
 b=X3GQfUtIhFxfq/M4zYW6pJDJ2iNNaCOnk6SjhAbhQzBG3TSpJdVtloD79837jh7qmOdfYTnjBODR8ZS/s4Go6uRUSFVtN9moBu+x79T1t99GJ0iGZkJWOTYP5VeAUSDZZQ+YYWE9fi7uHLvRvbG2YjUObPKDrPiucScXq0AAq1etI8e9A/RGcy6zbc70ur3Fi9d4HDY2ee7XqHVLqCLcgUpX8i4vSetpp7Zqi0xGPkGiEMsOQgZghxN1oqvPyBUCnwWvEPRpVr++IDVuiB5r1HChKxrBMFPnDNv4KpQuuN7wpiIlKxQPntoBDRJmNaI7AZFI19luW3gWOjEHzYTCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ppMgoI3tAVIQx5GbsEm1RLdD9sOfUNShpp7EvD4s6g=;
 b=gyuhHWeJGJ+S9Mj+Wb7W6Iyx/yEVoNkfvVh4MqcynlnXRe55o5RHT7yFTrK7mKAtz+x/lMK7N/xQA/YXedfd/qRFLHtfr1LlzVQsDzqqLO51RD/M6iiuZwFK8ga+HmtSXMFgWV4NcKsRd27PHVWvxtr+iq3qzBbS3IfgvMZA5XM=
Received: from BN1PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:e1::28)
 by BYAPR12MB3461.namprd12.prod.outlook.com (2603:10b6:a03:da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 16:02:08 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::61) by BN1PR12CA0023.outlook.office365.com
 (2603:10b6:408:e1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:07 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:02:05 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
Date: Thu, 2 Dec 2021 11:01:32 -0500
Message-ID: <20211202160132.2263330-7-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f295b4a5-c809-4cb3-2b08-08d9b5ad1765
X-MS-TrafficTypeDiagnostic: BYAPR12MB3461:
X-Microsoft-Antispam-PRVS: <BYAPR12MB34615D87D0C24315B087FF4098699@BYAPR12MB3461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uT8SXwyvDpRiy34FfmStuFiauniJGEXixI2MVTuTspoihGNhjZvMc1U150Dc9LFWhSXpqEdd43vsKelUpIMOt/AeRaj5V/tmm57U/EXq82jJ2au3nT8dlBKx2GIuaeje6cLHBiT4MHz1omhWQC5tMPV0k2KpiPuoBhtcXAVIup2Zl2xKgo1P9qq4naE4vYTciBDz90mJBVrlsiPtxl50vS9syp1Y18joMCCwsGH8+sIcJV+oUhS9E+xrCzAcby3Fgh3IU0BpUIvfwnLcDuvpEO0M4ckboQcyJZuP/q4mb0YF2utJahzGOiEBv56W6UJPirYUST5LHd0nDdrgD/UPvVYatq5IVkdL6AMBAqq0vM/U8fbLpkmOQkvrHTxTmPiBMyxZUvYbuduvPgC4LijulLw8nGOxZHEt9fMAFGEgqtn5TrrmJ3oBa0BzIPYewShRzl/btnHbVmf6cimIlFNBcJqdTKhHdGZqpfejcSw58EqFQwP8FnixRqEAQXWRjZg8KJp/uQ5IxpMfjj7QE98ddz6xWERybC2AV+J3itnFKJNMgAym5H7Miv5Y1J8pqmsko3C6aRbQxljAvPxa66pPIY7lJAHHMFoOeF0dcuCzHW8e5QiOMORcYcrkTWjlb6zWN4WYz389y1LfaKfItzcKCTqHSpbaJ4B+Qbqpser5QgcBz/SUBsmfPskrxut4dmY7h7hnhHhKd4lrkVfmlW5KtZI3fC8P9fVuZ5W/8MbFtRyAiMHLyPfnqyksTUmhabDWfBEmILLU3KvckR6FFdioFp4EInNP7L/n87TZnMgrAFyJjBAwjtkam5PvIrsp4u4+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36860700001)(2616005)(921005)(70206006)(1076003)(36756003)(8676002)(186003)(2906002)(70586007)(6666004)(508600001)(110136005)(5660300002)(16526019)(426003)(8936002)(54906003)(336012)(47076005)(26005)(7416002)(356005)(4326008)(82310400004)(316002)(86362001)(83380400001)(81166007)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:07.5642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f295b4a5-c809-4cb3-2b08-08d9b5ad1765
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3461
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

In the DC driver, we have multiple acronyms that are not obvious most of
the time; the same idea is valid for amdgpu. This commit introduces a DC
and amdgpu glossary in order to make it easier to navigate through our
driver.

Changes since V1:
 - Yann: Divide glossary based on driver context.
 - Alex: Make terms more consistent and update CPLIB
 - Add new acronyms to the glossary

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
 .../gpu/amdgpu/display/dc-glossary.rst        | 243 ++++++++++++++++++
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 Documentation/gpu/amdgpu/index.rst            |   7 +
 4 files changed, 298 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
new file mode 100644
index 000000000000..e635851025e7
--- /dev/null
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -0,0 +1,47 @@
+===============
+AMDGPU Glossary
+===============
+
+Here you can find some generic acronyms used in the amdgpu driver. Notice that
+we have a dedicated glossary for Display Core.
+
+.. glossary::
+
+    CPLIB
+      Content Protection Library
+
+    DFS
+      Digital Frequency Synthesizer
+
+    ECP
+      Enhanced Content Protection
+
+    EOP
+      End Of Pipe/Pipeline
+
+    HQD
+      Hardware Queue Descriptor
+
+    KCQ
+      Kernel Compute Queue
+
+    KGQ
+      Kernel Graphics Queue
+
+    KIQ
+      Kernel Interface Queue
+
+    MQD
+      Memory Queue Descriptor
+
+    PPLib
+      PowerPlay Library - PowerPlay is the power management component.
+
+    SMU
+      System Management Unit
+
+    VCE
+      Video Compression Engine
+
+    VCN
+      Video Codec Next
diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
new file mode 100644
index 000000000000..547c0bfbb3e2
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
@@ -0,0 +1,243 @@
+===========
+DC Glossary
+===========
+
+On this page, we try to keep track of acronyms related to the display
+component. If you do not find what you are looking for, look at the amdgpu
+glossary; if you cannot find it anywhere, consider asking in the amdgfx and
+update this page.
+
+.. glossary::
+
+    ABM
+      Adaptive Backlight Modulation
+
+    APU
+      Accelerated Processing Unit
+
+    ASIC
+      Application-Specific Integrated Circuit
+
+    ASSR
+      Alternate Scrambler Seed Reset
+
+    AZ
+      Azalia (HD audio DMA engine)
+
+    BPC
+      Bits Per Colour/Component
+
+    BPP
+      Bits Per Pixel
+
+    Clocks
+      * PCLK: Pixel Clock
+      * SYMCLK: Symbol Clock
+      * SOCCLK: GPU Engine Clock
+      * DISPCLK: Display Clock
+      * DPPCLK: DPP Clock
+      * DCFCLK: Display Controller Fabric Clock
+      * REFCLK: Real Time Reference Clock
+      * PPLL: Pixel PLL
+      * FCLK: Fabric Clock
+      * MCLK: Memory Clock
+
+    CRC
+      Cyclic Redundancy Check
+
+    CRTC
+      Cathode Ray Tube Controller - commonly called "Controller" - Generates
+      raw stream of pixels, clocked at pixel clock
+
+    CVT
+      Coordinated Video Timings
+
+    DAL
+      Display Abstraction layer
+
+    DC (Software)
+      Display Core
+
+    DC (Hardware)
+      Display Controller
+
+    DCC
+      Delta Colour Compression
+
+    DCE
+      Display Controller Engine
+
+    DCHUB
+      Display Controller HUB
+
+    ARB
+      Arbiter
+
+    VTG
+      Vertical Timing Generator
+
+    DCN
+      Display Core Next
+
+    DCCG
+      Display Clock Generator block
+
+    DDC
+      Display Data Channel
+
+    DIO
+      Display IO
+
+    DPP
+      Display Pipes and Planes
+
+    DSC
+      Display Stream Compression (Reduce the amount of bits to represent pixel
+      count while at the same pixel clock)
+
+    dGPU
+      discrete GPU
+
+    DMIF
+      Display Memory Interface
+
+    DML
+      Display Mode Library
+
+    DMCU
+      Display Micro-Controller Unit
+
+    DMCUB
+      Display Micro-Controller Unit, version B
+
+    DPCD
+      DisplayPort Configuration Data
+
+    DPM(S)
+      Display Power Management (Signaling)
+
+    DRR
+      Dynamic Refresh Rate
+
+    DWB
+      Display Writeback
+
+    FB
+      Frame Buffer
+
+    FBC
+      Frame Buffer Compression
+
+    FEC
+      Forward Error Correction
+
+    FRL
+      Fixed Rate Link
+
+    GCO
+      Graphical Controller Object
+
+    GMC
+      Graphic Memory Controller
+
+    GSL
+      Global Swap Lock
+
+    iGPU
+      integrated GPU
+
+    IH
+      Interrupt Handler
+
+    ISR
+      Interrupt Service Request
+
+    ISV
+      Independent Software Vendor
+
+    KMD
+      Kernel Mode Driver
+
+    LB
+      Line Buffer
+
+    LFC
+      Low Framerate Compensation
+
+    LTTPR
+      Link Training Tunable Phy Repeater
+
+    LUT
+      Lookup Table
+
+    MALL
+      Memory Access at Last Level
+
+    MC
+      Memory Controller
+
+    MPC
+      Multiple pipes and plane combine
+
+    MPO
+      Multi Plane Overlay
+
+    MST
+      Multi Stream Transport
+
+    NBP State
+      Northbridge Power State
+
+    NBIO
+      North Bridge Input/Output
+
+    ODM
+      Output Data Mapping
+
+    OPM
+      Output Protection Manager
+
+    OPP
+      Output Plane Processor
+
+    OPTC
+      Output Pipe Timing Combiner
+
+    OTG
+      Output Timing Generator
+
+    PCON
+      Power Controller
+
+    PGFSM
+      Power Gate Finite State Machine
+
+    PSR
+      Panel Self Refresh
+
+    SCL
+      Scaler
+
+    SDP
+      Scalable Data Port
+
+    SLS
+      Single Large Surface
+
+    SST
+      Single Stream Transport
+
+    TMDS
+      Transition-Minimized Differential Signaling
+
+    TMZ
+      Trusted Memory Zone
+
+    TTU
+      Time to Underflow
+
+    VRR
+      Variable Refresh Rate
+
+    UVD
+      Unified Video Decoder
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index fe2ecad8df81..e23c752ee5f5 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -26,3 +26,4 @@ table of content:
    display-manager.rst
    dc-debug.rst
    dcn-overview.rst
+   dc-glossary.rst
diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index 5c8cbf514097..ff38c360b04e 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -334,3 +334,10 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+AMDGPU Glossary
+===============
+
+.. toctree::
+
+   amdgpu-glossary.rst
-- 
2.25.1

