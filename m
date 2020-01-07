Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C3131D7D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 03:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC9B6E5CD;
	Tue,  7 Jan 2020 02:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD7B6E5CC;
 Tue,  7 Jan 2020 02:09:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 18:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
 d="asc'?scan'208";a="420896975"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jan 2020 18:09:11 -0800
Date: Tue, 7 Jan 2020 10:06:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [PATCH 1/3] drm/i915/gvt: fix file paths in documentation
Message-ID: <20200107020637.GA5894@zhen-hp.sh.intel.com>
References: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
Content-Type: multipart/mixed; boundary="===============1579409148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1579409148==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.06 16:06:20 +0200, Julian Stecklina wrote:
> The documentation had some stale paths to i915 graphics virtualization
> code. Fix them to point to existing files.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: zhiyuan.lv@intel.com
> Cc: hang.yuan@intel.com
>=20
> Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> ---
>  Documentation/gpu/i915.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index e539c42a3e78..d644683c5249 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -43,19 +43,19 @@ Interrupt Handling
>  Intel GVT-g Guest Support(vGPU)
>  -------------------------------
> =20
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
>     :doc: Intel GVT-g guest support
> =20
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_vgpu.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
>     :internal:
> =20
>  Intel GVT-g Host Support(vGPU device model)
>  -------------------------------------------
> =20
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
>     :doc: Intel GVT-g host support
> =20
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.c
>     :internal:
>

The i915_vgpu.c and intel_gvt.c are still there for guest
and host part of i915 interface with gvt. We still need them
in doc. The files in gvt/ directory are gvt device model internals.=20


>  Workarounds
> --=20
> 2.24.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXhPnrQAKCRCxBBozTXgY
JyMvAJ9TsnqY3mHUvUBZ/z7Xk72MkvNYRwCeJH2j6DznfHpxHvpobBYCwKxej0k=
=eCW/
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============1579409148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1579409148==--
