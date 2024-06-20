Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A199A910292
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D064610E023;
	Thu, 20 Jun 2024 11:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Q78gDxjh";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="v4pRQbql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29110E023
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:32:10 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 33B5E1140247;
 Thu, 20 Jun 2024 07:32:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 20 Jun 2024 07:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1718883129; x=1718969529; bh=xftjvbVHEL
 bS1mvI3KHwTqZbDPrekInEZ6exVgGS7EM=; b=Q78gDxjhvqgoNzFtbHx0aRKNyr
 ja7fO3GnF7sn5ijjEjmKL2wXLmL9JLVEpMmnGebXzV/LWsGPPrTxZlyNAX3Ee06D
 D3hmIhq+Ac/uxflOU2Swz1GtK3hYysWhrd2DOWsGvVoR9iJWrthjBzY6RFj9VTlo
 gUeyJHpSwHzx4v3cg42PcBaG7I//C6ct+0xOS+L3AtzjvPJGzWnLPc05YvGdjZCb
 Qb6mB2cL4KtpCGNk23vpigSPP6VCj19XdSTuAx5fyOCsItX06qOOBAIWWXxPuhZY
 hbmYnCiRDqNGpxWZlCe5iGO/Lx2zO32gXUt6VjYsGy6/eWme2Ju6A5LTALtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1718883129; x=1718969529; bh=xftjvbVHELbS1mvI3KHwTqZbDPre
 kInEZ6exVgGS7EM=; b=v4pRQbqlQHkDBOo8iTivQs/UrI6ZHT81lVCNmczZgUN6
 dbYykVsBGCbkDZqSrCj2kx+EdifBFILZgg1djtVxY/FTKZvz1/AX/3/AKz78hjSx
 opNtkIw2r11C2JaJMl/ouMZxktz3JuVZ38bQ0luxQK/aLiKyHM3YtPQ1wYHxueC9
 0/SUogJ7HNgUjjnpyX9/M3DKHFjmnS3Bo6ucgBunVkfGYgER3QyLNwC66StWGuVx
 a6WLGz79eLU/kEYxWDAk0LDsxcd+MGyiAEfOYPV+nlb2MSNtVy00Y1980FhoeOAx
 Opk5t3NS5pnfz+Wf7UG86XJewBdzQrJ6nhIbRyr0Pg==
X-ME-Sender: <xms:OBN0ZkMcIHcjUY7qLwgzXuicCfDl5fMKteZNHiuRkgbyDNoYpg5HXw>
 <xme:OBN0Zq9WygHmSJBrozy-lOlCqrb0OMMsoz1y4rAauD1vRtt5u9muG10DXJA_lwkjX
 Y0Hz_ho7fvE8DsQBg>
X-ME-Received: <xmr:OBN0ZrR6vC8XNmk3NY3pln48Af1jUNLALbSnaPl0nNI43pHz2xSjU0V8fEdp_mlSbVUFurCEApkwqqVGcXCwAYpYOsPCEvfs-fF6zYTjx3JxW9j6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptfihrghnucgh
 rghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrghtth
 gvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudevkefggfeftdehgeethffh
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhi
 grnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:OBN0ZstiUSQihTkZT6MWbnjw91ejni_zcuBhIHBTgG8nsyPB66U5kA>
 <xmx:OBN0Zsc20e4sMqVUI7rZppyb4EVsnhG-25iQPh-W75oepUnq67-oUQ>
 <xmx:OBN0Zg25pTgtVioEb0x2sngWUzXycGh4GgQeBYLHXMIxmkF5XJBC5w>
 <xmx:OBN0Zg8Ka1OVpsvZnWXJ1Na3zYpwQvyZAtojAaAY9Ivyq0zb9q7WDw>
 <xmx:ORN0ZgOUXx0h3xbRkRfSyKgmY2wyjVaQhIixgh40_rY-9EzAxXKxC5Ci>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:02 -0400 (EDT)
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
Subject: [PATCH 00/23] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Thu, 20 Jun 2024 23:29:38 +1200
Message-ID: <20240620113150.83466-1-ryan@testtoast.com>
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

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-16).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 17).
6. Add DT bindings for the DE33 engine. (patch 18).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 19-23).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

Jernej Skrabec (21):
  drm: sun4i: de2/de3: Change CSC argument
  drm: sun4i: de2/de3: Merge CSC functions into one
  drm: sun4i: de2/de3: call csc setup also for UI layer
  drm: sun4i: de2: Initialize layer fields earlier
  drm: sun4i: de3: Add YUV formatter module
  drm: sun4i: de3: add format enumeration function to engine
  drm: sun4i: de3: add formatter flag to mixer config
  drm: sun4i: de3: add YUV support to the DE3 mixer
  drm: sun4i: de3: pass engine reference to ccsc setup function
  drm: sun4i: de3: add YUV support to the color space correction module
  drm: sun4i: de3: add YUV support to the TCON
  drm: sun4i: support YUV formats in VI scaler
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: vi_scaler refactor vi_scaler enablement
  drm: sun4i: de2/de3: make blender register references generic
  drm: sun4i: de3: Implement AFBC support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support

Ryan Walklin (2):
  dt-bindings: allwinner: add H616 DE33 bus, clock and display bindings
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 228 +++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  49 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 141 +++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
 20 files changed, 1283 insertions(+), 212 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.45.2

