Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE829FFCE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC566ECF3;
	Fri, 30 Oct 2020 08:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714616E8D1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 12:26:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B1D43580608;
 Thu, 29 Oct 2020 08:26:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 08:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zBBv8JGROeyz6B0dzl8YUmdNdp/
 kd6p8BbKil2KYkIY=; b=VuHxqcegesuONGda485RwmRFO8jWTRq3+zuvX04IBT5
 OpPJA5FzEpGXPNdFilMhDCK2ppa/7zi3AEe4mYpI/qg7dBZMnJjEUefib9Xi+eju
 UWcSMIleOBpBrZueJkNFVxdsvmGE+QPO5tvcZT5hDQr5oGzDLFkUP/ustim/pA4H
 6uBFe+LISIXp7ykWhQQXmmVNhQhLQsxaiLScvOQY+VPhAjSwOpCiIVCEcUatCiXz
 LdnQ8buGh1opcHgRX/3l3QKO0q4Y0A/xXyRJ1EWBaOhLp086O3lJE18G1EdV04br
 EyDNdzFleh4ne0r6bXeT8klqByFysKa+/FBBb+2Gl6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zBBv8J
 GROeyz6B0dzl8YUmdNdp/kd6p8BbKil2KYkIY=; b=XX996PO+l+6G3TGEM+dNbn
 3r1HKlMTUKt8uqEtfbhayMRR8sPaOh6NohHYjwD3q0nsJMC+5dkS/oY7yTNRTDks
 7F84Kl8/gM/C+XaNIl4jDUEnT8d5FyM0915yGorKoxY8ithLTv3HvmUG9YmNmxgF
 fQQzLIzYEd/ZMXQjzBKkr4Ryp1ickoP+oh7t0DtMBvckjQbrqu1h9H0V7n/GDIcU
 p9bGHcOMAEjv8fb6NLNjaYIi1tgp03n53CL14aie2vIZvd8vfRj4yZqC1CUODWGE
 3RiZG4PESglzWbSp0fXfpCqg4HlDHgXtdhst8UseKeD86Oq/DSVlrZS8o5R46aVw
 ==
X-ME-Sender: <xms:27SaXwCZzSKGytrXTgS1IliPvgrAerjniApXisDImFRbJLv026ahSQ>
 <xme:27SaXyhB9tyACOX_PaxmMqsI5fVWO5DIOg6xombhlv_KesWz0RPnAIen9hTKYbU0Z
 IBY0ntTn3N5fovwwDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:27SaXzkGpAsUU0JisSShFd_lvbh07SazATPzjDFJqOuaPB-yDZfDiA>
 <xmx:27SaX2xI3cFOjVqnL04H_tTvohA1eUjRJroGOPm8_6yNVexUeLCZIQ>
 <xmx:27SaX1SiHAIQ-sRimqrikbBn4HItV0bElSfi7VGR074civw0viuYpA>
 <xmx:27SaXy9cxWESNJUFl01Ej85hXPg1fC_DEvfFUfnIO-CT05Gk_PexQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 406ED328005E;
 Thu, 29 Oct 2020 08:26:03 -0400 (EDT)
Date: Thu, 29 Oct 2020 13:26:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Block odd horizontal timings
Message-ID: <20201029122602.yk6snfqr3ajrmiwg@gilmour.lan>
References: <20200925130044.574220-1-maxime@cerno.tech>
 <CAPY8ntAOsE5Xg-6R64B9NVE9SS85SkiNXJq19Uspx=-4v4Y3ug@mail.gmail.com>
 <20201029091746.2byv4tewvlozehh3@gilmour.lan>
 <CAPY8ntAocwhSdgvbFZRwoU+u6LYhKPROgpjOOBsMZZTjiCrAzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAocwhSdgvbFZRwoU+u6LYhKPROgpjOOBsMZZTjiCrAzA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0212438654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0212438654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f6z2bbqmqhpduifw"
Content-Disposition: inline


--f6z2bbqmqhpduifw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 10:49:22AM +0000, Dave Stevenson wrote:
> On Thu, 29 Oct 2020 at 09:17, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi!
> >
> > On Wed, Oct 28, 2020 at 01:42:20PM +0000, Dave Stevenson wrote:
> > > Hi Maxime
> > >
> > > On Fri, 25 Sep 2020 at 14:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > The FIFO between the pixelvalve and the HDMI controller runs at 2 p=
ixels
> > > > per clock cycle, and cannot deal with odd timings.
> > > >
> > > > Let's reject any mode with such timings.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Thanks for your review
> >
> > > It's unsupported due to the architecture rather than broken.
> >
> > Would you prefer s/broken/unsupported/ then?
>=20
> If you needed to respin then yes, but it's not that big a deal.

It had a merge confict (with the 10/12 bit HDMI series) so I ended up
sending a new version with that fixed.

Maxime

--f6z2bbqmqhpduifw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5q02gAKCRDj7w1vZxhR
xeeQAQC1zAzVGkcIJQigGR/r3DfZbxAeWBXMhQvd1/v+LdJUqwD/fY4y3EJqcV+0
4a+Vql+1hLRNvusnkltGtFEbB9EmHQM=
=2qQd
-----END PGP SIGNATURE-----

--f6z2bbqmqhpduifw--

--===============0212438654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0212438654==--
