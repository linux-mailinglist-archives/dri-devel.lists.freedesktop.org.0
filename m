Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD72F5D4C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC016E0FE;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B96E311
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:20:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E4F385C0390;
 Wed, 13 Jan 2021 04:19:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 04:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qgSDQO6AhsOy6+LdR+MHGgk4hCU
 BHAnbMOVK9XfQKxM=; b=Lnr5XVGh5xLUZXr/rj8kk14P0ZNSlOgMinyHBZpxxZg
 9Bm35gXQcx0lWCcsBJ9kWclBD9hMWUhkCjJLkVID5PEwh6UaG3BAVgt59BFdatHH
 ndRT9pzqqmqLvkjGUmsJWNDGgf69CXea9od4Hxa38AaTMidQyHX7MIH0E7gpZ4Ly
 /lj4wpFNLCPXqjtJMERFF0MhXhUZLX1eTh1WOxiAzgEiURFPY0tMUvTToFKJBe/4
 kCIbrljv7eVIqtLMfJn+RKxCU3RgqTHksjQMlv7DqxCK10Ud/uHsnr6QLZV2Y6al
 kjzVQKNY2yRzQHdlWsNT8GAWneRUYB9IMHnHQ2NRjWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qgSDQO
 6AhsOy6+LdR+MHGgk4hCUBHAnbMOVK9XfQKxM=; b=BO7gCZno1dPP8tgcyuhOlB
 Rpy99znmlbxxL6Gm0W1z/xGLmSY3yRtfZlE2GG2Y60EWjT6vTDR1nHZwzhXpTOzy
 7bkzFKzRWsCG+2tQgGVGvVYgzAejK+4mZq3ssI2efZmq+iwp23YGIfkSxyowGbEO
 e2UX48Bre2UfusnFUMQ4ssIZgxav5VblItr5tLiHSzQUQIYe8fr5/HNJeEm+2hBC
 V9f553aAEwaj/wxWpLyt1gjmSwJGny5D7EwMV/Z3uiW0zivzcaRiiqgkveJiBCQ9
 YW+5lf2x2y0uLUTvd0iNTkX6VfYVnakHiQXf+9brtMEzEUjA15iavmbFWXAesF3A
 ==
X-ME-Sender: <xms:Prv-X04GoSVBzFKlzsrH55pvTBsK-RGFK6oRpFidzMqtsFda536e2Q>
 <xme:Prv-X17fF23oHHuJ1dJbAPqhcNKH_5tN6SmCtlegLAj-bOrsXOECaqG2A-gH-aQA3
 k1F0CNwx9Us6Vo6KRU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Prv-Xzfn4EuWD1oeoXN_kMjXdBwOsE5ln_7u1pPfigo84_3EaIJ9kw>
 <xmx:Prv-X5JIFXxxHeedsPui2W9Po5Ljb_Xz8l7Kb6uNfC7mqty3h4CG2A>
 <xmx:Prv-X4LWHrOebqIWnG0RGbomYirT9usrk8Ntarej7Lz-T9u99qiJuQ>
 <xmx:P7v-Xyj1kNS1vW4LPV4eL4k5jaS7YyvicY7ge6EgeQpPq9Kf2r4GgA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D1DA24005A;
 Wed, 13 Jan 2021 04:19:58 -0500 (EST)
Date: Wed, 13 Jan 2021 10:19:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Message-ID: <20210113091957.odclfwmeykrkyq7v@gilmour>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
MIME-Version: 1.0
In-Reply-To: <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1006730978=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1006730978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6fzib62mtdk7geki"
Content-Disposition: inline


--6fzib62mtdk7geki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Jan 09, 2021 at 12:41:57PM +0100, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 29.12.20 um 16:36 schrieb Stefan Wahren:
> > During startup of Raspberry Pi 4 there seems to be a race between
> > VC4 probing and Pulseaudio trying to open its PCM device:
> >
> >     ASoC: error at snd_soc_dai_startup on fef05700.hdmi: -19
> >
> > Avoid these errors by returning EPROBE_DEFER in this situation.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>=20
> should i resend without RFC?

Yeah, it looks reasonable enough to me :)

I'd like to get Mark's opinion before merging though

Maxime

--6fzib62mtdk7geki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/67PQAKCRDj7w1vZxhR
xVrQAP4z+a9jJKvF4pjnoYBcTvCQZoTZDafU8skjpqEKnxCw0QEA2Q5xojR3U0dO
n4zL3Rz/zRVPKf9T8PjD6VDhDX5J+As=
=ZWha
-----END PGP SIGNATURE-----

--6fzib62mtdk7geki--

--===============1006730978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1006730978==--
