Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD22D25F4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B36E94E;
	Tue,  8 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157889CAD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:34:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2515A5FA;
 Mon,  7 Dec 2020 04:34:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 04:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/Emj3v2SVPVn3V/pAVdsQ5PGHCL
 Dfqei2+CsZThbjz8=; b=Js86pzprB07u7VlEKXWn6/AuX3irAOiyfUq07PJN3Gp
 rsF7aSbALMb3okjL+g1Ii8fzTFOh5MXV0rLDnpGjnYoJZgQf5b7LeQ6EDSMORPYA
 /sYemIb/Q6I9Z84WHMceU6ATX3ivYWh3MIVZExjMhkCKvPXFSE0FKxcVTp0SOUU4
 UEo+3pKVG2WaoPQ7V/MNdFNAXhLjjJfYY64lxg2sEuhefs3P2NHu3L5nHQ7vKZXz
 bTMglYG+/L7uqHjKAaqcoHe5VDjkfbMCZzLOrniNwIBkWwO2BJhDnhkltlaTVl0Y
 q3IhTgYbDW6j7IQoSunfoiSBVYcMww7SEr87q+LsnLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/Emj3v
 2SVPVn3V/pAVdsQ5PGHCLDfqei2+CsZThbjz8=; b=qfvzHxQhFccBSesNP2pScF
 eK+ZHDNOCh8T0D2GGLy/IU8Z4iEdQWEjEtv0BuyYSI/wOepsGVIUIKVZp8jKDCl1
 B9ydniyESyqTLCCybiRAsCybySYcTvPQYX1J2gmpgLEJXAaVcVCJVdVOGDx9lvZG
 CtX3LtPS3ciZSHqmBEq67jiHjj3D+T2Qpd24b3VLk+3sWDpUuzUhpEH1dhUl/ljq
 5yhy+CnOKCaSkrjLt5V79YeSONlqVqBRTQwhVrlCxmQZ4bhk7PL3f1YhA2bbw9cp
 1qcf/JCjKWzoh117JGp6FwSLz0WzhYJuY5IO7JriCLh4YB4gSICsefEjVSwqJfgA
 ==
X-ME-Sender: <xms:HffNX4o_dBGn6WQd8SNREOzuwkDFlc7XxUaNfpCxXAz0Ra57746PiA>
 <xme:HffNX-olw2ZvmWuYKlGqldGgQyeArhsOlHiDV_CU-_fifKEBxJ1WvSoEvT4yxrYYV
 Ix9MoEOz0gzT9VGGPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HffNX9O4P-wcd2O15oX2Y9oE2lpbn80HuKCdWFIAw7K5iuscE80I3A>
 <xmx:HffNX_6vlnjnRtw9vvjUD8LpvZK1ad3Qx-X3cLeRX9ebwG14LYdFHg>
 <xmx:HffNX37nsnjuBQNgG_PzBctn3fiDulFkLkvKt_3ehRuYUTaRFmWN6Q>
 <xmx:HvfNX6b-SX4rBvocHjn1kC9o2dIR7Ltuh5rndaPZxH1rKJ6a4FjtxA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 677D0108005C;
 Mon,  7 Dec 2020 04:34:21 -0500 (EST)
Date: Mon, 7 Dec 2020 10:34:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/8] drm/vc4: DSI improvements and BCM2711 support
Message-ID: <20201207093420.snodt2wxevwswgpf@gilmour>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <CAPY8ntBF8fDiOXRexkd_BkscuifBO7T0+_iVJ3S7B030gOBceQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBF8fDiOXRexkd_BkscuifBO7T0+_iVJ3S7B030gOBceQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0954485903=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0954485903==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lb7o6dlthwxvopq5"
Content-Disposition: inline


--lb7o6dlthwxvopq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 03:19:15PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 3 Dec 2020 at 13:25, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > Here's a series adding support for the DSI0 controller in the BCM2835 a=
nd the
> > DSI1 controller found in the BCM2711.
> >
> > Let me know what you think,
> > Maxime
>=20
> Thanks for that series - your using a variant structure is much
> cleaner than the hack I had.
>=20
> For those that I didn't author (ie 1, 3, and 4)
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied 1-7 to drm-misc-next

Thanks!
Maxime

--lb7o6dlthwxvopq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX833HAAKCRDj7w1vZxhR
xYRhAQC1d7zcIP2wKeMfkOxxokkSgUl65PpDt7AAF1ge0XfD1QD+ISZn/tTaJNa2
mbSqkbfGidispMHs6Rc3xDzqjU1/8wU=
=BmyJ
-----END PGP SIGNATURE-----

--lb7o6dlthwxvopq5--

--===============0954485903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0954485903==--
