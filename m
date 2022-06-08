Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CD54291D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F8F10EBDE;
	Wed,  8 Jun 2022 08:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8710EBDE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:17:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B38875C017D;
 Wed,  8 Jun 2022 04:17:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 08 Jun 2022 04:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654676239; x=1654762639; bh=HdG9XnB4td
 awmqEKCCb6ivGGqE38dlnm7rCuTW1+Rls=; b=1k4A2wzqI6TNtXvB3xsy1jJH81
 WOPJJQDNSQ5fOhR1RQ1vuidvGg1+lVYO4Ui+SnJ1nBfqQ/BNVfUlhvuRX8BHiSwM
 27kN6LHyaGJu+vbvxnh4T67iZLgVyCImWyKI6byGHmkTzsDip6GO4MLB9vmBfBw5
 5zUiEEmWWfEXtYhzW6YMhFgnZnqaQgEWT22aTUsCM87T1vTHB1kVMgfKGR/lITmm
 dPg7PA9zgSzpofiFEYvoNTRo5Zbo0EzcpJ0FN2CRn1azpmy9uRDCH7nUc0E0a4ZE
 Sz2lsEHw1IT71As1Gk03+zWli6arwjVyY6nANnHR6uI8BnQ5vSXmEeW4C3iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654676239; x=1654762639; bh=HdG9XnB4tdawmqEKCCb6ivGGqE38
 dlnm7rCuTW1+Rls=; b=dlipd2+I9I9KKmynpe4aYpRrKFGds2UTvKE/sn7U1XTX
 5YMAWjgZaImDZBxUwM/i+coq5ksae9l51Mhd01ZU/r9qIA0gU+QCoTDopTXrAzNI
 vXp+DIuwzTI1z+Wh00df8HtEPjU2OBj232cUzYEpuVeWmBodmFZQBk3Ky5iNoQun
 /8TlRxrC+fZbhD/fCxW2LfOasrPjzfduXHA6OeD8qQImEvE7TWjdZHq3VHUzqN6Z
 vYpPoLnKD9VoZwIO7pV7D0jtU9SiRV3jpplzxDiO3npfAgX/bu420ALHQSedvEt6
 6LcJBScIY2RT95vLKvnRmJZ6jF3QJeBjIsRtnUmTmA==
X-ME-Sender: <xms:DlugYtRuLKDsgtTCBq51Vqpel7kZQFY1MPItzjlboMPT7M-ndkvfWA>
 <xme:DlugYmzE42leqdBDvSYBV-A6bCsxBmpUlQ5KnI27rjd1x2OGEm9y40J1Hj0WY8okR
 NbaTxmxusHDru7NNp4>
X-ME-Received: <xmr:DlugYi0CZGu910KqufxJOFgGnag8BNLsd4H0R_oQs1aEQhqIl88kKHorvDNR_D6mYgHyOEDOOKHI2OyFl8USmvwDPzbYl-e-PpZUUpk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepueeuffethefgfffhkefhhfdvledvgeethfefudfhtdejjeelfffhledtleetgedu
 necuffhomhgrihhnpegtihgvtghhrghnohifrdhskhhinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:DlugYlDH6N-plsuR8eRYUAq2Cdg92FMluAe3MlNvd3DfzgzrWdB5qg>
 <xmx:DlugYmiBMtNaCG4K2_27BZs8_VkGWN52sBJy_dUN1Yrb1FUiEWvCgA>
 <xmx:DlugYpoli0npT5ZZehEeuMEu2Ae3lqeTMu9p5qo4V_Yeg_1Esoy8TA>
 <xmx:D1ugYhNc_hihqkKwuDlGo306-sdj8U14UmyJfcuGOJOSwvC-mt03Dg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 04:17:18 -0400 (EDT)
Date: Wed, 8 Jun 2022 10:17:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Enable output signal premultiplication for
 DE2/DE3
Message-ID: <20220608081715.cblotjle6benihal@houat>
References: <20220605094018.9782-1-r.stratiienko@gmail.com>
 <5826286.lOV4Wx5bFT@jernej-laptop>
 <CAGphcdm=sOyppe8sAYMK6aeRXpxiHvj-h-Es6nigCNKBxdBNZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zp6iwgscfyq77x44"
Content-Disposition: inline
In-Reply-To: <CAGphcdm=sOyppe8sAYMK6aeRXpxiHvj-h-Es6nigCNKBxdBNZQ@mail.gmail.com>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zp6iwgscfyq77x44
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 01:16:06PM +0300, Roman Stratiienko wrote:
> =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:23, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Dne nedelja, 05. junij 2022 ob 11:40:18 CEST je Roman Stratiienko napis=
al(a):
> > > Otherwise alpha value is discarded, resulting incorrect pixel
> > > apperance on the display.
> > >
> > > This also fixes missing transparency for the most bottom layer.
> >
> > Can you explain that a bit more?
>=20
> Well... I would recommend reading Bartosz Ciechanowski's blog
> https://ciechanow.ski/alpha-compositing/ or the Porter-Duff's 1984
> whitepaper itself.
>=20
> HINT: That magic numbers from sun8i_mixer.h ( 0x03010301 ) corresponds
> to SOURCE OVER mode.
>=20
> As you can see from the blending equation it outputs both pixel value
> and alpha value (non-premultiplied data mode).
>=20
> Also single-layer non-premultiplied buffers may have for example
> (R255,G255,B255,A2) pixel value, which should be sent as {R2, G2, B2}
> through the physical display interface.
>=20
> When OUTCTL.PREMULTI disabled pixel, the RGB values passes as is, and
> even 100% transparent data {R255, G255, B255, A0} will appear as 100%
> opaque white.

Without going into the full explanation about what alpha is, your commit
log must describe what the bug is exactly, and most importantly how do
you trigger it.

Maxime

--zp6iwgscfyq77x44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqBbCwAKCRDj7w1vZxhR
xSPVAP9WCuEJOeR5feptswaFZEGtKBmQmfsH0V6aZNlGCKQWXAD/RNZOTXFU59/5
B4sP7l0sbDznzHweIEM2DwDCKh/7FQs=
=6Jim
-----END PGP SIGNATURE-----

--zp6iwgscfyq77x44--
