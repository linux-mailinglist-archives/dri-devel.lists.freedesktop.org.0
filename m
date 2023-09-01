Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAC78FAD6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7CE10E710;
	Fri,  1 Sep 2023 09:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED210E710
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:32:16 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4c00:5d00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B89446607295;
 Fri,  1 Sep 2023 10:32:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693560734;
 bh=JO2WMti1Mm0nummHVbvbhqxgPr2kuKBp0pSJmah19uk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YSL4jgpJGSOX4Oob1yjsoAHfElc0RQel1jTDxMHZOe95sZe+A4zCiLkbcjFhzMo9z
 S+L/vytV8Zy4VlzmCpR6wnlHPbfexWOrjG3XKQS+Cia/0q8EHyrb+redvTQac0n/qE
 gFJx22TQqXhH3LL/9Db8Cu0lXlZLqH32oIuD+MCF6l4KimBPcs9OGwjRzSg2vkeYKQ
 7XIwlGg/N6oBalp6Stux+l3povEDBWE4nxTPn5UYccwhnQoBdQsGroUO8vEOoIdT2z
 nn4gHguyybKTsfgbsIoQ0LpUzSRIrhi1/8c2Wd8e7hafzvR1p4WtFS6BkN4U8O+W0X
 ayRIYhEjmTp0w==
Date: Fri, 1 Sep 2023 12:32:10 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Brandon Pollack <brpol@chromium.org>
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZPGvmpExLxwmfFBB@xpredator>
References: <20230829053201.423261-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bqm9t5IXKKZ0/ilA"
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-1-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, jshargo@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bqm9t5IXKKZ0/ilA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

You can now add https://lists.freedesktop.org/archives/igt-dev/2023-Septemb=
er/060717.html
as part of this series.

On Tue, Aug 29, 2023 at 05:30:52AM +0000, Brandon Pollack wrote:
> Since Jim is busy with other work and I'm working on some things that
> rely on this, I've taken up the task of doing the iterations.  I've
> addressed the comments as best I can (those replies are to each
> individual change) and here is the patch set to go with those.
>=20
> I added my own signoff to each commit, but I've left jshargo@ as the
> author of all the commits he wrote.  I'm sure there is still more to
> address and the ICT tests that were writtein parallel to this may also
> need some additions, but I'm hoping we're in a good enough state to get
> this in and iterate from there soon.
>=20
> Since V6:
> =3D=3D=3D=3D=3D=3D=3D=3D
> rmdirs for documentation examples
> fix crtc mask for writebacks
>=20
> Since V5:
> =3D=3D=3D=3D=3D=3D=3D=3D
> Fixed some bad merge conflicts and locking behaviours as well as
> clarified some documentation, should be good to go now :)
>=20
> Since V4:
> =3D=3D=3D=3D=3D=3D=3D=3D
> Fixed up some documentation as suggested by Marius
> Fixed up some bad locking as suggested by Marius
> Small fixes here and there (most have email responses to previous chain
> emails)
>=20
> Since V3:
> =3D=3D=3D=3D=3D=3D=3D=3D
> I've added hotplug support in the latest patch.  This has been reviewed s=
ome
> and the notes from that review are addressed here as well.
>=20
> Relevant/Utilizing work:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> I've built a while test framework based on this as proof it functions (th=
ough
> I'm sure there may be lingering bugs!).  You can check that out on
> crrev.com if you are interested and need to get started yourself (but be
> aware of any licensing that may differ from the kernel itself!  Make
> sure you understand the license:
>=20
> https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/p=
latform/tast-tests/LICENSE
>=20
> That said, you can see the changes in review on the crrev gerrit:
>=20
> https://chromium-review.googlesource.com/c/chromiumos/platform/tast-tests=
/+/4666669
>=20
> Outro:
> =3D=3D=3D=3D=3D
> I really appreciate everyone's input and tolerance in getting these
> changes in.  Jim's first patch series was this, and other than some
> small cleanups and documentation, taking over it is also mine.
>=20
> Thank you everyone :)
>=20
> Brandon Pollack (1):
>   drm/vkms Add hotplug support via configfs to VKMS.
>=20
> Jim Shargo (6):
>   drm/vkms: Back VKMS with DRM memory management instead of static
>     objects
>   drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
>   drm/vkms: Provide platform data when creating VKMS devices
>   drm/vkms: Add ConfigFS scaffolding to VKMS
>   drm/vkms: Support enabling ConfigFS devices
>   drm/vkms: Add a module param to enable/disable the default device
>=20
>  Documentation/gpu/vkms.rst            |  20 +-
>  drivers/gpu/drm/Kconfig               |   1 +
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c  | 723 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
>  drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
>  drivers/gpu/drm/vkms/vkms_output.c    | 404 ++++++++++++--
>  drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  42 +-
>  11 files changed, 1514 insertions(+), 241 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>=20
> --=20
> 2.42.0.rc2.253.gd59a3bf2b4-goog
>=20

--bqm9t5IXKKZ0/ilA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmTxr5MACgkQ9jQS5glH
1u/yPg/7BOlu8W8mfdi0z0y5yk4jI9J3tbphJ1Uq38IkDIy7R4DkxjrHxzHyvAE8
vtyf3dSmWXd6abWXnBTdaXe6Q6DfTR6yjXcp+FECCOWjmofNRpAn8gh0kJ26r0iV
7lNguPhiDvvAmb9eahHrZsBdbDNRu48HSZbDHLZvPIG+o30spnzUGDqoW9fKtRwp
BRT+xb4L5Je+JwJ5JX+XQ7ZCdNNn30ZfZRS4PlsFpvq7KLNr+WJaLeNMk3x8l9Ho
+UzXKnwA19NU8J48AU7QtEAodeRMsFvfHbVHD8eAdGI+h2p+Tc/7F/6u4bjW3W+O
9Gmwr0/NPuUydT3pCwLmebCCe1E+zdedMWX+n4zmNe9VVtjXsArIba4300nN0tFu
ZELKQknTXR2KsyXgZlMkD8Qq9Uvhs64pYBd9ffFAKhGciMwQXm4460meswdHtcz0
4HOrpHNI3wqkRwm9U+FnRUgTZXGN107jHL98BUL3sygkhjoLXjkaAG0XC2B2XmLY
UnaBD8pVdFnnDbrssFIz1DCW3iNQYDphXVnZahm0nCvVMYM6bRACbD4DJgb6ScZq
bx6R7eSA9ZseOVjpKxfUmXNnZINfi3APe8bA+SRxtV5AFwunTKC9wtj6aaKBbcBY
NgEeD/+yBa/PC36uK311j4gKLMZY53dvPPqTQpE2mqc29f6/OmA=
=Xchf
-----END PGP SIGNATURE-----

--bqm9t5IXKKZ0/ilA--
