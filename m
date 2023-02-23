Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917B6A0284
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 06:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6C410E4B3;
	Thu, 23 Feb 2023 05:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359210E4B3;
 Thu, 23 Feb 2023 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677131206; x=1708667206;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5LUNYswzjNRR62NCzZouZlNn0t25R/Y0NvLZYy4sFJw=;
 b=VDcPoTjapyPXdmEvrJ/Ul1EWBBDCvUNXD3/kgjHTMNQD1G9+t89RQ6Yq
 PljBkcXmgXt6i1sVEirsDbnQKT6Xzbl9LhjQV75WRDEnT0Jvm25GLrSj9
 SNUX8+eWQsYIFwJj4d0fa/J9HfFKkXiYUBZ5KiGfz2XwpNSGWBPLBdswf
 X2L5EKxxU9pG/3B+5ygUpdFpOSTWq80dC7K0MZzpKia/ahbG+qlZmhfdy
 cb8uStmxqMKkunc++hE2E+PkZOXi2+E4fVdjnb5c4w8NsOj1d8/tNxd8z
 sjl2G9wuiNlKajl1zdhQ3A29yQtWH6UcEgKTLZI06S15bPgrZKYN9l5Eg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360610230"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="360610230"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 21:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674390236"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="674390236"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 21:46:42 -0800
Date: Thu, 23 Feb 2023 13:44:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next] i915/gvt: Fix spelling mistake "vender" -> "vendor"
Message-ID: <Y/b9V321SlQt9wWS@debian-scheme>
References: <20230202125018.285523-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HzSWUdm6s+7n4EaD"
Content-Disposition: inline
In-Reply-To: <20230202125018.285523-1-colin.i.king@gmail.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HzSWUdm6s+7n4EaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.02.02 12:50:18 +0000, Colin Ian King wrote:
> There is a spelling mistake in a literal string. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/g=
vt/firmware.c
> index dce93738e98a..4dd52ac2043e 100644
> --- a/drivers/gpu/drm/i915/gvt/firmware.c
> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
> @@ -171,7 +171,7 @@ static int verify_firmware(struct intel_gvt *gvt,
>  	mem =3D (fw->data + h->cfg_space_offset);
> =20
>  	id =3D *(u16 *)(mem + PCI_VENDOR_ID);
> -	VERIFY("vender id", id, pdev->vendor);
> +	VERIFY("vendor id", id, pdev->vendor);
> =20
>  	id =3D *(u16 *)(mem + PCI_DEVICE_ID);
>  	VERIFY("device id", id, pdev->device);
> --=20

Thanks, Colin.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20

--HzSWUdm6s+7n4EaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY/b9VwAKCRCxBBozTXgY
J6YGAJ9xp830QGO5I7mHfJCVb6JRefE6tgCgi00lyStr8rW5AvDfi8sjBs32WoQ=
=sHmJ
-----END PGP SIGNATURE-----

--HzSWUdm6s+7n4EaD--
