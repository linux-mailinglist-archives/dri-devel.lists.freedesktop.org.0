Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9382D425E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952A6EA24;
	Wed,  9 Dec 2020 12:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39C96EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 12:47:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q75so1530258wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 04:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=hT3m97VhmMNpbeNrUpFABgIqlsCUUWJrN82P+hXhKlA=;
 b=UQk0HNZ5nNWk/1P3eqjlh7e2Lbw9tRU/1o2wB2IOlXHNsKGzAa56gLvdkmk1BEMrPZ
 SIXKmr5On83y0/S2qCY8tMZBfOj0Rt8GcC34/DC3+cup1KQsaUXbQN9A72mOD2aA1qb7
 mU5rH9zhxOWfCFn66uObtw6P9dsJjsSONjv14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=hT3m97VhmMNpbeNrUpFABgIqlsCUUWJrN82P+hXhKlA=;
 b=hdd57FxJGEib1O9K793CyaU9NC35Q0hsC6VPGRikpLQBY/CTy2cYnSPchSSACdavsA
 e+VrZfmjTtROgT2HJ2FM04HXAYc1Hm6xtmfM6NukhYhcAviZrqw2pjBMV/pATQyILQmf
 tSKGXsv1WJmQFa9M5YyO87Yp5blqPsmHCRx12w13+wPGDdwk1qfZOJAb6ettjDNDEduH
 fcnusFiSn7YPoBgvwnIJiMUMvHLk3iWG4FerNXu/PoeGn8vBG5Bv6MbXdpI42zWFM6kT
 zWlWtoEgxlgberH19tgvLQhfNNNIpTq3Hk8+3I6CNbHUZMKTklDt9MZv51ivUdxwArIo
 CLLQ==
X-Gm-Message-State: AOAM5326U5nN/X8IjMwAxU1LnV+lYSLCYBULhJM0tC8UW3jVYpIRhEAj
 B0x3uxhuxBmpJ8c1xWWEJWiYHg==
X-Google-Smtp-Source: ABdhPJxcPUdtQIR6sLM4y5yQHSs8T4A5VAt+4xFlkKsMvVjyvzxK3EsaUMoAnmjv4HIGBF50fEOZNw==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr2558671wmd.70.1607518035798; 
 Wed, 09 Dec 2020 04:47:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm2968676wrj.8.2020.12.09.04.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:47:14 -0800 (PST)
Date: Wed, 9 Dec 2020 13:47:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jiaying Liang <wendy.liang@xilinx.com>, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/9] misc: Add Xilinx AI engine device driver
Message-ID: <20201209124712.GQ401619@phenom.ffwll.local>
Mail-Followup-To: Jiaying Liang <wendy.liang@xilinx.com>,
 Dave Airlie <airlied@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, robh+dt@kernel.org,
 michal.simek@xilinx.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
 manish.narani@xilinx.com, ravi.patel@xilinx.com,
 devicetree@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
 <1605686780-17886-3-git-send-email-wendy.liang@xilinx.com>
 <5c310d188d2a75480452f5b5a9310e8e049f20f6.camel@ndufresne.ca>
 <bbe17ef2-c983-24a3-b346-034a491261b2@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbe17ef2-c983-24a3-b346-034a491261b2@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 arnd@arndb.de, christian.koenig@amd.com, gregkh@linuxfoundation.org,
 dragan.cvetic@xilinx.com, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 manish.narani@xilinx.com, linux-arm-kernel@lists.infradead.org,
 derek.kiernan@xilinx.com, Hyun Kwon <hyun.kwon@xilinx.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 11:54:57AM -0800, Jiaying Liang wrote:
> =

> On 12/8/20 9:12 AM, Nicolas Dufresne wrote:
> > Le mercredi 18 novembre 2020 =E0 00:06 -0800, Wendy Liang a =E9crit=A0:
> > > Create AI engine device/partition hierarchical structure.
> > > =

> > > Each AI engine device can have multiple logical partitions(groups of =
AI
> > > engine tiles). Each partition is column based and has its own node ID
> > > in the system. AI engine device driver manages its partitions.
> > > =

> > > Applications can access AI engine partition through the AI engine
> > > partition driver instance. AI engine registers write is moved to kern=
el
> > > as there are registers in the AI engine array needs privilege
> > > permission.
> > Hi there, it's nice to see an effort to upstream an AI driver. I'm a li=
ttle
> > worried this driver is not obvious to use from it's source code itself.=
 So you
> > have reference to some Open Source code that demonstrate it's usage ?
> =

> We have AI engine library which provides a cross platforms APIs for other
> =

> libraries/application to use the hardware. Here is the source code:
> =

> https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/dri=
vers/aienginev2/src
> =

> The cross platforms AI engine library runs in LInux userspace it defines =
how
> to
> =

> configure, and the kernel driver controls if what can be access and manage
> errors from device.

So I kinda ignored this driver submission because in the past all these AI
drivers had at best incomplete open source (usually the compiler is
closed, often also large parts of the runtime). I think yours would be the
first that breaks this trend, is that really the case? I.e. I could make
full use of this hw without any closed source bits to run DNN workloads
and things like that?

If that's the case then I think there's nothing stopping us from doing the
right thing and merging this driver into the right subsystem: The
subsystem for accelerators which their own memory and who want dma-buf
integration is drivers/gpu, not drivers/misc.

Apologies that I'm jumping with the really big arch review when v3 is
already on the list. But last few times merging AI drivers to drivers/misc
was really just a way to avoid the merge criteria for drivers/gpu
acceleration drivers. I'd love to land the first real open AI driver in
upstream, properly.

Cheers, Daniel



> =

> =

> Best Regards,
> =

> Wendy
> =

> =

> > =

> > > Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> > > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > ---
> > >  =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 8 +
> > >  =A0drivers/misc/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 12 +
> > >  =A0drivers/misc/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
> > >  =A0drivers/misc/xilinx-ai-engine/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 11 +
> > >  =A0drivers/misc/xilinx-ai-engine/ai-engine-aie.c=A0=A0=A0=A0=A0 | 11=
5 +++++
> > >  =A0drivers/misc/xilinx-ai-engine/ai-engine-dev.c=A0=A0=A0=A0=A0 | 44=
8 ++++++++++++++++++
> > >  =A0drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 226 ++++++++=
++
> > >  =A0drivers/misc/xilinx-ai-engine/ai-engine-part.c=A0=A0=A0=A0 | 498
> > > +++++++++++++++++++++
> > >  =A0drivers/misc/xilinx-ai-engine/ai-engine-res.c=A0=A0=A0=A0=A0 | 11=
4 +++++
> > >  =A0include/uapi/linux/xlnx-ai-engine.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 107 +++++
> > >  =A010 files changed, 1540 insertions(+)
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-intern=
al.h
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > >  =A0create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > >  =A0create mode 100644 include/uapi/linux/xlnx-ai-engine.h
> > > =

> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5cc595a..40e3351 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19283,6 +19283,14 @@ T:=A0=A0=A0=A0=A0git https://github.com/Xili=
nx/linux-xlnx.git
> > >  =A0F:=A0=A0=A0=A0=A0Documentation/devicetree/bindings/phy/xlnx,zynqm=
p-psgtr.yaml
> > >  =A0F:=A0=A0=A0=A0=A0drivers/phy/xilinx/phy-zynqmp.c
> > > +XILINX AI ENGINE DRIVER
> > > +M:=A0=A0=A0=A0=A0Wendy Liang <wendy.liang@xilinx.com>
> > > +S:=A0=A0=A0=A0=A0Supported
> > > +F:=A0=A0=A0=A0=A0Documentation/devicetree/bindings/soc/xilinx/xlnx,a=
i-engine.yaml
> > > +F:=A0=A0=A0=A0=A0drivers/misc/xilinx-ai-engine/
> > > +F:=A0=A0=A0=A0=A0include/linux/xlnx-ai-engine.h
> > > +F:=A0=A0=A0=A0=A0include/uapi/linux/xlnx-ai-engine.h
> > > +
> > >  =A0XILLYBUS DRIVER
> > >  =A0M:=A0=A0=A0=A0=A0Eli Billauer <eli.billauer@gmail.com>
> > >  =A0L:=A0=A0=A0=A0=A0linux-kernel@vger.kernel.org
> > > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > > index fafa8b0..0b8ce4d 100644
> > > --- a/drivers/misc/Kconfig
> > > +++ b/drivers/misc/Kconfig
> > > @@ -444,6 +444,18 @@ config XILINX_SDFEC
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 If unsure, say N.
> > > +config XILINX_AIE
> > > +=A0=A0=A0=A0=A0=A0=A0tristate "Xilinx AI engine"
> > > +=A0=A0=A0=A0=A0=A0=A0depends on ARM64 || COMPILE_TEST
> > > +=A0=A0=A0=A0=A0=A0=A0help
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 This option enables support for the Xilinx =
AI engine driver.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 One Xilinx AI engine device can have multip=
le partitions (groups of
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 AI engine tiles). Xilinx AI engine device d=
river instance manages
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 AI engine partitions. User application acce=
ss its partitions through
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 AI engine partition instance file operation=
s.
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0 If unsure, say N
> > > +
> > >  =A0config MISC_RTSX
> > >  =A0=A0=A0=A0=A0=A0=A0=A0tristate
> > >  =A0=A0=A0=A0=A0=A0=A0=A0default MISC_RTSX_PCI || MISC_RTSX_USB
> > > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > > index d23231e..2176b18 100644
> > > --- a/drivers/misc/Makefile
> > > +++ b/drivers/misc/Makefile
> > > @@ -57,3 +57,4 @@ obj-$(CONFIG_HABANA_AI)=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0+=3D habanalabs/
> > >  =A0obj-$(CONFIG_UACCE)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0+=3D uacce/
> > >  =A0obj-$(CONFIG_XILINX_SDFEC)=A0=A0=A0=A0=A0+=3D xilinx_sdfec.o
> > >  =A0obj-$(CONFIG_HISI_HIKEY_USB)=A0=A0=A0+=3D hisi_hikey_usb.o
> > > +obj-$(CONFIG_XILINX_AIE)=A0=A0=A0=A0=A0=A0=A0+=3D xilinx-ai-engine/
> > > diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xi=
linx-ai-
> > > engine/Makefile
> > > new file mode 100644
> > > index 0000000..7827a0a
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/Makefile
> > > @@ -0,0 +1,11 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Makefile for Xilinx AI engine device driver
> > > +#
> > > +
> > > +obj-$(CONFIG_XILINX_AIE)=A0=A0=A0=A0=A0=A0=A0+=3D xilinx-aie.o
> > > +
> > > +xilinx-aie-$(CONFIG_XILINX_AIE) :=3D ai-engine-aie.o \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ai-engine-dev.o \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ai-engine-part.o \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ai-engine-res.o
> > > diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > > b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > > new file mode 100644
> > > index 0000000..319260f
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > > @@ -0,0 +1,115 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Xilinx AI Engine driver AIE device specific implementation
> > > + *
> > > + * Copyright (C) 2020 Xilinx, Inc.
> > > + */
> > > +
> > > +#include <linux/slab.h>
> > > +
> > > +#include "ai-engine-internal.h"
> > > +
> > > +#define AIE_ARRAY_SHIFT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A030U
> > > +#define AIE_COL_SHIFT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A023U
> > > +#define AIE_ROW_SHIFT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A018U
> > > +
> > > +/*
> > > + * Registers offsets
> > > + */
> > > +#define AIE_SHIMNOC_L2INTR_MASK_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A00x0=
0015000U
> > > +#define AIE_SHIMNOC_L2INTR_INTR_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A00x0=
0015010U
> > > +#define AIE_SHIMNOC_DMA_BD0_ADDRLOW_REGOFF=A0=A0=A0=A0=A00x0001d000U
> > > +#define AIE_SHIMNOC_DMA_BD15_PACKET_REGOFF=A0=A0=A0=A0=A00x0001d13cU
> > > +#define AIE_SHIMNOC_AXIMM_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A00x0001e020U
> > > +#define AIE_SHIMPL_L1INTR_MASK_A_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A00x00035000U
> > > +#define AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGOFF=A00x00035050U
> > > +#define AIE_SHIMPL_CLKCNTR_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A00x00036040U
> > > +#define AIE_SHIMPL_RESET_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x0003604cU
> > > +#define AIE_TILE_CORE_CLKCNTR_REGOFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00x00036040U
> > > +
> > > +static const struct aie_tile_regs aie_kernel_regs[] =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM AXI MM Config */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D AIE_TILE_TYPE_SHIMNOC << AIE_RE=
GS_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMNOC_AXIMM_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMNOC_AXIMM_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM DMA ADDRESS range */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D AIE_TILE_TYPE_SHIMNOC << AIE_RE=
GS_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMNOC_DMA_BD0_ADDRLOW_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMNOC_DMA_BD15_PACKET_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM 2nd level interrupt controller */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D AIE_TILE_TYPE_SHIMNOC << AIE_RE=
GS_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMNOC_L2INTR_MASK_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMNOC_L2INTR_INTR_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM 1st level interrupt controller */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D (AIE_TILE_TYPE_SHIMPL | AIE_TIL=
E_TYPE_SHIMNOC) <<
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AIE_REG=
S_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMPL_L1INTR_MASK_A_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMPL_L1INTR_BLOCK_NORTH_B_REGO=
FF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM reset Enable */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D (AIE_TILE_TYPE_SHIMPL | AIE_TIL=
E_TYPE_SHIMNOC) <<
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AIE_REG=
S_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMPL_RESET_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMPL_RESET_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM clock control */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D (AIE_TILE_TYPE_SHIMPL | AIE_TIL=
E_TYPE_SHIMNOC) <<
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AIE_REG=
S_ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_SHIMPL_CLKCNTR_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_SHIMPL_CLKCNTR_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +=A0=A0=A0=A0=A0=A0=A0/* Tile clock control */
> > > +=A0=A0=A0=A0=A0=A0=A0{.attribute =3D AIE_TILE_TYPE_TILE << AIE_REGS_=
ATTR_TILE_TYPE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0 .soff =3D AIE_TILE_CORE_CLKCNTR_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0 .eoff =3D AIE_TILE_CORE_CLKCNTR_REGOFF,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +};
> > > +
> > > +static u32 aie_get_tile_type(struct aie_location *loc)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0if (loc->row)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return AIE_TILE_TYPE_TI=
LE;
> > > +=A0=A0=A0=A0=A0=A0=A0/* SHIM row */
> > > +=A0=A0=A0=A0=A0=A0=A0if ((loc->col % 4) < 2)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return AIE_TILE_TYPE_SH=
IMPL;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return AIE_TILE_TYPE_SHIMNOC;
> > > +}
> > > +
> > > +static const struct aie_tile_operations aie_ops =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0.get_tile_type =3D aie_get_tile_type,
> > > +};
> > > +
> > > +/**
> > > + * aie_device_init() - Initialize AI engine device struct AIE specif=
ic
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 properti=
es
> > > + * @adev: AI engine device
> > > + * @return: 0 for success, negative value for failure.
> > > + *
> > > + * This function initialize the AI engine device structure device ve=
rsion
> > > + * specific elements such as register addressing related array shift,
> > > + * column shift, and row shift; AIE specific device operations, devi=
ce
> > > + * columns resource.
> > > + */
> > > +int aie_device_init(struct aie_device *adev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0adev->array_shift =3D AIE_ARRAY_SHIFT;
> > > +=A0=A0=A0=A0=A0=A0=A0adev->col_shift =3D AIE_COL_SHIFT;
> > > +=A0=A0=A0=A0=A0=A0=A0adev->row_shift =3D AIE_ROW_SHIFT;
> > > +=A0=A0=A0=A0=A0=A0=A0adev->ops =3D &aie_ops;
> > > +=A0=A0=A0=A0=A0=A0=A0adev->num_kernel_regs =3D ARRAY_SIZE(aie_kernel=
_regs);
> > > +=A0=A0=A0=A0=A0=A0=A0adev->kernel_regs =3D aie_kernel_regs;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Get the columns resource */
> > > +=A0=A0=A0=A0=A0=A0=A0/* Get number of columns from AI engine memory =
resource */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D aie_resource_initialize(&adev->cols_res=
, 50);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev, "fa=
iled to initialize columns
> > > resource.\n");
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +}
> > > diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > > b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > > new file mode 100644
> > > index 0000000..2ab2dc8
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > > @@ -0,0 +1,448 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Xilinx AI Engine device driver
> > > + *
> > > + * Copyright (C) 2020 Xilinx, Inc.
> > > + */
> > > +
> > > +#include <linux/anon_inodes.h>
> > > +#include <linux/cdev.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/file.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/idr.h>
> > > +#include <linux/list.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/uaccess.h>
> > > +#include <uapi/linux/xlnx-ai-engine.h>
> > > +
> > > +#include "ai-engine-internal.h"
> > > +
> > > +#define AIE_DEV_MAX=A0=A0=A0=A0(MINORMASK + 1)
> > > +
> > > +static dev_t aie_major;
> > > +struct class *aie_class;
> > > +
> > > +static DEFINE_IDA(aie_device_ida);
> > > +static DEFINE_IDA(aie_minor_ida);
> > > +
> > > +/**
> > > + * aie_get_partition_fd() - Get AI engine partition file descriptor
> > > + * @apart: AI engine partition
> > > + * @return: file descriptor for AI engine partition for success, or =
negative
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0 value for failure.
> > > + *
> > > + * This function gets a file descriptor for the AI engine partition.
> > > + */
> > > +static int aie_get_partition_fd(struct aie_partition *apart)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct file *filep;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0 * We can't use anon_inode_getfd() because we n=
eed to modify
> > > +=A0=A0=A0=A0=A0=A0=A0 * the f_mode flags directly to allow more than=
 just ioctls
> > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D get_unused_fd_flags(O_CLOEXEC);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0filep =3D anon_inode_getfile(dev_name(&apart->d=
ev), &aie_part_fops,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 apart, O_RDWR);
> > > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(filep)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0put_unused_fd(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D PTR_ERR(filep);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0filep->f_mode |=3D (FMODE_LSEEK | FMODE_PREAD |=
 FMODE_PWRITE);
> > > +=A0=A0=A0=A0=A0=A0=A0fd_install(ret, filep);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +}
> > > +
> > > +/**
> > > + * aie_enquire_partitions() - get AI engine partitions information
> > > + * @adev: AI engine device
> > > + * @query: data struct to store the partition information
> > > + * @return: 0 for success, and negative value for failure.
> > > + */
> > > +static int aie_enquire_partitions(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct aie_partition_query *query)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 partition_cnt, i =3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (!query->partitions) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * If partitions inform=
ation buffer is NULL.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * It is to get the num=
ber of partitions.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0query->partition_cnt =
=3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0list_for_each_entry(apa=
rt, &adev->partitions, node)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0query->partition_cnt++;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0partition_cnt =3D query->partition_cnt;
> > > +=A0=A0=A0=A0=A0=A0=A0if (!partition_cnt)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0list_for_each_entry(apart, &adev->partitions, n=
ode) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_range_args p=
art;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (i >=3D partition_cn=
t)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.partition_id =3D a=
part->partition_id;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * TBD: check with PLM =
that if the partition is programmed
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * and get the UID of t=
he image which is loaded on the AI
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * engine partition.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.uid =3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.range.start.col =
=3D apart->range.start.col;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.range.start.row =
=3D apart->range.start.row;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.range.size.col =3D=
 apart->range.size.col;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.range.size.row =3D=
 apart->range.size.row;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Check if partition i=
s in use */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0part.status =3D apart->=
status;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (copy_to_user((void =
__user *)&query->partitions[i], &part,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(part))) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0mutex_unlock(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EFAULT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i++;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0query->partition_cnt =3D i;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +/**
> > > + * aie_get_partition_from_id() - get AI engine partition from id
> > > + * @adev: AI engine device
> > > + * @partition_id: partition id to check
> > > + * @return: partition pointer if partition exists, otherwise, NULL.
> > > + *
> > > + * This function checks defined partitions with partition id.
> > > + * This function expect the caller to lock mlock of @adev.
> > > + */
> > > +struct aie_partition *aie_get_partition_from_id(struct aie_device *a=
dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
u32 partition_id)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0list_for_each_entry(apart, &adev->partitions, n=
ode) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (apart->partition_id=
 =3D=3D partition_id)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return apart;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return NULL;
> > > +}
> > > +
> > > +/**
> > > + * aie_request_partition() - request AI engine partition
> > > + * @adev: AI engine device
> > > + * @req: partition request, includes the requested AI engine informa=
tion
> > > + *=A0=A0=A0=A0=A0 such as partition node ID and the UID of the image=
 which is
> > > + *=A0=A0=A0=A0=A0 loaded on the partition.
> > > + * @return: partition pointer if partition exists, otherwise, NULL.
> > > + *
> > > + * This function finds a defined partition which matches the specifi=
ed
> > > + * partition id, request it if it hasn't been requested, and returns=
 it.
> > > + */
> > > +struct aie_partition *aie_request_partition(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct aie_par=
tition_req *req)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart =3D aie_get_partition_from_id(adev, req->=
partition_id);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!apart) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"request partition %u failed, not exist.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0req->partition_id);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlo=
ck);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0 * TBD: It will check image UID too to see if t=
he user matches
> > > +=A0=A0=A0=A0=A0=A0=A0 * what's loaded in the AI engine partition. An=
d check the meta
> > > +=A0=A0=A0=A0=A0=A0=A0 * data to see which resources used by applicat=
ion.
> > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&apart->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (apart->status & XAIE_PART_STATUS_INUSE) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&apart->ml=
ock);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"request partition %u failed, partition in use.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0req->partition_id);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0apart =3D ERR_PTR(-EBUS=
Y);
> > > +=A0=A0=A0=A0=A0=A0=A0} else {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * TBD:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * 1. setup NOC AXI MM =
config to only generate error events
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *=A0=A0=A0 for slave e=
rror and decode error.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * 2. scan to see which=
 tiles have been clock gated.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * This needs to be don=
e before the AI engine partition is
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * exported for user to=
 access.
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0apart->status =3D XAIE_=
PART_STATUS_INUSE;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&apart->ml=
ock);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return apart;
> > > +}
> > > +
> > > +static long xilinx_ai_engine_ioctl(struct file *filp, unsigned int c=
md,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long arg)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct inode *inode =3D file_inode(filp);
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev =3D cdev_to_aiedev(inod=
e->i_cdev);
> > > +=A0=A0=A0=A0=A0=A0=A0void __user *argp =3D (void __user *)arg;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0switch (cmd) {
> > > +=A0=A0=A0=A0=A0=A0=A0case AIE_ENQUIRE_PART_IOCTL:
> > > +=A0=A0=A0=A0=A0=A0=A0{
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_partition_qu=
ery query;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_partition_qu=
ery=A0 __user *uquery_ptr =3D argp;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (copy_from_user(&que=
ry, uquery_ptr, sizeof(query)))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EFAULT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D aie_enquire_par=
titions(adev, &query);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (copy_to_user((void =
__user *)&uquery_ptr->partition_cnt,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 &query.partition_cnt,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(query.partition_cnt)))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EFAULT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0case AIE_REQUEST_PART_IOCTL:
> > > +=A0=A0=A0=A0=A0=A0=A0{
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_partition_re=
q req;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_partition *a=
part;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (copy_from_user(&req=
, argp, sizeof(req)))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EFAULT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0apart =3D aie_request_p=
artition(adev, &req);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(apart))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return PTR_ERR(apart);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D aie_get_partiti=
on_fd(apart);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0dev_err(&apart->dev, "failed to get fd.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0default:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev, "In=
valid ioctl command %u.\n", cmd);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +}
> > > +
> > > +static const struct file_operations aie_device_fops =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0.owner=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D THIS_MO=
DULE,
> > > +=A0=A0=A0=A0=A0=A0=A0.unlocked_ioctl=A0=3D xilinx_ai_engine_ioctl,
> > > +};
> > > +
> > > +static void xilinx_ai_engine_release_device(struct device *dev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev =3D dev_to_aiedev(dev);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ida_simple_remove(&aie_device_ida, dev->id);
> > > +=A0=A0=A0=A0=A0=A0=A0ida_simple_remove(&aie_minor_ida, MINOR(dev->de=
vt));
> > > +=A0=A0=A0=A0=A0=A0=A0cdev_del(&adev->cdev);
> > > +=A0=A0=A0=A0=A0=A0=A0aie_resource_uninitialize(&adev->cols_res);
> > > +}
> > > +
> > > +/**
> > > + * of_xilinx_ai_engine_part_probe() - probes for AI engine partition=
 nodes
> > > + * @adev: AI engine device
> > > + *
> > > + * This function will probe for children AI engine partition nodes a=
nd create
> > > + * an AI engine partition instance for each node.
> > > + */
> > > +static void of_xilinx_ai_engine_part_probe(struct aie_device *adev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct device_node *nc;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0for_each_available_child_of_node(adev->dev.of_n=
ode, nc) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_partition *a=
part;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (of_node_test_and_se=
t_flag(nc, OF_POPULATED))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0continue;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0apart =3D of_aie_part_p=
robe(adev, nc);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(apart)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0"Failed to probe AI engine part for %pOF\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0nc);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0of_node_clear_flag(nc, OF_POPULATED);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +}
> > > +
> > > +static int xilinx_ai_engine_probe(struct platform_device *pdev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev;
> > > +=A0=A0=A0=A0=A0=A0=A0struct device *dev;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0adev =3D devm_kzalloc(&pdev->dev, sizeof(*adev)=
, GFP_KERNEL);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!adev)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;
> > > +=A0=A0=A0=A0=A0=A0=A0platform_set_drvdata(pdev, adev);
> > > +=A0=A0=A0=A0=A0=A0=A0INIT_LIST_HEAD(&adev->partitions);
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_init(&adev->mlock);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0adev->res =3D platform_get_resource(pdev, IORES=
OURCE_MEM, 0);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!adev->res) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&pdev->dev, "No=
 memory resource.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0adev->base =3D devm_ioremap_resource(&pdev->dev=
, adev->res);
> > > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(adev->base)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&pdev->dev, "no=
 io memory resource.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(adev->ba=
se);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Initialize AIE device specific instance. */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D aie_device_init(adev);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&pdev->dev, "fa=
iled to initialize device
> > > instance.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0dev =3D &adev->dev;
> > > +=A0=A0=A0=A0=A0=A0=A0device_initialize(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0dev->class =3D aie_class;
> > > +=A0=A0=A0=A0=A0=A0=A0dev->parent =3D &pdev->dev;
> > > +=A0=A0=A0=A0=A0=A0=A0dev->of_node =3D pdev->dev.of_node;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D ida_simple_get(&aie_minor_ida, 0, AIE_D=
EV_MAX, GFP_KERNEL);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto free_dev;
> > > +=A0=A0=A0=A0=A0=A0=A0dev->devt =3D MKDEV(MAJOR(aie_major), ret);
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D ida_simple_get(&aie_device_ida, 0, 0, G=
FP_KERNEL);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto free_minor_ida;
> > > +=A0=A0=A0=A0=A0=A0=A0dev->id =3D ret;
> > > +=A0=A0=A0=A0=A0=A0=A0dev_set_name(&adev->dev, "aie%d", dev->id);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0cdev_init(&adev->cdev, &aie_device_fops);
> > > +=A0=A0=A0=A0=A0=A0=A0adev->cdev.owner =3D THIS_MODULE;
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D cdev_add(&adev->cdev, dev->devt, 1);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto free_ida;
> > > +=A0=A0=A0=A0=A0=A0=A0/* We can now rely on the release function for =
cleanup */
> > > +=A0=A0=A0=A0=A0=A0=A0dev->release =3D xilinx_ai_engine_release_devic=
e;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_add(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&pdev->dev, "de=
vice_add failed: %d\n", ret);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0put_device(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0of_xilinx_ai_engine_part_probe(adev);
> > > +=A0=A0=A0=A0=A0=A0=A0dev_info(&pdev->dev, "Xilinx AI Engine device(c=
ols=3D%u) probed\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 adev->cols_res.total);
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +
> > > +free_ida:
> > > +=A0=A0=A0=A0=A0=A0=A0ida_simple_remove(&aie_device_ida, dev->id);
> > > +free_minor_ida:
> > > +=A0=A0=A0=A0=A0=A0=A0ida_simple_remove(&aie_minor_ida, MINOR(dev->de=
vt));
> > > +free_dev:
> > > +=A0=A0=A0=A0=A0=A0=A0put_device(dev);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +}
> > > +
> > > +static int xilinx_ai_engine_remove(struct platform_device *pdev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev =3D platform_get_drvdat=
a(pdev);
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0list_for_each_entry(apart, &adev->partitions, n=
ode)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0aie_part_remove(apart);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0device_del(&adev->dev);
> > > +=A0=A0=A0=A0=A0=A0=A0put_device(&adev->dev);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +static const struct of_device_id xilinx_ai_engine_of_match[] =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0{ .compatible =3D "xlnx,ai-engine-v1.0", },
> > > +=A0=A0=A0=A0=A0=A0=A0{ /* end of table */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, xilinx_ai_engine_of_match);
> > > +
> > > +static struct platform_driver xilinx_ai_engine_driver =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0.probe=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=3D xilinx_ai_engine_probe,
> > > +=A0=A0=A0=A0=A0=A0=A0.remove=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=3D xilinx_ai_engine_remove,
> > > +=A0=A0=A0=A0=A0=A0=A0.driver=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=3D {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.name=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=3D "xilinx-ai-engine",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.of_match_table=A0=3D x=
ilinx_ai_engine_of_match,
> > > +=A0=A0=A0=A0=A0=A0=A0},
> > > +};
> > > +
> > > +static int __init xilinx_ai_engine_init(void)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D alloc_chrdev_region(&aie_major, 0, AIE_=
DEV_MAX, "aie");
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("aie: failed to =
allocate aie region\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0aie_class =3D class_create(THIS_MODULE, "aie");
> > > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(aie_class)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("failed to creat=
e aie class\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0unregister_chrdev_regio=
n(aie_major, AIE_DEV_MAX);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(aie_clas=
s);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0platform_driver_register(&xilinx_ai_engine_driv=
er);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +postcore_initcall(xilinx_ai_engine_init);
> > > +
> > > +static void __exit xilinx_ai_engine_exit(void)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0platform_driver_unregister(&xilinx_ai_engine_dr=
iver);
> > > +=A0=A0=A0=A0=A0=A0=A0class_destroy(aie_class);
> > > +=A0=A0=A0=A0=A0=A0=A0unregister_chrdev_region(aie_major, AIE_DEV_MAX=
);
> > > +}
> > > +module_exit(xilinx_ai_engine_exit);
> > > +
> > > +MODULE_AUTHOR("Xilinx, Inc.");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> > > b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> > > new file mode 100644
> > > index 0000000..6a69946
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
> > > @@ -0,0 +1,226 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Xilinx AI Engine driver internal header
> > > + *
> > > + * Copyright (C) 2020 Xilinx, Inc.
> > > + */
> > > +
> > > +#ifndef AIE_INTERNAL_H
> > > +#define AIE_INTERNAL_H
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/cdev.h>
> > > +#include <linux/device.h>
> > > +#include <linux/io.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <uapi/linux/xlnx-ai-engine.h>
> > > +
> > > +/*
> > > + * Macros for AI engine tile type bitmasks
> > > + */
> > > +#define AIE_TILE_TYPE_TILE=A0=A0=A0=A0=A0BIT(0)
> > > +#define AIE_TILE_TYPE_SHIMPL=A0=A0=A0BIT(1)
> > > +/* SHIM NOC tile includes SHIM PL and SHIM NOC modules */
> > > +#define AIE_TILE_TYPE_SHIMNOC=A0=A0BIT(2)
> > > +
> > > +/*
> > > + * Macros for attribute property of AI engine registers accessed by =
kernel
> > > + * 0 - 7 bits: tile type bits
> > > + * 8 - 15 bits: permission bits. If it is 1, it allows write from us=
erspace
> > > + */
> > > +#define AIE_REGS_ATTR_TILE_TYPE_SHIFT=A0=A00U
> > > +#define AIE_REGS_ATTR_PERM_SHIFT=A0=A0=A0=A0=A0=A0=A08U
> > > +#define AIE_REGS_ATTR_TILE_TYPE_MASK=A0=A0=A0GENMASK(AIE_REGS_ATTR_P=
ERM_SHIFT - 1,
> > > \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
AIE_REGS_ATTR_TILE_TYPE_SHIFT)
> > > +#define AIE_REGS_ATTR_PERM_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0GENMASK(15, \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
AIE_REGS_ATTR_PERM_SHIFT)
> > > +
> > > +/**
> > > + * struct aie_tile_regs - contiguous range of AI engine register
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 within an AI engine tile
> > > + * @soff: start offset of the range
> > > + * @eoff: end offset of the range
> > > + * @attribute: registers attribute. It uses AIE_REGS_ATTR_* macros d=
efined
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 above.
> > > + */
> > > +struct aie_tile_regs {
> > > +=A0=A0=A0=A0=A0=A0=A0size_t soff;
> > > +=A0=A0=A0=A0=A0=A0=A0size_t eoff;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 attribute;
> > > +};
> > > +
> > > +struct aie_device;
> > > +struct aie_partition;
> > > +
> > > +/**
> > > + * struct aie_tile_operations - AI engine device operations
> > > + * @get_tile_type: get type of tile based on tile operation
> > > + *
> > > + * Different AI engine device version has its own device
> > > + * operation.
> > > + */
> > > +struct aie_tile_operations {
> > > +=A0=A0=A0=A0=A0=A0=A0u32 (*get_tile_type)(struct aie_location *loc);
> > > +};
> > > +
> > > +/**
> > > + * struct aie_resource - AI engine resource structure
> > > + * @bitmap: resource bitmap
> > > + * @total: total number of resource
> > > + */
> > > +struct aie_resource {
> > > +=A0=A0=A0=A0=A0=A0=A0unsigned long *bitmap;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 total;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_device - AI engine device structure
> > > + * @partitions: list of partitions requested
> > > + * @cdev: cdev for the AI engine
> > > + * @dev: device for the AI engine device
> > > + * @mlock: protection for AI engine device operations
> > > + * @base: AI engine device base virtual address
> > > + * @res: memory resource of AI engine device
> > > + * @kernel_regs: array of kernel only registers
> > > + * @ops: tile operations
> > > + * @size: size of the AI engine address space
> > > + * @array_shift: array address shift
> > > + * @col_shift: column address shift
> > > + * @row_shift: row address shift
> > > + * @cols_res: AI engine columns resources to indicate
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 while columns are occupied by parti=
tions.
> > > + * @num_kernel_regs: number of kernel only registers range
> > > + * @version: AI engine device version
> > > + */
> > > +struct aie_device {
> > > +=A0=A0=A0=A0=A0=A0=A0struct list_head partitions;
> > > +=A0=A0=A0=A0=A0=A0=A0struct cdev cdev;
> > > +=A0=A0=A0=A0=A0=A0=A0struct device dev;
> > > +=A0=A0=A0=A0=A0=A0=A0struct mutex mlock; /* protection for AI engine=
 partitions */
> > > +=A0=A0=A0=A0=A0=A0=A0void __iomem *base;
> > > +=A0=A0=A0=A0=A0=A0=A0struct resource *res;
> > > +=A0=A0=A0=A0=A0=A0=A0const struct aie_tile_regs *kernel_regs;
> > > +=A0=A0=A0=A0=A0=A0=A0const struct aie_tile_operations *ops;
> > > +=A0=A0=A0=A0=A0=A0=A0size_t size;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_resource cols_res;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 array_shift;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 col_shift;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 row_shift;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 num_kernel_regs;
> > > +=A0=A0=A0=A0=A0=A0=A0int version;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_partition - AI engine partition structure
> > > + * @node: list node
> > > + * @adev: pointer to AI device instance
> > > + * @range: range of partition
> > > + * @mlock: protection for AI engine partition operations
> > > + * @dev: device for the AI engine partition
> > > + * @partition_id: partition id. Partition ID is the identifier
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 of the AI engine partit=
ion in the system.
> > > + * @status: indicate if the partition is in use
> > > + */
> > > +struct aie_partition {
> > > +=A0=A0=A0=A0=A0=A0=A0struct list_head node;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_range range;
> > > +=A0=A0=A0=A0=A0=A0=A0struct mutex mlock; /* protection for AI engine=
 partition operations
> > > */
> > > +=A0=A0=A0=A0=A0=A0=A0struct device dev;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 partition_id;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 status;
> > > +};
> > > +
> > > +extern struct class *aie_class;
> > > +extern const struct file_operations aie_part_fops;
> > > +
> > > +#define cdev_to_aiedev(i_cdev) container_of((i_cdev), struct aie_dev=
ice,
> > > cdev)
> > > +#define dev_to_aiedev(_dev) container_of((_dev), struct aie_device, =
dev)
> > > +#define dev_to_aiepart(_dev) container_of((_dev), struct aie_partiti=
on, dev)
> > > +
> > > +#define aie_col_mask(adev) ({ \
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *_adev =3D (adev); \
> > > +=A0=A0=A0=A0=A0=A0=A0GENMASK_ULL(_adev->array_shift - 1, _adev->col_=
shift);=A0 \
> > > +=A0=A0=A0=A0=A0=A0=A0})
> > > +
> > > +#define aie_row_mask(adev) ({ \
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *_adev =3D (adev); \
> > > +=A0=A0=A0=A0=A0=A0=A0GENMASK_ULL(_adev->col_shift - 1, _adev->row_sh=
ift);=A0 \
> > > +=A0=A0=A0=A0=A0=A0=A0})
> > > +
> > > +#define aie_tile_reg_mask(adev) ({ \
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *_adev =3D (adev); \
> > > +=A0=A0=A0=A0=A0=A0=A0GENMASK_ULL(_adev->row_shift - 1, 0);=A0 \
> > > +=A0=A0=A0=A0=A0=A0=A0})
> > > +
> > > +/*
> > > + * Need to define field get, as AI engine shift mask is not constant.
> > > + * Cannot use FIELD_GET()
> > > + */
> > > +#define aie_tile_reg_field_get(mask, shift, regoff) ( \
> > > +=A0=A0=A0=A0=A0=A0=A0((regoff) & (mask)) >> (shift))
> > > +
> > > +#define aie_cal_tile_reg(adev, regoff) ( \
> > > +=A0=A0=A0=A0=A0=A0=A0aie_tile_reg_field_get(aie_tile_reg_mask(adev),=
 0, regoff))
> > > +
> > > +/**
> > > + * aie_cal_regoff() - calculate register offset to the whole AI engi=
ne
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device star=
t address
> > > + * @adev: AI engine device
> > > + * @loc: AI engine tile location
> > > + * @regoff_intile: register offset within a tile
> > > + * @return: register offset to the whole AI engine device start addr=
ess
> > > + */
> > > +static inline u32 aie_cal_regoff(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct aie_location loc, u32 regoff_intile)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0return regoff_intile + (loc.col << adev->col_sh=
ift) +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (loc.row << adev->row_shift);
> > > +}
> > > +
> > > +/**
> > > + * aie_validate_location() - validate tile location within an AI eng=
ine
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 partition
> > > + * @apart: AI engine partition
> > > + * @loc: AI engine tile location
> > > + * @return: return 0 if it is valid, negative value for errors.
> > > + *
> > > + * This function checks if the AI engine location is within the AI e=
ngine
> > > + * partition.
> > > + */
> > > +static inline int aie_validate_location(struct aie_partition *apart,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_location loc)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0if (loc.col < apart->range.start.col ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 loc.col >=3D apart->range.start.col +=
 apart->range.size.col ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 loc.row < apart->range.start.row ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 loc.row >=3D apart->range.start.row +=
 apart->range.size.row)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +int aie_resource_initialize(struct aie_resource *res, int count);
> > > +void aie_resource_uninitialize(struct aie_resource *res);
> > > +int aie_resource_check_region(struct aie_resource *res, u32 start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 u32 count);
> > > +int aie_resource_get_region(struct aie_resource *res, u32 start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 u32 count);
> > > +void aie_resource_put_region(struct aie_resource *res, int start, u3=
2 count);
> > > +
> > > +const struct file_operations *aie_part_get_fops(void);
> > > +u8 aie_part_in_use(struct aie_partition *apart);
> > > +struct aie_partition *aie_get_partition_from_id(struct aie_device *a=
dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
u32 partition_id);
> > > +struct aie_partition *aie_request_partition(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct aie_par=
tition_req *req);
> > > +struct aie_partition *of_aie_part_probe(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct device_node *nc);
> > > +void aie_part_remove(struct aie_partition *apart);
> > > +
> > > +int aie_device_init(struct aie_device *adev);
> > > +#endif /* AIE_INTERNAL_H */
> > > diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > > b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > > new file mode 100644
> > > index 0000000..fc8f9f5
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > > @@ -0,0 +1,498 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Xilinx AI Engine partition driver
> > > + *
> > > + * Copyright (C) 2020 Xilinx, Inc.
> > > + */
> > > +
> > > +#include <linux/cdev.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/mman.h>
> > > +#include <linux/mmu_context.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/uaccess.h>
> > > +#include <linux/uio.h>
> > > +#include <uapi/linux/xlnx-ai-engine.h>
> > > +
> > > +#include "ai-engine-internal.h"
> > > +
> > > +/**
> > > + * aie_cal_loc() - calculate tile location from register offset to t=
he AI
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 engine device
> > > + * @adev: AI engine device
> > > + * @loc: memory pointer to restore returning location information
> > > + * @regoff: tile internal register offset
> > > + *
> > > + * This function returns the tile location.
> > > + */
> > > +static void aie_cal_loc(struct aie_device *adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0struct aie_location *loc, u64 regoff)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0loc->col =3D (u32)aie_tile_reg_field_get(aie_co=
l_mask(adev),
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 adev-=
>col_shift, regoff);
> > > +=A0=A0=A0=A0=A0=A0=A0loc->row =3D (u32)aie_tile_reg_field_get(aie_ro=
w_mask(adev),
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 adev-=
>row_shift, regoff);
> > > +}
> > > +
> > > +/**
> > > + * aie_part_reg_validation() - validate AI engine partition register=
 access
> > > + * @apart: AI engine partition
> > > + * @offset: AI engine register offset
> > > + * @len: len of data to write/read
> > > + * @is_write: is the access to write to register
> > > + * @return: 0 for success, or negative value for failure.
> > > + *
> > > + * This function validate if the register to access is within the AI=
 engine
> > > + * partition. If it is write access, if the register is writable by =
user.
> > > + */
> > > +static int aie_part_reg_validation(struct aie_partition *apart, size=
_t
> > > offset,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size_t len, u8 is_write)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 regend32, ttype;
> > > +=A0=A0=A0=A0=A0=A0=A0u64 regoff, regend64;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_location loc;
> > > +=A0=A0=A0=A0=A0=A0=A0unsigned int i;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0adev =3D apart->adev;
> > > +=A0=A0=A0=A0=A0=A0=A0if (offset % sizeof(u32)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"Invalid reg off(0x%zx), not 32bit aligned.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0offset);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (len % sizeof(u32)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev, "I=
nvalid reg operation len %zu.\n", len);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0regoff =3D aie_cal_tile_reg(adev, offset);
> > > +=A0=A0=A0=A0=A0=A0=A0regend64 =3D regoff + len;
> > > +=A0=A0=A0=A0=A0=A0=A0if (regend64 >=3D BIT_ULL(adev->row_shift)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"Invalid reg operation len %zu.\n", len);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0aie_cal_loc(adev, &loc, offset);
> > > +=A0=A0=A0=A0=A0=A0=A0if (aie_validate_location(apart, loc)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"Invalid (%d,%d) out of part(%d,%d),(%d,%d)\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0loc.col, loc.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0apart->range.start.col, apart->range.start.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0apart->range.size.col, apart->range.size.row);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (!is_write)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0regend32 =3D lower_32_bits(regend64);
> > > +=A0=A0=A0=A0=A0=A0=A0ttype =3D adev->ops->get_tile_type(&loc);
> > > +=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < adev->num_kernel_regs; i++) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0const struct aie_tile_r=
egs *regs;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u32 rttype, writable;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0regs =3D &adev->kernel_=
regs[i];
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rttype =3D (regs->attri=
bute & AIE_REGS_ATTR_TILE_TYPE_MASK) >>
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 AIE_REGS_ATTR_TILE_TYPE_SHIFT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0writable =3D (regs->att=
ribute & AIE_REGS_ATTR_PERM_MASK) >>
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 AIE_REGS_ATTR_PERM_SHIFT;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!(ttype & rttype))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0continue;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ((regoff >=3D regs->=
soff && regoff <=3D regs->eoff) ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (regend32 >=
=3D regs->soff && regend32 <=3D regs->eoff)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if (!writable) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0"reg 0x%zx,0x%zx not wri=
table.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0offset, len);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +/**
> > > + * aie_part_write_register() - AI engine partition write register
> > > + * @apart: AI engine partition
> > > + * @offset: AI engine register offset
> > > + * @len: len of data to write
> > > + * @data: data to write
> > > + * @mask: mask, if it is non 0, it is mask write.
> > > + * @return: number of bytes write for success, or negative value for=
 failure.
> > > + *
> > > + * This function writes data to the specified registers.
> > > + * If the mask is non 0, it is mask write.
> > > + */
> > > +static int aie_part_write_register(struct aie_partition *apart, size=
_t
> > > offset,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size_t len, void *data, u32 mask)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +=A0=A0=A0=A0=A0=A0=A0void __iomem *va;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (mask && len > sizeof(u32)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* For mask write, only=
 allow 32bit. */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"failed mask write, len is more that 32bit.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* offset is expected to be relative to the sta=
rt of the partition */
> > > +=A0=A0=A0=A0=A0=A0=A0offset +=3D aie_cal_regoff(apart->adev, apart->=
range.start, 0);
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D aie_part_reg_validation(apart, offset, =
len, 1);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev, "f=
ailed to write to 0x%zx,0x%zx.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0offset, len);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0va =3D apart->adev->base + offset;
> > > +=A0=A0=A0=A0=A0=A0=A0if (!mask) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (len =3D=3D sizeof(u=
32))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0iowrite32(*((u32 *)data),=A0 va);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0else
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0memcpy_toio(va, data, len);
> > > +=A0=A0=A0=A0=A0=A0=A0} else {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u32 val =3D ioread32(va=
);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0val &=3D ~mask;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0val |=3D *((u32 *)data)=
 & mask;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0iowrite32(val, va);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return (int)len;
> > > +}
> > > +
> > > +/**
> > > + * aie_part_access_regs() - AI engine partition registers access
> > > + * @apart: AI engine partition
> > > + * @num_reqs: number of access requests
> > > + * @reqs: array of registers access
> > > + * @return: 0 for success, and negative value for failure.
> > > + *
> > > + * This function executes AI engine partition register access reques=
ts.
> > > + */
> > > +static int aie_part_access_regs(struct aie_partition *apart, u32 num=
_reqs,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_reg_args *reqs)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0u32 i;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < num_reqs; i++) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_reg_args *ar=
gs =3D &reqs[i];
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (args->op !=3D AIE_R=
EG_WRITE) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0"Invalid register command type: %u.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0args->op);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D aie_part_write_=
register(apart,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (size_t)=
args->offset,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(a=
rgs->val),
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &args->v=
al, args->mask);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0dev_err(&apart->dev, "reg op %u failed: 0x%llx.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0args->op, args->offset);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +static int aie_part_release(struct inode *inode, struct file *filp)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart =3D filp->private_d=
ata;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0 * TODO: It will need to reset the SHIM columns=
 and gate the
> > > +=A0=A0=A0=A0=A0=A0=A0 * tiles of the partition.
> > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&apart->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart->status =3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&apart->mlock);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +static const struct vm_operations_struct aie_part_physical_vm_ops =
=3D {
> > > +#ifdef CONFIG_HAVE_IOREMAP_PROT
> > > +=A0=A0=A0=A0=A0=A0=A0.access =3D generic_access_phys,
> > > +#endif
> > > +};
> > > +
> > > +static int aie_part_mmap(struct file *fp, struct vm_area_struct *vma)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart =3D fp->private_dat=
a;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev =3D apart->adev;
> > > +=A0=A0=A0=A0=A0=A0=A0unsigned long offset =3D vma->vm_pgoff * PAGE_S=
IZE;
> > > +=A0=A0=A0=A0=A0=A0=A0phys_addr_t addr;
> > > +=A0=A0=A0=A0=A0=A0=A0size_t size;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (vma->vm_end < vma->vm_start)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0/* Only allow userspace directly read registers=
 */
> > > +=A0=A0=A0=A0=A0=A0=A0if (vma->vm_flags & VM_WRITE) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev, "%=
s: do not support writable mmap.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0__func__);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0vma->vm_private_data =3D apart;
> > > +=A0=A0=A0=A0=A0=A0=A0vma->vm_ops =3D &aie_part_physical_vm_ops;
> > > +=A0=A0=A0=A0=A0=A0=A0size =3D apart->range.size.col << adev->col_shi=
ft;
> > > +=A0=A0=A0=A0=A0=A0=A0if ((vma->vm_end - vma->vm_start) > (size - off=
set)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"%s: size exceed.\n", __func__);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0vma->vm_page_prot =3D pgprot_noncached(vma->vm_=
page_prot);
> > > +=A0=A0=A0=A0=A0=A0=A0/* Calculate the partition address */
> > > +=A0=A0=A0=A0=A0=A0=A0addr =3D adev->res->start;
> > > +=A0=A0=A0=A0=A0=A0=A0addr +=3D apart->range.start.col << adev->col_s=
hift;
> > > +=A0=A0=A0=A0=A0=A0=A0addr +=3D apart->range.start.row << adev->row_s=
hift;
> > > +=A0=A0=A0=A0=A0=A0=A0addr +=3D offset;
> > > +=A0=A0=A0=A0=A0=A0=A0return remap_pfn_range(vma,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 vma->vm_start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 addr >> PAGE_SHIFT,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 vma->vm_end - vma->vm_start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 vma->vm_page_prot);
> > > +}
> > > +
> > > +static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsign=
ed long
> > > arg)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart =3D fp->private_dat=
a;
> > > +=A0=A0=A0=A0=A0=A0=A0void __user *argp =3D (void __user *)arg;
> > > +=A0=A0=A0=A0=A0=A0=A0long ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0switch (cmd) {
> > > +=A0=A0=A0=A0=A0=A0=A0case AIE_REG_IOCTL:
> > > +=A0=A0=A0=A0=A0=A0=A0{
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct aie_reg_args rac=
cess;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (copy_from_user(&rac=
cess, argp, sizeof(raccess)))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return -EFAULT;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_inte=
rruptible(&apart->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D aie_part_access=
_regs(apart, 1, &raccess);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&apart->ml=
ock);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0default:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&apart->dev, "I=
nvalid ioctl command %u.\n", cmd);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > > +}
> > > +
> > > +const struct file_operations aie_part_fops =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0.owner=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D THIS_MO=
DULE,
> > > +=A0=A0=A0=A0=A0=A0=A0.release=A0=A0=A0=A0=A0=A0=A0=A0=3D aie_part_re=
lease,
> > > +=A0=A0=A0=A0=A0=A0=A0.mmap=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D aie_p=
art_mmap,
> > > +=A0=A0=A0=A0=A0=A0=A0.unlocked_ioctl=A0=3D aie_part_ioctl,
> > > +};
> > > +
> > > +/**
> > > + * aie_part_release_device() - release an AI engine partition instan=
ce
> > > + * @dev: AI engine partition device
> > > + *
> > > + * It will be called by device driver core when no one holds a valid
> > > + * pointer to @dev anymore.
> > > + */
> > > +static void aie_part_release_device(struct device *dev)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart =3D dev_to_aiepart(=
dev);
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_device *adev =3D apart->adev;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(&apart->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "getting adev->mlock is interrupted by signal\n");
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0aie_resource_put_region(&adev->cols_res, apart-=
>range.start.col,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0apart->range.size.col);
> > > +=A0=A0=A0=A0=A0=A0=A0list_del(&apart->node);
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0put_device(apart->dev.parent);
> > > +}
> > > +
> > > +/**
> > > + * aie_create_partition() - create AI engine partition instance
> > > + * @adev: AI engine device
> > > + * @range: AI engine partition range to check. A range describes a g=
roup
> > > + *=A0=A0=A0=A0=A0=A0=A0 of AI engine tiles.
> > > + * @return: created AI engine partition pointer for success, and PTR=
_ERR
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0 for failure.
> > > + *
> > > + * This function creates an AI engine partition instance.
> > > + * It creates AI engine partition, the AI engine partition device and
> > > + * the AI engine partition character device.
> > > + */
> > > +static struct aie_partition *aie_create_partition(struct aie_device =
*adev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 struct aie_range *range)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +=A0=A0=A0=A0=A0=A0=A0struct device *dev;
> > > +=A0=A0=A0=A0=A0=A0=A0char devname[32];
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D aie_resource_check_region(&adev->cols_r=
es, range->start.col,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0range->size.col);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret !=3D range->start.col) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev, "in=
valid partition (%u,%u)(%u,%u).\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0range->start.col, range->start.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0range->size.col, range->size.row);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlo=
ck);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-EINVAL);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D aie_resource_get_region(&adev->cols_res=
, range->start.col,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 range->size.col);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret !=3D range->start.col) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev, "fa=
iled to get partition
> > > (%u,%u)(%u,%u).\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0range->start.col, range->start.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0range->size.col, range->size.row);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlo=
ck);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-EFAULT);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart =3D devm_kzalloc(&adev->dev, sizeof(*apar=
t), GFP_KERNEL);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!apart)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-ENOMEM);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart->adev =3D adev;
> > > +=A0=A0=A0=A0=A0=A0=A0memcpy(&apart->range, range, sizeof(*range));
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_init(&apart->mlock);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Create AI engine partition device */
> > > +=A0=A0=A0=A0=A0=A0=A0dev =3D &apart->dev;
> > > +=A0=A0=A0=A0=A0=A0=A0device_initialize(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0dev->parent =3D &adev->dev;
> > > +=A0=A0=A0=A0=A0=A0=A0dev->class =3D aie_class;
> > > +=A0=A0=A0=A0=A0=A0=A0dev_set_drvdata(dev, apart);
> > > +=A0=A0=A0=A0=A0=A0=A0snprintf(devname, sizeof(devname) - 1, "aiepart=
_%d_%d",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 apart->range.start.col=
, apart->range.size.col);
> > > +=A0=A0=A0=A0=A0=A0=A0dev_set_name(dev, devname);
> > > +=A0=A0=A0=A0=A0=A0=A0/* We can now rely on the release function for =
cleanup */
> > > +=A0=A0=A0=A0=A0=A0=A0dev->release =3D aie_part_release_device;
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_add(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(dev, "device_ad=
d failed: %d\n", ret);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0put_device(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0put_device(dev);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0list_add_tail(&apart->node, &adev->partitions);
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0get_device(&adev->dev);
> > > +=A0=A0=A0=A0=A0=A0=A0dev_dbg(dev, "created AIE partition device.\n");
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return apart;
> > > +}
> > > +
> > > +struct aie_partition *
> > > +of_aie_part_probe(struct aie_device *adev, struct device_node *nc)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_partition *apart;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_range range;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 partition_id, regs[4];
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Select device driver */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D of_property_read_u32_array(nc, "reg", r=
egs, ARRAY_SIZE(regs));
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"probe %pOF failed, no tiles range information.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0nc);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0range.start.col =3D regs[0];
> > > +=A0=A0=A0=A0=A0=A0=A0range.start.row =3D regs[1];
> > > +=A0=A0=A0=A0=A0=A0=A0range.size.col =3D regs[2];
> > > +=A0=A0=A0=A0=A0=A0=A0range.size.row =3D regs[3];
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D of_property_read_u32_index(nc, "xlnx,pa=
rtition-id", 0,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &partition_id);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"probe %pOF failed, no partition id.\n", nc);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D mutex_lock_interruptible(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart =3D aie_get_partition_from_id(adev, parti=
tion_id);
> > > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&adev->mlock);
> > > +=A0=A0=A0=A0=A0=A0=A0if (apart) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"probe failed: partition %u exists.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0partition_id);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0apart =3D aie_create_partition(adev, &range);
> > > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(apart)) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0"%s: failed to create part(%u,%u),(%u,%u).\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0__func__, range.start.col, range.start.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0range.size.col, range.size.row);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return apart;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0of_node_get(nc);
> > > +=A0=A0=A0=A0=A0=A0=A0apart->dev.of_node =3D nc;
> > > +=A0=A0=A0=A0=A0=A0=A0apart->partition_id =3D partition_id;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0dev_info(&adev->dev,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "AI engine part(%u,%u)=
,(%u,%u), id %u is probed
> > > successfully.\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 range.start.col, range=
.start.row,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 range.size.col, range.=
size.row, apart->partition_id);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return apart;
> > > +}
> > > +
> > > +/**
> > > + * aie_destroy_part() - destroy AI engine partition
> > > + * @apart: AI engine partition
> > > + *
> > > + * This function will remove AI engine partition.
> > > + */
> > > +void aie_part_remove(struct aie_partition *apart)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0device_del(&apart->dev);
> > > +=A0=A0=A0=A0=A0=A0=A0put_device(&apart->dev);
> > > +}
> > > diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > > b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > > new file mode 100644
> > > index 0000000..36f08bf
> > > --- /dev/null
> > > +++ b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > > @@ -0,0 +1,114 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Xilinx AI Engine device driver
> > > + *
> > > + * Copyright (C) 2020 Xilinx, Inc.
> > > + */
> > > +
> > > +#include <linux/bitmap.h>
> > > +
> > > +#include "ai-engine-internal.h"
> > > +
> > > +/**
> > > + * aie_resource_initialize() - initialize AI engine resource
> > > + * @res: pointer to AI engine resource
> > > + * @count: total number of element of this resource
> > > + * @return: 0 for success, negative value for failure.
> > > + *
> > > + * This function will initialize the data structure for the
> > > + * resource.
> > > + */
> > > +int aie_resource_initialize(struct aie_resource *res, int count)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0if (!res || !count)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0res->bitmap =3D bitmap_zalloc(count, GFP_KERNEL=
);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!res->bitmap)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;
> > > +=A0=A0=A0=A0=A0=A0=A0res->total =3D count;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +}
> > > +
> > > +/**
> > > + * aie_resource_uninitialize() - uninitialize AI engine resource
> > > + * @res: pointer to AI engine resource
> > > + *
> > > + * This function will release the AI engine resource data members.
> > > + */
> > > +void aie_resource_uninitialize(struct aie_resource *res)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0res->total =3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0if (res->bitmap)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bitmap_free(res->bitmap=
);
> > > +}
> > > +
> > > +/**
> > > + * aie_resource_check() - check availability of requested resource
> > > + * @res: pointer to AI engine resource to check
> > > + * @start: start index of the required resource, it will only be use=
d if
> > > + *=A0=A0=A0=A0=A0=A0=A0 @continuous is 1. It will check the availabl=
e resource starting
> > > from
> > > + *=A0=A0=A0=A0=A0=A0=A0 @start
> > > + * @count: number of requested element
> > > + * @return: start resource id if the requested number of resources a=
re
> > > available
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0 It will return negative value of errors.
> > > + *
> > > + * This function will check the availability. It will return start r=
esource
> > > id
> > > + * if the requested number of resources are available.
> > > + */
> > > +int aie_resource_check_region(struct aie_resource *res,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 u32 start, u32 count)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0unsigned long id;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (!res || !res->bitmap || !count)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0id =3D bitmap_find_next_zero_area(res->bitmap, =
res->total, start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0count, 0);
> > > +=A0=A0=A0=A0=A0=A0=A0if (id >=3D res->total)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ERANGE;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return (int)id;
> > > +}
> > > +
> > > +/**
> > > + * aie_resource_get_region() - get requested AI engine resource
> > > + * @res: pointer to AI engine resource to check
> > > + * @count: number of requested element
> > > + * @start: start index of the required resource
> > > + * @return: start resource id for success, and negative value for fa=
ilure.
> > > + *
> > > + * This function check if the requested AI engine resource is availa=
ble.
> > > + * If it is available, mark it used and return the start resource id.
> > > + */
> > > +int aie_resource_get_region(struct aie_resource *res, u32 start, u32=
 count)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0unsigned long off;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (!res || !res->bitmap || !count)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
> > > +=A0=A0=A0=A0=A0=A0=A0off =3D bitmap_find_next_zero_area(res->bitmap,=
 res->total, start,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 count, 0);
> > > +=A0=A0=A0=A0=A0=A0=A0if (off >=3D res->total) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("Failed to get a=
vailable AI engine resource.\n");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ERANGE;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0bitmap_set(res->bitmap, off, count);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return (int)off;
> > > +}
> > > +
> > > +/**
> > > + * aie_resource_put_region() - release requested AI engine resource
> > > + * @res: pointer to AI engine resource to check
> > > + * @start: start index of the resource to release
> > > + * @count: number of elements to release
> > > + *
> > > + * This function release the requested AI engine resource.
> > > + */
> > > +void aie_resource_put_region(struct aie_resource *res, int start, u3=
2 count)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0if (!res || !count)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > > +=A0=A0=A0=A0=A0=A0=A0bitmap_clear(res->bitmap, start, count);
> > > +}
> > > diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux=
/xlnx-ai-
> > > engine.h
> > > new file mode 100644
> > > index 0000000..acbc781
> > > --- /dev/null
> > > +++ b/include/uapi/linux/xlnx-ai-engine.h
> > > @@ -0,0 +1,107 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +/*
> > > + * Copyright (c) 2020, Xilinx Inc.
> > > + */
> > > +
> > > +#ifndef _UAPI_AI_ENGINE_H_
> > > +#define _UAPI_AI_ENGINE_H_
> > > +
> > > +#include <linux/ioctl.h>
> > > +#include <linux/types.h>
> > > +
> > > +enum aie_reg_op {
> > > +=A0=A0=A0=A0=A0=A0=A0AIE_REG_WRITE,
> > > +};
> > > +
> > > +/* AI engine partition is in use */
> > > +#define XAIE_PART_STATUS_INUSE=A0=A0=A0=A0=A0=A0=A0=A0=A0(1U << 0)
> > > +
> > > +/**
> > > + * struct aie_location - AIE location information
> > > + * @col: column id
> > > + * @row: row id
> > > + */
> > > +struct aie_location {
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 col;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 row;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_range - AIE range information
> > > + * @start: start tile location
> > > + * @size: size of the range, number of columns and rows
> > > + */
> > > +struct aie_range {
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_location start;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_location size;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_reg_args - AIE access register arguments
> > > + * @op: if this request is to read, write or poll register
> > > + * @mask: mask for mask write, 0 for not mask write
> > > + * @offset: offset of register to the start of an AI engine partition
> > > + * @val: value to write or get
> > > + */
> > > +struct aie_reg_args {
> > > +=A0=A0=A0=A0=A0=A0=A0enum aie_reg_op op;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 mask;
> > > +=A0=A0=A0=A0=A0=A0=A0__u64 offset;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 val;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_range_args - AIE range request arguments
> > > + * @partition_id: partition id. It is used to identify the
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AI engine partition in =
the system.
> > > + * @uid: image identifier loaded on the AI engine partition
> > > + * @range: range of AIE tiles
> > > + * @status: indicate if the AI engine is in use.
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0 0 means not in used, otherwise, in use.
> > > + */
> > > +struct aie_range_args {
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 partition_id;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 uid;
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_range range;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 status;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_partition_query - AIE partition query arguments
> > > + * @partition_cnt: number of defined partitions in the system
> > > + * @partitions: buffer to store defined partitions information.
> > > + */
> > > +struct aie_partition_query {
> > > +=A0=A0=A0=A0=A0=A0=A0struct aie_range_args *partitions;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 partition_cnt;
> > > +};
> > > +
> > > +/**
> > > + * struct aie_partition_req - AIE request partition arguments
> > > + * @partition_id: partition node id. It is used to identify the AI e=
ngine
> > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 partition in the system.
> > > + * @uid: image identifier loaded on the AI engine partition
> > > + * @meta_data: meta data to indicate which resources used by applica=
tion.
> > > + * @flag: used for application to indicate particular driver require=
ments
> > > + *=A0=A0=A0=A0=A0=A0 application wants to have for the partition. e.=
g. do not clean
> > > + *=A0=A0=A0=A0=A0=A0 resource when closing the partition.
> > > + */
> > > +struct aie_partition_req {
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 partition_id;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 uid;
> > > +=A0=A0=A0=A0=A0=A0=A0__u64 meta_data;
> > > +=A0=A0=A0=A0=A0=A0=A0__u32 flag;
> > > +};
> > > +
> > > +#define AIE_IOCTL_BASE 'A'
> > > +
> > > +/* AI engine device IOCTL operations */
> > > +#define AIE_ENQUIRE_PART_IOCTL=A0=A0=A0=A0=A0=A0=A0=A0=A0_IOWR(AIE_I=
OCTL_BASE, 0x1, \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct a=
ie_partition_query)
> > > +#define AIE_REQUEST_PART_IOCTL=A0=A0=A0=A0=A0=A0=A0=A0=A0_IOR(AIE_IO=
CTL_BASE, 0x2, \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct aie_=
partition_req)
> > > +
> > > +/* AI engine partition IOCTL operations */
> > > +#define AIE_REG_IOCTL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0_IOWR(AIE_IOCTL_BASE, 0x8, \
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct a=
ie_reg_args)
> > > +#endif
> > =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
