Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C57FBDD8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752110E572;
	Tue, 28 Nov 2023 15:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FE410E571
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:12:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 14AD9B82CA4;
 Tue, 28 Nov 2023 15:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A308C433C7;
 Tue, 28 Nov 2023 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701184353;
 bh=EreEuo3ByevFdxyj2xZ343mwDCOQFDjI9HUYNeB8qMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZEoh+vW0OQftZ9iSM+pSRAtdLZ0zQ9uW00oeELJA6Y7FXtS9IFsTAMfDp1e8MqDMm
 SrvZogELxuM10C8TdtH40z3Syt8/4hvtAqMY8M4S5hXbFUQh70GveTisFE361PR5ef
 9LyW9XZD3lle+hXXX2BOLP9/NdtjvmiMUgisVwbQ5xcwxMygeeHkRZ6QBM5EHwAGFv
 Hd034FjlzqIzlXhYzThgIT4KBpDpLWJa8fmO83/8gxrz21ctQ7XdaTFVa+00p/eZAb
 BsjBOgdTwEjcIpORqR+G0wtCwZ4cEzYM32eqYzeItQDoRyveZO3vfzuKK8fhrj1OBr
 WHHZZI5RpX61g==
Date: Tue, 28 Nov 2023 16:12:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [RFC] drm/tests: annotate intentional stack trace in
 drm_test_rect_calc_hscale()
Message-ID: <pqaahxdy4lk3kof3z6p5balhkjb7zkcodfbvofoxpuwuspmu77@4b2zkf3odalp>
References: <02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain>
 <CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com>
 <7b58926a-a7c3-4ad0-b8a3-56baf36939ca@kadam.mountain>
 <s4blvjs4ipcqdzodmgsbvgegqh2kxgdnoerpwthvc57hpsulu5@gb2kh7vbv7nq>
 <8489c4db-6639-43f5-b6c4-8598652cdce6@suswa.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f3ytx2rrawo75fs2"
Content-Disposition: inline
In-Reply-To: <8489c4db-6639-43f5-b6c4-8598652cdce6@suswa.mountain>
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
Cc: Daniel =?utf-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, kv-team <kv-team@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f3ytx2rrawo75fs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Nov 15, 2023 at 05:42:17PM -0500, Dan Carpenter wrote:
> On Mon, Nov 06, 2023 at 02:58:12PM +0100, mripard@kernel.org wrote:
> > > But a similar thing is happening here where we have so many bogus
> > > warnings that we missed a real bug.
> >=20
> > IIRC, there was a similar discussion for lockdep issues. IMO, any
> > (unintended) warning should trigger a test failure.
> >=20
> > I guess that would require adding some intrumentation to __WARN somehow,
> > and also allowing tests to check whether a warning had been generated
> > during their execution for tests that want to trigger one.
>=20
> I think this is a good idea.  I was looking at how lockdep prints
> warnings (see print_circular_bug_header()).  It doesn't use WARN() it
> prints a bunch of pr_warn() statements and then a stack trace.  We would
> have to have a increment the counter manually in that situation.
>=20
> I'm writing a script to parse a dmesg and collect Oopses.

Do we need to? I was only expecting a boolean to be set or kunit_fail to
be called in the WARN/lockdep warning code path if a test is running?

> So now I know to look for WARN(), lockdep, and KASAN. What other bugs
> formats do we have? Probably someone like the syzbot devs have already
> has written a script like this?

I think you got most of it covered, I can't think of any other source of
failure right now.

Maxime

--f3ytx2rrawo75fs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWYDXgAKCRDj7w1vZxhR
xe+PAQCPKkPfBpRK1+qczjNj3c+A6ZhufldsIRpm3uIfqbui9wD+Jyk05rhSakGj
+srHLHnrqrGTmcbIXi4CaSax0l0TDQg=
=YA0J
-----END PGP SIGNATURE-----

--f3ytx2rrawo75fs2--
