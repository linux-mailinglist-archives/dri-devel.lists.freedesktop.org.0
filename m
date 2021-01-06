Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B92ECC02
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD846E441;
	Thu,  7 Jan 2021 08:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619166E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 15:09:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A3A4E5C0164;
 Wed,  6 Jan 2021 10:09:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 06 Jan 2021 10:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5gjArqtMK49wtPn4mdFfSEhjLXB
 JrLxnhN3Ijs3kukw=; b=X4LZCNFFU0XQVhmu7oyi4RtR6Z9nh9c8lqWYPWSgQcd
 VAvzSAy1EzxdddWbnp8GtDeHmkr66TnCjuzQ2RYlbxaaZF9kNGZpSoLJYmZT3CZk
 qcnRk/nsoTITq9yavH0TADzDKdVRpY47U4PWh0nVQaq5nDgksulyFuF9UBR4HeSa
 sXfMF2POSI5F9nb6NCERLK7b3P/yxNDVq1U41wIQtGMLwcTJrZ3f8m6QE0PDwM/h
 JpqjUoWzPw/x6m+pIA+LPIdIBQ+eccSn7I1MB04mhpIhFCVm9oDVG9l8Z2Fq/S80
 Uj3ckeKxbzgxugaj1TxKPvaz45VfDZMttb3tdr9CrdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5gjArq
 tMK49wtPn4mdFfSEhjLXBJrLxnhN3Ijs3kukw=; b=lBaLAQTwgdoVwgI/MkwHuW
 V1yHtQn9zifzLZRaUW5xVt2Vg1d/fSZMLom2BtFP0hH73rnU8izNlHOjI4ufnlDL
 L4JlUwUyFSmSWtk4VSVNFDFBN162ranhRWXzFOg2uLvfOMwggu8P7LBc7CbFWzbQ
 8kah++nzsZR00fPeX0tw0tOf+lK5OoyKYsub6ZfWD+qOLoPR/zEkKVSkJyicRPE/
 jupXEgpv34t2hOPhOCzRWz0bn0d1LmzXPyp07q6/U3e+ZLCQYtVSfhmVSEU62obK
 803uGTrrNdSGi3DJd3oH6IuX+PSZNA9Nxcwhd0JA4pYJqPQG04zvALOZqbsthHXA
 ==
X-ME-Sender: <xms:qtL1XwORHYd3k7kag_-Q7XymXzis4Gb-Vs25W599KPQbSwnCaZd9lA>
 <xme:qtL1X2-MmahjrWlGjpK-n5NV_BLBpnTPs0VTtt08coAhj2qkC8a7Ps_-vXAS57Ri2
 G6VRODhg05Cqx5sgnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qtL1X3TdQG3wccNBU-OraYe8jpWL0fNFkFhq7noPq5aB425j2_lggA>
 <xmx:qtL1X4vuZ8_ZMXxMPL5wE4dfWTGIFiASja-eOTzjdJH7norBiv1g9A>
 <xmx:qtL1X4c3-V03AJyl6zu4faIfAMbbUGfd_vSESIs9JQiy1bL_ZolRyw>
 <xmx:qtL1X2sQyzYUKM6pNmUAooo3eOFR5mjVKwJwX7uxXaCD-taC4OnwpQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B53524005E;
 Wed,  6 Jan 2021 10:09:30 -0500 (EST)
Date: Wed, 6 Jan 2021 16:09:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V2 3/4] drm/v3d: Don't clear MMU control bits on exception
Message-ID: <20210106150929.qsyuosde6i5q3isc@gilmour>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
 <1608755714-18233-4-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1608755714-18233-4-git-send-email-stefan.wahren@i2se.com>
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Phil Elwell <phil@raspberrypi.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1839128608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1839128608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2nctgfpclejtadnf"
Content-Disposition: inline


--2nctgfpclejtadnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 09:35:13PM +0100, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>=20
> MMU exception conditions are reported in the V3D_MMU_CTRL register as
> write-1-to-clear (W1C) bits. The MMU interrupt handling code clears any
> exceptions, but does so by masking out any other bits and writing the
> result back. There are some important control bits in that register,
> including MMU_ENABLE, so a safer approach is to simply write back the
> value just read unaltered.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied, thanks!
Maxime

--2nctgfpclejtadnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/XSqQAKCRDj7w1vZxhR
xWUMAP4z4TWr3FoBE/CWJnAwLw8fKrqWH9x+p6HVVEYKX30iSQD7B4Q7EvESDQ3m
T4s+oxUroC9c8J022LnY3qfR3xrKYgI=
=s7a+
-----END PGP SIGNATURE-----

--2nctgfpclejtadnf--

--===============1839128608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1839128608==--
