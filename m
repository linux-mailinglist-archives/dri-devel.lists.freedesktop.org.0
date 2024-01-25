Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E583B61B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 01:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5854F10E92A;
	Thu, 25 Jan 2024 00:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95210E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 00:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1706142828;
 bh=E648+W+X9N7+DnPy6fA/Cr+MHbMYJCW4iZrz/S0GTeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C+9SZWnSl4uElwrb/T1oXus3N8LdUB2m+FH3TKf/NHQ4+Z4m31eJT6bF3kV+KR4tQ
 Wfj31nKqWhlm6apDJec2B9ta/4HoewFksAdNENAmmNRmkP3r04IEjgdx7jk07CQxGs
 L7IkN+UB4qW77+wGRTc8U5g1MWlAVcezwO4b9OSrSDP0NCTCg2o4RQ0S6EwmHfWOFI
 MeZhVexY3hv/8w8Ib5JKYxMrjzhAZ3CVGOLo2Lb3jXk9ZRaK9q8dcuPEV4pIW2hNCH
 +RneezX+MTFHFHjfLTYkWXylRJ/uMuL6+4/xvri8fpnts+F8qF2aakFmpPN4K/ufsr
 Ej5JR0tjVo/Pg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TL1yy5xv1z4wbh;
 Thu, 25 Jan 2024 11:33:46 +1100 (AEDT)
Date: Thu, 25 Jan 2024 11:33:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20240125113345.291118ff@canb.auug.org.au>
In-Reply-To: <20240105174745.78b94cb5@canb.auug.org.au>
References: <20240105174745.78b94cb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CfWWVmfh9DcKFJxP2bE3FfP";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Badal Nilawar <badal.nilawar@intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/CfWWVmfh9DcKFJxP2bE3FfP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 5 Jan 2024 17:47:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  =
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  Documentation/ABI=
/testing/sysfs-driver-intel-i915-hwmon:52
> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times=
:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  Documentation/=
ABI/testing/sysfs-driver-intel-i915-hwmon:65
> Warning: /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:  D=
ocumentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46  Documentation/ABI/=
testing/sysfs-driver-intel-i915-hwmon:0
> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times: =
 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22  Documentation/AB=
I/testing/sysfs-driver-intel-i915-hwmon:39
> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  =
Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0  Documentation/ABI/=
testing/sysfs-driver-intel-i915-hwmon:8
> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2=
 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62  Document=
ation/ABI/testing/sysfs-driver-intel-i915-hwmon:30
> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 ti=
mes:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14  Documentati=
on/ABI/testing/sysfs-driver-intel-i915-hwmon:22
>=20
> Introduced by commits
>=20
>   fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
>   92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
>   fbcdc9d3bf58 ("drm/xe/hwmon: Expose input voltage attribute")
>   71d0a32524f9 ("drm/xe/hwmon: Expose hwmon energy attribute")
>   4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/CfWWVmfh9DcKFJxP2bE3FfP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWxrGkACgkQAVBC80lX
0GwQKQgAnYX/KC3T2ez2yjBvF6mdwNZVXqMijYMGfqrFSKVlZYqtgks6bEbB+hod
RLl2fur8BmN4ZVuKs5PgwCxvXiOo62kuMlXh+2ZepBlW/fGqa5MVMClgAqH8Zi7U
DuQlPnaFHexBKvXH91EPHIPD+MYcTlMARH/OlOYeQOEK7U2BUzGaCY7coFzBpzml
U2RCzNKn6U9wnLskiYJYj5E39mbuWEQR+7yhtgFMmVAV94fPed3XbtimWX21rb+M
n0UoHwoIrOmj0cN8i8Ks2oHhJsHPluAaGo6tEEC4p84/38P+IQzTa91UquWnkXJD
cIe/jhgLjuuLMbZyZGFAt4FG0qhkug==
=iqyx
-----END PGP SIGNATURE-----

--Sig_/CfWWVmfh9DcKFJxP2bE3FfP--
