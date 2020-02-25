Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DA16F905
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E9B6E17D;
	Wed, 26 Feb 2020 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C106EA7A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:54:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BC9317EF;
 Tue, 25 Feb 2020 04:54:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Feb 2020 04:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JAYKQg/2/pReKqLMtOt2QZ5ljpW
 EB8Yt2uKvNb6wtl4=; b=TZaDZcAFLyFYVTbhFTg5Cbffetr0kG+aNiHfZsYtAYh
 4RHOt3ESWbp0UNA35oQ7ReHSvQ0O/FQ/FmFHcbp51NMSUrQFdRNDmrvpDH4AydvR
 1CAjZK24+51ZJIj+SItsUnVsUN5geJy5Ypvxr7dgcUznAsdM2QgN7MH5u/AHxtY1
 BUwoyLQKd1KDEnuLlbGPNIXQDF4Br/POSM0CTI/U+OvNNHlIEToNGZA23gHO0P4c
 0x9bREpdX150RzlELOr0kbsHzli7AmJNij9h5sOrWjaKlnChte7l/O/0Pw6ElgiH
 dM0yRoTkE7J+HpIyg5pGbg5rTNYOGpcO3jCMfBeyhXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JAYKQg
 /2/pReKqLMtOt2QZ5ljpWEB8Yt2uKvNb6wtl4=; b=uwmZqFGGyQlOvdxmlh2joF
 z5tZZLICEsG6PqP6+R+0WoHLsZM6w5HXH7k+AjBG17FxT/aIB+xOOaHD7YP7821O
 Uhnoj2X6uc2MCEs59S1X64Iye+PTF06qmsvesZKNN+EVU0HDhk+388h6acqLth7g
 fqx4gY3tcf4QM4/f1hwIGUTSBf4QhD6XObHpPoE8t8pKy5eyCBl0X7nNL8/Ihyha
 3NnMMNdvgmLSrfXzRDbZ/VDEdfj1M+SQYjld61JWI2j/OTEy9sZKxpBaUovOT7zS
 RQpGKUX4ch0kVgsYQk93xfvIHo7xfMGo6/MA8WwKg63jRXe1Wh4oxzC67a/3Yvcg
 ==
X-ME-Sender: <xms:2-5UXkC8pbDcvZ5FDf69OjgiYFoI35kQ2IzlibCGg3TLCSa0X5EDzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledvgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2-5UXq9LqHD_2Q0ARIC9phWW_maXwIbZDgfXkmdwPHIhY-XpvcUmBg>
 <xmx:2-5UXkWr3XiMoId8kYw9dw-eCJtqobpS-Hb4u-tdZcUQZqsOBKmOXw>
 <xmx:2-5UXsu9oef_xyvfvVKU1Uf-BqsgRUl4vQmc6zg4V5znV7rUWvHytg>
 <xmx:3e5UXuPkmDgmvkdlUZQk5esXbnCn-kKH0e0QJOHXi7FjLJiyNJG875dgpyM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF1173280068;
 Tue, 25 Feb 2020 04:54:34 -0500 (EST)
Date: Tue, 25 Feb 2020 10:54:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 16/89] clk: bcm: rpi: Add clock id to data
Message-ID: <20200225095433.tyxamibqyrgw5355@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <3028e04887c7b8a6ffc150c016aa63281461b434.1582533919.git-series.maxime@cerno.tech>
 <67855a10-f7cb-b6b3-7b9f-d9c9baa5f105@i2se.com>
MIME-Version: 1.0
In-Reply-To: <67855a10-f7cb-b6b3-7b9f-d9c9baa5f105@i2se.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0979286175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0979286175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dyrskase4qcevtmb"
Content-Disposition: inline


--dyrskase4qcevtmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

On Mon, Feb 24, 2020 at 08:25:46PM +0100, Stefan Wahren wrote:
> Hi Maxime,
>
> Am 24.02.20 um 10:06 schrieb Maxime Ripard:
> > The driver has really only supported one clock so far and has hardcoded the
> > ID used in communications with the firmware in all the functions
> > implementing the clock framework hooks. Let's store that in the clock data
> > structure so that we can support more clocks later on.
>
> thank you for this series. I looked through it but i couldn't find an
> explanation why we need to expose firmware clocks via DT instead of
> extending clk-bcm2835. The whole pllb / clk-raspberrypi stuff was an
> exception to get cpufreq working. I prefer to keep it an exception.

Thanks for pointing this out, I indeed forgot to address it in my
cover letter or my commit log.

I'm not quite sure what the situation was with the previous
RaspberryPi, but the RPi4 firmware does a bunch of things under the
hood to make sure that everything works as expected:

 - The HSM (and V3D) clocks will be reparented to multiple PLLs
   depending on the rate being asked for.
 - Still depending on the rate, the firmware will adjust the voltage
   of the various PLLs.
 - Depending on the temperature of the CPU and GPU, the firmware will
   change the rate of clocks to throttle in case of the cores
   overheating, with all the fallout that might happen to clocks
   deriving from it.
 - No matter what we choose to do in Linux, this will happen so
   whether or not we want to do it, so doing it behind the firmware's
   back (or the firmware doing it behind Linux's back) will only
   result in troubles, with voltages too low, or the firmware trying
   to access the same register at the same time than the Linux driver
   would, etc.

So all in all, it just seems much easier and safer to use the firmware
clocks.

Maxime

--dyrskase4qcevtmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlTu2QAKCRDj7w1vZxhR
xRbDAQDg9duHVr6F1bLDyXu+fLq7M8EsNZkJLMHJvpIZct0OlgD/dqxz9PtiJncr
wQ4ig9zsvApmBo3OuJBAcmZ7CXYSLQA=
=nXkx
-----END PGP SIGNATURE-----

--dyrskase4qcevtmb--

--===============0979286175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0979286175==--
