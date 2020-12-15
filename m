Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F82DBD0F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65E891AB;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8816E165
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:50:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EA145C01CC;
 Tue, 15 Dec 2020 03:50:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 03:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=IXKNr+xuSGlIaAvPVvexwRMd7oj
 vcI9cuuFmG+xxnUg=; b=oWfGyvxJmAQv6ks5EDqLui6fhnmt1Sam9aeGLK9I/vg
 yy8K+rHhiO/R/THqphqPbE8MIkDBO6O+6q8/yy4KvyNw+urI7jMDiXF6sH5ZoTN5
 +4zjY2JKGRMippb5AUKUAJSAEr12mIHsFeeLdbYHhqoJZcz36KhzRC3EdemnIhEy
 VBGGmVBiWt6CpqkPPqzVzKrYDEXRA9deMvkq1FYNrZx3uGvGcLea+8HgkCvU3LIL
 msULsOmmTCWRy9oIUf7z3wC4HKX8Ydm5ae4wo36TtBDQXfniUfOTeGB0Gh/CBWSt
 AGr2WRiUM4Gm+fG2ia+fDzpsVD9c4Q6SFxysyEs2zAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IXKNr+
 xuSGlIaAvPVvexwRMd7ojvcI9cuuFmG+xxnUg=; b=R7DImCA32dvcTNcP9M676F
 PLK187xfBfdD+0z/mqNft2lSmy+ZHInoYqX7lSIzMubuEhv7nDtsqo3E9hK1FpRh
 I6TGN98tcXHx2ICRHh9nHmPivGXrPbP0iw5991eFDkFRm6s+houDRXnsNCaHijWw
 CyFXlHlWzcLWjiq8j1h4jtqbDFk59dwjYP6SOoUMZThmVEQH98qh28JR9sje0Xco
 7tblmWub+n8BCm8+LMchbomrAtXXI/Xg8QlFDkEf92NIZMPjf01xyygIzwS8fgF1
 oRNQbpjOsNDVzvZwdkmOinf0lWqIOJcUnVdJoW3ai7VOp9R7IJay5rLzAl0R6Rcg
 ==
X-ME-Sender: <xms:zXjYXzdqWDa-wjFo2KsoLpKB6RmxqbOqbaHz-wRcqUmUOlQR4CFJOA>
 <xme:zXjYX5O_vHfl1WKS-FzPEGgoarelMNCwD5h0DHb44QpY_elJD13mrBkKacMZWptTq
 hRmiBz9sgF99YUWau8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekledguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zXjYX8j7X5zJjvrA6IwJ5RiD_bTtNux1D7gLphSin7DZe5OLzO8j4w>
 <xmx:zXjYX09QV6Ja0Vg6zZgLTGrrIcxvzspvNaHEL08QyOzv8ZeGLkCyeg>
 <xmx:zXjYX_vva1gwLeSnhqZQ7MWWxLg8_0gTUdMMf-_502vqXi85VQkUaQ>
 <xmx:z3jYX1UA1tbzHi8sfTCooHQm2XJe3nWdsamJMu9sOYBmxFHlhkP-Jg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B00BA108005C;
 Tue, 15 Dec 2020 03:50:21 -0500 (EST)
Date: Tue, 15 Dec 2020 09:50:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/sun4i: hdmi: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <20201215085020.ty5ztxaf6v3o5b6o@gilmour>
References: <1607998571-59729-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1607998571-59729-1-git-send-email-tiantao6@hisilicon.com>
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0606472269=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0606472269==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cg5aywfc4cw4qsir"
Content-Disposition: inline


--cg5aywfc4cw4qsir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 15, 2020 at 10:16:11AM +0800, Tian Tao wrote:
> Fixes coccicheck warning:
> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:281:1-3: WARNING: PTR_ERR_OR_ZERO
> can be used
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

That script shouldn't be there anymore, see:
https://lore.kernel.org/cocci/alpine.DEB.2.21.2001071106420.3004@hadrien/#t

Maxime

--cg5aywfc4cw4qsir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9h4zAAKCRDj7w1vZxhR
xWGDAP9kXXZO1A/r0uzBeLeKaoVWi4D0OBQ2xe8hdEdNYpOPCwEAjSGzbCP30JLm
DTeWfJ3oDTQaCkHwNTTTdXHDJr1t4w4=
=drVT
-----END PGP SIGNATURE-----

--cg5aywfc4cw4qsir--

--===============0606472269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0606472269==--
