Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198C39DBA7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 13:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47C6E069;
	Mon,  7 Jun 2021 11:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908ED6E069
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 11:41:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F34E5C004D;
 Mon,  7 Jun 2021 07:41:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 07:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=G5Ws2mdv15PvC68TLAqW5lgwuqX
 ZpoJNGuY6oJsLBA8=; b=3tRyPHtyeXaFQftLKvhJoTkFW51BVly26aSE6sSJI+R
 IoB1DpfQ47ZDZJRU6QS6J4+0tISxsn/zU4Y+gXSbtSjqikD2risJg6UIm0SYWpEy
 OrALQsrSV32mV54JbKzINJvk16OBmCq7VRM63RLYZ69rb0LdQrS2DNrNqy5rCb8L
 KUsUilvadarIzaHCh4SCleujYPmfbHvSHQL0sKfVfOl0aefR6S1RTlKzLiak3teL
 qpJTLrl46YLcEI3ciCKYgetk1GCiZe7vrPKvHoE4fZDJ9N3oPmf/GmJIVPHwhk8V
 zYpinUefpNcbjw+MMj5WUhRmovJBwAM6ChEO3lCwjtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G5Ws2m
 dv15PvC68TLAqW5lgwuqXZpoJNGuY6oJsLBA8=; b=ein3MXW5EAS7eaYMMuhBtd
 cneBPNnvS/L3YRnF3N/degKzLXVryCMneXOCg23tdXcRzekEsRqk7p5ziTyLpT7k
 CkSaZ/2oI1KdFX2Cmvl9+eNmHUOJiI1/ROE8wxiL1S2bDyP8x6oZpouHriLXzmSE
 JhU5RHEQr8GMx8R45ZY0ti+MWQw+9ClGJ/7gZt50jkUsfcRxStCEfcKs6tHuLxDD
 AwZthKqOgP0P8Iiu7e2OhN35S2P11pp5AWXNkUtbMMDNZdhPr2nj5xmYVWo1UWXl
 s6fA+iTFTGSDm2bvF6QY/wiFEVMTbiR15a+BbVvDrd6lM8R1/D+qzlfpFMddQbdw
 ==
X-ME-Sender: <xms:_QW-YPL6pMGk8TJMk-zTM29PAGcZYasbjgr8OmTJ8lNXWahD0-dhTg>
 <xme:_QW-YDJhwidlZb6p4_PXhfq8phUHDCbhdBrYJ1pmnlS9Gbw4V_Wmpj36eiOWQwvLw
 ozTwP2DR9IvhP3fVZY>
X-ME-Received: <xmr:_QW-YHumjn6lyCpBZJkSc-g9v83X-9V_JJTEgFuf2jTPS_93no5pqFQqqNsf1kHOvvpDZ5l6faKUb-PBof8ZWAR4YWH5eLYUsvBK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfefhhfehieekffffgfdutdevhfehffdvtedtfeeugffggedtudeivdehgffh
 uedunecuffhomhgrihhnpehlkhhmlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_QW-YIbQlnTgAWwZJonFgPgKXxYSEwaJZWA3H_iectFg8HKcWz35Cw>
 <xmx:_QW-YGbxWs9wDkr3JcxlTDLJ28Ef_pIVYj6C1XfKb1vAAcnHhGxTnw>
 <xmx:_QW-YMAIiX3-Dg4s4Htkf1RQeNL6DaSGPDDBInuoNYtekze33S9qHg>
 <xmx:AAa-YMMj8AbTZogx7CGTsth4upd75pVGpUsh0krHQgUO-UsOfxEQhQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 07:41:48 -0400 (EDT)
Date: Mon, 7 Jun 2021 13:41:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
 device
Message-ID: <20210607114146.ohiqf4ousibfu4wm@gilmour>
References: <20210607085836.2827429-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="go2u3onasjnikotj"
Content-Disposition: inline
In-Reply-To: <20210607085836.2827429-1-megous@megous.com>
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
Cc: Saravana Kannan <saravanak@google.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE"
 <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--go2u3onasjnikotj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 10:58:36AM +0200, Ondrej Jirman wrote:
> From: Saravana Kannan <saravanak@google.com>
>=20
> On sunxi boards that use HDMI output, HDMI device probe keeps being
> avoided indefinitely with these repeated messages in dmesg:
>=20
>   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
>     not ready
>=20
> There's a fwnode_link being created with fw_devlink=3Don between hdmi
> and hdmi-phy nodes, because both nodes have 'compatible' property set.
>=20
> Fw_devlink code assumes that nodes that have compatible property
> set will also have a device associated with them by some driver
> eventually. This is not the case with the current sun8i-hdmi
> driver.
>=20
> This commit makes sun8i-hdmi-phy into a proper platform device
> and fixes the display pipeline probe on sunxi boards that use HDMI.
>=20
> More context: https://lkml.org/lkml/2021/5/16/203
>=20
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Applied, thanks
Maxime

--go2u3onasjnikotj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL4F+gAKCRDj7w1vZxhR
xQEfAP9vP3jokTFEfVVEzY9r1WA2vwZlSzf/+NvOVPNtT5JpAwD/bqlz7iyVFUtu
CEYuLVjcA1hWAZsRTGT2RlI5eDbqnQQ=
=y6rg
-----END PGP SIGNATURE-----

--go2u3onasjnikotj--
