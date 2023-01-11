Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D71665B5A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 13:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488BB10E298;
	Wed, 11 Jan 2023 12:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392F10E298
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:29:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49C6B61CC6;
 Wed, 11 Jan 2023 12:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7004FC433D2;
 Wed, 11 Jan 2023 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673440144;
 bh=Zscbi5g8KaLoxtqKTYTy4v+bGIgrfP5nEZUwDmWu4fk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/JK1rDKHYHvhajygf8w2mRW7bMgVgUH371tQZ88bFcNbixMBZAxLFSALrT2UDs3U
 6K8/8oxZLnMz3x7nh2jq3/MZ+CUaRUaFJYW7Q7lH0eSBnQdanynH3q02mFxJ4y/Xpx
 ddxMtPWrOJGgLsZ1UMh0wbHwaEKw69eDLBaHEDQ+X8jpgLHTK5qyboL8RW79Ymp+sV
 p3BzBmpCthJfVLY02wHyti3OQ7na5Y027dZ+vDHqN9gNq0te3IBkBl1g1bStQgJVCi
 j/NyxJqDNJm2CSXGEcHXG8wj7sWDGcPdnotZZkDNhNtg6vHzuhzisPWlGNUUFasEoj
 BAwxQQCCLgU9g==
Date: Wed, 11 Jan 2023 12:28:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: next-20230110: arm64: defconfig+kselftest config boot failed -
 Unable to handle kernel paging request at virtual address fffffffffffffff8
Message-ID: <Y76rijHJ3KAZ6D9C@sirena.org.uk>
References: <CA+G9fYsns3krivbPSjQ1c1EQpVyd-bkW84MaUvqMTQr9c=iEaw@mail.gmail.com>
 <77342621-d67f-4d47-a33b-6f721576bf9d@app.fastmail.com>
 <19423616-79d4-9478-c6df-4f226f87a27f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OZN5I8D63BKoaTA7"
Content-Disposition: inline
In-Reply-To: <19423616-79d4-9478-c6df-4f226f87a27f@linaro.org>
X-Cookie: Life is not for everyone.
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-next <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-amlogic@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--OZN5I8D63BKoaTA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 11, 2023 at 11:34:41AM +0100, Neil Armstrong wrote:

> I merged a fix that could be related: https://lore.kernel.org/all/20230109220033.31202-1-m.szyprowski@samsung.com/

> This could make the driver to return from probe while not totally probed, and explain such error.

We're seeing issues in all configs on meson-gxl-s905x-libretech-cc
today, not just with the kselftest fragment.  The initial failuire seems
to be:

[   17.337253] WARNING: CPU: 3 PID: 123 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x8c/0x94 [drm]

full log at:

   https://storage.kernelci.org/next/master/next-20230111/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt

and links to other logs at:

  https://linux.kernelci.org/test/job/next/branch/master/kernel/next-20230111/plan/baseline/

Today's -next does have that fix in it so it's not fixing whatever the
original issue was, I suspect it might even be exposing other issues.
We are however still seeing the stack filling up, even with a GCC 10
defconfig build.

--OZN5I8D63BKoaTA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO+q4kACgkQJNaLcl1U
h9Dk9ggAgiyNXp8FESi8ST8bCJzfxxMvylBdG+Z+1Q2//2usTBZ89jQ94M9CVgZr
AHSsut/qzDLYBEQQ9VnLXutGV1MEWqwl+K0vILqKKTV2+uwAcbpWOENJwnbGzN7+
fz8MtV05xlt9M1K7qtQnRb01xgt7zXr0lY1HVOpQyJzInoCypdlp9laV/nsQDYh+
X5WPh12TqUbzc1LBqHBV1xpOZ8C+NNptsRuyLM3IJex6Am6xcNTnH4OcEL1vAuWp
ASrh9a7w1rxfYBYVUMJIhdCNHZZmaj+NuB2hAEJNnQ7NNGPeaCYMvpe8S5DE4/Uz
owLmp0WY+mpnbwzg6IPpQHjNeFiqJA==
=gr7z
-----END PGP SIGNATURE-----

--OZN5I8D63BKoaTA7--
