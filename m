Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31DA20828
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F510E0B9;
	Tue, 28 Jan 2025 10:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bBHqDG46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA2210E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=bxz/
 0pXNGLp79DTrXAGCWmNrASaqXxxqeOlWeKqp+3k=; b=bBHqDG46xELr7OSouF4I
 SNDrnImMyPvtbU8otubAm6l2/yVD5Ows0qODjCQurg2z/5ALTxfILC/4csz3kDw9
 wINfEFPTA2kvXkECkbsal7WAeD+Xwtx0sb2k4TjMMfOCykO/vJS8ZufmP7wX+uSR
 pKX4Q1Ae8188UI9ygpajo96BoiiC9MfoirTejn+7U5e2v0fz1/VyzR4dsogQowQA
 7NrxhAt9ZUfHTQAWGEAdQ6E3ytI4kC8lPbpMoFETwjjS6CxXRm/s6WwdTbJtbjSe
 T8OqLpjemT/yye10YmuMEPq76eF4UCGPwhaqua1YJFyPElTJdpNBLazO0PGyhqfZ
 bw==
Received: (qmail 541909 invoked from network); 28 Jan 2025 11:04:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 28 Jan 2025 11:04:29 +0100
X-UD-Smtp-Session: l3s3148p1@k5KaUcEsgM8ujnvm
Date: Tue, 28 Jan 2025 11:04:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <Z5irrd7FWLhENnDX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato>
 <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
 <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6EHuVUA1Cx8xfTJd"
Content-Disposition: inline
In-Reply-To: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
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


--6EHuVUA1Cx8xfTJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Doug!

> wanted it in panel-edp, but glad it's useful for other cases. ;-)

:)

> want some type of directory under there. In ti-sn65dsi86's case you
> could presumably keep the existing behavior where it creates a
> directory under there called "1-002c".

The good news is that I learnt now that I can actually test the change
myself on one of the Renesas boards. So, I can play around to find a
good solution. Maybe even with a symlink somewhere. I have to try.

Thanks for the feedback,

   Wolfram


--6EHuVUA1Cx8xfTJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeYq6kACgkQFA3kzBSg
KbaMvRAAhnbQnQVGIRUNbt/NKUlXINlMVqrKnFr59uDA4ZePfDepJCs+GO3AO9iG
zHmc6ozEI1/1ts4ijD8mdNnBe6WeWE+g655TZCdqr2hfY2LvWbSuuiH2mY68G3XT
5CpNMsmAfp4KS4Fegx4jTubMiJJWaljeGNg6lsNy419yEzZGi5R3GZ6RHHbOuA1U
6uSUAtBY5trKtf2POXhErm0QPVHAg6gzNgYkZDFy+ghg+p9sRYvPuRjrY7+Q8zq8
EWomTcJ2NKnEdOsqfaVEWllYTIDd+UTAo6nyae3nVIy4n2LOU5OksdE+wjfm+DKR
1UjnuelcGX2Xpssa+TNFagmn40e2mgaZ2PbEVokdzYMZ4jYM/VMIeEoek+qmivNj
QQkMXoq6phHEDfpdCm+4u20tUi/E52XB8V85mMj4Ol9Fv5PJtTLQCqyWvsP4bXi1
J2qqk9Y2NLwWar32sks9QxQ8pnm9ju9XLYW00/TT5jQ/BDJCEIf7/Rn/D+qXwRSR
ocC84ks+5nHiKF8iuU5zRqkO3KdMZ2g06bE7uKj+Hx/t1GjgvZpqCJe9el677/XI
4n3r9QIyw4S7BRo0LHCm2P0UyZXsGvwzA0xyrss0cR7hsqi+3uKPn2s0c2nN18Ay
OfkaZdlUMCKzvAHKqoIFgSQ9NUkqbkXgiqAyPDp/t6AZ4EYuAAU=
=hM0Y
-----END PGP SIGNATURE-----

--6EHuVUA1Cx8xfTJd--
