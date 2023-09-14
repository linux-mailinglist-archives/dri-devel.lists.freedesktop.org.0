Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C135B7A0581
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B7810E26E;
	Thu, 14 Sep 2023 13:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71CA10E294
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:24:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C7D4ACE26B1;
 Thu, 14 Sep 2023 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D36C433C8;
 Thu, 14 Sep 2023 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694697883;
 bh=ApqBLmkZaOR9bG+HCuUd45NKWx9gUEFfpn0IjLXQiSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MsZpkq2Qfg4PGoVIOMmE06NU8NwcxYgQWuzHyaEdgO4eFr1TmqhlFmr3Zow5EoaoY
 NsyBod+a1fCTNP5TSmgFnVSn1TOyVnmR08NOdRzzpc4hroDQEoXQrOPVTxXrLyAbh1
 bZqy+saUO0I+jw60sp06sPMEJ5CzQVLPF82U2v3/d/YbUfwCrT8j4bQTuVW9xLrOH8
 Z/89qoW9RZsKT9zz9x2CeDZk4saVDdP5F+rg9aLHKKw9/JC8U3ufljvKGLZ7UtmbUy
 xzIKb2ALVWNZrWf79H2I4PIvOSF5T4M6KKF453tW+3ZBgznKKmRm0gO/RrJCGi47p8
 O7vc+ggnYTsgg==
Date: Thu, 14 Sep 2023 15:24:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/tests: Flag slow tests as such
Message-ID: <wnqxfgo7tljhecw2cajoeb3aga3szfen6eohowjrepfqwakka5@pm6a7iaii7fy>
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
 <20230911-kms-slow-tests-v1-2-d3800a69a1a1@kernel.org>
 <ZQAU7Juw5WM1LAAM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s2sns2gwxynnnns6"
Content-Disposition: inline
In-Reply-To: <ZQAU7Juw5WM1LAAM@phenom.ffwll.local>
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s2sns2gwxynnnns6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sima,

(For some reason, it looks like your mailer sets up the headers to reply
to every recipient but you)

On Tue, Sep 12, 2023 at 09:36:12AM +0200, Daniel Vetter wrote:
> On Mon, Sep 11, 2023 at 11:51:06AM +0200, Maxime Ripard wrote:
> > Kunit recently gained a speed attribute that allows to filter out slow
> > tests. A slow test is defined in the documentation as a test taking more
> > than a second to execute.
> >=20
> > Let's flag the few tests that are doing so on my machine when running:
> >=20
> > ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm/test=
s \
> > 	--cross_compile aarch64-linux-gnu- --arch arm64
> >=20
> > Suggested-by: David Gow <davidgow@google.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Ugh ... not a fan.
>=20
> igt has a really bad habit of making disastrously combinatorial tests with
> impossible runtimes, and then just filtering these out so it's still fast.
>=20
> Maybe some stress tests for overall system make sense like this, but
> absolutely not for unit tests.

I agree, I didn't want to reduce testing though.

> And I did spot check some of these, they're just combinatorial
> explosions with large repetition counts and some fun stuff like going
> through prime numbers because surely that's a good idea.
>=20
> Imo delete them all, and if that causes a real gap in coverage, ask
> the authors to write some actual good unit tests for these corner
> cases.

Ack, I will send a patch doing so.

Thanks!
Maxime

--s2sns2gwxynnnns6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQMJmAAKCRDj7w1vZxhR
xWU7AQCec2+TjFtEJCwvBH+eX+OLCselkl5YoaquXV57CrLH8gEApqmPauoZqE05
5F2myjAiz2vFlA78a+oQ1h6+efFs6Qc=
=Lwvb
-----END PGP SIGNATURE-----

--s2sns2gwxynnnns6--
