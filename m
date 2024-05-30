Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04908D4E87
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 17:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138410F0AE;
	Thu, 30 May 2024 15:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AU0I+LOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BD910F923
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 15:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 74157CE1A99;
 Thu, 30 May 2024 15:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CACC2BBFC;
 Thu, 30 May 2024 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717081211;
 bh=N06xxei0qF8YHD3ORAekKVfJgal94rp85DJmIMXMFWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AU0I+LOT/hP1jltG1OPWDvFidJM9jpvcWvgvANWvwKs00hU3mF8q4qlfJwt97SfrZ
 +UVjnfaX3G4/hNxtns+OMTwzPxNyY0fWvF1FJ323WeoqJbxFHLUg0eCxxHaBFD89Xu
 4ek2jSsvGIsepfpviP51d2EqNxIolJqpjb6Uw/5kk/tZBzqmPU4yARM7+DqDoDhACJ
 n3+i1pz3yKjGWpSCf5njr/VK2oBsQtKl6Kci4+vfq0v2TMiovbKSCzUD0x+YNM1jM7
 VhfvXRZF1IXJjThO8OAgM4N5DoVEFw8dzT6hgccmwvhWo2DUhDjnNpzqQFFc/v2095
 heGJihWihnA/w==
Date: Thu, 30 May 2024 17:00:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <20240530-hasty-dog-of-imagination-dbeedd@houat>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
 <20240528-prophetic-masterful-hyrax-563f82@houat>
 <6d2789e1-b14a-4b65-95ce-60d23e49465e@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xh2r67rrx46c5nxv"
Content-Disposition: inline
In-Reply-To: <6d2789e1-b14a-4b65-95ce-60d23e49465e@freebox.fr>
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


--xh2r67rrx46c5nxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 01:39:52PM GMT, Arnaud Vrac wrote:
> On 28/05/2024 11:17, Maxime Ripard wrote:
> > On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
> > > On 28/05/2024 09:43, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> > > > > From: Arnaud Vrac <avrac@freebox.fr>
> > > > >=20
> > > > > The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver suppo=
rting
> > > > > DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> > > > >=20
> > > > > Since it's an I2C-programmable bridge, it could have a proper dri=
ver,
> > > > > but the default settings work fine, thus simple bridge is suffici=
ent.
> > > >=20
> > > > No it doesn't. That bridge supports HDMI 2.0 which means you'll nee=
d to
> > > > change the TMDS clock ratio when programming a TMDS character rate
> > > > higher than 340MHz. And you'll need hotplug support to deal with it
> > > > properly too.
> > > >=20
> > > > So sorry, you need a real driver there.
> > >=20
> > > Hello, this is an HDMI redriver, which simply cleans up the HDMI
> > > signal, so no programming is needed to support HDMI 2.0.
> >=20
> > I mean, if I'm to trust the datasheet, it is more complicated than that.
> > It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
> > sent on its input side, but that wouldn't happen with DP for example.
> >=20
>=20
> That's a use case we can't test and will never use as a device
> integrator, unfortunately.
>
> To support our simple HDMI redriver use case, would it be ok to write
> a driver just handling power up with documented bindings with the chip
> default settings ? Someone with an actual need for more specific
> setups could then implement the additional code needed to support
> that. The bindings could be extended without breaking compatibility.

Sure, that's what I meant. We need to make sure the binding is
extensible enough / take all the possibilities into account, but the
driver can definitely be minimal.

Maxime

--xh2r67rrx46c5nxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZliUcQAKCRAnX84Zoj2+
dpYkAX9yICA32oFaECUmgpYPIp54Wmw0fzMRAqprJ1PUnWOpqxWJcS0hSYYUlwE4
tGO9JvkBgI+XGD1BiUtzfm3SAkQf9lC4jNZVLGLC0Dq4d/MHm5NEATgaOnCTLxo1
q8PiWkbDpg==
=9Ex0
-----END PGP SIGNATURE-----

--xh2r67rrx46c5nxv--
