Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228B7695F2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A110E275;
	Mon, 31 Jul 2023 12:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9E310E275
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:18:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAF5A6106E;
 Mon, 31 Jul 2023 12:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CA0C433C8;
 Mon, 31 Jul 2023 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690805901;
 bh=rQ7FJqkGeDX2fugIGTDURaI498a99ibW8f64xuQUqhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqHovCvMTm/tPzp0I6/OWLL07l00ZNmpg3dsQUbvyaWDC8lJ3NOJqZ0dwJjZhEgpf
 Zfa81FjNlgeOBb/Dz/r1jH816iAcg/ZyXPmGKGc8w6hv+D5Ww3d7HKLPGJFjsYjjQk
 tPFfYULlsQC0s3ZCqmqsKAqIotkFoM8q3emJbvDKpeiZ3ilcAeFgTsLIMKl3TC9RLG
 l6JcqptcqlhYa8gEAj59Xn6UUa8G2Qnyq22aL39XlRxZfy4U7NZ3CgzL2Dzu9cmp4K
 YY0D8G61F8BfYhBohj348VWPGB2WsEf7WXrNFi6MPbnlCsrgHWLBQC/8WrnwTjmWRX
 ZVbZV56G+ZRag==
Date: Mon, 31 Jul 2023 14:18:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v5 9/9] drm: selftest: convert drm_mm selftest to KUnit
Message-ID: <papkxmdqmpmap7jcamxsjmr5rhilris4glqjawhb6ms6da4ogl@ae3l6ffagqft>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-10-maira.canal@usp.br>
 <7yc3fkagtlr4i7qnkulwvfzqjs7v64ddugcc3cxt6g5oawvqoa@ax67ukkrr7jt>
 <j4twjg4rd74qq6wjr7nrtrtkh6cdxehuw5lmeavu7z5q5lhtih@nofkcrdnwty7>
 <CABVgOSmtZVfuLNBXymVfeuv_997TanhR3R_=Sk0sJL359jhw7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gu25pblv6cnyjr6c"
Content-Disposition: inline
In-Reply-To: <CABVgOSmtZVfuLNBXymVfeuv_997TanhR3R_=Sk0sJL359jhw7Q@mail.gmail.com>
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, Shuah Khan <skhan@linuxfoundation.org>,
 kunit-dev@googlegroups.com, michal.winiarski@intel.com,
 =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 tales.aparecida@gmail.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gu25pblv6cnyjr6c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Jul 25, 2023 at 05:54:32PM +0800, David Gow wrote:
> On Tue, 25 Jul 2023 at 16:38, Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Apr 27, 2023 at 03:14:39PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Fri, Jul 08, 2022 at 05:30:52PM -0300, Ma=EDra Canal wrote:
> > > > From: Arthur Grillo <arthur.grillo@usp.br>
> > > >
> > > > Considering the current adoption of the KUnit framework, convert the
> > > > DRM mm selftest to the KUnit API.
> > > >
> > > > Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
> > > > Tested-by: David Gow <davidgow@google.com>
> > > > Acked-by: Daniel Latypov <dlatypov@google.com>
> > > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > > > Signed-off-by: Ma=EDra Canal <maira.canal@usp.br>
> > >
> > > I'm very late to the party, but I'd like to discuss that patch some m=
ore.
> > >
> > > Two tests (drm_test_mm_reserve, drm_test_mm_insert) in it take a super
> > > long time to run (about 30s each on my machine).
> > >
> > > If we run all the DRM tests and VC4 tests, each of those two are long=
er
> > > to run than all the ~300 tests combined. About 100 times longer.
> > >
> > > I don't think that running for so long is reasonable, and for multiple
> > > reasons:
> > >
> > >   - While I don't know drm_mm well, it doesn't look like any of those
> > >     tests do something that really should take this long. I'm especia=
lly
> > >     skeptical about the fact that we test each operation 8192 times by
> > >     default.
> > >
> > >   - It makes using kunit more tedious than it should be. Like I said,=
 on
> > >     a very capable machine, running the all the DRM and VC4 tests tak=
es
> > >     about 50s with those two tests, ~0.4s without.
> > >
> > >   - The corollary is that it will get in the way of people that really
> > >     want to use kunit will just remove those tests before doing so,
> > >     defeating the original intent.
> > >
> > >
> > > I understand that it came from selftests initially, but I think we
> > > should rewrite the tests entirely to have smaller, faster tests. It's
> > > not clear to me why those tests are as complicated as they are though.
> > >
> > > Also, going forward we should probably put disencourage tests running
> > > that long. Could Kunit timeout/warn after a while if a test is taking
> > > more than X seconds to run?
> >
> > I'd still like to address this. We spend ~90% of the DRM kunit tests
> > execution time executing those two tests, which doesn't seem like a
> > reasonable thing to do.
>=20
> FWIW, KUnit is going to add a "speed" attribute for tests, so that
> it's easy to skip tests which are slow:
> https://lore.kernel.org/linux-kselftest/20230724162834.1354164-3-rmoar@go=
ogle.com/T/#u
>=20
> This would allow the slow tests to be marked using KUNIT_CASE_SLOW(),
> and then be run via kunit.py --filter "speed>slow".
>=20
> It obviously doesn't make the tests themselves any faster, but could
> at least make it possible to run only the fast tests during
> development, and the full, slower set before sending the patches out
> (or in CI), for example.

That's awesome, thanks

Speaking of which, should we detect in kunit.py tests that should be
marked as (super) slow but aren't?

Maxime

--gu25pblv6cnyjr6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMemigAKCRDj7w1vZxhR
xWesAP4rTXMKvVI99e3spTFF7uMSs4CI04EwUB1wYNvei90PhQEA6DhZGF6RTZr+
hxJZBu84ZKXD7FHgygKiwKgAbMY0Swc=
=FyxO
-----END PGP SIGNATURE-----

--gu25pblv6cnyjr6c--
