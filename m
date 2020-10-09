Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51452883ED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4B46EC6C;
	Fri,  9 Oct 2020 07:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771916EC6C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:51:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EAF1AC7D;
 Fri,  9 Oct 2020 07:51:55 +0000 (UTC)
Subject: Re:
To: Sandeep Raghuraman <sandy.8925@gmail.com>, alexander.deucher@amd.com
References: <20201008181606.460499-1-sandy.8925@gmail.com>
 <c11f3758-9b41-412a-85b1-258d47c776c6@suse.de>
 <7227878e-28f7-a008-4bd5-fa7f64d371da@suse.de>
 <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e4e69435-baf6-265d-6a17-d624ee6e2300@suse.de>
Date: Fri, 9 Oct 2020 09:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1075820775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1075820775==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TcFx8XFlZEs4uX1fDE4UVKjeaprWezsFm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TcFx8XFlZEs4uX1fDE4UVKjeaprWezsFm
Content-Type: multipart/mixed; boundary="BRVWqKEy0LWw6KEBX5zVqJEd1xIcUeJZP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sandeep Raghuraman <sandy.8925@gmail.com>, alexander.deucher@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e4e69435-baf6-265d-6a17-d624ee6e2300@suse.de>
Subject: Re:
References: <20201008181606.460499-1-sandy.8925@gmail.com>
 <c11f3758-9b41-412a-85b1-258d47c776c6@suse.de>
 <7227878e-28f7-a008-4bd5-fa7f64d371da@suse.de>
 <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>
In-Reply-To: <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>

--BRVWqKEy0LWw6KEBX5zVqJEd1xIcUeJZP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.10.20 um 09:38 schrieb Sandeep Raghuraman:
>=20
>=20
> On 10/9/20 12:44 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 09.10.20 um 08:47 schrieb Thomas Zimmermann:
>>> NACK for the entire lack of any form of commit description.
>>
>> Please see the documentation at [1] on how to describe the changes and=

>> getting your patches merged.
>=20
> Yes, I tried to use git send-email to send patches this time, and it re=
sulted in this disaster. I'll stick to sending them through Thunderbird.

What's the problem with send-email?

A typical call for your patchset would look like

  git send-mail <upstream-branch>...HEAD --cover-letter --annotate
--to=3D... --cc=3D...

That allows you to write the cover letter and have it sent out. IIRC you
need ot set $EDITOR to your favorite text editor; and configure the SMTP
server in ~/.gitconfig, under [sendemail].

Best regards
Thomas

>=20
>>
>> Best regards
>> Thomas
>>
>> [1]
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BRVWqKEy0LWw6KEBX5zVqJEd1xIcUeJZP--

--TcFx8XFlZEs4uX1fDE4UVKjeaprWezsFm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+AFpcUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPQDggAleA3nSAtyjTcKbX6cQKUJAN9OSM/
DvMXKF9YFTyt4uV2sT0bqtsslITKn8ij04OefFvJAO558DmY9+fThAcumNPQt4Up
ItS4RIWuF9gPKYnLgPaEhpq1Ack48zAUVfXEA3Pn4gefdwlaJN0XL0tRH2GKFs+2
pvoSHDOWSZ+m9WPkx/dt6Ot2llLmOumXPDvIIVU4btyLmHDjQGNUmIZVCahcZ5OS
cwU0jlkxEe/yB3dVWmvepDkDZbQtVX1W8hs41gxBP/yAktVIi/0xlT+FSO546ETZ
QSBK3vvffx6HIDZVR8Xl43mpTZUiLTsaztFvo0XKA+vIZbxNOBXASVow2g==
=eDtM
-----END PGP SIGNATURE-----

--TcFx8XFlZEs4uX1fDE4UVKjeaprWezsFm--

--===============1075820775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1075820775==--
