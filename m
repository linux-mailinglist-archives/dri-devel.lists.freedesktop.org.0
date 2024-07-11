Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72492E3EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407910E2F1;
	Thu, 11 Jul 2024 09:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fjUl7Uzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF710E2F1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:58:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB9FC603F7;
 Thu, 11 Jul 2024 09:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B68C116B1;
 Thu, 11 Jul 2024 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720691922;
 bh=WuvcPyYCPZVdObRzkt1wRjrxvRBYyt8oPc8M1YvBhVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjUl7UzbTkgcD0Civgq2Uxe04S1u/b2s/CouNh2KieybTTl/KucwfS3DvVk/9bw6s
 rx26o1bt0Ua9bmgwSefq3HyJAPZkdTdd0vDQ053QjgqP2uz5juuvweRlmwtyaxS2Sl
 XoqaIkWf9Y4SPs4YL8+82EvPZyOJUscsGyEx1elWOlPohA5xqJMOc2y05BkbFtfs6S
 72wgve9PkMUu/qF2QDn3QBJNOJfV25IQa9ktYi3U7+r0PDopXyfhTBms6Xgc3TKV42
 MC8lowyAZwxe95VnPCIAyZm5gK/nOlXnaC3XfrghD/+y6Vys7qtIpJ6FLWHUP9bKIh
 JuFdcwI7la6HA==
Date: Thu, 11 Jul 2024 10:58:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manikandan.M@microchip.com, Hari.PrasathGE@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@armlinux.org.uk,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, arnd@arndb.de, Jason@zx2c4.com,
 palmer@rivosinc.com, mpe@ellerman.id.au, rdunlap@infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Message-ID: <20240711-freezing-decrease-4807d5d62f2a@spud>
References: <20240704084837.168075-1-manikandan.m@microchip.com>
 <20240704084837.168075-3-manikandan.m@microchip.com>
 <9ef5a1ba-e404-46e0-8513-5fffbfb5618b@kernel.org>
 <aeaeb5d4-5e55-4a7a-bce7-fa207ebf0616@microchip.com>
 <4c1b7af7-e53c-492a-9c41-40cad78f7666@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EWu0S0GtGVx/Ra1x"
Content-Disposition: inline
In-Reply-To: <4c1b7af7-e53c-492a-9c41-40cad78f7666@kernel.org>
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


--EWu0S0GtGVx/Ra1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 11:05:37AM +0200, Krzysztof Kozlowski wrote:
> On 11/07/2024 10:30, Manikandan.M@microchip.com wrote:
> > Hi Krzysztof,
> >=20
> > On 04/07/24 4:27 pm, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
> >>
> >> On 04/07/2024 10:48, Manikandan Muralidharan wrote:
> >>> Add the Microchip's DSI controller wrapper driver that uses
> >>> the Synopsys DesignWare MIPI DSI host controller bridge.
> >>>
> >>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >>> ---
> >>
> >>
> >> ...
> >>
> >>> +
> >>> +#define HSTT(_maxfreq, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp)      =
 \
> >>> +{                                    \
> >>> +     .maxfreq =3D _maxfreq,            \
> >>> +     .timing =3D {                     \
> >>> +             .clk_lp2hs =3D _c_lp2hs,  \
> >>> +             .clk_hs2lp =3D _c_hs2lp,  \
> >>> +             .data_lp2hs =3D _d_lp2hs, \
> >>> +             .data_hs2lp =3D _d_hs2lp, \
> >>> +     }                               \
> >>> +}
> >>> +
> >>> +struct hstt hstt_table[] =3D {
> >>
> >> So more globals? No.
> >=20
> > In the sam9x7 datasheet, the high speed transition time for data and
> > clock lane at different freq for the DSI controller ranges are tabulated
> > with constant values.
> > I referred other similar platforms for the functionality and found=20
> > similar way of implementation,  only a few had equations to derive the=
=20
> > low power and high speed timings.I am not able to come up with a more=
=20
> > efficient method. If there is something I am missing, please suggest.
> > TIA
>=20
> Yeah, this should not be a global. Nothing above suggests it.

I think what Krzysztof is suggesting here is use of the static
keyword...

>=20
> BTW, no W=3D1 clang warnings? Are you sure?
>=20
> Best regards,
> Krzysztof
>=20

--EWu0S0GtGVx/Ra1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo+sygAKCRB4tDGHoIJi
0gtxAQD5lJOy/q4aES6K9CjXBUSnOWaI63qOFMdQ616WHgo78wD9FOHchUgSltnR
kDI6geXp0AJKzlBkFd7UwEarIdbUJAc=
=Ikhe
-----END PGP SIGNATURE-----

--EWu0S0GtGVx/Ra1x--
