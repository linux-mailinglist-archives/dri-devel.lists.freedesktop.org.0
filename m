Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AE687806
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F155110E302;
	Thu,  2 Feb 2023 08:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2E10E136;
 Thu,  2 Feb 2023 08:57:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EB60A581F79;
 Thu,  2 Feb 2023 03:57:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Feb 2023 03:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1675328246; x=1675335446; bh=0xSIn38+dG7IqykircxQUmTa7Nxdy4W9EG4
 kCe/zWQ0=; b=Y8Fugx1ZYCunJ+l39mWyZTjOlM0lhrukh1vlkVfjkyEO76I0Mep
 8dTdGiUWWqlep+xzmeEKZHIPtTpEicFm3UGdqvCpdA8bs5rQmlNhf+ei/sxyAakY
 Jmj63rtpKFN3dQ0q4GcynNQORiosJPEuqzSU+OVHumETohtm7ZZ+WNEfqwMCwogj
 TQ9rvLiW9VrhYVr/EzkPJgvjz6UpbFwxCim5mz+ExggXaDxcqOqq0DDUQFDpsQ6Y
 xY+i/64ra3J4fvGgcjvQDq8WDcERKrHsNfqo9LEdr4KwVs+QL5TC64pha+RgQauE
 93lnXgeLRfewRW8tN55/CWeJKzY5M+xC3bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675328246; x=
 1675335446; bh=0xSIn38+dG7IqykircxQUmTa7Nxdy4W9EG4kCe/zWQ0=; b=n
 Al3V6FHIyG+xRAXnwB3NwjlAshlhMOSI4aviSEVWRLscSeCdAq2QN4yM0Qh9U+lO
 DA3vm7KugHm5CR+s0w06HI8vIC8Uv/eS3BeocdFnuQKah4fTbYfDbU7H7S4HCpyp
 eMV6z91++qmpeTXQPBiDtSILegXYcAGccSjXJNrLMI91X+qZhmUC2ulsSvGfC3V8
 /cMUX/dIGpsITAJVUh4CP355hMLPqHqs/bqDkV/KA7VIQQCe8bISbk+g9PtrU1ta
 ugbdKVLSVX9tPSZ6dpjdQbJd9GzKBu1XXxX4dnlDp+SjqihSsrEy3RACTrnwn908
 6YDEHI9ftVoEG2UQpQ7fQ==
X-ME-Sender: <xms:9nrbY98AEtMKfQu07AzbV6Ej-MKec0Uzck28Y9bRhi1tO7aUr4xung>
 <xme:9nrbYxvV_IKKR-pKNvZaraH2Q0XHUoOtTTpQ-Kvue6ElcnnfLCyfvIuQ9oHdMdCFK
 FfZ3KPTAW2eydBDNmk>
X-ME-Received: <xmr:9nrbY7BWYcPHkRN8K4oXbWaN-euMGozgCi2MjHhb-DnAqqB3EAMWSw-pMbtOzJNzV287drPZ7IyR6llsMNygchsARTnTHDJxaQIZAELEwYYNGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefjedguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:9nrbYxd1d3OQ8enNCyz1sbq0Pg9Q_dhXrowBgwzSiFnQ_8mqCvpmmg>
 <xmx:9nrbYyNJh5zqgwu1Ai-aKJVlSsWY0eY4TzmnJKkjffOjU9MKZGZQ8Q>
 <xmx:9nrbYzkyengUhxOikW14xU-_zWkrWoI3msmXnbaaJkDPQ6AfvU03dg>
 <xmx:9nrbY5_2ixTnTnE9_v0Rf9_3TBgZs5ujauWeeFPT0XCwVAohh5SYDA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 03:57:25 -0500 (EST)
Date: Thu, 2 Feb 2023 09:57:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230202085724.pz22m7bmei3wyuzp@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u6yvcuk7fm4vbvvr"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u6yvcuk7fm4vbvvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-02-02:
A fix for a non-unique CEC adapter name registration in vc4, a
regression breaking the display in ssd130x, a signaling bit issue in
dma-fence, a couple of fixes in nouveau for Turing and Ampere, and a
disable fix for the boe-tv101wum-nl6 panel.
The following changes since commit d6591da5f3ff284a376d56b5f7a48a34e9cb159d:

  drm/fb-helper: Use a per-driver FB deferred I/O handler (2023-01-24 11:13:08 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-02-02

for you to fetch changes up to a3ee9e0b57f8ecca02d1c16fad4941e09bfe2941:

  drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable (2023-02-01 11:41:15 +0100)

----------------------------------------------------------------
A fix for a non-unique CEC adapter name registration in vc4, a
regression breaking the display in ssd130x, a signaling bit issue in
dma-fence, a couple of fixes in nouveau for Turing and Ampere, and a
disable fix for the boe-tv101wum-nl6 panel.

----------------------------------------------------------------
Ben Skeggs (3):
      drm/nouveau/devinit/tu102-: wait for GFW_BOOT_PROGRESS == COMPLETED
      drm/nouveau/fb/tu102-: fix register used to determine scrub status
      drm/nouveau/acr/gm20b: regression fixes

Danilo Krummrich (1):
      dma-buf: actually set signaling bit for private stub fences

Hans Verkuil (1):
      drm/vc4: hdmi: make CEC adapter name unique

Javier Martinez Canillas (1):
      drm/ssd130x: Init display before the SSD130X_DISPLAY_ON command

Stephen Boyd (1):
      drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable

 drivers/dma-buf/dma-fence.c                        |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |  1 +
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |  3 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 10 ++--
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c        | 14 +++++-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    | 23 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |  8 +---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |  5 --
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |  2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c     | 55 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |  2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 16 +++++--
 drivers/gpu/drm/solomon/ssd130x.c                  | 18 +++----
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  3 +-
 15 files changed, 127 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c

--u6yvcuk7fm4vbvvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9t68wAKCRDj7w1vZxhR
xT6sAQCR/irwZdLuFfX2iCS3LS7pnDdOxVYxFrRk1IvhthJvigEAkvWE5ZVJmYvu
Q5hlPljFjnHpOFVKjyt51P7iCXlB4gM=
=9BaS
-----END PGP SIGNATURE-----

--u6yvcuk7fm4vbvvr--
