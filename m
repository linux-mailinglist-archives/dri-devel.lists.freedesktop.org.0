Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F98CC41E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 17:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07D10EEBF;
	Wed, 22 May 2024 15:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4NYcg31O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E082910E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716391918;
 bh=kUTVaEv+CluhtL7Oa3Hy8QzRC+vL3NJAb+fI1CqZcJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=4NYcg31OsYHSC+HF3tIyiUc8hndE22wxc7pw+Q//fSm65c4ZbKpBNGiXNEakYxEKh
 kFWIaK4OWeKsH84HGAYssMKq5MBRpgzAoN1s03GfYY7LGjcjXBPiiVrMAD8HqMxS7q
 viLAhoCr/Nz8JNU7TxFJ0vq2SkqG3bLvrrb+seTGVSE3CRBVotdfU6equ9jLzrF5Bn
 Am5+q5tl0byg9K2Sn+vTLN20ze4856ucuQbsxGdS5+X56VQmtzLdUY1hg6YUGAzqjo
 ozxWLSPJUKpRuDwxk24x483I5nOEfa9oUMRoUr7AZ006YwG2xkAqMZMkJO6GKoV9Ja
 /GxF7YCrLeABQ==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BE6243782170;
 Wed, 22 May 2024 15:31:55 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: vop2: Add VP clock resets
Date: Wed, 22 May 2024 11:31:36 -0400
Message-ID: <3334403.5fSG56mABF@arisu>
Organization: Collabora
In-Reply-To: <20240521-silver-exciting-bb3725dc495d@spud>
References: <20240514152328.21415-1-detlev.casanova@collabora.com>
 <13628421.uLZWGnKmhe@arisu> <20240521-silver-exciting-bb3725dc495d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6053228.MhkbZ0Pkbq";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart6053228.MhkbZ0Pkbq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Conor Dooley <conor@kernel.org>
Date: Wed, 22 May 2024 11:31:36 -0400
Message-ID: <3334403.5fSG56mABF@arisu>
Organization: Collabora
In-Reply-To: <20240521-silver-exciting-bb3725dc495d@spud>
MIME-Version: 1.0

On Tuesday, May 21, 2024 2:31:51 P.M. EDT Conor Dooley wrote:
> On Tue, May 21, 2024 at 01:15:46PM -0400, Detlev Casanova wrote:
> > On Wednesday, May 15, 2024 12:33:22 P.M. EDT Heiko St=FCbner wrote:
> > > Am Mittwoch, 15. Mai 2024, 18:19:29 CEST schrieb Conor Dooley:
> > > > On Tue, May 14, 2024 at 11:19:47AM -0400, Detlev Casanova wrote:
> > > > > Add the documentation for VOP2 video ports reset clocks.
> > > > > One reset can be set per video port.
> > > > >=20
> > > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > >=20
> > > > Are these resets valid for all VOPs or just the one on 3588?
> > >=20
> > > Not in that form.
> > > I.e. rk3588 has 4 video-ports (0-3), while rk3568 has 3 (0-2).
> > >=20
> > > So the binding should take into account that rk3568 also has the
> > > SRST_VOP0 ... SRST_VOP2.
> >=20
> > That is what is set in the example and the reason why I set minItems to=
 3
> > in the main bindings.
> > Then, the rk3588 specific part sets it to 4.
> >=20
> > Isn't that enough ?
>=20
> Not quite - you need to restrict maxItems to 3 for the other devices if
> the clocks are not valid. What you've got says that 4 clocks are
> possible but not needed on !rk3588.
>=20
> Cheers,
> Conor.

I don't understand what "properties: resets: minItems: 3" means then. I=20
thought it means that all devices should have at least 3 resets. Then the=20
allOf below specifies the special case of rk3588 which has a minimum of 4=20
resets.

Do I need to add=20
        resets:
          minItems: 3
        reset-names:
          minItems: 3
in the "else:" ?

So in that case, I can remove "properties: resets: minItems: 3" above ?

Also, what do you mean "If the clocks are not valid" ?

Detlev.


--nextPart6053228.MhkbZ0Pkbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZOD9gACgkQ5EFKUk4x
7bY7TQf+JupJtDv/HvUIX8L38oBOIr0TEHcquMrWumq4ACE/y2HjwxHAhYw7NufO
qC1OuNVis+e3pQ5kqoy5z9iNiyvA8weC2Uu2Ig0UgtdLPwhf88oj9IxHr9OtzY0J
Z1019PaHyov5yb3copVh66aW8rtadOKfNCio2F+zSNITxfwzdFJJ3pbk5JqHf4de
06zd16nvuYlQ6IUoony8xKi+NfJICvmo8XvR/UR5EEtlYPto8SnLPhqRw+vbRe4U
Bia87NTBM9o7bkq8kk00EOyO+PDEYlg3AU5mGLnnf0ES5kZPa10EDHJQZ1SHeM8k
sUP3VPs8I/S9Jk1QMusS6foYdtbshQ==
=vt+N
-----END PGP SIGNATURE-----

--nextPart6053228.MhkbZ0Pkbq--



