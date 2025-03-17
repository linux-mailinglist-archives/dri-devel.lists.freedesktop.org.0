Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F801A656B7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 16:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8B10E188;
	Mon, 17 Mar 2025 15:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hIW1HKqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803D10E188
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=Z7ys
 F6S5KXW8XWkkW5d8Lagsv0FjEmOs1Y7sol16u5A=; b=hIW1HKqDR59ZAH5SKB29
 L6E1UpYNu5UF8tXqmiNZolBTHhJaZ59Zv4/A67+kwgtMqbG3LnlHbaksjuz9eSjl
 XUCuaF4ofJHeRKq+58SCARi+RP8YhlGmulgFGyuCBn31tJ08IDkEGh9cAfn7jS3N
 i/BC3Y0RkKJ4NKzHl9NVaikTOZ/GF3oLPBOAf+PJQT7b1LFsXAM5bxbXHRoaK/a/
 JX3+niUO+rUUrGPgKRNBQA7XaKS5EI64Rv0FGn4l9h8a2LxR1/Gm1Eoj3HccChqt
 WapGn5tPu5IeVjFPfpog+WQtgGp6IXy7vD8BsXtX3D8Z7YfXkMowpFJJQR0+xpRv
 ZQ==
Received: (qmail 3243644 invoked from network); 17 Mar 2025 16:55:39 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 17 Mar 2025 16:55:39 +0100
X-UD-Smtp-Session: l3s3148p1@oZvX0YswaqAujnuL
Date: Mon, 17 Mar 2025 16:55:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <Z9hF-x91DMK8CyOy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Doug Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
 <Z9VBtTzNgDh_QsxX@ninjato>
 <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wXQQzUSsR/l35gkf"
Content-Disposition: inline
In-Reply-To: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
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


--wXQQzUSsR/l35gkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> where leaving the dangling devices isn't really a problem. For
> instance: if somehow you fail to link up to a MIPI source then it
> feels OK that the GPIO / PWM and DP-AUX bus parts of the bridge
> continue to dangle. You can still use them, right?

Ok, convinced. Thanks for the input. Will send another version.


--wXQQzUSsR/l35gkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfYRfcACgkQFA3kzBSg
KbY6OQ/8C6kKQ8ZMv2KNRujKu5AkOWHGUoveNYv7CZEkZgrPFJTYub2zGj10G0ki
3QClhwTlnpc+/yN55kMSQ1hdJSX0/QQyhifZOrqN8urfyFv9lrvYh96sGpWpKeUz
uv05/dbugyjBg5FW8echeSBACLaEnDs/EeL7pk08d4gqwvSdgZkcfCrJaPO2XRKc
W5QTF5sG8cSeMM8twHMrmTSZumL5s2iuGNjYKE+p2RN2itrtCAfZ0hIsEfBdvT6Z
QCaIGyCfFPqkYeqKs+/eMvaPhPGc+hII3D4OhMm6wLGKxB+nYf2Wvh6VZfji4mrC
PKbeiyppIfw3hXr+GvtNsoQbZpXxE8VQW7QmFFMgLkmwpAoeat2vOgzf01BFUh/L
h4oM65Nscgpq/gXPVd7n+AGms938PMk3IVv5wbWfJYusjULM9UrRWdKRsS2N6tJP
nhud3qvIbkBQ3ct757tnjZGclbmGp6F0OOTbyfNaeNzxJmrvnaOrt0aLbEBQKzwS
1Oc32WCuHajc2t/EN2OX3MQ3rX/a0XdtMoyhBliloCrCzDWXfIsbGucoGDAsxRv7
FK3w7MUbrhBfnZ9fENhaGo5acj2NSfv79Laim5QKCQ/L4Tg6b7BZTFuVFQUgS+hf
GS72KI+OQNmemrWB/W4J1ZQlsSO1vwNKJzA2bacMsX1RpOy2qWQ=
=UfvN
-----END PGP SIGNATURE-----

--wXQQzUSsR/l35gkf--
