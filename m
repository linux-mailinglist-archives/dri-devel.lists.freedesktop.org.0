Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E940ACFDE4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA45410E03E;
	Fri,  6 Jun 2025 08:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VyHv5TV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968C10E03E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:05:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2BC96614BC;
 Fri,  6 Jun 2025 08:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811DDC4CEEF;
 Fri,  6 Jun 2025 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749197136;
 bh=2+ukVt7ZT/sBmEW2z10tGXejfw+yjMbmy9hjYlP/qvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VyHv5TV0fw7A2TwPXdNR3B6gHFyovUH291qD/ftkl1u3S0HRqsDN7A5evqljYQfDR
 ddDzLAbEn1SjcHr66kgmq5nHIiY0P1E2Y50dyHR5BHSfIP8OJB3NU++tPtyQHKO9hH
 Fwn1gtMPIukScrIn3BPTuzRgaNac1/e4ajeTMLUXfbokpF1uGe7N2s/9TviafBMqkd
 7sb6+0IQFIxtx2eZ3yiXaaoB0+ZrPFrZUW+WeKbkeDshbEjRIhPx6Nik0l5G67c0qH
 TgOCXcgh3oxiPoTFE+mG4Uyv6bHyMFczt2w9vhr4UqXKZaGokv9+eFs1sVYrfbkG1Y
 GH03g4Hd4vxFQ==
Date: Fri, 6 Jun 2025 10:05:34 +0200
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
Message-ID: <20250606-fat-optimal-jackrabbit-cdbb9f@houat>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
 <20250531102304.GF21197@noisy.programming.kicks-ass.net>
 <20250602-phenomenal-turkey-of-hurricane-aadcde@houat>
 <20250603122603.GK21197@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qoe724hz7swoodx2"
Content-Disposition: inline
In-Reply-To: <20250603122603.GK21197@noisy.programming.kicks-ass.net>
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


--qoe724hz7swoodx2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 02:26:03PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 02, 2025 at 01:13:29PM +0200, Maxime Ripard wrote:
>=20
> > > I can't operate kunit
> >=20
> > Why not?
>=20
> Too complicated. People have even wrecked tools/testing/selftests/ to
> the point that it is now nearly impossible to run the simple selftests
> :-(
>=20
> And while I don't mind tests -- they're quite useful. Kunit just looks
> to make it all more complicated that it needs to be. Not to mention
> there seems to be snakes involved -- and I never can remember how that
> works.
>=20
> Basically, if the stuff takes more effort to make run, than the time it
> runs for, its a loss. And in that respect much of the kernel testing
> stuff is a fail. Just too damn hard to make work.
>=20
> I want to: make; ./run.sh or something similarly trivial. But clearly
> that is too much to task these days :-(

Are you sure you're not confusing kunit with kselftests?

You can run all tests in the kernel using:
=2E/tools/testing/kunit/kunit.py run

Restrict it to a single subsystem with (for DRM for example):
=2E/tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/tests

Both would compile a UML kernel and run the tests on your workstation,
but you can also run them in qemu with:
=2E/tools/testing/kunit/kunit.py run --arch x86_64

So it looks close to what you expect?

Maxime

--qoe724hz7swoodx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKhTQAKCRAnX84Zoj2+
dkuhAX9LyJvmNiSNTxiTi6JgV/sxlSk5sRo97QTw1YnBFIjUT/sl00MRuvKDZFaq
sKRGjvEBf17xAmxt5cStdYQumenD9U2D4emcx7/aZKS7vfTR34g6tAmFa1ggk8Wc
ZpbpxDrD5g==
=TJNi
-----END PGP SIGNATURE-----

--qoe724hz7swoodx2--
