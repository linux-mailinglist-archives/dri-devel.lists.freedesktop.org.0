Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AB3A2B7A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 14:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041566E5D2;
	Thu, 10 Jun 2021 12:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39F66E5D2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:25:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0A5342396;
 Thu, 10 Jun 2021 08:25:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Jun 2021 08:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=uHio+4NIJ30iZUQOLrOe+MHQN4Sn7Af3MGSexW5w2ps=; b=hufp3yt3
 de8jPWnUZ25P43F3IykGVCi9XgBRZS2x61/71w0pFKMTJcMO9ON3msRCEh0LlLlk
 xzXKCq7kSJFW4u9exfsmgaKua4Unr+zP39zxv+5aN3DN/hpGBwYvK7xJubVwaO1D
 qCROwhzBqOP4vnH9WzkDdiSPuBLR9NuIdiS8REy4SmqzFHWcgqfo7p+vhIdXHnbB
 7OvFLaTL+jPoLoZTO0RuC4IpcgYXQECwX5hkAOHLmFmRsXklHzOTtcG7ctxD8aYW
 4+AB2aLYCS4X/6mvoIoBBnzEmXtpHIbg9vpukIloTntKAtBW7fbf1TlXqcwRU9CT
 Aqu2/TPwgbwaMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=uHio+4NIJ30iZUQOLrOe+MHQN4Sn7
 Af3MGSexW5w2ps=; b=EyB9o7DsGY9CuOi1kBEWYqPdraY21EYolZfAkA8eMyGc4
 pnxEdC4PN1GJY1Pp2F9xxYvYtmt0XiHXLnEt+yRDAP8mbMMjZP/M4pQx+x9O3eQL
 YW1NnJ/qFvtn+cbSGjCk82Obh7zQXhQQ17aq6V+W2SXKp4MKlExKpsvyDpOsfdj6
 tDRky6m55vbq3Z3rDhCLrTnY70JlBGgYt7EVQh9WREZVp6/00iGm/IUFqIPqRgiZ
 OwtP8p+qaNclriRVfDo9DjuXWfA4ysZ1m1rbXQ6dZ275UgvOEAEhtqVJroZG4NyI
 anyGh7/UtOXXUj9LCCQOY92OMESfPZ4xxpqvBZhUw==
X-ME-Sender: <xms:0QTCYHrGmzKu1eaFc4iYinPp7RG4Wdq9s1MPkR7RgGu9_xFeWSoaow>
 <xme:0QTCYBo6E40GdbMHzyX_rnPeRsErqukbrrs7crs7AFsA5njwW_zOP12ZigetZ8rEe
 IqXOiYjyg1T16lfo-A>
X-ME-Received: <xmr:0QTCYENxu2qhnxUvHdq2qXJ03nC4fQj8Dthlsf2Lm56OlW9BQCl1Z1bL1l4QNkAPG-wid1xHHKE1oqdgLQMVuZiAPYKLnoef_X5p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgfdvuedtvdevvddvvddtheevvdelgefhgefhleeuvdfhheduhfehffeuhfejffeg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0QTCYK7XOKLlL5JE6wujqWuwBrCaZc4RSqt2AOhRuND-C3vPjpOJlQ>
 <xmx:0QTCYG7tpRgVTc1woTzO_GHiTUWP2BBjUBl_cnxxlyhu8nqeSQTr-g>
 <xmx:0QTCYCiIRVg0S9Rdv2tM8UUJUriwahw_c13uAetSBJZ28Si37uj61w>
 <xmx:0gTCYDy3OvQaZaL83E1A_JOFP4CBtIF_A8Llyit8jQPQGt41O7vL-3mIhEo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 08:25:52 -0400 (EDT)
Date: Thu, 10 Jun 2021 14:25:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [GIT PULL] HDMI codec improvements, v2
Message-ID: <20210610122550.jnriewchqspdcrwk@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7tlmdj33bp5wxhna"
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7tlmdj33bp5wxhna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's a PR for the changes to hdmi-codec that need to be shared between
drm-misc-next and ASoC.

This is the second iteration, fixing a bisection issue with compilation

Thanks!
Maxime


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/asoc-hdmi-codec-improvements-v2

for you to fetch changes up to 2fef64eec23a0840c97977b16dd8919afaffa876:

  ASoC: hdmi-codec: Add a prepare hook (2021-06-10 11:48:56 +0200)

----------------------------------------------------------------
Improvements to the hdmi-codec driver and ALSA infrastructure around it
to support the HDMI Channel Mapping and IEC958 controls

----------------------------------------------------------------
Maxime Ripard (5):
      ALSA: doc: Clarify IEC958 controls iface
      ALSA: iec958: Split status creation and fill
      ASoC: hdmi-codec: Rework to support more controls
      ASoC: hdmi-codec: Add iec958 controls
      ASoC: hdmi-codec: Add a prepare hook

 .../sound/kernel-api/writing-an-alsa-driver.rst    |  13 +-
 include/sound/hdmi-codec.h                         |  12 +-
 include/sound/pcm_iec958.h                         |   8 +
 sound/core/pcm_iec958.c                            | 176 +++++++++++++----
 sound/soc/codecs/hdmi-codec.c                      | 219 +++++++++++++++++----
 5 files changed, 337 insertions(+), 91 deletions(-)

--7tlmdj33bp5wxhna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMIEzgAKCRDj7w1vZxhR
xWTFAP9Htr7a2qyESSYy+oZKtBB+ulMs7bWhtFqZEAHtQecZpgD/R7HTX4nAch5g
lwYonMvzPyUzYI2ah5Wvcqkp6B51fgg=
=6y7C
-----END PGP SIGNATURE-----

--7tlmdj33bp5wxhna--
