Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F24678D0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B757ADB1;
	Fri,  3 Dec 2021 13:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89057ADB1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:50:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 17E32580295;
 Fri,  3 Dec 2021 08:50:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 03 Dec 2021 08:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=akxh18q/9FuvUwVb7rrBtJj3NXJ
 qPeKLLTOAQ2VJUIQ=; b=E7QA6va/ODxxan6vWieR2bwBdEIUHq7Kf+abT7KsSig
 4/4p9Yn5u//NkG5/vzhkoeEhF1pQltG6miFk9x4en/4O0mzJB6FlnNlde+OkoXVy
 oCc9tFvgjlrAoSRW6nzJUs0liTVV3kYbdX/Mj10ltmffwgxP4djJCSpJAYRo23n/
 sW89zGCUx/2YTs1mno1LL/EhAyUsS0XltonExj4tf9dSjAzXjh10P62UditIxomm
 uaUykjsf82mLSDgVIwrJmy+u29r3pTEyo4DgbeWZjFU6UlkInPHdgCG+YG8VfHuG
 81zGbaJmVC7u3C/n3jYiuqLmH0iayLjUPteqzg3DJAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=akxh18
 q/9FuvUwVb7rrBtJj3NXJqPeKLLTOAQ2VJUIQ=; b=Idg3YLCARZnnctOADGP+P0
 iGwYvMLahclfsoddlBJ3kLeDvsEMl68gfbPHYTztzkVNafHj+SW2sFiDQ8OV26y7
 eYjm27xBLI/CqTmy2JjT1Cqk00TgH6UKpfVB2anenA+v683YG2hE1wABrGwJXJI3
 /JGfBWijuA+GeX3G6K5dOx1K+u19g0d+d9QAaJfJkk9PwTuvgg3U4ig6Jy8kTH9L
 nZ+J02k/jhE2esdGW9HT+Zo80kRIy2qEkdcz7AVF0pT+0aqqTPJLrgAe5Rjv7+9F
 fjZ2AJ92V9U7pLkY91iVTJCKa2JRrZ9DGB/6/G/SP+dDSlfC7F2kz0uY8c6UsiLw
 ==
X-ME-Sender: <xms:oiCqYS5uMUMlNJNxSF8rBdNuYu7XeybmMfDtXOEhP7rqrBAHel9WOw>
 <xme:oiCqYb5ZZ8MHTU01PMyJE2UM_LrsRo2Z2QzsMD4MQJtJJpraKY18THAHuF6ZBRdWH
 MVTiXS4AEF6LJ3Dr1A>
X-ME-Received: <xmr:oiCqYRdCKoTO8afSUyiKPqkolWdLTck8MNJjmaAst48HL-5WnCVqz5I14gB3MOfCXXGqJ_adDArXTAEhP81EKSw6_cD-f0_aaJR8lR0l07CWKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oiCqYfI5dmFAbgfrc7e4dWafAU3-bIoFLxCgQelpix_rDWU6TSr1cg>
 <xmx:oiCqYWLcwTrYaFODz53WzbWGuykGP_tsXrvkYZHb97oxXxkjuZ-Cyw>
 <xmx:oiCqYQx-ydegMGLT1GGU90wGfqJiNUQRiEZiJ17oxFDR0SoO9NN9tw>
 <xmx:oyCqYXdo7oWY_r0SGG-HqS9hggzlw9XdfAskc7NPOxTmf1ni6iyuiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 08:50:25 -0500 (EST)
Date: Fri, 3 Dec 2021 14:50:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: nicolas saenz julienne <nsaenz@kernel.org>
Subject: Re: [PATCH 0/5] drm/vc4: Use the firmware to stop the display pipeline
Message-ID: <20211203135023.sbj4uxwsaoeakfjj@houat>
References: <20211117145040.334827-1-maxime@cerno.tech>
 <cad0e66b5cb88f224bbbe54e7ed8552275864733.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o2ikn7rqgar5nz4m"
Content-Disposition: inline
In-Reply-To: <cad0e66b5cb88f224bbbe54e7ed8552275864733.camel@kernel.org>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o2ikn7rqgar5nz4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Tue, Nov 30, 2021 at 12:45:49PM +0100, nicolas saenz julienne wrote:
> On Wed, 2021-11-17 at 15:50 +0100, Maxime Ripard wrote:
> > The VC4 driver has had limited support to disable the HDMI controllers =
and
> > pixelvalves at boot if the firmware has enabled them.
> >=20
> > However, this proved to be limited, and a bit unreliable so a new firmw=
are
> > command has been introduced some time ago to make it free all its resou=
rces and
> > disable any display output it might have enabled.
> >=20
> > This series takes advantage of that command to call it once the transit=
ion from
> > simplefb to the KMS driver has been done.
>=20
> I think it would make sense to integrate this funtionality into
> 'reset/reset-raspberrypi.c' and pass it to VC4 as a reset controller. It =
fits
> the same startup situation as the one we have with the USB controller. Al=
so, it
> would contain the firmware weirdness in a single spot.

I don't really think it makes sense. It's not really made for that
purpose, affects multiple devices (basically, all of the devices from
the display pipeline), and can even have some side effects on clocks and
memory. Plus, it can only be done once iirc, so a later call to reset
the pipeline will be ineffective, even if we changed its state.

So yeah, it doesn't really fit into the reset abstraction.

> Otherwise, please use 'devm_rpi_firmware_get()'.

Will do, thanks!
Maxime

--o2ikn7rqgar5nz4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaognwAKCRDj7w1vZxhR
xfE0AP47WTZwzJ3tx6UI2x9jdCgNkdqfPqY9KklclX/AmO1XjAD/eU5lLomwBy1e
NIXKZaV72SSlVI+jlzoLNNyYMyHUOAM=
=vVMw
-----END PGP SIGNATURE-----

--o2ikn7rqgar5nz4m--
