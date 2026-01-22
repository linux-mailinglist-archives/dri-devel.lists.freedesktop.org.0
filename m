Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJtHEwT8cWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:29:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E565437
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4E010E05D;
	Thu, 22 Jan 2026 10:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fly5p88E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4C10E035;
 Thu, 22 Jan 2026 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769077759; x=1800613759;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=cblTEV09hHyDFC8jkM6gv28riPyAg/Gct4AQ2WAGjjE=;
 b=Fly5p88ErsxkLYC82LLa3EJNY/4M1FdUz12XS1vRHNcnYIG1P3jITkA8
 IGM5+jUnKTvMl+46EXWIe/wIOyofmeCpaTPkmbTzw/5ij0GL/CtbEar92
 X70Q8gFPGOnd3zudhOi16NNypU+1yNd4WVnQklbinBiNKU1SPMEuDBTUZ
 fK2yHZEOJsvvKUKLzy4CysvEjVdlVcZTKuhphsieIBIImgAdztcPJwHyU
 IFgsukphsbkEY+jtbU/97FL2CoKtZmeZazbMz439I+jvMkCeQpnKvx/md
 h1hxepQB3hgp+UWT25sWW3gqpErg66uoVMTogz/aZwZU3aDwa8cqXfwTF w==;
X-CSE-ConnectionGUID: hSs0a/5fTbm9A2orbzfZtA==
X-CSE-MsgGUID: AVPhpzS5TO28b9KPYhszRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81035162"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81035162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:29:19 -0800
X-CSE-ConnectionGUID: pnG7EpKfRp6VftNnrFmYgQ==
X-CSE-MsgGUID: V4m/dzw1SMuDhiEc9UxVtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206306411"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.15])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:29:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 22 Jan 2026 12:29:04 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 6/6] platform/x86/intel/vsec: Plumb ACPI PMT discovery
 tables through vsec
In-Reply-To: <20260122030903.3247167-7-david.e.box@linux.intel.com>
Message-ID: <a2ad65a0-7c90-45ae-bb13-e4a3e8a58dae@linux.intel.com>
References: <20260122030903.3247167-1-david.e.box@linux.intel.com>
 <20260122030903.3247167-7-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2132290946-1769077744=:1059"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 975E565437
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2132290946-1769077744=:1059
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Jan 2026, David E. Box wrote:

> Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
> generic discovery source flag and carry ACPI discovery entries alongside
> the existing PCI resource path so PMT clients can consume either.
>=20
> Changes:
>   - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
>   - Extend intel_vsec_platform_info and intel_vsec_device with source enu=
m
>     and ACPI discovery table pointer/
>   - When src=3D=3DACPI, skip BAR resource setup and copy the ACPI discove=
ry
>     entries into the aux device.
>=20
> No user-visible behavior change yet; this only wires ACPI data through vs=
ec
> in preparation for ACPI-enumerated PMT clients.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>=20
> v3:
>   - Re-send with all changes intended for v2 which was sent without them
>     being applied.
>=20
> v2:
>   - Improve comment to clarify BAR resource setup doesn't apply to ACPI
>     discovery
>   - Add missing #include for kmemdup()
>   - Use array_size() for overflow protection
>     (review comments by Ilpo J=C3=A4rvinen)
>=20
>=20
>  drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
>  include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index 4aeb0728b435..b1465e67feef 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -24,7 +24,9 @@
>  #include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/overflow.h>
>  #include <linux/pci.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
> =20
>  #define PMT_XA_START=09=09=090
> @@ -109,6 +111,7 @@ static void intel_vsec_dev_release(struct device *dev=
)
> =20
>  =09ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
> =20
> +=09kfree(intel_vsec_dev->acpi_disc);
>  =09kfree(intel_vsec_dev->resource);
>  =09kfree(intel_vsec_dev);
>  }
> @@ -320,6 +323,13 @@ static int intel_vsec_add_dev(struct device *dev, st=
ruct intel_vsec_header *head
>  =09 * auxiliary device driver.
>  =09 */
>  =09for (i =3D 0, tmp =3D res; i < header->num_entries; i++, tmp++) {
> +=09=09/*
> +=09=09 * Skip resource mapping check for ACPI-based discovery
> +=09=09 * since those tables are read from _DSD, not MMIO.
> +=09=09 */
> +=09=09if (info->src =3D=3D INTEL_VSEC_DISC_ACPI)
> +=09=09=09break;
> +
>  =09=09tmp->start =3D base_addr + header->offset + i * (header->entry_siz=
e * sizeof(u32));
>  =09=09tmp->end =3D tmp->start + (header->entry_size * sizeof(u32)) - 1;
>  =09=09tmp->flags =3D IORESOURCE_MEM;
> @@ -338,6 +348,20 @@ static int intel_vsec_add_dev(struct device *dev, st=
ruct intel_vsec_header *head
>  =09intel_vsec_dev->base_addr =3D info->base_addr;
>  =09intel_vsec_dev->priv_data =3D info->priv_data;
>  =09intel_vsec_dev->cap_id =3D cap_id;
> +=09intel_vsec_dev->src =3D info->src;
> +
> +=09if (info->src =3D=3D INTEL_VSEC_DISC_ACPI) {
> +=09=09size_t bytes;
> +
> +=09=09bytes =3D array_size(intel_vsec_dev->num_resources,
> +=09=09=09=09   sizeof(info->acpi_disc[0]));
> +=09=09if (!bytes)
> +=09=09=09return -EOVERFLOW;

Is this correct as array_size() is documented to return SIZE_MAX on=20
overflow?

Other than that, this series looked very straightforward now.

--=20
 i.

> +
> +=09=09intel_vsec_dev->acpi_disc =3D kmemdup(info->acpi_disc, bytes, GFP_=
KERNEL);
> +=09=09if (!intel_vsec_dev->acpi_disc)
> +=09=09=09return -ENOMEM;
> +=09}
> =20
>  =09if (header->id =3D=3D VSEC_ID_SDSI)
>  =09=09intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 4eecb2a6bac4..1fe5665a9d02 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -33,6 +33,11 @@ struct device;
>  struct pci_dev;
>  struct resource;
> =20
> +enum intel_vsec_disc_source {
> +=09INTEL_VSEC_DISC_PCI,=09/* PCI, default */
> +=09INTEL_VSEC_DISC_ACPI,=09/* ACPI */
> +};
> +
>  enum intel_vsec_id {
>  =09VSEC_ID_TELEMETRY=09=3D 2,
>  =09VSEC_ID_WATCHER=09=09=3D 3,
> @@ -103,6 +108,10 @@ struct vsec_feature_dependency {
>   * @parent:    parent device in the auxbus chain
>   * @headers:   list of headers to define the PMT client devices to creat=
e
>   * @deps:      array of feature dependencies
> + * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
> + *             in little-endian format as defined by the PMT ACPI spec.
> + *             Valid only when @provider =3D=3D INTEL_VSEC_DISC_ACPI.
> + * @src:       source of discovery table data
>   * @priv_data: private data, usable by parent devices, currently a callb=
ack
>   * @caps:      bitmask of PMT capabilities for the given headers
>   * @quirks:    bitmask of VSEC device quirks
> @@ -113,6 +122,8 @@ struct intel_vsec_platform_info {
>  =09struct device *parent;
>  =09struct intel_vsec_header **headers;
>  =09const struct vsec_feature_dependency *deps;
> +=09u32 (*acpi_disc)[4];
> +=09enum intel_vsec_disc_source src;
>  =09void *priv_data;
>  =09unsigned long caps;
>  =09unsigned long quirks;
> @@ -124,7 +135,12 @@ struct intel_vsec_platform_info {
>   * struct intel_vsec_device - Auxbus specific device information
>   * @auxdev:        auxbus device struct for auxbus access
>   * @dev:           struct device associated with the device
> - * @resource:      any resources shared by the parent
> + * @resource:      PCI discovery resources (BAR windows), one per discov=
ery
> + *                 instance. Valid only when @src =3D=3D INTEL_VSEC_DISC=
_PCI
> + * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
> + *                 in little-endian format as defined by the PMT ACPI sp=
ec.
> + *                 Valid only when @src =3D=3D INTEL_VSEC_DISC_ACPI.
> + * @src:           source of discovery table data
>   * @ida:           id reference
>   * @num_resources: number of resources
>   * @id:            xarray id
> @@ -138,6 +154,8 @@ struct intel_vsec_device {
>  =09struct auxiliary_device auxdev;
>  =09struct device *dev;
>  =09struct resource *resource;
> +=09u32 (*acpi_disc)[4];
> +=09enum intel_vsec_disc_source src;
>  =09struct ida *ida;
>  =09int num_resources;
>  =09int id; /* xa */
>=20
--8323328-2132290946-1769077744=:1059--
