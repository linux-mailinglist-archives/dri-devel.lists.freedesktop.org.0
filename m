Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746D95131E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 05:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CE910E405;
	Wed, 14 Aug 2024 03:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+nt2jwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241810E32E;
 Wed, 14 Aug 2024 03:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723606239; x=1755142239;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=IRG2HoilNLCV3MWbYyl9BQgmgBOkKVLTEiD0+Tvq3XQ=;
 b=K+nt2jwOGh+ER9r+00SlgmRzz5dHXreXczZl7QYfeo2qscxNNTTih47E
 XHnL2nBtZG7PEZWejaPt1Qv+YNDeF6QXJdF05/bo9VRRyC4BJUlki1H2C
 ZM5z0DE8+D7c0jzVeQ5o8+tffRGkTZF3uvekFvSRGm6TO61FCQ8h+RTPi
 t/85X8iHmv8rQVvBwNJuY9WkLOdp0eIwraDhZBS9yiJ2AZvNhdiUHwOBU
 4dkKx8PwQedJIFSamHfjd9joGJNmjAGGN6XHKj77ugBvMtH2pfU1OhnwJ
 9xXe4kfayxi/yk9kVKJAtEi+eXfHy//1UhzUHxm5DRki12XyQBUYpsrzO g==;
X-CSE-ConnectionGUID: /7k2PamZTTSaqCJh1bhQNg==
X-CSE-MsgGUID: 4Fhs9dgzSRq+qN7FrfYlwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21957709"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
 d="asc'?scan'208";a="21957709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 20:30:38 -0700
X-CSE-ConnectionGUID: FhVFhCKIS7yc54nUYs8z5g==
X-CSE-MsgGUID: Y78UXkCjS8+6kNzzRVElag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
 d="asc'?scan'208";a="58809244"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 20:30:36 -0700
Date: Wed, 14 Aug 2024 11:32:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhiwang@kernel.rog>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [RESEND 1/2] drm/i915/gvt: stop using drm_edid_block_valid()
Message-ID: <ZrwlPUVhp3v59rzS@debian-scheme>
References: <20240812142849.1588006-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="DqdRhSWku2VpMsMe"
Content-Disposition: inline
In-Reply-To: <20240812142849.1588006-1-jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DqdRhSWku2VpMsMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024.08.12 17:28:48 +0300, Jani Nikula wrote:
> We'll want to stop drm_edid_block_valid() usage. KVMGT is the last
> user. Replace with drm_edid_valid(), which unfortunately requires an
> allocated drm_edid. However, on the plus side, this would be required to
> handle the TODO comment about EDID extension block support.
>=20
> Acked-by: Zhi Wang <zhiwang@kernel.rog>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Looks fine to me. Feel free to merge.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 38830818c120..ca0fb126b02d 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -425,6 +425,18 @@ static const struct intel_vgpu_regops intel_vgpu_reg=
ops_opregion =3D {
>  	.release =3D intel_vgpu_reg_release_opregion,
>  };
> =20
> +static bool edid_valid(const void *edid, size_t size)
> +{
> +	const struct drm_edid *drm_edid;
> +	bool is_valid;
> +
> +	drm_edid =3D drm_edid_alloc(edid, size);
> +	is_valid =3D drm_edid_valid(drm_edid);
> +	drm_edid_free(drm_edid);
> +
> +	return is_valid;
> +}
> +
>  static int handle_edid_regs(struct intel_vgpu *vgpu,
>  			struct vfio_edid_region *region, char *buf,
>  			size_t count, u16 offset, bool is_write)
> @@ -443,11 +455,7 @@ static int handle_edid_regs(struct intel_vgpu *vgpu,
>  		switch (offset) {
>  		case offsetof(struct vfio_region_gfx_edid, link_state):
>  			if (data =3D=3D VFIO_DEVICE_GFX_LINK_STATE_UP) {
> -				if (!drm_edid_block_valid(
> -					(u8 *)region->edid_blob,
> -					0,
> -					true,
> -					NULL)) {
> +				if (!edid_valid(region->edid_blob, EDID_SIZE)) {
>  					gvt_vgpu_err("invalid EDID blob\n");
>  					return -EINVAL;
>  				}
> --=20
> 2.39.2
>=20

--DqdRhSWku2VpMsMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZrwlOQAKCRCxBBozTXgY
J07dAJ0ZTZ8Fd/2wGBj8i44MsFb1iOm/XwCeIuq/32BDPLTjDt02E543ifdRqvk=
=ZrFf
-----END PGP SIGNATURE-----

--DqdRhSWku2VpMsMe--
