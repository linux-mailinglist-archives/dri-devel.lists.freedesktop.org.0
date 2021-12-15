Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9E47559F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E92410E231;
	Wed, 15 Dec 2021 09:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FDD10E231
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:57:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24B0F5803D1;
 Wed, 15 Dec 2021 04:57:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 15 Dec 2021 04:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=GAS8IkqPCbXeURmEm1mcqqzqrs3
 wpFYEKRdMNveUqVQ=; b=Pe/QOWNBfq8NmSRi0PLwRoj0xVdqrJ/ClZT37EYdBx5
 lKvzUlLBztn6IdmJdMdHHXMbEbW1rPjZ3I0Wq5w/X1bFCELY5u30wmCB1HbeCDDY
 Q7yPE3Wgm01H8BTwF2FpDCmC1WaJsZ645JTbVyUy8LJT9GDN3YfHvFtfHjEvOmtK
 zbokUDRldxbZ2U+dQm0hwjCGYRary/JfJvNJRXCmRWoYHshRHRaDQKBak23jLTq/
 sKpPNvtiHsv7g8hGGdabdp5ejGRmW69JGOCiW53rUDEQj2QXEkUkkHXR/YxW+Mxh
 ToSL087o5E78tXgFy/X8Xz/g5JlMBX6wy8Qd8TVG2SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GAS8Ik
 qPCbXeURmEm1mcqqzqrs3wpFYEKRdMNveUqVQ=; b=Vsfq2MyGqTvxrPgN2/lyN1
 HQBKy/UW8aLZ89MO0rpz8I70b4FjvjfGQ0bELgIO9h5htoE4rP8ypdJGUEAnZQZK
 groS//1VIIAAFS8Z+aoA1X6E9bDIhFcVDv886lduxj0jph5gnQS0AqTSfFfmtbJ6
 zTi6V5JQJuNSp90GtifY7RJ5K1E/zcpBqYC0vgphursEzYCYMLjT0iLiYJr4Ao53
 eDXhdsDGsDaOcOEp18eIpXoc/SgIqWyxx2vhGp6KhVS3xvUFthaUGyHgtcK4Ozxn
 3Mnz3whFnwTBrSsE7tHk5L/ceP6A3Mq06av2yifTkTkA+7GDQrkiy7kVajGp528g
 ==
X-ME-Sender: <xms:-bu5YQVyPlbzBJI3c6lLaeavZiUCvtHO9cWOfNvS8fKFMccLqNM_oQ>
 <xme:-bu5YUkmmY3sr9BY8E6h1BAvV6uWzlGzzbS1sPVTP9nmFyfIh6t9M5GntagCGnLXB
 9qeKnpfdaQQEaDLlhc>
X-ME-Received: <xmr:-bu5YUY7R3M8q2qYT7DdE_iObra7MILBl_iExHzTFslI_fxbY0VKaFO-KW8uhXc76F7ciPRLLcBQMJHZNXYITw3fA0YXbPVsUgVw2XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-bu5YfWMALI5Y5nGThcS6URnXyD_vKwUNiIlpzIhDMbqBTzTzOR_DA>
 <xmx:-bu5Yanm_-ysvRV3z9bqGdSFTfq-X0qno9JZs9D5mIuHlUJJnxAjvA>
 <xmx:-bu5YUeo44TP9kDsWuciLYwX0zEg6dpmRBSwCips6Jlo-6Lbmwbobw>
 <xmx:-ru5YZrXYdQqcJ0_hGqfKbsogasoMbliJBgUQImGHg2EQOuWdCWekw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:57:13 -0500 (EST)
Date: Wed, 15 Dec 2021 10:57:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH RESEND v4 v5 0/4] drm/vc4: Use the firmware to stop the
 display pipeline
Message-ID: <20211215095712.sspesda4vcrzwlbd@houat>
References: <20211215095117.176435-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pnnrjba3fn62na4v"
Content-Disposition: inline
In-Reply-To: <20211215095117.176435-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pnnrjba3fn62na4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:51:13AM +0100, Maxime Ripard wrote:
> Hi,
>=20
> The VC4 driver has had limited support to disable the HDMI controllers and
> pixelvalves at boot if the firmware has enabled them.
>=20
> However, this proved to be limited, and a bit unreliable so a new firmware
> command has been introduced some time ago to make it free all its resourc=
es and
> disable any display output it might have enabled.
>=20
> This series takes advantage of that command to call it once the transitio=
n from
> simplefb to the KMS driver has been done.
>=20
> Let me know what you think,
> Maxime

And I forgot to drop the RESEND v4 prefix.. This should obviously read PATC=
H v5

Maxime

--pnnrjba3fn62na4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbm7+AAKCRDj7w1vZxhR
xR1PAP9Kr/xE7dp6CwmZN47vhbFH2ZKE7+7TmWiu/iQ7Qq6MvwD/SB/aI4VTSFtU
K/+lQb6sCOYWa+uGHbsvs78DHWR2sQ0=
=XnxS
-----END PGP SIGNATURE-----

--pnnrjba3fn62na4v--
