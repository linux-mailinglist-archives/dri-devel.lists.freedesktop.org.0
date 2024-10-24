Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D2E9AD8F1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 02:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37D10E24B;
	Thu, 24 Oct 2024 00:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iupFRyQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C206210E24B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 00:26:40 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-460b295b9eeso18681cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729729599; x=1730334399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0t1/W3VOoKzRco/3jb/6PzML2qkeqAFFQKJfPMJh0zQ=;
 b=iupFRyQSlpVYaj5cD90e9+KlrME2YM8dncI9jKxaBakLS3Ra+60NVbIWKnaDiGDrWE
 dw+GSuhcoxb8TW+ZOf7QwoaaqyCqbdYskSMdUIcrWdz7Mo2wcf0uKM0vW5YIG0bxzIXE
 /o2LW26GrNTeUMB6YEhFdybV9yLRYm63qGQVNs66iTPpkiH1pQ09FErlFm5+p6OoFiZG
 +wIfNDbu1mm1GZmXi/erQiVhWz1pcSYmPt4b5CKOitxTnOenZyjMfF5KX2HWel6uO9IB
 DcrmLZrTCrngfB7GcXSMWTw5DWmASmQVdtTeObep44vKLWpFDcehRTLjcPtRWn+0PQtR
 qEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729729599; x=1730334399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0t1/W3VOoKzRco/3jb/6PzML2qkeqAFFQKJfPMJh0zQ=;
 b=AFsxpLw1wKcrTV+LaZ7PesSwfSw8xgLPMBdloBnbUdqH0j/FfHHU18NayOmPVd0ta3
 yu1d/vHDK0bJT7HFWO6E5eknDYfiG4cvIXrYkMyDekKu4kfXRzZzXDIym1+D+lxiOVHq
 D+zGQmPRPWgn9LOQRrauXYsCzC1URXPjxhUCzmdc8PWoRLKyVUBBSHv9xTIZN/RLC1/v
 uNufm29sWbDEEInsjMQK8MWMyaxI1LIavpn4ZS6ltR9pDE5GX8Ba8k4PJaGu9QHwomFC
 H8x0IgwGqF+2APioK8aH/hePkCtiN3e5U7qPssTuQuanIxGUK92yhOD1Dc8Gl3h+DjMe
 EZag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN43W2SYocVJNvnb1dZ1BA9VwAfPwImMBzQszwuEOyTWdyo78P11h/UL8CaBL21Snw+qchCiGwkck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk46xNLP+3diG0NfPYMNkQuykOy8xwhZOc/OxIbDeg28wCUh3r
 HlcsoKqHXU1CmaRezdo9lXptuzrbZTCCACZrcC727oGvy3IeBKjjwDaZsh9YmXiKTV1dZZDwyE4
 aLXCfrMfH4k8lIx4/TIJzDTebNlGVk7izy0zu
X-Google-Smtp-Source: AGHT+IEQrVkBml7UI0Uw4ZtwGBqVXrIo5cxee2Oexbu2tWb028MtGoy/IcXDifMTYHr92UFgH6qTtnfUiTeu1uraXWU=
X-Received: by 2002:a05:622a:256:b0:45c:9eab:cce0 with SMTP id
 d75a77b69052e-46124382133mr802111cf.15.1729729599106; Wed, 23 Oct 2024
 17:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240930144057.453751-1-mripard@kernel.org>
 <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>
 <20241021-defiant-unicorn-of-authority-b23277@houat>
In-Reply-To: <20241021-defiant-unicorn-of-authority-b23277@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 23 Oct 2024 17:26:26 -0700
Message-ID: <CABdmKX2LFz7t_k9EB25HpC7EacA343Eh6D46in2fLeUHcBFvLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2024 at 9:30=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi TJ,
>
> Thanks for your review
>
> On Tue, Oct 01, 2024 at 11:03:41PM +0200, T.J. Mercier wrote:
> > On Mon, Sep 30, 2024 at 4:41=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > >
> > > Following a recent discussion at last Plumbers, John Stultz, Sumit
> > > Sewal, TJ Mercier and I came to an agreement that we should document
> > > what the dma-buf heaps names are expected to be, and what the buffers
> > > attributes you'll get should be documented.
> > >
> > > Let's create that doc to make sure those attributes and names are
> > > guaranteed going forward.
> >
> > Hey, thanks for sending this!
> >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > ---
> > >
> > > To: Jonathan Corbet <corbet@lwn.net>
> > > To: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > Cc: John Stultz <jstultz@google.com>
> > > Cc: "T.J. Mercier" <tjmercier@google.com>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-doc@vger.kernel.org
> > > ---
> > >  Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++=
++
> > >  Documentation/userspace-api/index.rst         |  1 +
> > >  2 files changed, 72 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
> > >
> > > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Document=
ation/userspace-api/dma-buf-heaps.rst
> > > new file mode 100644
> > > index 000000000000..00436227b542
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > > @@ -0,0 +1,71 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Allocating dma-buf using heaps
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. T=
hey are
> > > +typically used to allocate buffers from a specific allocation pool, =
or to share
> > > +buffers across frameworks.
> > > +
> > > +Heaps
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +A heap represent a specific allocator. The Linux kernel currently su=
pports the
> >
> > "represents"
> >
> > > +following heaps:
> > > +
> > > + - The ``system`` heap allocates virtually contiguous, cacheable, bu=
ffers
> >
> > Virtually contiguous sounds a little weird to me here. Sure, that's
> > what userspace will get when it maps the buffer (and I guess this *is*
> > UAPI documentation after all), but I'm not sure it's correct to say
> > that's a property of the buffer itself? What if we invert this and
> > instead say that there is NO guarantee that the memory for the buffer:
> >  - is physically contiguous
> >  - has any particular alignment (greater than page aligned)
> >  - has any particular page size (large order allocations are attempted
> > first, but not guaranteed or even likely on some systems)
> >  - has bounds on physical addresses
> >
> > Maybe that is too much detail here...
>
> Yeah, I don't know.
>
> It's getting philosophical, but I guess there's an infinite number of
> guarantees we wouldn't provide. It seems easier for me to maintain a
> list of the things a buffer is/has rather than the opposite.
>
> But maybe we can rephrase virtually contiguous if it's weird to you?

You're right, I'm being too picky here. Virtually contiguous is as
reasonable as anything else I can come up with.

> > > +
> > > + - The ``reserved`` heap allocates physically contiguous, cacheable,=
 buffers.
> > > +   Depending on the platform, it might be called differently:
> > > +
> > > +    - Acer Iconia Tab A500: ``linux,cma``
> > > +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > > +    - Amlogic A1: ``linux,cma``
> > > +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> > > +    - Amlogic GXBB/GXL: ``linux,cma``
> > > +    - ASUS EeePad Transformer TF101: ``linux,cma``
> > > +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cm=
a``
> > > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,c=
ma``
> > > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,c=
ma``
> > > +    - Asus Transformer Infinity TF700T: ``linux,cma``
> > > +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> > > +    - Asus Transformer Pad TF300T: ``linux,cma``
> > > +    - Asus Transformer Pad TF701T: ``linux,cma``
> > > +    - Asus Transformer Prime TF201: ``linux,cma``
> > > +    - ASUS Vivobook S 15: ``linux,cma``
> > > +    - Cadence KC705: ``linux,cma``
> > > +    - Digi International ConnectCore 6UL: ``linux,cma``
> > > +    - Freescale i.MX8DXL EVK: ``linux,cma``
> > > +    - Freescale TQMa8Xx: ``linux,cma``
> > > +    - Hisilicon Hikey: ``linux,cma``
> > > +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> > > +    - Lenovo ThinkPad X13s: ``linux,cma``
> > > +    - Lenovo Yoga Slim 7x: ``linux,cma``
> > > +    - LG Optimus 4X HD P880: ``linux,cma``
> > > +    - LG Optimus Vu P895: ``linux,cma``
> > > +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> > > +    - Microsoft Romulus: ``linux,cma``
> > > +    - NXP i.MX8ULP EVK: ``linux,cma``
> > > +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> > > +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> > > +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> > > +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> > > +    - Ouya Game Console: ``linux,cma``
> > > +    - Pegatron Chagall: ``linux,cma``
> > > +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> > > +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> > > +    - Qualcomm SC8280XP CRD: ``linux,cma``
> > > +    - Qualcomm X1E80100 CRD: ``linux,cma``
> > > +    - Qualcomm X1E80100 QCP: ``linux,cma``
> > > +    - RaspberryPi: ``linux,cma``
> > > +    - Texas Instruments AM62x SK board family: ``linux,cma``
> > > +    - Texas Instruments AM62A7 SK: ``linux,cma``
> > > +    - Toradex Apalis iMX8: ``linux,cma``
> > > +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> > > +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> > > +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> > > +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> > > +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> > > +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> > > +
> >
> > This part LGTM. Might be worth it to document that a CMA region must
> > be specified on the kernel command line. Otherwise this heap won't
> > show up at runtime by only enabling the kernel configs necessary to
> > build it.
>
> Really? My understanding was that you need a default CMA region, which
> happens either if you have cma=3D on the kernel command line, a default
> CMA pool in the DT, or if CMA_SIZE_MBYTES isn't set to 0?

Ok yes, these too. :)
>
> Maxime
