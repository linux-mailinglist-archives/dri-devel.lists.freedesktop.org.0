Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC1A47958
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B6D10E147;
	Thu, 27 Feb 2025 09:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HBdUalSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025410E147
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:32:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1D395C4936;
 Thu, 27 Feb 2025 09:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F9C4CEDD;
 Thu, 27 Feb 2025 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740648743;
 bh=5MNjAbAl4fq6g53JUWJsJzNozHy0lxgqYwA7jNUEmtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBdUalSSz94olOqrDU0Rw3cVMKA5bNW+HF7LQQXNYIZlbVkXAURmoKovc3RQdDTpn
 Sahs5l3xeGIJvcru9uX97A07H9+JfmChDZRwmFpoNUzhY/whhjiLCAg2nJoseqjL/r
 m8tn7rfPSp/qjYWWX9kUZ0DPhOTeXWKRdvyOVB+JQIqyl2t+lH6/JLegCWrvnVQCHn
 sKNW97Q+mNWXaNMs8uIMKUKLvXfR85loCdZIVwihoCUJAHzjoSkrWkWqy7L3XyPaUU
 sBzBZQL93A8fTIGHNUras/ZHSOXQSyttEBHC9gnZTmsjNjMf2LT8lxTBgvZja5n6hZ
 XY6qZ2lp2Gmuw==
Date: Thu, 27 Feb 2025 10:32:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250227-savvy-monumental-toucan-edffe2@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250210181252.5ee028d4@booty>
 <20250211-merciful-nyala-of-justice-a4fabb@houat>
 <20250226152813.4a1ad218@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dfdgpsludo7guwgc"
Content-Disposition: inline
In-Reply-To: <20250226152813.4a1ad218@booty>
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


--dfdgpsludo7guwgc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 03:28:13PM +0100, Luca Ceresoli wrote:
> On Tue, 11 Feb 2025 14:10:50 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:
> > > On Fri, 7 Feb 2025 12:47:51 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f=
64ad2babfebea62db1d9e43 100644
> > > > > --- a/include/drm/drm_bridge.h
> > > > > +++ b/include/drm/drm_bridge.h
> > > > > @@ -31,6 +31,7 @@
> > > > >  #include <drm/drm_encoder.h>
> > > > >  #include <drm/drm_mode_object.h>
> > > > >  #include <drm/drm_modes.h>
> > > > > +#include <drm/drm_print.h>
> > > > > =20
> > > > >  struct device_node;
> > > > > =20
> > > > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > > > >  	const struct drm_bridge_timings *timings;
> > > > >  	/** @funcs: control functions */
> > > > >  	const struct drm_bridge_funcs *funcs;
> > > > > +
> > > > > +	/**
> > > > > +	 * @container_offset: Offset of this struct within the container
> > > > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > > > +	 * legacy bridges.
> > > > > +	 */
> > > > > +	size_t container_offset;   =20
> > > >=20
> > > > This shouldn't be in there. You can create an intermediate structur=
e and
> > > > store both pointers for the action to consume. =20
> > >=20
> > > You mean to store container_offset + refcount + is_refcounted? =20
> >=20
> > No, I meant for the private structure pointer and the drm_bridge
> > pointer. refcount should be in drm_bridge, and I think is_refcounted
> > should be dropped.
>=20
> Storing the container pointer instead of the offset is a good idea, it
> will allow to get rid of is_refcounted: drm_bridge_is_refcounted() can
> just return "container !=3D NULL" instead of "bridge->is_refcounted". So
> far so good.

Again, I don't think the whole is_refcounted thing is a good idea. Once
we have the right API, we should convert all bridges to the new
allocation and assume that they are refcounted.

> I'm not sure about the intermediate struct you have in mind though.
>=20
> Do you mean:
>=20
> struct drm_bridge_pointers {
>     struct drm_bridge *bridge;
>     void              *container;
> }
>=20
> ?

Yes

> If that's what you mean, should it be embedded in drm_struct or
> allocated separately?

Separately, but still as part of the bridge allocation function.

> If you mean to embed that struct in drm_bridge, then I the drm_bridge
> pointer inside the intermediate struct would be useless.
>=20
> If instead you mean to embed it in drm_struct: I'm not sure I see much
> benefit except maybe not exposing the container pointer to drm_bridge
> users, but I see a drawbacks: at the last put we need to find the
> container pointer to free from a struct kref pointer, which can work
> only if the container pointer is in the same struct as struct kref.

Yeah, that's true. Storing the container pointer in drm_bridge makes
sense to solve this.

I'm still not sure why we need the container offset though: if we have a
bridge and container pointer, then the offset is bridge - container, so
there's no point in storing it, right?

Maxime

--dfdgpsludo7guwgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8AxJAAKCRAnX84Zoj2+
dsUUAX0Xxg2iIgwuaxtZwjtxFd46vyTrOtN+YPw9iz5R3BpZftRillij5tLub5PD
xL/MSucBfA/oFAKN4+mbZfJTb26QK8zau3RtslBEbH3sp+gHU1I5Rcyle08ZtMS9
W2Wo0G3KCQ==
=6jsA
-----END PGP SIGNATURE-----

--dfdgpsludo7guwgc--
