Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A1B2CA6F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 19:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1C10E0D3;
	Tue, 19 Aug 2025 17:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EJmwzm8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1CB10E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 17:22:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B5F4613EF;
 Tue, 19 Aug 2025 17:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194B5C4CEF1;
 Tue, 19 Aug 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755624160;
 bh=Hqw9eNwEyOyjAddQiU40tZUpBUM4UVro4mYONtNAhdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJmwzm8JVvkGwG9V+/odTUt0NyAxYoUrIXbQNniA3nwUn548XT34GYo23hN0RP86F
 ltQXVE/9Sl8T0Z7GnwDxTiMTdLU5NhX4dIzgiuGAQLZs2uG115vn9li+4xgY1ORdtd
 cAqo83b1PiMbpr/N6IjhyFE/CLL+6ZeDXjzWuP2LOvNDlPwCHEBWxVirr8w1MuyZ/i
 DQjF5/36k6DShHkW7JLCLcq22uz/M+8OX05N896ZsfrO5ZzQ11AW2W+2MGl4EyZeO5
 MhZqRpPQo3A3jPTCOvmVflCws3MFnYPDtWQx5uYNWsOX+TvEcJrjrs7RukCneYbyzI
 I0jR45Bz9LJRQ==
Date: Tue, 19 Aug 2025 18:22:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Message-ID: <20250819-impeach-prognosis-247bec1a809b@spud>
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
 <20250812145256.135645-2-mike.looijmans@topic.nl>
 <20250812-designing-tyke-db85527b373d@spud>
 <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
 <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
 <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="66JlIddYdkNBaUXn"
Content-Disposition: inline
In-Reply-To: <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
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


--66JlIddYdkNBaUXn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:26:15AM +0200, Mike Looijmans wrote:
> On 19-08-2025 09:51, Krzysztof Kozlowski wrote:
> > On 19/08/2025 09:46, Mike Looijmans wrote:
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - ti,tmds181
> > > > > +      - ti,sn65dp159
> > > > The driver contains:
> > > > +	{ .compatible =3D "ti,tmds181", },
> > > > +	{ .compatible =3D "ti,sn65dp159", },
> > > > +	{}
> > > > so why is a fallback compatible not suitable here?
> > > I don't understand the question. The two are slightly different chips,
> > Your driver says they are compatible. No one said the same, but compati=
ble.
> >=20
> > > so it makes sense to describe that in the DT.
> > Compatible devices should use fallback. There is plenty of examples (90%
> > of all binding files?) including example-schema describing this.
>=20
> Please help me out here, I'm happy to oblige, but I don't understand what
> you're asking.
>=20
> To the best of my knowledge "fallback" compatible is when you write
> something like this in the device-tree:
> =A0=A0 compatible =3D "st,m25p80", "jedec,spi-nor";
> Which means that we can use the "jedec,spi-nor" driver if there's no
> specific match for "st,m25p80", correct?
>=20
> I don't understand how that relates to your request, this is the first ti=
me
> I ever got this particular feedback. Looking at say the ti,sn65dsi83 driv=
er,
> it does the same thing (supports the ti,sn65dsi83 and ti,sn65dsi84).
>=20
> Please explain or point me somewhere where I can find this?

Devices that are supersets of, or functionally identical to, others should
use fallback compatibles. The driver treats these devices as functionally
identical to one another when it comes to match data (as there is none)
so you need to either use a fallback compatible or explain in your
commit message why one is not suitable here.

--66JlIddYdkNBaUXn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKSy2gAKCRB4tDGHoIJi
0jMkAP9NUxCGEjZ63zCEHXPLBh1Zxa6yjFr146a0y81NFbwSjAD/YzkXycwf8ncA
kcfhNlkqACOs8kQMNQf0M5TaGq44NAc=
=o59W
-----END PGP SIGNATURE-----

--66JlIddYdkNBaUXn--
