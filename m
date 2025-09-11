Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76956B52C6A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4A710EA4C;
	Thu, 11 Sep 2025 09:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN731Js3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D445F10E06B;
 Thu, 11 Sep 2025 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757581209; x=1789117209;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=apxpL+JA5234BjF+vbBSUV5l8bBfl2JCXGsBGUN2Sww=;
 b=CN731Js3kiHGhOxf+CyNtov06/vfZ5YPLbKQGqE/m3J1C15vEJu33W3a
 CNLhez96zaQokVhxVvYWu33EPqdIjLTbCfhxL1zKFBeD86I5295TWbmuJ
 FEN8EHckskKlCcm5ecXwBE3MOaueS8NiCTn8We/vF7AwWeM35K1RphhOS
 PdVnJQDBQKxFq79X0g3Pa+6TwWjKnSBb0u2Na75OEhCB03KrpInp+GUfg
 wH2Ddx/YclPrQ6olhBNf33aDEoOal60qAuM1gqoq5I6VeEgw3TcSwa1l8
 cNdPH0TmW2pii/I9yTFmFIseb+7KLkgOgVWoqi7uCZfUJZuq5rQ4UfAEO g==;
X-CSE-ConnectionGUID: WHuoLr2HTb28gFwW3DjLBQ==
X-CSE-MsgGUID: 77PdLy+dQf2jtwxwE9ynEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59980860"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59980860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:00:08 -0700
X-CSE-ConnectionGUID: DK3xpkOuRkutGbdOlc8uZg==
X-CSE-MsgGUID: S0y7rLfnSaGwSUn6CKkovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173539949"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.187])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:00:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Sep 2025 11:59:58 +0300 (EEST)
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/11] PCI: Improve Resizable BAR functions kernel doc
In-Reply-To: <97f8d4a7-6897-4fe5-878c-c04a887cce62@amd.com>
Message-ID: <20c3a5f5-fa15-3889-3f56-20726aa3925b@linux.intel.com>
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
 <20250911075605.5277-5-ilpo.jarvinen@linux.intel.com>
 <97f8d4a7-6897-4fe5-878c-c04a887cce62@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-183604244-1757581198=:944"
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

--8323328-183604244-1757581198=:944
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Sep 2025, Christian K=C3=B6nig wrote:

> On 11.09.25 09:55, Ilpo J=C3=A4rvinen wrote:
> > Fix the copy-pasted errors in the Resizable BAR handling functions
> > kernel doc and generally improve wording choices.
> >=20
> > Fix the formatting errors of the Return: line.
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/pci/rebar.c | 29 ++++++++++++++++++-----------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
> > index 020ed7a1b3aa..64315dd8b6bb 100644
> > --- a/drivers/pci/rebar.c
> > +++ b/drivers/pci/rebar.c
> > @@ -58,8 +58,9 @@ void pci_rebar_init(struct pci_dev *pdev)
> >   * @bar: BAR to find
> >   *
> >   * Helper to find the position of the ctrl register for a BAR.
> > - * Returns -ENOTSUPP if resizable BARs are not supported at all.
> > - * Returns -ENOENT if no ctrl register for the BAR could be found.
> > + *
> > + * Return: %-ENOTSUPP if resizable BARs are not supported at all,
> > + *=09   %-ENOENT if no ctrl register for the BAR could be found.
> >   */
> >  static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
> >  {
> > @@ -92,12 +93,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev,=
 int bar)
> >  }
> > =20
> >  /**
> > - * pci_rebar_get_possible_sizes - get possible sizes for BAR
> > + * pci_rebar_get_possible_sizes - get possible sizes for Resizable BAR
> >   * @pdev: PCI device
> >   * @bar: BAR to query
> >   *
> >   * Get the possible sizes of a resizable BAR as bitmask defined in the=
 spec
> > - * (bit 0=3D1MB, bit 31=3D128TB). Returns 0 if BAR isn't resizable.
> > + * (bit 0=3D1MB, bit 31=3D128TB).
> > + *
> > + * Return: A bitmask of possible sizes (0=3D1MB, 31=3D128TB), or %0 if=
 BAR isn't
> > + *=09   resizable.
> >   */
> >  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
> >  {
> > @@ -121,12 +125,14 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *=
pdev, int bar)
> >  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
> > =20
> >  /**
> > - * pci_rebar_get_current_size - get the current size of a BAR
> > + * pci_rebar_get_current_size - get the current size of a Resizable BA=
R
> >   * @pdev: PCI device
> > - * @bar: BAR to set size to
> > + * @bar: BAR to get the size from
> >   *
> > - * Read the size of a BAR from the resizable BAR config.
> > - * Returns size if found or negative error code.
> > + * Reads the current size of a BAR from the Resizable BAR config.
> > + *
> > + * Return: BAR Size if @bar is resizable (bit 0=3D1MB, bit 31=3D128TB)=
, or
>=20
> This is a bit misleading since there is no mask returned but rather the=
=20
> order or in other words which bit of the mask was used.=20

Thanks for noticing this. I'll removed "bit" x2 from it, does that fully=20
address your concern?

--=20
 i.

> > + *=09   negative on error.
> >   */
> >  int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
> >  {
> > @@ -142,13 +148,14 @@ int pci_rebar_get_current_size(struct pci_dev *pd=
ev, int bar)
> >  }
> > =20
> >  /**
> > - * pci_rebar_set_size - set a new size for a BAR
> > + * pci_rebar_set_size - set a new size for a Resizable BAR
> >   * @pdev: PCI device
> >   * @bar: BAR to set size to
> > - * @size: new size as defined in the spec (0=3D1MB, 31=3D128TB)
> > + * @size: new size as defined in the PCIe spec (0=3D1MB, 31=3D128TB)
> >   *
> >   * Set the new size of a BAR as defined in the spec.
> > - * Returns zero if resizing was successful, error code otherwise.
> > + *
> > + * Return: %0 if resizing was successful, or negative on error.
> >   */
> >  int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size)
> >  {
>=20
--8323328-183604244-1757581198=:944--
