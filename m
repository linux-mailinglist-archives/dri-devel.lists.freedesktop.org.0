Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108D458C12
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06189EBD;
	Mon, 22 Nov 2021 10:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16B589EBD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:08:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CE1F33201C3F;
 Mon, 22 Nov 2021 05:08:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 22 Nov 2021 05:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dSpFuLXHzLd9s6qVEKMoKCZA44t
 Tq39Im0wyAEqj2w8=; b=Ql5ZOKln5yQ7kYrY4713oE9ZCTNG4H5Rbv3IUMlP0iT
 jVtdkwQhWbFbTuxeFCvKsMrIZ0ch98T0Mqx0WJ8/+Dy1LBif9XujIcH6dWkYkfix
 MJPEMGF5gblcgWvT0229DUpXwzDR5kBOfsCuieJdfKXlZV9Of2gwWWbFYKixAHRe
 pvlpAOxg3F3hWywWX/z5QyTeEwdPbmFd32OUnRmrHB+py6B/jHD/LpFtzqUmSbTM
 sTUvZeP4djcCKuNcRz3kQQ5YvvebK2dIknvjDLykI7zZU0vMlfBDVWYpcz4cdUSN
 rQhwDWaq0j2dVSzP1bhxhEJqpIE5AHs4h9sHcVDLZBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dSpFuL
 XHzLd9s6qVEKMoKCZA44tTq39Im0wyAEqj2w8=; b=EpyGUDmhbVfxIuVUVJLJAd
 GmJz61UvbMAo38ouWP5yzchvz12he5QzqDGKcWvccBhogISm6bOC/89ZHTfY8qzA
 qUWN+bDZrXJIFdh506/2wmHC2+O2srZmedYdOBh5S6UHxaRrMxDJ8wSupt7tGyaD
 PCwy3sc4SPuTrxlZ0+j0b0UzC6M/uAfxPtbl2rI2Lq3LoziRkQP5su0PSh+A8NsS
 EZRbfk9UoLJi0nyM2kvYG2JobPprmIuD01mSGYV8svnlZc8aXKQf80kUHkTJ9GxF
 ILFLZxLP8hPnoXcMyAS+x0qDtsIkjddbhOqXrcn0w9Tlt97Ixu8gquPgKqPnngrw
 ==
X-ME-Sender: <xms:AWybYYPtUdBgc4IfSe3WnRAjFx5liN3E7Q7LCwsY504bVHKG4QYMsQ>
 <xme:AWybYe_u_yR6htrKbg6Vnqp234D96AWen0llOPRrs7iNpPu89VvJ_YPZNmw_2oINt
 Sd_FkPHXli9AXl1S3I>
X-ME-Received: <xmr:AWybYfTNVy8RgZ-jNm5bw5hD6YTkWtzabshnl4y1NHITaXg7AM9UkIySD5_apoWEDaDGYu4Ml1EDC0xT0NiloH5Ymk4XqBQl0OI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AWybYQtVP8VVC1GUAQNMo6uOBf_zfefRZ0yfFE5xj55nZ_YCEC-OvA>
 <xmx:AWybYQfcxg7TaeuWeTrPdXkARN_I71oV_hafm25ZSdMS6_ZUVHCiqQ>
 <xmx:AWybYU2VtF2a-syM0lRJRKc6ux_5XG0jCHOe5VZ0w-u9bueou7hyjg>
 <xmx:AWybYXwbJr9JRAryt4u1W4lD7_7d5MsxN_wQcSzrw2LNkeEl0uKgzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 05:08:00 -0500 (EST)
Date: Mon, 22 Nov 2021 11:07:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
Message-ID: <20211122100759.qw6lvwb33ciemg2y@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5dwnarnf2cksejho"
Content-Disposition: inline
In-Reply-To: <20211122065223.88059-5-jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5dwnarnf2cksejho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 22, 2021 at 12:22:20PM +0530, Jagan Teki wrote:
> Get the display mode settings via mode_set bridge function
> instead of explicitly de-reference.

What's wrong with dereferencing the mode?

Maxime

--5dwnarnf2cksejho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZtr/wAKCRDj7w1vZxhR
xZQ+AQC5cdLRirXcVFC1Kt9yN6IhNBxQnJ3IYozu+FBSD+grIAEA802WV9RfuiEV
z5QPUlM7peWb7KXhniG+amGEIX6boQw=
=OsoH
-----END PGP SIGNATURE-----

--5dwnarnf2cksejho--
