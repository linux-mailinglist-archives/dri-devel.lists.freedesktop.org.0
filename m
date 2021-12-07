Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF6646BE4B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48DAB8DF;
	Tue,  7 Dec 2021 14:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543EABFB9;
 Tue,  7 Dec 2021 14:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ12MVc1gkKsthOQDEsZGLT5qPgw6/3hTaHr4LE27QHdGkkIMV4oLUnhpaMqtObO4STN+vWr0kGrFULj2JWKScS7WShlFlQJm1FvWij1TcMwANf+scvTjULnawzf5smDUxeUMqa2TEgTJ0Re76sH5LRlRp4pBaIK5iDNgACg+DBp/T1qGZwGydWORqOuFxItGfU7uWo5mNqU6SytveocsdHZdAzoQbKOADzmJae1arEDHe8UOA7Tq1uBlKlfBgu58KYusAmbdxm7pyO5iH55UfktZGzjG06G39+BDvUGG4sz1Uqo6A6xwDzGb1p8mi1xrGknioGT5Gfk/Nl3MNG3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7qFq29uFmiCZ/7vZ+ZqzCVgNHbmyngG/bI5/kFd/MA=;
 b=GmcZJ4qbGGoq8M8GiGbvaR4gHg90Xb7kLp5iev3i0VX4hwZwX9f0N+MRe7s/BB28rBAenZcaitTESkB5bsZKAHADP+sorEuNU3Fuo2srjmo8YR8H9ghNdvwx5UIJVqg5sbFMKrPlIRtSj516dyb+TdmzR7fRJbSwGSldvYpp22NCNZ2negZaDretyh5HVsKYM1g63et/GUgzL6ttavWh9907T7nRwL5XgpUTUxpsI81/hSGYtdooo2ZomdcXlV8ACE5qG6fnBckJf4m8kNYbna6ooSyx3nO325AdkEhBUr5yBd1lWEjSNtqVlUvKydZy9U2A/OxxlgF9KLnPDEesbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7qFq29uFmiCZ/7vZ+ZqzCVgNHbmyngG/bI5/kFd/MA=;
 b=jrXcQ0baSufcpw0TFoXMpfoK0fwMC8Hm1bjfQFX+eflbr9A3SH/jdq/rJtC6fBkSoeqYbwMxwxNfdqe8ckkvFkKTQV4QABiFWDDmggLfdeUGlJIfLhzQ50OBgZErXyCjumNINCzrmqxU0ist+scHi5JGD0UgerJgrZsoyAbqfwY=
Received: from DM6PR13CA0010.namprd13.prod.outlook.com (2603:10b6:5:bc::23) by
 DM6PR12MB3451.namprd12.prod.outlook.com (2603:10b6:5:11d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Tue, 7 Dec 2021 14:54:23 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::6e) by DM6PR13CA0010.outlook.office365.com
 (2603:10b6:5:bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:22 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:18 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 6/6] Documentation/gpu: Add amdgpu and dc glossary
Date: Tue, 7 Dec 2021 09:53:50 -0500
Message-ID: <20211207145350.286037-7-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
References: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d3dab2-f06d-44e3-7838-08d9b99174c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3451:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB345173C109362262408705B3986E9@DM6PR12MB3451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4NACHdleTvkO/OVN6N9kg/dJaccTk0624f9xSCf/hKZajvpP522vPfEt4Dsz80ycDIkNVVH4JbPRo+uT8FrEH+q+lP371RtEHVdvQcdl0+rAALlAwbdSDbx8nv5N/Nm7xB9fiO/oh/NGFkX1dPIF0AsMCjaOF3fpZtmh5zjEO/XeWk3S2Eam8JdrmqXIJMGlL1enxrXOvV2jhINpqOJxAcRxrzi4TFetDQLkeTtU7juNrya0SlgfJoZxrPofwgne3LSjXrGzbmb0sdXPh1tixh5zHswuMf6sJk1P3IHaqsU8OuG1/dYQWC3vGr5qmUUsUW58mZxnsD/+qKQZve2cGdXYhRdCdr7Yug/aYiRgxweV3/r/d/Ze7S32rz8eijM4BlPPbzTbO7mLefu5UF6fOD/A7MyG0SuvnjgNyIDYuj/l5pciMFFyBKZ1FhYEZPEtmC3shJnlceBQogRHDZORJsMYJq9OOHgpkf9jeMqpVA8JndRJrFdLleYuC9SXO8GR+deISS+Qj8C4OCXdbSN81eFC/5dvYWj86V/o7PXE3FIPs9p7CWzWwD7LfqpSAZPS7/vu/opYq/s+qJp++T8KaJ3wBnWpYT+PNNRJuZL6gZ6GIgG0RVHm6sk7ZtA5UEjr080+7C8cIk3fQgCE/VQtCYaSNjaETdhdLBJQQivZYCPHLo6H48YHztWXORXYUe1NMao9rXLYPZPK91a+ss4WrE7DsB/2HatDtVgO4zL+TW4cQrtNO8eOolbtTAiQlyq4aDnB22mHe2L4tDppw/NuTGq85rL9uG4sxMKUP1inadfghyuzr1TCTGQEOpcNiz9g
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(81166007)(2906002)(86362001)(921005)(83380400001)(316002)(1076003)(26005)(356005)(70586007)(8936002)(47076005)(110136005)(70206006)(54906003)(186003)(16526019)(4326008)(36860700001)(5660300002)(2616005)(6666004)(36756003)(508600001)(40460700001)(426003)(82310400004)(8676002)(336012)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:22.9127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d3dab2-f06d-44e3-7838-08d9b99174c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3451
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

Changes since V2:
 - Add MMHUB

Changes since V1:
 - Yann: Divide glossary based on driver context.
 - Alex: Make terms more consistent and update CPLIB
 - Add new acronyms to the glossary

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  50 ++++
 .../gpu/amdgpu/display/dc-glossary.rst        | 243 ++++++++++++++++++
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 Documentation/gpu/amdgpu/index.rst            |   7 +
 4 files changed, 301 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
new file mode 100644
index 000000000000..65803bfac776
--- /dev/null
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -0,0 +1,50 @@
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
+    MMHUB
+      Multi-Media HUB
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

