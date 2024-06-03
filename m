Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C442E8D8713
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 18:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CE210E260;
	Mon,  3 Jun 2024 16:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bu+lz/1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2510E260
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 16:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45E7B60ED6;
 Mon,  3 Jun 2024 16:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75055C32786;
 Mon,  3 Jun 2024 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717431728;
 bh=J9BtwLiH5m/8yi2TzzknIpSb4dbESwBD7BOkieFUAmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bu+lz/1XWvQlr8sMasYuBapx64iWXKhYYuE32EKqwkwTOey+HseXz0BB7MFLlI85O
 kPe8OuoeQLtatj+0dQnBSE11+aHY/uHissu22mA7QPGEup2Hllay2U8y+LkCtZp4DG
 3aefv6kQfoqF4xAaZe7pVlIWmWF9Y+GsLK2MFHFI5c7JgUKtJ0WrFs/K8XnjqwOkkr
 QQUfznd4Do66OiqXK5PtilHsFIryvPsWf1JLlvAjJh9pUXy6R4D1bjcz5BAa/bb2oq
 5pJ2MF5f1AcMYkEi5sQdEjOy3hr3+xaolC+z5Rg7kItsSw7297BoxsKLfJ0vkFmy3K
 V+pk2YU6AvVRw==
Date: Mon, 3 Jun 2024 18:22:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI
 TX Controller
Message-ID: <20240603-noisy-convivial-boa-d3d862@houat>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
 <11359776.NyiUUSuA9g@phil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hjyaj4zwc26gvppm"
Content-Disposition: inline
In-Reply-To: <11359776.NyiUUSuA9g@phil>
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


--hjyaj4zwc26gvppm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 03:03:12PM GMT, Heiko Stuebner wrote:
> Am Montag, 3. Juni 2024, 14:14:17 CEST schrieb Andy Yan:
> > Hi Neil:
> >=20
> > On 6/3/24 16:55, Neil Armstrong wrote:
> > > Hi Christian,
> > >=20
> > > On 01/06/2024 15:12, Cristian Ciocaltea wrote:
> > >> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> > >> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
> > >>
> > >> It is HDMI 2.1 compliant and supports the following features, among
> > >> others:
> > >>
> > > .
> > >=20
> > > ..
> > >=20
> > >> * SCDC I2C DDC access
> > >> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> > >> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> > >> * Multi-stream audio
> > >> * Enhanced Audio Return Channel (EARC)
> > > -> Those features were already supported by the HDMI 2.0a compliant H=
W, just
> > > list the _new_ features for HDMI 2.1
> > >=20
> > > I did a quick review of your patchset and I don't understand why you =
need
> > > to add a separate dw-hdmi-qp.c since you only need simple variants of=
 the I2C
> > > bus, infoframe and bridge setup.
> > >=20
> > > Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller =
version
> > > detectable at runtime ?
> > >=20
> > > I would prefer to keep a single dw-hdmi driver if possible.
> >
> > The QP HDMI controller is a completely different variant with totally d=
ifferent
> > registers layout, see PATCH 13/14.
> > I think make it a separate driver will be easier for development and ma=
intenance.
>=20
> I'm with Andy here. Trying to navigate a driver for two IP blocks really
> sounds taxing especially when both are so different.

If it's a completely new controller, I agree that it needs a new driver,
but then why do we need to share code between the two?

Maxime

--hjyaj4zwc26gvppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl3tqAAKCRAnX84Zoj2+
dtR8AYCrl/MU0AvHJWAGUIyy2KX4WDHpvmSlO0r/dHofLBLuPbECLxs/Y4Xrv9aj
dKaN4FEBgKcHcNQQuLzVnSmBEdP8BYecOgEiTEgRvexLG3nvcO9BpScGHjOp+i9W
SoX1pl9lAQ==
=Yfg6
-----END PGP SIGNATURE-----

--hjyaj4zwc26gvppm--
