Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DF25418C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 11:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA686EB36;
	Thu, 27 Aug 2020 09:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32DB6EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 09:10:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38918AF8D;
 Thu, 27 Aug 2020 09:11:00 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] drm/ast: Only set format registers if primary
 plane's format changes
To: Sasha Levin <sashal@kernel.org>, airlied@redhat.com, daniel@ffwll.ch,
 sam@ravnborg.org
References: <20200805105428.2590-2-tzimmermann@suse.de>
 <20200826135412.04FE8208E4@mail.kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <24cf62a4-2d96-e749-bd7a-e0c71764d837@suse.de>
Date: Thu, 27 Aug 2020 11:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826135412.04FE8208E4@mail.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, stable@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1182480329=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1182480329==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="y4LC9cr7BphkHjszmouyMEklYrJnF9dxf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--y4LC9cr7BphkHjszmouyMEklYrJnF9dxf
Content-Type: multipart/mixed; boundary="Zt44v4g4ecOJG11sowl5w7ydTd6HXX0nj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sasha Levin <sashal@kernel.org>, airlied@redhat.com, daniel@ffwll.ch,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, "Y.C. Chen"
 <yc_chen@aspeedtech.com>, stable@vger.kernel.org
Message-ID: <24cf62a4-2d96-e749-bd7a-e0c71764d837@suse.de>
Subject: Re: [PATCH v1 1/4] drm/ast: Only set format registers if primary
 plane's format changes
References: <20200805105428.2590-2-tzimmermann@suse.de>
 <20200826135412.04FE8208E4@mail.kernel.org>
In-Reply-To: <20200826135412.04FE8208E4@mail.kernel.org>

--Zt44v4g4ecOJG11sowl5w7ydTd6HXX0nj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.08.20 um 15:54 schrieb Sasha Levin:
> Hi
>=20
> [This is an automated email]
>=20
> This commit has been processed because it contains a "Fixes:" tag
> fixing commit: 4961eb60f145 ("drm/ast: Enable atomic modesetting").
>=20
> The bot has tested the following trees: v5.8.2, v5.7.16.
>=20
> v5.8.2: Failed to apply! Possible dependencies:
>     05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
>     fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via=
 to_ast_private()")
>=20
> v5.7.16: Failed to apply! Possible dependencies:
>     05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
>     3a53230e1c4b ("drm/ast: Make ast_primary_plane_helper_atomic_update=
 static")
>     fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via=
 to_ast_private()")
>=20
>=20
> NOTE: The patch will not be queued to stable trees until it is upstream=
=2E
>=20
> How should we proceed with this patch?

Please drop this patch and the rest of the series.

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Zt44v4g4ecOJG11sowl5w7ydTd6HXX0nj--

--y4LC9cr7BphkHjszmouyMEklYrJnF9dxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9HeIMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPkugf+Iy0jrGL45qBXPXUTH6dtBHjXwkf/
sUHsYFSaLJ6O8SAIGdJh/QfUvk6KmxzXiH/+p2If/ehNrUxSFKLZ4hBD7fvY6Nol
y0jBL2KC08FU6FwG88vLTY2nrqnwCvC0fLS/mq2G/rxK8K9xHIQys3v+4UIHmToC
07Vk4k4ZoSidfVBUh6vX5BmMNpZufjKN0s1gXz1hEIearsM9avfx7U/FNHPwx7O1
RT+lOZJet+j92BX+JhS7Ri15s+9JtZajHtSGjtw+g/E9BTULp+o2LhvCynRkGtQs
RAzcuyCPF7CFap0FAaVd4kaY3x8avxyIETTLf4jtm2IjHCMRCHgOkZ281Q==
=Zs+e
-----END PGP SIGNATURE-----

--y4LC9cr7BphkHjszmouyMEklYrJnF9dxf--

--===============1182480329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182480329==--
