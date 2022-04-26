Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161950FDEE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438510E712;
	Tue, 26 Apr 2022 12:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347E10E712
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:58:56 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C04C360002;
 Tue, 26 Apr 2022 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650977935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmNlrwxgVACEPEt4O51tRww2XVIR+lteYS+yFSp3aDQ=;
 b=EHkcRmQgB3EfJEiP/knliMfCelqvkxz/iDJKNO+N4asEOn7ACFMcfuR4hvBcx3LDrs4K8R
 k7ix6ofIQbd1jEBOGxRp7SsChvwMJWH8XGM/+pVNkWnYgkrql+mYueMp27MJG2v1r6td95
 9nIOsvFzzqupgcICt0zc00yKE7MbkupIQ9jPekXb10ZPZXlCucNFwhKHN1ROJ7L5HB9L/L
 Yil79Hss0mh0BPixtclpGtL8J9KNsIclPjl2/ZPWfvOssfQWAW2+FCHuvfLjUZ3vP5Z04p
 PR/4B2yFEhkVKyQ4C3lgiUll3ctNL+N+HS/EpQZK5SgsWOAtqDXN5oEhKCYihA==
Date: Tue, 26 Apr 2022 14:58:47 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <Ymfshx4AxRslupL4@aptenodytes>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YbpWSnC7kIEH40Lk"
Content-Disposition: inline
In-Reply-To: <20220426125401.yyrhg6aeafdjw4ad@houat>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YbpWSnC7kIEH40Lk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 26 Apr 22, 14:54, Maxime Ripard wrote:
> On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wrote:
> > On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > + Linus
> > > > > > > + Marek
> > > > > > > + Laurent
> > > > > > > + Robert
> > > > > > >=20
> > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > >
> > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has pa=
nel or
> > > > > > > > bridge")' attempted to simplify the case of expressing a si=
mple panel
> > > > > > > > under a DSI controller, by assuming that the first non-grap=
h child node
> > > > > > > > was a panel or bridge.
> > > > > > > >
> > > > > > > > Unfortunately for non-trivial cases the first child node mi=
ght not be a
> > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the =
case of
> > > > > > > > DisplayPort, or an opp-table represented before the panel n=
ode.
> > > > > > > >
> > > > > > > > In these cases the reverted commit prevents the caller from=
 ever finding
> > > > > > > > a reference to the panel.
> > > > > > > >
> > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if chil=
d node has
> > > > > > > > panel or bridge")', in favor of using an explicit graph ref=
erence to the
> > > > > > > > panel in the trivial case as well.
> > > > > > >=20
> > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > switched drivers.  Do you have any suggestions on how to proc=
eed to
> > > > > > > succeed in those use cases as well?
> > > > > >=20
> > > > > > I guess we could create a new helper for those, like
> > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > >=20
> > > > > Oh wow I feel stupid for not thinking about that.
> > > > >=20
> > > > > Yeah I agree that it seems like the best option.
> > > >=20
> > > > Should I prepare a patch with such a new helper?
> > > >=20
> > > > The idea would be to keep drm_of_find_panel_or_bridge only for the =
of graph
> > > > case and add one for the child node case, maybe:
> > > > drm_of_find_child_panel_or_bridge.
> > > >=20
> > > > I really don't have a clear idea of which driver would need to be s=
witched
> > > > over though. Could someone (Jagan?) let me know where it would be n=
eeded?
> > > >=20
> > > > Are there cases where we could both expect of graph and child node?
> > > > (i.e. does the new helper also need to try via of graph?)
> > >=20
> > > I still think we should use OF graph uncondtionally, even in the DSI
> > > case. We need to ensure backward-compatibility, but I'd like new
> > > bindings (and thus new drivers) to always use OF graph.
> >=20
> > I just went over the thread on "drm: of: Improve error handling in brid=
ge/panel
> > detection" again and I'm no longer sure there's actually still an issue=
 that
> > stands, with the fix that allows returning -ENODEV when possible.
> >=20
> > The remaining issue that was brought up was with a connector node, but =
it should
> > be up to the driver to detect that and avoid calling drm_of_find_panel_=
or_bridge
> > in such situations.
> >=20
> > So with that in mind it feels like the child node approach can be viable
> > (and integrated in the same helper).
> >=20
> > We might still want to favor an explicit OF graph approach, but note th=
at
> > dsi-controller.yaml also specifies extra properties that are specific to
> > MIPI DSI and I'm not sure there are equivalent definitions for the OF g=
raph
> > approach.
> >=20
> > What do you think?
>=20
> I don't think Laurent's point was to move the child node away from its
> DSI controller, that part doesn't make much sense. The panel or bridge
> is still accessed through the DSI bus, so it very much belongs there.
>=20
> What he meant I think was that we mandate the OF graph for all panels,
> so for panels/bridges controlled through DCS, you would still list the
> output through the graph.

Oh okay that makes sense, thanks.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--YbpWSnC7kIEH40Lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJn7IcACgkQ3cLmz3+f
v9Gz8wf+MEkBx//EDT9WbMz6ywe9d7BVQzxaz0bYBK4m1VWbwOuPwteqDdjPMU3Z
23Ah2g6EmUUnPskNEc2lLvR6cy3GTuZfpTJtRM2NDBj8jnbB/+K5BkjAhdApRSIE
fsCPnTeQfeVBBdUGKHEphr5b5epx2JNKlrgYFqeeAfT5ppw14FBqgZyIJm3t17YX
Hkibw0numAyvLO6KNpabLlFoEDgo8aNCgd3396xKKKFN85f/M/kL61+FchCbC+Ku
V6ZV6ZDirakQC4DMJQuhMzgpkcDk6O78Ejfk3WulcJ053QqNJ6HVdLCmVdmygQd2
eJbHUb5ZoE01bCsosQj9l38RftT6bg==
=VL5e
-----END PGP SIGNATURE-----

--YbpWSnC7kIEH40Lk--
