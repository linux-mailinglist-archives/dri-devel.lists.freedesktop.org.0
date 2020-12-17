Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD992DDF9C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34A89A7A;
	Fri, 18 Dec 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09846E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:59:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8AA567F9;
 Thu, 17 Dec 2020 07:59:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 17 Dec 2020 07:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=nAhVtWrDkd61G5pxUHemYZDSqXG
 grHNp+6N+yclpKH0=; b=rds139swIOm51os10Z7Gm12FNXY1sy9cOpIaVXYj9+Z
 FON/+1UMlltUXUld1n9tcrwww8b+uuzchs1jCT0ICfy1YRKFX2j70XTZO0DM+RLk
 b12p9CqmAfMdEoLfoHhJvC9+RZM1YuecC6tQTudvxiE0f0CzqwKBMN4Bb5Oh99D/
 FFPW8JbpBB8Mto5nU7pzJaQUSGvOb2jV5sujQJGY7R6hrg79vHgkSfsA1tmKo/Ib
 wMDnWYSYCVHFpn4/9CgYkLBpXm2tPIAaokja2Uvul5Ly8X0Jo8OTb5aAa/jHUFRo
 vkh/acp+CDU7acR11DE+1RBd7yWrZQIsTCI5TEEFMtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nAhVtW
 rDkd61G5pxUHemYZDSqXGgrHNp+6N+yclpKH0=; b=ChCaOH+AZmvNgQEWgDElWj
 ZVNGlshYbSFEYBBzv86sF557a8AIqsXzzAxPoIQYIy+yZcGvCLDTewPqCHqedyfY
 BrsuPWj0GrVFey+ShwxiDs5XcajRNJa0nh/a8zUJg0XecXDKuRvkKMLLTw/BfoXQ
 DFFkhDON5n1737SqjDygUDjwCtAf2sAul388vtsmP7t+YF8HHUzNRK6dnyg9DvPz
 vrR6d3Y7xHuztOwL5vATyU6Ezp2yFovyIp7HKZorqsXq7NRSQUzXRidGcxVul2oE
 1Q3RR1+aLn39iqJOEHq4UWGJCvYW0ckEMoRM+tLLw0VDRQZ7ohuIWFQV+C7aRqpw
 ==
X-ME-Sender: <xms:LFbbX90KdwgaK27ar2A0p_0mwPijj--BXGsJLhrkTVoWC9HIMa0vFQ>
 <xme:LFbbX0FKJIAALa0SZyXUxa3VXYrjmDkvlSHdnOJuV7TuQtvFMncAkiEICAXfJVV52
 hyTcin2YMAQaY2HVNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvddvgffhkeefgfdthfekjeduffefheeukeeuffevgedvtddtvdehgeelhfel
 udetnecuffhomhgrihhnpeigshegrghllhdrnhhlnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LFbbX95bdvP_gOG587BSOseI6RrAQOSHFaFfQnT5EHbRIWRxgt6OtA>
 <xmx:LFbbX639eXnMjGVMKICyxgNIPW9vIv7WxM7OmJoW-PYmTYiWrTHkKQ>
 <xmx:LFbbXwE1mnC1O9jtzIOzqQl3SeW5w7dpUg7SbFowiFxtqyMnZU6-Bw>
 <xmx:L1bbX9dWf9aEA80Mb2g43x-7LWyP5YwXGjTsToWoBYfQPyw_VbxkcDqNb3E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AAE21080063;
 Thu, 17 Dec 2020 07:59:24 -0500 (EST)
Date: Thu, 17 Dec 2020 13:59:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Message-ID: <20201217125922.bx3wx3dwcl6lojre@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <23bdb67a-fb55-42d4-9130-ade1b0396768@xs4all.nl>
 <20201217104946.srurfmuphqzz4c4w@gilmour>
 <cc3e0adf-ba44-7593-40ec-3d2c1efcba02@xs4all.nl>
MIME-Version: 1.0
In-Reply-To: <cc3e0adf-ba44-7593-40ec-3d2c1efcba02@xs4all.nl>
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0041928254=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0041928254==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4u5pz2ddgui6hzza"
Content-Disposition: inline


--4u5pz2ddgui6hzza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Dec 17, 2020 at 11:53:42AM +0100, Hans Verkuil wrote:
> On 17/12/2020 11:49, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > On Wed, Dec 16, 2020 at 01:35:43PM +0100, Hans Verkuil wrote:
> >> Hi Maxime,
> >>
> >> On 10/12/2020 14:46, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> Here's a series introducing the CEC support for the BCM2711 found on =
the
> >>> RaspberryPi4.
> >>>
> >>> The BCM2711 HDMI controller uses a similar layout for the CEC registe=
rs, the
> >>> main difference being that the interrupt handling part is now shared =
between
> >>> both HDMI controllers.
> >>>
> >>> This series is mainly about fixing a couple of bugs, reworking the dr=
iver to
> >>> support having two different interrupts, one for each direction, prov=
ided by an
> >>> external irqchip, and enables the irqchip driver for the controller w=
e have.
> >>>
> >>> This has been tested on an RPi3 and RPi4, but requires the latest fir=
mware.
> >>> It's is based on the 10 and 12 bpc series.
> >>
> >> This series looks good to me. Before I give my Acked-by for this serie=
s, can you
> >> confirm that it is possible to transmit the Image View On message on b=
oth outputs
> >> of the RPi4 when the HPD is low?
> >>
> >> See section "CEC Without HPD" in https://hverkuil.home.xs4all.nl/cec-s=
tatus.txt
> >> on how to test this with a Pulse-Eight device.
> >>
> >> This should work.
> >=20
> > This is the output on the RPi4:
> >=20
> > # cec-ctl --playback
> > Driver Info:
> > 	Driver Name                : vc4_hdmi
> > 	Adapter Name               : vc4
> > 	Capabilities               : 0x0000010e
> > 		Logical Addresses
> > 		Transmit
> > 		Passthrough
> > 	Driver version             : 5.10.0
> > 	Available Logical Addresses: 1
> > 	Physical Address           : f.f.f.f
> > 	Logical Address Mask       : 0x0000
> > 	CEC Version                : 2.0
> > 	Vendor ID                  : 0x000c03 (HDMI)
> > 	OSD Name                   : Playback
> > 	Logical Addresses          : 1 (Allow RC Passthrough)
> >=20
> > 	  Logical Address          : Not Allocated
> > 	    Primary Device Type    : Playback
> > 	    Logical Address Type   : Playback
> > 	    All Device Types       : Playback
> > 	    RC TV Profile          : None
> > 	    Device Features        :
> > 		None
> >=20
> > # cec-ctl -t0 --image-view-on
> > Driver Info:
> > 	Driver Name                : vc4_hdmi
> > 	Adapter Name               : vc4
> > 	Capabilities               : 0x0000010e
> > 		Logical Addresses
> > 		Transmit
> > 		Passthrough
> > 	Driver version             : 5.10.0
> > 	Available Logical Addresses: 1
> > 	Physical Address           : f.f.f.f
> > 	Logical Address Mask       : 0x0000
> > 	CEC Version                : 2.0
> > 	Vendor ID                  : 0x000c03 (HDMI)
> > 	OSD Name                   : Playback
> > 	Logical Addresses          : 1 (Allow RC Passthrough)
> >=20
> > 	  Logical Address          : Not Allocated
> > 	    Primary Device Type    : Playback
> > 	    Logical Address Type   : Playback
> > 	    All Device Types       : Playback
> > 	    RC TV Profile          : None
> > 	    Device Features        :
> > 		None
> >=20
> >=20
> > Transmit from Unregistered to TV (15 to 0):
> > CEC_MSG_IMAGE_VIEW_ON (0x04)
> > 	Sequence: 1 Tx Timestamp: 77.631s
> >=20
> >=20
> > And this is the output on my desktop with the Pulse-Eight:
> > $ sudo cec-ctl -p0.0.0.0 --tv
> > Driver Info:
> > 	Driver Name                : pulse8-cec
> > 	Adapter Name               : serio0
> > 	Capabilities               : 0x0000003f
> > 		Physical Address
> > 		Logical Addresses
> > 		Transmit
> > 		Passthrough
> > 		Remote Control Support
> > 		Monitor All
> > 	Driver version             : 5.9.8
> > 	Available Logical Addresses: 1
> > 	Connector Info             : None
> > 	Physical Address           : 0.0.0.0
> > 	Logical Address Mask       : 0x0001
> > 	CEC Version                : 2.0
> > 	Vendor ID                  : 0x000c03 (HDMI)
> > 	OSD Name                   : 'TV  '
> > 	Logical Addresses          : 1 (Allow RC Passthrough)
> >=20
> > 	  Logical Address          : 0 (TV)
> > 	    Primary Device Type    : TV
> > 	    Logical Address Type   : TV
> > 	    All Device Types       : TV
> > 	    RC TV Profile          : None
> > 	    Device Features        :
> > 		None
> >=20
> > $ sudo cec-ctl -M
> > Driver Info:
> > 	Driver Name                : pulse8-cec
> > 	Adapter Name               : serio0
> > 	Capabilities               : 0x0000003f
> > 		Physical Address
> > 		Logical Addresses
> > 		Transmit
> > 		Passthrough
> > 		Remote Control Support
> > 		Monitor All
> > 	Driver version             : 5.9.8
> > 	Available Logical Addresses: 1
> > 	Connector Info             : None
> > 	Physical Address           : 0.0.0.0
> > 	Logical Address Mask       : 0x0001
> > 	CEC Version                : 2.0
> > 	Vendor ID                  : 0x000c03 (HDMI)
> > 	OSD Name                   : 'TV  '
> > 	Logical Addresses          : 1 (Allow RC Passthrough)
> >=20
> > 	  Logical Address          : 0 (TV)
> > 	    Primary Device Type    : TV
> > 	    Logical Address Type   : TV
> > 	    All Device Types       : TV
> > 	    RC TV Profile          : None
> > 	    Device Features        :
> > 		None
> >=20
> >=20
> >=20
> > Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
> > Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
> >=20
> > So it looks like it's working as expected?
>=20
> Yes, it looks good. Make sure you test this for both outputs of the RPi4.

It's a good thing you asked, I don't appear to get CEC interrupts from
HDMI1. I'll fix it and send another version (probably not before the end
of december though).

> If it works for both, then you can add my
>=20
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>=20
> for this series.
>=20
> Very nice work, thank you for doing this!

Thanks!

I'll hold your a-b until the next version though, fixing hdmi1 might
change a few things.

Maxime

--4u5pz2ddgui6hzza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9tWKgAKCRDj7w1vZxhR
xVdvAQDHuSRkKxYlgj3+2EqQTksC/VHwJz4gK9OkV9xSfhloJQEA1zz9IR3RFXAN
SWKYX8zarHyj+PLw8tW6ddst/1rk+A0=
=49ci
-----END PGP SIGNATURE-----

--4u5pz2ddgui6hzza--

--===============0041928254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0041928254==--
