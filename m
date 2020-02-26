Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFE17122B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C4D6EC1C;
	Thu, 27 Feb 2020 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF576E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 14:15:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E1B638363;
 Wed, 26 Feb 2020 09:15:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 26 Feb 2020 09:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=bom162ac9gFcma9iDy1OFat3ZlF
 vKtIzDMH8zrN0kDQ=; b=WgTEJSBQc0Giu0DeGNBqZ/LQw2ug88/mp3W/Ys3KlO8
 LoB5f0/SCHWrQEHleI9Wp6rjzFK75hGqI+TovHWWv44ZDjGFrEUnP1bFnnNh9IqS
 nnISRiK7YtF/2/Z3OQO/qnW6Ys5Q9iUylCq7MIpfZ1IYl3nID7Ekw2kT48mUudGx
 IFrFO7ea234w9NDj0CR7wQ8KtgG1S29UnHb8m4YTiE4tnW/rJ4g1WisF9pLwJ8gJ
 RHekUGi5GdabkCgbEYd0Vgk7Vj65IiZzu7xz+HsjUsS9PoQZ2m4mlz7QgbEccfa6
 fFlXpJBnkAT94imNELyAyRx4kFeV8SubySmkce/QWNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bom162
 ac9gFcma9iDy1OFat3ZlFvKtIzDMH8zrN0kDQ=; b=1X4uKlKjPafmoLx5sje8fN
 Z5F2e61U76rNKHqHghkOcwD655QLYMt47hkt4N1d543s/Z+X56oWH53kfSlO8VO8
 l7SqkCAmJG5FO40/GyRr59Vi4z6EmKnDBqe6lDthTOTg2O7GwDYKxFIFwPdr1LkG
 XBeOv6LRm1u4sf2+qGmOJU/vAHRMCL5XUJHyqxlv+gIAsKvnJBHI0mZo58goCe/n
 NjtOnRow9mZeXICIlU1Q2fYqVkGHhunIGbihqr+sC2pXeW/pN7BG0YliXK7nG7R+
 9N5UJ5zraiGkWIVY03WhM+6iFW+9ZLx1VpGWZGq5wrtWp1Cv1lU5zTop7uEJFlrQ
 ==
X-ME-Sender: <xms:b31WXi4Z6d9VBrI7lGa7V6wGVLxCEg5J19Mn3-8ZyB3his6AWJqDNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b31WXlM5-g_WtYHlWm-jrMwWExH9Z-Ts0OOLciJ7u5UvldkwC08iuA>
 <xmx:b31WXgNFDN54P2k12Ebr9Uu0rsYfeu5P5PpdTPzKHdNkFFw7pwJHIw>
 <xmx:b31WXqJk28cMiUtq82-O0kijFf-nA1Nve3KQRwkje6h_xTeFSHwYKA>
 <xmx:cH1WXiyyCeM1sLeCCJd95c1VrD4DVpaEHcNxrdECjrdHAUDQM-oMSw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C60B33060FCB;
 Wed, 26 Feb 2020 09:15:10 -0500 (EST)
Date: Wed, 26 Feb 2020 15:15:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 22/89] clk: bcm: rpi: Discover the firmware clocks
Message-ID: <20200226141509.awlydvh6bi7re27o@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
 <2814be76-4006-4651-0a84-6dfaf2064e4a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2814be76-4006-4651-0a84-6dfaf2064e4a@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1617663438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1617663438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n5yxkfnp2qbxja73"
Content-Disposition: inline


--n5yxkfnp2qbxja73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

On Mon, Feb 24, 2020 at 10:15:32AM -0800, Florian Fainelli wrote:
> On 2/24/20 1:06 AM, Maxime Ripard wrote:
> > The firmware has an interface to discover the clocks it exposes.
> >
> > Let's use it to discover, register the clocks in the clocks framework and
> > then expose them through the device tree for consumers to use them.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> That seems like a re-implementaiton of SCMI without all of its
> protocols, without being able to use the existing drivers, maybe a
> firmware update should be considered so standard drivers can be leveraged?

I'm not really qualified to talk about how the firmware will evolve in
the future, but you're right that it looks a lot like what SCMI can
do.

Even if a firmware update was to support SCMI at some point, since the
firmware is flashed in an EEPROM, we'd still have to support that
interface.

Maxime

--n5yxkfnp2qbxja73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlZ9bQAKCRDj7w1vZxhR
xfqTAP4vLh532NQ+/Wzxq6syIJ/bQnWdlyFvUKhuvHlwOVJikgD9EEvRQkVNQLSB
OFFRQxI+ToWjkDElsX49T4eIov7qRAI=
=N7b+
-----END PGP SIGNATURE-----

--n5yxkfnp2qbxja73--

--===============1617663438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1617663438==--
