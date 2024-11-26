Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD229D9AA1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 16:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256C810E8F8;
	Tue, 26 Nov 2024 15:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8xuwu7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175B810E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 15:49:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3E6AA4068C;
 Tue, 26 Nov 2024 15:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2231EC4CECF;
 Tue, 26 Nov 2024 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732636193;
 bh=6Rt7X6trwtI4ie0hc51FZJdn4GbvbMtfe8wO6UjtBzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8xuwu7sljAdjyfrf+RgyQtiiUPiAvBND0E7GJKfgtMXKO7b2Dirk9Z69rkLX5U93
 9oL+NRUzPoh8B66YJTC4vdSy0qsyqrqF23DrC+klqLF02NtyfX2TsVl8bJnovzIK8I
 qbQJhIVt7w4Etk2f1T8ISxhrDbbx7YpoHn6aaTB+X3i78RofhU4tnTyNY1TFHsqD21
 iUWgLBqJyuYVgi/a8Ypn/ylYz+u5T3thSUKT5f0OX3evZi2d92ZMdojGOTg+QjBnVv
 zhUujVEK0bnX655teG4S/T2pY68QY3aqPeGlierI88/+395AN7zrwztaWvOVxiY4R3
 jAvEAgdK+9bHg==
Date: Tue, 26 Nov 2024 16:49:50 +0100
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
Message-ID: <20241126-tentacled-busy-catfish-c451fc@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
 <871pyyxjwz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g7loz4mo7azlnu2z"
Content-Disposition: inline
In-Reply-To: <871pyyxjwz.fsf@intel.com>
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


--g7loz4mo7azlnu2z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 02:24:12PM +0200, Jani Nikula wrote:
> On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
> >> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> >> > I wonder about the naming though (and prototype). I doesn't really
> >> > validates a mode, but rather makes sure that a given rate is a good
> >> > approximation of a pixel clock. So maybe something like
> >> > drm_mode_check_pixel_clock?
> >>=20
> >> Quoting myself from a few weeks back:
> >>=20
> >> """
> >> Random programming thought of the day: "check" is generally a terrible
> >> word in a function name.
> >>=20
> >> Checking stuff is great, but what do you expect to happen if the check
> >> passes/fails? Do you expect the function to return on fail, or throw an
> >> exception? Or just log about it? If you return a value, what should the
> >> return value mean? It's hard to know without looking it up.
> >>=20
> >> Prefer predicates instead, is_stuff_okay() is better than
> >> check_stuff(). Or assert_stuff() if you don't return on failures.
> >> """
> >
> > Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> > you want to return a mode status enum, I don't think they are better
> > names.
>=20
> Most functions returning enum drm_mode_status are called
> something_something_mode_valid(). Not check something.

But it doesn't check whether the mode is valid or not. It checks whether
a given clock rate is within reasonable tolerance from the expected
pixel clock.

Maxime

--g7loz4mo7azlnu2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0XuHgAKCRAnX84Zoj2+
dohPAX0YE0oc7Ylv3K+UerPmQNwXmwiAn6twEbExXtsLUXP4id5aKXyzo9JTq04u
X1BMcUcBeKSLYRTuhVuJctlLHOuKqmXClpJuleYA41+uZ/r34Z8EwLT1++YgVE/q
CITAXPq+
=/XnF
-----END PGP SIGNATURE-----

--g7loz4mo7azlnu2z--
