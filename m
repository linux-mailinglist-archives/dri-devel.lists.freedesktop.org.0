Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD329FFB7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803FB6ECF0;
	Fri, 30 Oct 2020 08:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333516E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:07:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 76C015807E0;
 Thu, 29 Oct 2020 14:07:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 14:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=d58RL8KlQmeas/n4EgP9a9fQj1c
 F9N+v7q7UZkMl7n0=; b=EC0Nw0HxxGBj7HMce8irRtBXOGmq6X7MQMVkUj953KU
 tLaCRcVjv/R9QX5IPK9AjsA8Ao7k1lfk8p6WXCqzdA3P73/09XvM3UZB6dqaoQGs
 YxHSVHX/ttI6nHDZDbKzYTt8StGyX+y1HiXLshlt8siY2OMzHBOi6UVCnDvNSInU
 wUE9ckMtMjh3WHDqOh6pKQIyFlQoFZ61tGy30QMkktGKNIzI+ygp2l56rVIj26st
 bVopGY3eJwrRLcOW2yKCbr9owKtlM2jfjUm6e8fSgFZGMG8iod/8VDbzYsQxBmQn
 s8KsZvydUSOzd4P94OaYovkaTUBxQFwHlH/+pPbSf0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d58RL8
 KlQmeas/n4EgP9a9fQj1cF9N+v7q7UZkMl7n0=; b=aHUqTWcOiihVGCHKUL6xx5
 vlIccUMCzpKzpUvLOk1VnocMBSbVvpj3QEGi1o1+RJ6g3geri9KZoKaOwLfmc1Uo
 p+52eJ6bNrs8Qlp2tiMYzM8n0yTNzmQMY4qa2NJelwmhDTRBhMtZ3YFDfXAQGRnT
 tqe13sIW5NsXRy5MtlNg+ey1XFzIugoA2I+QGFhcawCtlkIsw3vpkygqhHC48zFz
 any6dwTr8Iu1mKtMZYakukv1B+iMGx7XlueKIZE5JJgveGnNWpzPN0+aybW7/ngJ
 EyBnc8OVhEDI5Np6v01kOoHYvVz69VwqPny/T5uU35ZFS1Szvs23SsL5EXgj2IjQ
 ==
X-ME-Sender: <xms:2wSbX7xraj8r4MaG_O5KAWNOEeK4siqWimOv6hlx94tI680B5dUP6A>
 <xme:2wSbXzTjYD5ppEgzL5nDUjQv-Yhvdnavwki1Jf391j-pxBIJyMTFyhgGMiEQZrP1V
 LK0Tfv1pFHe0jL_8FM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2wSbX1XNsR7WKJGBcLbHX8Ra5VbmoLCwny4XgmNqNeLd-DxA0l6NKg>
 <xmx:2wSbX1g3bhV0qKHRrnWVXw10Nb9XkXwwQaqwT_sePh-kYTkaU6FX7w>
 <xmx:2wSbX9BkCrfv4_lCEz56e16agLeLrzQ1X7qgTx70OiYpLTb3PLga6Q>
 <xmx:3QSbX1ZCC6wGs8eDPPaF0Dc1VBLGbTdWNzBeIvOCIeAaKulq_yRbYg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C694328005A;
 Thu, 29 Oct 2020 14:07:23 -0400 (EDT)
Date: Thu, 29 Oct 2020 19:07:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add a property to deal with
 WiFi coexistence
Message-ID: <20201029180721.lsucxnl7kavlvibd@gilmour.lan>
References: <20201029134018.1948636-1-maxime@cerno.tech>
 <4d0028fdf797abd99f95d627e60e9322caa52596.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <4d0028fdf797abd99f95d627e60e9322caa52596.camel@suse.de>
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1850609989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1850609989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rxzctnsrsfxssdlg"
Content-Disposition: inline


--rxzctnsrsfxssdlg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu, Oct 29, 2020 at 06:43:27PM +0100, Nicolas Saenz Julienne wrote:
> Hi maxime,
>=20
> On Thu, 2020-10-29 at 14:40 +0100, Maxime Ripard wrote:
> > The RaspberryPi4 has both a WiFi chip and HDMI outputs capable of doing
> > 4k. Unfortunately, the 1440p resolution at 60Hz has a TMDS rate on the
> > HDMI cable right in the middle of the first Wifi channel.
> >=20
> > Add a property to our HDMI controller, that could be reused by other
> > similar HDMI controllers, to allow the OS to take whatever measure is
> > necessary to avoid that crosstalk.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > Changes from v1:
> >   - Renamed the property
> >   - Split it into a separate patch
> > ---
> >  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdm=
i.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > index 03a76729d26c..7ce06f9f9f8e 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > @@ -76,6 +76,12 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  wifi-2.4ghz-coexistence:
>=20
> I see you already renamed the property, but I can't seem to find v1 of the
> series online.

I realized I didn't put you in Cc for the first version, sorry, you'll find=
 it here:
https://lore.kernel.org/dri-devel/20200925130744.575725-1-maxime@cerno.tech/

> Sorry if this is redundant:
>=20
> I wonder if it'd make sense to prefix the property like this:
> "raspberrypi,wifi-2.4ghz-coexistence." I tend to associate the lack of pr=
efix
> with generic properties, and also thought it was a rule. Although I may h=
ave as
> well imagined it.

Rob in the first iteration asked for the opposite :)

It used to be a vendor-specific property, and since this issue is
basically cross-platform (as long as you can support 1440p and have
WiFi), it makes sense to make this a generic property

Maxime

--rxzctnsrsfxssdlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5sE2QAKCRDj7w1vZxhR
xUZ/AP41k2g+mPeHKxN6cAgBqQqtzRaHalf5j8S4Em9cjrNxdQD/d1sSMD6ot+q9
F0Argl9P5qL5kJgU3DS3EpFMF8PmIQk=
=RQgw
-----END PGP SIGNATURE-----

--rxzctnsrsfxssdlg--

--===============1850609989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1850609989==--
