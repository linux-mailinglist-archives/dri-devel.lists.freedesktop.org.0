Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E6962059
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108B10E4B6;
	Wed, 28 Aug 2024 07:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="esYHkB6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABD410E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:07:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 261CDCE1796;
 Wed, 28 Aug 2024 07:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B47BC4DDE1;
 Wed, 28 Aug 2024 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724828514;
 bh=lQiulJwvsvCv4CFlRZOv9pbsAf4sVqJlM4BbsK7REJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=esYHkB6H2mrguuEoEHqpuqrTSuoPK/dLWLJDkS66I61CJ6+3NFLp2TwEBqTRKmk0C
 4PikCxfzC/Wbj/9N0IhMa/WwK6zhzhdMegbwVIIADvabeXk5q0mKli5tYAGHUR1qFY
 Oz+H63QFpsKVVoxjAbCrU2Xz9jjXNp8eL44QmriNSuWd6wx2zaXlB5VSn+58RknP2J
 /4wDtHsvLhDlVLoPSmXzIaVAIG3R2QaFXyEzeyD0+LbVoACK8auKItxM+VSZuu/1iY
 7utcGaarhlEmNsHWdTqDco5eM+K7lTHHbrzhKwi4hppHYJAJRY8hMtiju05YCdCxyJ
 6fNYdQFFs3yHw==
Date: Wed, 28 Aug 2024 09:01:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ryan Walklin <ryan@testtoast.com>, Conor Dooley <conor@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
Message-ID: <20240828-aboriginal-vivid-goldfish-3ee4fc@houat>
References: <20240626112005.248576-1-ryan@testtoast.com>
 <20240626112005.248576-2-ryan@testtoast.com>
 <a4d33da3-2a2a-48ce-874d-95a5889f2f1f@linaro.org>
 <20240626-loyal-squirrel-of-charisma-4e784f@houat>
 <20240626-procreate-goldmine-800179f909e9@spud>
 <20240627-muskox-of-nonconcrete-art-e4bcfd@houat>
 <8b4519fc-0fba-48fe-bfb4-318818b47a65@app.fastmail.com>
 <d9686280-5514-49ab-91b8-0737141178ce@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3lhi2rphdmmo7pit"
Content-Disposition: inline
In-Reply-To: <d9686280-5514-49ab-91b8-0737141178ce@linaro.org>
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


--3lhi2rphdmmo7pit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 06:28:21PM GMT, Neil Armstrong wrote:
> On 30/06/2024 10:16, Ryan Walklin wrote:
> > On Fri, 28 Jun 2024, at 5:59 AM, Maxime Ripard wrote:
> > > On Wed, Jun 26, 2024 at 04:34:11PM GMT, Conor Dooley wrote:
> > > > On Wed, Jun 26, 2024 at 05:04:19PM +0200, Maxime Ripard wrote:
> > > > > On Wed, Jun 26, 2024 at 02:25:54PM GMT, Neil Armstrong wrote:
> > > > > > Can it be more specific ? because there's a lot of rg35xx defin=
ed in bindings:
> > > > > >   anbernic,rg351m
> > > > > >   anbernic,rg351v
> > > > > >   anbernic,rg353p
> > > > > >   anbernic,rg353ps
> > > > > >   anbernic,rg353v
> > > > > >   anbernic,rg353vs
> > > > > >   anbernic,rg35xx-2024
> > > > > >   anbernic,rg35xx-plus
> > > > > >   anbernic,rg35xx-h
> >=20
> > Just to note only the three rg35xx-* devices use this particular panel.
> >=20
> > > > >=20
> > > > > Yeah, if we have an identified model name, we should probably use=
 that,
> > > > > with a comment that we couldn't figure out what the vendor was an=
d thus
> > > > > went for anbernic.
> > > >=20
> > > > What's wrong with using the wl name that already exists as the mode=
l?
> > > > Using rg<whatever>-panel is total invention on our part, especially
> > > > seeing as the commit message says that multiple models can use it.
> > >=20
> > > Yeah, that makes sense, sorry for the noise
> > >=20
> > Thanks both for the further feedback, agreed logical to use the
> > device vendor and panel serial number, ie "anbernic,wl-355608-a8".
> > Will post a V2 with a comment to that effect.
>=20
> Well in this case we can keep "wl-355608-a8", because the panel vendor
> _is not_ anbernic.

And it's not a generic or ubiquitous device either. We've been over
this already, anbernic is the best we have.

Maxime

--3lhi2rphdmmo7pit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs7LWQAKCRAnX84Zoj2+
dunxAXsHn0+ylT8fGwRjCkwWHKwJrjM+1y4RnvfxB4kaXvhLuIvX4wln2mHf/Lyp
KnWB4JMBfjttoc2w0VPVwj180Hz2ytPvzPLxXtWIQ4+42ASGCmQ4TmZGbcNaYjYm
Sg77K/NRPg==
=m3YX
-----END PGP SIGNATURE-----

--3lhi2rphdmmo7pit--
