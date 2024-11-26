Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E69D9702
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C9E10E245;
	Tue, 26 Nov 2024 12:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZJYxmWMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9714810E245
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 12:10:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75C565C4C12;
 Tue, 26 Nov 2024 12:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4227AC4CECF;
 Tue, 26 Nov 2024 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732623002;
 bh=X1ZW6fAmw9BsbKNLM84F8Yh9PGsgTv9DvBZGDJRKcPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJYxmWMrgHFfFMx4SZZpmRSPoxZkpZdW9Fzl0DNJVl9iZcJ9LACkFNimQ/Zl9Ggy3
 SYCmCDCBy3wYS/4BAHyvqBSpdevfR2A8+Cl0poDBsaqFAiVPtYI4ZQNn2Ms/nXmQS5
 B/UrH8sh1oOZZQLERhS2NMh5SThIcY98v8FukZxyJm5VP1r2O666m32kVPiCbDWwMI
 NeeMi+iCzohnE5XpteEv/7Om1Ca0sbx5DmiPYy2VCMROZDM0dKBJnbXfWeQXAyW6i1
 GaqOFZ7w3KO5d/7R8FWJR/goyXglI4rOOwcqF6zVI3DKQH1O1UjUQx+UM9YEv1s9DQ
 YGDLHXsFjAikA==
Date: Tue, 26 Nov 2024 13:09:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Nyekjaer <sean@geanix.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qwww7zw5ccyu53nk"
Content-Disposition: inline
In-Reply-To: <874j3uxptp.fsf@intel.com>
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


--qwww7zw5ccyu53nk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > I wonder about the naming though (and prototype). I doesn't really
> > validates a mode, but rather makes sure that a given rate is a good
> > approximation of a pixel clock. So maybe something like
> > drm_mode_check_pixel_clock?
>=20
> Quoting myself from a few weeks back:
>=20
> """
> Random programming thought of the day: "check" is generally a terrible
> word in a function name.
>=20
> Checking stuff is great, but what do you expect to happen if the check
> passes/fails? Do you expect the function to return on fail, or throw an
> exception? Or just log about it? If you return a value, what should the
> return value mean? It's hard to know without looking it up.
>=20
> Prefer predicates instead, is_stuff_okay() is better than
> check_stuff(). Or assert_stuff() if you don't return on failures.
> """

Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
you want to return a mode status enum, I don't think they are better
names.

Maxime

--qwww7zw5ccyu53nk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0W6lwAKCRAnX84Zoj2+
dpfkAX9rQ95STenTbFaPTqzNs0f3hXHKnVKDzQwlwme3v/FEzAw3GEWZWO1BNFdE
ChoLbYwBf06ASgUEBRxVk52nFUsJogUobfhi2/VS/xGu8+SOUnSsG50ueId2dS+n
zeEpgo7ogA==
=OHka
-----END PGP SIGNATURE-----

--qwww7zw5ccyu53nk--
