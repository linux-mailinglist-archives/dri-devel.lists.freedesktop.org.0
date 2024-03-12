Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C60879863
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFDB10F2C0;
	Tue, 12 Mar 2024 15:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vQEaCY2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025B710EFE4;
 Tue, 12 Mar 2024 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710258918;
 bh=6qg9Sxf5UjfkJgqOsjHd6BPR280DnG1Jo2kc/Ku04FA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vQEaCY2PC52Q2+Vi4YQ7+9NKlR3StqhNbjQOTRHZz+r+v3iBSu7thIZLeHuVj6BIb
 rR1V2aYJ1U6DCHQPpCPzyUcFE7x269Uv23wj+QgPF3/9YlXAUBJRasBDEsrzWA9BjN
 1qDtc7aeop397Pkb+5rrfqNJbErqVjhSkjhrTo5Y1GGCViPg+8uIT7/v7/CfIX9XZH
 OTSZEiTvsGfC8U78jWMm5a+ry5axK8cvrr+6acWNGV1IBbqf4yi6vWQYQUsMdyaqSv
 7Y426KpYT77pCNTa7w2WnsmdnoK5n2iFxsP9Hay+SU9Ublr401mutPFH9sO9MWb0/f
 eZpTDiMDH5geg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD017378209C;
 Tue, 12 Mar 2024 15:55:17 +0000 (UTC)
Date: Tue, 12 Mar 2024 17:55:16 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v4 10/42] drm/colorop: Add TYPE property
Message-ID: <20240312175516.33c40876.pekka.paalanen@collabora.com>
In-Reply-To: <fUKns6g3m2ljL4-W9uaJkjW8nXhevseCHOwD6AbJ5AeDLMD68YIPSWZA1U29fjvrY9fabCmztCZEy8EkZtYGZ1iSudy0VxAMLWGZFunsIUc=@emersion.fr>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-11-harry.wentland@amd.com>
 <20240312170247.326b1c6e.pekka.paalanen@collabora.com>
 <fUKns6g3m2ljL4-W9uaJkjW8nXhevseCHOwD6AbJ5AeDLMD68YIPSWZA1U29fjvrY9fabCmztCZEy8EkZtYGZ1iSudy0VxAMLWGZFunsIUc=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4W3Y4Fh1hNPWYPh_01s+6Rj";
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

--Sig_/4W3Y4Fh1hNPWYPh_01s+6Rj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Mar 2024 15:15:13 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, March 12th, 2024 at 16:02, Pekka Paalanen <pekka.paalanen@col=
labora.com> wrote:
>=20
> > This list here is the list of all values the enum could take, right?
> > Should it not be just the one value it's going to have? It'll never
> > change, and it can never be changed. =20
>=20
> Listing all possible values is how other properties behave. Example:
>=20
>     "type" (immutable): enum {Overlay, Primary, Cursor} =3D Primary

Yeah, that's weird, now that you pointed it out.

Userspace does nothing with the knowledge of what this specific
object's property "could" be since it's immutable. Only the kernel
internals and UAPI docs need the full list, and userspace needs to
hardcode the full list in general so it can recognize each value. But
on the property instance on a specific object, I see no use for the
full list.


Thanks,
pq

--Sig_/4W3Y4Fh1hNPWYPh_01s+6Rj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXweuQACgkQI1/ltBGq
qqe+SA/9G7IcfU8bVr6axuilt7KhhjVZPW+rLCUnhX7tVpBX47NVzeEcFihxz5sJ
+W90rqmdJCT+6wwekDTuJrZksSG5Ct+TL6JCie9dCFa+WqSx38BLmXv9q/ByiMnF
P3ff9P4t0o5Hhed0F+NBm+0zx/jPcpMVgVo2Nw0dqVkfPoPglXK/u8A8lh/ogPNq
8+nGjbuCdsqjWMPNQu9yWk9QT+viENsHEQd6p6wwSYa0wifhHJbjok45jVWNrrev
s52IBeqeQN3wDOi/DXFNHoVhg0OUc0Fdh2zuwYY8ws5QtWbJvvsrk2c7+R2Wocir
lIuOH80O1nlboVo+Nj9CyZyc9InU250DpYetZ/Dloh+wNXuhe+Z2gTlrq15k3Wx8
23p2ghld2+DgfOF+BzX2dTibGD5pmaflxePAV0hmLKGVrJSm/l5GuXXZ2rwuPG9H
kVoepBJs3M6/oxN+L7Kj9IsLGsiPeBk7B9YeNhMDX4nt+T3cC/xHNWZ7Lj58rqaP
/d43q8KOD/XGgSz3pVCSiubzZ5hD9eWaeoHaDBewB/AWZREZggg+bTE3EVOyQDV7
Z7Pxx8JNT6aAvLqTQ9nlcuSP73OUFdp/DLkF6ZXlJiHIWr+cLi9xfHu9qz7SoAdo
R9gxlpWXkvvbAclVAmX3FBCReNZkxIXco+LTMi1c6EWOr7uJrVE=
=3pe/
-----END PGP SIGNATURE-----

--Sig_/4W3Y4Fh1hNPWYPh_01s+6Rj--
