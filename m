Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EAFACAD0A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EE110E2EF;
	Mon,  2 Jun 2025 11:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qHrFdgoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A6B10E2EF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 11:13:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 813116111C;
 Mon,  2 Jun 2025 11:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B599CC4CEEB;
 Mon,  2 Jun 2025 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748862812;
 bh=mpkiAxp0RtEKPIpdKzXz8jZ22lmjIK9Sp2k/YSb3uRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHrFdgoKolYrJm2pQgspjLDl3Zf2qSPtHyKVlLibr0HLZXVBnOfp0pRcwIvaf9Ddp
 MLKr0l95As4mGvcH+GiwlE5Dt9+SgaODj2Hr2M2RZHC/WGnDlXhactJilGI2v7fyof
 b/LA5tAIUysceyvxL7sjv1ZvLa5AxC+dByl/AkQRHqzCmNEDbEdbYdST0lnHqUL0Wg
 qxDfujOhlZY/yrS2AuInwBsGzLKKII/jQCPzKyOJuB2Xci8x/gWca3952RO8MnlUbL
 5rk+CGaRBer2cjzQDCXa9sJ53QaRVcrP0E4VgfvnoZnDXlQkd+BA1vOiKsMoysGKOP
 pHvYnQXDEG3HA==
Date: Mon, 2 Jun 2025 13:13:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, 
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, 
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <20250602-phenomenal-turkey-of-hurricane-aadcde@houat>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
 <20250531102304.GF21197@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qoxbr2ctkkwebol6"
Content-Disposition: inline
In-Reply-To: <20250531102304.GF21197@noisy.programming.kicks-ass.net>
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


--qoxbr2ctkkwebol6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
MIME-Version: 1.0

On Sat, May 31, 2025 at 12:23:04PM +0200, Peter Zijlstra wrote:
> On Fri, May 30, 2025 at 10:48:47AM -0700, Kees Cook wrote:
> > On Fri, May 30, 2025 at 04:01:40PM +0200, Peter Zijlstra wrote:
> > > I'm not really concerned with performance here, but more with the size
> > > of the code emitted by WARN_ONCE(). There are a *ton* of WARN sites,
> > > while only one report_bug() and printk().
> > >=20
> > > The really offensive thing is that this is for a feature most nobody
> > > will ever need :/
> >=20
> > Well, it won't be enabled often -- this reminds me of ftrace: it needs
> > to work, but it'll be off most of the time.
>=20
> Well, ftrace is useful, but when would I *ever* care about this stuff? I
> can't operate kunit

Why not?

> don't give a crap about kunit

That's your choice, of course, and it might not be useful to you anyway,
but it's *really* nice and closed a major gap in testing in some other
areas.

I'd still encourage you to try it, it might be worth your time.

> and if I were to magically run it, I would be more than capable of
> ignoring WARNs.

Yeah, it's not just about ignoring WARNs, but mostly about knowing which
ones you can ignore, and which ones you should fix.

We're getting at a point (on some subsystems I guess) where we actually
have a decent testing suite we can ask contributors to run and have all
tests passing.

We also want to ask them to fix whatever issue they might introduce :)

Thanks for your help on getting a cleaner solution!

Maxime

--qoxbr2ctkkwebol6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD2HWQAKCRAnX84Zoj2+
diZpAX9dV/a6ieVWLNCtG594KpHg9fUqoQ9HH+DhV86VbFAsQS2WE6+HlIIx3qgt
ESmZR28BgPLrnPHMz49zNdnmZNinh4e3QfxkMJYbTN5PsPUlk45N0OsqOy5s7HAG
wUcPFDzBnQ==
=WE6O
-----END PGP SIGNATURE-----

--qoxbr2ctkkwebol6--
