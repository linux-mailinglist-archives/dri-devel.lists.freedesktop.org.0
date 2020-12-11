Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D42D7EFC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 20:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A093F6EA5E;
	Fri, 11 Dec 2020 19:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCE36EA5E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 19:03:31 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id b18so9194701ots.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 11:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hMSZzneyru50Jjj6PQ349xugCKpWN0AAxELTHUziJRQ=;
 b=e/3x12FgAZ2f6zDCJbdCrGnFjHRooeKYCO5Lj/7CTcVjWow3xKvntvdwjioO+bb+xv
 g9XYxsfeTtpYsapnCuBfdjL2E7koXIYCOQOsbIuV3cbxA5qZrgNegyd1sQl7PlF71lpj
 SFLfykKC+SoOxkdRyDY7aF09ldBEKqHcYwdaaZN/Qcyj12PINOF+3yuVZYoKeeZ54fy/
 3fTDlCXaVPH9rCNy5P18xqTAaZOozDv4Yk4IMDxOPcCy2rO6nfE39MwRX2kK6p3LjL3t
 LRLTN/3+N+n4QK9WKV/LJU1MPOpLFRJ+wJf8Jc1szsU7TJNgp40ePZvE4VvKa2audbFK
 vrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMSZzneyru50Jjj6PQ349xugCKpWN0AAxELTHUziJRQ=;
 b=mHU0vWDdMYNvZqawexv70/8mz9e0dG7ket43D+mez5yH8imujW7wUEcp47QyfnP3f4
 4jhVADyQUSCkUeY3/3e9htMyuaH6MAaIYCFWYLurtdm/BJV/hIkb67Fqp5ZqMpEC87g1
 JDm3km3Wh/ya0SCjEXINtkV/GNLHsxm8ILK5uXxpF38CG8CH3zsZ2iZv9onw2o1EIu/G
 Kabce0PPavyqMRW9WlyEMO2ziyu8hlnu2esfi2d5PXqs0Qudk3SHwRsbT5vvv94xDfsF
 gfMllw2h6SijUXfJDt4EoL8A9onA1UEgoRoaHUp+KVL+UIsRJf1YBwJVUX4MDje1aoFF
 71qg==
X-Gm-Message-State: AOAM530O6nVQEu1VPPRfMbuPK50w2jg1Bi0HIKflraQwUqETZw0/tn3m
 ypdgRiSQG2pZCSpLTLd6SEEvIagHoLAoVumzu/I=
X-Google-Smtp-Source: ABdhPJy2mrdQLQnweRVWCZf1CH2ySoGSW/W3cTUdlzTnUQYgB4HAULPfBkRMIXrFL6f67AOxSFdhFpOO4seosF1t2Js=
X-Received: by 2002:a9d:4ce:: with SMTP id 72mr10975948otm.23.1607713410935;
 Fri, 11 Dec 2020 11:03:30 -0800 (PST)
MIME-Version: 1.0
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Dec 2020 14:03:19 -0500
Message-ID: <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To: Wendy Liang <wendy.liang@xilinx.com>
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
Cc: tejas.patel@xilinx.com, ravi.patel@xilinx.com, rajan.vaja@xilinx.com,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, dragan.cvetic@xilinx.com,
 michal.simek@xilinx.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, manish.narani@xilinx.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 derek.kiernan@xilinx.com, Christian Koenig <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang <wendy.liang@xilinx.com> wrote:
>
> AI engine is the acceleration engine provided by Xilinx. These engines
> provide high compute density for vector-based algorithms, and flexible
> custom compute and data movement. It has core tiles for compute and
> shim tiles to interface the FPGA fabric.
>
> You can check the AI engine architecture document for more hardware details:
> https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
>
> This patch series adds a Linux kernel driver to manage the Xilinx AI
> engine array device and AI engine partitions (groups of AI engine tiles
> dedicated to an application).

Hi Wendy,

I think it would be good to provide an overview of how your stack
works in general.  That would give reviewers a better handle on how
all of this fits together.  I'd suggest including an overview in the
cover letter and also in the commit message and/or as a comment in the
code in one of the patches.  I'm not really an expert when it comes to
FPGAs, but this basically looks like a pretty low level interface to
set up the data fabric for a kernel that will run on the soft logic or
maybe the microcontroller on the board.  It doesn't have to be super
detailed, just a nice flow for how you might use this.  E.g.,

Userspace uses ioctls X, Y, Z to configure the data fabric for the
FPGA kernel.  The kernels can run on... .  DMA access to system memory
for data sets can be allocated using ioctl A.  DMA access is limited
by... . The user can then load the FPGA kernel on to one of the
engines using ioctl B and finally they can kick off the whole thing
using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
use the following runtime (link to runtime) to configure the data
fabric using ioctls X, Y, Z.

It would also be good to go over the security implications of the
design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
or is it limited to just the DMA regions set up by the ioctls?  Also,
does the hardware and software design allow for multiple users?  If
so, how does that work?

Thanks,

Alex


>
> v3:
> * unlock AIE dev mutex after failed to gain the partition lock in
>   errors handing
> * replace pointer with __u64 and enum with __u32 in ioctl
>
> v2:
> * Fix dtschema check errors
> * Fix test bot warning on interrupt implementation. Removed set but
>   unused  varaible.
> * Fix compilation unused function warning of firmware change in case
>   ZynqMP firmware is not configured
> * There are other warning on ZynqMP firmware reported from testbot
>   which is not introduced by this patch set.
>   "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
>   for those fixes.
>
>
> Izhar Ameer Shaikh (1):
>   firmware: xilinx: Add IOCTL support for AIE ISR Clear
>
> Nishad Saraf (2):
>   misc: xilinx-ai-engine: Add support to request device management
>     services
>   misc: xilinx-ai-engine: Add support for servicing error interrupts
>
> Wendy Liang (6):
>   dt-binding: soc: xilinx: ai-engine: Add AI engine binding
>   misc: Add Xilinx AI engine device driver
>   misc: xilinx-ai-engine: Implement AI engine cleanup sequence
>   misc: xilinx-ai-engine: expose AI engine tile memories to userspace
>   misc: xilinx-ai-engine: add setting shim dma bd operation
>   misc: xilinx-ai-engine: add request and release tiles
>
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
>  MAINTAINERS                                        |   8 +
>  drivers/firmware/xilinx/zynqmp.c                   |  14 +
>  drivers/misc/Kconfig                               |  12 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/xilinx-ai-engine/Makefile             |  16 +
>  drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
>  .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
>  drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
>  include/linux/firmware/xlnx-zynqmp.h               |   8 +
>  include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
>  18 files changed, 4719 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>  create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
>  create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
>  create mode 100644 include/uapi/linux/xlnx-ai-engine.h
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
