Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF579A8E3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBE010E1AF;
	Mon, 11 Sep 2023 14:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908110E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:46:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A552B80E5E;
 Mon, 11 Sep 2023 14:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E72C433C8;
 Mon, 11 Sep 2023 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694443613;
 bh=GajsJSo2epB55/QXlHa/vb50gsyMmkBm0dq/dBU22L0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5mC1L6tFXnJ3XqZxh9lRAwUouQwGfHGue4LGkWDhnduL1VU6VZD3Tq60Xhm5Af+M
 w1sPRi8BL2meLINNTko9B91ikEGFc6P3AETxVrohj5BlgO2Yi3EuSjqTnynyKjxxCV
 6fL18lMOmQFgpsZqnVnOMfyDDgwXZ9iACQ8hKYR27JvtjdXQYYMmLZRUg1EsRhwHIo
 yKjnxS3BNYy0JX9PurDrL38poPpk7Ia7oP/Q1S6uoI1mFNZ+daJ6HVlg4ua/saJZ1V
 xSPw7Wjab/NW+2VYUGEA9g4ABOGf7eE/2OtvOPN3zDUzbnLoC/K+8FHbBSr8YzJqox
 hyWwCrhU//CNQ==
Date: Mon, 11 Sep 2023 16:46:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
References: <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
 <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
 <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
 <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uuq5zmkty6dwz5s2"
Content-Disposition: inline
In-Reply-To: <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, vignesh.raman@collabora.com,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 linux-rockchip@lists.infradead.org, Daniel Stone <daniels@collabora.com>,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, anholt@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uuq5zmkty6dwz5s2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replying one more time, because I certainly don't want to create any
hard feeling here.

On Mon, Sep 11, 2023 at 03:30:55PM +0200, Michel D=E4nzer wrote:
> >>>> By keeping those sets of expectations, we've been able to keep Mesa =
pretty
> >>>> clear of regressions, whilst having a very clear set of things that =
should
> >>>> be fixed to point to. It would be great if those set of things were =
zero,
> >>>> but it just isn't. Having that is far better than the two alternativ=
es:
> >>>> either not testing at all (obviously bad), or having the test always=
 be red
> >>>> so it's always ignored (might as well just not test).
> >>>
> >>> Isn't that what happens with flaky tests anyway?
> >>
> >> For a small minority of tests. Daniel was referring to whole test suit=
es.
> >>
> >>> Even more so since we have 0 context when updating that list.
> >>
> >> The commit log can provide whatever context is needed.
> >=20
> > Sure, I've yet to see that though.
> >=20
> > There's in 6.6-rc1 around 240 reported flaky tests. None of them have
> > any context. That new series hads a few dozens too, without any context
> > either. And there's no mention about that being a plan, or a patch
> > adding a new policy for all tests going forward.
>=20
> That does sound bad, would need to be raised in review.
>
> > Any concern I raised were met with a giant "it worked on Mesa" handwave
>=20
> Lessons learned from years of experience with big real-world CI
> systems like this are hardly "handwaving".

Your (and others) experience certainly isn't. It is valuable, welcome,
and very much appreciated.

However, my questions and concerns being ignored time and time again
about things like what is the process is going to be like, what is going
to be tested, who is going to be maintaining that test list, how that
interacts with stable, how we can possibly audit the flaky tests list,
etc. have felt like they were being handwaived away.

I'm not saying that because I disagree, I still do on some, but that's
fine to some extent. However, most of these issues are not so much an
infrastructure issue, but a community issue. And I don't even expect a
perfect solution right now, unlike what you seem to think. But I do
expect some kind of plan instead of just ignoring that problem.

Like, I had to ask the MT8173 question 3 times in order to get an
answer, and I'm still not sure what is going to be done to address that
particular issue.

So, I'm sorry, but I certainly feel like it here.

Maxime

--uuq5zmkty6dwz5s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP8oWgAKCRDj7w1vZxhR
xeoaAQCel+s1l4ON0RwLsGGIhWRQkRm3rOPEl1s1oAgC7ibXSwEAp4V+2IAQRlWC
JJT0CY046wasZ7fQ6QP2X7LhxQsGdgA=
=uxXU
-----END PGP SIGNATURE-----

--uuq5zmkty6dwz5s2--
