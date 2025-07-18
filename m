Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19FB0A4B3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91310E9B7;
	Fri, 18 Jul 2025 13:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SBVNTNlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8645710E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752843805;
 bh=cW+z4FdoCZgI8glcU8gCowaqVnQtd9xnbTSUBw+y7i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBVNTNlV+jZT/W4IAFxNQTBR9mVQ1dGxgYXUxbRH1Yx/WSt+I+L4z4de08SaxTTp2
 Ucsxq0t2Kl+JkbMWoeTSiX2pRXwIkWdoDSCocRJpCMXTbZd52HxacDstmyRELpyKNm
 BCkh5MWV6WgZ4Tk7FEXzrKmkEqcH+sAapvZH7e+jIAlBfWuWf8j0x33xU1t52huPCh
 U0PX82e+U+9TYc7VZmFFTKYkTb9r/t9R/uh+1+aGk8ytPtF18k0eTp8u2VEtisJxRh
 dFIsyru7uAK3Wj8gAET0dhmFJ5CX72SF3+hwx89RsgW4E61IntVeXKxnswo+jS8yCw
 0Gj0duCzE+lLg==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e40d:4800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BBBE517E1541;
 Fri, 18 Jul 2025 15:03:24 +0200 (CEST)
Date: Fri, 18 Jul 2025 16:03:23 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 tzimmermann@suse.de, mripard@kernel.org, simona@ffwll.ch,
 sebastian.wick@redhat.com, victoria@system76.com,
 Mark Yacoub <markyacoub@google.com>, xaver.hugl@kde.org,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
Message-ID: <aHpGGxZyimpJ8Ehz@xpredator>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
 <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZXexRpYrw3I/y90c"
Content-Disposition: inline
In-Reply-To: <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
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


--ZXexRpYrw3I/y90c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

FWIW, we (Weston) also use vkms in CI and we have in plan to make use of
these changes to exercise some internal code paths and enhance our tests.=
=20
Look forward to getting these into the tree and have it a in release. We
tend to follow with a branch/stable release so I suppose that's going be
a while. Just wanted to also say thanks a lot for driving this.

Just curios, in the current form would it be possible to configure the
plane's zpos position? Apart from testing underlay/overlay in the same
time, some drivers today allows the primary to be independently
positioned. Simulating these type of configurations would allow see what
architectural changes we might need to do to transition towards a place
where we can use any other plane as a (fallback) compositing one like we
do today with the primary one.

On Thu, Jul 17, 2025 at 06:37:17PM +0200, Louis Chauvet wrote:
> +CC: Mark (Google), Sebastian (Mutter), Xaver (KWin), Victoria (Cosmic)
>=20
> Hi everyone,
>=20
> Last week, I presented this work at the Display Next Hackfest, and the
> feedback from compositors was very positive. At least KWin, Mutter, and
> Cosmic are interested in integrating it into their tests, so it would be
> great if someone could review it.
>=20
> Sebastian quickly tested this work (using [2] for full features) with the=
ir
> existing VKMS tests [1], and it worked. From what I understand, the tests
> are quite basic =E2=80=94just sanity checks=E2=80=94 but we were able to =
reproduce the
> default vkms device using ConfigFS.
>=20
> If another compositor wants to test the ConfigFS interface (I will try to
> keep [2] updated), that would be amazing. Feel free to send feedback!
>=20
> A small note: This series has a minor conflict since the conversion to the
> faux device, but it can be applied using `b4 am -3 ... && git am -3 ...`.
> @jos=C3=A9, if you send a new iteration, can you add markyacoub@google.co=
m in
> copy, and maybe Sebastian, Xaver, Victoria if they want to follow the
> upstreaming?
>=20
> Thank you,
> Louis Chauvet
>=20
> [1]:https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb=
83cc4f2d2c7b08b694
> [2]:https://github.com/Fomys/linux/tree/configfs-everything
>=20
>=20
>=20
> Le 07/05/2025 =C3=A0 15:54, Jos=C3=A9 Exp=C3=B3sito a =C3=A9crit=C2=A0:
> > Hi everyone,
> >=20
> > This series allow to configure one or more VKMS instances without having
> > to reload the driver using configfs.
> >=20
> > The series is structured in 3 blocks:
> >=20
> >    - Patches 1..11: Basic device configuration. For simplicity, I kept =
the
> >      available options as minimal as possible.
> >=20
> >    - Patches 12 and 13: New option to skip the default device creation =
and to-do
> >      cleanup.
> >=20
> >    - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. Th=
is is not
> >      part of the minimal set of options, but I included in this series =
so it can
> >      be used as a template/example of how new configurations can be add=
ed.
> >=20
> > The process of configuring a VKMS device is documented in "vkms.rst".
> >=20
> > Finally, the code is thoroughly tested by a collection of IGT tests [1].
> >=20
> > Best wishes,
> > Jos=C3=A9 Exp=C3=B3sito
> >=20
> > [1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071=
=2Ehtml
> >=20
> > Changes in v5:
> >=20
> >    - Added Reviewed-by tags, thanks Louis!
> >    - Rebased on top of drm-misc-next
> >    - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-=
1-jose.exposito89@gmail.com/
> >=20
> > Changes in v4:
> >=20
> >    - Since Louis and I worked on this together, set him as the author o=
f some of
> >      the patches and me as co-developed-by to reflect this joint effort.
> >    - Rebased on top of drm-misc-next
> >    - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose=
=2Eexposito89@gmail.com/
> >=20
> > Changes in v3:
> >=20
> >    - Applied review comments by Louis Chauvet: (thanks!!)
> >      - Use scoped_guard() instead of guard(mutex)(...)
> >      - Fix a use-after-free error in the connector hot-plug code
> >    - Rebased on top of drm-misc-next
> >    - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose=
=2Eexposito89@gmail.com/
> >=20
> > Changes in v2:
> >=20
> >    - Applied review comments by Louis Chauvet:
> >      - Use guard(mutex)(...) instead of lock/unlock
> >      - Return -EBUSY when trying to modify a enabled device
> >      - Move the connector hot-plug related patches to the end
> >    - Rebased on top of drm-misc-next
> >    - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-=
1-jose.exposito89@gmail.com/T/
> >=20
> > Jos=C3=A9 Exp=C3=B3sito (6):
> >    drm/vkms: Expose device creation and destruction
> >    drm/vkms: Allow to configure the default device creation
> >    drm/vkms: Remove completed task from the TODO list
> >    drm/vkms: Allow to configure connector status
> >    drm/vkms: Allow to update the connector status
> >    drm/vkms: Allow to configure connector status via configfs
> >=20
> > Louis Chauvet (10):
> >    drm/vkms: Add and remove VKMS instances via configfs
> >    drm/vkms: Allow to configure multiple planes via configfs
> >    drm/vkms: Allow to configure the plane type via configfs
> >    drm/vkms: Allow to configure multiple CRTCs via configfs
> >    drm/vkms: Allow to configure CRTC writeback support via configfs
> >    drm/vkms: Allow to attach planes and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple encoders via configfs
> >    drm/vkms: Allow to attach encoders and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple connectors via configfs
> >    drm/vkms: Allow to attach connectors and encoders via configfs
> >=20
> >   Documentation/gpu/vkms.rst                    | 100 ++-
> >   drivers/gpu/drm/vkms/Kconfig                  |   1 +
> >   drivers/gpu/drm/vkms/Makefile                 |   3 +-
> >   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
> >   drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
> >   drivers/gpu/drm/vkms/vkms_config.h            |  26 +
> >   drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
> >   drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
> >   drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
> >   drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
> >   drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
> >   12 files changed, 1072 insertions(+), 13 deletions(-)
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> >=20
> >=20
> > base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
>=20
> --=20
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

--ZXexRpYrw3I/y90c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmh6RhgACgkQ9jQS5glH
1u+xXA/9Guh9hSv56Ur4XksUAh5J1d8f3v6HQIDEhGdL9EgulHUcH+BR62Mq5FbU
pIZ8O6L0p2Gx8uyHngeWiZuO9vWUwZiTwwKzc9xAkbSWUal5LQzi3PiXzdb7igN1
U5pXGm4uDJSC2qgAfaObRcq48kkARrMbN9Bui0tsJrDVHO6NGf4H5lkxPi77GZmK
MMNEtY70xgrF1uJrVUl5e8km90vMbrEf72A/sKlnJB7c68YnZCcaAwO0Pt/bMaCG
Ymmg1R2xEwM5n3Uf5vbR5LWO1fGidAw7FsRUX/UPHVI5FrYlzRx+yqqCvCO9qZLU
qmYVHz08Lk+bKAMNym28X/shGTvGTVEYN4OdpKF+sECkagqbmkXJN+F4mhGu3CzE
PcPn1bERneW8QuS8gJIZwOSkd4yzapA2cboVYVHs4VWK5uJZ7Yhy1s+bY+Y9h+aP
JALAEjbUANuLGwUGrkDWbfVtkteiAPkzoT09tgbUVz5wJfLaZbDJ3GzZpy7In9pa
V+kuz1EBdplbB/0941Hk4y6mamCFrzIIwjPMEIo9vWXtDXWNnyndovsmhXu2qsIR
4+D2CWpF4s9nK5oP69eCAXqB6vfyNoioBsYacSJW6fXWPQVtJDklA0b+ycH3gD0p
mq1sq0PNEBMsO/6pnBW4ZOff7G4b9F5M4hDNVDZ66Fd5/U/omkE=
=m/20
-----END PGP SIGNATURE-----

--ZXexRpYrw3I/y90c--
