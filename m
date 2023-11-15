Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37B7EC7AF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B305910E087;
	Wed, 15 Nov 2023 15:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6010E087
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:50:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A762CE1E3F;
 Wed, 15 Nov 2023 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AEAC433C7;
 Wed, 15 Nov 2023 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700063443;
 bh=AxRQ9Y/RrzRtP29GRL6CccyXYunQ633DeTBzGsCyGQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMot+BPSYUpgf34K5i4JQ4ytk8SMMk5K04pNrSisd4s52Sgg3qskLmpuuaxeqgnRP
 avc6wU1wKa0XdWVGrLU8iWAPY0EjnnZythPnnuWVEYCGYdqPbHF3o8ow8W8Qiwl+Iw
 gNkYj9UY/fVTbP4J8CHROmI2LBIvrLHbpqOOBVHtwDNAgG/ofmLka5ea9J7pQP1Wuf
 OJauXAq4mew6jupJKgFp8jlZWqJkyRgzWmMCmnADYqyu39eNtK0e+TXn3h2cYz/q4s
 8m59XLl/PZ8VUtx+RFs1KHwRrpaS7XJCd7I8/bEV9vDzuZy+ZALLQV6N7j2uxKykNE
 bNvNb6MI7HmzQ==
Date: Wed, 15 Nov 2023 16:50:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH 2/3] drm/tests: Use KUNIT_DEFINE_ACTION_WRAPPER()
Message-ID: <6gfqtuhscq2z2obvx3xh6ve4kj5hrqniyegfywldtx2vowdp5z@ikix547w3vff>
References: <20231110200830.1832556-1-davidgow@google.com>
 <20231110200830.1832556-2-davidgow@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n3zmtdttqoymp72e"
Content-Disposition: inline
In-Reply-To: <20231110200830.1832556-2-davidgow@google.com>
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
Cc: Emma Anholt <emma@anholt.net>, dlatypov@google.com, llvm@lists.linux.dev,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n3zmtdttqoymp72e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Sat, Nov 11, 2023 at 04:08:27AM +0800, David Gow wrote:
> In order to pass functions to kunit_add_action(), they need to be of the
> kunit_action_t type. While casting the function pointer can work, it
> will break control-flow integrity.
>=20
> drm_kunit_helpers already defines wrappers, but we now have a macro
> which does this automatically. Using this greatly reduces the
> boilerplate needed.
>=20
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>=20
> This patch should be a no-op, just moving to use a standard macro to
> implement these wrappers rather than hand-coding them.
>=20
> Let me know if you'd prefer to take these in separately via the drm
> trees, or if you're okay with having this whole series go via
> kselftest/kunit.

You can merge it through your tree with

Acked-by: Maxime Ripard <mripard@kernel.org>

For the patches 2 and 3

Maxime

--n3zmtdttqoymp72e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVTo0QAKCRDj7w1vZxhR
xQeXAP9Cc0Xaqj0i9btSv7+sdwGcJtBfv0nHvQIAVwKgmgijaAEA+a3M3Ed+B0yC
CAa0ilav0pfJVeTj5jGOnK+886mpQw4=
=9flX
-----END PGP SIGNATURE-----

--n3zmtdttqoymp72e--
