Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A655F812AA7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0360610E8F4;
	Thu, 14 Dec 2023 08:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3772110E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6023161D65;
 Thu, 14 Dec 2023 08:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2380C433C8;
 Thu, 14 Dec 2023 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702543685;
 bh=bWHJ2nEewYvkEMXif5fsymjDtt1zbVHkI49YReVBsDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPD0dHulfnGTLBExOIGRTAfiqj1Qk7C1wGbXEFFA+Pt+rXyiZAj7vbwEaxmbG0WwT
 fXFFyJk+4cXRjuEuZOaIW2zJfaQWQVhtRrRRMs9UBCIfoOA/vwGoNjuOsMobs2oBCm
 /x6JnOvRPji6GrvOos2Yw0oUNQ7Twg7kRtElj5s2rVwBJyXcyMMHWXpshWSCkkceSt
 DYWU1oSq1eOTpMnCRdiI6PV+tNisgz0AazAxpQrLs1AbDcui/7JAAaAoEKbqsOi4RV
 TbFefK+3/aSdO1enpIiXwv3fnydWvBXHZc2tXzUZCp7iO2AVsS4o+JMKrdmlVqf3VR
 5MriRhjZBtS9w==
Date: Thu, 14 Dec 2023 09:48:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state
 implementation
Message-ID: <rr5wvkunjglkxozfsvf5zvffwzznq6zt5mzvxw5rx2rpyfzecb@kauuy72x43gj>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
 <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="34euckmdvwkupler"
Content-Disposition: inline
In-Reply-To: <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--34euckmdvwkupler
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Dec 12, 2023 at 11:40:26AM +0000, Dave Stevenson wrote:
> On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Even though we were rolling our own custom state for the vc4 HDMI
> > controller driver, we were still using the generic helper to destroy
> > that state.
> >
> > It was mostly working since the underlying state is the first member of
> > our state so the pointers are probably equal in all relevant cases, but
> > it's still fragile so let's fix this properly.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks for the review, I've applied that patch now.

Could you also review the framework changes (patches 6 to 16) ?

Thanks!
Maxime

--34euckmdvwkupler
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXrBQgAKCRDj7w1vZxhR
xRk8AQDdN5Neajg11B6buyB2iqOXxDC3Ad8XCWlmcjkK9I1jTQEAv+RIYp6M3cV0
8PQqOi1QiT/3hX+WMjreXGSqFUgQCg8=
=hVnz
-----END PGP SIGNATURE-----

--34euckmdvwkupler--
