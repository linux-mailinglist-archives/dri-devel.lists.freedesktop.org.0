Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0888651C5D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 09:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A6610E33E;
	Tue, 20 Dec 2022 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C485C10E09D;
 Tue, 20 Dec 2022 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671525131; x=1703061131;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=C/hTgZEZo75zb+BTntVx1WXDyCh8QkxVDLKYtiG9wWc=;
 b=XzCCj1cdQxYn9sfVK7WwvHnRWwimlxtdsSvGxItQ+7jH4g5UhAj0yYWk
 j7OFG2vSIalIlkwRJXp6IL1IW+EQN+gsJ4Lw/ZwC5EzSsEpzsax+h49qk
 i322D/urwq655wbJS5+KEDhY5McRlQ0YddIs27fzH/Lqcy7/2ot5HRIjR
 GF6In/1O86HWJ37BMKiI/KWySczgJuTJJ6AyajIrjFtLefnl2ZVcyoZZ2
 CjV+oqKg3oa1Vmc9LBr8fyQOpO7qYfbKQGIR8u/Jv1hXecY30nnmgpYWd
 e3MHX6KOmSHAqXWE6DN4CT+jCdT8xqUKYq6DUoOHCQTGx9+TjjXb/cCWg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299902619"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; 
 d="asc'?scan'208";a="299902619"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 00:31:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="650908730"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; 
 d="asc'?scan'208";a="650908730"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga002.jf.intel.com with ESMTP; 20 Dec 2022 00:31:48 -0800
Date: Tue, 20 Dec 2022 16:29:50 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Subject: Re: [PATCH] [next] i915/gvt: Replace one-element array with
 flexible-array member
Message-ID: <20221220082950.GF30028@zhen-hp.sh.intel.com>
References: <Y6Eu2604cqtryP4g@mail.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="WVf18ZLo9bznw8Mz"
Content-Disposition: inline
In-Reply-To: <Y6Eu2604cqtryP4g@mail.google.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--WVf18ZLo9bznw8Mz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.12.20 16:41:15 +1300, Paulo Miguel Almeida wrote:
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct gvt_firmware_header and refactor the
> rest of the code accordingly.
>=20
> Additionally, previous implementation was allocating 8 bytes more than
> required to represent firmware_header + cfg_space data + mmio data.
>=20
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3D3 [1].
>=20
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101836 [1]
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>
> ---
> To make reviewing this patch easier, I'm pasting before/after struct
> sizes.
>=20
> pahole -C gvt_firmware_header before/drivers/gpu/drm/i915/gvt/firmware.o=
=20
> struct gvt_firmware_header {
> 	u64                        magic;                /*     0     8 */
> 	u32                        crc32;                /*     8     4 */
> 	u32                        version;              /*    12     4 */
> 	u64                        cfg_space_size;       /*    16     8 */
> 	u64                        cfg_space_offset;     /*    24     8 */
> 	u64                        mmio_size;            /*    32     8 */
> 	u64                        mmio_offset;          /*    40     8 */
> 	unsigned char              data[1];              /*    48     1 */
>=20
> 	/* size: 56, cachelines: 1, members: 8 */
> 	/* padding: 7 */
> 	/* last cacheline: 56 bytes */
> };
>=20
> pahole -C gvt_firmware_header after/drivers/gpu/drm/i915/gvt/firmware.o=
=20
> struct gvt_firmware_header {
> 	u64                        magic;                /*     0     8 */
> 	u32                        crc32;                /*     8     4 */
> 	u32                        version;              /*    12     4 */
> 	u64                        cfg_space_size;       /*    16     8 */
> 	u64                        cfg_space_offset;     /*    24     8 */
> 	u64                        mmio_size;            /*    32     8 */
> 	u64                        mmio_offset;          /*    40     8 */
> 	unsigned char              data[];               /*    48     0 */
>=20
> 	/* size: 48, cachelines: 1, members: 8 */
> 	/* last cacheline: 48 bytes */
> };
>=20
> As you can see the additional byte of the fake-flexible array (data[1])
> forced the compiler to pad the struct but those bytes aren't actually used
> as first & last bytes (of both cfg_space and mmio) are controlled by the
> <>_size and <>_offset members present in the gvt_firmware_header struct.
> ---
>  drivers/gpu/drm/i915/gvt/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/g=
vt/firmware.c
> index a683c22d5b64..dce93738e98a 100644
> --- a/drivers/gpu/drm/i915/gvt/firmware.c
> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
> @@ -45,7 +45,7 @@ struct gvt_firmware_header {
>  	u64 cfg_space_offset;	/* offset in the file */
>  	u64 mmio_size;
>  	u64 mmio_offset;	/* offset in the file */
> -	unsigned char data[1];
> +	unsigned char data[];
>  };
> =20
>  #define dev_to_drm_minor(d) dev_get_drvdata((d))
> @@ -77,7 +77,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
>  	unsigned long size, crc32_start;
>  	int ret;
> =20
> -	size =3D sizeof(*h) + info->mmio_size + info->cfg_space_size;
> +	size =3D offsetof(struct gvt_firmware_header, data) + info->mmio_size +=
 info->cfg_space_size;
>  	firmware =3D vzalloc(size);
>  	if (!firmware)
>  		return -ENOMEM;
> --=20

Looks good to me.
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--WVf18ZLo9bznw8Mz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY6FyfgAKCRCxBBozTXgY
J4H/AJ0TiZ3MGB5514oDdiz4Nwdq5iOREwCfdiEwH2G89X6y35mKtGCBryNZ02g=
=O2Zy
-----END PGP SIGNATURE-----

--WVf18ZLo9bznw8Mz--
