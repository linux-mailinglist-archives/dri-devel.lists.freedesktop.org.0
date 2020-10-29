Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4C29FFA2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B856E993;
	Fri, 30 Oct 2020 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5A6E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:17:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2FAE5802AA;
 Thu, 29 Oct 2020 05:17:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 05:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=lEjXa4WPZ+lBplOCOSczM5dcK1S
 XwWahYHSfYVswHOk=; b=aMJR7I27huvwlXZkuPWeuksEMhVCWoDac5DPHlv9Xkz
 70s8EmkwMG5sypIAGuF/NN4SOUIcDG2YncQXWaMhYc42tgrFyUqxOBIrL+x724S9
 a6L+quIiwm3BBcojDOqC5pHgAmLWXli64HPDFAodNvQoJOE8JjTkx+abfRKCHODu
 pMI5E9hJM2S+wYKb45stjGwtiLOHHvxBiJt37q60Rnu/+ntiwQxNzCfB3KSihCsE
 wlNVr152A7ue1hMHs+Eirkip+4ZZiudToLcfCsT/SH+dOhgFV6sHrUQXyWn15hp1
 EHwiP3xp9dtUGeukPxuFSlMWV0CZu7CL+7x9C1lO5hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lEjXa4
 WPZ+lBplOCOSczM5dcK1SXwWahYHSfYVswHOk=; b=IriSPl4qavN1oFGh7hhcuz
 bxdMWClOJGSHn1CrZ9bI1JnMS0IyoN8/VcTtY9BQkKrZSv6Ndyj3uRkOcjNgLLZo
 poKA29ynqeyKTIYLA2kob2aDl/7ZvUTubUhmqnBd/PnbuGw7T3ANsIc/B0tE8Fz4
 W9RlSW6XaIOJFysGfi8SOQifzphg4X8BHbBMPOwWO3oGaaXgrHwIaYTqGFk2Lsfn
 2JPUefJf19PAoGK85X4lqamxJc7xtCdKN3GYnZ8g8SVUJdi8nWLKf/9FxrP7AtJL
 2ZocHfqp1N6e1iozhqlOSzsYkZtlLyXaeygdoaZ3Sn4x+hR0h3St1fNha8KrY5Tw
 ==
X-ME-Sender: <xms:vIiaX9eVYxHvqrp14B_02orL8PuDV8jdIwA5fdd0X0xRnGbSqu6YwA>
 <xme:vIiaX7MSMLwUDXOzOz24YrqVTEfIHo8-EJBRB3qhhyfm4iB0cNGelr1TOUq3L4yoW
 Z6Cp6Pq3l6gEu52hlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vIiaX2ggqb-napcZyNqwyY-7GYvPzg9AHd0DXE9noJwmd2ku-irvNQ>
 <xmx:vIiaX2-o4-K68w6xPB3--lBnumRZA4n_eoMi3MkTRPbxcjrXg1McWg>
 <xmx:vIiaX5s12ujc3x36jOOmJAXH4WYuGC7ZDPSDZHcWCy0HTaKsXUnlDw>
 <xmx:vYiaX_LCf3IvrwPhO8QYrFpBBSZYEFwqNXPCrs6tJektwYqdLwsScg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1953A328005D;
 Thu, 29 Oct 2020 05:17:48 -0400 (EDT)
Date: Thu, 29 Oct 2020 10:17:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Block odd horizontal timings
Message-ID: <20201029091746.2byv4tewvlozehh3@gilmour.lan>
References: <20200925130044.574220-1-maxime@cerno.tech>
 <CAPY8ntAOsE5Xg-6R64B9NVE9SS85SkiNXJq19Uspx=-4v4Y3ug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAOsE5Xg-6R64B9NVE9SS85SkiNXJq19Uspx=-4v4Y3ug@mail.gmail.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0153040995=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0153040995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k6i374xzum3gxsgl"
Content-Disposition: inline


--k6i374xzum3gxsgl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Oct 28, 2020 at 01:42:20PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Fri, 25 Sep 2020 at 14:00, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
> > per clock cycle, and cannot deal with odd timings.
> >
> > Let's reject any mode with such timings.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your review

> It's unsupported due to the architecture rather than broken.

Would you prefer s/broken/unsupported/ then?

Maxime

--k6i374xzum3gxsgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5qIugAKCRDj7w1vZxhR
xVrbAP9H9u5D/3fOW6mO+1DLXZe+4ULmlY2B3BFZpRpxsgHMMwEAuwNX0xKIpWWm
tBoR5aaRcD6kYJZQ/80lwBFvu+kx4gE=
=xJ3g
-----END PGP SIGNATURE-----

--k6i374xzum3gxsgl--

--===============0153040995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0153040995==--
