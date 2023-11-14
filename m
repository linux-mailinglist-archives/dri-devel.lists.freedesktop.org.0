Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E507EA8CA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 03:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031910E1B2;
	Tue, 14 Nov 2023 02:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2510E1AA;
 Tue, 14 Nov 2023 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699929908;
 bh=Gi8y97nQFqKGwgOJbbb6k7fZuwkjoq/Rvdu4DGIdq0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cnd7nFvJdvOa8NHLiAvKAAGPVxc4TY1BhFDJr4l2rXWH7Gx6/Tzbb1se3T4Ul4x64
 OTlVX97R1KAWSqZvKePa4j5PDI4nSC6zVq4PCiWhQ/SgwY/Ow7hnw/1SATDYBDvmY0
 S4YcklyQ4aiUhxQ7/FqUn32QjASdP/OCJ8NwsJHThB5bjgl+xI/1kJTGW8D9yFvsrS
 3jrVTDALrt9C+YwMrm6/tU4N+usDR2WFXLSTUeG0s7xKVa4zlm10eIN/llZeRc4A9B
 aP2BcJkmF0/UEYVTy7SClXN9mCfwJ/ev0zh33myspE93xPPSr17DIS7xo/S1Vm5N0P
 BNWJmsp9yu/lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STrHl3gCGz4wcH;
 Tue, 14 Nov 2023 13:45:07 +1100 (AEDT)
Date: Tue, 14 Nov 2023 13:45:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <20231114134506.2ba0de1f@canb.auug.org.au>
In-Reply-To: <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vfjO+_ZRiq3XzHms7GsPcc9";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vfjO+_ZRiq3XzHms7GsPcc9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Luben,

On Mon, 13 Nov 2023 20:32:40 -0500 Luben Tuikov <ltuikov89@gmail.com> wrote:
>
> On 2023-11-13 20:08, Luben Tuikov wrote:
> > On 2023-11-13 15:55, Stephen Rothwell wrote: =20
> >> Hi all,
> >>
> >> Commit
> >>
> >>   0da611a87021 ("dma-buf: add dma_fence_timestamp helper")
> >>
> >> is missing a Signed-off-by from its committer.
> >> =20
> >=20
> > In order to merge the scheduler changes necessary for the Xe driver, th=
ose changes
> > were based on drm-tip, which included this change from drm-misc-fixes, =
but which
> > wasn't present in drm-misc-next.
> >=20
> > I didn't want to create a merge conflict between drm-misc-next and drm-=
misc-fixes,
> > when pulling that change from drm-misc-next to drm-misc-fixes, so that =
I can apply =20
>=20
> ... when pulling that change from from drm-misc-fixes into drm-misc-next,=
 so that I can apply...
>=20
> > the Xe scheduler changes on top of drm-misc-next. =20
>=20
> The change in drm-misc-fixes is b83ce9cb4a465b. The latter is contained
> in linus-master, and in drm-misc-fixes, while the former is in drm-misc-n=
ext.
> When we merge linus-master/drm-misc-fixes into drm-misc-next, or whicheve=
r way
> it happens, I'd like to avoid a merge conflict, but wanted to expedite th=
e changes
> for Xe.

None of that is relevant ... if you commit a patch to a tree that will
be in the linux kernel tree, you must add your Signed-off-by to the commit.
--=20
Cheers,
Stephen Rothwell

--Sig_/vfjO+_ZRiq3XzHms7GsPcc9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVS3zIACgkQAVBC80lX
0GwJtggAkD7+ISMdGhuawUsK8eHqoe6XD78rEGSbC5QjpkKyNnQejtovwRHAMibV
pzhHOonfSs8uxfbU61N0SI6iLlnPVydhUUwHDYXk/RxRAVodVrVW/uWbkXS5Oxtv
UbFigYw3Hcs5Vy6/p77YnFsgVXs8Ba09iIKd3uZgDZTX3K8pnN0RGyw343rInPR0
d9TFMjpn3hWzANScGffubmX4Wa4zeRcuz79o1Rk15G8G5KxSfema9AqWGnjircVn
cqgR4poVpb4rAJVGy20ylEWVOiCjU/NY+zDFk8bACgzkGMCAJXxeF27pSwGi1fP/
VgGh82PauC3TcQJFsYQJd3bj2ZWBfg==
=EZ5f
-----END PGP SIGNATURE-----

--Sig_/vfjO+_ZRiq3XzHms7GsPcc9--
