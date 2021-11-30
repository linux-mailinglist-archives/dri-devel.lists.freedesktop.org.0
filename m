Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14694636EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8986E241;
	Tue, 30 Nov 2021 14:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7A46E241;
 Tue, 30 Nov 2021 14:39:54 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 7so41552526oip.12;
 Tue, 30 Nov 2021 06:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vZXVsQJkRAjIGJjewCmJM+CDy6jUNuL5JyYXpIblog=;
 b=kguQ6Dgezu156VmjzvIGddRN8eaypoqtG+s7JpBJz6hy5o29PPrMOpvQzEPkgq0QbB
 yuy6qDS0+gdc/dD+SN9bWoETMLUUrYHW7nbB5QZlCTTyT+7JiDg7c/LQnTFjKK7XOB/R
 fDt4vGETarOqTZlxo2tjMLILQy+de7ckHWWMosxNZE8ah7o03WC+avt+kI/yBnWgE343
 IU+ptVPnolBo9w6jwIdoi/2+dhdOQfM/RiWgnZMK3kMCAJ2U/cGLoDlCeFy0RtH7Pwx7
 3e0YMCp9vEBpzi+hLrBYCgpvZnAwCa4lT7j4QVTWVNRE+m6l4YC9la6Y5FGj8bQ4aDsS
 zuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vZXVsQJkRAjIGJjewCmJM+CDy6jUNuL5JyYXpIblog=;
 b=LXLeRXY8Vvg7VPXT3nTCYFyk1zQ6P8F/HYAJpCCXkUMizHSh4HYbzSpEZmAiKn/T04
 lTX8nuHfQoqB1HdZ5KkwJO62OzVuX/91mgWyk6Kp4th+c5Z+lxkHrmdGbjlFWPr2QZ2a
 p/1JJrNBuJpOQSlERxk5xa9pSepVTPz7gKl61dxjI6AfU29JDjORUxZljS7a6lkDrtWe
 HVt1dG8/r8Sz6weqlQrbS3fDds+evNh7qjM2mcfnVJbPZuJt4OJlDDXb06+ZD3KOLArx
 mYEGhqva3NMvGMa0XhLKLt6MlwwBoPS+cuto9+JSogueM5pd1UFCccbNhufZ8R9Br/YT
 H3OQ==
X-Gm-Message-State: AOAM532Gdn2wBU9mMCPX138KDUFWj0RK4xewhZ3qamZ4bMddrm4Qgp5m
 2hAniAluzyMs/F3pJLwoeAQOXdtasaIiapNv1HU=
X-Google-Smtp-Source: ABdhPJyJWimBDg83UfjLgyf/Zb6HIlgWQthDQqchY9Gastff3IWqH3/A94cNfOFVZsTjnMV/Ne1nAB8fG0fruCY0bi0=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr4544808oib.120.1638283194194; 
 Tue, 30 Nov 2021 06:39:54 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_NVcHizoY_xRM4d09B2s9DzWwDhn=YrgJ-3COXNANzE3A@mail.gmail.com>
 <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
In-Reply-To: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Nov 2021 09:39:43 -0500
Message-ID: <CADnq5_OoUOeeKbiTptDsjknjEmU+_ys1BaGYYqDvU6XMtgn0jg@mail.gmail.com>
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
To: Yann Dirson <ydirson@free.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Roman Gilg <subdiff@gmail.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 3:48 PM <ydirson@free.fr> wrote:
>
> Hi Rodrigo,
>
> That will really be helpful!
>
> I know drawing the line is a difficult problem (and can even make things
> harder when searching), but maybe it would make sense to keep generic
> acronyms not specific to amdgpu in a separate list.  I bet a number of
> them would be useful in the scope of other drm drivers (e.g. CRTC, DCC,
> MST), and some are not restricted to the drm subsystem at all (e.g. FEC,
> LUT), but still have value as not necessarily easy to look up.
>
> Maybe "DC glossary" should just be "Glossary", since quite some entries
> help to read adm/amdgpu/ too.  Which brings me to the result of my recent
> searches as suggested entries:
>
>  KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD (hardware
>  queue descriptor), EOP (still no clue :)
>
> Maybe some more specific ones just to be spelled out in clear where they
> are used ?  KCQ (compute queue?), KGQ (gfx queue?)

Kernel Compute Queue and Kernel Graphics Queue.

Alex

>
> More suggestions inlined.
>
> Best regards,
> --
> Yann
>
> > On Thu, Nov 25, 2021 at 10:40 AM Rodrigo Siqueira
> > <Rodrigo.Siqueira@amd.com> wrote:
> > >
> > > In the DC driver, we have multiple acronyms that are not obvious
> > > most of
> > > the time. This commit introduces a DC glossary in order to make it
> > > easier to navigate through our driver.
> > >
> > > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > > ---
> > >  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst   |   2 +-
> > >  Documentation/gpu/amdgpu-dc/dc-glossary.rst | 257
> > >  ++++++++++++++++++++
> > >  2 files changed, 258 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > >
> > > diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > > b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > > index 2e45e83d9a2a..15405c43786a 100644
> > > --- a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > > +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > > @@ -26,4 +26,4 @@ table of content:
> > >     amdgpu-dcn-overview.rst
> > >     amdgpu-dm.rst
> > >     amdgpu-dc-debug.rst
> > > -
> > > +   dc-glossary.rst
> > > diff --git a/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > > b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > > new file mode 100644
> > > index 000000000000..48698fc1799f
> > > --- /dev/null
> > > +++ b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > > @@ -0,0 +1,257 @@
> > > +===========
> > > +DC Glossary
> > > +===========
> > > +
> > > +.. glossary::
> > > +
> > > +    ABM
> > > +      Adaptive Backlight Modulation
> > > +
> > > +    APU
> > > +      Accelerated Processing Unit
> > > +
> > > +    ASIC
> > > +      Application-Specific Integrated Circuit
> > > +
> > > +    ASSR
> > > +      Alternate Scrambler Seed Reset
> > > +
> > > +    AZ
> > > +      Azalia (HD audio DMA engine)
> > > +
> > > +    BPC
> > > +      Bits Per Colour/Component
> > > +
> > > +    BPP
> > > +      Bits Per Pixel
> > > +
> > > +    Clocks
> > > +      * PCLK: Pixel Clock
> > > +      * SYMCLK: Symbol Clock
> > > +      * SOCCLK: GPU Engine Clock
> > > +      * DISPCLK: Display Clock
> > > +      * DPPCLK: DPP Clock
> > > +      * DCFCLK: Display Controller Fabric Clock
> > > +      * REFCLK: Real Time Reference Clock
> > > +      * PPLL: Pixel PLL
> > > +      * FCLK: Fabric Clock
> > > +      * MCLK: Memory Clock
> > > +      * CPLIB: Content Protection Library
> >
> > CPLIB is not a clock.  It should be split out as its own item.
> >
> > > +
> > > +    CRC
> > > +      Cyclic Redundancy Check
> > > +
> > > +    CRTC
> > > +      Cathode Ray Tube Controller - commonly called "Controller" -
> > > Generates
> > > +      raw stream of pixels, clocked at pixel clock
> > > +
> > > +    CVT
> > > +      Coordinated Video Timings
> > > +
> > > +    DAL
> > > +      Display Abstraction layer
>
> I recall this as the old name for DC, maybe this should be mentioned ?
>
> > > +
> > > +    DC (Software)
> > > +      Display Core
> > > +
> > > +    DC (Hardware)
> > > +      Display Controller
> > > +
> > > +    DCC
> > > +      Delta Colour Compression
> > > +
> > > +    DCE
> > > +      Display Controller Engine
> > > +
> > > +    DCHUB
> > > +      Display Controller Hub
> > > +
> > > +    ARB
> > > +      Arbiter
> > > +
> > > +    VTG
> > > +      Vertical Timing Generator
> > > +
> > > +    DCN
> > > +      Display Core Next
> > > +
> > > +    DCCG
> > > +      Display Clock Generator block
> > > +
> > > +    DDC
> > > +      Display Data Channel
> > > +
> > > +    DFS
> > > +      Digital Frequency Synthesizer
> > > +
> > > +    DIO
> > > +      Display IO
> > > +
> > > +    DPP
> > > +      Display Pipes and Planes
> > > +
> > > +    DSC
> > > +      Display Stream Compression (Reduce the amount of bits to
> > > represent pixel
> > > +      count while at the same pixel clock)
> > > +
> > > +    dGPU
> > > +      discrete GPU
> > > +
> > > +    DMIF
> > > +      Display Memory Interface
> > > +
> > > +    DML
> > > +      Display Mode Library
> > > +
> > > +    DMCU
> > > +      Display Micro Controller Unit
> > > +
> > > +    DMCUB
> > > +      Display Micro-Controller Unit, version B
> >
> > Make Micro Controller vs. Micro-Controller consistent for these.
> >
> > > +
> > > +    DPCD
> > > +      DisplayPort Configuration Data
> > > +
> > > +    DPM(S)
> > > +      Display Power Management (Signaling)
> > > +
> > > +    DRR
> > > +      Dynamic Refresh Rate
> > > +
> > > +    DWB
> > > +      Display writeback
> > > +
> > > +    ECP
> > > +      Enhanced Content Protection
> > > +
> > > +    FB
> > > +      Frame Buffer
> > > +
> > > +    FBC
> > > +      Frame Buffer Compression
> > > +
> > > +    FEC
> > > +      Forward Error Correction
> > > +
> > > +    FRL
> > > +      Fixed Rate Link
> > > +
> > > +    GCO
> > > +      Graphical Controller Object
> > > +
> > > +    GMC
> > > +      Graphic Memory Controller
> > > +
> > > +    GSL
> > > +      Global Swap Lock
> > > +
> > > +    iGPU
> > > +      integrated GPU
> > > +
> > > +    IH
> > > +      Interrupt Handler
> > > +
> > > +    ISR
> > > +      Interrupt Service Request
> > > +
> > > +    ISV
> > > +      Independent Software Vendor
> > > +
> > > +    KMD
> > > +      Kernel Mode Driver
> > > +
> > > +    LB
> > > +      Line Buffer
> > > +
> > > +    LFC
> > > +      Low Framerate Compensation
> > > +
> > > +    LTTPR
> > > +      Link Training Tunable Phy Repeater
> > > +
> > > +    LUT
> > > +      Lookup Table
> > > +
> > > +    MALL
> > > +      Memory Access at Last Level
> > > +
> > > +    MC
> > > +      Memory Controller
> > > +
> > > +    MPC
> > > +      Multiple pipes and plane combine
> > > +
> > > +    MPO
> > > +      Multi Plane Overlay
> > > +
> > > +    MST
> > > +      Multi Stream Transport
> > > +
> > > +    NBP State
> > > +      Northbridge Power State
> > > +
> > > +    NBIO
> > > +      North Bridge Input/Output
> > > +
> > > +    ODM
> > > +      Output Data Mapping
> > > +
> > > +    OPM
> > > +      Output Protection Manager
> > > +
> > > +    OPP
> > > +      Output Plane Processor
> > > +
> > > +    OPTC
> > > +      Output Pipe Timing Combiner
> > > +
> > > +    OTG
> > > +      Output Timing Generator
> > > +
> > > +    PCON
> > > +      Power Controller
> > > +
> > > +    PGFSM
> > > +      Power Gate Finite State Machine
> > > +
> > > +    PPLib
> > > +      PowerPlay Library
> >
> > Maybe say that powerplay is the power management component.
> >
> > > +
> > > +    PSR
> > > +      Panel Self Refresh
> > > +
> > > +    SCL
> > > +      Scaler
> > > +
> > > +    SDP
> > > +      Scalable Data Port
> > > +
> > > +    SMU
> > > +      System Management Unit
> > > +
> > > +    SLS
> > > +      Single Large Surface
> > > +
> > > +    SST
> > > +      Single Stream Transport
> > > +
> > > +    TMDS
> > > +      Transition-Minimized Differential Signaling
> > > +
> > > +    TMZ
> > > +      Trusted Memory Zone
> > > +
> > > +    TTU
> > > +      Time to Underflow
> > > +
> > > +    VRR
> > > +      Variable Refresh Rate
> > > +
> > > +    UVD
> > > +      Unified Video Decoder
> > > +
> > > +    VCE
> > > +      Video Compression Engine
> > > +
> > > +    VCN
> > > +      Video Codec Next
> > > --
> > > 2.25.1
> > >
> >
