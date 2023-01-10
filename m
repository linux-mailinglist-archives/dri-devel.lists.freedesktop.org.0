Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6566466F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4C10E603;
	Tue, 10 Jan 2023 16:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E623210E603
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:45:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F5FCB81892;
 Tue, 10 Jan 2023 16:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09D5C433EF;
 Tue, 10 Jan 2023 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673369113;
 bh=HE6Q4NXUzpaBllounynVA5H1Vsv5Qxb9vxunO/lCiv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2anPB30X8YmUosIs5zc91RpfpZbQjzT9wKHh2Iv/3pv8juVRXpVU7ejOnqqt7eZG
 ME95R4y/vZXPU+6P/8ii8GjSJNFXGDLXI9Z/t2kg6WHg1fFqms1rg7Zq1+O21zZuPT
 cUDlNxU402r7WsCICOOH3bi5d5ymTLy4e6gE3w30dee4GgPffB9lobFFzlUV/KUZRf
 22S7I4EIfNyU6cN6l3gPd7uOYB6Aq8pgc3eoVA+l3rS8xTuRk+udUrvUqAbV0nWOD4
 r7XlCOplzuCc190BAE44/uUzwSu+oo3OrvB5qD5iyL9mqTgSrl5n7RXz4RD7ZiA+ft
 bM+KekEFtKgJg==
Date: Tue, 10 Jan 2023 16:45:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: next-20230110: arm64: defconfig+kselftest config boot failed -
 Unable to handle kernel paging request at virtual address fffffffffffffff8
Message-ID: <Y72WEvxzARvnWVST@sirena.org.uk>
References: <CA+G9fYsns3krivbPSjQ1c1EQpVyd-bkW84MaUvqMTQr9c=iEaw@mail.gmail.com>
 <20230110163258.GC9436@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Xgn8lZtczXaFspXy"
Content-Disposition: inline
In-Reply-To: <20230110163258.GC9436@willie-the-truck>
X-Cookie: Live free or die.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Aishwarya TCV <aishwarya.tcv@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, regressions@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 nathan@kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, james.clark@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Xgn8lZtczXaFspXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 04:32:59PM +0000, Will Deacon wrote:
> On Tue, Jan 10, 2023 at 09:44:40PM +0530, Naresh Kamboju wrote:

> > GOOD: next-20230109  (defconfig + kselftests configs)
> > BAD: next-20230110 (defconfig + kselftests configs)

> I couldn't find a kselftests .config in the tree (assumedly I'm just ont
> looking hard enough), but does that happen to enable CONFIG_STACK_TRACER=y?

It's adding on all the config fragments in

   tools/testing/selftests/*/config

which includes ftrace, which does set STACK_TRACER>

> If so, since you're using clang, I wonder if this is an issue with
> 68a63a412d18 ("arm64: Fix build with CC=clang, CONFIG_FTRACE=y and
> CONFIG_STACK_TRACER=y")?

ftrace also enables FTRACE.

> Please let us know how the bisection goes...

Not sure that Naresh has a bisection going, I don't think he's got
direct access to such a board.

--Xgn8lZtczXaFspXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO9lhEACgkQJNaLcl1U
h9DM1wf4sO6Fo8gQppTKumwECBNVeO+TdhIMe9/HbnqGY5crgsaaATNyv8BCnFVM
nFUDvsSm+/aaFl7JyP9j4G049XhajrXRY2pwDIZhd0AGWX8t4I30VSMwkrs55fS4
7akRRgvngaxcQtxof99W1r7zXCGIytUdyPbxwfwL7CdKuOGBdKNYMwzxDi3mDezU
4abIMUxqLdxfQ/NITR7843nADjUNvGSGWIkOxTMN7xt8qzTD+B8rGLRE85D94kr4
DZYbjqordIxk9uMuJ6rZzUkkHzg1Po7K7pL+O5yAEFIojUbyHVed2wdsw7W3Oxmi
5WyuaJVJ1ILFmCCqLBlrQdQCRrqm
=LS4A
-----END PGP SIGNATURE-----

--Xgn8lZtczXaFspXy--
