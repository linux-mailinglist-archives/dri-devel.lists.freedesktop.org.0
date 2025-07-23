Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B4B0F017
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8B10E7A7;
	Wed, 23 Jul 2025 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wb7gA+dL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B76110E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:40:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91A165C276B;
 Wed, 23 Jul 2025 10:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E282C4CEE7;
 Wed, 23 Jul 2025 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753267221;
 bh=Kr9pqZNtJgRq0KuJQB/cKSB7DHn2xeP5OuSwdjWmQ5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wb7gA+dLTG19+kAQhtI7r0ZURbl/JDkasqowAE3a/Wh248Nnlc1k7aU/ksS9RYamq
 knUFyuAwhsxKRsAI/GG5CibNsysPDlNp0afPwO/aCFq6sRgp0+shNphfUqcwHJi0DH
 3zs7KxJtS+1uKRBASoEE7QKPSkc2D6lJ6IXybMF9LHGU4aZuB6JczBwnpWZJ7EHg1O
 gg+A1yYh9daxiGnJOFjBpZhC0l0n5Om15FAGdxEoDiUhzgyiLNnxFBFRJbttHttbMN
 duLDp6XGWO6RXQ3QgR66ZfIwhP5gpt2SItcGGEYZ4XA0smDpSHIKYfufmwryt8Qtgx
 UZgjbM2LQ2PaA==
Date: Wed, 23 Jul 2025 11:40:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] ASoC: hdac_hdmi: Use dev_info on invalid ELD
 version
Message-ID: <b209b185-8caa-41d4-8f8d-95aefec1d785@sirena.org.uk>
References: <20250722195437.1347865-1-detlev.casanova@collabora.com>
 <20250722195437.1347865-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eFKBin1ilgiNfb0m"
Content-Disposition: inline
In-Reply-To: <20250722195437.1347865-3-detlev.casanova@collabora.com>
X-Cookie: List was current at time of printing.
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


--eFKBin1ilgiNfb0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 03:54:36PM -0400, Detlev Casanova wrote:
> When disconnected, the ELD data cannot be read by the display driver, so
> it just sets the data to 0.

Please don't put patches for different subsystems into the same series
if there's no dependencies, it just makes dependencies less obvious and
creates hassle merging things.

> That makes the ELD parsing code read an ELD version of 0, which is
> invalid. In hdac_hdmi, that is logged with dev_err(), but should be
> logged with dev_info() instead as it is done in sound/core/pcm_drm_eld.c
>=20
> This avoids printing multiple messages like:
>=20
>     HDMI: Unknown ELD version 0
>=20
> in the kernel log when userspace tries to open the sound device.

It doesn't, it just lowers the severity of the logs that are printed.
If the goal is to lower the number of messages printed you need to use
a ratelimited print.

--eFKBin1ilgiNfb0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiAvAwACgkQJNaLcl1U
h9DLlAf/UR+hhxSi+4m+Jov1EipVWvw6PObyiKC9GcgVW5a8/3sx58QxgNNL8n3q
VL8fD2dSxmbCICrI92GRYs2EXXQI6MFk2n5HgxDCWK+GzqcgfmkxTEKaXRezAgdD
Z74CEyQKMytwHrZg0hSN4uIy62KUm6gLu7A+GI2rOOJ3Xd8IgaDyVt1WoRfdj8nO
StiMnf3kaa9LgC5Ql9J0cqdhKI0xA6FfdcrU6qO2Ki6/644qZDzgrnVaVMjP4lpp
kT6s8rVgT7gMIlsnUk8U2l4Q8q/fEUibVe2groGTUmiYOZU4MUznrXVPF+fuYi5G
JttLPr13R3i/120Tj1aSwcBpmslvjw==
=8mPT
-----END PGP SIGNATURE-----

--eFKBin1ilgiNfb0m--
