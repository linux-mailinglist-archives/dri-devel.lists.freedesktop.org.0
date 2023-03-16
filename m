Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092096BD16F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3008210ECEA;
	Thu, 16 Mar 2023 13:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECB210ECEA;
 Thu, 16 Mar 2023 13:53:27 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-177b78067ffso2222209fac.7; 
 Thu, 16 Mar 2023 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678974806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NT2+ny4p/vVYNzr7+EK2Lb0ixcwCh6elsP4Qy0BaT6o=;
 b=epd5FV2Fr1C10Z/wxi9lYv0/neUD0acFnvSabLSTeExSFzq6FBR61NtOkPotXxqduE
 brCR6NrGy0nAd/ZuhyIKajahPVWlyqLKTMcu3j3/sqDJ0y7fODXdqghObHQRhZ0sAl7/
 ZnhPjY9r35Rq38NPvoRNjbxQWb3S+hxnmRL879TrtuNbeUNfmGvOwOY/0+Iotuys2qWe
 1LzrE9z6D3OK6j0RYoTO+2S49ip5lo7CjgK/iSYsB+95/j6YZUTv1irUX4KELtY418GT
 /BmDr2RP90VZB8Smm2fWftkXURgg+guml2VypqebETidlIzT3EMc6J33Jn9ApovvksTI
 uHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NT2+ny4p/vVYNzr7+EK2Lb0ixcwCh6elsP4Qy0BaT6o=;
 b=uUSNOYzpCvY4mX/La0efjboaTPLfyl1clTXpOqnEI05CK10hKBw72do62TxGkVTkfu
 PCeqKp3n4vZr2h7/XFYvHJ1wcFPdcVe256lT9Vx9IwIGIw2wFuikottd3A2HZ6krM2/t
 fcTsJ2LIzimfgW5/JGF7DHF4dv+sh6u0ex8hGh0za7qojsgW2hJ5rK2cTkrYXmLTWIIY
 vFhTeO+oPAvcyjTeXmIgRE/d8pfrv5CUOfWU17QGOvv8yWVBoEXHtoQWAa6BRRv6gWGi
 toSc2isYFSFpNv+fuo+ghEh58m8dBR2JWQBNHwXS9eX9zsijVFZhsmEcFWKFpJsdOJKg
 WLfg==
X-Gm-Message-State: AO0yUKWAOTJN8L1Pku1buTkiKdF3Jh46Lw2CLqMDuAva8mbBqiL17L9d
 U8R0VDBe0WXjFjMrehzbjv3Kq8ZJ8qIHQvkG3XegJZY8
X-Google-Smtp-Source: AK7set/x0uSpr4lrBp0ShQSg5kgvHD9bjWFd3R0T4/YE3AtaigBfKP2+ZizIOyaqzSaC6IVNg0nCI15OW1QygajqbX8=
X-Received: by 2002:a05:6870:886:b0:177:aa31:79d6 with SMTP id
 fx6-20020a056870088600b00177aa3179d6mr7154168oab.4.1678974806677; Thu, 16 Mar
 2023 06:53:26 -0700 (PDT)
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
In-Reply-To: <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Mar 2023 09:53:14 -0400
Message-ID: <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
To: Juergen Gross <jgross@suse.com>
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
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

On Thu, Mar 16, 2023 at 9:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 16.03.23 14:45, Alex Deucher wrote:
> > On Thu, Mar 16, 2023 at 3:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 16.03.2023 00:25, Stefano Stabellini wrote:
> >>> On Wed, 15 Mar 2023, Jan Beulich wrote:
> >>>> On 15.03.2023 01:52, Stefano Stabellini wrote:
> >>>>> On Mon, 13 Mar 2023, Jan Beulich wrote:
> >>>>>> On 12.03.2023 13:01, Huang Rui wrote:
> >>>>>>> Xen PVH is the paravirtualized mode and takes advantage of hardwa=
re
> >>>>>>> virtualization support when possible. It will using the hardware =
IOMMU
> >>>>>>> support instead of xen-swiotlb, so disable swiotlb if current dom=
ain is
> >>>>>>> Xen PVH.
> >>>>>>
> >>>>>> But the kernel has no way (yet) to drive the IOMMU, so how can it =
get
> >>>>>> away without resorting to swiotlb in certain cases (like I/O to an
> >>>>>> address-restricted device)?
> >>>>>
> >>>>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is =
no
> >>>>> need for swiotlb-xen in Dom0. Address translations are done by the =
IOMMU
> >>>>> so we can use guest physical addresses instead of machine addresses=
 for
> >>>>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is availa=
ble
> >>>>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the correspo=
nding
> >>>>> case is XENFEAT_not_direct_mapped).
> >>>>
> >>>> But how does Xen using an IOMMU help with, as said, address-restrict=
ed
> >>>> devices? They may still need e.g. a 32-bit address to be programmed =
in,
> >>>> and if the kernel has memory beyond the 4G boundary not all I/O buff=
ers
> >>>> may fulfill this requirement.
> >>>
> >>> In short, it is going to work as long as Linux has guest physical
> >>> addresses (not machine addresses, those could be anything) lower than
> >>> 4GB.
> >>>
> >>> If the address-restricted device does DMA via an IOMMU, then the devi=
ce
> >>> gets programmed by Linux using its guest physical addresses (not mach=
ine
> >>> addresses).
> >>>
> >>> The 32-bit restriction would be applied by Linux to its choice of gue=
st
> >>> physical address to use to program the device, the same way it does o=
n
> >>> native. The device would be fine as it always uses Linux-provided <4G=
B
> >>> addresses. After the IOMMU translation (pagetable setup by Xen), we
> >>> could get any address, including >4GB addresses, and that is expected=
 to
> >>> work.
> >>
> >> I understand that's the "normal" way of working. But whatever the swio=
tlb
> >> is used for in baremetal Linux, that would similarly require its use i=
n
> >> PVH (or HVM) aiui. So unconditionally disabling it in PVH would look t=
o
> >> me like an incomplete attempt to disable its use altogether on x86. Wh=
at
> >> difference of PVH vs baremetal am I missing here?
> >
> > swiotlb is not usable for GPUs even on bare metal.  They often have
> > hundreds or megs or even gigs of memory mapped on the device at any
> > given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
> > the chip family).
>
> But the swiotlb isn't per device, but system global.

Sure, but if the swiotlb is in use, then you can't really use the GPU.
So you get to pick one.

Alex
