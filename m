Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119046C3F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 20:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0096ECCA;
	Tue,  7 Dec 2021 19:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB826ECAE;
 Tue,  7 Dec 2021 19:49:36 +0000 (UTC)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 8C94E13F880;
 Tue,  7 Dec 2021 20:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638906574;
 bh=nZupbNwgHmu2ZpoiVCn6V93nSDg6hHClR88IDxqhVng=;
 h=Date:From:To:Cc:In-Reply-To:Subject:From;
 b=ZuIJs7AP0exqLtS0EeAx8N30eTiESF+qb+c4alwHJtL2qShhPSlrqUalBFynMMJKO
 /8M09MylZBctq475D5GP89wvYPfENUoM9uaL41xolzGd7z/fB1y7rU+UYwdCXt8ji0
 BymCEGaPPxuMfxcFswgArn1WL1u8xXGdJmfFmL7Z6iApgyRLuWFQQ3J4O0hRizcmVx
 evTsfi9RQiyVrGeMQRcYjKsfLmVGcYAshN7SCVyOunJF1lhfoZ6MH/iagipDMDOqOX
 wbeiPyRQY80i89w/l8O0t196y4Nz2RsT+vuDPPQ5ft9MIBIJa0qvaZ4WBYsfjbn1RH
 ujkhJM52RliXg==
Date: Tue, 7 Dec 2021 20:49:32 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <1907703259.37063142.1638906572289.JavaMail.root@zimbra39-e7>
In-Reply-To: <Ya+lm9B8opSSkHsu@phenom.ffwll.local>
Subject: Re: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
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
Cc: Mark Yacoub <markyacoub@chromium.org>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 nicholas choi <nicholas.choi@amd.com>, linux-doc@vger.kernel.org,
 Michel Daenzer <michel@daenzer.net>, roman li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Marek Olsak <marek.olsak@amd.com>, aurabindo pillai <aurabindo.pillai@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 qingqing zhuo <qingqing.zhuo@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Roman Gilg <subdiff@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Thu, Dec 02, 2021 at 11:01:32AM -0500, Rodrigo Siqueira wrote:
> > In the DC driver, we have multiple acronyms that are not obvious
> > most of
> > the time; the same idea is valid for amdgpu. This commit introduces
> > a DC
> > and amdgpu glossary in order to make it easier to navigate through
> > our
> > driver.
> > 
> > Changes since V1:
> >  - Yann: Divide glossary based on driver context.
> >  - Alex: Make terms more consistent and update CPLIB
> >  - Add new acronyms to the glossary

If you're rerolling, it could be a good time to include the additional
(and detailed) entries from Alex's answer to "Looking for clarifications
around gfx/kcq/kiq".  Finding a way to fit the other details not
fitting directly in the glossary will likely take more rounds, though,
so we can wait for the first round to be merged before dealing with them.



> > 
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
> >  .../gpu/amdgpu/display/dc-glossary.rst        | 243
> >  ++++++++++++++++++
> >  Documentation/gpu/amdgpu/display/index.rst    |   1 +
> >  Documentation/gpu/amdgpu/index.rst            |   7 +
> >  4 files changed, 298 insertions(+)
> >  create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/dc-glossary.rst
> > 
> > diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > new file mode 100644
> > index 000000000000..e635851025e7
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > @@ -0,0 +1,47 @@
> > +===============
> > +AMDGPU Glossary
> > +===============
> > +
> > +Here you can find some generic acronyms used in the amdgpu driver.
> > Notice that
> > +we have a dedicated glossary for Display Core.
> 
> Maybe add a link to that here so it's easier to find? sphinx
> autogenerates
> header targets so pretty easy (if the heading is unique at least).
> -Daniel
> 
> > +
> > +.. glossary::
> > +
> > +    CPLIB
> > +      Content Protection Library
> > +
> > +    DFS
> > +      Digital Frequency Synthesizer
> > +
> > +    ECP
> > +      Enhanced Content Protection
> > +
> > +    EOP
> > +      End Of Pipe/Pipeline
> > +
> > +    HQD
> > +      Hardware Queue Descriptor
> > +
> > +    KCQ
> > +      Kernel Compute Queue
> > +
> > +    KGQ
> > +      Kernel Graphics Queue
> > +
> > +    KIQ
> > +      Kernel Interface Queue
> > +
> > +    MQD
> > +      Memory Queue Descriptor
> > +
> > +    PPLib
> > +      PowerPlay Library - PowerPlay is the power management
> > component.
> > +
> > +    SMU
> > +      System Management Unit
> > +
> > +    VCE
> > +      Video Compression Engine
> > +
> > +    VCN
> > +      Video Codec Next
> > diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst
> > b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> > new file mode 100644
> > index 000000000000..547c0bfbb3e2
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> > @@ -0,0 +1,243 @@
> > +===========
> > +DC Glossary
> > +===========
> > +
> > +On this page, we try to keep track of acronyms related to the
> > display
> > +component. If you do not find what you are looking for, look at
> > the amdgpu
> > +glossary; if you cannot find it anywhere, consider asking in the
> > amdgfx and
> > +update this page.
> > +
> > +.. glossary::
> > +
> > +    ABM
> > +      Adaptive Backlight Modulation
> > +
> > +    APU
> > +      Accelerated Processing Unit
> > +
> > +    ASIC
> > +      Application-Specific Integrated Circuit
> > +
> > +    ASSR
> > +      Alternate Scrambler Seed Reset
> > +
> > +    AZ
> > +      Azalia (HD audio DMA engine)
> > +
> > +    BPC
> > +      Bits Per Colour/Component
> > +
> > +    BPP
> > +      Bits Per Pixel
> > +
> > +    Clocks
> > +      * PCLK: Pixel Clock
> > +      * SYMCLK: Symbol Clock
> > +      * SOCCLK: GPU Engine Clock
> > +      * DISPCLK: Display Clock
> > +      * DPPCLK: DPP Clock
> > +      * DCFCLK: Display Controller Fabric Clock
> > +      * REFCLK: Real Time Reference Clock
> > +      * PPLL: Pixel PLL
> > +      * FCLK: Fabric Clock
> > +      * MCLK: Memory Clock
> > +
> > +    CRC
> > +      Cyclic Redundancy Check
> > +
> > +    CRTC
> > +      Cathode Ray Tube Controller - commonly called "Controller" -
> > Generates
> > +      raw stream of pixels, clocked at pixel clock
> > +
> > +    CVT
> > +      Coordinated Video Timings
> > +
> > +    DAL
> > +      Display Abstraction layer
> > +
> > +    DC (Software)
> > +      Display Core
> > +
> > +    DC (Hardware)
> > +      Display Controller
> > +
> > +    DCC
> > +      Delta Colour Compression
> > +
> > +    DCE
> > +      Display Controller Engine
> > +
> > +    DCHUB
> > +      Display Controller HUB
> > +
> > +    ARB
> > +      Arbiter
> > +
> > +    VTG
> > +      Vertical Timing Generator
> > +
> > +    DCN
> > +      Display Core Next
> > +
> > +    DCCG
> > +      Display Clock Generator block
> > +
> > +    DDC
> > +      Display Data Channel
> > +
> > +    DIO
> > +      Display IO
> > +
> > +    DPP
> > +      Display Pipes and Planes
> > +
> > +    DSC
> > +      Display Stream Compression (Reduce the amount of bits to
> > represent pixel
> > +      count while at the same pixel clock)
> > +
> > +    dGPU
> > +      discrete GPU
> > +
> > +    DMIF
> > +      Display Memory Interface
> > +
> > +    DML
> > +      Display Mode Library
> > +
> > +    DMCU
> > +      Display Micro-Controller Unit
> > +
> > +    DMCUB
> > +      Display Micro-Controller Unit, version B
> > +
> > +    DPCD
> > +      DisplayPort Configuration Data
> > +
> > +    DPM(S)
> > +      Display Power Management (Signaling)
> > +
> > +    DRR
> > +      Dynamic Refresh Rate
> > +
> > +    DWB
> > +      Display Writeback
> > +
> > +    FB
> > +      Frame Buffer
> > +
> > +    FBC
> > +      Frame Buffer Compression
> > +
> > +    FEC
> > +      Forward Error Correction
> > +
> > +    FRL
> > +      Fixed Rate Link
> > +
> > +    GCO
> > +      Graphical Controller Object
> > +
> > +    GMC
> > +      Graphic Memory Controller
> > +
> > +    GSL
> > +      Global Swap Lock
> > +
> > +    iGPU
> > +      integrated GPU
> > +
> > +    IH
> > +      Interrupt Handler
> > +
> > +    ISR
> > +      Interrupt Service Request
> > +
> > +    ISV
> > +      Independent Software Vendor
> > +
> > +    KMD
> > +      Kernel Mode Driver
> > +
> > +    LB
> > +      Line Buffer
> > +
> > +    LFC
> > +      Low Framerate Compensation
> > +
> > +    LTTPR
> > +      Link Training Tunable Phy Repeater
> > +
> > +    LUT
> > +      Lookup Table
> > +
> > +    MALL
> > +      Memory Access at Last Level
> > +
> > +    MC
> > +      Memory Controller
> > +
> > +    MPC
> > +      Multiple pipes and plane combine
> > +
> > +    MPO
> > +      Multi Plane Overlay
> > +
> > +    MST
> > +      Multi Stream Transport
> > +
> > +    NBP State
> > +      Northbridge Power State
> > +
> > +    NBIO
> > +      North Bridge Input/Output
> > +
> > +    ODM
> > +      Output Data Mapping
> > +
> > +    OPM
> > +      Output Protection Manager
> > +
> > +    OPP
> > +      Output Plane Processor
> > +
> > +    OPTC
> > +      Output Pipe Timing Combiner
> > +
> > +    OTG
> > +      Output Timing Generator
> > +
> > +    PCON
> > +      Power Controller
> > +
> > +    PGFSM
> > +      Power Gate Finite State Machine
> > +
> > +    PSR
> > +      Panel Self Refresh
> > +
> > +    SCL
> > +      Scaler
> > +
> > +    SDP
> > +      Scalable Data Port
> > +
> > +    SLS
> > +      Single Large Surface
> > +
> > +    SST
> > +      Single Stream Transport
> > +
> > +    TMDS
> > +      Transition-Minimized Differential Signaling
> > +
> > +    TMZ
> > +      Trusted Memory Zone
> > +
> > +    TTU
> > +      Time to Underflow
> > +
> > +    VRR
> > +      Variable Refresh Rate
> > +
> > +    UVD
> > +      Unified Video Decoder
> > diff --git a/Documentation/gpu/amdgpu/display/index.rst
> > b/Documentation/gpu/amdgpu/display/index.rst
> > index fe2ecad8df81..e23c752ee5f5 100644
> > --- a/Documentation/gpu/amdgpu/display/index.rst
> > +++ b/Documentation/gpu/amdgpu/display/index.rst
> > @@ -26,3 +26,4 @@ table of content:
> >     display-manager.rst
> >     dc-debug.rst
> >     dcn-overview.rst
> > +   dc-glossary.rst
> > diff --git a/Documentation/gpu/amdgpu/index.rst
> > b/Documentation/gpu/amdgpu/index.rst
> > index 5c8cbf514097..ff38c360b04e 100644
> > --- a/Documentation/gpu/amdgpu/index.rst
> > +++ b/Documentation/gpu/amdgpu/index.rst
> > @@ -334,3 +334,10 @@ smartshift_bias
> >  
> >  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> >     :doc: smartshift_bias
> > +
> > +AMDGPU Glossary
> > +===============
> > +
> > +.. toctree::
> > +
> > +   amdgpu-glossary.rst
> > --
> > 2.25.1
> > 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> 
