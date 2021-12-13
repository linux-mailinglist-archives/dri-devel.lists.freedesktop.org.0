Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B64723BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0646C10E5F4;
	Mon, 13 Dec 2021 09:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992A310E5F4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:25:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 2C8942B00187;
 Mon, 13 Dec 2021 04:25:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Dec 2021 04:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=vtqTvPdpGGHBDDENeO/HqO6ZP5
 7aMLW8mJz0rtT3JSI=; b=YU3soc3lJ2bRLLp8h41vY/9WsIVAgzOA4rJjUn7r90
 TQCbzgw3JLNxTGK+XjcymzSIrIOktxsiKFJIKYCThER/jb/0i5iT2ojL12iIeQHw
 u3wxvwtc7dM/LPzamk944vDVpn5no/K7fjzqnmvo3N+Xj/wPrAGL8xbAiIZTTU3Y
 Zshku5sL9uHAbATd1iwKV76J8j/hU6Q+JhrpE7AhVIVA/7xqtgcay4t1YUo3UEd/
 eGdgzQDKfGpz2mOOYzVrUPNbDsDhrlu6kRrtjWH4AI0hJ+hdGsILA9+Rg1ngO501
 xDnoC1VWo/ITA4Wk6SBgEyYP0OzbvKIKi1s140PY/DfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vtqTvP
 dpGGHBDDENeO/HqO6ZP57aMLW8mJz0rtT3JSI=; b=MfHDnDSvCGzcUADdSBTFVr
 TyQH3CHH/4euP0ww6GM2OHo/fMAdT4EkbKv+CUFUessCFEI4iSNWxOKeXUxzbuNd
 Bpn8jEOr1hn4X4MaJbr9My/6j0fjHAHFHGGN0k9/x7C2wlmihDgDSxGBizqed+SA
 kOMcMA3B6VZN4QAscGBAb+16yj5w6J0bsgfQDjfy8WpOc1h8KEgL49aMpf00DF7w
 kYm+hv7HvxTYwUa/3TiJr0Cf7MuUAR7jD2+8MjDTHYC9ETmfs/zctmBkgOIqH8Cv
 i8jS6CbNKVy08ZEsTcLrEMflzot/h5vXSd/SNnaj9HgE2WV/BNpDo/78c8x42IDA
 ==
X-ME-Sender: <xms:chG3YetGyGgOVHvGk4M-e_kVn_C2iRFYBX9MZ91k-u1W7z6QW3mvYA>
 <xme:chG3YTdwl_8D--Q9hMTOKIwZgS0i9cX2AnU4kCAeCx8HnO5LVTT6xprjzSDPl0rNy
 ggpo3ECcX1K43TVGHw>
X-ME-Received: <xmr:chG3YZyJYP6S6wKfQ2PdPnL_bR5O25WiRuUsvOGpdokotpT0JoOwsnp1kI6oVBWvRbjktuFGKjMTS_qVVqcZB36zhPI2D5XkQj9IeAMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:chG3YZMrcHORR5xEJkyNxLJaAtTNJFU1Jyd9JURDx8TrUzHPoOrJvg>
 <xmx:chG3Ye9jsM9n2me37LBVO722TPmv96gTwRvpYxw3ltrqp6LWdQBkZw>
 <xmx:chG3YRXjHcsRt6UFBkot7Dm5MrZ7x4wMxJiUQRRVwdwCImPxpDhvNA>
 <xmx:chG3YR3kQe8YklMGpWb-OYVnFhW8PTE5LVfuyLvZkbl3OYaITUV6c79QAiM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 04:25:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: [PATCH v3 0/3] drm/vc4: Use the firmware to stop the display pipeline
Date: Mon, 13 Dec 2021 10:25:00 +0100
Message-Id: <20211213092503.57379-1-maxime@cerno.tech>
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
---=0D
=0D
Changes from v2:=0D
  - Switch back to rpi_firmware_get / rpi_firmware_put=0D
  - Moved the rpi_firmware pointer to a local variable=0D
=0D
Changes from v1:=0D
  - Use of_find_compatible_node instead of a phandle=0D
  - Use devm_rpi_firmware_get=0D
=0D
Maxime Ripard (3):=0D
  firmware: raspberrypi: Add RPI_FIRMWARE_NOTIFY_DISPLAY_DONE=0D
  drm/vc4: Remove conflicting framebuffers before callind bind_all=0D
  drm/vc4: Notify the firmware when DRM is in charge=0D
=0D
 drivers/gpu/drm/vc4/vc4_drv.c              | 30 +++++++++++++++++++---=0D
 include/soc/bcm2835/raspberrypi-firmware.h |  1 +=0D
 2 files changed, 27 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
