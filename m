Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDE25554C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706C26EB66;
	Fri, 28 Aug 2020 07:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811189CA1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:18:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 64AE7D3C;
 Thu, 27 Aug 2020 12:18:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Aug 2020 12:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/wJ+GjNODeC+pwuurvtcGc283Mi
 0BLoYQFGbdBCsBis=; b=OqlFpDbiRKfP+EP+VthwNU9M+e8dAb0HehCuRtJib9r
 7FZoPCJuQN6ywFe7lgq66PH/s0ft25hGF0VX86CII+eebJE6vEzZKu3Wr7K8cko5
 pO6lV15vzBTxAlJyPtkPslwEiHLdqhgZMz7abSN9hOZanQTnhadeTWEuuemjW1p0
 7XxFmRDmUTvgPx5/DAytPnHu/Zdu6MmUG2BBCm7Js1FDrSmM3NjbGmhaMVxWZEhO
 OI7bb657DzRglly9tYJomHbaJ4s+w/BGQaxSuN0biwfXMBAFkT9/bpL+K3c62vLV
 nZNl3HV2YdUd113XF1LaO5iN9UBB+GcSwWSUzqFUqmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/wJ+Gj
 NODeC+pwuurvtcGc283Mi0BLoYQFGbdBCsBis=; b=NG/oHsoxH1nK80dmJSzoj9
 xgbBnto6CLL1P1KszuLGZ7i4I+fVbmLSMAgY/jxnLwcl79HNKnEhHOX39WlEfW+9
 ZBQKfA0iNLVX22ejGu+nVAYxZBMlR9qkVztrmFmjDyc5ryfc/rPGkZpoIE0Hz3va
 WVAQn1uAqw4jD7Q9oj1CQe/ejomDdxrdqxkpcyHl3fPwiXUa1ePPgbkYRhkoBP9s
 4vg/qaPWlplIosk0GGah1FUbI3Zg7KD/mGmXnao2vPtlfqwLjWO10dYqC9zVpkmb
 +YrnjQlGAgwjXPCs6OuuG8MVU9XQumbLFMQ2AE07gOzdQmyt6xVDzdYHUgpB52IA
 ==
X-ME-Sender: <xms:2dxHXzjtYsiaRbMejqYEFT71l4eLeNtWBLWUmaNXRSnBijWXtmRoJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2dxHXwBt1bpEfqc-SL21jc5YvaM-rSabe2yDCoRQ5UFt_WoWsFziLQ>
 <xmx:2dxHXzHBLcDwIvcdRnaPTLLOZJpu1yVRXu5GQdR_EYluYgzi9SOqDg>
 <xmx:2dxHXwS0HMsmskgQEpVi4iSpyslsT58KdrWOA844rW_pk6zhDCdHbQ>
 <xmx:3txHX_olOW0hy34_4UVNJjaDayzR5x-nOpABZqJGfv6TuqilFGd7GA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C376F3280059;
 Thu, 27 Aug 2020 12:18:32 -0400 (EDT)
Date: Thu, 27 Aug 2020 18:18:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH V2] drm/sun4i: add missing put_device() call in
 sun8i_r40_tcon_tv_set_mux()
Message-ID: <20200827161830.eqjsmq37u67zb3vl@gilmour.lan>
References: <20200826010826.1785487-1-yukuai3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200826010826.1785487-1-yukuai3@huawei.com>
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: jernej.skrabec@siol.net, yi.zhang@huawei.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0302828008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0302828008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4t7lkxbq6tfplcxx"
Content-Disposition: inline


--4t7lkxbq6tfplcxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 09:08:26AM +0800, Yu Kuai wrote:
> If sun8i_r40_tcon_tv_set_mux() succeed, sun8i_r40_tcon_tv_set_mux()
> doesn't have a corresponding put_device(). Thus add put_device()
> to fix the exception handling for this function implementation.
>=20
> Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Applied, thanks!

Maxime

--4t7lkxbq6tfplcxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fc1gAKCRDj7w1vZxhR
xYwvAP92KgHVYUPdnM2VvZuzhYmmh/HjKq1HLEC+NNTG4Ge73gD/ZbGdhLP6WHBY
ViKxSMEbdjleAS5WCWtx2pKypvTeagQ=
=QYTg
-----END PGP SIGNATURE-----

--4t7lkxbq6tfplcxx--

--===============0302828008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0302828008==--
