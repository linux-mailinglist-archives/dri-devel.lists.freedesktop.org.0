Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3650C0EC8E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D708310E4D2;
	Mon, 27 Oct 2025 15:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXuiiI+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49A10E4D2;
 Mon, 27 Oct 2025 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761577462; x=1793113462;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=Oyvud8Xrb31jPdkUgL/nSFBCVRBEWFiP8+m62AJySW8=;
 b=UXuiiI+YHMUuxEHRISGkXmHuvoC3/N44Fowoq95Dhblb0cNJqjNXZNnI
 9pt/5mt6jFqIgfmoj5rxOT3N7VPztm542kIODwfD1o0Ipe2qUHveEt+hH
 EqCXm4w+p9fi8X2K1ZxZS4O5aWHk2mQk7asKSln8gBSytM+xCuhyzle8D
 fr8MEnNZuhAcoaro3IXNvQrWoJ7x5Jii2MqFwVYhv8GTWKinppa6bcG5L
 1VjA8o6Pg6z33RL6mNmjxJVW1bhqEz8NwlkP9l24RBVcTZXKK58oWdeP1
 i4ZqQ0sASVTYgYq8ccQjGb/8N+oFjJAvW9hkdRQ92YL/GREp1dCLmeJOZ Q==;
X-CSE-ConnectionGUID: xuMT/2cdQ7m/xYwg1M9NKw==
X-CSE-MsgGUID: cd0Bz5lzQP2FuK/wI1x0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63565648"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63565648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:04:22 -0700
X-CSE-ConnectionGUID: 8+IRZ5reQvGEkYVV6ZajvA==
X-CSE-MsgGUID: Of8F0flcS4i+xSIy6S8wgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184960852"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:04:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 Oct 2025 17:04:11 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: Release BAR0 of an integrated bridge to allow
 GPU BAR resize
In-Reply-To: <20251024224401.GA1371085@bhelgaas>
Message-ID: <5fa35d10-e3c6-9661-9287-47ebdcaca0d1@linux.intel.com>
References: <20251024224401.GA1371085@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1098205246-1761576381=:970"
Content-ID: <9d0e426b-9aa1-0ef7-b2f1-bd48534fcf9a@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1098205246-1761576381=:970
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <3bac46db-7de1-f5bc-b075-6d9ffad99397@linux.intel.com>

On Fri, 24 Oct 2025, Bjorn Helgaas wrote:
> On Thu, Sep 18, 2025 at 01:58:56PM -0700, Lucas De Marchi wrote:
> > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> > Resizing BAR to a larger size has to release upstream bridge windows in
> > order make the bridge windows larger as well (and to potential relocate
> > them into a larger free block within iomem space). Some GPUs have an
> > integrated PCI switch that has BAR0. The resource allocation assigns
> > space for that BAR0 as it does for any resource.
> >=20
> > An extra resource on a bridge will pin its upstream bridge window in
> > place which prevents BAR resize for anything beneath that bridge.
> >=20
> > Nothing in the pcieport driver provided by PCI core, which typically is
> > the driver bound to these bridges, requires that BAR0. Because of that,
> > releasing the extra BAR does not seem to have notable downsides but
> > comes with a clear upside.
> >=20
> > Therefore, release BAR0 of such switches using a quirk and clear its
> > flags to prevent any new invocation of the resource assignment
> > algorithm from assigning the resource again.
> >=20
> > Due to other siblings within the PCI hierarchy of all the devices
> > integrated into the GPU, some other devices may still have to be
> > manually removed before the resize is free of any bridge window pins.
> > Such siblings can be released through sysfs to unpin windows while
> > leaving access to GPU's sysfs entries required for initiating the
> > resize operation, whereas removing the topmost bridge this quirk
> > targets would result in removing the GPU device as well so no manual
> > workaround for this problem exists.
> >=20
> > Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3l=
wcp3h7esmvnyg26n44y@owo2ojiu2mov/
> > Link: https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icen=
owy.me/
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v6.12+
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >=20
> > Remarks from Ilpo: this feels quite hacky to me and I'm working towards=
 a
> > better solution which is to consider Resizable BAR maximum size the
> > resource fitting algorithm. But then, I don't expect the better solutio=
n
> > to be something we want to push into stable due to extremely invasive
> > dependencies. So maybe consider this an interim/legacy solution to the
> > resizing problem and remove it once the algorithmic approach works (or
> > more precisely retain it only in the old kernel versions).
> > ---
> >  drivers/pci/quirks.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index d97335a401930..9b1c08de3aa89 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -6338,3 +6338,26 @@ static void pci_mask_replay_timer_timeout(struct=
 pci_dev *pdev)
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_tim=
er_timeout);
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_tim=
er_timeout);
> >  #endif
> > +
> > +/*
> > + * PCI switches integrated into Intel Arc GPUs have BAR0 that prevents
> > + * resizing the BARs of the GPU device due to that bridge BAR0 pinning=
 the
> > + * bridge window it's under in place. Nothing in pcieport requires tha=
t
> > + * BAR0.
> > + *
> > + * Release and disable BAR0 permanently by clearing its flags to preve=
nt
> > + * anything from assigning it again.
>=20
> Does "disabling BAR0" actually work?  This quirk keeps the PCI core
> from assigning resources to the BAR, but I don't think we have a way
> to actually disable an individual BAR, do we?

No, we don't and that was just sloppy wording from me. The same problem
applies to any other non-assigned BAR resource, they too are there with
a dangling address that could conflict.

> I think the only control is PCI_COMMAND_MEMORY, and the bridge must
> have PCI_COMMAND_MEMORY enabled so memory accesses to downstream
> devices work.
>=20
> No matter what we do to the struct resource, the hardware BAR still
> contains some address, and the bridge will decode any accesses that
> match the address in the BAR.
>=20
> Maybe we could effectively disable the BAR by setting it to some
> impossible address, i.e., something outside both the upstream and
> downstream bridge windows so memory accesses could never be routed to
> it?

I'm not entire sure how one should acquire address outside of the valid=20
address ranges? Is the resource-to-bus mapping even valid outside a=20
window?

Perhaps find either min(start address) or max(end address) over all
windows as those boundary addresses should be still mappable and place=20
the BAR right below or above either of those by subtracting the resource=20
size or adding +1). How does that approach sound?

(There could be cases where a simple approach like that fails when both=20
ends of the range are in use but then I wouldn't want to over-engineer the=
=20
approach at this point unless we know there are such problematic cases
in practice.)

It would be nice to do it eventually for any non-assigned BAR but it=20
requires preserving those res->flags (for non-window resources too) in=20
order to know which of them are even even usable as BARs.

--=20
 i.

> > + */
> > +static void pci_release_bar0(struct pci_dev *pdev)
> > +{
> > +=09struct resource *res =3D pci_resource_n(pdev, 0);
> > +
> > +=09if (!res->parent)
> > +=09=09return;
> > +
> > +=09pci_release_resource(pdev, 0);
> > +=09res->flags =3D 0;
> > +}
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa0, pci_release_bar0=
);
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa1, pci_release_bar0=
);
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0=
);
> >=20
> > --=20
> > 2.50.1
> >=20
>=20
--8323328-1098205246-1761576381=:970--
