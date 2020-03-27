Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78119751D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C989FDD;
	Mon, 30 Mar 2020 07:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6716E095
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 12:40:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE9E45804DE;
 Fri, 27 Mar 2020 08:40:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 27 Mar 2020 08:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1tqKiAEDB3SfA9ydJP9wGmHNUkL
 2GqCIV0IdId8UKpg=; b=UOUhz3V9BaHp3TKWPbT4JEaYXHiWQMrwJgyJn3V0Mnf
 fAnhb0oylqQ6srUcpM5R5O1zxjvgDsVe/Gu9Wlvn9dUUIudziyFOaw6uuU/c/Y0A
 D4weejIWXR2VI2cMMoy9Hvndsos3Fk0g8UjGaagIEfHM6e4at4FEQB0YoleW7uLD
 QntHfam1Ek7riYHz+wx0oWiDBuESZyEUunVq3qRwrPPcLUIvQJSEs9JN11kUCwNy
 yY1N1PU2PteWyFDjQaNPq0TgbNJX4yeKVgG2EqcsTN/5gxsIzyqIMREIU3nnSvYp
 ebWRJWCOwA/QKBQX3yxUDzMqD7Evd+W2lvNh3YFizgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1tqKiA
 EDB3SfA9ydJP9wGmHNUkL2GqCIV0IdId8UKpg=; b=LR3psVpYNXWKXgCJ/hZ1PH
 Fn7BhmcKVYjCEJgsqYlqQwmYcNSr0VL5/2YVnu7mlQR86yv4oSMmX8QV1GiTDEvn
 c/AH54APzJCDkhdgsgbMpeotrLDb0/r7FBehzTVtT00448A7vANEAqU08KK0jFFm
 SeS818dLJ+ZguwBGNX72UlpXhY6ilkmQ9eYPNdQkcfNWAYD61YEo0YjQzVvJqtQy
 9rJRqH+IHlNwM8Y5sh5bdypYooXMv8bESbrzXEn03Kwx1h6Iaged/3kYgt6Ypbyf
 +wTV0xxUSM3HtfAtr09DnRVyaYxtPZf1TNTefWn4eh4VcgP7WEqVJXCit1u+bKDQ
 ==
X-ME-Sender: <xms:MvR9XsHxxrFVhdQnqxToeWQX52gjQfwXw7022_TFXhMKUqp30mybkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MvR9XlzrcvArZ_TJG7zm_IYkK4OrdF5Xv0p5VM2jhYOKAfLs49N9HQ>
 <xmx:MvR9XtAgBTwPr0tyIcWYyPvVDiQOfPKcHtJUcn2G9R0L8mR693W74A>
 <xmx:MvR9XkVIfSBoGtC-FB82UVZSmYxnXwBb0ckUahNrJxRIbz0ORBPfgQ>
 <xmx:M_R9XuJ6Xqx9zYfBsydw7RMwWSTwoEbOK6IQvEvihp2sWWTNdRgyVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 673F7328005D;
 Fri, 27 Mar 2020 08:40:18 -0400 (EDT)
Date: Fri, 27 Mar 2020 13:40:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
Message-ID: <20200327124014.cpadv7npw2q6iaxe@gilmour.lan>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
 <65a2d18ec2b901c6a89acc091cf9573a98fda75f.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <65a2d18ec2b901c6a89acc091cf9573a98fda75f.camel@suse.de>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, f.fainelli@gmail.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0679201221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0679201221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d3kuexzosimwuvh5"
Content-Disposition: inline


--d3kuexzosimwuvh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 12:46:52PM +0100, Nicolas Saenz Julienne wrote:
> Hi Daniel,
>
> On Thu, 2020-03-26 at 13:20 +0100, Nicolas Saenz Julienne wrote:
> > Current mode validation impedes setting up some video modes which should
> > be supported otherwise. Namely 1920x1200@60Hz.
> >
> > Fix this by lowering the minimum HDMI state machine clock to pixel clock
> > ratio allowed.
> >
> > Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks")
> > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> Would it be possible for you to take this in for v5.7 (or as a fix for v5.6,
> but it seems a little late)?
>
> A device-tree patch I have to channel trough the SoC tree depends on this to
> avoid regressions.

I've applied it for 5.7-rc1

Maxime

--d3kuexzosimwuvh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXn30LgAKCRDj7w1vZxhR
xdFnAP92Qdx8QTD2GVqLa6WYUZ7pal+vUrwn2B7IYbdrTLdT0wEAmrS2vU+cSXPL
TCYxw+AgcSLS6vRP8BmHsIZxUMsAwwQ=
=xO7w
-----END PGP SIGNATURE-----

--d3kuexzosimwuvh5--

--===============0679201221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0679201221==--
