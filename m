Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336E51129B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F3810E856;
	Wed, 27 Apr 2022 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428B610E89A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:34:48 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12AD3E0004;
 Wed, 27 Apr 2022 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651044886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glbYfZqUavVGHNnqJks+ijb5S8BE7L21xINkDb3m644=;
 b=aARddhOA4gpGItvv8rgUmLqeIkG2mFWwOJyOrJdkHOjJKb9c3Kj8vbvDelNZ9LZktcz3Fb
 zb6K2r/Ur4pfkbGijSwBx0MjIpxag+jyyPR41Z5qw2kdzwbkSuSLiDacx+GjFseF1WdGkA
 QqWPTovEeeV8f9yVkvdrPzg/aJjZzxwK1hnAV5deo1mfS/wGtK/0zQNAZG8FtUtjb3Cy31
 6rd3XWOhd5DEMGArYFnfUddX1U6Rh37BoFC49Rf+owVanBPXpFVBhkkccXSbMZgiR5Or4z
 VVu4lTz1ywAiTsJFJQn1RKEDTFvkfviLgFFJV5hsBMTxtlhHzpgG4tApmblWbw==
Date: Wed, 27 Apr 2022 09:34:41 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmjyEZs0ND2D9Yki@aptenodytes>
References: <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
 <20220426125544.mroteu3hvyvlyb6g@houat>
 <Ymft0SM5GNHXjkVb@aptenodytes>
 <20220426131944.b26rqqmk7gpcplbg@houat>
 <Ymf4nmQAkEciwyt/@aptenodytes> <YmhfsGAJjSmSPs/l@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ijcDL19LA/Jv/8hr"
Content-Disposition: inline
In-Reply-To: <YmhfsGAJjSmSPs/l@ripper>
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
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ijcDL19LA/Jv/8hr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Tue 26 Apr 22, 14:10, Bjorn Andersson wrote:
> On Tue 26 Apr 06:50 PDT 2022, Paul Kocialkowski wrote:
>=20
> > On Tue 26 Apr 22, 15:19, Maxime Ripard wrote:
> > > On Tue, Apr 26, 2022 at 03:04:17PM +0200, Paul Kocialkowski wrote:
> > > > On Tue 26 Apr 22, 14:55, Maxime Ripard wrote:
> > > > > On Tue, Apr 26, 2022 at 02:54:01PM +0200, Maxime Ripard wrote:
> > > > > > On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wro=
te:
> > > > > > > On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > > > > > > > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski=
 wrote:
> > > > > > > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > > > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki =
wrote:
> > > > > > > > > > > > + Linus
> > > > > > > > > > > > + Marek
> > > > > > > > > > > > + Laurent
> > > > > > > > > > > > + Robert
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wro=
te:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child n=
ode has panel or
> > > > > > > > > > > > > bridge")' attempted to simplify the case of expre=
ssing a simple panel
> > > > > > > > > > > > > under a DSI controller, by assuming that the firs=
t non-graph child node
> > > > > > > > > > > > > was a panel or bridge.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Unfortunately for non-trivial cases the first chi=
ld node might not be a
> > > > > > > > > > > > > panel or bridge.  Examples of this can be a aux-b=
us in the case of
> > > > > > > > > > > > > DisplayPort, or an opp-table represented before t=
he panel node.
> > > > > > > > > > > > >
> > > > > > > > > > > > > In these cases the reverted commit prevents the c=
aller from ever finding
> > > > > > > > > > > > > a reference to the panel.
> > > > > > > > > > > > >
> > > > > > > > > > > > > This reverts commit '80253168dbfd ("drm: of: Look=
up if child node has
> > > > > > > > > > > > > panel or bridge")', in favor of using an explicit=
 graph reference to the
> > > > > > > > > > > > > panel in the trivial case as well.
> > > > > > > > > > > >=20
> > > > > > > > > > > > This eventually breaks many child-based devm_drm_of=
_get_bridge
> > > > > > > > > > > > switched drivers.  Do you have any suggestions on h=
ow to proceed to
> > > > > > > > > > > > succeed in those use cases as well?
> > > > > > > > > > >=20
> > > > > > > > > > > I guess we could create a new helper for those, like
> > > > > > > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > > > > > >=20
> > > > > > > > > > Oh wow I feel stupid for not thinking about that.
> > > > > > > > > >=20
> > > > > > > > > > Yeah I agree that it seems like the best option.
> > > > > > > > >=20
> > > > > > > > > Should I prepare a patch with such a new helper?
> > > > > > > > >=20
> > > > > > > > > The idea would be to keep drm_of_find_panel_or_bridge onl=
y for the of graph
> > > > > > > > > case and add one for the child node case, maybe:
> > > > > > > > > drm_of_find_child_panel_or_bridge.
> > > > > > > > >=20
> > > > > > > > > I really don't have a clear idea of which driver would ne=
ed to be switched
> > > > > > > > > over though. Could someone (Jagan?) let me know where it =
would be needed?
> > > > > > > > >=20
> > > > > > > > > Are there cases where we could both expect of graph and c=
hild node?
> > > > > > > > > (i.e. does the new helper also need to try via of graph?)
> > > > > > > >=20
> > > > > > > > I still think we should use OF graph uncondtionally, even i=
n the DSI
> > > > > > > > case. We need to ensure backward-compatibility, but I'd lik=
e new
> > > > > > > > bindings (and thus new drivers) to always use OF graph.
> > > > > > >=20
> > > > > > > I just went over the thread on "drm: of: Improve error handli=
ng in bridge/panel
> > > > > > > detection" again and I'm no longer sure there's actually stil=
l an issue that
> > > > > > > stands, with the fix that allows returning -ENODEV when possi=
ble.
> > > > > > >=20
> > > > > > > The remaining issue that was brought up was with a connector =
node, but it should
> > > > > > > be up to the driver to detect that and avoid calling drm_of_f=
ind_panel_or_bridge
> > > > > > > in such situations.
> > > > > > >=20
> > > > > > > So with that in mind it feels like the child node approach ca=
n be viable
> > > > > > > (and integrated in the same helper).
> > > > > > >=20
> > > > > > > We might still want to favor an explicit OF graph approach, b=
ut note that
> > > > > > > dsi-controller.yaml also specifies extra properties that are =
specific to
> > > > > > > MIPI DSI and I'm not sure there are equivalent definitions fo=
r the OF graph
> > > > > > > approach.
> > > > > > >=20
> > > > > > > What do you think?
> > > > > >=20
> > > > > > I don't think Laurent's point was to move the child node away f=
rom its
> > > > > > DSI controller, that part doesn't make much sense. The panel or=
 bridge
> > > > > > is still accessed through the DSI bus, so it very much belongs =
there.
> > > > > >=20
> > > > > > What he meant I think was that we mandate the OF graph for all =
panels,
> > > > > > so for panels/bridges controlled through DCS, you would still l=
ist the
> > > > > > output through the graph.
> > > > >=20
> > > > > Also, we're already in a bit of a mess right now. I don't think r=
ushing
> > > > > that kind of patches in a (late) rc is making much sense, but as =
I said,
> > > > > if you want to start working on this, then I'll take a revert for=
 the
> > > > > next rc, and then we can work calmly on this.
> > > >=20
> > > > As I understand it we either have some broken stuff because of the =
revert of:
> > > > - drm: of: Lookup if child node has panel or bridge
> > > > - drm: of: Properly try all possible cases for bridge/panel detecti=
on
> > > >=20
> > > > because the child node is already used in places, or we can have br=
oken stuff
> > > > because with the patches because with these two patches -ENODEV is =
no longer
> > > > returned.
> > > >=20
> > > > Now with the extra patch that I sent:
> > > > - drm: of: Improve error handling in bridge/panel detection
> > > >=20
> > > > we get -ENODEV back, except for the connector case but this one sho=
uld be
> > > > handled in drivers directly and drm_of_find_panel_or_bridge should =
not be
> > > > called in that situation.
> > > >=20
> > > > So all in all it seems that all the pieces are there, unless I'm mi=
ssing
> > > > something.
> > > >=20
> > > > What do you think?
> > >=20
> > > If Bjorn and Thierry can confirm that it indeeds work in their case,
> > > I'll be happy to apply those patches as well.
> >=20
> > I still think we'd need a fix for Bjorn's connector case though.
> > Not sure I would be confident providing that one without the hardware
> > to test with.
> >=20
> > Bjorn, what do you think?
> >=20
>=20
> I'm okay with the idea that it's up the driver to check that the output
> port references an usb-c-connector - either before the call or upon
> drm_of_find_panel_or_bridge() returning an error.

Actually I'm starting to think might be wrong on this one: there's a
display-connector bridge driver that should register a bridge, so
drm_of_find_panel_or_bridge should work. Did you have that driver enabled?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ijcDL19LA/Jv/8hr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJo8hEACgkQ3cLmz3+f
v9E86wf/SnM+F9tYjlethb+pRfx719VPchCudFwI84lublqHhwrWka/PI2cali7O
CIelAwhDiBePaRO9OI41gXg0hzw23JTfcfUXABhAjNDmtKu7VdjQJ05RhDjajisy
X0m96izR97WzXBR+to0sRKuCQaDBLHuJQ+I7udFqC0nCM84tAhxVpMotA1NypiCX
AugjOQWuUFEaugxLu0wmnGSz8j/k5rrHx73tb7LcZBbk9c3d/NeXjUkDB9TCe8wh
OXSgU9ijO10Wmms4OXuQRos4yUKI6H1KgV+BHJiOReSbG0ErFtfgpwu55DzkNS5s
z1qORXdzgTBERDcUhxSI4insQB1xVA==
=nuGp
-----END PGP SIGNATURE-----

--ijcDL19LA/Jv/8hr--
