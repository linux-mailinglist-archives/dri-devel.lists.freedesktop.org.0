Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562890016E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2394710E0A7;
	Fri,  7 Jun 2024 11:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="gj/JW0yi";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fiN7TpU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4410E0A7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:02:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 50A311C000F0;
 Fri,  7 Jun 2024 07:02:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 Jun 2024 07:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1717758174; x=1717844574; bh=/orHf0iH33
 enVQofI8cCRp2yvYBlgN4kUrH/7V8whnw=; b=gj/JW0yiFfEov7yimCujRm8w+Z
 uJYc0IWVr9G9Em3MLiqZk1MDlp495Wee2LSpel51npGryzwt7Z1fh4n1jh2FAArM
 1E3BPd+BCv2XeWYyK7bJcH8pNnoaIoasFTVNvvTvIdg/MkdWIwF3dn6Csy3/x3+l
 IjscfPTJD6Nb+Nyzj1tagmhiA6f7K78h36RW61+Kpdr8Plp48nKQsD6cSyfM98Hf
 FXZnaY//H2udCvVKwgk7Qm7FcOwaEB2cGSR/5r0bth42Btnwp+2EzaTa2z/SWUlp
 PTtYbwGJx0jUAz7A3RP2YPV2Hs1OI5Gn1asyS/ktxNti1LboAxLDHNzsYNWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1717758174; x=1717844574; bh=/orHf0iH33enVQofI8cCRp2yvYBl
 gN4kUrH/7V8whnw=; b=fiN7TpU4g+GtOm99ZWZZeq07PJi4eL80G0lsdMxSNpa8
 6+b85FYbihuCFbJCNE9oJPzkvCW3XjVMq+i/ukSXPtKf08b3M4vK4RKe7F4JKD/F
 Nrz4xXz7SOPXhgPCtGrMC1sH9y893fSxgehGP4TX7emxGvg8tgoCdZnD7xKB4ze0
 dwdUUfdWAEZ83bUcvdmzNHa7SGkML+emKGF+awX+loywRx+h3KkTGwNpnofbogds
 Z0qzuH8lc50w6pnNJfgGQ82ftZ/S2J4XvaJDsdJphdE2SEdfOuKHNFyKndYNkmpk
 y0TF6mvA58mMti5TUGGB+0hH0Rfhoo2fH/q4uq9XbA==
X-ME-Sender: <xms:3ehiZh8vXcPEZSSfB0PtglUliHeJEybKWMGcgfardR6hNIyhP_cRhw>
 <xme:3ehiZlsGjYHonZlA415BDXJgod40u9dfcbyBtGfCG_EY9BJWjXaKawbERa1uAjI49
 HEkRAqhdRNqiRvENg>
X-ME-Received: <xmr:3ehiZvDOBZrKzRzTbVsXBs9Rm7T3-Nb3jFCZDgoZ0kdp7nk_EWWJhuG9LYaDPc305TNUrx5RF751ctwPgFwf40p9E6agLE-KtXOaYGuw1EQBTP_N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
 rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
 gvrhhnpeeiteekudfgvedukeelueekueekleffhffgueefhfeuueeikeeuheegffeivdek
 ueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgv
 shhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:3ehiZlcoiPadFWLYgZh3Hv5oUs6hZPmQH06uVRaQ-_q33Gobba5BGw>
 <xmx:3ehiZmMbryqMMLUN4gf1M9l8LdyO9i9FsBrtwteD9gYFl4_90IpILA>
 <xmx:3ehiZnk3VBn2-10izcFj9qMAtxGGoPkJdRHGsa0NsEBBm5Mn7Iwcww>
 <xmx:3ehiZgvm2_avcDDsG4DCABfmc2Phz6OAUyXJPsKPqR7Ur5UBV2WqRQ>
 <xmx:3uhiZt9ES1tTKMz4xJ3Q0ccGKzmH8JGz36Nvku7nkj563MiOB70FaeZv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:02:47 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 0/8] drm: sunxi: support Allwinner Display Engine 3 IP
 block for H616/H700
Date: Fri,  7 Jun 2024 22:59:56 +1200
Message-ID: <20240607110227.49848-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

The Anbernic RG35XX (-2024, -Plus -H, -SP) variants are handheld gaming devices based on the H700 SoC. They all have a 3.5" RGB LCD display (WL-355608-A8) with an NV3052 (or clone) RAM-less driver IC, with a patch currently in drm-misc-next [1], as well as a DesignWare HDMI 2.0 output. 

A linked series of patches is intended to add support for the RG35XX LCD display, but will do so in several steps, touching various subsystems. This patch set adds DE33 support:

1. Refactor the existing DE2/DE3 code to support mulitple colour formats.
2. Add YUV420 colour format support in the DE3 driver.
3. Add Arm Frame Buffer Compression (AFBC) support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned.
4. Extend the DE2/3 driver for the DE33.

A subsequent patch set will enable H616 and RG35XX support:

5. Add DT bindings and clock support for the additional LCD timing controller.
6. Add H616 DT changes to enable a required SRAM allocation, display engine, timing controllers (TCONs) and RGB and LVDS pins to the H616 DTSI.
7. Add the required DT nodes for the DE, TCON and LCD panel to the RG35XX device tree.

Further patchsets to enable HDMI support for this device (and the other H616 and H618 boards like the Orange Pi Zero 3) is planned, as is support for the IOMMU and video engine, and u-boot support for the panel and display pipeline.

This DE and forthcoming LCD and HDMI patches are a refactoring of work by Jernej Skrabec, currently out-of-tree [2]. 

Regards,

Ryan

[1] https://lore.kernel.org/dri-devel/171740437725.4156184.17662886246928360602.b4-ty@linaro.org/
[2] https://github.com/jernejsk/linux-1/tree/okt507c

Jernej Skrabec (4):
  drm: sun4i: de2/de3: Change CSC argument
  drm/sun4i: de2/de3: Merge CSC functions into one
  drm/sun4i: de2/de3: call csc setup also for UI layer
  drm/sun4i: de2: Initialize layer fields earlier

Ryan Walklin (4):
  dt-bindings: bus: allwinner: add H616 DE33 bindings
  drm/sun4i: de3: Add support for YUV420 output
  drm/sun4i: de3: Implement AFBC support
  drm: sun4i: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   1 +
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +-
 drivers/clk/sunxi-ng/sun8i-de33.c             | 185 ++++++++++
 drivers/clk/sunxi-ng/sun8i-de33.h             |  19 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  30 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   1 +
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 253 ++++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  33 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  49 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 141 +++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   3 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
 24 files changed, 1501 insertions(+), 209 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/sun8i-de33.c
 create mode 100644 drivers/clk/sunxi-ng/sun8i-de33.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.45.2

