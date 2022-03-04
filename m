Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD04CD089
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 09:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E98810F8F7;
	Fri,  4 Mar 2022 08:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D27F10F8F7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 08:54:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 721BA3200BF9;
 Fri,  4 Mar 2022 03:54:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 03:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=hou0iToesHIzr26Kg4ytAfLnQMyM7RTDfPbWVU
 dT+Ew=; b=QSxLDQ04djalufcWkBWyEAyF+yX5IvioX4qBnBblw3rJ7jVZTqkjUX
 gBPhxLd6mtoMO9Dm/w9x6f/nACnWfeTxihd7WC+X4EPkE3LwxTHZeCWU9HSY9Z1y
 DkVTu/R8HfAVIO8klYw4+1OXCDnCEkn0HWS/gU3Uv/JXLl0kHaRIX3Fuah7Kv9qu
 wB5DoxT/vFRCrh84jG5Lr0MGRqFJmvyJHWKxYXKHUUA8NI62PIYljY95RKQWrgvm
 t/+Cg8zMhQHHYsoOAdLazSoMM83IzhbR1dJlotP3zn6qPshIP23EAG+CSdPt++NK
 fN+XpAbW1lrPoG4iptfEcMv7bv8ro16w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hou0iToesHIzr26Kg
 4ytAfLnQMyM7RTDfPbWVUdT+Ew=; b=e75JVf+2wlhYWeSiaBWWd6JW6F5q7KLE8
 P5AeaFpxrvdepOlGbYk0yKQtrB/ROBpcSIsgbCaPUMqH9lXxx5WyYJiNU+ytMOS6
 4AIHsojRVDpyv43w01R3VF/fhkuA3yMQ6/4GuyorPh83g3aNQ/l9Ql5KJXhHZ24+
 +6dL2wXR2AqAgyXOeZ6sPR1F/LZxdDk2WTIYrBlX+mF75fMI+5MHajReVChZ2XQL
 roS3pRNfMWUcn22MKuQp8w06ythh8klYoOJhw1GNn9YgKDhDC3S8jV8HegJ4o8Y9
 WYlr6RJ1pVwPRplJ6a2rQJJqog8Kxm1cU8/92pG3LA5RhjLxX+d5A==
X-ME-Sender: <xms:19MhYkEeSoJwHH8il-d741C5VzFqZXjUmFQ9mThF3HFZbBwyEng1Ow>
 <xme:19MhYtVjn5rKyLMH9dxCfUNd-Nfr9aB9p3V5GVwg-PdOntZbKhMicQdn0HVH1PUaB
 JPZUU8rMUQG1ExQnTQ>
X-ME-Received: <xmr:19MhYuI3S79Ic3z2oWRv3JPwuwJfAsmJnbkR2xZ9QpzPvF-CHZ7QTtvJzuOiLay2XZAgNRAkz-YIDEPS3ziTGuwmT9GnMDAyYtj1rSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:19MhYmFDd8yFDfqAL9DW-qkYKET6mRCacz9Asx3Gl5G76Bzag1hBZQ>
 <xmx:19MhYqWaAK3oPP9cAep2mElw8Rs-TkweT4Sc-ASbUfKyktqqso_0xw>
 <xmx:19MhYpOyNFtW_9a8v-vyOSFLNEBWN99OMcvP2wr0ezOZ8N_3QgWBSA>
 <xmx:2dMhYurcn3KB0UuBKBbf22CMXieaSFFEjP_wQ3qv4WaeluEdLauYtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 03:54:47 -0500 (EST)
Date: Fri, 4 Mar 2022 09:54:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <20220304085445.avdrxlx5wnytriyk@houat>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
 <YiEkaBO/lz05DkAD@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z2zx3nrmtugsvxrt"
Content-Disposition: inline
In-Reply-To: <YiEkaBO/lz05DkAD@aptenodytes>
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


--z2zx3nrmtugsvxrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, Mar 03, 2022 at 09:26:30PM +0100, Paul Kocialkowski wrote:
> On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> > Devices can also be child nodes when we also control that device
> > through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> >=20
> > drm_of_find_panel_or_bridge can lookup panel or bridge for a given
> > device has port and endpoint and it fails to lookup if the device
> > has a child nodes.
>=20
> This patch breaks the logicvc drm driver that I'm currently developping.
> The symptom is that drm_of_find_panel_or_bridge now always returns
> -EPROBE_DEFER even after the panel has probed and is running well.
> It seems that the function can no longer find the panel.
>=20
> I haven't figured out the details, but reverting your patch makes
> it work again. I suspect other drivers might be affected as well, so
> it would probably be a good idea to revert the patch until the root
> cause is clearly understood and the patch can be adapted accordingly.
>=20
> Here is what the device-tree looks like:
>=20
> / {
> 	panel: panel-lvds {
> 		compatible =3D "panel-lvds";
>=20
> 		[...]
>=20
> 		port {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			panel_input: endpoint@0 {
> 				reg =3D <0>;
> 				remote-endpoint =3D <&logicvc_output>;
> 			};
> 		};
> 	};
> };
>=20
> &amba {
> 	logicvc: logicvc@43c00000 {
> 		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> 		reg =3D <0x43c00000 0x6000>;
>=20
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
>=20
> 		[...]
>=20
> 		logicvc_display: display-engine@0 {
> 			compatible =3D "xylon,logicvc-4.01.a-display";
>=20
> 			[...]

I think the issue lies in what you left out here: you have another node
aside from the port one, called layers. I *think* the issue is that the
code will now pick up the layers node, and try to use it as a panel,
which will never probe.

I've had a look at all the other bindings though, it seems like this
driver is the only one that can be affected: the anx7625 seems to be the
only other driver that has a child node that isn't either a port or a
panel (aux-bus) but it doesn't use drm_of_find_panel_or_bridge either.

Maxime

--z2zx3nrmtugsvxrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiHT1QAKCRDj7w1vZxhR
xTa+AQDi6g0mlXGoYmLBj4K6wBygmwBslHKcyyZxPWNW3hi0JAD/demytm37dYWN
YD8IlBNuEbImvOhvVnA7s2tzFEZM0AQ=
=C1Tj
-----END PGP SIGNATURE-----

--z2zx3nrmtugsvxrt--
