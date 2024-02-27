Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27EF868F82
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EEA10E5AD;
	Tue, 27 Feb 2024 11:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GibmauCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A8D10E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709034948;
 bh=RfddnnU8S+jV++kMOxgI3dSukhFkW631ZIFHHadg1VA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GibmauCkTF0b1YsFR4GI6l3k2A3/qVIQNfjNNTsfBcVN1FH1zofdiiC0fUrCMlGuR
 04PyiPtkc6jbCWN8RN/wmp0kxKFk8+M0ClgZ1e54qMZ+GLl5FfU69B0FweAcfI1R7f
 LiZ4u34RG6sls+w1ULDn/7QfXMnNnmGZMqEt2LlOg+kcUEpoI8FeaBoomgx4C4HnzD
 Xbx0qXDCqzPdMuiqRvFiKCDvto8w+zhwsmEvCyYnzrFSlt3hZEv2H4ogB4vY8/BSSx
 HeulD0NXJ0X9YnTbCgEegARZxAyWZdUCLiCLqpvYanJHRaYa/Qb49AOOoytpCIaFD7
 mVm5c/DnDuYsQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 59C6B37820CC;
 Tue, 27 Feb 2024 11:55:47 +0000 (UTC)
Date: Tue, 27 Feb 2024 13:55:45 +0200
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
Message-ID: <20240227135545.62dd5f57.pekka.paalanen@collabora.com>
In-Reply-To: <8ac7bf91-fbce-4403-a801-9dfee39ea802@riseup.net>
References: <20240226-bench-vkms-v1-1-515ef91b11c8@riseup.net>
 <20240227111941.061a2892.pekka.paalanen@collabora.com>
 <8ac7bf91-fbce-4403-a801-9dfee39ea802@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A2mWu+vSdQNKM_BZwjnjD0Q";
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

--Sig_/A2mWu+vSdQNKM_BZwjnjD0Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 08:44:52 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 27/02/24 06:19, Pekka Paalanen wrote:
> > On Mon, 26 Feb 2024 17:42:11 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> Now that we have a defined benchmark for testing the driver, add
> >> documentation on how to run it.
> >>
> >> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >> ---
> >>  Documentation/gpu/vkms.rst | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> >> index ba04ac7c2167..6d07f79f77ff 100644
> >> --- a/Documentation/gpu/vkms.rst
> >> +++ b/Documentation/gpu/vkms.rst
> >> @@ -89,6 +89,12 @@ You can also run subtests if you do not want to run=
 the entire test::
> >>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device=
 "sys:/sys/devices/platform/vkms"
> >>    sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/tests/km=
s_flip --run-subtest basic-plain-flip
> >> =20
> >> +If you are developing features that may affect performance, you can r=
un the kms_fb_stress =20
> >=20
> > s/can/must/
> >  =20
> >> +benchmark:: =20
> >=20
> > before and after, and report the numbers. =20
>=20
> Did you mean to write the benchmarks logs here?

I mean people should be required tell their before and after numbers in
either commit message (my preference) or in series cover letter (if
benchmarking commits is not useful).

With the addition of YUV support in VKMS, maybe the benchmark needs to
start printing YUV numbers separately as a new case.


Thanks,
pq

>=20
> >  =20
> >> +
> >> +  sudo ./build/benchmarks/kms_fb_stress --device "sys:/sys/devices/pl=
atform/vkms"
> >> +  sudo IGT_DEVICE=3D"sys:/sys/devices/platform/vkms" ./build/benchmar=
ks/kms_fb_stress =20
> >=20
> > Do people need to run both commands? =20
>=20
> No, they don't, just two options.
>=20
> Best Regards,
> ~Arthur Grillo
>=20
> >=20
> > Anyway, a good idea.
> >=20
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >> +
> >>  TODO
> >>  =3D=3D=3D=3D
> >> =20
> >>
> >> ---
> >> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
> >> change-id: 20240226-bench-vkms-5b8b7aab255e
> >>
> >> Best regards, =20
> >  =20


--Sig_/A2mWu+vSdQNKM_BZwjnjD0Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXdzcEACgkQI1/ltBGq
qqc8SA//bU98zQBK+jIEVhc/aP0I7notpot6B1M0AFjUka9CgrjdKa5KKWjZspUy
uCkPYdDHLqIEq3rhABUlxhIscQZDeNPWbkau6abaf/jhlrRytwwJ9tP2CKhjX6HE
WADwmKjRQwBYyxVmAXA++4abB818zfniZN1VbpgHlHiiZTsM0Y/Ck9PCl2sKhzpp
ANI3HvYyRiYnvYJuIRrGsE6t8JCFglUx8C4yaNlma+N7N7nzel+lMw2RjE7cprNc
1kBXj/fo3RvrhPv6e84YxfzXNSOnKo9PBEgWw2srapFIXf9Y3GnyU2kuX/lsoilv
gekCWYdaDTwraTJOsmLAHTtKFF554Ab1KGx+S5rx6QBPDg5/8F9KDYd43KEGzfkg
mGl0Up0UIqhdb5ioiXrFAkcwQ7+ChpqNj1Tr0dsiyiqWu7T6VQFWK2PBrATJ6ONI
hv/v0GSFzyBOVjSt5J0PbKZkqYYxwbCRjdpAjlxCyCkc3GaJEnRwRjNnVx6foz/m
xs4kLSo1XwRuGz0u6Vjt6xxecMEBulmoHKK+wQsHRThr96BSdPL5OAI86lZOvFrF
sRIycPX+SFR17AiQfyxYByUPrqzr6kHpAosBeEZ6N9gIUGNGSoOBijzRR+HoayoJ
gu6f4ssszr4qskgMqvNSDQnxhtBpJj2JN4IdXTZ2R4FwesuXmFw=
=dsHb
-----END PGP SIGNATURE-----

--Sig_/A2mWu+vSdQNKM_BZwjnjD0Q--
