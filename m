Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512B6BD126
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3C810E19F;
	Thu, 16 Mar 2023 13:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9B510E19F;
 Thu, 16 Mar 2023 13:45:26 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 m20-20020a9d6094000000b0069caf591747so993561otj.2; 
 Thu, 16 Mar 2023 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678974326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWCKbtplZJ+ZPgiQ+llRwn6vMzQlR6RfveV/kyzoYt0=;
 b=Fa5TBJOICTZGaAxV8ye5x/ZGojNIPknDBs5bvwl/jjueeLJVcAM9u1WFzuXQI7xZCR
 n7Kg/cy4BRgB25po6d/b/l6zWT4zDdvL2TmjSvcTB6aaPSDjYx0DTg7J/Ef3bJ1vHrfP
 oc3iTg8aJ+duikjB3ZL0qXYVMXCAAwGrg+YD3g82Cdkt6m3gdjfq+00C3MOagRFgOfPO
 8gPjTi+3DqW8ZvZ1o+KlDr+O1RGQYuO6L99FTGyc/GY1iALewM4OETUp5E3miX4XFIFp
 eYrGZtgMHqU4iH1Yk3QGWbiUWd99Q6qZxWmwmN3GvrpCWRJrOrbOR4SzR863ePdEPcBC
 C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWCKbtplZJ+ZPgiQ+llRwn6vMzQlR6RfveV/kyzoYt0=;
 b=sDb1MwtBIznKainAOLOy9h7eWZVrat/nXgtrNCUfrN6HSwsQKfJDGdAMBt+Ko16FP7
 tm8I+880eSgSMWRzu4O+xt+y5EHZgMyoGS8WcQ2KfecKOAbSQUycEsG7ueO16+350cWL
 J2F6o6xH3wdmVNkgfzpw2OT2hnEQtzrMBisNH76CWvFTUcYQ7SHqYYCGhdpI5bUyyaHO
 S1htphnVJmI24of0IlJ930VIIFVumSUhoPIqDK1OiKyPYUo+LgBRnvOKIuvZ5EJb0H1H
 4r6q2orRgOlbT2iRz53TUjqFNzxAd1tLXJpeEmTmJLPFjuGx1Lr/0BZ56d6qYdCmyK6+
 0P8w==
X-Gm-Message-State: AO0yUKXT9jOuwEujfdrOy+2COFOLFayb4bRdTRoUEMhFhq/sqqrCJ4ZG
 V7MFcAGpM6xbjNRADtAOLn3Nf+Qcx6eYALVv8xM=
X-Google-Smtp-Source: AK7set+3qR+KxTZtbczZDS3CGBW6F0/GCDOIJw7w85TfFDZI7hjqtUvXWb4ZF1iNyyygRY1zoh1WOtxULP5svQP6l+0=
X-Received: by 2002:a05:6830:3345:b0:698:d198:fe9a with SMTP id
 l5-20020a056830334500b00698d198fe9amr2702720ott.3.1678974325749; Thu, 16 Mar
 2023 06:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
In-Reply-To: <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Mar 2023 09:45:14 -0400
Message-ID: <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 3:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.03.2023 00:25, Stefano Stabellini wrote:
> > On Wed, 15 Mar 2023, Jan Beulich wrote:
> >> On 15.03.2023 01:52, Stefano Stabellini wrote:
> >>> On Mon, 13 Mar 2023, Jan Beulich wrote:
> >>>> On 12.03.2023 13:01, Huang Rui wrote:
> >>>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
> >>>>> virtualization support when possible. It will using the hardware IO=
MMU
> >>>>> support instead of xen-swiotlb, so disable swiotlb if current domai=
n is
> >>>>> Xen PVH.
> >>>>
> >>>> But the kernel has no way (yet) to drive the IOMMU, so how can it ge=
t
> >>>> away without resorting to swiotlb in certain cases (like I/O to an
> >>>> address-restricted device)?
> >>>
> >>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
> >>> need for swiotlb-xen in Dom0. Address translations are done by the IO=
MMU
> >>> so we can use guest physical addresses instead of machine addresses f=
or
> >>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is availabl=
e
> >>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the correspond=
ing
> >>> case is XENFEAT_not_direct_mapped).
> >>
> >> But how does Xen using an IOMMU help with, as said, address-restricted
> >> devices? They may still need e.g. a 32-bit address to be programmed in=
,
> >> and if the kernel has memory beyond the 4G boundary not all I/O buffer=
s
> >> may fulfill this requirement.
> >
> > In short, it is going to work as long as Linux has guest physical
> > addresses (not machine addresses, those could be anything) lower than
> > 4GB.
> >
> > If the address-restricted device does DMA via an IOMMU, then the device
> > gets programmed by Linux using its guest physical addresses (not machin=
e
> > addresses).
> >
> > The 32-bit restriction would be applied by Linux to its choice of guest
> > physical address to use to program the device, the same way it does on
> > native. The device would be fine as it always uses Linux-provided <4GB
> > addresses. After the IOMMU translation (pagetable setup by Xen), we
> > could get any address, including >4GB addresses, and that is expected t=
o
> > work.
>
> I understand that's the "normal" way of working. But whatever the swiotlb
> is used for in baremetal Linux, that would similarly require its use in
> PVH (or HVM) aiui. So unconditionally disabling it in PVH would look to
> me like an incomplete attempt to disable its use altogether on x86. What
> difference of PVH vs baremetal am I missing here?

swiotlb is not usable for GPUs even on bare metal.  They often have
hundreds or megs or even gigs of memory mapped on the device at any
given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
the chip family).

Alex
