Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AEA45492E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A056E091;
	Wed, 17 Nov 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6AF6E188
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 84A8758099A;
 Wed, 17 Nov 2021 09:50:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 17 Nov 2021 09:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=N8Os3CMXs4JeHb6BC6GVswjkk2
 zShXd0QpBit+CX7W8=; b=Jj0nTVl/ThKcmFPMNbQgp1ei52exmpLqHyeq0Vlb5f
 J7BPTGiI0E1I5hpn7jmYStFmgK12wkeU5nbpWvKibt/x+1oLoNS59dWFAWMFAej9
 b6mt+twUGmqIOY42GPrrEnUP4/gnUtkeqDe5lE5rU+8N2DliAvQYUZmgjnQJ6r7V
 eO0drrRtlWMrwCt9WYvJxmCfYzScdgEcnTQKNd64NCyyGOarA8arS0BeFu6A42S2
 /8p76NyQCxDyR8+gUM5kXNIyofBSRME6iHdk9XR4N0W65u7XcP0KbR3mIJZrgc4V
 Ttchs4Gw4HCbau5w9dy8fM6CzDBeY30nAzAWJ7EuLDOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N8Os3C
 MXs4JeHb6BC6GVswjkk2zShXd0QpBit+CX7W8=; b=PN3sCUz3WSJ18kU4cx/vd2
 WIrduIeDKg++umRkJS7reAOfgqmASbm5Ij5i+q7wye/clT8TWmJ8XU0JaVamEWip
 jDSvNfZdQrFIge+8v2pCwc0v8B3q6TJHUTtLOO0UBfqOTxqWvwC26HLTVrzgH6Pl
 cDP03RdRv+8TRk0ru7GgqaXW/iq7K1inKH4Cw1TMRovV3fqmEAdg/hDslVNfyi4m
 3CLkpa4r+v7yICLo6BsGhvJz+hTVibcLuH7DsJ6zqUKbbvPGXlXSmLoxvIa5Yz2k
 LJeFWLjOS0RuEVWKRWVCIcbHzqodZJYTRT9IUp5KTVKx0SgnFo4A6SVWbaYsiGxA
 ==
X-ME-Sender: <xms:whaVYZyjr2T6cWwzNqUYF1Ak2UurXsLVNV7eSbSqc0cZ9-dcrGeJog>
 <xme:whaVYZTtjA9UAy5z2QFq6QtB2bTZhLbKtyG84VLSJDH6fNwXW2-G1u__Ipm9oyEZH
 XmQkBsQrbb3J5D-RGE>
X-ME-Received: <xmr:whaVYTV4RJATCqsxEuq1LYzU1qQZONcxZ9I3LpPtALjUppEL51eppn87ExcxpfVgCKxQ4k_uAwAG9ArbCRq1OP32s6MA0pLcD4gfo3spelk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:whaVYbg45vyukgpdQZAXZmYJ1vgSRK5CMjvLBsgPAaS2PFVc0r3iwA>
 <xmx:whaVYbA635pn4-aJ_SBDHz86EP8ErequZBvMxDDyIyeBkOIkQP4grw>
 <xmx:whaVYUK57LoaZU6iLR8NdFdMLJMVCHnp5P-ahpv7X-bgiqXJ2Ma9yA>
 <xmx:whaVYT6sxb9e-_HSViOpftv3GriqCDaAsrsPnlMUWDGu463gURvgdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:50:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/5] drm/vc4: Use the firmware to stop the display pipeline
Date: Wed, 17 Nov 2021 15:50:35 +0100
Message-Id: <20211117145040.334827-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
The VC4 driver has had limited support to disable the HDMI controllers and=
=0D
pixelvalves at boot if the firmware has enabled them.=0D
=0D
However, this proved to be limited, and a bit unreliable so a new firmware=
=0D
command has been introduced some time ago to make it free all its resources=
 and=0D
disable any display output it might have enabled.=0D
=0D
This series takes advantage of that command to call it once the transition =
from=0D
simplefb to the KMS driver has been done.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (5):=0D
  dt-bindings: display: vc4: Add optional phandle to firmware=0D
  firmware: raspberrypi: Add RPI_FIRMWARE_NOTIFY_DISPLAY_DONE=0D
  drm/vc4: Remove conflicting framebuffers before callind bind_all=0D
  drm/vc4: Notify the firmware when DRM is in charge=0D
  ARM: dts: rpi: Add the firmware node to vc4=0D
=0D
 .../bindings/display/brcm,bcm2835-vc4.yaml    |  5 ++++=0D
 arch/arm/boot/dts/bcm2835-rpi.dtsi            |  4 +++=0D
 drivers/gpu/drm/vc4/vc4_drv.c                 | 27 ++++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_drv.h                 |  2 ++=0D
 include/soc/bcm2835/raspberrypi-firmware.h    |  1 +=0D
 5 files changed, 35 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
