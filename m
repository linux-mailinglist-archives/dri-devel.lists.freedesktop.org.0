Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958473163A3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 11:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17656E1B2;
	Wed, 10 Feb 2021 10:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75C6E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:22:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A4818CC2;
 Wed, 10 Feb 2021 05:22:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 10 Feb 2021 05:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=HHZt6j9O5o44t0OiG/8pfemJcp1
 BVpkkyyBwZovhCjQ=; b=e1N4YEievDuoAZ5mZhIrzE733ZtydE1tIicwabkU1Sk
 Adphc4DuFR/601M2O7gPBk8FfkaXnvvOJtbLffRm7/STqmnURFeAEvPxh7gCSPMO
 vZFDvSl0JXqUzKOxzf0JkIoZIxjgNAk0xm/fLBktyGZFXoMm5/Nilz1LJz8k2U1g
 XtDJpgGjBfW7EsooMpxQLuRh4LNwLIKOd1ZK7Bp6EF3QLiKjLRyF/m24NtRy6w/b
 8N1SPqZLKItP/yuzXfIRLiskMMr6Refy+Na0nzrzd6fN+Lmm+dkk3GWnBwCQW/vp
 usLlBlIb/gSNqCxyHo2HUuFQhYYYVtLKIogblGi1BOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HHZt6j
 9O5o44t0OiG/8pfemJcp1BVpkkyyBwZovhCjQ=; b=NgE/eBmBrD0/rOx+cNzjM5
 oFFWlpcd72qIbtg7Y4Vgs8rVdxs8oBSsNpzkBsDP4+SFx4aEyOFoGYQY0Wne9McH
 YkW7AhLvswMA74DAcZIwQQ3rfPYQgELNkrTpPJJoUIIItfYZK4rH69EpMhBAzxHo
 SZjTKsQD+Hzmv8e00LdtR8wFqERK6cp7wwkTHlYMNaINltHap8FswNJcsMc71GeC
 MAuSfioqvilpyzn87s7S9ovpzsjB1Q2SpGmH+hU7klow52WLyPgGvM4eeJeDF7uf
 xwJa1vFPxzrK1u4umUoiWEYy8VtnAA8iMxZJFRZPHKcUECirmFAWvrT6ozt9daUg
 ==
X-ME-Sender: <xms:x7MjYMivYxljRUd0mVD1OAW0CBx2kzOY5i9nAZGZWFtUSdI7bJ5NXw>
 <xme:x7MjYFCktSP0rx8ZmXpl0BMVsPLJlWzyLLHNiig3J8ptObtW1CgkA_2UvLwrmBsHI
 S0ARpGCDJQLhnxFMYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:x7MjYEEuFzcl3qSEaS9XxNSbFZ0IfYa_VAdrmTJ80uyJX1hmjGGPUw>
 <xmx:x7MjYNSDPI8uLC4Oj49GxocqW58NhjZiYvCVfF7RrIMAactclTphWg>
 <xmx:x7MjYJxd6PaWkp4ospj6r1qHVPK02cBA9dqr_OiLn5inE6cVjIX04w>
 <xmx:yrMjYLsZP48tcv-YYxZk4MBBTSBcuphYcRwcN102fc2Yte4vKn87Ng>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0A7E240065;
 Wed, 10 Feb 2021 05:21:59 -0500 (EST)
Date: Wed, 10 Feb 2021 11:21:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v5 0/2] Implement DE2.0 and DE3.0 per-plane alpha support
Message-ID: <20210210102156.e6n6eyuks5ibdn7m@gilmour>
References: <20210128113940.347013-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210128113940.347013-1-r.stratiienko@gmail.com>
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, wens@csie.org
Content-Type: multipart/mixed; boundary="===============1614942111=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1614942111==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dso2ssdrx6p64rlp"
Content-Disposition: inline


--dso2ssdrx6p64rlp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 01:39:38PM +0200, Roman Stratiienko wrote:
>=20
> Please review/merge.
>=20
> v2:
> Initial patch
>=20
> v3:
> - Skip adding & applying alpha property if VI count > 1 (v3s case)
>=20
> v4:
> Resend (author's email changed)
>=20
> v5:
> Resend

Applied, thanks
Maxime

--dso2ssdrx6p64rlp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCOzxAAKCRDj7w1vZxhR
xbWJAQDuwFmBjnNnn8ZO8Op7wExYzbYJvkQV3In271yxLkzeEgD/f26+65IQW2Fd
jtqVmN+mA6PSsWNs13bcX5Ge/RENZwU=
=FXLO
-----END PGP SIGNATURE-----

--dso2ssdrx6p64rlp--

--===============1614942111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1614942111==--
