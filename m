Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C52DAA69
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 10:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332589C6B;
	Tue, 15 Dec 2020 09:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF42289C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 09:49:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g25so10651254wmh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 01:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=+bLScCOCNZQdgDM6p7C9MBE40XK/lq18vroRL1z4urY=;
 b=KyRMMUQmBtPcq4c3/MC/uHDb80xB1/HQiJFsbk1YAZ65xFxMfPQr55VtQUX/y9lRMi
 HdvuMMDj21aBlYg7/yHg5MZ6O5UuocG26YAguO8LnHVa/8ujnSrHTH7iVgtafPJiWy4X
 TyneHYCzt1c0WGPBANJzUaeR/ZYq+XtQ4jCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=+bLScCOCNZQdgDM6p7C9MBE40XK/lq18vroRL1z4urY=;
 b=JZfUBFZXfJ7RI9uRgpGNldubQgNJmHtuIZ0v3OSUGGzPygrniIVqY/GZVrqHMhlG7a
 WpE/FvvQYAvsArVhKsEfQc/812vROasO2tDmT0jYTohldUJXuqlfVtdnMGsg3JD2lDD4
 nbgIqKd3Gt7DC8liJAl6Ag44tunqQJJjWJgiHJRtcRHhR+cmvcurgvIn6kIO9JaqEPMe
 n01KUB7qZ1e32tdjVqKYXNb9Mga7uOADfhWhnRkx2fC86eH/QulUV4hQlaDsjwCCav2z
 SRW/LXx3wAPV0JBJdfpvU0QoMpShbD15fneoFlMn4zLJD+02IBAfb2jRczWsnpbOnBDY
 efew==
X-Gm-Message-State: AOAM5331HXxVKKEQAJQqYT9C8twLPnQrjNe2kZlP9qAAOj2LBgtYN2ce
 ayzCgX+b6gmrfz5q33jgPNf1DQ==
X-Google-Smtp-Source: ABdhPJz/V2fVbYttE2c+SKppjnnX6Lps98PrevHuWGbBCzD/MFwm4B9sRnrp2egyl55dAyEg27IKzQ==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr11312405wmi.23.1608025749468; 
 Tue, 15 Dec 2020 01:49:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z22sm33831887wml.1.2020.12.15.01.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 01:49:08 -0800 (PST)
Date: Tue, 15 Dec 2020 10:49:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jiaying Liang <wendy.liang@xilinx.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
Message-ID: <X9iEAdStN7lqvZpY@phenom.ffwll.local>
Mail-Followup-To: Jiaying Liang <wendy.liang@xilinx.com>,
 Alex Deucher <alexdeucher@gmail.com>, tejas.patel@xilinx.com,
 ravi.patel@xilinx.com, rajan.vaja@xilinx.com,
 Arnd Bergmann <arnd@arndb.de>,
 devicetree <devicetree@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, manish.narani@xilinx.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Christian Koenig <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
 <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
 <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
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
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 manish.narani@xilinx.com, Derek Kiernan <derek.kiernan@xilinx.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 04:24:17PM -0800, Jiaying Liang wrote:
> =

> On 12/11/20 11:39 AM, Daniel Vetter wrote:
> > Hi all
> > =

> > On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher<alexdeucher@gmail.com>  wr=
ote:
> > > On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang<wendy.liang@xilinx.com>  =
wrote:
> > > > AI engine is the acceleration engine provided by Xilinx. These engi=
nes
> > > > provide high compute density for vector-based algorithms, and flexi=
ble
> > > > custom compute and data movement. It has core tiles for compute and
> > > > shim tiles to interface the FPGA fabric.
> > > > =

> > > > You can check the AI engine architecture document for more hardware=
 details:
> > > > https://www.xilinx.com/support/documentation/architecture-manuals/a=
m009-versal-ai-engine.pdf
> > > > =

> > > > This patch series adds a Linux kernel driver to manage the Xilinx AI
> > > > engine array device and AI engine partitions (groups of AI engine t=
iles
> > > > dedicated to an application).
> > > Hi Wendy,
> > > =

> > > I think it would be good to provide an overview of how your stack
> > > works in general.  That would give reviewers a better handle on how
> > > all of this fits together.  I'd suggest including an overview in the
> > > cover letter and also in the commit message and/or as a comment in the
> > > code in one of the patches.  I'm not really an expert when it comes to
> > > FPGAs, but this basically looks like a pretty low level interface to
> > > set up the data fabric for a kernel that will run on the soft logic or
> > > maybe the microcontroller on the board.  It doesn't have to be super
> > > detailed, just a nice flow for how you might use this.  E.g.,
> > > =

> > > Userspace uses ioctls X, Y, Z to configure the data fabric for the
> > > FPGA kernel.  The kernels can run on... .  DMA access to system memory
> > > for data sets can be allocated using ioctl A.  DMA access is limited
> > > by... . The user can then load the FPGA kernel on to one of the
> > > engines using ioctl B and finally they can kick off the whole thing
> > > using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
> > > use the following runtime (link to runtime) to configure the data
> > > fabric using ioctls X, Y, Z.
> > At least for drm drivers we ideally have that as a .rst file in
> > Documentation/. With that you can even do full svg graphs, or just dot
> > graphs, of the overall stack if you really want to go overboard :-)
> > =

> > > It would also be good to go over the security implications of the
> > > design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
> > > or is it limited to just the DMA regions set up by the ioctls?  Also,
> > > does the hardware and software design allow for multiple users?  If
> > > so, how does that work?
> > I've also seen indications that there's some on-chip or on-card
> > memory. How that's planned to be used and whether we want to manage
> > this (maybe even with something like ttm) would be good to understand.
> > =

> > All excellent questions from Alex, just figured I add some more.
> > =

> > Cheers, Daniel
> =

> Hi Alex, Daniel,
> =

> Below is an overview of the driver.
> =

> AI engine kernel driver manages Xilinx AI engine device. An AI engine dev=
ice
> contains cores tiles and SHIM tiles. Core tiles are the computation tiles
> , the SHIM tiles are the tiles interfacing to external components.
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +--------+--------+--------+--------+
> =A0=A0=A0=A0=A0=A0=A0=A0 =A0 | Core=A0=A0=A0=A0=A0=A0=A0 | Core=A0=A0=A0=
=A0=A0=A0=A0 | Core=A0 =A0 =A0 =A0 | Core | ...
> =A0=A0=A0=A0=A0=A0=A0=A0 =A0 |=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 |=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =
=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +-----------------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0 =A0 | Core=A0=A0=A0=A0=A0=A0=A0 | Core=A0 =A0 =
=A0 =A0 | Core=A0=A0=A0=A0=A0=A0=A0 | Core=A0=A0=A0=A0 | ...
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 |=
=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 =A0 | |=A0=A0=A0=A0=A0 =A0 =A0 =A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +--------+--------+--------+---------
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ...
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +--------+--------+-----------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 | SHIM=A0 =A0 =A0 =A0 | SHIM=A0=A0=A0=A0=A0=
=A0 | SHIM=A0=A0=A0=A0=A0=A0 |SHIM=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 | PL=A0=A0 =A0 =A0 =A0 =A0=A0 | PL=A0=A0=A0 =
=A0 =A0 =A0=A0 | PL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |PL | NOC=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +---+----+---+----+---+-----+-------+
> =A0 AXI Streams=A0=A0 |=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 =A0 =A0 =
=A0 =A0=A0 |=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 |=A0=A0=A0 |AXI MM
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 |=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 =A0 | |=A0=A0=A0 |
> Events Singals |=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 =
=A0 |=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 |=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0=A0 |=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 | |=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 |=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0=A0 | |=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +---+--------+--------+-----+ +--+------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 FPGA=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 | =
|=A0=A0
> NOC=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 | | |=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =
=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 +---------------------------+ +--+-------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +---+------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 DDR=A0=A0 =A0 =A0 =A0 =
=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------+
> =


Your diagram here didn't survive email unfortunately :-/

Quick question: Where's the fpga driver for this chip? I'm assuming it's
something separate.

> Each Core tile contains computing module, local memory and DMA module. The
> local memory DMA module takes data from or to the AXI streams and writes
> it to or reads it from the local memory. The computing module can also
> directly get/put data from/to the AXI stream. The AIE SHIM enables AIE ti=
les
> to get/put data from/to AXI streams from FPGA, enables external master to
> access AI engine address space through AXI MM. SHIM NoC module has DMA
> engine,
> which can access extern memory though AXI MM and push it to internal AXI
> streams.
> =

> At runtime, the AI engine tiles interconnection needs to be configured so
> that
> it can get fetch data from external components or adjacent tiles, and AI
> engine
> core program needs to be loaded. And then user application can push data =
to
> the
> AI engine array and start/stop AI engine core. AI engine device errors can
> be
> raised as events, the AI engine kernel driver listens to the events
> interrupt
> to monitor runtime async device errors.
> =

> Instead of application directly interacting with the AI engine kernel API=
s,
> user
> application/libraries interacts with AI engine userspace library:
> https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/dri=
vers/aienginev2
> It provides cross OSes low level functional abstraction such as how to
> connect one
> stream port to another stream port, how to configure core tile local DMA.
> =

> The AI engine library can be used by other runtime libraries such as Xili=
nx
> runtime (XRT)
> library: https://xilinx.github.io/XRT/master/html/index.html,
> which provides acceleration abstraction for Xilinx accelerators, it has
> extensions
> to interface to other acceleration framework such as OpenCL.
> XRT provides buffer handling abstractions for user application to share d=
ata
> between
> applicaiton and devices.
> =

> Here is an example of application runtime stack:
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0 Application=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 XRT=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0 AIE Library=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |
> =A0=A0=A0=A0 =A0 =A0=A0=A0 +----------------------------+
> =A0=A0=A0 +----------------------------------------+
> Kern=A0 =A0 +----------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0 AIE Partition=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +--+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+ =A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0=A0 |------------------------=
----+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0 AIE Device=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +----------------------------+
> =

> =

> =

> The AI engine kernel driver provides the following user interfaces:
> =A0* AIE device driver is the root device driver to manage the partitions=
 of
> =A0=A0 of the AI engine device array. AI engine array can be partitioned =
into
> =A0=A0 column wised isolated partitions. Each applicaiton can only access=
 its
> =A0=A0 own partitions.
> =A0* AIE device driver monitors the interrupt from the AI enigne device. =
All
> =A0=A0 AI engine tiles shared the same interrupt for error events.
> =A0* AIE partition driver controls address mapping and access of the
> =A0=A0 registers/local memories of the tiles within a partition.
> =A0=A0 * It provides mmap operation to enable application to direclty acc=
ess the
> =A0=A0=A0=A0 tiles local memories for small data update such as parameter=
 update for
> =A0=A0=A0=A0 performance.
> =A0=A0 * It provides mmap operatio to map all the registers as readonly f=
or
> =A0=A0=A0=A0 application to poll registers efficiently to check status.
> =A0=A0 * It provides ioctl for userspace to pass I/O commands to write/ma=
sk
> write
> =A0=A0=A0=A0 the registers. How to configure is defined by userspace. Use=
rspace will
> =A0=A0=A0=A0 pass the I/O commands sequence to the kernel driver, and ker=
nel driver
> =A0=A0=A0=A0 will validate the commands before it writes to the registers.
> =A0=A0 * It provides ioctl to import dmabuf and ioctl to configure the th=
e DMA
> module
> =A0=A0=A0=A0 in the SHIM tile which can access memory outside AI engine a=
rray.

This sounds a bit like there's no model for running multiple userspace,
aside from hard-partitioning the chip? Could we suspend/resume clients by
saving/restoring that entire mmio range that they set up?

> The buffer management is out of this driver. In the above example, user
> application
> uses Xilinx runtime(XRT), XRT is the one to manage the buffers.

Somehow you're getting data in/out of these compute tiles, and from your
description it sounds like that's done through special AXI streams that
connect to this NOC thing?

So someone needs to manage that memory, and on the kernel side you
probably need something which can do the dma_map_sg for said memory. So
which kernel driver does that?

In the past there was a drm driver submission for iirc a xilinx fpga, but
we can't take that one because only the runtime, not the compiler are open
source. Is that the part which provides memory management (together with
the userspace runtime)?
-Daniel

> =

> =

> Best Regards,
> =

> Wendy
> =

> > =

> > > Thanks,
> > > =

> > > Alex
> > > =

> > > =

> > > > v3:
> > > > * unlock AIE dev mutex after failed to gain the partition lock in
> > > >    errors handing
> > > > * replace pointer with __u64 and enum with __u32 in ioctl
> > > > =

> > > > v2:
> > > > * Fix dtschema check errors
> > > > * Fix test bot warning on interrupt implementation. Removed set but
> > > >    unused  varaible.
> > > > * Fix compilation unused function warning of firmware change in case
> > > >    ZynqMP firmware is not configured
> > > > * There are other warning on ZynqMP firmware reported from testbot
> > > >    which is not introduced by this patch set.
> > > >    "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is subm=
itted
> > > >    for those fixes.
> > > > =

> > > > =

> > > > Izhar Ameer Shaikh (1):
> > > >    firmware: xilinx: Add IOCTL support for AIE ISR Clear
> > > > =

> > > > Nishad Saraf (2):
> > > >    misc: xilinx-ai-engine: Add support to request device management
> > > >      services
> > > >    misc: xilinx-ai-engine: Add support for servicing error interrup=
ts
> > > > =

> > > > Wendy Liang (6):
> > > >    dt-binding: soc: xilinx: ai-engine: Add AI engine binding
> > > >    misc: Add Xilinx AI engine device driver
> > > >    misc: xilinx-ai-engine: Implement AI engine cleanup sequence
> > > >    misc: xilinx-ai-engine: expose AI engine tile memories to usersp=
ace
> > > >    misc: xilinx-ai-engine: add setting shim dma bd operation
> > > >    misc: xilinx-ai-engine: add request and release tiles
> > > > =

> > > >   .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
> > > >   MAINTAINERS                                        |   8 +
> > > >   drivers/firmware/xilinx/zynqmp.c                   |  14 +
> > > >   drivers/misc/Kconfig                               |  12 +
> > > >   drivers/misc/Makefile                              |   1 +
> > > >   drivers/misc/xilinx-ai-engine/Makefile             |  16 +
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 ++++++++=
+++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++=
++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 ++++++++=
+++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++=
++++++++
> > > >   .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 ++++++++=
+++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++=
++++++++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
> > > >   drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
> > > >   include/linux/firmware/xlnx-zynqmp.h               |   8 +
> > > >   include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
> > > >   18 files changed, 4719 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/soc/xilinx/x=
lnx,ai-engine.yaml
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-intern=
al.h
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interr=
upt.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
> > > >   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
> > > >   create mode 100644 include/uapi/linux/xlnx-ai-engine.h
> > > > =

> > > > --
> > > > 2.7.4
> > > > =

> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
