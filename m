Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51041AAE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 05:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24117891C7;
	Wed, 12 Jun 2019 03:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985FF891C7;
 Wed, 12 Jun 2019 03:24:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 20:24:29 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 11 Jun 2019 20:24:26 -0700
Date: Wed, 12 Jun 2019 11:22:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: remove duplicate entry of trace
Message-ID: <20190612032236.GH9684@zhen-hp.sh.intel.com>
References: <20190526075633.GA9245@hari-Inspiron-1545>
MIME-Version: 1.0
In-Reply-To: <20190526075633.GA9245@hari-Inspiron-1545>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1441322091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1441322091==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSVXQxoTSdH0Ya++"
Content-Disposition: inline


--JSVXQxoTSdH0Ya++
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.26 13:26:33 +0530, Hariprasad Kelam wrote:
> Remove duplicate include of trace.h
>=20
> Issue identified by includecheck
>=20
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/trace_points.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/trace_points.c b/drivers/gpu/drm/i9=
15/gvt/trace_points.c
> index a3deed69..569f5e3 100644
> --- a/drivers/gpu/drm/i915/gvt/trace_points.c
> +++ b/drivers/gpu/drm/i915/gvt/trace_points.c
> @@ -32,5 +32,4 @@
> =20
>  #ifndef __CHECKER__
>  #define CREATE_TRACE_POINTS
> -#include "trace.h"
>  #endif
> --=20

This actually caused build issue like
ERROR: "__tracepoint_gma_index" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_render_mmio" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_gvt_command" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_spt_guest_change" [drivers/gpu/drm/i915/i915.ko] undef=
ined!
ERROR: "__tracepoint_gma_translate" [drivers/gpu/drm/i915/i915.ko] undefine=
d!
ERROR: "__tracepoint_spt_alloc" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_spt_change" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_oos_sync" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_write_ir" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_propagate_event" [drivers/gpu/drm/i915/i915.ko] undefi=
ned!
ERROR: "__tracepoint_inject_msi" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_spt_refcount" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_spt_free" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "__tracepoint_oos_change" [drivers/gpu/drm/i915/i915.ko] undefined!
scripts/Makefile.modpost:91: recipe for target '__modpost' failed

Looks we need fix like below.

Subject: [PATCH] drm/i915/gvt: remove duplicate include of trace.h

This removes duplicate include of trace.h. Found by Hariprasad Kelam
with includecheck.

Reported-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/trace_points.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/trace_points.c b/drivers/gpu/drm/i915=
/gvt/trace_points.c
index a3deed692b9c..fe552e877e09 100644
--- a/drivers/gpu/drm/i915/gvt/trace_points.c
+++ b/drivers/gpu/drm/i915/gvt/trace_points.c
@@ -28,8 +28,6 @@
  *
  */
=20
-#include "trace.h"
-
 #ifndef __CHECKER__
 #define CREATE_TRACE_POINTS
 #include "trace.h"
--=20
2.20.1

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--JSVXQxoTSdH0Ya++
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQBv/AAKCRCxBBozTXgY
J6qvAJ9q4SpHBMazUVGyrExwIyT3tac9zQCbB8m/t9a9wlOqkm0W0bss9NDOds0=
=lNiG
-----END PGP SIGNATURE-----

--JSVXQxoTSdH0Ya++--

--===============1441322091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1441322091==--
