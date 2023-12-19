Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2A781874D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30A610E2E5;
	Tue, 19 Dec 2023 12:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1816A10E156;
 Tue, 19 Dec 2023 12:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7998C612AF;
 Tue, 19 Dec 2023 12:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90502C433C8;
 Tue, 19 Dec 2023 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702988514;
 bh=uWwoGx6BSf0sx3lwgE1mNoor+NzDx9o7uDvaSK1T8bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzdXXPSsK0hiixAhqNs+7imikO+MVIDZaFFHk3ZvBhMTdDvYNgNsgjMjZxRpz/CPC
 8hF4EvwD59QKRDBfakhFzDxZjE9K2fSAQ4UHAFv9vUZEQsokGnNtruc2mBtjjd+AqP
 UZDPNTf6I3dDsv3JUgbnCazUQ+t19CW0rLIrtLr4JpFcLkAHkS65h/Dbz9MXq8Xbnx
 KZ2rhg6Lec10aG6bRShM09AOBrlWrtSbkyKQHlQPcj5rTJG4G1CyfJMNkDsxjZ+KPc
 Hnr5LNc4OIrdJEGA1Grk3oQ9ez1DgPkg0JQNMwTJa8lFQ7t9IMGbJ+2TY+U6AJEVxi
 3oCyghSAQrKJg==
Date: Tue, 19 Dec 2023 13:21:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Remove I2C_CLASS_SPD support
Message-ID: <ZYGK3s0ciA3I1Vnd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eKnS0Rr6oV1VXCD6"
Content-Disposition: inline
In-Reply-To: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 David Airlie <airlied@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eKnS0Rr6oV1VXCD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 12:37:15PM +0100, Heiner Kallweit wrote:
> I2C_CLASS_SPD was used to expose the EEPROM content to user space,
> via the legacy eeprom driver. Now that this driver has been removed,
> we can remove I2C_CLASS_SPD support. at24 driver with explicit
> instantiation should be used instead.
>=20
> If in doubt this patch could be applied via the i2c tree.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--eKnS0Rr6oV1VXCD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBit4ACgkQFA3kzBSg
Kba03xAAirEpADqK4nRslNqocGuQh0p92d4JR85d/0ZNNz9mmwluGCKn9YClAb1X
BI//Xi9OGWsH8WUPF54/jCnGKJZjTAl8oxEvGcTiLAw03PJrLi8Qz2945avrkn51
ipLZX9R3U4CT8jSRqwfWc5/FCOCwfnSIQ3uvNz1i+yiSl2b5ABL2/AIQxAMNSiSV
dEhzkPSrdS/N2gYNt0DMsSjIuzgg54BqbNyW/dft2Bg0WFy1sg4Vr1aBx+Rf46Hm
iaqMyHjVPegQ3PIVtNpt18mVId8q0HB+XR/0xI/JFXTBJT5z17SWZH8dufjbt8wf
Hf1A3+/WAIF24/JEL6jkdDXfTv/sOr2YDotEpSa6D+vQVT7n7oV8xnfeh/oKt4Ou
Kx3Ax5Igh7Bo8c0G0S15NVSx+z6YcM/Y4PbRShQ0MkhMZlHPodjnGwmixxDMOslX
uykOQuVyyYM18DCQeRpZMLxNZBY0k50Ue53b3/oBXYaKuuYKRKt9Sb9e2oZKXehz
zdp1bTtYWPzLq3Ar/QBn59k/7MejsGRWS4x41EVGswIg5UG1EgNb6B/GsLCUJjLH
+PTgE9J6WmdmqByc1iHiuJsLv0LeRoGo4uE/vEgxnl+3KhkNj215VVOutiF+Xi/U
F168k8/sWnxZC1z8Z8PJ4pQmBUEMAq3h8rKqdR8EE5XZdg2BSZ0=
=ufJA
-----END PGP SIGNATURE-----

--eKnS0Rr6oV1VXCD6--
