Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AD39FA53
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510CE6EC1D;
	Tue,  8 Jun 2021 15:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829DB6EC1C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:23:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0690A1AE3;
 Tue,  8 Jun 2021 11:23:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 08 Jun 2021 11:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=7y+uu7kjB/1PI/97u+3Bl7gH1MSy9rD9XBavvjyKxLY=; b=fAtMdnhz
 IH79WIzcvnXdYUwK56lX0yBX0x1PVBlOI5eaq402NUAbatPBsQNQ12GYr35118nk
 JirqjxKmHSB93e/l/JMYqImlSpXd1okJzd+Zq2CGPElvIUwt9B1K4gqYOtW/mpUs
 N2pHvi5G4MoT/dduYQJxcVlFASkMBdUPYsobzsVfQ9kn2YUezWzMg06kDC8A0a9r
 H2TJcsEs0khPMZjKo/YoMeNWsuIAn0bnYw+o5GAaXLRwj68qjb9pvCecYhKj07aA
 xQQs548fDT3dMKiubaV8pjU/Z8o6ESgz7UsPi+OHDFnDqvE6yOdXXAe1btsEbVIF
 1OUfMEwrCY11pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=7y+uu7kjB/1PI/97u+3Bl7gH1MSy9
 rD9XBavvjyKxLY=; b=HiSKB7SqJr7JN9g6FQgeesiy7qdMJQkDFTmUrqSWeIPV6
 tFneGKnf6whSoeH7C7Wc/FVlDdZQKk3DxV3jVbqOZ3R1PNswV1Mv7vE4qmLCN1pY
 QgGF9heok9m5b+qghBTHRDAgmpdVCy0O8Fn6MXItkGVETTzNeopK5f3njBUbhDuo
 D1xF4pGbAO1+cmDKup2utWIPWWa6J0/+JxumILrJ1ew5tC1wl+QA9TAApimtFX9Z
 vyvxDMBf8VMASKFkIewxUkhXNhLRTmL+raTmntdW0BAm4xv1FruuRplR2lX5D+Bm
 KgFtIEJxgdBVu6HwDwONi8X67leyq0UUwz5W+Ly8g==
X-ME-Sender: <xms:eou_YN6I9-LYANK9Qju6gN6erksi8ZytCyk5pk_Z8LaW3LnmQQD3AQ>
 <xme:eou_YK7W-gC6jaHeFnzCcuy2uTQhw99Kq2FJ-PFH8z8Oo7rgijv1TesSJaek9j59c
 D-kDXXr8sHzM32zHpc>
X-ME-Received: <xmr:eou_YEcUdotV86-P3tmQ-rvCRkjQMovnR0C6TjjYcsQ4MD7Fg2afxSGwQ_nFfRz4fTtomnpiD9tI3DnZ01iwHT7Dx7cdO6CpYAf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgfdvuedtvdevvddvvddtheevvdelgefhgefhleeuvdfhheduhfehffeuhfejffeg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eou_YGLY1f83SCSMoncIj1dUr904TFcz3RPtjUy9A0fkau0fkdTuKA>
 <xmx:eou_YBLyEMEFnykEOArFE01s_eBZi33Iqq7qaZihva4zMJ4Zhp755Q>
 <xmx:eou_YPzZMbNRVw_98DuEbJLSOITBUkfYec1SWIIvpZWg8vm_QClbDw>
 <xmx:fYu_YOAswCdz633QlnOCAuovSDIa5uNZSmrKkpQo6URrSfjpqTEIqJaPeVk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 11:23:38 -0400 (EDT)
Date: Tue, 8 Jun 2021 17:23:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HDMI codec improvements
Message-ID: <20210608152336.3shidfqym2pgmj7p@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fwxzgs5ela337bru"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fwxzgs5ela337bru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's a PR for the changes to hdmi-codec that need to be shared between
drm and ASoC.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/asoc-hdmi-codec-improvements

for you to fetch changes up to aee87e9c8fc0efbe933f0a8371990a0754ac65fd:

  ASoC: hdmi-codec: Add a prepare hook (2021-06-08 17:06:00 +0200)

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

--fwxzgs5ela337bru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL+LeAAKCRDj7w1vZxhR
xbqGAPsFnhFdpchvC16PX4Op2mccZlmHaLb/MDY8uwfEmI5eEwD+I6yA2y5j/xCD
j6KX6j/zPQw8pWbM7NQf1k11KS2I4wo=
=9+IQ
-----END PGP SIGNATURE-----

--fwxzgs5ela337bru--
