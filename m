Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC5C806F7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 13:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364F10E23D;
	Mon, 24 Nov 2025 12:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FOW8LXM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6842910E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 12:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DFDC440E87;
 Mon, 24 Nov 2025 12:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABBEC4CEF1;
 Mon, 24 Nov 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763986811;
 bh=/Yj6YE4nwthYIL0rOIKkvsqhHOAJVwTXZM7e6cPjilI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FOW8LXM6jn+tyShA7JzzS7B75rWdGAjSbVmsNC7op1FkTrHLxbqL056CpUrHTOaAt
 Fmo0V/XYMdFbgaqArrJxeJmlocKsGcE+x3XN/YvFQWtP6cvwA/VWdG5JqWo0T7qf0i
 jspUtiynQyQGf1MTZkUTC8MhxQx1NDQsAnZvXC+4q/REblJHzdxed1VBecfN8Zgzml
 38YrA3tOYAVqq9rt6avIhg6TmPxGEUQ9QfWezFxniOkuTAJEmfVrHKINKtRgwOd7W1
 q70gB+M8/fT5A13BDmWFTWaOQpDjpiPnQ4AWNah9S5GEXbYeRs9whu27vLViO9fmZi
 F5oC6MKpai3Bg==
Date: Mon, 24 Nov 2025 12:20:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251124-pulp-pound-a2b6d749dcfc@spud>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
 <20251124-said-overvalue-8a8f49d6c99d@spud>
 <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kdnfVisB77n/BULr"
Content-Disposition: inline
In-Reply-To: <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
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


--kdnfVisB77n/BULr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 01:08:00PM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2025 13:05, Conor Dooley wrote:
> >=20
> > I don't really get what the fuss is with the dual signoff, what's the
> > point having both when they represent the same person? Pretty sure it
> > was you (Krzysztof) and Arnd that told me not to both doing the double
> > signoff.
>=20
> I do not object having or not having dual signed off HERE.
>=20
> I never said that. Just like I never said "From" has to be changed.

I didn't say you objected to both being there. *I* am saying that it is
probably not worth doing. That's especially the case when it is adding
complication about correct ordering of signoffs and maybe interacting with
how git-send-email decides to insert From: fields.

> So repeating THIRD time: sender's SoB cannot be somewhere else than the
> last one.
>=20
> ... and before you attribute me another thing I did not say - if you
> change the "From" field, rules will be different a bit...



--kdnfVisB77n/BULr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSRNdAAKCRB4tDGHoIJi
0ptBAP956X1zit1/KmamkExrxDO5JHMTMOIMyhqNrJtUut8iogEA/6YMiCwput82
DBhi2ECBNDPoqb3RvOun1DrwHY3DUA4=
=uorq
-----END PGP SIGNATURE-----

--kdnfVisB77n/BULr--
