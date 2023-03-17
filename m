Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7696BEBA3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 15:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA9610E3BB;
	Fri, 17 Mar 2023 14:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3C010E3BB;
 Fri, 17 Mar 2023 14:46:01 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso6008464fac.4; 
 Fri, 17 Mar 2023 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679064360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvHIQvGXPksg6eiMeqxwoXshxo7XvcPUBVGQpYXhIn0=;
 b=d3J1Yg76xfhH/tPjOqY0fhibOj4dJPEZYK9wPEa0DkYAtZTATUJ91pJ4lEpsEVmClV
 2fxlQ8IsSa4IbkXdax9QWDHPfty6LhNDlh+PxhEKf2hzKSW0p3FKhRVT6xASCxdQhxkU
 NaV+A719MqbWVnfupB9Mv+XkEiKdzibBJ0kKC4znfKtHHZtRKtaJGhi1NxP9wT3zako/
 TIkQwmxDIkIPSH9Hs747v1+GSS0SnHaStLNQqcHM+3mKRK75Vt873wQO1WV81h6d1/DV
 6Bs1CFnmb2eaPGbYEIzWLw/9eoitkLR6hDZ9dw2OubyxnZT83JfizrtqiJm4tQb5nK/W
 S3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvHIQvGXPksg6eiMeqxwoXshxo7XvcPUBVGQpYXhIn0=;
 b=gFJ6WeYV7k0wStTangauKOIxD8wxTIbp/WqFN9p9t59RQJOCvyM1+6X4KcozWW4on/
 2ZUBUn5LX1gF+vRz+pyVTqOru1r7xwzMkIaXPPOuWvFcEQYvG2epzIzzu6Lw4LOEeRNk
 HQob4c/1UjhKH318DUtDqNlqVU82kbQ85OYzlA9X7HfWpy7YUZ8Z4TMx0z/cfuCGnevl
 AzvAfa3XRzYzGCrlyAbp3He9B3m8lLBVI3oyEoULZDZoymLedzxkbl+Xqp1reCCjMv4K
 0CVf/YyyfBEeFfKe9m35tl4WZNyKzxsOSdLZUBKTSDt1ov6kX4/kc0jhpKqUgSepsi/f
 1jEQ==
X-Gm-Message-State: AO0yUKVDNtqVJyNxNF5UC9BYwO2ai3Fb2n4Y6xtLtj6msE+/GyQUdK3f
 BbrqNi3qzXAGftjUzxrS5alE9yq7t90bAlxBqbk=
X-Google-Smtp-Source: AK7set/wc8mkGeB3xsSh7uv2XahaDuGh1SCuyHKsNErSvesEESMC7ISG+xDqov6gcpVKj1eQNlfENSx+ogaCnLMgM8g=
X-Received: by 2002:a05:6870:d346:b0:172:426c:8304 with SMTP id
 h6-20020a056870d34600b00172426c8304mr14466173oag.3.1679064360305; Fri, 17 Mar
 2023 07:46:00 -0700 (PDT)
MIME-Version: 1.0
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
 <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 10:45:48 -0400
Message-ID: <CADnq5_NnOApcpkKb3UqAKAcS9s_gG3Lq4ssJDgCjq5ZQty2rnw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
To: Stefano Stabellini <sstabellini@kernel.org>
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
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Jan Beulich <jbeulich@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 7:09=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 16 Mar 2023, Juergen Gross wrote:
> > On 16.03.23 14:53, Alex Deucher wrote:
> > > On Thu, Mar 16, 2023 at 9:48=E2=80=AFAM Juergen Gross <jgross@suse.co=
m> wrote:
> > > >
> > > > On 16.03.23 14:45, Alex Deucher wrote:
> > > > > On Thu, Mar 16, 2023 at 3:50=E2=80=AFAM Jan Beulich <jbeulich@sus=
e.com> wrote:
> > > > > >
> > > > > > On 16.03.2023 00:25, Stefano Stabellini wrote:
> > > > > > > On Wed, 15 Mar 2023, Jan Beulich wrote:
> > > > > > > > On 15.03.2023 01:52, Stefano Stabellini wrote:
> > > > > > > > > On Mon, 13 Mar 2023, Jan Beulich wrote:
> > > > > > > > > > On 12.03.2023 13:01, Huang Rui wrote:
> > > > > > > > > > > Xen PVH is the paravirtualized mode and takes advanta=
ge of
> > > > > > > > > > > hardware
> > > > > > > > > > > virtualization support when possible. It will using t=
he
> > > > > > > > > > > hardware IOMMU
> > > > > > > > > > > support instead of xen-swiotlb, so disable swiotlb if
> > > > > > > > > > > current domain is
> > > > > > > > > > > Xen PVH.
> > > > > > > > > >
> > > > > > > > > > But the kernel has no way (yet) to drive the IOMMU, so =
how can
> > > > > > > > > > it get
> > > > > > > > > > away without resorting to swiotlb in certain cases (lik=
e I/O
> > > > > > > > > > to an
> > > > > > > > > > address-restricted device)?
> > > > > > > > >
> > > > > > > > > I think Ray meant that, thanks to the IOMMU setup by Xen,=
 there
> > > > > > > > > is no
> > > > > > > > > need for swiotlb-xen in Dom0. Address translations are do=
ne by
> > > > > > > > > the IOMMU
> > > > > > > > > so we can use guest physical addresses instead of machine
> > > > > > > > > addresses for
> > > > > > > > > DMA. This is a similar case to Dom0 on ARM when the IOMMU=
 is
> > > > > > > > > available
> > > > > > > > > (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, th=
e
> > > > > > > > > corresponding
> > > > > > > > > case is XENFEAT_not_direct_mapped).
> > > > > > > >
> > > > > > > > But how does Xen using an IOMMU help with, as said,
> > > > > > > > address-restricted
> > > > > > > > devices? They may still need e.g. a 32-bit address to be
> > > > > > > > programmed in,
> > > > > > > > and if the kernel has memory beyond the 4G boundary not all=
 I/O
> > > > > > > > buffers
> > > > > > > > may fulfill this requirement.
> > > > > > >
> > > > > > > In short, it is going to work as long as Linux has guest phys=
ical
> > > > > > > addresses (not machine addresses, those could be anything) lo=
wer
> > > > > > > than
> > > > > > > 4GB.
> > > > > > >
> > > > > > > If the address-restricted device does DMA via an IOMMU, then =
the
> > > > > > > device
> > > > > > > gets programmed by Linux using its guest physical addresses (=
not
> > > > > > > machine
> > > > > > > addresses).
> > > > > > >
> > > > > > > The 32-bit restriction would be applied by Linux to its choic=
e of
> > > > > > > guest
> > > > > > > physical address to use to program the device, the same way i=
t does
> > > > > > > on
> > > > > > > native. The device would be fine as it always uses Linux-prov=
ided
> > > > > > > <4GB
> > > > > > > addresses. After the IOMMU translation (pagetable setup by Xe=
n), we
> > > > > > > could get any address, including >4GB addresses, and that is
> > > > > > > expected to
> > > > > > > work.
> > > > > >
> > > > > > I understand that's the "normal" way of working. But whatever t=
he
> > > > > > swiotlb
> > > > > > is used for in baremetal Linux, that would similarly require it=
s use
> > > > > > in
> > > > > > PVH (or HVM) aiui. So unconditionally disabling it in PVH would=
 look
> > > > > > to
> > > > > > me like an incomplete attempt to disable its use altogether on =
x86.
> > > > > > What
> > > > > > difference of PVH vs baremetal am I missing here?
> > > > >
> > > > > swiotlb is not usable for GPUs even on bare metal.  They often ha=
ve
> > > > > hundreds or megs or even gigs of memory mapped on the device at a=
ny
> > > > > given time.  Also, AMD GPUs support 44-48 bit DMA masks (dependin=
g on
> > > > > the chip family).
> > > >
> > > > But the swiotlb isn't per device, but system global.
> > >
> > > Sure, but if the swiotlb is in use, then you can't really use the GPU=
.
> > > So you get to pick one.
> >
> > The swiotlb is used only for buffers which are not within the DMA mask =
of a
> > device (see dma_direct_map_page()). So an AMD GPU supporting a 44 bit D=
MA mask
> > won't use the swiotlb unless you have a buffer above guest physical add=
ress of
> > 16TB (so basically never).
> >
> > Disabling swiotlb in such a guest would OTOH mean, that a device with o=
nly
> > 32 bit DMA mask passed through to this guest couldn't work with buffers
> > above 4GB.
> >
> > I don't think this is acceptable.
>
> From the Xen subsystem in Linux point of view, the only thing we need to
> do is to make sure *not* to enable swiotlb_xen (yes "swiotlb_xen", not
> the global swiotlb) on PVH because it is not needed anyway.
>
> I think we should leave the global "swiotlb" setting alone. The global
> swiotlb is not relevant to Xen anyway, and surely baremetal Linux has to
> have a way to deal with swiotlb/GPU incompatibilities.
>
> We just have to avoid making things worse on Xen, and for that we just
> need to avoid unconditionally enabling swiotlb-xen. If the Xen subsystem
> doesn't enable swiotlb_xen/swiotlb, and no other subsystem enables
> swiotlb, then we have a good Linux configuration capable of handling the
> GPU properly.
>
> Alex, please correct me if I am wrong. How is x86_swiotlb_enable set to
> false on native (non-Xen) x86?

In most cases we have an IOMMU enabled and IIRC, TTM has slightly
different behavior for memory allocation depending on whether swiotlb
would be needed or not.

Alex
