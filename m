Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E745116A5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 14:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345910E976;
	Wed, 27 Apr 2022 12:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0016010E976
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:19:38 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22325C000C;
 Wed, 27 Apr 2022 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651061976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UD8KAbIL63n1hHMIpkt/RrhnhBNW0VaGiNIV+zcQYI=;
 b=C29BNcBkOIbd8YWWiRftRG9oVWfZXHx5odp279W9Dt+L3uRZcyVls0Qnbpf+xXOkuVjyPk
 YuATWwbhh4xLYQg9x4e97aOYZbIQL1hDUZ4VLDgzLy1c+WGB+Qq4hVueEdqf5JSjplUhKO
 0FWriSYCzWs0UzIa+nWKcZsI7+Xtfk7ixuu7rlZvx0an8rFAkmYgRqlwwO9Wg7h9zDPdTZ
 UpNawRaqAAD7G0HJGYmA0Mcn46HqZA0GiMU+I5Le2crQYXy6JQhgztZ/a5Y2Xvkboovt2+
 iRtsM1+qj5DZCzD2HAUj5B2DAanA/H5Quy0DDP2zZyeQWPbTYBZq6M8+U8sK6g==
Date: Wed, 27 Apr 2022 14:19:32 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <Ymk01GLqfIKoZtJQ@aptenodytes>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
 <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gJzE687kJV1qki2Q"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
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
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gJzE687kJV1qki2Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jagan,

On Wed 27 Apr 22, 17:22, Jagan Teki wrote:
> On Wed, Apr 27, 2022 at 12:29 PM Jagan Teki <jagan@amarulasolutions.com> =
wrote:
> >
> > On Thu, Apr 21, 2022 at 1:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > + Linus
> > > > + Marek
> > > > + Laurent
> > > > + Robert
> > > >
> > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > bridge")' attempted to simplify the case of expressing a simple p=
anel
> > > > > under a DSI controller, by assuming that the first non-graph chil=
d node
> > > > > was a panel or bridge.
> > > > >
> > > > > Unfortunately for non-trivial cases the first child node might no=
t be a
> > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > >
> > > > > In these cases the reverted commit prevents the caller from ever =
finding
> > > > > a reference to the panel.
> > > > >
> > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node=
 has
> > > > > panel or bridge")', in favor of using an explicit graph reference=
 to the
> > > > > panel in the trivial case as well.
> > > >
> > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > succeed in those use cases as well?
> > >
> > > I guess we could create a new helper for those, like
> > > devm_drm_of_get_bridge_with_panel, or something.
> >
> > I think using the same existing helper and updating child support is
> > make sense, as there is a possibility to use the same host for child
> > and OF-graph bindings.
> >
> > I can see two possible solutions (as of now)
> >
> > 1. adding "dcs-child-type" bindings for child-based panel or bridge
> > 2. iterate child and skip those nodes other than panel or bridge. or
> > iterate sub-child to find it has a panel or bridge-like aux-bus (which
> > is indeed hard as this configuration seems not 'standard' i think )
> >
> > Any inputs?
>=20
> Checking aux-bus with the sub-node panel can be a possible check to
> look at it, any comments?

That looks very fragile and oddly specific. Also why base changes on the
original patch that you made?

With the follow-up fixes, we are checking the of graph first and only
considering child nodes if the of graph and remote are missing, so there is=
n't
really a need to be more specific in the child noise discrimination.

Actually I should also make a new version of "drm: of: Improve error handli=
ng in
bridge/panel detection" to also return -ENODEV if of_graph_get_remote_node
fails, so that it doesn't try to use the child node when the graph is defin=
ed
but not remote is defined.

Paul

> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -244,6 +244,25 @@ int drm_of_find_panel_or_bridge(const struct
> device_node *np,
>         if (panel)
>                 *panel =3D NULL;
>=20
> +       /**
> +        * Devices can also be child nodes when we also control that devi=
ce
> +        * through the upstream device (ie, MIPI-DCS for a MIPI-DSI devic=
e).
> +        *
> +        * Lookup for a child node of the given parent that isn't either =
port
> +        * or ports.
> +        */
> +       for_each_available_child_of_node(np, remote) {
> +               if (of_node_name_eq(remote, "port") ||
> +                   of_node_name_eq(remote, "ports"))
> +                       continue;
> +
> +               if (!(of_node_name_eq(remote, "aux-bus") &&
> +                     of_get_child_by_name(remote, "panel")))
> +                       continue;
> +
> +               goto of_find_panel_or_bridge;
> +       }
> +
>         /*
>          * of_graph_get_remote_node() produces a noisy error message if p=
ort
>          * node isn't found and the absence of the port is a legit case h=
ere,
> @@ -254,6 +273,8 @@ int drm_of_find_panel_or_bridge(const struct
> device_node *np,
>                 return -ENODEV;
>=20
>         remote =3D of_graph_get_remote_node(np, port, endpoint);
> +
> +of_find_panel_or_bridge:
>         if (!remote)
>                 return -ENODEV;
>=20
> Jagan.

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--gJzE687kJV1qki2Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJpNNQACgkQ3cLmz3+f
v9HYSwf/eCXIDd4EGbh05BEBRdXFDk6GDf15Z+sKLFb2hrZzN1QKpF+o/4CQ4GqR
o6htXeBmEfDUh6XuyBtY1iuCdzOqxxgj1wK2nL6+yNoPco7g5Zc/8sBBZf8HJLSM
8zCRWoQJHwq401CZH1JuXsfQpze20NCqAtvOYuB7Ah9w4MXfctfg09wE6K1p7l8c
/DIhytd3cFF3/DHFxol80fIgcmlWYoLfafKUb8EisXwUeI1caKyj3D+F/8L+tonm
vavnjCGmuRCfs8Q25BfbNirtN2KeTW6ntrsZqljomFcU0cU/3AD1YfMJIhZstigv
L7OFWsqcVBAYkss8k38AqaYuMSGkdw==
=iTIg
-----END PGP SIGNATURE-----

--gJzE687kJV1qki2Q--
