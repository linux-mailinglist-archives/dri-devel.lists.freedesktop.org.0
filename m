Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9012ECBEB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500906E409;
	Thu,  7 Jan 2021 08:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC66E20C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 15:09:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A05D5C018D;
 Wed,  6 Jan 2021 10:09:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jan 2021 10:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Sv7zOkO35QNvssuOvkH5GXtwN31
 MNEA33TtvRMSJ5s0=; b=nMGJxwmJPp7WwnyrWZ3mVM0btfdS7dLBZAKNdlLmnRm
 g2serjJSI/pR9mIM0rlMXiFxFx0iUD3PeD+J0CSX2QE52iQXgDyVSFadUvaoJ8r3
 9qZ8y1yXXBZz5g6LVt74XZsAwvNQCCl95Cb2AveLzXaK5DzyYRv2u7zeQPA1OSiE
 p6Ko38qCD9grfxT2C82jQ6iIMLirsSfTiLpdpbbP+G7IxsZTTX7PK6D25pNGT3wO
 Gs3+8qB174iFkSQu5jEM0bqWn+ARu2ZOd+OH+x7lFMAKhn+xtNl1OXiScEDuVsxh
 I24jquiJBzez+y++SwKvyYA9LYKRicFx6KV44EEOgTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Sv7zOk
 O35QNvssuOvkH5GXtwN31MNEA33TtvRMSJ5s0=; b=hUpwu3xxl55sCTcciciosq
 PQ1lXMzsuV5nZsyrIOFm0r5J0rdOCOmrctbCQ6h+dxoUDUtwO32sWOmlTnbjeFnx
 So8F+QlzWOBL+liDyqUdCpE4EZtavukEVTl+DLLYexd6zvnYI49ZWC/18IyCPlaK
 S+2AlRiFGeQpA9746fb3MKm2miutBs5WdFgFQWvz8kUNIDt65DvK8EXC1z3X+/9C
 YX0nOnVJ45xyheW/6dFji8cfJ2Ce6jN40WpqjMMIgpFxqLgPMul4Or1y3YrJT37F
 CTDfvaUayMMbJH828uNhf5jYmu6WCnD1+wnVt/Aw7wQbgvk9b3H0Nx4pAawoJKMw
 ==
X-ME-Sender: <xms:odL1XwrWUPIGv4cJjR2823i2KtLJnKu7-OJz2yk6yfTsiGoslQ3REA>
 <xme:odL1X2mfZTLJJF7YsrKoEzkn22O_7lNoTlLFncr8Y7UU1Fxt1yAY3cMj3nwh1yxFL
 Lg4Z6mvZ8Pxk5cgKpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:odL1XyErbmY9gg6nMe3Z0BN8lURHYvXt8o6eU08VjrSWEicD9MddPQ>
 <xmx:odL1X_rvvrmEBWwmBGVTEdaXzb-MFPepy804YwETpkkPHH8CDiM1LQ>
 <xmx:odL1X-7SXbdu6Oh2YMnOLxl4crE4xJN7K_Ociw1HIHpHmVFPfThEaQ>
 <xmx:o9L1XxublJSeG_okEH2yWifSvJDpw9JTZ6teYhrisEaYZtng13XfaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06B5D24005B;
 Wed,  6 Jan 2021 10:09:20 -0500 (EST)
Date: Wed, 6 Jan 2021 16:09:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V2 2/4] drm/v3d: Set dma_mask as well as coherent_dma_mask
Message-ID: <20210106150919.5xeodokjrokmpakc@gilmour>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
 <1608755714-18233-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1608755714-18233-3-git-send-email-stefan.wahren@i2se.com>
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
Content-Type: multipart/mixed; boundary="===============1735113841=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1735113841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pyjvct2z26muqqyr"
Content-Disposition: inline


--pyjvct2z26muqqyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 09:35:12PM +0100, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>=20
> Both coherent_dma_mask and dma_mask act as constraints on allocations
> and bounce buffer usage, so be sure to set dma_mask to the appropriate
> value otherwise the effective mask could be incorrect.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied, thanks
Maxime

--pyjvct2z26muqqyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/XSnwAKCRDj7w1vZxhR
xYeFAQCseO1Esg6FeJTM3aONniLp61zSygPoXYxsKvrsG/dGTgEAw9hITMh4dbFu
0N/+hzZMHgktpsbHaEnttlGRk2Sdtw8=
=rX1Q
-----END PGP SIGNATURE-----

--pyjvct2z26muqqyr--

--===============1735113841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1735113841==--
