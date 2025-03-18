Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A979FA6788D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C386810E15A;
	Tue, 18 Mar 2025 15:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OAJPjh+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5610E15A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=EI8C
 AoWPtyTWq68d7WhbQtJER/tz43L9sj9Vhci1h4g=; b=OAJPjh+BMDX4oJNdPKUC
 g1/ux/xj10WBwMEQ1iNo1oKHWFwSj7Hx99CvosqSeE3GZo7MqBAfdQFLWKE6DRY4
 dFmCPPvdDhlGp7lI1R3R5/ojhnUnbOfPsxX9nYO9Je5jINkTnsEBFWoHVflFO7Sj
 tdtUyt4b/KK9ez9rShQ8N07yxbdlPmq5C8nUtRAw6XXgIbNN02tIqPNoFmn8g8eA
 sEcilnTiIu2cdXb/zmUyAQYiX/KuNKGhQwCu3BIHXhW92Dy6wQiSqhzsDyrLZJ4/
 3Gtel8ul6sfdy3WEhqJ1Oxs56FgkHhgbX+J2LtUWTMksKZjKwgxJOLVrz+SF4AWy
 jA==
Received: (qmail 3861648 invoked from network); 18 Mar 2025 16:59:11 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Mar 2025 16:59:11 +0100
X-UD-Smtp-Session: l3s3148p1@kb1S/J8wCqcgAwDPXyTHAJp038nK7dx+
Date: Tue, 18 Mar 2025 16:59:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <Z9mYSDQ5JastkBLy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QzI0E3h2wX4y6YOt"
Content-Disposition: inline
In-Reply-To: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
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


--QzI0E3h2wX4y6YOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 04:52:56PM +0100, Wolfram Sang wrote:
> Read out and check the ID registers, so we can bail out if I2C
> communication does not work or if the device is unknown. Tested on a
> Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> not enabling RuntimePM for the device.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Changes since v2:
> * switched to a new approach suggested by Doug (Thanks!). We add a
>   dedicated read instead of using the first read. This prevents creating
>   the aux devices. As a side-gain, we check now if the chip at the address
>   is really the one we want to support.

Forgot to mention that it depends on my previous patch "[PATCH v2]
drm/bridge: ti-sn65dsi86: make use of debugfs_init callback"


--QzI0E3h2wX4y6YOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfZmEMACgkQFA3kzBSg
KbZMjRAAhiAgDtqYF+9mFQI48CwjmLxNofeRHvo5qQRsxJa3moZU8msl1qpCN4us
OujgsaAIgjNXWUEvw1s9Ov+jI8XOsuylVeCx8+i7e2FMFt65XcIeMhta7APjKE31
L7DCFYw24SWjs3MDh9e7wKtS8tsSY2THATtwBaK4DdyHzzN29fdQI/XzLErB5Jwe
Y/YgKSYtuvj34uHBjJQGZKP8fitbBceu8qkXiO/G/pidR1wJJwQ88zGgAVw1+TZb
0HYZLunzsDY1+8MHbwHe1SKfP9vSJm/V2/4nOK+fEG6DdEhrL6GrT+nO1elMXc67
WeyBLDbmoEvtYf+FzQsGhu8k66hzh4BxGcasE8g9c+RMXUfFcrgdqihsmH1MIR65
ctRtGA8Z6ddT+oDoy2yJgQd/22HqI2EOc5k0+E1lPM9iMVG4ZhgeCWJJOcqfk0o+
8V6AtEm70xzQuocumnS/0c4F/jCKREQbOsxyHTMH10M+dCSiQJ49ZWU39axgUKiU
/bW2tf+QcRHT44iKb3jewr/g3rpMnUKwT6hB59kjXv+3PsKxHj0W3EwopOiG7+gk
Cqq9waNjlCf2iJoilYyFej9hOfaqvx6HiyiYMsWl+2IQCst7phelrNuejfR29mxM
lrd5sKyOfpWfmHanyYu/jxwAJwl0a9tYoO/G8mPkx/Kk+D0Lp74=
=PgR3
-----END PGP SIGNATURE-----

--QzI0E3h2wX4y6YOt--
