Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D8D31BD1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560F710E890;
	Fri, 16 Jan 2026 13:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OvuEmjBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF8C10E890;
 Fri, 16 Jan 2026 13:21:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF1C960150;
 Fri, 16 Jan 2026 13:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB600C19421;
 Fri, 16 Jan 2026 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768569713;
 bh=AwwMcfCvI52EonzETQM8VuXkfj9DaF58cwaLSfLpw90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvuEmjBgpmbpZphfXMx8a9bvKjBG1mK4AAO3GlnRZQZDI+cYcrUZ2ySqIG0LuaANE
 lxG8KTT5PDOftkMwkOgV97dCZNhfvIzwIQhEeZlg6H3TstL+5v/pEskuZdfKReM2lv
 wkoIIieuy7XiwXjo9n3tLaQ8rbod6Kg/t2/lYUSUVvFLZTa7O9mdE4w75Fj5TOdvHZ
 LjcHA9sz2UXS09A4/zTd2TlHPmq7T6dEWVBvA7HKpZorEnsJa15dQtR2/lBsmt3Yjk
 3ZZcYPysLGeWPdcG1UdOiG8m6uKixrvnQ3Dc1kIgDzxJpECLOUojd2A1eNvCihFYpu
 nv/orxPCZJGOQ==
Date: Fri, 16 Jan 2026 13:21:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Runrun Liu <liurunrun@uniontech.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com,
 kernel@uniontech.com, Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: Re: [PATCH] treewide: fix misspelling of "minimum" in comments
Message-ID: <80d33c6d-0a71-4c32-91a8-41533963bf1a@sirena.org.uk>
References: <8FCE6718C7BBE127+20260116074202.56135-1-liurunrun@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lao7dRgsACNL8P7T"
Content-Disposition: inline
In-Reply-To: <8FCE6718C7BBE127+20260116074202.56135-1-liurunrun@uniontech.com>
X-Cookie: I've only got 12 cards.
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


--lao7dRgsACNL8P7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2026 at 03:42:01PM +0800, Runrun Liu wrote:
> Fix misspelling of "minimum" in comments across AMD display and Realtek
> codec drivers.

> This typo is already listed in scripts/spelling.txt by commit
> 8c3200265787 ("scripts/spelling.txt: add several more common
> spelling mistakes").

>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
>  sound/soc/codecs/rt5659.c                   | 2 +-
>  sound/soc/codecs/rt5665.c                   | 2 +-
>  sound/soc/codecs/rt5668.c                   | 2 +-
>  sound/soc/codecs/rt5682-i2c.c               | 2 +-

Please just submit one patch to each subsystem, there's no need for this
to be treewide and it makes it much easier to work out how to apply it.

--lao7dRgsACNL8P7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqO2oACgkQJNaLcl1U
h9COAAf/XQVjEmGAWOAd3mmz2fOf7IWdi7e78QVlIjVtmne2Eu60w6hMW+Z5tvWT
k20m25Fdf5gIkZC+DZ2J/9JZYXb+anIQlhRXrICPu9b2Bq6gjvDDhIxujAaFCS/N
9U9GZkr5NZmt1uk68kJKWcp7VB39mBV/gfV0KF1eAJkSZlaxSSWhSk3oqO7oP22Q
EbNyHEwZ1nldkvRaSYSCQBtFD1y1Kporw36IQCR2/AdiMEFDkwB/sYCr0wS35FWD
NqbPhz0nHqQg/Mz+zaIbKxZZ+I2jrgogmqAGiD5ZV+dahaSn3gbAHPHHdDvdZE8s
wku4xWnuI+Xpx6S2DIYhU055TJNP7A==
=poWA
-----END PGP SIGNATURE-----

--lao7dRgsACNL8P7T--
