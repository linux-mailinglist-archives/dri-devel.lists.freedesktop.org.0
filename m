Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D182C13D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6274E10E124;
	Fri, 12 Jan 2024 13:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F060310E124
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9F20CE2253;
 Fri, 12 Jan 2024 13:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128A9C43390;
 Fri, 12 Jan 2024 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705067947;
 bh=oMZ81G+ISx28UspkijwH23mXsSLB67wCS+jmcXwB6yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtVdOY5/OXfe3N1BykNwp68hEIs60DIJYDyl+AlX0nCj9eJxFKR5OiAS5jEmtiai7
 Lh5w0lq3TuoU/0QWJcTlMBDth5cQc4SoeFJDSX0C2hMy34NA6bN0e+zQOVxHqu2mrU
 gkS7MFmC0XPxQ0PWhdoksLauX9kABC5Tujy2/8RWZ/uwbnusqCBH/mlViwVJmNO3X7
 /BCC/5yZTFcUJhuCGADzM8KoVYAH3Lt6XgnvyGwV3XGEAj/POqc2S9bd+Y2kmOgl7i
 H0F2Zo4xgYbBckgUw41Ctigvb4MImw8NBqvdZBO/qk7zPZaEn3Sg+iuAshdqiTOdkm
 eLurRwbq/0TRQ==
Date: Fri, 12 Jan 2024 14:59:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <337mubsn42zlpuoqqvqmsjtdww4kg3x6lo6brdos5o6xgwjdwo@cxfad2pk2so2>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <CAPY8ntCs9EAYsxwjkscms3kqoC0N8+CcTHoyrG+gFMc0Mh=cwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qktymaok2b34jnq7"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCs9EAYsxwjkscms3kqoC0N8+CcTHoyrG+gFMc0Mh=cwg@mail.gmail.com>
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


--qktymaok2b34jnq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, Dec 14, 2023 at 02:43:37PM +0000, Dave Stevenson wrote:
> On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > The i915 driver has a property to force the RGB range of an HDMI output.
> > The vc4 driver then implemented the same property with the same
> > semantics. KWin has support for it, and a PR for mutter is also there to
> > support it.
> >
> > Both drivers implementing the same property with the same semantics,
> > plus the userspace having support for it, is proof enough that it's
> > pretty much a de-facto standard now and we can provide helpers for it.
> >
> > Let's plumb it into the newly created HDMI connector.
>=20
> To have such a significant proportion of the patch being kunit tests
> when there was no reference to such in the commit text was slightly
> unexpected.

Thanks for your review. Does that mean that you would prefer the tests
to be in a separate patch?

Maxime

--qktymaok2b34jnq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaFFqAAKCRDj7w1vZxhR
xaVsAQCQvfIMIrKA7nqrSHokMD20be4Xcm2T84v3PW9kS4jdiAD/Qli9xSKrx6Q9
1g/aGgxA2VDLSgq0Ag5FVT+HFhvA9gE=
=hMit
-----END PGP SIGNATURE-----

--qktymaok2b34jnq7--
