Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C7C05A06
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8AA10EA32;
	Fri, 24 Oct 2025 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYqJNxrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DF810EA4A;
 Fri, 24 Oct 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761302367; x=1792838367;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=SRKpqs7p8PGtv14YGwum4fAb1Zzbp8J6idns3ccYONg=;
 b=UYqJNxrP93jaoiQH0CtHA/MTI51sLDbGCGJII2E0vkcxnGI06K5+6Del
 kTcGEY7w22KnudQjKFpHq/zQxHeJi4b920sUwrHVr9vh5GQBn52GGuzGx
 QY+PbEQrep/v+20RmfVcnp1d+7/iszV+bjq+nPWeJnwvLNL3FQxstwF00
 mwOTy/zYndeitlI4B6NptITEaLA3TdOwDheMteCdzelG39o1yEOSvnU6w
 xQilY1JBOS0OKGRckMi6slyPr+DLkd+34Xu7hO8/1xZGKtHz7ameu0AXr
 a0iDX16/k0ewW/mDA9h0atw09j6TFksRQYwyOJBqnfADI9RzgbUbcljyq w==;
X-CSE-ConnectionGUID: 454chpIhRwWX7C2B9TfWuQ==
X-CSE-MsgGUID: cVK/JzfhTD+hz+aCitoatg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63384795"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63384795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 03:39:26 -0700
X-CSE-ConnectionGUID: hmXiIFeFQhStZZIY+yihLg==
X-CSE-MsgGUID: 9rKxUU0iQBu3gyCS+BTRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="184882780"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 03:39:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Oct 2025 13:39:15 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-pci@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 "Michael J . Ruhl" <mjruhl@habana.ai>, 
 Andi Shyti <andi.shyti@linux.intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] PCI: Resizable BAR improvements
In-Reply-To: <20251023221323.GA1325049@bhelgaas>
Message-ID: <468ebc86-25aa-a22f-a45c-6ec15faa5b09@linux.intel.com>
References: <20251023221323.GA1325049@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1816897247-1761300158=:1178"
Content-ID: <50255ee2-82ed-c181-c05c-72f2a8f7243a@linux.intel.com>
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

--8323328-1816897247-1761300158=:1178
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0a125242-ab0c-aae7-2380-e599003f1850@linux.intel.com>

On Thu, 23 Oct 2025, Bjorn Helgaas wrote:

> On Thu, Oct 23, 2025 at 05:02:42PM -0500, Lucas De Marchi wrote:
> > On Thu, Oct 23, 2025 at 04:29:43PM -0500, Bjorn Helgaas wrote:
> > > On Wed, Oct 22, 2025 at 04:33:20PM +0300, Ilpo J=E4rvinen wrote:
> > > > pci.c has been used as catch everything that doesn't fits elsewhere
> > > > within PCI core and thus resizable BAR code has been placed there a=
s
> > > > well. Move Resizable BAR related code to a newly introduced rebar.c=
 to
> > > > reduce size of pci.c. After move, there are no pci_rebar_*() calls =
from
> > > > pci.c indicating this is indeed well-defined subset of PCI core.
> > > >=20
> > > > Endpoint drivers perform Resizable BAR related operations which cou=
ld
> > > > well be performed by PCI core to simplify driver-side code. This
> > > > series adds a few new API functions to that effect and converts the
> > > > drivers to use the new APIs (in separate patches).
> > > >=20
> > > > While at it, also convert BAR sizes bitmask to u64 as PCIe spec alr=
eady
> > > > specifies more sizes than what will fit u32 to make the API typing =
more
> > > > future-proof. The extra sizes beyond 128TB are not added at this po=
int.
> > > >=20
> > > > Some parts of this are to be used by the resizable BAR changes into=
 the
> > > > resource fitting/assingment logic but these seem to stand on their =
own
> > > > so sending these out now to reduce the size of the other patch seri=
es.
> > > >=20
> > > > v3:
> > > > - Rebased to solve minor conflicts
> > > >=20
> > > > v2: https://lore.kernel.org/linux-pci/20250915091358.9203-1-ilpo.ja=
rvinen@linux.intel.com/
> > > > - Kerneldoc:
> > > >   - Improve formatting of errno returns
> > > >   - Open "ctrl" -> "control"
> > > >   - Removed mislead "bit" words (when referring to BAR size)
> > > >   - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim =
the
> > > >     returned bitmask is defined in PCIe spec as the capability bits=
 now
> > > >     span across two registers in the spec and are not continuous (w=
e
> > > >     don't support the second block of bits yet, but this API is exp=
ected
> > > >     to return the bits without the hole so it will not be matching =
with
> > > >     the spec layout).
> > > > - Dropped superfluous zero check from pci_rebar_size_supported()
> > > > - Small improvement to changelog of patch 7
> > > >=20
> > > > Ilpo J=E4rvinen (11):
> > > >   PCI: Move Resizable BAR code into rebar.c
> > > >   PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
> > > >   PCI: Move pci_rebar_size_to_bytes() and export it
> > > >   PCI: Improve Resizable BAR functions kernel doc
> > > >   PCI: Add pci_rebar_size_supported() helper
> > > >   drm/i915/gt: Use pci_rebar_size_supported()
> > > >   drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
> > > >   PCI: Add pci_rebar_get_max_size()
> > > >   drm/xe/vram: Use pci_rebar_get_max_size()
> > > >   drm/amdgpu: Use pci_rebar_get_max_size()
> > > >   PCI: Convert BAR sizes bitmasks to u64
> > > >=20
> > > >  Documentation/driver-api/pci/pci.rst        |   3 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
> > > >  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
> > > >  drivers/gpu/drm/xe/xe_vram.c                |  32 +-
> > > >  drivers/pci/Makefile                        |   2 +-
> > > >  drivers/pci/iov.c                           |   9 +-
> > > >  drivers/pci/pci-sysfs.c                     |   2 +-
> > > >  drivers/pci/pci.c                           | 145 ---------
> > > >  drivers/pci/pci.h                           |   5 +-
> > > >  drivers/pci/rebar.c                         | 314 ++++++++++++++++=
++++
> > > >  drivers/pci/setup-res.c                     |  78 -----
> > > >  include/linux/pci.h                         |  15 +-
> > > >  12 files changed, 350 insertions(+), 273 deletions(-)
> > > >  create mode 100644 drivers/pci/rebar.c
> > >=20
> > > Applied to pci/rebar for v6.18, thanks, Ilpo!
> >=20
> > is this for v6.18 or it's a typo and it's going to v6.19?
>=20
> Oops, sorry, I meant v6.19!  I still have v6.18 regressions top of
> mind :)
>=20
> > > If we have follow-on resource assignment changes that depend on these=
,
> > > maybe I'll rename the branch to be more generic before applying them.

Okay.

The bigger challenge, though, will be that it now seems I need to bite the=
=20
bullet and rework the BAR resizing functions to fix v6.18-rc & v6.15=20
regressions which will touch pci_resize_resource() or more to be more=20
precise, add pci_release_and_resize_resource() interface. I've been=20
postponing this as it seems quite intrusive and the upcoming resource=20
fitting improvements should make driver initiated BAR resize pretty=20
unnecessary anyway. It seems the shortcut didn't work. :-(

It will certainly conflict with the rebar.c move in this series. (I=20
hopefully have the rework ready next week).

And sure, I've resource assignment changes piling up as well here, just=20
have been busy with handling all the regression so I've not gotten to=20
submit some of those. Most of them shouldn't conflict with rebar.c code=20
anyway (probably only adding a few new helpers for the max rebar changes=20
will but with the current state of affairs with all these regressions on=20
my plate, the max rebar changes themselves seems already tracking=20
next-next instead of 6.19).

> > > Also applied the drivers/gpu changes based on the acks.  I see the CI
> > > merge failures since this series is based on v6.18-rc1; I assume the
> > > CI applies to current linux-next or similar.  I'll check the conflict=
s
> >=20
> > it tries on drm-tip that contains drm-xe-next going to v6.19. We have
> > some changes there that conflict, but shouldn't be hard.
>
> > We also need https://lore.kernel.org/linux-pci/20250918-xe-pci-rebar-2-=
v1-1-6c094702a074@intel.com/
> > to actually fix the rebar in some cases. Could you take a look?
>=20
> Will do.  Remind me again if I forget!
>=20
> Bjorn
>=20

--=20
 i.
--8323328-1816897247-1761300158=:1178--
