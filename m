Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F72A5F50
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE13895B6;
	Wed,  4 Nov 2020 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536E06E88F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 09:15:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DCF98B74;
 Tue,  3 Nov 2020 04:15:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 04:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1tNn1pikOw7tZKuEny9hLuZOdNy
 TZCg4qSMmCCjVhK4=; b=lrqfhwXkww8bOrTefozcqRhyUsUfOyJhYrA38aVP2Aq
 VELQr5eIMHpGL0/qSCkI0/p3kJatzR4eN2I1ahWWxOhq3gsRwrBVIimYFq9RaFnr
 Nor7Px4qgxM//Lbj3sU2r/RQtSOQXrDmObBbodPPzLuooytbKSEMlD0bcs+QypKP
 eb22w7m7sGNmNuL9Aq5he82281XLEBHUNVdkJIiQ8gFvB1kK1xgOnfkP6902s1WT
 ylC7Y5oBF5VGk50mUtRXjseFqf2ytrPSIHm+rR52vN1fa7i8nNcA9p0To/kH5eai
 asWKyrEroz60Ptvjou32ZAcmeXUevWSQnmUPIwqdZVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1tNn1p
 ikOw7tZKuEny9hLuZOdNyTZCg4qSMmCCjVhK4=; b=SyT6nfnFZvw43mK5SRIhz9
 jAwp06bGa1lE9E79HewyOXk9GXmM61OpGoN7n9OP+I/fRWIlaziPMxtfsKP95/rV
 kGOJJ9a+j/KOKnQWhWqgoGcIiZih04fhVJsaMzVBh0xg8qK5c448/uOY0XDtVi8t
 Eggt3rnmnPVvtWoNdXHoETkL5UK1afcQpXKabJzB2Y2TtHwwXsVZ9sPHfQo+wBkJ
 0Z8rtUaJdRLXRyjMNHy2/mlAujFwLj2LpkY5b8a3lLf2EqVtpIPRxGhxSRaGD9ZA
 RLBunUMM2VNYbAZGLthB524p3tFCllojJa44j362CEUWtkTT+wvVgYnmyxu/Vv2w
 ==
X-ME-Sender: <xms:vB-hX_oetdGm8t199iExKBMu6vTYWW_wHDyt5RfGIr1_4HLpqFWiuQ>
 <xme:vB-hX5roYKbuUNuaT-nsovo5tJWK2iEZ09YGeRgmwpQWk_g4XGex2iysTZTsCsPcP
 FcvRk_s2d1Gzp0Ji4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vB-hX8O9ldm84epMnLj8VlxnxzHGsfHnl1auUYb8erP8R3SQylAQQg>
 <xmx:vB-hXy5q5nvRgWNcyyWqaSEkQJmq7dnMPweaytsjZKSNRoq9FOAmbg>
 <xmx:vB-hX-5NLMfp6hry0i-ubyu4SKJ1aPKq5SIKG_Z4uH3kITksqt7sqQ>
 <xmx:vR-hX50xglK7p-64SD84ZvhfbFkvz4vYHLT6ICXTBzsjykITcokqyQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C93C63280059;
 Tue,  3 Nov 2020 04:15:39 -0500 (EST)
Date: Tue, 3 Nov 2020 10:15:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vc4: drv: Remove unused variable
Message-ID: <20201103091537.4n55enltcd4eejyo@gilmour.lan>
References: <20201102162908.1436567-1-maxime@cerno.tech>
 <20201102204538.GV401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201102204538.GV401619@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0174052200=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0174052200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ejmzyeoplaefgufw"
Content-Disposition: inline


--ejmzyeoplaefgufw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 09:45:38PM +0100, Daniel Vetter wrote:
> On Mon, Nov 02, 2020 at 05:29:08PM +0100, Maxime Ripard wrote:
> > The commit dcda7c28bff2 ("drm/vc4: kms: Add functions to create the sta=
te
> > objects") removed the last users of the vc4 variable, but didn't remove
> > that variable resulting in a warning.
> >=20
> > Fixes: dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state o=
bjects")
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied, thanks!
Maxime

--ejmzyeoplaefgufw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EfuQAKCRDj7w1vZxhR
xUVkAQDWKebs8NWluz66EYfhVeJKhI7DKNQGPXEFIVJdSQklXQD9F9wgASRe1ald
yQPPExMu7ZwTtReTnUxUzsWwhnJqnQY=
=eD/v
-----END PGP SIGNATURE-----

--ejmzyeoplaefgufw--

--===============0174052200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0174052200==--
