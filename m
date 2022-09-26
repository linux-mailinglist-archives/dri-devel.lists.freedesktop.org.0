Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C185E9F0F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1E10E679;
	Mon, 26 Sep 2022 10:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E76310E677;
 Mon, 26 Sep 2022 10:18:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 126772B06A11;
 Mon, 26 Sep 2022 06:18:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 06:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664187531; x=1664194731; bh=5Mi0ax84vN
 Q8Ik9brdJtvB0uXGlTRxv6OA013bAZpL0=; b=mPjz0W9wujiA8FNtfwEiBpyqV5
 Uqi3K6rfEHhCDoLBYocGrwnZDkbF04q7vXpH25z1j96pKnGkXXWVq7RygYRVO1+k
 Zt0FV7UI3P08wPJrRa1bI+g8iOUe1VL7ortevqgZnntf8sBJ0oObT5s5wvThe1Ua
 Z/YmKoMgwJTphA0EKfpEOFT9LBCN1c+H9u0o9ioZecJgfvan31OYF4ZpDtOjJlPN
 4bUOs4vjlK09jFXq23EPpj2q7SNBTV4zNsMKuhQf1BTZA2PREikwGuiZybx0NtOk
 Y46T3p/xM3pHwPrSL7WvKZlANcOzZ2Fz/kv1vU/+cbaiVtIGDpTm5IqWH4lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664187531; x=1664194731; bh=5Mi0ax84vNQ8Ik9brdJtvB0uXGlT
 Rxv6OA013bAZpL0=; b=Pbd2EZ6uT1eqTF/biLA5le3FiI0tHPHXbHbzJ8Vaihts
 LTM+fBnyxQHyTNztlAJUtYHpBhW8tok8RUeg3ikKxP+yOyqKz+epGAtLuMkFjMBG
 fBQ9B0BFxeWxMYcg9hrPSxljJ6A3tikN73bhwcFqHyPjXMoBmMzBcIjoroP6cAKm
 JEeUn55n34+nZLMUn9sQPzQeEl/PzfYJkheXxbMsmq+NUZgXT+YBJc260YmJSQk3
 N5X3nUBPLA0zQHgpVpvTQ8s315+DEplU18scVVRJ9dvWw5RMmXzDnVDAdDK5zG8S
 VO/Ctzt65RgiKeKDHjzo2p3pxw67zdDYOJRt/Xb7ag==
X-ME-Sender: <xms:i3wxY9xwl3kZ_jM-VepsytbsBLcquF37MQJo8kAEWTA8q21bZvO7tw>
 <xme:i3wxY9TRpu9pHpxHNHWwm1Xjg0uMZ_NVDETo_Mb7kgDFQeOOQA2RUSM0YMj-n4NuF
 f_d6K9TMfgVwGlxiZA>
X-ME-Received: <xmr:i3wxY3UnXCmOxPzS0jXYbtpvMezjClRHQgLY1Vr8iQbNQ-ezMNzSSyNUnOq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgueeutdefgfevveehjeefgeehvdejjeefheekffduteeutdfgieeiieff
 uedtffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:i3wxY_hWb4KR6szUdqDRlDMUrKa3vyQpFMbSn83YrPlgjm1QHttysg>
 <xmx:i3wxY_Cbbgr9IV5qY0e5CWHmSc0Lke64rk1YaA1Jwq3leJIoT65MoQ>
 <xmx:i3wxY4KhWDOB6CajfkPU9JMoeW1otbcqvviAR3jcDVfv_mZhEgy4Fw>
 <xmx:i3wxY7gCjKLywrsbaBhdNtzjYdmSzjvNIh1YfEz5SGHfusRLWhAIMT6mGVY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 06:18:50 -0400 (EDT)
Date: Mon, 26 Sep 2022 12:18:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220926101849.uiyc7zhgkgz4wy46@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <87h70y4ffb.fsf@intel.com>
 <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="orq4q4azvl3jus4q"
Content-Disposition: inline
In-Reply-To: <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--orq4q4azvl3jus4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 12:16:13PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 23.09.22 um 11:18 schrieb Jani Nikula:
> > On Fri, 23 Sep 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Am 22.09.22 um 16:25 schrieb Maxime Ripard:
> > > > +	drm_dbg_kms(dev,
> > > > +		    "Generating a %ux%u%c, %u-line mode with a %lu kHz clock\n",
> > > > +		    hactive, vactive,
> > > > +		    interlace ? 'i' : 'p',
> > > > +		    params->num_lines,
> > > > +		    pixel_clock_hz / 1000);
> > >=20
> > > Divide by HZ_PER_KHZ here and in other places.
> > >=20
> > >     https://elixir.bootlin.com/linux/latest/source/include/linux/unit=
s.h#L23
> >=20
> >  From the Department of Bikeshedding:
> >=20
> > I find "pixel_clock_hz / 1000" has much more clarity than
> > "pixel_clock_hz / HZ_PER_KHZ".
>=20
> This one's easy to see because it tells you with the _hz postfix. Many
> places don't and then it quickly gets confusing what units the code's
> converting.

So if I add it to places that don't have it explicitly (ie, tests) would
that be acceptable to both of you?

Maxime

--orq4q4azvl3jus4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzF8iQAKCRDj7w1vZxhR
xWF2AP9QJyjfI+kgaD0AWfK2cf0qTy7Uwc2SUiuCNG4ADKxe0QEAhWoobr2NZ8lL
ukynl2SUCjF+Bk3Hw/p6n2flp1R3NwQ=
=v4yB
-----END PGP SIGNATURE-----

--orq4q4azvl3jus4q--
