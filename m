Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496AA0FEB2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 03:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA9910E846;
	Tue, 14 Jan 2025 02:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WSRyNVJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD210E846
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 02:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736821284;
 bh=pdn0FLY1UvVW114ErjAbAQIfPXo4Qt57QW4hdUgSUA8=;
 h=Date:From:To:Cc:Subject:From;
 b=WSRyNVJ35+Xcn9xHxSO1OBjrHrc936rp+1ul9f3FwpM3t9TzzFEIjF4fzBeZemX4S
 zsm4Wxx5lri39Lujmmm2rycnbdgxPjxsCMHNv/UIha0EE8I5WDt2ClXbvFDBRIEEDP
 8WJqBMh3+NJHluVLi9901DgbSqN2YdpiyikJAVTUmpfsHBZ6VL+TOxBuUvshFKo67h
 EVinSE0j77B7JsafsbVU7wcyl5mX7hjX9QhbEc5AxIyKrsUUmiqL5KOVXCMwUyLyCA
 jqy6L2VFYUeqNI4Q4lwrMYFbhO/LGxZr9LeNHdpu3m63qpXx6vh2Mx5Dh/HWP6PVlm
 AKR1PhV2+wYxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXCYH3hJ4z4wnp;
 Tue, 14 Jan 2025 13:21:23 +1100 (AEDT)
Date: Tue, 14 Jan 2025 13:21:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the sound-asoc tree
Message-ID: <20250114132130.4a35f44c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UkuAzdaO2bdG=8mv98/_tz2";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UkuAzdaO2bdG=8mv98/_tz2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the drm tree as different commits
(but the same patches):

  5b0779ae13de ("ASoC: hdmi-codec: move no_capture_mute to struct hdmi_code=
c_pdata")
  a8e792d3f0bb ("ASoC: hdmi-codec: pass data to get_dai_id too")

These are commits

  bb1d67bf82fb ("ASoC: hdmi-codec: move no_capture_mute to struct hdmi_code=
c_pdata")
  6af45d7df109 ("ASoC: hdmi-codec: pass data to get_dai_id too")

in the drm tree.

The latter of these is already causing an unnecessary conflict in
drivers/gpu/drm/bridge/lontium-lt9611.c.

--=20
Cheers,
Stephen Rothwell

--Sig_/UkuAzdaO2bdG=8mv98/_tz2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeFyioACgkQAVBC80lX
0GxOzAgAnA3RhKJX0UD+oAt/ubD5PnVJI93mikk6zL6GLriDMO75jywDLV1ySAHm
bE4A4C+JubRc5KbkYQbwP2RpiKWGOEBI000VijApn7H3q3z0Br6K95ZQZQ+mT652
bPrWmTVzBDNrFqzKkWvQ8sM2VMM/dH34uFfRaziGVx85L+CBXW6B5BrfMQKdaE8u
a4NBYoeNtmkHsIJHWdc5RtMNY/rby1nSK0aElW0WYGi4t8doQhF66KNkVB2dfKml
0Se4Rl59ETaKn5nbKuqVmoHGZVYe7UavCj4HqAtR1K9MKiLL0jw0np7MiLBaqc2h
EFNilif1ejwv2SleIJ9AbPgH7UiMpg==
=TAe1
-----END PGP SIGNATURE-----

--Sig_/UkuAzdaO2bdG=8mv98/_tz2--
