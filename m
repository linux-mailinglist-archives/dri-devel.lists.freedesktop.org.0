Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D171509B5A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9E910F7C3;
	Thu, 21 Apr 2022 08:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFBA10F7B5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:59:50 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62417C000D;
 Thu, 21 Apr 2022 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650531589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yp2t6r1/cJizv8gsAVbZcbB593pExBxNPqD/pz6SF3A=;
 b=a4ZelfyURHzewJJxbSdtZQ7wVzoFn6O/9NRSQpgxNecSPRR6Iv8s/MSED8PxLSXOnxDKLb
 bNROM/QlpNQKraMw31BF7hi+1iKi/TVfm82jQl/hJWJxQLJIG/ZTaFRcLwAle6EiIRAggO
 K5cT/5nxvi7i+GC+p9Go57/mwLCPuXbSgCJ+tJN/Q7KrNB5jBeSr2uWIDQwZ4U25jCPeq4
 Ji1eq31LJz0lJDCpl0EjHJw1tbMcmXwVGPeEjZ93xDz4uwYx731ATggwppREZU8S92gdX+
 Xqopk5P0M6w9SfMHzyzcQFwf0oTGAlQJwwXYv5c3dRvjwYDvTGCVoI4GmsyRdw==
Date: Thu, 21 Apr 2022 10:59:45 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmEdAVwZuA7Wo1Ch@aptenodytes>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t+LLIQxZOAuVSMSL"
Content-Disposition: inline
In-Reply-To: <20220421082358.ivpmtak3ednvddrc@houat>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t+LLIQxZOAuVSMSL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > + Linus
> > + Marek
> > + Laurent
> > + Robert
> >=20
> > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > bridge")' attempted to simplify the case of expressing a simple panel
> > > under a DSI controller, by assuming that the first non-graph child no=
de
> > > was a panel or bridge.
> > >
> > > Unfortunately for non-trivial cases the first child node might not be=
 a
> > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > DisplayPort, or an opp-table represented before the panel node.
> > >
> > > In these cases the reverted commit prevents the caller from ever find=
ing
> > > a reference to the panel.
> > >
> > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > panel or bridge")', in favor of using an explicit graph reference to =
the
> > > panel in the trivial case as well.
> >=20
> > This eventually breaks many child-based devm_drm_of_get_bridge
> > switched drivers.  Do you have any suggestions on how to proceed to
> > succeed in those use cases as well?
>=20
> I guess we could create a new helper for those, like
> devm_drm_of_get_bridge_with_panel, or something.

Oh wow I feel stupid for not thinking about that.

Yeah I agree that it seems like the best option.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--t+LLIQxZOAuVSMSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJhHQEACgkQ3cLmz3+f
v9HoLwf/aITXqerkQmlMKMLUwRbfs60fUvHgKCB/zJv4ZIgY+J04iY1D3CLA7l0s
MyVO/iMlDEbTJG3kGYdN5p+JMPGikC1ClwSH71lNRfARjmV5qe/feOrS4XulGeW1
f8yG8ar9ySlnJe/zyyCP2KiyVditZxCK9dnL0qye1XPpWXhJYdaNH1+EGS/e62oC
b6+HSJ/s0cEXkxQ/iOwWY4TAeDni8/3a9khj5s21BpZNDYvPWEYYScPJlHk55Z3x
6Vbrkps3mzLfNYpjXhU8LDTQFW2Hgk6c8SFMV0Kp4cPZZ/pddcLh4gyQq4XFt/41
coUD7Xf/kpqWXdaeAqoMgzzpcyYIIw==
=rxg5
-----END PGP SIGNATURE-----

--t+LLIQxZOAuVSMSL--
