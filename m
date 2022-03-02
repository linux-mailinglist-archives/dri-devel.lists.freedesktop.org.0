Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7C4CA16E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07A910EE2B;
	Wed,  2 Mar 2022 09:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3D510EE2B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:56:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 086C85C0369;
 Wed,  2 Mar 2022 04:56:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Mar 2022 04:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5UUMgjBpCXcldm2Y5jZv+pyWBbuzGs7VAzmJbx
 lL6Ig=; b=lGllfdCflaVkqbx37sNbDy9aJdZHYzzS/YUXWvHXJIIN/mocKNYrMB
 lI5kCieXqRb2JZ3M/DbAX2XBB9cgAxskO4Y2sqr2RqH53fD4M+VKWH+vYsvkOci6
 snPMs1EXdYgd5TXSOItUjS834jdhRWcOm9pDTlUeGKxo1DcPc5vBoxWp1yRLqKqI
 ttSD6WD4ZSYLQejKtuv86pOaBBrkw5xoXOG9guCezoZNNKooGFDiH1TLUYD+cVyJ
 H/PGWGznizmJ3/M16+2o76rJ1m+M1UQT0uKtif5GAIAG6isRePu89xq80OoWGm/o
 HFCZUq0zZaZfOUmCrWFW7oY8Yb6d3y1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5UUMgjBpCXcldm2Y5
 jZv+pyWBbuzGs7VAzmJbxlL6Ig=; b=nZxO7yA4QW3uokrldvSw9EWz4RnDdNGQL
 wuyk0+UcYcHlEgEl2KoJgcMX5MkooKqe/+4l+t8VBG/HnjV2MF/OQ44LailUPitG
 r0pZiEWiUskr3xXF9foolqZD1JLtaaa8EJ2FT+uQYmtH8T3hh7ylu1EbRheQrOSN
 iImzeA9AI7X2XpO0ES9AZGarJ09RZ2alvo01ERkqAsxg8FFgHNOM1RXJyYrkYN3J
 s1mWG9bTZE7Kwt2OfqaD+RImEF58sXotMktFG6rXfSpjdbdp4AggQJKi7y4TTP7n
 NMKP644L+dVdloAzXuzO94n6Gd+5fcGJRh0b7rb0S6/9B0VakgnWA==
X-ME-Sender: <xms:Xz8fYt4BlgRmHKoaHjDVgBGeia1ndg6VeJjrevFF7X1cKjKtUwSwDA>
 <xme:Xz8fYq5bKj6FD2gQNVnQpcaKNBFP2OwJsacsmuOGgia5SSzAPMBjk8tLcDsq_6-np
 TfSReegsJgIZVyW6Gg>
X-ME-Received: <xmr:Xz8fYke1L-bQOEeIGZymcaYAimAwzQQbA6BycC5NxxiQ9zZUlhiU5z0AvOR6qoP6cab7CTBLqcjIsYbyXAwFjug2EOSD2SkIPFQkggI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Xz8fYmJlhdMD_WC31JTzGeyhPd3K9TjTVQtZpIIUPqybBkfyXZiZoA>
 <xmx:Xz8fYhL7fZesk-Ov05NP_2kBI5QxbH2MZg3LHy-IiHlquD626SA3rA>
 <xmx:Xz8fYvyutEFZd0V4M4zblEEDNJ39sktxYTCQIS7T0Qub_NDkC3RrpA>
 <xmx:YD8fYuHR9dmJTZvLPQTtzGmLQtyTv67v4zV0ZMi-8UPz4p_AylDYZw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 04:56:47 -0500 (EST)
Date: Wed, 2 Mar 2022 10:56:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 02/12] drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and
 HFP_MIN handling
Message-ID: <20220302095645.zfgkigphjfb6dnub@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mrqqfjrgbfxtphns"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-3-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mrqqfjrgbfxtphns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:20AM +0100, Marek Vasut wrote:
> The HFP_HSW_HBP_HI register must be programmed with 2 LSbits of each
> Horizontal Front Porch/Sync/Back Porch. Currently the driver programs
> this register to 0, which breaks displays with either value above 255.
>=20
> The HFP_MIN register must be set to the same value as HFP_LI, otherwise
> there is visible image distortion, usually in the form of missing lines
> at the bottom of the panel.
>=20
> Fix this by correctly programming the HFP_HSW_HBP_HI and HFP_MIN register=
s.
>=20
> Fixes: ce517f18944e3 ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB b=
ridge")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--mrqqfjrgbfxtphns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh8/XQAKCRDj7w1vZxhR
xYNhAP9YpTua6ArEpTa2oKJCLdCpqOE54VefgCKmkGUXnyPC8gD5AXowVS43GFC7
lys9PSoqsjzx8LV4ecl67lvkE3GQWgo=
=ATU8
-----END PGP SIGNATURE-----

--mrqqfjrgbfxtphns--
