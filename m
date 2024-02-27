Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F86868C0C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1198B10E4A5;
	Tue, 27 Feb 2024 09:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LrYgYKBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0A10E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709025583;
 bh=C/oFzRJOAX2fab2jouBghp4z46x7LVa76qoFEBIuBbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LrYgYKBI6DOH/pc/J7Ecmx7ttT5KIkffirla/dzc3bn81fLzhQgOIG0tqaHxOQO6G
 AHPdsi75rlq8QALWaEZFFOLMnlrwoXdsyiKk1xsOWeCWk0onAN0CikzdPDo16tMImq
 YWJoWwdmHwyZJ2+OdFQqiXuT0KSOEPJFHGHxbPSZta5y8ETLSOXTSr2mLb5OQZNC3s
 s+odA/MNkmLG6eIeSllVJiRBIhw9QL149crogYPIumL5bSoOWKlU6Pj6wpLYakO+TV
 pp6ucS/gstI4ep3IVMV1VXKk+6DvsLdZwz2Eq67loRYD2p2//hDR5NVtGUB+d7f1pL
 x82SfNoMjKwAg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 132A13781FA4;
 Tue, 27 Feb 2024 09:19:43 +0000 (UTC)
Date: Tue, 27 Feb 2024 11:19:41 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Add information on how to benchmark
Message-ID: <20240227111941.061a2892.pekka.paalanen@collabora.com>
In-Reply-To: <20240226-bench-vkms-v1-1-515ef91b11c8@riseup.net>
References: <20240226-bench-vkms-v1-1-515ef91b11c8@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Al3K0O_fW7VTKwg+hyaw9T9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Al3K0O_fW7VTKwg+hyaw9T9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 17:42:11 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Now that we have a defined benchmark for testing the driver, add
> documentation on how to run it.
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  Documentation/gpu/vkms.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..6d07f79f77ff 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -89,6 +89,12 @@ You can also run subtests if you do not want to run th=
e entire test::
>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "s=
ys:/sys/devices/platform/vkms"
>    sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/tests/kms_f=
lip --run-subtest basic-plain-flip
> =20
> +If you are developing features that may affect performance, you can run =
the kms_fb_stress

s/can/must/

> +benchmark::

before and after, and report the numbers.

> +
> +  sudo ./build/benchmarks/kms_fb_stress --device "sys:/sys/devices/platf=
orm/vkms"
> +  sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/benchmarks/=
kms_fb_stress

Do people need to run both commands?

Anyway, a good idea.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> +
>  TODO
>  =3D=3D=3D=3D
> =20
>=20
> ---
> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
> change-id: 20240226-bench-vkms-5b8b7aab255e
>=20
> Best regards,


--Sig_/Al3K0O_fW7VTKwg+hyaw9T9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXdqS0ACgkQI1/ltBGq
qqfGJRAApGG99tBnUJJr8a9IT2dsMQqZ46B5JVGCsYV1IR8pQOa7XIuuXgla19vF
HcIiUw0SZDclUtRiK5K1p1S6VPR65Yr0wrfBGlmjJDOOoWuGwEcfPbs8e7KThpxr
pA55UAzznjP2jXpY70ef5FE4wAbM7Q48zdEjoOd7OREkKMPjuMW0IfuQdGZp7YjZ
RzPZPhnqVChBkRwYD5mWs8Au/gMZkaIMedg8hyAhimO6h1GDNA2GMqEFr1DSYv8A
TBG/mkIWlCGmb+j6+V7EQzoDZODASTjtf+KRqDlQnfpZB63UnOvt83mqABUM1wYt
ltVilQfRO3gUJYbqZchCKj5kce91amQydbnlwgtdeue5JZUYx9XUk6Pz9lOysysV
UpCbYTKytIrS+owxhxbsCcsq0P2xeV9g+jT07ZjLU9K78XnKMeL4Tzf+8ssEfWKS
zVmBDhaKA0l2RRBB+Md9sQqwmyCufAAz05mmXOduYSvJhZPolp2vqVpVEkrIfQ76
Xmuw1AeC4Iz/3zAdlSL0sQ8xauwT+A/MPGaeNEfxBYjMKZj6Q8adQlQ0yFhTCcF/
+co2b/dSFYu5Pvb0G6nwH9kXGYutsM/BEeY5cXWeqez2U0tegbRSjWX8kxRdQU1i
cRAfOOIvgzpqMyWHbPrWPf5KVDV0erWwhuVcIfQuEEfWIsKGPao=
=FQV+
-----END PGP SIGNATURE-----

--Sig_/Al3K0O_fW7VTKwg+hyaw9T9--
