Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB2411171
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FA6E44F;
	Mon, 20 Sep 2021 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0716E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:55:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 32DCB5C00D7;
 Mon, 20 Sep 2021 04:55:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 Sep 2021 04:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=T+tGls2pcQWz6PSmizhOmQ1JsVi
 rIzq0/6hhgzkSnXM=; b=mbuFxnBy1H2erq5nWvE6qLlMHdFVgFXRaM7k2L/Q1TP
 hrmJk9nntBqU+MwGXKEMVN2/viyX/geMXH+0NpwyOzhU8jhzUHcKdjboeKX6VftC
 PGa+DKW9RwB4vZ/0XvwsaLUcKpzrbQgpLbVc/AS1prlXx3WdP0l9xfYHFbz1oy4M
 VervvxKeWlgK11LjnQMCRWmgprPsNQ/Myv3xDXysqLdLl/b4NknS0yaVPeWzZNHK
 i57rNo4ruUpONCvPx2RGpp5gdOoDzYPP/Y3gY9RwuUytqR8ywBBL9DFW2TH9mcE4
 DJJ00fXc0dDu6RC/MzBBKcdANfu+e8FfQ6W//3Sm9SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T+tGls
 2pcQWz6PSmizhOmQ1JsVirIzq0/6hhgzkSnXM=; b=mMQvhUM1veNpt5mk9Jqh3V
 Kwpm0oCIfKnm8y1SWHrYuiGY1WC3X4XjjNC/vzjQUkTziRqoLm6VZZKxPqeN9Lnl
 eeypSHXe2lldu05OHTRKHgdAGbPc9EJZfZNljAOiNPOg//f6xwn/2THhPMLP/ByW
 3pU8i7u/I2sbGQ3e47SGWQTWlWNbvzaH8oaGuEstCY6DAP9iDZbannXIIJ0E/KRI
 p51yQJwmIeKnOINxlCdZlddEdAkWvaIl2JDB2wo8NZTwAFWQSx/W7zsV6RjA4JXw
 071CO76Okv6poqsRq+xkuoJSA1Wrad+vM1UXm8HRusKpdLxa3lCqBVlou56yKz0Q
 ==
X-ME-Sender: <xms:hkxIYZG8Kr9-ofKYfDABhliTyhjspz2c1IVZ3neN2-vIg-rV3zBt4A>
 <xme:hkxIYeWrPqYEh_mcGYkKFOsA3792XP-9YaHVNMH4vuq4mQ--aCxeo_m5xv55T8Y_y
 GVw7CDbinx5dDah9Xc>
X-ME-Received: <xmr:hkxIYbJGmxsTaPUzJBdO5gTvjgvSNYlYpaZYRxDDg7U7JUFNPZiC-F3tQP9Pt44sxbt1KBWl11ePFLmzLjZWja3PJadS_3i5dAIG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgeffteeutdduhfejffetueekkefhjeejudetheejffeuudevjedtteekfeef
 vdeinecuffhomhgrihhnpehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdpiigvkh
 hjuhhrrdhnvghtpdhgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhophdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hkxIYfFxnA92v8fJW-R1EZWYOyiRGoWyT4zz7EKz6t-zu1NsEG-3yA>
 <xmx:hkxIYfXNangG0FZrpqitSSEHHSIqM-eestlDq4C73jXYYB24oYf8Cg>
 <xmx:hkxIYaNrRg9GiLlP49pxxP0ZLo6RcEvsAYM9DjmgeJu3tSvwjMUvCw>
 <xmx:h0xIYaSCJWbhKJ0evbK2voRl9lDDxCofuc4nrtxObaXRsR-w-D0yRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 04:55:33 -0400 (EDT)
Date: Mon, 20 Sep 2021 10:55:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Stapelberg <michael@stapelberg.ch>
Cc: dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org,
 felix.kuehling@amd.com, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
Message-ID: <20210920085531.jd4r2kvva6jxyzd2@gilmour>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zqtkax4lkiwcsk4m"
Content-Disposition: inline
In-Reply-To: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zqtkax4lkiwcsk4m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 18, 2021 at 11:18:33AM +0200, Michael Stapelberg wrote:
> torvalds at linux-foundation.org (Linus Torvalds) writes:
> > Did I fix it up correctly? Who knows. The code makes more sense to me
> > now and seems valid. But I really *really* want to stress how locking
> > is important.
>=20
> As far as I can tell, this merge conflict resolution made my Raspberry
> Pi 3 hang on boot. You can find the full serial console output at:
>=20
> https://t.zekjur.net/linux-5.14-raspberry-pi-3-hang-vc4.txt
>=20
> The last few messages are from vc4, then the boot hangs.
>=20
> Using git-bisect, I tracked this down to
> https://github.com/torvalds/linux/commit/e058a84bfddc42ba356a2316f2cf1141=
974625c9,
> which is the merge you=E2=80=99re talking about here, AFAICT.
>=20
> I also tried the git://anongit.freedesktop.org/drm/drm, and that tree
> boots as expected, suggesting that the problem really is with the
> additional changes.
>=20
> The code seems to work on my Raspberry Pi 4, just not on the Raspberry
> Pi 3. Any ideas why that might be, and how to fix it?

I assume you run your Pi without anything connected on HDMI, and without
hdmi_force_hotplug in your config.txt?

If so, can you test that branch, and let me know if it works for you
https://github.com/mripard/linux/tree/rpi/bug-fixes

Maxime

--zqtkax4lkiwcsk4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUhMgwAKCRDj7w1vZxhR
xXrwAQCQVWqAu8F6yLeXeRoIYzzDqpXYQkLoKvKxqDIxuoOkkAEAjGK/tkOzYXZF
Pzwja7WYQGSkxEANNFnu0802YN2JqAk=
=qGKK
-----END PGP SIGNATURE-----

--zqtkax4lkiwcsk4m--
