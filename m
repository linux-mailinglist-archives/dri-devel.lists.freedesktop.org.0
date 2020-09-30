Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995B284742
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3146E425;
	Tue,  6 Oct 2020 07:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF5F6E090
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:13:41 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AD2E580350;
 Mon,  5 Oct 2020 11:13:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:to:cc:subject:message-id:from:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FtG2Bzuy5PqxUd7fnFYHl5Znz5H
 mAs+KH2eBPZ//Wzo=; b=NVCuzXlnXtSq15LRXTCVx5qRPNGYjQTymOsYZNvdS6x
 Aa11UQdQXmoAa2K2cZXjUrPEyEe1JeO3WsKuQUmsDR33Jr1TGS9q7Vo7r6aQF2FI
 mDqQgIYhbBwapj0Wl++gAT6grbt7bc6JTQknfOnBJEmUmNRwDORF2QYoUTnOeMYl
 Kk0OBUfmJ2ngAUKZZNEGX6CiZc+uzkchZnx2/pwZ0ZkXKS8e35QQGRNnS5kBzPcU
 izgIa5Zf8brXKVwY8yxE2itdO4mQV7Ice4xyDSp+iMd0qeJNReoCJ+RkQNp2f4nY
 k5cEGtoTU/DIrIqG+cSCBsZnUwLdeKLP+74zlsUm0mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FtG2Bz
 uy5PqxUd7fnFYHl5Znz5HmAs+KH2eBPZ//Wzo=; b=chBh/6Sydgee2d8NJ1zO+H
 IY5XR5iEAcOwKKrQ8aMnQY0bt0hYsvY1u0IY56M9NnBEISFkwAS9dT0ZsXxDTHT4
 0wCxVNpGDprCu1G9Cve4NIPEm2LnfJEGxhAVhoRVcsMaV2I1AuY5d/zl3ksI/s9O
 lGcjxi11CwsyXHFJSn9c7U2ZDAygcHFpnjMIhCAyig4fPVDlIyV7HG0C96WUgvuS
 0idtewaBFmsqyuWZuYHud9ulzqeuNC9bfVGG7sO5W0sF5SNFY0qWsMOkL136V1Z5
 X1zgnBlk/nMORuRpmdglmNbBmTGHrTetjH8n/tB/fyQ+7jeqac7OZF3TdNrcjuTw
 ==
X-ME-Sender: <xms:ITh7XzWawbNEZJIGdQ6u6hrdaC2CGyhpDFJBmaThbCq44HxZpTelnQ>
 <xme:ITh7X7lizOAZmEyAoRpHUP8HdTOwAso0HlYlRdFgwDEZzLo09Z_u40i48kabfSnme
 EKvTYljw7IgAtmsVuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffvffukffhfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeikefffefhffeiffehfeeghfevfeekfeejveetfeegjeejvefghfffheeifeeh
 ffenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ITh7X_aWpL87qXoNeTUni3Ph9aqbr8BD3tvAlDkqxy_2GbAzqVXkxA>
 <xmx:ITh7X-W2YDxNVHOJc-0ytNBko9aVVCx8yTMtbQMTI8xMrXDXygOYFg>
 <xmx:ITh7X9lh3wY9NU7clPp9MRtg8w04s108r_bUsqlqD9HP4UCpwHXz9Q>
 <xmx:Izh7X_nWnKPB0sUybWIXq66laDgyKJ_h4t0UJfHyhbBFnQsOzM51qA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B94E43280059;
 Mon,  5 Oct 2020 11:13:36 -0400 (EDT)
Date: Wed, 30 Sep 2020 15:04:59 +0200
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Disable Wifi Frequencies
Message-ID: <20200930130459.kfurbu34lc7jeuok@gilmour.lan>
From: Maxime Ripard <maxime@cerno.tech>
References: <20200925130744.575725-1-maxime@cerno.tech>
 <20200929190055.GA962101@bogus>
MIME-Version: 1.0
In-Reply-To: <20200929190055.GA962101@bogus>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1408177853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1408177853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u4bs7qtkzx5ibc3n"
Content-Disposition: inline


--u4bs7qtkzx5ibc3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Sep 29, 2020 at 02:00:55PM -0500, Rob Herring wrote:
> On Fri, Sep 25, 2020 at 03:07:43PM +0200, Maxime Ripard wrote:
> > There's cross-talk on the RPi4 between the 2.4GHz channels used by the =
WiFi
> > chip and some resolutions, most notably 1440p at 60Hz.
> >=20
> > In such a case, we can either reject entirely the mode, or lower slight=
ly
> > the pixel frequency to remove the overlap. Let's go for the latter.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../bindings/display/brcm,bcm2711-hdmi.yaml        |  6 ++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 14 +++++++++++++-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |  8 ++++++++
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdm=
i.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > index 03a76729d26c..63e7fe999c0a 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > @@ -76,6 +76,12 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  raspberrypi,disable-wifi-frequencies:
> > +    type: boolean
> > +    description: >
> > +      Should the pixel frequencies in the WiFi frequencies range be
> > +      avoided?
>=20
> Based on googling the issue, perhaps should be a common property?

This is a fairly generic issue indeed, but went for the most
non-intrusive way. Do you have a better idea of a generic name, or do
you just want me to drop the vendor prefix?

Maxime

--u4bs7qtkzx5ibc3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3SCewAKCRDj7w1vZxhR
xR6PAP9FsndGYY6v0exCfbGLeQIs4y5yblaoV5yQPygk9VDPOQD9GeC07fLj3UJQ
Yph2AlUG43iC5/XHQuxmhu+6Qyigowg=
=DlkQ
-----END PGP SIGNATURE-----

--u4bs7qtkzx5ibc3n--

--===============1408177853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1408177853==--
