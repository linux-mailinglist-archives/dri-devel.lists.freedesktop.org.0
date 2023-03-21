Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6636C34DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6F10E220;
	Tue, 21 Mar 2023 14:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9EE10E220
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:57:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4532B582090;
 Tue, 21 Mar 2023 10:57:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 21 Mar 2023 10:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1679410662; x=1679417862; bh=WZ
 Ckbh/tYGNxV+F2X4fGjvMhyY0o6gXTLsZ+ZHhktts=; b=hR5369FKPFCxMf7rzi
 I7rmDxOiakJl1l3s/R6QoM2Y6rTdUVhmy//Vq8htzIrcwZTbL5O71qycjQei52hZ
 DOEk8D4aPdB5vM9LZQOC+9oFc+JYHUSMqmlz0FGJRRweEEHadXUGLtmoFqWY0Koc
 0THQUFeZYca2cfPO9ZX0MJO5MpvGRugjR+KjQ4WGAi6bXpT7JqEhBnNDv7DeKMFU
 00PqvG3cGb8FOa1K3BnOiD8nJQE1berJFG1oKjc2BqiGlfBENbOYS5ERrCQ75L7q
 Hbfnb4Gadt/DRrRW89Ye+VgouZHOAX+tIRrw7LlUf1WYsGqNR3KdE3mRmdBjNwrJ
 S4vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679410662; x=1679417862; bh=WZCkbh/tYGNxV
 +F2X4fGjvMhyY0o6gXTLsZ+ZHhktts=; b=rILf9kiCjLqy98oLvC0dfF06Zbobw
 6thcabURJMPNPlSsFDpp875rnPpOrHFwTf3ENZAtaLG0W7KqtKkU/8Q6Wc9qBpFl
 kqX+TfJSvkvZhbgj/b+YAVSwY11m2OeIgSyxLQOtQ5HzFf65Wxl9uUqoWrk1jrBZ
 +SjOo9grCHExaXf12fHr3uwY6W2S0tYgNf9lfc5wHW4ftEoAgdIkrpZI3y8M5Jc0
 8UQppsx/PkozffbSivg6/XXn9tppCSLTcBOA4xGP5S3a+dL67rZLlO6lhRFmC9H9
 aRhlLqo5RocfPRkUYAdETTeoLwBXV3VLmdDWkeAzDCn4tzek69PkN3KpQ==
X-ME-Sender: <xms:5cUZZNLW08BDnJwpBb1MgYgeXHruxfOpicBGqRPeMWows9sQlFadrw>
 <xme:5cUZZJI_wdrvSWMGqMGm5JGBjFnn8iFc34hhF_cGDOX84_Xc7vUTU_a6L3U0Ax8X5
 -eplCNlfUOY3jkPW7g>
X-ME-Received: <xmr:5cUZZFuVXfFZF1jZbJQHQOHWW1kWCT8vBucXc4JkNSOSNxn_Mf6G5q08rXZsvuI_QU4DQm9MUkqgxoFD5BUw6Pc1v8r6CK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:5cUZZObFz7fuN8U4Ep1CWo3Siw1FmKVYs3S2ZZqT2dgF5fRpr9kt1w>
 <xmx:5cUZZEarjw9CzY3z28k1tIOyHhTGdIw-qEn9LbK0sOmJYkqBA6guTw>
 <xmx:5cUZZCBte83TG_6wNpIc_LDmR2HGh8ShOeb-WUlBKMcVVW4f6_XEmw>
 <xmx:5sUZZBLC5tcBipVIa9w1JHnzqumCxaFU9nCX-V1WMFyDUHB8plrjWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 10:57:40 -0400 (EDT)
Date: Tue, 21 Mar 2023 15:57:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/1] drm/sun4i: tcon: Fix setting PLL rate when using DSI
Message-ID: <20230321145739.jlpbzplsc27dlh7v@houat>
References: <20230319160704.9858-1-frank@oltmanns.dev>
 <20230319160704.9858-2-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p6lqqqs2douyc2p3"
Content-Disposition: inline
In-Reply-To: <20230319160704.9858-2-frank@oltmanns.dev>
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
Cc: Samuel Holland <samuel@sholland.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 jagan@amarulasolutions.com, michael@amarulasolutions.com,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p6lqqqs2douyc2p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 19, 2023 at 05:07:04PM +0100, Frank Oltmanns wrote:
> Set the required PLL rate by adjusting the dotclock rate when calling
> clk_set_rate() when using DSI.
>=20
> According to the Allwinners A64's BSP code, a TCON divider of 4 has to
> be used and the PLL rate needs to be set to the following frequency when
> using DSI:
>     PLL rate =3D DCLK * bpp / lanes
>=20
> After this change the common mode set function would only contain
> setting the resolution. Therefore, dissolve the function and transfer
> the functionality to the individual mode set functions.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

This is similar to:
https://lore.kernel.org/all/20230320161636.24411-1-romanberanek@icloud.com/

What's the story there?

Maxime

--p6lqqqs2douyc2p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZBnF4wAKCRDj7w1vZxhR
xTlHAP9hZXRLcHFHF6akyZpKqfeIfat5Kq/GQ60EkQZNui464AEAs9lW2mPHhILc
QNQTIPwgSzuSlRTyCidCZj5arUxu3wY=
=7tRe
-----END PGP SIGNATURE-----

--p6lqqqs2douyc2p3--
