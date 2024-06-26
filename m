Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42139917719
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4010E0DB;
	Wed, 26 Jun 2024 04:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="q1Nm6DTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E42A10E0DB;
 Wed, 26 Jun 2024 04:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719374714; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CAPa6Aj2Y2HL8mzZc5fV6ECiVYcsMgX66jazEIYBV/U0ZJVgH5HhrsMjUldKgJm21nhShjfxMkUiAFhqU99d/9AOCRAboVDwgVhiIDmG0AFbmqUpF00G8CnL9JTOMr7+KjUXXT8gTE0LAOGfYez0Vb7+UwhAmDxn+nHJEr5Ez0E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719374714;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hhGijfId24GEBbrm7ReBatnnsh5MHanQyyCxdVZJ9dk=; 
 b=ET+Xy4rjWl8lIgVMo1YpFVOc73DNVF/bXgNRjtVR4X/JHvcVfL15PnUWajHIgQs9z9LB+uri2vC8mpGbZl0TWiijr8Yh+Rq6PydP0bzFKySdvuTYjHT85IVVut6aeJe7T0UScwa2XYk4PKezoiVGS3WlZLkWRFhiWP8WK98GMgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719374714; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=hhGijfId24GEBbrm7ReBatnnsh5MHanQyyCxdVZJ9dk=;
 b=q1Nm6DTxMt9IMOw5XHuS3wiQ4Y1E0zWjGVEhCb8WlRbdHtoyUwDuh8y/I+jKz5o0
 4ZLEnzc5C3FBLRjJxQm9iNwALdvgWqmZR8UMr6qttW5coeXx8ADw23DxMGp/6M1fEAZ
 xVo/zdj4YiXfPENUXeBnEV7ZbKtHB+3aSA8VZxf6dKMialiur8WebXS49N5HeaX7BW6
 zonSs57cDlAZPJhE1zX8sGq4pJMGQJ5XNmv5O8U3DK5RwTOsIWTOsRdPbCilH37lnFQ
 7d9lj/BbEGe9WCizjRQYTwVX24SyzlyhhvA9Zjr0N5X1fkxZTXKmNT84LHZqpUhTmLo
 6rsMXNXlrA==
Received: by mx.zohomail.com with SMTPS id 1719374711329932.3771169735762;
 Tue, 25 Jun 2024 21:05:11 -0700 (PDT)
Message-ID: <a2c38e7479610ea9a325be3b08897dbe5e18887d.camel@icenowy.me>
Subject: Re: [etnaviv-next v14 0/8] drm/etnaviv: Add driver wrapper for
 vivante GPUs attached on PCI(e) device
From: Icenowy Zheng <uwu@icenowy.me>
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Wed, 26 Jun 2024 12:05:07 +0800
In-Reply-To: <2e7a6d8defc84073a204a2071d834d87012a0f7d.camel@pengutronix.de>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
 <19acb7b11ed22a0a87694b2e74807b82e3b5450e.camel@icenowy.me>
 <2e7a6d8defc84073a204a2071d834d87012a0f7d.camel@pengutronix.de>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2024-06-25=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 14:01 +0200=EF=BC=
=8CLucas Stach=E5=86=99=E9=81=93=EF=BC=9A
> Am Dienstag, dem 25.06.2024 um 11:18 +0800 schrieb Icenowy Zheng:
> > =E5=9C=A8 2024-05-20=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 00:53 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > drm/etnaviv use the component framework to bind multiple GPU
> > > cores to
> > > a
> > > virtual master, the virtual master is manually create during
> > > driver
> > > load
> > > time. This works well for various SoCs, yet there are some PCIe
> > > card
> > > has
> > > the vivante GPU cores integrated. The driver lacks the support
> > > for
> > > PCIe
> > > devices currently.
> > >=20
> > > Adds PCIe driver wrapper on the top of what drm/etnaviv already
> > > has,
> > > the
> > > component framework is still being used to bind subdevices, even
> > > though
> > > there is only one GPU core. But the process is going to be
> > > reversed,
> > > we
> > > create virtual platform device for each of the vivante GPU IP
> > > core
> > > shipped
> > > by the PCIe master. The PCIe master is real, bind all the virtual
> > > child
> > > to the master with component framework.
> > >=20
> > >=20
> > > v6:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix build issue on =
system without CONFIG_PCI enabled
> > > v7:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add a separate patc=
h for the platform driver
> > > rearrangement
> > > (Bjorn)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Switch to runtime c=
heck if the GPU is dma coherent or
> > > not
> > > (Lucas)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add ETNAVIV_PARAM_G=
PU_COHERENT to allow userspace to
> > > query
> > > (Lucas)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove etnaviv_gpu.=
no_clk member (Lucas)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix Various typos a=
nd coding style fixed (Bjorn)
> > > v8:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Fix typos and remov=
e unnecessary header included
> > > (Bjorn).
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add a dedicated fun=
ction to create the virtual master
> > > platform
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device.
> > > v9:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Use PCI_VDEVICE() m=
acro (Bjorn)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add trivial stubs f=
or the PCI driver (Bjorn)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove a redundant =
dev_err() usage (Bjorn)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Clean up etnaviv_pd=
ev_probe() with
> > > etnaviv_of_first_available_node()
> > > v10:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add one more cleanu=
p patch
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Resolve the conflic=
t with a patch from Rob
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Make the dummy PCI =
stub inlined
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Print only if the p=
latform is dma-coherrent
> > > V11:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Drop unnecessary ch=
anges (Lucas)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Tweak according to =
other reviews of v10.
> > >=20
> > > V12:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Create a virtual pl=
atform device for the subcomponent
> > > GPU
> > > cores
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Bind all subordinat=
e GPU cores to the real PCI master
> > > via
> > > component.
> > >=20
> > > V13:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Drop the non-compon=
ent code path, always use the
> > > component
> > > framework
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to bind subcom=
ponent GPU core. Even though there is
> > > only
> > > one core.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Defer the irq handl=
er register.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Rebase and improve =
the commit message
> > >=20
> > > V14:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Rebase onto etnaviv=
-next and improve commit message.
> > >=20
> > > Tested with JD9230P GPU and LingJiu GP102 GPU.
> >=20
> > BTW how should VRAM and displayed related parts be handled on these
> > dGPUs?
> >=20
> The only way to handle VRAM properly would be to rewrite our GEM
> internals using TTM.

I suggest for these kind of dGPU to create a brand new driver instead.

BTW, Jingfeng, what's the situation of the Loongson 7A1000 GPU? Do it
share the same address space with the CPU?

(The display of 7A is another virtual PCI device that is already
handled in loongson-drm driver and don't need to be worried)

>=20
> Regards,
> Lucas
>=20
> > >=20
> > > Sui Jingfeng (8):
> > > =C2=A0 drm/etnaviv: Add a dedicated helper function to get various
> > > clocks
> > > =C2=A0 drm/etnaviv: Add constructor and destructor for the
> > > =C2=A0=C2=A0=C2=A0 etnaviv_drm_private structure
> > > =C2=A0 drm/etnaviv: Embed struct drm_device into struct
> > > etnaviv_drm_private
> > > =C2=A0 drm/etnaviv: Fix wrong cache property being used for vmap()
> > > =C2=A0 drm/etnaviv: Add support for cached coherent caching mode
> > > =C2=A0 drm/etnaviv: Replace the '&pdev->dev' with 'dev'
> > > =C2=A0 drm/etnaviv: Allow creating subdevices and pass platform
> > > specific
> > > data
> > > =C2=A0 drm/etnaviv: Add support for vivante GPU cores attached via
> > > PCIe
> > > =C2=A0=C2=A0=C2=A0 device
> > >=20
> > > =C2=A0drivers/gpu/drm/etnaviv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > > =C2=A0drivers/gpu/drm/etnaviv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 159 ++++++++++---
> > > ---
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 27 +++
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++-
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |=C2=A0=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 144 +++++++++----
> > > -
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c=C2=A0=C2=A0=C2=A0 | 1=
87
> > > +++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 18 ++
> > > =C2=A0include/uapi/drm/etnaviv_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A012 files changed, 468 insertions(+), 110 deletions(-)
> > > =C2=A0create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
> > >=20
> > >=20
> > > base-commit: 52272bfff15ee70c7bd5be9368f175948fb8ecfd
> >=20
>=20

