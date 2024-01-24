Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA883ACAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852810F778;
	Wed, 24 Jan 2024 15:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEA110F778
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 15:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3A236CE2986;
 Wed, 24 Jan 2024 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F2DC43394;
 Wed, 24 Jan 2024 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706108411;
 bh=/3VvSNQFMhEWJ37fpvVryZgTFR90+9R0lCzMzXd3ajw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Glc0Ih3F6213sfrvFumQn72djjhXrRmukAoh7HlBUKnWyLyq8PkJixreOXRt21yiq
 JnigM2JQHroiA0PBtcYkzfL/kL/lfHhghGQSlvrCLavOy6zyvtjz6rCjrP1pWNohVv
 VCkWLMTqzXX+msX07XV/JmuG8E7o5uN0FtS/I6GrnL/YrR7QXApjFgzOu7SaOkKQ/k
 yKtvsvAmHUY7p03e4XksVLfKQF45omesn+xoGqzlAmj6gI3qc/WGR1VD2wRMbW5kUV
 DDTtPX7L4vPh8GuXFOgufRPDp8kVKWRPz5e+5x5gIuBdpzq0AfV6DaXpygpUdM/JXj
 a21aGd2nWxjGA==
Date: Wed, 24 Jan 2024 16:00:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: Re: [PATCH 3/5] drm/bridge: simple-bridge: Allow acquiring the
 next bridge with fwnode API
Message-ID: <w2ykwgnwfa3ll264r6ynjkgnkspaq3ioq232zivbqysl3ncp6x@snksdkrubjbr>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-4-sui.jingfeng@linux.dev>
 <20240123011859.GB22880@pendragon.ideasonboard.com>
 <7f5e1c37-a637-494a-ab52-cad83095f2a6@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5igwccgajrafxrst"
Content-Disposition: inline
In-Reply-To: <7f5e1c37-a637-494a-ab52-cad83095f2a6@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5igwccgajrafxrst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 08:18:22PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2024/1/23 09:18, Laurent Pinchart wrote:
> > On Tue, Jan 23, 2024 at 12:32:18AM +0800, Sui Jingfeng wrote:
> > > Which make it possible to use this driver on non-DT based systems,
> > > meanwhile, made no functional changes for DT based systems.
> > >=20
> > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> > > ---
> > >   drivers/gpu/drm/bridge/simple-bridge.c | 51 ++++++++++++++++++++++-=
---
> > >   1 file changed, 44 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm=
/bridge/simple-bridge.c
> > > index 595f672745b9..cfea5a67cc5b 100644
> > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > @@ -184,6 +184,39 @@ static const void *simple_bridge_get_match_data(=
const struct device *dev)
> > >   	return NULL;
> > >   }
> > > +static int simple_bridge_get_next_bridge_by_fwnode(struct device *de=
v,
> > > +						   struct drm_bridge **next_bridge)
> > > +{
> > > +	struct drm_bridge *bridge;
> > > +	struct fwnode_handle *ep;
> > > +	struct fwnode_handle *remote;
> > > +
> > > +	ep =3D fwnode_graph_get_endpoint_by_id(dev->fwnode, 1, 0, 0);
> > > +	if (!ep) {
> > > +		dev_err(dev, "The endpoint is unconnected\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	remote =3D fwnode_graph_get_remote_port_parent(ep);
> > > +	fwnode_handle_put(ep);
> > > +	if (!remote) {
> > > +		dev_err(dev, "No valid remote node\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	bridge =3D drm_bridge_find_by_fwnode(remote);
> > > +	fwnode_handle_put(remote);
> > > +
> > > +	if (!bridge) {
> > > +		dev_warn(dev, "Next bridge not found, deferring probe\n");
> > > +		return -EPROBE_DEFER;
> > > +	}
> > > +
> > > +	*next_bridge =3D bridge;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > Hmmmm yes, this convinces me further that we should switch to fwnode,
> > not implement fwnode and OF side-by-side.
> >=20
>=20
> OK, I'm agree with you.
>=20
>=20
> But this means that I have to make the drm_bridge_find_by_fwnode() functi=
on works
> on both DT systems and non-DT systems. This is also means that we will no=
 longer
> need to call of_drm_find_bridge() function anymore. This will eventually =
lead to
> completely remove of_drm_find_bridge()?
>=20
>=20
> As far as I can see, if I follow you suggestion, drm/bridge subsystem will
> encountering a *big* refactor. My 'side-by-side' approach allows co-exist.
> It is not really meant to purge OF. I feel it is a little bit of aggressi=
ve.
>=20
> hello Maxime, are you watching this? what do you think?

It's indeed going to be a pretty big refactoring, but I agree with
Laurent that we don't want to maintain both side by side.

Maxime

--5igwccgajrafxrst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbEl9wAKCRDj7w1vZxhR
xbx6AP47b5f3sx89JOXRxJ6QF2qxQ7nXm03i+IOoVUM6lroNpgEAgyvJ8jMj7JUV
0jTXlefRFTfFhCkFUzwMhE+bjsZxagU=
=dXtq
-----END PGP SIGNATURE-----

--5igwccgajrafxrst--
