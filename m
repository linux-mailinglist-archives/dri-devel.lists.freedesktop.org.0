Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DEE46C290
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 19:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9448F6F572;
	Tue,  7 Dec 2021 18:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932636F572
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 18:19:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a18so31338624wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ryBB1dJoJAjwQetkQUG1CkdXjTwGO2uIq3Be4erfjLI=;
 b=GkieuRCAxWKFS03VV9C6Bquc4bDeerCOXSoIFakdnaM7ADQo9mPtOFZAaiYO5pe1zJ
 N9Vrb1Pe+MdDqFqIE9ivzVkr98Y7WZRvw/f2e8+tobjY82al+y5Y8O6uMahnUXVGikU8
 D3/G5zcSlX2AKONlLp775RfJ9rbYEAGp7rdOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ryBB1dJoJAjwQetkQUG1CkdXjTwGO2uIq3Be4erfjLI=;
 b=JMvytYTWh8Xq/gH87pjYNlqsND4SlwPr6wib0vj5roMzTGSAb8fB/PKTUi7e3ByRDT
 fvIAJK/ZvHKqzW6XdIBDD64sxOuN+XQJRTLanBSBfJsiU1j38fUWclt3odlj2ciRgASl
 Cnptr4mMg14reNT5PbVTI9zBFSpJsKLHYpMmYZLEVLWVX7e4ktlv7OcKfdL1vQ247Rkh
 MOI6aTVd62PisryqVXLxzd5E0MFpdp8s4deTFiC5giwMIurx92LnWbJ0/gjBShjyIp/A
 fiTDRccJXWKXQPUl/MeS1z7wNzgP5P9Gl5EmJfQaRYFOu1UNVJsyj6IhYMmRsf2/Bycf
 oqvA==
X-Gm-Message-State: AOAM5316hWHSS9JiywK/BzSrpnrtf0ObljKW6uGsRxuM6HoDJ8jReUkG
 5c5x6hm59wIaEjyBDy9BbeaN1A==
X-Google-Smtp-Source: ABdhPJys+7fkflB/7uVRaDXSUkVakrY1E7ZzZ4ixrqIvd1ejF0OBx2V85+mJtPAb8y/5g4keFYmJng==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr53846531wrw.21.1638901150128; 
 Tue, 07 Dec 2021 10:19:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y6sm3346625wma.37.2021.12.07.10.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 10:19:09 -0800 (PST)
Date: Tue, 7 Dec 2021 19:19:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
Message-ID: <Ya+lm9B8opSSkHsu@phenom.ffwll.local>
References: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
 <20211202160132.2263330-7-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202160132.2263330-7-Rodrigo.Siqueira@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 Roman Gilg <subdiff@gmail.com>, Marek Olsak <marek.olsak@amd.com>,
 Yann Dirson <ydirson@free.fr>, Michel Daenzer <michel@daenzer.net>,
 Sean Paul <seanpaul@chromium.org>, bhawanpreet.lakha@amd.com,
 Mark Yacoub <markyacoub@chromium.org>, qingqing.zhuo@amd.com, roman.li@amd.com,
 Christian Koenig <christian.koenig@amd.com>, nicholas.choi@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 11:01:32AM -0500, Rodrigo Siqueira wrote:
> In the DC driver, we have multiple acronyms that are not obvious most of
> the time; the same idea is valid for amdgpu. This commit introduces a DC
> and amdgpu glossary in order to make it easier to navigate through our
> driver.
> 
> Changes since V1:
>  - Yann: Divide glossary based on driver context.
>  - Alex: Make terms more consistent and update CPLIB
>  - Add new acronyms to the glossary
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
>  .../gpu/amdgpu/display/dc-glossary.rst        | 243 ++++++++++++++++++
>  Documentation/gpu/amdgpu/display/index.rst    |   1 +
>  Documentation/gpu/amdgpu/index.rst            |   7 +
>  4 files changed, 298 insertions(+)
>  create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
> 
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> new file mode 100644
> index 000000000000..e635851025e7
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -0,0 +1,47 @@
> +===============
> +AMDGPU Glossary
> +===============
> +
> +Here you can find some generic acronyms used in the amdgpu driver. Notice that
> +we have a dedicated glossary for Display Core.

Maybe add a link to that here so it's easier to find? sphinx autogenerates
header targets so pretty easy (if the heading is unique at least).
-Daniel

> +
> +.. glossary::
> +
> +    CPLIB
> +      Content Protection Library
> +
> +    DFS
> +      Digital Frequency Synthesizer
> +
> +    ECP
> +      Enhanced Content Protection
> +
> +    EOP
> +      End Of Pipe/Pipeline
> +
> +    HQD
> +      Hardware Queue Descriptor
> +
> +    KCQ
> +      Kernel Compute Queue
> +
> +    KGQ
> +      Kernel Graphics Queue
> +
> +    KIQ
> +      Kernel Interface Queue
> +
> +    MQD
> +      Memory Queue Descriptor
> +
> +    PPLib
> +      PowerPlay Library - PowerPlay is the power management component.
> +
> +    SMU
> +      System Management Unit
> +
> +    VCE
> +      Video Compression Engine
> +
> +    VCN
> +      Video Codec Next
> diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> new file mode 100644
> index 000000000000..547c0bfbb3e2
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> @@ -0,0 +1,243 @@
> +===========
> +DC Glossary
> +===========
> +
> +On this page, we try to keep track of acronyms related to the display
> +component. If you do not find what you are looking for, look at the amdgpu
> +glossary; if you cannot find it anywhere, consider asking in the amdgfx and
> +update this page.
> +
> +.. glossary::
> +
> +    ABM
> +      Adaptive Backlight Modulation
> +
> +    APU
> +      Accelerated Processing Unit
> +
> +    ASIC
> +      Application-Specific Integrated Circuit
> +
> +    ASSR
> +      Alternate Scrambler Seed Reset
> +
> +    AZ
> +      Azalia (HD audio DMA engine)
> +
> +    BPC
> +      Bits Per Colour/Component
> +
> +    BPP
> +      Bits Per Pixel
> +
> +    Clocks
> +      * PCLK: Pixel Clock
> +      * SYMCLK: Symbol Clock
> +      * SOCCLK: GPU Engine Clock
> +      * DISPCLK: Display Clock
> +      * DPPCLK: DPP Clock
> +      * DCFCLK: Display Controller Fabric Clock
> +      * REFCLK: Real Time Reference Clock
> +      * PPLL: Pixel PLL
> +      * FCLK: Fabric Clock
> +      * MCLK: Memory Clock
> +
> +    CRC
> +      Cyclic Redundancy Check
> +
> +    CRTC
> +      Cathode Ray Tube Controller - commonly called "Controller" - Generates
> +      raw stream of pixels, clocked at pixel clock
> +
> +    CVT
> +      Coordinated Video Timings
> +
> +    DAL
> +      Display Abstraction layer
> +
> +    DC (Software)
> +      Display Core
> +
> +    DC (Hardware)
> +      Display Controller
> +
> +    DCC
> +      Delta Colour Compression
> +
> +    DCE
> +      Display Controller Engine
> +
> +    DCHUB
> +      Display Controller HUB
> +
> +    ARB
> +      Arbiter
> +
> +    VTG
> +      Vertical Timing Generator
> +
> +    DCN
> +      Display Core Next
> +
> +    DCCG
> +      Display Clock Generator block
> +
> +    DDC
> +      Display Data Channel
> +
> +    DIO
> +      Display IO
> +
> +    DPP
> +      Display Pipes and Planes
> +
> +    DSC
> +      Display Stream Compression (Reduce the amount of bits to represent pixel
> +      count while at the same pixel clock)
> +
> +    dGPU
> +      discrete GPU
> +
> +    DMIF
> +      Display Memory Interface
> +
> +    DML
> +      Display Mode Library
> +
> +    DMCU
> +      Display Micro-Controller Unit
> +
> +    DMCUB
> +      Display Micro-Controller Unit, version B
> +
> +    DPCD
> +      DisplayPort Configuration Data
> +
> +    DPM(S)
> +      Display Power Management (Signaling)
> +
> +    DRR
> +      Dynamic Refresh Rate
> +
> +    DWB
> +      Display Writeback
> +
> +    FB
> +      Frame Buffer
> +
> +    FBC
> +      Frame Buffer Compression
> +
> +    FEC
> +      Forward Error Correction
> +
> +    FRL
> +      Fixed Rate Link
> +
> +    GCO
> +      Graphical Controller Object
> +
> +    GMC
> +      Graphic Memory Controller
> +
> +    GSL
> +      Global Swap Lock
> +
> +    iGPU
> +      integrated GPU
> +
> +    IH
> +      Interrupt Handler
> +
> +    ISR
> +      Interrupt Service Request
> +
> +    ISV
> +      Independent Software Vendor
> +
> +    KMD
> +      Kernel Mode Driver
> +
> +    LB
> +      Line Buffer
> +
> +    LFC
> +      Low Framerate Compensation
> +
> +    LTTPR
> +      Link Training Tunable Phy Repeater
> +
> +    LUT
> +      Lookup Table
> +
> +    MALL
> +      Memory Access at Last Level
> +
> +    MC
> +      Memory Controller
> +
> +    MPC
> +      Multiple pipes and plane combine
> +
> +    MPO
> +      Multi Plane Overlay
> +
> +    MST
> +      Multi Stream Transport
> +
> +    NBP State
> +      Northbridge Power State
> +
> +    NBIO
> +      North Bridge Input/Output
> +
> +    ODM
> +      Output Data Mapping
> +
> +    OPM
> +      Output Protection Manager
> +
> +    OPP
> +      Output Plane Processor
> +
> +    OPTC
> +      Output Pipe Timing Combiner
> +
> +    OTG
> +      Output Timing Generator
> +
> +    PCON
> +      Power Controller
> +
> +    PGFSM
> +      Power Gate Finite State Machine
> +
> +    PSR
> +      Panel Self Refresh
> +
> +    SCL
> +      Scaler
> +
> +    SDP
> +      Scalable Data Port
> +
> +    SLS
> +      Single Large Surface
> +
> +    SST
> +      Single Stream Transport
> +
> +    TMDS
> +      Transition-Minimized Differential Signaling
> +
> +    TMZ
> +      Trusted Memory Zone
> +
> +    TTU
> +      Time to Underflow
> +
> +    VRR
> +      Variable Refresh Rate
> +
> +    UVD
> +      Unified Video Decoder
> diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
> index fe2ecad8df81..e23c752ee5f5 100644
> --- a/Documentation/gpu/amdgpu/display/index.rst
> +++ b/Documentation/gpu/amdgpu/display/index.rst
> @@ -26,3 +26,4 @@ table of content:
>     display-manager.rst
>     dc-debug.rst
>     dcn-overview.rst
> +   dc-glossary.rst
> diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
> index 5c8cbf514097..ff38c360b04e 100644
> --- a/Documentation/gpu/amdgpu/index.rst
> +++ b/Documentation/gpu/amdgpu/index.rst
> @@ -334,3 +334,10 @@ smartshift_bias
>  
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: smartshift_bias
> +
> +AMDGPU Glossary
> +===============
> +
> +.. toctree::
> +
> +   amdgpu-glossary.rst
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
