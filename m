Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4D25E4B7
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74156ED0A;
	Sat,  5 Sep 2020 00:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAF6EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 09:06:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F0E415C00D0;
 Fri,  4 Sep 2020 05:06:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Sep 2020 05:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1o72WctqDY+zCsC7OnIzx9kRKHo
 rm2lEhRdF3SbI988=; b=mmkmS07oJ9t+hn7BZy/wUf/OZ8JyrTcZCuDqU5Hs1lW
 Z6IKxmrtcA3beKHfsh9kU0QkYCqZZ7RD+v7pywU47rN6gZI0NwUaciEMiS/Zg+hF
 xnj8iXpfFqeyedhqG7LQxcIs8cEezMWGY/Q7pDeuZtLUeElMNleAX2o+FuW0HxW3
 67uvviIgIAUrLVsAcqHNTZdR2QQdStLcoUOtAOV0ZtKRrMt4me9dsVkwvTyYUldn
 VrTPnmT1TtjSZmk/Hb4xR5ZV3ezMEFU7bdw9dbY509FpyMQcCkEzjzVNkf2tQ+kz
 IwUZ/k9zVXWtFmGVsNgGNFIKndlAo+bZ6psBvct9EGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1o72Wc
 tqDY+zCsC7OnIzx9kRKHorm2lEhRdF3SbI988=; b=B6AlSxfmtTl9Cz8YOPlVdL
 YEu1NeaNWiQjWbuvnoee3l0nCLw+warrKXz3YuW4RrQt7AdbxEoPVOfp4Uaq1/Jp
 pE+yXnVgA77m86zNBMt++G4Baq9qpt2xXmlal2HfiTCZFgONAUpvYGOUwFkqhdE9
 5e+w4iekdpLkUVNSU3LkY4lOa+Ydlej7SUZ1RQLtMkcR7+0UcKbfQYQNPQd8JqWn
 6sjf1bbtA7Ks/nEn/82H0YUuaZpV3yGmbw0yXbZrX1MAoR93givFoSPndjIAT4vz
 WH9bcfntKeK2Rli+oA8S63YgnE9Ci7AKNSurV3teq+HG9bbzAXi/We9I8Suv2vPw
 ==
X-ME-Sender: <xms:qgNSXxVyDTwliPx1VeoondJ50dM2zGrkqiazTTUAUinzcWwlVuaCTw>
 <xme:qgNSXxmNik9BPqLeM-dtT5asS-rFi8kC6uBf0Iv3dfLC8fgo5JcEMe1bEB8PSiuEP
 ea1ohgX2_fI02Ssa9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qgNSX9bhLhH-xW3rILo-qCiSS8PirrzWZDGL3aCPCUpaQVqzEguo6Q>
 <xmx:qgNSX0XYB3rmDmXIcDp_dWYIfDZ-MyLvp7Uxi3NHexf3-ZftxHpWsQ>
 <xmx:qgNSX7nXhHMCP9D3dUm1AiZVxs0LvJ3OUJB2zaYRPsIw1155kpd76A>
 <xmx:rANSX2vm5xsG4RxFK0Wm6C-R0kpmAF9bLi3WrbqQAf5eJ6T7fteSiA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A74C328005A;
 Fri,  4 Sep 2020 05:06:50 -0400 (EDT)
Date: Fri, 4 Sep 2020 11:06:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/sun4i: Fix DE2 YVU handling
Message-ID: <20200904090648.wj74dlkgp5qo3mfb@gilmour.lan>
References: <20200901220305.6809-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20200901220305.6809-1-jernej.skrabec@siol.net>
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Content-Type: multipart/mixed; boundary="===============2010710705=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2010710705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lhvls7hmqle5lecj"
Content-Disposition: inline


--lhvls7hmqle5lecj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 12:03:05AM +0200, Jernej Skrabec wrote:
> Function sun8i_vi_layer_get_csc_mode() is supposed to return CSC mode
> but due to inproper return type (bool instead of u32) it returns just 0
> or 1. Colors are wrong for YVU formats because of that.
>=20
> Fixes: daab3d0e8e2b ("drm/sun4i: de2: csc_mode in de2 format struct is mo=
stly redundant")
> Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied, thanks!
Maxime

--lhvls7hmqle5lecj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1IDqAAKCRDj7w1vZxhR
xeuJAP90RxwlsHMsS3BsBTa5ovNs3ktqUgJLNp2+jXLIhC6XHwD+KvQYtc0bFTNH
ISN+iTcZw/oBVJVpnbDLCORYtX1qNgs=
=Alq+
-----END PGP SIGNATURE-----

--lhvls7hmqle5lecj--

--===============2010710705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2010710705==--
