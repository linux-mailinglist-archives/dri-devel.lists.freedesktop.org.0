Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289C5C2E0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 20:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5D89C96;
	Mon,  1 Jul 2019 18:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99EB189C93;
 Mon,  1 Jul 2019 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 1BD8A10A1260;
 Mon,  1 Jul 2019 11:25:40 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vMEmiYf2-qnV; Mon,  1 Jul 2019 11:25:38 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id C7B8610A0431;
 Mon,  1 Jul 2019 11:25:38 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 566E62FE21CE; Mon,  1 Jul 2019 11:25:38 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: inherit clocks enabled by bootloader
In-Reply-To: <20190630150230.7878-2-robdclark@gmail.com>
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-2-robdclark@gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Mon, 01 Jul 2019 11:25:36 -0700
Message-ID: <8736jpzk67.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1488372712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1488372712==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> From: Rob Clark <robdclark@chromium.org>
>
> The goal here is to support inheriting a display setup by bootloader,
> although there may also be some non-display related use-cases.
>
> Rough idea is to add a flag for clks and power domains that might
> already be enabled when kernel starts, and which should not be
> disabled at late_initcall if the kernel thinks they are "unused".
>
> If bootloader is enabling display, and kernel is using efifb before
> real display driver is loaded (potentially from kernel module after
> userspace starts, in a typical distro kernel), we don't want to kill
> the clocks and power domains that are used by the display before
> userspace starts.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Raspberry Pi is carrying downstream hacks to do similar stuff, and it
would be great to see CCF finally support this.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0aUCAACgkQtdYpNtH8
nui9RBAAnmVfgiACM7S2QSkoxsuAb+2zUIY7QTEdS6E25ZqZzNmGPmMTISp/XxAA
NLGeI6XUfygjG9EKv0VFXWqqYEmZakub2aySsyMeMen+ERcERfS48CJN5gt6iMdK
GgOmuPB7ZzmNJBYtFtDi8gLluTJeN4IyPMSEro8rBE0PQbaQ58DBWHjFlpENnfP3
H3UiaafiPLs3FlkHoqat22EFkaykUwcuDHzrDhvHBeef8AQ/daG2wUJxqeMG09y7
f7w+vnehZUJD05TbUhGp27SspqL9zGv9+ZxMDnkT80TOjECCP9pux7uH/To3XF9u
E/3Frxf4vRYWIMpdp291UCWqbxmeUojDqbKijBMOlrdWEmXAZZhgfGfJfJ+yBsmI
Jo1lmr8/H3HU86e73OxYvMk1xMu3MJJIcaY60MNJ1TTKYMoEjMoOxGJC3GzzePzp
77f2Rj5qoyLXDhFIYjtAGHUoxsGbqTCZAVl3blEUUKxZ7NXcwkGnEdxamFcNGfR9
IEInM+oyCsjq1XebE0Oq/Rgst/w15nRblNpQyJFU7iQhMGo44wb1G4baTQ3Y+Zh0
YXHwx/goMr8Y3CufPNWSsVGRVQpKu187uSBQ99zlcF/cpceXvGPJqMQQGE7G34lV
2CMtjR2tL0dlpjYMTfYMRo7i/MevZYi2GyVWrzEJTeqmMVWthuc=
=gR9l
-----END PGP SIGNATURE-----
--=-=-=--

--===============1488372712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1488372712==--
