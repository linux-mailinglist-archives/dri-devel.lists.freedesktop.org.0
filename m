Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A552B50F323
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8F10E4C2;
	Tue, 26 Apr 2022 07:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4867A10E437
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:54:41 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD370C0011;
 Tue, 26 Apr 2022 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650959679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbjUJF85j7VcoyUcJNo/0uHXS5A5nvA+sLUFvu2hF2Q=;
 b=kwo7M+YBinQdDLV406ejHk8p5PtP/AaEbfWC0rZwFh9ifHPfdKBpQftZlhZOllVQ8EvvU8
 76P4vb1Qx5UdbqctG5x7B/r6RQKLl3iYDCFFeT2ro1FTl9j0O7D1+4ne4HqKcTpWm+XACZ
 FQxEl/1PBrXOyJ6PZPuyn74xsQyh2pgCN9HiFAJJRLDEWZuiOz5XSrghdZslVT+w0ruNxI
 CGVED/ZVhoQ3RUVl++aAv9nIr7KTEbEmyVLXTN4P0InG1K0bnoTCx1yCPtG83Xam+kAvLe
 PvWbb3wnE+33gJcZjywQMiZ5I768A2ho/UnYgEmIud6ZYexVb2gy9vvBtNTYcQ==
Date: Tue, 26 Apr 2022 09:54:36 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmelPCcWCCjALtRU@aptenodytes>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Si6USORBDKWOev5w"
Content-Disposition: inline
In-Reply-To: <YmEdAVwZuA7Wo1Ch@aptenodytes>
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


--Si6USORBDKWOev5w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> Hi Maxime,
>=20
> On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > + Linus
> > > + Marek
> > > + Laurent
> > > + Robert
> > >=20
> > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > bridge")' attempted to simplify the case of expressing a simple pan=
el
> > > > under a DSI controller, by assuming that the first non-graph child =
node
> > > > was a panel or bridge.
> > > >
> > > > Unfortunately for non-trivial cases the first child node might not =
be a
> > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > DisplayPort, or an opp-table represented before the panel node.
> > > >
> > > > In these cases the reverted commit prevents the caller from ever fi=
nding
> > > > a reference to the panel.
> > > >
> > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node h=
as
> > > > panel or bridge")', in favor of using an explicit graph reference t=
o the
> > > > panel in the trivial case as well.
> > >=20
> > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > switched drivers.  Do you have any suggestions on how to proceed to
> > > succeed in those use cases as well?
> >=20
> > I guess we could create a new helper for those, like
> > devm_drm_of_get_bridge_with_panel, or something.
>=20
> Oh wow I feel stupid for not thinking about that.
>=20
> Yeah I agree that it seems like the best option.

Should I prepare a patch with such a new helper?

The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
case and add one for the child node case, maybe:
drm_of_find_child_panel_or_bridge.

I really don't have a clear idea of which driver would need to be switched
over though. Could someone (Jagan?) let me know where it would be needed?

Are there cases where we could both expect of graph and child node?
(i.e. does the new helper also need to try via of graph?)

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Si6USORBDKWOev5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJnpTwACgkQ3cLmz3+f
v9FpNQf+PmdFzmDCc2lB70OeH1fQOTNlthZRA/ZDA9XQizGkSF7BFS5dJkp9FfWr
6fEanp5K7wl+z9FUcx+G+A36n7y82sWeZVk2HwNQuBei8DH/ZQrBAWZa8kpZ1RQO
5bec85tS8OimvJ/dNMUCXypf6p39mSiMLPj2y65p6KVn2fFE5XMllQqBifaQfbJX
yt+HjpH58GJz5GPSgeb4c2W2Lz43TxjfGzhMd+lKwWgnBkeQQ/2G8y3R+G0VNkTu
wuDWOl3BUGc2dtXkj8dHzzSqZJrQYdFU5ctJdhbibfAv0oNYdzM/RBQA9WYndO8Y
9eRdxvuj0o96p8BjFqxBZ33LUyhQIg==
=Bckb
-----END PGP SIGNATURE-----

--Si6USORBDKWOev5w--
