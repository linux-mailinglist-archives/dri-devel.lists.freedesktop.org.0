Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F0301438
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5B6E12E;
	Sat, 23 Jan 2021 09:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0596E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:54:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AE0B61A82;
 Fri, 22 Jan 2021 05:54:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 22 Jan 2021 05:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=aHbceojI5j+cVCfYPhriXwU8TP4
 fEYZ/NBPcWe5bQh0=; b=QJ+EZldFuw1YJjPPjCQ3ONj9wGcW7sk1nJl9UN65sBG
 OlDCzUCPcZYwUbbmfIkbsE7yPk4EwcyFwVMyl8qlliMprCExLqqIYoqqZ6Zu3Jn1
 aHn3J29pEBWG1GIDzg2KbL61QdLP2G0/6xIEJLWF7JwmmE0Aj9/8QCxiDU16LOsj
 YdeaStCQhtHkdT2EJ3oy/d1+Y1e17nMnV8UI47vZ/oNhtH/Fn89auQz2G6/aDbBk
 K7IZa19GLdff5EZEZUFndcEgscLhaoML8nJ1j04eq2KwVo4DgKOwWWM6J6S/D4Rp
 lLSJ0x9e0FwJeR0Bim7AG/daLLFrCAg/7Pf9eZkWG8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aHbceo
 jI5j+cVCfYPhriXwU8TP4fEYZ/NBPcWe5bQh0=; b=kVuIR5e85P5zXnURsQLr9r
 HkoyCGWc3bd+tuEJZcSajE4Q60gceNJcYSnqHQdasuykQDvs87VDfZip6prpaXST
 wNjlNemPZEs4cT2beupqGNiRYIw9vWJPFXj3ZDiSbPukvW56IfTrV+q55DaVU7c5
 +QdRikGc0x+T6fxP+CG7FWtdPLeFDTKt/+dcVxKG0o8Vij4p3xMk25CFSeYi6v1t
 rFi1FoDPg1dF7f1pP4tCLzebMwfuxrwTCPPVa+jzsK7pf5FY7LBH9HIedEKFK8Ae
 WhCXePBiQmuS653ZGllrGN8Q97bzo3gdx+sdFfPPWvNTJ5sKZaZj5bh9Cr1Iw9Rg
 ==
X-ME-Sender: <xms:9q4KYPbuNHV1cz_WM5lqZnu4TsMygGHeQjAbmyEbUMnWzhnAW2IwBg>
 <xme:9q4KYObe-Fz4XrBxbXYXdhPVd2tiabdjEq-GNfF61-wa76Nx304hRD-9OAtCGGSLb
 vB3BaRAtY62oqhXckU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9q4KYB_koRXc0H_qsO-v5GvZ8tB_8sbSIlP8N50LiCeZjkcFnKmSRQ>
 <xmx:9q4KYFpnWRzPex91ZlSHcH_gkH8zXkyL44_zmnRXP8atrxDeoSaBzQ>
 <xmx:9q4KYKqhJ_QJBcS8p9ugb_vDhWSZahvB9yM5RqIw9AqasOJBcViDNg>
 <xmx:-K4KYB164cZYEYE2oM1SdsXpWP4sXXNiLA9MqYUW4RFWNlcbS3mFjg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 351BF24005D;
 Fri, 22 Jan 2021 05:54:46 -0500 (EST)
Date: Fri, 22 Jan 2021 11:54:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Nussbaum <lucas@debian.org>
Subject: Re: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
Message-ID: <20210122105444.zn4uiruqwp5olyxb@gilmour>
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121110406.yeb4zoqwwgilyrhq@gilmour>
 <20210121162622.GA16797@xanadu.blop.info>
MIME-Version: 1.0
In-Reply-To: <20210121162622.GA16797@xanadu.blop.info>
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Content-Type: multipart/mixed; boundary="===============1094038199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1094038199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bgvcasrpafhi4gqr"
Content-Disposition: inline


--bgvcasrpafhi4gqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Thu, Jan 21, 2021 at 05:26:22PM +0100, Lucas Nussbaum wrote:
> Hi Maxime,
>=20
> On 21/01/21 at 12:04 +0100, Maxime Ripard wrote:
> > Hi Lucas, Ryutaroh,
> >=20
> > On Thu, Jan 21, 2021 at 11:57:58AM +0100, Maxime Ripard wrote:
> > > From: Dom Cobley <popcornmix@gmail.com>
> > >=20
> > > LBM base address is measured in units of pixels per cycle.
> > > That is 4 for 2711 (hvs5) and 2 for 2708.
> > >=20
> > > We are wasting 75% of lbm by indexing without the scaling.
> > > But we were also using too high a size for the lbm resulting
> > > in partial corruption (right hand side) of vertically
> > > scaled images, usually at 4K or lower resolutions with more layers.
> > >=20
> > > The physical RAM of LBM on 2711 is 8 * 1920 * 16 * 12-bit
> > > (pixels are stored 12-bits per component regardless of format).
> > >=20
> > > The LBM adress indexes work in units of pixels per clock,
> > > so for 4 pixels per clock that means we have 32 * 1920 =3D 60K
> > >=20
> > > Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> > > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > This one should fix your issue
> >=20
> > Feel free to test it and let me know if it's not the case
>=20
> I confirm that the patches fix the issue I was seeing.

Great. Can I add your Tested-by (and Ryutaroh, can I add yours as well?)

Maxime

--bgvcasrpafhi4gqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAqu9AAKCRDj7w1vZxhR
xSdVAQDG5uB6Tg+Z2XJz2bHuE04kBDDzIMtbiTu2UALmMoD68wD9HqtkDXPDypMD
0rktQ1XV+F+s3a01o/rAn0n9b1DZoQY=
=dLAB
-----END PGP SIGNATURE-----

--bgvcasrpafhi4gqr--

--===============1094038199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1094038199==--
