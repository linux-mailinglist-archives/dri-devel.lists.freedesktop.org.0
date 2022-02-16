Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E614B8BBF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EC310E5F5;
	Wed, 16 Feb 2022 14:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0410E305;
 Wed, 16 Feb 2022 14:44:57 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v25so937378oiv.2;
 Wed, 16 Feb 2022 06:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZfSQZQxt4HHcosh60kF5DrahqnnBqhxW2+B/HVlhVQ=;
 b=gBLiE5COwtlxpeg5bP/cflxeUEIfzo3adr8umnPK9BARTMW1aUkLD8U/XoYc2ZI3vi
 P3ZwrjGmwigBU9IvrIlsJ2btK4BpjVM0O8jbmeh0XvPfYneNVnaBWskA9LYToVZv4J7V
 2PO67wcTiDFncZWbkKlChttRtEUyivRRtMI55fGIPYEn0nNcgIyLnAB4IoXifnrkrLeZ
 1vx2HRyaYb+P5ms3NWNTfHa34v9zkRDmlq/recNVjO9XpAQDYkZb8+TpFTeuBfKuwwQi
 xBQRKE7+sKPmzpYUSoWLF+cKI1XL7v6Cc5NeqUrxV0d4xepSXFp9ATtTeEwDUGWHSDIW
 +m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZfSQZQxt4HHcosh60kF5DrahqnnBqhxW2+B/HVlhVQ=;
 b=X1r7Wkhzo9kBZ+DzAX192QzrWGpvNk0iV/yTsRpFh5f8uY9pE07O/P8T/TDUApTJJJ
 RJgt9Yo+aEzfLa2YonO227ApWT1ag5/ZZhH+84LwWkK7OLhGphhzBw4DBqTwYUgC7Wr4
 SUfx3A+sClSm/2bJO3+WALIhdo+M56pzFGUQvnEuRJjO035jxVskIeRaEaOcdzL/NxIg
 p8qe93zDpfFI68FLKoDdP1pM56PBZWgGafhcZWWX3tcuVbR0nAqZ15pG30GJsTOXIm0M
 iv8Ye+HdaaWwDAijOsVt3dsdTPqzn1lJxQluMKvIVAruT98E9HNIK+l2jtwcE/xO3SiK
 0VVg==
X-Gm-Message-State: AOAM530m5LgOnDVcdXqjt3XEfOG/L6e9plWdwtyP9x4g47jlk7qsNR0w
 EsdrMH6/vmXwlReqd7IXoQwU2ht8EnyQDbLe64c=
X-Google-Smtp-Source: ABdhPJzq+mBVs9KSAVqsz7mT3sOrbb6YojSYZdx+P+T7uy1NkZCAIu7o6eCu8YSZ5PhToZRr7KFG+dxbC2auKZvRyQA=
X-Received: by 2002:a54:4416:0:b0:2d0:d4d1:8363 with SMTP id
 k22-20020a544416000000b002d0d4d18363mr802937oiw.132.1645022696293; Wed, 16
 Feb 2022 06:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20220215000200.242799-1-mario.limonciello@amd.com>
 <20220215072911.GA13892@wunner.de>
 <3078823e-4ab4-27b6-b1c7-c6552fbfdb2e@amd.com>
 <Yg0LaujhftM0b8N/@lahna>
In-Reply-To: <Yg0LaujhftM0b8N/@lahna>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Feb 2022 09:44:44 -0500
Message-ID: <CADnq5_Ov3T9WH29MjgC2byqgTGkn-ux7iUaK3z5s2v4At_b3Ow@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Overhaul `is_thunderbolt`
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, "Limonciello,
 Mario" <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 9:34 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi all,
>
> On Tue, Feb 15, 2022 at 01:07:00PM -0600, Limonciello, Mario wrote:
> > On 2/15/2022 01:29, Lukas Wunner wrote:
> > > On Mon, Feb 14, 2022 at 06:01:50PM -0600, Mario Limonciello wrote:
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
> > > >   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
> > > >   drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
> > > >   drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
> > > >   drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
> > > >   drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
> > > >   drivers/pci/pci-acpi.c                  | 15 ++++-
> > > >   drivers/pci/pci.c                       | 17 +++--
> > > >   drivers/pci/probe.c                     | 52 ++++++++++++++-
> > > >   drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
> > > >   drivers/platform/x86/apple-gmux.c       |  2 +-
> > > >   drivers/thunderbolt/nhi.h               |  2 -
> > > >   include/linux/pci.h                     | 25 +-------
> > > >   include/linux/pci_ids.h                 |  3 +
> > > >   14 files changed, 173 insertions(+), 47 deletions(-)
> > >
> > > That's an awful lot of additional LoC for what is primarily
> > > a refactoring job with the intent to simplify things.
> >
> > You may recall the first version of this series was just for adding
> > USB4 matches to the existing code paths, and that's when it was noted
> > that is_thunderbolt is a bit overloaded.
> >
> > >
> > > Honestly this looks like an attempt to fix something that
> > > isn't broken.  Specifically, the is_thunderbolt bit apparently
> > > can't be removed without adding new bits to struct pci_dev.
> > > Not sure if that can be called progress. >
> > > Thanks,
> > >
> > > Lukas
> >
> > Within this series there are two new material patches; setting up root ports
> > for both integrated and discrete USB4 controllers to behave well with all
> > the existing drivers that rely upon a hint of how they're connected to
> > configure devices differently.
> >
> > If y'all collectively prefer this direction to not refactor is_thunderbolt
> > and push into quirks, a simpler version of this series would be to leave all
> > the quirks in place, just drop dev->is_thunderbolt, and set
> > dev->external_facing on all 3 cases:
> >
> > * Intel TBT controller
> > * USB4 integrated PCIe tunneling root port/XHCI tunneling root port
> > * USB4 disctete PCIe tunneling root port/XHCI tunneling root port
> >
> > All the other drivers and symbols can stay the same then.
>
> If I understand correctly the original intention of this patch series is
> to be able to differentiate whether the device is "permanently"
> connected to the motherboard, or it is connected over some hot-pluggable
> bus (PCIe, USB, USB4 for example but I'm sure there are other buses that
> fit into this picture too). Specifically this is needed for discrete
> GPUs because of power management differences or so (please correct me if
> I'm mistaken).
>
> If we set the is_thunderbolt debate aside and concentrate on that issue,
> I think the way to do this is to check whether the root port the GPU is
> connected to has an ACPI power resource (returned from _PR3() method).
> IF it is present then most likely the platform has provided all the
> necessary wiring to move the GPU into D3cold (and the BIOS knows this).
> If it is not present then the device cannot even go into D3cold as there
> is not means to power of the device in PCIe spec.
>
> Perhaps we can simply use pci_pr3_present() here as nouveau is already
> doing? Granted it is not too elegant solution either but better than
> using is_thunderbolt IMHO. Since this seem to be common for many GPUs,
> perhaps we can have a helper in DRM core that handles this.

The tricky part is that there were AMD and NVIDIA specific proprietary
_PR3-like ACPI methods (plus whatever Apple did) prior to GPU power
control standardizing on _PR3.  Currently those methods are handled in
the drivers directly, sort of tangled up with vga_switcheroo.  I think
ideally that logic would move to the ACPI core and be handled the same
way as _PR3, but I'm not sure how well that would work because of the
various bios date checks around _PR3 and the lack of general _PR3
support in those older platforms.  So I think we still need some sort
of "is this soldered in" check.

Alex


>
> Then going back to is_thunderbolt debate :) I really don't think the
> drivers should care whether they are connected over a tunnel or not.
> They should work regardless of the underlying transport of the native
> protocol. They should also be prepared for the fact that the hardware
> can vanish under them at any point (e.g user unplugs the device). For
> this reason I don't really like to see is_thunderbolt to be used more
> and prefer to get rid if it completely if possible at all. If there is
> still need to differentiate whether the device can be hot-removed or
> not, I think "removable" in the driver core is the way to go. That is
> not dependent on any single transport.
