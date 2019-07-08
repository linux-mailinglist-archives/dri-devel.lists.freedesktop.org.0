Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0262CA5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 01:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21187892C8;
	Mon,  8 Jul 2019 23:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3642892C8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 23:29:24 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45jM9D4bZLz9sML;
 Tue,  9 Jul 2019 09:29:20 +1000 (AEST)
Date: Tue, 9 Jul 2019 09:29:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20190709092919.475162ab@canb.auug.org.au>
In-Reply-To: <20190619141949.38e661e6@canb.auug.org.au>
References: <20190619141949.38e661e6@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562628562;
 bh=VHvYMoJapjy9cWdQwHjc3A/mmaTuFfvV4PE1mtlmIJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qFhXDRL7XNzzjJTytG2LGqfsU8T58tXW/CUa6uxwFJoUVIE6H90QY89dxGl7CxJU7
 /sS4G2g3YyDx0QPy689sEhBu0fuM5pX/76ERNHr7bvc4tqRZptofati+w/7Execlim
 DMP6dJ3Vg4eeebmOcYT8hkoud+IqPAISt2mnbKFGT+hpTXmp/aAYAgOZBjcc532XlT
 ntcumcLThYOZ9cu+U8VXk1Mw9/eUe8QiS3e0eJfGWGKXIvOl3g/nIjMYChQj1uNrPA
 UYkAVY3fvQMLxBFjVpIsgRl8KTnDRu+a4JkBaOMcwyCxAcGZrP1P1Vsqi/0DW4rOEA
 /d0cGiVmqQT9w==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0728555592=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0728555592==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1TCOlj/Ral1M1aAYm4lXYnd"; protocol="application/pgp-signature"

--Sig_/1TCOlj/Ral1M1aAYm4lXYnd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Jun 2019 14:19:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/Makefile.header-test
>=20
> between commit:
>=20
>   e846f0dc57f4 ("kbuild: add support for ensuring headers are self-contai=
ned")
>=20
> from the kbuild tree and commits:
>=20
>   112ed2d31a46 ("drm/i915: Move GraphicsTechnology files under gt/")
>   d91e657876a9 ("drm/i915: Introduce struct intel_wakeref")
>   aab30b85c97a ("drm/i915: ensure more headers remain self-contained")
>   b375d0ef2589 ("drm/i915: extract intel_vdsc.h from intel_drv.h and i915=
_drv.h")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/i915/Makefile.header-test
> index 639b596a06a9,3a9663002d4a..000000000000
> --- a/drivers/gpu/drm/i915/Makefile.header-test
> +++ b/drivers/gpu/drm/i915/Makefile.header-test
> @@@ -2,18 -2,28 +2,28 @@@
>   # Copyright =C2=A9 2019 Intel Corporation
>  =20
>   # Test the headers are compilable as standalone units
>  -header_test :=3D \
>  +header-test-$(CONFIG_DRM_I915_WERROR) :=3D \
>   	i915_active_types.h \
> + 	i915_debugfs.h \
> + 	i915_drv.h \
>   	i915_gem_context_types.h \
> + 	i915_gem_pm.h \
> + 	i915_irq.h \
> + 	i915_params.h \
>   	i915_priolist_types.h \
> + 	i915_reg.h \
>   	i915_scheduler_types.h \
>   	i915_timeline_types.h \
> + 	i915_utils.h \
> + 	intel_acpi.h \
> + 	intel_atomic.h \
>   	intel_atomic_plane.h \
>   	intel_audio.h \
> + 	intel_bios.h \
>   	intel_cdclk.h \
>   	intel_color.h \
> + 	intel_combo_phy.h \
>   	intel_connector.h \
> - 	intel_context_types.h \
>   	intel_crt.h \
>   	intel_csr.h \
>   	intel_ddi.h \
> @@@ -31,7 -54,22 +54,12 @@@
>   	intel_pipe_crc.h \
>   	intel_pm.h \
>   	intel_psr.h \
> + 	intel_quirks.h \
> + 	intel_runtime_pm.h \
>   	intel_sdvo.h \
> + 	intel_sideband.h \
>   	intel_sprite.h \
>   	intel_tv.h \
> - 	intel_workarounds_types.h
> + 	intel_uncore.h \
> + 	intel_vdsc.h \
> + 	intel_wakeref.h
>  -
>  -quiet_cmd_header_test =3D HDRTEST $@
>  -      cmd_header_test =3D echo "\#include \"$(<F)\"" > $@
>  -
>  -header_test_%.c: %.h
>  -	$(call cmd,header_test)
>  -
>  -i915-$(CONFIG_DRM_I915_WERROR) +=3D $(foreach h,$(header_test),$(patsub=
st %.h,header_test_%.o,$(h)))
>  -
>  -clean-files +=3D $(foreach h,$(header_test),$(patsubst %.h,header_test_=
%.c,$(h)))

I am still getting this conflict (the commit ids may have changed).
Just a reminder in case you think Linus may need to know.

--=20
Cheers,
Stephen Rothwell

--Sig_/1TCOlj/Ral1M1aAYm4lXYnd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0j0c8ACgkQAVBC80lX
0GzYlwf+Ibky8sEyD897C+IAn15Sk66w33x8LXGQ9h4ETe9b9zcGRP4UKiq2r/AF
Vh0e76ZvOXzdkaLwGy/2NMC3qp9v3j1CgzPoFjL7D1rW1BHY3oz//w0PE/S4Helz
qoGZp22BaWoLKqsITRshsYIpWIl2L7lTTnm024n+zZPAs7FztfCZepgnlGMiwf09
LO7U11NdYNHMMbx/CJCvJXpUxmlNQBe1i7ZWI+aOCE5dF7GrEg77vuZW9idGxyJt
v+uWKQ3Es55DkDa8TMmZ9k3F312lJfHXLHE0OdR9g2nMY/GQJe0r4YzCBzYm+5+L
0t1gmMH9J78hb89D583JZS0JOyzeSg==
=d475
-----END PGP SIGNATURE-----

--Sig_/1TCOlj/Ral1M1aAYm4lXYnd--

--===============0728555592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0728555592==--
