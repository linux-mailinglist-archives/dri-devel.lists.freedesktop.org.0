Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E4ACACB6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 12:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAA110E1BC;
	Mon,  2 Jun 2025 10:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4kk0B7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D610E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 10:48:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E1066111C;
 Mon,  2 Jun 2025 10:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73003C4CEEB;
 Mon,  2 Jun 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748861281;
 bh=Wty6Wq68ewqvz7Tt1hRI0LScGyWfS4wxoxNlHZ5WXU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h4kk0B7FNN1ZWr9IWZzltdeaBe0qWfnLlcEMgdhEwFJNkNnT2LuieXSkAIjPSeJLm
 vh8e7PueCedUKuMw0OEEI2Ln9T8EID4npDcPbYzZMn0Aeqkcusw2RuNevc1wg6L5az
 GGYiY7uI5CQoZsQXNAvSqUxIHrJb/RBhRlmBjMRMB4iobjmAuTIFLR8bCoD7+VQA3e
 DD7qw/dy8dBdoXbnM41U6tAl785b+pAkKE1e+SLmB884KnplLOfdkbpyoTLNsMKBMT
 2odQhjvO8z6TATn/rb24eixdNpkEsTuV42fCn97yHTiv8PnvelUOlGO2yAoJPf5l7V
 vpBR+36pz1aTQ==
Date: Mon, 2 Jun 2025 12:47:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alessandro Carminati <acarmina@redhat.com>, 
 linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] kunit: Add support for suppressing warning
 backtraces
Message-ID: <20250602-polar-gray-toucanet-a68a41@houat>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <aD1Roe-z6o1Y5K2V@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lvmkbabpg6illdhp"
Content-Disposition: inline
In-Reply-To: <aD1Roe-z6o1Y5K2V@stanley.mountain>
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


--lvmkbabpg6illdhp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/5] kunit: Add support for suppressing warning
 backtraces
MIME-Version: 1.0

On Mon, Jun 02, 2025 at 10:24:17AM +0300, Dan Carpenter wrote:
> I like suppressing warning messages but there are still many cases, such
> as mm/kasan/kasan_test_c.c where printing the warning message is the
> whole point.
>=20
> We should create a standard way that test bots can filter out deliberate
> errors from unintentional errors.  This would also help humans who have
> to look at test results.
>=20
> #define intentional_warning_marker(type) do {				\
> 	pr_err("Triggering intentional %s warning!", type);		\
> } while (0)
>=20
> intentional_warning_marker("KASAN");

I understand what your usecase is, and would definitely appreciate
something like that too, but I don't think this is the right way to do
it.

Once we have the basic infrastructure in place to flag which warnings
are legitimate and which aren't, I believe a better way to achieve what
you're asking for would be to treat as failures any warning with a WARN,
and any test expecting a warn that didn't trigger any.

This would bring kunit on par with pretty much every other unit test
frameworks out there, and would make it pretty obvious to any users (CI
and humans) when it works and when it doesn't.

Maxime

--lvmkbabpg6illdhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD2BXwAKCRAnX84Zoj2+
drLwAYDKoxTUiusghkG4/DVOcfFiLWP8RIQ7MwBrgQX33S75ABf2lkV/jtSOd+vB
nydVLEoBfjnS1T5PyeXGeC1wvJOrdYpF3Pnuk4fGn/aoyenjNNsyIbj92pw0fPHy
ybYZj0r0mA==
=r4oE
-----END PGP SIGNATURE-----

--lvmkbabpg6illdhp--
