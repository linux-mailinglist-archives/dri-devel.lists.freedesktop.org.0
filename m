Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDC2DCF12
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EE76E21C;
	Thu, 17 Dec 2020 10:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6878C89221
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:06:32 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id 11so26705715oty.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tHtpcTR/08FM9RSBLxTm9nzhr1PLovQ8Q+Zogm9jkc=;
 b=KcAoqw/jyUdVgzYx1Qus+jkgMPmz9ohPB+OT2c7OHiLbd/QlGQLrgY9+h+jigYMmwG
 gJcjfB0K9nzwrK/rM8SbjLvNV7TEkAZgfU0G937VK8O6XRsi11cAF+k5c7WGQwmeP0Hg
 i16xFaSU+39OwdJxuP1wPdxxHPi8aA8t2HBfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tHtpcTR/08FM9RSBLxTm9nzhr1PLovQ8Q+Zogm9jkc=;
 b=AJaHSGlZJE1hCHAOKZARYyacu/GOsMNkoJnPVnoFi7XgThuU8U0UhfWHns0eJt114L
 Ci2qkc7U7y/DlAKAFYJQTDQSexSWcHluXwo+t14QGK5RAh/fEnSHm4zaEN8oidt7rHv0
 zbhxdy6q0kaTgxEOdKqBMOzvwsAfsxLhyNKV6/HAZhM+/UQd4jCLDzhyIQW4ZZ8n67u+
 PURjnsOvInSbhBPbQ1Tanr9/wyFA09FKhTRi9EO1ytyebVJ2CcqJE7b+Ew7hdXo0HdGw
 J2V96YAj59E0to/M/SfThAe1RDLRzIQxnufYHe3Wfs37L2LmCLQigs5vKl9oZhSJgeid
 i1qA==
X-Gm-Message-State: AOAM533+uBv8FNPv5aNXbge0XBoNd9o9GlYuGiT3DvrSlItcmtbR40IU
 2Zrs7Jkj/ASkYBxxSwfx91zWASfHgBt50fOy9fRjoQ==
X-Google-Smtp-Source: ABdhPJwWKBrnXb4CDjpXcbBs/tMlwtWspKEQCkvamsO1KhfJn+2RqBRcICNDhnpw2bUYVRVn5sc9MqtX0nA9MrV6GBM=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr20187278otb.303.1608199591499; 
 Thu, 17 Dec 2020 02:06:31 -0800 (PST)
MIME-Version: 1.0
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
 <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
 <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
 <CADnq5_N7Q_6jfghWQGs17gzT2Ucj_19v9V4s7G0wPStVn+mftQ@mail.gmail.com>
 <83491d22-64b6-68bd-b7e2-787e0826712c@xilinx.com>
In-Reply-To: <83491d22-64b6-68bd-b7e2-787e0826712c@xilinx.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Dec 2020 11:06:20 +0100
Message-ID: <CAKMK7uHeS9zdv=ZBbft3_qqED9iqt=-GyY1OVkX97GPuKn=mRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To: Jiaying Liang <wendy.liang@xilinx.com>
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
Cc: tejas.patel@xilinx.com, devicetree <devicetree@vger.kernel.org>,
 rajan.vaja@xilinx.com, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 manish.narani@xilinx.com, Derek Kiernan <derek.kiernan@xilinx.com>,
 linux-media <linux-media@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, ravi.patel@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 9:40 AM Jiaying Liang <wendy.liang@xilinx.com> wrote:
>
>
> On 12/15/20 7:23 AM, Alex Deucher wrote:
> > On Mon, Dec 14, 2020 at 7:24 PM Jiaying Liang<wendy.liang@xilinx.com>  wrote:
> >> On 12/11/20 11:39 AM, Daniel Vetter wrote:
> >>> Hi all
> >>>
> >>> On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher<alexdeucher@gmail.com>   wrote:
> >>>> On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang<wendy.liang@xilinx.com>   wrote:
> >>>>> AI engine is the acceleration engine provided by Xilinx. These engines
> >>>>> provide high compute density for vector-based algorithms, and flexible
> >>>>> custom compute and data movement. It has core tiles for compute and
> >>>>> shim tiles to interface the FPGA fabric.
> >>>>>
> >>>>> You can check the AI engine architecture document for more hardware details:
> >>>>> https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
> >>>>>
> >>>>> This patch series adds a Linux kernel driver to manage the Xilinx AI
> >>>>> engine array device and AI engine partitions (groups of AI engine tiles
> >>>>> dedicated to an application).
> >>>> Hi Wendy,
> >>>>
> >>>> I think it would be good to provide an overview of how your stack
> >>>> works in general.  That would give reviewers a better handle on how
> >>>> all of this fits together.  I'd suggest including an overview in the
> >>>> cover letter and also in the commit message and/or as a comment in the
> >>>> code in one of the patches.  I'm not really an expert when it comes to
> >>>> FPGAs, but this basically looks like a pretty low level interface to
> >>>> set up the data fabric for a kernel that will run on the soft logic or
> >>>> maybe the microcontroller on the board.  It doesn't have to be super
> >>>> detailed, just a nice flow for how you might use this.  E.g.,
> >>>>
> >>>> Userspace uses ioctls X, Y, Z to configure the data fabric for the
> >>>> FPGA kernel.  The kernels can run on... .  DMA access to system memory
> >>>> for data sets can be allocated using ioctl A.  DMA access is limited
> >>>> by... . The user can then load the FPGA kernel on to one of the
> >>>> engines using ioctl B and finally they can kick off the whole thing
> >>>> using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
> >>>> use the following runtime (link to runtime) to configure the data
> >>>> fabric using ioctls X, Y, Z.
> >>> At least for drm drivers we ideally have that as a .rst file in
> >>> Documentation/. With that you can even do full svg graphs, or just dot
> >>> graphs, of the overall stack if you really want to go overboard :-)
> >>>
> >>>> It would also be good to go over the security implications of the
> >>>> design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
> >>>> or is it limited to just the DMA regions set up by the ioctls?  Also,
> >>>> does the hardware and software design allow for multiple users?  If
> >>>> so, how does that work?
> >>> I've also seen indications that there's some on-chip or on-card
> >>> memory. How that's planned to be used and whether we want to manage
> >>> this (maybe even with something like ttm) would be good to understand.
> >>>
> >>> All excellent questions from Alex, just figured I add some more.
> >>>
> >>> Cheers, Daniel
> >> Hi Alex, Daniel,
> >>
> >> Below is an overview of the driver.
> >>
> >> AI engine kernel driver manages Xilinx AI engine device. An AI engine device
> >> contains cores tiles and SHIM tiles. Core tiles are the computation tiles
> >> , the SHIM tiles are the tiles interfacing to external components.
> >>
> >>             +--------+--------+--------+--------+
> >>              | Core        | Core        | Core        | Core | ...
> >>              |                |                | |                |
> >>             +-----------------------------------+
> >>              | Core        | Core        | Core        | Core     | ...
> >>              |                |                | |             |
> >>             +--------+--------+--------+---------
> >>              ...
> >>             +--------+--------+-----------------+
> >>             | SHIM        | SHIM       | SHIM       |SHIM        |
> >>             | PL            | PL           | PL            |PL | NOC  |
> >>             +---+----+---+----+---+-----+-------+
> >>     AXI Streams   |        |                |              |    |AXI MM
> >>                          |        |                | |    |
> >> Events Singals |        |                |              |    |
> >>                          |        |                | |    |
> >>                          |        |                | |    |
> >>             +---+--------+--------+-----+ +--+------+
> >>             |       FPGA                                        | |
> >> NOC        |
> >>             | | |                  |
> >>             +---------------------------+ +--+-------+
> >>                                              |
> >>                                              |
> >>                                          +---+------+
> >>                                          |   DDR           |
> >>                                          +----------+
> >>
> >> Each Core tile contains computing module, local memory and DMA module. The
> >> local memory DMA module takes data from or to the AXI streams and writes
> >> it to or reads it from the local memory. The computing module can also
> >> directly get/put data from/to the AXI stream. The AIE SHIM enables AIE tiles
> >> to get/put data from/to AXI streams from FPGA, enables external master to
> >> access AI engine address space through AXI MM. SHIM NoC module has DMA
> >> engine,
> >> which can access extern memory though AXI MM and push it to internal AXI
> >> streams.
> >>
> >> At runtime, the AI engine tiles interconnection needs to be configured
> >> so that
> >> it can get fetch data from external components or adjacent tiles, and AI
> >> engine
> >> core program needs to be loaded. And then user application can push data
> >> to the
> >> AI engine array and start/stop AI engine core. AI engine device errors
> >> can be
> >> raised as events, the AI engine kernel driver listens to the events
> >> interrupt
> >> to monitor runtime async device errors.
> >>
> >> Instead of application directly interacting with the AI engine kernel
> >> APIs, user
> >> application/libraries interacts with AI engine userspace library:
> >> https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/aienginev2
> >> It provides cross OSes low level functional abstraction such as how to
> >> connect one
> >> stream port to another stream port, how to configure core tile local DMA.
> >>
> >> The AI engine library can be used by other runtime libraries such as
> >> Xilinx runtime (XRT)
> >> library:https://xilinx.github.io/XRT/master/html/index.html,
> >> which provides acceleration abstraction for Xilinx accelerators, it has
> >> extensions
> >> to interface to other acceleration framework such as OpenCL.
> >> XRT provides buffer handling abstractions for user application to share
> >> data between
> >> applicaiton and devices.
> >>
> >> Here is an example of application runtime stack:
> >>
> >>               +----------------------------+
> >>               |      Application                              |
> >>               | |
> >>               +----------------------------+
> >>               |       XRT                                        |
> >>               | |
> >>               +----------------------------+
> >>               |      AIE Library                               |
> >>               | |
> >>              +----------------------------+
> >>       +----------------------------------------+
> >> Kern    +----------------------------+
> >>               |         AIE Partition                        +--+
> >>              +----------------------------+    |
> >>                     |----------------------------+
> >>               +----------------------------+
> >>                |         AIE Device                           |
> >>                | |
> >>               +----------------------------+
> >>
> >>
> >>
> >> The AI engine kernel driver provides the following user interfaces:
> >>    * AIE device driver is the root device driver to manage the partitions of
> >>      of the AI engine device array. AI engine array can be partitioned into
> >>      column wised isolated partitions. Each applicaiton can only access its
> >>      own partitions.
> >>    * AIE device driver monitors the interrupt from the AI enigne device. All
> >>      AI engine tiles shared the same interrupt for error events.
> >>    * AIE partition driver controls address mapping and access of the
> >>      registers/local memories of the tiles within a partition.
> >>      * It provides mmap operation to enable application to direclty
> >> access the
> >>        tiles local memories for small data update such as parameter
> >> update for
> >>        performance.
> >>      * It provides mmap operatio to map all the registers as readonly for
> >>        application to poll registers efficiently to check status.
> >>      * It provides ioctl for userspace to pass I/O commands to write/mask
> >> write
> >>        the registers. How to configure is defined by userspace. Userspace
> >> will
> >>        pass the I/O commands sequence to the kernel driver, and kernel driver
> >>        will validate the commands before it writes to the registers.
> >>      * It provides ioctl to import dmabuf and ioctl to configure the the
> >> DMA module
> >>        in the SHIM tile which can access memory outside AI engine array.
> >>
> >> The buffer management is out of this driver. In the above example, user
> >> application
> >> uses Xilinx runtime(XRT), XRT is the one to manage the buffers.
> >>
> > So if I understand this correctly, this driver handles the resource
> > management for the AI engines, PLs (programmable logic), and DMA
> > streams.  I think it's important to understand that there are multiple
> > address spaces here.  Normally when we talk about DMA in the kernel we
> > are referring to devices accessing an external resource like system
> > memory on the host CPU or another device's MMIO space (e.g., another
> > PCIe device).  It would be good to clarify which address spaces the
> > DMAs in your diagram refer to.  I think the DMAs in the AI engines are
> > specifically for DMAs within the AI engine logic (e.g., between AIs in
> > a partition).  How is DMA to system memory handled?  What about
> > dedicated memory on the FPGA (e.g., HBM or DDR on the FPGA itself)?
> > Is that what you are exposing as DMA bufs?  When you allocate a
> > DMA-buf for a partition, is that partition only allowed to access
> > memory that is part of that DMA buf?  I presume there is some
> > scatter/gather table that sets up the DMA range that the partition can
> > access?  Who loads the soft logic (Is that the PL or some other IP)?
> > Is the soft logic partitioned as well?  If I had some soft logic I
> > wanted to run on the FPGA, what would the kernel driver interaction
> > sequence look like?  Maybe using the OpenCL soft logic would be a good
> > example.  E.g.,
>
> The AI engine driver only manage the resources within the AI
>
> engine array. There are two types of DMAs of the AI engine device.
>
> one is the AI engine tile local memory DMA which can only access the local
>
> memory. There is another type of DMA which is in the SHIM tile. This
>
> DMA can access external address space such as DDR. Although it can acess
>
> the memory on fpga if user configure the platform that way, it is
> preferred to
>
> use PL data mover to move data between FPGA memory and AI engine device.
>
> The PL data mover will not be managed by the AI engine driver.
>
> One SHIM DMA has up to 16 buffer descriptors to use.
>
> Xilinx FPGA manager is the one used to program the FPGA soft logic.
>
> E.g. when XRT is used, if AI engine is connected to FPGA logic, the XRT
> stack is
>
> the one to manage the configuration sequence.
>
> > 1. user has soft logic blob generated by their soft logic compiler (is
> > this compiler open source?)
> The soft logic blob is generated by Xilinx tools which is not open
> source yet.
> > 2. user calls AI engine kernel driver to allocate the required
> > resources (AI engines, AI engine DMAs, doorbells of some sort?  etc.)
>
> User will call AI engine kernel driver to allocate required resources within
>
> the AI engine array at runtime.
>
> However the patches for it is not in this patch set.
>
> > 3. user calls AI engine kernel driver to allocate system memory and/or
> > FGPA memory that can be used by the soft logic blob
>
> AI engine kernel driver doesn't allocate system memory. User can use other
>
> kernel driver to allocate memory.
>
> E.g. when XRT is used, user calls XRT kernel driver (zocl) to allocate
> system memory.
>
> So far, the FPGA memory is usually assigned to a soft data mover when
> the platform is
>
> created. Are you considering to have the FPGA memory in the DMA pool of the
>
> system? If it is dedicated to a device, can reserved memory solve this
> problem?
>
> The AI engine kernel driver doesn't consider this yet.
>
> > 4. user calls AI engine kernel driver to load soft logic
>
> I assume you are referring to the soft logic on the FPGA side which is not
>
> part of the AI engine device. FPGA manager is the one to load the soft
> logic on FPGA.
>
> > 5. user interfaces with soft logic (how? presumably via some memory
> > resource allocated in 2 and 3?)
>
> I assume you are referring to the soft logic on the FPGA side (not the
> AI engine device)
>
> The user interface with soft logic is managed by the soft logic IP driver.
>
> Each soft logic has some memory mapped control registers. User can
> access those
>
> registers through the soft logic IP driver.
>
> About memory allocation, I think it is better to manage the shared
> memory out of
>
> a specific device driver. Are you looking for memory management which covers
>
> both the system memory and fpga memory, and the device can specify which
> memory
>
> it prefers?

Ok, I think the picture is getting clearer. But now I'm wondering why
you have any interactions with dma-buf in this patch series here?
-Daniel


> Thanks,
>
> Wendy
>
> >
> > Thanks,
> >
> > Alex
> >
> >
> >> Best Regards,
> >>
> >> Wendy
> >>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>>
> >>>>> v3:
> >>>>> * unlock AIE dev mutex after failed to gain the partition lock in
> >>>>>     errors handing
> >>>>> * replace pointer with __u64 and enum with __u32 in ioctl
> >>>>>
> >>>>> v2:
> >>>>> * Fix dtschema check errors
> >>>>> * Fix test bot warning on interrupt implementation. Removed set but
> >>>>>     unused  varaible.
> >>>>> * Fix compilation unused function warning of firmware change in case
> >>>>>     ZynqMP firmware is not configured
> >>>>> * There are other warning on ZynqMP firmware reported from testbot
> >>>>>     which is not introduced by this patch set.
> >>>>>     "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
> >>>>>     for those fixes.
> >>>>>
> >>>>>
> >>>>> Izhar Ameer Shaikh (1):
> >>>>>     firmware: xilinx: Add IOCTL support for AIE ISR Clear
> >>>>>
> >>>>> Nishad Saraf (2):
> >>>>>     misc: xilinx-ai-engine: Add support to request device management
> >>>>>       services
> >>>>>     misc: xilinx-ai-engine: Add support for servicing error interrupts
> >>>>>
> >>>>> Wendy Liang (6):
> >>>>>     dt-binding: soc: xilinx: ai-engine: Add AI engine binding
> >>>>>     misc: Add Xilinx AI engine device driver
> >>>>>     misc: xilinx-ai-engine: Implement AI engine cleanup sequence
> >>>>>     misc: xilinx-ai-engine: expose AI engine tile memories to userspace
> >>>>>     misc: xilinx-ai-engine: add setting shim dma bd operation
> >>>>>     misc: xilinx-ai-engine: add request and release tiles
> >>>>>
> >>>>>    .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
> >>>>>    MAINTAINERS                                        |   8 +
> >>>>>    drivers/firmware/xilinx/zynqmp.c                   |  14 +
> >>>>>    drivers/misc/Kconfig                               |  12 +
> >>>>>    drivers/misc/Makefile                              |   1 +
> >>>>>    drivers/misc/xilinx-ai-engine/Makefile             |  16 +
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
> >>>>>    .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
> >>>>>    drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
> >>>>>    include/linux/firmware/xlnx-zynqmp.h               |   8 +
> >>>>>    include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
> >>>>>    18 files changed, 4719 insertions(+)
> >>>>>    create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
> >>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
> >>>>>    create mode 100644 include/uapi/linux/xlnx-ai-engine.h
> >>>>>
> >>>>> --
> >>>>> 2.7.4
> >>>>>
> >>>>> _______________________________________________
> >>>>> dri-devel mailing list
> >>>>> dri-devel@lists.freedesktop.org
> >>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
