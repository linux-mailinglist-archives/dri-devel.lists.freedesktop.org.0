Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2496D24AD0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E4810E753;
	Thu, 15 Jan 2026 13:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koHtMlVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9310E751;
 Thu, 15 Jan 2026 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768482576; x=1800018576;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ChjvPNWRNB27CunQERgDk6wK1wUUUWeOp4cAZrXTFTg=;
 b=koHtMlVXM7PDGiIY5fCe7XrSHrzNloaKRDfEjiuroJwmqLftYwCcgKPJ
 GVKl0nJicNd/mooDn1MvTEwRY9sYcpXgnfktIP7q8IioD9IPI4uPZM4rE
 6J/Mj+JgUL0hOpciy8EwlwCTEZkYzmvnry+xglOUvICc+JiXe07ovJh1u
 LU/RvR3VOG9M6rGzrhdkPB8OrugEVIiUC45FNeVgzo8wfBtXBuxJE8Xrb
 6Wfl/L4mrTlGxkFpTFqqHFZVrriTalCB5/LR03Oj8vzcwOBHvQgfjfs7j
 eytHDJKx9I8OwUPugGrZ9bEGHtM3QeYprWZtt98xU31pGiTjFu+aQI7hj Q==;
X-CSE-ConnectionGUID: 4tpxNgfrTMGooSPQprPB4A==
X-CSE-MsgGUID: VIEgSBjcTUuXtLXNA4FsKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80509170"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80509170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:09:35 -0800
X-CSE-ConnectionGUID: vPj369PpRIWLItJyb71KYQ==
X-CSE-MsgGUID: /Gz8lGnKQrSDxlRfBr5AXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205362114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:09:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:09:27 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 xi.pardee@linux.intel.comn, Hans de Goede <hansg@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/4] platform/x86/intel/vsec: Decouple add/link helpers
 from PCI
In-Reply-To: <20260107002153.63830-2-david.e.box@linux.intel.com>
Message-ID: <d718331d-1193-f0e2-3aca-2263455a6d90@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-2-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-716172177-1768482567=:968"
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

--8323328-716172177-1768482567=:968
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 6 Jan 2026, David E. Box wrote:

> This refactor is preparatory for ACPI-enumerated PMT endpoints. While
> intel_vsec is bound to PCI today, some helpers are used by code that will
> also register PMT endpoints from non-PCI (ACPI) paths. Clean up
> PCI-specific plumbing where it isn=E2=80=99t strictly required and rely o=
n
> generic struct device where possible.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> ---
>  drivers/platform/x86/intel/vsec.c      | 13 +++++++++----
>  drivers/platform/x86/intel/vsec_tpmi.c |  2 +-
>  include/linux/intel_vsec.h             |  2 +-
>  3 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index ecfc7703f201..130577061a51 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -158,18 +158,23 @@ static bool vsec_driver_present(int cap_id)
>   */
>  static const struct pci_device_id intel_vsec_pci_ids[];
> =20
> -static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *=
dev,
> +static int intel_vsec_link_devices(struct device *parent, struct device =
*dev,
>  =09=09=09=09   int consumer_id)
>  {
>  =09const struct vsec_feature_dependency *deps;
>  =09enum vsec_device_state *state;
>  =09struct device **suppliers;
>  =09struct vsec_priv *priv;
> +=09struct pci_dev *pdev;
>  =09int supplier_id;
> =20
>  =09if (!consumer_id)
>  =09=09return 0;
> =20
> +=09if (!dev_is_pci(parent))
> +=09=09return 0;
> +
> +=09pdev =3D to_pci_dev(parent);
>  =09if (!pci_match_id(intel_vsec_pci_ids, pdev))
>  =09=09return 0;
> =20
> @@ -204,7 +209,7 @@ static int intel_vsec_link_devices(struct pci_dev *pd=
ev, struct device *dev,
>  =09return 0;
>  }
> =20
> -int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> +int intel_vsec_add_aux(struct device *parent,
>  =09=09       struct intel_vsec_device *intel_vsec_dev,
>  =09=09       const char *name)
>  {
> @@ -252,7 +257,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct d=
evice *parent,
>  =09if (ret)
>  =09=09goto cleanup_aux;
> =20
> -=09ret =3D intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->c=
ap_id);
> +=09ret =3D intel_vsec_link_devices(parent, &auxdev->dev, intel_vsec_dev-=
>cap_id);
>  =09if (ret)
>  =09=09goto cleanup_aux;
> =20
> @@ -349,7 +354,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct intel_vsec_header *he
>  =09 * Pass the ownership of intel_vsec_dev and resource within it to
>  =09 * intel_vsec_add_aux()
>  =09 */
> -=09return intel_vsec_add_aux(pdev, parent, no_free_ptr(intel_vsec_dev),
> +=09return intel_vsec_add_aux(parent, no_free_ptr(intel_vsec_dev),
>  =09=09=09=09  intel_vsec_name(header->id));
>  }
> =20
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x8=
6/intel/vsec_tpmi.c
> index 7748b5557a18..2ccde86c529f 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -655,7 +655,7 @@ static int tpmi_create_device(struct intel_tpmi_info =
*tpmi_info,
>  =09 * feature_vsec_dev and res memory are also freed as part of
>  =09 * device deletion.
>  =09 */
> -=09return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
> +=09return intel_vsec_add_aux(&vsec_dev->auxdev.dev,
>  =09=09=09=09  feature_vsec_dev, feature_id_name);
>  }
> =20
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 53f6fe88e369..28c2f5855a11 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -183,7 +183,7 @@ struct pmt_feature_group {
>  =09struct telemetry_region=09regions[];
>  };
> =20
> -int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> +int intel_vsec_add_aux(struct device *parent,
>  =09=09       struct intel_vsec_device *intel_vsec_dev,
>  =09=09       const char *name);
> =20
>=20
--8323328-716172177-1768482567=:968--
