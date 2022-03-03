Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DA4CB7CF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 08:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588810EB32;
	Thu,  3 Mar 2022 07:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987FD10E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 07:29:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K8N0150d3z4xbw;
 Thu,  3 Mar 2022 18:29:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646292548;
 bh=qHElhGY8fx0IVkA4MKaoAT7SKM+zW+9ViYbBstwm0qs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aIyY689iO5Ub2F3h0/YJn7qTudOFn5rwYsr0nmJi1qb7/hdplSA6zfgtIzjyWFa6v
 yW51QBkSrGmBySUO4PvmQuDWzEjknWQ/Q909NxxG1ym6uw1xXf177Ob21kqQ3CpA6n
 XiePVycbfe4sjhkOy60jrTT8rvUOIBW4B1H0AoaSkB0CQv6lq4nDsfzj5goc+SNjJ8
 nx2G65gOYNO9Wx9Lb/q36Bnne/C4cvK+ogKbp0TTF3kUsil/mmTF2yZNn3LKpAjoQn
 0s+z2ioFOi3oGL8+OQGKhh7+yNbsFbOZ0nZFAjhWaGZupZeK9wKRvtQbsb5Qq3fAg8
 sPF1FaaAUTX9g==
Date: Thu, 3 Mar 2022 18:29:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <20220303182904.43c5b1fb@canb.auug.org.au>
In-Reply-To: <20220302201610.56ccfbc3@canb.auug.org.au>
References: <20220301092730.10de23c5@canb.auug.org.au>
 <202202281453.C8B840C7@keescook>
 <20220302201610.56ccfbc3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YxTb1i_/VP0VO9/qtU0JIP0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YxTb1i_/VP0VO9/qtU0JIP0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ok, today I used the current kspp tree and added three patches as merge fix=
ups:

https://lore.kernel.org/all/20220228081421.1504213-1-hsinyi@chromium.org/
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd4da1f27396fb1dde079=
447a3612f4f512caed07
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Da2151490cc6c57b368d7=
974ffd447a8b36ade639

(the second one required a bit of fuzzing)

I will remove them as they appear in the drm trees (hopefully).

Kees, you just need to remember that you have a dependency on the DRM
patches being in Linus' tree before you send your pull request.

--=20
Cheers,
Stephen Rothwell

--Sig_/YxTb1i_/VP0VO9/qtU0JIP0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIgbkAACgkQAVBC80lX
0Gw4Ngf9Hh9eVHWDQaSTSHnrUIHmluK7vvHnUi0Pjx7xKwZQa3sRpGhNgBE28dgp
GgvFpjgLlH0zTebqMXovp17jeyylA198sromn6QAnrctzTQskJAIG/TAYI71FMGc
eAaU2FQae9QR581hBTZVG6MZVxSWkMPJRUFly7FOO53QHk5xbWH+Z5JcztX9L77S
5h3GpvbPij1uyybDjwfj8dm06gA1NYd1pyqgZJo0kzvCtSzManYdTfyRZuZk+vmS
9/I1MdCHCUElvpGnEqfitzO6JCtFa/05jQa6b2P2SwDUhF4SErOW9Y3+47vCIx9y
pUiPzw4KbXxKt6mGlaqjHmxFoNGmRw==
=4sHe
-----END PGP SIGNATURE-----

--Sig_/YxTb1i_/VP0VO9/qtU0JIP0--
