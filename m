Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE6894C09
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 09:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD7010EE91;
	Tue,  2 Apr 2024 07:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KPHzmzqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4126510EE91
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 07:00:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A807CE1A76;
 Tue,  2 Apr 2024 07:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D45C433F1;
 Tue,  2 Apr 2024 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712041254;
 bh=D2ua/iBnM3IQd4IF7W2c1ROnNcouwmN8SkztWBENdRI=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=KPHzmzqKJ0LB4hWTWRct4x+aMWkYvrMnO5LYIy9LEH6Evx1Ue2Na8KSoxymNvrf3m
 kdP0j1kCMLcHPLsmh9nafN5y/Iv8PnDw5rVka4taJMfA4sN7zTWlSw1TSm+6pNMwak
 Urc4K8BMrrKXGlk6h5WZ0RB3hBLWbpHWmmWDbCPUWVATpLsU1uevmvnj4UEWSu8L0q
 KDKCm8SwRIzIVI95sWAt4/0JBfocwvp3tBnGgQ+qTLKd9WvqD1YgOp+ysH8Tf/l16y
 era3DN04nBo/blnjf2xXNJ8SPGuUqkKEZiKaIf/Cm8lLHINmaqvowR4sgLNcJQ0r+F
 4GjpwV0jkY2DA==
Content-Type: multipart/signed;
 boundary=616bc833c83898b99189c6e32c42c091825e75c4e7954f08cf6a558dbb06;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 02 Apr 2024 09:00:50 +0200
Message-Id: <D09FZ0P0ARBE.1YPEPPM160VJK@kernel.org>
Subject: Re: [PATCH v5 00/10] Improvments for tc358775 with support for
 tc358765
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tony Lindgren" <tony@atomide.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simha BN" <simhavcs@gmail.com>, "Sam Ravnborg" <sam@ravnborg.org>
X-Mailer: aerc 0.16.0
References: <20240225062008.33191-1-tony@atomide.com>
In-Reply-To: <20240225062008.33191-1-tony@atomide.com>
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

--616bc833c83898b99189c6e32c42c091825e75c4e7954f08cf6a558dbb06
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi DRM maintainers,

On Sun Feb 25, 2024 at 7:19 AM CET, Tony Lindgren wrote:
> Here are v5 patches to improve tc358775 driver and add support for
> tc358765.

Any news on this series? Is there anything open or can it be merged?

FWIW, I have another tc358775 improvement series based on this.

-michael

--616bc833c83898b99189c6e32c42c091825e75c4e7954f08cf6a558dbb06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZgutIhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ihkwF9GYXSK6u/OH4qJlmjvaXzwD5DudtfgP3k
BX8aOrgBh376hSaK7NOh8fMQ3UZk8bE/AX0WeSBJ4yN3csM68ADk5rQQ3PApaVeu
orCzP9+elqCgYWiXmcXnXH/s01bWgg8GjEw=
=jOrN
-----END PGP SIGNATURE-----

--616bc833c83898b99189c6e32c42c091825e75c4e7954f08cf6a558dbb06--
