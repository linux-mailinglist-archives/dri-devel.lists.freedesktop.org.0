Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38112B9C15
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82B86E82A;
	Thu, 19 Nov 2020 20:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4C89AB9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:29:48 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8DED25806CE;
 Thu, 19 Nov 2020 08:29:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 08:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6hUvGAfZ19Ea+2x3ZdtJmfNrC0h
 M1l3nty/18E6f97w=; b=M/1SReLKq+mq3zAoUbd8B2PcOa1ouyVgUaNRGYtTuZV
 ylUEeu+1f0GKNTVLTM2ldrLjCGyUgUGDfek3YtMJjiJQCksta3bdqVxQY8MtgeIa
 qftkFyPX65qVLepOLQMIyD000mkq0FG06hL5F1ASGuUNQafXWZYaQcE/ifP9oGRj
 SqGXarkVS7TWGknywSIlj1iY0A4V2bgZdkgJaE0J8lykvZwzbFBnc3yRkW1gHYqE
 +6MIcuTCfxpLpZl0IAJ21TyBBAydXK4R+O1HQnngMfDWw0RB8K7usB6juc/fRLC2
 b2ig0IKy8htkP94HDqqZp1svN39iTm9wDHIURDUOD4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6hUvGA
 fZ19Ea+2x3ZdtJmfNrC0hM1l3nty/18E6f97w=; b=E+P0MLASSihgZvoGSK+xpn
 7dmCuM52q0MNsdUs36JSrJQhmJ1dHdzdVBvtlmI6PGU20EZN6pmizrk3bKtjZK1x
 5nRKwdKbfusy3vXkWjAobQTizAhcqVXzCLxmMiDUHBs+F+EeF5wvEgrkvobnFrVI
 NJhh6gnmlAPb7FlpayM2ATdI08yUbnrpQtd5jglGDeZGrf1aU+6GNlM/KD40iVvg
 fk/ZyWqqT5B1oFQgIXfyjJwWctu6Djc1rYzfDH6TLnx+8NvWS8vi5W+s6OhPuSLf
 L8UhQ8M3MTlFBbK8qx57QA43T/hDELa0rgdMbE3Rp8+RkrnSVbFsxusQfkPZi87w
 ==
X-ME-Sender: <xms:R3O2X4evDmjjCwicuR4E4-qEFeEEpH7K__sNhtUTV9g9Z29Pnvdj7w>
 <xme:R3O2X6MiXqoWs_-u1dL0iyQxiLm9wtR8aGCfySDhOCvrGtV3rxpg1D1bKp-Nqn1Mz
 gAwXcj_YDka2ZW6M7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R3O2X5iJ11wJKjmyG4qRmUW1Hs0gMwBAqYY_e1OKvj9TqcpFPNcUXA>
 <xmx:R3O2X9-RZxpLatzx-spWWlnyd3nzLxGE0CENSIy39gvQvHFAL87RuQ>
 <xmx:R3O2X0s6_2JCdhHU7ylzsL3XLFfltiaAZIaD3ygQa7ZE_BGiQiCeZw>
 <xmx:SXO2XxOCiRatTLFY21oqQVdv6WzVQiX4yrdyG6dZIxp0P_JDCrBPLg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECF103280063;
 Thu, 19 Nov 2020 08:29:42 -0500 (EST)
Date: Thu, 19 Nov 2020 14:29:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 2/2] drm/vc4: hdmi: Block odd horizontal timings
Message-ID: <20201119132941.76fdyjfke7hnsvtp@gilmour.lan>
References: <20201029122522.1917579-1-maxime@cerno.tech>
 <20201029122522.1917579-2-maxime@cerno.tech>
 <CAPY8ntCBGBv-FkOD1qR4-xOsKSB+G1Qcy5rcebRmkVWiwpRUzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCBGBv-FkOD1qR4-xOsKSB+G1Qcy5rcebRmkVWiwpRUzw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2058031425=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2058031425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ctlopq7xqkqmmlh6"
Content-Disposition: inline


--ctlopq7xqkqmmlh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 11:14:50AM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> Thanks for the rewording :-)
>=20
> On Thu, 29 Oct 2020 at 12:25, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
> > per clock cycle, and cannot deal with odd timings.
> >
> > Let's reject any mode with such timings.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied both patches, thanks!
Maxime

--ctlopq7xqkqmmlh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7ZzRQAKCRDj7w1vZxhR
xa46AP4tNoz5LDC2RZbSM5IdAloUpS1zGpCFql9crkMpVvo+egD/QwRrF4/SN2OA
zu0OCRfH/uujUbd1z0mEfu/I3G7dLAY=
=zfUV
-----END PGP SIGNATURE-----

--ctlopq7xqkqmmlh6--

--===============2058031425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2058031425==--
