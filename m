Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419F6BDCB1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 00:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1989610EE18;
	Thu, 16 Mar 2023 23:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD7910E3AD;
 Thu, 16 Mar 2023 23:09:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A6A562153;
 Thu, 16 Mar 2023 23:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ABDC433EF;
 Thu, 16 Mar 2023 23:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679008188;
 bh=w6jBwS1Um7mLlpoN+a+eGG2DalmQykD8t+mghS5Gsj8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Xn/mhMMsBa9jUDc41ni0DMUUt4rDxfMz2bHiXfw1XOBLWhlw+tv8t3tkSrUwFpzah
 F6yRYXxBoF/7NL4kJm7B7P6a+/rJg9wCMKkeddzgV3I3qHJ9pT3iSq+tgz8wl8Xao9
 EzFKSOr2Sg64KMAgUQ3mWgN0+rNM6KVcgflFqSJ/Ucm2c6D0hIxCfeJ9qxxM2o36FQ
 RbwxQjqrlHHlQYAoMD3qrxYbz5WjR8d+EK4phi4hERBwPm5Ed7Esg6/28AqzgONA8P
 oCmRbfB8rtZTOgM2VP0L/d4Ou9G/tVshG1zAD4c39viBP2ANCss0BD2ZrmJeQfKD9n
 j4Q+hcETWJIPQ==
Date: Thu, 16 Mar 2023 16:09:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
In-Reply-To: <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
 <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-549136083-1679007957=:3359"
Content-ID: <alpine.DEB.2.22.394.2303161606140.3359@ubuntu-linux-20-04-desktop>
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-549136083-1679007957=:3359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303161606141.3359@ubuntu-linux-20-04-desktop>

On Thu, 16 Mar 2023, Juergen Gross wrote:
> On 16.03.23 14:53, Alex Deucher wrote:
> > On Thu, Mar 16, 2023 at 9:48 AM Juergen Gross <jgross@suse.com> wrote:
> > > 
> > > On 16.03.23 14:45, Alex Deucher wrote:
> > > > On Thu, Mar 16, 2023 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > > > 
> > > > > On 16.03.2023 00:25, Stefano Stabellini wrote:
> > > > > > On Wed, 15 Mar 2023, Jan Beulich wrote:
> > > > > > > On 15.03.2023 01:52, Stefano Stabellini wrote:
> > > > > > > > On Mon, 13 Mar 2023, Jan Beulich wrote:
> > > > > > > > > On 12.03.2023 13:01, Huang Rui wrote:
> > > > > > > > > > Xen PVH is the paravirtualized mode and takes advantage of
> > > > > > > > > > hardware
> > > > > > > > > > virtualization support when possible. It will using the
> > > > > > > > > > hardware IOMMU
> > > > > > > > > > support instead of xen-swiotlb, so disable swiotlb if
> > > > > > > > > > current domain is
> > > > > > > > > > Xen PVH.
> > > > > > > > > 
> > > > > > > > > But the kernel has no way (yet) to drive the IOMMU, so how can
> > > > > > > > > it get
> > > > > > > > > away without resorting to swiotlb in certain cases (like I/O
> > > > > > > > > to an
> > > > > > > > > address-restricted device)?
> > > > > > > > 
> > > > > > > > I think Ray meant that, thanks to the IOMMU setup by Xen, there
> > > > > > > > is no
> > > > > > > > need for swiotlb-xen in Dom0. Address translations are done by
> > > > > > > > the IOMMU
> > > > > > > > so we can use guest physical addresses instead of machine
> > > > > > > > addresses for
> > > > > > > > DMA. This is a similar case to Dom0 on ARM when the IOMMU is
> > > > > > > > available
> > > > > > > > (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the
> > > > > > > > corresponding
> > > > > > > > case is XENFEAT_not_direct_mapped).
> > > > > > > 
> > > > > > > But how does Xen using an IOMMU help with, as said,
> > > > > > > address-restricted
> > > > > > > devices? They may still need e.g. a 32-bit address to be
> > > > > > > programmed in,
> > > > > > > and if the kernel has memory beyond the 4G boundary not all I/O
> > > > > > > buffers
> > > > > > > may fulfill this requirement.
> > > > > > 
> > > > > > In short, it is going to work as long as Linux has guest physical
> > > > > > addresses (not machine addresses, those could be anything) lower
> > > > > > than
> > > > > > 4GB.
> > > > > > 
> > > > > > If the address-restricted device does DMA via an IOMMU, then the
> > > > > > device
> > > > > > gets programmed by Linux using its guest physical addresses (not
> > > > > > machine
> > > > > > addresses).
> > > > > > 
> > > > > > The 32-bit restriction would be applied by Linux to its choice of
> > > > > > guest
> > > > > > physical address to use to program the device, the same way it does
> > > > > > on
> > > > > > native. The device would be fine as it always uses Linux-provided
> > > > > > <4GB
> > > > > > addresses. After the IOMMU translation (pagetable setup by Xen), we
> > > > > > could get any address, including >4GB addresses, and that is
> > > > > > expected to
> > > > > > work.
> > > > > 
> > > > > I understand that's the "normal" way of working. But whatever the
> > > > > swiotlb
> > > > > is used for in baremetal Linux, that would similarly require its use
> > > > > in
> > > > > PVH (or HVM) aiui. So unconditionally disabling it in PVH would look
> > > > > to
> > > > > me like an incomplete attempt to disable its use altogether on x86.
> > > > > What
> > > > > difference of PVH vs baremetal am I missing here?
> > > > 
> > > > swiotlb is not usable for GPUs even on bare metal.  They often have
> > > > hundreds or megs or even gigs of memory mapped on the device at any
> > > > given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
> > > > the chip family).
> > > 
> > > But the swiotlb isn't per device, but system global.
> > 
> > Sure, but if the swiotlb is in use, then you can't really use the GPU.
> > So you get to pick one.
> 
> The swiotlb is used only for buffers which are not within the DMA mask of a
> device (see dma_direct_map_page()). So an AMD GPU supporting a 44 bit DMA mask
> won't use the swiotlb unless you have a buffer above guest physical address of
> 16TB (so basically never).
> 
> Disabling swiotlb in such a guest would OTOH mean, that a device with only
> 32 bit DMA mask passed through to this guest couldn't work with buffers
> above 4GB.
> 
> I don't think this is acceptable.

From the Xen subsystem in Linux point of view, the only thing we need to
do is to make sure *not* to enable swiotlb_xen (yes "swiotlb_xen", not
the global swiotlb) on PVH because it is not needed anyway.

I think we should leave the global "swiotlb" setting alone. The global
swiotlb is not relevant to Xen anyway, and surely baremetal Linux has to
have a way to deal with swiotlb/GPU incompatibilities.

We just have to avoid making things worse on Xen, and for that we just
need to avoid unconditionally enabling swiotlb-xen. If the Xen subsystem
doesn't enable swiotlb_xen/swiotlb, and no other subsystem enables
swiotlb, then we have a good Linux configuration capable of handling the
GPU properly.

Alex, please correct me if I am wrong. How is x86_swiotlb_enable set to
false on native (non-Xen) x86?
--8323329-549136083-1679007957=:3359--
