Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54269A20CAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD3A10E67E;
	Tue, 28 Jan 2025 15:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXE4q1e5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FA810E67E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87233A40DBA;
 Tue, 28 Jan 2025 15:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C16C4CED3;
 Tue, 28 Jan 2025 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738076996;
 bh=m/hGrb5P/jwpP88zCO7c28ZGI+3kUgDLNJ9gvTHbiq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXE4q1e5cx+RVxjPMk+YDCab+FalqCXwMjjE7QOIyrevXbk7woWXoBecZy6dI/4gA
 YsDGW2pCVLzoHi0wPbaTrSliAwATHeBlVyQn9pajiKatYKdwbcl45VpHTiM41gtoOU
 xDQXh4KlZUe3iIsBtMPwiKOmQNRhA9VUlX3aVjrNOK4fanT1Y3frPCAYeY2Koo3ljm
 z5XDrFs0QyczHlgXoh96zaPrSOpbn6CUjABKn6B+iqNiAKwhPEeCM0oEi663S8q8pQ
 3sImh2nBjSa2kslUqceF2mEWI6E0noiuOp613GI9TGFPWQGUFAgwZQR2egp+tSaPPv
 RL7/wSF0IpZ9w==
Date: Tue, 28 Jan 2025 16:09:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <ksxomce6vddld7vikzyjd55babho63vj6ej5vrsiwfp2tid6yu@xfpagqpata4v>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <20250116-brave-feathered-dormouse-8ea4cf@houat>
 <20250121122729.41c8f2b1@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ihuvzkcldme4rsb"
Content-Disposition: inline
In-Reply-To: <20250121122729.41c8f2b1@booty>
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


--4ihuvzkcldme4rsb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 12:27:29PM +0100, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Thu, 16 Jan 2025 13:26:25 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> [...]
>=20
> > > And then there is the panel bridge. My understanding (which I'd love =
to
> > > get clarified in case it is not accurate) is that DRM bridges expect =
to
> > > always interact with "the next bridge", which cannot work for the last
> > > bridge of course, and so the panel bridge wraps the panel pretending =
it
> > > is a bridge.
> > >=20
> > > This software structure is clearly not accurately modeling the
> > > hardware (panel is not bridge), =20
> >=20
> > We don't have a proper definition of what a bridge is, so as far as I'm
> > concerned, everything is a bridge :)
> >=20
> > The name came from "external signal converters", but the API got reused
> > to support so many hardware components it's not meaningful anymore.
>=20
> So if I'm getting your point here, drm_bridge is actually the base
> class for DRM devices in OOP jargon, or a "DRM subunit" in V4L2 jargon.
> OK, that's fine for me (except maybe for a "we should rename" thought).

To be clear, I'm not sure it's worth renaming drm_bridge to something
else, and I certainly don't consider it is a prerequisite to this
series.

> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some point. However the devm and=
 drmm
> > > release actions are associated to the consumer struct device (the pan=
el
> > > bridge consumer), so if the panel bridge is removed and the consumer =
is
> > > not, deallocation won't happen. =20
> >=20
> > Oh, right, if one doesn't call drm_bridge_put(), that will result in a
> > memory leak. The general topic we discuss and try to address here is
> > memory safety, and a memory leak is considered safe. It's also going to
> > get allocated only a couple of times anyway, so it's not a *huge*
> > concern.
> >=20
> > And about how to actually fix it, there's two ways to go about it:
> >=20
> >   * Either we do a coccinelle script and try to put all those
> >     drm_bridge_put() everywhere;
> >=20
> >   * Or we create a devm/drmm action and drop the reference
> >     automatically.
> >=20
> > The latter is obviously less intrusive, we would need to deprecate
> > devm_of_get_bridge() for it to be safe, and I'm not entirely sure it
> > would be enough, but it might just work.
> >=20
> > > For hotplugging we cannot use drmm and devm and instead we use get/pu=
t,
> > > to let the "next bridge" disappear with the previous one still presen=
t.
> > > So the trivial idea is to add a drm_of_get_bridge(), similar to
> > > {drmm,devm_drm}_of_get_bridge() except it uses plain
> > > drm_panel_bridge_add() instead of devm/drmm variants. But then the
> > > caller (which is the panel consumer) will have to dispose of the stru=
ct
> > > drm_bridge pointer by calling:
> > >=20
> > >  - drm_bridge_put() in case a)
> > >  - drm_panel_bridge_remove in case b)
> > >=20
> > > And that's the problem I need to solve. =20
> >=20
> > I'm not sure the problem is limited to panel_bridge. Your question is
> > essentially: how do I make sure a driver-specific init is properly freed
> > at drm_bridge_put time. This was done so far mostly at bridge remove
> > time, but we obviously can't do that anymore.
> >=20
> > But we'd have the same issue if, say, we needed to remove a workqueue
> > from a driver.
> >=20
> > I think we need a destroy() hook for bridges, just like we have for
> > connectors for example that would deal with calling
> > drm_panel_bridge_remove() if necessary, or any other driver-specific
> > sequence.
>=20
> The .destroy hook looked appealing at first, however as I tried to
> apply the idea to bridges I'm not sure it matches. Here's why.
>=20
> The normal (and sane) flow for a bridge is:
>=20
>  A) probe
>     1. allocate private struct embedding struct drm_bridge
>        (I have an _alloc() variant ready for v5 to improve this as you pr=
oposed)
>     2. get resources, initialize struct fields
>     3. drm_bridge_add(): publish bridge into global bridge_list
>=20
> Now the bridge can be found and pointers taken and used.

We agree so far.

> And on hardware removal, in reverse order:
> =20
>  B) remove (hardware is hot-unplugged)
>     3. unpublish bridge
>     2. release resources, cleanup
>     1. kfree private struct

I think the sequence would rather be something like:

B') remove
  3. unpublish bridge
  2. release device resources
  1. release reference

C') last put
  2. release KMS resources
  1. kfree private struct

> Some drivers do real stuff in B2, so it is important that B3 happens
> before B2, isn't it? We don't want other drivers to find and use a
> bridge that is being dismantled, or afterwards.

Yeah, B3/B'3 should definitely happen first.

> B3 should normally happen by removing the bridge from the global
> bridge_list, or other bridges might find it. However setting the "gone"
> bool and teaching of_drm_find_bridge() & Co to skip bridges with
> gone=3D=3Dtrue would allow to postpone the actual removal, if needed.
>=20
> With that said, with hotplugging there will be two distinct events:
>=20
>  * hardware removal
>  * last ref is put
>=20
> The second event could happen way later than the first one. During the
> time frame between the two events we need the bridge to be unpublished
> and the bridge resources to be already released, as the hardware is
> gone. We cannot do this at the last put, it's too late.
>=20
> So I think the only sane sequence is:
>=20
>  * on hardware removal:
>      B3) unpublish bridge (drm_bridge_remove() or just set gone flag)
>      B2) free resources, deinit whatever needed
>  * when last ref is put
>      B1) kfree (likely via devm)

No, devm will have destroyed it in B'2. We need to destroy it in the
cleanup hook of kref_put

> So, back to the .destroy hook, it would fit at B2, and not at the last
> put.

destroy would be called at C'2 time

> However in that place it seems unnecessary. The actions "on hardware
> removal" (B3, B2) are done by the driver remove function, so they are
> already driver specific without any additional hook. I'm however fine
> to add the hook on hardware removal in case there's a good reason I
> missed.
>=20
> Do you think my reasoning is correct so far?
>=20
> If you don't, can you clarify at which events (hardware removal VS last
> put) the various actions (drm_bridge_remove, set gone flag, calling
> .destroy, free resources and deinint, kfree) should be done?

I believe I did already, the gone flag should be set before B'2

Maxime
>=20
>=20
> (Side note: I've been pondering on why the .destroy hook works for
> connectors and would not for bridges. I think it's due to the global
> bridge_list, or because of the different lifetime management based on
> drmm for connectors, or both.)
>=20
>=20
> It may look as if my discussion is about bridges in general and not
> about the panel bridge. However before delving into how to dispose of
> a panel bridge we need to sort out how to dispose of a bridge in the
> first place.
>=20
> Luca
>=20
> --=20
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

--4ihuvzkcldme4rsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jzQAAKCRAnX84Zoj2+
dqUrAYC5K9daG/FhWd1a7sSx5NhNeZAaLWV1AriGlYA2tteBKM5tl8+XhAQvDDtL
cpcquiUBfR7G3P+27MuE+OLeYBfXXxeYzrjb1uZhBN0Pzktmv/YSS5nxchGXfvR2
EWWTba0/Dw==
=ccM7
-----END PGP SIGNATURE-----

--4ihuvzkcldme4rsb--
