Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5746EF17
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFA410E1FA;
	Thu,  9 Dec 2021 16:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC2110E120;
 Thu,  9 Dec 2021 14:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6YZKQHYhc2evVe4dhu+mlleLHyHLtLA/bV/U3XaEosbSP/oydeQvWvs1wOzBDsksTeXT0b2tCIWLAF64NTZweZ+dIfmx3AzIg+/HtAe5yg2QkA6sjouy28lvOyKXwgvKhGalOtF+kR4kuUrqVj9wpS3AYdR7ZJyTjQhkMgAruXoIMGeQI1AQvW4H+8OIIkoIy3cqK58MaHm8npAaP93hu6fpUPY6eytFbdm2459pIFnKJy8/DG//znFq+lD3M6okjGARhUjLnGusTeBdnv/FP3zZlZkACOChRKdHN3EgpksnonQbVq6P7lIqACwk/U0Djcj2a2uaKTkZhm6UuN5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSvc0NFQW+4haWxE4FPLQC9XYoLKReIZTflZDFazzJc=;
 b=BSC2AfMqm4T0zBFMCV0CBuD3Ph+x/35VGkZqnx+UpQHlDoKsTlUswpemTpY6gcBN2Mts+JFg4jgtMhllG1r0W+XMZ95jPpfdLsyQq4wAOaQgNGHEoeLoziVUq9IVVH5hYsNBvmg4EHN7CFUu7ppdncg/sr6HVRNLxSPKIBf7j+Ig7SSc0LAyCAE1nWF514cD1EnlR/5L0t8ezW4JBcdtHR87Rq9s3Cm1GVERTy7UEiNXyHKydRs8i2JCpykgLYBe1/1iW1rIMAjjIaLZVMJShnq7DkAKQi85ZsxJ2KD6SgfX4LrViVXlN2N5Cv7PF9xA0wgyQtX6KJadQFMvy2EHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSvc0NFQW+4haWxE4FPLQC9XYoLKReIZTflZDFazzJc=;
 b=SOHqQx2grM2vI45SKOotx9SLcd03OZkSE5MSwqjV25m3sNrKdr778PqTfnYlazFpi9kZEiELdx5QMja97p3o6oWmB10UjPgl1XxMGRccqyGxRZGY/DeB89X+mfHIccgozUFzyoluzS8i2IekdHLBUVXvWwUA3auRvvRbErroJjM=
Received: from MWHPR1401CA0020.namprd14.prod.outlook.com
 (2603:10b6:301:4b::30) by BN8PR12MB2929.namprd12.prod.outlook.com
 (2603:10b6:408:9c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 14:21:14 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::2) by MWHPR1401CA0020.outlook.office365.com
 (2603:10b6:301:4b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:14 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:09 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 6/6] Documentation/gpu: Add amdgpu and dc glossary
Date: Thu, 9 Dec 2021 09:20:47 -0500
Message-ID: <20211209142047.728572-7-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b91bac31-71d7-46f9-dc1f-08d9bb1f2844
X-MS-TrafficTypeDiagnostic: BN8PR12MB2929:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB29296C400591F2E14CBD435698709@BN8PR12MB2929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPSS/dbsaeppMeB4UeAmowNz8hLt3P29rDAjv5m1Ra0vHjawsHdBkgvPdYOOJ6MCjBwTLVydWDzkZe96zJxYIaypIDpNGOAFg2qlwKmcWuKPfCXSL4ub+TsvW311+YpnQFFchsWxT4TYTFznhzt+oSKWSaROuVGK3JayaW5dXKzgDlcdKjlasKL9HWFZ/n3XpNM+TTaD4EY+bJTxgQmceZ3K2hNrFcMfyctT7Ty3R1ZTxlHBxOLw0E7vv1ibZW+4ZwkCt3BNLlw+yR7kFILuvc9LPr+dgVEMjoc+jdYIJQ20RxWmDMT+8GgkkUQmBf+usUY8vnVz/qd6ZdJihRe2NZA/jWXOzWlYr1WRBHKWOapp0BwcQhWqUzQDS4RbG2DTdctMIzSk8QwSUepkG/OiphlyxylBzF1MSJE/RkyYi13t9DMc0TxKQFjytn8qvNmNYfhcxYpCjYzBZ7iXIlZbkeGdonFq9cKtDkEtnP/kRaozekoZzgE8IB7VLgD5Deig0TiAni/6QncosEIOslr/QvyvoXNjOQIJCij/FA4dZ+zQxr33e9CeyDOv/dHk9igc4S6LInixySl/h/FYfF6DjwhJFUxGmfIfnWUrUy5dPCiKgjTbnJA6ona8Omxga46pJs/mMsguvC+Zci6YnnBkU6YNF3JNXuC4XKtdYi2Ckw7arEz05BNUDN+WElTSviMGRqjKn8HRSdyZlp2hFzUHKL76Cd6RwXX08AmcB1UNlGso0dCklutNKD1KloOc4HIYW47PjoYQnAo+FCxgGD4DtNrXt/5ft5lSf2EM60elChnKM3AhC+coVxRmkOkK6+M3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(4326008)(316002)(5660300002)(921005)(81166007)(82310400004)(8936002)(8676002)(2906002)(36756003)(83380400001)(110136005)(40460700001)(54906003)(356005)(86362001)(336012)(7416002)(6666004)(186003)(16526019)(26005)(2616005)(508600001)(1076003)(47076005)(70206006)(36860700001)(70586007)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:14.2055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b91bac31-71d7-46f9-dc1f-08d9bb1f2844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2929
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

Changes since V3:
 - Yann: Add new acronyms to amdgpu glossary
 - Daniel: Add link between dc and amdgpu glossary

Changes since V2:
 - Add MMHUB

Changes since V1:
 - Yann: Divide glossary based on driver context.
 - Alex: Make terms more consistent and update CPLIB
 - Add new acronyms to the glossary

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  87 +++++++
 .../gpu/amdgpu/display/dc-glossary.rst        | 237 ++++++++++++++++++
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 Documentation/gpu/amdgpu/index.rst            |   7 +
 4 files changed, 332 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
 create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
new file mode 100644
index 000000000000..859dcec6c6f9
--- /dev/null
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -0,0 +1,87 @@
+===============
+AMDGPU Glossary
+===============
+
+Here you can find some generic acronyms used in the amdgpu driver. Notice that
+we have a dedicated glossary for Display Core at
+'Documentation/gpu/amdgpu/display/dc-glossary.rst'.
+
+.. glossary::
+
+    CP
+      Command Processor
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
+    GC
+      Graphics and Compute
+
+    GMC
+      Graphic Memory Controller
+
+    IH
+      Interrupt Handler
+
+    HQD
+      Hardware Queue Descriptor
+
+    IB
+      Indirect Buffer
+
+    IP
+        Intellectual Property blocks
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
+    MEC
+      MicroEngine Compute
+
+    MES
+      MicroEngine Scheduler
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
+    PSP
+        Platform Security Processor
+
+    RCL
+      RunList Controller
+
+    SDMA
+      System DMA
+
+    SMU
+      System Management Unit
+
+    SS
+      Spread Spectrum
+
+    VCE
+      Video Compression Engine
+
+    VCN
+      Video Codec Next
diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
new file mode 100644
index 000000000000..116f5f0942fd
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
@@ -0,0 +1,237 @@
+===========
+DC Glossary
+===========
+
+On this page, we try to keep track of acronyms related to the display
+component. If you do not find what you are looking for, look at the
+'Documentation/gpu/amdgpu/amdgpu-glossary.rst'; if you cannot find it anywhere,
+consider asking in the amdgfx and update this page.
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
+    GSL
+      Global Swap Lock
+
+    iGPU
+      integrated GPU
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

