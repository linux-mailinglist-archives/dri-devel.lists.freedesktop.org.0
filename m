Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CB95A0EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 17:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029A10E080;
	Wed, 21 Aug 2024 15:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E9ce13Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6C210E080
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 15:08:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9977A6104F;
 Wed, 21 Aug 2024 15:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27247C32781;
 Wed, 21 Aug 2024 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724252881;
 bh=BmuSPqL3do4aQAU03Wh1Ei296IH0Aok8vWYlYeXbHII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E9ce13EpwGJfNj/fz3ek0H9T6tqfzB2Ang4VBOW3wXpl3SNY56ugAkcScdpvW2mYq
 pRGIpCkIm4Js0Nl1dFSO928N+kkfOqYD4mSc6mUyjW1ORGtmC+Tu0ujQ4GOjwMuxWI
 5n+aHpbO2N/M/0f6Lf/rnWBjGY4xq2Q1hfqpH8p9BTAb8Yv3Ol1D2AfosnGjMY3T6p
 26Azakecgn5Oj0LzRFL0QDOJQzZJ9wrwApBr2QlPWhyK3WKTAaomkPhdRcL4LGMxXg
 7HN6TlatXlE/NiT7yCYl2XfS0M0lWkgfCcPkmCA5OFaDCgvpzNc5Iu9gJIDnNY3vJ8
 SrcPlvCQfZ92g==
Date: Wed, 21 Aug 2024 16:07:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
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
Message-ID: <20240821-evoke-mop-fb09ceef3597@spud>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-3-6417c72a2749@collabora.com>
 <20240819-bobbing-purplish-99e48baa2304@spud>
 <ec84bc0b-c4c2-4735-9f34-52bc3a852aaf@collabora.com>
 <20240820-tropics-hunchback-6fdcd0b37f91@spud>
 <038073d0-d4b9-4938-9a51-ea2aeb4530f6@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZZq5NLhTZdZIQco9"
Content-Disposition: inline
In-Reply-To: <038073d0-d4b9-4938-9a51-ea2aeb4530f6@collabora.com>
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


--ZZq5NLhTZdZIQco9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:12:45PM +0300, Cristian Ciocaltea wrote:
> On 8/20/24 7:14 PM, Conor Dooley wrote:
> > On Tue, Aug 20, 2024 at 03:37:44PM +0300, Cristian Ciocaltea wrote:
> >> On 8/19/24 7:53 PM, Conor Dooley wrote:
> >>> On Mon, Aug 19, 2024 at 01:29:30AM +0300, Cristian Ciocaltea wrote:
> >>>> +  rockchip,grf:
> >>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>> +    description:
> >>>> +      Most HDMI QP related data is accessed through SYS GRF regs.
> >>>> +
> >>>> +  rockchip,vo1-grf:
> >>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>> +    description:
> >>>> +      Additional HDMI QP related data is accessed through VO1 GRF r=
egs.
> >>>
> >>> Why are these required? What prevents you looking up the syscons by
> >>> compatible?
> >>
> >> That is for getting the proper instance:
> >=20
> > Ah, that makes sense. I am, however, curious why these have the same
> > compatible when they have different sized regions allocated to them.
>=20
> Good question, didn't notice.  I've just checked the TRM and, in both
> cases, the maximum register offset is within the 0x100 range.  Presumably
> this is nothing but an inconsistency, as the syscons have been added in
> separate commits.

Is that TRM publicly available? I do find it curious that devices sound
like they have different contents have the same compatible. In my view,
that is incorrect and they should have unique compatibles if the
contents (and therefore the programming model) differs.

>=20
> >> 	vo0_grf: syscon@fd5a6000 {
> >> 		compatible =3D "rockchip,rk3588-vo-grf", "syscon";
> >> 		reg =3D <0x0 0xfd5a6000 0x0 0x2000>;
> >> 		clocks =3D <&cru PCLK_VO0GRF>;
> >> 	};
> >>
> >> 	vo1_grf: syscon@fd5a8000 {
> >> 		compatible =3D "rockchip,rk3588-vo-grf", "syscon";
> >> 		reg =3D <0x0 0xfd5a8000 0x0 0x100>;
> >> 		clocks =3D <&cru PCLK_VO1GRF>;
> >> 	};


--ZZq5NLhTZdZIQco9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsYCyQAKCRB4tDGHoIJi
0hCkAQDkrev2VngE+toZCyW7CBqkBdnhvbudk6uduFmusUQTeQD9E7e4awSNcV4K
3sLyRNFdK2Rcc/ulk7eGAuyO21QDmAM=
=e4n+
-----END PGP SIGNATURE-----

--ZZq5NLhTZdZIQco9--
