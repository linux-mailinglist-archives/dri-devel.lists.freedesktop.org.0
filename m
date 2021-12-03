Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D675467F15
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 22:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72357AE0E;
	Fri,  3 Dec 2021 21:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B77AE05;
 Fri,  3 Dec 2021 21:06:42 +0000 (UTC)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
 by smtp1-g21.free.fr (Postfix) with ESMTP id AF438B00548;
 Fri,  3 Dec 2021 22:06:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638565600;
 bh=9jg1lskcUDN3pi4qMReu7lKqjuqE5AtG2JZ1cFjLjIo=;
 h=Date:From:To:Cc:In-Reply-To:Subject:From;
 b=IHkL4GyiFz7ho4jBVs3dG5ANconLv/hohyTiBAH68ZvpoyiTcPbRr/LFiT0FGCsRt
 YdI6VuZkkxhpl+VdoeYfhKwR13zxUWzC3KaFUoLuntovtgDfljOIjQaGW1XT0fqA8j
 u98fASlOmz1+zTjzOpc+RGEO4r/2EgaaO9B7vx7ElYhEvtkygAHlkZl/Any280ve39
 RyCzjB0s7Hj18zwfTeEiKxC7Od0NAyKHUn8CCBup5Nbs/Zp5Dh6tjydeaZ3M4LfN6R
 O9NRPclZYgwlVFHkix4fhCcl+/TjOhp6JMdOOvc4NU5wXs/lUJQPQXgby7nMDm0uF5
 RsANMxlYlvXFg==
Date: Fri, 3 Dec 2021 22:06:39 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <480467972.18829393.1638565599646.JavaMail.root@zimbra39-e7>
In-Reply-To: <20211202160132.2263330-6-Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH v2 5/6] Documentation/gpu: Add basic overview of DC
 pipeline
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
Cc: Mark Yacoub <markyacoub@chromium.org>, linux-doc@vger.kernel.org,
 qingqing zhuo <qingqing.zhuo@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 roman li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Roman Gilg <subdiff@gmail.com>, Michel Daenzer <michel@daenzer.net>,
 aurabindo pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> De: "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>
> Objet: [PATCH v2 5/6] Documentation/gpu: Add basic overview of DC pipeline
> 
> This commit describes how DCN works by providing high-level diagrams
> with an explanation of each component. In particular, it details the
> Global Sync signals.
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
>  .../amdgpu/display/dc_pipeline_overview.svg   | 1125
>  +++++++++++++++++
>  .../gpu/amdgpu/display/dcn-overview.rst       |  168 +++
>  .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
>  Documentation/gpu/amdgpu/display/index.rst    |   23 +-
>  5 files changed, 2203 insertions(+), 12 deletions(-)
>  create mode 100644
>  Documentation/gpu/amdgpu/display/config_example.svg
>  create mode 100644
>  Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
>  create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
>  create mode 100644
>  Documentation/gpu/amdgpu/display/global_sync_vblank.svg
> 
...
> diff --git a/Documentation/gpu/amdgpu/display/dcn-overview.rst
> b/Documentation/gpu/amdgpu/display/dcn-overview.rst
> new file mode 100644
> index 000000000000..47e9a70de8ae
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/display/dcn-overview.rst
> @@ -0,0 +1,168 @@
> +=======================
> +Display Core Next (DCN)
> +=======================
> +
> +To equip our readers with the basic knowledge of how AMD Display
> Core Next
> +(DCN) works, we need to start with an overview of the hardware
> pipeline. Below
> +you can see a picture that provides a DCN overview, keep in mind
> that this is a
> +generic diagram, and we have variations per ASIC.
> +
> +.. kernel-figure:: dc_pipeline_overview.svg
> +
> +Based on this diagram, we can pass through each block and briefly
> describe
> +them:

Maybe a note on MMHUBBUB is missing ?

> +
> +* **Display Controller Hub (DCHUB)**: This is the gateway between
> the Scalable
> +  Data Port (SDP) and DCN. This component has multiple features,
> such as memory
> +  arbitration, rotation, and cursor manipulation.
> +
> +* **Display Pipe and Plane (DPP)**: This block provides pre-blend
> pixel
> +  processing such as color space conversion, linearization of pixel
> data, tone
> +  mapping, and gamut mapping.
> +
> +* **Multiple Pipe/Plane Combined (MPC)**: This component performs
> blending of
> +  multiple planes, using global or per-pixel alpha.
> +
> +* **Output Pixel Processing (OPP)**: Process and format pixels to be
> sent to
> +  the display.
> +
> +* **Output Pipe Timing Combiner (OPTC)**: It generates time output
> to combine
> +  streams or divide capabilities. CRC values are generated in this
> block.
> +
> +* **Display Output (DIO)**: Codify the output to the display
> connected to our
> +  GPU.
> +
> +* **Display Writeback (DWB)**: It provides the ability to write the
> output of
> +  the display pipe back to memory as video frames.
> +
> +* **DCN Management Unit (DMU)**: It provides registers with access
> control and
> +  interrupts the controller to the SOC host interrupt unit. This
> block includes
> +  the Display Micro-Controller Unit - version B (DMCUB), which is
> handled via
> +  firmware.
> +
> +* **DCN Clock Generator Block (DCCG)**: It provides the clocks and
> resets
> +  for all of the display controller clock domains.
> +
> +* **Azalia (AZ)**: Audio engine.
> +
> +The above diagram is an architecture generalization of DCN, which
> means that
> +every ASIC has variations around this base model. Notice that the
> display
> +pipeline is connected to the Scalable Data Port (SDP) via DCHUB; you
> can see
> +the SDP as the element from our Data Fabric that feeds the display
> pipe.
> +
> +Always approach the DCN architecture as something flexible that can
> be
> +configured and reconfigured in multiple ways; in other words, each
> block can be
> +setup or ignored accordingly with userspace demands. For example, if
> we
> +want to drive an 8k@60Hz with a DSC enabled, our DCN may require 4
> DPP and 2
> +OPP. It is DC's responsibility to drive the best configuration for
> each
> +specific scenario. Orchestrate all of these components together
> requires a
> +sophisticated communication interface which is highlighted in the
> diagram by
> +the edges that connect each block; from the chart, each connection
> between
> +these blocks represents:
> +
> +1. Pixel data interface (red): Represents the pixel data flow;
> +2. Global sync signals (green): It is a set of synchronization
> signals composed
> +   by VStartup, VUpdate, and VReady;
> +3. Config interface: Responsible to configure blocks;
> +4. Sideband signals: All other signals that do not fit the previous
> one.
> +
> +These signals are essential and play an important role in DCN.
> Nevertheless,
> +the Global Sync deserves an extra level of detail described in the
> next
> +section.
> +
> +All of these components are represented by a data structure named
> dc_state.
> +From DCHUB to MPC, we have a representation called dc_plane; from
> MPC to OPTC,
> +we have dc_stream, and the output (DIO) is handled by dc_link. Keep
> in mind
> +that HUBP accesses a surface using a specific format read from
> memory, and our
> +dc_plane should work to convert all pixels in the plane to something
> that can
> +be sent to the display via dc_stream and dc_link.
> +
> +Front End and Back End
> +----------------------
> +
> +Display pipeline can be broken down into two components that are
> usually
> +referred as **Front End (FE)** and **Back End (BE)**, where FE
> consists of:
> +
> +* DCHUB (Mainly referring to a subcomponent named HUBP)
> +* DPP
> +* MPC
> +
> +On the other hand, BE consist of
> +
> +* OPP
> +* OPTC
> +* DIO (DP/HDMI stream encoder and link encoder)
> +
> +OPP and OPTC are two joining blocks between FE and BE. On a side
> note, this is
> +a one-to-one mapping of the link encoder to PHY, but we can
> configure the DCN
> +to choose which link encoder to connect to which PHY. FE's main
> responsibility
> +is to change, blend and compose pixel data, while BE's job is to
> frame a
> +generic pixel stream to a specific display's pixel stream.
> +
> +Data Flow
> +---------
> +
> +Initially, data is passed in from VRAM through Data Fabric (DF) in
> native pixel
> +formats. Such data format stays through till HUBP in DCHUB, where
> HUBP unpacks
> +different pixel formats and outputs them to DPP in uniform streams
> through 4
> +channels (1 for alpha + 3 for colors).
> +
> +The Converter and Cursor (CNVC) in DPP would then normalize the data
> +representation and convert them to a DCN specific floating-point
> format (i.e.,
> +different from the IEEE floating-point format). In the process, CNVC
> also
> +applies a degamma function to transform the data from non-linear to
> linear
> +space to relax the floating-point calculations following. Data would
> stay in
> +this floating-point format from DPP to OPP.
> +
> +Starting OPP, because color transformation and blending have been
> completed
> +(i.e alpha can be dropped), and the end sinks do not require the
> precision and
> +dynamic range that floating points provide (i.e. all displays are in
> integer
> +depth format), bit-depth reduction/dithering would kick in. In OPP,
> we would
> +also apply a regamma function to introduce the gamma removed earlier
> back.
> +Eventually, we output data in integer format at DIO.
> +
> +Global Sync
> +-----------
> +
> +Many DCN registers are double buffered, most importantly the surface
> address.
> +This allows us to updated DCN hardware atomically for page flips, as
> well as

to update ?

> +for most other updates that don't require enabling or disabling of
> new pipes.
> +
> +(Note: There are many scenarios when DC will decide to reserve extra
> pipes
> +in order to support outputs that need a very high pixel clock, or
> for
> +power saving purposes.)
> +
> +These atomic register updates are driven by global sync signals in
> DCN. In
> +order to understand how atomic updates interact with DCN hardware,
> and how DCN
> +signals page flip and vblank events it is helpful to understand how
> global sync
> +is programmed.
> +
> +Global sync consists of three signals, VSTARTUP, VUPDATE, and
> VREADY. These are
> +calculated by the Display Mode Library - DML
> (drivers/gpu/drm/amd/display/dc/dml)
> +based on a large number of parameters and ensure our hardware is
> able to feed
> +the DCN pipeline without underflows or hangs in any given system
> configuration.
> +The global sync signals always happen during VBlank, are independent
> from the
> +VSync signal, and do not overlap each other.
> +
> +VUPDATE is the only signal that is of interest to the rest of the
> driver stack
> +or userspace clients as it signals the point at which hardware
> latches to
> +atomically programmed (i.e. double buffered) registers. Even though
> it is
> +independent of the VSync signal we use VUPDATE to signal the VSync
> event as it
> +provides the best indication of how atomic commits and hardware
> interact.
> +
> +Since DCN hardware is double-buffered the DC driver is able to
> program the
> +hardware at any point during the frame.
> +
> +The below picture illustrates the global sync signals:
> +
> +.. kernel-figure:: global_sync_vblank.svg
> +
> +These signals affect core DCN behavior. Programming them incorrectly
> will lead
> +to a number of negative consequences, most of them quite
> catastrophic.
> +
> +The following picture shows how global sync allows for a mailbox
> style of
> +updates, i.e. it allows for multiple re-configurations between
> VUpdate
> +events where only the last configuration programmed before the
> VUpdate signal
> +becomes effective.
> +
> +.. kernel-figure:: config_example.svg
...
> diff --git a/Documentation/gpu/amdgpu/display/index.rst
> b/Documentation/gpu/amdgpu/display/index.rst
> index a443866332ac..fe2ecad8df81 100644
> --- a/Documentation/gpu/amdgpu/display/index.rst
> +++ b/Documentation/gpu/amdgpu/display/index.rst
> @@ -2,28 +2,27 @@
>  drm/amd/display - Display Core (DC)
>  ===================================
>  
> -*placeholder - general description of supported platforms, what dc
> is, etc.*
> -
> -Because it is partially shared with other operating systems, the
> Display Core
> -Driver is divided in two pieces.
> +AMD display engine is partially shared with other operating systems;
> for this
> +reason, our Display Core Driver is divided into two pieces:
>  
>  1. **Display Core (DC)** contains the OS-agnostic components. Things
>  like
>     hardware programming and resource management are handled here.
>  2. **Display Manager (DM)** contains the OS-dependent components.
>  Hooks to the
>     amdgpu base driver and DRM are implemented here.
>  
> -It doesn't help that the entire package is frequently referred to as
> DC. But
> -with the context in mind, it should be clear.
> +The display pipe is responsible for "scanning out" a rendered frame
> from the
> +GPU memory (also called VRAM, FrameBuffer, etc.) to a display. In
> other words,
> +it would:
>  
> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default
> for
> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel
> command line.
> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> +1. Read frame information from memory;
> +2. Perform required transformation;
> +3. Send pixel data to sink devices.
>  
> -To determine if DC is loaded, search dmesg for the following entry:
> +If you want to learn more about our driver details, take a look at
> the below
> +table of content:
>  
>  .. toctree::
>  
>     display-manager.rst
>     dc-debug.rst
> -
> -``Display Core initialized with <version number here>``
> +   dcn-overview.rst
> --
> 2.25.1
> 
> 
