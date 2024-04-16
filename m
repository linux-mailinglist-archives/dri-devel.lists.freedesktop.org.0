Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2468A7225
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60944112D82;
	Tue, 16 Apr 2024 17:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mvf256EO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98462112D84
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:22:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8926561251;
 Tue, 16 Apr 2024 17:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D553BC113CE;
 Tue, 16 Apr 2024 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713288121;
 bh=hZrqs2gZL+76dYi3e/z9nBWdr14gBomL/4WEqDdx1aA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mvf256EOmyywMINpWZnqHFOEFTsuYiTVDbPfXnIgHlVnmLfeJACvSbl9vj/Q0LQLW
 S2hFFxFHz3QpnzdWnjZ+raECN8Mf6BLiPlyIRb6OAYDw1iakufo3tfOTlccL7T3QWW
 RvLnlKI0NBKy2VPX2w6gQwLhG6BxNvIka9spQ+WgJP27isgkgwys7eOjj0Qy+YMP/+
 UUq92NddEHhZvnHOdGsYs3ht2OQuFCtGFC4zwAXKa8UhB3d1HyVlD4IjA61m4Bp+Y3
 saJFpgfiQwWerLAHHuFc/dOFUP0teZ3AkgoqeZ8P0j+akJTcxtIcDGBt75UpZp8/io
 KbyXtaqnjE7xg==
Date: Tue, 16 Apr 2024 18:21:55 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Romain Perier <romain.perier@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2] ARM: dts: bcm2835: Enable 3D rendering through V3D
Message-ID: <20240416-gave-upchuck-fcf973214266@spud>
References: <20240415160129.14149-2-mcanal@igalia.com>
 <20240415175433.6e63d40f@donnerap.manchester.arm.com>
 <dc9f2926-3a8f-4191-9319-3d7e78c6758b@igalia.com>
 <41629496-9be6-470c-931b-146ca22cdd7e@gmx.net>
 <2f6e13c7-e6d6-414f-b97d-d9a02ae6a696@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Geu4vb0sP+eqi7Vr"
Content-Disposition: inline
In-Reply-To: <2f6e13c7-e6d6-414f-b97d-d9a02ae6a696@igalia.com>
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


--Geu4vb0sP+eqi7Vr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 07:13:51AM -0300, Ma=EDra Canal wrote:
> On 4/16/24 02:30, Stefan Wahren wrote:
> > Hi Ma=EDra,
> >=20
> > Am 16.04.24 um 03:02 schrieb Ma=EDra Canal:
> > > On 4/15/24 13:54, Andre Przywara wrote:
> > > > On Mon, 15 Apr 2024 13:00:39 -0300
> > > > Ma=EDra Canal <mcanal@igalia.com> wrote:
> > > >=20
> > > > Hi,
> > > >=20
> > > > > RPi 0-3 is packed with a GPU that provides 3D rendering capabilit=
ies to
> > > > > the RPi. Currently, the downstream kernel uses an overlay to enab=
le the
> > > > > GPU and use GPU hardware acceleration. When deploying a mainline =
kernel
> > > > > to the RPi 0-3, we end up without any GPU hardware acceleration
> > > > > (essentially, we can't use the OpenGL driver).
> > > > >=20
> > > > > Therefore, enable the V3D core for the RPi 0-3 in the mainline ke=
rnel.
> > > >=20
> > > > So I think Krzysztof's initial comment still stands: What does that
> > > > patch
> > > > actually change? If I build those DTBs as of now, none of them has a
> > > > status property in the v3d node. Which means it's enabled:
> > > > https://github.com/devicetree-org/devicetree-specification/blob/mai=
n/source/chapter2-devicetree-basics.rst#status
> > > >=20
> > > > So adding an explicit 'status =3D "okay";' doesn't make a differenc=
e.
> > > >=20
> > > > What do I miss here?
> > >=20
> > > As mentioned by Stefan in the last version, in Raspberry Pi OS, there=
 is
> > > a systemd script which is trying to check for the V3D driver (/usr/lib
> > > /systemd/scripts/gldriver_test.sh). Within the first check, "raspi-
> > > config nonint is_kms" is called, which always seems to fail. What
> > > "raspi-config" does is check if
> > > /proc/device-tree/soc/v3d@7ec00000/status is equal to "okay". As
> > > /proc/device-tree/soc/v3d@7ec00000/status doesn't exists, it returns
> > > false.
> > yes, but i also mention that the V3D driver starts without this patch.
> > The commit message of this patch suggests this is a DT issue, which is =
not.
> >=20
> > I hadn't the time to update my SD card to Bookworm yet. Does the issue
> > still exists with this version?
>=20
> I'm using a 32-bit kernel and the recommended OS for 32-bit is Bullseye.
> But I checked the Bookworm code and indeed, Bookworm doesn't check
> the device tree [1].
>=20
> I'm thinking about sending a patch to the Bullseye branch to fix this
> issue.

I think you should, sounds like they're making invalid assumptions about
the status property.

--Geu4vb0sP+eqi7Vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6zswAKCRB4tDGHoIJi
0tEuAP9r4syGC747XjiKE0ocT88fnt3btSA+4oxB5C/nqWWFZwEA0IH/JkEXCeGS
2Ub88UKpPcPILr0/bvTojULx/V5GaQg=
=27v6
-----END PGP SIGNATURE-----

--Geu4vb0sP+eqi7Vr--
