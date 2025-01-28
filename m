Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D4A20830
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FE10E240;
	Tue, 28 Jan 2025 10:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bWKkh4H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75810E240
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=54Hw
 x4F7dv7mERL+XZYNjv6uxbIJeq5a9iquKBZ2Od8=; b=bWKkh4H9PuBatev4vOEM
 J8dYdbmNR5A/gtahbuKF3u4WBy2qpwa0KPzjXPDuQQTNJYJ+e3J3LhXSbcoS+SB5
 iKXXYOGukISQFcjJe/drGSJqbAXLx6ylfpB4IgoUq6T66FAGyjliiddady31rfcY
 Ywg3oncTZ+U5paarmctC9RVk7QIpYlYnd+eAsM0HtebO7lSdBakvTrmHOXSiBV7C
 2js/FCWu2kgFGAEhwLeeQor81iAF1N+V9BEeZzOeccHJrDlCi/KfGo0h28kH1H/B
 7kLHLfYKNIxvoJisgV7ihYMNwvV0CxNRWQurYQ5/IbezBIZsRjR6XYhOl/3rjHT/
 3w==
Received: (qmail 542337 invoked from network); 28 Jan 2025 11:05:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 28 Jan 2025 11:05:48 +0100
X-UD-Smtp-Session: l3s3148p1@sQxFVsEszoAujnvm
Date: Tue, 28 Jan 2025 11:05:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs
 entry
Message-ID: <Z5ir-7cIM6YOlzgE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
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
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vnWtWXTwZeCpN6DR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
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


--vnWtWXTwZeCpN6DR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I gave it a try on Gray Hawk Single.

Oh, we have such a board? Nice! That would help a lot.


--vnWtWXTwZeCpN6DR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeYq/sACgkQFA3kzBSg
Kbb07RAAhQO6k42CFWdfX3lreQAwzfCrGUefYAf4vdJIZs8sYOYrxHlagOIDD4j0
KA/BSvCEpl5DKzP3GAgaLt60sMjW6nxOrv/CpsJ9v5cqWTAaVoPFjO51ARCwc/lE
alxY4AQafbmciyKTS5K/WlBmfAmTec0H+FPVLPoDBawM/SpzApY+nfvZUDCbkLFx
rypAqxmRDRIvG1SE8ioyLRJ1YFGrqtU0A2k7WF0dexD/Df6mOcIsFriyBDeelLbk
jh/y4b4jt5uth0rTYPr3EAQt5bL7jkqipkxbdHigTIh4dO9vwG8Hu0UB5JqWLjSg
rqDHOkd9rZSC6Aclvbv8l1tMUrLg3Ftiihx+t5HIU5WXLHsjb7let2ZMQ6RwBJr2
PokoKy3pDRkQCcQjFB6BfW2bxQBPj1tTob1YF2W4ep1rbz3uJZmGLxriqNQnceAO
+wf9zM/sv772DSdNNmma1AZ+OUiD21MKUlG4qSbjjISZ1wDFbdulwBxNYDGpbTfm
iI1KVeJgw8pWNtCBQtmTSXhfZfJkvKFV9UPO+12ZOZvL0t2fXxs94SScX9+asdDJ
JXXOEYgTAmZzlpPtr+jNL/A7upQTUPqIb3CaxHVjZXpHM/M1/bPHMAW70gLe4TJF
sgvmrDhdTT1ZtUM1V66rF/qSAc4q/cdWGgLcrpGHUt251zN0v7E=
=Rrjd
-----END PGP SIGNATURE-----

--vnWtWXTwZeCpN6DR--
