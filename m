Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821096A4880
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964510E110;
	Mon, 27 Feb 2023 17:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77DC10E110
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:47:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D39AC5C0100;
 Mon, 27 Feb 2023 12:47:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 27 Feb 2023 12:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677520049; x=1677606449; bh=BfXTc9wu8H
 pCf4y9isHFvvVj1FAnwTmIfWQxO1Mu6uo=; b=CDlFi0btdZoip7RbIPWUvr057e
 ml8LBym9WjChTEIjNYIKIvUkW6ChCfHVKrFpWHTLLfDkve8zkCdrxKX54TKdhgWF
 VRHcmOq4JdTUPzqRU0BALMENHUapBAPgzSnCAVMM9gYJ/ooyhsMtX6pTvP1r4eZD
 SCHzTREmgfjOViClVYVjikikna7RZYnwqJUMUbAMvpy+qz1/nJKl/ClVd6iSofhQ
 DNL3IXHedVBRIVnFCJ2aIWi1C2CmFL0pXXLFqyH8FnKH76/0QL6OjH2N6e8yXxxn
 lCk8mEPZ9hucShG2ph7NGCE5zneSDGSJOSJRHlfhd92gasz1yNVQ2Zso2AEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677520049; x=1677606449; bh=BfXTc9wu8HpCf4y9isHFvvVj1FAn
 wTmIfWQxO1Mu6uo=; b=jVeb7UMhgWEWALFf+e1U+L3gMy6WAwmF0mo83sEiMWRX
 DhTj3teQS38Wy11t66pgPWLFa1ZZ13nTVJRNRuRP+BdZPPgkziXDRfzZNXzIZNCe
 A4JrYe194uDMT53ulT6I7SzQfE8To/w7UcggmuV19JSdMtcz0QD9lH5q7O7xNSjp
 gyqYAt+d58ZbJrWbJXCxqHHNr6u2iycKxM4agrNhXVbpta36/RxfdkefzpXpS+9m
 QFUl5TrAru646iW35y1mEknr3mQkr+3jqUdfqOnNT6rwqVawNybxByrAu8JxaS1C
 Sx7NqAmEeIXLqLGz8CZSmcqoEwSOo0ywItPLTdnWzA==
X-ME-Sender: <xms:sez8Y115NkigVh2z-vjElDZwfIOdI4tt05x7PSj8nADXcYwEnbPBew>
 <xme:sez8Y8FW7X-j_8zeSgdekHl5CuHQloxIpNrmcWI8JfPteIat0ra9HTKUwvkczkWp3
 sVxPUfOkVynvp2W1NA>
X-ME-Received: <xmr:sez8Y16uSwMVY2e802DESpw3YBGEqABE7OAWOLYs08iXJ3-QjagrIPjSVfIuJgzmw7JTn6MHd4qqu8yJcrHCJWrD4e0x45k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sez8Yy0ebe2LvfZV-a8-MwpjmBR3y9HHnAueAHJ1maNeAv48WTr-RQ>
 <xmx:sez8Y4ELUjRj1c9IdgK79d6Hfl49o91rb2PMeLZYb0GiGEbt--Melg>
 <xmx:sez8Yz9oF_clyJofxaSGIIoHAypbAiIdI4T5nrggnoZx3mYsv7G1gg>
 <xmx:sez8Y2X7MXdbmtnWpfyl1xwfTrD5zMmEW75nGj4hE9gP7NP7WnpfSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 12:47:28 -0500 (EST)
Date: Mon, 27 Feb 2023 18:47:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v14 2/3] drm: bridge: panel: Add
 drmm_panel_bridge_add_nodrm
Message-ID: <20230227174727.7by2awmz6pdbffo6@houat>
References: <20230227173231.950107-1-jagan@amarulasolutions.com>
 <20230227173231.950107-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d44eshderkedlrnf"
Content-Disposition: inline
In-Reply-To: <20230227173231.950107-2-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d44eshderkedlrnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 11:02:30PM +0530, Jagan Teki wrote:
> drmm_panel_bridge_add_nodrm is an another type of DRM-managed action
> helper with nodrm pointer.
>=20
> DRM pointer is required to perform DRM-managed action,
> - The conventional component-based drm bridges, the DRM pointer can
>   access in component ops bind API.
> - The non-component-based bridges (like host DSI bridges), the DRM
>   pointer can access only when a specific bridge has been found
>   via bridge->dev.
>=20
> This drmm_panel_bridge_add_nodrm helper exclusively for the
> non-component-based bridges.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

It's the third or fourth time I'm telling you this, and second time
today.

You keep respinning that patch, but the issue lies in the samsung
driver. Fix it and you won't need that helper.

Until then, you'll only get an automatic NAK from me, I'm done reviewing
those patches over and over again, making the same comments that you'll
just ignore.

Maxime

--d44eshderkedlrnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/zsrwAKCRDj7w1vZxhR
xUGMAQDFwLuknwQt/uZR4dZMYrh9sW5+Qx6E3gR3bJAZ1WQl2gD+Muf7F6kubqBY
kPIwNuvCYkK5gWOSzs7Ce7sqmEuSkQ0=
=qDoM
-----END PGP SIGNATURE-----

--d44eshderkedlrnf--
