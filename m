Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6095D23D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2E110EC5D;
	Fri, 23 Aug 2024 15:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hjr83euP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715C810EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:59:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9BD3BA400FF;
 Fri, 23 Aug 2024 15:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB49C32786;
 Fri, 23 Aug 2024 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724428789;
 bh=O2lMKlPvm5xBpbj9dv2BdmqyLIQ1zrOWY1a1YXHnZ4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hjr83euPg8IQyUwMQjvhJt/F2p/Xm//W9sjhrdpUOO1ypRA/Q3y9ykqKAyQSM0mt0
 gFLYHGWSDx977PfXdpwWFoclJKsI3jzvnCumGBzR7YneezFvQZhpfX7HaWTyhO5Zzu
 FJsJVPS7yEq1ZCRSe2l/VIDRhjYsyIpWGkDncX22DhmbV3pZ/49v5Z0F15o7HkQ45p
 bQF3L/W2u1sKpSXxwPlTX/zaU8t5ixzuGpw358NOsyt3pYyeuZzFqgainiMRUd1saX
 hgf6N7FDQMvGVorz5WKf7Y8gH0gAhMkcF+EqGTYTFgYqT0Y7yZVuYFOx5KhBEFX3WB
 /SOcJpfarUVLQ==
Date: Fri, 23 Aug 2024 16:59:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
Message-ID: <20240823-lunar-esteemed-a727b6de8cbe@spud>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <4167579.6PsWsQAL7t@diego>
 <20240822-pushchair-premises-f4055779216a@spud>
 <3137870.U3zVgo479M@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hV0DDwkOk4FQlrs4"
Content-Disposition: inline
In-Reply-To: <3137870.U3zVgo479M@diego>
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


--hV0DDwkOk4FQlrs4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:47:50PM +0200, Heiko St=FCbner wrote:
> Am Donnerstag, 22. August 2024, 10:41:10 CEST schrieb Conor Dooley:
> > On Thu, Aug 22, 2024 at 09:01:34AM +0200, Heiko St=FCbner wrote:
> > > @Conor: just for me, did some shift happen in our understanding of dt-
> > > best-practices in terms of syscon via phandle vs. syscon via compatib=
le?
> > >=20
> > > Because Rockchip boards are referencing their GRFs via phandes forever
> > > but similar to the soc vs non-soc node thing, I'd like to stay on top=
 of
> > > best-practices ;-)
> >=20
> > If IP blocks, and thus drivers, are going to be reused between devices,
> > using the phandles makes sense given that it is unlikely that syscon
> > nodes can make use of fallback compatibles due to bits within that "glu=
e"
> > changing between devices. It also makes sense when there are multiple
> > instances of an IP on the device, which need to use different syscons.
> > My goal is to ask people why they are using these type of syscons
> > phandle properties, cos often they are not required at all - for example
> > with clocks where you effectively need a whole new driver for every
> > single soc and having a phandle property buys you nothing.
>=20
> I guess I'm of two minds here.
>=20
> For me at least it makes sense to spell out the dependency to the
> syscon in the devicetree and not just have that hidden away inside the
> driver.
>=20
> But on the other hand, we already have the per-soc configuration [0]
> defining which grf bits needs to be accessed, so adding a
>=20
> 	.lanecfg1_grf_compat =3D "rockchip,rk3568-vo"
>=20
> would not create overhad, as the grf regs and bits and rearranged
> all the time anyway.

Right, that's the other side of it. Raw phandles aren't that great if
the bits are gonna move around the register and you have to use the
match data to figure out where they are. phandle + offset is the other
option for that kind of scenario, particularly in cases where there are
multiple copies of a block on an SoC and each uses either a different
syscon or a different set of registers within one.

>=20
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c#n1652
> taking DSI as an example, where this is even more obvious
>=20
>=20

--hV0DDwkOk4FQlrs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsix7QAKCRB4tDGHoIJi
0iOnAQCzjBObBEXW5gvG2K3RPILn8u+nPpQFIaHghl7RlSPXRgD8CMDqOYKns/Dy
oZZF/fVLrYmrSuw4spyzAIfbrGlg/QA=
=ONcF
-----END PGP SIGNATURE-----

--hV0DDwkOk4FQlrs4--
