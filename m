Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACC2DDF96
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177C389A4B;
	Fri, 18 Dec 2020 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBA889581
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:49:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5EE83580343;
 Thu, 17 Dec 2020 05:49:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 17 Dec 2020 05:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Fz19MIrrom3/tNzE5t9TxRgLAhN
 NIkrSoabz4T39DXA=; b=bf1/FVPnRMiOd19HdPfs99lgjNUFAz4OlsDPNpZWevj
 PUmO0u51HUV2SQEBA8Wx8YHYtpw5V1njDDdD0NN+MG/FkythJE0sUnXfIOw1jczP
 sEpE0HzlfqeojXnmHrHUvWZayX/RnGG2PZyUurc5WxLH8Vqe44cx8Sr2XO0oj06Y
 JWOnH1Mu54EO1YcIT5UbkjvZsgyFSCvoY3nIIlO1E9YDZN1bzCfB7HGQcZzsFf8d
 tr8qY5YytMCd8AXkPC+bPj8XD+19iESWW1812IzphyFw3DID79HDYyolTh/J4P0X
 rmvRg7iT6nGlSOZsyRRdmmXSlczHxUAdfffXNqSqnrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Fz19MI
 rrom3/tNzE5t9TxRgLAhNNIkrSoabz4T39DXA=; b=dl+OtWIwi8zX57fV8vG4A9
 Vho1AmAiEDklZP3sjRMMBB1/bKY/Uhrlhrj2nWB+C8szg5rm8/SMmDTxtGUbUoPM
 q+0m3A8AfcC4+2R+lO2oUkVT7YGUTy1EW0lTngvKtzK+Z+9KixWz/f6b/1PhEqWf
 eeuYI071bcuC/0SQLeoQu7fvkM9JkTbumkJRxtVjVJxfrtrGooSwdplRkl80VBWr
 phChomLVLY9So2sSFsh/PgIWUzufhvQ6PyVv7smpT8qvU+vhufSDG8kNSonhs9hx
 MnJqXRecwoqlbbtoqL/5NGIHkvAVIaAl8LLiLek41wOMB/5AYBCqLV3oEz4yaO+A
 ==
X-ME-Sender: <xms:yzfbX8eX97v78afAK-jkGwSVjtzIgZ4K7HU2ru3169OmxeLQZYwrAg>
 <xme:yzfbX-OFMkBOlWQAf-9eSM7mUmzwMI-B3H4Zlv3Liqp1OKBHlfHAs6uld2GM5WXoH
 jLgM74_0Z0irR5wAFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvddvgffhkeefgfdthfekjeduffefheeukeeuffevgedvtddtvdehgeelhfel
 udetnecuffhomhgrihhnpeigshegrghllhdrnhhlnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yzfbX9hLcfjf6Eg53VI8r7mETEx2QBhsiDya9bGQkk5p-cAdqpPkFQ>
 <xmx:yzfbXx_HZBLZmmQvt63k91WOYdPKDKyF9b-fy2KkRiqC6c4okKgOkg>
 <xmx:yzfbX4tmpg4qcRefmg0lNVp7bfBNF8ZHryhsKCn8JV7Stxw7eDIxFQ>
 <xmx:zTfbX4E10eWJto7ZJPcmofAgPBFyYr4dBEtxjFORVHJZ35tVU7eNiA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AEC1F1080059;
 Thu, 17 Dec 2020 05:49:47 -0500 (EST)
Date: Thu, 17 Dec 2020 11:49:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Message-ID: <20201217104946.srurfmuphqzz4c4w@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <23bdb67a-fb55-42d4-9130-ade1b0396768@xs4all.nl>
MIME-Version: 1.0
In-Reply-To: <23bdb67a-fb55-42d4-9130-ade1b0396768@xs4all.nl>
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
Content-Type: multipart/mixed; boundary="===============0202327971=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0202327971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubepamncu45hulnr"
Content-Disposition: inline


--ubepamncu45hulnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Dec 16, 2020 at 01:35:43PM +0100, Hans Verkuil wrote:
> Hi Maxime,
>=20
> On 10/12/2020 14:46, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series introducing the CEC support for the BCM2711 found on the
> > RaspberryPi4.
> >=20
> > The BCM2711 HDMI controller uses a similar layout for the CEC registers=
, the
> > main difference being that the interrupt handling part is now shared be=
tween
> > both HDMI controllers.
> >=20
> > This series is mainly about fixing a couple of bugs, reworking the driv=
er to
> > support having two different interrupts, one for each direction, provid=
ed by an
> > external irqchip, and enables the irqchip driver for the controller we =
have.
> >=20
> > This has been tested on an RPi3 and RPi4, but requires the latest firmw=
are.
> > It's is based on the 10 and 12 bpc series.
>=20
> This series looks good to me. Before I give my Acked-by for this series, =
can you
> confirm that it is possible to transmit the Image View On message on both=
 outputs
> of the RPi4 when the HPD is low?
>=20
> See section "CEC Without HPD" in https://hverkuil.home.xs4all.nl/cec-stat=
us.txt
> on how to test this with a Pulse-Eight device.
>=20
> This should work.

This is the output on the RPi4:

# cec-ctl --playback
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

# cec-ctl -t0 --image-view-on
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None


Transmit from Unregistered to TV (15 to 0):
CEC_MSG_IMAGE_VIEW_ON (0x04)
	Sequence: 1 Tx Timestamp: 77.631s


And this is the output on my desktop with the Pulse-Eight:
$ sudo cec-ctl -p0.0.0.0 --tv
Driver Info:
	Driver Name                : pulse8-cec
	Adapter Name               : serio0
	Capabilities               : 0x0000003f
		Physical Address
		Logical Addresses
		Transmit
		Passthrough
		Remote Control Support
		Monitor All
	Driver version             : 5.9.8
	Available Logical Addresses: 1
	Connector Info             : None
	Physical Address           : 0.0.0.0
	Logical Address Mask       : 0x0001
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : 'TV  '
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 0 (TV)
	    Primary Device Type    : TV
	    Logical Address Type   : TV
	    All Device Types       : TV
	    RC TV Profile          : None
	    Device Features        :
		None

$ sudo cec-ctl -M
Driver Info:
	Driver Name                : pulse8-cec
	Adapter Name               : serio0
	Capabilities               : 0x0000003f
		Physical Address
		Logical Addresses
		Transmit
		Passthrough
		Remote Control Support
		Monitor All
	Driver version             : 5.9.8
	Available Logical Addresses: 1
	Connector Info             : None
	Physical Address           : 0.0.0.0
	Logical Address Mask       : 0x0001
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : 'TV  '
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 0 (TV)
	    Primary Device Type    : TV
	    Logical Address Type   : TV
	    All Device Types       : TV
	    RC TV Profile          : None
	    Device Features        :
		None



Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)

So it looks like it's working as expected?

Maxime

--ubepamncu45hulnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9s3ygAKCRDj7w1vZxhR
xb/QAP4sjWL/MqcJFqZCGoWPN/WYGWrGCwbWn1yMP2uJ3w1eiQD/WCKs0iECflyQ
FQ7LIfCYTFsXHbNBtI79BxJztB7VnAs=
=2QGA
-----END PGP SIGNATURE-----

--ubepamncu45hulnr--

--===============0202327971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0202327971==--
