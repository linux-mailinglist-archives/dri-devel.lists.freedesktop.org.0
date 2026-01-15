Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F397BD24AD9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EA710E751;
	Thu, 15 Jan 2026 13:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzIp+Cq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E810E02F;
 Thu, 15 Jan 2026 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768482596; x=1800018596;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=BIoZF2I3vLrEjrCUlhiCCI21F/oNWrL567DQHu3op14=;
 b=mzIp+Cq3htLHnyHmSBq3UVWt+24ChkVHMD7ROKQqdfNI2ZPvcRpGzB4M
 QCc+x8HeN4PECNN7zLvpG9BsfekE+GyOD7SxJeRAIzB0Pufit+YF0J7+Q
 y4cKVmyR2TpaD8yFzWl56YNtZCkbrkHeZgkvOv/HONZexo7vap6GnF6bA
 JUGc8t0jBXX9pQK78cq+R9Uc0CoGwc3rI03foN2tIXVEhFPP0/9V7DTF1
 4D/ILk3zPeZ8baxc+9LKX0ee49QWfYnlTRoI/kOJ9fm9ffCvconharHKW
 IEnMSWXbIpLqMBpI0LxRt0zFqbch24TeldkI7noeX00WDbaEJnGssD41N A==;
X-CSE-ConnectionGUID: IiHRwZfjRf27IzwbwjXX4Q==
X-CSE-MsgGUID: y/RBJdbIQ4StNXBBz70eKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80509191"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80509191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:09:56 -0800
X-CSE-ConnectionGUID: qjjYCUKcS1yd4FBxmX3xWg==
X-CSE-MsgGUID: iu+lCmgkS/+hABqthpSVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205362164"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:09:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:09:49 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 xi.pardee@linux.intel.comn, Hans de Goede <hansg@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86/intel/vsec: Return real error codes
 from registration path
In-Reply-To: <20260107002153.63830-4-david.e.box@linux.intel.com>
Message-ID: <417b4ba4-c0a5-1250-8099-e18142fe61ff@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-4-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-633248259-1768482589=:968"
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

--8323328-633248259-1768482589=:968
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 6 Jan 2026, David E. Box wrote:

> Stop collapsing registration results into booleans. Make
> intel_vsec_walk_header() return int and propagate the first non-zero erro=
r
> from intel_vsec_register_device(). intel_vsec_register() now returns that
> error directly and 0 on success.
>=20
> This preserves success behavior while surfacing meaningful errors instead
> of hiding them behind a bool/-ENODEV, which makes debugging and probe
> ordering issues clearer.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index b84bb92624ef..42471fd609b1 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device=
 *dev,
>  =09return -EAGAIN;
>  }
> =20
> -static bool intel_vsec_walk_header(struct device *dev,
> -=09=09=09=09   struct intel_vsec_platform_info *info)
> +static int intel_vsec_walk_header(struct device *dev,
> +=09=09=09=09  struct intel_vsec_platform_info *info)
>  {
>  =09struct intel_vsec_header **header =3D info->headers;
> -=09bool have_devices =3D false;
>  =09int ret;
> =20
>  =09for ( ; *header; header++) {
>  =09=09ret =3D intel_vsec_register_device(dev, *header, info);
> -=09=09if (!ret)
> -=09=09=09have_devices =3D true;
> +=09=09if (ret)
> +=09=09=09return ret;
>  =09}
> =20
> -=09return have_devices;
> +=09return 0;
>  }
> =20
>  static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
> @@ -582,10 +581,7 @@ int intel_vsec_register(struct device *dev,
>  =09if (!dev || !info || !info->headers)
>  =09=09return -EINVAL;
> =20
> -=09if (!intel_vsec_walk_header(dev, info))
> -=09=09return -ENODEV;
> -=09else
> -=09=09return 0;
> +=09return intel_vsec_walk_header(dev, info);
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-633248259-1768482589=:968--
