Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C1288398
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693476EC61;
	Fri,  9 Oct 2020 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851316E342
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:27:48 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D7DA558032E;
 Thu,  8 Oct 2020 07:27:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 07:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KTPwdqBKAJjRWkkEeQTJTtrMtpG
 t/EY8qnr4KEuhkqo=; b=lvD7ycev3K8NQWfZ5iKZf3fo84QLHSLZucAG0ZdGXRk
 4SLAj22MBuPPxpm+Vk9vo0BLDL2xhCxJiX8PN7SbqEQl/+aFb/oaA7jV5TR1yytM
 b+ageLjU1Jc03eJqZ26dcgSggIHrUij+7LMwgKvFIPEWo6HhqzzXiXkmLsKJ0BJ4
 qh6v8aXD3DL+pRFKsdmMx51xPYkzmePeo1xLTObC3v64pL2IBjXVwCJF5Zlug2oC
 Z6dy5loT96Oj1LI+ETmHe+u2Xq3oeAeWMfs6VwO7iiyemWvdmgw6ZBbpk57MoKpo
 PVjMWNLYdPIbC82hJxVZilNh5shmV90+emdoVd/Q2uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KTPwdq
 BKAJjRWkkEeQTJTtrMtpGt/EY8qnr4KEuhkqo=; b=iYr0ajqyKZvq/1vmZEAiBc
 Z+iGMK+5BvFeVFzS15HGbaJEl+hNnQ91a+srTVAk2m2oXH8BFem6KyV8GViR7fqx
 63Cy/W3bUBx2xOidvBvgdrv6QmQkrbmaisvVzI6TWb0gCgBIVs1LyAGnlG/3/yxj
 Fq8tcFCpPYoN0HZmgo0VTdYsZySMv8bdG3Zxnek8zfX5iJrEcDJD1NyTkhXDWBYt
 A7nfLxZLAe1qO+EteuELUUE0Ue9xb3selORgLshZaomUetA7JdyMybtJEbRHo+mc
 IIYvAJkKe5C+SJG3cu3fgpscuUDtgip27lqTR1wXPiINEN7Z1O5pgEbRV5/bDwAw
 ==
X-ME-Sender: <xms:svd-X2Bj9zAHGaj9fIaqiW4oq4W0eWqyzksvJIImJ_1ZJKafwT8efQ>
 <xme:svd-XwisE0HjP6AgDZRQ474RCZYgpthiUE08hsQHjLpEKfGV35_btA_2H6bbvmpc7
 bLqSSvKJ3KttUpWOFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:svd-X5nHr-CuTKdp2JjWfC_Pl-681fSOz70nSWOySYcufNhzOBrrbw>
 <xmx:svd-X0zeGoxzkyGat3RWFoivP8DurFNbK0IlGjpUtLCnW7qRasD1WQ>
 <xmx:svd-X7SyfN23T3Y76mEh3zpN7Xke9x0KD0Swke4n01QbwrTQ8n2hGQ>
 <xmx:s_d-X5ARXK-BfMV4MGAIuwJxY3PJshCKWiJA_TRNqh-N-EQnKcTK7Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9F3173280066;
 Thu,  8 Oct 2020 07:27:46 -0400 (EDT)
Date: Thu, 8 Oct 2020 13:27:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20201008112745.hezf7kerapqgrp6m@gilmour.lan>
References: <CGME20200904071259epcas1p3de4209531c0bc5ed6ea9ef19827b6ed5@epcas1p3.samsung.com>
 <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cca5234f-e1e8-b642-048b-b710f402409d@samsung.com>
 <20200908120019.3rmhzoijoijrbb7d@gilmour.lan>
 <3e113525-aa89-b1e2-56b7-ca55bd41d057@samsung.com>
 <20200916165705.7pfgesma47vgkfxt@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200916165705.7pfgesma47vgkfxt@gilmour.lan>
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 =?utf-8?B?64KY7ISx6rWt?= <sungguk.na@samsung.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1468173567=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1468173567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vx4lspazv3mcpaic"
Content-Disposition: inline


--vx4lspazv3mcpaic
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 06:57:05PM +0200, Maxime Ripard wrote:
> On Mon, Sep 14, 2020 at 07:14:11PM +0900, Hoegeun Kwon wrote:
> > Hi Maxime,
> >=20
> > On 9/8/20 9:00 PM, Maxime Ripard wrote:
> > > Hi Hoegeun,
> > >
> > > On Mon, Sep 07, 2020 at 08:49:12PM +0900, Hoegeun Kwon wrote:
> > >> On 9/3/20 5:00 PM, Maxime Ripard wrote:
> > >>> Hi everyone,
> > >>>
> > >>> Here's a (pretty long) series to introduce support in the VC4 DRM d=
river
> > >>> for the display pipeline found in the BCM2711 (and thus the Raspber=
ryPi 4).
> > >>>
> > >>> The main differences are that there's two HDMI controllers and that=
 there's
> > >>> more pixelvalve now. Those pixelvalve come with a mux in the HVS th=
at still
> > >>> have only 3 FIFOs. Both of those differences are breaking a bunch of
> > >>> expectations in the driver, so we first need a good bunch of cleanu=
p and
> > >>> reworks to introduce support for the new controllers.
> > >>>
> > >>> Similarly, the HDMI controller has all its registers shuffled and s=
plit in
> > >>> multiple controllers now, so we need a bunch of changes to support =
this as
> > >>> well.
> > >>>
> > >>> Only the HDMI support is enabled for now (even though the DPI and D=
SI
> > >>> outputs have been tested too).
> > >>>
> > >>> Let me know if you have any comments
> > >>> Maxime
> > >>>
> > >>> Cc: bcm-kernel-feedback-list@broadcom.com
> > >>> Cc: devicetree@vger.kernel.org
> > >>> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> > >>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > >>> Cc: Rob Herring <robh+dt@kernel.org>
> > >>> Cc: Stephen Boyd <sboyd@kernel.org>
> > >>>
> > >>> Changes from v4:
> > >>>     - Rebased on top of next-20200828
> > >>>     - Collected the various tags
> > >>>     - Fixed some issues with 4k support and dual output (thanks Hoe=
geun!)
> > >> Thanks for your v5 patchset.
> > >>
> > >> I tested all patches based on the next-20200812.
> > > Thanks again for testing all the patches
> > >
> > >> Everything else is fine, but the dual hdmi modetest doesn't work wel=
l in my
> > >> environment...
> > >>
> > >> In my environment, dsi is not connected, I have seen your answer[1].
> > > Can you share a bit more your setup? What monitors are being connected
> > > to each HDMI port? Do you hotplug any?
> > Yes, Monitors are being connected to each HDMI ports. (did not use hotp=
lug)
> >=20
> > When booting, both HDMI-0 and 1 are recognized and the kernel log is ou=
tput.
> > But after run modetest on HDMI-0(works) and modetest on HDMI-1(works),
> > crtc timed out occurs on HDMI-0 and does not work.
> >=20
> > When HDMI-0 is not working we do a modetest on HDMI-0, it will work agin
> > after about 40 sec.
> >=20
> > Below is the log for modetest.
> >=20
> >=20
> > root:~> modetest -Mvc4 -s 32:1280x720 =A0=A0=A0 =A0=A0=A0 - HDMI-0 works
> > setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
> > failed to set gamma: Invalid argument
> >=20
> > root:~> modetest -Mvc4 -s 32:1280x720 =A0=A0=A0 =A0=A0=A0 - HDMI-0 works
> > setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
> > failed to set gamma: Invalid argument
> >=20
> > root:~> modetest -Mvc4 -s 38:1280x720 =A0=A0=A0 =A0=A0=A0 - HDMI-1 works
> > setting mode 1280x720-60Hz@XR24 on connectors 38, crtc 69
> > failed to set gamma: Invalid argument
> >=20
> >  =A0=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 - Crtc timed out occurs on HDMI-0 and=20
> > does not work.
> >=20
> > [=A0=A0 71.134283] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*=
=20
> > [CRTC:64:crtc-3] flip_done timed out
> > [=A0=A0 81.374296] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR=
*=20
> > [CRTC:64:crtc-3] flip_done timed out
> > [=A0=A0 91.618380] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR=
*=20
> > [CONNECTOR:32:HDMI-A-1] flip_done timed out
> > [=A0 101.854274] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [PLANE:60:plane-3] flip_done timed out
> >=20
> > [=A0 112.094271] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*=20
> > [CRTC:64:crtc-3] flip_done timed out
> > [=A0 122.590311] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CRTC:64:crtc-3] flip_done timed out
> >=20
> > root:~> modetest -Mvc4 -s 32:1280x720
> > [=A0 132.830309] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CONNECTOR:32:HDMI-A-1] flip_done timed out
> > [=A0 143.070307] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [PLANE:60:plane-3] flip_done timed out
> > [=A0 153.310303] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*=20
> > [CRTC:64:crtc-3] flip_done timed out
> > setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
> > [=A0 163.550340] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CRTC:64:crtc-3] flip_done timed out
> > [=A0 173.790277] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [CONNECTOR:32:HDMI-A-1] flip_done timed out
> > [=A0 184.030286] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*=
=20
> > [PLANE:60:plane-3] flip_done timed out
> > failed to set gamma: Invalid argument =A0=A0=A0 =A0=A0=A0 - HDMI-0 works
>=20
> Thanks :)
>=20
> I was able to reproduce it just by also letting X boot. I'm on a good
> path to fix it and found a workaround. I'll send you the patch in the
> upcoming days :)

It took a bit longer than expected but the last 4 patches I just sent
should fix that issue

Thanks for reporting it!

Maxime


--vx4lspazv3mcpaic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX373sQAKCRDj7w1vZxhR
xaijAQCiVFUZM394JaI2etMYfTg7j/vcScUh7E138WM8+Bf0mgEAmj19xR8DPlxb
DK5k8BjAT7QqySqs5YVWfcmK8Qc4OQI=
=k2dm
-----END PGP SIGNATURE-----

--vx4lspazv3mcpaic--

--===============1468173567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1468173567==--
