Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F04D30D6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6382F10EC72;
	Wed,  9 Mar 2022 14:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7615910EC72
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:11:59 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 478A9FF80A;
 Wed,  9 Mar 2022 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646835115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBHqvc6uth8b7MiFOb0AYUf7mUKUncnYNQItOPWEFLs=;
 b=W4aZIxnJGO0j+ihZyF9DjMXHRyEgirf9nBzo5JCRUEtitP8DJ9IKaGXxcfRK9aLi3ZcNVl
 AT34t9p1ruPTNjv6/yZEAf4OqCPC1kJiC7bnZImyuCNDbCJuR2Vw+jka2OUNpRUq/l8kO/
 6OLZauHimT79zw1ykjgmwxfEJI3eDSpIcMmCHshC+AlvpBUKHjxJA8fE+4Cj4dTjV3Cl+G
 9zP0fhXMYZRZ3dduXsKdVjVlcvn8W3BG/Mvi/mdCJRn60mrjSyVG2QahibKBO8ngYXMgnJ
 p/2I0SNsNkZ873Iqi6NNjEu9wP7blZHh/9P6v5b5EtD3ywaJaDXsmHA2QC4G4g==
Date: Wed, 9 Mar 2022 15:11:51 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <Yii1p0X0/78QCBGX@aptenodytes>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
 <YiEkaBO/lz05DkAD@aptenodytes>
 <20220304085445.avdrxlx5wnytriyk@houat>
 <YiHxU5GvnRuTeWqc@aptenodytes> <YiHyatlgpmkMY4/T@aptenodytes>
 <20220304113821.jfu6fxgehohlj5in@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ek3yJWzKDlaEghkW"
Content-Disposition: inline
In-Reply-To: <20220304113821.jfu6fxgehohlj5in@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amarula@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Ek3yJWzKDlaEghkW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri 04 Mar 22, 12:38, Maxime Ripard wrote:
> On Fri, Mar 04, 2022 at 12:05:14PM +0100, Paul Kocialkowski wrote:
> > On Fri 04 Mar 22, 12:00, Paul Kocialkowski wrote:
> > > Hi Maxime,
> > >=20
> > > On Fri 04 Mar 22, 09:54, Maxime Ripard wrote:
> > > > Hi Paul,
> > > >=20
> > > > On Thu, Mar 03, 2022 at 09:26:30PM +0100, Paul Kocialkowski wrote:
> > > > > On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> > > > > > Devices can also be child nodes when we also control that device
> > > > > > through the upstream device (ie, MIPI-DCS for a MIPI-DSI device=
).
> > > > > >=20
> > > > > > drm_of_find_panel_or_bridge can lookup panel or bridge for a gi=
ven
> > > > > > device has port and endpoint and it fails to lookup if the devi=
ce
> > > > > > has a child nodes.
> > > > >=20
> > > > > This patch breaks the logicvc drm driver that I'm currently devel=
opping.
> > > > > The symptom is that drm_of_find_panel_or_bridge now always returns
> > > > > -EPROBE_DEFER even after the panel has probed and is running well.
> > > > > It seems that the function can no longer find the panel.
> > > > >=20
> > > > > I haven't figured out the details, but reverting your patch makes
> > > > > it work again. I suspect other drivers might be affected as well,=
 so
> > > > > it would probably be a good idea to revert the patch until the ro=
ot
> > > > > cause is clearly understood and the patch can be adapted accordin=
gly.
> > > > >=20
> > > > > Here is what the device-tree looks like:
> > > > >=20
> > > > > / {
> > > > > 	panel: panel-lvds {
> > > > > 		compatible =3D "panel-lvds";
> > > > >=20
> > > > > 		[...]
> > > > >=20
> > > > > 		port {
> > > > > 			#address-cells =3D <1>;
> > > > > 			#size-cells =3D <0>;
> > > > >=20
> > > > > 			panel_input: endpoint@0 {
> > > > > 				reg =3D <0>;
> > > > > 				remote-endpoint =3D <&logicvc_output>;
> > > > > 			};
> > > > > 		};
> > > > > 	};
> > > > > };
> > > > >=20
> > > > > &amba {
> > > > > 	logicvc: logicvc@43c00000 {
> > > > > 		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> > > > > 		reg =3D <0x43c00000 0x6000>;
> > > > >=20
> > > > > 		#address-cells =3D <1>;
> > > > > 		#size-cells =3D <1>;
> > > > >=20
> > > > > 		[...]
> > > > >=20
> > > > > 		logicvc_display: display-engine@0 {
> > > > > 			compatible =3D "xylon,logicvc-4.01.a-display";
> > > > >=20
> > > > > 			[...]
> > > >=20
> > > > I think the issue lies in what you left out here: you have another =
node
> > > > aside from the port one, called layers. I *think* the issue is that=
 the
> > > > code will now pick up the layers node, and try to use it as a panel,
> > > > which will never probe.
> > > >=20
> > > > I've had a look at all the other bindings though, it seems like this
> > > > driver is the only one that can be affected: the anx7625 seems to b=
e the
> > > > only other driver that has a child node that isn't either a port or=
 a
> > > > panel (aux-bus) but it doesn't use drm_of_find_panel_or_bridge eith=
er.
> > >=20
> > > Thanks a lot for looking into this so quickly!
> > >=20
> > > After some testing it clearly appears that you're right and the layers
> > > node is the one conflicting with the patch. Removing it brings the
> > > behavior back to normal. I'll try to dig-in a bit more to understand
> > > why this is happening since it's really not obvious when just looking
> > > at the patch.
> >=20
> > Ah wait I do understand it actually. The patch will take the *first* no=
de
> > that doesn't have ports/port in it and use that as remote instead of
> > of_graph_get_remote_node.
> >=20
> > So maybe the fix would be to first look via of_graph_get_remote_node and
> > if nothing is returned then it should try to use the first node as remo=
te.
> > tl;dr just inverting the order of the logic.
> >=20
> > Do you think that would work?
>=20
> We can have multiple strategies here. The one you have in mind does work
> indeed, but relying on the node order is still fairly fragile.
>=20
> I think it would work fine then if:
>=20
>   - We first lookup any endpoint, and see if we have a panel or bridge.
>     If so, we return it.
>=20
>   - Then, we look at any available child node, and see if we have a
>     panel or bridge attached. If so, we return it.
>=20
>   - we return -EPROBE_DEFER
>=20
> That way, even if we have something like:
>=20
> node {
>      totally-not-a-panel {
>      }
>=20
>      panel {
>      }
> }
>=20
> It would work fine, without relying on the node name (well, except for
> port(s)?)
>=20
> What do you think?

Yes it would definitely be better to try all possible cases, including when
one of them fails instead of just selecting one to check and failing if
the panel/bridge nodes aren't there.

I'll have a try at this and send a fixup patch soon!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Ek3yJWzKDlaEghkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIotacACgkQ3cLmz3+f
v9HRbwf/WFvxgg5pEb1ZOO1icNUnrDcaRevkH3YCGoXoxpOD7OdiIGVHoiw8C1Ye
I/1+nfpWkXuNCCabv37ECjJWM9p8Ndn50nSeizfe3AAgwKTjuePIe5yI82SHh/1G
GXgA5NnXtNm6LeVeMDg+28H+2Q/+f1EvjpNEkCM93FksBrBRw4a3oEYxS6gY7Q+7
bhI0p/RrP4r31/nA07WN/ARWez5fk9xrcl2FDi7YWHnZ6NFd7SaGNxdMi92poZhd
RGiynkgbnBT30L8cTM6Us9jYOUCp8YrhX0jjalC2pmlTohGuo3qzogBUkIc1rXmj
U6BOKeDBSKh3OSmjkNLyLcXO96en6w==
=a3L9
-----END PGP SIGNATURE-----

--Ek3yJWzKDlaEghkW--
