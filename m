Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8122FDF5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38CF6E0D4;
	Mon, 27 Jul 2020 23:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C96891F2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 13:38:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E7FF5C00E0;
 Mon, 27 Jul 2020 09:38:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 27 Jul 2020 09:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0mmwIwgCXcA2dLIOd7pzgN6JF1A
 xROb9VRXpNp325Uk=; b=r1IZzCJF5qcf1q4OhChsQEWrQi1+zYfkczWSi7WlCB2
 G1kkK1fLKULCt8KOUFPoV3LiHTstEdm0AXA5+JP/84AG5K5Nv+8XD2WWpVrfMsM2
 bnDgEYuR3Ir61diMJ6liy+NmJ+CwDp3N1e5u2d34AO4CUVeaGeIETz6Ld148h4E6
 JF461XU53MT/E8W+fOe3X32y0E7vt8QOm6Gl0wyMq723ymP0p9IbR2ybdRETJgHg
 X8RQX2vlq+yRpVYhuP55AN4dhxF8J+nUzOJ0jb6T/xDUTsMXgui6G5J8wKyULzWA
 6VX8LuiE4OKbQCBdpaKNe0tMaL2CPt81BqWMLAfz8xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0mmwIw
 gCXcA2dLIOd7pzgN6JF1AxROb9VRXpNp325Uk=; b=kC5ZbUN5VKsNRlHfT4hyRq
 +9s1RjzN8U8oK1xydmS7+LmE42bXXEdKEU64ZKeREitABfOpetusBnN+UtaVR3SH
 u657PWG6qnn2JQKsc0KedmKP4nwYJmWjEx/3FAuazWQU57uK8h+VfjqjTox6JL6q
 EaotPP7HZwBww209tJ/0HcRg0D1jnbDVAJZiwHk6UUYLbtGoFwtPpxwiFaLU6ahA
 ktTuR1hCYJkRcG9xHj9WjtyBab4ZENGuyM7GmL6jIJVy2qoDSqH+LlWk1Jvu3e3g
 +N/HHh9/ZyLvwWSEDi8Vm3k8OzgT3j53vV2/cNRFy4/5nflqS+8ZB1/rS0HKgLZA
 ==
X-ME-Sender: <xms:6tgeX-M4SRc7K4cUrap3WIMIB6yXtBS26yufduvnfhosxwVdOklqng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6tgeX89Gg0a4-HsUqX9jxNltxxR6eZhaN5YMER_r9somoRFQIze7lw>
 <xmx:6tgeX1R4t7ddwta9z4dR6t4Eni1RrgZVpkwJVuRJD3bGcBEiaU7QWQ>
 <xmx:6tgeX-sfjRk_O1EHTbHcwLSE-0CFOc0XMfPYgjvlgXJ6pjCuHqXdiw>
 <xmx:69geX163RMYHF3O0McF6TuOjH_R3X6tWJRu_iTjk3BDBULuO4Es8QA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9DD23280064;
 Mon, 27 Jul 2020 09:38:49 -0400 (EDT)
Date: Mon, 27 Jul 2020 15:38:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/sun4i: mixer: Enable register value caching
Message-ID: <20200727133846.kgrnmsocy4pel6cn@gilmour.lan>
References: <20200724203549.35893-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20200724203549.35893-1-jernej.skrabec@siol.net>
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0431193358=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0431193358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rkf3mebagvwl47n5"
Content-Disposition: inline


--rkf3mebagvwl47n5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jul 24, 2020 at 10:35:49PM +0200, Jernej Skrabec wrote:
> It was discovered in the past by Ondrej Jirman that mixer register read
> may occasionally return wrong value, most likely zero. It turns out
> that all mixer units are affected by this issue. This becomes especially
> obvious with applications like video player. After a few minutes of a
> playback visual glitches appeared but not always in the same way. After
> register inspection it was clear that some bits are not set even when
> they should be.

There was a similar issue on the earlier backend stuff, and it turned
out to be because we were accessing registers while the registers
"commit" wasn't completed yet.

It looks that in the DE2, it's the register GLB_DBUFFER that controls it
(offset 0x08). It would be worth looking into whether it happens only
when the bit 0 is still high.

I ended up writing a small program using devmem back then to write a
known value in known to be faulty register and checking it in a tight
loop (and then with a poll on that bit) to see if that fixed it or not.

> Best solution would be to shuffle the code a bit to avoid
> read-modify-write operations and use only register writes. However,
> quicker solution is to enable caching support in regmap which is also
> used here. Such fix is also easier to backport in stable kernels.

It only partially fixes the issue though. None of the volatile registers
would be covered, and this includes GLB_CTL too at least.

Maxime

--rkf3mebagvwl47n5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXx7Y5gAKCRDj7w1vZxhR
xTpvAQDC2aWjXyPe2xdJ6WjwIF72CckAJTJco3V8uth5Idw8TgEA1Hvn6WJiVmO5
Et+T33XmkAq7D1qTPjEHncGpqQ4USgU=
=9gPP
-----END PGP SIGNATURE-----

--rkf3mebagvwl47n5--

--===============0431193358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0431193358==--
