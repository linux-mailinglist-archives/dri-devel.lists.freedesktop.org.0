Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6623D2105
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23AF6EA0B;
	Thu, 22 Jul 2021 09:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A376EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:38:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id BB3525816EA;
 Thu, 22 Jul 2021 05:38:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Jul 2021 05:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fPOCX/2GJ3M7cJqK5A8WsdKaQFZ
 TFDE51BgTgEgH6K4=; b=RjJE3ndxavrfIPS4AxsI8NhCYTRZCu9J+6gMqiZHzv+
 Diw3Mwt0D6aQIDwV/oH4Z2GL7uAtLZvnFQNQ+XxRMBDx59IzLpcMZkYO/DN3C3Ps
 VwlzPu72jd5mT1yaNBt6TEMPSjFCTjnrzVkrQFGjnDy/EXdVspmmcJhh4SXDNiUN
 fpghmptooEg2VEs+QhUbwGqquri2e4YhfgLnTdI36uvaX+i9pCS/8viqbinfrdlp
 YYfjrQcQzJIicA1e8U+TJmrrBqC9d1K5+oBzonsncG5Uuybi7Q0msARZEB01UlTy
 ceZIoj2HEdXcJd2N7Osc5lwE/5app9iHRw15IGvkB2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fPOCX/
 2GJ3M7cJqK5A8WsdKaQFZTFDE51BgTgEgH6K4=; b=bjQlXvnZC+CuosspSwIT1h
 dCMcanQY5a9Ly/wS/cDZTJmuu/lB5iOXOQVxL9pyi2eMf7J0v0Ad7HX8QfE/BgzJ
 Qpg22/XPgq1/DT3TbuQNXIS4ABXieAUizbdJZy9FX+vV/y64lSGwfGMt7GMwnmq7
 vWU8YU7LREKX+akJBgPAUCjbpuWXNnzrib6enSEfwblc3Lc2/XW0WBh7xrElaM0K
 wNp8Fiogchedc3PfffxWCMey/1GBu6GA6q9KlTmwUeqxjEziDCBnU7FMCG9rzitA
 WlK6smoPgGPxnELKkTH0p3n3iZeNYokjuW8ElJawdp1j7U4lf+Yx3WkjhwD63f8g
 ==
X-ME-Sender: <xms:jzz5YNwVN47A4XUaEcxuxmHqcd_Kar6OZccuB2_tqK6-aM3zYu0xig>
 <xme:jzz5YNQS3kF0gACnGJ77zqdadSlbaq4yHtyJfV6Ycg2T1D4_UdVv2v4-yJfhLujtv
 5_LDIPm-i5HLUZpWHY>
X-ME-Received: <xmr:jzz5YHXUSLsRG14fRcDLmglwuDgw0UDUdKIP_FizKgYnJGpsz5cJLKjl9qzW_tyJs5h8kyARAQ73dZQND6ld4lj_VnhostecoRr3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jzz5YPj_osM1RfLAHNpzhC12FfMgiaj5qIzVH-b8TmlJ_aXtkz6t9A>
 <xmx:jzz5YPCQQwN7xkpp4As84VtBIy5jkcLWfcw_GwnIB8Z_8UpTu91aRA>
 <xmx:jzz5YILyIlbbGO0H_rtOxHo6A61CIURr-lcdWn1JhcE1spzE_GEwrA>
 <xmx:kjz5YD4XiTIS43qslMzSGJBQJKg2k-Wj4YxMoqeWba1lW0pRT0wlIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 05:38:22 -0400 (EDT)
Date: Thu, 22 Jul 2021 11:38:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 08/10] drm/panel: raspberrypi-touchscreen: Prevent
 double-free
Message-ID: <20210722093821.nnmcldjts2boxctu@gilmour>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-9-maxime@cerno.tech>
 <YPcFrKLq1dhTcOUL@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fgqdyjawfptivtlq"
Content-Disposition: inline
In-Reply-To: <YPcFrKLq1dhTcOUL@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fgqdyjawfptivtlq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 07:19:40PM +0200, Sam Ravnborg wrote:
> Hi Maxime,
> On Tue, Jul 20, 2021 at 03:45:23PM +0200, Maxime Ripard wrote:
> > The mipi_dsi_device allocated by mipi_dsi_device_register_full() is
> > already free'd on release.
> >=20
> > Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" To=
uchscreen.")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, I applied it to drm-misc-fixes

> I did a quick audit (as using grep mostly) to see if other panels had
> the same bug, but did not find others.

Yeah, the RaspberryPi panel seems to be the only odd DSI panel not
controlled through DCS, and the other panels don't have to allocate the
mipi-dsi device anyway.

No bridge seems to have the issue though.

Maxime

--fgqdyjawfptivtlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYPk8jQAKCRDj7w1vZxhR
xYC+AQDajNGQcqMy8pCM0W9q6Ji0vEty86tBT6j+Tct9Hpp/6gD+MlZfK8T/f5sy
i4i4KkiJB0fJmHJnkohwOa424wZFjAM=
=NkL/
-----END PGP SIGNATURE-----

--fgqdyjawfptivtlq--
